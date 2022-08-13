Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2249B591829
	for <lists+dri-devel@lfdr.de>; Sat, 13 Aug 2022 03:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D61B0D36;
	Sat, 13 Aug 2022 01:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F0CB1852
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Aug 2022 01:28:04 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id fy5so4644924ejc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 18:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ee/zor7Ujtx2vAMTVfqQPsf2hLFo4anXo140VfVrnf4=;
 b=KGl8xNc+8u5MTjngnH+aMtDeKo/XVpqWkNW2VMSA0KVcVYJfpPOuZrV07an+NvnbP5
 dlhseNowgz4w5a6yn9RcpnkVbN9fHIpDT5pQdJHXCkuT3GDq5iPBWQgiL48zB5Yo5xmk
 IIwEo9Mz4D2uwYP4eWDiTOEUaPsOVTDwr9ngqS/Nr1lck16nIPfm9dDCIobZSyJFx0yR
 nRHM4PoOTUYvUfv/L8pdstyGZTiELg5uPLlTgSfXsrFky+WyQT1UKRS75tw2H280XR6k
 T0Gt/yoQI4NWbB8PHsijjDpURG0sK8hmH19d6+R0G/rc8A953djlB/TTcJ3qSfbGeIwJ
 agog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ee/zor7Ujtx2vAMTVfqQPsf2hLFo4anXo140VfVrnf4=;
 b=N3b6fVH+CnvBNxmp747DiJUozJdApBYzexHz/Nm8/GnTzCSPSwdThU5OfPRiqQtRbY
 kGw03md2wGSlLMnG0ATDE1m8EICiCHgfDolXtGAzzlxR8fXnBv5aPJibjH03MqvAdclw
 6+DQtBbNu7s3ui6BjLMtTg+VRBy7Cr5Q36rHEibfcc5GtB1LT2q5s8iSlP5+DVjPvdoq
 bTHL5yKFvZxw62VoNwuNrUTV3mTT71vmFLsrEpgo6Yle7Z+c5V21aEzXcoq3JdtmkZEj
 LQ8XR1PSZRQOL9iQh65qkvEmg4yEquemkak+B9rZvaUDTmcAOfJ5MobUwiydv+BHhL+M
 dyiA==
X-Gm-Message-State: ACgBeo1gD2GXDJDFo/IRWOnuAIe2mkOU2v7p5jTL1h2YqhkFTY6m0Bkm
 GB2whWR5UcqR8Yjy81VZrZLbopih4LT3SttM
X-Google-Smtp-Source: AA6agR5QLkxJ7XprNnitD78C7tMbLVXSdEzZ1bZ+XXl4Sy+C7SzxmoxoGX04XRo3my542hAi0sbg3A==
X-Received: by 2002:a17:907:1b1b:b0:72f:4445:3c11 with SMTP id
 mp27-20020a1709071b1b00b0072f44453c11mr4133571ejc.714.1660354081221; 
 Fri, 12 Aug 2022 18:28:01 -0700 (PDT)
Received: from bas-workstation.. ([2a02:aa12:a77f:2000:7285:c2ff:fe67:a82f])
 by smtp.gmail.com with ESMTPSA id
 ot3-20020a170906ccc300b0072ab06bf296sm1342536ejb.23.2022.08.12.18.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 18:28:00 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/6] drm/amdgpu: Add option to disable implicit sync for a
 context.
Date: Sat, 13 Aug 2022 03:28:00 +0200
Message-Id: <20220813012801.1115950-6-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220813012801.1115950-1-bas@basnieuwenhuizen.nl>
References: <20220813012801.1115950-1-bas@basnieuwenhuizen.nl>
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
index 175fc2c2feec..5246defa4de8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -500,6 +500,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 	struct amdgpu_bo *gws;
 	struct amdgpu_bo *oa;
 	int r;
+	enum dma_resv_usage resv_usage;
 
 	INIT_LIST_HEAD(&p->validated);
 
