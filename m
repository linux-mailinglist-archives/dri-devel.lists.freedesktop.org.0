Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFBF8BCEB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 17:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A880889A72;
	Tue, 13 Aug 2019 15:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 83D3C89DD3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 15:20:05 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 808677215A; Tue, 13 Aug 2019 15:20:05 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Tue, 13 Aug 2019 15:20:05 +0000
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
Message-ID: <bug-110674-502-Y8w4aUoyPz@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1327086478=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1327086478==
Content-Type: multipart/alternative; boundary="15657096053.df7B.22309"
Content-Transfer-Encoding: 7bit


--15657096053.df7B.22309
Date: Tue, 13 Aug 2019 15:20:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #96 from Tom B <tom@r.je> ---
Created attachment 145047
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145047&action=3Dedit
logging anywhere the number of screens is set

Again, no closer to a fix but another thing to rule out. In addition to
SMU_MSG_NumOfDisplays, PPSMC_MSG_NumOfDisplays is also used.

I put a debug message anywhere PPSMC_MSG_NumOfDisplays or SMU_MSG_NumOfDisp=
lays
is set end put else blocks in places where it may have been set:

        if ((data->water_marks_bitmap & WaterMarksExist) &&
            data->smu_features[GNLD_DPM_DCEFCLK].supported &&
            data->smu_features[GNLD_DPM_SOCCLK].supported) {

                pr_err("vega20_display_configuration_changed_task setting
PPSMC_MSG_NumOfDisplays to %d\n", hwmgr->display_config->num_display);

                result =3D smum_send_msg_to_smc_with_parameter(hwmgr,
                        PPSMC_MSG_NumOfDisplays,
                        hwmgr->display_config->num_display);
        }
        else {
                pr_err("vega20_display_configuration_changed_task not setti=
ng
PPSMC_MSG_NumOfDisplays\n");
        }

        return result;
}


Here's what I found:

- The functions dealing with screesn in vega20_ppt.c are never used (
vega20_display_config_changed, vega20_pre_display_config_changed) and can be
ignored for our further tests

- The line:=20

result =3D smum_send_msg_to_smc_with_parameter(hwmgr,=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
PPSMC_MSG_NumOfDisplays, hwmgr->display_config->num_display);

Is never executed, it always triggers the else block so PPSMC_MSG_NumOfDisp=
lays
is never set using num_display.

- The same thing happens in 5.0.13, when I saw the above result I had hoped
that the problem was that  smum_send_msg_to_smc_with_parameter(hwmgr,=20=20=
=20=20=20=20=20=20=20=20=20
PPSMC_MSG_NumOfDisplays, hwmgr->display_config->num_display); was never cal=
led
with the correct number of displays. Unfortunately the behaviour is the sam=
e on
5.0.13, PPSMC_MSG_NumOfDisplays is only ever set to zero in both versions of
the kernel.


Unfortunately this doesn't get us any closer.


The instruction is sent a lot more in 5.0.13 though.=20

5.0.13:

[    3.475471] amdgpu 0000:44:00.0: ring vce1 uses VM inv eng 13 on hub 1
[    3.475472] amdgpu 0000:44:00.0: ring vce2 uses VM inv eng 14 on hub 1
[    3.475508] amdgpu: [powerplay] vega20_display_configuration_changed_task
not setting PPSMC_MSG_NumOfDisplays
[    3.794037] amdgpu: [powerplay]
vega20_pre_display_configuration_changed_task setting PPSMC_MSG_NumOfDispla=
ys
to 0
[    3.800180] amdgpu: [powerplay] vega20_display_configuration_changed_task
not setting PPSMC_MSG_NumOfDisplays
[    3.833502] amdgpu: [powerplay]
vega20_pre_display_configuration_changed_task setting PPSMC_MSG_NumOfDispla=
ys
to 0
[    3.833647] amdgpu: [powerplay] vega20_display_configuration_changed_task
not setting PPSMC_MSG_NumOfDisplays
[    4.153232] [drm] Initialized amdgpu 3.27.0 20150101 for 0000:44:00.0 on
minor 0
[    4.664044] amdgpu: [powerplay]
vega20_pre_display_configuration_changed_task setting PPSMC_MSG_NumOfDispla=
ys
to 0


5.2.7
[    3.711028] amdgpu 0000:44:00.0: ring vce1 uses VM inv eng 13 on hub 1
[    3.711028] amdgpu 0000:44:00.0: ring vce2 uses VM inv eng 14 on hub 1
[    4.086310] amdgpu: [powerplay]
vega20_pre_display_configuration_changed_task setting PPSMC_MSG_NumOfDispla=
ys
to 0
[    4.385470] [drm] Initialized amdgpu 3.32.0 20150101 for 0000:44:00.0 on
minor 0
[    4.522398] amdgpu: [powerplay] Failed to send message 0x28, response 0x0

Notice that vega20_pre_display_configuration_changed_task is run 5 times
between the ring lines and initilization line in 5.0.13 and only once in 5.=
2.7.

This might not mean anything, but it could be another clue that initilizati=
on
is happening before the card is really ready.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15657096053.df7B.22309
Date: Tue, 13 Aug 2019 15:20:05 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c96">Comme=
nt # 96</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145047=
" name=3D"attach_145047" title=3D"logging anywhere the number of screens is=
 set">attachment 145047</a> <a href=3D"attachment.cgi?id=3D145047&amp;actio=
n=3Dedit" title=3D"logging anywhere the number of screens is set">[details]=
</a></span>
logging anywhere the number of screens is set

Again, no closer to a fix but another thing to rule out. In addition to
SMU_MSG_NumOfDisplays, PPSMC_MSG_NumOfDisplays is also used.

I put a debug message anywhere PPSMC_MSG_NumOfDisplays or SMU_MSG_NumOfDisp=
lays
is set end put else blocks in places where it may have been set:

        if ((data-&gt;water_marks_bitmap &amp; WaterMarksExist) &amp;&amp;
            data-&gt;smu_features[GNLD_DPM_DCEFCLK].supported &amp;&amp;
            data-&gt;smu_features[GNLD_DPM_SOCCLK].supported) {

                pr_err(&quot;vega20_display_configuration_changed_task sett=
ing
PPSMC_MSG_NumOfDisplays to %d\n&quot;, hwmgr-&gt;display_config-&gt;num_dis=
play);

                result =3D smum_send_msg_to_smc_with_parameter(hwmgr,
                        PPSMC_MSG_NumOfDisplays,
                        hwmgr-&gt;display_config-&gt;num_display);
        }
        else {
                pr_err(&quot;vega20_display_configuration_changed_task not =
setting
PPSMC_MSG_NumOfDisplays\n&quot;);
        }

        return result;
}


