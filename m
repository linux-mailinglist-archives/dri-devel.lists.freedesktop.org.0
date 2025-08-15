Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1E6B28051
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 15:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04EB10E93F;
	Fri, 15 Aug 2025 13:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X1NwKJ/D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBA010E93E;
 Fri, 15 Aug 2025 13:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755263082; x=1786799082;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z2cYK9suMtlXKoLhMVSx+7NKK/otsVPH3bbLcneZ/Wc=;
 b=X1NwKJ/DUS8AsgpM4OOSchRZvz5AcezfhRK6GoTDxBbijcdfklI1Y+dA
 GRzU5+Ok8eVx09BT9HQ5Puf7xIwQ7+ShnZWqiHtQhLgKXiwBfoWtK+OJ4
 QwdMyVvEz4uQ7+aKNX3CJhyZV7ry5GIUvCEQaFaRWuxhPpXSKicuiusQq
 iO6wsuOJvFvMMRDVHU3sBMVpRmZoDALX4/w27v1O1pMSz4O1LF8RYdtGI
 uYi9aWNJJbYOAr6jqzA4gEEMMsBRKHzSmcYhsQr1eP55dka42CH4Iismv
 wO1SO5u75ZwKb2HdniUtScR3wUrRNPAQZ16n452P4nopAMI0HJUdxTwYN w==;
X-CSE-ConnectionGUID: F4X1vgi0QVO2i4qtGfpL6A==
X-CSE-MsgGUID: pR5+Zu8SRjW41qqzYIfuqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="68955792"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="68955792"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 06:04:41 -0700
X-CSE-ConnectionGUID: nr+SF3ATQIuiYnG1bJp9kQ==
X-CSE-MsgGUID: YYobOt4dSvKUA0TFgxDBmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="171255891"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 06:04:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 06:04:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 06:04:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.75)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 06:04:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vh4JIzJ6zB26AJMnZ6wOw0732Cs7L1XHMjyN8zpJaoceQjyvmgPPCM05XvD4HVpP5IWavC7yjnr4RVckqbAFmopz3sJU0snkzeabvTth9QdwqMYKF4g7I2WZR+I45GstN2csG6RMeun2VcbN0GQFuvuTb7pz8ZnZ2jOoKhUTUHudIZwLGGMwLnVaFL2baSepdYYm0+webUMxlLUANsTxPeZVDS0Y2NxL888kyZuvo2rCjhgf0HoI9w3LMhbMO9tUBak4mRDnx+gAWVvsHbsrpiq05l7tH4NpouwfYconI0YwBoxD8Vc6iuWu0dRiZKNwD/fHEsxudNZCs22Gnsei1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnD8zqbxkfi3C+3+m3MxAsudSUBzUStna9Ik+wOvex8=;
 b=GCC1twTmUl/tR/pT5kitDnO2i9KdK1fs90fhR+CMHf3cp9UsIBvaRg+U9ApYr32XLj/KAdiwv0i55/vXobWu8097j6/IjEEyL799nyQkREefb5TZnghMN4Jtt+t423W2Qyerle0vEQyUFTlTzIZtTHmolzqfeqkBQ4o4ci1yMLZew51qKNSNq/XyI05PumRBPhQaqsHZmjqLOOm1RoHFSq0lSVA5Y2BILSsedNE+Uu0OEWDUoi0poJc/7C5CUv6Q71HQIzIiBb6GHvF663zmpaDyjRbGg50aOhsqQdCG9RTCHmdpGaPvM7gc7MsFH1I4+iK9weU+Q6ffgUcIfU6g4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by DS7PR11MB7951.namprd11.prod.outlook.com (2603:10b6:8:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 13:04:38 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%6]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 13:04:38 +0000
Date: Fri, 15 Aug 2025 09:04:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
CC: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona@ffwll.ch>, <airlied@gmail.com>, <tursulin@ursulin.net>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <mairacanal@riseup.net>
Subject: Re: [PATCH 1/9 v3] drm/i915: Move struct_mutex to drm_i915_private
Message-ID: <aJ8wYnTKv9_0udT2@intel.com>
References: <20250813135035.144762-1-luiz.mello@estudante.ufscar.br>
 <20250813135035.144762-2-luiz.mello@estudante.ufscar.br>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250813135035.144762-2-luiz.mello@estudante.ufscar.br>
