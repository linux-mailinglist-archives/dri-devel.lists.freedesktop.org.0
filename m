Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB8A82759
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 00:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E154A6E2EC;
	Mon,  5 Aug 2019 22:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C85736E2B2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 22:11:02 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C51AE72167; Mon,  5 Aug 2019 22:11:02 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 102646] Screen flickering under amdgpu-experimental [buggy auto
 power profile]
Date: Mon, 05 Aug 2019 22:11:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: Ahzo@tutanota.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-102646-502-TdQ7haMv0q@http.bugs.freedesktop.org/>
In-Reply-To: <bug-102646-502@http.bugs.freedesktop.org/>
References: <bug-102646-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1391327975=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1391327975==
Content-Type: multipart/alternative; boundary="15650430626.DAA8aFeaC.29115"
Content-Transfer-Encoding: 7bit


--15650430626.DAA8aFeaC.29115
Date: Mon, 5 Aug 2019 22:11:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102646

Ahzo@tutanota.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |Ahzo@tutanota.com

--- Comment #97 from Ahzo@tutanota.com ---
Created attachment 144950
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144950&action=3Dedit
Patch to fix the problem

TLDR: A script to reproduce and a patch to fix this problem are attached.

The problem occurs when switching between high and low GPU memory frequenci=
es
at specific time intervals. It can be reproduced with the attached script,
which optionally accepts a time parameter, defaulting to 1 ms.
With a 75 Hz display mode, screen corruption occurs rather reliably by usin=
g a
time parameter in the following ranges:
0.000-0.002, 0.011-0.015, 0.024-0.028, 0.038-0.042, 0.051-0.055, 0.064-0.06=
8,
0.078-0.082, 0.091-0.095, 0.104-0.108

However, using sleep times between these intervals, e.g. 0.1, does not prod=
uce
any screen corruption.
For a frequency of 75 Hz the frame time is T =3D 1000 / 75 ms =3D 13.3 ms a=
nd the
screen corruption happens for sleep times of:
 S =3D n * T +- 2 ms
Here n is a natural number, i.e. 0, 1, 2, 3, and so on.

Linux 4.14 is not affected by this problem, as is noted in comment 93. Howe=
ver,
that version only works by accident: When the display mode is not yet known,
default parameters, in particular 60 Hz, are used to calculate frame_time_x=
2 as
(1000000 / 60) * 2 / 100 =3D 333, which is then used to set VBITimeout. Lat=
er,
when the refresh rate of 75 Hz is known, frame_time_x2 gets updated to 266,=
 but
VBITimeout is never actually set to that value via smu7_notify_smc_display.

Linux 4.15 included the DC patches, and when using DC (e.g. by using the bo=
ot
argument amdgpu.dc=3D1), VBITimeout is never set to the default 333, but di=
rectly
to 266, which triggers the screen corruption and flickering problems descri=
bed
in this bug.

With Linux 4.17 the problem got more widespread, because the default was
accidentally switched to enable DC by erroneously removing the 'return
amdgpu_dc > 0;' line with:
commit 367e66870e9cc20b867b11c4484ae83336efcb67
Author: Alex Deucher <alexander.deucher@amd.com>
Date:   Thu Jan 25 16:53:25 2018 -0500

    drm/amdgpu: remove DC special casing for KB/ML

    It seems to be working now.

    Bug: https://bugs.freedesktop.org/show_bug.cgi?id=3D102372
    Reviewed-by: Mike Lothian <mike@fireburn.co.uk>
    Reviewed-by: Harry Wentland <harry.wentland@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 309977ef5b51..2ad9de42b65b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1704,6 +1704,8 @@ bool amdgpu_device_asic_has_dc_support(enum amd_asic_=
type
asic_type)
        case CHIP_BONAIRE:
        case CHIP_HAWAII:
        case CHIP_KAVERI:
+       case CHIP_KABINI:
+       case CHIP_MULLINS:
        case CHIP_CARRIZO:
        case CHIP_STONEY:
        case CHIP_POLARIS11:
@@ -1714,9 +1716,6 @@ bool amdgpu_device_asic_has_dc_support(enum amd_asic_=
type
asic_type)
 #if defined(CONFIG_DRM_AMD_DC_PRE_VEGA)
                return amdgpu_dc !=3D 0;
 #endif
-       case CHIP_KABINI:
-       case CHIP_MULLINS:
-               return amdgpu_dc > 0;
        case CHIP_VEGA10:
 #if defined(CONFIG_DRM_AMD_DC_DCN1_0)
        case CHIP_RAVEN:


