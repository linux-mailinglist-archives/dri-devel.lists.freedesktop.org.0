Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB98B3E26B
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6973910E42D;
	Mon,  1 Sep 2025 12:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JmxisZL7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156FD10E42D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756728883;
 bh=uHFks4P6z+NBQPblKW2zC+6zDXB4WugzndH+Ioi+LiU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JmxisZL7gGAsM6w0LnM+cD3yeH/cxF0eMpXFir5ZqJycJWnAM1wfHlEKi/fjonwOq
 CHKtvpjrhlX7oYqdIkPWph21DY+VkT+CVPPvzZzhp1FaMgXmBsOIt5267mp7q5b00x
 BQCOvwdP4HvLGnNwJciKgpsH57W22CO5Hg8V7KVymNGiMRN3Qo0GE49Qkjo7nf/Ru/
 6Lo8bsKEz0I4EHc2Qnis0nju7xnBM0Qk781ChevsiI0nV6u4Ri7oKi3/b0ExM8YIRo
 yrm9nSz8KSsLvapkoNb2bce2PJrlCrVi1qdF8pkZs620UF+vFaDDDDsp/hqnxoSn6W
 5hN49lPQ04rQg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 06F5D17E0FDB;
 Mon,  1 Sep 2025 14:14:42 +0200 (CEST)
Date: Mon, 1 Sep 2025 14:14:39 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Rob Herring <robh@kernel.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/5] drm/panfrost: Introduce uAPI for JM context creation
Message-ID: <20250901141439.42740449@fedora>
In-Reply-To: <56130662-4768-44ff-829e-9d77258c4342@arm.com>
References: <20250828023422.2404784-1-adrian.larumbe@collabora.com>
 <20250828023422.2404784-3-adrian.larumbe@collabora.com>
 <56130662-4768-44ff-829e-9d77258c4342@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Hi Steve,

On Mon, 1 Sep 2025 11:52:02 +0100
Steven Price <steven.price@arm.com> wrote:

> On 28/08/2025 03:34, Adri=C3=A1n Larumbe wrote:
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> >=20
> > The new uAPI lets user space query the KM driver for the available
> > priorities a job can be given at submit time. These are managed through
> > the notion of a context, which besides a priority, codifies the list
> > of L2 caches, shading cores and tiler units a job is allowed to use,
> > for all three of the available device job slots.
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> =20
>=20
> There's no cover letter for this series, so maybe I'm missing some
> context. But I'm not sure why we want to expose the tiler/l2/core masks
> to user space.

tiler/l2 masks, I'm not sure we need, especially if there's only just
one tiler unit / l2 cache. I exposed the core mask so one can reserve
cores for an application.

>=20
> If you were trying to better support OpenCL on T628 I can just about
> understand the core mask. But, I doubt you are... (does anyone care
> about that anymore? ;) ). And really it's the core groups that matter
> rather than the raw affinities.

Ok, so low vs high bits (don't know the granularity of the core group,
so low/high might actually bit low/middle-low/middle-high/high) in the
the affinity register, right?

>=20
> The tiler/l2 affinities (and the XAFFINITY register in general) is there
> as a power saving mechanism. If we know that a job is not going to use
> the shader cores at all (a tiler-only job) then we can avoid turning
> them on, but obviously we still need the L2 and tiler blocks to be powere=
d.

Okay, I thought it was more of a "use only these cores, the rest is
reserved for something else", my bad.

>=20
> kbase handled this with a "core_req" field which listed the required
> cores for each job. We already have a "requirements" field which we
> could extend for the same purpose (PANFROST_JD_REQ_TILER_ONLY or
> similar). I don't think this makes sense to include in a "context".

It was more a core reservation mechanism, which I expected to be forced
at context creation time. I mean, it can still be at the UMD level, and
we would pass the mask of cores to use at job submission time. The
problem I see with just expressing the maximum number of cores one can
use is that it doesn't work for core reservation. Also, I went for this
interface because that's more or less what panthor exposes (mask of
cores that can be used, and maximum of number of cores that can be used
in this pool).

