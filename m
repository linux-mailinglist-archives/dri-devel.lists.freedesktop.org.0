Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089E72AC689
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 22:05:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F14789533;
	Mon,  9 Nov 2020 21:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A3689533
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 21:05:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210123] New: drm:drm_atomic_helper_wait_for_dependencies
 [drm_kms_helper]] - flip_done time out with vmwgfx
Date: Mon, 09 Nov 2020 21:05:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stefan+kernel@mayr-stefan.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-210123-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210123

            Bug ID: 210123
           Summary: drm:drm_atomic_helper_wait_for_dependencies
                    [drm_kms_helper]] - flip_done time out with vmwgfx
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.3.18-24.9.1
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: stefan+kernel@mayr-stefan.de
        Regression: No

Since we upgraded SUSE Linux Enterprise Server 15 from kernel 4.12.14-197.45.1
(SLES15 SP1) to 5.3.18-24.9.1 (SLES15 SP2) or later we see the following error
messages on some virtual machines:

[102215.857602] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:38:crtc-0] flip_done timed out
[102226.097847] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [PLANE:34:plane-0] flip_done timed out

We were also provided some more current kernels from SUSE support:
- 5.3.18 with updated modules 
- 5.8.15
- 5.9.1

The issue stays the same. All affected machines are running in runlevel 3. The
only graphical "thing" is the boot screen and when this error appears in the
logs this screen is sitting at an empty login prompt.
All virtual machines are running in a VMware environment on ESXi-Hosts with
versions between 6.0.x and 6.7.x. We could not track it down to specific ESXi
versions, load on the ESXi host or even the virtual machine. This happens on
different versions, loaded and also on idle hosts and virtual machines.

The issue goes away when we add vmwgfx to the grub module_blacklist.

I know our kernel versions are somehow SUSE specific. But what changed between
4.12 and 5.3 and later that may cause this message between drm and vmwgfx?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
