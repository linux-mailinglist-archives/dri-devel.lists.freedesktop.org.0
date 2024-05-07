Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2174A8BE208
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 14:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D263910F4F5;
	Tue,  7 May 2024 12:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LxPAP0mL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17B110F421;
 Tue,  7 May 2024 12:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715084754; x=1746620754;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3dNPkxNPlsYk2h3hdYT7UAW4e1mwY7nlx/juun6jCEw=;
 b=LxPAP0mLOB1vEs3P/0Sb01leYQm5AcuWQVv+4MGdUR2RVTM8iu+1ZHpM
 l3GAmHcDisPsZMxet8I5dY15JnAbBLHfE3ylMWREwYJhltvIN0EvIrKtD
 lsKzmWBeTxRCa62S2nGBhkWYSvujww/qcKJFajCNvN+P8YP3pv+TTujBw
 JiA+xSJuWOYiuVK5HWq5wrhcCqiX4UBqtuh19OXMPQFxkDd6hGgMhOvRG
 R1VTQUvZ/Nq1oKdw0UY8X3kyq3puBM1Yx8XYS53w7cNcqnt3PnnIQP4N7
 BEebiKUX7wbyqE+HLNnBW/0nNkvpoy92z4Iw0AvMmqCh1t5s5uWN2o+Np w==;
X-CSE-ConnectionGUID: VtVfXbm1Q2Cn6D4dYvu9ZA==
X-CSE-MsgGUID: RZ4OOLItQaWWmxQHA7ib1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21543618"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="21543618"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 05:25:52 -0700
X-CSE-ConnectionGUID: Dqrj6TYtQp+k13DcFDciMA==
X-CSE-MsgGUID: Ch0mZbw5QqCkcrf6SAONSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="28911810"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 05:25:48 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 05:25:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 05:25:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 05:25:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWs/1gyvWQt1F3I20pWsD2hh49goqyoLInAvPSKc8rpU41GBGnrzdlQBd5RUdp61KZ/KbPF2tvOVVUdi2hbb9+sGLrTttxxUYm5J56XrZY/L6quTMivu7DKOOX/YZrf2UBqJI4SowMie1EhAcGgEo/SaLwPxrDikZUoRfsokCPwBy24R378dFnPvW8Jsoq69dg7jVCBr9YxnGV+XXviZEbPf827DV/4ZSrW6kLovGKP3cI9OkW8l7Yfe6ZliyDVtur3GqkwACTeI+xeLy+ZiXpZiZTRoMxz5F+6GaXwixnSKbEXD8J9+QQNUSiOFb2AXcfmklnCX7M33liCE6e4Y1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTG1ILnVwQPGkDLmMn0P3hoitgyu2qVWDbHSJL8wyU4=;
 b=lErLs1iN2YpH8Djc5IwsoWrH0uzQh3z9+Si103L6K04imA7Y/ycHK9affvc/iFcoufaWIzFzdRlK84ex6JyPRTMLmafzrMWBL2mJSue3/pkK7I6GXyR/xyqnNvxD6l6uHOh+lMsSfMLgxGCFUNiQzkmC76nppC7r+3JvprZ/mFdsN799hevyeulopprAnPkfJetbcJ0xT9ESbLL9BVQ3/uVWDpvfPqUuwOH0AsJ/SLGBWTpC4FsBHBV24Oq5usGBeDfta53LmDNUbJFrYoDoOkWcpLYbNyY3P3D4Kexjfh+ZwJIaPDm/typOQ/HhBLk/IkjqEb0GIl5hap3MImr7Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CY8PR11MB7195.namprd11.prod.outlook.com (2603:10b6:930:93::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 12:25:44 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 12:25:44 +0000
Date: Tue, 7 May 2024 08:25:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: <javierm@redhat.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <inki.dae@samsung.com>, <sw0312.kim@samsung.com>,
 <kyungmin.park@samsung.com>, <linux@armlinux.org.uk>, <krzk@kernel.org>,
 <alim.akhtar@samsung.com>, <patrik.r.jakobsson@gmail.com>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tursulin@ursulin.net>, <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <tomi.valkeinen@ideasonboard.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <thierry.reding@gmail.com>, <mperttunen@nvidia.com>,
 <jonathanh@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 08/11] drm/i915: Use drm_fbdev_helper_client_unregister()
