Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBFB89327
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 20:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3796E393;
	Sun, 11 Aug 2019 18:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0FB606E393
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 18:43:49 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0C5C872167; Sun, 11 Aug 2019 18:43:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sun, 11 Aug 2019 18:43:48 +0000
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
Message-ID: <bug-110674-502-gRI8ADctYd@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1355727596=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1355727596==
Content-Type: multipart/alternative; boundary="15655490290.dfE48e.31185"
Content-Transfer-Encoding: 7bit


--15655490290.dfE48e.31185
Date: Sun, 11 Aug 2019 18:43:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #72 from Tom B <tom@r.je> ---
> The nasty displayport mst thingy? I would always set this to false.

I don't believe mst is being used here, it's two monitors both with separate
cables.


Here's some additional investigation.

[SetUclkToHightestDpmLevel] Set hard min uclk failed! Appears as one of the
first errors in dmesg. This is from vega20_hwmgr.c:3354 and triggered by:


                PP_ASSERT_WITH_CODE(!(ret =3D
smum_send_msg_to_smc_with_parameter(hwmgr,
                                PPSMC_MSG_SetHardMinByFreq,
                                (PPCLK_UCLK << 16 ) |
dpm_table->dpm_state.hard_min_level)),
                                "[SetUclkToHightestDpmLevel] Set hard min u=
clk
failed!",
                                return ret);




hard_min_level is adjusted if disable_mclk_switching is set on line 3497.


        disable_mclk_switching =3D ((1 < hwmgr->display_config->num_display=
) &&
                           !hwmgr->display_config->multi_monitor_in_sync) ||
                            vblank_too_short;


        /* Hardmin is dependent on displayconfig */
        if (disable_mclk_switching) {
                dpm_table->dpm_state.hard_min_level =3D
dpm_table->dpm_levels[dpm_table->count - 1].value;
                for (i =3D 0; i < data->mclk_latency_table.count - 1; i++) {
                        if (data->mclk_latency_table.entries[i].latency <=3D
latency) {
                                if (dpm_table->dpm_levels[i].value >=3D
(hwmgr->display_config->min_mem_set_clock / 100)) {
                                        dpm_table->dpm_state.hard_min_level=
 =3D
dpm_table->dpm_levels[i].value;
                                        break;
                                }
                        }
                }
        }


Interestingly, this also checks for the presence of multiple displays so we=
 at
least have a connection between the code, error message and cause of the bug
(multiple displays). As a very crude test, I tried forcing it on and compil=
ing
with

disable_mclk_switching =3D true;

No difference, so I also tried:

disable_mclk_switching =3D false;

Again, it didn't help. I will note that this code is identical in 5.0.13 so=
 my
test was really only checking for an incorrect value being set elsewhere in
hwmgr->display_config->multi_monitor_in_sync or=20
hwmgr->display_config->num_display. In 5.0.13 I do get mclk boosting, It id=
les
at 351mhz and boosts to 1001mhz so I don't think that forcing the memory to=
 max
clock all the time is the correct solution.


I also diff'd vega20_hwmgr.c from 5.0.13 and 5.2.7  (I'll attach it). Here'=
s a
few things I noticed:


in vega20_init_smc_table, this line has been added in this commit
https://github.com/torvalds/linux/commit/f5e79735cab448981e245a41ee6cbebf0e=
334f61
:=20

+       data->vbios_boot_state.fclock =3D boot_up_values.ulFClk;

I don't know what fclock is, but this was never set in 5.0.13.


in vega20_setup_default_dpm_tables:

@@ -710,8 +729,10 @@ static int vega20_setup_default_dpm_tables(struct pp_h=
wmgr
*hwmgr)
                PP_ASSERT_WITH_CODE(!ret,
                                "[SetupDefaultDpmTable] failed to get fclk =
dpm
levels!",
                                return ret);
-       } else
-               dpm_table->count =3D 0;
+       } else {
+               dpm_table->count =3D 1;
+               dpm_table->dpm_levels[0].value =3D data->vbios_boot_state.f=
clock
/ 100;
+       }


in 5.0.13, dpm_table->count is set to 0, in 5.2.7 it's set and a dpm_level
added based on fclock. fclock appears throughout as a new addition. I don't
think this is the cause, but the addition of fclock may be worth exploring.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15655490290.dfE48e.31185
Date: Sun, 11 Aug 2019 18:43:49 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c72">Comme=
nt # 72</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre><span class=3D"quote">&gt; The nasty displayport mst thingy? I=
 would always set this to false.</span >

