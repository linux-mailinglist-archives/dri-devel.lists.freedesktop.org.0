Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79F594AD10
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 17:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFEE010E165;
	Wed,  7 Aug 2024 15:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="srDHRgoi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2056F10E164
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 15:39:47 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-70968db52d0so1911615a34.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 08:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1723045186; x=1723649986;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A06tRfiwfCkx1WNzqGwjLdiLkyRdih/rggP792iOIho=;
 b=srDHRgoi4WXh3pQsWQAbVpvP0GZW/h6QjbjW8lhuPkVlNYlSQeb+2OvItuuPHsfSVj
 kHMcutkrqvWoZkFpQhtetJ+sELl2s1+KvkwNG1qu3F402b2KNh40iVBYZ07QBryPT9pV
 qK6c36TKl5vTFYWN/WLpWIZL4wDsBDsDaPRxDpNM/lYzTO6ehOxceNMGLLZM3IXNssa4
 SrofAzCVgorFsEEcT40YT6cAZUegbawUV3sSmXuiIEjSE12QUSaXMoAd/ZaBeihtjURq
 rGMuVBokqlYnnZUMmyJLsKq/5/FEpM8qAoJIudnSQzVS3ucrIA0KwS4/85qKQabhMbKL
 jWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723045186; x=1723649986;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A06tRfiwfCkx1WNzqGwjLdiLkyRdih/rggP792iOIho=;
 b=uWdclnQt6NkQC/8ATM2HQ5yRmbOqHbmF7PSuX+ln0e3EZqXcPvXsSi7OP4S9mULgUo
 +ICPb4UTtFJu71EPwNSoS74pvKlwDwf8GgQbbPZJbnL5VTahG5sS7v1W736NzAM+bQoB
 uJ3u30Abm8dnkj3K29rVxuvt5yFhy+GyxJEmTAMPnRULiaDIlO067RplQ5ilDyPbq00L
 1NPGHr9r8tpxnVTlW6jpEvMK0NzQyPsg9+PtAQPcGsXD6LwRj7+eubJgr0LApebSEy1k
 lNYZRNvZtVSSMHz8XUSoowB0VPEVIn9GScBcFQXugwf/Bldp3VCwrViv3zjcXq/nMcRg
 IpEg==
X-Gm-Message-State: AOJu0YySgQG9DHVzNkSYbZy8Hfs0lp1AQrPNP6xVmt5yIC5hbMX/2/X7
 jO18fhESv3LtxwUQG95CPf4ssFCBuzJjDA+uF0oHDjJwB42wRwkOcbgC2W4Ccvi/oMykBHOaZSy
 E
X-Google-Smtp-Source: AGHT+IEMwHN2wox1SG7h7oRjR6P0gDvlIV5Le5mfAYhb6p1gy4WtY/QXw2Ij4tw6aG3rBSBTq8KUEQ==
X-Received: by 2002:a05:6830:488f:b0:703:5efa:3ce4 with SMTP id
 46e09a7af769-709ad851fefmr25820834a34.4.1723045185549; 
 Wed, 07 Aug 2024 08:39:45 -0700 (PDT)
