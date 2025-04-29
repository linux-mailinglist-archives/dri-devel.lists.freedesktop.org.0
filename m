Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E16AA1CC7
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 23:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A23B10E1AF;
	Tue, 29 Apr 2025 21:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cLq8ZJ6f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7F610E2EC;
 Tue, 29 Apr 2025 21:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745961594; x=1777497594;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mhvvTcnEDjcMY2eOEO9gdtj7SMEJVU9TRORgrd+EObM=;
 b=cLq8ZJ6foau6srlhRiaeXxMmHreo1+9TswwaYUt06A8CZ2s3yrwzTt3B
 mlXiVKs91iAP+yICfzla5nUJR0n+9P1m7z9E+A2FuguULpH8Iva2gAwuN
 Hg9m6Fg6t88pW3VA+/wCvqReUPvvHob2ChUl/1SK76dCyQ9vIFGeGoFFE
 hLMOtqxPhlWylYh36Y//RSrh0O4yrPr88v+uStqa8hSU5L3Znrl+NS71H
 9DVNjGTPKJ0M10QULFt8y/vF1k5EF6STThuxUPbCOz3tQ6mOm8hEUOHac
 wldgUMDfr75rOA/VB2e52sLxIAJQRbQOC53SNmlc/H34dlax6eWF3GDdX w==;
