Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BB1B3C747
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 04:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C0510E057;
	Sat, 30 Aug 2025 02:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="EaBmPeJB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E34B10E057
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 02:07:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756519650; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PpEzxuFoi6Wbh8gR1elN1mlM7I9YJb1FeKDRu9Z+Z/z2ggv/j4DhmX0cxb+0a+iU9CNR3dl8HJMuJ8K+YwuqWnb/SMG0UD9dPUt0STbxHB995KkdA8gP+IxuZ/psNQuQ0sTrQ4GPnu/J9pBIQpSAQpxwV4ctKY9ARZRRfW/uAJ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756519650;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=hr93ctnPamdsmNBPU7+awOJ2as6V4AQxTZs2xWt8SXs=; 
 b=RLUl1CFh3l7WU2rlk/1Flv60GRbuZGfMvsQSrdOGVrNJ9tjda8r5LkZnDji0cpLk2HZ2Z4L+xoXh0etMSQJ6ODhvTuFD0G204eq2xU1OdRHFEUFL+1OJVlGLsPBsAPnW7pjNOdXBKoy2qDG9k/tS8eSqA2+fJNQYkh7U90dGjMA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756519650; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=hr93ctnPamdsmNBPU7+awOJ2as6V4AQxTZs2xWt8SXs=;
 b=EaBmPeJBEFXOxbr0Ds5Mpp7N18b1wHvDZgJ62BsFtNBJU5wZyF3INqYXoyfKhozX
 AIN5VP7mJ9b7MfZF832i385xJXOuqStqinSe37bNBX5MQ7bI/wlbyq9g5jf5jIZdWrl
 Tda22jq5KCkeZ69p4VqJ/HYQgW0pqdU1F2CpDDEk=
Received: by mx.zohomail.com with SMTPS id 1756519647719262.38864561291393;
 Fri, 29 Aug 2025 19:07:27 -0700 (PDT)
Date: Sat, 30 Aug 2025 03:07:23 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/7] drm/panthor: Implement the counter sampler and
 sample handling
Message-ID: <75negygzwgdwogxtdahk43jukk6uoq4iens7464j3utnxtlwoz@v2mbqlpiy6c4>
References: <cover.1753449448.git.lukas.zapolskas@arm.com>
 <ae6f93a51033a35e9b8e7d2994c8595975f95264.1753449448.git.lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae6f93a51033a35e9b8e7d2994c8595975f95264.1753449448.git.lukas.zapolskas@arm.com>
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

Hi Lukas,

I've reviewed this patch in the series last of them all, and it looks good.
It'd be interesting to see how it works together with UM though. I remember
you mentioned you were working on a Mesa implementation of perfcnt for Mali CSF.

Ideally, you'd reference it in a cover letter on a next revision for this series
so that I can do hands-on testing.

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

