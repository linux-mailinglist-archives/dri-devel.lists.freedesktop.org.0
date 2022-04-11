Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFE64FC71B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 23:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AA710E298;
	Mon, 11 Apr 2022 21:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C654D10E14C;
 Mon, 11 Apr 2022 21:58:42 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 g12-20020a17090a640c00b001cb59d7a57cso523821pjj.1; 
 Mon, 11 Apr 2022 14:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dtgr6DYJ0qUGmOxJ81OL+NkRbDmdTgtEm+OJ0YJIztE=;
 b=O0d3ZuxLPBA0aeNZx3ThFsReo+RszKNL1+20+f7XlSlsKmtoYQu/arbBUYtgGyCfBr
 OCSYQ1UwJ/z3M/0iilQJcAb7gvJT4cPdeVqwajOE50Xs61BXUQdJw4vmpuvtxoBI9Ks1
 RGe7K2OuYRmsGUnVNjNPVDH41SLD5Uhrx+2DlenmwwzYdKGEUqbALXShN6bMnKCFSAHR
 GXfj/0S3H7yZ9RiYd81ZDPvN4M0QUUFH20yJMSMod/7heIpIKlhWyW9xIpuMZsDoRwVG
 4LN2MRKMuiZAtFK+gPvEaTHdAOV/KMm1bnEQ9ReQDgW1k0N6TIrwNbVtdh+g9ihfkRgc
 ZmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dtgr6DYJ0qUGmOxJ81OL+NkRbDmdTgtEm+OJ0YJIztE=;
 b=NMtPsGRQ/TOqRj6TjmoNDbVCrKi72NgH+3kUKvFkardfU8+rfgS5hJYLnYxI9i55EC
 iaNGdSrPQyqHv6EE7K2GynIkXfHEeyvyr7XaXXQd0GqeFyrNgc50Rc7/QeUxHcqhyerz
 iCWH4afDZN1AIQd98Rf4IIqn1mzH01UMuIncUMvUtKtg+cbtaLaw6E4XxgSd8TANk5GA
 sCFQoXKH0iMUOrHXRmdXSkOm0du6fOpUSums5yWJ4a/jhgIWPb5e/+CWnT+PeDHAQvX4
 RrRWKiHcWoiRcOANLFgGy50J6STv4uXQlFQIHUg6qZWdsBbXB47SAVaS8XnJfxhH0BmF
 UcEA==
X-Gm-Message-State: AOAM530EeCsSFl6xlgDpUv2TWha4n9LmCW1Vff3WCZRBzYuaUmprP6Er
 /pd5hdkaLDMXk3UPz4kjC7mqlTtG9RM=
X-Google-Smtp-Source: ABdhPJyQQIZulZLVsNA8CkXz6Xo7Begx6I+UNnNXlDMbm24AUZMDkyu0iZc6a7Lb7NHxYWP7/ouWGA==
X-Received: by 2002:a17:902:ce02:b0:153:bd65:5c0e with SMTP id
 k2-20020a170902ce0200b00153bd655c0emr34137421plg.160.1649714321692; 
 Mon, 11 Apr 2022 14:58:41 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 gn21-20020a17090ac79500b001ca3c37af65sm447127pjb.21.2022.04.11.14.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 14:58:40 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 10/10] drm/msm: Add a way for userspace to allocate GPU iova
Date: Mon, 11 Apr 2022 14:58:39 -0700
Message-Id: <20220411215849.297838-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411215849.297838-1-robdclark@gmail.com>
References: <20220411215849.297838-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The motivation at this point is mainly native userspace mesa driver in a
VM guest.  The one remaining synchronous "hotpath" is buffer allocation,
because guest needs to wait to know the bo's iova before it can start
emitting cmdstream/state that references the new bo.  By allocating the
iova in the guest userspace, we no longer need to wait for a response
from the host, but can just rely on the allocation request being
processed before the cmdstream submission.  Allocation failures (OoM,
etc) would just be treated as context-lost (ie. GL_GUILTY_CONTEXT_RESET)
or subsequent allocations (or readpix, etc) can raise GL_OUT_OF_MEMORY.

v2: Fix inuse check
v3: Change mismatched iova case to -EBUSY

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++
 drivers/gpu/drm/msm/msm_drv.c           | 21 +++++++++++
 drivers/gpu/drm/msm/msm_gem.c           | 48 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem.h           |  8 +++++
 drivers/gpu/drm/msm/msm_gem_vma.c       |  2 ++
 include/uapi/drm/msm_drm.h              |  3 ++
 6 files changed, 92 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 6385ab06632f..4caae0229518 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -281,6 +281,16 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	case MSM_PARAM_SUSPENDS:
 		*value = gpu->suspend_count;
 		return 0;
+	case MSM_PARAM_VA_START:
+		if (ctx->aspace == gpu->aspace)
+			return -EINVAL;
+		*value = ctx->aspace->va_start;
+		return 0;
+	case MSM_PARAM_VA_SIZE:
+		if (ctx->aspace == gpu->aspace)
+			return -EINVAL;
+		*value = ctx->aspace->va_size;
+		return 0;
 	default:
 		DBG("%s: invalid param: %u", gpu->name, param);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index d618953d33ea..34e2169308b4 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -722,6 +722,23 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
 	return msm_gem_get_iova(obj, ctx->aspace, iova);
 }
 
