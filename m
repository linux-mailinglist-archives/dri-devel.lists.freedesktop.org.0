Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04F1B09A33
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 05:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5263110E033;
	Fri, 18 Jul 2025 03:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="TBI3D++p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1CE10E033
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 03:34:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752809672; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dKXxVyGIENjmXYyTMXqiUSo/DK+ixSJCs0rrlFxveaTD9k7MZQp0M6T5Wfk4FUX4w7JvR2mdPZLx1pPmvlw1X+B79dUIpzvlQwwT8tRG1P+GMUWLSVQDZFV2hpBP6wdLbt8AwQ1t+txoqP0ejcP21T+jvXY8RcZ1mGb/ffgp8FE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752809672;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=QFVsvXQkIU11HcEaRW2vwOxC3TZ6nLCIuUkIqSb61pM=; 
 b=grGfzCXqS5DsVUJ9KyNf42CLqWmaC0+6AFgZe4q++HHKLAyGxAe8tTfV4Uhl3w6X4cQQ528C12gNYC2Dw7gS3HrP3yJDPS+QVK0/DXoMFpB08qGdp2wzcmdIRQTtO7bC05t+QJIPIGys9yrgqSIbX2ZD3eozBYNt6Z5XIQFAVpM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752809672; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=QFVsvXQkIU11HcEaRW2vwOxC3TZ6nLCIuUkIqSb61pM=;
 b=TBI3D++pHEA9drcqIPhp21zfh20c/QHiswltAKzyANrzmnP6BkJwzhEq1loMnmsT
 3nu9QWAL2azF/BoXUwzt9K5dZt9ceQOgEZSnDp4ZbErw6qwVDrln6IkiLdh5G9AX0dF
 wW0pUkN/bh3hozrNCjni4KoNxV5KgL2q4xdcA88k=
Received: by mx.zohomail.com with SMTPS id 1752809670154481.5733886832204;
 Thu, 17 Jul 2025 20:34:30 -0700 (PDT)
Date: Fri, 18 Jul 2025 04:34:25 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/7] drm/panthor: Introduce sampling sessions to
 handle userspace clients
Message-ID: <xxzoh644c5rpaxnfxjwzjclokj6c2xbccqrfrh4bkixsdiklbo@qle75rimzy2k>
References: <cover.1747148172.git.lukas.zapolskas@arm.com>
 <0319137f966f2dbffc54e51f7a2a3cbac837507b.1747148172.git.lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0319137f966f2dbffc54e51f7a2a3cbac837507b.1747148172.git.lukas.zapolskas@arm.com>
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

On 16.05.2025 16:49, Lukas Zapolskas wrote:
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
> No protection is provided against the 32-bit hardware counter overflows,
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
>  drivers/gpu/drm/panthor/panthor_perf.c   | 694 ++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_perf.h   |  16 +
>  4 files changed, 713 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 818c4d96d448..3fa0882fe81b 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -225,6 +225,9 @@ struct panthor_file {
>  	/** @ptdev: Device attached to this file. */
>  	struct panthor_device *ptdev;
>
> +	/** @drm_file: Corresponding drm_file */

> +	struct drm_file *drm_file;

I'm sceptical about adding this here, and suspect we don't need it. I mentioned why in the
review for the next patch.

> +
>  	/** @vms: VM pool attached to this file. */
>  	struct panthor_vm_pool *vms;
>
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 9d2b716cca45..4c1381320859 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1356,6 +1356,7 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
>  	}
>
>  	pfile->ptdev = ptdev;
> +	pfile->drm_file = file;
>
>  	ret = panthor_vm_pool_create(pfile);
>  	if (ret)
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
> index 9365ce9fed04..15fa533731f3 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.c
> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
> @@ -2,13 +2,177 @@
>  /* Copyright 2023 Collabora Ltd */
>  /* Copyright 2025 Arm ltd. */
>
> -#include <linux/bitops.h>
> +#include <drm/drm_gem.h>
>  #include <drm/panthor_drm.h>
> +#include <linux/bitops.h>
> +#include <linux/circ_buf.h>
>
>  #include "panthor_device.h"
>  #include "panthor_fw.h"
>  #include "panthor_perf.h"
>
> +/**
> + * PANTHOR_PERF_EM_BITS - Number of bits in a user-facing enable mask. This must correspond
> + *                        to the maximum number of counters available for selection on the newest
> + *                        Mali GPUs (128 as of the Mali-Gx15).
> + */
> +#define PANTHOR_PERF_EM_BITS (BITS_PER_TYPE(u64) * 2)
> +
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
> +	/* Must be last */
> +	PANTHOR_PERF_SESSION_MAX,
> +};
> +
> +struct panthor_perf_enable_masks {
> +	/**
> +	 * @mask: Array of bitmasks indicating the counters userspace requested, where
> +	 *        one bit represents a single counter. Used to build the firmware configuration
> +	 *        and ensure that userspace clients obtain only the counters they requested.
> +	 */
> +	unsigned long mask[DRM_PANTHOR_PERF_BLOCK_MAX][BITS_TO_LONGS(PANTHOR_PERF_EM_BITS)];
> +};
> +
> +struct panthor_perf_counter_block {
> +	struct drm_panthor_perf_block_header header;
> +	u64 counters[];
> +};

