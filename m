Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A024F6D44
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 23:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125F410E658;
	Wed,  6 Apr 2022 21:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B397410E658;
 Wed,  6 Apr 2022 21:46:55 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 l4-20020a17090a49c400b001c6840df4a3so4225438pjm.0; 
 Wed, 06 Apr 2022 14:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YPzsprcAWsqrwWakA9Ciodx92zg09lPCp1+8pJTWeds=;
 b=kdbzt1tG4Q+iXEUS2HYgVvOqb1rXJiVH+ppx6xZcJNktLBqKJTH86fnTQy3rQZzmxu
 K1et1JfqTjeL5rUhovd0J+nsMv9lllBILH0kEFGGHRhtsgt7FNNDvDbJUkKXfUwI7bGf
 Oo+jeBtnsQW8t7M2/TnNrBeKKg9kfGrbmygNXK7cEs71AqW8W/NUe3nMZmnW01DETjg1
 xdYej1tRmR9WTckYFqaaBuitaETl/x51FDyQyAVNdzX0S6UWZURR9j1UrhospI4riZpr
 lY9lr/mQuU3Ghi2P4WrBLqJlcFEOaUbuCWooln6ycyxFe0T0LZRrF6fvw8NE5AVPAEii
 MUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YPzsprcAWsqrwWakA9Ciodx92zg09lPCp1+8pJTWeds=;
 b=IQeUSD+10/3BiLzW9XXOSUaU1lCurfm0yhllxt/iQ18qPz+qd/EPDJ7T4RGTVOgTu5
 qqQU/5q0ASQW4vF8iCEA32R02z5CEucfPsM4vpxkv/LCxT9+U4a9K2H+AY+8E9V+9S1U
 uepYw9uj1ZN+5JmMbM0kZVr3QfmR5seEN9whsCQsw/2d3FBhJpTetRqBp5vFOpUQAipv
 9oEYZGFJWtattf+hxtQ10yrXODKHhV7dgk3f70OAQUw55sjroZpiYVEUwwISUhFDLgc1
 0NuX9b7jqG+7Dg+8Set6szbQRp2n+fz6+wsX4oCUnmx9u+od92XXKwM7A3UVadq3aDCF
 JzEQ==
X-Gm-Message-State: AOAM531XweXZ2xUQ+Lcz1jzKYz4bjPDTyoZA668Z373s65zLzZVpa+U6
 UHnX4A+ULMVyRmU6zA+bBrMq8EKJqLQ=
X-Google-Smtp-Source: ABdhPJwYumXvLka0QXC7th+Qn497ZDA703hb5H9vrZff6ta8ovqmT+6VgvS7bP5o3bY0wRnmQ953tQ==
X-Received: by 2002:a17:90a:b00f:b0:1c9:9205:433 with SMTP id
 x15-20020a17090ab00f00b001c992050433mr12061046pjq.116.1649281614677; 
 Wed, 06 Apr 2022 14:46:54 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 x36-20020a634a24000000b0039cc6fff510sm20503pga.58.2022.04.06.14.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 14:46:53 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 10/10] drm/msm: Add a way for userspace to allocate GPU iova
Date: Wed,  6 Apr 2022 14:46:26 -0700
Message-Id: <20220406214636.1156978-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406214636.1156978-1-robdclark@gmail.com>
References: <20220406214636.1156978-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
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
index 38d66e1248b1..efa2e5c19f1e 100644
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
index 6f9a402450f9..354f91aff573 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -182,6 +182,8 @@ msm_gem_address_space_create(struct msm_mmu *mmu, const char *name,
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

