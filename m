Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DDA258938
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3576E5C3;
	Tue,  1 Sep 2020 07:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6531C6E15E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 05:07:14 +0000 (UTC)
IronPort-SDR: 1a6S4D6PQBJ7Dokty+aNRH6f9a8tKHEHpyqXdnCl4L97QI8zvFibQZBjVa9pUuh6cPFvqyEMNE
 ZOBNahIXGPYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="156365284"
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="156365284"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 22:07:13 -0700
IronPort-SDR: 5BrF89Ds56JAWzIPrEEZmlupmHJC7RcnAmgHBryoMQ/RHDWLrAw0mSwK4luS59h7SpNQkTgV2g
 Ewe6pQi4EbPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="325201343"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by fmsmga004.fm.intel.com with ESMTP; 31 Aug 2020 22:07:12 -0700
Subject: Re: [PATCH v1] iommu/vt-d: Move intel_iommu_gfx_mapped to Intel IOMMU
 header
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, David Woodhouse <dwmw2@infradead.org>,
 iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>
References: <20200828161212.71294-1-andriy.shevchenko@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <5e9fef6a-7f75-d781-a39b-5cedbc08f3e2@linux.intel.com>
Date: Tue, 1 Sep 2020 13:01:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828161212.71294-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 01 Sep 2020 07:31:54 +0000
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
Cc: baolu.lu@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On 8/29/20 12:12 AM, Andy Shevchenko wrote:
> Static analyzer is not happy about intel_iommu_gfx_mapped declaration:
> 
> .../drivers/iommu/intel/iommu.c:364:5: warning: symbol 'intel_iommu_gfx_mapped' was not declared. Should it be static?
> 
> Move its declaration to Intel IOMMU header file.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   include/drm/intel-gtt.h     | 5 +----
>   include/linux/intel-iommu.h | 1 +
>   2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/include/drm/intel-gtt.h b/include/drm/intel-gtt.h
> index 71d81923e6b0..abfefaaf897a 100644
> --- a/include/drm/intel-gtt.h
> +++ b/include/drm/intel-gtt.h
> @@ -5,6 +5,7 @@
>   #define	_DRM_INTEL_GTT_H
>   
>   #include <linux/agp_backend.h>
> +#include <linux/intel-iommu.h>
>   #include <linux/kernel.h>
>   
>   void intel_gtt_get(u64 *gtt_total,
> @@ -33,8 +34,4 @@ void intel_gtt_clear_range(unsigned int first_entry, unsigned int num_entries);
>   /* flag for GFDT type */
>   #define AGP_USER_CACHED_MEMORY_GFDT (1 << 3)
>   
> -#ifdef CONFIG_INTEL_IOMMU
> -extern int intel_iommu_gfx_mapped;
> -#endif
> -
>   #endif
> diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
> index 64fa5c56c825..fbd3bb64649b 100644
> --- a/include/linux/intel-iommu.h
> +++ b/include/linux/intel-iommu.h
> @@ -794,6 +794,7 @@ extern int iommu_calculate_max_sagaw(struct intel_iommu *iommu);
>   extern int dmar_disabled;
>   extern int intel_iommu_enabled;
>   extern int intel_iommu_tboot_noforce;
> +extern int intel_iommu_gfx_mapped;
>   #else
>   static inline int iommu_calculate_agaw(struct intel_iommu *iommu)
>   {
> 

Looks good to me.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
