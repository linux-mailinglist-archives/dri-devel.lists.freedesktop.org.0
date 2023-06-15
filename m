Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFAB7317F3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 13:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACD010E4DB;
	Thu, 15 Jun 2023 11:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E687F10E184
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 11:56:34 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9741caaf9d4so252312066b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 04:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686830193; x=1689422193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gvL+HfojLmh5fKbNoEmB78FkojUHksk2ul83XAS3HIs=;
 b=n9mehQkrz2hl2pvIO1KYaAk+nyQIIlnCj9d4n8uMkD9J9t5cNs8A7OoO1Xu5Y2o21I
 E9TFJ+xPPbTfQ+pQWwiJzRpFwlgEGKXmKc7DcT3/9Emi7s1NFOEzwsm2yoZoXKnaZzMj
 BnTEwrhgEmYL5cp0k1QJeG7ePvjlSY5hATB22+idY2c8tHaaCR+YvTPBH7DJ/6HpMMOu
 M5u+0VgpA7avBLGbKGACrNW3OhDDGMd0dFnhym8bh4C5Fkv4Vs2Mlr5Nhtpj4PZlkgHo
 xd02+WA6bCWiZ4nyW7NIeGc294KGGqSTJNYaGp7N1XnYydORXIFkuwCti/Jd1jBiTfKy
 rerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686830193; x=1689422193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gvL+HfojLmh5fKbNoEmB78FkojUHksk2ul83XAS3HIs=;
 b=kvaP3l0sJBdxGX71T2Fp7G6FIeQ6lnkp4QQi1s+kZUuhWlzRV2FktufRyJ8NIki9FZ
 ox5k5FS3PIEDvxDTIngeTtYXEo4WmXhfm7PNQ5C2tQxIMi8+5I/Bb66TmE+z2FgI3vmk
 9Qcmsxl+KTAny++s9HQLd2l0lDQ53CP9te+bBHRCaAM7BkAwZepGsk74XCc/hAzeL87S
 6Hz7edWw1hcRQq4+LnHbDjsX+rbZfrPzHjKcSFTEJuVvBCZAosJJKfzHi1scJFUV7I+Z
 2pzRFomUvZMM6ATKw2a6dCUl5XEK+Cs/YEyqGI24SgPlzeXm/gxCw/l0AOLSY622aYVu
 pJYQ==
X-Gm-Message-State: AC+VfDygep2H5q1Pmps0pxAeVimmPzvJMwrLBJFKClWxtBFV8j1xaxCR
 naSPOoIjinaX/Fx5VpQLU2o=
X-Google-Smtp-Source: ACHHUZ6QB+kbahWouRcDwPEfJ5fXkt4DpO/8kBi1NNELW1xCpFWnhv30/bc4UyGfB8aINjQa4l5Q7w==
X-Received: by 2002:a17:907:a02:b0:94f:7edf:8fa1 with SMTP id
 bb2-20020a1709070a0200b0094f7edf8fa1mr18097616ejc.32.1686830192749; 
 Thu, 15 Jun 2023 04:56:32 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1502:3e00:829a:ba2f:339a:9ad7])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a17090634c700b00965d4b2bd4csm9431961ejb.141.2023.06.15.04.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 04:56:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Luben.Tuikov@amd.com, l.stach@pengutronix.de,
 tvrtko.ursulin@linux.intel.com, robdclark@chromium.org
Subject: [PATCH 2/3] drm/amdgpu: mostly revert "fix force APP kill hang(v4)"
Date: Thu, 15 Jun 2023 13:56:29 +0200
Message-Id: <20230615115630.164098-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615115630.164098-1-christian.koenig@amd.com>
References: <20230615115630.164098-1-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 8ee3a52e3f35e064a3bf82f21dc74ddaf9843648.

The new amdgpu_ctx_mgr_entity_fini() was never called, so it was pure
coincident that this patch didn't cause a crash. Since the workaround
shouldn't be needed any more just mostly revert the changes to amdgpu.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 59 ++-----------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
 3 files changed, 5 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index d2139ac12159..1445e030d788 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -267,7 +267,7 @@ static ktime_t amdgpu_ctx_fini_entity(struct amdgpu_ctx_entity *entity)
 		res = ktime_add(res, amdgpu_ctx_fence_time(entity->fences[i]));
 		dma_fence_put(entity->fences[i]);
 	}
-
+	drm_sched_entity_destroy(&entity->entity);
 	kfree(entity);
 	return res;
 }
@@ -476,24 +476,6 @@ static int amdgpu_ctx_alloc(struct amdgpu_device *adev,
 	return r;
 }
 
