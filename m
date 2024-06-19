Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BAD90E250
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 06:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F8610E876;
	Wed, 19 Jun 2024 04:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TQQ44SPN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FE010E859;
 Wed, 19 Jun 2024 04:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718771043; x=1750307043;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4rjgKYX6qgjBVoxRvi/wxdWvkz1hyaXIEfMGgmdo3Fs=;
 b=TQQ44SPNHpcgm1b3Dy1/QkqPx/KO2z5ioaiHJnV0gMBP4FgZ4hNezHQG
 WiE4U5ELrh5GP6G/idiZSU+BMwoF0nJJigSacW4EZQhr+vlK9gbS0+Xpw
 CoEvzLeBKvYTHP1DtuLcuvc2k4udeHfQglHs2ObuIOS1V973KPjVaousB
 hBfiDUizNaGMg9dlHEWiSe0aumDSh/3lIrR2DUhWNSaiNF4gdtkT+iRkQ
 gxPY562Wz475upopC3Dp78cDHvw2cxspDLX+aIFxpMkGj2zdJlQ3xk7+b
 fXWvI33s3CwG0/CGHL2wFu/1DKc6hFDy59PNDCRq0InixsnkacBWaK3Ve Q==;
X-CSE-ConnectionGUID: O0CMOFN/R1W5URsnP3rdHw==
X-CSE-MsgGUID: 2AnlCJ1PS9yWBYpHg4uRtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="27105190"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="27105190"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 21:24:03 -0700
X-CSE-ConnectionGUID: Eis7PuhGTxKVVRn8RgYUdw==
X-CSE-MsgGUID: ft+iwOkGR3GrhcW+VSRqPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="46696132"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 21:24:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 21:24:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 21:24:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 21:24:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 21:24:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBO8hyRcLI7nZedSdgTH7SXTilkbnyavyWFwQ78/KmbKH+W6ODh4+3WJwyGLg3HDuyGyWCuT8JbCsbqLHRmQwPpNEhImB2Zub1frko7jaqtYXZ3hJ+a0RABc2LLdT7W2fr/Kn9JPTQ7u9izR00Vn6vRYeXHGvP17I+asgdZHePwJsvgV3OY0//G1F5v+MuPa1xMFbZCnLS8C1fWTh15JnflHSXcDICCZb4L1npWuVdhDLLGXaTpyAJSFCHPKm/hpFvAg6UQAfjcD6pIq1LSyROTWxzWPFadOu7jQb3E7QPRLFx2DvlyIgoeamHu6EpKbqZMfQ0uClHfHfARrEhQH1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geBJ3H0nAQnsvPcI711jF947T1N47BErMf/5Da/9nw0=;
 b=Slkc8mW4XL6U3vVryhiryv1cvcAqvMcsTJQyj+wAkZ62QJmTSolz84UT1R1gSqz8k/ExBF5fwd+5AESsyrJ72ffiY/Vr6xRhcUBcPTP+Z3FMIiGKtVioJfRin4UC/1DYnKlm/k0X8apC1zPwyOuvdSgL6XPs91oDMJBSxzwYr6InMNzpSoa81CUDueRkul3o/9YdwaTgNT++HaSuTyqltjy7KUxuX6njiMYk8cvRMEPFFTTLqAN7T9UROY8DQ1LXf15XsMngvVHyfaDKMSA0sY0Y6erVIsZyWVnYVzt4062LsY1q3PQ22LNkoZxiIGnhf7dMvGa58tFfeQHDDxff4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7883.namprd11.prod.outlook.com (2603:10b6:208:3de::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 04:23:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.027; Wed, 19 Jun 2024
 04:23:59 +0000
Date: Wed, 19 Jun 2024 04:23:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 06/12] drm/ttm: Use the LRU walker helper for swapping
Message-ID: <ZnJdPV9uIF+HD/B/@DUT025-TGLU.fm.intel.com>
References: <20240618071820.130917-1-thomas.hellstrom@linux.intel.com>
 <20240618071820.130917-7-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240618071820.130917-7-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0024.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::37) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7883:EE_