+static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
+		struct drm_file *file, struct drm_gem_object *obj,
+		uint64_t iova)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_file_private *ctx = file->driver_priv;
+
+	if (!priv->gpu)
+		return -EINVAL;
+
+	/* Only supported if per-process address space is supported: */
+	if (priv->gpu->aspace == ctx->aspace)
+		return -EOPNOTSUPP;
+
+	return msm_gem_set_iova(obj, ctx->aspace, iova);
+}
+
 static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
@@ -736,6 +753,7 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 	switch (args->info) {
 	case MSM_INFO_GET_OFFSET:
 	case MSM_INFO_GET_IOVA:
+	case MSM_INFO_SET_IOVA:
 		/* value returned as immediate, not pointer, so len==0: */
 		if (args->len)
 			return -EINVAL;
@@ -760,6 +778,9 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 	case MSM_INFO_GET_IOVA:
 		ret = msm_ioctl_gem_info_iova(dev, file, obj, &args->value);
 		break;
+	case MSM_INFO_SET_IOVA:
+		ret = msm_ioctl_gem_info_set_iova(dev, file, obj, args->value);
+		break;
 	case MSM_INFO_SET_NAME:
 		/* length check should leave room for terminating null: */
 		if (args->len >= sizeof(msm_obj->name)) {
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index bf4af17e2f1e..3ee30b8a76bd 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -525,6 +525,54 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 	return ret;
 }
 
+static int clear_iova(struct drm_gem_object *obj,
+		      struct msm_gem_address_space *aspace)
+{
+	struct msm_gem_vma *vma = lookup_vma(obj, aspace);
+
+	if (!vma)
+		return 0;
+
+	if (msm_gem_vma_inuse(vma))
+		return -EBUSY;
+
+	msm_gem_purge_vma(vma->aspace, vma);
+	msm_gem_close_vma(vma->aspace, vma);
+	del_vma(vma);
+
+	return 0;
+}
+
+/*
+ * Get the requested iova but don't pin it.  Fails if the requested iova is
+ * not available.  Doesn't need a put because iovas are currently valid for
+ * the life of the object.
+ *
+ * Setting an iova of zero will clear the vma.
+ */
+int msm_gem_set_iova(struct drm_gem_object *obj,
+		     struct msm_gem_address_space *aspace, uint64_t iova)
+{
+	int ret = 0;
+
+	msm_gem_lock(obj);
+	if (!iova) {
+		ret = clear_iova(obj, aspace);
+	} else {
+		struct msm_gem_vma *vma;
+		vma = get_vma_locked(obj, aspace, iova, iova + obj->size);
+		if (IS_ERR(vma)) {
+			ret = PTR_ERR(vma);
+		} else if (GEM_WARN_ON(vma->iova != iova)) {
+			clear_iova(obj, aspace);
+			ret = -EBUSY;
+		}
+	}
+	msm_gem_unlock(obj);
+
+	return ret;
+}
+
 /*
  * Unpin a iova by updating the reference counts. The memory isn't actually
  * purged until something else (shrinker, mm_notifier, destroy, etc) decides
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 580b6eb95edd..c75d3b879a53 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -38,6 +38,12 @@ struct msm_gem_address_space {
 
 	/* @faults: the number of GPU hangs associated with this address space */
 	int faults;
+
+	/** @va_start: lowest possible address to allocate */
+	uint64_t va_start;
+
+	/** @va_size: the size of the address space (in bytes) */
+	uint64_t va_size;
 };
 
 struct msm_gem_address_space *
@@ -144,6 +150,8 @@ struct msm_gem_vma *msm_gem_get_vma_locked(struct drm_gem_object *obj,
 					   struct msm_gem_address_space *aspace);
 int msm_gem_get_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova);
+int msm_gem_set_iova(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace, uint64_t iova);
 int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova,
 		u64 range_start, u64 range_end);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 0cd6770faf41..3c1dc9241831 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -184,6 +184,8 @@ msm_gem_address_space_create(struct msm_mmu *mmu, const char *name,
 	spin_lock_init(&aspace->lock);
 	aspace->name = name;
 	aspace->mmu = mmu;
+	aspace->va_start = va_start;
+	aspace->va_size  = size;
 
 	drm_mm_init(&aspace->mm, va_start, size);
 
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 794ad1948497..3c7b097c4e3d 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -84,6 +84,8 @@ struct drm_msm_timespec {
 #define MSM_PARAM_SYSPROF    0x0b  /* WO: 1 preserves perfcntrs, 2 also disables suspend */
 #define MSM_PARAM_COMM       0x0c  /* WO: override for task->comm */
 #define MSM_PARAM_CMDLINE    0x0d  /* WO: override for task cmdline */
+#define MSM_PARAM_VA_START   0x0e  /* RO: start of valid GPU iova range */
+#define MSM_PARAM_VA_SIZE    0x0f  /* RO: size of valid GPU iova range (bytes) */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
@@ -135,6 +137,7 @@ struct drm_msm_gem_new {
 #define MSM_INFO_GET_IOVA	0x01   /* get iova, returned by value */
 #define MSM_INFO_SET_NAME	0x02   /* set the debug name (by pointer) */
 #define MSM_INFO_GET_NAME	0x03   /* get debug name, returned by pointer */
+#define MSM_INFO_SET_IOVA	0x04   /* set the iova, passed by value */
 
 struct drm_msm_gem_info {
 	__u32 handle;         /* in */
-- 
2.35.1

