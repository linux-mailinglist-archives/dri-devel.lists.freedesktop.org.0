Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DF6955AB1
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 05:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6533210E127;
	Sun, 18 Aug 2024 03:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jl2HIvNi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541FB10E127
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 03:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723953033; x=1755489033;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=55/k1eSGhDICyztU2b+YpsbGVGcHaS995ptxzYWHLRI=;
 b=Jl2HIvNiHfcayQUpkkbCCV+VS085H+dqVNI95g2G9NqXPQwNPTBWnb4k
 IZWV/hpEvWtSceefkdwE4dlOi+E5UjZKPg+dambKWXdpzlGo8qRY8qkwq
 18I7LWMJgeRFdG0/jqz5Y3Vie3HEIji3sBKe6SenSSnujlyRKVwhJ71dx
 QP/zAQLsCVFYuCXicIiXsIVj36hm9I+BXrn4JKqcHqL5mFc+HgRqDJtkq
 0gLM0/lPIPfhJv3/9JUBHy4c+ucEWApG3Fo1MEOkPou5IQAJf3IcUAjQs
 9+1JsxOvVlJyrFuk1x0adHmN2/yzkKJvwLBse6lA2eGoqUhKv4mrpYjIP w==;
X-CSE-ConnectionGUID: QPe0+Ju+QWCw0O6fhv9Yqg==
X-CSE-MsgGUID: MMI5PD8CQoGj5928BYw8Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="22360978"
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; d="scan'208";a="22360978"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 20:50:33 -0700
X-CSE-ConnectionGUID: xQvKijblTauC7z8/GHKVbA==
X-CSE-MsgGUID: FWxjKIwsR7mRPaoFVIr6+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; d="scan'208";a="64434889"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Aug 2024 20:50:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 17 Aug 2024 20:50:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 17 Aug 2024 20:50:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 17 Aug 2024 20:50:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGv0ufl8LTCUhZ3F+DXwH6oLNVVRaCqGGEt2NDDJeKnhyRLT+WPeCw9iFFBmelN5D9FxgcEbVmeM+9uklD1j+GbNLb4ZyTrUoecPM270ZhxaGvAYaJDARTussndKszqwyWH6khaBtJGfsQW6zyH4ndNG65i3D9TZkJ7XTHtdlXj7PqjX7MyS3+kXLWKhBQjFqzHPo+1KiMqcqkLRogPU0rfOnVErcuVq+BfeapWNMO2m4CsYCVMPcvehs9aqVF+Mmk53TcEcwB4cU0qlR1ax451hy0VzvuNf2Q5czZHb2LNffjnC9CHlnUbp/W2AVs3mTshKKM/Mj6Wai2CVHHkGcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIzIaq4uy9EX0+pFCo1k5jjPsng24+PJovC7NCW/VLE=;
 b=x+qP1bQ0pgFE2SVeQ+ce3UzkbsqlLiBWa1fSqPYiZkCd0GiWD6UeMIQ931TTmegp8vz0+ea3y5Xp34V0ZDF6Fns2dhga+1rXua4vKn4TKHjsvAPigxMiGQ2wihNLPE8YTSc4IFS01we9i2VipPtmWTTLomJHKj3VZqSIkIDtyVCxIRalLMkpGAk2NpKUEctn93Lx+/yQMs1wrwaUi5srPDRbPw5kAj0RsShJUGoE2uwgpZeTJIIw7bNbmeyIVLM4UezmBQL8YmSbv5PnCDEf5jpsSyHh1psfbKGQbHL9+HM8KjDv204qTwnBsLovC/9MmUy0dYQIvUd+xDvv2ff0UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7103.namprd11.prod.outlook.com (2603:10b6:303:225::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Sun, 18 Aug
 2024 03:50:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Sun, 18 Aug 2024
 03:50:29 +0000
Date: Sun, 18 Aug 2024 03:49:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Dipendra Khadka <kdipendra88@gmail.com>
CC: <ltuikov89@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Initialize symbol 'entity' in sched_main.c
Message-ID: <ZsFvQFnG/LEkzT0V@DUT025-TGLU.fm.intel.com>
References: <20240817162026.84761-1-kdipendra88@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240817162026.84761-1-kdipendra88@gmail.com>
X-ClientProxiedBy: SJ2PR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:a03:505::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: e207ffb5-2e1b-4441-c3aa-08dcbf38e6d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rQTg7jaW8DrRq/91Re/zEutZBMH76ZVvHAOaxDU3/WrWiGKjPXPhrkIiPlAw?=
 =?us-ascii?Q?epRCoisijpixfXU7hU01wB/+mKoaMk5QbHEr0hEIB6SWV2HEueFoMgjkCQd4?=
 =?us-ascii?Q?L4LwNU3pK476XuG8KGCK9XrJK9il5WsM/N0L9JNVKqGMoOdMYLZ7GQZEkgEt?=
 =?us-ascii?Q?OuMkgKYnAmG6PgBwmPRA+gKuSACKT5ZWCw2kI6e/U6X4FWd1FY5Bq6RNHzGc?=
 =?us-ascii?Q?bB8uS/NVHacZ11HmCiS0TooMZ1GWg841rJJoJKxMNt/ig78DstVjnuTFJMLn?=
 =?us-ascii?Q?po1eRYBQKiXFSRCPBziemGynu5dmJEUfSFVAWdjeVpOfqOqHUNHWw9f15J09?=
 =?us-ascii?Q?+HpMQB2C2kiGp/boBWHsHfqrD4EXA3za5Mmxmkh6saZ+PU9y7MNYp5krLGr3?=
 =?us-ascii?Q?CC9H0xnfATtoSFBJ5+is4G1hp/6jtgpDYMF5wcD3HNnN4VD9efaSpGMCeeKL?=
 =?us-ascii?Q?bTyMXo/XPrg7DaAU5LqnXAFyhboKIubL6CVprI04OmZhEkCjXOqAFI+/Eefz?=
 =?us-ascii?Q?J+TGD5oCyWqF0cmmUKUDnUNdBX7rzpFh0p8JvgA5D+KjeAhjZFTKG7yPL6Ze?=
 =?us-ascii?Q?1qpnGD0pdoG8YIROhfMGZCloBP5RDIAkbI/OxDm9aYqvTGegJ3kDWLMKS4/L?=
 =?us-ascii?Q?MW49gMGYITwcGF0oJ1bz3x08MpHZOax0bFU20cV2i8Pa416ooEZvXcJKZp2L?=
 =?us-ascii?Q?RSPvo4ag4F3ilodXHMuF0pWcFIqz8Y4raMJNCCEgLSZEfylflTEf3r9HyP90?=
 =?us-ascii?Q?UNyrncTUlkdSh27AWdQ6SbYViM1NfaDaCvEsCodPyabwBBzVua4UEcJKHQcO?=
 =?us-ascii?Q?F35i5S7Aei3Rc+FWpy8GeJGP/pstglXXvWXakMpWK+ZgSBxDMudvbGqWZLOM?=
 =?us-ascii?Q?OW7Wg6hvec30K7Om5hGp/hHJxF5t6OsxS2pHHF8JJiXty534RHlAVbEFuyYG?=
 =?us-ascii?Q?ldcKPrp84Swwm6uxJyEwxWPUQpQluLKkBvuGiRMGLavMyGcC2ET/3xoWMKk6?=
 =?us-ascii?Q?AfvO7kz2RGnoKFKkLFQX3QXfcoW3PMzxo+YCEjCDmiSuET5pJ0InJ7Ks60HU?=
 =?us-ascii?Q?6wEf6haPdDmBj5c6alYpkUJHPbOlc825TUhfNWdOT/yyo4wATRExx/f0ltgf?=
 =?us-ascii?Q?to9RFz9k9e4zatkyuWpQWfdfLBGGjKxXDDTC1DS5ptZl6hMcEQXJcT6TN4Xu?=
 =?us-ascii?Q?PPE4dX88DKu6sFbSF0XvMhf4WC3HYOl/pziSiU3pZWn1YRFVXyNT5Vs4+gg0?=
 =?us-ascii?Q?BzUP79GI9aWpkw7Wp1JDoxiFvaPOg70WjCkZcFvUJwmPEnQy0mWsp52/LKoI?=
 =?us-ascii?Q?NV8BZMcZS9qZ+z/oMkawEyxQfHMEY5OFzi9MSWeopDCZwg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2I38MXMMMjOmzbGbAgIrWztEi7FQCvwMw/8Q0M7FfXAnLMD+UDoTRMUYg9Fm?=
 =?us-ascii?Q?uufEOcUzG9dfMzIeQkzE8Pr0JShiq4cbwZV2FVdL6cRwx3oepwyHL7SsMUku?=
 =?us-ascii?Q?7D69v8P1db/PNETDko36eHPrspfMUD/dmebh+mlb+mM6b9wNwUuBaOJXPjjM?=
 =?us-ascii?Q?ZIB2r6kGvWHwkOrzBoz7nfIim9lz47URUmP8Ju6ePXr5kLAjsyk/va3lOvYw?=
 =?us-ascii?Q?qASKHFFfU42M4xVSODtMk2e/DJRs02B0gxoslcOigQVcGZzgBCB2fp5k2KNH?=
 =?us-ascii?Q?LchyGui+U7FSNOpOmTwYfyGwReimYga35uwvxDsVJ9jUEC/KSc3Xy0tQu8gz?=
 =?us-ascii?Q?yw/HsuaOiyJWq3volv1dFk9S3RCqoOJ3tzIRUfHU7gDuBm9Yx719hrp2NbJQ?=
 =?us-ascii?Q?ip9NgJFWFvhypzK+wU5XiwnjeRWLrSxshzNl4n95XVQ0twE1H0LnDI6TUK7i?=
 =?us-ascii?Q?K0RdhbPVo62EPWGQd4dvA7xqGwE8/thuddpcTGyRc24R1fJMwOTxLhYTFnxG?=
 =?us-ascii?Q?0xG53I1uW+p0bAW2gW7iQcbZSZUooydgylVwUqO/s5SnRa4XOirvcVLhlOKy?=
 =?us-ascii?Q?lGiuODVeJsGrebL8uyPe+nRzlyYey3ivIVDbnzY3UpDhWd4swM/YtGEXFMZ4?=
 =?us-ascii?Q?/5+1PsDb/R9BkSPn7PkrdntIVcrkYxvTQU9uKCoO3be+/L4IItIIrWkkRXah?=
 =?us-ascii?Q?KBinOECVj7aQsQ1j255RPVNROPLmjMtX4PBBk5U3CbJaav149fmTyaWlIUen?=
 =?us-ascii?Q?AFaMyvYMJ5y16MapRhPc+DT9bnAzgrdx0zNKqxh0dyxQ1Wcm3ulVmGulOX1M?=
 =?us-ascii?Q?ROYvKtTLSDNpfAwtMEzTTTMuQ0Ag3zCWZ1WXMMiiEBRFte0ZuYSOfm5GMotq?=
 =?us-ascii?Q?B8b64thQK9rvxLDP25ncfZAoaeKUsnp09EAUubeqJ00y/OUK2gQ0d3w0d4Id?=
 =?us-ascii?Q?TgYWuAoNYlxoHFhArHaAzuZ9xjW69RNcw4rXTSTa3ntahEVoWrCC/gok+oms?=
 =?us-ascii?Q?AvHbnKG5SuyH7D7G7sGQLE4S0DknlE/JVGNtdi9XbGbYZvcd0f5iW9f2CULz?=
 =?us-ascii?Q?9XMAsQ0kO2Oo0mScLktxAaWWe/A+e16wZ2C77nm2xZc3BwFt8eN8gZkJObsw?=
 =?us-ascii?Q?8rbs7D1hotzd2wrmCF+K7cVik0DNIaYNQGJCdtrIqs7GJaGTsRijTP95U6RO?=
 =?us-ascii?Q?xIXEl2D2nd31gVZS/+9n+1835mfwHcOjeGreVTC4HvDkShLSJKQbecT1nw3o?=
 =?us-ascii?Q?ZK3Mu5QNXtclsLf7V3F7T+RwYx0Bf2Em5EhdKqKZe3crJPgLQaV7bulNmbuu?=
 =?us-ascii?Q?BRRgVIHloh9ehyK29YQMfjOHK8Vsf0Nqrais2PENYVoRekyP10hzekHcU11h?=
 =?us-ascii?Q?kG9ebPqEi52xyWsm4bp4jzHgRDxSk//sC6jLQSoLkc7USufMNv2NVIKWXjHU?=
 =?us-ascii?Q?OVcqpuM43Ziz84UNsbMwPTCIq++Zt66kPZKjjWRjrEX3zFinemD6wmfCLZon?=
 =?us-ascii?Q?AHfdq2qsLcHIgIWUpMog9NZZduZk9UQqAAexKLQU5op/2ziSAdvtaW71VMO4?=
 =?us-ascii?Q?zYiIjHamvRBJPRKqXbgygNWxZcv1AA9lNNu6Bm4Atw24uoLWnZ6OZ7bDgqDy?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e207ffb5-2e1b-4441-c3aa-08dcbf38e6d4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2024 03:50:29.2848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OveP6ZagAYabjcEs2/mEikmFmXM7TfePcsDlpDRxqR2+91k3gnZ1ELGkIZuSR5M39jrbgBVr/uX8RzDXLlHbLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7103
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

On Sat, Aug 17, 2024 at 04:20:24PM +0000, Dipendra Khadka wrote:
> smatch reported following error:
> 
> '''
> staging/drivers/gpu/drm/scheduler/sched_main.c:1063 drm_sched_select_entity() error: uninitialized symbol 'entity'.
> '''
> 
> The symbol entity is initialized.
> 

Looks like false postive, no opposed merging it but since
'sched->num_rqs' must be greater than zero it entity should always be
set unless I'm missing something.

Matt

> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 7e90c9f95611..dcfd4d0f7c6e 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1047,7 +1047,7 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
>  static struct drm_sched_entity *
>  drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>  {
> -	struct drm_sched_entity *entity;
> +	struct drm_sched_entity *entity = NULL;
>  	int i;
>  
>  	/* Start with the highest priority.
> -- 
> 2.43.0
> 
