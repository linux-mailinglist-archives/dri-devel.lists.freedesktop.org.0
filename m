Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5C66F161B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 12:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998C810ECD5;
	Fri, 28 Apr 2023 10:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F5E10ECD2;
 Fri, 28 Apr 2023 10:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682679381; x=1714215381;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CwAn1P9w84Kx5lEshWXxjiS4dsjuyj2a5cvOrzPTVJQ=;
 b=cGpVNQlR1FGL1X+gM7yjdWIa6LBqjVGk9Q9BvSARzlhgkW2lDWzbzCBS
 cZ/j/ku+eFbEEyJIX6HGKimSM5GIW/P5Nk3/VdEDyM5jb0rGCWs7qSSlR
 d8QLbA4BNMc23xcqTfzxIaGEKX3YAHUbvknIJExeM11oDSQrGNeIwhY8A
 F/DySx+xfmIS0w1AEVFDr/eZcz5JmDvrTb3FWa4Sri3Ik8eVgbbp9roBP
 MAQuhcCwg1S+IYQlpAkEloGKrde31GdkPFLWgPUWw/zsCTqKhjSKEzfKo
 7a+GM+05ZGhV++Ejgdft2wB+1NIpgrbW6W+0UDH0qflLg84+dIN46M5jE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="350624532"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="350624532"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 03:56:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="688776952"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="688776952"
Received: from ksathish-mobl.ger.corp.intel.com (HELO [10.213.194.196])
 ([10.213.194.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 03:56:15 -0700
Message-ID: <085ddd66-e08d-07b2-cdc6-bff2492ba090@linux.intel.com>
Date: Fri, 28 Apr 2023 11:56:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 5/9] drm: Add fdinfo memory stats
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230427175340.1280952-1-robdclark@gmail.com>
 <20230427175340.1280952-6-robdclark@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230427175340.1280952-6-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/04/2023 18:53, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add support to dump GEM stats to fdinfo.
> 
> v2: Fix typos, change size units to match docs, use div_u64
> v3: Do it in core
> v4: more kerneldoc
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>   Documentation/gpu/drm-usage-stats.rst | 54 +++++++++++----
>   drivers/gpu/drm/drm_file.c            | 99 ++++++++++++++++++++++++++-
>   include/drm/drm_file.h                | 19 +++++
>   include/drm/drm_gem.h                 | 30 ++++++++
>   4 files changed, 189 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index 552195fb1ea3..bfc14150452c 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -52,6 +52,9 @@ String shall contain the name this driver registered as via the respective
>   Optional fully standardised keys
>   --------------------------------
>   
> +Identification
> +^^^^^^^^^^^^^^
> +
>   - drm-pdev: <aaaa:bb.cc.d>
>   
>   For PCI devices this should contain the PCI slot address of the device in
> @@ -69,6 +72,9 @@ scope of each device, in which case `drm-pdev` shall be present as well.
>   Userspace should make sure to not double account any usage statistics by using
>   the above described criteria in order to associate data to individual clients.
>   
> +Utilization
> +^^^^^^^^^^^
> +
>   - drm-engine-<str>: <uint> ns
>   
>   GPUs usually contain multiple execution engines. Each shall be given a stable
> @@ -93,18 +99,6 @@ exported engine corresponds to a group of identical hardware engines.
>   In the absence of this tag parser shall assume capacity of one. Zero capacity
>   is not allowed.
>   
> -- drm-memory-<str>: <uint> [KiB|MiB]
> -
> -Each possible memory type which can be used to store buffer objects by the
> -GPU in question shall be given a stable and unique name to be returned as the
> -string here.
> -
> -Value shall reflect the amount of storage currently consumed by the buffer
> -object belong to this client, in the respective memory region.
> -
> -Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
> -indicating kibi- or mebi-bytes.
> -
>   - drm-cycles-<str>: <uint>
>   
>   Engine identifier string must be the same as the one specified in the
> @@ -126,6 +120,42 @@ percentage utilization of the engine, whereas drm-engine-<str> only reflects
>   time active without considering what frequency the engine is operating as a
>   percentage of it's maximum frequency.
>   
> +Memory
> +^^^^^^
> +
> +- drm-memory-<region>: <uint> [KiB|MiB]
> +
> +Each possible memory type which can be used to store buffer objects by the
> +GPU in question shall be given a stable and unique name to be returned as the
> +string here.  The name "memory" is reserved to refer to normal system memory.

How is the name memory reserved, I mean when which part of the key? 
Obviously amdgpu exposes drm-memory-vram so it can't mean system memory 
there.

[Comes back later]

Ah I see.. you meant the _region_ name "memory" is reserved. Which 
applies to the below keys, not the one above. Hmm.. So for multi-region 
drivers you meant like:

drm-total-memory:
drm-total-vram:

Etc. Okay I think that works. All prefixes "drm-$category" become 
reserved ones effectively but I think that is okay.

> +
> +Value shall reflect the amount of storage currently consumed by the buffer
> +object belong to this client, in the respective memory region.

OMG it is all my fault for mentioning buffer objects here... :)

