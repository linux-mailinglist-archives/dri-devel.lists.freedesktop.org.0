Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C079F5821
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 21:51:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0717710EA7A;
	Tue, 17 Dec 2024 20:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="p5v+n94e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FCF10EA7A;
 Tue, 17 Dec 2024 20:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MDD/P9JnTcvTSEiE0azCXeoLygAOmmUMZRhHs/CK1pU=; b=p5v+n94eHZdSnFfydK/tyyZ6XN
 s2tiryqOG6thcoECv6z0moaWe7vDLnGion4QyiaXjaeylOogGj0CDku8OISQp1vk62ewlLdb2zP2c
 E9TK1E/9xHg2Atbr2+07b/5b8CyUfRWUgxpOMCk2srLl9eHfyW8vSw2yXaAhs59Kl9oiWngX+vAan
 iAsmdlUd1x4DhrfRk0OllSJVM/xGAPqDDqJ2tzRSPDdhOjczei9+NoErs5qY2abx3U6jB24UdLYTl
 4Az41rY+cXvlnNV9HRm6znqiQe148B6Dk/WiE/Y4WLz4hVmCCpLX1l9C4TY+KT8a4vnJw5gBOPef1
 oA0UfDew==;
Received: from [179.214.71.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tNeWx-004X2k-9t; Tue, 17 Dec 2024 21:50:59 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, zaeem.mohamed@amd.com,
 pekka.paalanen@collabora.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Timur Kristof <timur.kristof@gmail.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Fabio Scaccabarozzi <fsvm88@gmail.com>,
 Matthew Schwartz <mattschwartz@gwmail.gwu.edu>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH 3/3] drm/amd/display: fix divide error in DM plane scale calcs
Date: Tue, 17 Dec 2024 17:45:05 -0300
Message-ID: <20241217205029.39850-4-mwen@igalia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217205029.39850-1-mwen@igalia.com>
References: <20241217205029.39850-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

dm_get_plane_scale doesn't take into account plane scaled size equal to
zero, leading to a kernel oops due to division by zero. Fix by setting
out-scale size as zero when the dst size is zero, similar to what is
done by drm_calc_scale(). This issue started with the introduction of
cursor ovelay mode that uses this function to assess cursor mode changes
via dm_crtc_get_cursor_mode() before checking plane state.

