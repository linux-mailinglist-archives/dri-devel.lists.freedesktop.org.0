Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 185B744E0E4
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 04:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D56689A57;
	Fri, 12 Nov 2021 03:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332BA88549
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 03:47:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DE8B960FC1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 03:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636688873;
 bh=tXIm5rgmb4EprYtrY8eafjY0M4Ct+XZss49UzjqfqRQ=;
 h=From:To:Subject:Date:From;
 b=cB4u0d1RokMibWKOF9aKer+kkoTmG5SMvWdunOadHaIBQO9wTqznSmylSQa1bJOfO
 O26DnQaEZ/F7Zepn5T+Ic1Y0FA5FIWWy/bjzJalO7trbvBHVVPnvl3uytSXXYBUpO5
 B438qjVosVSsQRP17rKTuRhrfOsTBRiFhEYU4ijfh2ddompj1OLrKdI2Wtw5O8v5lz
 y2t892HWG7QA2GIl07phxt3eNf7Vc0WWAOSrDXgJ4Blw4mG5XihT1nBkjd6uJItdah
 zAktLVTaMDcZDC2ra/qVnxNdHGatxRYnFdF3r1xHnHlm2FKc+Ci1xfX9X4lZRVb6ye
 n4ysBaYuRL21w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C324460FF3; Fri, 12 Nov 2021 03:47:53 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214991] New: VC4 DRM waiting for flip down makes UI freeze a
 while with kernel 5.15
Date: Fri, 12 Nov 2021 03:47:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jhp@endlessos.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-214991-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D214991

            Bug ID: 214991
           Summary: VC4 DRM waiting for flip down makes UI freeze a while
                    with kernel 5.15
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15
          Hardware: ARM
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: jhp@endlessos.org
        Regression: No

Created attachment 299547
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299547&action=3Dedit
Full dmesg log

I tested Linux mainline kernel 5.15 (aarch64) with enabled VC4 on RPi 4B. I
notice UI freezes a while (about 10 seconds) some times.

The kernel shows the error message during the time:

[drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
[drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:68:crtc-3] flip_do=
ne
timed out
[drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:68:crtc-3] comm=
it
wait timed out
[drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
vc4-drm gpu: [drm] *ERROR* Timed out waiting for commit

It is easy to reproduce this issue by invoking GL related things, for examp=
le
es2gears.

After detail test, I found it is related to these commits:

f3c420fe19f8 ("drm/vc4: kms: Convert to atomic helpers")
82faa3276012 ("drm/vc4: kms: Remove async modeset semaphore")

This issue cannot be reproduced after I revert the commits.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
