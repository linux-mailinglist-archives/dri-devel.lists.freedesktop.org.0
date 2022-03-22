Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0794E50DD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 12:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD75610E68A;
	Wed, 23 Mar 2022 11:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nksmu.kylinos.cn (mailgw.kylinos.cn [123.150.8.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F49A10E132;
 Wed, 23 Mar 2022 01:40:54 +0000 (UTC)
X-UUID: 960d29f9923b4af39f5484ce89d4bd1e-20220322
X-Spam-Fingerprint: 0
X-GW-Reason: 11101
X-Policy-Incident: 5pS25Lu25Lq66LaF6L+HNeS6uumcgOimgeWuoeaguA==
X-Content-Feature: ica/max.line-size 90 audit/email.address 1 meta/cnt.alert 1
X-UUID: 960d29f9923b4af39f5484ce89d4bd1e-20220322
Received: from cs2c.com.cn [(172.17.111.24)] by nksmu.kylinos.cn
 (envelope-from <liucong2@kylinos.cn>) (Generic MTA)
 with ESMTP id 1249335721; Tue, 22 Mar 2022 17:35:30 +0800
X-ns-mid: postfix-6239988C-8900507457
Received: from localhost.localdomain (unknown [172.20.12.219])
 by cs2c.com.cn (NSMail) with ESMTPA id 9DE5B383C640;
 Tue, 22 Mar 2022 09:36:12 +0000 (UTC)
From: Cong Liu <liucong2@kylinos.cn>
To: airlied@redhat.com, kraxel@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 christian.koenig@amd.com, ray.huang@amd.com,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v1 2/2] drm/ttm: enable ioremap buffer according to TTM mem
 caching setting for arm64
Date: Tue, 22 Mar 2022 17:34:44 +0800
Message-Id: <20220322093444.1236582-2-liucong2@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322093444.1236582-1-liucong2@kylinos.cn>
References: <20220322093444.1236582-1-liucong2@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 23 Mar 2022 11:01:42 +0000
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
Cc: Cong Liu <liucong2@kylinos.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arm64 also need the function in commit b849bec29a99 ("drm/ttm:
ioremap buffer according to TTM mem caching setting"), so enable
it. The following Call Trace captured in arm64 with qxl card.

[    5.609923] Hardware name: QEMU KVM Virtual Machine, BIOS 0.0.0 02/06/2015
[    5.610592] pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    5.611271] pc : __memset+0x90/0x188
[    5.611641] lr : qxl_create_monitors_object+0xe0/0x180 [qxl]
[    5.612208] sp : ffff800012cd37a0
[    5.612533] x29: ffff800012cd37a0 x28: 0000000000000000 x27: 0000000000000001
[    5.613228] x26: ffff800012cd3d30 x25: ffffb70116ef5f10 x24: ffffb70116ef5ed8
[    5.613953] x23: ffffb70116ef5000 x22: 0000000000000000 x21: ffff000300020000
[    5.614645] x20: ffff0003008e4000 x19: 0000000000000074 x18: 0000000000000014
[    5.615331] x17: 0000000038ca76f1 x16: ffffb70138fd0600 x15: ffffb7013b1a9950
[    5.616018] x14: ffff800010000000 x13: ffffb7013a8a2d78 x12: ffffb7013a8a2d78
[    5.616709] x11: ffffb7013a8aa767 x10: 0000000000000000 x9 : ffffb701398fc5bc
[    5.617409] x8 : ffff8000100ad074 x7 : 0000000000000000 x6 : 0000000000000002
[    5.618206] x5 : ffff0003008e50b0 x4 : 0000000000000000 x3 : 0000000000000030
[    5.618933] x2 : 0000000000000004 x1 : 0000000000000000 x0 : ffff8000100ad000
[    5.619624] Call trace:
[    5.619872]  __memset+0x90/0x188
[    5.620188]  qxl_modeset_init+0x4c/0x320 [qxl]
[    5.620627]  qxl_pci_probe+0x11c/0x1d0 [qxl]
[    5.621029]  local_pci_probe+0x48/0xb8
[    5.621390]  pci_device_probe+0x194/0x208
[    5.621762]  really_probe+0xd0/0x458
[    5.622122]  __driver_probe_device+0x124/0x1c0
[    5.622534]  driver_probe_device+0x48/0x130
[    5.622923]  __driver_attach+0xc4/0x1a8
[    5.623280]  bus_for_each_dev+0x78/0xd0
[    5.623636]  driver_attach+0x2c/0x38
[    5.623969]  bus_add_driver+0x154/0x248
[    5.624324]  driver_register+0x6c/0x128
[    5.624678]  __pci_register_driver+0x4c/0x58
[    5.625072]  qxl_init+0x48/0x1000 [qxl]
[    5.625439]  do_one_initcall+0x50/0x240
[    5.625825]  do_init_module+0x60/0x238
[    5.626189]  load_module+0x2458/0x2900
[    5.626543]  __do_sys_finit_module+0xbc/0x128
[    5.626952]  __arm64_sys_finit_module+0x28/0x38
[    5.627384]  invoke_syscall+0x74/0xf0
[    5.627732]  el0_svc_common.constprop.0+0x58/0x1a8
[    5.628190]  do_el0_svc+0x2c/0x90
[    5.628503]  el0_svc+0x40/0x190
[    5.628811]  el0t_64_sync_handler+0xb0/0xb8
[    5.629206]  el0t_64_sync+0x1a4/0x1a8
[    5.629552] Code: a8811d07 f2400c42 b4000062 8b020108 (a93f1d07)
[    5.630152] ---[ end trace 35a380fcdcd5b8f7 ]---

Signed-off-by: Cong Liu <liucong2@kylinos.cn>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 72a94301bc95..3df96e76c424 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -281,7 +281,7 @@ static int ttm_bo_ioremap(struct ttm_buffer_object *bo,
 		map->bo_kmap_type = ttm_bo_map_iomap;
 		if (mem->bus.caching == ttm_write_combined)
 			map->virtual = ioremap_wc(res, size);
-#ifdef CONFIG_X86
+#if (defined CONFIG_X86) || (defined CONFIG_ARM64)
 		else if (mem->bus.caching == ttm_cached)
 			map->virtual = ioremap_cache(res, size);
 #endif
@@ -402,7 +402,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
 		else if (mem->bus.caching == ttm_write_combined)
 			vaddr_iomem = ioremap_wc(mem->bus.offset,
 						 bo->base.size);
-#ifdef CONFIG_X86
+#if (defined CONFIG_X86) || (defined CONFIG_ARM64)
 		else if (mem->bus.caching == ttm_cached)
 			vaddr_iomem = ioremap_cache(mem->bus.offset,
 						  bo->base.size);
-- 
2.25.1

