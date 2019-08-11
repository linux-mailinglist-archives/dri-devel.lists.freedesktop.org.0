Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E818924C
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 17:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DC789E1B;
	Sun, 11 Aug 2019 15:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id CFE9C89E7B
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 15:26:13 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CBF8772167; Sun, 11 Aug 2019 15:26:13 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sun, 11 Aug 2019 15:26:13 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: tom@r.je
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-2Z6jPLdWIY@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110674-502@http.bugs.freedesktop.org/>
References: <bug-110674-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0741442028=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0741442028==
Content-Type: multipart/alternative; boundary="15655371732.Df5cd.31853"
Content-Transfer-Encoding: 7bit


--15655371732.Df5cd.31853
Date: Sun, 11 Aug 2019 15:26:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #70 from Tom B <tom@r.je> ---
> Based on all the data you (Tom B) and others have provided as well as my =
own tests, my current suspicion is that there is a bug in the display mode/=
type detection and enumeration, leading to the driver losing state consiste=
ncy and eventually contact entirely with the hardware.

I looked through the commits and the code trying to find anything that dealt
with multiple displays as that seems to be the trigger but couldn't find
anything that looked promising.

It's probably worth noting what I tried/found even though I was unsuccessfu=
l as
it may help someone. I'm fairly sure that the problem must be this file:
https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/amd/powerplay=
/vega20_ppt.c
There is a variable called NumOfDisplays and related code.  Maybe someone w=
ho
understands driver development can point me in the right direction:

Line 2049 seems promising.

smu_send_smc_msg_with_param(smu, SMU_MSG_NumOfDisplays, 0);
        ret =3D vega20_set_uclk_to_highest_dpm_level(smu,
                                                   &dpm_table->mem_table);



if (ret)
                pr_err("Failed to set uclk to highest dpm level");




Although that error message is not displayed in dmesg, this function deals =
with
multiple displays and the power levels. Unfortunatelely I cannot find
documenation for the driver code. What does smu_send_smc_msg_with_param do?
Because here the last argument is 0. In the next function,
vega20_display_config_changed the final argument is the number of displays:

smu_send_smc_msg_with_param(smu,
                                            SMU_MSG_NumOfDisplays,
                                            smu->display_config->num_displa=
y);



The next point of interest is line 2091. I don't think it's the cause of the
bug but:

disable_mclk_switching =3D ((1 < smu->display_config->num_display) &&
                                  !smu->display_config->multi_monitor_in_sy=
nc)
|| vblank_too_short;


 disable_mclk_switching is set if the number of displays is more than 1 and
"multi_monitor_in_sync" (whatever that is, possibly mirrored displays?)  or
"vblank_too_short". I don't believe this is a problem because the code has
existed since January, presumably for the February release, but perhaps the
contents of the different variables has chagned so this code runs different=
ly.

I only mention this because it's the only point in the code I found where it
does something different if more than one display is connected.=20

My questions for the driver devs:

1. Why is smu_send_smc_msg_with_param called with zero in the function
vega20_pre_display_config_changed but the number of displays in the next
function?
2. Is num_displays an index (so 0 is actually the first display and we're
assuming 1 display in index 0) or is it actually 0, no displays?
3. Is there any way to see which code appears in which kernel version? The =
tags
are definitely incorrect, the first commit for that file:
https://github.com/torvalds/linux/commit/74e07f9d3b77034cd1546617afce1d014a=
68d1ca#diff-2575675126169f3c0c971db736852af9
says 5.2 but was done in December last year so I can't imagine this file is=
n't
used.



However, as a customer this is very frustrating. I bought the VII instead o=
f an
nvidia card because AMD were supporting open source drivers.

As it stands:

- The AMDGPU driver worked for 4 months after the VII's release and now we'=
ve
had nearly the same amount of time where it hasn't worked with the latest
kernel.
- The AMDGPU-Pro driver only supports Ubuntu, I've never managed to get it =
to
run successfully on Arch and the latest version only supports The RX5700 ca=
rds
anyway.

I emailed AMD technical support about this bug over a month ago and never g=
ot a
reply.

