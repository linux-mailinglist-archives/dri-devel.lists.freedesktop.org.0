Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C7B44730B
	for <lists+dri-devel@lfdr.de>; Sun,  7 Nov 2021 14:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A01E6E09A;
	Sun,  7 Nov 2021 13:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B256E09A
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Nov 2021 13:21:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7849C6120D
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Nov 2021 13:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636291288;
 bh=DVe7LXwzF+IK/K4SIBseulnz1v1tXMaksNLWgsTJBh4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=AenS9yMBCOWAioJT36xbT46CRuAzxg43oF++RPyZzWY5GCg+TyLTM5l/T83HQjUhw
 8fDcu+QI/BpOcHXWAO3p0NxzmXf2Mrt8ZsIt0TYopNg9LDPRUBu44DK0MrjqoD+Vec
 Zhzu8i5T4rFRQDMsLmU2UOnbNSY6vosoCNc8K7cq5TkumwSYrxbKI+NXI56HuAAI3+
 +gbI4GFztw6cI+8YhDZWoOl62F2ery4QHRsJyTPNuT0auhbb+AoEuDjVVOUWK0fUOS
 h0a3fJRDwhTa7RhfR2zaAo9ubQDhjzvH5Dwd79VX0MUHao99UC6VH1yNxbxQsZ1nAr
 HM+KIT3xwL9RQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 708E960FE7; Sun,  7 Nov 2021 13:21:28 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214921] amdgpu hangs HP Laptop on shutdown
Date: Sun, 07 Nov 2021 13:21:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-214921-2300-iCkwPp2XCQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214921-2300@https.bugzilla.kernel.org/>
References: <bug-214921-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214921

spasswolf@web.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.15                        |5.15, 5.15.1

--- Comment #3 from spasswolf@web.de ---
Shutdown still hangs with linux-5.15.1.
This fixes the shutdown issue for me:
diff -aur linux-5.15.1.orig/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
linux-5.15.1/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
--- linux-5.15.1.orig/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c     2021-11-06
14:13:31.000000000 +0100
+++ linux-5.15.1/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c  2021-11-07
14:19:39.194630084 +0100
@@ -554,18 +554,6 @@
         * jobs for clockgating/powergating/dpm setting to
         * ->set_powergating_state().
         */
-       cancel_delayed_work_sync(&adev->uvd.idle_work);
-
-       if (adev->pm.dpm_enabled) {
-               amdgpu_dpm_enable_uvd(adev, false);
-       } else {
-               amdgpu_asic_set_uvd_clocks(adev, 0, 0);
-               /* shutdown the UVD block */
-               amdgpu_device_ip_set_powergating_state(adev,
AMD_IP_BLOCK_TYPE_UVD,
-                                                      AMD_PG_STATE_GATE);
-               amdgpu_device_ip_set_clockgating_state(adev,
AMD_IP_BLOCK_TYPE_UVD,
-                                                      AMD_CG_STATE_GATE);
-       }

        if (RREG32(mmUVD_STATUS) !=3D 0)
                uvd_v6_0_stop(adev);

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
