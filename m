Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC6C4DD09A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 23:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29CD10E12C;
	Thu, 17 Mar 2022 22:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80EF10E12C;
 Thu, 17 Mar 2022 22:16:55 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 bx24-20020a17090af49800b001c6872a9e4eso2646607pjb.5; 
 Thu, 17 Mar 2022 15:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RtWitl79lgCs7HDZsX/B/PPKM0tEM+ZKMdXbsHiBJZo=;
 b=Ech4xQMoXfKpgERat3wvFZGhaAg5dtFwnIbOcH71ipOMCxrvp0yPFCQdDh4P1f5Son
 Sc3NjimpIcFK6/UHTsB5mjlnDjoZMQQJyxm1K7qJFhV9u0Ef3Eo/vnDg4Pj2Efszxnjs
 2bHfo4Nd808pBodG1FYt8wGTd3psPud/MoFw/7M44sZxXi73Vc/3FwAdxjtYo8kbhoBe
 bU+UQgVDu4Cw0nx2aTlVNShR8gx2s8tvD64qrk0972c20MwqYVqgyn9ncbH5YBqijDD5
 vtmXLK3wz8ARBN2mGB9fTvEbJ3YaONTWqRAzd7uURz8nEANoc2RYMet2NeDxv/Bo6Oao
 gXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RtWitl79lgCs7HDZsX/B/PPKM0tEM+ZKMdXbsHiBJZo=;
 b=VXN5nswO8Tt44T2oLiVkDqHEBDB2TLBJdHG/NkFVBNK/0481F+YrN0n7jTd6Hy6K3a
 l3RPQc6RTyFAkMszRnxMLIJ0t+VbS2g37htBiX+MI7LrWHYRceE89YT87fW/NzmRapPr
 3kgWtsk1A2OqBKwZ2mkD3bBh2xC0VRCg/1m7I9jHJGfev1zBVR2RXLpftCe0DgnKgEnb
 IySgc31hfdg8U9QXPZNpMfT6FFx8yW1WXPgLUbfdRk3W+E+0zW2qKc/i03Nm8f8P1nnR
 w3evrKrxbD4TjLib84asK1igzb64nqLnppSMm9vQawMALXGKOAx5LVPbVBM1uRrjk0Zs
 xvIg==
X-Gm-Message-State: AOAM531KXQTYkH/c5hoHa7h5IVb9fOXJGvOZLCmnG8rwMsZOE6wYA5nz
 js5+7RP1axo2SQkM5ISgFuGokjVyn8E=
X-Google-Smtp-Source: ABdhPJxSNY+wd8cOCFKVvqYX3NVor18dZh3gHfdJqnqaRm04JhZ0qekm5Jykk6q4ELrUoUAhvMY/fQ==
X-Received: by 2002:a17:902:ab01:b0:153:2dec:6761 with SMTP id
 ik1-20020a170902ab0100b001532dec6761mr7032370plb.71.1647555414778; 
 Thu, 17 Mar 2022 15:16:54 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 3-20020a17090a190300b001c61add3386sm6357822pjg.35.2022.03.17.15.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 15:16:53 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC] drm/msm: Add a way for userspace to allocate GPU iova
Date: Thu, 17 Mar 2022 15:17:42 -0700
Message-Id: <20220317221742.258537-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The motivation at this point is mainly native userspace mesa driver in a
VM guest.  The one remaining synchronous "hotpath" is buffer allocation,
because guest needs to wait to know the bo's iova before it can start
emitting cmdstream/state that references the new bo.  By allocating the
iova in the guest userspace, we no longer need to wait for a response
from the host, but can just rely on the allocation request being
processed before the cmdstream submission.  Allocation faulures (OoM,
etc) would just be treated as context-lost (ie. GL_GUILTY_CONTEXT_RESET)
or subsequent allocations (or readpix, etc) can raise GL_OUT_OF_MEMORY.

TODO bump uapi version, or combine w/ other changes that bump uapi
version

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
So, I was initially planning on adding some extra guard-rails, ie.
some userspace opt-in and preventing mixing of kernel and userspace
allocated iova.  Because in general mixing and matching userspace and
kernel allocated iova is not going to go over too well.

But the address-space is per drm_file, and I couldn't come up with
any scenario where, on a given drm device fd, we would be trying to
mix/match userspace doing kernel iova allocation vs userspace iova
allocation.

Ofc, now is a good time to prove me wrong ;-)

 drivers/gpu/drm/msm/msm_drv.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem.h |  2 ++
 include/uapi/drm/msm_drm.h    |  1 +
 4 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index a5eed5738ac8..7394312cf075 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -719,6 +719,23 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
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
+		return -EINVAL;
+
+	return msm_gem_set_iova(obj, ctx->aspace, iova);
+}
+
 static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
@@ -733,6 +750,7 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 	switch (args->info) {
 	case MSM_INFO_GET_OFFSET:
 	case MSM_INFO_GET_IOVA:
+	case MSM_INFO_SET_IOVA:
 		/* value returned as immediate, not pointer, so len==0: */
 		if (args->len)
 			return -EINVAL;
@@ -757,6 +775,9 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
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
index a4f61972667b..41ae8d9c8b3c 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -510,6 +510,26 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 	return ret;
 }
 
+/*
+ * Get the requested iova but don't pin it.  Fails if the requested iova is
+ * not available.  Doesn't need a put because iovas are currently valid for
+ * the life of the object
+ */
+int msm_gem_set_iova(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace, uint64_t iova)
+{
+	int ret;
+	uint64_t assigned_iova;
+
+	msm_gem_lock(obj);
+	ret = get_iova_locked(obj, aspace, &assigned_iova,
+			      iova >> PAGE_SHIFT,
+			      (iova + obj->size) >> PAGE_SHIFT);
+	msm_gem_unlock(obj);
+
+	return ret;
+}
+
 /* get iova without taking a reference, used in places where you have
  * already done a 'msm_gem_get_and_pin_iova' or 'msm_gem_get_iova'
  */
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 58e11c282928..40d839f61d15 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -112,6 +112,8 @@ struct msm_gem_object {
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
 int msm_gem_get_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova);
+int msm_gem_set_iova(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace, uint64_t iova);
 int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova,
 		u64 range_start, u64 range_end);
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 794ad1948497..4fe9cac05981 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -135,6 +135,7 @@ struct drm_msm_gem_new {
 #define MSM_INFO_GET_IOVA	0x01   /* get iova, returned by value */
 #define MSM_INFO_SET_NAME	0x02   /* set the debug name (by pointer) */
 #define MSM_INFO_GET_NAME	0x03   /* get debug name, returned by pointer */
+#define MSM_INFO_SET_IOVA	0x04   /* set the iova, passed by value */
 
 struct drm_msm_gem_info {
 	__u32 handle;         /* in */
-- 
2.35.1

