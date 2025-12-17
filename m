Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDBCCC83C6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 15:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9617510E8BB;
	Wed, 17 Dec 2025 14:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pYAYiToq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A6310E32E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 14:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765982276;
 bh=oWrJiLRmgS7Muj/A2U4CJ8S6dmf6xGofqge7plmHcng=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pYAYiToq28718fwt3nBurwfQKEmqU8nCtqOxY3tPcsOFgFxu9gIiIlKn58UtS16NE
 EDRrBltNMBOHpDI44M5zF5R7uwiyL9dNPQrexcJ7YVMF5KV4WGlmbA8S41tJwuE6Rx
 f9epJ5+F/5VhWl6sG0jKRchqfOxtTv2vqP36g4P4IGfIPnxz0rlST1uqAyD+FxSku/
 Bk78fOUnK1oeId1g3w6d6xT1BsQE4wzspnPcFkkc4U7Hy+xTVAE0owXtdgNPjCz3vq
 i4+ocGM5sDz3Evag4L+FHExL6wzCdH5FUauOPoIypqgWwrB/t4J0oRDJmHweq9AGd+
 lxaT5zYOJ9xuA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id ED54B17E110D;
 Wed, 17 Dec 2025 15:37:55 +0100 (CET)
Date: Wed, 17 Dec 2025 15:37:51 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, nd@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Mihail
 Atanassov <mihail.atanassov@arm.com>
Subject: Re: [PATCH v6 1/7] drm/panthor: Add performance counter uAPI
Message-ID: <20251217153751.5fbc68ea@fedora>
In-Reply-To: <20251215171453.2506348-2-lukas.zapolskas@arm.com>
References: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
 <20251215171453.2506348-2-lukas.zapolskas@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

Hi Lukas,

On Mon, 15 Dec 2025 17:14:47 +0000
Lukas Zapolskas <lukas.zapolskas@arm.com> wrote:

> This patch extends the DEV_QUERY ioctl to return information about the
> performance counter setup for userspace, and introduces the new
> ioctl DRM_PANTHOR_PERF_CONTROL in order to allow for the sampling of
> performance counters.
>=20
> The new design is inspired by the perf aux ringbuffer [0], with the
> insert and extract indices being mapped to userspace, allowing
> multiple samples to be exposed at any given time. To avoid pointer
> chasing, the sample metadata and block metadata are inline with
> the elements they describe.
>=20
> Userspace is responsible for passing in resources for samples to be
> exposed, including the event file descriptor for notification of new
> sample availability, the ringbuffer BO to store samples, and the
> control BO along with the offset for mapping the insert and extract
> indices. Though these indices are only a total of 8 bytes, userspace
> can then reuse the same physical page for tracking the state of
> multiple buffers by giving different offsets from the BO start to
> map them.
>=20
> [0]: https://docs.kernel.org/userspace-api/perf_ring_buffer.html
>=20
> Co-developed-by: Mihail Atanassov <mihail.atanassov@arm.com>
> Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> Reviewed-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  include/uapi/drm/panthor_drm.h | 565 +++++++++++++++++++++++++++++++++
>  1 file changed, 565 insertions(+)
>=20
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_dr=
m.h
> index e238c6264fa1..d1a92172e878 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -154,6 +154,9 @@ enum drm_panthor_ioctl_id {
>  	 * This is useful for imported BOs.
>  	 */
>  	DRM_PANTHOR_BO_QUERY_INFO,
> +
> +	/** @DRM_PANTHOR_PERF_CONTROL: Control a performance counter session. */
> +	DRM_PANTHOR_PERF_CONTROL,
>  };
> =20
>  /**
> @@ -253,6 +256,9 @@ enum drm_panthor_dev_query_type {
>  	 * @DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO: Query allowed group pr=
iorities information.
>  	 */
>  	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
> +
> +	/** @DRM_PANTHOR_DEV_QUERY_PERF_INFO: Query performance counter interfa=
ce information. */
> +	DRM_PANTHOR_DEV_QUERY_PERF_INFO,
>  };
> =20
>  /**
> @@ -445,6 +451,135 @@ struct drm_panthor_group_priorities_info {
>  	__u8 pad[3];
>  };
> =20
> +/**
> + * enum drm_panthor_perf_feat_flags - Performance counter configuration =
feature flags.
> + */
> +enum drm_panthor_perf_feat_flags {
> +	/** @DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT: Coarse-grained block states=
 are supported. */
> +	DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT =3D 1 << 0,
> +};
> +
> +/**
> + * enum drm_panthor_perf_block_type - Performance counter supported bloc=
k types.
> + */
> +enum drm_panthor_perf_block_type {
> +	/** @DRM_PANTHOR_PERF_BLOCK_METADATA: Internal use only. */
> +	DRM_PANTHOR_PERF_BLOCK_METADATA =3D 0,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_FW: The FW counter block. */
> +	DRM_PANTHOR_PERF_BLOCK_FW,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_CSHW: The CSHW counter block. */
> +	DRM_PANTHOR_PERF_BLOCK_CSHW,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_TILER: The tiler counter block. */
> +	DRM_PANTHOR_PERF_BLOCK_TILER,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_MEMSYS: A memsys counter block. */
> +	DRM_PANTHOR_PERF_BLOCK_MEMSYS,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_SHADER: A shader core counter block. */
> +	DRM_PANTHOR_PERF_BLOCK_SHADER,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_FIRST: Internal use only. */
> +	DRM_PANTHOR_PERF_BLOCK_FIRST =3D DRM_PANTHOR_PERF_BLOCK_FW,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_LAST: Internal use only. */
> +	DRM_PANTHOR_PERF_BLOCK_LAST =3D DRM_PANTHOR_PERF_BLOCK_SHADER,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_MAX: Internal use only. */
> +	DRM_PANTHOR_PERF_BLOCK_MAX =3D DRM_PANTHOR_PERF_BLOCK_LAST + 1,
> +};

