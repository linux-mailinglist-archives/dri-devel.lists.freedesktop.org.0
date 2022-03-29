Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E8B4EABD1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 13:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4E410EFEE;
	Tue, 29 Mar 2022 11:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BD310EFEE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 11:02:54 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id a8so34205229ejc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 04:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4drpLajIMMqR/KjP6Aw/prtxcUOnFrAuObmJcfTBJFk=;
 b=OhH5DY2l3HMMnz3/jG9nicws+D1180eyF3SViQNTu2EH17UeMAMOq9TCWPwLHeg5rE
 xgkrutSrW+vDsxjqC1tdTRVPTXjZW+OaJTxe8PJizBE7sUYVCUc0zJK/fVhScmzpMTHq
 q3R0RmThMwLzsD53Kcb27EoeT3uuvRCU+nffiFTsOWBfUONFBUkhWqL3MGxJjQyc2Pek
 GbnDePjOgAu7ogEjwkcY8Clf7LsMByfIaMPVkBLJZAXpy/8d2aj9E5tNlupHA5+FZLGm
 ZamdxpGRGNzXUZR5UBWmrIuOIsivEbeMS7VAzPnsvXwUjGH7iJZUPSQJB9zIR/83S+e0
 GHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4drpLajIMMqR/KjP6Aw/prtxcUOnFrAuObmJcfTBJFk=;
 b=QM7ywLPZAJ7n4INgsU7YKYbFTOrJNpVRLP4bCRTaSr7c3WXbhpjshwse7ujcSGKmqM
 OLH396Td86zPmvuZ2VyYP82+n1zcrLaYSgCt2zyNlnv/5ZHyyvLD+3QEd/ScFaMPKJ8V
 cGwbBM01RnsOmvGKS9Dj+v8H6uK7WPdRAw/+Ldm4FBZFA7u/PY5mmeMKndgQ6UcDGFmv
 YfIkxzEXF0dNek8eixPB6n9DTRnlP67v0SPcfYux5tIeSxm4Czis3To57kkY7+R8h9NR
 FThhWXrOhQXHKpwf5WVNBAwcZ84b5FX5EJWp5OOxPE2O/IuvFzekXgAuDsA3nnf/7+G/
 k+7Q==
X-Gm-Message-State: AOAM533+a4TRCNIYDz6Q4BF8OkjCvY3Zv5raOJLlBxanGq05RzDXHLlr
 g008Nbyc0xypBxfrmqaUKpI=
X-Google-Smtp-Source: ABdhPJyh7YDsOtydWNaV53tvY7rSfzSNAFuOotPQjSrErgVlBqeDK4ciPm6Qkj3fCefQ7vcZ82Wkuw==
X-Received: by 2002:a17:906:2f97:b0:6ce:3ef6:94be with SMTP id
 w23-20020a1709062f9700b006ce3ef694bemr34706087eji.136.1648551772055; 
 Tue, 29 Mar 2022 04:02:52 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a1709060f5400b006d6d54b9203sm6958402ejj.38.2022.03.29.04.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 04:02:51 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 03/11] drm/vram-helper: switch over to ttm_bo_init_reserved
Date: Tue, 29 Mar 2022 13:02:35 +0200
Message-Id: <20220329110243.6335-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220329110243.6335-1-christian.koenig@amd.com>
References: <20220329110243.6335-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the new interface instead.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 3f00192215d1..0bd46a138ded 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -186,6 +186,7 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 						size_t size,
 						unsigned long pg_align)
 {
+	struct ttm_operation_ctx ctx = { false, false };
 	struct drm_gem_vram_object *gbo;
 	struct drm_gem_object *gem;
 	struct drm_vram_mm *vmm = dev->vram_mm;
@@ -225,12 +226,13 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 	 * A failing ttm_bo_init will call ttm_buffer_object_destroy
 	 * to release gbo->bo.base and kfree gbo.
 	 */
-	ret = ttm_bo_init(bdev, &gbo->bo, size, ttm_bo_type_device,
-			  &gbo->placement, pg_align, false, NULL, NULL,
-			  ttm_buffer_object_destroy);
-	if (ret)
+	ret = ttm_bo_init_reserved(bdev, &gbo->bo, size, ttm_bo_type_device,
+				   &gbo->placement, pg_align, &ctx, NULL, NULL,
+				   ttm_buffer_object_destroy);
+        if (ret)
 		return ERR_PTR(ret);
 
+	ttm_bo_unreserve(&gbo->bo);
 	return gbo;
 }
 EXPORT_SYMBOL(drm_gem_vram_create);
-- 
2.25.1