Received: from kermit.lan ([136.62.87.188]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-70a3a75085csm4666594a34.51.2024.08.07.08.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 08:39:44 -0700 (PDT)
From: Faith Ekstrand <faith@gfxstrand.net>
X-Google-Original-From: Faith Ekstrand <faith.ekstrand@collabora.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Subject: [RFC] amdgpu: Add a context flag to disable implicit sync
Date: Wed,  7 Aug 2024 10:39:32 -0500
Message-ID: <20240807153941.3668940-1-faith.ekstrand@collabora.com>
X-Mailer: git-send-email 2.45.2
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

Previously, AMDGPU_GEM_CREATE_EXPLICIT_SYNC was used to disable implicit
synchronization on BOs when explicit synchronization can be used.  The
problem is that this flag is per-BO and affects all amdgpu users in the
system, not just the usermode drver which sets it.  This can lead to
some unintended consequences for userspace if not used carefully.

Since the introduction of DMA_BUF_IOCTL_EXPORT_SYNC_FILE and
DMA_BUF_IOCTL_IMPORT_SYNC_FILE, many userspace window system components
have grown the ability to convert between the Vulkan explicit sync model
and the legacy implicit sync model used by X11 and Wayland in the past.
This allows both old and new components to exist simultaneously and talk
to each other.  In particular, XWayland is able to convert between the
two to let Vulkan apps work seamlessly with older X11 compositors that
aren't aware of explicit synchronizaiton.  This is rapidly becoming the
backbone of synchronization in the Linux window system space.

Unfortunately, AMDGPU_GEM_CREATE_EXPLICIT_SYNC breaks this because it
disables all implicit synchronization on the given BO, regardless of
which userspace driver is rendering with it and regardless of the
assumptions made by the client application.  In particular, this is
causing issues with RADV and radeonsi.  RADV sets the flag to disable
implicit sync on window system buffers so that it can safely have them
resident at all times without causing internal over-synchronization.
The BO is then handed off to a compositor which composites using
radeonsi.  If the compositor uses the EGL_ANDROID_native_fence_sync
extension to pass explicit sync files through to radeonsi, then
everything is fine.  However, if that buffer ever gets handed to an
instance of radeonsi with any assumption of implicit synchronization,
radeonsi won't be able sync on the BO because RADV disabled implict sync
on that BO system-wide.  It doesn't matter whether some window system
component used DMA_BUF_IOCTL_IMPORT_SYNC_FILE to set the appropriate
fence on the BO, amdgpu will ignore it.

This new flag disables implicit sync on the context rather than the BO.
This way RADV can disable implicit sync (which is what RADV has always
wanted) without affecting other components in the system.  If RADV (or
some other driver) wants implicit sync on some BO, it can use
DMA_BUF_IOCTL_EXPORT_SYNC_FILE and DMA_BUF_IOCTL_IMPORT_SYNC_FILE to
manually synchronize with other implicit-sync components.  This is the
approach we've taken with NVK/nouveau, ANV/xe, and similar to the
approach taken by ANV/i915 and it works well for those drivers.

Ideally, I would like to see something like this back-ported to at least
the kernel where DMA_BUF_IOCTL_IMPORT/EXPORT_SYNC_FILE were introduced
so that we don't have to wait another year for the fix to reach users.
However, I understand that back-porting UAPI is problematic and I'll
leave that decision up to the amdgpu maintainers.  Michel suggested that
a new CTX_OP would make more sense if we want to back-port it but the
create flag made more sense to me from an API design PoV.

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Michel Dänzer <mdaenzer@redhat.com>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 12 ++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  7 +++++++
 include/uapi/drm/amdgpu_drm.h           | 12 +++++++++++-
 4 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index ec888fc6ead8..8410b4426541 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1196,7 +1196,8 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 		struct dma_resv *resv = bo->tbo.base.resv;
 		enum amdgpu_sync_mode sync_mode;
 
-		sync_mode = amdgpu_bo_explicit_sync(bo) ?
+		sync_mode = (amdgpu_ctx_explicit_sync(p->ctx) ||
+			     amdgpu_bo_explicit_sync(bo)) ?
 			AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
 		r = amdgpu_sync_resv(p->adev, &p->sync, resv, sync_mode,
 				     &fpriv->vm);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 5cb33ac99f70..a304740ccedf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -318,7 +318,8 @@ static int amdgpu_ctx_get_stable_pstate(struct amdgpu_ctx *ctx,
 }
 
 static int amdgpu_ctx_init(struct amdgpu_ctx_mgr *mgr, int32_t priority,
-			   struct drm_file *filp, struct amdgpu_ctx *ctx)
+			   uint32_t flags, struct drm_file *filp,
+			   struct amdgpu_ctx *ctx)
 {
 	struct amdgpu_fpriv *fpriv = filp->driver_priv;
 	u32 current_stable_pstate;
@@ -334,6 +335,7 @@ static int amdgpu_ctx_init(struct amdgpu_ctx_mgr *mgr, int32_t priority,
 	ctx->mgr = mgr;
 	spin_lock_init(&ctx->ring_lock);
 
+	ctx->flags = flags;
 	ctx->reset_counter = atomic_read(&mgr->adev->gpu_reset_counter);
 	ctx->reset_counter_query = ctx->reset_counter;
 	ctx->generation = amdgpu_vm_generation(mgr->adev, &fpriv->vm);
@@ -474,6 +476,7 @@ static int amdgpu_ctx_alloc(struct amdgpu_device *adev,
 			    struct amdgpu_fpriv *fpriv,
 			    struct drm_file *filp,
 			    int32_t priority,
+			    uint32_t flags,
 			    uint32_t *id)
 {
 	struct amdgpu_ctx_mgr *mgr = &fpriv->ctx_mgr;
@@ -493,7 +496,7 @@ static int amdgpu_ctx_alloc(struct amdgpu_device *adev,
 	}
 
 	*id = (uint32_t)r;
-	r = amdgpu_ctx_init(mgr, priority, filp, ctx);
+	r = amdgpu_ctx_init(mgr, priority, flags, filp, ctx);
 	if (r) {
 		idr_remove(&mgr->ctx_handles, *id);
 		*id = 0;
@@ -666,7 +669,7 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *filp)
 {
 	int r;
-	uint32_t id, stable_pstate;
+	uint32_t id, stable_pstate, flags;
 	int32_t priority;
 
 	union drm_amdgpu_ctx *args = data;
@@ -675,6 +678,7 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
 
 	id = args->in.ctx_id;
 	priority = args->in.priority;
+	flags = args->in.flags;
 
 	/* For backwards compatibility, we need to accept ioctls with garbage
 	 * in the priority field. Garbage values in the priority field, result
@@ -685,7 +689,7 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
 
 	switch (args->in.op) {
 	case AMDGPU_CTX_OP_ALLOC_CTX:
-		r = amdgpu_ctx_alloc(adev, fpriv, filp, priority, &id);
+		r = amdgpu_ctx_alloc(adev, fpriv, filp, priority, flags, &id);
 		args->out.alloc.ctx_id = id;
 		break;
 	case AMDGPU_CTX_OP_FREE_CTX:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
index 85376baaa92f..9431c8d2ea59 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
@@ -45,6 +45,7 @@ struct amdgpu_ctx_entity {
 struct amdgpu_ctx {
 	struct kref			refcount;
 	struct amdgpu_ctx_mgr		*mgr;
+	uint32_t			flags;
 	unsigned			reset_counter;
 	unsigned			reset_counter_query;
 	uint64_t			generation;
@@ -84,6 +85,12 @@ struct dma_fence *amdgpu_ctx_get_fence(struct amdgpu_ctx *ctx,
 bool amdgpu_ctx_priority_is_valid(int32_t ctx_prio);
 void amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx, int32_t ctx_prio);
 
+static inline bool
+amdgpu_ctx_explicit_sync(struct amdgpu_ctx *ctx)
+{
+	return ctx->flags & AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC;
+}
+
 int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *filp);
 
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 96e32dafd4f0..e9d87a6e3d86 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -125,7 +125,14 @@ extern "C" {
 #define AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS	(1 << 5)
 /* Flag that BO is always valid in this VM */
 #define AMDGPU_GEM_CREATE_VM_ALWAYS_VALID	(1 << 6)
-/* Flag that BO sharing will be explicitly synchronized */
+/* Flag that BO sharing will be explicitly synchronized
+ *
+ * This flag should not be used unless the client can guarantee that no
+ * other driver which ever touches this BO will ever want to use implicit
+ * synchronization as it disables implicit sync on this BO system-wide.
+ * Instead, drivers which use an explicit synchronization model should
+ * prefer AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC.
+ */
 #define AMDGPU_GEM_CREATE_EXPLICIT_SYNC		(1 << 7)
 /* Flag that indicates allocating MQD gart on GFX9, where the mtype
  * for the second page onward should be set to NC. It should never
@@ -240,6 +247,9 @@ union drm_amdgpu_bo_list {
 #define AMDGPU_CTX_OP_GET_STABLE_PSTATE	5
 #define AMDGPU_CTX_OP_SET_STABLE_PSTATE	6
 
+/* indicate that all synchronization will be explicit */
+#define AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC (1<<0)
+
 /* GPU reset status */
 #define AMDGPU_CTX_NO_RESET		0
 /* this the context caused it */
-- 
2.45.2