I don't believe mst is being used here, it's two monitors both with separate
cables.


Here's some additional investigation.

[SetUclkToHightestDpmLevel] Set hard min uclk failed! Appears as one of the
first errors in dmesg. This is from vega20_hwmgr.c:3354 and triggered by:


                PP_ASSERT_WITH_CODE(!(ret =3D
smum_send_msg_to_smc_with_parameter(hwmgr,
                                PPSMC_MSG_SetHardMinByFreq,
                                (PPCLK_UCLK &lt;&lt; 16 ) |
dpm_table-&gt;dpm_state.hard_min_level)),
                                &quot;[SetUclkToHightestDpmLevel] Set hard =
min uclk
failed!&quot;,
                                return ret);




hard_min_level is adjusted if disable_mclk_switching is set on line 3497.


        disable_mclk_switching =3D ((1 &lt; hwmgr-&gt;display_config-&gt;nu=
m_display) &amp;&amp;
                           !hwmgr-&gt;display_config-&gt;multi_monitor_in_s=
ync) ||
                            vblank_too_short;


        /* Hardmin is dependent on displayconfig */
        if (disable_mclk_switching) {
                dpm_table-&gt;dpm_state.hard_min_level =3D
dpm_table-&gt;dpm_levels[dpm_table-&gt;count - 1].value;
                for (i =3D 0; i &lt; data-&gt;mclk_latency_table.count - 1;=
 i++) {
                        if (data-&gt;mclk_latency_table.entries[i].latency =
&lt;=3D
latency) {
                                if (dpm_table-&gt;dpm_levels[i].value &gt;=
=3D
(hwmgr-&gt;display_config-&gt;min_mem_set_clock / 100)) {
                                        dpm_table-&gt;dpm_state.hard_min_le=
vel =3D
dpm_table-&gt;dpm_levels[i].value;
                                        break;
                                }
                        }
                }
        }


Interestingly, this also checks for the presence of multiple displays so we=
 at
least have a connection between the code, error message and cause of the bug
(multiple displays). As a very crude test, I tried forcing it on and compil=
ing
with

disable_mclk_switching =3D true;

No difference, so I also tried:

disable_mclk_switching =3D false;

Again, it didn't help. I will note that this code is identical in 5.0.13 so=
 my
test was really only checking for an incorrect value being set elsewhere in
hwmgr-&gt;display_config-&gt;multi_monitor_in_sync or=20
hwmgr-&gt;display_config-&gt;num_display. In 5.0.13 I do get mclk boosting,=
 It idles
at 351mhz and boosts to 1001mhz so I don't think that forcing the memory to=
 max
clock all the time is the correct solution.


I also diff'd vega20_hwmgr.c from 5.0.13 and 5.2.7  (I'll attach it). Here'=
s a
few things I noticed:


in vega20_init_smc_table, this line has been added in this commit
<a href=3D"https://github.com/torvalds/linux/commit/f5e79735cab448981e245a4=
1ee6cbebf0e334f61">https://github.com/torvalds/linux/commit/f5e79735cab4489=
81e245a41ee6cbebf0e334f61</a>
:=20

+       data-&gt;vbios_boot_state.fclock =3D boot_up_values.ulFClk;

I don't know what fclock is, but this was never set in 5.0.13.


in vega20_setup_default_dpm_tables:

&#64;&#64; -710,8 +729,10 &#64;&#64; static int vega20_setup_default_dpm_ta=
bles(struct pp_hwmgr
*hwmgr)
                PP_ASSERT_WITH_CODE(!ret,
                                &quot;[SetupDefaultDpmTable] failed to get =
fclk dpm
levels!&quot;,
                                return ret);
-       } else
-               dpm_table-&gt;count =3D 0;
+       } else {
+               dpm_table-&gt;count =3D 1;
+               dpm_table-&gt;dpm_levels[0].value =3D data-&gt;vbios_boot_s=
tate.fclock
/ 100;
+       }


in 5.0.13, dpm_table-&gt;count is set to 0, in 5.2.7 it's set and a dpm_lev=
el
added based on fclock. fclock appears throughout as a new addition. I don't
think this is the cause, but the addition of fclock may be worth exploring.=
</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15655490290.dfE48e.31185--

--===============1355727596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1355727596==--