X-MS-Office365-Filtering-Correlation-Id: e518cf6c-c295-4edd-9f6b-08dc9017a424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Zly0VR95qq2J/6ZQQR1JksCNVqoM4EmmOwtP8pI7zlsgg2dMbXpr4Z6aMh?=
 =?iso-8859-1?Q?NwWh2q0ocjuyzkH3Fsz4bEknawba9Yx+iH+hH4yuwVU32wTQxVGCWDrGg9?=
 =?iso-8859-1?Q?Wvei7qebQYrY/QsSh86nVc9awVONIo93MJuBDw9ShGEiNLRroZditeTHR6?=
 =?iso-8859-1?Q?OqAj1rNk2AvtGJDpMs6mkOUhFj860SXQU9L8EBx8GNvNb4fVXIM7kMRT3x?=
 =?iso-8859-1?Q?P7JV3P+H7jRyC2A3RpyxFfTV3EwDD5WseT89AiLsAn+UHG2djVys3JDjws?=
 =?iso-8859-1?Q?qi/VCXCX6kfyVOHgbFFpVOpNmQRxfhmWEHggDnQFPShUBRZRr4Vtgm+64q?=
 =?iso-8859-1?Q?BrdP61a3y05wC1BO8uMQ/BtIUh6sg6azhRWnKNvF62j5KJ/vJL9BU9gh/C?=
 =?iso-8859-1?Q?c1clJwmNj+x893YEGOdchmms8P9UalvauqR3LBW9LHc7WEFK41swa0Tb/w?=
 =?iso-8859-1?Q?f41LRk01d1vw2vMpziR0Daazcgg76WtGRKbqHKqFSoBFVhJqu1PPc03mbw?=
 =?iso-8859-1?Q?APnY+0RulA26cITn3edg25sMgao9VbEByh1Z+fwm1DPF+vzCZP5R2fwTKX?=
 =?iso-8859-1?Q?VbuegIxNd2y17XawGMmyGhUqSQRF2aw18srv3kY+5AVQT5MG24BrhZ9J3J?=
 =?iso-8859-1?Q?LfjygGCorCqcYX3lNFiyKboQoBzN4xViuS/Sjb+lOhU8vVO+Io7oQWun5u?=
 =?iso-8859-1?Q?lHQX1I+PZmHRfUGVNp5ZQm/tNHH47UXT5fyyGpjTPTEkx5j91u1/UsXpgL?=
 =?iso-8859-1?Q?ntanZItuU1LmOFHdyCnr0pvFqC1KtRe+GlvFcWJiUHYL6juu/iV/CC5mHW?=
 =?iso-8859-1?Q?tJa3kNGEvlCq0ofA+QZl7NYXg3/S/xRYvytTz6dOIl2lPP09qcqUCsgxH6?=
 =?iso-8859-1?Q?0sTF+2Vt0IVOdKh1Pa4k78TcLXvmeTGpSXkuPa88McS+yFYS17+DJCvcxy?=
 =?iso-8859-1?Q?BAOnGzzf/GwtJMeluev8IH1uzcngIdKcRbarjVGbUDCuV0OCMHmgCe4QLW?=
 =?iso-8859-1?Q?3pSkIqEY9DK91TZfJA5IaLwJEj2fAhd5X5lL1R8dHtVtQuKTOggO/j5UHS?=
 =?iso-8859-1?Q?dkU64kDJ4E4Z0esbN5ZGk30DwOKLS3ItSrhcYPWa/iqgmfEtDTA69nv7vx?=
 =?iso-8859-1?Q?S6BNrXYs/hvrJsP2JZNmb1JzFoxoY5J2SCW2ilJ/sGDWpv+QL34nUNzFc2?=
 =?iso-8859-1?Q?0smrgjzMcHdjyJ8TbgBVUdt7DRW6jClBLnszDcEE3xAHCQoEEQLUqKQxFf?=
 =?iso-8859-1?Q?+3WuNfLmHQzQK6AXGSg2JIh+tHwSBE7wEsM5DQXT3p/iB5Iz6hmuH46m/P?=
 =?iso-8859-1?Q?CmZ3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4N70lHtjV3z9pUpNSgncJ2AjjKJcfKo4Kn+xsOxwFGBY1gBazRYUI0zBMN?=
 =?iso-8859-1?Q?OY6xleTGhVUZzDCdhSrQKSvOFkVyLS9gBPueX7qppe/QxB+ZlAY2MSwLGc?=
 =?iso-8859-1?Q?59+VUp8HHWLluMR/CYMPamFtanfLBDY9JWH3r5085gcIYpH2cg0eVz4QHe?=
 =?iso-8859-1?Q?wrhLwn0ctUf4fECBHPsBkJgaAm9E8IQs5EHiV8wetzJtxEK9eEmlmsytzD?=
 =?iso-8859-1?Q?+iohVuyD8clr+IZouFWMaYPWepb8D1jGP7Ap48ZLhWRmHlU8CQT6wejB9g?=
 =?iso-8859-1?Q?psk7YU3cFS4Nft3/xF9OQG5dwPJ6iszlaUCLaEi7QRe1lWDslXawbzus8L?=
 =?iso-8859-1?Q?ULNZBRrWSNgR0VkJWYWQJnY0coVC2Ph8NZPVHM2Z8swqiXcc69ehjGWeJE?=
 =?iso-8859-1?Q?ZbSsWn5nJM37uKEWJXxGNQX3U+XZc6Ts7K9a+tv0NuUSHn9nxjNYqcImhT?=
 =?iso-8859-1?Q?qdm27RdfCU1gZ7QEaUMNMziZSx+N3JrmNtMjqiaqovtZlMK/6b0O7YzVyk?=
 =?iso-8859-1?Q?2yORD8MHLZj/YNr8pBnQnSiYBINqzgbzhz/wesPnGk6dVHOEM/jju97f7f?=
 =?iso-8859-1?Q?zsgclKAG58lA8p6ZwPwTRAIOj4SJ1kl3TGP83OzaWOCKJhXUN/j05TqhzQ?=
 =?iso-8859-1?Q?9YhqKVTWdkFjLcpS3YRPXOE4M9cxrP7gK7X0ZhQ5HGlcP4FV91slg/Tr6C?=
 =?iso-8859-1?Q?o/JywAd4q/K1w1RS21cFByzHrHuAuPQiSqyAS3jZDv1/dOKuq7nQbPrK6e?=
 =?iso-8859-1?Q?CRunM554OEIGu7A7eaOSVPOjshaUOZ79E7uRKQER/HlnK44XQXc+1VO/x3?=
 =?iso-8859-1?Q?APUPb28VFtV0WqsHgY8XFdH7vrbtKA+KA78rVitFMhZ+ZjM5+KMs66cRQq?=
 =?iso-8859-1?Q?5cncqGI+5yCKZw8oLca5YDVB4KlFLVt6Hl7aOt4OBlJeql1WRxfJWgTKur?=
 =?iso-8859-1?Q?fg+bw66wzf5hHSzzZeynlsJMdWNI7o7PpV9TDrnp8P4SlFLask0jM/Dci7?=
 =?iso-8859-1?Q?k4i/DT0X30/YIntRPtyz2A9IMd/jSHB469/nTP96mtCvuj8UoLQ8G5yTLv?=
 =?iso-8859-1?Q?SgBfT3kdrscku5eKCoE9UXE8eznL4Tc7g1Zagnsapw0F7I2jzEpZcs/4XV?=
 =?iso-8859-1?Q?k1Yx4C62wMsrMnl1kCOV2U7/WoVYbT6m/rgqzCsN1DWEIyKJYJOuBCDSnd?=
 =?iso-8859-1?Q?MsBcS+UIfXYp/oc7FX16V7VYs+sQzEuXQM9YX4fKRys1HR8yKc7uf4zhvg?=
 =?iso-8859-1?Q?45cTtZVE/poJHzkO5rWv2q08qMOgyB0t2nbV9HQO7h256WR+qK+WOZa2Qq?=
 =?iso-8859-1?Q?m5I9JZX7oU2Wq6ixMkIx3SszE2ec67MmLvOftYMNlXQ7gJuFq+6/4subWO?=
 =?iso-8859-1?Q?PvAtwLUsZ5ffPNupsBH22v4PntlEeOard8UAkd2ilVpKbQjFPY5ZL9RKz4?=
 =?iso-8859-1?Q?1AtcbkIxk2sVFecmdcDCKgI0iKBY0T2GrmykTuu1B142Sv8qIP7HdCDB2w?=
 =?iso-8859-1?Q?BSfTuZz4CPKxNP+Gq8Nu2oALktzV0qCbu9w1fXl/Hsyw59R2hDjvudDtJa?=
 =?iso-8859-1?Q?Uvzobd9OTPvGW+kIBQzsVdDit+6dwW8GDPKCNaCDptYKXKc90UhIPY1JjB?=
 =?iso-8859-1?Q?ePSXYU2QYiYnUNGVoGp0Q5pyEOIAN9Vn+9cL7AZft4/osIoZxjBnZokw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e518cf6c-c295-4edd-9f6b-08dc9017a424
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 04:23:59.3602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sydKjmZJCV4XnjfEqUeRyi+9nh8HHu+vAIYNCPtICp7ye8YfbFS5SLtOvK6nbPypIQ7jUtfHvMNN1w8qdqcbLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7883
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

