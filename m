Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3400A557EC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 21:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9209410EA89;
	Thu,  6 Mar 2025 20:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJqbMD7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501D010EA88
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 20:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741294630; x=1772830630;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+Jca9lHWIKszEc9Y3Ty+i9h4VhgrgaJcfXO70UFws6Y=;
 b=OJqbMD7ItVG5pA3hamwKo7bEpIgh/hogObn82+4RBuO+G/OUH29SGchv
 15aWvv7V6mcLcfHMYVOh+6iIsAEXFghNPyCUVgy8C5mV3/McZnO5B8pej
 RItFTPfxc3LkW22uFQWcOPpd8MAxqIbV5hB+BixOrkCnOkEWDRq86vUYS
 TZHrH4bDLp0V9X3eehvWyFZKCP9pDj8jSM87+0DkH70HLbDwdTa0Rc/yL
 rDcgEA+clXLuW8l7s5wKMdYv7jkQI3g5a3KP8aUQo6yievCRYX5bjZEQq
 Z7Js4KDE2QFA34J4AnZAK2QrKqCUJGqQFKBEVZZZKEkcwuwbNmohs2dfe A==;
X-CSE-ConnectionGUID: CSKuCGQWQIyx0EYJEMDqaw==
X-CSE-MsgGUID: oXlY9n41Ri+BfJP+biRRrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46101342"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="46101342"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 12:57:09 -0800
X-CSE-ConnectionGUID: lQbiUAs5SPeXkVfKn3cj3w==
X-CSE-MsgGUID: kiRfK3lxQXuyg+8J/ZsE/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="149928326"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 12:57:09 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 12:57:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 12:57:08 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 12:57:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Njeo6LlvNTIFBbaVCyHF6GQSMwzf1VP1Z4MhSwTWOGvVfxk/HF4FXQiu2S0Oia811FeGzlKiUY6BKWKn5QaKdGk54RMSPmFmfhqMhjyE+irDdbDby3uytnBpzuy/rYrjZGj7yzLi5JrJyEkhrqkpeyxyxdUGQ4E+a3RmAaZ4ZoeTMGxTJuzJY36a8o/crK/9VYBt7/cxtshP6hwHYZjNfJkC+tQ2A965adnnkxpKvTbadMS5Th3TYlNCblKpnAhvzVPOeg7ZZpxWUXCuM99BOZhHeno+z4UUTmypz4cC9v5AP8gE0VZKXZAJdG7yGXWfBLpiMlS2VVoKvK7cIoibjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqLwkKZ6/4Ed+B08i9Gqf76jl7JotCWUAh7Lb81VX60=;
 b=czVoX5mGzoak9DVQCdiik8kfWz+jByk75ui2dA0XcL/DXtVLdr20M+zuccz+/cMq18HlBzrE7g2M2WcUXcl1jMNGhinlY9ViZsHRybAX9lfFeT1XfcutD7Khd9pom/0H+EP86YY0uMgGDoZYNzl9RbmlrAL0L9D5SxSO/eKJi8xo7nKRKeI1L8MVDK449NjHqcvFKSPLUjyuwK0Ljq1bkCl0nrtsms+S18CdPFtQdrkTyVweNc+hyWvk9exS4eBR9jZiHLS20MFGxkVrzx8PRDDOQ594AQNUhTOBGmX1DltyugnZMrV8xeObaLzpHWsVbs4Z4VzlexsH1uzQSrspCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6894.namprd11.prod.outlook.com (2603:10b6:806:2b1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Thu, 6 Mar
 2025 20:56:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 20:56:38 +0000
Date: Thu, 6 Mar 2025 12:57:45 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <phasta@kernel.org>
CC: Danilo Krummrich <dakr@kernel.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 3/3] drm/sched: Update timedout_job()'s documentation
Message-ID: <Z8oMSWulN0mF43aB@lstrano-desk.jf.intel.com>
References: <20250305130551.136682-2-phasta@kernel.org>
 <20250305130551.136682-5-phasta@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250305130551.136682-5-phasta@kernel.org>
