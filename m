Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF1F228254
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 16:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275006E581;
	Tue, 21 Jul 2020 14:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD91D6E581
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 14:35:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208647] New: persistent amdgpu: [mmhub] page faults
Date: Tue, 21 Jul 2020 14:35:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jay.foad@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-208647-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=208647

            Bug ID: 208647
           Summary: persistent amdgpu: [mmhub] page faults
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.0-42-generic
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: jay.foad@gmail.com
        Regression: No

Whenever X is running I get persistent page faults like this:

Jul 21 15:19:16 jay-X470-AORUS-ULTRA-GAMING kernel: amdgpu 0000:0c:00.0:
amdgpu: [mmhub] page fault (src_id:0 ring:169 vmid:0 pasid:0, for process  pid
0 thread  pid 0)
Jul 21 15:19:16 jay-X470-AORUS-ULTRA-GAMING kernel: amdgpu 0000:0c:00.0:
amdgpu:   in page starting at address 0x00000000fffb0000 from client 18
Jul 21 15:19:16 jay-X470-AORUS-ULTRA-GAMING kernel: amdgpu 0000:0c:00.0:
amdgpu: GCVM_L2_PROTECTION_FAULT_STATUS:0x00041F52
Jul 21 15:19:16 jay-X470-AORUS-ULTRA-GAMING kernel: amdgpu 0000:0c:00.0:
amdgpu:          Faulty UTCL2 client ID: 0xf
Jul 21 15:19:16 jay-X470-AORUS-ULTRA-GAMING kernel: amdgpu 0000:0c:00.0:
amdgpu:          MORE_FAULTS: 0x0
Jul 21 15:19:16 jay-X470-AORUS-ULTRA-GAMING kernel: amdgpu 0000:0c:00.0:
amdgpu:          WALKER_ERROR: 0x1
Jul 21 15:19:16 jay-X470-AORUS-ULTRA-GAMING kernel: amdgpu 0000:0c:00.0:
amdgpu:          PERMISSION_FAULTS: 0x5
Jul 21 15:19:16 jay-X470-AORUS-ULTRA-GAMING kernel: amdgpu 0000:0c:00.0:
amdgpu:          MAPPING_ERROR: 0x1
Jul 21 15:19:16 jay-X470-AORUS-ULTRA-GAMING kernel: amdgpu 0000:0c:00.0:
amdgpu:          RW: 0x1

Sometimes I get several of these per second. Sometimes there are none for a few
minutes.

If I boot into runlevel 3 (i.e. without starting X) I get one of these during
boot, but then there are no more after that.

I'm running Ubuntu 20.04 but I also saw this on 18.04.

Kernel version is 5.4.0-42-generic but I also saw this with 5.3.0-51-generic.

I'm using the amdgpu-pro drivers.

Graphics card is a Navi 10.

Motherboard is a Gigabyte X470 AORUS ULTRA GAMING.

CPU is an AMD Ryzen 9 3900X.

A very similar sounding bug was reported here:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1888116

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
