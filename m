Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 290624AE4EC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 23:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C684910E4A6;
	Tue,  8 Feb 2022 22:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C898210E4A6;
 Tue,  8 Feb 2022 22:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644360599; x=1675896599;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7mMvSNjssiOB+FNBIMzL21DdqHhnDKFRUTvoKF9QYuM=;
 b=NlO9unJgHJJT5yMwDLcQwAgNYv+YkC8lM0J8/pF2g8XReqsdJCVppbDh
 OpFKSu+ziiZnQ8t5rk89qiBzxXX4kk40RI4Y8SN6frPqAIRsd0r3Nvtt8
 DV82o27rG2svdY/tqChdwuPm+KqFSLIw7ReKgM3L0ydL+5Ds0gz81BUtp
 gw9fIpQ5owMAJSY+CJeEo05cjqxOIQHO8wNx0o7IGC0Y3q/0xsst3nktC
 bai+iVF+xJNJCrRbnTec+IC4Y3kGrdigfdg5JJr0/k9mtLBa1dUVGCK27
 SlYrbv/pnQvmpNdAebRLJXQ60ObmoVZ5gLhgU1nSaEWfX5/27AYLm5cxj Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="312365681"
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; d="scan'208";a="312365681"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 14:49:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; d="scan'208";a="678262022"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2022 14:49:58 -0800
Received: from [10.249.151.37] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.151.37])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 218MnuNj030990; Tue, 8 Feb 2022 22:49:57 GMT
Message-ID: <c7ab1bc8-0c02-464f-fb70-448c89ab02d5@intel.com>
Date: Tue, 8 Feb 2022 23:49:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [PATCH v3 4/4] drm/i915/guc: Verify hwconfig blob matches
 supported format
Content-Language: en-US
To: Jordan Justen <jordan.l.justen@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
References: <20220208210503.869491-1-jordan.l.justen@intel.com>
 <20220208210503.869491-5-jordan.l.justen@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20220208210503.869491-5-jordan.l.justen@intel.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08.02.2022 22:05, Jordan Justen wrote:
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
>  * Add various changes suggested by Tvrtko
> 
> Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
> ---
>  .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 56 ++++++++++++++++++-
>  1 file changed, 53 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> index ce6088f112d4..350a0517b9f0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> @@ -71,7 +71,52 @@ static int guc_hwconfig_discover_size(struct intel_guc_hwconfig *hwconfig)
>  	return 0;
>  }
>  
> -static int guc_hwconfig_fill_buffer(struct intel_guc_hwconfig *hwconfig)
> +static int verify_hwconfig_blob(struct drm_device *drm,

no need to pass drm as you can use:

+	struct intel_guc *guc = hwconfig_to_guc(hwconfig);
+	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;

> +				const struct intel_guc_hwconfig *hwconfig)
> +{
> +	struct drm_i915_query_hwconfig_blob_item *pos;
> +	u32 remaining;
> +
> +	if (hwconfig->size % 4 != 0 || hwconfig->ptr == NULL)

size alignment could be verified in guc_hwconfig_discover_size()

nit: instead of hardcoded 4 you may use 'sizeof(u32)'
nit: and IS_ALIGNED

and non-null ptr shall be enforced with GEM_BUG_ON as you are calling
this function after memcpy

> +		return -EINVAL;
> +
> +	pos = hwconfig->ptr;

add line space

and please update below multi-line comments format to
	/*
	 * blah...
	
> +	/* The number of dwords in the blob to validate. Each loop
> +	 * pass will process at least 2 dwords corresponding to the
> +	 * key and length fields of the item. In addition, the length
> +	 * field of the item indicates the length of the data array,
> +	 * and that number of dwords will be processed (skipped) as
> +	 * well.
> +	 */
> +	remaining = hwconfig->size / 4;
> +
> +	while (remaining > 0) {
> +		/* Each item requires at least 2 dwords for the key
> +		 * and length fields. If the length field is 0, then
> +		 * the data array would be of length 0.
> +		 */
> +		if (remaining < 2)
> +			return -EINVAL;
> +		/* remaining >= 2, so subtracting 2 is ok, whereas
> +		 * adding 2 to pos->length could overflow.
> +		 */
> +		if (pos->length > remaining - 2)
> +			return -EINVAL;
> +		/* The length check above ensures that the adjustment
> +		 * of the remaining variable will not underflow, and
> +		 * that the adjustment of the pos variable will not
> +		 * pass the end of the blob data.
> +		 */
> +		remaining -= 2 + pos->length;
> +		pos = (void *)&pos->data[pos->length];
> +	}

btw, if it needs comments then it is too complicated ;)

> +
> +	drm_dbg(drm, "hwconfig blob format is valid\n");

not sure if we need this since we have error message in case of failure
maybe better to add dbg message why we claim it is invalid

> +	return 0;
> +}
> +
> +static int guc_hwconfig_fill_buffer(struct drm_device *drm,

no need to pass drm

> +				    struct intel_guc_hwconfig *hwconfig)
>  {
>  	struct intel_guc *guc = hwconfig_to_guc(hwconfig);
>  	struct i915_vma *vma;
> @@ -88,8 +133,13 @@ static int guc_hwconfig_fill_buffer(struct intel_guc_hwconfig *hwconfig)
>  	ggtt_offset = intel_guc_ggtt_offset(guc, vma);
>  
>  	ret = __guc_action_get_hwconfig(hwconfig, ggtt_offset, hwconfig->size);
> -	if (ret >= 0)
> +	if (ret >= 0) {
>  		memcpy(hwconfig->ptr, vaddr, hwconfig->size);
> +		if (verify_hwconfig_blob(drm, hwconfig)) {
> +			drm_err(drm, "Ignoring invalid hwconfig blob received from GuC!\n");
> +			ret = -EINVAL;

btw, since we are about to release blob on verification failure,
shouldn't we hexdump whole (or part of) blob somewhere for investigations ?

or maybe we should expose this blob in debugfs, and do it regardless if
it is valid or not, and just fail ioctl if blob is believed to be corrupted.

~Michal

> +		}
> +	}
>  
>  	i915_vma_unpin_and_release(&vma, I915_VMA_RELEASE_MAP);
>  
> @@ -141,7 +191,7 @@ int intel_guc_hwconfig_init(struct intel_guc_hwconfig *hwconfig)
>  		return -ENOMEM;
>  	}
>  
> -	ret = guc_hwconfig_fill_buffer(hwconfig);
> +	ret = guc_hwconfig_fill_buffer(&i915->drm, hwconfig);
>  	if (ret < 0) {
>  		intel_guc_hwconfig_fini(hwconfig);
>  		return ret;
