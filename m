Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 571DA245165
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 18:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9766E3B7;
	Sat, 15 Aug 2020 16:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCCE6E3B7
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 16:16:53 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204609] amdgpu: powerplay failed send message
Date: Sat, 15 Aug 2020 16:16:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: work@hllmnn.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204609-2300-hKhB2M9qas@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204609-2300@https.bugzilla.kernel.org/>
References: <bug-204609-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=204609

work@hllmnn.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |work@hllmnn.de

--- Comment #9 from work@hllmnn.de ---
I can reproduce this bug with kernel 5.7.0 from Debian bullseye (5.7.0-2-amd64)
when using a dual monitor setup. If I boot with only one monitor connected and
connect the second one later, everything seems to work fine. Both monitors are
connected via DisplayPort, but it does not change anything if I connect one of
them via HDMI.

The significant errors in dmesg read:

Aug 15 17:15:03 dino kernel: failed send message: TransferTableSmu2Dram (18)   
     param: 0x00000006 response 0xffffffc2
Aug 15 17:15:03 dino kernel: Failed to export SMU metrics table!
Aug 15 17:15:05 dino kernel: Msg issuing pre-check failed and SMU may be not in
the right state!
Aug 15 17:15:05 dino kernel: [drm:amdgpu_dpm_enable_uvd [amdgpu]] *ERROR* Dpm
enable uvd failed, ret = -62. 
Aug 15 17:15:06 dino kernel: amdgpu 0000:09:00.0: [drm:amdgpu_ib_ring_tests
[amdgpu]] *ERROR* IB test failed on vcn_enc0 (-110).
Aug 15 17:15:07 dino kernel: amdgpu 0000:09:00.0: [drm:amdgpu_ib_ring_tests
[amdgpu]] *ERROR* IB test failed on vcn_enc1 (-110).
Aug 15 17:15:08 dino kernel: Msg issuing pre-check failed and SMU may be not in
the right state!
Aug 15 17:15:08 dino kernel: Failed to export SMU metrics table!
Aug 15 17:15:11 dino kernel: Msg issuing pre-check failed and SMU may be not in
the right state!
Aug 15 17:15:11 dino kernel: [drm:jpeg_v2_0_set_powergating_state [amdgpu]]
*ERROR* Dpm enable jpeg failed, ret = -62. 
Aug 15 17:15:11 dino kernel: [drm:process_one_work] *ERROR* ib ring test failed
(-110).

I am using the firmware files from that commit:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=49e9ea898f870ae09b91ccd3dd1c45d520fcb0c3
(commit date: 2020-08-07)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
