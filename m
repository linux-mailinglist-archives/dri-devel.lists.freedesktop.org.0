Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 233234119DF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 18:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856746E575;
	Mon, 20 Sep 2021 16:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE116E575
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 16:35:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E5F28611C2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 16:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632155710;
 bh=pWTlrPA+C9viYp744RRuu+I/p988HmcP4Thrhg083RE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oPXn9z78JbmIwGGWIozW1qGO7+siA9efWSv7yC5483h0W+gQYnYC44mNg8wcrECxJ
 AM+ljaPQrnJwbUei4wMXBJ9kvDltf+IBF8xwCXo9sFl3h8OvIVTFgDw5cYHFSyL6Ql
 dNcJGnktVMK8vfWVrRyHMYjnjtnZcOc9Jlz29FIdlU7J2cv/fEriBtbgU4EmkD/3wZ
 pVZu20l9WrR5lAGcJ4yNCvElYblyvBDI3ToMkJhsKGDtSs1H+dhBYol3aW5A4aS02Z
 XYt+O8X4xGw8cvp7E2jTOOKo95M/yGOAC+QlAVzon8+1ZveXThtU0cAhkOCQH09sEi
 9xHJmpWpSebgg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E2C3360F42; Mon, 20 Sep 2021 16:35:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [NAVI] Several memory leaks in amdgpu and ttm
Date: Mon, 20 Sep 2021 16:35:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214029-2300-sidSrNwruP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214029-2300@https.bugzilla.kernel.org/>
References: <bug-214029-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214029

--- Comment #13 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 298897
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298897&action=3Dedit
bisect.log

Verified that the issue still exists in latest v5.15-rc2 and v5.14.6 and di=
d a
bisect:

# possible first bad commit: [355b60296143a090039211c5f0e1463f84aab65a] Mer=
ge
drm/drm-next into drm-misc-next
# possible first bad commit: [91185d55b32e7e377f15fb46a62b216f8d3038d4] drm:
Remove DRM_KMS_FB_HELPER Kconfig option
# possible first bad commit: [a50e74bec1d17e95275909660c6b43ffe11ebcf0]
drm/zte: Don't select DRM_KMS_FB_HELPER
# possible first bad commit: [13b29cc3a722c2c0bc9ab9f72f9047d55d08a2f9]
drm/mxsfb: Don't select DRM_KMS_FB_HELPER
# possible first bad commit: [5dbf2fc587cb79cb366bd6e79ac6b52269d64fc5]
drm/vmwgfx: Make console emulation depend on DRM_FBDEV_EMULATION
# possible first bad commit: [c777dc9e793342ecdfc95045d2127a3ea32791a0]
drm/ttm: move the page_alignment into the BO v2
# possible first bad commit: [65747ded86b4608387d5618d14f0fe9dc88e17ea]
drm/ttm: minor range manager coding style clean ups
# possible first bad commit: [d02117f8efaa5fbc37437df1ae955a147a2a424a]
drm/ttm: remove special handling for non GEM drivers
# possible first bad commit: [13ea9aa1e7d891e950230e82f1dd2c84e5debcff]
drm/ttm: fix error handling if no BO can be swapped out v4
# possible first bad commit: [ae053fa234f42b4abc582372af7410ad0e3e1dad] drm:
bridge: adv7511: Support I2S IEC958 encoded PCM format

I had to skip a few commits as kmemleak did not properly work for some comm=
its
due to:
[...]
[    0.706509] kmemleak: Cannot insert 0xffff953c1ba02f40 into the object
search tree (overlaps existing)
[    0.706514] CPU: 0 PID: 6 Comm: kthreadd Not tainted 5.12.0-rc3-bdver2+ =
#24
[    0.706518] Hardware name: Gigabyte Technology Co., Ltd. To be filled by
O.E.M./970-GAMING, BIOS F2 04/06/2016
[    0.706521] Call Trace:
[    0.706524]  dump_stack+0x69/0x8e
[    0.706531]  create_object.isra.0.cold+0x3b/0x5d
[    0.706536]  ? kthread+0x35/0x130
[    0.706537]  kmem_cache_alloc+0x15a/0x4a0
[    0.706537]  ? rescuer_thread+0x380/0x380
[    0.706537]  kthread+0x35/0x130
[    0.706537]  ? __kthread_bind_mask+0x60/0x60
[    0.706537]  ret_from_fork+0x22/0x30
[    0.706537] kmemleak: Kernel memory leak detector disabled
[    0.706537] kmemleak: Object 0xffff953c1ba00000 (size 2097152):
[    0.706537] kmemleak:   comm "swapper", pid 0, jiffies 4294877296
[    0.706537] kmemleak:   min_count =3D 0
[    0.706537] kmemleak:   count =3D 0
[    0.706537] kmemleak:   flags =3D 0x1
[    0.706537] kmemleak:   checksum =3D 0
[    0.706537] kmemleak:   backtrace:
[    0.706537]      memblock_alloc_internal+0xb8/0x152
[    0.706537]      memblock_alloc_try_nid+0xa0/0xf3
[    0.706537]      kfence_alloc_pool+0x59/0xbf
[    0.706537]      start_kernel+0x2b3/0x61a
[    0.706537]      secondary_startup_64_no_verify+0xb0/0xbb

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