Linux 4.18 aligns the Non-DC case more closely with the DC case and thus
VBITimeout gets actually set to the updated frame_time_x2 via
smu7_notify_smc_display. Thus the Non-DC case is also affected by this bug
since:
commit 555fd70c59bc7f7acd8bc429d92bd59a66a7b83b
Author: Rex Zhu <Rex.Zhu@amd.com>
Date:   Tue Mar 27 13:32:02 2018 +0800

    drm/amd/pp: Not call cgs interface to get display info

    DC/Non DC all will update display configuration
    when the display state changed
    No need to get display info through cgs interface

    Reviewed-by: Evan Quan <evan.quan@amd.com>
    Signed-off-by: Rex Zhu <Rex.Zhu@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Linux 4.20 contains a commit trying to fix flickering issues:
commit ec2e082a79b5d46addf2e7b83a13fb015fca6149
Author: Alex Deucher <alexander.deucher@amd.com>
Date:   Thu Aug 9 14:24:08 2018 -0500

    drm/amdgpu/powerplay: check vrefresh when when changing displays

    Compare the current vrefresh in addition to the number of displays
    when determining whether or not the smu needs updates when changing
    modes. The SMU needs to be updated if the vbi timeout changes due
    to a different refresh rate.  Fixes flickering around mode changes
    in some cases on polaris parts.

    Reviewed-by: Rex Zhu <Rex.Zhu@amd.com>
    Reviewed-by: Huang Rui <ray.huang@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

But that doesn't fix the screen corruption described in this bug, because t=
he
problem is not that VBITimeout isn't updated enough, but rather the opposit=
e,
i.e. that it gets set to the frame_time_x2 value calculated from the correc=
t,
high refresh rate instead of the default value of 333.

At least for 75 Hz, this problem can be fixed by preventing frame_time_x2 a=
nd
thus VBITimeout from being smaller than 280, as in the attached patch. Sett=
ing
VBITimeout to higher values than the calcualted frame_time_x2 does not seem=
 to
cause any problems.
It would be great if someone could test this patch with higher refresh rate=
s,
as well.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15650430626.DAA8aFeaC.29115
Date: Mon, 5 Aug 2019 22:11:02 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:Ahzo&#64;=
tutanota.com" title=3D"Ahzo&#64;tutanota.com">Ahzo&#64;tutanota.com</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102646">bug 10264=
6</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>Ahzo&#64;tutanota.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102646#c97">Comme=
nt # 97</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102646">bug 10264=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Ahzo&#64;tutanota.com" title=3D"Ahzo&#64;tutanota.com">Ahzo&#64;tutanota.co=
m</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144950=
" name=3D"attach_144950" title=3D"Patch to fix the problem">attachment 1449=
50</a> <a href=3D"attachment.cgi?id=3D144950&amp;action=3Dedit" title=3D"Pa=
tch to fix the problem">[details]</a></span> <a href=3D'page.cgi?id=3Dsplin=
ter.html&amp;bug=3D102646&amp;attachment=3D144950'>[review]</a>
Patch to fix the problem

TLDR: A script to reproduce and a patch to fix this problem are attached.

The problem occurs when switching between high and low GPU memory frequenci=
es
at specific time intervals. It can be reproduced with the attached script,
which optionally accepts a time parameter, defaulting to 1 ms.
With a 75 Hz display mode, screen corruption occurs rather reliably by usin=
g a
time parameter in the following ranges:
0.000-0.002, 0.011-0.015, 0.024-0.028, 0.038-0.042, 0.051-0.055, 0.064-0.06=
8,
0.078-0.082, 0.091-0.095, 0.104-0.108

However, using sleep times between these intervals, e.g. 0.1, does not prod=
uce
any screen corruption.
For a frequency of 75 Hz the frame time is T =3D 1000 / 75 ms =3D 13.3 ms a=
nd the
screen corruption happens for sleep times of:
 S =3D n * T +- 2 ms
Here n is a natural number, i.e. 0, 1, 2, 3, and so on.

Linux 4.14 is not affected by this problem, as is noted in <a href=3D"show_=
bug.cgi?id=3D102646#c93">comment 93</a>. However,
that version only works by accident: When the display mode is not yet known,
default parameters, in particular 60 Hz, are used to calculate frame_time_x=
2 as
(1000000 / 60) * 2 / 100 =3D 333, which is then used to set VBITimeout. Lat=
er,
when the refresh rate of 75 Hz is known, frame_time_x2 gets updated to 266,=
 but
VBITimeout is never actually set to that value via smu7_notify_smc_display.

Linux 4.15 included the DC patches, and when using DC (e.g. by using the bo=
ot
argument amdgpu.dc=3D1), VBITimeout is never set to the default 333, but di=
rectly
to 266, which triggers the screen corruption and flickering problems descri=
bed
in this bug.