On Tue, Jun 18, 2024 at 09:18:14AM +0200, Thomas Hellström wrote:
> Rework the TTM swapping to use the LRU walker helper.
> This helps fixing up the ttm_bo_swapout() interface
> to be consistent about not requiring any locking.
> 
> For now mimic the current behaviour of using trylock
> only. We could be using ticket-locks here but defer
> that until it's deemed necessary. The TTM swapout
> functionality is a bit weird anyway since it
> alternates between memory types without exhausting
> TTM_PL_SYSTEM first.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c     | 112 +++++++++++++++++++++----------
>  drivers/gpu/drm/ttm/ttm_device.c |  30 ++-------
>  include/drm/ttm/ttm_bo.h         |   5 +-
>  3 files changed, 83 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 43eda720657f..63a91b77f7da 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1118,11 +1118,23 @@ int ttm_bo_wait_ctx(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx)
>  }
>  EXPORT_SYMBOL(ttm_bo_wait_ctx);
>  
> -int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
> -		   gfp_t gfp_flags)
> +/**
> + * struct ttm_bo_swapout_walk - Parameters for the swapout walk
> + */
> +struct ttm_bo_swapout_walk {
> +	/** @walk: The walk base parameters. */
> +	struct ttm_lru_walk walk;
> +	/** @gfp_flags: The gfp flags to use for ttm_tt_swapout() */
> +	gfp_t gfp_flags;
> +};
> +
> +static long
> +ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
>  {
> -	struct ttm_place place;
> -	bool locked;
> +	struct ttm_place place = {.mem_type = bo->resource->mem_type};
> +	struct ttm_bo_swapout_walk *swapout_walk =
> +		container_of(walk, typeof(*swapout_walk), walk);
> +	struct ttm_operation_ctx *ctx = walk->ctx;
>  	long ret;
>  
>  	/*
> @@ -1131,28 +1143,29 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>  	 * The driver may use the fact that we're moving from SYSTEM
>  	 * as an indication that we're about to swap out.
>  	 */
> -	memset(&place, 0, sizeof(place));
> -	place.mem_type = bo->resource->mem_type;
> -	if (!ttm_bo_evict_swapout_allowable(bo, ctx, &place, &locked, NULL))
> -		return -EBUSY;
> +	if (!bo->bdev->funcs->eviction_valuable(bo, &place)) {
> +		ret = -EBUSY;
> +		goto out;
> +	}
>  
>  	if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
>  	    bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL ||
> -	    bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED ||
> -	    !ttm_bo_get_unless_zero(bo)) {
> -		if (locked)
> -			dma_resv_unlock(bo->base.resv);
> -		return -EBUSY;
> +	    bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED) {
> +		ret = -EBUSY;

I think answers my -EBUSY question from here [1]. In these cases we
continue LRU walk as eviction of the BO is not valuable.

[1] https://patchwork.freedesktop.org/patch/599606/?series=131815&rev=5#comment_1091419

> +		goto out;
>  	}
>  
>  	if (bo->deleted) {
> -		ret = ttm_bo_cleanup_refs(bo, false, false, locked);
> -		ttm_bo_put(bo);
> -		return ret == -EBUSY ? -ENOSPC : ret;
> -	}
> +		pgoff_t num_pages = bo->ttm->num_pages;
>  
> -	/* TODO: Cleanup the locking */
> -	spin_unlock(&bo->bdev->lru_lock);
> +		ret = ttm_bo_wait_ctx(bo, ctx);
> +		if (ret)
> +			goto out;
> +
> +		ttm_bo_cleanup_memtype_use(bo);
> +		ret = num_pages;
> +		goto out;
> +	}
>  
>  	/*
>  	 * Move to system cached
> @@ -1164,12 +1177,13 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>  		memset(&hop, 0, sizeof(hop));
>  		place.mem_type = TTM_PL_SYSTEM;
>  		ret = ttm_resource_alloc(bo, &place, &evict_mem);
> -		if (unlikely(ret))
> +		if (ret)
>  			goto out;
>  
>  		ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
> -		if (unlikely(ret != 0)) {
> -			WARN(ret == -EMULTIHOP, "Unexpected multihop in swaput - likely driver bug.\n");
> +		if (ret) {
> +			WARN(ret == -EMULTIHOP,
> +			     "Unexpected multihop in swapout - likely driver bug.\n");
>  			ttm_resource_free(bo, &evict_mem);
>  			goto out;
>  		}
> @@ -1179,30 +1193,54 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>  	 * Make sure BO is idle.
>  	 */
>  	ret = ttm_bo_wait_ctx(bo, ctx);
> -	if (unlikely(ret != 0))
> +	if (ret)
>  		goto out;
>  
>  	ttm_bo_unmap_virtual(bo);
> -
> -	/*
> -	 * Swap out. Buffer will be swapped in again as soon as
> -	 * anyone tries to access a ttm page.
> -	 */
>  	if (bo->bdev->funcs->swap_notify)
>  		bo->bdev->funcs->swap_notify(bo);
>  
>  	if (ttm_tt_is_populated(bo->ttm))
> -		ret = ttm_tt_swapout(bo->bdev, bo->ttm, gfp_flags);
> +		ret = ttm_tt_swapout(bo->bdev, bo->ttm, swapout_walk->gfp_flags);
>  out:
> +	/* Consider some error codes fatal. Others may continue the walk. */
> +	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS ||
> +	    ret == -EAGAIN || ret > 0)
> +		return ret;

