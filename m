Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 775BCA20005
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 22:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944A410E5BC;
	Mon, 27 Jan 2025 21:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="NFNU4fIf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA0B10E5BC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 21:39:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1738013990; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HwRBPBQZOSv/tVijkWIsGMOdQ7EzYumDKUTRi1bnIIrsNy5r7DAoA3bNotK3jxDKicKpHsQ+KdNI4vovJNzYUDSeCHszFMyhTxhG63J35yKuVLSBz1o3JJILqkjCpHirHTj+T+lo4p2zV8gnb2BLKLzgFXnFWkhAsFE7iuM+3YY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1738013990;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=wVJ3zJCZVog/VEwon1ZrF6m/MkpkQjw791RoqK0lUG0=; 
 b=Di289XyhrM4Hc3x458yxHZwdpTnUsYJZUTwzUFIjdqVGnTnmO7MhH+B1cXysRZ2bOFV/iJjfYuiXYJMtvsR3idvwCFCHts2VmdXtarXvckGzk9oFwM+pDAweqslfzAEr2mcbZgkf6KdTJVJ1WM4xD+6EPwCe+C034N0bDP8Lcjw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738013990; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=wVJ3zJCZVog/VEwon1ZrF6m/MkpkQjw791RoqK0lUG0=;
 b=NFNU4fIfN2sjJMxespT6O7whfvFNFrUIYpNzucrI8RijeE/+qsmGCPxRf3OVGExO
 A5s4um23hF92GMI5MTdPvxw2pw2NCAluIBZSHgD7YNteJPAoXPCL4SjAlP99H9JA0ed
 BObHf/AjxQP9Towt9DMjz+FQC1gOuNa+4a9jvtZo=
Received: by mx.zohomail.com with SMTPS id 1738013979463773.2688618022613;
 Mon, 27 Jan 2025 13:39:39 -0800 (PST)
Date: Mon, 27 Jan 2025 21:39:36 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Mihail Atanassov <mihail.atanassov@arm.com>, nd@arm.com
Subject: Re: [RFC v2 5/8] drm/panthor: Introduce sampling sessions to handle
 userspace clients
Message-ID: <escv6pwwajjmsh7a4l3iodqp4g2hqyneftxhqjqw422pzr3xc6@gon4dnrniqpz>
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
 <20241211165024.490748-6-lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211165024.490748-6-lukas.zapolskas@arm.com>
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