Message-ID: <ZjodweGCM0_zd2L0@intel.com>
References: <20240507120422.25492-1-tzimmermann@suse.de>
 <20240507120422.25492-9-tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240507120422.25492-9-tzimmermann@suse.de>
X-ClientProxiedBy: BYAPR11CA0041.namprd11.prod.outlook.com
 (2603:10b6:a03:80::18) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|CY8PR11MB7195:EE_
X-MS-Office365-Filtering-Correlation-Id: 745369df-c532-467b-fdb7-08dc6e90d0d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|7416005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1fUgBxaahXXP9PgafUsrBMh4HK1dz8Fy4FPK9tYt+F1N9xz4IGU03QQ4s2CT?=
 =?us-ascii?Q?wQDmbCSEEu7Dp/vr2scJqk5h3GF5Uh8/F7CJxQcOZRFpmWkftZwJYyHbgWws?=
 =?us-ascii?Q?r4enk4R+bf7pcw6zfnl9T6jW8hY9ReoGBhDSDBJdOTq+IPayRXu3a8WezLzv?=
 =?us-ascii?Q?o7UxbLWwUf54wpv2t8kxUgEG42gUDuIPJ6RceILZ5Cdbd9mqqMpeG0dOvADN?=
 =?us-ascii?Q?n/rr7lNmj8ZK0ecddf6PDOPgvqKPO654SaxjDPI+h7/+UVFuQTVntYoQHR1x?=
 =?us-ascii?Q?QBnSTg/ESHPkw9shP/JZ7xKtbMwTlda5Uik0HgyzY0/7VXaGzKnauGq0GYFP?=
 =?us-ascii?Q?m9TAkcxqwJa+PsrLALFydF56bag7iHdsCCprssnzoDJF0vST+tOwOdabTNYH?=
 =?us-ascii?Q?35nZXLn0U3EG8aWK3m6bCCs18Sf9AzzkwiC0/cLYh3XnXWaqtPGYMXNkrBW0?=
 =?us-ascii?Q?YIlBiIaQ8n+YlPstY514u2ENWbhl4UtWiG8KRag32q08puKtX5BDrGi1CX9U?=
 =?us-ascii?Q?lzrn+Sk8C+9pL7Xm476ZIF+2Z7TIUuFnFjBSpPD+oethSa4XHwRQlxI/JhiR?=
 =?us-ascii?Q?7qJhBJfzsRiVoJGe+FLbr6ype4juz63HTHF8xsyd4L9pXw3cBXX5gW/+jyE3?=
 =?us-ascii?Q?nz7c4XY6bw3heTMywoq+0WdkenWBykXb5k2GL8is1UmV4IUC9mVogjYONq3T?=
 =?us-ascii?Q?naK92ABmLzctH8orywPiSJ+Q6v+XVN5CrdCTjgAE/b7MlacOJ/Jiv4Rbal5U?=
 =?us-ascii?Q?TXSv13PU/UNrj7QW7sKH4h6TKaUgkoSK+AE6JEmeOWVFF+9PGPicBUYbvHEZ?=
 =?us-ascii?Q?4NlVB3oo8HCCsHxSbQGVWgDFrNxE78srMiwxWcsS3tZ50jX9LUf1dpj/umDA?=
 =?us-ascii?Q?unP4OEwVRav02yNjIySXC6jbI7s1rVLSsRCwSMiIovgE8s5MZA/im3i/T8AA?=
 =?us-ascii?Q?xnnDX0WIL8GRgyogbhrfBFdybhgtVrD2W6K+mpPQ1vQe7Ftw307kV3xF8sjx?=
 =?us-ascii?Q?3GCp60k003s82fwVOVaDJFxjBmoQGBtT5GgAwEuGMYpsZLT+sDpnvlSlUVdg?=
 =?us-ascii?Q?ut3nryWC73bEl3cyDt/b9TLdqtW9bb+dR1QeggSmkljjT8Yf2Od9+RUBoPj4?=
 =?us-ascii?Q?ks3zbSuWy3GHJM1AqzPFyhwvi2hIXPvGdqiwHCi77h1P/vj4YbhWTiGGQ603?=
 =?us-ascii?Q?m8VNrTsQS7wGl9oVRyoW4Bl1G3xiRA/foxvZ5Y++LJ4LISl53VNEyeb76KCv?=
 =?us-ascii?Q?sEuOH6PYidKIwm5nsiV69c4T38DA6r5b+Csy59tO7w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(7416005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9KTKnZFtMmkBErk+bgSrFag7uMyI0eG8sRdQ4sOmGPPSXaH5+TnWDhrjFeWm?=
 =?us-ascii?Q?ULdgjawdjF/ik0jRdkdgjh1R4aVqbb5zGmDlr62ugUyQnCsKz+7avGnNg95d?=
 =?us-ascii?Q?QOhMjML4KPnpJHPZx+OCVdVwVTYZmL6ADU8/qNw6zTEsdyo3LDYB/LVTHScs?=
 =?us-ascii?Q?MezXL6MeVeT/LqmxkmZt9eb+PoEVjtAOMS2BxfaJx3K7q3lGv98ItYBM4fP/?=
 =?us-ascii?Q?OCIxpqEikaKFrKxZOAoeQ4hqHtjmwoRhzL88A/RqAOj6z/LV6VimC1hrbcbe?=
 =?us-ascii?Q?d687Pis3S7mLRj8OlIgBSMnWbI3KNwGXOKEJu8ZBge3kEksV6MzkM7YW6kLs?=
 =?us-ascii?Q?B4Dz72xyW4aTNIO+DAbvc1c33lAK9oq+Yj3bjQfwc0xyDg22bVvMEbU0bFCr?=
 =?us-ascii?Q?9I4QMFv2JtF9NGDjTStHzAlOtbc6v1kH9fIu0ulBT7/x/gt4XpY4MHs4l40e?=
 =?us-ascii?Q?+TwBjUfRV59OUzg0m9pxIeE6kQNIIQ2pQr8ld2XdeMTjWzWVSsIBP8Fif544?=
 =?us-ascii?Q?niW4pxJ1TG9AopMUWgGU4yrY6bMl1kGdEyAsWOlcq7Sf1NRgX9QAgcV5TEaq?=
 =?us-ascii?Q?Md4G4N2s4B58bZUhPRTDIYy2kaaZwDG9k/mDEV5LbIADGfDbWvqNPaEvzuzO?=
 =?us-ascii?Q?5+TR95CTkrM81Ing6tFSgSRkIOz/7ICaxbPzNUAboebq6ZVsi5OE9NPpkN89?=
 =?us-ascii?Q?Wq+AXwy5CD72YlOFgT5ALko4CEfZpeq+4K7rhepDX/3KbEB7cSPvRt/rU2w3?=
 =?us-ascii?Q?X2mhp8Zzh4PwVEMT4N/bbSfmqrqLGkHN9j0PUiKs+x3yyPoNCmf2rQdM1wbZ?=
 =?us-ascii?Q?+0cw+fDCChPD4YmKnuLA33maikQXh+jxkdjSraPO7htOqIFc9FgVq4qEtlt8?=
 =?us-ascii?Q?26saRyMR7ohBfGbNuLVViBXZkfSEgPPCXjVCw+HB+Q4vLbj7Gj5zoU5gTw5g?=
 =?us-ascii?Q?jt3G0+dr9lNQj2xLwNmu5cQPBrfRKPGT4ywI8txt5kVzIa0qiF8dv+KUMwxr?=
 =?us-ascii?Q?N+MYt8Lt6U6qiuTov95rGM5R1uCWnYPilvpVLwyydgYF8dKWpgd0wkH1ImnS?=
 =?us-ascii?Q?fEAyoB/XlyrFQhP38wJtScfS74DhkY5dUZEQDbgeIlRkggX1JVTWymWiwVeQ?=
 =?us-ascii?Q?2s+5tuJjc8qkzCY9s2txhFkP4dts1P7QuicFsWGVXhy1EvskWbDy+W6FieHO?=
 =?us-ascii?Q?g1g02bsiNxtKVHiIyQepnJXC04qoGUENypSKBjlMqD6IwSgEtG5ui8sn27eC?=
 =?us-ascii?Q?CybqBlvJkPdl2Fldc5GNXSFh3pbEwiUgEvXF0fEzzOVlhAMd9vezXNNkCGR+?=
 =?us-ascii?Q?Y4ag50R5Hqh1JWFQhpwZPMwu8IoRuCb9aQxvF4aNRZe8i4+GG9aw5+Icod4y?=
 =?us-ascii?Q?bhkdz0i2DXlOp0HqCeASYOWzO+5zJJBk+Wsr3lLPCLUk/9LO2Q5Ze8pGlSQu?=
 =?us-ascii?Q?uGq56lQtAs3GXUDEHApM5otlPayYj5r67qFC2GKi1XBoaJ47HzWbCVKI9GJR?=
 =?us-ascii?Q?CbgoVPBZ1vCVAu2g21yay5WupL7ZCdG8WNh3hz26mqtjsFn73QlgGz3xOdWE?=
 =?us-ascii?Q?UVAszqIDXLA13jtkLB1Lm2w0LK6Cr2Fzfc8b6tO6RCqTj5hvdm9GMqqaY08w?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 745369df-c532-467b-fdb7-08dc6e90d0d4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 12:25:43.9901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2FEtgMcmnlOhLzJXxcLjvmsU6lQE8W1HNqbV/qjriMN/pq23lqM37MANhoJMOw4foxfl8HN59Bpt23WCuh/yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7195
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

On Tue, May 07, 2024 at 01:58:29PM +0200, Thomas Zimmermann wrote:
> Implement struct drm_client_funcs.unregister with the helpers
> drm_fbdev_helper_client_unregister() and remove the custom code
> from the driver. The generic helper is equivalent in functionality.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c | 21 ++-------------------
>  1 file changed, 2 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index bda702c2cab8e..f1b4543bffc02 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -38,7 +38,6 @@
>  #include <linux/vga_switcheroo.h>
>  
>  #include <drm/drm_crtc.h>
> -#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> @@ -580,25 +579,9 @@ static int intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
>  }
>  
>  /*
> - * Fbdev client and struct drm_client_funcs
> + * struct drm_client_funcs
>   */
>  
> -static void intel_fbdev_client_unregister(struct drm_client_dev *client)
> -{
> -	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> -	struct drm_device *dev = fb_helper->dev;
> -	struct pci_dev *pdev = to_pci_dev(dev->dev);
> -
> -	if (fb_helper->info) {
> -		vga_switcheroo_client_fb_set(pdev, NULL);
> -		drm_fb_helper_unregister_info(fb_helper);
> -	} else {
> -		drm_fb_helper_unprepare(fb_helper);
> -		drm_client_release(&fb_helper->client);

The only real difference is that these 2 calls are inverted in the new
drm_fbdev_helper_client_unregister.

I feel that the releasing after the unprepare sounds more logical,
but if there's no actual issue with that and it is working for
everybody, let's do that.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
(to get through drm-misc with everything else if you prefer)

> -		kfree(fb_helper);
> -	}
> -}
> -
>  static int intel_fbdev_client_restore(struct drm_client_dev *client)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(client->dev);
> @@ -644,7 +627,7 @@ static int intel_fbdev_client_hotplug(struct drm_client_dev *client)
>  
>  static const struct drm_client_funcs intel_fbdev_client_funcs = {
>  	.owner		= THIS_MODULE,
> -	.unregister	= intel_fbdev_client_unregister,
> +	.unregister	= drm_fbdev_helper_client_unregister,
>  	.restore	= intel_fbdev_client_restore,
>  	.hotplug	= intel_fbdev_client_hotplug,
>  };
> -- 
> 2.44.0
> 