Here's what I found:

- The functions dealing with screesn in vega20_ppt.c are never used (
vega20_display_config_changed, vega20_pre_display_config_changed) and can be
ignored for our further tests

- The line:=20

result =3D smum_send_msg_to_smc_with_parameter(hwmgr,=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
PPSMC_MSG_NumOfDisplays, hwmgr-&gt;display_config-&gt;num_display);

Is never executed, it always triggers the else block so PPSMC_MSG_NumOfDisp=
lays
is never set using num_display.

- The same thing happens in 5.0.13, when I saw the above result I had hoped
that the problem was that  smum_send_msg_to_smc_with_parameter(hwmgr,=20=20=
=20=20=20=20=20=20=20=20=20
PPSMC_MSG_NumOfDisplays, hwmgr-&gt;display_config-&gt;num_display); was nev=
er called
with the correct number of displays. Unfortunately the behaviour is the sam=
e on
5.0.13, PPSMC_MSG_NumOfDisplays is only ever set to zero in both versions of
the kernel.


Unfortunately this doesn't get us any closer.


The instruction is sent a lot more in 5.0.13 though.=20

5.0.13:

[    3.475471] amdgpu 0000:44:00.0: ring vce1 uses VM inv eng 13 on hub 1
[    3.475472] amdgpu 0000:44:00.0: ring vce2 uses VM inv eng 14 on hub 1
[    3.475508] amdgpu: [powerplay] vega20_display_configuration_changed_task
not setting PPSMC_MSG_NumOfDisplays
[    3.794037] amdgpu: [powerplay]
vega20_pre_display_configuration_changed_task setting PPSMC_MSG_NumOfDispla=
ys
to 0
[    3.800180] amdgpu: [powerplay] vega20_display_configuration_changed_task
not setting PPSMC_MSG_NumOfDisplays
[    3.833502] amdgpu: [powerplay]
vega20_pre_display_configuration_changed_task setting PPSMC_MSG_NumOfDispla=
ys
to 0
[    3.833647] amdgpu: [powerplay] vega20_display_configuration_changed_task
not setting PPSMC_MSG_NumOfDisplays
[    4.153232] [drm] Initialized amdgpu 3.27.0 20150101 for 0000:44:00.0 on
minor 0
[    4.664044] amdgpu: [powerplay]
vega20_pre_display_configuration_changed_task setting PPSMC_MSG_NumOfDispla=
ys
to 0


5.2.7
[    3.711028] amdgpu 0000:44:00.0: ring vce1 uses VM inv eng 13 on hub 1
[    3.711028] amdgpu 0000:44:00.0: ring vce2 uses VM inv eng 14 on hub 1
[    4.086310] amdgpu: [powerplay]
vega20_pre_display_configuration_changed_task setting PPSMC_MSG_NumOfDispla=
ys
to 0
[    4.385470] [drm] Initialized amdgpu 3.32.0 20150101 for 0000:44:00.0 on
minor 0
[    4.522398] amdgpu: [powerplay] Failed to send message 0x28, response 0x0

Notice that vega20_pre_display_configuration_changed_task is run 5 times
between the ring lines and initilization line in 5.0.13 and only once in 5.=
2.7.

This might not mean anything, but it could be another clue that initilizati=
on
is happening before the card is really ready.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15657096053.df7B.22309--

--===============1327086478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1327086478==--