Maybe just fix the plural while moving.

Or maybe there is time to s/buffer objects/memory/ too? Why not I think. 
It would leave things more future proof.

> +
> +Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
> +indicating kibi- or mebi-bytes.
> +
> +- drm-shared-<region>: <uint> [KiB|MiB]
> +
> +The total size of buffers that are shared with another file (ie. have more
> +than a single handle).
> +
> +- drm-private-<region>: <uint> [KiB|MiB]
> +
> +The total size of buffers that are not shared with another file.

You went back to private + shared for a specific reason? I thought we 
agreed total + shared can be less confusing.

> +
> +- drm-resident-<region>: <uint> [KiB|MiB]
> +
> +The total size of buffers that are resident in system memory.

"..resident in the specified memory region."?

> +
> +- drm-purgeable-<region>: <uint> [KiB|MiB]
> +
> +The total size of buffers that are purgeable.
> +
> +- drm-active-<region>: <uint> [KiB|MiB]
> +
> +The total size of buffers that are active on one or more rings.

Under utilisation we used 'engines' so introducing 'rings' at least 
needs clarification, maybe a terminology chapter? Or just use engines 
for consistency?

> +
>   Implementation Details
>   ======================
>   
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 6d5bdd684ae2..9321eb0bf020 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -42,6 +42,7 @@
>   #include <drm/drm_client.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
>   #include <drm/drm_print.h>
>   
>   #include "drm_crtc_internal.h"
> @@ -871,9 +872,105 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
>   }
>   EXPORT_SYMBOL(drm_send_event);
>   
> +static void print_size(struct drm_printer *p, const char *stat,
> +		       const char *region, size_t sz)
> +{
> +	const char *units[] = {"", " KiB", " MiB"};
> +	unsigned u;
> +
> +	for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
> +		if (sz < SZ_1K)
> +			break;
> +		sz = div_u64(sz, SZ_1K);
> +	}
> +
> +	drm_printf(p, "drm-%s-%s:\t%zu%s\n", stat, region, sz, units[u]);
> +}
> +
> +/**
> + * drm_print_memory_stats - A helper to print memory stats
> + * @p: The printer to print output to
> + * @stats: The collected memory stats
> + * @supported_status: Bitmask of optional stats which are available
> + * @region: The memory region
> + *
> + */
> +void drm_print_memory_stats(struct drm_printer *p,
> +			    const struct drm_memory_stats *stats,
> +			    enum drm_gem_object_status supported_status,
> +			    const char *region)
> +{
> +	print_size(p, "total", region, stats->private + stats->shared);
> +	print_size(p, "shared", region, stats->shared);

Ah just rst is out of date.

> +	print_size(p, "active", region, stats->active);
> +
> +	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
> +		print_size(p, "resident", region, stats->resident);
> +
> +	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
> +		print_size(p, "purgeable", region, stats->purgeable);
> +}
> +EXPORT_SYMBOL(drm_print_memory_stats);
> +
> +/**
> + * drm_show_memory_stats - Helper to collect and show standard fdinfo memory stats
> + * @p: the printer to print output to
> + * @file: the DRM file
> + *
> + * Helper to iterate over GEM objects with a handle allocated in the specified
> + * file.
> + */
> +void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
> +{
> +	struct drm_gem_object *obj;
> +	struct drm_memory_stats status = {};
> +	enum drm_gem_object_status supported_status;
> +	int id;
> +
> +	spin_lock(&file->table_lock);
> +	idr_for_each_entry (&file->object_idr, obj, id) {
> +		enum drm_gem_object_status s = 0;
> +
> +		if (obj->funcs && obj->funcs->status) {
> +			s = obj->funcs->status(obj);
> +			supported_status = DRM_GEM_OBJECT_RESIDENT |
> +					DRM_GEM_OBJECT_PURGEABLE;

Whats the purpose of supported_status? It is never modified. Did you 
intend for the vfunc to be returning this?

> +		}
> +
> +		if (obj->handle_count > 1) {
> +			status.shared += obj->size;
> +		} else {
> +			status.private += obj->size;
> +		}
> +
> +		if (s & DRM_GEM_OBJECT_RESIDENT) {
> +			status.resident += obj->size;
> +		} else {
> +			/* If already purged or not yet backed by pages, don't
> +			 * count it as purgeable:
> +			 */
> +			s &= ~DRM_GEM_OBJECT_PURGEABLE;
> +		}

Again, why couldn't a resident object also be purgeable?

> +
> +		if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
> +			status.active += obj->size;
> +
> +			/* If still active, don't count as purgeable: */
> +			s &= ~DRM_GEM_OBJECT_PURGEABLE;

Also add it to resident if driver hasn't advertised 
DRM_GEM_OBJECT_RESIDENT? Not much value so not sure.

> +		}
> +
> +		if (s & DRM_GEM_OBJECT_PURGEABLE)
> +			status.purgeable += obj->size;
> +	}
> +	spin_unlock(&file->table_lock);
> +
> +	drm_print_memory_stats(p, &status, supported_status, "memory");
> +}
> +EXPORT_SYMBOL(drm_show_memory_stats);
> +
>   /**
>    * drm_show_fdinfo - helper for drm file fops
> - * @seq_file: output stream
> + * @m: output stream
>    * @f: the device file instance
>    *
>    * Helper to implement fdinfo, for userspace to query usage stats, etc, of a
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 6de6d0e9c634..1339e925af52 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -41,6 +41,7 @@
>   struct dma_fence;
>   struct drm_file;
>   struct drm_device;
> +struct drm_printer;
>   struct device;
>   struct file;
>   
> @@ -440,6 +441,24 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e);
>   void drm_send_event_timestamp_locked(struct drm_device *dev,
>   				     struct drm_pending_event *e,
>   				     ktime_t timestamp);
> +
> +
> +struct drm_memory_stats {
> +	size_t shared;
> +	size_t private;
> +	size_t resident;
> +	size_t purgeable;
> +	size_t active;
> +};

Is size_t enough? I'd be tempted to just make it u64.

> +
> +enum drm_gem_object_status;
> +
> +void drm_print_memory_stats(struct drm_printer *p,
> +			    const struct drm_memory_stats *stats,
> +			    enum drm_gem_object_status supported_status,
> +			    const char *region);
> +
> +void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
>   void drm_show_fdinfo(struct seq_file *m, struct file *f);
>   
>   struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 189fd618ca65..9ebd2820ad1f 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -42,6 +42,25 @@
>   struct iosys_map;
>   struct drm_gem_object;
>   
> +/**
> + * enum drm_gem_object_status - bitmask of object state for fdinfo reporting
> + * @DRM_GEM_OBJECT_RESIDENT: object is resident in memory (ie. not unpinned)
> + * @DRM_GEM_OBJECT_PURGEABLE: object marked as purgeable by userspace
> + *
> + * Bitmask of status used for fdinfo memory stats, see &drm_gem_object_funcs.status
> + * and drm_show_fdinfo().  Note that an object can DRM_GEM_OBJECT_PURGEABLE if

can be

> + * it still active or not resident, in which case drm_show_fdinfo() will not
it is

> + * account for it as purgeable.  So drivers do not need to check if the buffer
> + * is idle and resident to return this bit.  (Ie. userspace can mark a buffer
> + * as purgeable even while it is still busy on the GPU.. it does not _actually_
> + * become puregeable until it becomes idle.  The status gem object func does
> + * not need to consider this.)
> + */
> +enum drm_gem_object_status {
> +	DRM_GEM_OBJECT_RESIDENT  = BIT(0),
> +	DRM_GEM_OBJECT_PURGEABLE = BIT(1),
> +};

Why enum for a bitmask?

> +
>   /**
>    * struct drm_gem_object_funcs - GEM object functions
>    */
> @@ -174,6 +193,17 @@ struct drm_gem_object_funcs {
>   	 */
>   	int (*evict)(struct drm_gem_object *obj);
>   
> +	/**
> +	 * @status:
> +	 *
> +	 * The optional status callback can return additional object state
> +	 * which determines which stats the object is counted against.  The
> +	 * callback is called under table_lock.  Racing against object status
> +	 * change is "harmless", and the callback can expect to not race
> +	 * against object destruction.
> +	 */
> +	enum drm_gem_object_status (*status)(struct drm_gem_object *obj);

Why not have this under driver vfuncs? Can you see an usecase where it 
needs to be per object?

Modulo the details ie. on the high level I think this works. More 
advanced drivers can re-use the exported drm_print_memory_stats and 
amount of sharing-vs-duplication seems similar to my proposal so again, 
I think it is an okay approach.

Regards,

Tvrtko

> +
>   	/**
>   	 * @vm_ops:
>   	 *
