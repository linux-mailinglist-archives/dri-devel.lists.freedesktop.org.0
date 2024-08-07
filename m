Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC4C94B082
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 21:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AFC10E19E;
	Wed,  7 Aug 2024 19:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=froggi.es header.i=joshua@froggi.es header.b="Bph4svVr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 901 seconds by postgrey-1.36 at gabe;
 Wed, 07 Aug 2024 19:38:25 UTC
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF5610E06A;
 Wed,  7 Aug 2024 19:38:25 +0000 (UTC)
Delivered-To: faith.ekstrand@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723058600; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nah0cVy0A5gOlGcNIZF48x4PaSW6SR1PwH8tSfvyHS3LVTGJowrfuQwpeaXphGGoqQzWeIs40z9u2Bf+N1jQDSyM0RjRH91yIxvWyfgITzH+UV+MLqCRObTuQ5vH7F9d3QHMsRdMMUPAvPZ1Wh0spRkM8ol0f656yI3rqdchMy4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723058600;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=zwcOSNY1ckd7EQGZppjFSOYxDzYRcNi//rC030snlD0=; 
 b=aHwHeVNdtBPbgMc8dLbymdAKXfeylmJdSb9hPaAGHGBK7b13SJL1qgIkhygBSolUn0KtuPPVVv8eZvlFxZrq9gNscTnGjlkv0eIa21hVvH2UU/WH0Cd9xvRtZjoC8wQNxgez/1csYTHwx+rQ4fuN+pt60rqAx5EGS0HHKdzs/FE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=froggi.es;
 spf=pass  smtp.mailfrom=joshua@froggi.es;
 dmarc=pass header.from=<joshua@froggi.es>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723058600; 
 s=mail; d=froggi.es; i=joshua@froggi.es;
 h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=zwcOSNY1ckd7EQGZppjFSOYxDzYRcNi//rC030snlD0=;
 b=Bph4svVrjb0s7oJXH3NlQ/B6FqziRBXYaMGyOXT/mLmb4T4vkxWrXvS1OwUDJCCd
 Fkt7/DDO1pdUvGIWIRg2Z6RpC1/buxRvS7BlhobVbws5LZ/0jGa3O71sBQ4fNPnPdb7
 TW8yPLrIf/0QsqPUyR8CcxVP5veuCxhZVao0+QK4=
Received: by mx.zohomail.com with SMTPS id 1723058597959117.43025042041234;
 Wed, 7 Aug 2024 12:23:17 -0700 (PDT)
Date: Wed, 07 Aug 2024 20:23:13 +0100
From: Joshua Ashton <joshua@froggi.es>
To: amd-gfx@lists.freedesktop.org, Faith Ekstrand <faith@gfxstrand.net>,
 dri-devel@lists.freedesktop.org
CC: Faith Ekstrand <faith.ekstrand@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?ISO-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>,
 =?ISO-8859-1?Q?Michel_D=E4nzer?= <mdaenzer@redhat.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Subject: Re: [RFC] amdgpu: Add a context flag to disable implicit sync
User-Agent: K-9 Mail for Android
In-Reply-To: <20240807153941.3668940-1-faith.ekstrand@collabora.com>
References: <20240807153941.3668940-1-faith.ekstrand@collabora.com>
Message-ID: <B37A903E-E670-4548-BDBB-4651D2DC7D15@froggi.es>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
X-ZohoMail-Owner: <B37A903E-E670-4548-BDBB-4651D2DC7D15@froggi.es>+zmo_0_
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

I was thinking about this more recently=2E I was initially considering "may=
be this should be a per-BO import," but I couldn't think of anything in the=
 GL model that would actually benefit given its not "true" bindless and the=
re's no update-after-bind there=2E

Worth others more familiar with GL asking that question to themselves also=
=2E I am definitely not totally up on what's possible there=2E

Overall, I think I am OK with this approach, even though I think mixing im=
plicit and explicit sync is gross, and I want the pain that is implicit syn=
c to just go away forever=2E :-)

- Joshie =F0=9F=90=B8=E2=9C=A8