The VII appears to be completely unsupported other than the initial driver
release when the card came out. I'll be going back to nvidia next time and
although I had intended to keep the VII for several years it looks like that
won't be possible as I can't run an old kernel forever.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15655371732.Df5cd.31853
Date: Sun, 11 Aug 2019 15:26:13 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c70">Comme=
nt # 70</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre><span class=3D"quote">&gt; Based on all the data you (Tom B) a=
nd others have provided as well as my own tests, my current suspicion is th=
at there is a bug in the display mode/type detection and enumeration, leadi=
ng to the driver losing state consistency and eventually contact entirely w=
ith the hardware.</span >

I looked through the commits and the code trying to find anything that dealt
with multiple displays as that seems to be the trigger but couldn't find
anything that looked promising.

It's probably worth noting what I tried/found even though I was unsuccessfu=
l as
it may help someone. I'm fairly sure that the problem must be this file:
<a href=3D"https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/am=
d/powerplay/vega20_ppt.c">https://github.com/torvalds/linux/blob/master/dri=
vers/gpu/drm/amd/powerplay/vega20_ppt.c</a>
There is a variable called NumOfDisplays and related code.  Maybe someone w=
ho
understands driver development can point me in the right direction:

Line 2049 seems promising.

smu_send_smc_msg_with_param(smu, SMU_MSG_NumOfDisplays, 0);
        ret =3D vega20_set_uclk_to_highest_dpm_level(smu,
                                                   &amp;dpm_table-&gt;mem_t=
able);



if (ret)
                pr_err(&quot;Failed to set uclk to highest dpm level&quot;);




Although that error message is not displayed in dmesg, this function deals =
with
multiple displays and the power levels. Unfortunatelely I cannot find
documenation for the driver code. What does smu_send_smc_msg_with_param do?
Because here the last argument is 0. In the next function,
vega20_display_config_changed the final argument is the number of displays:

smu_send_smc_msg_with_param(smu,
                                            SMU_MSG_NumOfDisplays,
                                            smu-&gt;display_config-&gt;num_=
display);



The next point of interest is line 2091. I don't think it's the cause of the
bug but:

disable_mclk_switching =3D ((1 &lt; smu-&gt;display_config-&gt;num_display)=
 &amp;&amp;
                                  !smu-&gt;display_config-&gt;multi_monitor=
_in_sync)
|| vblank_too_short;


 disable_mclk_switching is set if the number of displays is more than 1 and
&quot;multi_monitor_in_sync&quot; (whatever that is, possibly mirrored disp=
lays?)  or
&quot;vblank_too_short&quot;. I don't believe this is a problem because the=
 code has
existed since January, presumably for the February release, but perhaps the
contents of the different variables has chagned so this code runs different=
ly.

I only mention this because it's the only point in the code I found where it
does something different if more than one display is connected.=20

My questions for the driver devs:

1. Why is smu_send_smc_msg_with_param called with zero in the function
vega20_pre_display_config_changed but the number of displays in the next
function?
2. Is num_displays an index (so 0 is actually the first display and we're
assuming 1 display in index 0) or is it actually 0, no displays?
3. Is there any way to see which code appears in which kernel version? The =
tags
are definitely incorrect, the first commit for that file:
<a href=3D"https://github.com/torvalds/linux/commit/74e07f9d3b77034cd154661=
7afce1d014a68d1ca#diff-2575675126169f3c0c971db736852af9">https://github.com=
/torvalds/linux/commit/74e07f9d3b77034cd1546617afce1d014a68d1ca#diff-257567=
5126169f3c0c971db736852af9</a>
says 5.2 but was done in December last year so I can't imagine this file is=
n't
used.



However, as a customer this is very frustrating. I bought the VII instead o=
f an
nvidia card because AMD were supporting open source drivers.

As it stands:

- The AMDGPU driver worked for 4 months after the VII's release and now we'=
ve
had nearly the same amount of time where it hasn't worked with the latest
kernel.
- The AMDGPU-Pro driver only supports Ubuntu, I've never managed to get it =
to
run successfully on Arch and the latest version only supports The RX5700 ca=
rds
anyway.

I emailed AMD technical support about this bug over a month ago and never g=
ot a
reply.

The VII appears to be completely unsupported other than the initial driver
release when the card came out. I'll be going back to nvidia next time and
although I had intended to keep the VII for several years it looks like that
won't be possible as I can't run an old kernel forever.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15655371732.Df5cd.31853--

--===============0741442028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0741442028==--
