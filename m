Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3047ABD143
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 10:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A51E10E1A5;
	Tue, 20 May 2025 08:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="aKbU4aXS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5165410E1A5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 08:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=t9
 1xLNzhSyKaUPe8nvM+uV+kqDwLnPCNYZZUO0q5FJ4=; b=aKbU4aXSlrUWK2LLEe
 VA+aulr/2SddWVis/G6dZSThJ53NZ61i9A/5utGy9gl7P7T13WEJKbx/XD92dAfE
 tMpVHbEQMV0p7zd7bu+cxVG1QymPG3AFgS7v5cPY39Tyb4Co+V0fXgeoa7TUEFZv
 liIUYq7u+zW8hC9+Ipxd1LWRo=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id
 _____wAn5Tt7NixoSfCGCg--.55132S2; 
 Tue, 20 May 2025 15:59:57 +0800 (CST)
From: oushixiong1025@163.com
To: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>,
 Baihan Li <libaihan@huawei.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Yongbang Shi <shiyongbang@huawei.com>, Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] drm/hisilicon: Fix a NULL pointer access when hibmc_load
 failed
Date: Tue, 20 May 2025 15:59:48 +0800
Message-Id: <20250520075948.399272-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAn5Tt7NixoSfCGCg--.55132S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGF1UuF45Kr1kCr17Xr1kKrg_yoW5Zw15pF
 47XFWakr4vq393JF45JrW09an8Ca1ava429Fn2y3s3ur4qkr1DXr18trW8GF1rJrWkJas5
 ZF4xGw4UZr1DZw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jSlksUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXBtTD2gsLiHUmAAAsc
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

From: Shixiong Ou <oushixiong@kylinos.cn>

[WHY]
If Calling hibmc_mm_init() failed in hibmc_load(), the hibmc_unload()
will access a NULL pointer, as it don't call ww_mutex_init() to
initialize mode_config.connection_mutex but try to lock it when
calling drm_atomic_helper_shutdown().

[   50.939211][  0] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000018
	......
[   51.149882][  0] Call trace:
[   51.152750][  0]  ww_mutex_lock+0xf0/0x1e0
[   51.156829][  0]  drm_modeset_lock+0x184/0x2c0
[   51.161254][  0]  drm_modeset_lock_all_ctx+0x98/0x188
[   51.166284][  0]  drm_atomic_helper_shutdown+0xa4/0x128
[   51.171487][  0]  hibmc_unload+0x50/0x2f0
[   51.175479][  0]  hibmc_load+0x5d8/0x888
[   51.179386][  0]  drm_dev_register+0x280/0x558
[   51.183811][  0]  drm_get_pci_dev+0x140/0x3c8
[   51.188150][  0]  hibmc_pci_probe+0x148/0x190
[   51.192489][  0]  local_pci_probe+0xc4/0x180
[   51.196742][  0]  pci_device_probe+0x328/0x530
[   51.201167][  0]  really_probe+0x498/0x9a0
[   51.205248][  0]  driver_probe_device+0x224/0x308
[   51.209932][  0]  device_driver_attach+0xec/0x128
[   51.214616][  0]  __driver_attach+0x144/0x280
[   51.218955][  0]  bus_for_each_dev+0x120/0x1a0
[   51.223380][  0]  driver_attach+0x48/0x60
[   51.227372][  0]  bus_add_driver+0x328/0x578
[   51.231625][  0]  driver_register+0x148/0x398
[   51.235965][  0]  __pci_register_driver+0x15c/0x1c8
[   51.240823][  0]  hibmc_init+0x2c/0x34
[   51.244557][  0]  do_one_initcall+0xc8/0x4a8
[   51.248810][  0]  kernel_init_freeable+0x678/0x75c
[   51.253582][  0]  kernel_init+0x18/0x128
[   51.257489][  0]  ret_from_fork+0x10/0x18

[HOW]
Do not call drm_atomic_helper_shutdown() if drmm_mode_config_init() failed.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 768b97f9e74a..8edc83db2afb 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -323,29 +323,29 @@ static int hibmc_load(struct drm_device *dev)
 
 	ret = hibmc_hw_init(priv);
 	if (ret)
-		goto err;
+		goto err_return;
 
 	ret = drmm_vram_helper_init(dev, pci_resource_start(pdev, 0),
 				    pci_resource_len(pdev, 0));
 	if (ret) {
 		drm_err(dev, "Error initializing VRAM MM; %d\n", ret);
-		goto err;
+		goto err_return;
 	}
 
 	ret = hibmc_kms_init(priv);
 	if (ret)
-		goto err;
+		goto err_return;
 
 	ret = drm_vblank_init(dev, dev->mode_config.num_crtc);
 	if (ret) {
 		drm_err(dev, "failed to initialize vblank: %d\n", ret);
-		goto err;
+		goto err_unload;
 	}
 
 	ret = hibmc_msi_init(dev);
 	if (ret) {
 		drm_err(dev, "hibmc msi init failed, ret:%d\n", ret);
-		goto err;
+		goto err_unload;
 	}
 
 	/* reset all the states of crtc/plane/encoder/connector */
@@ -353,8 +353,9 @@ static int hibmc_load(struct drm_device *dev)
 
 	return 0;
 
-err:
+err_unload:
 	hibmc_unload(dev);
+err_return:
 	drm_err(dev, "failed to initialize drm driver: %d\n", ret);
 	return ret;
 }
-- 
2.17.1

