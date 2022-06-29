Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65097560598
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 18:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB2310E911;
	Wed, 29 Jun 2022 16:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA3710E911;
 Wed, 29 Jun 2022 16:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656519439; x=1688055439;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lBGv8tm4UfNFfFSF3cZyHNXZtykiUHHGNKM40BdRX1k=;
 b=ZLHmHf0ETVBmkhlMQeN3+Pg91dBTCUcCfOtqlwOFMofmLWzeEh89gESu
 BF2wT78llwtFcbHHJhQZlo9jViGSUZSc52vdMG811tqxHABhMh15j3IVA
 UDgRudBPox2b0oE+MdQXxB2WBkjBpA6uKi8ZgPEOtRhrqpjLHs8b503At
 QtUETIXE3E+uakYobMxOUW3jpj0fStK+4DO5ax9l/7OmtB7Ga89zhW+Jo
 WrDSeNLBMI7PVnA+S9Ppe1J+m6KOjhdmN9ESKZLC+jCSeD+5v7obCiBuC
 4q8/8Dm+u+EgEmUjoe2oyiKvKsQrxS7JCmmS/XWwJujUKV3d9Gp8+2eAn g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="280836936"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="280836936"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 09:17:19 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="647464284"
Received: from kjeldbeg-mobl2.ger.corp.intel.com (HELO [10.249.254.56])
 ([10.249.254.56])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 09:16:57 -0700
Message-ID: <91b30a9b-ae15-a79d-05a9-c111c7d0bbad@linux.intel.com>
Date: Wed, 29 Jun 2022 18:16:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 13/13] drm/i915: turn on small BAR support
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220629121427.353800-1-matthew.auld@intel.com>
 <20220629121427.353800-14-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220629121427.353800-14-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/29/22 14:14, Matthew Auld wrote:
> With the uAPI in place we should now have enough in place to ensure a
> working system on small BAR configurations.
>
> v2: (Nirmoy & Thomas):
>    - s/full BAR/Resizable BAR/ which is hopefully more easily
>      understood by users.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_region_lmem.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> index d09b996a9759..fa7b86f83e7b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -112,12 +112,6 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
>   		flat_ccs_base = intel_gt_mcr_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
>   		flat_ccs_base = (flat_ccs_base >> XEHP_CCS_BASE_SHIFT) * SZ_64K;
>   
> -		/* FIXME: Remove this when we have small-bar enabled */
> -		if (pci_resource_len(pdev, 2) < lmem_size) {
> -			drm_err(&i915->drm, "System requires small-BAR support, which is currently unsupported on this kernel\n");
> -			return ERR_PTR(-EINVAL);
> -		}
> -
>   		if (GEM_WARN_ON(lmem_size < flat_ccs_base))
>   			return ERR_PTR(-EIO);
>   
> @@ -170,6 +164,10 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
>   	drm_info(&i915->drm, "Local memory available: %pa\n",
>   		 &lmem_size);
>   
> +	if (io_size < lmem_size)
> +		drm_info(&i915->drm, "Using a reduced BAR size of %lluMiB. Consider enabling 'Resizable BAR' or similar, if available in the BIOS.\n",
> +			 (u64)io_size >> 20);
> +

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


