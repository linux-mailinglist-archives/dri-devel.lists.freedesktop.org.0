Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2918A9AF3AC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 22:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8728A10E3B2;
	Thu, 24 Oct 2024 20:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GRpLoBfJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D90410E3B2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 20:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729801816; x=1761337816;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wrdqruaWhocFzQmrejlgFBmuWBji+wV0Q9NGMtmMbng=;
 b=GRpLoBfJB1+qckSo3i5TWJx52t75LLXzApdLlVexXmVgMNzfmENNcgEp
 bkmWLQIQVjLTtvpGB8+V1yvkjRN1MzIhUPNkdpHUmjn1mkutF2xCKSnTv
 tBDb6fus9xl5Pi4fyhzYHdDvQjlUkkIV5a9o6XHg3oSq2CAbySUlw2LUg
 a6th/nsZywfo1GSCQ8gIpW5Gr7yW/JCbzB+uT2Jqe6IXf+gt/aCfVMvON
 uB5Y6chetCpPCzWstNvIeGK3yD0X0ileUN/i1Tbt8VGjHdS2WazxuP7YJ
 +OMRrQ4TkLN/d7Vh5BYCFfY9wdmyPFNp0H7P8oBKuOw368909FWAgdCuX A==;
X-CSE-ConnectionGUID: n3f2yiiST62P4c7UsSm5fA==
X-CSE-MsgGUID: qrCYsjO/S5mdXWrJFWpo+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="54858113"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="54858113"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 13:30:15 -0700
X-CSE-ConnectionGUID: lZcc/lLVRJ2CDJmVS9p9tw==
X-CSE-MsgGUID: yBHCZOXCSH2j1vtME7FzQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="118170368"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 13:30:15 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 13:30:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 13:30:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 13:30:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfshHSs3FE33vAO02jDzO1f3CiTArbZ57pwIjJ869e6iUnN92cFgNRuyECpQiW3pu2RnMAVeaHjs1mWcp6ymrHHyP0AjNsf2ppEQ3ssw6EumiC1wSmbScIWDOLlXDqK6VBz/oprfDoTZ773TrYB8ZllNRrSYNez2Gb9YVwhQPeOZ8auNg9Xz4+LIUkSEauTfGZcXmrn+OIWSQcMnPnKVQNiX3yJ8IE2xzaZFjw+alDK3CxD381dyw0l/ijZH7j9hMNT/Wt+D+c6cO9t8+oiN9MjvSBfk5fP1s0SduepJdt5gsptHMUZXwyxlzllSTlcfv9+GSK5k916U/XBGJtfs4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytyepIESqAJCRctYZTUZppTne4AuGiyY5K9ap0ht1l8=;
 b=idZfV47QnfFvch4yVOaLlDRwRxuZ3vPSr3npWFhWdNGqiPQhbP4Qc07o00O6E1JoYZZ1JPKJKZXTdWOXaId8nCibB3jdgNf86bLfoVV3xby0orAIzGErpeCqzciKqKAVAyjkr0CpJ7FFK0D2yuMBxfooKutFqvqR7dsNKxEqPJMxycccpLZ6a1SX56QRq919YaQeuqN1Y8zW9S2voTLXr/z73FRBCEdqzb88UtOfPNnlHD4gTHno2eiRgK4PBjCzzctYtuBPX/+quDFqU5MVvihat9DH3Mt039LAccQFLzNCB7lJk6ESdHGFhQIcP3UFrEvFdnNhaNFd24qvklhQew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6745.namprd11.prod.outlook.com (2603:10b6:510:1af::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 20:30:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 20:30:12 +0000
Date: Thu, 24 Oct 2024 20:29:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: <friedrich.vock@gmx.de>, <Richardqi.Liang@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH 1/3] dma-buf/dma-fence_array: use kvzalloc
Message-ID: <ZxquPRn1QtaVzydE@DUT025-TGLU.fm.intel.com>
References: <20241024124159.4519-1-christian.koenig@amd.com>
 <20241024124159.4519-2-christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241024124159.4519-2-christian.koenig@amd.com>
