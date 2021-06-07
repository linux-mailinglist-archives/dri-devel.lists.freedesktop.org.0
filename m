Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF54939E629
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 20:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6481A6E0A0;
	Mon,  7 Jun 2021 18:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468136E0A0;
 Mon,  7 Jun 2021 18:04:57 +0000 (UTC)
IronPort-SDR: 8w7LPqm4q2QZ0VYmPgOfB4BYUGts0YpuL8DN8mRfVJM8KfuwpflybjsyeObMw06LpQg4+hEgHv
 EY+GpthkkXZQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="202815097"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="202815097"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 11:04:56 -0700
IronPort-SDR: 0gTyP2Nepbqmq2OO4YgypaDj+xWhBN6TyPQ0w3FqyBV0eZvWFPoGZlsEjlHVOECeFlh34a56LH
 uUr35wLXvxvw==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="481626474"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 11:04:55 -0700
Date: Mon, 7 Jun 2021 10:57:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 10/13] drm/i915/guc: Kill guc_clients.ct_pool
Message-ID: <20210607175755.GB14577@sdutt-i7>
References: <20210607180356.165785-1-matthew.brost@intel.com>
 <20210607180356.165785-11-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607180356.165785-11-matthew.brost@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 07, 2021 at 11:03:52AM -0700, Matthew Brost wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> CTB pool is now maintained internally by the GuC as part of its
> "private data". No need to allocate separate buffer and pass it
> to GuC as yet another ADS.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com> #v4
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  | 12 ------------
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 12 +-----------
>  2 files changed, 1 insertion(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 4fcbe4b921f9..6e26fe04ce92 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -26,8 +26,6 @@
>   *      +---------------------------------------+
>   *      | guc_clients_info                      |
>   *      +---------------------------------------+
> - *      | guc_ct_pool_entry[size]               |
> - *      +---------------------------------------+
>   *      | padding                               |
>   *      +---------------------------------------+ <== 4K aligned
>   *      | private data                          |
> @@ -40,7 +38,6 @@ struct __guc_ads_blob {
>  	struct guc_policies policies;
>  	struct guc_gt_system_info system_info;
>  	struct guc_clients_info clients_info;
> -	struct guc_ct_pool_entry ct_pool[GUC_CT_POOL_SIZE];
>  } __packed;
>  
>  static u32 guc_ads_private_data_size(struct intel_guc *guc)
> @@ -68,11 +65,6 @@ static void guc_policies_init(struct guc_policies *policies)
>  	policies->is_valid = 1;
>  }
>  
> -static void guc_ct_pool_entries_init(struct guc_ct_pool_entry *pool, u32 num)
> -{
> -	memset(pool, 0, num * sizeof(*pool));
> -}
> -
>  static void guc_mapping_table_init(struct intel_gt *gt,
>  				   struct guc_gt_system_info *system_info)
>  {
> @@ -161,11 +153,7 @@ static void __guc_ads_init(struct intel_guc *guc)
>  	base = intel_guc_ggtt_offset(guc, guc->ads_vma);
>  
>  	/* Clients info  */
> -	guc_ct_pool_entries_init(blob->ct_pool, ARRAY_SIZE(blob->ct_pool));
> -
>  	blob->clients_info.clients_num = 1;
> -	blob->clients_info.ct_pool_addr = base + ptr_offset(blob, ct_pool);
> -	blob->clients_info.ct_pool_count = ARRAY_SIZE(blob->ct_pool);
>  
>  	/* ADS */
>  	blob->ads.scheduler_policies = base + ptr_offset(blob, policies);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index 251c3836bd2c..2266444d074f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -295,19 +295,9 @@ struct guc_gt_system_info {
>  } __packed;
>  
>  /* Clients info */
> -struct guc_ct_pool_entry {
> -	struct guc_ct_buffer_desc desc;
> -	u32 reserved[7];
> -} __packed;
> -
> -#define GUC_CT_POOL_SIZE	2
> -
>  struct guc_clients_info {
>  	u32 clients_num;
> -	u32 reserved0[13];
> -	u32 ct_pool_addr;
> -	u32 ct_pool_count;
> -	u32 reserved[4];
> +	u32 reserved[19];
>  } __packed;
>  
>  /* GuC Additional Data Struct */
> -- 
> 2.28.0
> 
