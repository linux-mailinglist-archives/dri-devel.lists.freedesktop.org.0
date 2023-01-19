Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F1167464E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 23:40:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2354D10E27F;
	Thu, 19 Jan 2023 22:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC90E10E27F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 22:40:48 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id g205so2658431pfb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 14:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rNVirr7Mh55HoZPwbq9lUXgYo3JdiDpzBy8o0MLFF70=;
 b=aFrVtm751bC7Wj4QpfEcse3y80R5JKQlg6yJDGcYfJqg2vUWXjOnVuGkBhuMHVoMc9
 7k/nRUyAdZqum1UxhknqAz9ycBaiPKFJu7CqmLucaeAmSm6BxwomU6SpJAMKByRA6M/f
 yuVwoVStRilq5e6F5twMsddLu7ppayYGugLAXQxZjK51e7Vsb/JF4FgS/uIjV5plMacP
 v3+dpRBC9fBa5K6FapBglGnZuEzFsx7mZ+rjFj9awLRsCudjmZ92Jd0mMW1S8ZyDfRvk
 TztGrLmb/oVmd9wmiKG7Xf1EADYPseot/SOSBFMV4cZ3bGd8ZuBygXjxyNolq6C3a1MD
 Sr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rNVirr7Mh55HoZPwbq9lUXgYo3JdiDpzBy8o0MLFF70=;
 b=mZ8QIzf/m+Lf+tYUiL2zpiUAGVczuK4JIaCx7Zp2s31D/7DO6be7MZljXL7hHhgmmx
 6I0O5hpQE5foGlywuq3FsGLildxqgy/mC4zBXJNkuiiLxI6PqQob5SNxD1neFaSmaLXh
 JWfKJorepSWcvR/IM2XfiW0x7JOM6KoVS5N1eSo+c2Qt0OhAw7TPdgEWE0yGN4z/InkO
 bkne+K13l0MAVI5XbOw++AaP0hXcfSDOCGwfb7PLn4fPE4I06QXsGnrb+ZoXqY4hH2QP
 91L4mj8yMLEIRgDkE00MpJjddMmXlYeDsJaQqqLToI554cx9B9B6HKSweNUUybIq5oh5
 FpyQ==
X-Gm-Message-State: AFqh2kpb1v48pUX6Oww8wocdGrO6QOO06d9FWTwrBvHYumFsXBYi0Q3A
 qLkbDW4IH1zSTyMa2hM8V6laFqQ1dG0=
X-Google-Smtp-Source: AMrXdXuTk57vqfyycosJjc83ytHzfOrTz8oBlyWzkuEA4oYwVi918dWiZhgHT9pQS5GsV8DtjUo1+g==
X-Received: by 2002:a05:6a00:188b:b0:576:de1:cd32 with SMTP id
 x11-20020a056a00188b00b005760de1cd32mr16243662pfh.0.1674168048178; 
 Thu, 19 Jan 2023 14:40:48 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 63-20020a621942000000b0056d98e359a5sm24553533pfz.165.2023.01.19.14.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 14:40:47 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mediatek: Remove dependency on GEM DMA helper
Date: Thu, 19 Jan 2023 14:40:52 -0800
Message-Id: <20230119224052.2879106-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DRM DRIVERS FOR MEDIATEK" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

It appears that the dependency on the DMA helpers was only for
drm_gem_dma_vm_ops.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/mediatek/Kconfig       | 1 -
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 7 ++++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 369e495d0c3e..b451dee64d34 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -7,7 +7,6 @@ config DRM_MEDIATEK
 	depends on HAVE_ARM_SMCCC
 	depends on OF
 	depends on MTK_MMSYS
-	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 47e96b0289f9..9b3d15d3a983 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -16,13 +16,18 @@
 
 static int mtk_drm_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 
+static const struct vm_operations_struct vm_ops = {
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+};
+
 static const struct drm_gem_object_funcs mtk_drm_gem_object_funcs = {
 	.free = mtk_drm_gem_free_object,
 	.get_sg_table = mtk_gem_prime_get_sg_table,
 	.vmap = mtk_drm_gem_prime_vmap,
 	.vunmap = mtk_drm_gem_prime_vunmap,
 	.mmap = mtk_drm_gem_object_mmap,
-	.vm_ops = &drm_gem_dma_vm_ops,
+	.vm_ops = &vm_ops,
 };
 
 static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
-- 
2.38.1

