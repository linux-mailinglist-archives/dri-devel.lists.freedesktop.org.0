Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBE56CC201
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 16:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD99910E8DC;
	Tue, 28 Mar 2023 14:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8DF10E8DC;
 Tue, 28 Mar 2023 14:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680013488; x=1711549488;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=G5WMzWIE0ojBdHoFJAsh9KYOhyFRY/F1VB3tEmTC0Yo=;
 b=WT5C5gpy+DAlIMJdlVsNprA0N1xEZ043xefQNKEKuP8uFyIGfNk3b4mq
 apLz72vsMvPXfRavlHDuLyT3hsSEgmrKE/99w1Hh774pfeB44jFd7G3Da
 RQ9df1Dx/EduJNVhJ4TpNtK8tJIFMYLHpsc5AQOuEOdlhv4Dl1w56/zZp
 JRNlIGqoUXotFdO78ksHGeePHEKxlhzLA8iEWFXjbsqgq3UIZptU4j++J
 28LeKOHjEkJnQ4vm7sJzL2HvckcWzhYKfqdsrXMYazXgXe45pUfqjwwi0
 S3+NYD0AXdfmTRI3huF0fkP7QDkvYBFzKbt1PN+S3vejFTYQDUHT2E5gG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="339299587"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="339299587"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 07:24:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="683918096"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="683918096"
Received: from wheelerj-mobl.ger.corp.intel.com (HELO [10.213.213.242])
 ([10.213.213.242])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 07:24:44 -0700
Message-ID: <3fd504bf-0415-3466-78c5-918a295dcf93@linux.intel.com>
Date: Tue, 28 Mar 2023 15:24:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 09/15] drm/syncobj: Add deadline support for syncobj
 waits
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230308155322.344664-1-robdclark@gmail.com>
 <20230308155322.344664-10-robdclark@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230308155322.344664-10-robdclark@gmail.com>
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
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Turner <mattst88@gmail.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 08/03/2023 15:53, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add a new flag to let userspace provide a deadline as a hint for syncobj
> and timeline waits.  This gives a hint to the driver signaling the
> backing fences about how soon userspace needs it to compete work, so it
> can addjust GPU frequency accordingly.  An immediate deadline can be

adjust

