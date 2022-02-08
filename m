Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D006C4AD515
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 10:36:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D9410E436;
	Tue,  8 Feb 2022 09:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD4010E42F;
 Tue,  8 Feb 2022 09:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644313007; x=1675849007;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yMJYV5fPjd+nFrrPCn4pJ9QTO2c+P3sRo9n7hyZF838=;
 b=Nh0TTf9t49eMBpFD7va7DQfOpZ+cScfTj+aT5tCEJNGJjJ/OLE3Jkcze
 CvPUuTU8pdGl9/O3zwTw5vyFEAx8tl1xL5z8HhOVa6ucQxDtFBDE/nIrb
 agJEWOLui+IxSnbhadL3hXEV+J67ar85WXQ2ICbXHfilG7etuvMEpUrT6
 FxPH3og8f8mAOFo4kEeI+YS+vIP+kmgCTCm7/+V2GeQi3XUHTZSIBHJXW
 arYEpg6qlroYwsx/6OxQRBvR/LEHKxzY6z4u/NnLaty9FLPyiSIEVAxLU
 AIPfF07V1lfOEYxUO/4bJzqiHaI3yk/XzR6rO/jPk/hQURoUfzkhR8LhE A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="335313505"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="335313505"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 01:36:46 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="484752303"
Received: from kgonza2-mobl2.gar.corp.intel.com (HELO [10.213.198.226])
 ([10.213.198.226])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 01:36:45 -0800
Message-ID: <f23cd56f-786f-358a-c363-70417d10fcab@linux.intel.com>
Date: Tue, 8 Feb 2022 09:36:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/guc: Verify hwconfig blob
 matches supported format
Content-Language: en-US
To: Jordan Justen <jordan.l.justen@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
References: <20220207192854.862959-1-jordan.l.justen@intel.com>
 <20220207192854.862959-5-jordan.l.justen@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220207192854.862959-5-jordan.l.justen@intel.com>
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


Hi,

Commit message please.

Will GuC folks be reviewing this work?

Quick sanity check maybe makes sense, given data is being "sent" to 
userspace directly, I am just not sure if it is worth having in 
non-debug builds of i915. Though I will agree not having it in 
production then largely defeats the purpose so dunno. Effective 
difference if GuC load fails versus userspace libraries failing to parse 
hwconfig?

On 07/02/2022 19:28, Jordan Justen wrote:
> Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 26 +++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> index ce6088f112d4..695ef7a8f519 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> @@ -71,6 +71,26 @@ static int guc_hwconfig_discover_size(struct intel_guc_hwconfig *hwconfig)
>   	return 0;
>   }
>   
> +static int verify_hwconfig_blob(const struct intel_guc_hwconfig *hwconfig)
> +{
> +	if (hwconfig->size % 4 != 0 || hwconfig->ptr == NULL)
> +		return -EINVAL;

So individual item size is minimum one u32, or zero? Document that in 
patch 3?

> +
> +	struct drm_i915_query_hwconfig_blob_item *pos = hwconfig->ptr;

kbuild robot told you about mixing declarations and code already. :)

> +	u32 remaining = (hwconfig->size / 4);

Blank line here and braces not needed.

> +	while (remaining > 0) {
> +		if (remaining < 2)
> +			return -EINVAL;
> +		if (pos->length > remaining - 2)
> +			return -EINVAL;
> +		remaining -= 2 + pos->length;
> +		pos = (void *)&pos->data[pos->length];
> +	}
> +
> +	DRM_INFO("hwconfig blob format appears valid\n");

Probably debug level at most.

> +	return 0;
> +}
> +
>   static int guc_hwconfig_fill_buffer(struct intel_guc_hwconfig *hwconfig)
>   {
>   	struct intel_guc *guc = hwconfig_to_guc(hwconfig);
> @@ -91,6 +111,12 @@ static int guc_hwconfig_fill_buffer(struct intel_guc_hwconfig *hwconfig)
>   	if (ret >= 0)
>   		memcpy(hwconfig->ptr, vaddr, hwconfig->size);
>   
> +	if (verify_hwconfig_blob(hwconfig)) {

Merge under the "ret >= 0" branch above?

> +		DRM_ERROR("Ignoring invalid hwconfig blob received from "
> +			  "GuC!\n");

Use drm_dbg/drm_err so the log is tied to a device in multi-gpu systems.

Also keep the string on one line as per kernel coding style guide.

Regards,

Tvrtko

> +		return -EINVAL;
> +	}
> +
>   	i915_vma_unpin_and_release(&vma, I915_VMA_RELEASE_MAP);
>   
>   	return ret;