@@ -522,16 +523,19 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 
 	mutex_lock(&p->bo_list->bo_list_mutex);
 
+	resv_usage = p->ctx->disable_implicit_sync ? DMA_RESV_USAGE_BOOKKEEP :
+						     DMA_RESV_USAGE_READ;
+
 	/* One for TTM and one for the CS job */
 	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
 		e->tv.num_shared = 2;
-		e->tv.usage = DMA_RESV_USAGE_READ;
+		e->tv.usage = resv_usage;
 	}
 
 	amdgpu_bo_list_get_list(p->bo_list, &p->validated);
 
 	INIT_LIST_HEAD(&duplicates);
-	amdgpu_vm_get_pd_bo(&fpriv->vm, &p->validated, &p->vm_pd, DMA_RESV_USAGE_READ);
+	amdgpu_vm_get_pd_bo(&fpriv->vm, &p->validated, &p->vm_pd, resv_usage);
 
 	if (p->uf_entry.tv.bo && !ttm_to_amdgpu_bo(p->uf_entry.tv.bo)->parent)
 		list_add(&p->uf_entry.tv.head, &p->validated);
@@ -672,7 +676,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 		struct dma_resv *resv = bo->tbo.base.resv;
 		enum amdgpu_sync_mode sync_mode;
 
-		sync_mode = amdgpu_bo_explicit_sync(bo) ?
+		sync_mode = (amdgpu_bo_explicit_sync(bo) || p->ctx->disable_implicit_sync) ?
 			AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
 		r = amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode,
 				     AMDGPU_SYNC_EXPLICIT, &fpriv->vm);
@@ -1287,7 +1291,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	/* Make sure all BOs are remembered as writers */
 	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
 		e->tv.num_shared = 0;
-		e->tv.usage = DMA_RESV_USAGE_WRITE;
+		e->tv.usage = p->ctx->disable_implicit_sync ? DMA_RESV_USAGE_BOOKKEEP
+							    : DMA_RESV_USAGE_WRITE;
 	}
 
 	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 7dc92ef36b2b..c01140a449da 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -596,8 +596,6 @@ static int amdgpu_ctx_query2(struct amdgpu_device *adev,
 	return 0;
 }
 
-
-
 static int amdgpu_ctx_stable_pstate(struct amdgpu_device *adev,
 				    struct amdgpu_fpriv *fpriv, uint32_t id,
 				    bool set, u32 *stable_pstate)
@@ -626,6 +624,30 @@ static int amdgpu_ctx_stable_pstate(struct amdgpu_device *adev,
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
@@ -674,6 +696,12 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
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
index cc7c8afff414..60149a7de4fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
@@ -58,6 +58,7 @@ struct amdgpu_ctx {
 	unsigned long			ras_counter_ce;
 	unsigned long			ras_counter_ue;
 	uint32_t			stable_pstate;
+	bool				disable_implicit_sync;
 };
 
 struct amdgpu_ctx_mgr {
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 18d3246d636e..27e61466b5d0 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -212,6 +212,7 @@ union drm_amdgpu_bo_list {
 #define AMDGPU_CTX_OP_QUERY_STATE2	4
 #define AMDGPU_CTX_OP_GET_STABLE_PSTATE	5
 #define AMDGPU_CTX_OP_SET_STABLE_PSTATE	6
+#define AMDGPU_CTX_OP_SET_IMPLICIT_SYNC	7
 
 /* GPU reset status */
 #define AMDGPU_CTX_NO_RESET		0
@@ -252,6 +253,8 @@ union drm_amdgpu_bo_list {
 #define AMDGPU_CTX_STABLE_PSTATE_MIN_MCLK  3
 #define AMDGPU_CTX_STABLE_PSTATE_PEAK  4
 
+#define AMDGPU_CTX_IMPICIT_SYNC_ENABLED 1
+
 struct drm_amdgpu_ctx_in {
 	/** AMDGPU_CTX_OP_* */
 	__u32	op;
-- 
2.37.1

