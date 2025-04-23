Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ABFA98C60
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 16:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3286F10E6C0;
	Wed, 23 Apr 2025 14:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XT16MtHa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7472F10E6C8;
 Wed, 23 Apr 2025 14:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745417209; x=1776953209;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dKAqXmeu8N87L72AVHLJjCwv0AmsAGEAYrox3lod0s0=;
 b=XT16MtHaO6jgSL+dNhe31nLbSfiNlpVR6+At9q3Samrd1twbnc5lNN84
 1QZr8dnJfRKhLe9/mKnFNUr0iLJroo4n50B4y/DiJcgNLutNdaVmpDx4N
 NlDVqjeisQlub9Ngdm7VHC2fR6gaHc8X7k59CL3BMtxXI9aaGqcuHyNo2
 BhMW2ReeZvIjK0Q3//s8BAhf0rbhorMy2SZGNYCv2yn/h3QlLs7FzTOEz
 hhR7ixF3W5n0/OYWLGAH9iGeNTE1pNhTpUcta318Gg/5vQKiE0wAn4jXa
 0j+zm+q0w16j5/0kDvOAjJjJBRDO3nazKrZWwHlcYVsA36YFO+J/55ImG g==;
X-CSE-ConnectionGUID: U8zTDNPMTlaOKHxDWTph7w==
X-CSE-MsgGUID: p6WV8LLATUeIsPxm8jHCrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="57206174"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="57206174"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 07:06:48 -0700
X-CSE-ConnectionGUID: SdBs0yL6R2ucFtbvHIZ80A==
X-CSE-MsgGUID: 3um0Gks9RUaLqdaAp4dpqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="163299259"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 07:06:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 07:06:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 07:06:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 07:06:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwmA1gqK5pYwHtdFRSrb+sIKmGcpyRuztVxBtS+a0qgW05hlZ4wOprVFq2e3iM9fyTLfTg4g1dbrZiGGenjEOGW6lhJrRpLuqPynP3ubFrGXmDQVAJPCBe3o+UjsGCsb/j5TK8FMikJhHAvs8Z6I6vOSBWcCxl/0ms49Dq7QG3jDGau41QjNcN5Yymh4FXgTkaYhmUY9KF4NIO204NUd4mD7xQiXPFPejpTONutXogck2XGSfFcL/6+D9A/rmlC4IoXvQAkVJBgBle2y6Nwdg+S+NeNBFVTKKWPWkvJAE/fSak65UsK/KmSa6zwYaSIrXmeNN0vlKbUdkMaP9xucaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeSNCUfH3v2WYkCD6PVocAt2ZmPXB+f2jsF2Ukr10yc=;
 b=QyM1e1qyNKLK2J5NbAgi7Rg1ZvXFRtYXcGT0tK3o1S3JWpNZytvNvh7AgRIhHjkVNcKHCkPCTrmC94Rr8XOHEscjuUyHcsMNBg0ZDW95T7euPAADXb8YWip+kPM8uM0utlbEGHKqFLeulJoiAxVkw3bYLZGAX1HeMiHxvGaXIlh3LI/fPMF5kEVMsuUfFhvluV3hliwJhuFjha3mKx9lmteWAHwZ/EdZFCDXZpylm9jK6sIwrPEkkvijCAg/XUaNuV8uy3aQ58/9zJgsDPH54ptWmwjHm6CkodnbEVL3n+u7LypLnSaMr8GUjaltf8wV/kqvlRRuuLfQ/ZphmMncug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8687.namprd11.prod.outlook.com (2603:10b6:8:1be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 14:06:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 14:06:37 +0000
Date: Wed, 23 Apr 2025 09:06:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Arshad Mehmood <arshad.mehmood@intel.com>, 
 Chris Wilson <chris.p.wilson@linux.intel.com>, Andi Shyti
 <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 2/6] drm/i915/gt: Move CCS workaround to the correct
 section