> given to provide something equivalent to i915 "wait boost".
> 
> v2: Use absolute u64 ns value for deadline hint, drop cap and driver
>      feature flag in favor of allowing count_handles==0 as a way for
>      userspace to probe kernel for support of new flag
> v3: More verbose comments about UAPI
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/drm_syncobj.c | 64 ++++++++++++++++++++++++++++-------
>   include/uapi/drm/drm.h        | 17 ++++++++++
>   2 files changed, 68 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 0c2be8360525..a85e9464f07b 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -126,6 +126,11 @@
>    * synchronize between the two.
>    * This requirement is inherited from the Vulkan fence API.
>    *
> + * If &DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE is set, the ioctl will also set
> + * a fence deadline hint on the backing fences before waiting, to provide the
> + * fence signaler with an appropriate sense of urgency.  The deadline is
> + * specified as an absolute &CLOCK_MONOTONIC value in units of ns.
> + *
>    * Similarly, &DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT takes an array of syncobj
>    * handles as well as an array of u64 points and does a host-side wait on all
>    * of syncobj fences at the given points simultaneously.
> @@ -973,7 +978,8 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>   						  uint32_t count,
>   						  uint32_t flags,
>   						  signed long timeout,
> -						  uint32_t *idx)
> +						  uint32_t *idx,
> +						  ktime_t *deadline)
>   {
>   	struct syncobj_wait_entry *entries;
>   	struct dma_fence *fence;
> @@ -1053,6 +1059,15 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
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
> @@ -1151,7 +1166,8 @@ static int drm_syncobj_array_wait(struct drm_device *dev,
>   				  struct drm_file *file_private,
>   				  struct drm_syncobj_wait *wait,
>   				  struct drm_syncobj_timeline_wait *timeline_wait,
> -				  struct drm_syncobj **syncobjs, bool timeline)
> +				  struct drm_syncobj **syncobjs, bool timeline,
> +				  ktime_t *deadline)
>   {
>   	signed long timeout = 0;
>   	uint32_t first = ~0;
> @@ -1162,7 +1178,8 @@ static int drm_syncobj_array_wait(struct drm_device *dev,
>   							 NULL,
>   							 wait->count_handles,
>   							 wait->flags,
> -							 timeout, &first);
> +							 timeout, &first,
> +							 deadline);
>   		if (timeout < 0)
>   			return timeout;
>   		wait->first_signaled = first;
> @@ -1172,7 +1189,8 @@ static int drm_syncobj_array_wait(struct drm_device *dev,
>   							 u64_to_user_ptr(timeline_wait->points),
>   							 timeline_wait->count_handles,
>   							 timeline_wait->flags,
> -							 timeout, &first);
> +							 timeout, &first,
> +							 deadline);
>   		if (timeout < 0)
>   			return timeout;
>   		timeline_wait->first_signaled = first;
> @@ -1243,17 +1261,22 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
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
> +			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
> +			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE;
> +
> +	if (args->flags & ~possible_flags)
>   		return -EINVAL;
>   
>   	if (args->count_handles == 0)
> -		return -EINVAL;
> +		return 0;
>   
>   	ret = drm_syncobj_array_find(file_private,
>   				     u64_to_user_ptr(args->handles),
> @@ -1262,8 +1285,13 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>   	if (ret < 0)
>   		return ret;
>   
> +	if (args->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE) {
> +		t = ns_to_ktime(args->deadline_ns);
> +		tp = &t;
> +	}
> +
>   	ret = drm_syncobj_array_wait(dev, file_private,
> -				     args, NULL, syncobjs, false);
> +				     args, NULL, syncobjs, false, tp);
>   
>   	drm_syncobj_array_free(syncobjs, args->count_handles);
>   
> @@ -1276,18 +1304,23 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
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
> +			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE |
> +			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE;
> +
> +	if (args->flags & ~possible_flags)
>   		return -EINVAL;
>   
>   	if (args->count_handles == 0)
> -		return -EINVAL;
> +		return -0;
>   
>   	ret = drm_syncobj_array_find(file_private,
>   				     u64_to_user_ptr(args->handles),
> @@ -1296,8 +1329,13 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>   	if (ret < 0)
>   		return ret;
>   
> +	if (args->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE) {
> +		t = ns_to_ktime(args->deadline_ns);
> +		tp = &t;
> +	}
> +
>   	ret = drm_syncobj_array_wait(dev, file_private,
> -				     NULL, args, syncobjs, true);
> +				     NULL, args, syncobjs, true, tp);
>   
>   	drm_syncobj_array_free(syncobjs, args->count_handles);
>   
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 642808520d92..bff0509ac8b6 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -887,6 +887,7 @@ struct drm_syncobj_transfer {
>   #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL (1 << 0)
>   #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT (1 << 1)
>   #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE (1 << 2) /* wait for time point to become available */
> +#define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE (1 << 3) /* set fence deadline based to deadline_ns */

s/based// ?

>   struct drm_syncobj_wait {
>   	__u64 handles;
>   	/* absolute timeout */
> @@ -895,6 +896,14 @@ struct drm_syncobj_wait {
>   	__u32 flags;
>   	__u32 first_signaled; /* only valid when not waiting all */
>   	__u32 pad;
> +	/**
> +	 * @deadline_ns - fence deadline hint
> +	 *
> +	 * Deadline hint, in absolute CLOCK_MONOTONIC, to set on backing
> +	 * fence(s) if the DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE flag is
> +	 * set.
> +	 */
> +	__u64 deadline_ns;
>   };
>   
>   struct drm_syncobj_timeline_wait {
> @@ -907,6 +916,14 @@ struct drm_syncobj_timeline_wait {
>   	__u32 flags;
>   	__u32 first_signaled; /* only valid when not waiting all */
>   	__u32 pad;
> +	/**
> +	 * @deadline_ns - fence deadline hint
> +	 *
> +	 * Deadline hint, in absolute CLOCK_MONOTONIC, to set on backing
> +	 * fence(s) if the DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE flag is
> +	 * set.
> +	 */
> +	__u64 deadline_ns;
>   };
>   
>   

FWIW,

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