[Dec17 17:14] Oops: divide error: 0000 [#1] PREEMPT SMP NOPTI
[  +0.000018] CPU: 5 PID: 1660 Comm: surface-DP-1 Not tainted 6.10.0+ #231
[  +0.000007] Hardware name: Valve Jupiter/Jupiter, BIOS F7A0131 01/30/2024
[  +0.000004] RIP: 0010:dm_get_plane_scale+0x3f/0x60 [amdgpu]
[  +0.000553] Code: 44 0f b7 41 3a 44 0f b7 49 3e 83 e0 0f 48 0f a3 c2 73 21 69 41 28 e8 03 00 00 31 d2 41 f7 f1 31 d2 89 06 69 41 2c e8 03 00 00 <41> f7 f0 89 07 e9 d7 d8 7e e9 44 89 c8 45 89 c1 41 89 c0 eb d4 66
[  +0.000005] RSP: 0018:ffffa8df0de6b8a0 EFLAGS: 00010246
[  +0.000006] RAX: 00000000000003e8 RBX: ffff9ac65c1f6e00 RCX: ffff9ac65d055500
[  +0.000003] RDX: 0000000000000000 RSI: ffffa8df0de6b8b0 RDI: ffffa8df0de6b8b4
[  +0.000004] RBP: ffff9ac64e7a5800 R08: 0000000000000000 R09: 0000000000000a00
[  +0.000003] R10: 00000000000000ff R11: 0000000000000054 R12: ffff9ac6d0700010
[  +0.000003] R13: ffff9ac65d054f00 R14: ffff9ac65d055500 R15: ffff9ac64e7a60a0
[  +0.000004] FS:  00007f869ea00640(0000) GS:ffff9ac970080000(0000) knlGS:0000000000000000
[  +0.000004] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  +0.000003] CR2: 000055ca701becd0 CR3: 000000010e7f2000 CR4: 0000000000350ef0
[  +0.000004] Call Trace:
[  +0.000007]  <TASK>
[  +0.000006]  ? __die_body.cold+0x19/0x27
[  +0.000009]  ? die+0x2e/0x50
[  +0.000007]  ? do_trap+0xca/0x110
[  +0.000007]  ? do_error_trap+0x6a/0x90
[  +0.000006]  ? dm_get_plane_scale+0x3f/0x60 [amdgpu]
[  +0.000504]  ? exc_divide_error+0x38/0x50
[  +0.000005]  ? dm_get_plane_scale+0x3f/0x60 [amdgpu]
[  +0.000488]  ? asm_exc_divide_error+0x1a/0x20
[  +0.000011]  ? dm_get_plane_scale+0x3f/0x60 [amdgpu]
[  +0.000593]  dm_crtc_get_cursor_mode+0x33f/0x430 [amdgpu]
[  +0.000562]  amdgpu_dm_atomic_check+0x2ef/0x1770 [amdgpu]
[  +0.000501]  drm_atomic_check_only+0x5e1/0xa30 [drm]
[  +0.000047]  drm_mode_atomic_ioctl+0x832/0xcb0 [drm]
[  +0.000050]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10 [drm]
[  +0.000047]  drm_ioctl_kernel+0xb3/0x100 [drm]
[  +0.000062]  drm_ioctl+0x27a/0x4f0 [drm]
[  +0.000049]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10 [drm]
[  +0.000055]  amdgpu_drm_ioctl+0x4e/0x90 [amdgpu]
[  +0.000360]  __x64_sys_ioctl+0x97/0xd0
[  +0.000010]  do_syscall_64+0x82/0x190
[  +0.000008]  ? __pfx_drm_mode_createblob_ioctl+0x10/0x10 [drm]
[  +0.000044]  ? srso_return_thunk+0x5/0x5f
[  +0.000006]  ? drm_ioctl_kernel+0xb3/0x100 [drm]
[  +0.000040]  ? srso_return_thunk+0x5/0x5f
[  +0.000005]  ? __check_object_size+0x50/0x220
[  +0.000007]  ? srso_return_thunk+0x5/0x5f
[  +0.000005]  ? srso_return_thunk+0x5/0x5f
[  +0.000005]  ? drm_ioctl+0x2a4/0x4f0 [drm]
[  +0.000039]  ? __pfx_drm_mode_createblob_ioctl+0x10/0x10 [drm]
[  +0.000043]  ? srso_return_thunk+0x5/0x5f
[  +0.000005]  ? srso_return_thunk+0x5/0x5f
[  +0.000005]  ? __pm_runtime_suspend+0x69/0xc0
[  +0.000006]  ? srso_return_thunk+0x5/0x5f
[  +0.000005]  ? amdgpu_drm_ioctl+0x71/0x90 [amdgpu]
[  +0.000366]  ? srso_return_thunk+0x5/0x5f
[  +0.000006]  ? syscall_exit_to_user_mode+0x77/0x210
[  +0.000007]  ? srso_return_thunk+0x5/0x5f
[  +0.000005]  ? do_syscall_64+0x8e/0x190
[  +0.000006]  ? srso_return_thunk+0x5/0x5f
[  +0.000006]  ? do_syscall_64+0x8e/0x190
[  +0.000006]  ? srso_return_thunk+0x5/0x5f
[  +0.000007]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  +0.000008] RIP: 0033:0x55bb7cd962bc
[  +0.000007] Code: 4c 89 6c 24 18 4c 89 64 24 20 4c 89 74 24 28 0f 57 c0 0f 11 44 24 30 89 c7 48 8d 54 24 08 b8 10 00 00 00 be bc 64 38 c0 0f 05 <49> 89 c7 48 83 3b 00 74 09 4c 89 c7 ff 15 62 64 99 00 48 83 7b 18
[  +0.000005] RSP: 002b:00007f869e9f4da0 EFLAGS: 00000217 ORIG_RAX: 0000000000000010
[  +0.000007] RAX: ffffffffffffffda RBX: 00007f869e9f4fb8 RCX: 000055bb7cd962bc
[  +0.000004] RDX: 00007f869e9f4da8 RSI: 00000000c03864bc RDI: 000000000000003b
[  +0.000003] RBP: 000055bb9ddcbcc0 R08: 00007f86541b9920 R09: 0000000000000009
[  +0.000004] R10: 0000000000000004 R11: 0000000000000217 R12: 00007f865406c6b0
[  +0.000003] R13: 00007f86541b5290 R14: 00007f865410b700 R15: 000055bb9ddcbc18
[  +0.000009]  </TASK>

Fixes: 1b04dcca4fb1 ("drm/amd/display: Introduce overlay cursor mode")
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3729
Reported-by: Fabio Scaccabarozzi <fsvm88@gmail.com>
Co-developed-by: Fabio Scaccabarozzi <fsvm88@gmail.com>
Signed-off-by: Fabio Scaccabarozzi <fsvm88@gmail.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 85f21db6ef24..2c795b867c1c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -11124,8 +11124,8 @@ dm_get_plane_scale(struct drm_plane_state *plane_state,
 	int plane_src_w, plane_src_h;
 
 	dm_get_oriented_plane_size(plane_state, &plane_src_w, &plane_src_h);
-	*out_plane_scale_w = plane_state->crtc_w * 1000 / plane_src_w;
-	*out_plane_scale_h = plane_state->crtc_h * 1000 / plane_src_h;
+	*out_plane_scale_w = plane_src_w ? plane_state->crtc_w * 1000 / plane_src_w : 0;
+	*out_plane_scale_h = plane_src_h ? plane_state->crtc_h * 1000 / plane_src_h : 0;
 }
 
 /*
-- 
2.45.2