I'd really prefer if we were not exposing block types as uAPI if those
are not truly needed for the UMD/KMD to agree on things. The counter
block knowledge exists in userspace (because it has to if we want to
attach meaning to counters), and I don't really see the need to
standardize it here. In my experience, any definition that's not
absolutely required might become a liability at some point. In that
case, I can already imagine new GPUs shuffling the block IDs, getting
rid of some, adding new ones, ... If we have to accommodate the enum
for those changes it will become a mess. On the other hand, if we make
the block ID an opaque u8, it just becomes HW knowledge that the
UMD/perfcnt lib has already (GPU_ID, plus other PERFCNT specific dev
queries if some stuff are implementation-defined).

> +
> +/**
> + * enum drm_panthor_perf_clock - Identifier of the clock used to produce=
 the cycle count values
> + * in a given block.
> + *
> + * Since the integrator has the choice of using one or more clocks, ther=
e may be some confusion
> + * as to which blocks are counted by which clock values unless this info=
rmation is explicitly
> + * provided as part of every block sample. Not every single clock here c=
an be used: in the simplest
> + * case, all cycle counts will be associated with the top-level clock.
> + */
> +enum drm_panthor_perf_clock {
> +	/** @DRM_PANTHOR_PERF_CLOCK_TOPLEVEL: Top-level CSF clock. */
> +	DRM_PANTHOR_PERF_CLOCK_TOPLEVEL,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_CLOCK_COREGROUP: Core group clock, responsible for=
 the MMU, L2
> +	 * caches and the tiler.
> +	 */
> +	DRM_PANTHOR_PERF_CLOCK_COREGROUP,
> +
> +	/** @DRM_PANTHOR_PERF_CLOCK_SHADER: Clock for the shader cores. */
> +	DRM_PANTHOR_PERF_CLOCK_SHADER,
> +};
> +
> +/**
> + * struct drm_panthor_perf_info - Performance counter interface informat=
ion
> + *
> + * Structure grouping all queryable information relating to the performa=
nce counter
> + * interfaces.
> + */
> +struct drm_panthor_perf_info {
> +	/**
> +	 * @counters_per_block: The number of 8-byte counters available in a bl=
ock.
> +	 */
> +	__u32 counters_per_block;
> +
> +	/**
> +	 * @sample_header_size: The size of the header struct available at the =
beginning
> +	 * of every sample.
> +	 */
> +	__u32 sample_header_size;
> +
> +	/**
> +	 * @block_header_size: The size of the header struct inline with the co=
unters for a
> +	 * single block.
> +	 */
> +	__u32 block_header_size;

Are those things not directly deducible from the arch major/minor? If
those things are implementation-defined, I guess that's fine to expose
them, but otherwise I'd rely on the knowledge that exists in the UMD.

> +
> +	/**
> +	 * @sample_size: The size of a fully annotated sample, starting with a =
sample header
> +	 *               of size @sample_header_size bytes, and all available b=
locks for the current
> +	 *               configuration, each comprised of @counters_per_block 6=
4-bit counters and
> +	 *               a block header of @block_header_size bytes.

Let's keep the kernel doc formatting consistent and drop the alignment
on the field name (IIRC, it also generate weird indentation in the
final htmldoc if we do that.

> +	 *
> +	 *               The user must use this field to allocate size for the =
ring buffer. In
> +	 *               the case of new blocks being added, an old userspace c=
an always use
> +	 *               this field and ignore any blocks it does not know abou=
t.
> +	 */
> +	__u32 sample_size;

Same thing for the sample_size, it looks like something the UMD should
know already, given a specific config.

> +
> +	/** @flags: Combination of drm_panthor_perf_feat_flags flags. */
> +	__u32 flags;
> +
> +	/**
> +	 * @supported_clocks: Bitmask of the clocks supported by the GPU.
> +	 *
> +	 * Each bit represents a variant of the enum drm_panthor_perf_clock.
> +	 *
> +	 * For the same GPU, different implementers may have different clocks f=
or the same hardware
> +	 * block. At the moment, up to three clocks are supported, and any cloc=
ks that are present
> +	 * will be reported here.
> +	 */
> +	__u32 supported_clocks;
> +
> +	/** @fw_blocks: Number of FW blocks available. */
> +	__u32 fw_blocks;
> +
> +	/** @cshw_blocks: Number of CSHW blocks available. */
> +	__u32 cshw_blocks;
> +
> +	/** @tiler_blocks: Number of tiler blocks available. */
> +	__u32 tiler_blocks;
> +
> +	/** @memsys_blocks: Number of memsys blocks available. */
> +	__u32 memsys_blocks;
> +
> +	/** @shader_blocks: Number of shader core blocks available. */
> +	__u32 shader_blocks;

Again, if it's fixed per arch <major,minor>, I'd refrain from exposing
that. And if the variants are truly implementation-defined, and we go
through opaque block IDs, I guess we'd need another DEV_QUERY, to get
the number of variants supported by a specific HW (might even have to
be a bitmask if there can be holes).

> +};
> +
>  /**
>   * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_=
DEV_QUERY
>   */
> @@ -1187,6 +1322,434 @@ struct drm_panthor_bo_query_info {
>  	__u32 pad;
>  };
> =20
> +/**
> + * DOC: Performance counter decoding in userspace.
> + *
> + * Each sample will be exposed to userspace in the following manner:
> + *
> + * +--------+--------+------------------------+--------+----------------=
---------+-----+
> + * | Sample | Block  |        Block           | Block  |         Block  =
         | ... |
> + * | header | header |        counters        | header |         counter=
s        |     |
> + * +--------+--------+------------------------+--------+----------------=
---------+-----+
> + *
> + * Each sample will start with a sample header of type @struct drm_panth=
or_perf_sample header,
> + * providing sample-wide information like the start and end timestamps, =
the counter set currently
> + * configured, and any errors that may have occurred during sampling.

Okay, that part has to be uAPI, because it's purely SW-defined IIUC.

> + *
> + * After the fixed size header, the sample will consist of blocks of
> + * 64-bit @drm_panthor_dev_query_perf_info::counters_per_block counters,=
 each prefaced with a
> + * header of its own, indicating source block type, as well as the cycle=
 count needed to normalize
> + * cycle values within that block, and a clock source identifier.

The rest is HW-defined (or FW-defined), and can be deduced from arch
<major,minor>+queries for impl-defined stuff, so I would just treat
that at opaque data in the uAPI.

> + */
> +
> +/**
> + * enum drm_panthor_perf_block_state - Bitmask of the power and executio=
n states that an individual
> + * hardware block went through in a sampling period.
> + *
> + * Because the sampling period is controlled from userspace, the block m=
ay undergo multiple
> + * state transitions, so this must be interpreted as one or more such tr=
ansitions occurring.
> + */
> +enum drm_panthor_perf_block_state {
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN: The state of this block was u=
nknown during
> +	 * the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN =3D 0,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_ON: This block was powered on for some=
 or all of
> +	 * the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_ON =3D 1 << 0,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_OFF: This block was powered off for so=
me or all of the
> +	 * sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_OFF =3D 1 << 1,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE: This block was available fo=
r execution for
> +	 * some or all of the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE =3D 1 << 2,
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE: This block was unavailabl=
e for execution for
> +	 * some or all of the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE =3D 1 << 3,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL: This block was executing in no=
rmal mode
> +	 * for some or all of the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL =3D 1 << 4,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED: This block was executing in=
 protected mode
> +	 * for some or all of the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED =3D 1 << 5,
> +};
> +
> +/**
> + * struct drm_panthor_perf_block_header - Header present before every bl=
ock in the
> + * sample ringbuffer.
> + */
> +struct drm_panthor_perf_block_header {
> +	/** @block_type: Type of the block. */
> +	__u8 block_type;
> +
> +	/** @block_idx: Block index. */
> +	__u8 block_idx;

I first thought this was the block_set, but it looks like it's
something else. I imagine it's here to workaround the 128-counters
per-block limitation that exists because of the size of the
enable_mask field. If that's the case, this should probably be
documented.

> +
> +	/**
> +	 * @block_states: Coarse-grained block transitions, bitmask of enum
> +	 * drm_panthor_perf_block_states.
> +	 */
> +	__u8 block_states;

I'd rather make that state a __u32, so we're not blocked if other
events are added.

> +
> +	/**
> +	 * @clock: Clock used to produce the cycle count for this block, taken =
from
> +	 * enum drm_panthor_perf_clock. The cycle counts are stored in the samp=
le header.
> +	 */
> +	__u8 clock;
> +
> +	/** @pad: MBZ. */
> +	__u8 pad[4];
> +
> +	/** @enable_mask: Bitmask of counters requested during the session setu=
p. */
> +	__u64 enable_mask[2];

I'm a worried that this breaks if new GPUs expose more than 128
counters per-block. I'm also unsure why we need it here. Isn't the
ENABLE mask also part of the per-block HW sample header. If we could
pass that to the UMD directly, we wouldn't have to account for such
changes, because the per-HW layout knowledge exists on the libperf side
too.

> +};
> +
> +/**
> + * enum drm_panthor_perf_sample_flags - Sample-wide events that occurred=
 over the sampling
> + * period.
> + */
> +enum drm_panthor_perf_sample_flags {
> +	/**
> +	 * @DRM_PANTHOR_PERF_SAMPLE_OVERFLOW: This sample contains overflows du=
e to the duration
> +	 * of the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_SAMPLE_OVERFLOW =3D 1 << 0,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_SAMPLE_ERROR: This sample encountered an error con=
dition during
> +	 * the sample duration.
> +	 */
> +	DRM_PANTHOR_PERF_SAMPLE_ERROR =3D 1 << 1,
> +};
> +
> +/**
> + * struct drm_panthor_perf_sample_header - Header present before every s=
ample.
> + */
> +struct drm_panthor_perf_sample_header {
> +	/**
> +	 * @timestamp_start_ns: Earliest timestamp that values in this sample r=
epresent, in
> +	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
> +	 */
> +	__u64 timestamp_start_ns;
> +
> +	/**
> +	 * @timestamp_end_ns: Latest timestamp that values in this sample repre=
sent, in
> +	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
> +	 */
> +	__u64 timestamp_end_ns;
> +
> +	/** @block_set: Set of performance counter blocks. */
> +	__u8 block_set;

Is this the same as drm_panthor_perf_block_header::block_idx? If it is,
we need to choose a name and stick to it, otherwise it's confusing.

> +
> +	/** @pad: MBZ. */
> +	__u8 pad[3];
> +
> +	/** @flags: Current sample flags, combination of drm_panthor_perf_sampl=
e_flags. */
> +	__u32 flags;
> +
> +	/**
> +	 * @user_data: User data provided as part of the command that triggered=
 this sample.
> +	 *
> +	 * - Automatic samples (periodic ones or those around non-counting peri=
ods or power state
> +	 * transitions) will be tagged with the user_data provided as part of t=
he
> +	 * DRM_PANTHOR_PERF_COMMAND_START call.
> +	 * - Manual samples will be tagged with the user_data provided with the
> +	 * DRM_PANTHOR_PERF_COMMAND_SAMPLE call.
> +	 * - A session's final automatic sample will be tagged with the user_da=
ta provided with the
> +	 * DRM_PANTHOR_PERF_COMMAND_STOP call.
> +	 */
> +	__u64 user_data;
> +
> +	/**
> +	 * @toplevel_clock_cycles: The number of cycles elapsed between
> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the top-level cl=
ock if the
> +	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
> +	 */
> +	__u64 toplevel_clock_cycles;
> +
> +	/**
> +	 * @coregroup_clock_cycles: The number of cycles elapsed between
> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the coregroup cl=
ock if the
> +	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
> +	 */
> +	__u64 coregroup_clock_cycles;
> +
> +	/**
> +	 * @shader_clock_cycles: The number of cycles elapsed between
> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the shader core =
clock if the
> +	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
> +	 */
> +	__u64 shader_clock_cycles;
> +};
> +
> +/**
> + * enum drm_panthor_perf_command - Command type passed to the DRM_PANTHO=
R_PERF_CONTROL
> + * IOCTL.
> + */
> +enum drm_panthor_perf_command {
> +	/** @DRM_PANTHOR_PERF_COMMAND_SETUP: Create a new performance counter s=
ampling context. */
> +	DRM_PANTHOR_PERF_COMMAND_SETUP,
> +
> +	/** @DRM_PANTHOR_PERF_COMMAND_TEARDOWN: Teardown a performance counter =
sampling context. */
> +	DRM_PANTHOR_PERF_COMMAND_TEARDOWN,
> +
> +	/** @DRM_PANTHOR_PERF_COMMAND_START: Start a sampling session on the in=
dicated context. */
> +	DRM_PANTHOR_PERF_COMMAND_START,
> +
> +	/** @DRM_PANTHOR_PERF_COMMAND_STOP: Stop the sampling session on the in=
dicated context. */
> +	DRM_PANTHOR_PERF_COMMAND_STOP,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_COMMAND_SAMPLE: Request a manual sample on the ind=
icated context.
> +	 *
> +	 * When the sampling session is configured with a non-zero sampling fre=
quency, any
> +	 * DRM_PANTHOR_PERF_CONTROL calls with this command will be ignored and=
 return an
> +	 * -EINVAL.
> +	 */
> +	DRM_PANTHOR_PERF_COMMAND_SAMPLE,
> +};
> +
> +/**
> + * struct drm_panthor_perf_control - Arguments passed to DRM_PANTHOR_IOC=
TL_PERF_CONTROL.
> + */
> +struct drm_panthor_perf_control {
> +	/** @cmd: Command from enum drm_panthor_perf_command. */
> +	__u32 cmd;
> +
> +	/**
> +	 * @handle: session handle.
> +	 *
> +	 * Returned by the DRM_PANTHOR_PERF_COMMAND_SETUP call.
> +	 * It must be used in subsequent commands for the same context.
> +	 */
> +	__u32 handle;

I'll comment on the patch adding an implementation for that, but I'd
like to understand if there's a need for having more than one perf
session per FD. If not, we can probably drop this handle, attach the
perf-session directly to panthor_file, and have all commands target the
only perf session that exists on this FD-context.

Even if there's a need for multiple perf sessions per FD, I think we
should make this handle/ID per FD to simplify things.

> +
> +	/**
> +	 * @size: size of the command structure.
> +	 *
> +	 * If the pointer is NULL, the size is updated by the driver to provide=
 the size of the
> +	 * output structure. If the pointer is not NULL, the driver will only c=
opy min(size,
> +	 * struct_size) to the pointer and update the size accordingly.
> +	 */
> +	__u64 size;

I'm wondering if we wouldn't be better off adding multiple ioctl()
instead of doing the demux here. That's basically what we do for other
blocks (see VM_{CREATE,DESTROY,BIND}, GROUP_{CREATE,DESTROY,SUBMIT},
...). This would save an extra deref, and some additional complexity.

I think we have enough driver-specific ioctl()s to add a five more
for the perfcnt stuff.

> +
> +	/**
> +	 * @pointer: user pointer to a command type struct, such as
> +	 *            @struct drm_panthor_perf_cmd_start.

Same alignment issue I mentioned above.

> +	 */
> +	__u64 pointer;
> +};
> +
> +/**
> + * enum drm_panthor_perf_counter_set - The counter set to be requested f=
rom the hardware.
> + *
> + * The hardware supports a single performance counter set at a time, so =
requesting any set other
> + * than the primary may fail if another process is sampling at the same =
time.
> + *
> + * If in doubt, the primary counter set has the most commonly used count=
ers and requires no
> + * additional permissions to open.
> + */
> +enum drm_panthor_perf_counter_set {
> +	/**
> +	 * @DRM_PANTHOR_PERF_SET_PRIMARY: The default set configured on the har=
dware.
> +	 *
> +	 * This is the only set for which all counters in all blocks are define=
d.
> +	 */
> +	DRM_PANTHOR_PERF_SET_PRIMARY,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_SET_SECONDARY: The secondary performance counter s=
et.
> +	 *
> +	 * Some blocks may not have any defined counters for this set, and the =
block will
> +	 * have the UNAVAILABLE block state permanently set in the block header.
> +	 *
> +	 * Accessing this set requires the calling process to have the CAP_PERF=
MON capability.
> +	 */
> +	DRM_PANTHOR_PERF_SET_SECONDARY,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_SET_TERTIARY: The tertiary performance counter set.
> +	 *
> +	 * Some blocks may not have any defined counters for this set, and the =
block will have
> +	 * the UNAVAILABLE block state permanently set in the block header. Not=
e that the
> +	 * tertiary set has the fewest defined counter blocks.
> +	 *
> +	 * Accessing this set requires the calling process to have the CAP_PERF=
MON capability.
> +	 */
> +	DRM_PANTHOR_PERF_SET_TERTIARY,
> +};

Same remark I made for block types, I believe this should be opaque,
since libperf knows about those sets already.

> +
> +/**
> + * struct drm_panthor_perf_ringbuf_control - Struct used to map in the r=
ing buffer control indices
> + *                                           into memory shared between =
user and kernel.
> + *
> + */
> +struct drm_panthor_perf_ringbuf_control {
> +	/**
> +	 * @extract_idx: The index of the latest sample that was processed by u=
serspace. Only
> +	 *               modifiable by userspace.

Same formatting inconsistency.

> +	 */
> +	__u64 extract_idx;
> +
> +	/**
> +	 * @insert_idx: The index of the latest sample emitted by the kernel. O=
nly modifiable by
> +	 *               modifiable by the kernel.
> +	 */
> +	__u64 insert_idx;
> +};

I'll stop here for today, but I'll try to finish reviewing this patch
and patch 3 before the end of the week.

Regards,

Boris
