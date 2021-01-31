Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F4F309DD4
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 17:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09B96E334;
	Sun, 31 Jan 2021 16:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D9A6E334
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 16:24:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0A2EE64E27
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 16:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612110255;
 bh=FFwdtImaI/Bk1oLjMcrBnvI3SxDujr1fO1zjVZJMr/Q=;
 h=From:To:Subject:Date:From;
 b=OslHFjCZKWk1eXHvxT75WtLQFZhq5moIkLeTt8VyIec5/AppZDhoOhy1kCNGfo5zA
 TjgH0oJvsBdvCWHk0XGLn3FwddTpUIQP78S7b4jaI2940j7pFYElx/mNV7GQU05sHC
 auoc9X2IgsCKICIK70MEgDBD2u/OMKJYIDqnBmWZtznwkTg6XX2IK03uz+zrU9ty99
 x5Bd8mvYegtd8od8n2ZBOe5Rza1SF3SyJQYXle9Omz9r4tgBUBht44npEMLLuE0UXH
 b14CxGcrWkmkhaAswgYYo1PlgoJHfUsvwwGHiHpRzoyDYIDg/Di8b+lf/J0xlS7z49
 5YSX9yX6+Va6w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id ED5B76531E; Sun, 31 Jan 2021 16:24:14 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211501] New: Kernel freeze when waking monitor from blanking /
 DPMS (AMDGPU / DC)
Date: Sun, 31 Jan 2021 16:24:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: borisovjasen@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-211501-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211501

            Bug ID: 211501
           Summary: Kernel freeze when waking monitor from blanking / DPMS
                    (AMDGPU / DC)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.11
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: borisovjasen@protonmail.com
        Regression: No

Created attachment 295021
  --> https://bugzilla.kernel.org/attachment.cgi?id=295021&action=edit
relevant dmesg output after kernel recovered from freeze

Occasional temporary kernel freeze when monitor wakes up.

The freeze only happens sometimes (which makes it hard to reproduce). Most of
the time, it wakes up just fine.

The last time it happened, I decided to wait, rather than resetting the
computer, and the system recovered after some time (less than a minute).

My graphics card is a Radeon RX Vega 64. CPU is Intel i7-7700K.

I have 2 connected monitors:
 - Gigabyte G27QC connected via DisplayPort, running at its highest mode:
2560x1440@165Hz.
 - Samsung SyncMaster 2243WM connected via HDMI through a DvI adapter, also at
its highest mode: 1680x1050@60Hz

I don't know if the issue will occur if only one of the two monitors is
connected; as I said, the bug is hard to reproduce.

I am using the `sway` wayland compositor.

After the system recovered from the freeze, I obtained the relevant `dmesg`
output. I am attaching it as `dmesg-post-freeze.txt` (with relative
timestamps).

I am also attaching `dmesg-boot.txt` with the kernel messages from the system
booting, in case you need it for more info about my system.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
