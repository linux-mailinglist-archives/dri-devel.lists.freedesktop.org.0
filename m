Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7331DBA266
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE78A8930C;
	Sun, 22 Sep 2019 12:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id AD9906E0C1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 20:04:31 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AA31772162; Sat, 21 Sep 2019 20:04:31 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sat, 21 Sep 2019 20:04:31 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: tom91136@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-MBUaDsOYNG@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0600425238=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0600425238==
Content-Type: multipart/alternative; boundary="15690962712.54766.30234"
Content-Transfer-Encoding: 7bit


--15690962712.54766.30234
Date: Sat, 21 Sep 2019 20:04:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #136 from tom91136@gmail.com ---
Been following this thread for a while now as I just got 3 4k 60Hz monitors
connected to the 3 DP ports on my Radeon VII.=20
I'm getting the exact same errors discussed in this report with matching dm=
esg
outputs.

I've applied the patches to Fedora 31's 5.3.0-3 kernel and everything now w=
orks
perfectly!

Just a few notes:

* Idle power draw before patch was 22W in lm_sensors, now it's reading 28W,
makes sense as the memory is now properly clocked. This also loosely matches
@Tom B's results.

* I did not get the repeated `[drm] schedsdma0 is not ready, skipping` in
dmesg, however, it is still possible to trigger a freeze by toggling dpms:

    xset dpms force off

Resulting in:

[  155.431068] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[  155.431070] amdgpu: [powerplay] [SetHardMinFreq] Set hard min uclk faile=
d!
[  161.334003] amdgpu: [powerplay] Failed to send message 0x26, response 0x0
[  161.334004] amdgpu: [powerplay] Failed to set soft min gfxclk !
[  161.334005] amdgpu: [powerplay] Failed to upload DPM Bootup Levels!
[  164.622060] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[  164.622062] amdgpu: [powerplay] [SetHardMinFreq] Set hard min uclk faile=
d!


Previously, without the patch, the machine hangs. With the patch, the displ=
ay
freezes for a few seconds and then power off. Mouse movement correctly turn=
s on
all screen and everything is back to normal.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15690962712.54766.30234
Date: Sat, 21 Sep 2019 20:04:31 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c136">Comm=
ent # 136</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom91136&#64;gmail.com" title=3D"tom91136&#64;gmail.com">tom91136&#64;gmail=
.com</a>
</span></b>
        <pre>Been following this thread for a while now as I just got 3 4k =
60Hz monitors
connected to the 3 DP ports on my Radeon VII.=20
I'm getting the exact same errors discussed in this report with matching dm=
esg
outputs.

I've applied the patches to Fedora 31's 5.3.0-3 kernel and everything now w=
orks
perfectly!

Just a few notes:

* Idle power draw before patch was 22W in lm_sensors, now it's reading 28W,
makes sense as the memory is now properly clocked. This also loosely matches
&#64;Tom B's results.

* I did not get the repeated `[drm] schedsdma0 is not ready, skipping` in
dmesg, however, it is still possible to trigger a freeze by toggling dpms:

    xset dpms force off

Resulting in:

[  155.431068] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[  155.431070] amdgpu: [powerplay] [SetHardMinFreq] Set hard min uclk faile=
d!
[  161.334003] amdgpu: [powerplay] Failed to send message 0x26, response 0x0
[  161.334004] amdgpu: [powerplay] Failed to set soft min gfxclk !
[  161.334005] amdgpu: [powerplay] Failed to upload DPM Bootup Levels!
[  164.622060] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[  164.622062] amdgpu: [powerplay] [SetHardMinFreq] Set hard min uclk faile=
d!


Previously, without the patch, the machine hangs. With the patch, the displ=
ay
freezes for a few seconds and then power off. Mouse movement correctly turn=
s on
all screen and everything is back to normal.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15690962712.54766.30234--

--===============0600425238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0600425238==--