-static void amdgpu_ctx_do_release(struct kref *ref)
-{
-	struct amdgpu_ctx *ctx;
-	u32 i, j;
-
-	ctx = container_of(ref, struct amdgpu_ctx, refcount);
-	for (i = 0; i < AMDGPU_HW_IP_NUM; ++i) {
-		for (j = 0; j < amdgpu_ctx_num_entities[i]; ++j) {
-			if (!ctx->entities[i][j])
-				continue;
-
-			drm_sched_entity_destroy(&ctx->entities[i][j]->entity);
-		}
-	}
-
-	amdgpu_ctx_fini(ref);
-}
-
 static int amdgpu_ctx_free(struct amdgpu_fpriv *fpriv, uint32_t id)
 {
 	struct amdgpu_ctx_mgr *mgr = &fpriv->ctx_mgr;
@@ -502,7 +484,7 @@ static int amdgpu_ctx_free(struct amdgpu_fpriv *fpriv, uint32_t id)
 	mutex_lock(&mgr->lock);
 	ctx = idr_remove(&mgr->ctx_handles, id);
 	if (ctx)
-		kref_put(&ctx->refcount, amdgpu_ctx_do_release);
+		kref_put(&ctx->refcount, amdgpu_ctx_fini);
 	mutex_unlock(&mgr->lock);
 	return ctx ? 0 : -EINVAL;
 }
@@ -712,7 +694,7 @@ int amdgpu_ctx_put(struct amdgpu_ctx *ctx)
 	if (ctx == NULL)
 		return -EINVAL;
 
-	kref_put(&ctx->refcount, amdgpu_ctx_do_release);
+	kref_put(&ctx->refcount, amdgpu_ctx_fini);
 	return 0;
 }
 
@@ -881,45 +863,12 @@ long amdgpu_ctx_mgr_entity_flush(struct amdgpu_ctx_mgr *mgr, long timeout)
 	return timeout;
 }
 
-void amdgpu_ctx_mgr_entity_fini(struct amdgpu_ctx_mgr *mgr)
-{
-	struct amdgpu_ctx *ctx;
-	struct idr *idp;
-	uint32_t id, i, j;
-
-	idp = &mgr->ctx_handles;
-
-	idr_for_each_entry(idp, ctx, id) {
-		if (kref_read(&ctx->refcount) != 1) {
-			DRM_ERROR("ctx %p is still alive\n", ctx);
-			continue;
-		}
-
-		for (i = 0; i < AMDGPU_HW_IP_NUM; ++i) {
-			for (j = 0; j < amdgpu_ctx_num_entities[i]; ++j) {
-				struct drm_sched_entity *entity;
-
-				if (!ctx->entities[i][j])
-					continue;
-
-				entity = &ctx->entities[i][j]->entity;
-				drm_sched_entity_fini(entity);
-			}
-		}
-	}
-}
-
 void amdgpu_ctx_mgr_fini(struct amdgpu_ctx_mgr *mgr)
 {
 	struct amdgpu_ctx *ctx;
-	struct idr *idp;
 	uint32_t id;
 
-	amdgpu_ctx_mgr_entity_fini(mgr);
-
-	idp = &mgr->ctx_handles;
-
-	idr_for_each_entry(idp, ctx, id) {
+	idr_for_each_entry(&mgr->ctx_handles, ctx, id) {
 		if (kref_put(&ctx->refcount, amdgpu_ctx_fini) != 1)
 			DRM_ERROR("ctx %p is still alive\n", ctx);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
index 0fa0e56daf67..729cf479d71d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
@@ -91,7 +91,6 @@ int amdgpu_ctx_wait_prev_fence(struct amdgpu_ctx *ctx,
 
 void amdgpu_ctx_mgr_init(struct amdgpu_ctx_mgr *mgr,
 			 struct amdgpu_device *adev);
-void amdgpu_ctx_mgr_entity_fini(struct amdgpu_ctx_mgr *mgr);
 long amdgpu_ctx_mgr_entity_flush(struct amdgpu_ctx_mgr *mgr, long timeout);
 void amdgpu_ctx_mgr_fini(struct amdgpu_ctx_mgr *mgr);
 void amdgpu_ctx_mgr_usage(struct amdgpu_ctx_mgr *mgr,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 0efb38539d70..50c36c95556d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1278,6 +1278,7 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
 		return;
 
 	pm_runtime_get_sync(dev->dev);
+	amdgpu_ctx_mgr_fini(&fpriv->ctx_mgr);
 
 	if (amdgpu_device_ip_get_ip_block(adev, AMD_IP_BLOCK_TYPE_UVD) != NULL)
 		amdgpu_uvd_free_handles(adev, file_priv);
@@ -1299,7 +1300,6 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
 		amdgpu_bo_unreserve(pd);
 	}
 
-	amdgpu_ctx_mgr_fini(&fpriv->ctx_mgr);
 	amdgpu_vm_fini(adev, &fpriv->vm);
 
 	if (pasid)
-- 
2.34.1

