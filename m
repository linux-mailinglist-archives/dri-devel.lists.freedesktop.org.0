Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDB4817ACE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981FB10E3C4;
	Mon, 18 Dec 2023 19:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 64C8810E3CB
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:15:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCB9C1FB;
 Mon, 18 Dec 2023 05:20:54 -0800 (PST)
Received: from [10.57.4.158] (unknown [10.57.4.158])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3B5F3F64C;
 Mon, 18 Dec 2023 05:20:08 -0800 (PST)
Message-ID: <c2097a0e-aa8a-4cdf-bca5-2fd2b0c5402e@foss.arm.com>
Date: Mon, 18 Dec 2023 13:20:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] drm/panthor: Add uAPI
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-2-boris.brezillon@collabora.com>
From: Chris Diamand <chris.diamand@foss.arm.com>
In-Reply-To: <20231204173313.2098733-2-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, kernel@collabora.com,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> new file mode 100644
> index 000000000000..6d815df5e829
> --- /dev/null
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -0,0 +1,892 @@
> +/* SPDX-License-Identifier: MIT */
> +/* Copyright (C) 2023 Collabora ltd. */
> +#ifndef _PANTHOR_DRM_H_
> +#define _PANTHOR_DRM_H_
> +
> +#include "drm.h"
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +/**
> + * DOC: Introduction

...

> +/**
> + * struct drm_panthor_group_submit - Arguments passed to DRM_IOCTL_PANTHOR_VM_BIND
> + */
> +struct drm_panthor_group_submit {
> +	/** @group_handle: Handle of the group to queue jobs to. */
> +	__u32 group_handle;
> +
> +	/** @pad: MBZ. */
> +	__u32 pad;
> +
> +	/** @queue_submits: Array of drm_panthor_queue_submit objects. */
> +	struct drm_panthor_obj_array queue_submits;
> +};


Hi! Very minor nit - but shouldn't the comment above say DRM_IOCTL_PANTHOR_GROUP_SUBMIT, not VM_BIND?

> +
> +/**
> + * enum drm_panthor_group_state_flags - Group state flags
> + */
> +enum drm_panthor_group_state_flags {
> +	/**
> +	 * @DRM_PANTHOR_GROUP_STATE_TIMEDOUT: Group had unfinished jobs.
> +	 *
> +	 * When a group ends up with this flag set, no jobs can be submitted to its queues.
> +	 */
> +	DRM_PANTHOR_GROUP_STATE_TIMEDOUT = 1 << 0,
> +
> +	/**
> +	 * @DRM_PANTHOR_GROUP_STATE_FATAL_FAULT: Group had fatal faults.
> +	 *
> +	 * When a group ends up with this flag set, no jobs can be submitted to its queues.
> +	 */
> +	DRM_PANTHOR_GROUP_STATE_FATAL_FAULT = 1 << 1,
> +};
> +
> +/**
> + * struct drm_panthor_group_get_state - Arguments passed to DRM_IOCTL_PANTHOR_GROUP_GET_STATE
> + *
> + * Used to query the state of a group and decide whether a new group should be created to
> + * replace it.
> + */
> +struct drm_panthor_group_get_state {
> +	/** @group_handle: Handle of the group to query state on */
> +	__u32 group_handle;
> +
> +	/**
> +	 * @state: Combination of DRM_PANTHOR_GROUP_STATE_* flags encoding the
> +	 * group state.
> +	 */
> +	__u32 state;
> +
> +	/** @fatal_queues: Bitmask of queues that faced fatal faults. */
> +	__u32 fatal_queues;
> +
> +	/** @pad: MBZ */
> +	__u32 pad;
> +};
> +
> +/**
> + * struct drm_panthor_tiler_heap_create - Arguments passed to DRM_IOCTL_PANTHOR_TILER_HEAP_CREATE
> + */
> +struct drm_panthor_tiler_heap_create {
> +	/** @vm_id: VM ID the tiler heap should be mapped to */
> +	__u32 vm_id;
> +
> +	/** @initial_chunk_count: Initial number of chunks to allocate. */
> +	__u32 initial_chunk_count;
> +
> +	/** @chunk_size: Chunk size. Must be a power of two at least 256KB large. */
> +	__u32 chunk_size;
> +
> +	/** @max_chunks: Maximum number of chunks that can be allocated. */
> +	__u32 max_chunks;
> +
> +	/**
> +	 * @target_in_flight: Maximum number of in-flight render passes.
> +	 *
> +	 * If the heap has more than tiler jobs in-flight, the FW will wait for render
> +	 * passes to finish before queuing new tiler jobs.
> +	 */
> +	__u32 target_in_flight;
> +
> +	/** @handle: Returned heap handle. Passed back to DESTROY_TILER_HEAP. */
> +	__u32 handle;
> +
> +	/** @tiler_heap_ctx_gpu_va: Returned heap GPU virtual address returned */
> +	__u64 tiler_heap_ctx_gpu_va;
> +
> +	/**
> +	 * @first_heap_chunk_gpu_va: First heap chunk.
> +	 *
> +	 * The tiler heap is formed of heap chunks forming a single-link list. This
> +	 * is the first element in the list.
> +	 */
> +	__u64 first_heap_chunk_gpu_va;
> +};
> +
> +/**
> + * struct drm_panthor_tiler_heap_destroy - Arguments passed to DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY
> + */
> +struct drm_panthor_tiler_heap_destroy {
> +	/** @handle: Handle of the tiler heap to destroy */
> +	__u32 handle;
> +
> +	/** @pad: Padding field, MBZ. */
> +	__u32 pad;
> +};
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif /* _PANTHOR_DRM_H_ */

Cheers,
Chris
