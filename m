Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A6D45BE6D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 13:45:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C34C6E0F1;
	Wed, 24 Nov 2021 12:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D82B6E332
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 12:44:37 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso5299785wml.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 04:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=u52YJlyy7AIH9JEjtInhzASiT+DyuF9B7cyAApbij+w=;
 b=TYG9Gm+e/SRvifnlQ31476IwW+Dc6Lj3qBF+0IkwEssQ1clvznH9dCKjLy72E7G4Dr
 5C8lPMiVaYdfjEdG2upjpXgShg0wViVI7tOkwvgbg7s3NA8qaC/gFb5GkxIKxZ/JUcZY
 k0jnkqsbcsIpvfUrVz0doR7RXWDZO6W5ikUssIToylYRdoJe4z5xMztfPipge/QODgWQ
 jkVx7IitCZa5lttVe2kV2RzM+IAjK1vlFHka1a/fPfiefdOd+fgGpQymbCXy8q1h5cJr
 iVzOA2FQFiu9+HStMpp0zgTfzKUavYJBnuAhcMKmfpVNpWXPCCxwj99niP+ool4+gaXp
 2Brw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u52YJlyy7AIH9JEjtInhzASiT+DyuF9B7cyAApbij+w=;
 b=OFA5kU9DBlvDRCkiHKwl4pv+K6r0KOQhH6UmTeeXFSzLW5od/IrePcyHlfHC3oUEuk
 ihklLFQHFxJx4CtHaD+CSYG+SpgLI6RF06/cKunSYHQZnHriCUxT4lendjnacNZuu43G
 YncQAPMeUzYnrJIZo2BB/PMSrvHTQNSHaFRrnxRDX6dBPCwIhzDSjs3UC5ZTtOF12NMa
 48MMMrK/iSCr9i1OmqTauq0mnr1CLusQO8NdvZFVUhGOY3gT3aY8Hkjd/JF4q8IsAcOn
 FOrzlLPSveVaj5S6ZmOCFFXgOBWAInLJ2IRQrA0NkahI8CaPUSNH1rx1f8y3giXp74OU
 0m2g==
X-Gm-Message-State: AOAM532c1dSja9wePUoEU+eVmPJPGLAHn1ltusU6PWA3AVAxkAlV+1ub
 3wiqUhJoZnb6unLXY2SBoDg5mF5I7f8=
X-Google-Smtp-Source: ABdhPJwPl2pcriBxZIncsFllxwKiMMgrorO/rzWyFIAco9LalvJIOZ/CGJ8XM8dkjD6ao0T+DJhlhw==
X-Received: by 2002:a05:600c:896:: with SMTP id
 l22mr14788850wmp.127.1637757875640; 
 Wed, 24 Nov 2021 04:44:35 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id 38sm15583145wrc.1.2021.11.24.04.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 04:44:35 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, thomas.hellstrom@linux.intel.com, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 03/12] drm/ttm: add a weak BO reference to the resource v3
Date: Wed, 24 Nov 2021 13:44:21 +0100
Message-Id: <20211124124430.20859-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211124124430.20859-1-christian.koenig@amd.com>
References: <20211124124430.20859-1-christian.koenig@amd.com>
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

Keep track for which BO a resource was allocated.
This is necessary to move the LRU handling into the resources.

A bit problematic is i915 since it tries to use the resource
interface without a BO which is illegal from the conceptional
point of view.

v2: Document that this is a weak reference and add a workaround for i915
v3: further document that this is protected by ttm_device::lru_lock and
    clarify the i915 workaround

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c  | 7 +++++--
 drivers/gpu/drm/ttm/ttm_resource.c | 9 +++++++++
 include/drm/ttm/ttm_resource.h     | 4 ++++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 95de2691ee7c..a2e3a9626198 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -237,6 +237,11 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 	if (bo->type != ttm_bo_type_sg)
 		fbo->base.base.resv = &fbo->base.base._resv;
 
+	if (fbo->base.resource) {
+		ttm_resource_set_bo(fbo->base.resource, &fbo->base);
+		bo->resource = NULL;
+	}
+
 	dma_resv_init(&fbo->base.base._resv);
 	fbo->base.base.dev = NULL;
 	ret = dma_resv_trylock(&fbo->base.base._resv);
@@ -512,7 +517,6 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
 		ghost_obj->ttm = NULL;
 	else
 		bo->ttm = NULL;
-	bo->resource = NULL;
 
 	dma_resv_unlock(&ghost_obj->base._resv);
 	ttm_bo_put(ghost_obj);
@@ -637,7 +641,6 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	dma_resv_unlock(&ghost->base._resv);
 	ttm_bo_put(ghost);
 	bo->ttm = ttm;
-	bo->resource = NULL;
 	ttm_bo_assign_mem(bo, sys_res);
 	return 0;
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 41e7bf195168..7fdd58b53c61 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -41,6 +41,7 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 	res->bus.offset = 0;
 	res->bus.is_iomem = false;
 	res->bus.caching = ttm_cached;
+	res->bo = bo;
 }
 EXPORT_SYMBOL(ttm_resource_init);
 
@@ -122,6 +123,14 @@ bool ttm_resource_compat(struct ttm_resource *res,
 }
 EXPORT_SYMBOL(ttm_resource_compat);
 
+void ttm_resource_set_bo(struct ttm_resource *res,
+			 struct ttm_buffer_object *bo)
+{
+	spin_lock(&bo->bdev->lru_lock);
+	res->bo = bo;
+	spin_unlock(&bo->bdev->lru_lock);
+}
+
 /**
  * ttm_resource_manager_init
  *
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 6bf37383002b..69eea9d6399b 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -161,6 +161,7 @@ struct ttm_bus_placement {
  * @mem_type: Resource type of the allocation.
  * @placement: Placement flags.
  * @bus: Placement on io bus accessible to the CPU
+ * @bo: weak reference to the BO, protected by ttm_device::lru_lock
  *
  * Structure indicating the placement and space resources used by a
  * buffer object.
@@ -171,6 +172,7 @@ struct ttm_resource {
 	uint32_t mem_type;
 	uint32_t placement;
 	struct ttm_bus_placement bus;
+	struct ttm_buffer_object *bo;
 };
 
 /**
@@ -271,6 +273,8 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
 void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res);
 bool ttm_resource_compat(struct ttm_resource *res,
 			 struct ttm_placement *placement);
+void ttm_resource_set_bo(struct ttm_resource *res,
+			 struct ttm_buffer_object *bo);
 
 void ttm_resource_manager_init(struct ttm_resource_manager *man,
 			       struct ttm_device *bdev,
-- 
2.25.1

