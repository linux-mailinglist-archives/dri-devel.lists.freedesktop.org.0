Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 162D389E456
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 22:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF9B112F38;
	Tue,  9 Apr 2024 20:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="MW0ZT7LC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1539C112F38
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 20:25:56 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-7c8d2e0e9cfso160721339f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 13:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712694355; x=1713299155;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=00FZOCL4sng5Ck5aX5b8QcNlvsyxQYzhRIoubpVtMHU=;
 b=MW0ZT7LCgHU/4JEsrcZuZjBvtWL4FoO3VlBnC2ZE2f3Wp3fI2SAq1l4MqbNr1q9f5o
 dZCBZryupZhX4qb5I/xLK7FUWfPq32QUHDsBMH/jh9z3lxhS5caS6pxeCvRj5+LvdIzd
 gol8bH1m4SRnw80j3S2v9OlMszdSvnBpcHZO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712694355; x=1713299155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=00FZOCL4sng5Ck5aX5b8QcNlvsyxQYzhRIoubpVtMHU=;
 b=N6GTFLYiFtVATNZs1QarVRjLfZcf6bROpvPvw5BMSp5lPyDuDbJqu7lZum8LNAA64b
 BCnyuw7dHuu7/2Is/VnbrSRGvg4DgIpBdTNuol0CctXJKCgv49ku6WJthd4kOAbLi4oZ
 AFxFoVeSDGV0JA7lM9LNRbVE5CHPLkO4+78T5Ac+UV0zXrmeHLQE0VxqL+FXSZMp+8jp
 7p+vgTy7PFLItctNqfmsUQZREB4SGStX3xyevS+5XDugk164kmHL2kvGgIUX6pk3k/3n
 1DmrMPqACoymje0TetfGGcj8E6NMWF0VLTm4Y15NdmyaMIvnuZDt+XYsSAdyFv5Onq+4
 FL6A==
X-Gm-Message-State: AOJu0YwlAbxJV9xAZkg37Ak8NcyYRsDf/aFVQnTNaWhymy2L1fW1URiO
 zPpiWqXS8y15nHRbT6zznjkjRqhIybnq/yAyokEE7gq6x/IaNRXaoOxy2tIW/JkcOENH/E13UtS
 pzPDvVfqQp4xcpRSgLLmZuo9TMzpw6gRW1jNhNJdE3GFfewu3AsCOew7p0469+YOjqTI3Yy5YfW
 W/1d6HuDGuOHXwuuu4POYlxOPoCjQTYrmZOJ3Hj09gGz7w2/i8Zk4Q
X-Google-Smtp-Source: AGHT+IHJfesQNSsC0r4jTMOy7zpQ0WrdCY2YBArfNvqvsvy3W6SWBArAn54A+UWGkmerAChdibYmJA==
X-Received: by 2002:a05:6602:3817:b0:7d5:dd26:a396 with SMTP id
 bb23-20020a056602381700b007d5dd26a396mr868154iob.3.1712694354947; 
 Tue, 09 Apr 2024 13:25:54 -0700 (PDT)
Received: from localhost ([216.221.31.53]) by smtp.gmail.com with ESMTPSA id
 he23-20020a0566386d1700b00482a8b071a5sm594125jab.8.2024.04.09.13.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 13:25:54 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v2 4/4] drm/vmwgfx: Standardize use of kibibytes when logging
Date: Sat,  6 Apr 2024 04:11:19 -0500
Message-Id: <20240406091119.26567-5-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240406091119.26567-1-ian.forbes@broadcom.com>
References: <20240401195645.31081-1-ian.forbes@broadcom.com>
 <20240406091119.26567-1-ian.forbes@broadcom.com>
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

Use the same standard abbreviation KiB instead of incorrect variants.

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 12 ++++++------
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 570d5fb65a2d..27973eed84cc 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -744,7 +744,7 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 		dev->vram_size = pci_resource_len(pdev, 2);
 
 		drm_info(&dev->drm,
-			"Register MMIO at 0x%pa size is %llu kiB\n",
+			"Register MMIO at 0x%pa size is %llu KiB\n",
 			 &rmmio_start, (uint64_t)rmmio_size / 1024);
 		dev->rmmio = devm_ioremap(dev->drm.dev,
 					  rmmio_start,
@@ -763,7 +763,7 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 		fifo_size = pci_resource_len(pdev, 2);
 
 		drm_info(&dev->drm,
-			 "FIFO at %pa size is %llu kiB\n",
+			 "FIFO at %pa size is %llu KiB\n",
 			 &fifo_start, (uint64_t)fifo_size / 1024);
 		dev->fifo_mem = devm_memremap(dev->drm.dev,
 					      fifo_start,
@@ -788,7 +788,7 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 	 * SVGA_REG_VRAM_SIZE.
 	 */
 	drm_info(&dev->drm,
-		 "VRAM at %pa size is %llu kiB\n",
+		 "VRAM at %pa size is %llu KiB\n",
 		 &dev->vram_start, (uint64_t)dev->vram_size / 1024);
 
 	return 0;
@@ -982,13 +982,13 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 		dev_priv->max_primary_mem = dev_priv->vram_size;
 	}
 	drm_info(&dev_priv->drm,
-		 "Legacy memory limits: VRAM = %llu kB, FIFO = %llu kB, surface = %u kB\n",
+		 "Legacy memory limits: VRAM = %llu KiB, FIFO = %llu KiB, surface = %u KiB\n",
 		 (u64)dev_priv->vram_size / 1024,
 		 (u64)dev_priv->fifo_mem_size / 1024,
 		 dev_priv->memory_size / 1024);
 
 	drm_info(&dev_priv->drm,
-		 "MOB limits: max mob size = %u kB, max mob pages = %u\n",
+		 "MOB limits: max mob size = %u KiB, max mob pages = %u\n",
 		 dev_priv->max_mob_size / 1024, dev_priv->max_mob_pages);
 
 	ret = vmw_dma_masks(dev_priv);
@@ -1006,7 +1006,7 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 			 (unsigned)dev_priv->max_gmr_pages);
 	}
 	drm_info(&dev_priv->drm,
-		 "Maximum display memory size is %llu kiB\n",
+		 "Maximum display memory size is %llu KiB\n",
 		 (uint64_t)dev_priv->max_primary_mem / 1024);
 
 	/* Need mmio memory to check for fifo pitchlock cap. */
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index a0b47c9b33f5..5bd967fbcf55 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -94,14 +94,14 @@ static int vmw_gmrid_man_get_node(struct ttm_resource_manager *man,
 			} else
 				new_max_pages = gman->max_gmr_pages * 2;
 			if (new_max_pages > gman->max_gmr_pages && new_max_pages >= gman->used_gmr_pages) {
-				DRM_WARN("vmwgfx: increasing guest mob limits to %u kB.\n",
+				DRM_WARN("vmwgfx: increasing guest mob limits to %u KiB.\n",
 					 ((new_max_pages) << (PAGE_SHIFT - 10)));
 
 				gman->max_gmr_pages = new_max_pages;
 			} else {
 				char buf[256];
 				snprintf(buf, sizeof(buf),
-					 "vmwgfx, error: guest graphics is out of memory (mob limit at: %ukB).\n",
+					 "vmwgfx, error: guest graphics is out of memory (mob limit at: %u KiB).\n",
 					 ((gman->max_gmr_pages) << (PAGE_SHIFT - 10)));
 				vmw_host_printf(buf);
 				DRM_WARN("%s", buf);
-- 
2.34.1

