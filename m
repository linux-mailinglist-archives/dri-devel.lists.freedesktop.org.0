Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE353B0AEA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 18:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B0B6E844;
	Tue, 22 Jun 2021 16:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9D46E81B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 16:55:35 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j2so13943789wrs.12
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 09:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BRJ7Fa1mJuTl3++jYoWn4ushqkDHMteF5gn4ybVz6+0=;
 b=IvMv3vdHYZ91hEL/KynfpxV6+4L8ou4ajjqahPGTcZ4S10dzitXscG84HwYJ+iY2Zf
 KKU/9m1R/iIBLQfal3U5Mut/Y+RSHV13ahWVSHZl7mOfHQqcjUHM2t88SHGYT3rYPbdO
 0uK5apMYRO2hVeztfRV4HaxhJuF68mVEIHm2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BRJ7Fa1mJuTl3++jYoWn4ushqkDHMteF5gn4ybVz6+0=;
 b=pQKDHkLwQdneVUriSHojjcOFewafw4ibMMhEtctoPYmR2VXHOUacgoCaUhLuWZfQx2
 PO5E3LVekFIHMHEZSRMIJr091LqqAAcZgoXw+5tzwpt3WoIhuOxKsWCErLyUrfkSzna4
 q2q+0yLdspAb9eh8kvni/eDIY6/tx7ckpi8ONsg5WoeEnt1CJ/O8reiAvee09Zq77jNP
 wNFlqE88bfMN9VxT4u04ZZlUjwbXsGUx4s4Xkn+w0p/Xna7MVQR9WCI4BEvoLLH9Yp6b
 9IcVhjVQsXIRZQP7v0Pg24qzUlWASMH1agxImZ1vyqLTXMIwkoCmTSvHiN9HSO0RFfJd
 V+Pw==
X-Gm-Message-State: AOAM531pGciFNbjc7/RKzG/5NQKnkrQWiH9uKbltTEBgnW7ZOnQWf3TM
 wDDawgfnkAISg3A4+B+UCltVUbWKDdiLjQ==
X-Google-Smtp-Source: ABdhPJyFROyUZElNtIQpPy/qKaI9zhEFfxU6W/67uGreKw+De4pA0P4o8CViyhaofqqlf55asybfbQ==
X-Received: by 2002:adf:d0c8:: with SMTP id z8mr6200814wrh.262.1624380933843; 
 Tue, 22 Jun 2021 09:55:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l23sm3632342wmc.5.2021.06.22.09.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 09:55:33 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 15/15] RFC: drm/amdgpu: Implement a proper implicit fencing
 uapi
Date: Tue, 22 Jun 2021 18:55:11 +0200
Message-Id: <20210622165511.3169559-16-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>, linaro-mm-sig@lists.linaro.org,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, Alex Deucher <alexander.deucher@amd.com>,
 mesa-dev@lists.freedesktop.org,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WARNING: Absolutely untested beyond "gcc isn't dying in agony".

Implicit fencing done properly needs to treat the implicit fencing
slots like a funny kind of IPC mailbox. In other words it needs to be
explicitly. This is the only way it will mesh well with explicit
fencing userspace like vk, and it's also the bare minimum required to
be able to manage anything else that wants to use the same buffer on
multiple engines in parallel, and still be able to share it through
implicit sync.

amdgpu completely lacks such an uapi. Fix this.

Luckily the concept of ignoring implicit fences exists already, and
takes care of all the complexities of making sure that non-optional
fences (like bo moves) are not ignored. This support was added in

commit 177ae09b5d699a5ebd1cafcee78889db968abf54
Author: Andres Rodriguez <andresx7@gmail.com>
Date:   Fri Sep 15 20:44:06 2017 -0400

    drm/amdgpu: introduce AMDGPU_GEM_CREATE_EXPLICIT_SYNC v2

Unfortuantely it's the wrong semantics, because it's a bo flag and
disables implicit sync on an allocated buffer completely.

