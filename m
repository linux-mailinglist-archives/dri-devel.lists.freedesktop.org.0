Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACF738F75F
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 03:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6958D89993;
	Tue, 25 May 2021 01:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1270389993;
 Tue, 25 May 2021 01:08:34 +0000 (UTC)
IronPort-SDR: 1c3VAwDZtUCsUN0hR8Jq2wTi6jBC/F1GbxrwrR8D+5oeXpQ8QEatlrwVzs7V1+NKQN2iW5xIXA
 MNpCFNlYEYQA==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="263276317"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="263276317"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 18:08:33 -0700
IronPort-SDR: i8qgBLvxEd31rMcMqjLLmYnMNO3S1HMTbDkiNYQTXdQGXb85A2Zha5nAs+L8b1+GjP09oUkd/5
 oPtMQeAcC3Og==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="479049117"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 18:08:32 -0700
Date: Mon, 24 May 2021 18:01:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 28/97] drm/i915/guc: Kill guc_clients.ct_pool
Message-ID: <20210525010123.GA25587@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-29-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506191451.77768-29-matthew.brost@intel.com>
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
Cc: tvrtko.ursulin@intel.com, daniele.ceraolospurio@intel.com,
 jason.ekstrand@intel.com, jon.bloomfield@intel.com, daniel.vetter@intel.com,
 john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 06, 2021 at 12:13:42PM -0700, Matthew Brost wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> CTB pool is now maintained internally by the GuC as part of its
> "private data". No need to allocate separate buffer and pass it
> to GuC as yet another ADS.
> 
> GuC: 57.0.0
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  | 12 ------------
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 12 +-----------
>  2 files changed, 1 insertion(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 648e1767b17a..775f00d706fa 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -25,8 +25,6 @@
>   *      +---------------------------------------+
>   *      | guc_clients_info                      |
>   *      +---------------------------------------+
> - *      | guc_ct_pool_entry[size]               |
> - *      +---------------------------------------+
>   *      | padding                               |
>   *      +---------------------------------------+ <== 4K aligned
>   *      | private data                          |
> @@ -39,7 +37,6 @@ struct __guc_ads_blob {
>  	struct guc_policies policies;
>  	struct guc_gt_system_info system_info;
>  	struct guc_clients_info clients_info;
> -	struct guc_ct_pool_entry ct_pool[GUC_CT_POOL_SIZE];
>  } __packed;
>  
>  static u32 guc_ads_private_data_size(struct intel_guc *guc)
> @@ -67,11 +64,6 @@ static void guc_policies_init(struct guc_policies *policies)
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
> @@ -157,11 +149,7 @@ static void __guc_ads_init(struct intel_guc *guc)
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
> index 95db4a7d3f4d..301b173a26bc 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -269,19 +269,9 @@ struct guc_gt_system_info {
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
