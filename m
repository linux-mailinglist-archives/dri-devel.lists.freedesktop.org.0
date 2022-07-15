Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 052EF575FD7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 13:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14AA12BF1D;
	Fri, 15 Jul 2022 11:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE6212BC28
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 11:15:37 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id b11so8375802eju.10
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 04:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MTLW9RlauZeKFDhXdi4NVzD2CUoBAKyaVfHA2bXsyzc=;
 b=cZzKwY+0ZdUuIruChrb8kdL6jBhxAJ4f/t6kQsUtfwJ2Ftwt55nqQeWtLRq/1/EqOd
 IEe0X0KFs0/RJKm7lds3bLi4V8YxryErPO2WieFPdCOUpdcKukib2XrjRD2Lr0NlYnFd
 PEUZJoSm6mfgsUw7aerd3Rnc2VOpd80bFQPj391hM8cGFuCRNS2B4xrjz+WE0Ciz0HMa
 DUy8l2mrTiXvqPGw8lXlV+hmdYxwnayirZNXv06SJ4MRvqWrR2OIW2RjpI8ijQmt7EkX
 ZylTiZ9WRdR5GfIqPbzhLFom/Abi1xk/e8kKtElUqUdopwjpMp76SEHRUtqpTeCZXZiQ
 GtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MTLW9RlauZeKFDhXdi4NVzD2CUoBAKyaVfHA2bXsyzc=;
 b=V4WtxAyJwCE072pnESZA2rqpxzM5VQtHLGusqbwfvLMzZQM4hom827NfgUmx1+j5N2
 pVqqzzcbPCksXhqGm+AYM4dfylE77ZhOmnOxaFQejmbKm3JVabIsz1YgwCR5iIeNqY3c
 a7ZBaA3Kchibja4pwWKzHARMWva0gQ89LbIgz+muabpInHhveFVZu7LK3bJNmpEQ1Qqb
 iw4lc6t5K1H4GK6tjSVIgEw+l+D1DgmWUQl4aWVQQ+MfpTlr5KokzD0jhq4NWKGr7/Y9
 FsadvHsMQxqiMD259bwMjEU0IqFXBo4+nvSD6VO6lkKxy2gepyk+kmnsK2an4191D+89
 2g9w==
X-Gm-Message-State: AJIora9mAJHGWsgJkB5EI0pM7Bha2Lq7hUATNs3Hji11tIrMts5Ptvha
 x13qYCgxmVngfCiWZE6brHk=
X-Google-Smtp-Source: AGRyM1sXRMBMo7CEcLdnL2/swmUdEsYDQErwuViUUaTNFULXYGvVIsnYfFGGd8Gq79nQOEH3mLwtKg==
X-Received: by 2002:a17:907:a063:b0:72b:52f7:feea with SMTP id
 ia3-20020a170907a06300b0072b52f7feeamr13272643ejc.740.1657883735720; 
 Fri, 15 Jul 2022 04:15:35 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a1709066c8500b0071c6dc728b2sm1913543ejr.86.2022.07.15.04.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 04:15:35 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/ttm: fix locking in vmap/vunmap TTM GEM helpers
Date: Fri, 15 Jul 2022 13:15:32 +0200
Message-Id: <20220715111533.467012-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dmitry.osipenko@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've stumbled over this while reviewing patches for DMA-buf and it looks
like we completely messed the locking up here.

In general most TTM function should only be called while holding the
appropriate BO resv lock. Without this we could break the internal
buffer object state here.

Only compile tested!

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: 43676605f890 drm/ttm: Add vmap/vunmap to TTM and TTM GEM helpers
---
 drivers/gpu/drm/drm_gem_ttm_helper.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c b/drivers/gpu/drm/drm_gem_ttm_helper.c
index d5962a34c01d..e5fc875990c4 100644
--- a/drivers/gpu/drm/drm_gem_ttm_helper.c
+++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
@@ -64,8 +64,13 @@ int drm_gem_ttm_vmap(struct drm_gem_object *gem,
 		     struct iosys_map *map)
 {
 	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
+	int ret;
+
+	dma_resv_lock(gem->resv, NULL);
+	ret = ttm_bo_vmap(bo, map);
+	dma_resv_unlock(gem->resv);
 
-	return ttm_bo_vmap(bo, map);
+	return ret;
 }
 EXPORT_SYMBOL(drm_gem_ttm_vmap);
 
@@ -82,7 +87,9 @@ void drm_gem_ttm_vunmap(struct drm_gem_object *gem,
 {
 	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
 
+	dma_resv_lock(gem->resv, NULL);
 	ttm_bo_vunmap(bo, map);
+	dma_resv_unlock(gem->resv);
 }
 EXPORT_SYMBOL(drm_gem_ttm_vunmap);
 
-- 
2.25.1