With Linux 4.17 the problem got more widespread, because the default was
accidentally switched to enable DC by erroneously removing the 'return
amdgpu_dc &gt; 0;' line with:
commit 367e66870e9cc20b867b11c4484ae83336efcb67
Author: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64;amd.com">a=
lexander.deucher&#64;amd.com</a>&gt;
Date:   Thu Jan 25 16:53:25 2018 -0500

    drm/amdgpu: remove DC special casing for KB/ML

    It seems to be working now.

    Bug: <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [dc] [kabini] Errors during startup - X doesn't start"
   href=3D"show_bug.cgi?id=3D102372">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D102372</a>
    Reviewed-by: Mike Lothian &lt;<a href=3D"mailto:mike&#64;fireburn.co.uk=
">mike&#64;fireburn.co.uk</a>&gt;
    Reviewed-by: Harry Wentland &lt;<a href=3D"mailto:harry.wentland&#64;am=
d.com">harry.wentland&#64;amd.com</a>&gt;
    Signed-off-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64=
;amd.com">alexander.deucher&#64;amd.com</a>&gt;

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 309977ef5b51..2ad9de42b65b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
&#64;&#64; -1704,6 +1704,8 &#64;&#64; bool amdgpu_device_asic_has_dc_suppor=
t(enum amd_asic_type
asic_type)
        case CHIP_BONAIRE:
        case CHIP_HAWAII:
        case CHIP_KAVERI:
+       case CHIP_KABINI:
+       case CHIP_MULLINS:
        case CHIP_CARRIZO:
        case CHIP_STONEY:
        case CHIP_POLARIS11:
&#64;&#64; -1714,9 +1716,6 &#64;&#64; bool amdgpu_device_asic_has_dc_suppor=
t(enum amd_asic_type
asic_type)
 #if defined(CONFIG_DRM_AMD_DC_PRE_VEGA)
                return amdgpu_dc !=3D 0;
 #endif
-       case CHIP_KABINI:
-       case CHIP_MULLINS:
-               return amdgpu_dc &gt; 0;
        case CHIP_VEGA10:
 #if defined(CONFIG_DRM_AMD_DC_DCN1_0)
        case CHIP_RAVEN:


Linux 4.18 aligns the Non-DC case more closely with the DC case and thus
VBITimeout gets actually set to the updated frame_time_x2 via
smu7_notify_smc_display. Thus the Non-DC case is also affected by this bug
since:
commit 555fd70c59bc7f7acd8bc429d92bd59a66a7b83b
Author: Rex Zhu &lt;<a href=3D"mailto:Rex.Zhu&#64;amd.com">Rex.Zhu&#64;amd.=
com</a>&gt;
Date:   Tue Mar 27 13:32:02 2018 +0800

    drm/amd/pp: Not call cgs interface to get display info

    DC/Non DC all will update display configuration
    when the display state changed
    No need to get display info through cgs interface

    Reviewed-by: Evan Quan &lt;<a href=3D"mailto:evan.quan&#64;amd.com">eva=
n.quan&#64;amd.com</a>&gt;
    Signed-off-by: Rex Zhu &lt;<a href=3D"mailto:Rex.Zhu&#64;amd.com">Rex.Z=
hu&#64;amd.com</a>&gt;
    Signed-off-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64=
;amd.com">alexander.deucher&#64;amd.com</a>&gt;

Linux 4.20 contains a commit trying to fix flickering issues:
commit ec2e082a79b5d46addf2e7b83a13fb015fca6149
Author: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64;amd.com">a=
lexander.deucher&#64;amd.com</a>&gt;
Date:   Thu Aug 9 14:24:08 2018 -0500

    drm/amdgpu/powerplay: check vrefresh when when changing displays

    Compare the current vrefresh in addition to the number of displays
    when determining whether or not the smu needs updates when changing
    modes. The SMU needs to be updated if the vbi timeout changes due
    to a different refresh rate.  Fixes flickering around mode changes
    in some cases on polaris parts.

    Reviewed-by: Rex Zhu &lt;<a href=3D"mailto:Rex.Zhu&#64;amd.com">Rex.Zhu=
&#64;amd.com</a>&gt;
    Reviewed-by: Huang Rui &lt;<a href=3D"mailto:ray.huang&#64;amd.com">ray=
.huang&#64;amd.com</a>&gt;
    Signed-off-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64=
;amd.com">alexander.deucher&#64;amd.com</a>&gt;

But that doesn't fix the screen corruption described in this bug, because t=
he
problem is not that VBITimeout isn't updated enough, but rather the opposit=
e,
i.e. that it gets set to the frame_time_x2 value calculated from the correc=
t,
high refresh rate instead of the default value of 333.

At least for 75 Hz, this problem can be fixed by preventing frame_time_x2 a=
nd
thus VBITimeout from being smaller than 280, as in the attached patch. Sett=
ing
VBITimeout to higher values than the calcualted frame_time_x2 does not seem=
 to
cause any problems.
It would be great if someone could test this patch with higher refresh rate=
s,
as well.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15650430626.DAA8aFeaC.29115--

--===============1391327975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1391327975==--