X-CSE-ConnectionGUID: kKzNDOI/RxiqSBaaPbWrWA==
X-CSE-MsgGUID: ZNi8hVKOTVuMjVYoEQbuYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="46848629"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="46848629"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 14:19:54 -0700
X-CSE-ConnectionGUID: ZJ0HmE1yS5KLR1iphAtQyA==
X-CSE-MsgGUID: ts31oTbnToS+PZB/r174Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="139048222"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 14:19:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 14:19:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 14:19:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 14:19:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZgVth2srjeF9wGkq0MyPrcoJT/VGtqBbtN+HOz8MVCNB9I+EN15I8j2Ao7PP+/X/shW7lNLdWeab0LqfnxTapIa2l0qQJ6z5T9DzbPCDEpqcRfh9QqOEUtAe8/J7odaa3YF3dpRph0TtpHFv7GawRZ/B1JjEUi0FKr4r6KpPT2mCjRBsi5rHc4VwF6A5O6zNiAnKQlphwhw/bRSVXP9vncK6mR09jS6qNMMZbMGUmKEn/WUYqnULtk8I2UkZFiXDkzUTsC3zFJHmCb5rV6S8Dm5XZhpy23/LlWhXqChiSG7DQcaMLHNcHrDmRy15ArW/Ul/9YE2wc1ziZ743+uXeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGTru8w+Gcl2XwfFYp6RMbwvEto4bGpnxPYLrkNPELs=;
 b=l+Et+xNW7OUFKLmj6ViMFNrTlNu2PND8Y+Ft1249Vui6AVDecfQWDLW/VC/UY5V+lJ4PYMlx/FBhB4CXtjkTp+9PmVtuGEojBfbzKOvTKKLTkvlLd6u4JyDq8vvc+aJI2dk5jXhgGTGII8mRA8r7UnPhmctbLfapSRBUzAU6xf7ax2uzKER+jKfL6nobsN16PrsnAj64r2Hd9vF+hQs5PmwEYQyAV7Osb5o6iqX1CWjUQvqRY+ZiC+oY+skB9Nh5M+VxNaQUfgapzyIMhkRMV80jWDJyeuKBAyLR5Ha4lxdWKqgpQhvdcVndPnbvJrU/8kLjmtxod1HzFiv+0obafw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW6PR11MB8337.namprd11.prod.outlook.com (2603:10b6:303:248::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 21:19:48 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 21:19:48 +0000
Date: Tue, 29 Apr 2025 17:19:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jiajia Liu <liujiajia@kylinos.cn>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Nemesa
 Garg" <nemesa.garg@intel.com>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Nitin Gote <nitin.r.gote@intel.com>, "Matt
 Roper" <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] drm/i915/pch: fix warning for coffeelake on
 SunrisePoint PCH
Message-ID: <aBFCcH5T56ZenY-K@intel.com>
References: <20250423073730.585181-1-liujiajia@kylinos.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250423073730.585181-1-liujiajia@kylinos.cn>
X-ClientProxiedBy: MW4PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:303:dc::10) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW6PR11MB8337:EE_
X-MS-Office365-Filtering-Correlation-Id: c95d2821-8d84-4e26-6531-08dd8763927d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OFRhDBEOrUeule31ts2YCfQ5v8i0x0mA8L6zYc21vPTtrv+k4Fnv2TSz2YbY?=
 =?us-ascii?Q?8AKwxVCQ7WDvh1CGB+JLeXI7VCF6vxW0YRvGnDKkUFkSVcmFnMUdYy0rDcrO?=
 =?us-ascii?Q?98bCfPWxY3RolFIfaUfS/FQsLs1HjQlK9ZohvHlZHwfb5ZvjfjkNyTFphmoi?=
 =?us-ascii?Q?orhsauVx/7LyQCzyc3Ett/gqxcgMPqgRNjARSYXF6XpnINUu0CyavoEutl6Q?=
 =?us-ascii?Q?0H1Y+D06mmB99QZebh22HTLziNzwYktE5/jOiJEU5RYxnRnFO5d7fS+7XGog?=
 =?us-ascii?Q?+nPan/tA1lPeN1rpeeCVgVKtDqyg11ojWDWXApRAJfB5U3/xT95nsDSPGIpC?=
 =?us-ascii?Q?U/sMt6O+eDlO2jSPqDKK3mjLsQ170wzFf0Y+TMlfX9WxFhmKascWWlLwjM4L?=
 =?us-ascii?Q?1A4XSPR46GAxHLiVq5gTAacwBBnIJT0ERRnraSVSvNPo1DLxNtVgZDawQ2ZX?=
 =?us-ascii?Q?LglqGNMvxFwxDCEA/E5+XKLdkiijCRmluPGMkEF1JIdW1Rgk6SQCqROKMOJn?=
 =?us-ascii?Q?EFU77TyYbHAthRAdNgg7yJePoleUv0w6KxG1/cyeafD+sEfKNrxVRqnquoBv?=
 =?us-ascii?Q?kUleaiabTav9MR2/btp6ZOdgJlmu2l4MCE3a5rs8NRRG4CkbXmot8DFEaitK?=
 =?us-ascii?Q?thfBexCW7U3W4M7znTyxcWiPQ/tD8GwF2OOX54hLLFNmHro1uuDxLEfwETFW?=
 =?us-ascii?Q?Y7FyYmdGDME/TbEMMUhvLJK2vQ4S+97dmZcDcduBASP6kdAB6G1DlVRUWixd?=
 =?us-ascii?Q?PAweCuNdjynetr3ovumJ8H3GJZmiLg3RQebfGqJEnin9CLzUcXjPsldNQ7ra?=
 =?us-ascii?Q?R5pqPPlN1EDUWhqM8aB2eCgiZJek2vZcx3Kl25UfVgFOqviAyY6/rOGqY5nF?=
 =?us-ascii?Q?VS7EiUuNf2EnUJWEQfDerSNPnzwpHyviLgkcEaV8sCfH2XpFSiM/IpzQ1XEf?=
 =?us-ascii?Q?i3/YIXxQzbn1yUzyKDPpC7y8Vm1kiedE8kjJyiI9jKm915DNl1EvlODA7EDS?=
 =?us-ascii?Q?tJP6WoUkzwVp3K+/cdoBi3omoH5YcyowHEx3YVhN1FA/MWIy0Jtbhf40RQgN?=
 =?us-ascii?Q?yIjuJ5dbQQn24D8HRw9ZB+1IBv4K9UWFgYI2Ha/kE7EsX/jx51Dxzicn/hz0?=
 =?us-ascii?Q?hyWiY9iQvBg+tjaatyDlmf38uCRN9UjuHHgKnhweSGXF+dG1M5QNh+2/5WG8?=
 =?us-ascii?Q?QL6wj9K0oEoeT4u1TihPnKVYosx9+05rwlctrp7QYfoYzP2veggrHBrN+lBl?=
 =?us-ascii?Q?s4FXPh1LvTqyx8uSLI/1ArFVJ8gBjQKWBUNiiai1T1p0tzkTXDJGG3Xlc6dn?=
 =?us-ascii?Q?feapVUSYDr10m2jdkA4a2D0Q1OSx1eOUAmOrxllJxPFnTCCXEs4CfJMyJisE?=
 =?us-ascii?Q?eNGtcH3v4KrAaUPYHtWTKD/33hvQouUUUETqtRTK6XyCaAF/pGsngRaBU/wY?=
 =?us-ascii?Q?33Lo8vkRRDs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6GXQA2kZ0Abuj3TVb6iOqix8hrIxgZ5eoTT/FEGqJ53q/T+TEQ2BmJuqsI+n?=
 =?us-ascii?Q?GQi+EqlP1qf1EV6LMZ0gAyHJMZG0G+on8lBdtujYyuvRwhFM6tJvlRwd4jGP?=
 =?us-ascii?Q?iA+Ppa7zS8eCsgOxLuX64UpI+K48GiEFMT8+RucvpTkGkzVDnyK0GkTlW6wT?=
 =?us-ascii?Q?WrochGkFwGvR1cIP86zVNv/P1+ecUaBb5FzD1oUvFM7k/oUPUrwvSwOaqAG6?=
 =?us-ascii?Q?kR/a4LZiuEnVrb7rBtVByOYCuo8b9EOhbc3GQiC5QxUbB44KQfMwwJstflqA?=
 =?us-ascii?Q?7msbgQBco8SG3B2qDdzRTpKqQi0/95pbZkhzeQrqRLQBvl0kuf9DUEJA1hpl?=
 =?us-ascii?Q?DLLKZ8fM58cQKjKqXiXkuLQOjFLwBLUkv30KEMYb1YTJxxOR21EnqvsOYKbT?=
 =?us-ascii?Q?dOgF3rYe+kwkibFDtYKHtAb0ssTDDOHi67uaIb3XJZValvvHyVbQo7vVRxtg?=
 =?us-ascii?Q?I6uBYSy5JCVymTnGrGzevTTUZ3l0DHv7yKBowrzePhJGcEXV54Xdq2Ow3UTu?=
 =?us-ascii?Q?stt8ch7+NJtWwrXSh9PFPu+Ywc7PDx2lahOzFr50s1bj/cvpzQ9fmw/+tAq8?=
 =?us-ascii?Q?lSTnqHnAsSa482RVETWYdd3aPfIs7gYw5kZOBKQGvoG/OTnPnpf3Zsz08GKW?=
 =?us-ascii?Q?aYh+2pcKbI0lP0iQqOUwMaLPRGWrIDMLjmqAf5a+Fg8c2SY9rFSHd1YCbQf7?=
 =?us-ascii?Q?rP8mwhr7JyvjU81wGcFaSGyhA+dxpyKuyVmZA4HcEztUWd+qEcbQuPqgXL0R?=
 =?us-ascii?Q?wLgypzm8kQdpHbOfYOy1fjNo2A1qMk+cRtaX2zlacaHf2kJOnmnCh6zQaMMa?=
 =?us-ascii?Q?ohL2xdjdvXBBVkoGlKhcgECr90R+3AuovvA70v+AjDaehouCnm9WYGPOsfz+?=
 =?us-ascii?Q?yipL2YFGQot+830LjtDvfDKNzB/13LCttf+c9CMbxUrDPbmcL/Oo6fzua599?=
 =?us-ascii?Q?WBB76rHKZ7UVVVuQA7pRnqQxsBGhesRA4mw0rzuhzcYo3BNaCgX2Upq31XeZ?=
 =?us-ascii?Q?92PVDGvNgG6u7IAzELFKw0o2qayjnPf4RJinTV0mlnVtyAnPHem39rdpXJ6V?=
 =?us-ascii?Q?3GMtaK/PUpBvjjnJK5igW6kvekvhjQ8nWpJpxnjbbySCauogieUceN4eRoi6?=
 =?us-ascii?Q?5cpLUOtcoLkFVO2ML1I1O54IZ4FtzTI55ji9/+8+AhFZfzQEieEdzZBVZ+S+?=
 =?us-ascii?Q?QZdcBgeMIjDBq+tA9pOGJYS+jtW92fPEN5F5JEfFN2vdPEW433BO37UsCxNj?=
 =?us-ascii?Q?RviCFpBOEsjB+u7t0l+9gtpw/+XZkDRCF5kHGYFsZIlkHxogI0aieRx2tjB2?=
 =?us-ascii?Q?5RvHNteEi+dw2SnSHkl5o4SvWkdCi9pb25fhwkgEgeKtSycBLmwR1EeVECwC?=
 =?us-ascii?Q?sfKfgpjuwWexXlhBLjkWBnspOOcbWBXVF+MwOJ5otk8/tq1kyzZE0CcUr/qt?=
 =?us-ascii?Q?qOO/Yo0tMnwyH3r+kWSCxZM+/q3cXOktIrOE3suocjVZjgxvp4NFh8PLNK5e?=
 =?us-ascii?Q?H4hBMOTuOY9NlQcOZNLBhTT0yldriuWwQClVhD33S/qb3X1f7x+r7bUUDAcq?=
 =?us-ascii?Q?2nFztKCqd5qFXhZqVVtn8WSsU8Kwe07qvM7ix38x26202Q7fSAJwcA01iUIQ?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c95d2821-8d84-4e26-6531-08dd8763927d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 21:19:48.8338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpBwofbIWF9ADWQdizcZDknHx/sTZaweO1LxGgNIlKo8Uvuxw1yP8l5eUZfydVJVd/syTPssIPGdZAo1RpPtaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8337
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

