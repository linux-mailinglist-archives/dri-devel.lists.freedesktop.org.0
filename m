Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A85B1EA81
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 16:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636DF10E953;
	Fri,  8 Aug 2025 14:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h1MdFVMa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B57510E950;
 Fri,  8 Aug 2025 14:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754664042; x=1786200042;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KKfUpWnEgL/1jaqD2g9AiP6ENSg/0F+lOH5DXN32+TM=;
 b=h1MdFVMaqU3TM4fOg81Umz5wjxrQomVXpMUx+IEH8Y9y8+msrSNHnsSN
 brLaj03IwLwiFhJO+9cWlVx8zjYIXQ3sQRH5XeHe75OvNr/PhEDs/69Ys
 fxUz8a32WsvY47Z6Q3BpV+qkvjBaGIAU9/1yd1K/QfYhuq3jCg1rZ3B+b
 6GQTodYyM7nhk5EAMEWyXwCM9VjyyyVE/uFHD6am9xhPmr0z/JzYvg/Sm
 ho8E/iLvn1/XF3jugoOzHXmbMU63C3Go3XJQEdvCmMt/NatmuEv732TuV
 h5+NGrSO+wx5GqQoK1kt2iNZur9NPD2jUfWh1UFUt3GiGI/Jc++ORIpVR w==;
