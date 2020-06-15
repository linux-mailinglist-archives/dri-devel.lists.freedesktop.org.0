Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 224051F90DE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3463989C55;
	Mon, 15 Jun 2020 07:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A6989C33
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 07:59:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208179] New: [amdgpu] black screen after exiting X
Date: Mon, 15 Jun 2020 07:59:38 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shlomo@fastmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cc cf_regression
Message-ID: <bug-208179-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=208179

            Bug ID: 208179
           Summary: [amdgpu] black screen after exiting X
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.7.2
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: shlomo@fastmail.com
                CC: daniel@ffwll.ch, dri-devel@lists.freedesktop.org
        Regression: Yes

After exiting X on a virtual terminal that isn't tty1, the screen becomes all
black instead of showing the text tty. Keyboard input still goes to the text
tty, but I can't see what I'm typing.

After this happens, a workaround is to switch to a different virtual terminal
(with Ctrl+Alt+FN) that is in text mode (not running X) and then switch back.
Then the text tty is visible and works normally.

Switching to a different virtual terminal that is running X and then switching
back doesn't help. The problematic virtual terminal is still all black.

My graphics card is Gigabyte Radeon RX VEGA 56 GAMING OC 8G. (amdgpu)

The bug appeared after upgrading Arch linux 5.6.15.arch1-1 to 5.7.2.arch1-1.

The first bad commit is 64914da24ea95d2b2f7017d014d74c26005d8780
(drm/fbdev-helper: don't force restores).
The previous commit e81a2557e0650ee0ce37ba14476ddb709d6daf57 is good.

When testing these two commits, I needed to cherry-pick the following fixes:
a9a3ed1eff3601b63aea4fb462d8b3b92c7c1e7e (x86: Fix early boot crash on gcc-10,
third try)
e33a814e772cdc36436c8c188d8c42d019fda639 (scripts/dtc: Remove redundant YYLOC
global declaration)
df6d4f9db79c1a5d6f48b59db35ccd1e9ff9adfc (x86/boot/compressed: Don't declare
__force_order in kaslr_64.c)
These are needed when compiling with GCC 10 to fix compilation errors and a
hang on boot.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
