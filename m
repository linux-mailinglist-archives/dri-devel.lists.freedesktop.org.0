Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B988C94B3D6
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 01:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A9010E0D1;
	Wed,  7 Aug 2024 23:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cYFg0eTp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1581510E030;
 Wed,  7 Aug 2024 23:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723074290; x=1754610290;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lBwrnO6PRuWEOFbOIJdXbeDxmZMARIS0+Y4+d7zgKyc=;
 b=cYFg0eTpJlK9z+irKqqGqlnp7IM076ltgZ1bFJCPdygqJxjFY6Y/UvuV
 SGeromxxHIZqHfe6sR2u5bFXnOfmoS+Rh/yQZRZsWhMGRW22uP3fXFR84
 xabE/IjlBNJr09zekQH+ZQl2G+SV9kUC84x/eG10uMXemuns1jJ9VX7q0
 yOAEEZtXuHoNNpcI+wucfvgOamsLJ9LesxFaDOeEBKTH1oboLBDGMrk3k
 WJalsQYmNECASxigPjzPZB7hxl9v3QPnD0KaBn0wQ78+LOodjfTaYWqxV
 yDWWO1+mUDhawDAKh3Cs/cfL23XnmtXuyS//tL94WYwgt/9v6Aq28WgFt g==;
X-CSE-ConnectionGUID: vEbOzcyFRAugpoef7WTAfw==
X-CSE-MsgGUID: 5EOta0a9Rc6J1q1tMtAVjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="12909762"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="12909762"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 16:44:50 -0700
X-CSE-ConnectionGUID: 6nNvjJ4ERG6LFBgGhFPbYA==
X-CSE-MsgGUID: itq6XU1SQIS1WCfxCwNIZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="57099187"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 16:44:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 16:44:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 16:44:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 16:44:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 16:44:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ar1esbFKuHRl1lOzeOeOIYNuOCM4CqEsio4CYEm9t2SmFOSlXjl2O2KF+6srm2JGrBqsyTuVwyTEfeUm6xBDJUSNzwwYSmRtJR0AfuGM/o7nu9eTV1p3nB+ietJbx7luvwqJdKSxwrSn4SHxCvJZM6MAbabA3OY5HxtSzpe6tcoU4RMhoQ74I8al/zOEIoEnZN1OqBvxAT3pgNtAM359M7aJlN+4/Ow+2hof8Eebw1WY7vMaK9nZillDVsC29V15rxthjLWi7EgEsVDRcjZ6VICfadEh08L6uVA8UQJU17447LqiBVPVQJa2CHDahBw/Ws/uT/iopTRIbhBl/9dKtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvYHH04oeTePFrxquVHbKy3MpX8uiWR7GGcA3LUm2xc=;
 b=DKWh0Vy8WJW2muM1linSh2pY1qSiKrspPpJ/U3DH2J0LvVQdZymdrc2ASD/Pp6iOJKtJExaSaUcjwdCw2bnUeed2Rn4Mt+SLGN6gL/ZjbJgbuH/UdNPYO2sgn1Q1QktfU7LwEYvBqrOge3eSjwtHpCeepbZ8gkTQFTKHww46Xisp5CDVkLUIs0m5zkYgOZgXC52mPuoLOMPJjcftNQpac8SOk97nX3DNCacax39vejCdmPvn6iPtf37ItEyYdwNYDtJGN/AQGyVKc9K/secPjv2asclRnBnBlN0Xx/KMVLjy52UkvEk7VMM7Jo+w24HRBqBr/GRYTTcZjNuVl2KPZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5099.namprd11.prod.outlook.com (2603:10b6:806:f9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Wed, 7 Aug
 2024 23:44:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 23:44:46 +0000
Date: Wed, 7 Aug 2024 23:43:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v6 10/12] drm/ttm: Use fault-injection to test error paths
Message-ID: <ZrQGoAzeOsQvH4s2@DUT025-TGLU.fm.intel.com>
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-11-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240703153813.182001-11-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5099:EE_
X-MS-Office365-Filtering-Correlation-Id: 88180a56-0159-4e58-0c5b-08dcb73aeb4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5FhTMbxVtoKyRKBNyQYSEnbHHgdgT/XZzjqTXLjFV2Fuf9rhLO6RckiG5R?=
 =?iso-8859-1?Q?2UpApvosYsCKMYpkFp51sQbkThPIs5ZFl9IfCsJCTCzSwovgV19zKsUm80?=
 =?iso-8859-1?Q?26I/yeFbsbg7ysvNt9sZSkvldcUBTQhql/7fpPQfWyiJuyVRH1PvZtXjvF?=
 =?iso-8859-1?Q?sGviDhEgNce1XxGx0AppWIJ2YoT2MC/Z0Wnpqw/1ytXqowlPEGTYDFVzqe?=
 =?iso-8859-1?Q?Vos2GPvtvgZtIME93iH8csdNEaxhXuZLRTqix5KDojrBkMUsft7PD95/il?=
 =?iso-8859-1?Q?spKhCXHapYBOmo9A0h99vLc58WERDiCUefJdYXxHFJfGnDS+QvFmTL0zyv?=
 =?iso-8859-1?Q?YB0n9QBJIKGKc+16Og/9PDr2VbVKebnhdYWF12iDyOX8vuF6RsFZUzNHjq?=
 =?iso-8859-1?Q?zWibREvziuud9O3RmGLNS8gP5oVTUS70N717OGRc8EBQEWOOb6voeo2XvS?=
 =?iso-8859-1?Q?uuDVCGHT8DbN4Ac/3jqTjWz1HnmfTGD1COaR37Ifpk9dtk1/IeoIbv4DU7?=
 =?iso-8859-1?Q?c69LfbqZGliER7cAz5miCFfhIgP8+66ja/Lg1GWIp8K0MoI6QxPEiefKmU?=
 =?iso-8859-1?Q?JrEztjtBc/8h6iqa85n+bYTS3qxp1Wxgesm6vW9L6sfYG1RlijyiwlDRC/?=
 =?iso-8859-1?Q?j/YmrfXW7buttOQpmo6WY1nCrT9O+c6e//OZZrK388ys4usCfWutfLCrFs?=
 =?iso-8859-1?Q?x6i9lK5Ym4Kjvz1CHujp6G2hRTJkwHzlBD3s0aOlc6Ek/XUyBgcYIwtcMO?=
 =?iso-8859-1?Q?3jxQNkDYXh0GaY4rnjGcZeSP5CbS7VCwum9HjhEg3zEpdLBcb8jTXHuqxb?=
 =?iso-8859-1?Q?iaP357H7Kg+zyOie0cLE7rO/WmgDLBZ8wLMHrlEpmh0bDDQPcgLo2bHzsI?=
 =?iso-8859-1?Q?jyEmcWDl++3362cAfR6uodZKFKjpMFmUViay3BMj14au1IkFHhkgbN076+?=
 =?iso-8859-1?Q?U9sGZlrUAoki9Z8iSf4gggyN329QNh1eN5TLR+95nWbXTUCaXofaNgUmez?=
 =?iso-8859-1?Q?JQdiSrp8zGa3Ol7shxcaD0usLkhGrwRq9XZ7gqZSMllOWCE2DaI+87YUf7?=
 =?iso-8859-1?Q?/G8uoK+FsEcPKpltiAxkdYxhIBGOL6vdlYKM+W82sfEX46k6rf3C1n7FI9?=
 =?iso-8859-1?Q?Qc/vAf76Q8X33D/bbjjJCVmxywx6wRCA/6LS6eiqV8LqwkoXSuIM6k6OsC?=
 =?iso-8859-1?Q?foprHEHEg18kCx8yLoL2rHtdhjOijouMcQZ9gkkq5thiYGNYb3abhROBoU?=
 =?iso-8859-1?Q?X0ROH82lnaVZ7xL44Dr15EJVrXos48LgmQoa5ztooKpw6eGp4ll58vZpbb?=
 =?iso-8859-1?Q?OB/uAGWWPOD/9J1JD3TavP2goFdgeeJaLueotQ0EJeCJFDvhzOXrOAhnQm?=
 =?iso-8859-1?Q?kkLvg7QVwARYFITMO3TGu7WqVjqXSNjQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RRwKDP04hZhcvSgDAdIWap3NWlPyyvJkUhZVHLeMiaBV/CUNQkbwu/Njr8?=
 =?iso-8859-1?Q?PTqSf17v1N8os3vv9swLrhVxf2wQMmB32MdV/svSb7cFrbmqon8En+HoKA?=
 =?iso-8859-1?Q?Ycg+vKEUqoA8NCg4dBG/AdCWIeMGEZ+cS9JywdPu0KL4WbpNGu8HbsQmIE?=
 =?iso-8859-1?Q?3X+oEtA6Xj8fQR3JE2ff5XT2EboFshLyNOC6y9gS+zSIo8BVPtX3cR2n2e?=
 =?iso-8859-1?Q?/u+eH78cK0wB3RQA2SAxXA4+hxv2NgjMinN8n8gMz5cSGW8+bp9GldtEoY?=
 =?iso-8859-1?Q?e+N+MhRPHYx3RiYD82LicPGT1017E69J+mHAbVirBsaoDpNezh5mBsnPFi?=
 =?iso-8859-1?Q?tuLGWPlUH44fcJTXsbwI6zpi2uvdIUmMFYy/6eqbLzbhk0Kbfm5xelWbTm?=
 =?iso-8859-1?Q?dabR9lMMATsgR0d4f9XySZWdyJVg2H0x/kPQcUgbduwAkYK7vJOV/KTbaS?=
 =?iso-8859-1?Q?4HhTQl8Aocjg2HLlfqdnyAE3zAlIleIJw6Q4/jwnrd92dNN88AU49pikVE?=
 =?iso-8859-1?Q?zgiv8vQTvURnwTu2b2lXHjuiwZ45mgdVzZQdgoEUn1xZEun+jorE4ogW2k?=
 =?iso-8859-1?Q?OhMJUl699ODWMpjXALO1AXEAZeuZggT2c1EdWufIOiLNU0q0lAO3imj/Qz?=
 =?iso-8859-1?Q?ISVMXb+++2OugfgnhfQDoIxEES+y4FnnshzAdggGMYYSOWny7Ae9FtovRj?=
 =?iso-8859-1?Q?BE0NOwlPOV+J7LcwS8HpZF0iNbTwRO1opXX2pEPNrOuza6jjC/2ZvfYTOo?=
 =?iso-8859-1?Q?dVWKURaG58sXsNA/7y4wgPO7f67ag8HtcZf9ncVw6a5Qc9y+cCaHFOrNvC?=
 =?iso-8859-1?Q?/ASypjCaOls07KrxbsYNeWsPCTcBeONVFEBoRVX6fjWrVmLRS8cxtxFhYm?=
 =?iso-8859-1?Q?BltUyZHYSGv9VgjwfXAIW+sd9+0b31q184uNVAqfRgHOWEl6UFOdih7+Dv?=
 =?iso-8859-1?Q?RnSf88UQq0LExPGoALqCZqSmekvBZU2/FQOLjqKfxqZyiQMJHfK3rlXnXo?=
 =?iso-8859-1?Q?pFiWoackIj+ZtOryWJacxhiCBxg+yyIGKQcQGxNQs4a8+rLjQZp9zGhRoy?=
 =?iso-8859-1?Q?BatYciKucu39KEp04si4Hbh5FPO4Ws0Qt6AtHGSMfFPPVOk6yLE7ZSOwBJ?=
 =?iso-8859-1?Q?1WfB1CZdPdqWWE1N5FQiB4KWsQmfM5jubD6pLKysDa4aDCOb7Ex2pU0Rq6?=
 =?iso-8859-1?Q?d3fNYSP+qkb+qRbROBCsDZALUq2bmFcJDX/jBLn9AUxH5eud17IX7pSh8n?=
 =?iso-8859-1?Q?qYByeGVKxkeNN41KBKu8wjUNijgYibo5n8bg/qrsffkGS3h2AHRE6cmiWp?=
 =?iso-8859-1?Q?E7X5lNq1cu323iXtSH1Sn4zR3nhk3vl3lJaCIE5a4s/8UllDwr6Hz8RbYc?=
 =?iso-8859-1?Q?JF2OuRgSEpj9ghuVA311nSgDhoM1hYrzGxsNONLoE4ObzofPbkpLDPqrM/?=
 =?iso-8859-1?Q?I3R3h5zePaKmOYAoGkWm5u06X5/CLjWpQ2ae2G3YRNRaLEzF0pL1kW1qzA?=
 =?iso-8859-1?Q?/4GjmHnGhaAbdSAvc1Eb0U45dw8wlUAJ3nAMNy+eufwtEgEonOd6RGOEiv?=
 =?iso-8859-1?Q?4q9qR+2JLfwu/LbAUZqcFkIXko8dJ35Sej8FMQMjCqlOxFHGJqFxAd3YaE?=
 =?iso-8859-1?Q?fXDijXPg0gtcPBjrYl8/q0dOlXEyL5jndtQ+6Ap8vIc905QARi+cvEwg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88180a56-0159-4e58-0c5b-08dcb73aeb4e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 23:44:46.4155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNCIywkmnFML8yoS7Nxqfj0A/7K4RRG7BSEgXxWeyLytWaYECftprwjUnM15GhYXeGHnGJ7rSp/hk/NGW7XIww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5099
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

