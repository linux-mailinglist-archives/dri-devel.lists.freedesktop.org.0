Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF23352CFE9
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5CC11B342;
	Thu, 19 May 2022 09:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5224711B324;
 Thu, 19 May 2022 09:55:14 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id m20so8847379ejj.10;
 Thu, 19 May 2022 02:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pKWPsy6mmoPtYTTh5dk7m+bzljmJqMD/312eYbn5Y/Y=;
 b=D0SyLGO4vwRmpRAK6xXID2oI2Eu8tR6XxTjyQmNnuOIjhKkcwFqznUnzVIv98FOy2h
 AjWRcJWZxMyiLDLx55Jxl5BY96Vl7zaAHWSfBKV/lT21RgplF5PIJv2tQoIu0HlhbSmb
 4k855PY8+jdwFc4Et6U7A8SbLiW/pHlSUv6DG+E0K6Qpil3CLhG4TacsGCcqYAOZfxni
 7eVIm3hMCQ/J8TnQgjfVsrBozZZUKVNLpt/oDZ913W+O9NTTISeqX5T37B9zAKw+8Wf3
 47OvikDb5jGmonFgU4f+D2l6onvDirHFRRtCkyhLpOhac9FWmW+egfUD1HreUMASPbZt
 ArMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pKWPsy6mmoPtYTTh5dk7m+bzljmJqMD/312eYbn5Y/Y=;
 b=jAiPts0Ydb5B6gNZYEfeDs7Rsu8UHPWmxJWp8Mn4xreiymy0h099sqZ1D5dpN/E1kc
 KbRmIR+6aOaYi3D3sU4OH7b9jLghd50dUpXStxORDlIuI70zRpuwtW8e34iZJCcbjjiT
 VpZYmLXRKXBjceUhamYoH5s1dEl1P3GxI0gxnf8jhF9FCWQI+IyxratFlaitn/o+vSi0
 ZfKgyJ0b+DVfV7I0Q0MQy/teiezBob9I6Oj68XaCfd8aQurmELn9610rZSvs47QL3XQI
 rCTwiTTVdjzpZ3C0met80GpXNiVyxY7AmZkCfPHcgGCfOxhMpEvB0GdNiY2CyGFGrpeD
 OGWg==
X-Gm-Message-State: AOAM533vkUCQ09bRUn5wyMWajFKUjrawRQapU/drSeAYHLnAd2gMlalR
 G3PJBFmwkMJjaPQIbN0xl8jnIfpVg/M=
X-Google-Smtp-Source: ABdhPJzMeBO4AYCN3uZtNMAua2POrzY0kCHp307EaGsIv+xX11AL6o6PLBjSKvmCVQ6f/FOKFgUKfg==
X-Received: by 2002:a17:907:c24:b0:6f4:d6f2:9f6c with SMTP id
 ga36-20020a1709070c2400b006f4d6f29f6cmr3318900ejc.539.1652954112793; 
 Thu, 19 May 2022 02:55:12 -0700 (PDT)
Received: from able.fritz.box (p57b0bdaa.dip0.t-ipconnect.de. [87.176.189.170])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a170906518600b006fe9c65ffb8sm388267ejk.92.2022.05.19.02.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 02:55:12 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 02/11] drm/nouveau: switch over to ttm_bo_init_reserved
Date: Thu, 19 May 2022 11:54:59 +0200
Message-Id: <20220519095508.115203-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519095508.115203-1-christian.koenig@amd.com>
References: <20220519095508.115203-1-christian.koenig@amd.com>
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
Cc: matthew.william.auld@gmail.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the new interface instead.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 05076e530e7d..858b9382036c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -302,19 +302,23 @@ nouveau_bo_init(struct nouveau_bo *nvbo, u64 size, int align, u32 domain,
 		struct sg_table *sg, struct dma_resv *robj)
 {
 	int type = sg ? ttm_bo_type_sg : ttm_bo_type_device;
+	struct ttm_operation_ctx ctx = { false, false };
 	int ret;
 
 	nouveau_bo_placement_set(nvbo, domain, 0);
 	INIT_LIST_HEAD(&nvbo->io_reserve_lru);
 
-	ret = ttm_bo_init(nvbo->bo.bdev, &nvbo->bo, size, type,
-			  &nvbo->placement, align >> PAGE_SHIFT, false, sg,
-			  robj, nouveau_bo_del_ttm);
+	ret = ttm_bo_init_reserved(nvbo->bo.bdev, &nvbo->bo, size, type,
+				   &nvbo->placement, align >> PAGE_SHIFT, &ctx,
+				   sg, robj, nouveau_bo_del_ttm);
 	if (ret) {
 		/* ttm will call nouveau_bo_del_ttm if it fails.. */
 		return ret;
 	}
 
+	if (!robj)
+		ttm_bo_unreserve(&nvbo->bo);
+
 	return 0;
 }
 
-- 
2.25.1

