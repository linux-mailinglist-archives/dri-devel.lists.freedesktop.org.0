Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F473537E0D
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63CB910E920;
	Mon, 30 May 2022 13:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B1F10E74D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 13:38:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF19260DDE;
 Mon, 30 May 2022 13:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381BCC3411A;
 Mon, 30 May 2022 13:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653917912;
 bh=RJbgNwALSTmalG7CgWu4bWgSiJ9N0y2sew5DPuI6QgU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l+PTqhPBWIuC3m3SIo6g+P3eoPb5v4AsOdRyiJZ+p0aUwrmpCjFx5f+MIxzeOTQvp
 EDtuk0XFAKhVtFzD2c66KsVKuSshUVakqzaGtu1AWh7SLRs5njVW2CJHFlKTI76oBJ
 aPFV5B381z7MvRQIwhMf+UJNWsS0NfKOTlC7sLLKlUw0NugNOsNvBcOp8dlhiGVaix
 GGQDYw7PTT90Z95cj82mKfrcmUmsdd9wB+6LP9YgsVz3Yc4/P5E9fjKfLonZBM8tSr
 1Qp7dN/ne6kgLow/P8C661bLOiP5WoZncG5+kYOUOIX7b3rSX9yKd9tritujDKF9RN
 U5IncQH8m0c9Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 003/109] drm/virtio: fix NULL pointer dereference
 in virtio_gpu_conn_get_modes
Date: Mon, 30 May 2022 09:36:39 -0400
Message-Id: <20220530133825.1933431-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133825.1933431-1-sashal@kernel.org>
References: <20220530133825.1933431-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 Liu Zixian <liuzixian4@huawei.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Liu Zixian <liuzixian4@huawei.com>

[ Upstream commit 194d250cdc4a40ccbd179afd522a9e9846957402 ]

drm_cvt_mode may return NULL and we should check it.

This bug is found by syzkaller:

FAULT_INJECTION stacktrace:
[  168.567394] FAULT_INJECTION: forcing a failure.
name failslab, interval 1, probability 0, space 0, times 1
[  168.567403] CPU: 1 PID: 6425 Comm: syz Kdump: loaded Not tainted 4.19.90-vhulk2201.1.0.h1035.kasan.eulerosv2r10.aarch64 #1
[  168.567406] Hardware name: QEMU KVM Virtual Machine, BIOS 0.0.0 02/06/2015
[  168.567408] Call trace:
[  168.567414]  dump_backtrace+0x0/0x310
[  168.567418]  show_stack+0x28/0x38
[  168.567423]  dump_stack+0xec/0x15c
[  168.567427]  should_fail+0x3ac/0x3d0
[  168.567437]  __should_failslab+0xb8/0x120
[  168.567441]  should_failslab+0x28/0xc0
[  168.567445]  kmem_cache_alloc_trace+0x50/0x640
[  168.567454]  drm_mode_create+0x40/0x90
[  168.567458]  drm_cvt_mode+0x48/0xc78
[  168.567477]  virtio_gpu_conn_get_modes+0xa8/0x140 [virtio_gpu]
[  168.567485]  drm_helper_probe_single_connector_modes+0x3a4/0xd80
[  168.567492]  drm_mode_getconnector+0x2e0/0xa70
[  168.567496]  drm_ioctl_kernel+0x11c/0x1d8
[  168.567514]  drm_ioctl+0x558/0x6d0
[  168.567522]  do_vfs_ioctl+0x160/0xf30
[  168.567525]  ksys_ioctl+0x98/0xd8
[  168.567530]  __arm64_sys_ioctl+0x50/0xc8
[  168.567536]  el0_svc_common+0xc8/0x320
[  168.567540]  el0_svc_handler+0xf8/0x160
[  168.567544]  el0_svc+0x10/0x218

KASAN stacktrace:
[  168.567561] BUG: KASAN: null-ptr-deref in virtio_gpu_conn_get_modes+0xb4/0x140 [virtio_gpu]
[  168.567565] Read of size 4 at addr 0000000000000054 by task syz/6425
[  168.567566]
[  168.567571] CPU: 1 PID: 6425 Comm: syz Kdump: loaded Not tainted 4.19.90-vhulk2201.1.0.h1035.kasan.eulerosv2r10.aarch64 #1
[  168.567573] Hardware name: QEMU KVM Virtual Machine, BIOS 0.0.0 02/06/2015
[  168.567575] Call trace:
[  168.567578]  dump_backtrace+0x0/0x310
[  168.567582]  show_stack+0x28/0x38
[  168.567586]  dump_stack+0xec/0x15c
[  168.567591]  kasan_report+0x244/0x2f0
[  168.567594]  __asan_load4+0x58/0xb0
[  168.567607]  virtio_gpu_conn_get_modes+0xb4/0x140 [virtio_gpu]
[  168.567612]  drm_helper_probe_single_connector_modes+0x3a4/0xd80
[  168.567617]  drm_mode_getconnector+0x2e0/0xa70
[  168.567621]  drm_ioctl_kernel+0x11c/0x1d8
[  168.567624]  drm_ioctl+0x558/0x6d0
[  168.567628]  do_vfs_ioctl+0x160/0xf30
[  168.567632]  ksys_ioctl+0x98/0xd8
[  168.567636]  __arm64_sys_ioctl+0x50/0xc8
[  168.567641]  el0_svc_common+0xc8/0x320
[  168.567645]  el0_svc_handler+0xf8/0x160
[  168.567649]  el0_svc+0x10/0x218

Signed-off-by: Liu Zixian <liuzixian4@huawei.com>
Link: http://patchwork.freedesktop.org/patch/msgid/20220322091730.1653-1-liuzixian4@huawei.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index a6caebd4a0dd..ef1f19083cd3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -179,6 +179,8 @@ static int virtio_gpu_conn_get_modes(struct drm_connector *connector)
 		DRM_DEBUG("add mode: %dx%d\n", width, height);
 		mode = drm_cvt_mode(connector->dev, width, height, 60,
 				    false, false, false);
+		if (!mode)
+			return count;
 		mode->type |= DRM_MODE_TYPE_PREFERRED;
 		drm_mode_probed_add(connector, mode);
 		count++;
-- 
2.35.1