This is a redefinition.

> +/**
> + * enum session_sample_type - Enum of the types of samples a session can request.
> + */
> +enum session_sample_type {
> +	/** @SAMPLE_TYPE_NONE: A sample has not been requested by this session. */
> +	SAMPLE_TYPE_NONE,
> +
> +	/** @SAMPLE_TYPE_INITIAL: An initial sample has been requested by this session. */
> +	SAMPLE_TYPE_INITIAL,
> +
> +	/** @SAMPLE_TYPE_REGULAR: A regular sample has been requested by this session. */
> +	SAMPLE_TYPE_REGULAR,
> +};
> +
> +struct panthor_perf_session {
> +	DECLARE_BITMAP(state, PANTHOR_PERF_SESSION_MAX);
> +
> +	/**
> +	 * @pending_sample_request: The type of sample request that is currently pending:
> +	 *                          - when a sample is not requested, the data should be accumulated
> +	 *                            into the next slot of its ring buffer, but the extract index
> +	 *                            should not be updated, and the user-space session must
> +	 *                            not be signaled.
> +	 *                          - when an initial sample is requested, the data must not be
> +	 *                            emitted into the target ring buffer and the userspace client
> +	 *                            must not be notified.
> +	 *                          - when a regular sample is requested, the data must be emitted
> +	 *                            into the target ring buffer, and the userspace client must
> +	 *                            be signalled.
> +	 */
> +	enum session_sample_type pending_sample_request;
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
> +	 * @accum_idx: The last insert index indicates whether the current sample
> +	 *                   needs zeroing before accumulation. This is used to disambiguate
> +	 *                   between accumulating into an intermediate slot in the user ring buffer
> +	 *                   and zero-ing the buffer before copying data over.
> +	 */
> +	u32 accum_idx;
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
> +	/** @control: The mapped insert and extract indices. */
> +	struct drm_panthor_perf_ringbuf_control *control;
> +
> +	/** @samples: The mapping of the @ring_buf into the kernel's VA space. */
> +	u8 *samples;
> +
> +	/**
> +	 * @pending: The list node used by the sampler to track the sessions that have not yet
> +	 *           received a sample.
> +	 */
> +	struct list_head pending;
> +
> +	/**
> +	 * @sessions: The list node used by the sampler to track the sessions waiting for a sample.
> +	 */
> +	struct list_head sessions;
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
>  struct panthor_perf {
>  	/** @next_session: The ID of the next session. */
>  	u32 next_session;
> @@ -72,6 +236,122 @@ static void panthor_perf_info_init(struct panthor_device *ptdev)
>  	perf_info->sample_size = session_get_user_sample_size(perf_info);
>  }
>
> +static struct panthor_perf_enable_masks *panthor_perf_create_em(struct drm_panthor_perf_cmd_setup
> +		*setup_args)
> +{
> +	struct panthor_perf_enable_masks *em = kmalloc(sizeof(*em), GFP_KERNEL);
> +	if (IS_ERR_OR_NULL(em))
> +		return em;
> +
> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_FW],
> +			setup_args->fw_enable_mask, PANTHOR_PERF_EM_BITS);
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
> +}
> +
> +static u64 session_read_extract_idx(struct panthor_perf_session *session)
> +{
> +	const u64 slots = session->ringbuf_slots;
> +
> +	/* Userspace will update their own extract index to indicate that a sample is consumed
> +	 * from the ringbuffer, and we must ensure we read the latest value.
> +	 */
> +	return smp_load_acquire(&session->control->extract_idx) % slots;
> +}
> +
> +static u64 session_read_insert_idx(struct panthor_perf_session *session)
> +{
> +	const u64 slots = session->ringbuf_slots;
> +
> +	/*
> +	 * Userspace is able to write to the insert index, since it is mapped
> +	 * on the same page as the extract index. This should not happen
> +	 * in regular operation.

Why would userspace be able to write into the insert index? I guess in a
ringbuffer setup, UM updates the extract index when it consumes a
sample, and the kernel increases the insert index when it writes a new
sample into the user-facing ringbuffer.

> +	 */
> +	return smp_load_acquire(&session->control->insert_idx) % slots;
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
> +	if (session->samples && session->ring_buf) {
> +		struct iosys_map map = IOSYS_MAP_INIT_VADDR(session->samples);
> +
> +		drm_gem_vunmap_unlocked(session->ring_buf, &map);

drm_gem_vunmap_unlocked() isn't declared in drm_gem.h  when I rebase the patch series onto drm-misc. I guess it means either you're basing this patch series on a previous WIP branch or else it's misspelt?

> +		drm_gem_object_put(session->ring_buf);
> +	}
> +
> +	if (session->control && session->control_buf) {
> +		struct iosys_map map = IOSYS_MAP_INIT_VADDR(session->control);
> +
> +		drm_gem_vunmap_unlocked(session->control_buf, &map);
> +		drm_gem_object_put(session->control_buf);
> +	}
> +
> +	eventfd_ctx_put(session->eventfd);
> +
> +	kfree(session);
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
> +{
> +	struct panthor_perf_session *session;
> +
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
> +}
> +
>  /**
>   * panthor_perf_init - Initialize the performance counter subsystem.
>   * @ptdev: Panthor device
> @@ -109,6 +389,412 @@ int panthor_perf_init(struct panthor_device *ptdev)
>  	return ret;
>  }
>
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
> +	if (ret) {
> +		drm_err(&ptdev->base, "Did not meet requirements for set %d\n",
> +				setup_args->block_set);
> +		return ret;
> +	}
> +
> +	session = kzalloc(sizeof(*session), GFP_KERNEL);
> +	if (ZERO_OR_NULL_PTR(session))
> +		return -ENOMEM;
> +
> +	ringbuffer = drm_gem_object_lookup(pfile->drm_file, setup_args->ringbuf_handle);
> +	if (!ringbuffer) {
> +		drm_err(&ptdev->base, "Could not find handle %d!\n", setup_args->ringbuf_handle);
> +		ret = -EINVAL;
> +		goto cleanup_session;
> +	}
> +
> +	control = drm_gem_object_lookup(pfile->drm_file, setup_args->control_handle);
> +	if (!control) {
> +		drm_err(&ptdev->base, "Could not find handle %d!\n", setup_args->control_handle);
> +		ret = -EINVAL;
> +		goto cleanup_ringbuf;
> +	}
> +
> +	user_sample_size = session_get_user_sample_size(&ptdev->perf_info) * slots;
> +
> +	if (ringbuffer->size != PFN_ALIGN(user_sample_size)) {
> +		drm_err(&ptdev->base, "Incorrect ringbuffer size from userspace: user %zu vs kernel %lu\n",
> +				ringbuffer->size, PFN_ALIGN(user_sample_size));
> +		ret = -ENOMEM;
> +		goto cleanup_control;
> +	}
> +
> +	ret = drm_gem_vmap_unlocked(ringbuffer, &rb_map);

Same here, drm_gem_vmap_unlocked() isn't declared in any header files.

> +	if (ret)
> +		goto cleanup_control;
> +
> +	ret = drm_gem_vmap_unlocked(control, &ctrl_map);
> +	if (ret)
> +		goto cleanup_ring_map;
> +
> +	session->eventfd = eventfd_ctx_fdget(setup_args->fd);
> +	if (IS_ERR(session->eventfd)) {
> +		drm_err(&ptdev->base, "Invalid eventfd %d!\n", setup_args->fd);
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
> +	INIT_LIST_HEAD(&session->sessions);
> +	INIT_LIST_HEAD(&session->pending);
> +
> +	session->control = ctrl_map.vaddr;
> +	*session->control = (struct drm_panthor_perf_ringbuf_control) { 0 };
> +
> +	session->samples = rb_map.vaddr;
> +
> +	/* TODO This will need validation when we support periodic sampling sessions */
> +	if (setup_args->sample_freq_ns) {
> +		ret = -EOPNOTSUPP;
> +		goto cleanup_em;
> +	}
> +
> +	ret = xa_alloc_cyclic(&perf->sessions, &session_id, session, perf->session_range,
> +			&perf->next_session, GFP_KERNEL);
> +	if (ret < 0) {
> +		drm_err(&ptdev->base, "System session limit exceeded.\n");
> +		ret = -EBUSY;
> +		goto cleanup_em;
> +	}
> +
> +	kref_init(&session->ref);
> +	session->enabled_counters = em;
> +
> +	session->sample_freq_ns = setup_args->sample_freq_ns;
> +	session->user_sample_size = user_sample_size;
> +	session->ring_buf = ringbuffer;
> +	session->ringbuf_slots = slots;
> +	session->control_buf = control;
> +	session->pfile = pfile;
> +	session->accum_idx = U32_MAX;
> +
> +	return session_id;
> +
> +cleanup_em:
> +	kfree(em);
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
> +	kfree(session);
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
> +	const u64 extract_idx = session_read_extract_idx(session);
> +	const u64 insert_idx = session_read_insert_idx(session);
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
> +		return 0;
> +
> +	const u64 extract_idx = session_read_extract_idx(session);
> +	const u64 insert_idx = session_read_insert_idx(session);
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
> +	if (READ_ONCE(session->pending_sample_request) == SAMPLE_TYPE_NONE)
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
> +	if (!pfile || !perf)
> +		return;
> +
> +	xa_for_each(&perf->sessions, sid, session)
> +	{
> +		if (session->pfile == pfile) {
> +			session_destroy(perf, session);
> +			xa_erase(&perf->sessions, sid);
> +		}
> +	}
> +}
> +
>  /**
>   * panthor_perf_unplug - Terminate the performance counter subsystem.
>   * @ptdev: Panthor device.
> @@ -124,8 +810,14 @@ void panthor_perf_unplug(struct panthor_device *ptdev)
>  		return;
>
>  	if (!xa_empty(&perf->sessions)) {
> +		unsigned long sid;
> +		struct panthor_perf_session *session;
> +
>  		drm_err(&ptdev->base,
>  			"Performance counter sessions active when unplugging the driver!");
> +
> +		xa_for_each(&perf->sessions, sid, session)
> +			session_destroy(perf, session);
>  	}
>
>  	xa_destroy(&perf->sessions);
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
> index e4805727b9e7..89d61cd1f017 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.h
> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
> @@ -7,10 +7,26 @@
>
>  #include <linux/types.h>
>
> +struct drm_panthor_perf_cmd_setup;
>  struct panthor_device;
> +struct panthor_file;
> +struct panthor_perf;
>
>  int panthor_perf_init(struct panthor_device *ptdev);
>  void panthor_perf_unplug(struct panthor_device *ptdev);
>
> +int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
> +		struct drm_panthor_perf_cmd_setup *setup_args,
> +		struct panthor_file *pfile);
> +int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf,
> +		u32 sid);
> +int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
> +		u32 sid, u64 user_data);
> +int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
> +		u32 sid, u64 user_data);
> +int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
> +		u32 sid, u64 user_data);
> +void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf);
> +
>  #endif /* __PANTHOR_PERF_H__ */
>
> --
> 2.33.0.dirty


Adrian Larumbe
