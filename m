Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D563619AE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 08:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6D46E167;
	Fri, 16 Apr 2021 06:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 576 seconds by postgrey-1.36 at gabe;
 Thu, 15 Apr 2021 22:35:10 UTC
Received: from s2.our.net (s2.our.net [69.168.53.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9787B6EABA;
 Thu, 15 Apr 2021 22:35:10 +0000 (UTC)
Received: from [192.168.1.108] (c-24-22-33-250.hsd1.or.comcast.net
 [24.22.33.250]) by s2.our.net (Postfix) with ESMTPSA id A91975E61C;
 Thu, 15 Apr 2021 15:25:32 -0700 (PDT)
Subject: Re: [Mesa-dev] [PATCH v3 3/4] drm/i915/uapi: convert i915_query and
 friend to kernel doc
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210415155958.391624-1-matthew.auld@intel.com>
 <20210415155958.391624-3-matthew.auld@intel.com>
From: Ian Romanick <idr@freedesktop.org>
Message-ID: <5de63e24-51f0-71eb-b992-484da998e65f@freedesktop.org>
Date: Thu, 15 Apr 2021 15:25:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210415155958.391624-3-matthew.auld@intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 16 Apr 2021 06:06:46 +0000
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
Cc: mesa-dev@lists.freedesktop.org, Kenneth Graunke <kenneth@whitecape.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/15/21 8:59 AM, Matthew Auld wrote:
> Add a note about the two-step process.
> 
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: mesa-dev@lists.freedesktop.org
> ---
>  include/uapi/drm/i915_drm.h | 57 ++++++++++++++++++++++++++++++-------
>  1 file changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index d9c954a5a456..ef36f1a0adde 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -2210,14 +2210,23 @@ struct drm_i915_perf_oa_config {
>  	__u64 flex_regs_ptr;
>  };
>  
> +/**
> + * struct drm_i915_query_item - An individual query for the kernel to process.
> + *
> + * The behaviour is determined by the @query_id. Note that exactly what

Since we just had a big discussion about this on mesa-dev w.r.t. Mesa
code and documentation... does the kernel have a policy about which
flavor (pun intended) of English should be used?

> + * @data_ptr is also depends on the specific @query_id.
> + */
>  struct drm_i915_query_item {
> +	/** @query_id: The id for this query */
>  	__u64 query_id;
>  #define DRM_I915_QUERY_TOPOLOGY_INFO    1
>  #define DRM_I915_QUERY_ENGINE_INFO	2
>  #define DRM_I915_QUERY_PERF_CONFIG      3
>  /* Must be kept compact -- no holes and well documented */
>  
> -	/*
> +	/**
> +	 * @length:
> +	 *
>  	 * When set to zero by userspace, this is filled with the size of the
>  	 * data to be written at the data_ptr pointer. The kernel sets this
>  	 * value to a negative value to signal an error on a particular query
> @@ -2225,21 +2234,26 @@ struct drm_i915_query_item {
>  	 */
>  	__s32 length;
>  
> -	/*
> +	/**
> +	 * @flags:
> +	 *
>  	 * When query_id == DRM_I915_QUERY_TOPOLOGY_INFO, must be 0.
>  	 *
>  	 * When query_id == DRM_I915_QUERY_PERF_CONFIG, must be one of the
> -	 * following :
> -	 *         - DRM_I915_QUERY_PERF_CONFIG_LIST
> -	 *         - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
> -	 *         - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
> +	 * following:
> +	 *
> +	 *	- DRM_I915_QUERY_PERF_CONFIG_LIST
> +	 *      - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
> +	 *      - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
>  	 */
>  	__u32 flags;
>  #define DRM_I915_QUERY_PERF_CONFIG_LIST          1
>  #define DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID 2
>  #define DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_ID   3
>  
> -	/*
> +	/**
> +	 * @data_ptr:
> +	 *
>  	 * Data will be written at the location pointed by data_ptr when the
>  	 * value of length matches the length of the data to be written by the
>  	 * kernel.
> @@ -2247,16 +2261,37 @@ struct drm_i915_query_item {
>  	__u64 data_ptr;
>  };
>  
> +/**
> + * struct drm_i915_query - Supply an array of drm_i915_query_item for the kernel
> + * to fill out.
> + *
> + * Note that this is generally a two step process for each drm_i915_query_item
> + * in the array:
> + *
> + *	1.) Call the DRM_IOCTL_I915_QUERY, giving it our array of
> + *	drm_i915_query_item, with drm_i915_query_item.size set to zero. The
> + *	kernel will then fill in the size, in bytes, which tells userspace how
> + *	memory it needs to allocate for the blob(say for an array of
> + *	properties).
> + *
> + *	2.) Next we call DRM_IOCTL_I915_QUERY again, this time with the
> + *	drm_i915_query_item.data_ptr equal to our newly allocated blob. Note
> + *	that the i915_query_item.size should still be the same as what the
> + *	kernel previously set. At this point the kernel can fill in the blob.
> + *
> + */
>  struct drm_i915_query {
> +	/** @num_items: The number of elements in the @items_ptr array */
>  	__u32 num_items;
>  
> -	/*
> -	 * Unused for now. Must be cleared to zero.
> +	/**
> +	 * @flags: Unused for now. Must be cleared to zero.
>  	 */
>  	__u32 flags;
>  
> -	/*
> -	 * This points to an array of num_items drm_i915_query_item structures.
> +	/**
> +	 * @items_ptr: This points to an array of num_items drm_i915_query_item
> +	 * structures.
>  	 */
>  	__u64 items_ptr;
>  };
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
