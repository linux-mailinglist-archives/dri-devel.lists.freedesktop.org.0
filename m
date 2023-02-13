Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A45694FAA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 19:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD0A10E689;
	Mon, 13 Feb 2023 18:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7294210E067;
 Mon, 13 Feb 2023 18:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676314036; x=1707850036;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Fro/dlnKYaaiUq3rG6PwShyf4o//ac9GN234uVy0qqQ=;
 b=clrml0mw/+BRkiaIaeey8127rL/e7eUEUwxr4Bv12Nl1ejhjQj190pTC
 GI+2fzw1L0JMp+JlwMBMEwWGQyVFqtwODHJMxN1OUVS61GXWBNgRIk4Nz
 9w9NGnjJciKiuycDwuWncmkxjUvis7Zx7bewJliZefm2DDEQRe1zkwCTw
 f4u3doduhovjluKFXXijgNCqMhOdJUO61q2BYj81PX90pP8BkjRQIsD06
 LuI25NolDaePokyjGUOCcxD1igk8R76nHpP1NjXv8vmauc+qoPsH5eaI9
 A/NNq4MVoVWOuPZsPY6qSQ9752XMFltGbdN0kJJlDizABrMByHRVjQDVG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="310599316"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="310599316"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 10:44:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="997786718"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="997786718"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2023 10:44:25 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 13 Feb 2023 10:44:24 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 13 Feb 2023 10:44:24 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 13 Feb 2023 10:44:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjTBaDLite/C1p6RXv8yc47Zy3NgTU1emttuJ2XmlvRdo3Pb9NBh3PUOnx3VYqwUfanivzFTodYH9jkmCtPKZymjwQ4Uay/Ki7YXQXtfQWQqz45cvax3si4Wpyt3IOufjeYHHb2tWfqsJBri7nv9tikOHQ26li7Tjh1vGyVIlplCLxtI2O/binSJnZbeKt7sJ4ugr8oQ4lmOMTRhIZXiQJ5acyMGGh/GwNdsq+DpHSuBLNySRr2EOApf2b5kJfssJU9v24Xw4EU1VdEq7b5Y/sp5ozrplJrmg33dR9WV/jY8ueH3A/YNSfQ78dSw7vpPDZxcFe8F/HoAl+dphjOYfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coRRo8QWq5yGqfNk4tAglw44NdmrQ9lFc/boGMZcm1k=;
 b=h41Ozih6FdUe6qLb+CeQ38rKhKT/LnBathtKlGfwkUu6SJTjnzYZc+R65JAWerwiFLr7KwQzifCwu42s5au9gbEPdlyCSRR/dgGRONudJ0meWRVlBSbzzO0AgmgZ3le06CheLHQFBMhb8CVvoHm6u7iPvnqIFl8VQ3mhpgc2vIqkEIGLV7yjbHfvtOo5RZTtKEZorA+4EQD44xQmVz3RrYWuJGNvnQXXtn5/AfrjfUsISNgs2SkAeltjjayOezuqaU7fJ8+3X685o4M2Ua+fO3+hH2DIfWKMoxoqmIZijeViKy0bRKI/uHeYoV+fHjuNJJpez2ZxRZhMZDNrCUCSHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY8PR11MB7946.namprd11.prod.outlook.com (2603:10b6:930:7e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.24; Mon, 13 Feb 2023 18:44:22 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 18:44:22 +0000
Date: Mon, 13 Feb 2023 10:44:19 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v3] drm/i915: Consolidate TLB invalidation flow
Message-ID: <Y+qFA9wDVO31YuHq@mdroper-desk1.amr.corp.intel.com>
References: <20230201165146.4056691-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230201165146.4056691-1-tvrtko.ursulin@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0080.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::21) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY8PR11MB7946:EE_
X-MS-Office365-Filtering-Correlation-Id: aa8b8592-b83b-4600-abea-08db0df252b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AOMxcL6NpbEXwjKdiQ9qabAoFxlO2+JWhmsB/j5zPH6i8Q0BNjjPBxg5aG5cS72hmUzpoBZEX58vmYVtZ5Fc6XdWkfxZb7QZXn593bC4Y0tqKIvJMQb9acVq7w5gxRC8HmwtB6yI2oNfw8zN1dHupXHf04kEO6PPgJpDmEVYTeghNkIHINOkQMkGoBzYEMF3WnIHOt2JPf4We9C7NwvNd6zjF3K3DzM/YdfUUjRC63TyoeWwZfF3YrEoT366Ps6BYKpPoaE7BR/sllq6gFWrZvbkRzgCsZ8Kqgml9ed1qXD/0vA9fY0RBPyQtb2KgoGNyHZBZ64muymYGsNs3PV1oZ40MzaMTOkIxffbBy5xzrpTBzF5yQxQFGrNj1ERcNYnCSYra+vwX0OzkOZEZibpd/LPwx60YmiNsLrItNQI20TwB/zhW5JMTEUPdG+1DYHIx9+xiTnM52LOvpsv+BcwJ1X/CcDB6oIdqSDzpw594QgSrrCLP+dF1BeCOfO/K+CzjP2N7+ZZhDwrNARbdkd9dyaarPwaufRluGjlLnaopiBHkGN48bECeUGMOR6QWsW2ozwFyq72bF3vxUKfvmsHzAT5p9bW1rrkI2HeuoIe7lYRJLE2H84VKrVahBjKoBHwHS/Eh8e/BuEO2llWHQHv87RiZeKmhn3iRWNODIAg5GYbB6SCfATf//R/pBXVRwsh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(39860400002)(376002)(396003)(346002)(451199018)(38100700002)(66946007)(82960400001)(41300700001)(8936002)(4326008)(66476007)(66556008)(8676002)(6916009)(2906002)(86362001)(5660300002)(30864003)(316002)(83380400001)(54906003)(26005)(6666004)(6506007)(186003)(6512007)(478600001)(6486002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qPz/E88NhZBLQfn0fbWZwrugldXVaaG1cCSNwS4eE+StTrORm+xIVURyBp9i?=
 =?us-ascii?Q?YelWRYaL4dc2HmXXzS/sfgFhkK3jwAhTfW4/zGvtcvLtytjFJSIB3J8YNTwD?=
 =?us-ascii?Q?QN0au2kenCoE4KVq8D8ihyL4jv+AyZHU+wN07wMzOrL0e3/R4Qv1TWmBxOEs?=
 =?us-ascii?Q?d+Lkgc+zuL4WHD9US61VWgQnifRxETxsg6VkkNFUXjgwOMlZx8RG9/bTaSdv?=
 =?us-ascii?Q?ZdB40HqckNTsrCK+y+eZoNYz2Ilmym+Oz39d49f2M5XKv/rX0ENp5Z3nqxl7?=
 =?us-ascii?Q?M8NbvGla2e6cKNQ2Kh7YdkDVPMiXhINTX+EIYtvxc3TizpipUTa/47UgOm3g?=
 =?us-ascii?Q?Okfpd85LMCVweB7OPCnruZo/rabZ33dRWufnkgPeJfMl8qgRWaEi9VwLq7zw?=
 =?us-ascii?Q?rPIq6uE80XfIlhEGeNZJzDCmXly1Rv9Pe6mKtrMPG++AzTVb7cgr/dC3nq/7?=
 =?us-ascii?Q?zAmKbJGhphjwHgYhmhg7sPNl2LCz4QFjS/VJc2evSRwG1n11Y0/HIKRixEAS?=
 =?us-ascii?Q?ThnG9+9cmWToLkYV8eeVBbaTpBJgOT4iSQd9aG1lRDzEB85WgyWEGLGx7TTj?=
 =?us-ascii?Q?ZfdBaQML85qZnFnIWTCdfoMGYM1K20UB+YmcErfMWiGckbplhNySQ1YeFeau?=
 =?us-ascii?Q?Pc/Bdb+yrEX3qYsvRXtTlUnz7eG3yKnYrpL8bj4NbBD1q9RxgFycy8GAd1dh?=
 =?us-ascii?Q?0pCg51uRBkqVup/lkcB/VVvC2ek1Xms75Lezg6FyM0wyODEjuSb86rbE753U?=
 =?us-ascii?Q?V+4cZ1R1QM+0Y4S8zlsOctjmUOfpHto7+KD7EDoWLW/3lO11Mj5MV086p67I?=
 =?us-ascii?Q?lQ7TF3WmQNuPrjgHm/Mgc/jH0QpB1H4MITWPKMG9AdRynfJCWp0cFW7dF7UB?=
 =?us-ascii?Q?qCFeRwPcOhB/TLRWGM1KuRYCCnERrRlmuKn2bFTca+T6S+2GwOebsJELsxYJ?=
 =?us-ascii?Q?aLf7jCWH59ENGd6hVyGo8mrTGuj/SQXXRK65hY5ro1ysaM1j3+D7R1a+PoSq?=
 =?us-ascii?Q?9ohJRQfj19CRdisEoQG6R4CVyDaqnY4pcYnK6ovrygcXPpjWq/4RszbnBcZl?=
 =?us-ascii?Q?8EsR8afbh4rYfu55ClxoXMyh946n3tJ9/d7L5aWrQ3i7a6/oPvZNUTdJFUKA?=
 =?us-ascii?Q?0kONtNr/z98tt5+12fv7zV6xo45G/dS8jx10AAfRyqvghuSNES4lp2Qdh3HK?=
 =?us-ascii?Q?+Kny/oTmGTefCsg6hI3O6m/5MilrJbKY715bXyUGur7xNOTvNYuKWlUAEMWl?=
 =?us-ascii?Q?owyFI3YHHb8dEvROt4MqwSHQtRY+NegUZNl1T4ApCQ1DZgO6ITCtrb/sAkbH?=
 =?us-ascii?Q?ogz/M0qyTO2VoI9zAcV90ahuBgYWz70wQpspUoLwe+wfF3KkuTE5jRtKlobg?=
 =?us-ascii?Q?WH2QWZcCbeYuGF9TJOqtr9m6Y88fzJLcPmmfyRqk8uL09ef+JhTwb2bJx9md?=
 =?us-ascii?Q?B1ZJrsuX21zkHwEvpQJtP5bZ0YfhM9MVmaSVVH+Lp+pwjB0tD9kIdPyHX5GZ?=
 =?us-ascii?Q?IzChkitJB0kSzS3J2LYzBmxsGmBbnY6XQcXJUWV81eBbQ2846agyK6sreKN8?=
 =?us-ascii?Q?xLv+ANfC9G8nV8KA90JkcX20cRHT8H9oesUqJGsPUfeUH2XV9NqsvAfoOL2W?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8b8592-b83b-4600-abea-08db0df252b6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 18:44:22.5726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/tIshc+uOwqcUZils47QSGewiiUiIyOxGUC3jmVpZIVSRS7Rexdy5+n8fDIweaIVx+GkOY1KGpNmO9VbAp71Hrc4vDKxf0kd7kbYGHpP4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7946
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
Cc: Intel-gfx@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 01, 2023 at 04:51:46PM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> As the logic for selecting the register and corresponsing values grew, the
> code become a bit unsightly. Consolidate by storing the required values at
> engine init time in the engine itself, and by doing so minimise the amount
> of invariant platform and engine checks during each and every TLB
> invalidation.
> 
> v2:
>  * Fail engine probe if TLB invlidations registers are unknown.
> 
> v3:
>  * Rebase.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> # v1

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c    |  96 +++++++++++++
>  drivers/gpu/drm/i915/gt/intel_engine_types.h |  15 ++
>  drivers/gpu/drm/i915/gt/intel_gt.c           | 138 +++----------------
>  3 files changed, 133 insertions(+), 116 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index d4e29da74612..e430945743ec 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -9,6 +9,7 @@
>  
>  #include "gem/i915_gem_context.h"
>  #include "gem/i915_gem_internal.h"
> +#include "gt/intel_gt_print.h"
>  #include "gt/intel_gt_regs.h"
>  
>  #include "i915_cmd_parser.h"
> @@ -1143,12 +1144,107 @@ static int init_status_page(struct intel_engine_cs *engine)
>  	return ret;
>  }
>  
> +static int intel_engine_init_tlb_invalidation(struct intel_engine_cs *engine)
> +{
> +	static const union intel_engine_tlb_inv_reg gen8_regs[] = {
> +		[RENDER_CLASS].reg		= GEN8_RTCR,
> +		[VIDEO_DECODE_CLASS].reg	= GEN8_M1TCR, /* , GEN8_M2TCR */
> +		[VIDEO_ENHANCEMENT_CLASS].reg	= GEN8_VTCR,
> +		[COPY_ENGINE_CLASS].reg		= GEN8_BTCR,
> +	};
> +	static const union intel_engine_tlb_inv_reg gen12_regs[] = {
> +		[RENDER_CLASS].reg		= GEN12_GFX_TLB_INV_CR,
> +		[VIDEO_DECODE_CLASS].reg	= GEN12_VD_TLB_INV_CR,
> +		[VIDEO_ENHANCEMENT_CLASS].reg	= GEN12_VE_TLB_INV_CR,
> +		[COPY_ENGINE_CLASS].reg		= GEN12_BLT_TLB_INV_CR,
> +		[COMPUTE_CLASS].reg		= GEN12_COMPCTX_TLB_INV_CR,
> +	};
> +	static const union intel_engine_tlb_inv_reg xehp_regs[] = {
> +		[RENDER_CLASS].mcr_reg		  = XEHP_GFX_TLB_INV_CR,
> +		[VIDEO_DECODE_CLASS].mcr_reg	  = XEHP_VD_TLB_INV_CR,
> +		[VIDEO_ENHANCEMENT_CLASS].mcr_reg = XEHP_VE_TLB_INV_CR,
> +		[COPY_ENGINE_CLASS].mcr_reg	  = XEHP_BLT_TLB_INV_CR,
> +		[COMPUTE_CLASS].mcr_reg		  = XEHP_COMPCTX_TLB_INV_CR,
> +	};
> +	struct drm_i915_private *i915 = engine->i915;
> +	const union intel_engine_tlb_inv_reg *regs;
> +	union intel_engine_tlb_inv_reg reg;
> +	unsigned int class = engine->class;
> +	unsigned int num = 0;
> +	u32 val;
> +
> +	/*
> +	 * New platforms should not be added with catch-all-newer (>=)
> +	 * condition so that any later platform added triggers the below warning
> +	 * and in turn mandates a human cross-check of whether the invalidation
> +	 * flows have compatible semantics.
> +	 *
> +	 * For instance with the 11.00 -> 12.00 transition three out of five
> +	 * respective engine registers were moved to masked type. Then after the
> +	 * 12.00 -> 12.50 transition multi cast handling is required too.
> +	 */
> +
> +	if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50) ||
> +	    GRAPHICS_VER_FULL(i915) == IP_VER(12, 55)) {
> +		regs = xehp_regs;
> +		num = ARRAY_SIZE(xehp_regs);
> +	} else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0) ||
> +		   GRAPHICS_VER_FULL(i915) == IP_VER(12, 10)) {
> +		regs = gen12_regs;
> +		num = ARRAY_SIZE(gen12_regs);
> +	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
> +		regs = gen8_regs;
> +		num = ARRAY_SIZE(gen8_regs);
> +	} else if (GRAPHICS_VER(i915) < 8) {
> +		return 0;
> +	}
> +
> +	if (gt_WARN_ONCE(engine->gt, !num,
> +			 "Platform does not implement TLB invalidation!"))
> +		return -ENODEV;
> +
> +	if (gt_WARN_ON_ONCE(engine->gt,
> +			     class >= num ||
> +			     (!regs[class].reg.reg &&
> +			      !regs[class].mcr_reg.reg)))
> +		return -ERANGE;
> +
> +	reg = regs[class];
> +
> +	if (GRAPHICS_VER(i915) == 8 && class == VIDEO_DECODE_CLASS) {
> +		reg.reg.reg += 4 * engine->instance; /* GEN8_M2TCR */
> +		val = 0;
> +	} else {
> +		val = engine->instance;
> +	}
> +
> +	val = BIT(val);
> +
> +	engine->tlb_inv.mcr = regs == xehp_regs;
> +	engine->tlb_inv.reg = reg;
> +	engine->tlb_inv.done = val;
> +
> +	if (GRAPHICS_VER(i915) >= 12 &&
> +	    (engine->class == VIDEO_DECODE_CLASS ||
> +	     engine->class == VIDEO_ENHANCEMENT_CLASS ||
> +	     engine->class == COMPUTE_CLASS))
> +		engine->tlb_inv.request = _MASKED_BIT_ENABLE(val);
> +	else
> +		engine->tlb_inv.request = val;
> +
> +	return 0;
> +}
> +
>  static int engine_setup_common(struct intel_engine_cs *engine)
>  {
>  	int err;
>  
>  	init_llist_head(&engine->barrier_tasks);
>  
> +	err = intel_engine_init_tlb_invalidation(engine);
> +	if (err)
> +		return err;
> +
>  	err = init_status_page(engine);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index 4fd54fb8810f..8c661fe89314 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -341,6 +341,19 @@ struct intel_engine_guc_stats {
>  	u64 start_gt_clk;
>  };
>  
> +union intel_engine_tlb_inv_reg {
> +	i915_reg_t	reg;
> +	i915_mcr_reg_t	mcr_reg;
> +};
> +
> +struct intel_engine_tlb_inv
> +{
> +	bool mcr;
> +	union intel_engine_tlb_inv_reg reg;
> +	u32 request;
> +	u32 done;
> +};
> +
>  struct intel_engine_cs {
>  	struct drm_i915_private *i915;
>  	struct intel_gt *gt;
> @@ -372,6 +385,8 @@ struct intel_engine_cs {
>  	u32 context_size;
>  	u32 mmio_base;
>  
> +	struct intel_engine_tlb_inv tlb_inv;
> +
>  	/*
>  	 * Some w/a require forcewake to be held (which prevents RC6) while
>  	 * a particular engine is active. If so, we set fw_domain to which
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 001a7ec5b861..f7f271708fc7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -982,35 +982,6 @@ void intel_gt_info_print(const struct intel_gt_info *info,
>  	intel_sseu_dump(&info->sseu, p);
>  }
>  
> -struct reg_and_bit {
> -	union {
> -		i915_reg_t reg;
> -		i915_mcr_reg_t mcr_reg;
> -	};
> -	u32 bit;
> -};
> -
> -static struct reg_and_bit
> -get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
> -		const i915_reg_t *regs, const unsigned int num)
> -{
> -	const unsigned int class = engine->class;
> -	struct reg_and_bit rb = { };
> -
> -	if (gt_WARN_ON_ONCE(engine->gt, class >= num || !regs[class].reg))
> -		return rb;
> -
> -	rb.reg = regs[class];
> -	if (gen8 && class == VIDEO_DECODE_CLASS)
> -		rb.reg.reg += 4 * engine->instance; /* GEN8_M2TCR */
> -	else
> -		rb.bit = engine->instance;
> -
> -	rb.bit = BIT(rb.bit);
> -
> -	return rb;
> -}
> -
>  /*
>   * HW architecture suggest typical invalidation time at 40us,
>   * with pessimistic cases up to 100us and a recommendation to
> @@ -1024,14 +995,20 @@ get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
>   * but are now considered MCR registers.  Since they exist within a GAM range,
>   * the primary instance of the register rolls up the status from each unit.
>   */
> -static int wait_for_invalidate(struct intel_gt *gt, struct reg_and_bit rb)
> +static int wait_for_invalidate(struct intel_engine_cs *engine)
>  {
> -	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 50))
> -		return intel_gt_mcr_wait_for_reg(gt, rb.mcr_reg, rb.bit, 0,
> +	if (engine->tlb_inv.mcr)
> +		return intel_gt_mcr_wait_for_reg(engine->gt,
> +						 engine->tlb_inv.reg.mcr_reg,
> +						 engine->tlb_inv.done,
> +						 0,
>  						 TLB_INVAL_TIMEOUT_US,
>  						 TLB_INVAL_TIMEOUT_MS);
>  	else
> -		return __intel_wait_for_register_fw(gt->uncore, rb.reg, rb.bit, 0,
> +		return __intel_wait_for_register_fw(engine->gt->uncore,
> +						    engine->tlb_inv.reg.reg,
> +						    engine->tlb_inv.done,
> +						    0,
>  						    TLB_INVAL_TIMEOUT_US,
>  						    TLB_INVAL_TIMEOUT_MS,
>  						    NULL);
> @@ -1039,62 +1016,14 @@ static int wait_for_invalidate(struct intel_gt *gt, struct reg_and_bit rb)
>  
>  static void mmio_invalidate_full(struct intel_gt *gt)
>  {
> -	static const i915_reg_t gen8_regs[] = {
> -		[RENDER_CLASS]			= GEN8_RTCR,
> -		[VIDEO_DECODE_CLASS]		= GEN8_M1TCR, /* , GEN8_M2TCR */
> -		[VIDEO_ENHANCEMENT_CLASS]	= GEN8_VTCR,
> -		[COPY_ENGINE_CLASS]		= GEN8_BTCR,
> -	};
> -	static const i915_reg_t gen12_regs[] = {
> -		[RENDER_CLASS]			= GEN12_GFX_TLB_INV_CR,
> -		[VIDEO_DECODE_CLASS]		= GEN12_VD_TLB_INV_CR,
> -		[VIDEO_ENHANCEMENT_CLASS]	= GEN12_VE_TLB_INV_CR,
> -		[COPY_ENGINE_CLASS]		= GEN12_BLT_TLB_INV_CR,
> -		[COMPUTE_CLASS]			= GEN12_COMPCTX_TLB_INV_CR,
> -	};
> -	static const i915_mcr_reg_t xehp_regs[] = {
> -		[RENDER_CLASS]			= XEHP_GFX_TLB_INV_CR,
> -		[VIDEO_DECODE_CLASS]		= XEHP_VD_TLB_INV_CR,
> -		[VIDEO_ENHANCEMENT_CLASS]	= XEHP_VE_TLB_INV_CR,
> -		[COPY_ENGINE_CLASS]		= XEHP_BLT_TLB_INV_CR,
> -		[COMPUTE_CLASS]			= XEHP_COMPCTX_TLB_INV_CR,
> -	};
>  	struct drm_i915_private *i915 = gt->i915;
>  	struct intel_uncore *uncore = gt->uncore;
>  	struct intel_engine_cs *engine;
>  	intel_engine_mask_t awake, tmp;
>  	enum intel_engine_id id;
> -	const i915_reg_t *regs;
> -	unsigned int num = 0;
>  	unsigned long flags;
>  
> -	/*
> -	 * New platforms should not be added with catch-all-newer (>=)
> -	 * condition so that any later platform added triggers the below warning
> -	 * and in turn mandates a human cross-check of whether the invalidation
> -	 * flows have compatible semantics.
> -	 *
> -	 * For instance with the 11.00 -> 12.00 transition three out of five
> -	 * respective engine registers were moved to masked type. Then after the
> -	 * 12.00 -> 12.50 transition multi cast handling is required too.
> -	 */
> -
> -	if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50) ||
> -	    GRAPHICS_VER_FULL(i915) == IP_VER(12, 55)) {
> -		regs = NULL;
> -		num = ARRAY_SIZE(xehp_regs);
> -	} else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0) ||
> -		   GRAPHICS_VER_FULL(i915) == IP_VER(12, 10)) {
> -		regs = gen12_regs;
> -		num = ARRAY_SIZE(gen12_regs);
> -	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
> -		regs = gen8_regs;
> -		num = ARRAY_SIZE(gen8_regs);
> -	} else if (GRAPHICS_VER(i915) < 8) {
> -		return;
> -	}
> -
> -	if (gt_WARN_ONCE(gt, !num, "Platform does not implement TLB invalidation!"))
> +	if (GRAPHICS_VER(i915) < 8)
>  		return;
>  
>  	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
> @@ -1104,33 +1033,18 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>  
>  	awake = 0;
>  	for_each_engine(engine, gt, id) {
> -		struct reg_and_bit rb;
> -
>  		if (!intel_engine_pm_is_awake(engine))
>  			continue;
>  
> -		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> -			u32 val = BIT(engine->instance);
> -
> -			if (engine->class == VIDEO_DECODE_CLASS ||
> -			    engine->class == VIDEO_ENHANCEMENT_CLASS ||
> -			    engine->class == COMPUTE_CLASS)
> -				val = _MASKED_BIT_ENABLE(val);
> +		if (engine->tlb_inv.mcr)
>  			intel_gt_mcr_multicast_write_fw(gt,
> -							xehp_regs[engine->class],
> -							val);
> -		} else {
> -			rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
> -			if (!i915_mmio_reg_offset(rb.reg))
> -				continue;
> -
> -			if (GRAPHICS_VER(i915) == 12 && (engine->class == VIDEO_DECODE_CLASS ||
> -			    engine->class == VIDEO_ENHANCEMENT_CLASS ||
> -			    engine->class == COMPUTE_CLASS))
> -				rb.bit = _MASKED_BIT_ENABLE(rb.bit);
> -
> -			intel_uncore_write_fw(uncore, rb.reg, rb.bit);
> -		}
> +							engine->tlb_inv.reg.mcr_reg,
> +							engine->tlb_inv.request);
> +		else
> +			intel_uncore_write_fw(uncore,
> +					      engine->tlb_inv.reg.reg,
> +					      engine->tlb_inv.request);
> +
>  		awake |= engine->mask;
>  	}
>  
> @@ -1149,17 +1063,9 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>  	intel_gt_mcr_unlock(gt, flags);
>  
>  	for_each_engine_masked(engine, gt, awake, tmp) {
> -		struct reg_and_bit rb;
> -
> -		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> -			rb.mcr_reg = xehp_regs[engine->class];
> -			rb.bit = BIT(engine->instance);
> -		} else {
> -			rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
> -		}
> -
> -		if (wait_for_invalidate(gt, rb))
> -			gt_err_ratelimited(gt, "%s TLB invalidation did not complete in %ums!\n",
> +		if (wait_for_invalidate(engine))
> +			gt_err_ratelimited(gt,
> +					   "%s TLB invalidation did not complete in %ums!\n",
>  					   engine->name, TLB_INVAL_TIMEOUT_MS);
>  	}
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