We _do_ want implicit sync, but control it explicitly. For this we
need a flag on the drm_file, so that a given userspace (like vulkan)
can manage the implicit sync slots explicitly. The other side of the
pipeline (compositor, other process or just different stage in a media
pipeline in the same process) can then either do the same, or fully
participate in the implicit sync as implemented by the kernel by
default.

By building on the existing flag for buffers we avoid any issues with
opening up additional security concerns - anything this new flag here
allows is already.

All drivers which supports this concept of a userspace-specific
opt-out of implicit sync have a flag in their CS ioctl, but in reality
that turned out to be a bit too inflexible. See the discussion below,
let's try to do a bit better for amdgpu.

This alone only allows us to completely avoid any stalls due to
implicit sync, it does not yet allow us to use implicit sync as a
strange form of IPC for sync_file.

For that we need two more pieces:

- a way to get the current implicit sync fences out of a buffer. Could
  be done in a driver ioctl, but everyone needs this, and generally a
  dma-buf is involved anyway to establish the sharing. So an ioctl on
  the dma-buf makes a ton more sense:

  https://lore.kernel.org/dri-devel/20210520190007.534046-4-jason@jlekstrand.net/

  Current drivers in upstream solves this by having the opt-out flag
  on their CS ioctl. This has the downside that very often the CS
  which must actually stall for the implicit fence is run a while
  after the implicit fence point was logically sampled per the api
  spec (vk passes an explicit syncobj around for that afaiui), and so
  results in oversync. Converting the implicit sync fences into a
  snap-shot sync_file is actually accurate.

- Simillar we need to be able to set the exclusive implicit fence.
  Current drivers again do this with a CS ioctl flag, with again the
  same problems that the time the CS happens additional dependencies
  have been added. An explicit ioctl to only insert a sync_file (while
  respecting the rules for how exclusive and shared fence slots must
  be update in struct dma_resv) is much better. This is proposed here:

  https://lore.kernel.org/dri-devel/20210520190007.534046-5-jason@jlekstrand.net/

These three pieces together allow userspace to fully control implicit
fencing and remove all unecessary stall points due to them.

Well, as much as the implicit fencing model fundamentally allows:
There is only one set of fences, you can only choose to sync against
only writers (exclusive slot), or everyone. Hence suballocating
multiple buffers or anything else like this is fundamentally not
possible, and can only be fixed by a proper explicit fencing model.

Aside from that caveat this model gets implicit fencing as closely to
explicit fencing semantics as possible:

On the actual implementation I opted for a simple setparam ioctl, no
locking (just atomic reads/writes) for simplicity. There is a nice
flag parameter in the VM ioctl which we could use, except:
- it's not checked, so userspace likely passes garbage
- there's already a comment that userspace _does_ pass garbage in the
  priority field
So yeah unfortunately this flag parameter for setting vm flags is
useless, and we need to hack up a new one.

v2: Explain why a new SETPARAM (Jason)

v3: Bas noticed I forgot to hook up the dependency-side shortcut. We
need both, or this doesn't do much.

v4: Rebase over the amdgpu patch to always set the implicit sync
fences.

Cc: mesa-dev@lists.freedesktop.org
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>
Cc: Kristian H. Kristensen <hoegsberg@google.com>
Cc: Michel Dänzer <michel@daenzer.net>
Cc: Daniel Stone <daniels@collabora.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Deepak R Varma <mh12gx2825@gmail.com>
Cc: Chen Li <chenli@uniontech.com>
Cc: Kevin Wang <kevin1.wang@amd.com>
Cc: Dennis Li <Dennis.Li@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  7 +++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  6 ++++++
 include/uapi/drm/amdgpu_drm.h           | 10 ++++++++++
 4 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 65df34c17264..c5386d13eb4a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -498,6 +498,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 	struct amdgpu_bo *gds;
 	struct amdgpu_bo *gws;
 	struct amdgpu_bo *oa;
+	bool no_implicit_sync = READ_ONCE(fpriv->vm.no_implicit_sync);
 	int r;
 
 	INIT_LIST_HEAD(&p->validated);
@@ -577,7 +578,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 
 		e->bo_va = amdgpu_vm_bo_find(vm, bo);
 
