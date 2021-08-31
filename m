Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECAF3FC5DB
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 13:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E9F89A74;
	Tue, 31 Aug 2021 11:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7633789A91
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 11:21:22 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id z4so27062300wrr.6
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 04:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=c06IRAsvySLlizLKnvlMe6da2f+luyqZqTWHotcIg70=;
 b=gkrsGzWBvTngbHi9pJo1ps7Z87zqYJez4Ov/YQfS7p77eek5DQ/odOUwdc2960hGgh
 2b/ZNm/35jEjkuy20jI9LxmPOCxClzbJIQRq+N3o6BGTkP08ZXlmN0X7lnAWXL0p9nrp
 3HTNechnV1UF9ovEU0L9u/Tlqghm7sfGuOJFdmWRK4/EOjrzrMGNXAeZGCJ3pbSi90fP
 4y8Mx0OejYp8h/KU6fd2pRK89o+d0zp8LBFkwNqSw9jKA2BbhIdpKiRoADQ9UDsM1drJ
 ZcVhfKhGi3G2OxrD1OSjuvHPSqHlp0YsQQ8UctqLbHRVPdWLjJ6lUv9xJBw/gygt3xre
 a07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c06IRAsvySLlizLKnvlMe6da2f+luyqZqTWHotcIg70=;
 b=aitjaoCd0jhqXZzKgasWCkxDHwJX5LFZeVCnUvR2aGRSacqT+GpJWhCx3G+KFYyx8W
 IkEhGC1Onec7728K2bKjhlLq7PWBjnv2BNEAbtpZCudL7QMDJcqHg6Df1JPI3zzy7kGU
 ou7ojl8ye5WsFj+cwn/UjwxuzdtaCiUsVktihtFLKjXciw6xdJfC7PeLTHNhOChFMR8b
 F+KETVN9dZt4usUxFSIaRYJf36lAilU56R21rIfFzs/JmoysbkXl3NZa973PXrWuM2pd
 eRv55nUevh5uccxtMcnkAHF8ui9dLgoDVG/9p+CRUR+l5VuYJCaGvCo3xweF+ZbYqyaW
 OJjg==
X-Gm-Message-State: AOAM531H/bPniYxf9o7yW3lI0IwOsb9uV+HrasewWcsERDZeYNnqQHJD
 dqAlPnBNlGBDx8jZQ6Bo3qvOTdrON/KGPY7Y
X-Google-Smtp-Source: ABdhPJxMNMo/Ln9sRNTVd9mOBWAVce0z0lc1gIAThkKMreqyLX6JnbvCAzbBO9J5CakC7T7A7ZH6pQ==
X-Received: by 2002:adf:9e0b:: with SMTP id u11mr14913426wre.85.1630408881065; 
 Tue, 31 Aug 2021 04:21:21 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 g5sm18054957wrq.80.2021.08.31.04.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 04:21:20 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 ray.huang@amd.com
Subject: [PATCH 4/5] drm/nouveau: switch to using new placement flags
Date: Tue, 31 Aug 2021 13:21:09 +0200
Message-Id: <20210831112110.113196-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831112110.113196-1-christian.koenig@amd.com>
References: <20210831112110.113196-1-christian.koenig@amd.com>
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

This simplifies the handling quite a bit, but needs extensive testing.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 61 ++++++++++------------------
 drivers/gpu/drm/nouveau/nouveau_bo.h |  1 -
 2 files changed, 22 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 33dca2565cca..d46e87f1c9c3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -344,33 +344,41 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, int align,
 	return 0;
 }
 
