Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 068BC8CB3D3
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 20:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E597A10E319;
	Tue, 21 May 2024 18:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="M1oGXp5z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C1E10E319
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 18:47:42 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-792c7704e09so12368985a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 11:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1716317261; x=1716922061;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4UdLzMQLvTDj1SE6a0ZZa/BWZkEe+eXQUJ5pw7bGwEM=;
 b=M1oGXp5zBRAYZBrWHN5yxyTsAxeSd192t7XVNlQDT12n3iJoNc0fxfGuVydOnY8xBQ
 lOPKi0tQhh1DBplMF/NSq2YRHXb5ciO10OeiBNtPN5Jr52BOZmPzS1cQ+OeAq0fEpiEb
 iOOyrf5bFjCuz2cbQNmYXlXQsRZ3Z4ENJPTRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716317261; x=1716922061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4UdLzMQLvTDj1SE6a0ZZa/BWZkEe+eXQUJ5pw7bGwEM=;
 b=RkjaF/6cuTkYSrzEJ9nVDimlWezqvhuFQd7JhOSpiamFah9OqG6IskrICkq9JJCD+A
 22f7RipMw1TeUR4+IILiU2A9oj3XL/FzU4RM98mjh0BCtE1aoMTpav1f3SlmXv9dGn49
 a7kVSCurB6/f6hiHAX3jOO+hsS+YH/O0cCa5EYZvQQhTofbhtQHSRi/r1O0mlELqNp49
 8qh9dH96G8HWHVLfMw9tq4zBSFWClEpIYFjmshU/cENQSyfQ8BoZQ/GaDjNzEkos73NW
 u3GZGriH4fxbRrhAzOQ87+uK2MfYqBcR49EMrv6T4KPc3o0lrWBjJxoFZHpJ478K8HOL
 Jy5Q==
X-Gm-Message-State: AOJu0YwKpQyc2TudWg77KrytzGBqZtdpv/yAH0AmpyVBkIA4DNAXNYHf
 tKW8guIG2s7aTT5V5oLdHp1MoH7DsyyUq3zIy8ZPvAmd0nckSaDjDrVgbiqoGjZio+zTGpwpl7j
 DfENI4XZCdV3KjDA2C7Njy/dLTfz8yD4ZIsaY5H+VY8TW46jUeRsLJwWZFHb4vEodu8iDMVGHuP
 WUgs1rt3A7fAgkLKypgLZ+qSXHH9cpoRYoJBJ7nqgCTP1VCD7lBw==
X-Google-Smtp-Source: AGHT+IH5pAypb8BLmrt7WE6vxW0ZAnKNV09HSY8yChrDgS9flv3kPQUyRxp/TqvfIgcgLi3m915LGg==
X-Received: by 2002:a05:620a:2453:b0:793:c53:8ee5 with SMTP id
 af79cd13be357-79470f0c097mr1722830385a.26.1716317261217; 
 Tue, 21 May 2024 11:47:41 -0700 (PDT)
Received: from localhost ([192.19.144.250]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf2ffe59sm1310522185a.83.2024.05.21.11.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 11:47:40 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v3 4/4] drm/vmwgfx: Standardize use of kibibytes when logging
Date: Tue, 21 May 2024 13:47:20 -0500
Message-Id: <20240521184720.767-5-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521184720.767-1-ian.forbes@broadcom.com>
References: <20240521184720.767-1-ian.forbes@broadcom.com>
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
index 2e1fb46bcaa3..e03b2e682507 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -745,7 +745,7 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 		dev->vram_size = pci_resource_len(pdev, 2);
 
 		drm_info(&dev->drm,
-			"Register MMIO at 0x%pa size is %llu kiB\n",
+			"Register MMIO at 0x%pa size is %llu KiB\n",
 			 &rmmio_start, (uint64_t)rmmio_size / 1024);
 		dev->rmmio = devm_ioremap(dev->drm.dev,
 					  rmmio_start,
@@ -764,7 +764,7 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 		fifo_size = pci_resource_len(pdev, 2);
 
 		drm_info(&dev->drm,
-			 "FIFO at %pa size is %llu kiB\n",
+			 "FIFO at %pa size is %llu KiB\n",
 			 &fifo_start, (uint64_t)fifo_size / 1024);
 		dev->fifo_mem = devm_memremap(dev->drm.dev,
 					      fifo_start,
@@ -789,7 +789,7 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 	 * SVGA_REG_VRAM_SIZE.
 	 */
 	drm_info(&dev->drm,
-		 "VRAM at %pa size is %llu kiB\n",
+		 "VRAM at %pa size is %llu KiB\n",
 		 &dev->vram_start, (uint64_t)dev->vram_size / 1024);
 
 	return 0;
@@ -983,13 +983,13 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
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
@@ -1007,7 +1007,7 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
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

