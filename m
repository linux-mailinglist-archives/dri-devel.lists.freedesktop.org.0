Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A855B638759
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 11:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7597410E6FB;
	Fri, 25 Nov 2022 10:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5656410E60A;
 Fri, 25 Nov 2022 10:21:45 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so5856514wma.1; 
 Fri, 25 Nov 2022 02:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qFb6DuLYLT1qnxM9CyElgz3eLWM7FoqC04HZ9bOT06I=;
 b=QIEzVG9CadqhWUP0CV9vQgijhyWkzsuhlieVS2CTpJj/Q2iycy5hGkBpQ3+rnlCAzo
 Mth6fLY3FZNqgbmh53dWxNnEY4RGguWWyS8eOkfW2LZuUdPHF+nVfhPwysfgIhhGj+ll
 njzJ2cVrgEcUabFhaHGyfgR9asLm+jQM8kLGi9BLttQC/R/A+8jpuH9Tu36PFy4Nr4WL
 qvMyUs6zN7c8vOi3dZBihlSYWkUkzLkXw8u8v0EjStP7NF+bFrvGYgiJYzLPdM6uUPto
 lPUEoMMO54TAbJa8RTGLBaAD14gFwcUj7h/bK7Ndr5gRHafqJcse3OcVqsEjH8o+KJn5
 hbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qFb6DuLYLT1qnxM9CyElgz3eLWM7FoqC04HZ9bOT06I=;
 b=kRhU5P9iJ6PKlnOcH6462hM+rhJ0SwePU34FRteTVYQl0Wu0x2T+yJO8hJ67qQ9HwB
 /bC907Rn9iZAwoq5aaCu/ffyhAMdeiSYMWDQ0NAK1r7+E/DVK3ROapTTlhhhR8i5BdXA
 huB+mbdwRl2t2wpgwjySu7NFJKHQQi0VFXWTHKYMOXxXgyIaq6Zkn71OrIaFr9bpCdAx
 7o34fHTxNIAq7eThafOz7hxWcZ3svZ8ACS+w6Ci/ZoK7ezXPz8vSF7VtRvHtsnlwS7sk
 a012KKEFahwB0nSunv80vZqc6VYUOP2EECJUG1Pa539lUXDi8J3LrNjcbQIuYwevaPU8
 R32w==
X-Gm-Message-State: ANoB5pk02zzHA1m8kFjwqojnyVB66Odo/U3n5e+RW5r3rFEuniKQ8vNh
 3oaPjAIcJsAdOBadIvzzn/mqf+mtod0=
X-Google-Smtp-Source: AA0mqf7kQV0uXZbs1jfxko1sTrCWCb+Dkdl4SbxHdMTH/0snr/heDcVUx+5GegPW/yWzcBQiX1BSpQ==
X-Received: by 2002:a1c:7504:0:b0:3cf:8ebf:69b with SMTP id
 o4-20020a1c7504000000b003cf8ebf069bmr17811854wmc.86.1669371703655; 
 Fri, 25 Nov 2022 02:21:43 -0800 (PST)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a056000038200b00241cfe6e286sm3351193wrf.98.2022.11.25.02.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 02:21:43 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/9] drm/nouveau: stop using ttm_bo_wait
Date: Fri, 25 Nov 2022 11:21:33 +0100
Message-Id: <20221125102137.1801-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125102137.1801-1-christian.koenig@amd.com>
References: <20221125102137.1801-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TTM is just wrapping core DMA functionality here, remove the mid-layer.
No functional change.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c  |  6 +++++-
 drivers/gpu/drm/nouveau/nouveau_gem.c | 11 ++++++++---
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 335fa91ca4ad..288eebc70a67 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -922,6 +922,7 @@ static void nouveau_bo_move_ntfy(struct ttm_buffer_object *bo,
 	struct nouveau_mem *mem = new_reg ? nouveau_mem(new_reg) : NULL;
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
 	struct nouveau_vma *vma;
+	long ret;
 
 	/* ttm can now (stupidly) pass the driver bos it didn't create... */
 	if (bo->destroy != nouveau_bo_del_ttm)
@@ -936,7 +937,10 @@ static void nouveau_bo_move_ntfy(struct ttm_buffer_object *bo,
 		}
 	} else {
 		list_for_each_entry(vma, &nvbo->vma_list, head) {
-			WARN_ON(ttm_bo_wait(bo, false, false));
+			ret = dma_resv_wait_timeout(bo->base.resv,
+						    DMA_RESV_USAGE_BOOKKEEP,
+						    false, 15 * HZ);
+			WARN_ON(ret <= 0);
 			nouveau_vma_unmap(vma);
 		}
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index ac5793c96957..f77e44958037 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -645,7 +645,7 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 				struct drm_nouveau_gem_pushbuf_reloc *reloc,
 				struct drm_nouveau_gem_pushbuf_bo *bo)
 {
-	int ret = 0;
+	long ret = 0;
 	unsigned i;
 
 	for (i = 0; i < req->nr_relocs; i++) {
@@ -703,9 +703,14 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 				data |= r->vor;
 		}
 
-		ret = ttm_bo_wait(&nvbo->bo, false, false);
+		ret = dma_resv_wait_timeout(nvbo->bo.base.resv,
+					    DMA_RESV_USAGE_BOOKKEEP,
+					    false, 15 * HZ);
+		if (ret == 0)
+			ret = -EBUSY;
 		if (ret) {
-			NV_PRINTK(err, cli, "reloc wait_idle failed: %d\n", ret);
+			NV_PRINTK(err, cli, "reloc wait_idle failed: %ld\n",
+				  ret);
 			break;
 		}
 
-- 
2.34.1

