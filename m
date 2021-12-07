Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E66146BB45
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 13:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED29972E42;
	Tue,  7 Dec 2021 12:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B76A72E42
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 12:34:22 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a9so29093994wrr.8
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 04:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cLhcJ6c+gStaRG1gv+P6ttqcHjmkscgCl8MWmUQCq2k=;
 b=gc1YGrRR02J26KgtbWl2UnhYk9fouM1WZeAvCID85guiFbtLjzxu9WouIDKxsL1zOf
 bByKukPovwnGh4vdbGTMWd1TpDgTE1w3fTU1IG6Btf6F4UwhcEzcCHLZQiZBhAHb/0RZ
 zhMcimw4HKDOQjFJJMSleGbaN/nVFGRV5YlvXbpl0icay0lGVvvqG3gima8ilWAdO0l/
 eGukstecJaPMUAjX40d0cIBoDqrgsqKnku543GHczx7IimV0GMlQ6bfyvTIjcq4B++jI
 bglpetl5Oh1j23+OttiAHKhl1TxGKmFbDmrwsKzlpvBJ3RvZ0vjjDg4aeq0iF+6ThUX1
 SPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cLhcJ6c+gStaRG1gv+P6ttqcHjmkscgCl8MWmUQCq2k=;
 b=Msn5nOLu65OI5QOYGyHX0wkWghPf0GEJ/h39R+9+A6a7uGC7AjOFN6Ljud+oLQeSk0
 zyFiYJADtkFvncVdCIrlgJ/nqEjKgyej2z7oTW81udXbkvcVRlnw4AliPd6YM658Q8md
 vBC3PXEnE6/bq6IGGWPEp8g3veN9LTxnYZQViHnELEFW+ux01vnZY7BJXBTknbJGomQi
 76GZoY2j1zlKvsOgbCTCvpQx78ot9SAMpYK4rdtdl+N0vSMHfsCeR300JCSbTrrfi/3t
 juVv6ddBA+xORaFAGZZcvhhu/nzEp4IMWnfWbobNlISvTmDZqLynA21BNg3HJadTI8cM
 7hAQ==
X-Gm-Message-State: AOAM532o2ZAukACyn75IddFfAQ5h56H39+do2Ptni1ui24+4pRO4zLwb
 UEIF2K/X0DWKFtDTLlRAz7oruQaG6GR7wg==
X-Google-Smtp-Source: ABdhPJzCUAc21cxAn4aaSO5xC2Dcgwa6/a2y1qsI81TK+cu41x6GFrCxVoreFyWugo+uqrN9VMmM6Q==
X-Received: by 2002:adf:b18e:: with SMTP id q14mr53774033wra.477.1638880460696; 
 Tue, 07 Dec 2021 04:34:20 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 04:34:20 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 07/24] drm/nouveau: stop using dma_resv_excl_fence
Date: Tue,  7 Dec 2021 13:33:54 +0100
Message-Id: <20211207123411.167006-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
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

Instead use the new dma_resv_get_singleton function.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index fa73fe57f97b..74f8652d2bd3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -959,7 +959,14 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct drm_device *dev = drm->dev;
-	struct dma_fence *fence = dma_resv_excl_fence(bo->base.resv);
+	struct dma_fence *fence;
+	int ret;
+
+	/* TODO: This is actually a memory management dependency */
+	ret = dma_resv_get_singleton(bo->base.resv, false, &fence);
+	if (ret)
+		dma_resv_wait_timeout(bo->base.resv, false, false,
+				      MAX_SCHEDULE_TIMEOUT);
 
 	nv10_bo_put_tile_region(dev, *old_tile, fence);
 	*old_tile = new_tile;
-- 
2.25.1