X-ClientProxiedBy: BYAPR02CA0036.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::49) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6745:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae0b1d3-7f7c-49fa-ce7b-08dcf46aa8f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Y79TDY4XeqXBZvj1Hzj2QcEvAH1qx5bFtWDC680qR52JtQGwc/MJS7R+ys?=
 =?iso-8859-1?Q?yCGl5p9T3zs7GHwV950XIx9mnj9kZ6J3kDDBrieXGJSRjdM9cKm40S5DXp?=
 =?iso-8859-1?Q?8dmrQQFZA9TsqaFAYNj8G7mqNg+AY6gRXfSOXQHfUrt9z1QC7yi/g4VOTU?=
 =?iso-8859-1?Q?KwGAyfd1AH6CThINjz3X6oXVStVFzYqVDiaApUkzC3NnPBKFGLjImcVZhg?=
 =?iso-8859-1?Q?rnKmX+px/jpsLgqVN9tfWRSSCfYZh/EpG9OfVmCH4Ja3fn6B0QTKtgHhT7?=
 =?iso-8859-1?Q?h8T+SxTsjfUeXuZBi96R/uSNZHRaJHw8vQSLBmKan4jhi+5wRfE5Xsipgk?=
 =?iso-8859-1?Q?CuCPSRxcy9VVjKAv5OUhqYEVrbJRPSgIwCh/oJSQqiMuQ8kJSxwBU9vVTb?=
 =?iso-8859-1?Q?7R7K1ZM8ynW7uUnH/XHcYqqyQbdrVSDO5wfbjxxCt7kol6ZfvuT9IzvfFZ?=
 =?iso-8859-1?Q?Dn3CkxXhV12tg2apEFUO4CbyXJ2HxaSlch5f6IBsTSKu0F8Kz+/nE0JDW9?=
 =?iso-8859-1?Q?jw+a7sA33VE+WMhZjo8IKwF7DEuH/D2mlxVG7BrCEE5BoBe1UPq8IlE8a6?=
 =?iso-8859-1?Q?YyweWchRWFzwmLTjJk04TSEDYTCrEwGKRmT1973NoNV16Typ/271hap56L?=
 =?iso-8859-1?Q?U4UpqILH6bbfIfkS0GarNtI+Xf9r3aMDVYCbSLou8bCJvmJJ1XkSua1GiH?=
 =?iso-8859-1?Q?PjhaaK8+XIRHg3kmnjWgpA1hOMwPROpQvdRkwPtW0IGDTXaWLKDSk2Pp6j?=
 =?iso-8859-1?Q?ykOv82S87l2rr3mYUhKSdCUvXdaEUi0Xd53tuh02doOj20r6lolM/PPVgq?=
 =?iso-8859-1?Q?vZBt/5ilcoTFD+1C2Z+V3T0LL895ZuCzcMb2h/laEYMCtuD4iDRS+vvzm3?=
 =?iso-8859-1?Q?h8En1XdhF+yYWCLkB4zJFP927DJqVOYiUbc4LQfJxq/L9TdqRMf+0NcjBc?=
 =?iso-8859-1?Q?J0Ga3ZF7GdZreTI5/NlGmpBl5znOts0Mk9Tc6+oxw1MFNWhqqR+nJ8Zzko?=
 =?iso-8859-1?Q?2YfkanPNpZYZ+6Xir9Qt1Atr4lDaejgbOD3NkzjGtK+JGvYSh8aZEDC9g/?=
 =?iso-8859-1?Q?8l2eQ4M2JbnsgGTsUUKdV6WqAtEFzORS077UxOOGP1+KxBEAkf1S6786kL?=
 =?iso-8859-1?Q?hzU3c+j6Jew8Ko4K6khVoOMiznMtIA73oRPJGg0ZvsqyVELYvr84lvbTv3?=
 =?iso-8859-1?Q?EGuM/jo1v8Im2tH85YQuh+5wqNVwaC6jK9rT8CcMVnzfXKFbS9zaV3a9Y5?=
 =?iso-8859-1?Q?ntckO8g0TVXaxHVvBblPzjAHHUuZI6ks6CVt/VMABs9LJqPMkXr5bENu1f?=
 =?iso-8859-1?Q?+UEJhKVVdVRfuBO07H4vU1OUyW3Y3jdhVoSwaKwqUZeR7HDJOPb4KxRxFZ?=
 =?iso-8859-1?Q?3GlKIhTwJR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?yz15iLFXJ/i0ctxG5kI9G5FsxuJD4JJsTHRB34O7KYN9rqoK3H3tuYEY0L?=
 =?iso-8859-1?Q?YoBrHxhcnt1oBcQQ8/DASkbg0QEiqWYYB1J15RyNE4KJhfgzY5ueHQSB87?=
 =?iso-8859-1?Q?fpkz05KEsbEP/tWvpd2COS7wvraadzbMk/nyFjYWZay3G19spxFCOpzqUS?=
 =?iso-8859-1?Q?0IEl02prq0oKwHRxAVzxMHernKFBg2+AfZwEmMqtMoLIp8hAWd6lp7ocvG?=
 =?iso-8859-1?Q?zaQ2jII/+lKeu8ZLnAIaLWhaRvhWGsSpapsPQSy1d6u1XrFMX/Y/3uUaMF?=
 =?iso-8859-1?Q?tjRgEnx1fgZFZVnX23Kn2tfBwNjNUUrK2tAviETP2mvB4u2PwuIg4T/P6D?=
 =?iso-8859-1?Q?+Qc5jjOU/lQ5JBCpyAngtXjASQLye1bq4g42nuLjyZ4FwjM1WKz/KKjwxt?=
 =?iso-8859-1?Q?JwBmr13+elx5xKiRHgiaoNxynjRmjQ5TTcaFIF0Q5lvRCvUdnk2u8Uej0K?=
 =?iso-8859-1?Q?LJLu7HlkcXmnqv8s5R3rfCdmhZCXPyePYtbTuRGou2LWxzkQE/8DmXTNJR?=
 =?iso-8859-1?Q?Cf6P4f7BKgPwqn7b7rjZSTkrzjK3EhUkAu0R9VohbIfdneirYdLe8SVwq4?=
 =?iso-8859-1?Q?EGWLcOFjKnsnDneeSDpJGTbpQPfiXf7uNASdfRom8LFQiPx2CmsiIWu+gv?=
 =?iso-8859-1?Q?Fnpovf6ehVHeOEGacOcAnJfZIRmbBNPEZYeGHjbCRxKNGtCTdJQbIwrdad?=
 =?iso-8859-1?Q?n7dllCQSI3K2On6hiRbZFqSk2zEqgb3Rw6b40UvZJcOlx52Wckqn7K81PF?=
 =?iso-8859-1?Q?XCnl7T4cg/EoQHybsZOEhNLxbH6E0QE53ItYpzXV/2bxAeuJop+qBwFAWf?=
 =?iso-8859-1?Q?mSA+qnXPSHpQtmoCObXbaudUVq4LFrlyoqLSEv/Mz1ShLEN8CHfbjCJbpF?=
 =?iso-8859-1?Q?sC+RNTnuWZvhYYAAyix5dTk5skR6iainLNX4Ewvm4bv90cSEptWQQaNVZ3?=
 =?iso-8859-1?Q?5IIuTBHGvr3z2mViLSMGLcdaFCVRZeK6ZplcSpbk3htmi+uho/FtS71H+A?=
 =?iso-8859-1?Q?Q+eFyMiThwU30WHKZx3CaIQ3s9DCqw7nf5Io35piTuF8YtxYQrSJj8hY9l?=
 =?iso-8859-1?Q?s+DPXWWlXpjWEcZesSmaUzh/eBVCYMJixRuB0gLR+2awQKMbgI+ZN2614a?=
 =?iso-8859-1?Q?uFBqg+yHACZbIB4rMdgZPvuw20qGYg+ObQzEuIsx5x8E0Bplj0uEHS5TCb?=
 =?iso-8859-1?Q?1+q7azNRko3vo664rp7YaPHLRl75Q06F63JHgfGjV/54iWgZeiK/QcsJ+Z?=
 =?iso-8859-1?Q?3/TOvau3BkLn4SY2epetXZlWRlYg0kO8F7R8CeJAz+eTwV11jBnS69+r8v?=
 =?iso-8859-1?Q?3yGBihVSBeuQzTPqzDMaSBoojjSH6fcx7yP/NqBJSE3eLlRwuV1IjbYdl6?=
 =?iso-8859-1?Q?A4i9kSPpziudozjctOqC2O7spYCTH93tONvuEeC+Y7AMEq1iP7y5k8XLiw?=
 =?iso-8859-1?Q?UseQKz3IiXWBNkrwd7nPBOFsiVyypp4br06XU1p7YTGol+MuxRuJV3wAK+?=
 =?iso-8859-1?Q?rFnFwu2S509smc4SKn5Vi4a9NQC6GPu/2KQQdvFK7UjJMS3dzUXYr1YNhd?=
 =?iso-8859-1?Q?/k3YJfGh53Nbt/AZLg2TUMcoT5T5jvlgJn5ZjzqcFfRVtgukQhxh52tJp8?=
 =?iso-8859-1?Q?qaVLsv0kgVWzQRa9C4qEMVMwW1Ki4JERx3PPUar8j9RD+NMcG51d0PWA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae0b1d3-7f7c-49fa-ce7b-08dcf46aa8f9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 20:30:11.9717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JRFilZgFZdKiq1ZE4tGKgiG3kI35zc/26zVrOl/HKONrRhHt17I6LqStnhYA2AuV6SomKuuBncmes6cjpegA3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6745
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

