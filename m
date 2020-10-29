Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C6C29ECBE
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 14:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBAAD6E8B1;
	Thu, 29 Oct 2020 13:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EDC6E8B1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 13:22:24 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209939] New: radeontop causes kernel panic
Date: Thu, 29 Oct 2020 13:22:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: janpieter.sollie@edpnet.be
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-209939-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209939

            Bug ID: 209939
           Summary: radeontop causes kernel panic
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.9.1
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: janpieter.sollie@edpnet.be
        Regression: No

Created attachment 293297
  --> https://bugzilla.kernel.org/attachment.cgi?id=293297&action=edit
kernel .config file of 3 PCs

(view 3 .config files)
> PC1: problem pc, Ryzen 2400GE APU with Vega 11 and 5.9.1 kernel (Xorg
> running)
> PC2: working pc, ryzen V1605 APU with vega 8 and 5.8.14 kernel (Xorg running)
> PC3: working pc, Threadripper 1950 + Fiji GPU and 5.9.1 kernel (CLI only)

As the subject states: on PC1, the kernel can't handle the radeontop program,
one way or another, these methods work / do not on PC1:
> - while hardware-accelerated content is running, panic
> - When in console mode, it's fine
> - when switching from console to X, it's fine for a few moments
> - when trying it early (X running sddm, radeontop via ssh), panic

with *panic*, I mean: the PC does not react anymore: the num lock trigger is no
longer working, no input is accepted, the clock on the GUI does not change
anymore, no SSH.

I tried everything:
> - pstore is empty
> - dd if=/dev/kmsg of=/dev/sdb1 & while [ 1]; do echo s > /proc/sysrq-trigger;
> sleep 10; done & radeontop (and pulling it out of this partition afterwards)

The mainboard does not have a RS232 port, so debugging this way is not
possible;
also, I doubt I'd be able to use KDB if the screen stucks at GUI mode ...

If I can do anything to gather more info, let me know

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
