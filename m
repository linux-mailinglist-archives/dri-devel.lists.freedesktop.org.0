Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2B58A13D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 16:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35E8899BC;
	Mon, 12 Aug 2019 14:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C9D0F89AD2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 14:34:52 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C634672167; Mon, 12 Aug 2019 14:34:52 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Mon, 12 Aug 2019 14:34:52 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110674-502-cfWvYO9nAx@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1632874178=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1632874178==
Content-Type: multipart/alternative; boundary="15656204922.b67c4D0be.2646"
Content-Transfer-Encoding: 7bit


--15656204922.b67c4D0be.2646
Date: Mon, 12 Aug 2019 14:34:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #81 from Tom B <tom@r.je> ---
Created attachment 145038
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145038&action=3Dedit
5.2.7 dmesg with hard_min_level logged

As mentioned in the previous post, I started logging the value of
hard_min_level. I hadn't realised that vega20_set_uclk_to_highest_dpm_level
would be called so many times.

Here's what I found: The value of hard_min_level is 1001 in both 5.0.13 and
5.2.7 so the issue is not the value from the dpm table. The dpm table is
probably correct. Something prevents smum_send_msg_to_smc_with_parameter
accepting the value.

However, what is interesting is that it doesn't always fail.


[    4.082105] amdgpu: [powerplay] hard_min_level: 1001
[    4.372684] [drm] Initialized amdgpu 3.32.0 20150101 for 0000:44:00.0 on
minor 0
[    4.517204] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[    4.517205] amdgpu: [powerplay] [SetUclkToHightestDpmLevel] Set hard min
uclk failed!





Each hard_min_level line in the log is from
vega20_set_uclk_to_highest_dpm_level and there are multiple calls to it, wh=
ich
don't fail, before the card is initialised.


This is from 5.2.7:

[    3.698907] amdgpu 0000:44:00.0: ring vce2 uses VM inv eng 14 on hub 1
[    4.082105] amdgpu: [powerplay] hard_min_level: 1001
[    4.372684] [drm] Initialized amdgpu 3.32.0 20150101 for 0000:44:00.0 on
minor 0
[    4.517204] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[    4.517205] amdgpu: [powerplay] [SetUclkToHightestDpmLevel] Set hard min
uclk failed!
[    5.361482] amdgpu: [powerplay] Failed to send message 0x28, response 0x0


And the same from 5.0.13:

[    3.352380] amdgpu 0000:44:00.0: ring vce2 uses VM inv eng 14 on hub 1
[    3.722422] amdgpu: [powerplay] hard_min_level: 1001
[    3.766269] amdgpu: [powerplay] hard_min_level: 1001
[    4.029679] [drm] Initialized amdgpu 3.27.0 20150101 for 0000:44:00.0 on
minor 0


There are a couple of things here:

1. vega20_set_fclk_to_highest_dpm_level is called twice between the "ring v=
ce2"
line and "Initialized"

2. My patched code looks like this:

                pr_err("hard_min_level: %d\n",
                                        dpm_table->dpm_state.hard_min_level=
);

                PP_ASSERT_WITH_CODE(!(ret =3D
smum_send_msg_to_smc_with_parameter(hwmgr,
                                PPSMC_MSG_SetHardMinByFreq,
                                (PPCLK_UCLK << 16 ) |
dpm_table->dpm_state.hard_min_level)),
                                "[SetUclkToHightestDpmLevel] Set hard min u=
clk
failed!",
                                return ret);

Yet the log shows:

- My debug line=20
- Initialized amdgpu 3.32.0 20150101 for 0000:44:00.0 on minor 0
- [SetUclkToHightestDpmLevel] Set hard min uclk failed!

So initialization is happening between (and possibly a result of) sending t=
he
message and getting the response.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15656204922.b67c4D0be.2646
Date: Mon, 12 Aug 2019 14:34:52 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c81">Comme=
nt # 81</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145038=
" name=3D"attach_145038" title=3D"5.2.7 dmesg with hard_min_level logged">a=
ttachment 145038</a> <a href=3D"attachment.cgi?id=3D145038&amp;action=3Dedi=
t" title=3D"5.2.7 dmesg with hard_min_level logged">[details]</a></span>
5.2.7 dmesg with hard_min_level logged

As mentioned in the previous post, I started logging the value of
hard_min_level. I hadn't realised that vega20_set_uclk_to_highest_dpm_level
would be called so many times.

Here's what I found: The value of hard_min_level is 1001 in both 5.0.13 and
5.2.7 so the issue is not the value from the dpm table. The dpm table is
probably correct. Something prevents smum_send_msg_to_smc_with_parameter
accepting the value.

However, what is interesting is that it doesn't always fail.


[    4.082105] amdgpu: [powerplay] hard_min_level: 1001
[    4.372684] [drm] Initialized amdgpu 3.32.0 20150101 for 0000:44:00.0 on
minor 0
[    4.517204] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[    4.517205] amdgpu: [powerplay] [SetUclkToHightestDpmLevel] Set hard min
uclk failed!





Each hard_min_level line in the log is from
vega20_set_uclk_to_highest_dpm_level and there are multiple calls to it, wh=
ich
don't fail, before the card is initialised.


This is from 5.2.7:

[    3.698907] amdgpu 0000:44:00.0: ring vce2 uses VM inv eng 14 on hub 1
[    4.082105] amdgpu: [powerplay] hard_min_level: 1001
[    4.372684] [drm] Initialized amdgpu 3.32.0 20150101 for 0000:44:00.0 on
minor 0
[    4.517204] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[    4.517205] amdgpu: [powerplay] [SetUclkToHightestDpmLevel] Set hard min
uclk failed!
[    5.361482] amdgpu: [powerplay] Failed to send message 0x28, response 0x0


And the same from 5.0.13:

[    3.352380] amdgpu 0000:44:00.0: ring vce2 uses VM inv eng 14 on hub 1
[    3.722422] amdgpu: [powerplay] hard_min_level: 1001
[    3.766269] amdgpu: [powerplay] hard_min_level: 1001
[    4.029679] [drm] Initialized amdgpu 3.27.0 20150101 for 0000:44:00.0 on
minor 0


There are a couple of things here:

1. vega20_set_fclk_to_highest_dpm_level is called twice between the &quot;r=
ing vce2&quot;
line and &quot;Initialized&quot;

2. My patched code looks like this:

                pr_err(&quot;hard_min_level: %d\n&quot;,
                                        dpm_table-&gt;dpm_state.hard_min_le=
vel);

                PP_ASSERT_WITH_CODE(!(ret =3D
smum_send_msg_to_smc_with_parameter(hwmgr,
                                PPSMC_MSG_SetHardMinByFreq,
                                (PPCLK_UCLK &lt;&lt; 16 ) |
dpm_table-&gt;dpm_state.hard_min_level)),
                                &quot;[SetUclkToHightestDpmLevel] Set hard =
min uclk
failed!&quot;,
                                return ret);

Yet the log shows:

- My debug line=20
- Initialized amdgpu 3.32.0 20150101 for 0000:44:00.0 on minor 0
- [SetUclkToHightestDpmLevel] Set hard min uclk failed!

So initialization is happening between (and possibly a result of) sending t=
he
message and getting the response.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15656204922.b67c4D0be.2646--

--===============1632874178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1632874178==--
