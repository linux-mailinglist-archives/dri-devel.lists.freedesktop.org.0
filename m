Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E520577CF7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 10:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B0A91AB9;
	Mon, 18 Jul 2022 08:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A90FA0D0D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 01:59:33 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LmQ7q2J8JzkWMf;
 Mon, 18 Jul 2022 09:57:11 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 18 Jul 2022 09:59:30 +0800
Received: from huawei.com (10.174.179.164) by kwepemm600010.china.huawei.com
 (7.193.23.86) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 18 Jul
 2022 09:59:29 +0800
From: Liu Zixian <liuzixian4@huawei.com>
To: <airlied@linux.ie>, <kraxel@redhat.com>, <gurchetansingh@chromium.org>,
 <olvaffe@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH] virtio: fix error handling in virtio_gpu_object_shmem_init
Date: Mon, 18 Jul 2022 09:59:28 +0800
Message-ID: <20220718015928.1776-1-liuzixian4@huawei.com>
X-Mailer: git-send-email 2.29.2.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.179.164]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 18 Jul 2022 08:00:04 +0000
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
Cc: linfeilong@huawei.com, chenhaixiang3@huawei.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This bug is found by syzkaller

FAULT_INJECTION: forcing a failure.
[ 3495.302071][T275065]  show_stack+0x34/0x4c
[ 3495.310070][T275065]  dump_stack+0x158/0x1e4
[ 3495.318006][T275065]  should_fail+0x334/0x380
[ 3495.326077][T275065]  __should_failslab+0x90/0xf0
[ 3495.334183][T275065]  should_failslab+0x18/0x30
[ 3495.342284][T275065]  kmem_cache_alloc_trace+0x7c/0x6c4
[ 3495.350492][T275065]  drm_prime_pages_to_sg+0x50/0x110
[ 3495.358599][T275065]  drm_gem_shmem_get_sg_table+0x6c/0x90
[ 3495.366568][T275065]  virtio_gpu_object_shmem_init+0x78/0x3d0 [virtio_gpu]
[ 3495.374684][T275065]  virtio_gpu_object_create+0x1cc/0x340 [virtio_gpu]
[ 3495.382618][T275065]  virtio_gpu_gem_create.constprop.0+0xb0/0x1f0 [virtio_gpu]
[ 3495.390580][T275065]  virtio_gpu_mode_dumb_create+0x160/0x1e0 [virtio_gpu]
[ 3495.398381][T275065]  drm_mode_create_dumb+0x120/0x190
[ 3495.405851][T275065]  drm_mode_create_dumb_ioctl+0x3c/0x50
[ 3495.413197][T275065]  drm_ioctl_kernel+0x17c/0x1d0

[ 3495.911669][T275065] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[ 3499.250121][T275065] Call trace:
[ 3499.261543][T275065]  machine_kexec+0x6c/0x46c
[ 3499.272934][T275065]  __crash_kexec+0xf0/0x1c0
[ 3499.284179][T275065]  panic+0x50c/0x788
[ 3499.295285][T275065]  die+0x388/0x390
[ 3499.306282][T275065]  die_kernel_fault+0x70/0x8c
[ 3499.317299][T275065]  __do_kernel_fault+0xf0/0x1d0
[ 3499.328290][T275065]  do_page_fault+0x300/0x7ac
[ 3499.339207][T275065]  do_translation_fault+0x164/0x1c0
[ 3499.350202][T275065]  do_mem_abort+0x6c/0x110
[ 3499.361048][T275065]  el1_abort+0xa0/0x120
[ 3499.371921][T275065]  el1_sync_handler+0x104/0x140
[ 3499.382683][T275065]  el1_sync+0x74/0x100
[ 3499.393051][T275065]  virtio_gpu_object_shmem_init+0x98/0x3d0 [virtio_gpu]
[ 3499.403641][T275065]  virtio_gpu_object_create+0x1cc/0x340 [virtio_gpu]
[ 3499.413874][T275065]  virtio_gpu_gem_create.constprop.0+0xb0/0x1f0 [virtio_gpu]
[ 3499.424063][T275065]  virtio_gpu_mode_dumb_create+0x160/0x1e0 [virtio_gpu]
[ 3499.433817][T275065]  drm_mode_create_dumb+0x120/0x190
[ 3499.443035][T275065]  drm_mode_create_dumb_ioctl+0x3c/0x50
[ 3499.451951][T275065]  drm_ioctl_kernel+0x17c/0x1d0
[ 3499.460309][T275065]  drm_ioctl+0x450/0x7a4
[ 3499.468274][T275065]  __arm64_sys_ioctl+0x100/0x150
[ 3499.476173][T275065]  invoke_syscall+0x64/0x100
[ 3499.483709][T275065]  el0_svc_common.constprop.0+0x220/0x230
[ 3499.491157][T275065]  do_el0_svc+0xb4/0xd4
[ 3499.498149][T275065]  el0_svc+0x24/0x3c
[ 3499.504624][T275065]  el0_sync_handler+0x160/0x164
[ 3499.511079][T275065]  el0_sync+0x160/0x180

Signed-off-by: chenhaixiang <chenhaixiang3@huawei.com>
Signed-off-by: Liu Zixian <liuzixian4@huawei.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index f293e6ad5..a3681b5c8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -168,7 +168,8 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	 * since virtio_gpu doesn't support dma-buf import from other devices.
 	 */
 	shmem->pages = drm_gem_shmem_get_sg_table(&bo->base);
-	if (!shmem->pages) {
+	if (IS_ERR(shmem->pages)) {
+		shmem->pages = NULL;
 		drm_gem_shmem_unpin(&bo->base);
 		return -EINVAL;
 	}
-- 
2.33.0

