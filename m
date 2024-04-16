Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADDE8A73EB
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 20:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4053110F2CA;
	Tue, 16 Apr 2024 18:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eBoEIs89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8CD10F2A2;
 Tue, 16 Apr 2024 18:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713293730; x=1744829730;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ajM2nchp0RQpL1p/crk5WDGyLwKhplfwv6hIl9nDOCI=;
 b=eBoEIs89K96CG3Z7pAz60KR/BT/a8BV4tf6w7LEO35+LFvyhjjpJ2YYh
 aH57YJlAywI5iBtpDkMZGXJVFNNZZSXYW8YT87HYaJzvXQxnuK9b3TJkK
 wF0HbkhdScAZSWw1eKmPBCdmdix/Xczd6w2LClz0zppTDRXolSbvoFG8+
 FGYFq+qnEqBttifxBRP81Cn9t44WywuWG9W6DGFD6o4MY94Ix3fsroaoe
 THQuq2QeQh0CbwQ+7Z1n6URV2Ydy4JMFhxWgVGz+MjpvhFBY/f3mc0nOc
 p0jMYXX2rD/QfrYegylmF3QmEgsVsEaxuv5UfDhuY4xGjH+W/K61+aHQB w==;
X-CSE-ConnectionGUID: il6kN50tTvmxCdL4oB/f3A==
X-CSE-MsgGUID: BG1qMM2TTriVpNW30wbpBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8917401"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8917401"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 11:55:29 -0700
X-CSE-ConnectionGUID: pEoU3Jd0SPWn4znTXPFAWg==
X-CSE-MsgGUID: bHZNjTQWT4CkOOZevETSKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="22943779"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 11:55:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 11:55:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 11:55:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 11:55:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 11:55:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcubsP84ER7hFFQppbxO5vK6ia51NE5kmrAzGElD0ND885dxVt94Z1ROVAm3xR4MKPoCFlHyjnLIvCoD4WoPk3q4KLN9TN7Q7snLAHxV6vOHt2TOCyaK+CnJa+Q+IMZ9+2x9w3pjOmTS4fiBERKwIJPfB4NUa+FkB5G99sqWxJN7JL5z07WJ4p4pB2sJzPE2/YnFe48BT/xoZnjkx3vh3KnRpU3Bd86Hi7Prtea+zv93R8F/RQIcmnQ4hLCeGQ2pW0subG+bC6nMOqfxHcrQL8r+V+CRvtYv5pl+ofu2nhOuQwFHUX8hfgb7rLOSmY7M6rXqcgUkU3MTYlCe9Fk56g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yi9RT581W1zPWm6sDHHMCcnE5WFuWBLifJa/g2rLys=;
 b=G+289xhci0KYCAN16cnbDt5k+KHUcSWOu3MPS/ONlhdYOtPtxgyBZmmc1vUKgJexkcssOyZtyvz8COUiKhVIEVvcGAYsr7KU5Go1FrZFc1L6lubSSwpcw3e67vDD8HOUZNhz4Hjn7Iy/HAYgVa/uucBfdEOTePg570/ZLD3+ik0GC9ieZASmO9AFDOMk5NaU33gWqBVs6s+pFw/Muhgza0kJyt3h9v0P1v8j47obc1kPC1byBSScmecQHtKJsBMm5OB/uPsNj7IdL4NXjwA8Z5ciyYwQRG1+jRS711fI0xpERtu1exTdB5f0FHa/ORp2gGu5M+viibuUklSMxcpXAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SA2PR11MB4811.namprd11.prod.outlook.com (2603:10b6:806:11d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Tue, 16 Apr
 2024 18:55:26 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 18:55:26 +0000
Date: Tue, 16 Apr 2024 14:55:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, Badal Nilawar
 <badal.nilawar@intel.com>, Andi Shyti <andi.shyti@intel.com>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 <linux-hwmon@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/i915/hwmon: Get rid of devm
Message-ID: <Zh7JmPQ8XRJwMQnQ@intel.com>
References: <20240415223612.738535-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240415223612.738535-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR07CA0102.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::43) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|SA2PR11MB4811:EE_
X-MS-Office365-Filtering-Correlation-Id: bfde97b4-bb3c-4398-98a8-08dc5e46c6ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: evFEhkFu/pPlNXK55HXUtOUJXhzf6qXGM8O9PzGf2oLQrfppYw9BuNT4v8Nnksx8sjVI1kAQGokF5QtAu0y7N+4t3SEfqvYKjX46CRBom5mIEpCRQ0c3X18Srr1AKwwK0QwXWCZzw3ciCGK/Bzkgmoe3Sh/ZIqMMyCcWhZz6AKkUnDLGvgQANwt6iZtl0ZOqSVh8XLLJT3SwNfh2t67Mws9BjS6KYj+m0Zk37P6k0GHLGIo4ltRlOmAIk6dmHuc1DbHqqDCfrTVML/94b/46TrExvM4NJ+6kH+NsXQCiHJlZCWA6nnq7bDcdRC3PbYyv59u8NzHciw19ONZhHSWUQi+ACZgls/1E5Uji543ZFBXaIojdZyXBeGXqEvEk4jOrYTnX4OeHoGmC9Ovoy/ejCYO0ojM5GT90O8BIP2tBo0ZFf1gAtvQCp1unxN35+sMOe4gUFSxo2opdL7F7fQuWnvuUVF7FYdFbLK4pVYZke0PysLqC/0RFiujheq46EAT5C6DRwLSctyUoOPeH2WO3k/PDuLpqhB7DUCMIlJfUu+MEyHRneMsrwbfNVhit56AhaiduFjlOfOw1GhVkAXdS1r63HsHdoyfWTtQf3FlKBiU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aThMjupp1UOd6SFM92OhwUdGxVAghJCs7bkSBdN4YAdPjtlHGxnE8EPY3dax?=
 =?us-ascii?Q?g9Sb9dueDrMNMT6VXTiVEG4JSq/CdPeO4By/OheQlnW7DNOCUh4IO5TGo0id?=
 =?us-ascii?Q?MwuaJ+ySEuNCG6K6lwhhJzNScihf384zughDi6DqsfCFmx6FE+KqLPCdk8gY?=
 =?us-ascii?Q?ZxhPI0hpzk9k0AOTBFq0duNY17WGcxH8GBLVgRsGgBHMdt2DK9kp2zHOPlyk?=
 =?us-ascii?Q?jHpI+eQhM+FQDtulLXFGKvIg6GER7kvbQLTKXgc+lSNR2C30zhJzJwAmWjvj?=
 =?us-ascii?Q?/SDrnEFLixiYlW4kE2sJLhPKVvGL3tq9R05zSmWQR2/8CmG0lpwGb42D2LB9?=
 =?us-ascii?Q?9I8u5OHz5u3JHgy9wnGG432g8YcsDhNedQzr/Rv+5SVCHunjYBmpBLE2ngNn?=
 =?us-ascii?Q?uTHKH3s7vq/g3JXsMC1W0HbHRC4MixaQiOPGjFSHvrj59tSvNvSAdr7BboS1?=
 =?us-ascii?Q?X30Hsyke1B28J1/Yp2LyUiy5XQFXVV6Fr4o8cLoS/NmFHq7ruopNqRCckWeh?=
 =?us-ascii?Q?A32UoxXvt/vwgN4YZAT+QzKwit/fATU9/fyPB9Mp+FKrMFENakkS+gJwgr+v?=
 =?us-ascii?Q?QzcS1icvuEhk7+GX62cT4au0wKWQOzRMcTNuL57Xvff4H/TSe1iuWingjE60?=
 =?us-ascii?Q?2/F77b/qM5AfVLABF1o42zSnckRsqX99lVz2RsfN8xXqpNP3v+V0g3FNtiKC?=
 =?us-ascii?Q?jmS91zcWyDoS2pRGbKI/27IPsTE58KsbzbseDcxeMi8iBAizcC3wEJe/CDQ1?=
 =?us-ascii?Q?HBb0f82IQ3bEVXiCuvcL7DLcksD7wVbBwhR+lsyRxyMAR3b1waDYRULeAP8y?=
 =?us-ascii?Q?BtdIayu/G/q0FnF1h7vW3JGDVAAbQxxgis2ZhX2Bs26SqJDIdakbhG3FcS1e?=
 =?us-ascii?Q?3AgOnrFhYi98pk2dvgVYuWfcAPg5hSNKglSLC07oQhkYDOP5oQ1vFt51TmS2?=
 =?us-ascii?Q?w7k5qAlHGld2lRXA0UqV7qq+brgUbcarBkO4+/dX9wKSy8J27hvQ2XR2GGnK?=
 =?us-ascii?Q?2HZTRGdotS0O1Naeq3PGzP588iudFmPNP4KqkHBIGAUxJCn/DBK7/tbjNSBy?=
 =?us-ascii?Q?gtbSg6Jg7PW7QjnHccR2eA2BtRLKaWAFctfbP7Tr3IiXff818WDHXh9ZOKGs?=
 =?us-ascii?Q?VueuE6mWStMuZgJdz89ekc679onJVzaU1cBO74+yuvStjeH3XFwvbdMVOD83?=
 =?us-ascii?Q?Y2ImMer6lf141ba2ygOX4vVs2q4wygF5d8K0/Cjlw8zxNNCKdt9XzWZBcX3B?=
 =?us-ascii?Q?PpUIFcQGxE6lcmbII8EV68Wf+rBCAzky+GEszOAm6xhRhL8k4erwnTcuD5RI?=
 =?us-ascii?Q?7bCfkNnN91A9MCN8gTiB7dG+JayZsMYNFFHJbg+95Pu9O0p9XP4D/Zcq8qw7?=
 =?us-ascii?Q?SkKtzJrxm+kweZHyNwC7FbtMb4YoK7plbsuJKyhjs37oHoHJvzlnW6H1eJW8?=
 =?us-ascii?Q?ngPsDhSUQb3av0JZe3zm/FPS4OKpUvmRZTsgNV+lLcziQqVPYyFA3J8Hn94g?=
 =?us-ascii?Q?PVGKupNQkKsK/KPQrUArPNsE59nx6Ay/cjR8BDFLwmzTwrZp7Wb3Mg+wSOmy?=
 =?us-ascii?Q?/x6GW4w698TIxhVkKNvVkl7L7IvkqtCrSm83ZKlm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfde97b4-bb3c-4398-98a8-08dc5e46c6ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 18:55:26.0394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnRgs3nRqSQcvdj5jUC6zQuyzzFj4yqThhewTvBvEFUFqc2cJp+w24kQ6J6INu/SwZm8hNXRgthOZ7cuIAAL/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4811
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

