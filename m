Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ABD539A6E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 02:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B104110FC8D;
	Wed,  1 Jun 2022 00:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE65C10FC88
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 00:39:57 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id x62so83757ede.10
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 17:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kvdvs7NQ5XraYkJ7KDOuSja97oBpcTd1JCXu72JoqJo=;
 b=fCfOkiaDehYrScOLbqST5dkGfSy0zu5wIHQSgy0PBy9jOq5nrS1B2WUeST+7wcK2vQ
 U9rE87cHWlTAzQ6NGozJMdItac3Nz/XWCADNpxvgxGJlTxvj3dN4mAASvzwN+qA67HqD
 ajXDDAdXvKggelhkvLqEbMMiPzNKwFYF6S4S61iGt+PPXroRDuwf01SVrac/Wl7ZCvJd
 TeGQ9NaC1l03mBEuG42mC6WbA0wTyzg7mCL78F1w88YPv7TTxPgwlaRl+sYWLPwZMxIE
 48OH3/IAAYKSFDEFg3ICkVrS0NynfBn30Dj5zjmT87HFG7OWmaPgOJa1Dwm5viVq5Oum
 mQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kvdvs7NQ5XraYkJ7KDOuSja97oBpcTd1JCXu72JoqJo=;
 b=Hgz17FHOVQXLjdU9dbGtcdta63BDZZMBIaBP6CF8xo0aOvSoegTccekfIr/n2N4b44
 7roZf12emTLTBR2yKWjbWAW/dwJMKjyWXgEzObnbGWHXZoVTe4GdSV1ZPacyckmB9QYZ
 Myn9FsKrNXXxF/Hd1a49sA3+yqYokzO8k1n8VQyCC+kPx7iBjNZBjyVZTmXilnjQavUF
 GL5i/fF+wsvSwnzpJoR4Fzi9l8xR8WGxxuA3l7PrSjBz4JgGck7YWGX0J2KbreRgd5/E
 y+WwZ+bNUsuC8547z1NS93qDVlL7f6sIw4xzJLZbFPU2UUGT6lHxDEiyVoRexEXUplC1
 LNQA==
X-Gm-Message-State: AOAM531ikZksWg4Y0ymb4fYcjd8Vms35POWJU63ENgSgFD4A+d48k9Bm
 1udSWrAIAWF9r2IsakvIN8OuiSpKsEl7Hw==
X-Google-Smtp-Source: ABdhPJzrbxDKF+qeMYLsVzL/4hk0OVfY/PqIAX1FY9E57a5+cp+/X8PF+zUXzgbXPyzGqOFT3JBdMA==
X-Received: by 2002:aa7:dbc9:0:b0:42a:ecf2:4740 with SMTP id
 v9-20020aa7dbc9000000b0042aecf24740mr67277947edt.149.1654043996186; 
 Tue, 31 May 2022 17:39:56 -0700 (PDT)
Received: from bas-workstation.. ([2a02:aa12:a77f:2000:7285:c2ff:fe67:a82f])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a056402001500b0042aa23fa93bsm106182edu.20.2022.05.31.17.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 17:39:55 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 5/5] drm/amdgpu: Add option to disable implicit sync for a
 context.
Date: Wed,  1 Jun 2022 02:40:14 +0200
Message-Id: <20220601004014.158247-6-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
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
Cc: christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This changes all BO usages in a submit to BOOKKEEP instead of READ,
which effectively disables implicit sync for these submits.

This is configured at a context level using the existing IOCTL.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 13 ++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 32 +++++++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  1 +
 include/uapi/drm/amdgpu_drm.h           |  3 +++
 4 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 64419f55606f..944028d0ed6d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -498,6 +498,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 	struct amdgpu_bo *gws;
 	struct amdgpu_bo *oa;
 	int r;
+	enum dma_resv_usage resv_usage;
 
 	INIT_LIST_HEAD(&p->validated);
 
@@ -518,13 +519,16 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 			return r;
 	}
 
+	resv_usage = p->ctx->disable_implicit_sync ? DMA_RESV_USAGE_BOOKKEEP :
+						     DMA_RESV_USAGE_READ;
+
 	amdgpu_bo_list_for_each_entry(e, p->bo_list)
-		e->tv.usage = DMA_RESV_USAGE_READ;
+		e->tv.usage = resv_usage;
 
 	amdgpu_bo_list_get_list(p->bo_list, &p->validated);
 
 	INIT_LIST_HEAD(&duplicates);
