Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73F08A20E0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 23:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F76010F23C;
	Thu, 11 Apr 2024 21:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="f1CZBPyL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F96C10F178
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 21:27:16 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-78d61a716ddso15242385a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 14:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712870835; x=1713475635;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=00FZOCL4sng5Ck5aX5b8QcNlvsyxQYzhRIoubpVtMHU=;
 b=f1CZBPyLFyf3/e8+yl2/5//SDpd2hz7LERzy9XiDpgCx73pFzYr6fPOmVJvFBgnu+T
 Ease3lcqztGHeRNfym5naroc8JU2iu09A24njus5va7pFbKLUbWp364dpEjW6rgUUL9w
 vPWGMvOFsp1z0+EpHEzxbCGGPJrKP9M2RTU9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712870835; x=1713475635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=00FZOCL4sng5Ck5aX5b8QcNlvsyxQYzhRIoubpVtMHU=;
 b=NcjEI3KyGG+z00hfyyNPyZ8XyJYeA/XmpLWr/kdj06v8WNWOvtpUQUkfjk3Vdl32O5
 0e/Sp0LMhHb1+SEfJxXUPrL9HO2jGIQUqDwwCV8MlC8vVC7r4ub3XxhBPTCSiLKU4USh
 ewYuU5Tf2HE1QqyUYuqHTWHMMqEd7+HUu8sR/sjpGhh+GaYjPrVUqVqbliKPiUx9uAKS
 /0ZSrIEARIC7cDV8/6All3VzXnpOr29wY7yBeR414lnzkn+NoG6R7Zt3p7Lk/B3xLa5V
 jb/PCU2UZCPemxo5w0n89Pl0UlMF5wHvutX7Q8FKmA0mZx8QR0tf/dUhv95nTh3LqptH
 F7tQ==
X-Gm-Message-State: AOJu0YyyENKjiDxlyOkWLLPBiLsPp1eHDWEplk1wiOUYV5SkcuGzgnQS
 pFPbswYMF6GC8XQVlPscTYhoqIh3TKOq39YEBSfEVGWWAoxMfSq5m/rxSYxyGYFdKdpzuUrzfoq
 r9MnFVMMcGN80S8EPQvbbcArvl3oq7tVMTVmuVZizGW/LSGceAAVm1QpsaLNSV52WQNAWea19Ky
 mgJLERVLkMIbzAIs44Fqw16mgpajL9ktVh9PFIWvUi0KS0a57q/9XI
X-Google-Smtp-Source: AGHT+IFIvUyGMdLrKzHXbjuESV8hwJ02umuhNjp20PgBcMoYl2dD23VYHkmhYR/7HEmb/H2pAHFsKA==
X-Received: by 2002:a05:620a:3b89:b0:78d:7034:c145 with SMTP id
 ye9-20020a05620a3b8900b0078d7034c145mr849865qkn.53.1712870835083; 
 Thu, 11 Apr 2024 14:27:15 -0700 (PDT)
Received: from localhost ([216.221.31.53]) by smtp.gmail.com with ESMTPSA id
 f4-20020a05620a20c400b0078d4732d92fsm1511524qka.115.2024.04.11.14.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 14:27:14 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH 4/4] drm/vmwgfx: Standardize use of kibibytes when logging
Date: Thu, 11 Apr 2024 16:26:51 -0500
Message-Id: <20240411212651.540-5-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411212651.540-1-ian.forbes@broadcom.com>
References: <20240411212651.540-1-ian.forbes@broadcom.com>
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