X-ClientProxiedBy: SJ0PR13CA0194.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::19) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|DS7PR11MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: cd3005ff-967f-45ca-b4ae-08dddbfc4a9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8pfZxOELMGrvz0zdUtzGou8kg0ISZsZhiFjHc8rroFoPtc3cRs9/2p0nNmNd?=
 =?us-ascii?Q?z/VJ8jf/LDisOO8v5x24j+Ukua8N+x6OZmsZd+Rn4wxMCPdHnqJMJfC9LAfQ?=
 =?us-ascii?Q?tkr3YJtY5s2O51BVvwHt0H1FAGU+NIH2A1MUsgg7e9I89qcOUAA//3pBA3U3?=
 =?us-ascii?Q?4SJ3QZgycdAhFXPaR625jBTOqhXQb6Bjg1ojpKD4pFw3aUTOcNVF+VDmqzD8?=
 =?us-ascii?Q?rjmn3xHldd+8K/SKeKKIWWMUBuq8K8TRMyV2Y7ovxo8zA/7F42FPj89Biq6k?=
 =?us-ascii?Q?i5M9J7dmZiPlWNDvwWjPNljtG1GsQbP9tnyFcT6lTrfkilTEKeoYEbfSXuxT?=
 =?us-ascii?Q?Db4b32WvHUva3rXFT0/OdhJ/+2cSC3dCRebTw1SGTuOWzGnSPEtm+NdZrPf3?=
 =?us-ascii?Q?08YRPwrdNE6NyZsRX4q5NNp9OxOfeNbOVOeqwSVaJXlfUFHYbmzzCHkvwYMF?=
 =?us-ascii?Q?1DVRS02TzjORrEJ1BwD7lVcoF5JbShYs8s2f92hmAmNLvx5WlLRZZU0iWBmR?=
 =?us-ascii?Q?tBlZLOgbQv6RA/LJk9fdStNe8N9PkHW56O60UzidNbv+uxJ0TaisLsbSm8nE?=
 =?us-ascii?Q?enydC+b25ymGes6aXPPdQPkke3lrJ/vCU92IjVlpx4WzUSdXLhvwJ9LGdq1I?=
 =?us-ascii?Q?VreQd+wA36P3FBA8Oixs8pHVr1s8358lS4JejcKIiy3rslfQl50PJ5A/p42e?=
 =?us-ascii?Q?jur3Y+hZfzpnbg5ijeHyk+9to55IsoMww5bbh+iTPxSbGsw5Ug9sFBvWGSs/?=
 =?us-ascii?Q?zSO43Kqy9UGQ1ISixtps4oQsc/xfv0xT1Nmnu2MCjXUz7aeIq93+CXWAQ4Ah?=
 =?us-ascii?Q?D3WytNfkC17nb2OKaBuXHyemiGvN0GgmMTcQP04mqOUC460Hm4OM4HoN6tHe?=
 =?us-ascii?Q?x6IlZURILBKUsPVM2fD1TAmKfeMpMWtrfqCrrsNNanX/dxnxBF5b5mFI8hXE?=
 =?us-ascii?Q?FCE10WYyViyOji1Zcp0/JYDiCghCFbs7jlRyfk9bqbjMdr6/n0kajyI59hvS?=
 =?us-ascii?Q?VZ+ho/COhlicScxgw0ofrWMzFpidJGyjOpf+CugH5ksVQ5DAVTTldqO5E0fm?=
 =?us-ascii?Q?RpxV/2pi7ryK//Upgv1xmY+sXDwKIALRmw6/Yw+FDoRgnzOK8zaSy3nod7vi?=
 =?us-ascii?Q?JCxM2zslHYGe1YQJBKEFRh7xVKm/eGK5tU93dZ+7xgMe8iPCKgVnGLvzzNNb?=
 =?us-ascii?Q?RamU0QoDt0O0T0tl0iF0BsbHH4GsZWTl4UFQeIMq9eZc7iOtKNupMDDGNqvR?=
 =?us-ascii?Q?gqmPSBxGahUzCEybEE3WKyJXF1cnevOnzDMogFGnCoT5VeVegydFCzMeFYyN?=
 =?us-ascii?Q?QI2gSLKPuVMYIcptMleEHA73OiAetCmx4DLoKITeEP/qRP8Hmn2fuLFEXraF?=
 =?us-ascii?Q?6zaDmmc6zGRKA5J2uuXg8ag2j9auUzlxwx8lZfma4FKRtwxA+g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dtxeLWO8OLvs6bE6HVoNPb7OKPaRN3n4QPRCqaz72+V9cjticP5stZJj2j9B?=
 =?us-ascii?Q?QHQb7YlpjHMk6g0bFE6Zn7bP1Q9pFhcyarvi8SKtLGgf1aY88ERJykxbfJuP?=
 =?us-ascii?Q?FWzBoakdEVwCOB8irrde06wIyagJwhP7hWBt4SupQZH7qK83g1SU+olrB7By?=
 =?us-ascii?Q?xe+oc8E/6HVnoIXCef2GpZnMz+n53XlFKq7tIS7D+SBrd0wnWd1SWZuNpz4+?=
 =?us-ascii?Q?rGeQoaoYZwuBO37jNDBHq3vOy4swDccilWF+9DtsMyHmGXPON0yY7uYNtLGu?=
 =?us-ascii?Q?BTJadl14daT38qFLz6JaZrc4p6YoyH+9jB6EXRg9KAjELIknl16ZbELhZJVB?=
 =?us-ascii?Q?pOc8KsKh+uTRHfnposTnsRxDUmgClChbRKvpcR8sx9Js3/iEJA1sKL/0EYg8?=
 =?us-ascii?Q?+cpyQ1uoZ8lwx4PPDHrtUm97STqPe6iPcc4hMtR6ggXBBbhXJ0AE0tVOA4CT?=
 =?us-ascii?Q?KgtejsMm9kE89JjKZG0KktiSOIumsapewL28oAthb9NhEInGLkEdZZF4BH+4?=
 =?us-ascii?Q?8ABVfiXBl0JryhMfPp7h/sbwDWj/115+Xhb9P4+nBLi63XLpUkZ6ixsjmfS8?=
 =?us-ascii?Q?i5Bi/Y8PqyOniEuKAyIXaBx7nEBg0XzfCMILhO8AW+Ekv2jas+LkRtjcz0tr?=
 =?us-ascii?Q?52y3+t2FnettBGB8AHE9aZQpcWpniqOUuZu2WMpXaTPRhCtHIG0di62E23sj?=
 =?us-ascii?Q?BATnYuxjBvf6arBYnlZ7GkUP0ziSLVngmxXJWwcoxDmLsKLErIBtxByx8C3/?=
 =?us-ascii?Q?fvsYMSMTCa4xCbzwG9IzcEcQhEWC3cUjorx9A9dDFMSLgwIxiyMjFpl2QNJQ?=
 =?us-ascii?Q?kktXBIiQFj5s/alkL5NEK5wAU3PF2FxXgC9XrcGulTtATY5YcC8sWEkB7Q//?=
 =?us-ascii?Q?hfPfj2Mz25xNMzLdT4KsJR2XCdrMSfHVXoffVY5Spbdzo+Q6Soko0mGMzmxK?=
 =?us-ascii?Q?UImAcyDqm+wX0mCTMUALh0TXcUW7mfaKz2SFaxSx+UZcTJiP4B+VjlX0Yvn6?=
 =?us-ascii?Q?EFPDAULfWiWm1m7wejxiZOMSZo+VALBjRbAxQ3wKxB5rG15JbKTFaKeBpmR9?=
 =?us-ascii?Q?6K+BUB+SGmE9umug8gKvVtGo+3+PvzlaEKPJcJNj+3X4G4fXdVHZEJuBIhbm?=
 =?us-ascii?Q?GBWUtFZzAKg4NeAsG10NNTs+GIwHUmjjLiV3KUXN2IZdk/mOFYPGzwQhved6?=
 =?us-ascii?Q?3DYx7PHE1IwBOxhns18gnHFmKy1KygQK/i8Rhp4DWOfPXhamGJ36pXyyKpIx?=
 =?us-ascii?Q?bwsjjLHPhFy8WN2hhTMOJ0feDl4KQRIL1y8qAvD8D3XrtUilUaRnrFQLXa71?=
 =?us-ascii?Q?W5wKahcdktMDNDkCsyVyAHYbE/wwv3SZzwpoADRq7/QCMaCo4ni4AGhigb/1?=
 =?us-ascii?Q?cPptrqnBb0bQ9h0Zucs8LCvBGdVzlNFiz9wK4s2YCDBRYXclDO9GFBqMQLSX?=
 =?us-ascii?Q?9wtCML2EufzMiwXR/OINjhM+oMUO1gZqjMkKYEs8Hcb5bfHG3UDPjrBFSorh?=
 =?us-ascii?Q?q6Y6LRSTbsaHxRAPqVg8we+gfPmSYa1IcGWVH5GRMxXmxDKAhxLis68S2Ov4?=
 =?us-ascii?Q?WHRfcakwB84zydu3BZZRxh1a5vGPrg1JbwWD0az7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3005ff-967f-45ca-b4ae-08dddbfc4a9b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 13:04:38.8453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6pXEJMDNsMXH7Fodk6RmDyia8jLhG+7MKmKU+vZV5W3PhhkRKlpa9+n3bJhFoTbvhWZnccVq1GVs7p42kkeMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7951
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

