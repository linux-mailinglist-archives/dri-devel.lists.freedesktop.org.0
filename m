Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1640A88FA34
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 09:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4F110F46A;
	Thu, 28 Mar 2024 08:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="FO2I67KB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D2710F46A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 08:44:27 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-414866f92beso4914155e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 01:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1711615466; x=1712220266;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J+KRkwjIGiIgXhYGbPIMLPID4EJ+/nHMs8mQxambbz4=;
 b=FO2I67KBqmnWDd/G9xbIKtEXtbHtZuBBZiU6RtUeXla3GJGRex3ZWzRz3ZHn3o7AQ1
 hp79E/4gNrsKcT4z1YLESu1TlfS9EQ4xb2BI+WO3L73B6y0UE5WAWJBFGsWDfSo7Vv6X
 fAEkrHKahjsWlkmY1f2BwG9u1BYrFwv6oa1H/YHZtcK27ksqsUES9BpHWxbbRWJc4HOA
 0fema1z+ch0Rs4Zrbfylcn8Ah4H6KaX/ljMJHtwW4aEjcfY1g3BWRFI0xVhwYTW1+2i9
 pDDwHFdc/5ZiE1y5RhhaWB5GKumuAYUCICZSdjKCOr27GQOgQKKvaXipuLSFj55UwBop
 3xEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711615466; x=1712220266;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J+KRkwjIGiIgXhYGbPIMLPID4EJ+/nHMs8mQxambbz4=;
 b=DBGUA65B7h6KRJc9hheCJ7WNuSkTW74ipieyKvKEtqKC3AQrs2NYmcHyoDbTT/YeHV
 tHdpUrfMxGVROTkUTw8BDd4vDOukMDVYzDWH5ahggHoU0nNToniOhHhkc8PeOtEcC6is
 dZySU1L5kkQ5xBy34OIzIfP0fDcRmvgvzz+LG2AmJkKI4lP57ZDLyI3Z+UWGwBmVRhIk
 Al90RsF37TjdGRKjAF/ITC0DWpbeQElLkOxQ3CYdCGAJpxgMVLRaWFE0S5DT8mJY6P40
 fUOWTN50ZXgi8P80/4RPGontcRyOHdr2dRxJ3e0Z6ZHsAMMOG1U97pLP2PY17v6VjHMc
 glcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr7WXy7DwlY9nptZhMXjB97KGY4tyZ2jaZmvVDvnsThdZJu0ydkwmfuZScwx4BQ0aez12h+R7yMsYQLtcBFPxIu7HuaRSqCDZqbnzaDFxc
X-Gm-Message-State: AOJu0Yy05EisTOFI0191HhHJgyUkrpk2Xz1n2Vf8fScrcSsrpjvmu1t5
 U9D/a4t5leaAGK8oRLEtrmB5aOV+2ig4C98IJnY3Izx2YEH8atHctgiWZ66lYLs=
X-Google-Smtp-Source: AGHT+IEm6st8VTBHRK8EaN2H8E8xzSz1Yu5l/TJKSouibVfU4otc3C3plsDse0fpkNeijRIr5oURtw==
X-Received: by 2002:a05:600c:3505:b0:413:3160:840f with SMTP id
 h5-20020a05600c350500b004133160840fmr1836624wmq.0.1711615466224; 
 Thu, 28 Mar 2024 01:44:26 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a05600c1d9800b00414f84641f2sm2121782wms.4.2024.03.28.01.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 01:44:25 -0700 (PDT)
