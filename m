Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E750E6A1911
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 10:51:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDC210E72D;
	Fri, 24 Feb 2023 09:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4FB10E71E;
 Fri, 24 Feb 2023 09:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677232287; x=1708768287;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EP2zkHEU5lVKlcHibEJppBFX8lSOI2Wu7SavPrJfdOk=;
 b=IdWFj9d9+IK8IzHFzELAIqIOb6/vy6UzL7wdhD4JjGftXwI9g03xWMls
 4rpu+LCbY/TJ3R2t+N9WC6NWv3jtfS5kM43n09R35yNzXcC6vsYkjDD4x
 6apgnXALPIpEG8/djVzGU+hP3+MvosfSP4+opZSQFnzPgVBsd5K0sGmed
 Gncu+K5Ta/jwlTjduA0uCzgq9vyS9MsXP0mdNo3N0OO+fS8RsCOE9vXOE
 kBL/Fn5Ao83TWNtYdoUn8OdKP5s4W8KqBu3joDMG1S34Ufb6sQHELu3KY
 I6krlEHyQCw1GcDhvZnzPkdnsgYyPFZeDprY+UAXwWbNWtuzg9nm9XC54 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="419672892"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; d="scan'208";a="419672892"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 01:51:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="672840782"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; d="scan'208";a="672840782"
Received: from wmao-mobl.amr.corp.intel.com (HELO [10.212.63.133])
 ([10.212.63.133])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 01:51:23 -0800
Message-ID: <22754996-382d-de03-f620-94a8f79b275a@linux.intel.com>
Date: Fri, 24 Feb 2023 09:51:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 09/14] drm/syncobj: Add deadline support for syncobj
 waits
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-10-robdclark@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230218211608.1630586-10-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/02/2023 21:15, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add a new flag to let userspace provide a deadline as a hint for syncobj
> and timeline waits.  This gives a hint to the driver signaling the
> backing fences about how soon userspace needs it to compete work, so it
> can addjust GPU frequency accordingly.  An immediate deadline can be
> given to provide something equivalent to i915 "wait boost".

I'm waiting for some test result before I can comment on this one 
properly. It may end up we just want to mark these as immediate deadline 
to help existing userspace. In which case maybe we would need a per 
driver option of deciding what to do. So instead of:

   dma_fence_set_deadline(fence, *deadline);

We'd need something like:

   dma_fence_mark_wait(fence);

Which would call into individual drivers to decide what to do with that. 
Some drivers maybe don't want to do anything, and i915 may end up 
applying waitboost. Or maybe not "instead of" but "along with". Aka 
similar in spirit to my RFC.

Regards,

Tvrtko

> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> 
> I'm a bit on the fence about the addition of the DRM_CAP, but it seems
> useful to give userspace a way to probe whether the kernel and driver
> supports the new wait flag, especially since we have vk-common code
> dealing with syncobjs.  But open to suggestions.
> 
>   drivers/gpu/drm/drm_ioctl.c   |  3 ++
>   drivers/gpu/drm/drm_syncobj.c | 59 ++++++++++++++++++++++++++++-------
>   include/drm/drm_drv.h         |  6 ++++
>   include/uapi/drm/drm.h        | 16 ++++++++--
>   4 files changed, 71 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 7c9d66ee917d..1c5c942cf0f9 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -254,6 +254,9 @@ static int drm_getcap(struct drm_device *dev, void *data, struct drm_file *file_
>   	case DRM_CAP_SYNCOBJ_TIMELINE:
>   		req->value = drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE);
>   		return 0;
> +	case DRM_CAP_SYNCOBJ_DEADLINE:
> +		req->value = drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE);
> +		return 0;
>   	}
>   
>   	/* Other caps only work with KMS drivers */
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 0c2be8360525..61cf97972a60 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -973,7 +973,8 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>   						  uint32_t count,
>   						  uint32_t flags,
>   						  signed long timeout,
> -						  uint32_t *idx)
> +						  uint32_t *idx,
> +						  ktime_t *deadline)
>   {
>   	struct syncobj_wait_entry *entries;
>   	struct dma_fence *fence;
> @@ -1053,6 +1054,15 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>   			drm_syncobj_fence_add_wait(syncobjs[i], &entries[i]);
>   	}
>   
> +	if (deadline) {
> +		for (i = 0; i < count; ++i) {
> +			fence = entries[i].fence;
> +			if (!fence)
> +				continue;
> +			dma_fence_set_deadline(fence, *deadline);
> +		}
> +	}
> +
>   	do {
>   		set_current_state(TASK_INTERRUPTIBLE);
>   
> @@ -1151,7 +1161,8 @@ static int drm_syncobj_array_wait(struct drm_device *dev,
>   				  struct drm_file *file_private,
>   				  struct drm_syncobj_wait *wait,
>   				  struct drm_syncobj_timeline_wait *timeline_wait,
> -				  struct drm_syncobj **syncobjs, bool timeline)
> +				  struct drm_syncobj **syncobjs, bool timeline,
> +				  ktime_t *deadline)
>   {
>   	signed long timeout = 0;
>   	uint32_t first = ~0;
> @@ -1162,7 +1173,8 @@ static int drm_syncobj_array_wait(struct drm_device *dev,
>   							 NULL,
>   							 wait->count_handles,
>   							 wait->flags,
> -							 timeout, &first);
> +							 timeout, &first,
> +							 deadline);
>   		if (timeout < 0)
>   			return timeout;
>   		wait->first_signaled = first;
> @@ -1172,7 +1184,8 @@ static int drm_syncobj_array_wait(struct drm_device *dev,
>   							 u64_to_user_ptr(timeline_wait->points),
>   							 timeline_wait->count_handles,
>   							 timeline_wait->flags,
> -							 timeout, &first);
> +							 timeout, &first,
> +							 deadline);
>   		if (timeout < 0)
>   			return timeout;
>   		timeline_wait->first_signaled = first;
> @@ -1243,13 +1256,20 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>   {
>   	struct drm_syncobj_wait *args = data;
>   	struct drm_syncobj **syncobjs;
> +	unsigned possible_flags;
> +	ktime_t t, *tp = NULL;
>   	int ret = 0;
>   
>   	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
>   		return -EOPNOTSUPP;
>   
> -	if (args->flags & ~(DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
> -			    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT))
> +	possible_flags = DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
> +			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT;
> +
> +	if (drm_core_check_feature(dev, DRIVER_SYNCOBJ_DEADLINE))
> +		possible_flags |= DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE;
> +
> +	if (args->flags & ~possible_flags)
>   		return -EINVAL;
>   
>   	if (args->count_handles == 0)
> @@ -1262,8 +1282,13 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>   	if (ret < 0)
>   		return ret;
>   
> +	if (args->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE) {
> +		t = ktime_set(args->deadline_sec, args->deadline_nsec);
> +		tp = &t;
> +	}
> +
>   	ret = drm_syncobj_array_wait(dev, file_private,
> -				     args, NULL, syncobjs, false);
> +				     args, NULL, syncobjs, false, tp);
>   
>   	drm_syncobj_array_free(syncobjs, args->count_handles);
>   
> @@ -1276,14 +1301,21 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>   {
>   	struct drm_syncobj_timeline_wait *args = data;
>   	struct drm_syncobj **syncobjs;
> +	unsigned possible_flags;
> +	ktime_t t, *tp = NULL;
>   	int ret = 0;
>   
>   	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
>   		return -EOPNOTSUPP;
>   
> -	if (args->flags & ~(DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
> -			    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
> -			    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE))
> +	possible_flags = DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
> +			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
> +			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE;
> +
> +	if (drm_core_check_feature(dev, DRIVER_SYNCOBJ_DEADLINE))
> +		possible_flags |= DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE;
> +
> +	if (args->flags & ~possible_flags)
>   		return -EINVAL;
>   
>   	if (args->count_handles == 0)
> @@ -1296,8 +1328,13 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>   	if (ret < 0)
>   		return ret;
>   
> +	if (args->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE) {
> +		t = ktime_set(args->deadline_sec, args->deadline_nsec);
> +		tp = &t;
> +	}
> +
>   	ret = drm_syncobj_array_wait(dev, file_private,
> -				     NULL, args, syncobjs, true);
> +				     NULL, args, syncobjs, true, tp);
>   
>   	drm_syncobj_array_free(syncobjs, args->count_handles);
>   
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 1d76d0686b03..9aa24f097e22 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -104,6 +104,12 @@ enum drm_driver_feature {
>   	 * acceleration should be handled by two drivers that are connected using auxiliary bus.
>   	 */
>   	DRIVER_COMPUTE_ACCEL            = BIT(7),
> +	/**
> +	 * @DRIVER_SYNCOBJ_DEADLINE:
> +	 *
> +	 * Driver supports &dma_fence_ops.set_deadline
> +	 */
> +	DRIVER_SYNCOBJ_DEADLINE         = BIT(8),
>   
>   	/* IMPORTANT: Below are all the legacy flags, add new ones above. */
>   
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 642808520d92..c6b85bb13810 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -767,6 +767,13 @@ struct drm_gem_open {
>    * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
>    */
>   #define DRM_CAP_SYNCOBJ_TIMELINE	0x14
> +/**
> + * DRM_CAP_SYNCOBJ_DEADLINE
> + *
> + * If set to 1, the driver supports DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE flag
> + * on the SYNCOBJ_TIMELINE_WAIT/SYNCOBJ_WAIT ioctls.
> + */
> +#define DRM_CAP_SYNCOBJ_DEADLINE	0x15
>   
>   /* DRM_IOCTL_GET_CAP ioctl argument type */
>   struct drm_get_cap {
> @@ -887,6 +894,7 @@ struct drm_syncobj_transfer {
>   #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL (1 << 0)
>   #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT (1 << 1)
>   #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE (1 << 2) /* wait for time point to become available */
> +#define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE (1 << 3) /* set fence deadline based to deadline_nsec/sec */
>   struct drm_syncobj_wait {
>   	__u64 handles;
>   	/* absolute timeout */
> @@ -894,7 +902,9 @@ struct drm_syncobj_wait {
>   	__u32 count_handles;
>   	__u32 flags;
>   	__u32 first_signaled; /* only valid when not waiting all */
> -	__u32 pad;
> +	/* Deadline to set on backing fence(s) in CLOCK_MONOTONIC: */
> +	__u32 deadline_nsec;
> +	__u64 deadline_sec;
>   };
>   
>   struct drm_syncobj_timeline_wait {
> @@ -906,7 +916,9 @@ struct drm_syncobj_timeline_wait {
>   	__u32 count_handles;
>   	__u32 flags;
>   	__u32 first_signaled; /* only valid when not waiting all */
> -	__u32 pad;
> +	/* Deadline to set on backing fence(s) in CLOCK_MONOTONIC: */
> +	__u32 deadline_nsec;
> +	__u64 deadline_sec;
>   };
>   
>   