-	amdgpu_vm_get_pd_bo(&fpriv->vm, &p->validated, &p->vm_pd, DMA_RESV_USAGE_READ);
+	amdgpu_vm_get_pd_bo(&fpriv->vm, &p->validated, &p->vm_pd, resv_usage);
 
 	if (p->uf_entry.tv.bo && !ttm_to_amdgpu_bo(p->uf_entry.tv.bo)->parent)
 		list_add(&p->uf_entry.tv.head, &p->validated);
@@ -651,7 +655,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 		struct dma_resv *resv = bo->tbo.base.resv;
 		enum amdgpu_sync_mode sync_mode;
 
-		sync_mode = amdgpu_bo_explicit_sync(bo) ?
+		sync_mode = (amdgpu_bo_explicit_sync(bo) || p->ctx->disable_implicit_sync) ?
 			AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
 		r = amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode,
 				     AMDGPU_SYNC_EXPLICIT, &fpriv->vm);
@@ -1259,7 +1263,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 
 	/* Make sure all BOs are remembered as writers */
 	amdgpu_bo_list_for_each_entry(e, p->bo_list)
-		e->tv.usage = DMA_RESV_USAGE_WRITE;
+		e->tv.usage = p->ctx->disable_implicit_sync ? DMA_RESV_USAGE_BOOKKEEP
+							    : DMA_RESV_USAGE_WRITE;
 
 	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
 	mutex_unlock(&p->adev->notifier_lock);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index c317078d1afd..5fd3ad630194 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -559,8 +559,6 @@ static int amdgpu_ctx_query2(struct amdgpu_device *adev,
 	return 0;
 }
 
-
-
 static int amdgpu_ctx_stable_pstate(struct amdgpu_device *adev,
 				    struct amdgpu_fpriv *fpriv, uint32_t id,
 				    bool set, u32 *stable_pstate)
@@ -589,6 +587,30 @@ static int amdgpu_ctx_stable_pstate(struct amdgpu_device *adev,
 	return r;
 }
 
+static int amdgpu_ctx_set_implicit_sync(struct amdgpu_device *adev,
+					struct amdgpu_fpriv *fpriv, uint32_t id,
+					bool enable)
+{
+	struct amdgpu_ctx *ctx;
+	struct amdgpu_ctx_mgr *mgr;
+
+	if (!fpriv)
+		return -EINVAL;
+
+	mgr = &fpriv->ctx_mgr;
+	mutex_lock(&mgr->lock);
+	ctx = idr_find(&mgr->ctx_handles, id);
+	if (!ctx) {
+		mutex_unlock(&mgr->lock);
+		return -EINVAL;
+	}
+
+	ctx->disable_implicit_sync = !enable;
+
+	mutex_unlock(&mgr->lock);
+	return 0;
+}
+
 int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *filp)
 {
@@ -637,6 +659,12 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
 			return -EINVAL;
 		r = amdgpu_ctx_stable_pstate(adev, fpriv, id, true, &stable_pstate);
 		break;
+	case AMDGPU_CTX_OP_SET_IMPLICIT_SYNC:
+		if ((args->in.flags & ~AMDGPU_CTX_IMPICIT_SYNC_ENABLED) || args->in.priority)
+			return -EINVAL;
+		r = amdgpu_ctx_set_implicit_sync(adev, fpriv, id,
+						 args->in.flags & ~AMDGPU_CTX_IMPICIT_SYNC_ENABLED);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
index 142f2f87d44c..7675838d1640 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
@@ -54,6 +54,7 @@ struct amdgpu_ctx {
 	unsigned long			ras_counter_ce;
 	unsigned long			ras_counter_ue;
 	uint32_t			stable_pstate;
+	bool				disable_implicit_sync;
 };
 
 struct amdgpu_ctx_mgr {
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 1d65c1fbc4ec..09d9388e35a7 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -208,6 +208,7 @@ union drm_amdgpu_bo_list {
 #define AMDGPU_CTX_OP_QUERY_STATE2	4
 #define AMDGPU_CTX_OP_GET_STABLE_PSTATE	5
 #define AMDGPU_CTX_OP_SET_STABLE_PSTATE	6
+#define AMDGPU_CTX_OP_SET_IMPLICIT_SYNC	7
 
 /* GPU reset status */
 #define AMDGPU_CTX_NO_RESET		0
@@ -248,6 +249,8 @@ union drm_amdgpu_bo_list {
 #define AMDGPU_CTX_STABLE_PSTATE_MIN_MCLK  3
 #define AMDGPU_CTX_STABLE_PSTATE_PEAK  4
 
+#define AMDGPU_CTX_IMPICIT_SYNC_ENABLED 1
+
 struct drm_amdgpu_ctx_in {
 	/** AMDGPU_CTX_OP_* */
 	__u32	op;
-- 
2.36.1

