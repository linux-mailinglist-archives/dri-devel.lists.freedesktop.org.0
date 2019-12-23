Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4077A129116
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 04:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5AA6E0FA;
	Mon, 23 Dec 2019 03:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE1D6E0FA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 03:09:05 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 08CFA4AA360AF4319B8D;
 Mon, 23 Dec 2019 11:09:01 +0800 (CST)
Received: from localhost (10.45.239.209) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Mon, 23 Dec 2019
 11:08:54 +0800
From: Zhihui Chen <chenzhihui4@huawei.com>
To: <xinliang.liu@linaro.org>, <zourongrong@gmail.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/hisilicon/hibmc: set obj[0] field when creating fb
Date: Mon, 23 Dec 2019 11:08:46 +0800
Message-ID: <20191223030846.967-1-chenzhihui4@huawei.com>
X-Mailer: git-send-email 2.24.1.windows.2
MIME-Version: 1.0
X-Originating-IP: [10.45.239.209]
X-CFilter-Loop: Reflected
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
Cc: Zhihui Chen <chenzhihui4@huawei.com>, puck.chen@hisilicon.com,
 baowenyi@huawei.com, kong.kongxinwei@hisilicon.com, tzimmermann@suse.de,
 allan.wang@siliconmotion.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

without the obj[0] set, we can see the following panic:

[   29.236764] pstate: 20400009 (nzCv daif +PAN -UAO)
[   29.241532] pc : drm_gem_vram_offset+0x10/0x28 [drm_vram_helper]
[   29.247511] lr : hibmc_plane_atomic_update+0x30/0xe0 [hibmc_drm]
[   29.253490] sp : ffff003fab713a50
[   29.256789] x29: ffff003fab713a50 x28: 0000000000000028
[   29.262077] x27: 0000000000000018 x26: 0000aaaaced52780
[   29.267363] x25: ffff203f98dcde00 x24: 0000000000000001
[   29.272650] x23: 0000000000000001 x22: 0000000000000000
[   29.277937] x21: 0000000000000000 x20: ffff002fb4899580
[   29.283224] x19: ffff003fb8767c00 x18: 0000000000000000
[   29.288510] x17: 0000000000000000 x16: 0000000000000000
[   29.293797] x15: 0000000000000010 x14: 332d4341443a3433
[   29.299084] x13: 3a5245444f434e45 x12: 5b206e6f20746573
[   29.304371] x11: 65646f6d205d7365 x10: 6c62617369645f74
[   29.309657] x9 : ffff800008e4d650 x8 : ffff8000107241d0
[   29.314944] x7 : 0000000000000000 x6 : ffff003fb8766400
[   29.320231] x5 : ffff003fb8767c00 x4 : ffff800008e4f320
[   29.325517] x3 : ffff002fb3ae5080 x2 : ffff002fb3ae0000
[   29.330804] x1 : 0000000000000000 x0 : ffff002fb07f5c00
[   29.336090] Call trace:
[   29.338528]  drm_gem_vram_offset+0x10/0x28 [drm_vram_helper]
[   29.344160]  drm_atomic_helper_commit_planes+0x144/0x228
[   29.349447]  drm_atomic_helper_commit_tail+0x38/0x78
[   29.354389]  commit_tail+0xb4/0x160
[   29.357861]  drm_atomic_helper_commit+0x134/0x168
[   29.362543]  drm_atomic_commit+0x50/0x60
[   29.366448]  drm_mode_atomic_ioctl+0x724/0xb00
[   29.370871]  drm_ioctl_kernel+0x98/0xe8
[   29.374690]  drm_ioctl+0x26c/0x3d0
[   29.378077]  do_vfs_ioctl+0xafc/0xbb0
[   29.381722]  ksys_ioctl+0x64/0x98
[   29.385022]  __arm64_sys_ioctl+0x24/0x50
[   29.388929]  el0_svc_common.constprop.3+0xf0/0x158
[   29.393697]  el0_svc_handler+0x68/0x80
[   29.397429]  el0_sync_handler+0xa8/0x198
[   29.401333]  el0_sync+0x140/0x180
[   29.404632] ---[ end trace 4ba9406972d937dd ]---
[   29.409245] Unexpected kernel BRK exception at EL1

Signed-off-by: Zhihui Chen <chenzhihui4@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
index 21b684eab5c9..19dc525a73b0 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
@@ -126,6 +126,7 @@ hibmc_framebuffer_init(struct drm_device *dev,
 
 	drm_helper_mode_fill_fb_struct(dev, &hibmc_fb->fb, mode_cmd);
 	hibmc_fb->obj = obj;
+	hibmc_fb->fb.obj[0] = obj;
 	ret = drm_framebuffer_init(dev, &hibmc_fb->fb, &hibmc_fb_funcs);
 	if (ret) {
 		DRM_ERROR("drm_framebuffer_init failed: %d\n", ret);
-- 
2.20.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