On 25.07.2025 15:57, Lukas Zapolskas wrote:
> From: Adrián Larumbe <adrian.larumbe@collabora.com>
>
> The sampler aggregates counter and set requests coming from userspace
> and mediates interactions with the FW interface, to ensure that user
> sessions cannot override the global configuration.
>
> From the top-level interface, the sampler supports two different types
> of samples: clearing samples and regular samples. Clearing samples are
> a special sample type that allow for the creation of a sampling
> baseline, to ensure that a session does not obtain counter data from
> before its creation.
>
> Upon receipt of a relevant interrupt, corresponding to one of the
> three relevant bits of the GLB_ACK register, the sampler takes any
> samples that occurred, and, based on the insert and extract indices,
> accumulates them to an internal storage buffer after zero-extending
> the counters from the 32-bit counters emitted by the hardware to
> 64-bit counters for internal accumulation.
>
> When the performance counters are enabled, the FW ensures no counter
> data is lost when entering and leaving non-counting regions by
> producing automatic samples that do not correspond to a
> GLB_REQ.PRFCNT_SAMPLE request. Such regions may be per hardware unit,
> such as when a shader core powers down, or global. Most of these
> events do not directly correspond to session sample requests, so any
> intermediary counter data must be stored into a temporary
> accumulation buffer.
>
> If there are sessions waiting for a sample, this accumulated buffer
> will be taken, and emitted for each waiting client. During this phase,
> information like the timestamps of sample request and sample emission,
> type of the counter block and block index annotations are added to the
> sample header and block headers. If no sessions are waiting for
> a sample, this accumulation buffer is kept until the next time a
> sample is requested.
>
> Special handling is needed for the PRFCNT_OVERFLOW interrupt, which is
> an indication that the internal sample handling rate was insufficient.
>
> The sampler also maintains a buffer descriptor indicating the
> structure of a firmware sample, since neither the firmware nor the
> hardware give any indication of the sample structure, only that it
> is composed out of three parts:
>  - the metadata is an optional initial counter block on supporting
>    firmware versions that contains a single counter, indicating the
>    reason a sample was taken when entering global non-counting regions.
>    This is used to provide coarse-grained information about why a
>    sample was taken to userspace, to help userspace interpret
>    variations in counter magnitude (the handling for this will be
>    implemented in another patch series).
>  - the firmware component of the sample is composed out of a global
>    firmware counter block on supporting firmware versions.
>  - the hardware component is the most sizeable of the three and
>    contains a block of counters for each of the underlying hardware
>    resources. It has a fixed structure that is described in the
>    architecture specification, and contains the command stream
>    hardware block(s), the tiler block(s), the MMU and L2 blocks
>    (collectively named the memsys blocks) and the shader core blocks,
>    in that order.
> The structure of this buffer changes based on the firmware and
> hardware combination, but is constant on a single system.
>
> This buffer descriptor also handles the sparseness of the shader cores,
> wherein the physical core mask contains holes, but the memory allocated
> for it is done based on the position of the most significant bit. In
> cases with highly sparse core masks, this means that a lot of shader
> counter blocks are empty, and must be skipped.
>
> The number of ring buffer slots is configurable through module param
> to allow for a lower memory footprint on memory constrained systems.
>
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Co-developed-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c   |    6 +
>  drivers/gpu/drm/panthor/panthor_fw.h   |    6 +-
>  drivers/gpu/drm/panthor/panthor_perf.c | 1061 +++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_perf.h |    2 +
>  4 files changed, 1068 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 36f1034839c2..c3e1e5ed4f9c 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -22,6 +22,7 @@
>  #include "panthor_gem.h"
>  #include "panthor_gpu.h"
>  #include "panthor_mmu.h"
> +#include "panthor_perf.h"
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
>
> @@ -989,9 +990,12 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
>
>  	/* Enable interrupts we care about. */
>  	glb_iface->input->ack_irq_mask = GLB_CFG_ALLOC_EN |
> +					 GLB_PERFCNT_SAMPLE |
>  					 GLB_PING |
>  					 GLB_CFG_PROGRESS_TIMER |
>  					 GLB_CFG_POWEROFF_TIMER |
> +					 GLB_PERFCNT_THRESHOLD |
> +					 GLB_PERFCNT_OVERFLOW |
>  					 GLB_IDLE_EN |
>  					 GLB_IDLE;
>
> @@ -1022,6 +1026,8 @@ static void panthor_job_irq_handler(struct panthor_device *ptdev, u32 status)
>  		return;
>
>  	panthor_sched_report_fw_events(ptdev, status);
> +
> +	panthor_perf_report_irq(ptdev, status);
>  }
>  PANTHOR_IRQ_HANDLER(job, JOB, panthor_job_irq_handler);
>
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
> index 8bcb933fa790..5a561e72e88b 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.h
> +++ b/drivers/gpu/drm/panthor/panthor_fw.h
> @@ -198,6 +198,7 @@ struct panthor_fw_global_control_iface {
>  	u32 group_num;
>  	u32 group_stride;
>  #define GLB_PERFCNT_FW_SIZE(x) ((((x) >> 16) << 8))
> +#define GLB_PERFCNT_HW_SIZE(x) (((x) & GENMASK(15, 0)) << 8)
>  	u32 perfcnt_size;
>  	u32 instr_features;
>  #define PERFCNT_FEATURES_MD_SIZE(x) (((x) & GENMASK(3, 0)) << 8)
> @@ -210,7 +211,7 @@ struct panthor_fw_global_input_iface {
>  #define GLB_CFG_ALLOC_EN			BIT(2)
>  #define GLB_CFG_POWEROFF_TIMER			BIT(3)
>  #define GLB_PROTM_ENTER				BIT(4)
> -#define GLB_PERFCNT_EN				BIT(5)
> +#define GLB_PERFCNT_ENABLE			BIT(5)
>  #define GLB_PERFCNT_SAMPLE			BIT(6)
>  #define GLB_COUNTER_EN				BIT(7)
>  #define GLB_PING				BIT(8)
> @@ -243,6 +244,9 @@ struct panthor_fw_global_input_iface {
>  	u64 perfcnt_base;
>  	u32 perfcnt_extract;
>  	u32 reserved3[3];
> +#define GLB_PERFCNT_CONFIG_SIZE(x) ((x) & GENMASK(7, 0))
> +#define GLB_PERFCNT_CONFIG_SET(x) (((x) & GENMASK(1, 0)) << 8)
> +#define GLB_PERFCNT_METADATA_ENABLE BIT(10)
>  	u32 perfcnt_config;
>  	u32 perfcnt_csg_select;
>  	u32 perfcnt_fw_enable;
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
> index d1f984b3302a..fd16039d9244 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.c
> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
> @@ -10,6 +10,9 @@
>
>  #include "panthor_device.h"
>  #include "panthor_fw.h"
> +#include "panthor_gem.h"
> +#include "panthor_gpu.h"
> +#include "panthor_mmu.h"
>  #include "panthor_perf.h"
>  #include "panthor_regs.h"
>
> @@ -20,6 +23,81 @@
>   */
>  #define PANTHOR_PERF_EM_BITS (BITS_PER_TYPE(u64) * 2)
>
> +/**
> + * PANTHOR_CTR_TIMESTAMP_LO - The first architecturally mandated counter of every block type
> + *                            contains the low 32-bits of the TIMESTAMP value.
> + */
> +#define PANTHOR_CTR_TIMESTAMP_LO (0)
> +
> +/**
> + * PANTHOR_CTR_TIMESTAMP_HI - The register offset containinig the high 32-bits of the TIMESTAMP
> + *                            value.
> + */
> +#define PANTHOR_CTR_TIMESTAMP_HI (1)
> +
> +/**
> + * PANTHOR_CTR_PRFCNT_EN - The register offset containing the enable mask for the enabled counters
> + *                         that were written to memory.
> + */
> +#define PANTHOR_CTR_PRFCNT_EN (2)
> +
> +/**
> + * PANTHOR_HEADER_COUNTERS - The first four counters of every block type are architecturally
> + *                           defined to be equivalent. The fourth counter is always reserved,
> + *                           and should be zero and as such, does not have a separate define.
> + *
> + *                           These are the only four counters that are the same between different
> + *                           blocks and are consistent between different architectures.
> + */
> +#define PANTHOR_HEADER_COUNTERS (4)
> +
> +/**
> + * PANTHOR_CTR_SAMPLE_REASON - The metadata block has a single value in position three which
> + *                             indicates the reason a sample was taken.
> + */
> +#define PANTHOR_CTR_SAMPLE_REASON (3)
> +
> +/**
> + * PANTHOR_HW_COUNTER_SIZE - The size of a hardware counter in the FW ring buffer.
> + */
> +#define PANTHOR_HW_COUNTER_SIZE (sizeof(u32))
> +
> +/**
> + * PANTHOR_PERF_RINGBUF_SLOTS_MIN - The minimum permitted number of slots in the Panthor perf
> + *                                  ring buffer.
> + */
> +#define PANTHOR_PERF_RINGBUF_SLOTS_MIN (16)
> +
> +/**
> + * PANTHOR_PERF_RINGBUF_SLOTS_MAX - The maximum permitted number of slots in the Panthor perf
> + *                                  ring buffer.
> + */
> +#define PANTHOR_PERF_RINGBUF_SLOTS_MAX (256)
> +
> +static unsigned int perf_ringbuf_slots = 32;
> +
> +static int perf_ringbuf_slots_set(const char *val, const struct kernel_param *kp)
> +{
> +	unsigned int slots;
> +	int ret = kstrtouint(val, 0, &slots);
> +
> +	if (ret)
> +		return ret;
> +
> +	if (!is_power_of_2(slots))
> +		return -EINVAL;
> +
> +	return param_set_uint_minmax(val, kp, 16, 256);
> +}
> +
> +static const struct kernel_param_ops perf_ringbuf_ops = {
> +	.set = perf_ringbuf_slots_set,
> +	.get = param_get_uint,
> +};
> +module_param_cb(perf_ringbuf_slots, &perf_ringbuf_ops, &perf_ringbuf_slots, 0400);
> +MODULE_PARM_DESC(perf_ringbuf_slots,
> +		 "Power of two slots allocated for the Panthor perf kernel-FW ringbuffer");
> +
>  enum panthor_perf_session_state {
>  	/** @PANTHOR_PERF_SESSION_ACTIVE: The session is active and can be used for sampling. */
>  	PANTHOR_PERF_SESSION_ACTIVE = 0,
> @@ -65,6 +143,116 @@ enum session_sample_type {
>  	SAMPLE_TYPE_REGULAR,
>  };
>
> +struct panthor_perf_buffer_descriptor {
> +	/**
> +	 * @block_size: The size of a single block in the FW ring buffer, equal to
> +	 *              sizeof(u32) * counters_per_block.
> +	 */
> +	size_t block_size;
> +
> +	/**
> +	 * @buffer_size: The total size of the buffer, equal to (#hardware blocks +
> +	 *               #firmware blocks) * block_size.
> +	 */
> +	size_t buffer_size;
> +
> +	/**
> +	 * @available_blocks: Bitmask indicating the blocks supported by the hardware and firmware
> +	 *                    combination. Note that this can also include blocks that will not
> +	 *                    be exposed to the user.
> +	 */
> +	DECLARE_BITMAP(available_blocks, DRM_PANTHOR_PERF_BLOCK_MAX);
> +	struct {
> +		/** @offset: Starting offset of a block of type @type in the FW ringbuffer. */
> +		size_t offset;
> +
> +		/** @block_count: Number of blocks of the given @type, starting at @offset. */
> +		size_t block_count;
> +
> +		/** @phys_mask: Bitmask of the physically available blocks. */
> +		u64 phys_mask;
> +	} blocks[DRM_PANTHOR_PERF_BLOCK_MAX];
> +};
> +
> +/**
> + * struct panthor_perf_sampler - Interface to de-multiplex firmware interaction and handle
> + *                               global interactions.
> + */
> +struct panthor_perf_sampler {
> +	/**
> +	 * @enabled_clients: The number of clients concurrently requesting samples. To ensure that
> +	 *                   one client cannot deny samples to another, we must ensure that clients
> +	 *                   are effectively reference counted.
> +	 */
> +	atomic_t enabled_clients;
> +
> +	/**
> +	 * @sample_handled: Synchronization point between the interrupt bottom half and the
> +	 *                  main sampler interface. Must be re-armed solely on a new request
> +	 *                  coming to the sampler.
> +	 */
> +	struct completion sample_handled;
> +
> +	/** @rb: Kernel BO in the FW AS containing the sample ringbuffer. */
> +	struct panthor_kernel_bo *rb;
> +
> +	/**
> +	 * @sample_slots: Number of slots for samples in the FW ringbuffer. Could be static,
> +	 *		  but may be useful to customize for low-memory devices.
> +	 */
> +	size_t sample_slots;
> +
> +	/** @em: Combined enable mask for all of the active sessions. */
> +	struct panthor_perf_enable_masks *em;
> +
> +	/**
> +	 * @desc: Buffer descriptor for a sample in the FW ringbuffer. Note that this buffer
> +	 *        at current time does some interesting things with the zeroth block type. On
> +	 *        newer FW revisions, the first counter block of the sample is the METADATA block,
> +	 *        which contains a single value indicating the reason the sample was taken (if
> +	 *        any). This block must not be exposed to userspace, as userspace does not
> +	 *        have sufficient context to interpret it. As such, this block type is not
> +	 *        added to the uAPI, but we still use it in the kernel.
> +	 */
> +	struct panthor_perf_buffer_descriptor desc;
> +
> +	/**
> +	 * @sample: Pointer to an upscaled and annotated sample that may be emitted to userspace.
> +	 *          This is used both as an intermediate buffer to do the zero-extension of the
> +	 *          32-bit counters to 64-bits and as a storage buffer in case the sampler
> +	 *          requests an additional sample that was not requested by any of the top-level
> +	 *          sessions (for instance, when changing the enable masks).
> +	 */
> +	u8 *sample;
> +
> +	/**
> +	 * @sampler_lock: Lock used to guard the list of sessions and the sampler configuration.
> +	 *                In particular, it guards the @session_list and the @em.
> +	 */
> +	struct mutex sampler_lock;
> +
> +	/** @session_list: List of all sessions. */
> +	struct list_head session_list;
> +
> +	/** @pend_lock: Lock used to guard the list of sessions with pending samples. */
> +	spinlock_t pend_lock;
> +
> +	/** @pending_samples: List of sessions requesting samples. */
> +	struct list_head pending_samples;
> +
> +	/** @sample_requested: A sample has been requested. */
> +	bool sample_requested;
> +
> +	/** @set_config: The set that will be configured onto the hardware. */
> +	u8 set_config;
> +
> +	/**
> +	 * @ptdev: Backpointer to the Panthor device, needed to ring the global doorbell and
> +	 *         interface with FW.
> +	 */
> +	struct panthor_device *ptdev;
> +};
> +
>  struct panthor_perf_session {
>  	DECLARE_BITMAP(state, PANTHOR_PERF_SESSION_MAX);
>
> @@ -186,6 +374,9 @@ struct panthor_perf {
>  	 * @sessions: Global map of sessions, accessed by their ID.
>  	 */
>  	struct xarray sessions;
> +
> +	/** @sampler: FW control interface. */
> +	struct panthor_perf_sampler sampler;
>  };
>
>  static size_t get_annotated_block_size(size_t counters_per_block)
> @@ -255,6 +446,23 @@ static struct panthor_perf_enable_masks *panthor_perf_create_em(struct drm_panth
>  	return em;
>  }
>
> +static void panthor_perf_em_add(struct panthor_perf_enable_masks *const dst_em,
> +				const struct panthor_perf_enable_masks *const src_em)
> +{
> +	size_t i = 0;
> +
> +	for (i = DRM_PANTHOR_PERF_BLOCK_FIRST; i <= DRM_PANTHOR_PERF_BLOCK_LAST; i++)
> +		bitmap_or(dst_em->mask[i], dst_em->mask[i], src_em->mask[i], PANTHOR_PERF_EM_BITS);
> +}
> +
> +static void panthor_perf_em_zero(struct panthor_perf_enable_masks *em)
> +{
> +	size_t i = 0;
> +
> +	for (i = DRM_PANTHOR_PERF_BLOCK_FIRST; i <= DRM_PANTHOR_PERF_BLOCK_LAST; i++)
> +		bitmap_zero(em->mask[i], PANTHOR_PERF_EM_BITS);
> +}
> +
>  static u64 session_read_extract_idx(struct panthor_perf_session *session)
>  {
>  	const u64 slots = session->ringbuf_slots;
> @@ -265,6 +473,12 @@ static u64 session_read_extract_idx(struct panthor_perf_session *session)
>  	return smp_load_acquire(&session->control->extract_idx) % slots;
>  }
>
> +static void session_write_insert_idx(struct panthor_perf_session *session, u64 idx)
> +{
> +	/* Userspace needs the insert index to know where to look for the sample. */
> +	smp_store_release(&session->control->insert_idx, idx);
> +}
> +
>  static u64 session_read_insert_idx(struct panthor_perf_session *session)
>  {
>  	const u64 slots = session->ringbuf_slots;
> @@ -352,6 +566,758 @@ static struct panthor_perf_session *session_find(struct panthor_file *pfile,
>  	return session;
>  }
>
> +static u32 compress_enable_mask(u32 counters, const unsigned long *const src)
> +{
> +	size_t i;
> +	u32 result = 0;
> +	const unsigned long ctr_per_bit = counters / BITS_PER_TYPE(u32);
> +
> +	for_each_set_bit(i, src, counters) {
> +		const unsigned long pos = div_u64(i, ctr_per_bit);
> +
> +		result |= BIT(pos);
> +	}
> +
> +	return result;
> +}
> +
> +static void expand_enable_mask(u32 counters, u32 em, unsigned long *const dst)
> +{
> +	size_t i;
> +	const unsigned long ctrs_per_bit = counters / BITS_PER_TYPE(u32);
> +	DECLARE_BITMAP(emb, BITS_PER_TYPE(u32));
> +
> +	bitmap_from_arr32(emb, &em, BITS_PER_TYPE(u32));
> +
> +	for_each_set_bit(i, emb, BITS_PER_TYPE(u32))
> +		bitmap_set(dst, i * ctrs_per_bit, ctrs_per_bit);
> +}
> +
> +/**
> + * panthor_perf_block_data - Identify the block index and type based on the offset.
> + *
> + * @desc:   FW buffer descriptor.
> + * @offset: The current offset being examined.
> + * @idx:    Pointer to an output index.
> + * @type:   Pointer to an output block type.
> + *
> + * To disambiguate different types of blocks as well as different blocks of the same type,
> + * the offset into the FW ringbuffer is used to uniquely identify the block being considered.
> + *
> + * In the future, this is a good time to identify whether a block will be empty,
> + * allowing us to short-circuit its processing after emitting header information.
> + *
> + * Return: True if the current block is available, false otherwise.
> + */
> +static bool panthor_perf_block_data(struct panthor_perf_buffer_descriptor *const desc,
> +				    size_t offset, u32 *const idx,
> +				    enum drm_panthor_perf_block_type *type)
> +{
> +	unsigned long id;
> +
> +	for_each_set_bit(id, desc->available_blocks, DRM_PANTHOR_PERF_BLOCK_LAST) {
> +		const size_t block_start = desc->blocks[id].offset;
> +		const size_t block_count = desc->blocks[id].block_count;
> +		const size_t block_end = desc->blocks[id].offset +
> +			desc->block_size * block_count;
> +
> +		if (!block_count)
> +			continue;
> +
> +		if (offset >= block_start && offset < block_end) {
> +			const unsigned long phys_mask[] = {
> +				BITMAP_FROM_U64(desc->blocks[id].phys_mask),
> +			};
> +			const size_t pos =
> +				div_u64(offset - desc->blocks[id].offset, desc->block_size);

Nit: Maybe 'pos' could be better described as 'block_number'? I find 'pos' a little bit too broad in meaning.

> +
> +			*type = id;
> +
> +			if (test_bit(pos, phys_mask)) {
> +				const u64 mask = GENMASK_ULL(pos, 0);
> +				const u64 zeroes = ~desc->blocks[id].phys_mask & mask;

Because phys_mask is always set with BLK_MASK(), then
GENMASK_ULL(pos, 0), 'pos' being less than the total number of blocks of
a certain type, it follows that mask & phys_mask == mask, so I've the
suspicion that it'll always hold that *idx == pos .

> +
> +				*idx = pos - hweight64(zeroes);
> +				return true;
> +			}
> +			return false;
> +		}
> +	}
> +
> +	return false;
> +}
> +
> +static u32 panthor_perf_handle_sample(struct panthor_device *ptdev, u32 extract_idx, u32 insert_idx)
> +{
> +	struct panthor_perf *perf = ptdev->perf;
> +	struct panthor_perf_sampler *sampler = &ptdev->perf->sampler;
> +	const size_t ann_block_size =
> +		get_annotated_block_size(ptdev->perf_info.counters_per_block);
> +	u32 i;
> +
> +	for (i = extract_idx; i != insert_idx; i++) {
> +		u32 slot = i % sampler->sample_slots;
> +		u8 *fw_sample = (u8 *)sampler->rb->kmap + slot * sampler->desc.buffer_size;
> +
> +		for (size_t fw_off = 0, ann_off = ptdev->perf_info.sample_header_size;
> +				fw_off < sampler->desc.buffer_size;
> +				fw_off += sampler->desc.block_size)
> +
> +		{
> +			u32 idx = 0;
> +			enum drm_panthor_perf_block_type type = 0;
> +			DECLARE_BITMAP(expanded_em, PANTHOR_PERF_EM_BITS);
> +			struct panthor_perf_counter_block *blk =
> +				(typeof(blk))(perf->sampler.sample + ann_off);
> +			u32 *const block = (u32 *)(fw_sample + fw_off);
> +			const u32 prfcnt_en = block[PANTHOR_CTR_PRFCNT_EN];
> +
> +			if (!panthor_perf_block_data(&sampler->desc, fw_off, &idx, &type))
> +				continue;
> +
> +			/**
> +			 * TODO Data from the metadata block must be used to populate the
> +			 * block state information.
> +			 */
> +			if (type == DRM_PANTHOR_PERF_BLOCK_METADATA) {
> +				/*
> +				 * The host must clear the SAMPLE_REASON to acknowledge it has
> +				 * consumed the sample.
> +				 */
> +				block[PANTHOR_CTR_SAMPLE_REASON] = 0;
> +				continue;
> +			}
> +
> +			expand_enable_mask(ptdev->perf_info.counters_per_block,
> +					   prfcnt_en, expanded_em);
> +
> +			blk->header = (struct drm_panthor_perf_block_header) {
> +				.clock = 0,
> +				.block_idx = idx,
> +				.block_type = type,
> +				.block_states = DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN
> +			};
> +			bitmap_to_arr64(blk->header.enable_mask, expanded_em, PANTHOR_PERF_EM_BITS);
> +
> +			/*
> +			 * The four header counters must be treated differently, because they are
> +			 * not additive. For the fourth, the assignment does not matter, as it
> +			 * is reserved and should be zero.
> +			 */
> +			blk->counters[PANTHOR_CTR_TIMESTAMP_LO] = block[PANTHOR_CTR_TIMESTAMP_LO];
> +			blk->counters[PANTHOR_CTR_TIMESTAMP_HI] = block[PANTHOR_CTR_TIMESTAMP_HI];
> +			blk->counters[PANTHOR_CTR_PRFCNT_EN] = block[PANTHOR_CTR_PRFCNT_EN];
> +
> +			/*
> +			 * The host must clear PRFCNT_EN to acknowledge it has consumed the sample.
> +			 */
> +			block[PANTHOR_CTR_PRFCNT_EN] = 0;
> +
> +			for (size_t k = PANTHOR_HEADER_COUNTERS;
> +					k < ptdev->perf_info.counters_per_block;
> +					k++)
> +				blk->counters[k] += block[k];
> +
> +			ann_off += ann_block_size;
> +		}
> +	}
> +
> +	return i;
> +}
> +
> +static size_t panthor_perf_get_fw_reported_size(struct panthor_device *ptdev)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +
> +	size_t fw_size = GLB_PERFCNT_FW_SIZE(glb_iface->control->perfcnt_size);
> +	size_t hw_size = GLB_PERFCNT_HW_SIZE(glb_iface->control->perfcnt_size);
> +	size_t md_size = PERFCNT_FEATURES_MD_SIZE(glb_iface->control->perfcnt_features);
> +
> +	return md_size + fw_size + hw_size;
> +}
> +
> +#define PANTHOR_PERF_SET_BLOCK_DESC_DATA(__desc, __type, __blk_count, __phys_mask, __offset) \
> +	({ \
> +		(__desc)->blocks[(__type)].offset = (__offset); \
> +		(__desc)->blocks[(__type)].block_count = (__blk_count);  \
> +		(__desc)->blocks[(__type)].phys_mask = (__phys_mask);   \
> +		if ((__blk_count))                                    \
> +			set_bit((__type), (__desc)->available_blocks); \
> +		(__offset) + ((__desc)->block_size) * (__blk_count); \
> +	 })
> +
> +static size_t get_reserved_sc_blocks(struct panthor_device *ptdev)
> +{
> +	const u64 sc_mask = ptdev->gpu_info.shader_present;
> +
> +	return fls64(sc_mask);
> +}
> +
> +#define BLK_MASK(x) GENMASK_ULL((x) - 1, 0)
> +
> +static u64 get_sc_mask(struct panthor_device *ptdev)
> +{
> +	const u64 sc_mask = ptdev->gpu_info.shader_present;
> +
> +	return BLK_MASK(hweight64(sc_mask));
> +}
> +
> +static int panthor_perf_setup_fw_buffer_desc(struct panthor_device *ptdev,
> +					     struct panthor_perf_sampler *sampler)
> +{
> +	const struct drm_panthor_perf_info *const info = &ptdev->perf_info;
> +	const size_t block_size = info->counters_per_block * PANTHOR_HW_COUNTER_SIZE;
> +	struct panthor_perf_buffer_descriptor *desc = &sampler->desc;
> +	const size_t fw_sample_size = panthor_perf_get_fw_reported_size(ptdev);
> +	size_t offset = 0;
> +
> +	desc->block_size = block_size;
> +
> +	for (enum drm_panthor_perf_block_type type = 0; type < DRM_PANTHOR_PERF_BLOCK_MAX; type++) {
> +		switch (type) {
> +		case DRM_PANTHOR_PERF_BLOCK_METADATA:
> +			if (info->flags & DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT)
> +				offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, 1,
> +									  BLK_MASK(1), offset);
> +			break;
> +		case DRM_PANTHOR_PERF_BLOCK_FW:
> +			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->fw_blocks,
> +								  BLK_MASK(info->fw_blocks),
> +								  offset);
> +			break;
> +		case DRM_PANTHOR_PERF_BLOCK_CSHW:
> +			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->cshw_blocks,
> +								  BLK_MASK(info->cshw_blocks),
> +								  offset);
> +			break;
> +		case DRM_PANTHOR_PERF_BLOCK_TILER:
> +			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->tiler_blocks,
> +								  BLK_MASK(info->tiler_blocks),
> +								  offset);
> +			break;
> +		case DRM_PANTHOR_PERF_BLOCK_MEMSYS:
> +			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->memsys_blocks,
> +								  BLK_MASK(info->memsys_blocks),
> +								  offset);
> +			break;
> +		case DRM_PANTHOR_PERF_BLOCK_SHADER:
> +			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type,
> +								  get_reserved_sc_blocks(ptdev),
> +								  get_sc_mask(ptdev), offset);
> +			break;
> +		case DRM_PANTHOR_PERF_BLOCK_MAX:
> +			drm_WARN_ON_ONCE(&ptdev->base,
> +					 "DRM_PANTHOR_PERF_BLOCK_MAX should be unreachable!");
> +			break;
> +		}
> +	}
> +
> +	/* Computed size is not the same as the reported size, so we should not proceed in
> +	 * initializing the sampling session.
> +	 */
> +	if (offset != fw_sample_size)
> +		return -EINVAL;
> +
> +	desc->buffer_size = offset;
> +
> +	return 0;
> +}
> +
> +static int panthor_perf_fw_stop_sampling(struct panthor_device *ptdev)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	u32 acked;
> +	int ret;
> +
> +	if (~READ_ONCE(glb_iface->input->req) & GLB_PERFCNT_ENABLE)
> +		return 0;
> +
> +	panthor_fw_update_reqs(glb_iface, req, 0, GLB_PERFCNT_ENABLE);
> +	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> +	ret = panthor_fw_glb_wait_acks(ptdev, GLB_PERFCNT_ENABLE, &acked, 100);
> +	if (ret)
> +		drm_warn(&ptdev->base, "Could not disable performance counters");
> +
> +	return ret;
> +}
> +
> +static int panthor_perf_fw_start_sampling(struct panthor_device *ptdev)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	u32 acked;
> +	int ret;
> +
> +	if (READ_ONCE(glb_iface->input->req) & GLB_PERFCNT_ENABLE)
> +		return 0;
> +
> +	/**
> +	 * The spec mandates that the host zero the PRFCNT_EXTRACT register before an enable
> +	 * operation, and each (re-)enable will require an enable-disable pair to program
> +	 * the new changes onto the FW interface.
> +	 */
> +	WRITE_ONCE(glb_iface->input->perfcnt_extract, 0);
> +
> +	panthor_fw_update_reqs(glb_iface, req, GLB_PERFCNT_ENABLE, GLB_PERFCNT_ENABLE);
> +	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> +	ret = panthor_fw_glb_wait_acks(ptdev, GLB_PERFCNT_ENABLE, &acked, 100);
> +	if (ret)
> +		drm_warn(&ptdev->base, "Could not enable performance counters");
> +
> +	return ret;
> +}
> +
> +static void panthor_perf_fw_write_sampler_config(struct panthor_perf_sampler *sampler)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(sampler->ptdev);
> +	const u32 counters = sampler->ptdev->perf_info.counters_per_block;
> +	const struct panthor_perf_enable_masks *const em = sampler->em;
> +	u32 perfcnt_config;
> +
> +	glb_iface->input->perfcnt_csf_enable =
> +		compress_enable_mask(counters, em->mask[DRM_PANTHOR_PERF_BLOCK_CSHW]);
> +	glb_iface->input->perfcnt_shader_enable =
> +		compress_enable_mask(counters, em->mask[DRM_PANTHOR_PERF_BLOCK_SHADER]);
> +	glb_iface->input->perfcnt_mmu_l2_enable =
> +		compress_enable_mask(counters, em->mask[DRM_PANTHOR_PERF_BLOCK_MEMSYS]);
> +	glb_iface->input->perfcnt_tiler_enable =
> +		compress_enable_mask(counters, em->mask[DRM_PANTHOR_PERF_BLOCK_TILER]);
> +	glb_iface->input->perfcnt_fw_enable =
> +		compress_enable_mask(counters, em->mask[DRM_PANTHOR_PERF_BLOCK_FW]);
> +	glb_iface->input->perfcnt_csg_enable = 0;
> +
> +	WRITE_ONCE(glb_iface->input->perfcnt_as, panthor_vm_as(panthor_fw_vm(sampler->ptdev)));
> +	WRITE_ONCE(glb_iface->input->perfcnt_base, panthor_kernel_bo_gpuva(sampler->rb));
> +
> +	perfcnt_config = GLB_PERFCNT_CONFIG_SIZE(perf_ringbuf_slots);
> +	perfcnt_config |= GLB_PERFCNT_CONFIG_SET(sampler->set_config);
> +	if (sampler->ptdev->perf_info.flags & DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT)
> +		perfcnt_config |= GLB_PERFCNT_METADATA_ENABLE;
> +
> +	WRITE_ONCE(glb_iface->input->perfcnt_config, perfcnt_config);
> +}
> +
> +static void session_populate_sample_header(struct panthor_perf_session *session,
> +					   struct drm_panthor_perf_sample_header *hdr, u8 set)
> +{
> +	*hdr = (struct drm_panthor_perf_sample_header) {
> +		.block_set = set,
> +		.user_data = session->user_data,
> +		.timestamp_start_ns = session->sample_start_ns,
> +		/**
> +		 * TODO This should be changed to use the GPU clocks and the TIMESTAMP register,
> +		 * when support is added.
> +		 */
> +		.timestamp_end_ns = ktime_get_raw_ns(),
> +	};
> +}
> +
> +/**
> + * session_accumulate_sample - Accumulate the counters that are requested by the session
> + *                             into the target buffer.
> + *
> + * @ptdev: Panthor device
> + * @session: Perf session
> + * @session_sample: Starting offset of the sample in the userspace mapping.
> + * @sampler_sample: Starting offset of the sample in the sampler intermediate buffer.
> + *
> + * The hardware supports counter selection at the granularity of 1 bit per 4 counters, and there
> + * is a single global FW frontend to program the counter requests from multiple sessions. This may
> + * lead to a large disparity between the requested and provided counters for an individual client.
> + * To remove this cross-talk, we patch out the counters that have not been requested by this
> + * session and update the PRFCNT_EN, the header counter containing a bitmask of enabled counters,
> + * accordingly.
> + */
> +static void session_accumulate_sample(struct panthor_device *ptdev,
> +				      struct panthor_perf_session *session,
> +				      u8 *session_sample, u8 *sampler_sample)
> +{
> +	const struct drm_panthor_perf_info *const perf_info = &ptdev->perf_info;
> +	const u32 counters = perf_info->counters_per_block;
> +	const size_t block_size = get_annotated_block_size(perf_info->counters_per_block);
> +	const size_t sample_size = perf_info->sample_size;
> +	const size_t sample_header_size = perf_info->sample_header_size;
> +	const size_t data_size = sample_size - sample_header_size;
> +	struct drm_panthor_perf_sample_header *hdr = (typeof(hdr))session_sample;
> +
> +	hdr->timestamp_end_ns = ktime_get_raw_ns();
> +
> +	session_sample += sample_header_size;
> +	sampler_sample += sample_header_size;
> +
> +	for (size_t i = 0; i < data_size; i += block_size) {
> +		DECLARE_BITMAP(enabled_ctrs, PANTHOR_PERF_EM_BITS);
> +		struct panthor_perf_counter_block *dst_blk = (typeof(dst_blk))(session_sample + i);
> +		struct panthor_perf_counter_block *src_blk = (typeof(src_blk))(sampler_sample + i);
> +
> +		bitmap_from_arr64(enabled_ctrs, dst_blk->header.enable_mask, PANTHOR_PERF_EM_BITS);
> +		bitmap_clear(enabled_ctrs, 0, PANTHOR_HEADER_COUNTERS);
> +
> +		dst_blk->counters[PANTHOR_CTR_TIMESTAMP_HI] =
> +			src_blk->counters[PANTHOR_CTR_TIMESTAMP_HI];
> +		dst_blk->counters[PANTHOR_CTR_TIMESTAMP_LO] =
> +			src_blk->counters[PANTHOR_CTR_TIMESTAMP_LO];
> +
> +		for (size_t ctr_idx = PANTHOR_HEADER_COUNTERS; ctr_idx < counters; ctr_idx++)
> +			if (test_bit(ctr_idx, enabled_ctrs))
> +				dst_blk->counters[ctr_idx] += src_blk->counters[ctr_idx];
> +	}
> +
> +	hdr->timestamp_end_ns = ktime_get_raw_ns();
> +	hdr->user_data = session->user_data;
> +}
> +
> +static void panthor_perf_fw_request_sample(struct panthor_perf_sampler *sampler)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(sampler->ptdev);
> +
> +	panthor_fw_toggle_reqs(glb_iface, req, ack, GLB_PERFCNT_SAMPLE);
> +	gpu_write(sampler->ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> +}
> +
> +/**
> + * session_populate_sample - Write out a new sample into a previously populated slot in the user
> + *                           ringbuffer and update both the header of the block and the PRFCNT_EN
> + *                           counter to contain only the selected subset of counters for that block.
> + *
> + * @ptdev: Panthor device
> + * @session: Perf session
> + * @session_sample: Pointer aligned to the start of the data section of the sample in the targeted
> + *                  slot.
> + * @sampler_sample: Pointer aligned to the start of the data section of the intermediate sampler
> + *                  buffer.
> + *
> + * When a new sample slot is targeted, it must be cleared of the data already existing there,
> + * enabling a direct copy from the intermediate buffer and then zeroing out any counters
> + * that are not required for the current session.
> + */
> +static void session_populate_sample(struct panthor_device *ptdev,
> +				    struct panthor_perf_session *session, u8 *session_sample,
> +				    u8 *sampler_sample)
> +{
> +	const struct drm_panthor_perf_info *const perf_info = &ptdev->perf_info;
> +
> +	const size_t block_size = get_annotated_block_size(perf_info->counters_per_block);
> +	const size_t sample_size = session_get_user_sample_size(perf_info);
> +	const size_t sample_header_size = perf_info->sample_header_size;
> +	const size_t data_size = sample_size - sample_header_size;
> +	const u32 counters = perf_info->counters_per_block;
> +
> +	session_populate_sample_header(session,
> +				       (struct drm_panthor_perf_sample_header *)session_sample,
> +				       ptdev->perf->sampler.set_config);
> +
> +	session_sample += sample_header_size;
> +
> +	memcpy(session_sample, sampler_sample + sample_header_size, data_size);
> +
> +	for (size_t i = 0; i < data_size; i += block_size) {
> +		DECLARE_BITMAP(em_diff, PANTHOR_PERF_EM_BITS);
> +		struct panthor_perf_counter_block *blk = (typeof(blk))(session_sample + i);
> +		enum drm_panthor_perf_block_type type = blk->header.block_type;
> +		unsigned long *blk_em = session->enabled_counters->mask[type];
> +
> +		bitmap_from_arr64(em_diff, blk->header.enable_mask, PANTHOR_PERF_EM_BITS);
> +
> +		bitmap_andnot(em_diff, em_diff, blk_em, PANTHOR_PERF_EM_BITS);
> +		bitmap_clear(em_diff, 0, PANTHOR_HEADER_COUNTERS);
> +
> +		blk->counters[PANTHOR_CTR_PRFCNT_EN] = compress_enable_mask(counters, blk_em);
> +
> +		for (size_t ctr_idx = PANTHOR_HEADER_COUNTERS; ctr_idx < counters; ctr_idx++) {
> +			if (test_bit(ctr_idx, em_diff))
> +				blk->counters[ctr_idx] = 0;
> +		}
> +
> +		bitmap_to_arr64(&blk->header.enable_mask, blk_em, PANTHOR_PERF_EM_BITS);
> +	}
> +}
> +
> +static int session_copy_sample(struct panthor_device *ptdev, struct panthor_perf_session *session)
> +{
> +	struct panthor_perf *perf = ptdev->perf;
> +	const size_t sample_size = session_get_user_sample_size(&ptdev->perf_info);
> +	const u64 insert_idx = session_read_insert_idx(session);
> +	const u64 extract_idx = session_read_extract_idx(session);
> +	u8 *new_sample;
> +
> +	if (!CIRC_SPACE(insert_idx, extract_idx, session->ringbuf_slots))
> +		return -ENOSPC;
> +
> +	if (READ_ONCE(session->pending_sample_request) == SAMPLE_TYPE_INITIAL)
> +		return 0;
> +
> +	new_sample = session->samples + insert_idx * sample_size;
> +
> +	if (session->accum_idx != insert_idx) {
> +		session_populate_sample(ptdev, session, new_sample, perf->sampler.sample);
> +		session->accum_idx = insert_idx;
> +	} else {
> +		session_accumulate_sample(ptdev, session, new_sample, perf->sampler.sample);
> +	}
> +
> +	return 0;
> +}
> +
> +static void session_emit_sample(struct panthor_perf_session *session)
> +{
> +	const u64 insert_idx = session_read_insert_idx(session);
> +	const enum session_sample_type type = READ_ONCE(session->pending_sample_request);
> +
> +	if (type == SAMPLE_TYPE_INITIAL || type == SAMPLE_TYPE_NONE)
> +		goto reset_sample_request;
> +
> +	session_write_insert_idx(session, (insert_idx + 1) % session->ringbuf_slots);
> +
> +	/* Since we are about to notify userspace, we must ensure that all changes to memory
> +	 * are visible.
> +	 */
> +	wmb();
> +
> +	eventfd_signal(session->eventfd);
> +
> +reset_sample_request:
> +	WRITE_ONCE(session->pending_sample_request, SAMPLE_TYPE_NONE);
> +}
> +
> +#define PRFCNT_IRQS (GLB_PERFCNT_OVERFLOW | GLB_PERFCNT_SAMPLE | GLB_PERFCNT_THRESHOLD)
> +
> +void panthor_perf_report_irq(struct panthor_device *ptdev, u32 status)
> +{
> +	struct panthor_perf *const perf = ptdev->perf;
> +	struct panthor_perf_sampler *sampler;
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	bool sample_requested;
> +
> +	if (!(status & JOB_INT_GLOBAL_IF))
> +		return;
> +
> +	if (!perf)
> +		return;
> +
> +	sampler = &perf->sampler;
> +
> +	const u32 ack = READ_ONCE(glb_iface->output->ack);
> +	const u32 req = READ_ONCE(glb_iface->input->req);
> +
> +	scoped_guard(spinlock_irqsave, &sampler->pend_lock)
> +		sample_requested = sampler->sample_requested;
> +
> +	/*
> +	 * TODO Fix up the error handling for overflow. Currently, the user is unblocked
> +	 * with a completely empty sample, whic is not the intended behaviour.
> +	 */
> +	if (drm_WARN_ON_ONCE(&ptdev->base, (req ^ ack) & GLB_PERFCNT_OVERFLOW))
> +		goto emit;
> +
> +	if ((sample_requested && (req & GLB_PERFCNT_SAMPLE) == (ack & GLB_PERFCNT_SAMPLE)) ||
> +	    ((req ^ ack) & GLB_PERFCNT_THRESHOLD)) {
> +		const u32 extract_idx = READ_ONCE(glb_iface->input->perfcnt_extract);
> +		const u32 insert_idx = READ_ONCE(glb_iface->output->perfcnt_insert);
> +
> +		/* If the sample was requested around a reset, some time may be needed
> +		 * for the FW interface to be updated, so we reschedule a sample
> +		 * and return immediately.
> +		 */
> +		if (insert_idx == extract_idx) {
> +			guard(spinlock_irqsave)(&sampler->pend_lock);
> +			if (sampler->sample_requested)
> +				panthor_perf_fw_request_sample(sampler);
> +
> +			return;
> +		}
> +
> +		WRITE_ONCE(glb_iface->input->perfcnt_extract,
> +			   panthor_perf_handle_sample(ptdev, extract_idx, insert_idx));
> +	}
> +
> +	scoped_guard(mutex, &sampler->sampler_lock)
> +	{
> +		struct list_head *pos;
> +
> +		list_for_each(pos, &sampler->session_list) {
> +			struct panthor_perf_session *session = list_entry(pos,
> +					struct panthor_perf_session, sessions);
> +
> +			session_copy_sample(ptdev, session);
> +		}
> +	}
> +
> +emit:
> +	scoped_guard(spinlock_irqsave, &sampler->pend_lock) {
> +		struct list_head *pos, *tmp;
> +
> +		list_for_each_safe(pos, tmp, &sampler->pending_samples) {
> +			struct panthor_perf_session *session = list_entry(pos,
> +					struct panthor_perf_session, pending);
> +
> +			session_emit_sample(session);
> +			list_del(pos);
> +			session_put(session);
> +		}
> +
> +		sampler->sample_requested = false;
> +	}
> +
> +	memset(sampler->sample, 0, session_get_user_sample_size(&ptdev->perf_info));

Is this really necessary? I might've asked it in a previous review but I
guess you're doing this in case the annotated upscaled sample is accumulated into
rather than being just populated from the latest FW sample slot?

> +	complete(&sampler->sample_handled);
> +}
> +
> +static int panthor_perf_sampler_init(struct panthor_perf_sampler *sampler,
> +				     struct panthor_device *ptdev)
> +{
> +	struct panthor_kernel_bo *bo;
> +	u8 *sample;
> +	int ret;
> +
> +	ret = panthor_perf_setup_fw_buffer_desc(ptdev, sampler);
> +	if (ret) {
> +		drm_err(&ptdev->base,
> +			"Failed to setup descriptor for FW ring buffer, err = %d", ret);
> +		return ret;
> +	}
> +
> +	bo = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
> +				      sampler->desc.buffer_size * perf_ringbuf_slots,
> +				      DRM_PANTHOR_BO_NO_MMAP,
> +				      DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
> +				      DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
> +				      PANTHOR_VM_KERNEL_AUTO_VA,
> +				      "perf_ringbuf");
> +
> +	if (IS_ERR_OR_NULL(bo))
> +		return IS_ERR(bo) ? PTR_ERR(bo) : -ENOMEM;
> +
> +	ret = panthor_kernel_bo_vmap(bo);
> +	if (ret)
> +		goto cleanup_bo;
> +
> +	sample = kzalloc(session_get_user_sample_size(&ptdev->perf_info), GFP_KERNEL);
> +	if (ZERO_OR_NULL_PTR(sample)) {
> +		ret = -ENOMEM;
> +		goto cleanup_vmap;
> +	}
> +
> +	sampler->rb = bo;
> +	sampler->sample = sample;
> +	sampler->sample_slots = perf_ringbuf_slots;
> +	sampler->em = kzalloc(sizeof(*sampler->em), GFP_KERNEL);