On August 7, 2024 4:39:32 PM GMT+01:00, Faith Ekstrand <faith@gfxstrand=2E=
net> wrote:
>Previously, AMDGPU_GEM_CREATE_EXPLICIT_SYNC was used to disable implicit
>synchronization on BOs when explicit synchronization can be used=2E  The
>problem is that this flag is per-BO and affects all amdgpu users in the
>system, not just the usermode drver which sets it=2E  This can lead to
>some unintended consequences for userspace if not used carefully=2E
>
>Since the introduction of DMA_BUF_IOCTL_EXPORT_SYNC_FILE and
>DMA_BUF_IOCTL_IMPORT_SYNC_FILE, many userspace window system components
>have grown the ability to convert between the Vulkan explicit sync model
>and the legacy implicit sync model used by X11 and Wayland in the past=2E
>This allows both old and new components to exist simultaneously and talk
>to each other=2E  In particular, XWayland is able to convert between the
>two to let Vulkan apps work seamlessly with older X11 compositors that
>aren't aware of explicit synchronizaiton=2E  This is rapidly becoming the
>backbone of synchronization in the Linux window system space=2E
>
>Unfortunately, AMDGPU_GEM_CREATE_EXPLICIT_SYNC breaks this because it
>disables all implicit synchronization on the given BO, regardless of
>which userspace driver is rendering with it and regardless of the
>assumptions made by the client application=2E  In particular, this is
>causing issues with RADV and radeonsi=2E  RADV sets the flag to disable
>implicit sync on window system buffers so that it can safely have them
>resident at all times without causing internal over-synchronization=2E
>The BO is then handed off to a compositor which composites using
>radeonsi=2E  If the compositor uses the EGL_ANDROID_native_fence_sync
>extension to pass explicit sync files through to radeonsi, then
>everything is fine=2E  However, if that buffer ever gets handed to an
>instance of radeonsi with any assumption of implicit synchronization,
>radeonsi won't be able sync on the BO because RADV disabled implict sync
>on that BO system-wide=2E  It doesn't matter whether some window system
>component used DMA_BUF_IOCTL_IMPORT_SYNC_FILE to set the appropriate
>fence on the BO, amdgpu will ignore it=2E
>
>This new flag disables implicit sync on the context rather than the BO=2E
>This way RADV can disable implicit sync (which is what RADV has always
>wanted) without affecting other components in the system=2E  If RADV (or
>some other driver) wants implicit sync on some BO, it can use
>DMA_BUF_IOCTL_EXPORT_SYNC_FILE and DMA_BUF_IOCTL_IMPORT_SYNC_FILE to
>manually synchronize with other implicit-sync components=2E  This is the
>approach we've taken with NVK/nouveau, ANV/xe, and similar to the
>approach taken by ANV/i915 and it works well for those drivers=2E
>
>Ideally, I would like to see something like this back-ported to at least
>the kernel where DMA_BUF_IOCTL_IMPORT/EXPORT_SYNC_FILE were introduced
>so that we don't have to wait another year for the fix to reach users=2E
>However, I understand that back-porting UAPI is problematic and I'll
>leave that decision up to the amdgpu maintainers=2E  Michel suggested tha=
t
>a new CTX_OP would make more sense if we want to back-port it but the
>create flag made more sense to me from an API design PoV=2E
>
>Signed-off-by: Faith Ekstrand <faith=2Eekstrand@collabora=2Ecom>
>Cc: Alex Deucher <alexander=2Edeucher@amd=2Ecom>
>Cc: Christian K=C3=B6nig <christian=2Ekoenig@amd=2Ecom>
>Cc: David Airlie <airlied@gmail=2Ecom>
>Cc: Michel D=C3=A4nzer <mdaenzer@redhat=2Ecom>
>Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen=2Enl>
>---
> drivers/gpu/drm/amd/amdgpu/amdgpu_cs=2Ec  |  3 ++-
> drivers/gpu/drm/amd/amdgpu/amdgpu_ctx=2Ec | 12 ++++++++----
> drivers/gpu/drm/amd/amdgpu/amdgpu_ctx=2Eh |  7 +++++++
> include/uapi/drm/amdgpu_drm=2Eh           | 12 +++++++++++-
> 4 files changed, 28 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs=2Ec b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_cs=2Ec
>index ec888fc6ead8=2E=2E8410b4426541 100644
>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs=2Ec
>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs=2Ec
>@@ -1196,7 +1196,8 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_pa=
rser *p)
> 		struct dma_resv *resv =3D bo->tbo=2Ebase=2Eresv;
> 		enum amdgpu_sync_mode sync_mode;
>=20
>-		sync_mode =3D amdgpu_bo_explicit_sync(bo) ?
>+		sync_mode =3D (amdgpu_ctx_explicit_sync(p->ctx) ||
>+			     amdgpu_bo_explicit_sync(bo)) ?
> 			AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
> 		r =3D amdgpu_sync_resv(p->adev, &p->sync, resv, sync_mode,
> 				     &fpriv->vm);
>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx=2Ec b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ctx=2Ec
>index 5cb33ac99f70=2E=2Ea304740ccedf 100644
>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx=2Ec
>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx=2Ec
>@@ -318,7 +318,8 @@ static int amdgpu_ctx_get_stable_pstate(struct amdgpu=
_ctx *ctx,
> }
>=20
> static int amdgpu_ctx_init(struct amdgpu_ctx_mgr *mgr, int32_t priority,
>-			   struct drm_file *filp, struct amdgpu_ctx *ctx)
>+			   uint32_t flags, struct drm_file *filp,
>+			   struct amdgpu_ctx *ctx)
> {
> 	struct amdgpu_fpriv *fpriv =3D filp->driver_priv;
> 	u32 current_stable_pstate;
>@@ -334,6 +335,7 @@ static int amdgpu_ctx_init(struct amdgpu_ctx_mgr *mgr=
, int32_t priority,
> 	ctx->mgr =3D mgr;
> 	spin_lock_init(&ctx->ring_lock);
>=20
>+	ctx->flags =3D flags;
> 	ctx->reset_counter =3D atomic_read(&mgr->adev->gpu_reset_counter);
> 	ctx->reset_counter_query =3D ctx->reset_counter;
> 	ctx->generation =3D amdgpu_vm_generation(mgr->adev, &fpriv->vm);
>@@ -474,6 +476,7 @@ static int amdgpu_ctx_alloc(struct amdgpu_device *ade=
v,
> 			    struct amdgpu_fpriv *fpriv,
> 			    struct drm_file *filp,
> 			    int32_t priority,
>+			    uint32_t flags,
> 			    uint32_t *id)
> {
> 	struct amdgpu_ctx_mgr *mgr =3D &fpriv->ctx_mgr;
>@@ -493,7 +496,7 @@ static int amdgpu_ctx_alloc(struct amdgpu_device *ade=
v,
> 	}
>=20
> 	*id =3D (uint32_t)r;
>-	r =3D amdgpu_ctx_init(mgr, priority, filp, ctx);
>+	r =3D amdgpu_ctx_init(mgr, priority, flags, filp, ctx);
> 	if (r) {
> 		idr_remove(&mgr->ctx_handles, *id);
> 		*id =3D 0;
>@@ -666,7 +669,7 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void *da=
ta,
> 		     struct drm_file *filp)
> {
> 	int r;
>-	uint32_t id, stable_pstate;
>+	uint32_t id, stable_pstate, flags;
> 	int32_t priority;
>=20
> 	union drm_amdgpu_ctx *args =3D data;
>@@ -675,6 +678,7 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void *da=
ta,
>=20
> 	id =3D args->in=2Ectx_id;
> 	priority =3D args->in=2Epriority;
>+	flags =3D args->in=2Eflags;
>=20
> 	/* For backwards compatibility, we need to accept ioctls with garbage
> 	 * in the priority field=2E Garbage values in the priority field, resul=
t
>@@ -685,7 +689,7 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void *da=
ta,
>=20
> 	switch (args->in=2Eop) {
> 	case AMDGPU_CTX_OP_ALLOC_CTX:
>-		r =3D amdgpu_ctx_alloc(adev, fpriv, filp, priority, &id);
>+		r =3D amdgpu_ctx_alloc(adev, fpriv, filp, priority, flags, &id);
> 		args->out=2Ealloc=2Ectx_id =3D id;
> 		break;
> 	case AMDGPU_CTX_OP_FREE_CTX:
>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx=2Eh b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ctx=2Eh
>index 85376baaa92f=2E=2E9431c8d2ea59 100644
>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx=2Eh
>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx=2Eh
>@@ -45,6 +45,7 @@ struct amdgpu_ctx_entity {
> struct amdgpu_ctx {
> 	struct kref			refcount;
> 	struct amdgpu_ctx_mgr		*mgr;
>+	uint32_t			flags;
> 	unsigned			reset_counter;
> 	unsigned			reset_counter_query;
> 	uint64_t			generation;
>@@ -84,6 +85,12 @@ struct dma_fence *amdgpu_ctx_get_fence(struct amdgpu_c=
tx *ctx,
> bool amdgpu_ctx_priority_is_valid(int32_t ctx_prio);
> void amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx, int32_t ctx_pr=
io);
>=20
>+static inline bool
>+amdgpu_ctx_explicit_sync(struct amdgpu_ctx *ctx)
>+{
>+	return ctx->flags & AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC;
>+}
>+
> int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
> 		     struct drm_file *filp);
>=20
>diff --git a/include/uapi/drm/amdgpu_drm=2Eh b/include/uapi/drm/amdgpu_dr=
m=2Eh
>index 96e32dafd4f0=2E=2Ee9d87a6e3d86 100644
>--- a/include/uapi/drm/amdgpu_drm=2Eh
>+++ b/include/uapi/drm/amdgpu_drm=2Eh
>@@ -125,7 +125,14 @@ extern "C" {
> #define AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS	(1 << 5)
> /* Flag that BO is always valid in this VM */
> #define AMDGPU_GEM_CREATE_VM_ALWAYS_VALID	(1 << 6)
>-/* Flag that BO sharing will be explicitly synchronized */
>+/* Flag that BO sharing will be explicitly synchronized
>+ *
>+ * This flag should not be used unless the client can guarantee that no
>+ * other driver which ever touches this BO will ever want to use implici=
t
>+ * synchronization as it disables implicit sync on this BO system-wide=
=2E
>+ * Instead, drivers which use an explicit synchronization model should
>+ * prefer AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC=2E
>+ */
> #define AMDGPU_GEM_CREATE_EXPLICIT_SYNC		(1 << 7)
> /* Flag that indicates allocating MQD gart on GFX9, where the mtype
>  * for the second page onward should be set to NC=2E It should never
>@@ -240,6 +247,9 @@ union drm_amdgpu_bo_list {
> #define AMDGPU_CTX_OP_GET_STABLE_PSTATE	5
> #define AMDGPU_CTX_OP_SET_STABLE_PSTATE	6
>=20
>+/* indicate that all synchronization will be explicit */
>+#define AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC (1<<0)
>+
> /* GPU reset status */
> #define AMDGPU_CTX_NO_RESET		0
> /* this the context caused it */