Message-ID: <afe376f7-b26c-4254-8582-6e5db62835da@ursulin.net>
Date: Thu, 28 Mar 2024 08:44:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gem: Replace dev_priv with i915
Content-Language: en-GB
To: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240328071833.664001-1-andi.shyti@linux.intel.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240328071833.664001-1-andi.shyti@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/03/2024 07:18, Andi Shyti wrote:
> Anyone using 'dev_priv' instead of 'i915' in a cleaned-up area
> should be fined and required to do community service for a few
> days.
> 
> I thought I had cleaned up the 'gem/' directory in the past, but
> still, old aficionados of the 'dev_priv' name keep sneaking it
> in.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c |  4 ++--
>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c      |  6 +++---
>   drivers/gpu/drm/i915/gem/i915_gem_stolen.h     |  8 ++++----
>   drivers/gpu/drm/i915/gem/i915_gem_tiling.c     | 18 +++++++++---------
>   drivers/gpu/drm/i915/gem/i915_gem_userptr.c    |  6 +++---
>   .../gpu/drm/i915/gem/selftests/huge_pages.c    | 14 +++++++-------
>   6 files changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 3f20fe381199..42619fc05de4 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -2456,7 +2456,7 @@ static int eb_submit(struct i915_execbuffer *eb)
>    * The engine index is returned.
>    */
>   static unsigned int
> -gen8_dispatch_bsd_engine(struct drm_i915_private *dev_priv,
> +gen8_dispatch_bsd_engine(struct drm_i915_private *i915,
>   			 struct drm_file *file)
>   {
>   	struct drm_i915_file_private *file_priv = file->driver_priv;
> @@ -2464,7 +2464,7 @@ gen8_dispatch_bsd_engine(struct drm_i915_private *dev_priv,
>   	/* Check whether the file_priv has already selected one ring. */
>   	if ((int)file_priv->bsd_engine < 0)
>   		file_priv->bsd_engine =
> -			get_random_u32_below(dev_priv->engine_uabi_class_count[I915_ENGINE_CLASS_VIDEO]);
> +			get_random_u32_below(i915->engine_uabi_class_count[I915_ENGINE_CLASS_VIDEO]);
>   
>   	return file_priv->bsd_engine;
>   }
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index 38b72d86560f..c5e1c718a6d2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -654,7 +654,7 @@ i915_gem_object_create_shmem(struct drm_i915_private *i915,
>   
>   /* Allocate a new GEM object and fill it with the supplied data */
>   struct drm_i915_gem_object *
> -i915_gem_object_create_shmem_from_data(struct drm_i915_private *dev_priv,
> +i915_gem_object_create_shmem_from_data(struct drm_i915_private *i915,
>   				       const void *data, resource_size_t size)
>   {
>   	struct drm_i915_gem_object *obj;
> @@ -663,8 +663,8 @@ i915_gem_object_create_shmem_from_data(struct drm_i915_private *dev_priv,
>   	resource_size_t offset;
>   	int err;
>   
> -	GEM_WARN_ON(IS_DGFX(dev_priv));
> -	obj = i915_gem_object_create_shmem(dev_priv, round_up(size, PAGE_SIZE));
> +	GEM_WARN_ON(IS_DGFX(i915));
> +	obj = i915_gem_object_create_shmem(i915, round_up(size, PAGE_SIZE));
>   	if (IS_ERR(obj))
>   		return obj;
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.h b/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
> index 258381d1c054..dfe0db8bb1b9 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
> @@ -14,14 +14,14 @@ struct drm_i915_gem_object;
>   
>   #define i915_stolen_fb drm_mm_node
>   
> -int i915_gem_stolen_insert_node(struct drm_i915_private *dev_priv,
> +int i915_gem_stolen_insert_node(struct drm_i915_private *i915,
>   				struct drm_mm_node *node, u64 size,
>   				unsigned alignment);
> -int i915_gem_stolen_insert_node_in_range(struct drm_i915_private *dev_priv,
> +int i915_gem_stolen_insert_node_in_range(struct drm_i915_private *i915,
>   					 struct drm_mm_node *node, u64 size,
>   					 unsigned alignment, u64 start,
>   					 u64 end);
> -void i915_gem_stolen_remove_node(struct drm_i915_private *dev_priv,
> +void i915_gem_stolen_remove_node(struct drm_i915_private *i915,
>   				 struct drm_mm_node *node);
>   struct intel_memory_region *
>   i915_gem_stolen_smem_setup(struct drm_i915_private *i915, u16 type,
> @@ -31,7 +31,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>   			   u16 instance);
>   
>   struct drm_i915_gem_object *
> -i915_gem_object_create_stolen(struct drm_i915_private *dev_priv,
> +i915_gem_object_create_stolen(struct drm_i915_private *i915,
>   			      resource_size_t size);
>   
>   bool i915_gem_object_is_stolen(const struct drm_i915_gem_object *obj);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
> index a049ca0b7980..d9eb84c1d2f1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
> @@ -343,12 +343,12 @@ int
>   i915_gem_set_tiling_ioctl(struct drm_device *dev, void *data,
>   			  struct drm_file *file)
>   {
> -	struct drm_i915_private *dev_priv = to_i915(dev);
> +	struct drm_i915_private *i915 = to_i915(dev);
>   	struct drm_i915_gem_set_tiling *args = data;
>   	struct drm_i915_gem_object *obj;
>   	int err;
>   
> -	if (!to_gt(dev_priv)->ggtt->num_fences)
> +	if (!to_gt(i915)->ggtt->num_fences)
>   		return -EOPNOTSUPP;
>   
>   	obj = i915_gem_object_lookup(file, args->handle);
> @@ -374,9 +374,9 @@ i915_gem_set_tiling_ioctl(struct drm_device *dev, void *data,
>   		args->stride = 0;
>   	} else {
>   		if (args->tiling_mode == I915_TILING_X)
> -			args->swizzle_mode = to_gt(dev_priv)->ggtt->bit_6_swizzle_x;
> +			args->swizzle_mode = to_gt(i915)->ggtt->bit_6_swizzle_x;
>   		else
> -			args->swizzle_mode = to_gt(dev_priv)->ggtt->bit_6_swizzle_y;
> +			args->swizzle_mode = to_gt(i915)->ggtt->bit_6_swizzle_y;
>   
>   		/* Hide bit 17 swizzling from the user.  This prevents old Mesa
>   		 * from aborting the application on sw fallbacks to bit 17,
> @@ -427,11 +427,11 @@ i915_gem_get_tiling_ioctl(struct drm_device *dev, void *data,
>   			  struct drm_file *file)
>   {
>   	struct drm_i915_gem_get_tiling *args = data;
> -	struct drm_i915_private *dev_priv = to_i915(dev);
> +	struct drm_i915_private *i915 = to_i915(dev);
>   	struct drm_i915_gem_object *obj;
>   	int err = -ENOENT;
>   
> -	if (!to_gt(dev_priv)->ggtt->num_fences)
> +	if (!to_gt(i915)->ggtt->num_fences)
>   		return -EOPNOTSUPP;
>   
>   	rcu_read_lock();
> @@ -447,10 +447,10 @@ i915_gem_get_tiling_ioctl(struct drm_device *dev, void *data,
>   
>   	switch (args->tiling_mode) {
>   	case I915_TILING_X:
> -		args->swizzle_mode = to_gt(dev_priv)->ggtt->bit_6_swizzle_x;
> +		args->swizzle_mode = to_gt(i915)->ggtt->bit_6_swizzle_x;
>   		break;
>   	case I915_TILING_Y:
> -		args->swizzle_mode = to_gt(dev_priv)->ggtt->bit_6_swizzle_y;
> +		args->swizzle_mode = to_gt(i915)->ggtt->bit_6_swizzle_y;
>   		break;
>   	default:
>   	case I915_TILING_NONE:
> @@ -459,7 +459,7 @@ i915_gem_get_tiling_ioctl(struct drm_device *dev, void *data,
>   	}
>   
>   	/* Hide bit 17 from the user -- see comment in i915_gem_set_tiling */
> -	if (dev_priv->gem_quirks & GEM_QUIRK_PIN_SWIZZLED_PAGES)
> +	if (i915->gem_quirks & GEM_QUIRK_PIN_SWIZZLED_PAGES)
>   		args->phys_swizzle_mode = I915_BIT_6_SWIZZLE_UNKNOWN;
>   	else
>   		args->phys_swizzle_mode = args->swizzle_mode;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> index 61abfb505766..09b68713ab32 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> @@ -463,13 +463,13 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
>   		       struct drm_file *file)
>   {
>   	static struct lock_class_key __maybe_unused lock_class;
> -	struct drm_i915_private *dev_priv = to_i915(dev);
> +	struct drm_i915_private *i915 = to_i915(dev);
>   	struct drm_i915_gem_userptr *args = data;
>   	struct drm_i915_gem_object __maybe_unused *obj;
>   	int __maybe_unused ret;
>   	u32 __maybe_unused handle;
>   
> -	if (!HAS_LLC(dev_priv) && !HAS_SNOOP(dev_priv)) {
> +	if (!HAS_LLC(i915) && !HAS_SNOOP(i915)) {
>   		/* We cannot support coherent userptr objects on hw without
>   		 * LLC and broken snooping.
>   		 */
> @@ -501,7 +501,7 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
>   		 * On almost all of the older hw, we cannot tell the GPU that
>   		 * a page is readonly.
>   		 */
> -		if (!to_gt(dev_priv)->vm->has_read_only)
> +		if (!to_gt(i915)->vm->has_read_only)
>   			return -ENODEV;
>   	}
>   
> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> index edb54903be0a..84d41e6ccf05 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> @@ -1969,19 +1969,19 @@ int i915_gem_huge_page_mock_selftests(void)
>   		SUBTEST(igt_mock_memory_region_huge_pages),
>   		SUBTEST(igt_mock_ppgtt_misaligned_dma),
>   	};
> -	struct drm_i915_private *dev_priv;
> +	struct drm_i915_private *i915;
>   	struct i915_ppgtt *ppgtt;
>   	int err;
>   
> -	dev_priv = mock_gem_device();
> -	if (!dev_priv)
> +	i915 = mock_gem_device();
> +	if (!i915)
>   		return -ENOMEM;
>   
>   	/* Pretend to be a device which supports the 48b PPGTT */
> -	RUNTIME_INFO(dev_priv)->ppgtt_type = INTEL_PPGTT_FULL;
> -	RUNTIME_INFO(dev_priv)->ppgtt_size = 48;
> +	RUNTIME_INFO(i915)->ppgtt_type = INTEL_PPGTT_FULL;
> +	RUNTIME_INFO(i915)->ppgtt_size = 48;
>   
> -	ppgtt = i915_ppgtt_create(to_gt(dev_priv), 0);
> +	ppgtt = i915_ppgtt_create(to_gt(i915), 0);
>   	if (IS_ERR(ppgtt)) {
>   		err = PTR_ERR(ppgtt);
>   		goto out_unlock;
> @@ -2005,7 +2005,7 @@ int i915_gem_huge_page_mock_selftests(void)
>   out_put:
>   	i915_vm_put(&ppgtt->vm);
>   out_unlock:
> -	mock_destroy_device(dev_priv);
> +	mock_destroy_device(i915);
>   	return err;
>   }
>   

Reviewed-by: Tvrtko Ursulin <tursulin@ursulin.net>

Regards,

Tvrtko
