Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6198798E2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 17:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA59710E767;
	Tue, 12 Mar 2024 16:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GiZY8gd7";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EA810E767;
 Tue, 12 Mar 2024 16:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710260697; x=1741796697;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CERhUV5SC6i7rQBQlwwfmQ+oaJD19NO9ttg+S53flCw=;
 b=GiZY8gd71frdzur425VCwv7JzB7lZdxTqqRFRL1YT2P4ZOWA0C26gvrT
 8a5s83tYZsBvIdLax/ijyLLv3B1kEZQNPXW9hU/hTnB8XQToK7yubCzfR
 KdRqZ7NLKt4nW2PmC4dVrOaG7IsLxSdJjLFdW3xCHWXqhfCZir0iB6m6f
 aGILSlpLBkaQsBaQwrM/rtSwmmwoc88PqXf5L23802+lAR6Wbl2Xt7mud
 8sid65m4ha2QH8D6RPYNuov3G9ZHRsZm2kldBtFnFoI7vm4ultfZUGam8
 e1kpumHThtnP36vtFsngigv1ptK2iYcdoU8DumA/2+vgsBWXrB1aWNkGA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="16382372"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16382372"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 09:24:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11496834"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 09:24:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 09:24:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 09:24:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 09:24:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ed7yKg4dUmUK74gMAcBYtUAgmgQgm0atOEXE6YgShuk20Gaj41J2XT16T0rW8mKZAkmK3s4w9vHX37dcO5QfBKjUfsgOpbUoOgM6LxEge6ubVuNOkMpES5A1MB50gNNe31bD/IaTV1QiE5mtbuAeSCZePWZPpeme4jZ7RM4EKHWoofeR5tDubFTTL4zgnO8fIZWXzX6nfNW00Q8/PAxrApalbS725IHwjrCZqqCG/1i0aeJms8AxyViTqe2WihJlHcGxUcLsvCU7Wpkb5xLfeeTuAKbuqKE2YD58pR552j6KVPHuGV4grSUYDVZ0GlA1RJG72tOMOfO2zrICwmRE4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhHf1sAczdiIFXuJWlNQhjj9BvJZaLhIO2MXBrcwVSs=;
 b=HgiDbx6jZN5+e0HPi3979k9YAJMDqkGsLZi+DGcbi73YGpmZNVSiodKnQmmcx2DD+TkEzi9xYUxWGO7/dLt2uCpTD+pKgyipHxTTVcu2TOjnWfz6BRzs84HKE4IuQJmWob8dsCT8ISq8X7RyCYwEjnqB3FmLCfqERyu7fIU3YDelZisfVZT0Ey3e0Ci5/vPfaCnaeZFzmeShfpSsNQ5ZB/dYra3OnpKWwJ+P+XTyyZQRHqGtckKpXaEcAftnOX0TpXNO03xK2RrJuz19zJvQcnlla0brlvRL3ZBJzXeVbf95Ud1AiOfoH1ThONCDP7s76DqjWbPt3EpLKrM1gYqa8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB8326.namprd11.prod.outlook.com (2603:10b6:806:379::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Tue, 12 Mar
 2024 16:24:52 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7386.016; Tue, 12 Mar 2024
 16:24:52 +0000
Date: Tue, 12 Mar 2024 09:24:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-GFX@lists.freedesktop.org>, <DRI-Devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/guc: Update w/a 14019159160
Message-ID: <20240312162449.GH718896@mdroper-desk1.amr.corp.intel.com>
References: <20240308020129.728799-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240308020129.728799-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR03CA0176.namprd03.prod.outlook.com
 (2603:10b6:a03:338::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 302899f8-9c06-437c-802d-08dc42b0f1a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R+SMNcz6H78lZ3M+lh8idKDaXSLKlbNqfHA+DZM+I8vqRMxxCdhgT7nwTAqqybq6RLXTmfdDCnTFkmVTMaYlOQg/8S7APilsjOQy3BC/F4e+G8+mdG9tYZMbXt1EpQFsB+NQdW6BvfeD99+MGucGhi+5xBPHTGST0pAh7PoKSkLGj/mNkkiHBXQbVL6JT5rclKAsGJEwaeNvcGP3C319g7TJ/UjSeVnQKdNZ2M5ZguizPb51jGYkDQMNCnYOojGxeoyYuxfv4g7hacudO3S6q5NgQIbBO5zOWevg1U6AonotYSplitsSkU3ruybUvKAB3X+iD7H6fghd+4T8oxJpQxszn1sVVPcoR0TvIy6s2DKtypGtuQOxAFm45MVdAyd9EZ66ghZ24Ohq/uw3CFl+4AXEe6vSy7fK+HzmdcR/tDfGIXoDa4rXla3qsF4Kx2J5E+BxD881sRkF4kyAKfBIiKu98CDhj0mrQdvktMklHpt3xPizDLT2Rr8Kl5OtRPSs2rgvFD52rc7UKeKmfInQuOmbSmvV6k7RzZiHkmaKZAci06gOBg/UmPXG7WZaUU5ZMnyvkTZY9cIFeHmqCk7jlPh9nyQYDqIcDIe3l3WgrVvi/yWTESg40loCo9AImDRTDHkgD+IbOs4TQ/VUJN179sCF9BcoEH5mduoIep1uG+g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QGrFL3QwUF5sx+0u4ArhkP3YQQYqRFnxW0PXindjsL+B9eWxKrzPrsPA8nNQ?=
 =?us-ascii?Q?gYMnnO+MPjkgMKvZnyiuDVKXGm74JBebg1fepkYrVbwLbKipAMpMUD+byecG?=
 =?us-ascii?Q?npvYDJ6orp+bVkbEkHim/eK+4OJQGkXLCje+oVrcaPXxdcM5QVVpolQw5Ta7?=
 =?us-ascii?Q?ibn675J5nfWCDnyxa7MQS67k0yoE5ZyDkTtTrErkti86OHqGoCNlNtFsLmDn?=
 =?us-ascii?Q?zH1I4EUQnADlX35B+m6leserxDAfRtj8IQaqj4Bl1RKsZVyxBXYgqppYwJU7?=
 =?us-ascii?Q?j5nbKS33MNl++AUD13r1MX1rA2batWT/L31QPselHqzsKSkcBdAWuFV+oUXM?=
 =?us-ascii?Q?RBntsQ8Gbem1pVXCVWc9ywWkExgTP+BspzvL+KVJlNSwUQ3HJaI8hF3dMSWF?=
 =?us-ascii?Q?lNr1VWEnrD6wVSLiOL2E9bEwozz2jev6eWtT/LsVepoWo6wbmDqb2mPcRgcl?=
 =?us-ascii?Q?9Rebe9RqIPv4LWcd5rixJJsRtfCPoC4RuFnFr4Xr5FDMsAiAdz4mfbGw++ZY?=
 =?us-ascii?Q?6Cl5GwHjJDfDuio34YE1Qz3WZF8cPdc/Zw8mE7+4yDjYmMRNBBQlaf940O7l?=
 =?us-ascii?Q?gjNFp1cyFHAW/XYV6yTrwY6ziyQ/dingpvNvj5+Js7OhHj/OubWcUXblgmXh?=
 =?us-ascii?Q?Y240o3naHNi7mdKgKIoSg1zNLXPRacGeGG443f8LUP+ifDq944Qm9rEdyu2k?=
 =?us-ascii?Q?IhNbw+90kjKgMuj4YRkrhOfLwtRXtOeicRCZtKQxHXnLAlznM5K/4R4JgxpB?=
 =?us-ascii?Q?mPwZmhXW+sA1qd3ErC4zYmIgyPwOZcbhAq15aiDW9xfr9yO+pP65ztSGJbU2?=
 =?us-ascii?Q?eWHMZeX3Mh2hXQA3YUAgsHjgX7jP3Or9+txgo3Q/7MbStSO++r0A+Snm4U0V?=
 =?us-ascii?Q?zrSMKbT+RABdqJVNdjAlfkJWC07JG6G74qGich4yzUhcg5xs5UtpWREPf4C3?=
 =?us-ascii?Q?7uBgf1fOGVEYFHX1eI54Ucfd22u1sQAK6MmamGY/DWxGD2VfxhTVzO/JYpqw?=
 =?us-ascii?Q?Ip7AJu/iP6VrYaQpnyDHl5X/+qGHUl+s56L/+0PTxgto29mXXomcZgovv35x?=
 =?us-ascii?Q?xabTpnt8TCAzH5QAOTHId0u2xQGzbKZfcPtFQWO0yWdckcqcbSrfS+HCNpDs?=
 =?us-ascii?Q?T5cUxB9E04jBJuvUoYOxSbwJP5ogfOnk0rbZpxkK2Ap01x+xxZAD0IVJyg+N?=
 =?us-ascii?Q?coh55LTQOSPDzS3lQ2Zu9LbODCZuZvTUdrp0NC7gy12zoAC9BUIbcxNmGH94?=
 =?us-ascii?Q?eomTxYAWya5BGye/weig9WVn/RKNV6aRCc5fQ63JXt9GqiOJ35JBrbnAqcm7?=
 =?us-ascii?Q?xactx+57Tv9nEzEIteErm8KE/B3aqC/ZWlpk7pOt//xs94ANflVm5KGGqokz?=
 =?us-ascii?Q?0JafZ27ju4rA7ssZlPUxcWekvC4gi/I9z8oXN3swTOIoVb1nm0RJNLnhm0vs?=
 =?us-ascii?Q?5nEY8YKsNfWpQ+G1MWcG4IJ7NSeFVLDTJKqaZi+QyzOQpPDUnLzZb8yqD2uI?=
 =?us-ascii?Q?8+t1JncdDaL0Z0msr90PyOqRNjuq9igBvNZw+odj2f0hb+vxRQ7psjb/54U7?=
 =?us-ascii?Q?GRfJHvBg7UaMB3ZN7lKGp2CasqKH0LV0oGQb1u8ab5gBUu0UQFIW9nLxxPEk?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 302899f8-9c06-437c-802d-08dc42b0f1a7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 16:24:51.8436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/h+o+xVIvAZcuTI07zELa01ZlrW5goYFEWB4uJMPr8wAitPT/vbncWLGhYO2dOuDIXokRqiLegN7j5mC5QtcEnvhJiMDVvcTxE0ZLZHScQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8326
X-OriginatorOrg: intel.com
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

On Thu, Mar 07, 2024 at 06:01:29PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> An existing workaround has been extended in both platforms affected
> and implementation complexity.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  3 ++-
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  3 ++-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 21 ++++++++++---------
>  3 files changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> index bebf28e3c4794..3e7060e859794 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> @@ -105,7 +105,8 @@ enum {
>   * Workaround keys:
>   */
>  enum {
> -	GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE				= 0x9001,
> +	GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE				= 0x9001,	/* Wa_14019159160 */
> +	GUC_WORKAROUND_KLV_AVOID_GFX_CLEAR_WHILE_ACTIVE			= 0x9006,	/* Wa_14019159160 */
>  };
>  
>  #endif /* _ABI_GUC_KLVS_ABI_H */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 0c67d674c94de..4c3dae98656af 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -296,7 +296,8 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
>  
>  	/* Wa_16019325821 */
>  	/* Wa_14019159160 */
> -	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
> +	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)) ||

From what I can see, this workaround is also needed on Xe_LPG+ (12.74)
now.


Matt

> +	    IS_DG2(gt->i915))
>  		flags |= GUC_WA_RCS_CCS_SWITCHOUT;
>  
>  	/*
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 5c9908b56616e..00fe3c21a9b1c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -815,23 +815,23 @@ guc_capture_prep_lists(struct intel_guc *guc)
>  	return PAGE_ALIGN(total_size);
>  }
>  
> -/* Wa_14019159160 */
> -static u32 guc_waklv_ra_mode(struct intel_guc *guc, u32 offset, u32 remain)
> +static void guc_waklv_enable_simple(struct intel_guc *guc, u32 *offset, u32 *remain, u32 klv_id)
>  {
>  	u32 size;
>  	u32 klv_entry[] = {
>  		/* 16:16 key/length */
> -		FIELD_PREP(GUC_KLV_0_KEY, GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE) |
> +		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
>  		FIELD_PREP(GUC_KLV_0_LEN, 0),
>  		/* 0 dwords data */
>  	};
>  
>  	size = sizeof(klv_entry);
> -	GEM_BUG_ON(remain < size);
> +	GEM_BUG_ON(*remain < size);
>  
> -	iosys_map_memcpy_to(&guc->ads_map, offset, klv_entry, size);
> +	iosys_map_memcpy_to(&guc->ads_map, *offset, klv_entry, size);
>  
> -	return size;
> +	*offset += size;
> +	*remain -= size;
>  }
>  
>  static void guc_waklv_init(struct intel_guc *guc)
> @@ -850,10 +850,11 @@ static void guc_waklv_init(struct intel_guc *guc)
>  	remain = guc_ads_waklv_size(guc);
>  
>  	/* Wa_14019159160 */
> -	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))) {
> -		size = guc_waklv_ra_mode(guc, offset, remain);
> -		offset += size;
> -		remain -= size;
> +	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)) || IS_DG2(gt->i915)) {
> +		guc_waklv_enable_simple(guc, &offset, &remain,
> +					GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE);
> +		guc_waklv_enable_simple(guc, &offset, &remain,
> +					GUC_WORKAROUND_KLV_AVOID_GFX_CLEAR_WHILE_ACTIVE);
>  	}
>  
>  	size = guc_ads_waklv_size(guc) - remain;
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
