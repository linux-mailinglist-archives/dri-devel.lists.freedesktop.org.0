Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E41815C573
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 17:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F216E0ED;
	Thu, 13 Feb 2020 16:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BB56E0ED
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 16:07:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206519] New: [amdgpu] kernel NULL pointer dereference on shutdown
Date: Thu, 13 Feb 2020 16:07:48 +0000
X-Bugzilla-Reason: None
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
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-206519-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206519

            Bug ID: 206519
           Summary: [amdgpu] kernel NULL pointer dereference on shutdown
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.5.1.arch1-1, 5.5.3-arch1-1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: shlomo@fastmail.com
        Regression: No

Created attachment 287353
  --> https://bugzilla.kernel.org/attachment.cgi?id=287353&action=edit
shutdown screen photo

When I try to power off my machine, it shows the usual shutdown messages and
the screens turn off, but the machine is still powered on. The virtual console
shows a kernel NULL pointer dereference at address 0.

I run Arch Linux.

The bug occurs even if I never run X. I can turn on the machine and immediately
try to shut it down, and the same bug still occurs.

This bug occurred since I upgraded linux 5.4.15.arch1-1 to 5.5.1.arch1-1. I now
run linux 5.5.3.arch1-1 and the bug still exists.

My graphics card is Gigabyte Radeon RX VEGA 56 GAMING OC 8G, connected to six
monitors.

A photo of the screen at shutdown is attached. I think these are the relevant
lines for this bug:

BUG: kernel NULL pointer dereference, address: 0 [...]
RIP: 0010:queue_work_on+0x17/0x40
Code: fd ff ff 44 89 e0 5d 41 5c c3 [...]
Call Trace:
 handle_hpd_rx_irq+0x26e/0x320 [amdgpu]
 ? _raw_spin_unlock_irq+0x1d/0x30
 dm_irq_work_func+0x49/0x60 [amdgpu]
 process_one_work+0x1e1/0x3d0
 [...]

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