On Wed, Jul 03, 2024 at 05:38:11PM +0200, Thomas Hellström wrote:
> Use fault-injection to test partial TTM swapout and interrupted swapin.
> Return -EINTR for swapin to test the callers ability to handle and
> restart the swapin, and on swapout perform a partial swapout to test that
> the swapin and release_shrunken functionality.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/Kconfig        | 10 ++++++++++
>  drivers/gpu/drm/ttm/ttm_pool.c | 17 ++++++++++++++++-
>  2 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index fd0749c0c630..9f27271bfab8 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -272,6 +272,16 @@ config DRM_GPUVM
>  	  GPU-VM representation providing helpers to manage a GPUs virtual
>  	  address space
>  
> +config DRM_TTM_BACKUP_FAULT_INJECT
> +	bool "Enable fault injection during TTM backup"
> +	depends on DRM_TTM
> +	default n
> +	help
> +	  Inject recoverable failures during TTM backup and recovery of
> +	  backed-up objects. For DRM driver developers only.
> +
> +	  If in doubt, choose N.
> +
>  config DRM_BUDDY
>  	tristate
>  	depends on DRM
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 38e50cf81b0a..d32a1f2e5e50 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -431,6 +431,7 @@ static int ttm_pool_restore_tt(struct ttm_pool_tt_restore *restore,
>  			       struct ttm_backup *backup,
>  			       struct ttm_operation_ctx *ctx)
>  {
> +	static unsigned long __maybe_unused swappedin;
>  	unsigned int i, nr = 1 << restore->order;
>  	int ret = 0;
>  
> @@ -446,6 +447,13 @@ static int ttm_pool_restore_tt(struct ttm_pool_tt_restore *restore,
>  			if (handle == 0)
>  				continue;
>  
> +			if (IS_ENABLED(CONFIG_DRM_TTM_BACKUP_FAULT_INJECT) &&
> +			    ctx->interruptible &&
> +			    ++swappedin % 100 == 0) {
> +				ret = -EINTR;
> +				break;
> +			}

So here this -EINTR would be kicked to the user IOCTL which triggered
the BO validate and retry? The restore then should be able to
successfully pick up where it left off?

> +
>  			ret = backup->ops->copy_backed_up_page
>  				(backup, restore->first_page[i],
>  				 handle, ctx->interruptible);
> @@ -892,7 +900,14 @@ long ttm_pool_backup_tt(struct ttm_pool *pool, struct ttm_tt *ttm, bool purge,
>  
>  	alloc_gfp = GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN | __GFP_RETRY_MAYFAIL;
>  
> -	for (i = 0; i < ttm->num_pages; ++i) {
> +	num_pages = ttm->num_pages;
> +
> +	/* Pretend doing fault injection by shrinking only half of the pages. */
> +
> +	if (IS_ENABLED(CONFIG_DRM_TTM_BACKUP_FAULT_INJECT))
> +		num_pages = DIV_ROUND_UP(num_pages, 2);

So what happens here? Half the pages swapped out, then upon restore half
swapped back in? The shrinker continues to walk until enough pages
swapped out?

Matt

> +
> +	for (i = 0; i < num_pages; ++i) {
>  		page = ttm->pages[i];
>  		if (unlikely(!page))
>  			continue;
> -- 
> 2.44.0
> 