On Thu, Oct 24, 2024 at 02:41:57PM +0200, Christian König wrote:
> Reports indicates that some userspace applications try to merge more than
> 80k of fences into a single dma_fence_array leading to a warning from

Really, yikes.

> kzalloc() that the requested size becomes to big.
> 
> While that is clearly an userspace bug we should probably handle that case
> gracefully in the kernel.
> 
> So we can either reject requests to merge more than a reasonable amount of
> fences (64k maybe?) or we can start to use kvzalloc() instead of kzalloc().
> This patch here does the later.
> 

This patch seems reasonable to me if the above use is in fact valid.

> Signed-off-by: Christian König <christian.koenig@amd.com>
> CC: stable@vger.kernel.org

Fixes tag?

Patch itself LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/dma-buf/dma-fence-array.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index 8a08ffde31e7..46ac42bcfac0 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -119,8 +119,8 @@ static void dma_fence_array_release(struct dma_fence *fence)
>  	for (i = 0; i < array->num_fences; ++i)
>  		dma_fence_put(array->fences[i]);
>  
> -	kfree(array->fences);
> -	dma_fence_free(fence);
> +	kvfree(array->fences);
> +	kvfree_rcu(fence, rcu);
>  }
>  
>  static void dma_fence_array_set_deadline(struct dma_fence *fence,
> @@ -153,7 +153,7 @@ struct dma_fence_array *dma_fence_array_alloc(int num_fences)
>  {
>  	struct dma_fence_array *array;
>  
> -	return kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
> +	return kvzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
>  }
>  EXPORT_SYMBOL(dma_fence_array_alloc);
>  
> -- 
> 2.34.1
> 