-static void
-set_placement_list(struct ttm_place *pl, unsigned *n, uint32_t domain)
+void
+nouveau_bo_placement_set(struct nouveau_bo *nvbo, uint32_t domain,
+			 uint32_t busy)
 {
-	*n = 0;
+	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
+	u64 vram_size = drm->client.device.info.ram_size;
+	unsigned *n = &nvbo->placement.num_placement;
+	struct ttm_place *pl = nvbo->placements;
+	unsigned i, fpfn, lpfn;
 
+	nvbo->placement.placement = pl;
+	nvbo->placement.busy_placement = pl;
+	busy &= ~domain;
+	domain |= busy;
+
+	*n = 0;
 	if (domain & NOUVEAU_GEM_DOMAIN_VRAM) {
 		pl[*n].mem_type = TTM_PL_VRAM;
-		pl[*n].flags = 0;
+		pl[*n].flags = busy & NOUVEAU_GEM_DOMAIN_VRAM ?
+			TTM_PL_FLAG_BUSY : 0;
 		(*n)++;
 	}
 	if (domain & NOUVEAU_GEM_DOMAIN_GART) {
 		pl[*n].mem_type = TTM_PL_TT;
-		pl[*n].flags = 0;
+		pl[*n].flags = busy & NOUVEAU_GEM_DOMAIN_GART ?
+			TTM_PL_FLAG_BUSY : 0;
 		(*n)++;
 	}
 	if (domain & NOUVEAU_GEM_DOMAIN_CPU) {
 		pl[*n].mem_type = TTM_PL_SYSTEM;
-		pl[(*n)++].flags = 0;
+		pl[*n].flags = busy & NOUVEAU_GEM_DOMAIN_CPU ?
+			TTM_PL_FLAG_BUSY : 0;
+		(*n)++;
 	}
-}
-
-static void
-set_placement_range(struct nouveau_bo *nvbo, uint32_t domain)
-{
-	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
-	u64 vram_size = drm->client.device.info.ram_size;
-	unsigned i, fpfn, lpfn;
+	nvbo->placement.num_busy_placement = *n;
 
 	if (drm->client.device.info.family == NV_DEVICE_INFO_V0_CELSIUS &&
 	    nvbo->mode && (domain & NOUVEAU_GEM_DOMAIN_VRAM) &&
@@ -392,29 +400,9 @@ set_placement_range(struct nouveau_bo *nvbo, uint32_t domain)
 			nvbo->placements[i].fpfn = fpfn;
 			nvbo->placements[i].lpfn = lpfn;
 		}
-		for (i = 0; i < nvbo->placement.num_busy_placement; ++i) {
-			nvbo->busy_placements[i].fpfn = fpfn;
-			nvbo->busy_placements[i].lpfn = lpfn;
-		}
 	}
 }
 
-void
-nouveau_bo_placement_set(struct nouveau_bo *nvbo, uint32_t domain,
-			 uint32_t busy)
-{
-	struct ttm_placement *pl = &nvbo->placement;
-
-	pl->placement = nvbo->placements;
-	set_placement_list(nvbo->placements, &pl->num_placement, domain);
-
-	pl->busy_placement = nvbo->busy_placements;
-	set_placement_list(nvbo->busy_placements, &pl->num_busy_placement,
-			   domain | busy);
-
-	set_placement_range(nvbo, domain);
-}
-
 int
 nouveau_bo_pin(struct nouveau_bo *nvbo, uint32_t domain, bool contig)
 {
@@ -1224,11 +1212,6 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
 			nvbo->placements[i].lpfn = mappable;
 		}
 
-		for (i = 0; i < nvbo->placement.num_busy_placement; ++i) {
-			nvbo->busy_placements[i].fpfn = 0;
-			nvbo->busy_placements[i].lpfn = mappable;
-		}
-
 		nouveau_bo_placement_set(nvbo, NOUVEAU_GEM_DOMAIN_VRAM, 0);
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index c2d3f9c48eba..9c29cf716d21 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -14,7 +14,6 @@ struct nouveau_bo {
 	struct ttm_placement placement;
 	u32 valid_domains;
 	struct ttm_place placements[3];
-	struct ttm_place busy_placements[3];
 	bool force_coherent;
 	struct ttm_bo_kmap_obj kmap;
 	struct list_head head;
-- 
2.25.1