Message-ID: <fiulft574m5r24z3hvre7gbajnu3xkpziinayr6xf46dmerpys@zq63ni4fo5a2>
References: <20250326234005.1574688-1-andi.shyti@linux.intel.com>
 <20250326234005.1574688-3-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250326234005.1574688-3-andi.shyti@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0321.namprd04.prod.outlook.com
 (2603:10b6:303:82::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: 6342a3c1-c077-49ec-afc8-08dd82700fec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8EavWPQUzdAByvLSiBDV96lVyGvXUffV+WhjzB0eWcKK9zslkq0Dj51zY3Ml?=
 =?us-ascii?Q?WOU9cnNRGILPU/9z11QUMGMGcYyBZlvWY1yhyS0M5trkpcTJQPRew+1QafqD?=
 =?us-ascii?Q?2fm2KiHfznB8YOb0qAiyjoXKreatVwykLt+JTLTUOSmrpP7+qFWkpREzq62R?=
 =?us-ascii?Q?27kJz7W8KG/MJIULttT+4GH4p6VoURipizF11g8BUZxx/Yw8JughBtmw7IGl?=
 =?us-ascii?Q?xo5I1P0FV9y0v0IrLlPqXQatps8ypSxgeX5teabD+Zc4wIBFpShXNAg4FiBQ?=
 =?us-ascii?Q?VyMcCZ0qFEjw4mFfxNfTw6x9FZkRSR6CxJk2/5HPAZDRVHK3TGapIhFrP9Qw?=
 =?us-ascii?Q?WHTLGAX0SCGqogoc/BPQA6PFoktybqnESqdi1BndAbqCpr8YB/yeu4ayA6DQ?=
 =?us-ascii?Q?+X8zO0Rj+929p+g6iuIfWgZgPAexUUjJg6DQ7DpzEfm6lV+RCZKH0PKKb/mt?=
 =?us-ascii?Q?rhlZQtSmqqB7oh7+CkD/MChxydoDL43fCrEOe78hr2PPC8ihYFoqKvRQFyO8?=
 =?us-ascii?Q?EPUH+FgCbprRhNcrOXRXrc4QSvVklmQCdhXVONTJHIbc76Na57yECrgF4zDM?=
 =?us-ascii?Q?VQdRrm7qkTLBzYk+Fa1CKf/tOTz3ZXcHJ32hMDt+60bnTC84DHJh6p7cT5yi?=
 =?us-ascii?Q?Z/MgPi/iDMpp0yas3E8hFy1UXt+xYr7Qei9/lsfh5+ngIrFDb2bQ4PeZnSfn?=
 =?us-ascii?Q?X6joNlTSv2antrpUhRuXBFb0VCzVWy94UiGkrylaqCyXi/Zl0imZvMIv2PN8?=
 =?us-ascii?Q?RkIQe/dBeEzTV8AtDzb5kVxQR4amRb8l71hts0DkMH4R/ECsG28jJwSc9ZtJ?=
 =?us-ascii?Q?Y+8sleNlx7MBKzIR7aggRJmGm1wbyrftgMPM8UokxdaWcaIVcNQcetmfTo9B?=
 =?us-ascii?Q?w1M55mhq8hnS34SdiHyx6PfDLBrJhK/iE73PwUpN90nFoKbHBJmZZV6Va3An?=
 =?us-ascii?Q?UijPVIgFisYvpU1l/LcIGnXBhIEDEruJzNvFYk1mbvj1QPGljYki1ByI81ab?=
 =?us-ascii?Q?d+2Fboes77agDC3sjPDyIV9MydhCECbmG70bFGOuj2ampFQyDUWnNz2oPSsQ?=
 =?us-ascii?Q?WUDLP6GihLO3XYppaSo3vDfzJzuYDxTxy7Rk9m0tfR5huPm2ycQhm/DwvP2p?=
 =?us-ascii?Q?yOekdGwkO4Gj4fbkugyTUKtJfyTi455rSBx131uoTebMmrnN0VINiru/pc0/?=
 =?us-ascii?Q?1jIHZLJzXgq5tflLtgGtKVg5YzrFeRM7jZRjl9GV7IONEayoEJ27GgxGCaRx?=
 =?us-ascii?Q?xDDOnLi4hV6Dk3El8XjJqEAGzpWvI3fCzsSGS2siUpyLcmmMykF5/Q/aqvco?=
 =?us-ascii?Q?EQqNnNHJti/ipIUTujL8Hdi2kwxHBNNrfg6nEXKmOMs31RTkho/yTpUxTesH?=
 =?us-ascii?Q?jgboPPd3goVujFUjYIVYdJZb9omJSu2O9A8MF/v8NuunRxJsPgCe6BY4Po8S?=
 =?us-ascii?Q?i4QAAX6GC/0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DAZW7NBf2zg1m3dUKPgYI4wNUJz10vt6FMLhn/uJUYd2RwHJwR4M6SE1iwsN?=
 =?us-ascii?Q?K4U1W7nv+6VQWAGq0Ttesl2rd1F78v44AR+3dX+e5i2WkJ/xq9vRzkuQhq0T?=
 =?us-ascii?Q?d1PG5SMvQFVcBPkq7enlZn4PZX+MiuiEqff2XTKt7U+kDQj3qqz8dh6HDLl4?=
 =?us-ascii?Q?MI9HVAQxaHlv9uzStYDSG7R9QT8+bxa1jTncQp+QcpRulHhzOmrNPAikj1Wz?=
 =?us-ascii?Q?OO352/LkNg/pojm1SBplvFmsMezxBzh9RjUYEWs3VAdNglfGrxgSY7fvP3DQ?=
 =?us-ascii?Q?ACy3+/dRyMLhmkGF4855ULo2Rb7rgjKPTVs1dbh8QD3NUN0UV8JzawFbBHD+?=
 =?us-ascii?Q?KCuP9sXeDUkWmOUGkPNDPLokSdqOzzdFasd+bZM+P6018CW/riMgNT0ItRWo?=
 =?us-ascii?Q?mlAJDBGcX9caToa6gfhhGPLiWzVMU6YSqhtaArpv4GmTGuphDu4NBcpHt8OI?=
 =?us-ascii?Q?CsVxpuUnwneU9fVPFJ/rnloM8zCnGVT4r1c3AdmhJkrg1/+AUcp26BC5OD8i?=
 =?us-ascii?Q?Z0vt+aqFoM8fGtC2WoTR0wSY3ZSaGL3BX9Dn75joOToxI1zZ+jXLL5jd8S3i?=
 =?us-ascii?Q?Z5fOqYjVopIGJeYABJjCp/6QRGzobFPmHDBVQcsXHK5rXeTJiq/KsigHdt0b?=
 =?us-ascii?Q?T18iLflfQlSGkvt/CI4hFKseGXMVAlaqWfxxx6hy9MdG0nwHnRDf3HU3vkJ3?=
 =?us-ascii?Q?VTP7mFGN+QfjeHqEWpT0973FvpXNN4P4cbwTTsD5IElA952e7Bqx/Nu0CZPx?=
 =?us-ascii?Q?KsgcFE2xTNiUXlPJ7cIfqJVpZ8/FzB6dbVzzYSQjmzegiBiaubwQcevCkM+u?=
 =?us-ascii?Q?bL6sIQj+VYbuqYzr08ZcSxn2ZfbwZLkir6/G/It1DL+psmSDqA/OaZNFeIX+?=
 =?us-ascii?Q?ZeSAUHtaVtAd3uuPgvYqEgTV3XDBfafVovPCByDSsAAqjT++AbQ50ocJU3Os?=
 =?us-ascii?Q?LDS6up0pzNQCTek0c+kaeEQ1//5oLmuvf58ysq3+f/9/gbmvcwiYLfF6+V/s?=
 =?us-ascii?Q?swyEF73qNq2RFmX5A80ljLq359ehBfCXUoPGiV8aJMHyVGsRzXObAX9PAeMl?=
 =?us-ascii?Q?+xgnrzDs/mN1iR70gkWAiuhBzgFE9+zaB0c9Oj14EZpB/+DXRjkaxQY/Jb31?=
 =?us-ascii?Q?LoMZ7tU0NsTpl6h6Ib1L7dDNfPeava4GSjNLQC196W0R7mSb6//jui9R5SHW?=
 =?us-ascii?Q?wffzrb/JE957Js68dOWIy1vmkA3f6z4OY7qYs87kTuF+ssIshTZ2op2c93Mg?=
 =?us-ascii?Q?2KQPb7CbaIfwz6kXEKCOydl8ANTpthtOm+LBFGRlZ3BPnjp7UhW5WDlQQGrU?=
 =?us-ascii?Q?WNfCd8GXSAJgA54/Y7oaN01fVQiLbMCdRBFFwB+/Qinz97zE4ZSRisxyjo7S?=
 =?us-ascii?Q?hBZ7BD2SrprhAc+YP3uKiQl4Y1ucKaGBVga/BxnIFBBry2elBnYV1pav0AQN?=
 =?us-ascii?Q?IcXVQrTXdAa1I5HpgGsf9u9caQsUHMoVfbFuHQBxDVtzT4Zk/Nvwy9sJw0/G?=
 =?us-ascii?Q?Ow0eOVDiTPEgQtJL5uN+3XC/AHstagLHsGEid4lxdelShn9e28EVUUWjd49F?=
 =?us-ascii?Q?SrY3p83gQw8i0tkpG/67kj4/vm2K80yajecz5KMGrDLpfO1BxuzaziyvSua+?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6342a3c1-c077-49ec-afc8-08dd82700fec
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 14:06:37.4565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40X27kViRrp/rvXsUTzaoshFzw4qRPMf6BsqPekMS0E2G0R384pxrKduY9Q6zKIubAQn2gcOH9GHJstnxdTnUtxlId0BFReldQR0cV/78j4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8687
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

On Thu, Mar 27, 2025 at 12:40:01AM +0100, Andi Shyti wrote:
>The CCS engine workaround was previously added in a section
>shared by both RCS and CCS engines.
>
>Move it to the proper CCS-specific section so that it's applied
>only once, avoiding unintended duplication caused by the first
>CCS/RCS detection check.
>
>To do this, the ccs_mode() function had to be moved earlier in
>the file to avoid the need for a forward declaration.
>
>Suggested-by: Arshad Mehmood <arshad.mehmood@intel.com>
>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

I'm not sure about this one. I think it was done like this because
the register exists on render and has no side effect setting it there.

>---
> drivers/gpu/drm/i915/gt/intel_workarounds.c | 58 +++++++++++----------
> 1 file changed, 30 insertions(+), 28 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>index 116683ebe074..bedd88a15959 100644
>--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
>+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>@@ -2699,10 +2699,38 @@ xcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
> 				    XEHP_BLITTER_ROUND_ROBIN_MODE);
> }
>
>+static void ccs_engine_wa_mode(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>+{
>+	struct intel_gt *gt = engine->gt;
>+	u32 mode;
>+
>+	/*
>+	 * This workaround should be applied only once across all
>+	 * CCS engines. Apply it to the first CCS encountered.
>+	 */
>+	if (!FIRST_CCS(engine))

the problem you'd face is that if you fix this macro to also include
render, then you break it here.

Lucas De Marchi

>+		return;
>+
>+	/*
>+	 * Wa_14019159160: This workaround, along with others, leads to
>+	 * significant challenges in utilizing load balancing among the
>+	 * CCS slices. Consequently, an architectural decision has been
>+	 * made to completely disable automatic CCS load balancing.
>+	 */
>+	wa_masked_en(wal, GEN12_RCU_MODE, XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE);
>+
>+	/*
>+	 * After having disabled automatic load balancing we need to
>+	 * assign all slices to a single CCS. We will call it CCS mode 1
>+	 */
>+	mode = intel_gt_apply_ccs_mode(gt);
>+	wa_masked_en(wal, XEHP_CCS_MODE, mode);
>+}
>+
> static void
> ccs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
> {
>-	/* boilerplate for any CCS engine workaround */
>+	ccs_engine_wa_mode(engine, wal);
> }
>
> /*
>@@ -2739,30 +2767,6 @@ add_render_compute_tuning_settings(struct intel_gt *gt,
> 		wa_write_clr(wal, GEN8_GARBCNTL, GEN12_BUS_HASH_CTL_BIT_EXC);
> }
>
>-static void ccs_engine_wa_mode(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>-{
>-	struct intel_gt *gt = engine->gt;
>-	u32 mode;
>-
>-	if (!IS_DG2(gt->i915))
>-		return;
>-
>-	/*
>-	 * Wa_14019159160: This workaround, along with others, leads to
>-	 * significant challenges in utilizing load balancing among the
>-	 * CCS slices. Consequently, an architectural decision has been
>-	 * made to completely disable automatic CCS load balancing.
>-	 */
>-	wa_masked_en(wal, GEN12_RCU_MODE, XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE);
>-
>-	/*
>-	 * After having disabled automatic load balancing we need to
>-	 * assign all slices to a single CCS. We will call it CCS mode 1
>-	 */
>-	mode = intel_gt_apply_ccs_mode(gt);
>-	wa_masked_en(wal, XEHP_CCS_MODE, mode);
>-}
>-
> /*
>  * The workarounds in this function apply to shared registers in
>  * the general render reset domain that aren't tied to a
>@@ -2895,10 +2899,8 @@ engine_init_workarounds(struct intel_engine_cs *engine, struct i915_wa_list *wal
> 	 * to a single RCS/CCS engine's workaround list since
> 	 * they're reset as part of the general render domain reset.
> 	 */
>-	if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE) {
>+	if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE)
> 		general_render_compute_wa_init(engine, wal);
>-		ccs_engine_wa_mode(engine, wal);
>-	}
>
> 	if (engine->class == COMPUTE_CLASS)
> 		ccs_engine_wa_init(engine, wal);
>-- 
>2.47.2
>