On Wed, Aug 13, 2025 at 10:50:25AM -0300, Luiz Otavio Mello wrote:
> Move legacy BKL struct_mutex from drm_device to drm_i915_private, which
> is the last remaining user.
> 
> Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c                  |  2 --
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c |  4 ++--
>  drivers/gpu/drm/i915/i915_driver.c         |  2 ++
>  drivers/gpu/drm/i915/i915_drv.h            | 11 +++++++++++
>  drivers/gpu/drm/i915/i915_irq.c            |  4 ++--
>  include/drm/drm_device.h                   | 10 ----------

drm, drm-misc maintainers, ack to merge this through drm-intel-next?

>  6 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index cdd591b11488..ad3aee354ba3 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -694,7 +694,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
>  	mutex_destroy(&dev->master_mutex);
>  	mutex_destroy(&dev->clientlist_mutex);
>  	mutex_destroy(&dev->filelist_mutex);
> -	mutex_destroy(&dev->struct_mutex);
>  }
>  
>  static int drm_dev_init(struct drm_device *dev,
> @@ -735,7 +734,6 @@ static int drm_dev_init(struct drm_device *dev,
>  	INIT_LIST_HEAD(&dev->vblank_event_list);
>  
>  	spin_lock_init(&dev->event_lock);
> -	mutex_init(&dev->struct_mutex);
>  	mutex_init(&dev->filelist_mutex);
>  	mutex_init(&dev->clientlist_mutex);
>  	mutex_init(&dev->master_mutex);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> index 09a64f224c49..65ffcaeee4b9 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> @@ -677,7 +677,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
>  	if (level < GUC_LOG_LEVEL_DISABLED || level > GUC_LOG_LEVEL_MAX)
>  		return -EINVAL;
>  
> -	mutex_lock(&i915->drm.struct_mutex);
> +	mutex_lock(&i915->struct_mutex);
>  
>  	if (log->level == level)
>  		goto out_unlock;
> @@ -695,7 +695,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
>  	log->level = level;
>  
>  out_unlock:
> -	mutex_unlock(&i915->drm.struct_mutex);
> +	mutex_unlock(&i915->struct_mutex);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index c6263c6d3384..d1559fd8ad3d 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -233,6 +233,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>  
>  	intel_sbi_init(display);
>  	vlv_iosf_sb_init(dev_priv);
> +	mutex_init(&dev_priv->struct_mutex);
>  	mutex_init(&dev_priv->sb_lock);
>  
>  	i915_memcpy_init_early(dev_priv);
> @@ -291,6 +292,7 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
>  	i915_workqueues_cleanup(dev_priv);
>  
>  	mutex_destroy(&dev_priv->sb_lock);
> +	mutex_destroy(&dev_priv->struct_mutex);
>  	vlv_iosf_sb_fini(dev_priv);
>  	intel_sbi_fini(display);
>  
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 4e4e89746aa6..15f66a7d496d 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -222,6 +222,17 @@ struct drm_i915_private {
>  
>  	bool irqs_enabled;
>  
> +	/*
> +	 * Currently, struct_mutex is only used by the i915 driver as a replacement
> +	 * for BKL.
> +	 *
> +	 * For this reason, it is no longer part of struct drm_device.
> +	 */
> +	struct mutex struct_mutex;
> +
> +	/* LPT/WPT IOSF sideband protection */
> +	struct mutex sbi_lock;
> +
>  	/* VLV/CHV IOSF sideband */
>  	struct {
>  		struct mutex lock; /* protect sideband access */
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index 191ed8bb1d9c..cdfb09464134 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -167,7 +167,7 @@ static void ivb_parity_work(struct work_struct *work)
>  	 * In order to prevent a get/put style interface, acquire struct mutex
>  	 * any time we access those registers.
>  	 */
> -	mutex_lock(&dev_priv->drm.struct_mutex);
> +	mutex_lock(&dev_priv->struct_mutex);
>  
>  	/* If we've screwed up tracking, just let the interrupt fire again */
>  	if (drm_WARN_ON(&dev_priv->drm, !dev_priv->l3_parity.which_slice))
> @@ -225,7 +225,7 @@ static void ivb_parity_work(struct work_struct *work)
>  	gen5_gt_enable_irq(gt, GT_PARITY_ERROR(dev_priv));
>  	spin_unlock_irq(gt->irq_lock);
>  
> -	mutex_unlock(&dev_priv->drm.struct_mutex);
> +	mutex_unlock(&dev_priv->struct_mutex);
>  }
>  
>  static irqreturn_t valleyview_irq_handler(int irq, void *arg)
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index a33aedd5e9ec..016df5529d46 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -188,16 +188,6 @@ struct drm_device {
>  	/** @unique: Unique name of the device */
>  	char *unique;
>  
> -	/**
> -	 * @struct_mutex:
> -	 *
> -	 * Lock for others (not &drm_minor.master and &drm_file.is_master)
> -	 *
> -	 * TODO: This lock used to be the BKL of the DRM subsystem. Move the
> -	 *       lock into i915, which is the only remaining user.
> -	 */
> -	struct mutex struct_mutex;
> -
>  	/**
>  	 * @master_mutex:
>  	 *
> -- 
> 2.50.1
> 