On 11.12.2024 16:50, Lukas Zapolskas wrote:
> To allow for combining the requests from multiple userspace clients, an
> intermediary layer between the HW/FW interfaces and userspace is
> created, containing the information for the counter requests and
> tracking of insert and extract indices. Each session starts inactive and
> must be explicitly activated via PERF_CONTROL.START, and explicitly
> stopped via PERF_CONTROL.STOP. Userspace identifies a single client with
> its session ID and the panthor file it is associated with.
> 
> The SAMPLE and STOP commands both produce a single sample when called,
> and these samples can be disambiguated via the opaque user data field
> passed in the PERF_CONTROL uAPI. If this functionality is not desired,
> these fields can be kept as zero, as the kernel copies this value into
> the corresponding sample without attempting to interpret it.
> 
> Currently, only manual sampling sessions are supported, providing
> samples when userspace calls PERF_CONTROL.SAMPLE, and only a single
> session is allowed at a time. Multiple sessions and periodic sampling
> will be enabled in following patches.
> 
> No protected is provided against the 32-bit hardware counter overflows,
> so for the moment it is up to userspace to ensure that the counters are
> sampled at a reasonable frequency.
> 
> The counter set enum is added to the uapi to clarify the restrictions on
> calling the interface.
> 
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.h |   3 +
>  drivers/gpu/drm/panthor/panthor_drv.c    |   1 +
>  drivers/gpu/drm/panthor/panthor_perf.c   | 697 ++++++++++++++++++++++-
>  include/uapi/drm/panthor_drm.h           |  50 +-
>  4 files changed, 732 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index aca33d03036c..9ed1e9aed521 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -210,6 +210,9 @@ struct panthor_file {
>  	/** @ptdev: Device attached to this file. */
>  	struct panthor_device *ptdev;
>  
> +	/** @drm_file: Corresponding drm_file */
> +	struct drm_file *drm_file;

I think we could avoid keeping this reference here, see [1].

>  	/** @vms: VM pool attached to this file. */
>  	struct panthor_vm_pool *vms;
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 458175f58b15..2848ab442d10 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1505,6 +1505,7 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
>  	}
>  
>  	pfile->ptdev = ptdev;
> +	pfile->drm_file = file;
>  
>  	ret = panthor_vm_pool_create(pfile);
>  	if (ret)
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
> index 6498279ec036..42d8b6f8c45d 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.c
> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
> @@ -3,16 +3,162 @@
>  /* Copyright 2024 Arm ltd. */
>  
>  #include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
>  #include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
>  #include <drm/panthor_drm.h>
>  
> +#include <linux/circ_buf.h>
> +#include <linux/iosys-map.h>
> +#include <linux/pm_runtime.h>
> +
>  #include "panthor_device.h"
>  #include "panthor_fw.h"
>  #include "panthor_gpu.h"
>  #include "panthor_perf.h"
>  #include "panthor_regs.h"
>  
> +/**
> + * PANTHOR_PERF_EM_BITS - Number of bits in a user-facing enable mask. This must correspond
> + *                        to the maximum number of counters available for selection on the newest
> + *                        Mali GPUs (128 as of the Mali-Gx15).
> + */
> +#define PANTHOR_PERF_EM_BITS (BITS_PER_TYPE(u64) * 2)
> +
> +/**
> + * enum panthor_perf_session_state - Session state bits.
> + */
> +enum panthor_perf_session_state {
> +	/** @PANTHOR_PERF_SESSION_ACTIVE: The session is active and can be used for sampling. */
> +	PANTHOR_PERF_SESSION_ACTIVE = 0,
> +
> +	/**
> +	 * @PANTHOR_PERF_SESSION_OVERFLOW: The session encountered an overflow in one of the
> +	 *                                 counters during the last sampling period. This flag
> +	 *                                 gets propagated as part of samples emitted for this
> +	 *                                 session, to ensure the userspace client can gracefully
> +	 *                                 handle this data corruption.
> +	 */
> +	PANTHOR_PERF_SESSION_OVERFLOW,
> +
> +	/** @PANTHOR_PERF_SESSION_MAX: Bits needed to represent the state. Must be last.*/
> +	PANTHOR_PERF_SESSION_MAX,
> +};
> +
> +struct panthor_perf_enable_masks {
> +	/**
> +	 * @link: List node used to keep track of the enable masks aggregated by the sampler.
> +	 */
> +	struct list_head link;
> +
> +	/** @refs: Number of references taken out on an instantiated enable mask. */
> +	struct kref refs;
> +
> +	/**
> +	 * @mask: Array of bitmasks indicating the counters userspace requested, where
> +	 *        one bit represents a single counter. Used to build the firmware configuration
> +	 *        and ensure that userspace clients obtain only the counters they requested.
> +	 */
> +	DECLARE_BITMAP(mask, PANTHOR_PERF_EM_BITS)[DRM_PANTHOR_PERF_BLOCK_MAX];
> +};
> +
> +struct panthor_perf_counter_block {
> +	struct drm_panthor_perf_block_header header;
> +	u64 counters[];
> +};
> +
> +struct panthor_perf_session {
> +	DECLARE_BITMAP(state, PANTHOR_PERF_SESSION_MAX);
> +
> +	/**
> +	 * @user_sample_size: The size of a single sample as exposed to userspace. For the sake of
> +	 *                    simplicity, the current implementation exposes the same structure
> +	 *                    as provided by firmware, after annotating the sample and the blocks,
> +	 *                    and zero-extending the counters themselves (to account for in-kernel
> +	 *                    accumulation).
> +	 *
> +	 *                    This may also allow further memory-optimizations of compressing the
> +	 *                    sample to provide only requested blocks, if deemed to be worth the
> +	 *                    additional complexity.
> +	 */
> +	size_t user_sample_size;
> +
> +	/**
> +	 * @sample_freq_ns: Period between subsequent sample requests. Zero indicates that
> +	 *                  userspace will be responsible for requesting samples.
> +	 */
> +	u64 sample_freq_ns;
> +
> +	/** @sample_start_ns: Sample request time, obtained from a monotonic raw clock. */
> +	u64 sample_start_ns;
> +
> +	/**
> +	 * @user_data: Opaque handle passed in when starting a session, requesting a sample (for
> +	 *             manual sampling sessions only) and when stopping a session. This handle
> +	 *             allows the disambiguation of a sample in the ringbuffer.
> +	 */
> +	u64 user_data;
> +
> +	/**
> +	 * @eventfd: Event file descriptor context used to signal userspace of a new sample
> +	 *           being emitted.
> +	 */
> +	struct eventfd_ctx *eventfd;
> +
> +	/**
> +	 * @enabled_counters: This session's requested counters. Note that these cannot change
> +	 *                    for the lifetime of the session.
> +	 */
> +	struct panthor_perf_enable_masks *enabled_counters;
> +
> +	/** @ringbuf_slots: Slots in the user-facing ringbuffer. */
> +	size_t ringbuf_slots;
> +
> +	/** @ring_buf: BO for the userspace ringbuffer. */
> +	struct drm_gem_object *ring_buf;
> +
> +	/**
> +	 * @control_buf: BO for the insert and extract indices.
> +	 */
> +	struct drm_gem_object *control_buf;
> +
> +	/**
> +	 * @extract_idx: The extract index is used by userspace to indicate the position of the
> +	 *               consumer in the ringbuffer.
> +	 */
> +	u32 *extract_idx;
> +
> +	/**
> +	 * @insert_idx: The insert index is used by the kernel to indicate the position of the
> +	 *              latest sample exposed to userspace.
> +	 */
> +	u32 *insert_idx;
> +
> +	/** @samples: The mapping of the @ring_buf into the kernel's VA space. */
> +	u8 *samples;
> +
> +	/**
> +	 * @waiting: The list node used by the sampler to track the sessions waiting for a sample.
> +	 */
> +	struct list_head waiting;
> +
> +	/**
> +	 * @pfile: The panthor file which was used to create a session, used for the postclose
> +	 *         handling and to prevent a misconfigured userspace from closing unrelated
> +	 *         sessions.
> +	 */
> +	struct panthor_file *pfile;
> +
> +	/**
> +	 * @ref: Session reference count. The sample delivery to userspace is asynchronous, meaning
> +	 *       the lifetime of the session must extend at least until the sample is exposed to
> +	 *       userspace.
> +	 */
> +	struct kref ref;
> +};
> +
> +
>  struct panthor_perf {
>  	/**
>  	 * @block_set: The global counter set configured onto the HW.
> @@ -63,39 +209,154 @@ void panthor_perf_info_init(struct panthor_device *ptdev)
>  	perf_info->shader_blocks = hweight64(ptdev->gpu_info.shader_present);
>  }
>  
> -int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
> -		struct drm_panthor_perf_cmd_setup *setup_args,
> -		struct panthor_file *pfile)
> +static struct panthor_perf_enable_masks *panthor_perf_em_new(void)
>  {
> -	return -EOPNOTSUPP;
> +	struct panthor_perf_enable_masks *em = kmalloc(sizeof(*em), GFP_KERNEL);
> +
> +	if (!em)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&em->link);
> +
> +	kref_init(&em->refs);
> +
> +	return em;
>  }
>  
> -int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf,
> -		u32 sid)
> +static struct panthor_perf_enable_masks *panthor_perf_create_em(struct drm_panthor_perf_cmd_setup
> +		*setup_args)
>  {
> -	return -EOPNOTSUPP;
> +	struct panthor_perf_enable_masks *em = panthor_perf_em_new();
> +
> +	if (IS_ERR_OR_NULL(em))
> +		return em;
> +
> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_FW],
> +			setup_args->fw_enable_mask, PANTHOR_PERF_EM_BITS);
> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_CSG],
> +			setup_args->csg_enable_mask, PANTHOR_PERF_EM_BITS);
> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_CSHW],
> +			setup_args->cshw_enable_mask, PANTHOR_PERF_EM_BITS);
> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_TILER],
> +			setup_args->tiler_enable_mask, PANTHOR_PERF_EM_BITS);
> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_MEMSYS],
> +			setup_args->memsys_enable_mask, PANTHOR_PERF_EM_BITS);
> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_SHADER],
> +			setup_args->shader_enable_mask, PANTHOR_PERF_EM_BITS);
> +
> +	return em;
>  }
>  
> -int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
> -		u32 sid, u64 user_data)
> +static void panthor_perf_destroy_em_kref(struct kref *em_kref)
>  {
> -	return -EOPNOTSUPP;
> +	struct panthor_perf_enable_masks *em = container_of(em_kref, typeof(*em), refs);
> +
> +	if (!list_empty(&em->link))
> +		return;
> +
> +	kfree(em);
>  }
>  
> -int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
> -		u32 sid, u64 user_data)
> +static size_t get_annotated_block_size(size_t counters_per_block)
>  {
> -		return -EOPNOTSUPP;
> +	return struct_size_t(struct panthor_perf_counter_block, counters, counters_per_block);
>  }
>  
> -int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
> -		u32 sid, u64 user_data)
> +static u32 session_read_extract_idx(struct panthor_perf_session *session)
> +{
> +	/* Userspace will update their own extract index to indicate that a sample is consumed
> +	 * from the ringbuffer, and we must ensure we read the latest value.
> +	 */
> +	return smp_load_acquire(session->extract_idx);
> +}
> +
> +static u32 session_read_insert_idx(struct panthor_perf_session *session)
> +{
> +	return *session->insert_idx;
> +}
> +
> +static void session_get(struct panthor_perf_session *session)
> +{
> +	kref_get(&session->ref);
> +}
> +
> +static void session_free(struct kref *ref)
> +{
> +	struct panthor_perf_session *session = container_of(ref, typeof(*session), ref);
> +
> +	if (session->samples) {
> +		struct iosys_map map = IOSYS_MAP_INIT_VADDR(session->samples);
> +
> +		drm_gem_vunmap_unlocked(session->ring_buf, &map);
> +		drm_gem_object_put(session->ring_buf);
> +	}
> +
> +	if (session->insert_idx && session->extract_idx) {
> +		struct iosys_map map = IOSYS_MAP_INIT_VADDR(session->extract_idx);
> +
> +		drm_gem_vunmap_unlocked(session->control_buf, &map);
> +		drm_gem_object_put(session->control_buf);
> +	}
> +
> +	kref_put(&session->enabled_counters->refs, panthor_perf_destroy_em_kref);
> +	eventfd_ctx_put(session->eventfd);
> +
> +	devm_kfree(session->pfile->ptdev->base.dev, session);
> +}
> +
> +static void session_put(struct panthor_perf_session *session)
> +{
> +	kref_put(&session->ref, session_free);
> +}
> +
> +/**
> + * session_find - Find a session associated with the given session ID and
> + *                panthor_file.
> + * @pfile: Panthor file.
> + * @perf: Panthor perf.
> + * @sid: Session ID.
> + *
> + * The reference count of a valid session is increased to ensure it does not disappear
> + * in the window between the XA lock being dropped and the internal session functions
> + * being called.
> + *
> + * Return: valid session pointer or an ERR_PTR.
> + */
> +static struct panthor_perf_session *session_find(struct panthor_file *pfile,
> +		struct panthor_perf *perf, u32 sid)
>  {
> -	return -EOPNOTSUPP;
> +	struct panthor_perf_session *session;
>  
> +	if (!perf)
> +		return ERR_PTR(-EINVAL);
> +
> +	xa_lock(&perf->sessions);
> +	session = xa_load(&perf->sessions, sid);
> +
> +	if (!session || xa_is_err(session)) {
> +		xa_unlock(&perf->sessions);
> +		return ERR_PTR(-EBADF);
> +	}
> +
> +	if (session->pfile != pfile) {
> +		xa_unlock(&perf->sessions);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	session_get(session);
> +	xa_unlock(&perf->sessions);
> +
> +	return session;
>  }
>  
> -void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf) { }
> +static size_t session_get_max_sample_size(const struct drm_panthor_perf_info *const info)
> +{
> +	const size_t block_size = get_annotated_block_size(info->counters_per_block);
> +	const size_t block_nr = info->cshw_blocks + info->csg_blocks + info->fw_blocks +
> +		info->tiler_blocks + info->memsys_blocks + info->shader_blocks;
> +
> +	return sizeof(struct drm_panthor_perf_sample_header) + (block_size * block_nr);
> +}
>  
>  /**
>   * panthor_perf_init - Initialize the performance counter subsystem.
> @@ -130,6 +391,399 @@ int panthor_perf_init(struct panthor_device *ptdev)
>  	ptdev->perf = perf;
>  
>  	return 0;
> +
> +}
> +
> +static int session_validate_set(u8 set)
> +{
> +	if (set > DRM_PANTHOR_PERF_SET_TERTIARY)
> +		return -EINVAL;
> +
> +	if (set == DRM_PANTHOR_PERF_SET_PRIMARY)
> +		return 0;
> +
> +	if (set > DRM_PANTHOR_PERF_SET_PRIMARY)
> +		return capable(CAP_PERFMON) ? 0 : -EACCES;
> +
> +	return -EINVAL;
> +}
> +
> +/**
> + * panthor_perf_session_setup - Create a user-visible session.
> + *
> + * @ptdev: Handle to the panthor device.
> + * @perf: Handle to the perf control structure.
> + * @setup_args: Setup arguments passed in via ioctl.
> + * @pfile: Panthor file associated with the request.
> + *
> + * Creates a new session associated with the session ID returned. When initialized, the
> + * session must explicitly request sampling to start with a successive call to PERF_CONTROL.START.
> + *
> + * Return: non-negative session identifier on success or negative error code on failure.
> + */
> +int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
> +		struct drm_panthor_perf_cmd_setup *setup_args,
> +		struct panthor_file *pfile)
> +{
> +	struct panthor_perf_session *session;
> +	struct drm_gem_object *ringbuffer;
> +	struct drm_gem_object *control;
> +	const size_t slots = setup_args->sample_slots;
> +	struct panthor_perf_enable_masks *em;
> +	struct iosys_map rb_map, ctrl_map;
> +	size_t user_sample_size;
> +	int session_id;
> +	int ret;
> +
> +	ret = session_validate_set(setup_args->block_set);
> +	if (ret)
> +		return ret;
> +
> +	session = devm_kzalloc(ptdev->base.dev, sizeof(*session), GFP_KERNEL);
> +	if (ZERO_OR_NULL_PTR(session))
> +		return -ENOMEM;
> +
> +	ringbuffer = drm_gem_object_lookup(pfile->drm_file, setup_args->ringbuf_handle);
> +	if (!ringbuffer) {
> +		ret = -EINVAL;
> +		goto cleanup_session;
> +	}
> +
> +	control = drm_gem_object_lookup(pfile->drm_file, setup_args->control_handle);
> +	if (!control) {
> +		ret = -EINVAL;
> +		goto cleanup_ringbuf;
> +	}

If you pass panthor_perf_session_setup() the drm_file pointer instead of the
panthor_file one, you could do

struct panthor_file *pfile = file->driver_priv;

at the beginning of the function, and avoid storing the pointer back to the drm_file in the
panthor_file struct, because panthor_file::drm_file isn't used anywhere else outside of this
function.

> +	user_sample_size = session_get_max_sample_size(&ptdev->perf_info) * slots;
> +
> +	if (ringbuffer->size != PFN_ALIGN(user_sample_size)) {
> +		ret = -ENOMEM;
> +		goto cleanup_control;
> +	}
> +
> +	ret = drm_gem_vmap_unlocked(ringbuffer, &rb_map);
> +	if (ret)
> +		goto cleanup_control;
> +
> +
> +	ret = drm_gem_vmap_unlocked(control, &ctrl_map);
> +	if (ret)
> +		goto cleanup_ring_map;
> +
> +	session->eventfd = eventfd_ctx_fdget(setup_args->fd);
> +	if (IS_ERR_OR_NULL(session->eventfd)) {
> +		ret = PTR_ERR_OR_ZERO(session->eventfd) ?: -EINVAL;
> +		goto cleanup_control_map;
> +	}
> +
> +	em = panthor_perf_create_em(setup_args);
> +	if (IS_ERR_OR_NULL(em)) {
> +		ret = -ENOMEM;
> +		goto cleanup_eventfd;
> +	}
> +
> +	INIT_LIST_HEAD(&session->waiting);
> +	session->extract_idx = ctrl_map.vaddr;
> +	*session->extract_idx = 0;
> +	session->insert_idx = session->extract_idx + 1;
> +	*session->insert_idx = 0;
> +
> +	session->samples = rb_map.vaddr;
> +
> +	/* TODO This will need validation when we support periodic sampling sessions */
> +	if (setup_args->sample_freq_ns) {
> +		ret = -EOPNOTSUPP;
> +		goto cleanup_em;
> +	}
> +
> +	session->sample_freq_ns = setup_args->sample_freq_ns;
> +	session->user_sample_size = user_sample_size;
> +	session->enabled_counters = em;
> +	session->ring_buf = ringbuffer;
> +	session->control_buf = control;
> +	session->pfile = pfile;
> +
> +	ret = xa_alloc_cyclic(&perf->sessions, &session_id, session, perf->session_range,
> +			&perf->next_session, GFP_KERNEL);
> +	if (ret < 0)
> +		goto cleanup_em;
> +
> +	kref_init(&session->ref);
> +
> +	return session_id;
> +
> +cleanup_em:
> +	kref_put(&em->refs, panthor_perf_destroy_em_kref);
> +
> +cleanup_eventfd:
> +	eventfd_ctx_put(session->eventfd);
> +
> +cleanup_control_map:
> +	drm_gem_vunmap_unlocked(control, &ctrl_map);
> +
> +cleanup_ring_map:
> +	drm_gem_vunmap_unlocked(ringbuffer, &rb_map);
> +
> +cleanup_control:
> +	drm_gem_object_put(control);
> +
> +cleanup_ringbuf:
> +	drm_gem_object_put(ringbuffer);
> +
> +cleanup_session:
> +	devm_kfree(ptdev->base.dev, session);
> +
> +	return ret;
> +}
> +
> +static int session_stop(struct panthor_perf *perf, struct panthor_perf_session *session,
> +		u64 user_data)
> +{
> +	if (!test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
> +		return 0;
> +
> +	const u32 extract_idx = session_read_extract_idx(session);
> +	const u32 insert_idx = session_read_insert_idx(session);
> +
> +	/* Must have at least one slot remaining in the ringbuffer to sample. */
> +	if (WARN_ON_ONCE(!CIRC_SPACE_TO_END(insert_idx, extract_idx, session->ringbuf_slots)))
> +		return -EBUSY;
> +
> +	session->user_data = user_data;
> +
> +	clear_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state);
> +
> +	/* TODO Calls to the FW interface will go here in later patches. */
> +	return 0;
> +}
> +
> +static int session_start(struct panthor_perf *perf, struct panthor_perf_session *session,
> +		u64 user_data)
> +{
> +	if (test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
> +		return 0;
> +
> +	set_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state);
> +
> +	/*
> +	 * For manual sampling sessions, a start command does not correspond to a sample,
> +	 * and so the user data gets discarded.
> +	 */
> +	if (session->sample_freq_ns)
> +		session->user_data = user_data;
> +
> +	/* TODO Calls to the FW interface will go here in later patches. */
> +	return 0;
> +}
> +
> +static int session_sample(struct panthor_perf *perf, struct panthor_perf_session *session,
> +		u64 user_data)
> +{
> +	if (!test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
> +		return -EACCES;
> +
> +	const u32 extract_idx = session_read_extract_idx(session);
> +	const u32 insert_idx = session_read_insert_idx(session);
> +
> +	/* Manual sampling for periodic sessions is forbidden. */
> +	if (session->sample_freq_ns)
> +		return -EINVAL;
> +
> +	/*
> +	 * Must have at least two slots remaining in the ringbuffer to sample: one for
> +	 * the current sample, and one for a stop sample, since a stop command should
> +	 * always be acknowledged by taking a final sample and stopping the session.
> +	 */
> +	if (CIRC_SPACE_TO_END(insert_idx, extract_idx, session->ringbuf_slots) < 2)
> +		return -EBUSY;
> +
> +	session->sample_start_ns = ktime_get_raw_ns();
> +	session->user_data = user_data;
> +
> +	/* TODO Calls to the FW interface will go here in later patches. */
> +	return 0;
> +}
> +
> +static int session_destroy(struct panthor_perf *perf, struct panthor_perf_session *session)
> +{
> +	session_put(session);
> +
> +	return 0;
> +}
> +
> +static int session_teardown(struct panthor_perf *perf, struct panthor_perf_session *session)
> +{
> +	if (test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
> +		return -EINVAL;
> +
> +	if (!list_empty(&session->waiting))
> +		return -EBUSY;
> +
> +	return session_destroy(perf, session);
> +}
> +
> +/**
> + * panthor_perf_session_teardown - Teardown the session associated with the @sid.
> + * @pfile: Open panthor file.
> + * @perf: Handle to the perf control structure.
> + * @sid: Session identifier.
> + *
> + * Destroys a stopped session where the last sample has been explicitly consumed
> + * or discarded. Active sessions will be ignored.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf, u32 sid)
> +{
> +	int err;
> +	struct panthor_perf_session *session;
> +
> +	xa_lock(&perf->sessions);
> +	session = __xa_store(&perf->sessions, sid, NULL, GFP_KERNEL);
> +
> +	if (xa_is_err(session)) {
> +		err = xa_err(session);
> +		goto restore;
> +	}
> +
> +	if (session->pfile != pfile) {
> +		err = -EINVAL;
> +		goto restore;
> +	}
> +
> +	session_get(session);
> +	xa_unlock(&perf->sessions);
> +
> +	err = session_teardown(perf, session);
> +
> +	session_put(session);
> +
> +	return err;
> +
> +restore:
> +	__xa_store(&perf->sessions, sid, session, GFP_KERNEL);
> +	xa_unlock(&perf->sessions);
> +
> +	return err;
> +}
> +
> +/**
> + * panthor_perf_session_start - Start sampling on a stopped session.
> + * @pfile: Open panthor file.
> + * @perf: Handle to the panthor perf control structure.
> + * @sid: Session identifier for the desired session.
> + * @user_data: An opaque value passed in from userspace.
> + *
> + * A session counts as stopped when it is created or when it is explicitly stopped after being
> + * started. Starting an active session is treated as a no-op.
> + *
> + * The @user_data parameter will be associated with all subsequent samples for a periodic
> + * sampling session and will be ignored for manual sampling ones in favor of the user data
> + * passed in the PERF_CONTROL.SAMPLE ioctl call.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
> +		u32 sid, u64 user_data)
> +{
> +	struct panthor_perf_session *session = session_find(pfile, perf, sid);
> +	int err;
> +
> +	if (IS_ERR_OR_NULL(session))
> +		return IS_ERR(session) ? PTR_ERR(session) : -EINVAL;
> +
> +	err = session_start(perf, session, user_data);
> +
> +	session_put(session);
> +
> +	return err;
> +}
> +
> +/**
> + * panthor_perf_session_stop - Stop sampling on an active session.
> + * @pfile: Open panthor file.
> + * @perf: Handle to the panthor perf control structure.
> + * @sid: Session identifier for the desired session.
> + * @user_data: An opaque value passed in from userspace.
> + *
> + * A session counts as active when it has been explicitly started via the PERF_CONTROL.START
> + * ioctl. Stopping a stopped session is treated as a no-op.
> + *
> + * To ensure data is not lost when sampling is stopping, there must always be at least one slot
> + * available for the final automatic sample, and the stop command will be rejected if there is not.
> + *
> + * The @user_data will always be associated with the final sample.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
> +		u32 sid, u64 user_data)
> +{
> +	struct panthor_perf_session *session = session_find(pfile, perf, sid);
> +	int err;
> +
> +	if (IS_ERR_OR_NULL(session))
> +		return IS_ERR(session) ? PTR_ERR(session) : -EINVAL;
> +
> +	err = session_stop(perf, session, user_data);
> +
> +	session_put(session);
> +
> +	return err;
> +}
> +
> +/**
> + * panthor_perf_session_sample - Request a sample on a manual sampling session.
> + * @pfile: Open panthor file.
> + * @perf: Handle to the panthor perf control structure.
> + * @sid: Session identifier for the desired session.
> + * @user_data: An opaque value passed in from userspace.
> + *
> + * Only an active manual sampler is permitted to request samples directly. Failing to meet either
> + * of these conditions will cause the sampling request to be rejected. Requesting a manual sample
> + * with a full ringbuffer will see the request being rejected.
> + *
> + * The @user_data will always be unambiguously associated one-to-one with the resultant sample.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
> +		u32 sid, u64 user_data)
> +{
> +	struct panthor_perf_session *session = session_find(pfile, perf, sid);
> +	int err;
> +
> +	if (IS_ERR_OR_NULL(session))
> +		return IS_ERR(session) ? PTR_ERR(session) : -EINVAL;
> +
> +	err = session_sample(perf, session, user_data);
> +
> +	session_put(session);
> +
> +	return err;
> +}
> +
> +/**
> + * panthor_perf_session_destroy - Destroy a sampling session associated with the @pfile.
> + * @perf: Handle to the panthor perf control structure.
> + * @pfile: The file being closed.
> + *
> + * Must be called when the corresponding userspace process is destroyed and cannot close its
> + * own sessions. As such, we offer no guarantees about data delivery.
> + */
> +void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf)
> +{
> +	unsigned long sid;
> +	struct panthor_perf_session *session;
> +
> +	xa_for_each(&perf->sessions, sid, session)
> +	{
> +		if (session->pfile == pfile) {
> +			session_destroy(perf, session);
> +			xa_erase(&perf->sessions, sid);
> +		}
> +	}
>  }
>  
>  /**
> @@ -146,10 +800,17 @@ void panthor_perf_unplug(struct panthor_device *ptdev)
>  	if (!perf)
>  		return;
>  
> -	if (!xa_empty(&perf->sessions))
> +	if (!xa_empty(&perf->sessions)) {
> +		unsigned long sid;
> +		struct panthor_perf_session *session;
> +
>  		drm_err(&ptdev->base,
>  				"Performance counter sessions active when unplugging the driver!");
>  
> +		xa_for_each(&perf->sessions, sid, session)
> +			session_destroy(perf, session);
> +	}
> +
>  	xa_destroy(&perf->sessions);
>  
>  	devm_kfree(ptdev->base.dev, ptdev->perf);
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 8a431431da6b..576d3ad46e6d 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -458,6 +458,12 @@ enum drm_panthor_perf_block_type {
>  
>  	/** @DRM_PANTHOR_PERF_BLOCK_SHADER: A shader core counter block. */
>  	DRM_PANTHOR_PERF_BLOCK_SHADER,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_LAST: Internal use only. */
> +	DRM_PANTHOR_PERF_BLOCK_LAST = DRM_PANTHOR_PERF_BLOCK_SHADER,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_MAX: Internal use only. */
> +	DRM_PANTHOR_PERF_BLOCK_MAX = DRM_PANTHOR_PERF_BLOCK_LAST + 1,
>  };
>  
>  /**
> @@ -1368,6 +1374,44 @@ struct drm_panthor_perf_control {
>  	__u64 pointer;
>  };
>  
> +/**
> + * enum drm_panthor_perf_counter_set - The counter set to be requested from the hardware.
> + *
> + * The hardware supports a single performance counter set at a time, so requesting any set other
> + * than the primary may fail if another process is sampling at the same time.
> + *
> + * If in doubt, the primary counter set has the most commonly used counters and requires no
> + * additional permissions to open.
> + */
> +enum drm_panthor_perf_counter_set {
> +	/**
> +	 * @DRM_PANTHOR_PERF_SET_PRIMARY: The default set configured on the hardware.
> +	 *
> +	 * This is the only set for which all counters in all blocks are defined.
> +	 */
> +	DRM_PANTHOR_PERF_SET_PRIMARY,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_SET_SECONDARY: The secondary performance counter set.
> +	 *
> +	 * Some blocks may not have any defined counters for this set, and the block will
> +	 * have the UNAVAILABLE block state permanently set in the block header.
> +	 *
> +	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
> +	 */
> +	DRM_PANTHOR_PERF_SET_SECONDARY,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_SET_TERTIARY: The tertiary performance counter set.
> +	 *
> +	 * Some blocks may not have any defined counters for this set, and the block will have
> +	 * the UNAVAILABLE block state permanently set in the block header. Note that the
> +	 * tertiary set has the fewest defined counter blocks.
> +	 *
> +	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
> +	 */
> +	DRM_PANTHOR_PERF_SET_TERTIARY,
> +};
>  
>  /**
>   * struct drm_panthor_perf_cmd_setup - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
> @@ -1375,13 +1419,17 @@ struct drm_panthor_perf_control {
>   */
>  struct drm_panthor_perf_cmd_setup {
>  	/**
> -	 * @block_set: Set of performance counter blocks.
> +	 * @block_set: Set of performance counter blocks, member of
> +	 *             enum drm_panthor_perf_block_set.
>  	 *
>  	 * This is a global configuration and only one set can be active at a time. If
>  	 * another client has already requested a counter set, any further requests
>  	 * for a different counter set will fail and return an -EBUSY.
>  	 *
>  	 * If the requested set does not exist, the request will fail and return an -EINVAL.
> +	 *
> +	 * Some sets have additional requirements to be enabled, and the setup request will
> +	 * fail with an -EACCES if these requirements are not satisfied.
>  	 */
>  	__u8 block_set;
>  
> -- 
> 2.25.1


Adrian Larumbe