-		if (bo->tbo.base.dma_buf && !amdgpu_bo_explicit_sync(bo)) {
+		if (bo->tbo.base.dma_buf &&
+		    !(no_implicit_sync || amdgpu_bo_explicit_sync(bo))) {
 			e->chain = dma_fence_chain_alloc();
 			if (!e->chain) {
 				r = -ENOMEM;
@@ -649,6 +651,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 {
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
 	struct amdgpu_bo_list_entry *e;
+	bool no_implicit_sync = READ_ONCE(fpriv->vm.no_implicit_sync);
 	int r;
 
 	list_for_each_entry(e, &p->validated, tv.head) {
@@ -656,7 +659,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 		struct dma_resv *resv = bo->tbo.base.resv;
 		enum amdgpu_sync_mode sync_mode;
 
-		sync_mode = amdgpu_bo_explicit_sync(bo) ?
+		sync_mode = no_implicit_sync || amdgpu_bo_explicit_sync(bo) ?
 			AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
 		r = amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode,
 				     &fpriv->vm);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index c080ba15ae77..f982626b5328 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1724,6 +1724,26 @@ int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv)
 	return 0;
 }
 
+int amdgpu_setparam_ioctl(struct drm_device *dev, void *data,
+			  struct drm_file *filp)
+{
+	struct drm_amdgpu_setparam *setparam = data;
+	struct amdgpu_fpriv *fpriv = filp->driver_priv;
+
+	switch (setparam->param) {
+	case AMDGPU_SETPARAM_NO_IMPLICIT_SYNC:
+		if (setparam->value)
+			WRITE_ONCE(fpriv->vm.no_implicit_sync, true);
+		else
+			WRITE_ONCE(fpriv->vm.no_implicit_sync, false);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
 	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_CREATE, amdgpu_gem_create_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_CTX, amdgpu_ctx_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
@@ -1742,6 +1762,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
 	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_VA, amdgpu_gem_va_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_OP, amdgpu_gem_op_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_USERPTR, amdgpu_gem_userptr_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_SETPARAM, amdgpu_setparam_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 };
 
 static const struct drm_driver amdgpu_kms_driver = {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index ddb85a85cbba..0e8c440c6303 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -321,6 +321,12 @@ struct amdgpu_vm {
 	bool			bulk_moveable;
 	/* Flag to indicate if VM is used for compute */
 	bool			is_compute_context;
+	/*
+	 * Flag to indicate whether implicit sync should always be skipped on
+	 * this context. We do not care about races at all, userspace is allowed
+	 * to shoot itself with implicit sync to its fullest liking.
+	 */
+	bool no_implicit_sync;
 };
 
 struct amdgpu_vm_manager {
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 0cbd1540aeac..9eae245c14d6 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -54,6 +54,7 @@ extern "C" {
 #define DRM_AMDGPU_VM			0x13
 #define DRM_AMDGPU_FENCE_TO_HANDLE	0x14
 #define DRM_AMDGPU_SCHED		0x15
+#define DRM_AMDGPU_SETPARAM		0x16
 
 #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
 #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
@@ -71,6 +72,7 @@ extern "C" {
 #define DRM_IOCTL_AMDGPU_VM		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_VM, union drm_amdgpu_vm)
 #define DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_FENCE_TO_HANDLE, union drm_amdgpu_fence_to_handle)
 #define DRM_IOCTL_AMDGPU_SCHED		DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_SCHED, union drm_amdgpu_sched)
+#define DRM_IOCTL_AMDGPU_SETPARAM	DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_SETPARAM, struct drm_amdgpu_setparam)
 
 /**
  * DOC: memory domains
@@ -306,6 +308,14 @@ union drm_amdgpu_sched {
 	struct drm_amdgpu_sched_in in;
 };
 
+#define AMDGPU_SETPARAM_NO_IMPLICIT_SYNC	1
+
+struct drm_amdgpu_setparam {
+	/* AMDGPU_SETPARAM_* */
+	__u32	param;
+	__u32	value;
+};
+
 /*
  * This is not a reliable API and you should expect it to fail for any
  * number of reasons and have fallback path that do not use userptr to
-- 
2.32.0.rc2