Would it be more robust / clear to do the inverse of this? i.e. Return 0
on non-fatal error codes?

>  
> -	/*
> -	 * Unreserve without putting on LRU to avoid swapping out an
> -	 * already swapped buffer.
> -	 */
> -	if (locked)
> -		dma_resv_unlock(bo->base.resv);
> -	ttm_bo_put(bo);
> -	return ret == -EBUSY ? -ENOSPC : ret;
> +	return 0;
> +}
> +
> +const struct ttm_lru_walk_ops ttm_swap_ops = {
> +	.process_bo = ttm_bo_swapout_cb,
> +};
> +
> +/**
> + * ttm_bo_swapout() - Swap out buffer objects on the LRU list to shmem.
> + * @bdev: The ttm device.
> + * @ctx: The ttm_operation_ctx governing the swapout operation.
> + * @man: The resource manager whose resources / buffer objects are
> + * goint to be swapped out.
> + * @gfp_flags: The gfp flags used for shmem page allocations.
> + * @target: The desired number of pages to swap out.
> + *
> + * Return: The number of pages actually swapped out, or negative error code
> + * on error.
> + */
> +long ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
> +		    struct ttm_resource_manager *man, gfp_t gfp_flags,
> +		    pgoff_t target)
> +{
> +	struct ttm_bo_swapout_walk swapout_walk = {
> +		.walk = {
> +			.ops = &ttm_swap_ops,
> +			.ctx = ctx,
> +			.trylock_only = true,
> +		},
> +		.gfp_flags = gfp_flags,
> +	};
> +
> +	return ttm_lru_walk_for_evict(&swapout_walk.walk, bdev, man, target);
>  }
>  
>  void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index f9e9b1ec8c8a..ee575d8a54c0 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -148,40 +148,20 @@ int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags)
>  int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>  		       gfp_t gfp_flags)
>  {
> -	struct ttm_resource_cursor cursor;
>  	struct ttm_resource_manager *man;
> -	struct ttm_resource *res;
>  	unsigned i;
> -	int ret;
> +	long lret;
>  
> -	spin_lock(&bdev->lru_lock);
>  	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
>  		man = ttm_manager_type(bdev, i);
>  		if (!man || !man->use_tt)
>  			continue;
>  
> -		ttm_resource_manager_for_each_res(man, &cursor, res) {
> -			struct ttm_buffer_object *bo = res->bo;
> -			uint32_t num_pages;
> -
> -			if (!bo || bo->resource != res)
> -				continue;
> -
> -			num_pages = PFN_UP(bo->base.size);
> -			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
> -			/* ttm_bo_swapout has dropped the lru_lock */
> -			if (!ret) {
> -				ttm_resource_cursor_fini(&cursor);
> -				return num_pages;
> -			}
> -			if (ret != -EBUSY) {
> -				ttm_resource_cursor_fini(&cursor);
> -				return ret;
> -			}
> -		}
> +		lret = ttm_bo_swapout(bdev, ctx, man, gfp_flags, 1);

With a target of 1 this will evict exactly 1 various sized BO which
seems to match the current behavior.

Just curious what is the usage of this function which evicts 1 BO from
the device?

Matt 

> +		/* Can be both positive (num_pages) and negative (error) */
> +		if (lret)
> +			return lret;
>  	}
> -	ttm_resource_cursor_fini_locked(&cursor);
> -	spin_unlock(&bdev->lru_lock);
>  	return 0;
>  }
>  EXPORT_SYMBOL(ttm_device_swapout);
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 8b032298d66e..472a55b69afb 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -410,8 +410,9 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
>  int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map);
>  void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map);
>  int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo);
> -int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
> -		   gfp_t gfp_flags);
> +long ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
> +		    struct ttm_resource_manager *man, gfp_t gfp_flags,
> +		    pgoff_t target);
>  void ttm_bo_pin(struct ttm_buffer_object *bo);
>  void ttm_bo_unpin(struct ttm_buffer_object *bo);
>  int ttm_mem_evict_first(struct ttm_device *bdev,
> -- 
> 2.44.0
> 