On Mon, Apr 15, 2024 at 03:36:12PM -0700, Ashutosh Dixit wrote:
> When both hwmon and hwmon drvdata (on which hwmon depends) are device
> managed resources, the expectation, on device unbind, is that hwmon will be
> released before drvdata. However, in i915 there are two separate code
> paths, which both release either drvdata or hwmon and either can be
> released before the other. These code paths (for device unbind) are as
> follows (see also the bug referenced below):
> 
> Call Trace:
> release_nodes+0x11/0x70
> devres_release_group+0xb2/0x110
> component_unbind_all+0x8d/0xa0
> component_del+0xa5/0x140
> intel_pxp_tee_component_fini+0x29/0x40 [i915]
> intel_pxp_fini+0x33/0x80 [i915]
> i915_driver_remove+0x4c/0x120 [i915]
> i915_pci_remove+0x19/0x30 [i915]
> pci_device_remove+0x32/0xa0
> device_release_driver_internal+0x19c/0x200
> unbind_store+0x9c/0xb0
> 
> and
> 
> Call Trace:
> release_nodes+0x11/0x70
> devres_release_all+0x8a/0xc0
> device_unbind_cleanup+0x9/0x70
> device_release_driver_internal+0x1c1/0x200
> unbind_store+0x9c/0xb0
> 
> This means that in i915, if use devm, we cannot gurantee that hwmon will
> always be released before drvdata. Which means that we have a uaf if hwmon
> sysfs is accessed when drvdata has been released but hwmon hasn't.
> 
> The only way out of this seems to be do get rid of devm_ and release/free
> everything explicitly during device unbind.
> 
> v2: Change commit message and other minor code changes
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10366
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_hwmon.c | 41 +++++++++++++++++++++++--------
>  1 file changed, 31 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 8c3f443c8347..46c24b1ee6df 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -792,7 +792,7 @@ void i915_hwmon_register(struct drm_i915_private *i915)
>  	if (!IS_DGFX(i915))
>  		return;
>  
> -	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
> +	hwmon = kzalloc(sizeof(*hwmon), GFP_KERNEL);
>  	if (!hwmon)
>  		return;
>  
> @@ -818,10 +818,10 @@ void i915_hwmon_register(struct drm_i915_private *i915)
>  	hwm_get_preregistration_info(i915);
>  
>  	/*  hwmon_dev points to device hwmon<i> */
> -	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
> -							 ddat,
> -							 &hwm_chip_info,
> -							 hwm_groups);
> +	hwmon_dev = hwmon_device_register_with_info(dev, ddat->name,
> +						    ddat,
> +						    &hwm_chip_info,
> +						    hwm_groups);
>  	if (IS_ERR(hwmon_dev)) {
>  		i915->hwmon = NULL;
>  		return;
> @@ -838,10 +838,10 @@ void i915_hwmon_register(struct drm_i915_private *i915)
>  		if (!hwm_gt_is_visible(ddat_gt, hwmon_energy, hwmon_energy_input, 0))
>  			continue;
>  
> -		hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat_gt->name,
> -								 ddat_gt,
> -								 &hwm_gt_chip_info,
> -								 NULL);
> +		hwmon_dev = hwmon_device_register_with_info(dev, ddat_gt->name,
> +							    ddat_gt,
> +							    &hwm_gt_chip_info,
> +							    NULL);
>  		if (!IS_ERR(hwmon_dev))
>  			ddat_gt->hwmon_dev = hwmon_dev;
>  	}
> @@ -849,5 +849,26 @@ void i915_hwmon_register(struct drm_i915_private *i915)
>  
>  void i915_hwmon_unregister(struct drm_i915_private *i915)
>  {
> -	fetch_and_zero(&i915->hwmon);
> +	struct i915_hwmon *hwmon = fetch_and_zero(&i915->hwmon);
> +	struct hwm_drvdata *ddat = &hwmon->ddat;
> +	struct intel_gt *gt;
> +	int i;
> +
> +	if (!hwmon)
> +		return;

"that's too late", we are going to hear from static analyzer tools.

beter to move ddat = &hwmon->ddat; after this return.

with that,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +
> +	for_each_gt(gt, i915, i) {
> +		struct hwm_drvdata *ddat_gt = hwmon->ddat_gt + i;
> +
> +		if (ddat_gt->hwmon_dev) {
> +			hwmon_device_unregister(ddat_gt->hwmon_dev);
> +			ddat_gt->hwmon_dev = NULL;
> +		}
> +	}
> +
> +	if (ddat->hwmon_dev)
> +		hwmon_device_unregister(ddat->hwmon_dev);
> +
> +	mutex_destroy(&hwmon->hwmon_lock);
> +	kfree(hwmon);
>  }
> -- 
> 2.41.0
> 
