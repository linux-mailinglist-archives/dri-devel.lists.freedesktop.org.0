Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1AECC4AD0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 18:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A5510E239;
	Tue, 16 Dec 2025 17:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fyjKk+/5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BB810E239
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 17:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765906233;
 bh=udTPC5CoeOOBk1gTCEEsb4+kcotIsM37imsXNSS2BX0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fyjKk+/58RsgDDdLsp5AFYU9eHZa11fzgf7YhVQejc2igXhTRXKqQ/z6yRAC21Xr0
 CRtZbjSMZf0YmLa6EK72DyRmyGrn0zmqcg/oHbDAnukhwbRcB7fxh6rqnB11gzY9R1
 GF5ekMqi9YgBXYANzibY8cBJ9gZbANdWniLRnyY458L91KjJTHzdR/VrxPjp98NMIi
 lXpxPEfs0+EXjxf4iSM5LoQAVHN1L+pIVKdKWcex83nIFRwaogf0lHNO4pw2EPKrZp
 bamq3oAHDDhWfw5hBpT7XQb83O3q4aTvjVF/uSCtXgM1tzlIuwdsPvjZ+LDhr4l/4q
 OK7EDdgtJwxNQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 65FB417E10F8;
 Tue, 16 Dec 2025 18:30:33 +0100 (CET)
Date: Tue, 16 Dec 2025 18:30:29 +0100
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
Message-ID: <20251216183029.50cab821@fedora>
In-Reply-To: <20251215171453.2506348-2-lukas.zapolskas@arm.com>
References: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
 <20251215171453.2506348-2-lukas.zapolskas@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 15 Dec 2025 17:14:47 +0000
Lukas Zapolskas <lukas.zapolskas@arm.com> wrote:

