Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6160A8B92DF
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 02:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E406010EA97;
	Thu,  2 May 2024 00:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="JyvSvfxO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E06610EA97
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 00:41:16 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-6ee13f19e7eso6777447b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2024 17:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1714610475; x=1715215275;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2L4ap47m+U9rXc1IUSEo/J3q5TEiHC9NMgmwIDOcbB4=;
 b=JyvSvfxOIU13uyI+4QTGpmbc/XgpViCjsJA47bffTdkVDUu15l/Z1oL4lwBpP2cy11
 u9gQfiOPVdlMiriL2IJspnqGtPAuDQkGjJ+XfFPTgrueGeyLW4RCLwuF704HVAVCTdRh
 oxKEYECYKrH2IWbtpnjQuu1jDITHwsFWUpchY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714610475; x=1715215275;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2L4ap47m+U9rXc1IUSEo/J3q5TEiHC9NMgmwIDOcbB4=;
 b=IJaM1LiJ+v+rkVDResgChU6jgczy8FZGiP+3xOFH4O9u6QeA1m9/UJuas56PDKkgQD
 8Xztk6y6fxHoAn5yRJgjtPltY69hxLZefkr1+3QAmf96mowE92es9dfdAiw3c/x+ZkIF
 WQVd7aukY1HJxYqV/So9kC8NDaXSX8bPTKX5T0t83HMdUgojbMQtrHDOhNwgeZbz/vL3
 qjQ7C23+FZuyq//0MkGTaYs6Y52/cwQcilxqJ4on64YZbwRlclueTlg1sx1jSSqferKJ
 cl0tfY4wsuzeiAksQ91/j35f3VM5/z9c/uum0VXJYTT53L0ITIISjgRn00UBj/hTUNFK
 L4+w==
X-Gm-Message-State: AOJu0Ywig2cXezE6GdUtoRIEU3Jba1HpdRHBc7Izi24Tkk4pPyjtx9O8
 LmMY6IKHIZNV4FuYubXpHpgMeFtXRCcQekSv5GgSMn4gInCCDyaOo+5nCXS+aaznG1kKOZqCyv+
 kyqc1IPVgmP936UWUVffZeAfvccx0gtllxpqC1dFoy1jKbnhYB3GAXIwUpl+sqrYb3pUsB23Wpn
 viZY417arLqwz8OKSCMIsHbYXeUsFnLGWFSaOxS/I+T7YCRFYGlsbw3yyJZKHl
X-Google-Smtp-Source: AGHT+IHYUafHZs50dDdQaWnftVOrFDBLITX6kDlq8e1tv+Kmtuf5guPP97QhHD3ApCHVlr1Aa3FBGA==
X-Received: by 2002:a05:6a00:399a:b0:6f3:ecdc:2248 with SMTP id
 fi26-20020a056a00399a00b006f3ecdc2248mr4882691pfb.27.1714610475087; 
 Wed, 01 May 2024 17:41:15 -0700 (PDT)
Received: from localhost.localdomain ([66.170.99.2])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a62e912000000b006e681769ee0sm23954671pfh.145.2024.05.01.17.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 17:41:14 -0700 (PDT)
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Stop using dev_private to store driver data.
Date: Wed,  1 May 2024 17:40:33 -0700
Message-Id: <20240502004033.107533-1-maaz.mombasawala@broadcom.com>
X-Mailer: git-send-email 2.34.1
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
Reply-To: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently vmwgfx uses the dev_private opaque pointer in drm_device to store
driver data in vmw_private struct. Using dev_private is deprecated, and the
recommendation is to embed struct drm_device in the larger per-device
structure.

The vmwgfx driver already embeds struct drm_device in its struct
vmw_private, so switch to using that exclusively and stop using
dev_private.

Signed-off-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 --
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 4 ++--
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index bdad93864b98..97e48e93dbbf 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -858,8 +858,6 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	bool refuse_dma = false;
 	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 
-	dev_priv->drm.dev_private = dev_priv;
-
 	vmw_sw_context_init(dev_priv);
 
 	mutex_init(&dev_priv->cmdbuf_mutex);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 4ecaea0026fc..df89e468a1fc 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -638,7 +638,7 @@ static inline struct vmw_surface *vmw_res_to_srf(struct vmw_resource *res)
 
 static inline struct vmw_private *vmw_priv(struct drm_device *dev)
 {
-	return (struct vmw_private *)dev->dev_private;
+	return container_of(dev, struct vmw_private, drm);
 }
 
 static inline struct vmw_private *vmw_priv_from_ttm(struct ttm_device *bdev)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 13b2820cae51..b3f0fb6828de 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -276,7 +276,7 @@ static void vmw_du_put_cursor_mob(struct vmw_cursor_plane *vcp,
 static int vmw_du_get_cursor_mob(struct vmw_cursor_plane *vcp,
 				 struct vmw_plane_state *vps)
 {
-	struct vmw_private *dev_priv = vcp->base.dev->dev_private;
+	struct vmw_private *dev_priv = vmw_priv(vcp->base.dev);
 	u32 size = vmw_du_cursor_mob_size(vps->base.crtc_w, vps->base.crtc_h);
 	u32 i;
 	u32 cursor_max_dim, mob_max_size;
@@ -515,7 +515,7 @@ void vmw_du_cursor_plane_destroy(struct drm_plane *plane)
 	struct vmw_cursor_plane *vcp = vmw_plane_to_vcp(plane);
 	u32 i;
 
-	vmw_cursor_update_position(plane->dev->dev_private, false, 0, 0);
+	vmw_cursor_update_position(vmw_priv(plane->dev), false, 0, 0);
 
 	for (i = 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++)
 		vmw_du_destroy_cursor_mob(&vcp->cursor_mobs[i]);
-- 
2.34.1

