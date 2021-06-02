Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBA43988C2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 14:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12D36EC53;
	Wed,  2 Jun 2021 12:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29816EC4D;
 Wed,  2 Jun 2021 12:00:49 +0000 (UTC)
IronPort-SDR: pE86RgEQOUbfjmEusLy4A1vd/Jb/9K/Xbf49l+FH6MqDsWZXktgQD0O0iYtUD2ktE2PnCyl6EW
 HAlwAmtobNwA==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="203764389"
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="203764389"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 05:00:49 -0700
IronPort-SDR: oWEONvLkhIjiGCsjW23M26zg7LgrQ4KRMM0JXr7lBZn+8HZn/cfiYD1YWFKH0joa+NDVVxhOrW
 YY5Isj75TOWQ==
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="399700858"
Received: from ibanaga-mobl.ger.corp.intel.com (HELO [10.249.254.50])
 ([10.249.254.50])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 05:00:47 -0700
Subject: Re: [PATCH] drm/i915/gem/mman: only allow WC for lmem
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210602093636.167070-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <3af30ebb-a46b-2b21-57b0-988b2400ac08@linux.intel.com>
Date: Wed, 2 Jun 2021 14:00:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602093636.167070-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/2/21 11:36 AM, Matthew Auld wrote:
> For dgfx where we now have lmem and ttm, we can only support single mmap
> mode for the lifetime of the object, and for lmem objects this should be
> WC, so reject all other mapping modes for mmap_offset, including if the
> object can be placed in both smem and lmem.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c   |  4 ++++
>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 22 ++++++++++++++++++++++
>   drivers/gpu/drm/i915/gem/i915_gem_object.h |  4 ++++
>   3 files changed, 30 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index fd1c9714f8d8..32f88f236771 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -689,6 +689,10 @@ __assign_mmap_offset(struct drm_file *file,
>   		goto out;
>   	}
>   
> +	if (mmap_type != I915_MMAP_TYPE_WC &&
> +	    i915_gem_object_placements_contain_type(obj, INTEL_MEMORY_LOCAL))
> +		return -ENODEV;
> +

I think we will also have the restriction that any other objects on DGFX 
can only be mapped cached? At least that's what the TTM code is 
implementing currently.


>   	mmo = mmap_offset_attach(obj, mmap_type, file);
>   	if (IS_ERR(mmo)) {
>   		err = PTR_ERR(mmo);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 2be6109d0093..d4b0da8ed969 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -403,6 +403,28 @@ int i915_gem_object_read_from_page(struct drm_i915_gem_object *obj, u64 offset,
>   	return 0;
>   }
>   
> +/**
> + * i915_gem_object_placements_contain_type - Check whether the object can be
> + * placed at certain memory type
> + * @obj: Pointer to the object
> + * @type: The memory type to check
> + *
> + * Return: True if the object can be placed in @type. False otherwise.
> + */
> +bool i915_gem_object_placements_contain_type(struct drm_i915_gem_object *obj,
> +					     enum intel_memory_type type)
> +{
> +	unsigned int i;
> +
> +	/* TODO: consider maybe storing as a mask when doing gem_create_ext */
> +	for (i = 0; i < obj->mm.n_placements; i++) {
> +		if (obj->mm.placements[i]->type == type)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +

Do we need something for the in-kernel mappings as well? Or just return 
a mapping with the only allowed caching mode?

/Thomas