On Wed, Apr 23, 2025 at 03:37:30PM +0800, Jiajia Liu wrote:
> i915/pch reports a warning on a mini PC which has a CoffeeLake-S GT2
> [UHD Graphics 630] [8086:3e92] and an ISA bridge - H110 LPC Controller
> [8086:a143].
> 
> [5.608723] i915 0000:00:02.0: [drm] Found coffeelake (device ID 3e92) integrated display version 9.00 stepping N/A
> [5.608969] ------------[ cut here ]------------
> [5.608972] i915 0000:00:02.0: [drm] drm_WARN_ON(!display->platform.skylake && !display->platform.kabylake)
> [5.608995] WARNING: CPU: 3 PID: 440 at drivers/gpu/drm/i915/display/intel_pch.c:126 intel_pch_type+0x1af/0xae0 [i915]
> [5.609317] CPU: 3 UID: 0 PID: 440 Comm: (udev-worker) Not tainted 6.15.0-rc3-drm-tip-2fa6469c618d #3 PREEMPT(voluntary)
> 
> Signed-off-by: Jiajia Liu <liujiajia@kylinos.cn>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushed to drm-intel-next. Thanks for the finding and the patch

> ---
>  drivers/gpu/drm/i915/display/intel_pch.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_pch.c b/drivers/gpu/drm/i915/display/intel_pch.c
> index 5035b63a4889..469e8a3cfb49 100644
> --- a/drivers/gpu/drm/i915/display/intel_pch.c
> +++ b/drivers/gpu/drm/i915/display/intel_pch.c
> @@ -125,7 +125,8 @@ intel_pch_type(const struct intel_display *display, unsigned short id)
>  		drm_dbg_kms(display->drm, "Found SunrisePoint PCH\n");
>  		drm_WARN_ON(display->drm,
>  			    !display->platform.skylake &&
> -			    !display->platform.kabylake);
> +			    !display->platform.kabylake &&
> +			    !display->platform.coffeelake);
>  		return PCH_SPT;
>  	case INTEL_PCH_SPT_LP_DEVICE_ID_TYPE:
>  		drm_dbg_kms(display->drm, "Found SunrisePoint LP PCH\n");
> -- 
> 2.25.1
> 
