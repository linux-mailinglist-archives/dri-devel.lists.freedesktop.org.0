Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A97AB78239C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 08:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5205610E1D8;
	Mon, 21 Aug 2023 06:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67CC10E1D0;
 Mon, 21 Aug 2023 06:21:02 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-68a56ed12c0so77054b3a.0; 
 Sun, 20 Aug 2023 23:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692598862; x=1693203662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f7zNtx1npcyt6rHphdv4uT7irT8bAyzRl0M6M2dMjgk=;
 b=ajYlXTb+JOShhXkQlEyz206rkV9OlxQV9+ukfLmuZn9NlC0xy+8VrUWHRkqiqvQdJE
 pFJyf1B8/N/Tnv8L4vvQx3CYkC9c1uZN600RdSnymseySEo4pDdUSWikN8OdTM5oFgzR
 4nXKZr9Z1AHjrB3PsA5wH7TyZ5UvT5d95A4WEE8fhwA1qQksrBV8sw6YijphF6z9H9QZ
 wnmvJsyONU1ufr2VK1CXNSs60mV6inaPMyn12Jq2O/F+7YUMtFBzV2lC9FNFWcPhNNqR
 +ONZNTnm4gAR1i0di7VV3/vSN0GAG2wo7Mc1qQMqwfYBFPN5spZ4NQbjgzMF9FeU1EVh
 ZIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692598862; x=1693203662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f7zNtx1npcyt6rHphdv4uT7irT8bAyzRl0M6M2dMjgk=;
 b=NxxKig9L6XxfUN9hXoU19+OUGX/jT7pWlkfSib+i82SRaOCzo/oAPLBLIQFOnZqYw4
 mXW63HKVXD9LC3uFnatssPYspR5MQQWV8fR011ciQFUw3XiUzGNlrrLFUmCVroWEHki8
 fWmMwxzLcVDT1McGLc2DHz7/L1LutHGMNTBNzyLnQfOLbyBpj9GGKuIONeGfHnlgko/7
 K3JGhmJZQVgxRiwjTpAe2yhrmhseckIp1lsiFQbT8SeYHX5AEZyeLpMSdacmQEEPi+GB
 ebXjAk2YGaLhb95zH2pTRFNn6HYtbZCdbB21l0IlB+klRBjCLP7k98a3Zi5QeaeVgZPg
 BGxQ==
X-Gm-Message-State: AOJu0YybUMcd/4Ap7AC4Yc5uTwhfZN6ku2S5Wc3Q5pOTyWUztf/1EbTp
 q5rp9mqUyY8GHL4Gja4nJQeZ+BrPZ+Y8yelt
X-Google-Smtp-Source: AGHT+IFLtBRsV54dk8YwvAEx33Iu8ETlOW/VdzwRGtD54sT+fErJpTX4AxsrGRKLLJNIEwF0cwdEFA==
X-Received: by 2002:a17:902:e746:b0:1b8:35fa:cdcc with SMTP id
 p6-20020a170902e74600b001b835facdccmr7269102plf.5.1692598861722; 
 Sun, 20 Aug 2023 23:21:01 -0700 (PDT)