X-CSE-ConnectionGUID: sdvGXwaEQZWRfRowj5xYQQ==
X-CSE-MsgGUID: niFHl7JKSRabpum6K3B1Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="59625376"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="59625376"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:40:42 -0700
X-CSE-ConnectionGUID: WZqrNIKAT9GZ78Uzci3HNw==
X-CSE-MsgGUID: /+KW1DY/TY6OFZj2zXnVSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165755805"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:40:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:40:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 07:40:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.85) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:40:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yr4YjpAJsb8qz20LMNvMb1JAk60XMXOgJFwU9QE2EqjDYjNalRFy/gYxgH1YHN6orcurXuhkJq0HqbcM+dUPnjxoFTCdzw3SWCFiFc+vGhGHgz2gmgI1/V0Z6CUUKw1vVHDv7Oz8NqKx/9cPa5wu0R087tW3B9RNf5rVSP2lBP8cRG4kcDuoAkbNy/bmMdBaO0PfNbhCnXKbaLyNb5JVH0pcz3I9hFvI93UX79p7sUt8MHWm7EHeXskyo9ysUgXXgrchuEfuyjKKiU6Bvm9GQPFZ5HlnK4jj4uIPYteP4MwcUaPIgoV2OuAqVDXA6N7Hde2cMd4P9SJB49eyWIQRwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijH9tijkI3OmU5N8txSoe8PoTuYRr+CbfJnVxsoIZxs=;
 b=P2Uy/9HEpzFuh4GU9WYZxhOTdp0nX0ru0lLKYr11AIYktAAfnCvLf5qP/kaWMnSpph11/vS8STlUjTUEBwL7AJu8dt60ZhtCVwmFycOmKoWanNmKP+aiN8zuNeVU+pDcSh0HndwYV59acnC3H6FADGzFoo7W/TrOv9P5py8epqZOs20SkY1r5tPmzkLuheHA6s7VuOMTl58PfX0v7RtVW8/G5q1rQquNk7/4jYjWeE/uE4twjiT5kMtaVh7loXtFASY4e25LoChpXpQJQbOVfVvkodsG4lmDw70L7NqZD7GG84a+iJb6Ei7C2D0uNOP2b7i37HoNWzBJAdpeTfNNhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB8204.namprd11.prod.outlook.com (2603:10b6:8:17d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.17; Fri, 8 Aug
 2025 14:40:37 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.018; Fri, 8 Aug 2025
 14:40:37 +0000
Date: Fri, 8 Aug 2025 10:40:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
CC: <joonas.lahtinen@linux.intel.com>, <tursulin@ursulin.net>,
 <jani.nikula@linux.intel.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <mairacanal@riseup.net>
Subject: Re: [PATCH 8/9 v2] drm/i915: Remove unused struct_mutex from
 drm_i915_private
Message-ID: <aJYMYkTQN5fYcXr9@intel.com>
References: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
 <20250807170212.285385-9-luiz.mello@estudante.ufscar.br>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250807170212.285385-9-luiz.mello@estudante.ufscar.br>
X-ClientProxiedBy: SJ0P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB8204:EE_
X-MS-Office365-Filtering-Correlation-Id: 2820ebd3-d848-4512-3990-08ddd6898a45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y5H7uWyZdL1+Jwdqt5o5rC89CFxexEPSQp4+0KcTye25jGAM6FVokHmXIAcB?=
 =?us-ascii?Q?HmTQCBBHeERPScM9QmfMf8LXSfhaLhY2MZdMl7pFs9XUSPWVemJu1RBu2CgD?=
 =?us-ascii?Q?5LMlD0rhjxR/4eGyWtdL5LM9AsP7drMMhw/0Tr7ihhv+jboO7vNobAGu9lqS?=
 =?us-ascii?Q?93WnZZkINih/geY1tbnnFlvQyo/Kl5H5ZC7HIK4TwoIcDcmrSwLfhMpY8Ay5?=
 =?us-ascii?Q?OvFy1tWflGgoUnKCtUeSWlVmoByPL8V7jxkV20sdlkVgWGarBsmEAMNJsCh+?=
 =?us-ascii?Q?1zpm9okf8TpEU9wD+iZM7I23jVrjFbwQlS3otQDwULBfw4N4RHnc+9I0/Azl?=
 =?us-ascii?Q?ZC5+2xExrUOvkXmzIg52fWfYDqRVHBM+6nHC4z7Nfns04VXKk7saeUdJ2iRv?=
 =?us-ascii?Q?pGAghjDsBK0uxNkeGHvOUZkuoIUKRlisVbO/y2b+DFzzwdSKF8YjH/aHNEGJ?=
 =?us-ascii?Q?YiWKxSJCSHn8hbpaDHOml9yTT3MUgKEG/YJEDB0twzxLZzRXPlh4XUhgi8le?=
 =?us-ascii?Q?EGYdqeB4QNMI9k5MZm0cVbI27MqOc2bcKTu+xLJWoKXkiFp40fy+N6TMl0r5?=
 =?us-ascii?Q?iQ0ku32HgWvvPEnBLQ/pmuv9hp5Iz03b09YxhpjcjRSmQtvpD16AkqrXv/KK?=
 =?us-ascii?Q?QzLige6j86Tp6VDzgABcTgPbU81uj6wnsBIXg+iJb1T55c2F2KofDEwIFK5N?=
 =?us-ascii?Q?vNVrbwBHHrfAy3BQPUbagIRMh8ZU1TySvK6r4McLwiqd7ke4ZU63K9dI3n+j?=
 =?us-ascii?Q?suBg2p5yvIltY7dis00QQlIRcjNChxz4nisupf452lqTLn/HqAyE3etCvJ03?=
 =?us-ascii?Q?KhdwJw3rGukn1HUdrP6F7m70h3hs7VjVlxx0P22St4deDQaf3HgV0IpvIpMp?=
 =?us-ascii?Q?YiUyJjFMVam8BeNT4HFrVr0IfGFFpLhBvLUtrKpq1kP2Nvba2bPE6DU+DAHK?=
 =?us-ascii?Q?4Jz398RtS247jjdpAU+XVClBlq6bSVmjlnnicYcHzphzjzRustA5mPxry/Q+?=
 =?us-ascii?Q?uHkF979bi0gH6w8NmyWq6LlI2QeQlfI28rwiRqGdb2H3P2S5yg8zT702PH4g?=
 =?us-ascii?Q?0de9nyvtIlPCoGcxS4XFFd9dfczmlviLrvoBth6xxGZXVDdgLKjjS/NGczE2?=
 =?us-ascii?Q?R1/xTcXKd/6Gv+p7TtVV1U49nIijwwKus/32B5lrezxLzFQKGVKUGoLaS+oj?=
 =?us-ascii?Q?AZpGU1HbwDvJeRcFFqbMi5U/mREMwtYfC0Wzu6Fe77iE89Tjd6F/B3+8qILM?=
 =?us-ascii?Q?jgpbIiA6siSp69kHOTjowiuHwnJjVBrmWFoc/D2OjNuGxxqLgKPiWkXj1eha?=
 =?us-ascii?Q?8upl0tRQm+Zc60ULGT7iDhtDenttoIM4hZng32XrEYP9Qa/2qNxLvfysnTL/?=
 =?us-ascii?Q?HkTA1iRWWTPc+4sqYVeIlepsU/oQ+UlPe0vluagrKaT/OuIiF+fOgmvhdTxo?=
 =?us-ascii?Q?JdPwewtOGbA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OCSScroiswASu3l3Zp2wXTeL20omxZ6SUXT+2TQStWQtLsjEph8l+CpPMHZ6?=
 =?us-ascii?Q?V8t6QuniGmPgHJWQq5h3l+sh77uHkxHskYjNZOlWudSfMjJwm1ETm2n3tkLV?=
 =?us-ascii?Q?Zd6hPfO5E79fKCo7p+BCrhJNx7mqy54VT5Y8mJcjckAGUj1AEOuRzLXqE1YT?=
 =?us-ascii?Q?SQfEr5dntpe0PqkKt2dMnwjIf0qEjAoccF7M8nm/D8ba30z439HyKcQJYCvo?=
 =?us-ascii?Q?IR6dwa7I5v2W4YgZZJCDu7UgziCQIo717di/MPxoHQzUAw6dyaLsB5sFWBNE?=
 =?us-ascii?Q?dlv5TnBzeH8JZAjusaptL1KrR57+YHADDcOeFlH1q6cLU7dt6mZlQAA9pvxC?=
 =?us-ascii?Q?+dN79oKSrKb6GvT0hCWI4I5BZeDYRGvkXzISU0Qi4ytjZrk+GnYgt4lbMUpf?=
 =?us-ascii?Q?yaJ2eES6c5DnA8iQZtbmRO2zWy6SReHvwCnfJklmnRx+ZQYRA/0pCEj1bA7m?=
 =?us-ascii?Q?wTYNNwd0gfmvI8stTlVGjycNLsyCHtGpO6HaqsGep1PwKwva+QMtEKo298DW?=
 =?us-ascii?Q?PnU9arfkQanZD1v7dr9/nyjrhe8bQjOfBAIZP/Mc3qr/ynFsjYkHMGU6j5oC?=
 =?us-ascii?Q?KoRTQwOegDSfWut5dgeo3F0wPv8GVPHQEG2996OhDL9J7bPH8urrD1FwYoLf?=
 =?us-ascii?Q?7JvQYtMnppBL4Rwa289UMHvwL3sOGXVkWYVlGXad/0DqxH8pABupR9BqjHlE?=
 =?us-ascii?Q?rMMBLWcHtyUB7Hf4/rdSYoGjyj3rAevzUMKFYjIcV1Ui5RuDmuJW/8VO2BNQ?=
 =?us-ascii?Q?E3Tvv/Cj2EpB1b9ObVblKh9RsfrkwvNL9GOn1os2vkBaN5bOwGuk/XIeyjEO?=
 =?us-ascii?Q?Mp3Yy3Nd6NODsK2a1p5/bTW5hIp4mKD3cDUQonbT3m/PokBsGOmdIE2YvTAL?=
 =?us-ascii?Q?QY8vPelYj+znE3Lkoi3kr7lu1Mkj0sJ9SbokpAlt57eZcXwtq5Qr5x0EsZP7?=
 =?us-ascii?Q?HCnxZc5TDL5NBuk8W1GHDttLkYmFRV5N6SXDixwiCG5ZVgcVNvqvdsQZzVLb?=
 =?us-ascii?Q?MvX+iRmwGSTbvo2xuo1NkiHTkeMraTf3ExPylHJpOo8DN8R3uqpyLHFr9yiA?=
 =?us-ascii?Q?74CdT2GaQe4knP+Roh3xl5qtkekOGO95zFasCgSdOh0B6glkz5fLn2SXJ0dk?=
 =?us-ascii?Q?ggcbTNuafR+4jfqyRA/VcNhV5KKpxbv+Pej1HccEqoxqefCqbgxLVOrxp/0o?=
 =?us-ascii?Q?wGqhIVjqOF72mlqrbJlSYC1pKoZwyTVoH9MqJaK9EY9XbjS9NDDzBPFZUUVk?=
 =?us-ascii?Q?hy6h7FyllDgBfhVt6vxt1E+okGzsWX8m9tqZXXIvjfz1ecwQEKqvB+QdkYUs?=
 =?us-ascii?Q?A1X3/gNBLNghp5vxWF6T8jVPHYZWWrryDKNKep7ctprYit5iTvNwW1qxXNCS?=
 =?us-ascii?Q?zjjpJ/022wtTlQLEPnaQDCiym8ybwPzPgmj5rKmzxCajuYohPvbgQbL8yLXF?=
 =?us-ascii?Q?qSDEwBNaS8aDhFQXiif4A+vj3b8LV4U20yj5OMvpxuQyeS4fEQTB+xcp5/wP?=
 =?us-ascii?Q?84DlejWLvZZJNH1EBaukcPYhbBhq7EUoGTFc49I1m2J5mCSJ/R4ArDITDb0S?=
 =?us-ascii?Q?EtWz6JVQThOeKTCft9CH2hb7z9oxQkV55LAW8ZOb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2820ebd3-d848-4512-3990-08ddd6898a45
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 14:40:37.6984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcPuT1MgzgWhito/rKGqVJWOnjca51EsUipPHf96HnF1rWIf/f5CHLo8Tfdz0+tRtMEdP3X+XhNbCg1/1yOdRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8204
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

On Thu, Aug 07, 2025 at 02:02:07PM -0300, Luiz Otavio Mello wrote:
> The struct_mutex field in drm_i915_private is no longer used anywhere in
> the driver. This patch removes it completely to clean up unused code and
> avoid confusion.
> 
> Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
> ---
>  drivers/gpu/drm/i915/i915_driver.c | 2 --
>  drivers/gpu/drm/i915/i915_drv.h    | 8 --------
>  2 files changed, 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index d1559fd8ad3d..c6263c6d3384 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -233,7 +233,6 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>  
>  	intel_sbi_init(display);
>  	vlv_iosf_sb_init(dev_priv);
> -	mutex_init(&dev_priv->struct_mutex);
>  	mutex_init(&dev_priv->sb_lock);
>  
>  	i915_memcpy_init_early(dev_priv);
> @@ -292,7 +291,6 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
>  	i915_workqueues_cleanup(dev_priv);
>  
>  	mutex_destroy(&dev_priv->sb_lock);
> -	mutex_destroy(&dev_priv->struct_mutex);
>  	vlv_iosf_sb_fini(dev_priv);
>  	intel_sbi_fini(display);
>  
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index e8cb94962482..5a8ac1a52849 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -221,14 +221,6 @@ struct drm_i915_private {
>  
>  	bool irqs_enabled;
>  
> -	/*
> -	 * Currently, struct_mutex is only used by the i915 driver as a replacement
> -	 * for BKL. 
> -	 * 
> -	 * For this reason, it is no longer part of struct drm_device.
> -	*/

This will need to be rebased like I did in my resubmission for CI once the
other patch removes this trailing spaces and fix the alignement. But with that
change, this patch is:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> -	struct mutex struct_mutex;
> -
>  	/* LPT/WPT IOSF sideband protection */
>  	struct mutex sbi_lock;
>  
> -- 
> 2.50.1
> 