>=20
> But like I said, maybe I'm missing something - what is the use case for
> controlling affinity?
>=20
> [The priority parts look ok here, but that's mixed in with the affinity
> changes.]
>=20
> > ---
> >  include/uapi/drm/panfrost_drm.h | 93 +++++++++++++++++++++++++++++++++
> >  1 file changed, 93 insertions(+)
> >=20
> > diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfros=
t_drm.h
> > index ed67510395bd..2d8b32448e68 100644
> > --- a/include/uapi/drm/panfrost_drm.h
> > +++ b/include/uapi/drm/panfrost_drm.h
> > @@ -22,6 +22,8 @@ extern "C" {
> >  #define DRM_PANFROST_PERFCNT_DUMP		0x07
> >  #define DRM_PANFROST_MADVISE			0x08
> >  #define DRM_PANFROST_SET_LABEL_BO		0x09
> > +#define DRM_PANFROST_JM_CTX_CREATE		0x0a
> > +#define DRM_PANFROST_JM_CTX_DESTROY		0x0b
> > =20
> >  #define DRM_IOCTL_PANFROST_SUBMIT		DRM_IOW(DRM_COMMAND_BASE + DRM_PANF=
ROST_SUBMIT, struct drm_panfrost_submit)
> >  #define DRM_IOCTL_PANFROST_WAIT_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_PAN=
FROST_WAIT_BO, struct drm_panfrost_wait_bo)
> > @@ -31,6 +33,8 @@ extern "C" {
> >  #define DRM_IOCTL_PANFROST_GET_BO_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + D=
RM_PANFROST_GET_BO_OFFSET, struct drm_panfrost_get_bo_offset)
> >  #define DRM_IOCTL_PANFROST_MADVISE		DRM_IOWR(DRM_COMMAND_BASE + DRM_PA=
NFROST_MADVISE, struct drm_panfrost_madvise)
> >  #define DRM_IOCTL_PANFROST_SET_LABEL_BO		DRM_IOWR(DRM_COMMAND_BASE + D=
RM_PANFROST_SET_LABEL_BO, struct drm_panfrost_set_label_bo)
> > +#define DRM_IOCTL_PANFROST_JM_CTX_CREATE	DRM_IOWR(DRM_COMMAND_BASE + D=
RM_PANFROST_JM_CTX_CREATE, struct drm_panfrost_jm_ctx_create)
> > +#define DRM_IOCTL_PANFROST_JM_CTX_DESTROY	DRM_IOWR(DRM_COMMAND_BASE + =
DRM_PANFROST_JM_CTX_DESTROY, struct drm_panfrost_jm_ctx_destroy)
> > =20
> >  /*
> >   * Unstable ioctl(s): only exposed when the unsafe unstable_ioctls mod=
ule
> > @@ -71,6 +75,12 @@ struct drm_panfrost_submit {
> > =20
> >  	/** A combination of PANFROST_JD_REQ_* */
> >  	__u32 requirements;
> > +
> > +	/** JM context handle. Zero if you want to use the default context. */
> > +	__u32 jm_ctx_handle;
> > +
> > +	/** Padding field. MBZ. */
> > +	__u32 pad;
> >  };
> > =20
> >  /**
> > @@ -177,6 +187,7 @@ enum drm_panfrost_param {
> >  	DRM_PANFROST_PARAM_AFBC_FEATURES,
> >  	DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP,
> >  	DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP_FREQUENCY,
> > +	DRM_PANFROST_PARAM_ALLOWED_JM_CTX_PRIORITIES,
> >  };
> > =20
> >  struct drm_panfrost_get_param {
> > @@ -299,6 +310,88 @@ struct panfrost_dump_registers {
> >  	__u32 value;
> >  };
> > =20
> > +enum drm_panfrost_jm_ctx_priority {
> > +	/**
> > +	 * @PANFROST_JM_CTX_PRIORITY_LOW: Low priority context.
> > +	 */
> > +	PANFROST_JM_CTX_PRIORITY_LOW =3D 0,
> > +
> > +	/**
> > +	 * @PANFROST_JM_CTX_PRIORITY_MEDIUM: Medium priority context.
> > +	 */
> > +	PANFROST_JM_CTX_PRIORITY_MEDIUM,
> > +
> > +	/**
> > +	 * @PANFROST_JM_CTX_PRIORITY_HIGH: High priority context.
> > +	 *
> > +	 * Requires CAP_SYS_NICE or DRM_MASTER.
> > +	 */
> > +	PANFROST_JM_CTX_PRIORITY_HIGH,
> > +};
> > +
> > +#define PANFROST_JS_FLAG_ENABLED		(1 << 0)
> > +
> > +struct drm_panfrost_js_ctx_info {
> > +	/** @flags: Combination of PANFROST_JS_FLAG_xxx values */
> > +	__u32 flags;
> > +
> > +	/** @priority: Context priority (see enum drm_panfrost_jm_ctx_priorit=
y). */
> > +	__u8 priority;
> > +
> > +	/**
> > +	 * @tiler_mask: Mask encoding tiler units that can be used by the job=
 slot
> > +	 *
> > +	 * When this field is zero, it means the tiler won't be used.
> > +	 *
> > +	 * The bits set here should also be set in drm_panthor_gpu_info::tile=
r_present.
> > +	 */
> > +	__u8 tiler_mask;
> > +
> > +	/**
> > +	 * @l2_mask: Mask encoding L2 caches that can be used by the job slot
> > +	 *
> > +	 * The bits set here should also be set in drm_panthor_gpu_info::l2_p=
resent.:
> > +	 */
> > +	__u16 l2_mask;
> > +
> > +	/**
> > +	 * @core_mask: Mask encoding cores that can be used by the job slot
> > +	 *
> > +	 * When this field is zero, it means the queue won't be used.
> > +	 *
> > +	 * The bits set here should also be set in drm_panthor_gpu_info::shad=
er_present.
> > +	 */
> > +	__u64 core_mask;
> > +};
> > +
> > +struct drm_panfrost_jm_ctx_create {
> > +	/** @handle: Handle of the created JM context */
> > +	__u32 handle;
> > +
> > +	/** @pad: Padding field, MBZ. */
> > +	__u32 pad;
> > +
> > +	/**
> > +	 * @slots: Job slots
> > +	 *
> > +	 * This field must be greater than zero and less than 8 (only three s=
lots
> > +	 * available).

Not sure what this doc referred to, but slots is not an integer :D.

> > +	 */
> > +	struct drm_panfrost_js_ctx_info slots[3]; =20
>=20
> We don't allow user space to choose which slot is being targetted, so
> this feels odd.

Some of this has been extracted from the panthor-ification of JM, and
you're probably right that it doesn't make sense to expose the
subqueues in panfrost.

> I guess this allows deliberately disabling slot 1 to
> force slot 2. But the code in this series doesn't seem to implement
> this. I'm also not sure I understand why you would want a different
> priority for different slots?

Internally, a slot maps to a sched entity, which is where the priority
is defined. Sure, we could have a global priority for the whole context,
but I figured I'd just expose what the KMD is capable of (per subqueue
priority) and let the UMD assign the same priority to all slots. But if
we don't expose the slots directly, we might as well just define a
priority and the set of resources that can be used by any of the
subqueues.

Regards,

Boris