Received: from localhost (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 ja1-20020a170902efc100b001b8c6662094sm6124172plb.188.2023.08.20.23.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Aug 2023 23:21:01 -0700 (PDT)
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/amdgpu: Add option to disable implicit sync for a
 context.
Date: Mon, 21 Aug 2023 15:20:04 +0900
Message-ID: <20230821062005.109771-4-ishitatsuyuki@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821062005.109771-1-ishitatsuyuki@gmail.com>
References: <20230821062005.109771-1-ishitatsuyuki@gmail.com>
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>

This changes all BO usages in a submit to BOOKKEEP instead of READ,
which effectively disables implicit sync for these submits.

This is configured at a context level using the existing IOCTL.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Co-developed-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 16 +++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 30 +++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  1 +
 include/uapi/drm/amdgpu_drm.h           |  4 ++++
 4 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 2cb814de0149..008547f97fd1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1200,8 +1200,11 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 		struct dma_resv *resv = bo->tbo.base.resv;
 		enum amdgpu_sync_mode sync_mode;
 
-		sync_mode = amdgpu_bo_explicit_sync(bo) ?
-			AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
+		if (amdgpu_bo_explicit_sync(bo) || p->ctx->disable_implicit_sync)
+			sync_mode = AMDGPU_SYNC_EXPLICIT;
+		else
+			sync_mode = AMDGPU_SYNC_NE_OWNER;
+
 		r = amdgpu_sync_resv(p->adev, &p->sync, resv, sync_mode,
 				     AMDGPU_SYNC_EXPLICIT, &fpriv->vm);
 		if (r)
@@ -1322,11 +1325,16 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 
 			dma_resv_add_fence(gobj->resv,
 					   &p->jobs[i]->base.s_fence->finished,
-					   DMA_RESV_USAGE_READ);
+					   p->ctx->disable_implicit_sync ?
+						   DMA_RESV_USAGE_BOOKKEEP :
+						   DMA_RESV_USAGE_READ);
 		}
 
 		/* The gang leader as remembered as writer */
-		dma_resv_add_fence(gobj->resv, p->fence, DMA_RESV_USAGE_WRITE);
+		dma_resv_add_fence(gobj->resv, p->fence,
+				   p->ctx->disable_implicit_sync ?
+					   DMA_RESV_USAGE_BOOKKEEP :
+					   DMA_RESV_USAGE_WRITE);
 	}
 
 	seq = amdgpu_ctx_add_fence(p->ctx, p->entities[p->gang_leader_idx],
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 0dc9c655c4fb..fe6f30d8fd70 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -661,6 +661,30 @@ static int amdgpu_ctx_stable_pstate(struct amdgpu_device *adev,
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
@@ -709,6 +733,12 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
 			return -EINVAL;
 		r = amdgpu_ctx_stable_pstate(adev, fpriv, id, true, &stable_pstate);
 		break;
+	case AMDGPU_CTX_OP_SET_IMPLICIT_SYNC:
+		if ((args->in.flags & ~AMDGPU_CTX_IMPLICIT_SYNC_ENABLED) || args->in.priority)
+			return -EINVAL;
+		r = amdgpu_ctx_set_implicit_sync(adev, fpriv, id,
+						 args->in.flags & ~AMDGPU_CTX_IMPLICIT_SYNC_ENABLED);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
index 85376baaa92f..a330e5b65d30 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
@@ -58,6 +58,7 @@ struct amdgpu_ctx {
 	unsigned long			ras_counter_ue;
 	uint32_t			stable_pstate;
 	struct amdgpu_ctx_mgr		*ctx_mgr;
+	bool				disable_implicit_sync;
 };
 
 struct amdgpu_ctx_mgr {
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 79b14828d542..6a0168436c31 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -226,6 +226,7 @@ union drm_amdgpu_bo_list {
 #define AMDGPU_CTX_OP_QUERY_STATE2	4
 #define AMDGPU_CTX_OP_GET_STABLE_PSTATE	5
 #define AMDGPU_CTX_OP_SET_STABLE_PSTATE	6
+#define AMDGPU_CTX_OP_SET_IMPLICIT_SYNC	7
 
 /* GPU reset status */
 #define AMDGPU_CTX_NO_RESET		0
@@ -268,6 +269,9 @@ union drm_amdgpu_bo_list {
 #define AMDGPU_CTX_STABLE_PSTATE_MIN_MCLK  3
 #define AMDGPU_CTX_STABLE_PSTATE_PEAK  4
 
+/* opt-out of implicit sync */
+#define AMDGPU_CTX_IMPLICIT_SYNC_ENABLED  1
+
 struct drm_amdgpu_ctx_in {
 	/** AMDGPU_CTX_OP_* */
 	__u32	op;
-- 
2.41.0