I guess you're not checking kzalloc's return value because struct
panthor_perf_enable_masks isn't too big either, but in that case you
might as well embed it in the sampler struct.

> +
> +	mutex_init(&sampler->sampler_lock);
> +	spin_lock_init(&sampler->pend_lock);
> +	INIT_LIST_HEAD(&sampler->session_list);
> +	INIT_LIST_HEAD(&sampler->pending_samples);
> +	init_completion(&sampler->sample_handled);
> +
> +	sampler->ptdev = ptdev;
> +
> +	return 0;
> +
> +cleanup_vmap:
> +	panthor_kernel_bo_vunmap(bo);
> +
> +cleanup_bo:
> +	panthor_kernel_bo_destroy(bo);
> +
> +	return ret;
> +}
> +
> +static void panthor_perf_sampler_term(struct panthor_perf_sampler *sampler)
> +{
> +	int ret;
> +	bool requested;
> +
> +	scoped_guard(spinlock_irqsave, &sampler->pend_lock)
> +		requested = sampler->sample_requested;
> +
> +	if (requested)
> +		wait_for_completion_killable(&sampler->sample_handled);
> +
> +	ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
> +	if (ret)
> +		drm_warn_once(&sampler->ptdev->base, "Sampler termination failed, ret = %d", ret);
> +
> +	/* At this point, the sampler enable mask is already zero, so it can be used directly. */
> +	panthor_perf_fw_write_sampler_config(sampler);
> +
> +	kfree(sampler->em);
> +	kfree(sampler->sample);
> +
> +	panthor_kernel_bo_destroy(sampler->rb);
> +}
> +
> +static int panthor_perf_sampler_add(struct panthor_perf_sampler *sampler,
> +				    struct panthor_perf_session *session, u8 set)
> +{
> +	int ret = 0;
> +	struct panthor_perf_enable_masks *const session_em = session->enabled_counters;
> +
> +	guard(mutex)(&sampler->sampler_lock);
> +
> +	/* Early check for whether a new set can be configured. */
> +	if (!atomic_read(&sampler->enabled_clients))
> +		sampler->set_config = set;
> +	else
> +		if (sampler->set_config != set)
> +			return -EBUSY;
> +
> +	panthor_perf_em_add(sampler->em, session_em);
> +	ret = pm_runtime_resume_and_get(sampler->ptdev->base.dev);
> +	if (ret)
> +		return ret;
> +
> +	if (atomic_read(&sampler->enabled_clients)) {
> +		ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	panthor_perf_fw_write_sampler_config(sampler);
> +
> +	ret = panthor_perf_fw_start_sampling(sampler->ptdev);
> +	if (ret)
> +		return ret;
> +
> +	session_get(session);
> +	list_add_tail(&session->sessions, &sampler->session_list);
> +	atomic_inc(&sampler->enabled_clients);
> +
> +	return 0;
> +}
> +
> +static int panthor_perf_sampler_remove_session(struct panthor_perf_sampler *sampler,
> +					       struct panthor_perf_session *session)
> +{
> +	int ret;
> +	struct list_head *snode;
> +
> +	guard(mutex)(&sampler->sampler_lock);
> +
> +	list_del_init(&session->sessions);
> +	session_put(session);
> +
> +	panthor_perf_em_zero(sampler->em);
> +	list_for_each(snode, &sampler->session_list)
> +	{
> +		struct panthor_perf_session *session =
> +			container_of(snode, typeof(*session), sessions);
> +
> +		panthor_perf_em_add(sampler->em, session->enabled_counters);
> +	}
> +
> +	ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
> +	if (ret)
> +		return ret;
> +
> +	atomic_dec(&sampler->enabled_clients);
> +	pm_runtime_put_sync(sampler->ptdev->base.dev);
> +
> +	panthor_perf_fw_write_sampler_config(sampler);
> +
> +	if (atomic_read(&sampler->enabled_clients))
> +		return panthor_perf_fw_start_sampling(sampler->ptdev);
> +	return 0;
> +}
> +
>  /**
>   * panthor_perf_init - Initialize the performance counter subsystem.
>   * @ptdev: Panthor device
> @@ -382,6 +1348,10 @@ int panthor_perf_init(struct panthor_device *ptdev)
>  		.max = 1,
>  	};
>
> +	ret = panthor_perf_sampler_init(&perf->sampler, ptdev);
> +	if (ret)
> +		return ret;
> +
>  	drm_info(&ptdev->base, "Performance counter subsystem initialized");
>
>  	ptdev->perf = no_free_ptr(perf);
> @@ -389,6 +1359,70 @@ int panthor_perf_init(struct panthor_device *ptdev)
>  	return ret;
>  }
>
> +static int sampler_request(struct panthor_perf_sampler *sampler,
> +			   struct panthor_perf_session *session, enum session_sample_type type)
> +{
> +	/*
> +	 * If a previous sample has not been handled yet, the session cannot request another
> +	 * sample. If this happens too often, the requested sample rate is too high.
> +	 */
> +	if (READ_ONCE(session->pending_sample_request) != SAMPLE_TYPE_NONE)
> +		return -EBUSY;
> +
> +	WRITE_ONCE(session->pending_sample_request, type);
> +	session_get(session);
> +
> +	scoped_guard(spinlock_irqsave, &sampler->pend_lock) {
> +		list_add_tail(&session->pending, &sampler->pending_samples);
> +
> +		if (!sampler->sample_requested) {
> +			reinit_completion(&sampler->sample_handled);
> +			sampler->sample_requested = true;
> +			panthor_perf_fw_request_sample(sampler);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * panthor_perf_sampler_request_initial - Request an initial sample.
> + * @sampler: Panthor sampler
> + * @session: Target session
> + *
> + * Perform a synchronous sample that gets immediately discarded. This sets a baseline at the point
> + * of time a new session is started, to avoid having counters from before the session.
> + */
> +static int panthor_perf_sampler_request_initial(struct panthor_perf_sampler *sampler,
> +						struct panthor_perf_session *session)
> +{
> +	int ret = sampler_request(sampler, session, SAMPLE_TYPE_INITIAL);
> +
> +	if (ret)
> +		return ret;
> +
> +	return wait_for_completion_timeout(&sampler->sample_handled,
> +			msecs_to_jiffies(1000));
> +}
> +
> +/**
> + * panthor_perf_sampler_request_sample - Request a counter sample for the userspace client.
> + * @sampler: Panthor sampler
> + * @session: Target session
> + *
> + * A session that has already requested a sample cannot request another one until the previous
> + * sample has been delivered.
> + *
> + * Return:
> + * * %0       - The sample has been requested successfully.
> + * * %-EBUSY  - The target session has already requested a sample and has not received it yet.
> + */
> +static int panthor_perf_sampler_request_sample(struct panthor_perf_sampler *sampler,
> +					       struct panthor_perf_session *session)
> +{
> +	return sampler_request(sampler, session, SAMPLE_TYPE_REGULAR);
> +}
> +
>  static int session_validate_set(u8 set)
>  {
>  	if (set > DRM_PANTHOR_PERF_SET_TERTIARY)
> @@ -513,6 +1547,10 @@ int panthor_perf_session_setup(struct drm_file *file, struct panthor_perf *perf,
>  	kref_init(&session->ref);
>  	session->enabled_counters = em;
>
> +	ret = panthor_perf_sampler_add(&perf->sampler, session, setup_args->block_set);
> +	if (ret)
> +		goto cleanup_xa_alloc;
> +
>  	session->sample_freq_ns = setup_args->sample_freq_ns;
>  	session->user_sample_size = user_sample_size;
>  	session->ring_buf = ringbuffer;
> @@ -523,6 +1561,9 @@ int panthor_perf_session_setup(struct drm_file *file, struct panthor_perf *perf,
>
>  	return session_id;
>
> +cleanup_xa_alloc:
> +	xa_store(&perf->sessions, session_id, NULL, GFP_KERNEL);
> +
>  cleanup_em:
>  	kfree(em);
>
> @@ -550,6 +1591,8 @@ int panthor_perf_session_setup(struct drm_file *file, struct panthor_perf *perf,
>  static int session_stop(struct panthor_perf *perf, struct panthor_perf_session *session,
>  			u64 user_data)
>  {
> +	int ret;
> +
>  	if (!test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
>  		return 0;
>
> @@ -562,9 +1605,12 @@ static int session_stop(struct panthor_perf *perf, struct panthor_perf_session *
>
>  	session->user_data = user_data;
>
> +	ret = panthor_perf_sampler_request_sample(&perf->sampler, session);
> +	if (ret)
> +		return ret;
> +
>  	clear_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state);
>
> -	/* TODO Calls to the FW interface will go here in later patches. */
>  	return 0;
>  }
>
> @@ -583,8 +1629,7 @@ static int session_start(struct panthor_perf *perf, struct panthor_perf_session
>  	if (session->sample_freq_ns)
>  		session->user_data = user_data;
>
> -	/* TODO Calls to the FW interface will go here in later patches. */
> -	return 0;
> +	return panthor_perf_sampler_request_initial(&perf->sampler, session);
>  }
>
>  static int session_sample(struct panthor_perf *perf, struct panthor_perf_session *session,
> @@ -605,20 +1650,22 @@ static int session_sample(struct panthor_perf *perf, struct panthor_perf_session
>  	 * the current sample, and one for a stop sample, since a stop command should
>  	 * always be acknowledged by taking a final sample and stopping the session.
>  	 */
> -	if (CIRC_SPACE_TO_END(insert_idx, extract_idx, session->ringbuf_slots) < 2)
> +	if (CIRC_SPACE(insert_idx, extract_idx, session->ringbuf_slots) < 2)
>  		return -EBUSY;
>
>  	session->sample_start_ns = ktime_get_raw_ns();
>  	session->user_data = user_data;
>
> -	return 0;
> +	return panthor_perf_sampler_request_sample(&perf->sampler, session);
>  }
>
>  static int session_destroy(struct panthor_perf *perf, struct panthor_perf_session *session)
>  {
> +	int ret = panthor_perf_sampler_remove_session(&perf->sampler, session);
> +
>  	session_put(session);
>
> -	return 0;
> +	return ret;
>  }
>
>  static int session_teardown(struct panthor_perf *perf, struct panthor_perf_session *session)
> @@ -825,6 +1872,8 @@ void panthor_perf_unplug(struct panthor_device *ptdev)
>
>  	xa_destroy(&perf->sessions);
>
> +	panthor_perf_sampler_term(&perf->sampler);
> +
>  	kfree(ptdev->perf);
>
>  	ptdev->perf = NULL;
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
> index c46f94ed8a96..5a14854368eb 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.h
> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
> @@ -28,5 +28,7 @@ int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf
>  				u32 sid, u64 user_data);
>  void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf);
>
> +void panthor_perf_report_irq(struct panthor_device *ptdev, u32 status);
> +
>  #endif /* __PANTHOR_PERF_H__ */
>
> --
> 2.33.0.dirty

Adrian Larumbe
