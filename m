Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DC34BF72E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 12:24:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EA110E6CE;
	Tue, 22 Feb 2022 11:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A34710E6CE;
 Tue, 22 Feb 2022 11:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645529050; x=1677065050;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HVF6kcm5KLzb1Gey/34bpBPfLq6I8Wm4kgkrXsr5X5o=;
 b=mMDB7ULAhuE2B0yYC+Ke1Q83JphW6b3h6sKTzvItqdxUcb4bNxa+0CLS
 mO7q1ZsDnSxqV05b6k/ybGZystCUtafUAUbh3qSBOJTvLLkt3L5HLS1GB
 RR8n4lc906HTmCYY0vvDzs+utdZ7tV2zm7ZIvEqOmhwD3k4Pf+25jAW22
 eHZZ8+QgQ7BPVE44cg6SjUFk/ypnK3MwMg1E68sjZmk0kHDdeZVrD7at4
 w61wq/G0dprpF2E4+hcdi1IVZHps4BIVowt46bfl/HDdWs2eVim5WpxmA
 bXo2ogp+9y09fM4CWZNrLHoZy0Mz/SzjySmZRZB519jSfb9rgCy+cwD0p A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="235204934"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="235204934"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 03:24:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="507949182"
Received: from sjgillin-mobl.ger.corp.intel.com (HELO [10.213.218.63])
 ([10.213.218.63])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 03:24:08 -0800
Message-ID: <4fcd914b-3360-b246-40d9-24f35679f702@linux.intel.com>
Date: Tue, 22 Feb 2022 11:24:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH v5 4/4] drm/i915/guc: Verify hwconfig blob
 matches supported format
Content-Language: en-US
To: Jordan Justen <jordan.l.justen@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
References: <20220222103640.1006006-1-jordan.l.justen@intel.com>
 <20220222103640.1006006-5-jordan.l.justen@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220222103640.1006006-5-jordan.l.justen@intel.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/02/2022 10:36, Jordan Justen wrote:
> i915_drm.h now defines the format of the returned
> DRM_I915_QUERY_HWCONFIG_BLOB query item. Since i915 receives this from
> the black box GuC software, it should verify that the data matches
> that format before sending it to user-space.
> 
> The verification makes a single simple pass through the blob contents,
> so this verification step should not add a significant amount of init
> time to i915.
> 
> v3:
>   * Add various changes suggested by Tvrtko
> 
> v4:
>   * Rewrite verify_hwconfig_blob() to hopefully be clearer without
>     relying on comments so much, and add various suggestions from
>     Michal.
> 
> Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
> Acked-by: Jon Bloomfield <jon.bloomfield@intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 44 ++++++++++++++++++-
>   1 file changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> index ad289603460c..a844b880cbdb 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> @@ -73,9 +73,46 @@ static int guc_hwconfig_discover_size(struct intel_guc_hwconfig *hwconfig)
>   	return 0;
>   }
>   
> +static int verify_hwconfig_blob(struct intel_guc_hwconfig *hwconfig)
> +{
> +	struct intel_guc *guc = hwconfig_to_guc(hwconfig);
> +	struct drm_device *drm = &guc_to_gt(guc)->i915->drm;
> +	struct drm_i915_query_hwconfig_blob_item *item = hwconfig->ptr;
> +	u64 offset = 0;
> +	u64 remaining = hwconfig->size;
> +	/* Everything before the data field is required */
> +	u64 min_item_size = offsetof(struct drm_i915_query_hwconfig_blob_item, data);
> +	u64 item_size;
> +
> +	if (!IS_ALIGNED(hwconfig->size, sizeof(u32))) {
> +		drm_err(drm, "hwconfig blob size (%d) is not u32 aligned\n", hwconfig->size);
> +		return -EINVAL;
> +	}
> +
> +	while (offset < hwconfig->size) {
> +		if (remaining < min_item_size) {
> +			drm_err(drm, "hwconfig blob invalid (no room for item required fields at offset %lld)\n",
> +				offset);
> +			return -EINVAL;
> +		}
> +		item_size = min_item_size + sizeof(u32) * item->length;
> +		if (item_size > remaining) {
> +			drm_err(drm, "hwconfig blob invalid (no room for data array of item at offset %lld)\n",
> +				offset);
> +			return -EINVAL;
> +		}
> +		offset += item_size;
> +		remaining -= item_size;
> +		item = (void *)&item->data[item->length];
> +	}
> +
> +	return 0;
> +}
> +
>   static int guc_hwconfig_fill_buffer(struct intel_guc_hwconfig *hwconfig)
>   {
>   	struct intel_guc *guc = hwconfig_to_guc(hwconfig);
> +	struct drm_device *drm = &guc_to_gt(guc)->i915->drm;
>   	struct i915_vma *vma;
>   	u32 ggtt_offset;
>   	void *vaddr;
> @@ -90,8 +127,13 @@ static int guc_hwconfig_fill_buffer(struct intel_guc_hwconfig *hwconfig)
>   	ggtt_offset = intel_guc_ggtt_offset(guc, vma);
>   
>   	ret = __guc_action_get_hwconfig(guc, ggtt_offset, hwconfig->size);
> -	if (ret >= 0)
> +	if (ret >= 0) {
>   		memcpy(hwconfig->ptr, vaddr, hwconfig->size);
> +		if (verify_hwconfig_blob(hwconfig)) {
> +			drm_err(drm, "Ignoring invalid hwconfig blob received from GuC!\n");
> +			ret = -EINVAL;
> +		}
> +	}
>   
>   	i915_vma_unpin_and_release(&vma, I915_VMA_RELEASE_MAP);
>   

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