X-ClientProxiedBy: MW4PR03CA0216.namprd03.prod.outlook.com
 (2603:10b6:303:b9::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6894:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6c7261-4239-4236-b1c5-08dd5cf163b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H43LTvxDVO+944DJmnYvX1j7XnmUP+xPOHtSTmRKnmiSHamXe9Z73ZpyblV2?=
 =?us-ascii?Q?Z5BJ1dkHey5TDxiDOwyS5cFcbswi1BsbStuNjDXlSqbrAIOiLR71jnE5BOkS?=
 =?us-ascii?Q?KDAGmvoLPs+rOHkleYQtkq0ydUywsmpJyK3YQluPLj59snKYsKGL+uyAckQn?=
 =?us-ascii?Q?gaWuD9P9gpRQ6T04NDD8OfbN6ZUWv0DdjBr5HZS1l51sbsOf85KDauFuYgBC?=
 =?us-ascii?Q?KnfVpNgLulDQNy682c2nMXuDTXnXvdIOSLS8Z2oczOfC7JAXDS3iS/Wmira4?=
 =?us-ascii?Q?JM+cJ6futAH0HemruwX51qK5nKoeOzkQ6nHp00AldG3buGGPHUArGgOJ67o/?=
 =?us-ascii?Q?Ra5j5VT+EMgE55fb5n8ttMxSwiCN6Cv86MQILnXqJ2yNzey1rvmy0qqpc8v4?=
 =?us-ascii?Q?kf3X5wzD1RvUppfUN42doyVXwxdjjulhRyWb0//b4EafATn/FSN1vN/32F5Q?=
 =?us-ascii?Q?oHi3PCjWBHd85xPojMuOlCRtfP7fkdCxE0wLPaApxyyfWxRKw8AsTUU9FO+D?=
 =?us-ascii?Q?oj58l5WmmrxdYR/qfPubur111nCbXMJYydroM4IABHgBVCVVX59vd6tFneqf?=
 =?us-ascii?Q?tqpYvzmXDw8X5V+4o/Dh29NXgUc9exEXzu5PcRoRLBqY8b2bR/Vba6rPo3OP?=
 =?us-ascii?Q?Tj6QLj26k7F4uZ2Pze3M6Zv7713Yg7irGLIyzKkggpC6MUaqglrp4yMLRukY?=
 =?us-ascii?Q?4AaBDi4JtoZ6gcpvUu3H+CN2ioOT9li0W/fxlpApPTJ3BkII0ftkTWYCTpIx?=
 =?us-ascii?Q?X1Kyi6y6j7iBOdtQy13ZfPg8m56/eIucDdpdfRteWW5bW3RfmOeK0SW+oi/y?=
 =?us-ascii?Q?xCvlmPJgH6vB7OUagAXWDPKfqfy0snOA0jKOysrJiI+RBqnpydBuuOjywdDZ?=
 =?us-ascii?Q?3vnFL1lEtTgqsJwyS48OrSYL28BpNtEnw5JguUYK1jIPhpD8WP1aXjd8MvHa?=
 =?us-ascii?Q?PX1a9Ue30kJcHMxXVVlR7sOZ4ZxiX6bBRjFlyt3ciiiy0+wosFx/9OeI41yr?=
 =?us-ascii?Q?9mhm/V6Bl5swH6PIf6cWeaRaF2rpMLjsiQikEM80Rk9/bfGsP8yRYZhvAzNd?=
 =?us-ascii?Q?asJAIJIAFg+a3SKvmjL8q/D8oRz/X62ampmIuN81u8sVSG+KbcuVa9Y+uKGk?=
 =?us-ascii?Q?hfknr1M7Vj9EEZJII/0LFwNiv6/A8lT4XVyWe2hThafSmSOQmznb7OIxEg9W?=
 =?us-ascii?Q?+QO7BQ1PmDOxwEwIIBStaaUrUzA4uzuVoamrvWOZgS+bZBV7u4y6Ovt0NYTu?=
 =?us-ascii?Q?flHCr4/LGR4WJ7N68ytziNXpLyp8YhsSQjBjGOGyRYnyCO75mbviAAealbdP?=
 =?us-ascii?Q?Ze/mCtHtGqqLv3G7drmrDJt/G73NcCabLPnM+OokH9ozh4DF1rQ46rHFky46?=
 =?us-ascii?Q?WvIVuE3Xc4zIk/SpvO9ScYXY+cje?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NFu/Mn6R22Nps/pOowScHHdFCkxVJeCUUFWUsPeThvMwexikT/OGkr3gqtIz?=
 =?us-ascii?Q?Uv3rpjut3lnElBr2ANQMcLiH8G2m8tkihrbie6UuR9SeJro9NyxzXlfsXQzX?=
 =?us-ascii?Q?9mSSa48260O7GrkJbg+6WlfMKkVQitGT312fZBqUILUa47EUugn+ymOLIozp?=
 =?us-ascii?Q?s7qUUz6R9yYv3yXg3eYzIDig0eSoINZTlz7i5q5Q8wAyt9JiiHZcdTk8+UMo?=
 =?us-ascii?Q?mOfN8aijCCBALg8nLWm3yVo90lv9+0epn3NR6fjzqJAgRUnlExIp/bY94+oy?=
 =?us-ascii?Q?L5eSLC0SVXo2PovMdb4ifOjm962btD/pqITrnpYGbL2AsTc/Jvn9krRuYSVz?=
 =?us-ascii?Q?5fk95OeAGVu69UBmF8YaF8Zp3aTMD9GCKYfLI932NKFrT4dgoe1zwp6lPE5+?=
 =?us-ascii?Q?7uqA8TxumN6oeBItbAQ4tUr0SPreuw3KdIi8mfLbsyCTF54NNXrYbkV8f9i8?=
 =?us-ascii?Q?uGofig6S9fJPFXvtXYWFcTFwsNVgwADXG4VsRGmgPUBbg7amdOeuvUd2kICO?=
 =?us-ascii?Q?7JA8BXE6jiR3j8cnobBlOY6uSpvxe/pyOILSgRjKTzVXvHYLLgKojR73Mwt4?=
 =?us-ascii?Q?sehm+sjkeR24Z8ZzuVtcXiMnB8crCh07JYZ1Kx0DCDTu7leynPmqE0s4Wm1d?=
 =?us-ascii?Q?LR9Ps156lYcK5lU350ArLREKurVPBXuZTTW84VLA2ZC+EZffl1PWC25V3yhW?=
 =?us-ascii?Q?DMA4GWY2ivQexdwMB0hLHmLp0zJ4v3bLehV0ta24s2V6gUWbGr7FRrgsgAeg?=
 =?us-ascii?Q?3QladiOMkfcY2kFVq5xp10K+s/DHjek/ucl8XHV9WLJaV6lMNEjXcyjQqW0K?=
 =?us-ascii?Q?vLgqgULBoUPt2YXob8Yl2/+UDylA3eRe8xXPyCzHa1fiCxEgRgHWk5/5kAHQ?=
 =?us-ascii?Q?rA2zgUDUVV+3Nv39LR+BQUM634G0aXLzmmNPDTTM04k3oRG4zYU0BFetykWI?=
 =?us-ascii?Q?frXTYWTrdIguzvVGAgZIDcs6f7l8JGdf/3ie0DPSjcKowYXY07+po6XqiP2x?=
 =?us-ascii?Q?SVOPOf8/Op9tSQ4UA84l1vb/xpvrmieET0MF7uelpCNc41F2+5emUSbuzb/b?=
 =?us-ascii?Q?PQP8mAvbxFoRZe+cqREtwwYZdOK/xyNKaBzbc13GAI3Ia7DybA8KLvD+q8il?=
 =?us-ascii?Q?JTIkzuBPVf0gkz636n2UgUx4Xk72vze+tpVXQr+ecjvsYqaJFREB9UgkWcbs?=
 =?us-ascii?Q?WQxMZCitMe5XA6wFXi29xqdkq5wLGS7rjz5NfClJegVIhbtZpN7rxdLnq/od?=
 =?us-ascii?Q?gxxQGeC+exrflYQl7Fc6r3VWvUaNXDHLx/h62M+opWVPBE0jkclu3/xgY6ck?=
 =?us-ascii?Q?ka2gSsuZ4J0KhZ5YDfYyR4zJ3qx5RU8CZ/DxqGGDnElvs5Vo7ZYBIVxeYpO2?=
 =?us-ascii?Q?IRQpFp1SIVIMZcMo/Cmws881Yl7tJQqqsl1KkJ9s1FgONr+oBL52+dTrP6SI?=
 =?us-ascii?Q?HBJN3nvxg3ys/BtUurOPM0t0oGereWG8H9r3DRwbu86fcsAQfdGvM842bi+v?=
 =?us-ascii?Q?V/Nhtai4GtIIUNTcBCX94rk471by6e6+gGyBY62Cyky9nXC9Go37RPZrFp4p?=
 =?us-ascii?Q?IEYg/XKssR3WdsRlO7XX6M3w0J5OHSwcgw8xWxLtOuhNs15v9hK/Q/UCQ3Mu?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6c7261-4239-4236-b1c5-08dd5cf163b3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 20:56:38.8070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Z1Dln2TDcp30bl0+oLZhmiZZgrezsX76GFoAeBXZ5MVzkbTkgKI4aQD3SZCPyol4HOkoL5h/UddsoYFeBPsXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6894
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

On Wed, Mar 05, 2025 at 02:05:52PM +0100, Philipp Stanner wrote:
> drm_sched_backend_ops.timedout_job()'s documentation is outdated. It
> mentions the deprecated function drm_sched_resubmit_jobs(). Furthermore,
> it does not point out the important distinction between hardware and
> firmware schedulers.
> 
> Since firmware schedulers typically only use one entity per scheduler,
> timeout handling is significantly more simple because the entity the
> faulted job came from can just be killed without affecting innocent
> processes.
> 
> Update the documentation with that distinction and other details.
> 
> Reformat the docstring to work to a unified style with the other
> handles.
> 

Looks really good, one suggestion.

> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  include/drm/gpu_scheduler.h | 78 ++++++++++++++++++++++---------------
>  1 file changed, 47 insertions(+), 31 deletions(-)
> 
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 6381baae8024..1a7e377d4cbb 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -383,8 +383,15 @@ struct drm_sched_job {
>  	struct xarray			dependencies;
>  };
>  
> +/**
> + * enum drm_gpu_sched_stat - the scheduler's status
> + *
> + * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
> + * @DRM_GPU_SCHED_STAT_NOMINAL: Operation succeeded.
> + * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available anymore.
> + */
>  enum drm_gpu_sched_stat {
> -	DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
> +	DRM_GPU_SCHED_STAT_NONE,
>  	DRM_GPU_SCHED_STAT_NOMINAL,
>  	DRM_GPU_SCHED_STAT_ENODEV,
>  };
> @@ -447,43 +454,52 @@ struct drm_sched_backend_ops {
>  	 * @timedout_job: Called when a job has taken too long to execute,
>  	 * to trigger GPU recovery.
>  	 *
> -	 * This method is called in a workqueue context.
> +	 * @sched_job: The job that has timed out
>  	 *
> -	 * Drivers typically issue a reset to recover from GPU hangs, and this
> -	 * procedure usually follows the following workflow:
> +	 * Drivers typically issue a reset to recover from GPU hangs.
> +	 * This procedure looks very different depending on whether a firmware
> +	 * or a hardware scheduler is being used.
>  	 *
> -	 * 1. Stop the scheduler using drm_sched_stop(). This will park the
> -	 *    scheduler thread and cancel the timeout work, guaranteeing that
> -	 *    nothing is queued while we reset the hardware queue
> -	 * 2. Try to gracefully stop non-faulty jobs (optional)
> -	 * 3. Issue a GPU reset (driver-specific)
> -	 * 4. Re-submit jobs using drm_sched_resubmit_jobs()
> -	 * 5. Restart the scheduler using drm_sched_start(). At that point, new
> -	 *    jobs can be queued, and the scheduler thread is unblocked
> +	 * For a FIRMWARE SCHEDULER, each ring has one scheduler, and each
> +	 * scheduler has one entity. Hence, the steps taken typically look as
> +	 * follows:
> +	 *
> +	 * 1. Stop the scheduler using drm_sched_stop(). This will pause the
> +	 *    scheduler workqueues and cancel the timeout work, guaranteeing
> +	 *    that nothing is queued while the ring is being removed.
> +	 * 2. Remove the ring. The firmware will make sure that the
> +	 *    corresponding parts of the hardware are resetted, and that other
> +	 *    rings are not impacted.
> +	 * 3. Kill the entity and the associated scheduler.

Xe doesn't do step 3.

It does:
- Ban entity / scheduler so futures submissions are a NOP. This would be
  submissions with unmet dependencies. Submission at the IOCTL are
  disallowed 
- Signal all job's fences on the pending list
- Restart scheduler so free_job() is naturally called

I'm unsure if this how other firmware schedulers do this, but it seems
to work quite well in Xe.

Matt

> +	 *
> +	 *
> +	 * For a HARDWARE SCHEDULER, a scheduler instance schedules jobs from
> +	 * one or more entities to one ring. This implies that all entities
> +	 * associated with the affected scheduler cannot be torn down, because
> +	 * this would effectively also affect innocent userspace processes which
> +	 * did not submit faulty jobs (for example).
> +	 *
> +	 * Consequently, the procedure to recover with a hardware scheduler
> +	 * should look like this:
> +	 *
> +	 * 1. Stop all schedulers impacted by the reset using drm_sched_stop().
> +	 * 2. Kill the entity the faulty job stems from.
> +	 * 3. Issue a GPU reset on all faulty rings (driver-specific).
> +	 * 4. Re-submit jobs on all schedulers impacted by re-submitting them to
> +	 *    the entities which are still alive.
> +	 * 5. Restart all schedulers that were stopped in step #1 using
> +	 *    drm_sched_start().
>  	 *
>  	 * Note that some GPUs have distinct hardware queues but need to reset
>  	 * the GPU globally, which requires extra synchronization between the
> -	 * timeout handler of the different &drm_gpu_scheduler. One way to
> -	 * achieve this synchronization is to create an ordered workqueue
> -	 * (using alloc_ordered_workqueue()) at the driver level, and pass this
> -	 * queue to drm_sched_init(), to guarantee that timeout handlers are
> -	 * executed sequentially. The above workflow needs to be slightly
> -	 * adjusted in that case:
> +	 * timeout handlers of different schedulers. One way to achieve this
> +	 * synchronization is to create an ordered workqueue (using
> +	 * alloc_ordered_workqueue()) at the driver level, and pass this queue
> +	 * as drm_sched_init()'s @timeout_wq parameter. This will guarantee
> +	 * that timeout handlers are executed sequentially.
>  	 *
> -	 * 1. Stop all schedulers impacted by the reset using drm_sched_stop()
> -	 * 2. Try to gracefully stop non-faulty jobs on all queues impacted by
> -	 *    the reset (optional)
> -	 * 3. Issue a GPU reset on all faulty queues (driver-specific)
> -	 * 4. Re-submit jobs on all schedulers impacted by the reset using
> -	 *    drm_sched_resubmit_jobs()
> -	 * 5. Restart all schedulers that were stopped in step #1 using
> -	 *    drm_sched_start()
> +	 * Return: The scheduler's status, defined by &enum drm_gpu_sched_stat
>  	 *
> -	 * Return DRM_GPU_SCHED_STAT_NOMINAL, when all is normal,
> -	 * and the underlying driver has started or completed recovery.
> -	 *
> -	 * Return DRM_GPU_SCHED_STAT_ENODEV, if the device is no longer
> -	 * available, i.e. has been unplugged.
>  	 */
>  	enum drm_gpu_sched_stat (*timedout_job)(struct drm_sched_job *sched_job);
>  
> -- 
> 2.48.1
> 
