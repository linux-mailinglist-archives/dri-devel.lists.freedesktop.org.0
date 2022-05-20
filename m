Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C5B52E8DE
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 11:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3701610E6E3;
	Fri, 20 May 2022 09:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A637710E4F0;
 Fri, 20 May 2022 09:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653039183; x=1684575183;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=P69/GOrxfu+VNhCctObgJ3Bnh1zpnG02Lus5qNBC+/Y=;
 b=h9LUgs45OUgKSewEQ6iYioIF1eUwxGwW3J+ApOBYGG1s7QINX8QOCy7z
 LXMV72YY7O8F5D0MsXsY6iWvumkpLxDP8FH6afXKGKQvVpQQml50o4O7F
 NklMf8yH3gDp2dOv/4CMTQM0QXaMJksPCc5Gp/S5p2y/JDj6iO78h06Ur
 B27gQ3b01jZkB4jSeuONHMbbEsW3qm9qevJAqj33CTNGleqZ1TufBY9Rf
 CwOfyQ9jSp840yLIk43Dv3t6SWMAEW7AkF2pRWfK6IhkRZDQL52qvsgt7
 +gI8UxVy7lGDYjizEvhgzyyGGwvi/EuTjvardIx7s/s+8g/3akMbygQL+ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="254608432"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="254608432"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 02:33:03 -0700
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="570724537"
Received: from bpower2-mobl2.ger.corp.intel.com (HELO [10.213.200.132])
 ([10.213.200.132])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 02:33:01 -0700
Message-ID: <227fae6c-5b37-6304-2bd5-b17dde802d89@linux.intel.com>
Date: Fri, 20 May 2022 10:32:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 4/6] drm/i915/sseu: Don't try to store EU mask
 internally in UAPI format
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220517032005.2694737-1-matthew.d.roper@intel.com>
 <20220517032005.2694737-5-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220517032005.2694737-5-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/05/2022 04:20, Matt Roper wrote:
