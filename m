Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B17DBA273
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53436E134;
	Sun, 22 Sep 2019 12:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 86AD36E093
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 15:02:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8408D72162; Sat, 21 Sep 2019 15:02:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sat, 21 Sep 2019 15:02:08 +0000
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
Message-ID: <bug-110674-502-qM0jYK0fIv@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0031240264=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0031240264==
Content-Type: multipart/alternative; boundary="15690781287.ABfb7A1.5321"
Content-Transfer-Encoding: 7bit


--15690781287.ABfb7A1.5321
Date: Sat, 21 Sep 2019 15:02:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #129 from Tom B <tom@r.je> ---
Thank you Alex! That has fixed it! The card is now correctly setting its
voltages and clocks. I applied the patch to 5.3.1

However, I've noticed a few very minor problems that are probably worth
reporting.

1. I still get this in dmesg:


[    6.307005] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[    6.307006] amdgpu: [powerplay] [SetHardMinFreq] Set hard min uclk faile=
d!
[    9.225192] amdgpu 0000:44:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]] *ER=
ROR*
IB test failed on sdma0 (-110).
[   10.238621] amdgpu 0000:44:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]] *ER=
ROR*
IB test failed on page0 (-110).
[   10.532004] amdgpu: [powerplay] Failed to send message 0x26, response 0x0
[   10.532005] amdgpu: [powerplay] Failed to set soft min gfxclk !
[   10.532006] amdgpu: [powerplay] Failed to upload DPM Bootup Levels!


Though this doesn't really matter, we were focussing our issue there earlie=
r in
the thread as it looked like `Set hard min uclk failed!` was the cause of t=
he
problem, obviously it isn't.

2. This repeats indefinitely in dmesg:

[  332.575747] [drm] schedsdma0 is not ready, skipping
[  332.582657] [drm] schedsdma0 is not ready, skipping
[  332.582864] [drm] schedsdma0 is not ready, skipping
[  332.708848] [drm] schedsdma0 is not ready, skipping
[  332.715975] [drm] schedsdma0 is not ready, skipping
[  332.716229] [drm] schedsdma0 is not ready, skipping
[  332.756987] [drm] schedsdma0 is not ready, skipping
[  332.763970] [drm] schedsdma0 is not ready, skipping
[  332.764169] [drm] schedsdma0 is not ready, skipping


As you can see several dozens of times second this gets written to dmesg. T=
his
might be because the patches are intended to be used on 5.4?

3. The lowest wattage now seems to be 33w rather than 23w which means incre=
ased
idle power usage and temps. This isn't really a problem but I thought it was
worth mentioning and is a fair tradeoff for stability.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15690781287.ABfb7A1.5321
Date: Sat, 21 Sep 2019 15:02:08 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c129">Comm=
ent # 129</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre>Thank you Alex! That has fixed it! The card is now correctly s=
etting its
voltages and clocks. I applied the patch to 5.3.1

However, I've noticed a few very minor problems that are probably worth
reporting.

1. I still get this in dmesg:


[    6.307005] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[    6.307006] amdgpu: [powerplay] [SetHardMinFreq] Set hard min uclk faile=
d!
[    9.225192] amdgpu 0000:44:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]] *ER=
ROR*
IB test failed on sdma0 (-110).
[   10.238621] amdgpu 0000:44:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]] *ER=
ROR*
IB test failed on page0 (-110).
[   10.532004] amdgpu: [powerplay] Failed to send message 0x26, response 0x0
[   10.532005] amdgpu: [powerplay] Failed to set soft min gfxclk !
[   10.532006] amdgpu: [powerplay] Failed to upload DPM Bootup Levels!


Though this doesn't really matter, we were focussing our issue there earlie=
r in
the thread as it looked like `Set hard min uclk failed!` was the cause of t=
he
problem, obviously it isn't.

2. This repeats indefinitely in dmesg:

[  332.575747] [drm] schedsdma0 is not ready, skipping
[  332.582657] [drm] schedsdma0 is not ready, skipping
[  332.582864] [drm] schedsdma0 is not ready, skipping
[  332.708848] [drm] schedsdma0 is not ready, skipping
[  332.715975] [drm] schedsdma0 is not ready, skipping
[  332.716229] [drm] schedsdma0 is not ready, skipping
[  332.756987] [drm] schedsdma0 is not ready, skipping
[  332.763970] [drm] schedsdma0 is not ready, skipping
[  332.764169] [drm] schedsdma0 is not ready, skipping


As you can see several dozens of times second this gets written to dmesg. T=
his
might be because the patches are intended to be used on 5.4?

3. The lowest wattage now seems to be 33w rather than 23w which means incre=
ased
idle power usage and temps. This isn't really a problem but I thought it was
worth mentioning and is a fair tradeoff for stability.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15690781287.ABfb7A1.5321--

--===============0031240264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0031240264==--
