Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25878744AC
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 00:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8232F1135D3;
	Wed,  6 Mar 2024 23:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WkgXUqj1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779051135D3;
 Wed,  6 Mar 2024 23:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709768777; x=1741304777;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qDch+6oSvqNDdkzj7GR3VYtzL3dB0CBX5gbGBbtTQYM=;
 b=WkgXUqj1YnpCPjXL8hQ5bK97raz97VlmekjDh27wpuNE6ua3E3+oDuP6
 P2ipwUMo78d/dT5Ic1IfN8uiNkOYY0W4NPsqzlJF6fG1VPhbxfrRHotdY
 VofOh4rfeGHbRssa+Hba2ODoiQokLqXXMF3A9HFF7W9X4C5Jy7tS6Kwt/
 YqXLo5Q740RugV4z0B03oGbWHXa5wzKCcGOlIXkgAsRS7vYEsNZ3RMoyH
 0u+RPQwf5n01MA66ak1/Ife86NjOe7rEE5abzajBF3h2L3C84jQ1Nk0RF
 DgRxUTk2jnGCt5rAi/t6sFDzX8OvhS7RG8Y8UwFyY8NMF0Au3KawRQ6tL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15852965"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="15852965"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 15:46:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="10463279"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 15:46:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 15:46:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 15:46:14 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 15:46:14 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 15:46:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eM0fJdh2PJKxEX4oPmNgJHcyRZfn1DC46Sjp3aUXhpYwx5z64sKavel/a6i0Meqv32lJMjz9x+yGPqv8Jxyf3zRkfeEDYL20LtPVOpTKJTbdMB/6ZbWB3BusLa5uWGhAe4v1VFzU9VdSPEJBjAcWpX9I4YInGqU5QkBxaOZzDC9pWJRe05OEZUm0HD+w7qqHWOQ20qPzhvDUWdZz0zs7QAaVP1/7AruE23PW91/2Z7f7EhmeO23z4N8UZGdk/2hSEoYiTKSnXsw7s4RGLuxa36iZwlFknRQneQI44vOoQ9e90I9RSuh9v6/jbKaC/c+H9OSGuFKN9NZJGeLf6paHBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Opz88/3TaKOKIEvw8Ehrw+Mhx0omlHXhdpFc7Y8FMQw=;
 b=mgYHVSzmudC3NH4/JxKpzfg0B1a71FM7pYK581LjzHu2Ie9ZtiPBE6I1vtgi5eF59Swd4oBdqam7jAPMBubEVMNvJkVRJewC0B2tOTP+OisaFAQ9XOigwzRplY2n+hiwqqtxIUlWxiIkL07Mb5H18gzHKrSYsXQxP6osQcFPCN6eP2tDXtrc96lU1K9rfSGdRbR/LYylGscPaZ4dzRlQW0m4FNaegZgKuYG5DlePeJJwqd19anIEQiT9jv0eEsMP5DrY1dVXV0fY1tRiG+Wg2eMihkVw73BqaBf4hZVXGMUjcrtCFGvZuS6pWtZJeNKaTDkREkENRxu/5z8+zg4fHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV3PR11MB8483.namprd11.prod.outlook.com (2603:10b6:408:1b0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Wed, 6 Mar
 2024 23:46:12 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 23:46:12 +0000
Date: Wed, 6 Mar 2024 15:46:09 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, John Harrison <John.C.Harrison@intel.com>, 
 <stable@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: Re: [PATCH v4 1/3] drm/i915/gt: Disable HW load balancing for CCS
Message-ID: <20240306234609.GF718896@mdroper-desk1.amr.corp.intel.com>
References: <20240306012247.246003-1-andi.shyti@linux.intel.com>
 <20240306012247.246003-2-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240306012247.246003-2-andi.shyti@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0060.namprd07.prod.outlook.com
 (2603:10b6:a03:60::37) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV3PR11MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: 2466d2d3-147c-4a15-2c47-08dc3e379aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q4WTSwULb85xey4R/fMA8G+PxndqIu72O1nIkbTCT5dVgnFoz9e7jku11Y6I7TRjkilZ2/WDdhBXHO776Vf4c04gOQvKPuHtVdcbm8c5lU+WP3O5ugdEhMqMCsLwkAbM1jyHzk5DWgJP+bqTjYq/Lr+5CR+8Y5v+qRqK1su/e4rLNMK66iXqBEeuh47WsatB6m/f4ghnRrEQ8+659HkTq60IdmgX2etFrcD09h2xtHZ0yD+g/IV1l3nDXF0222Jq4fDI4gv5xaKaA8sqtAcsxtoVjbkYGqpLgSEWxX6rhbWQoKQaaDZkqCbo1mzbiNgTCg/IEFiGtcgb1be3MdPf0aqKouxMUmjaN2IXXW7e8ccW1DeEZi5Ogbdm2//diSg5FVmx7xrzyeJoR/v35CKqMhA0FKJtdNf6iFzd6yj930wseu7sFFwfcJ90WvdYU7KdlcQLpxI//f0NXjmapQ84riCblhY/w9s4RxB6YQ4N1/UVg0Op9VpaoM7ynlqbz1UXa50wFnrECj1jIsM9Knke9SHuBjkJ441u92vG/Jlfbm0tvu1LV4a+iYOlhp2N7207FwVgNfrMePARkzxlxZPW5RwU0YRR4viIGsVoWPI3mfSPtR9+HIViycmfY5f7D4Zx248UT54kBOsx9cc50dkw3caM+CeQVaVoMMr83kNUtpM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UtqdyWPCNKm9VmY0lSiIkwZVG1I1emIWfHanbm8nz4KISY7IWWnC4rgSyg6r?=
 =?us-ascii?Q?/LR6v5tLLPEtWtDJKB6dkvyOANyL91yoNEHaQypE/w/V+j1pHn6xDSn2tjFv?=
 =?us-ascii?Q?kVqB+YNjCBgICW8oFe/jSqfdoBr98HgdHktX5bdbQf3U/qfMBQ9vvXwTftbC?=
 =?us-ascii?Q?QiSiMzDylSQ+zd4GzKHI1xCc2AeYalUpIZ1wd03v524frcf/iTsJAPU4Jcx6?=
 =?us-ascii?Q?zAW0/nW4u/mMVFkz+gQx8cT9b/PzG/jpU/5gDU5nbIgG0qXX8KZ6bKd6fAtn?=
 =?us-ascii?Q?iGHI4W5Mu/UwCZIEjz5kjHtvkY7LnY+Wep9tc6M+2V1kO9X0GnLoQSvOCWw3?=
 =?us-ascii?Q?JPcCCXw8HdMJcnIxaGG1M+nLef93dM4CcVPbZNdJKk9/WGo38D/ytYAJsRfe?=
 =?us-ascii?Q?g+6w7Z9ceUnMi6AwVwevaB8cEcoZnPJN/TfgU+qT4iJujfr0f+kUnDP1Zd/n?=
 =?us-ascii?Q?tWrNqcL1s2LTytronzQK2Ee1MNvtp3lDKKrf9MK4GPW/UFNNjRkAXnbQUzTP?=
 =?us-ascii?Q?+UfHhrrfjVPvCqPcIU6MErpee2rByVGYgmgSdwFGBA7cqW9LGpV58Fcg0GHs?=
 =?us-ascii?Q?T9uDULWUUgxiDXQAbKdh9knnBDWGF+oy9VYELZx99ES1krBRlapiW0sWv/0R?=
 =?us-ascii?Q?lm1hknQby6F0TSaNNGGvZ5FxARllDlqMTv3G0Z0Vd6CbBCTCUFAdv38QtCUw?=
 =?us-ascii?Q?KDp8yVxdBZbZW68SwkKFK0jTNAO0Kqe3tfTEzrmyP0WsbAygCC8Lj5WkCnLs?=
 =?us-ascii?Q?ZfCYPKH3PUvtJD4dwf1PG7Ie2GcWmksDWdmkVMweIrK3l4trFstQUejNMNj3?=
 =?us-ascii?Q?f4dbprzkoNp+cn5mSOVnyUiD5GEsY4QGEHccOIuPR/iX40dixj8czhTMKbgQ?=
 =?us-ascii?Q?iDXKjNBkz454oRCTHvlzgU5xrR0RWDxGmLxB1ZyMX4F6BW9MTBZ0ScAAxBmo?=
 =?us-ascii?Q?YIGsMFUgyL8FCy5cE6juqnyl0SUOBE7s/tvB1PF3iFwE6TkrGJB2gOoXJA5M?=
 =?us-ascii?Q?Arq1aqWzXVpTqhwbIWEivNijdBJRmzkC9+Rz3BRDmPLwmmXAPzUsvqpQkX0R?=
 =?us-ascii?Q?acYtW36pS9mjLIrxqCxY09Y8qY6gluaU2MJnTxepROseCS6kRJrSg8TI3JOW?=
 =?us-ascii?Q?ob9yEg0SuLE6nDsS7moqJI7lk+3i38Y/iupv2QgUUWBbNvvVUcTJ7JurBA8G?=
 =?us-ascii?Q?NcdK5v1agvygBDLCoXABYrDAajheAsymqsSgoWASkuUvXnu+2XYkxaePbCF1?=
 =?us-ascii?Q?Ky8dlqfR9y3tIl5J02Uf1ZRTgrdtyeURug+2DIWqD9MeLAJRIzuPTYH8fmDW?=
 =?us-ascii?Q?hwLFNCJTjBKar2udddK7QULWqaI4CxA+yDojsK+Z4k/OKCkIpRH6Y7uiY9bU?=
 =?us-ascii?Q?+mL50KcFwOkRbXCrJGUGMMCf5AbpRbwv1/n0ZhLAePXc870C8ar6OaDiyDIk?=
 =?us-ascii?Q?cw+AISk0J364/nn6HwqYZGyKyPRuCwU0eE+texScleRuCuS2730R4ZLQtzFF?=
 =?us-ascii?Q?9asJzP27LGpCGN2p+RBqGa+j3byiBp4jcfxfFHMq7HdMHegtRJsZn8or4W1C?=
 =?us-ascii?Q?q3K9ZnVfM1qKLiHJAM/G++JDQ3IcbHSFW9t4DerfcNzB0WaSQGakO78AmYfR?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2466d2d3-147c-4a15-2c47-08dc3e379aff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 23:46:12.5756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lq70/InaRPPVU6p4dp6Hv8liDkoPOZjd1qUbNKHBKVz6HbhRUmmCaGkTudfvBzeqr9tVl5Houv02zgLb2zKX/Xso5drLG2YY+Vcfam/vDG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8483
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

On Wed, Mar 06, 2024 at 02:22:45AM +0100, Andi Shyti wrote:
> The hardware should not dynamically balance the load between CCS
> engines. Wa_14019159160 recommends disabling it across all
> platforms.
> 
> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: <stable@vger.kernel.org> # v6.2+
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 1 +
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 50962cfd1353..cf709f6c05ae 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1478,6 +1478,7 @@
>  
>  #define GEN12_RCU_MODE				_MMIO(0x14800)
>  #define   GEN12_RCU_MODE_CCS_ENABLE		REG_BIT(0)
> +#define   XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE	REG_BIT(1)
>  
>  #define CHV_FUSE_GT				_MMIO(VLV_GUNIT_BASE + 0x2168)
>  #define   CHV_FGT_DISABLE_SS0			(1 << 10)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index d67d44611c28..a2e78cf0b5f5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2945,6 +2945,11 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>  
>  		/* Wa_18028616096 */
>  		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0_UDW, UGM_FRAGMENT_THRESHOLD_TO_3);
> +
> +		/*
> +		 * Wa_14019159160: disable the automatic CCS load balancing

I'm still a bit concerned that this doesn't really match what this
specific workaround is asking us to do.  There seems to be an agreement
on various internal email threads that we need to disable load
balancing, but there's no single specific workaround that officially
documents that decision.

This specific workaround asks us to do a bunch of different things, and
the third item it asks for is to disable load balancing in very specific
cases (i.e., while the RCS is active at the same time as one or more CCS
engines).  Taking this workaround in isolation, it would be valid to
keep load balancing active if you were just using the CCS engines and
leaving the RCS idle, or if balancing was turned on/off by the GuC
scheduler according to engine use at the moment, as the documented
workaround seems to assume will be the case.

So in general I think we do need to disable load balancing based on
other offline discussion, but blaming that entire change on
Wa_14019159160 seems a bit questionable since it's not really what this
specific workaround is asking us to do and someone may come back and try
to "correct" the implementation of this workaround in the future without
realizing there are other factors too.  It would be great if we could
get hardware teams to properly document this expectation somewhere
(either in a separate dedicated workaround, or in the MMIO tuning guide)
so that we'll have a more direct and authoritative source for such a
large behavioral change.


Matt

> +		 */
> +		wa_masked_en(wal, GEN12_RCU_MODE, XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE);
>  	}
>  
>  	if (IS_DG2_G11(i915)) {
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
