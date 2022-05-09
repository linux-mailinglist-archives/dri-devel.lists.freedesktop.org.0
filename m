Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F4451FD9C
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 15:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7EA10F198;
	Mon,  9 May 2022 13:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF77310F183
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 13:09:58 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v12so19347855wrv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 06:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pKWPsy6mmoPtYTTh5dk7m+bzljmJqMD/312eYbn5Y/Y=;
 b=e/+xdiOTogQOPBw5T4IYOAp3fgQ8C65KeOeuLTYdiMu7UftIFiLzmJrVtVkluvnM/5
 tnlM62TBqjcwCj1K5qzLgr/EErKMEPjPnOrCCMfTpelU4OShAWAfhopVRNVo5NWwoGeY
 ueoV5Kg1QuaJ3UgKHtOOsVVjt/MjU+s/x+hNZF/bB/VxclYVFCVWui4z2+/UwK+2YIgN
 jTFEo9jb08zlEq7UBgw1tJ0+pGtHKTrqeLmOeL6kKcQpGPwPspsVZHPPLL7pZR8XLF8S
 +SGuPcNEz4Vch2ZOD7ctglPnYhTmcfruEjhWhMvQTmWSXzXyY1SAa8ZIZuwh/aUVZJx+
 uuOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pKWPsy6mmoPtYTTh5dk7m+bzljmJqMD/312eYbn5Y/Y=;
 b=tvJW31N+P9jEoD/qio4xfgmxN0lNtsGfdqt6UC6SpkjUkD9jMF8RmTEe+0FiLW+ThR
 1Xxu1Dlo80qKMJb1BkwyhHHXGtBA3eMTnre4Y6ytSEgIWzWOx7kTsNwhFfcQdwEbShZg
 tJO676DS69EoEyo0dtMWDr/IQF4psOLfoIuhGYWVg9hZfg1a/OTem5+PWFj4Xx+h7fW8
 fjx/7u2/xSOH0whofui/qOQq3glVwfLaBmWQxw9GI02QR2HJ96blzmyQbQ1X8o1sdtKQ
 ICDI2dN1Mq8zrx0MhEhNITsHIt2I6H1LNic2ENIX4ENKo2Epj3ywpPksQdTERIHhisKk
 uZkw==
X-Gm-Message-State: AOAM5302nx0keEdy73/GuPcdudcMOHXEhiIl2ZXiCTNAnCjXm1J3wk98
 TJwU4o4UvW/3nedRBGF6Yu0=
X-Google-Smtp-Source: ABdhPJwPjIvu1YuCx+ibJaNqKJA3rIRtMwzvZBYQ9VXuRt9IG5RqaTycelM51a1WcVzXaJbxSmy5xw==
X-Received: by 2002:a5d:690c:0:b0:20a:d9d1:f5ce with SMTP id
 t12-20020a5d690c000000b0020ad9d1f5cemr13840792wru.295.1652101797308; 
 Mon, 09 May 2022 06:09:57 -0700 (PDT)
Received: from able.fritz.box (p57b0b3fd.dip0.t-ipconnect.de. [87.176.179.253])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c2f9000b003942a244f50sm18683385wmn.41.2022.05.09.06.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 06:09:56 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Subject: [PATCH 02/11] drm/nouveau: switch over to ttm_bo_init_reserved
Date: Mon,  9 May 2022 15:09:42 +0200
Message-Id: <20220509130951.486344-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509130951.486344-1-christian.koenig@amd.com>
References: <20220509130951.486344-1-christian.koenig@amd.com>
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

