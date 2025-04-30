Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE0AAA469A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 11:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4275F8910E;
	Wed, 30 Apr 2025 09:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="nieKerRv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CCF8910E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 09:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=VjGK2
 U//qa5zU2g/W3rDAI5DX37UsbjUdTqEkHSBYQc=; b=nieKerRvp0+jKgnHyLjuJ
 Ko1DdG3K5qv9HDR7CPQvYPBVTZ4Uz10cevI/Ld+CAdXkYZhoXTgJElXJ0h9hPTvw
 Nck4vqQA2fwl2eSah+UlyQwojJSSpKcKO19/ADBqm5Cr/+Epqlo8Qxtl2IzbOmrS
 kUaiv6bD9aYj0F42I+HoyM=
Received: from localhost.localdomain (unknown [])
 by gzsmtp1 (Coremail) with SMTP id PCgvCgD351ze5RFo2yEaBg--.45889S4;
 Wed, 30 Apr 2025 16:58:00 +0800 (CST)
From: oushixiong1025@163.com
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>, Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH 3/3] drm/udl: Use the default gem_prime_import function
Date: Wed, 30 Apr 2025 16:56:58 +0800
Message-Id: <20250430085658.540746-3-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250430085658.540746-1-oushixiong1025@163.com>
References: <20250430085658.540746-1-oushixiong1025@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgD351ze5RFo2yEaBg--.45889S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFy8tr4DGFWUKw4xZw47Jwb_yoW8GF4kpF
 43G34IkrWjqF4kKw13Aw4xAa45Ca17GayIgr48Jwna9F4vyr1UJFy5JFyFy3srAr97GF13
 tF1vyryUAF48KFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jxfHUUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXRc-D2gR5W4O-wABs4
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

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/udl/udl_drv.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index c00d8b8834f2..8107549b12e5 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -49,22 +49,6 @@ static int udl_usb_reset_resume(struct usb_interface *interface)
 	return drm_mode_config_helper_resume(dev);
 }
 
-/*
- * FIXME: Dma-buf sharing requires DMA support by the importing device.
- *        This function is a workaround to make USB devices work as well.
- *        See todo.rst for how to fix the issue in the dma-buf framework.
- */
-static struct drm_gem_object *udl_driver_gem_prime_import(struct drm_device *dev,
-							  struct dma_buf *dma_buf)
-{
-	struct udl_device *udl = to_udl(dev);
-
-	if (!udl->dmadev)
-		return ERR_PTR(-ENODEV);
-
-	return drm_gem_prime_import_dev(dev, dma_buf, udl->dmadev);
-}
-
 DEFINE_DRM_GEM_FOPS(udl_driver_fops);
 
 static const struct drm_driver driver = {
@@ -73,7 +57,6 @@ static const struct drm_driver driver = {
 	/* GEM hooks */
 	.fops = &udl_driver_fops,
 	DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS,
-	.gem_prime_import = udl_driver_gem_prime_import,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 
 	.name = DRIVER_NAME,
-- 
2.17.1