> +/**
> + * enum drm_panthor_perf_block_state - Bitmask of the power and execution states that an individual
> + * hardware block went through in a sampling period.
> + *
> + * Because the sampling period is controlled from userspace, the block may undergo multiple
> + * state transitions, so this must be interpreted as one or more such transitions occurring.
> + */
> +enum drm_panthor_perf_block_state {
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN: The state of this block was unknown during
> +	 * the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN = 0,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_ON: This block was powered on for some or all of
> +	 * the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_ON = 1 << 0,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_OFF: This block was powered off for some or all of the
> +	 * sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_OFF = 1 << 1,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE: This block was available for execution for
> +	 * some or all of the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE = 1 << 2,

Missing blank line.

> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE: This block was unavailable for execution for
> +	 * some or all of the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE = 1 << 3,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL: This block was executing in normal mode
> +	 * for some or all of the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL = 1 << 4,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED: This block was executing in protected mode
> +	 * for some or all of the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED = 1 << 5,
> +};
> +
> +/**
> + * struct drm_panthor_perf_block_header - Header present before every block in the
> + * sample ringbuffer.
> + */
> +struct drm_panthor_perf_block_header {
> +	/** @block_type: Type of the block. */
> +	__u8 block_type;
> +
> +	/** @block_idx: Block index. */
> +	__u8 block_idx;
> +
> +	/**
> +	 * @block_states: Coarse-grained block transitions, bitmask of enum
> +	 * drm_panthor_perf_block_states.
> +	 */
> +	__u8 block_states;
> +
> +	/**
> +	 * @clock: Clock used to produce the cycle count for this block, taken from
> +	 * enum drm_panthor_perf_clock. The cycle counts are stored in the sample header.
> +	 */
> +	__u8 clock;
> +
> +	/** @pad: MBZ. */
> +	__u8 pad[4];

Why not make it a __u32?

> +
> +	/** @enable_mask: Bitmask of counters requested during the session setup. */
> +	__u64 enable_mask[2];
> +};
> +
> +/**
> + * enum drm_panthor_perf_sample_flags - Sample-wide events that occurred over the sampling
> + * period.
> + */
> +enum drm_panthor_perf_sample_flags {
> +	/**
> +	 * @DRM_PANTHOR_PERF_SAMPLE_OVERFLOW: This sample contains overflows due to the duration
> +	 * of the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_SAMPLE_OVERFLOW = 1 << 0,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_SAMPLE_ERROR: This sample encountered an error condition during
> +	 * the sample duration.
> +	 */
> +	DRM_PANTHOR_PERF_SAMPLE_ERROR = 1 << 1,
> +};
> +
> +/**
> + * struct drm_panthor_perf_sample_header - Header present before every sample.
> + */
> +struct drm_panthor_perf_sample_header {
> +	/**
> +	 * @timestamp_start_ns: Earliest timestamp that values in this sample represent, in
> +	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
> +	 */
> +	__u64 timestamp_start_ns;
> +
> +	/**
> +	 * @timestamp_end_ns: Latest timestamp that values in this sample represent, in
> +	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
> +	 */
> +	__u64 timestamp_end_ns;
> +
> +	/** @block_set: Set of performance counter blocks. */
> +	__u8 block_set;
> +
> +	/** @pad: MBZ. */
> +	__u8 pad[3];
> +
> +	/** @flags: Current sample flags, combination of drm_panthor_perf_sample_flags. */
> +	__u32 flags;
> +
> +	/**
> +	 * @user_data: User data provided as part of the command that triggered this sample.
> +	 *
> +	 * - Automatic samples (periodic ones or those around non-counting periods or power state
> +	 * transitions) will be tagged with the user_data provided as part of the
> +	 * DRM_PANTHOR_PERF_COMMAND_START call.
> +	 * - Manual samples will be tagged with the user_data provided with the
> +	 * DRM_PANTHOR_PERF_COMMAND_SAMPLE call.
> +	 * - A session's final automatic sample will be tagged with the user_data provided with the
> +	 * DRM_PANTHOR_PERF_COMMAND_STOP call.
> +	 */
> +	__u64 user_data;
> +
> +	/**
> +	 * @toplevel_clock_cycles: The number of cycles elapsed between
> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the top-level clock if the
> +	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
> +	 */
> +	__u64 toplevel_clock_cycles;
> +
> +	/**
> +	 * @coregroup_clock_cycles: The number of cycles elapsed between
> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the coregroup clock if the
> +	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
> +	 */
> +	__u64 coregroup_clock_cycles;
> +
> +	/**
> +	 * @shader_clock_cycles: The number of cycles elapsed between
> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the shader core clock if the
> +	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
> +	 */
> +	__u64 shader_clock_cycles;
> +};
> +
> +/**
> + * enum drm_panthor_perf_command - Command type passed to the DRM_PANTHOR_PERF_CONTROL
> + * IOCTL.
> + */
> +enum drm_panthor_perf_command {
> +	/** @DRM_PANTHOR_PERF_COMMAND_SETUP: Create a new performance counter sampling context. */
> +	DRM_PANTHOR_PERF_COMMAND_SETUP,
> +
> +	/** @DRM_PANTHOR_PERF_COMMAND_TEARDOWN: Teardown a performance counter sampling context. */
> +	DRM_PANTHOR_PERF_COMMAND_TEARDOWN,
> +
> +	/** @DRM_PANTHOR_PERF_COMMAND_START: Start a sampling session on the indicated context. */
> +	DRM_PANTHOR_PERF_COMMAND_START,
> +
> +	/** @DRM_PANTHOR_PERF_COMMAND_STOP: Stop the sampling session on the indicated context. */
> +	DRM_PANTHOR_PERF_COMMAND_STOP,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_COMMAND_SAMPLE: Request a manual sample on the indicated context.
> +	 *
> +	 * When the sampling session is configured with a non-zero sampling frequency, any
> +	 * DRM_PANTHOR_PERF_CONTROL calls with this command will be ignored and return an
> +	 * -EINVAL.
> +	 */
> +	DRM_PANTHOR_PERF_COMMAND_SAMPLE,
> +};
> +
> +/**
> + * struct drm_panthor_perf_control - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL.
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
> +
> +	/**
> +	 * @size: size of the command structure.
> +	 *
> +	 * If the pointer is NULL, the size is updated by the driver to provide the size of the
> +	 * output structure. If the pointer is not NULL, the driver will only copy min(size,
> +	 * struct_size) to the pointer and update the size accordingly.
> +	 */
> +	__u64 size;
> +
> +	/**
> +	 * @pointer: user pointer to a command type struct, such as
> +	 *            @struct drm_panthor_perf_cmd_start.
> +	 */
> +	__u64 pointer;
> +};
> +
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
> +
> +/**
> + * struct drm_panthor_perf_ringbuf_control - Struct used to map in the ring buffer control indices
> + *                                           into memory shared between user and kernel.
> + *
> + */
> +struct drm_panthor_perf_ringbuf_control {
> +	/**
> +	 * @extract_idx: The index of the latest sample that was processed by userspace. Only
> +	 *               modifiable by userspace.
> +	 */
> +	__u64 extract_idx;
> +
> +	/**
> +	 * @insert_idx: The index of the latest sample emitted by the kernel. Only modifiable by
> +	 *               modifiable by the kernel.
> +	 */
> +	__u64 insert_idx;
> +};
> +
> +/**
> + * struct drm_panthor_perf_cmd_setup - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
> + * when the DRM_PANTHOR_PERF_COMMAND_SETUP command is specified.
> + */
> +struct drm_panthor_perf_cmd_setup {
> +	/**
> +	 * @block_set: Set of performance counter blocks, member of
> +	 *             enum drm_panthor_perf_block_set.
> +	 *
> +	 * This is a global configuration and only one set can be active at a time. If
> +	 * another client has already requested a counter set, any further requests
> +	 * for a different counter set will fail and return an -EBUSY.
> +	 *
> +	 * If the requested set does not exist, the request will fail and return an -EINVAL.
> +	 *
> +	 * Some sets have additional requirements to be enabled, and the setup request will
> +	 * fail with an -EACCES if these requirements are not satisfied.
> +	 */
> +	__u8 block_set;
> +
> +	/** @pad: MBZ. */
> +	__u8 pad[7];
> +
> +	/** @fd: eventfd for signalling the availability of a new sample. */
> +	__u32 fd;
> +
> +	/** @ringbuf_handle: Handle to the BO to write perf counter sample to. */
> +	__u32 ringbuf_handle;
> +
> +	/**
> +	 * @control_handle: Handle to the BO containing a contiguous 16 byte range, used for the
> +	 * insert and extract indices for the ringbuffer.
> +	 */
> +	__u32 control_handle;
> +
> +	/**
> +	 * @sample_slots: The number of slots available in the userspace-provided BO. Must be
> +	 * a power of 2.
> +	 *
> +	 * If sample_slots * sample_size does not match the BO size, the setup request will fail.
> +	 */
> +	__u32 sample_slots;
> +
> +	/**
> +	 * @control_offset: Offset into the control BO where the insert and extract indices are
> +	 * located.
> +	 */
> +	__u64 control_offset;
> +
> +	/**
> +	 * @sample_freq_ns: Period between automatic counter sample collection in nanoseconds. Zero
> +	 * disables automatic collection and all collection must be done through explicit calls
> +	 * to DRM_PANTHOR_PERF_CONTROL.SAMPLE. Non-zero values will disable manual counter sampling
> +	 * via the DRM_PANTHOR_PERF_COMMAND_SAMPLE command.
> +	 *
> +	 * This disables software-triggered periodic sampling, but hardware will still trigger
> +	 * automatic samples on certain events, including shader core power transitions, and
> +	 * entries to and exits from non-counting periods. The final stop command will also
> +	 * trigger a sample to ensure no data is lost.
> +	 */
> +	__u64 sample_freq_ns;
> +
> +	/**
> +	 * @fw_enable_mask: Bitmask of counters to request from the FW counter block. Any bits
> +	 * past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit 0
> +	 * corresponds to counter 0.
> +	 */
> +	__u64 fw_enable_mask[2];
> +
> +	/**
> +	 * @cshw_enable_mask: Bitmask of counters to request from the CSHW counter block. Any bits
> +	 * past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit 0
> +	 * corresponds to counter 0.
> +	 */
> +	__u64 cshw_enable_mask[2];
> +
> +	/**
> +	 * @tiler_enable_mask: Bitmask of counters to request from the tiler counter block. Any
> +	 * bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit
> +	 * 0 corresponds to counter 0.
> +	 */
> +	__u64 tiler_enable_mask[2];
> +
> +	/**
> +	 * @memsys_enable_mask: Bitmask of counters to request from the memsys counter blocks. Any
> +	 * bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit 0
> +	 * corresponds to counter 0.
> +	 */
> +	__u64 memsys_enable_mask[2];
> +
> +	/**
> +	 * @shader_enable_mask: Bitmask of counters to request from the shader core counter blocks.
> +	 * Any bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
> +	 * Bit 0 corresponds to counter 0.
> +	 */
> +	__u64 shader_enable_mask[2];
> +};
> +
> +/**
> + * struct drm_panthor_perf_cmd_start - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
> + * when the DRM_PANTHOR_PERF_COMMAND_START command is specified.
> + */
> +struct drm_panthor_perf_cmd_start {
> +	/**
> +	 * @user_data: User provided data that will be attached to automatic samples collected
> +	 * until the next DRM_PANTHOR_PERF_COMMAND_STOP.
> +	 */
> +	__u64 user_data;
> +};
> +
> +/**
> + * struct drm_panthor_perf_cmd_stop - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
> + * when the DRM_PANTHOR_PERF_COMMAND_STOP command is specified.
> + */
> +struct drm_panthor_perf_cmd_stop {
> +	/**
> +	 * @user_data: User provided data that will be attached to the automatic sample collected
> +	 * at the end of this sampling session.
> +	 */
> +	__u64 user_data;
> +};
> +
> +/**
> + * struct drm_panthor_perf_cmd_sample - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
> + * when the DRM_PANTHOR_PERF_COMMAND_SAMPLE command is specified.
> + */
> +struct drm_panthor_perf_cmd_sample {
> +	/** @user_data: User provided data that will be attached to the sample.*/
> +	__u64 user_data;
> +};
> +
>  /**
>   * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
>   * @__access: Access type. Must be R, W or RW.
> @@ -1237,6 +1800,8 @@ enum {
>  		DRM_IOCTL_PANTHOR(WR, BO_SYNC, bo_sync),
>  	DRM_IOCTL_PANTHOR_BO_QUERY_INFO =
>  		DRM_IOCTL_PANTHOR(WR, BO_QUERY_INFO, bo_query_info),
> +	DRM_IOCTL_PANTHOR_PERF_CONTROL =
> +		DRM_IOCTL_PANTHOR(WR, PERF_CONTROL, perf_control)
>  };
>  
>  #if defined(__cplusplus)