> Storing the EU mask internally in the same format the I915_QUERY
> topology queries use makes the final copy_to_user() a bit simpler, but
> makes the rest of the driver's SSEU more complicated and harder to
> follow.  Let's switch to an internal representation that's more natural:
> Xe_HP platforms will be a simple array of u16 masks, whereas pre-Xe_HP
> platforms will be a two-dimensional array, indexed by [slice][subslice].
> We'll convert to the uapi format only when the query uapi is called.
> 
> v2:
>   - Drop has_common_ss_eumask.  We waste some space repeating identical
>     EU masks for every single DSS, but the code is simpler without it.
>     (Tvrtko)
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_sseu.c | 77 +++++++++++++++++++---------
>   drivers/gpu/drm/i915/gt/intel_sseu.h |  9 +++-
>   drivers/gpu/drm/i915/i915_query.c    |  8 +--
>   3 files changed, 65 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
> index ade3e1805782..d89e2e0f05e5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_sseu.c
> +++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
> @@ -78,47 +78,76 @@ intel_sseu_subslices_per_slice(const struct sseu_dev_info *sseu, u8 slice)
>   	return hweight32(intel_sseu_get_subslices(sseu, slice));
>   }
>   
> -static int sseu_eu_idx(const struct sseu_dev_info *sseu, int slice,
> -		       int subslice)
> -{
> -	int slice_stride = sseu->max_subslices * sseu->eu_stride;
> -
> -	return slice * slice_stride + subslice * sseu->eu_stride;
> -}
> -
>   static u16 sseu_get_eus(const struct sseu_dev_info *sseu, int slice,
>   			int subslice)
>   {
> -	int i, offset = sseu_eu_idx(sseu, slice, subslice);
> -	u16 eu_mask = 0;
> -
> -	for (i = 0; i < sseu->eu_stride; i++)
> -		eu_mask |=
> -			((u16)sseu->eu_mask[offset + i]) << (i * BITS_PER_BYTE);
> -
> -	return eu_mask;
> +	if (sseu->has_xehp_dss) {
> +		WARN_ON(slice > 0);
> +		return sseu->eu_mask.xehp[subslice];
> +	} else {
> +		return sseu->eu_mask.hsw[slice][subslice];
> +	}
>   }
>   
>   static void sseu_set_eus(struct sseu_dev_info *sseu, int slice, int subslice,
>   			 u16 eu_mask)
>   {
> -	int i, offset = sseu_eu_idx(sseu, slice, subslice);
> -
> -	for (i = 0; i < sseu->eu_stride; i++)
> -		sseu->eu_mask[offset + i] =
> -			(eu_mask >> (BITS_PER_BYTE * i)) & 0xff;
> +	if (sseu->has_xehp_dss) {
> +		WARN_ON(slice > 0);
> +		sseu->eu_mask.xehp[subslice] = eu_mask;
> +	} else {
> +		eu_mask &= GENMASK(sseu->max_eus_per_subslice - 1, 0);

Is this masking required? Oh I remember.. it's the type expansion! I thought that was wrong. I mean the callers are wrong. Some use u8 for the mask and then do ~mask passing it into u16 here. I don't think this function should account for that but callers should stop passing in garbage.

I had this in my patch:

GEM_WARN_ON(mask && (__fls(mask) >= sseu->max_eus_per_subslice));

And in the callers like:

-               sseu_set_eus(sseu, 0, 0, ~disabled_mask);
+               sseu_set_eus(sseu, 0, 0, ~disabled_mask & 0xff);

-                       sseu_set_eus(sseu, s, ss, ~eu_disabled_mask);
+                       sseu_set_eus(sseu, s, ss, ~eu_disabled_mask & eu_mask);

> +		sseu->eu_mask.hsw[slice][subslice] = eu_mask;
> +	}
>   }
>   
>   static u16 compute_eu_total(const struct sseu_dev_info *sseu)
>   {
> -	u16 i, total = 0;
> +	int s, ss, total = 0;
>   
> -	for (i = 0; i < ARRAY_SIZE(sseu->eu_mask); i++)
> -		total += hweight8(sseu->eu_mask[i]);
> +	for (s = 0; s < sseu->max_slices; s++)
> +		for (ss = 0; ss < sseu->max_subslices; ss++)
> +			if (sseu->has_xehp_dss)
> +				total += hweight16(sseu->eu_mask.xehp[ss]);
> +			else
> +				total += hweight16(sseu->eu_mask.hsw[s][ss]);
>   
>   	return total;
>   }
>   
> +/**
> + * intel_sseu_copy_eumask_to_user - Copy EU mask into a userspace buffer
> + * @to: Pointer to userspace buffer to copy to
> + * @sseu: SSEU structure containing EU mask to copy
> + *
> + * Copies the EU mask to a userspace buffer in the format expected by
> + * the query ioctl's topology queries.
> + *
> + * Returns the result of the copy_to_user() operation.
> + */
> +int intel_sseu_copy_eumask_to_user(void __user *to,
> +				   const struct sseu_dev_info *sseu)
> +{
> +	u8 eu_mask[GEN_SS_MASK_SIZE * GEN_MAX_EU_STRIDE] = {};
> +	int len = sseu->max_slices * sseu->max_subslices * sseu->eu_stride;

How compilcated to kick eu_stride out of kernel struct sseu_dev_info and just calculate it here? Since I don't think it belongs in the kernel struct.

What about ss_stride - is that still in use at this point, or by the end of the series, and could it be dropped?

Regards,

Tvrtko

> +	int s, ss, i;
> +
> +	for (s = 0; s < sseu->max_slices; s++) {
> +		for (ss = 0; ss < sseu->max_subslices; ss++) {
> +			int uapi_offset =
> +				s * sseu->max_subslices * sseu->eu_stride +
> +				ss * sseu->eu_stride;
> +			u16 mask = sseu_get_eus(sseu, s, ss);
> +
> +			for (i = 0; i < sseu->eu_stride; i++)
> +				eu_mask[uapi_offset + i] =
> +					(mask >> (BITS_PER_BYTE * i)) & 0xff;
> +		}
> +	}
> +
> +	return copy_to_user(to, eu_mask, len);
> +}
> +
>   static void gen11_compute_sseu_info(struct sseu_dev_info *sseu,
>   				    u32 g_ss_en, u32 c_ss_en, u16 eu_en)
>   {
> diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.h b/drivers/gpu/drm/i915/gt/intel_sseu.h
> index 4a041f9dc490..43a8f8f98687 100644
> --- a/drivers/gpu/drm/i915/gt/intel_sseu.h
> +++ b/drivers/gpu/drm/i915/gt/intel_sseu.h
> @@ -57,7 +57,11 @@ struct sseu_dev_info {
>   	u8 subslice_mask[GEN_SS_MASK_SIZE];
>   	u8 geometry_subslice_mask[GEN_SS_MASK_SIZE];
>   	u8 compute_subslice_mask[GEN_SS_MASK_SIZE];
> -	u8 eu_mask[GEN_SS_MASK_SIZE * GEN_MAX_EU_STRIDE];
> +	union {
> +		u16 hsw[GEN_MAX_HSW_SLICES][GEN_MAX_SS_PER_HSW_SLICE];
> +		u16 xehp[GEN_MAX_DSS];
> +	} eu_mask;
> +
>   	u16 eu_total;
>   	u8 eu_per_subslice;
>   	u8 min_eu_in_pool;
> @@ -150,4 +154,7 @@ void intel_sseu_print_topology(struct drm_i915_private *i915,
>   
>   u16 intel_slicemask_from_dssmask(u64 dss_mask, int dss_per_slice);
>   
> +int intel_sseu_copy_eumask_to_user(void __user *to,
> +				   const struct sseu_dev_info *sseu);
> +
>   #endif /* __INTEL_SSEU_H__ */
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index 7584cec53d5d..16f43bf32a05 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -76,10 +76,10 @@ static int fill_topology_info(const struct sseu_dev_info *sseu,
>   			 subslice_mask, subslice_length))
>   		return -EFAULT;
>   
> -	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr +
> -					 sizeof(topo) +
> -					 slice_length + subslice_length),
> -			 sseu->eu_mask, eu_length))
> +	if (intel_sseu_copy_eumask_to_user(u64_to_user_ptr(query_item->data_ptr +
> +							   sizeof(topo) +
> +							   slice_length + subslice_length),
> +					   sseu))
>   		return -EFAULT;
>   
>   	return total_length;
