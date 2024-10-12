Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8161D99B0CA
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 06:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E2B10E029;
	Sat, 12 Oct 2024 04:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPjvU3ux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7162610E029;
 Sat, 12 Oct 2024 04:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728706683; x=1760242683;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VfYQk7AHpzt3jzXjOPB0OuLiBpGvmUN2Y3GniQIyNwg=;
 b=OPjvU3uxtfyshBmM4JTdyqmKGL88IcPeykaJtwMUC9cCXXzyI8yr77TR
 n6BRQVd3ZxA87R9+cIi7XCHA8D/vQ54fMrlAKGdw5jpDiybRtBjTifDz1
 0zWJA28dMKmztQu35ULU2cVoJyQ0c9mFKgNMURPhfYNElSr/kCr1eFxfR
 ScphV6NgDgOWmQdhGNmj3Zmq7IKbwf2rx3LZs7LFBhw5XMeST9FGNyXi+
 t84sXJ8wDNKbZ5MIkBqbWD+OsIcVZ7RKnDLvmaIiOtc99odk06MQuVCnE
 dKQtjYaWcULPmcsvzbxRsQPATOap9X5tFwbKThFWw7t7nmBsZSXX2MWEI g==;
X-CSE-ConnectionGUID: QIPWWlqzSfWE7YddmDZUJw==
X-CSE-MsgGUID: AQYmC/3pQNCXRhQDB8WeJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38681241"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="38681241"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 21:18:03 -0700
X-CSE-ConnectionGUID: oOr6ylCcQNSx1mjUR3pqmQ==
X-CSE-MsgGUID: gehqPiHSSVqi/wbk+r0pig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="77004246"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 21:18:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 21:18:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 21:18:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 21:18:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 21:18:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YA7PsZpy5DOKW4FQgIBeD/H70ABAeL8db8TXgbRdDdCeNKpox8WOO9u5WS1ckwLLvHqJ/avS/TFmZ1DakXiwNHao5OPP9/BMDVH+nKoMgf6D+ofxXzCvbOczuymc85gGd2+oEb1AP8vypkc3yhxkC6Kn2slJdfH6/eqdKnf1lfr/O6iotoMaUNr49vB5oWif7uP+uws6WygYznZWpG6m3XRll6vRo6DK1is08YDFQY/iGtbdGsw8p9x6aymRY0VQoNYkFeFtnt1JLkg8gvnSp3a22VRIj8IDstKXDzDT2Gw+ApX+ziwN9XcBBijabQilkVWiTEpt2zg/wZGlhbbqEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30yWIYAGPb7CbjqxVCnshyEhsy8GVVtF7z+vF7+fl1Q=;
 b=PQBnqnSvqRr6BfxKHdZNPPRaslgQw+zz1XC3XcnDBP9G7diRrf0DtaY2pTu4BVZK+D9VaGvgLdzZdHi40xahbzetFLymn5nA2STTKFlXxwCB89uHqVzzGjUPwMk389F3IEaiLL+jzRgp9DVuRqTrDGlWQrS1qvArtp44AB8oa7ZC9Oc5yVYMHdAk7BVwYLH3hGACQbkUHmYZoIlRKZ+PWwvI+0CRcVoiheMGwl9V+u4lBU/oK3Iougt9nCNHjcz4NVNloqapkSzDEaasjw2q4DFI5QMefMut1cYFF/zhM/Rg/cnuCwGgr0PxCFoCWM5le6NtbIz2Jk2IeqwU0hyINw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6965.namprd11.prod.outlook.com (2603:10b6:806:2bf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Sat, 12 Oct
 2024 04:17:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8048.017; Sat, 12 Oct 2024
 04:17:53 +0000
Date: Sat, 12 Oct 2024 04:17:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 4/5] drm/xe/bo: Create a new sg for dmabuf BOs that
 are associated with a VF
Message-ID: <Zwn4WOBAzhAs9wIW@DUT025-TGLU.fm.intel.com>
References: <20241012024524.1377836-1-vivek.kasireddy@intel.com>
 <20241012024524.1377836-5-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241012024524.1377836-5-vivek.kasireddy@intel.com>
X-ClientProxiedBy: SJ0P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: 682c41c4-7ff0-4578-6ea3-08dcea74d740
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SRYjm1cX2eCGNsvh+BXFK0e6X3s6+AzhXphrSulEcw9lVBr/qUPCv1b+GLES?=
 =?us-ascii?Q?N42c6Z3owLCshnxklGd6JWsQ/vDTtMhYilDEg9QuhkFKPN8E+CeJgkME41gz?=
 =?us-ascii?Q?L/9JB+MQ8fxuU3NKFMzIo0ahkBbg+1Mfk83D05Dt9LJeJK3tomEvua62sMKA?=
 =?us-ascii?Q?SVq2R98M/tX2fMdAtJgfZEH5Bns7JUkT8y9p1KMJquFaQYxmNDHnT3NtdqsL?=
 =?us-ascii?Q?YhjZSsuqntYap5x6mCp3dZaq57epIwDixHxcWfRe5RYE5C6/q/mrG09/orLU?=
 =?us-ascii?Q?Kc9ZOneHyLFgEtLU+YkXnoXuLzYhl9rLChE/XHB5GREjEP4WFGBUgjIEyw7W?=
 =?us-ascii?Q?3whG1JweHPe6Cg6V2ku6x+po2lzjypIMoKrAeJVO9A/I2a0a6ieuppY32B1C?=
 =?us-ascii?Q?ckBf13qYdJCmLQnS/R3aA+xQ3zpXsDmEFkLsiNGGH9/r6sCvGMtIcDtJrD90?=
 =?us-ascii?Q?vSrTvVO6JUDBSMaLO4wZbXLREvbWf3nuq2JEV+pEauRvTBnJd4IswmViQFcS?=
 =?us-ascii?Q?IYGbVsA7G8PbljMaAvMXqdvf+K+zzQYF6Xehu+/Lw+EdHrtoGPb4nNwYnTWH?=
 =?us-ascii?Q?inOK2Ycf76phl+0HQ16re5iLv+KkZKv8xXRie62preoZdntNzBwHXjRVbh1h?=
 =?us-ascii?Q?QolHUI4tuFyZy2hS03OQPuSfRYCmtsCr7ZPYOdfkdejCOSbHVMbhWEzGlGkF?=
 =?us-ascii?Q?aC5wnCmDbQmIC1GXt7G+lSUop4opg2eI0EyCk0XEwX+KEG/6je+bpyhVrP4v?=
 =?us-ascii?Q?nMmB6XmvfEANr/BslgEbgwbPeom0XHUXCX+1uRcs/vZUTL0vVEqqOlM39j8u?=
 =?us-ascii?Q?A2yhly+I362WBmRHC5Rr+rfbWGZf5vYiJjbcCERT+oVRTnEFvSTEBVOXU2/X?=
 =?us-ascii?Q?6hTfMPyFl0qs+wrBZWs17hTDjfIZC1LqwCUIzMDWD6G8WFK0QWxeRG6dt4Zl?=
 =?us-ascii?Q?PgEgXoFwiDGzEPhJg37pIV6soo0P2KEXXdVauMSlO9VeNkUhNuJWAfAbMkk0?=
 =?us-ascii?Q?RLCg7r8NXXRhwMpOpPW1DD4g60QZoQZy3QiFIusaS4LLM7GB2CPLcfzRR94/?=
 =?us-ascii?Q?l3ZpnOPAGV7NBCcgNKCaBBX57pa/wk9EcGdjB2sLKLty07muMwqqR9bZmo9E?=
 =?us-ascii?Q?6JkAxBcSoLiD9iXj5wP61N4BIoF+MsyWo5joMKBsSOcXYHH2KE0hwF3PB0y4?=
 =?us-ascii?Q?uPvG9VVdHAv3SbSp7sFpHT5oMKu/Gf0IwE8HVLrAm8rSWOgmA28QufO8Zc0?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ytrt7zQvJajNHoG/Yw0LEjf1gzY3Tx7aI0AtNBSiwXPT/jrJFDivge8DOsDp?=
 =?us-ascii?Q?AIg+BUDb3sEeUBsJqftyE2hib8YW3ddXvaxhatbsIO44WRxHECDHxUSGIph9?=
 =?us-ascii?Q?KXwrSWtwkWXsJWES/lodz2wsc3QPCStlvanHxGBxlwJPMPdCssmlXjijQyjr?=
 =?us-ascii?Q?PZFq+L4f5hU4VjnaU62Ie87VH3VfoGRRAUmSZd9Bl9W55IKBSRUJz9ixf6vP?=
 =?us-ascii?Q?zcd5Y8UG7wYhqiAdcYMpdQT22Py7jazAtA0BLJD7Yw+cGhBqqL6BAH9e0Pdr?=
 =?us-ascii?Q?DWAXRAl07+CDJo+byoJLZKZUJzbtmEzm/Dw+vE59AeGmawBAW2WAjLXOeYan?=
 =?us-ascii?Q?2Ly4zpaXsgZfHIvCcoaFXElzXW48uAOyY+H5YiYzP9ZQXCunprLTLJUYwjHC?=
 =?us-ascii?Q?fIOjNwXmuGKgBrZDlEwBtcWYzdRPmmdAd4ONFLS9XL4PxKgc7JNGuxBk/dav?=
 =?us-ascii?Q?+t2Wy9YMDBwhzkLFsTY5okYWXA7F7Nc87pjYDZwtKRSWYZsqY+3wnqxzPCgt?=
 =?us-ascii?Q?Gkbr0TiXzS62HwObGHQZLVfIz4w0sWm89ewEFM9+XTJQSdOkmXhuPuyoV+C/?=
 =?us-ascii?Q?M+ZDFxZQA82KY/ipcDJ4U+dYsQueBISbyjZUIEy9hLn3nc/P0MLcVkUHb2hK?=
 =?us-ascii?Q?gGQC0Ega4dOo1JnDCwGjFlRDg9NDBpc5UbIBXXC+VAHWtQ0Nqr4jJYG9TbWg?=
 =?us-ascii?Q?tyfcumgelmLmktqMwR7v86BOlLhI5kKlnOMBLuctymXb99MqWD8R6sziFLdK?=
 =?us-ascii?Q?9yvX0tVVwIJzCXsbkRIsmVWf+7kHICNeshUVcL9P8V//J2RT7fYflsPtCSrQ?=
 =?us-ascii?Q?dbrffdE4hrWohfEi2uYmWHh2Q/w2gzzqseVPyaSZvIfsZntX9JDAVwLJYuZU?=
 =?us-ascii?Q?j9ZGXMZ/1E48ba+KP9OqYmIbUhvu8hkUmS5Ki/XOTMNP1FPJMmH1ExKgnll8?=
 =?us-ascii?Q?cvg6CwNDVUKq/XBlQgrdOJYX121NVPGYlZ0VT6kNn0o0ZxKu8uT0SqK3z1rR?=
 =?us-ascii?Q?6baD1kjbtr6tnk4b0L0/7zRrwoAcrheflISkkMHJRD20WepFdCtOL799/gc5?=
 =?us-ascii?Q?+0ToNTh8dbPCbSKLEJTfdxxCmAHR2HTk371mHpGmTWJO7capHVvRJWcNq+52?=
 =?us-ascii?Q?aj9zPmo4s6lEQA7GbOmRFFL86CnjiMpXQpPDshFg6E9Q0stJPAUTuv9ex8Wr?=
 =?us-ascii?Q?DpiuYG9PWF1FHMzDb+pzO5vKk+mDySHmGBCGwmbxr0sCqg1fUJ0zPc8Mk194?=
 =?us-ascii?Q?m6CAuWxHTS6c1GYlzFizfyYCp+VbGB0c9twEAJ2g7U0uxCgx8vTRqGZleMIU?=
 =?us-ascii?Q?XufpVZxC1jP9KyjEtXPSsaEdwLkSRHkfxPp18Swc+Ki1OULM8pA6fRwz/ciN?=
 =?us-ascii?Q?IJH7gUW1lxZQCnu4ykoLGJbcIFN4m6+4FJHH4Ij6xyygHTNK7MXckw9/f6id?=
 =?us-ascii?Q?QtLhL0L6JKw21aS9wLy1EhkKyn2O6cPQ7b1zkhw6oP03Qj3+hWSLbBUbOP9R?=
 =?us-ascii?Q?XsHl+uE/EyYbzuYgp65c55vAFWj9c9joflV2m8XZAqi+ZlgCnuB1qll2f5X0?=
 =?us-ascii?Q?LdTdvXxGGqDAviojUVw9Ae3jVeIHcH1R7iwR2BZQNq9j3HsxvOuCHxaAhshQ?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 682c41c4-7ff0-4578-6ea3-08dcea74d740
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 04:17:52.9321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSRy8Ltd9f2YonjtADVJhZ9GnYYfMSlJ8StyKIu6jV16aAiDWP3gkRYJRGlaPoFW60sNLiL/uXpTFrSKXvT1qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6965
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

On Fri, Oct 11, 2024 at 07:40:26PM -0700, Vivek Kasireddy wrote:
> For BOs of type ttm_bo_type_sg, that are backed by PCI BAR addresses
> associated with a VF, we need to adjust and translate these addresses
> to LMEM addresses to make the BOs usable by the PF. Otherwise, the BOs
> (i.e, PCI BAR addresses) are only accessible by the CPU and not by
> the GPU.
> 
> In order to do the above, we first need to identify if the DMA addresses
> associated with an imported BO (type ttm_bo_type_sg) belong to System
> RAM or a VF or other PCI device. After we confirm that they belong to
> a VF, we convert the DMA addresses (IOVAs in this case) to DPAs and
> create a new sg and populate it with the new addresses.

I think using a SG list is a no-go. We have received pushback before [1]
about using a SG list as structure to hold DPA rather than dma-address.
The consensus was a SG list is not a generic structure to hold any
address [2], rather a specific structure for dma addressess.

I'm pretty sure we will have define a new BO type (ttm_bo_type_devmem?)
and structure that can iterated on if we want to do something like this
unless we want to ignore the above feedback.

[1] https://patchwork.freedesktop.org/patch/574894/?series=128910&rev=1
[2] https://patchwork.freedesktop.org/patch/574894/?series=128910&rev=1#comment_1070889

> 
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c       | 108 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_bo_types.h |   6 ++
>  2 files changed, 113 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c74c121ea7bb..64efe1b21f19 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -6,6 +6,7 @@
>  #include "xe_bo.h"
>  
>  #include <linux/dma-buf.h>
> +#include <linux/iommu.h>
>  
>  #include <drm/drm_drv.h>
>  #include <drm/drm_gem_ttm_helper.h>
> @@ -15,16 +16,19 @@
>  #include <drm/ttm/ttm_tt.h>
>  #include <uapi/drm/xe_drm.h>
>  
> +#include "regs/xe_bars.h"
>  #include "xe_device.h"
>  #include "xe_dma_buf.h"
>  #include "xe_drm_client.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> +#include "xe_gt_sriov_pf_config.h"
>  #include "xe_map.h"
>  #include "xe_migrate.h"
>  #include "xe_pm.h"
>  #include "xe_preempt_fence.h"
>  #include "xe_res_cursor.h"
> +#include "xe_sriov_pf_helpers.h"
>  #include "xe_trace_bo.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_vm.h"
> @@ -543,6 +547,102 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>  	return ret;
>  }
>  
> +static struct pci_dev *xe_find_vf_dev(struct xe_device *xe,
> +				      phys_addr_t phys)
> +{
> +	struct pci_dev *pdev, *pf_pdev = to_pci_dev(xe->drm.dev);
> +	resource_size_t io_start, io_size;
> +
> +	list_for_each_entry(pdev, &pf_pdev->bus->devices, bus_list) {
> +		if (pdev->is_physfn)
> +			continue;
> +
> +		io_start = pci_resource_start(pdev, LMEM_BAR);
> +		io_size = pci_resource_len(pdev, LMEM_BAR);
> +
> +		if (phys >= io_start &&
> +		    phys < (io_start + io_size - PAGE_SIZE))
> +			return pdev;
> +	}
> +	return NULL;
> +}
> +
> +
> +static void xe_bo_translate_iova_to_dpa(struct xe_device *xe,
> +					struct sg_table *sg,
> +					struct sg_table *new_sg,
> +					struct pci_dev *pdev)
> +{
> +	resource_size_t io_start = pci_resource_start(pdev, LMEM_BAR);
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	struct scatterlist *sgl, *new_sgl;
> +	int i, vfid = pci_iov_vf_id(pdev);
> +	dma_addr_t new_addr, bo_addr;
> +	struct iommu_domain *domain;
> +	phys_addr_t phys;
> +	u64 offset;
> +
> +	bo_addr = xe_gt_sriov_pf_config_get_lmem_addr(gt, ++vfid);
> +	domain = iommu_get_domain_for_dev(xe->drm.dev);
> +
> +	new_sgl = new_sg->sgl;
> +	for_each_sgtable_dma_sg(sg, sgl, i) {

I'm pretty sure this doesn't work if a single dma address of the input
'sg' resolves to a non-contiguous physical DPA. In most cases this is
going to be contiguous though unless there is memory pressure or
unaligned allocations sizes. Assuming your testing didn't blow up, you
may not have hit a memory pressure situation where VRAM gets fragmented.

I think only iommu_iova_to_phys is accurate for exactly 1 page unless
I'm missing something. See [3].

[3] https://elixir.bootlin.com/linux/v6.11.3/source/drivers/iommu/iommu.c#L2376

Matt

> +		phys = domain ? iommu_iova_to_phys(domain, sg_dma_address(sgl)) :
> +			sg_dma_address(sgl);
> +		offset = phys - io_start;
> +		new_addr = bo_addr + offset;
> +
> +		sg_set_page(new_sgl, NULL, sg_dma_len(sgl), 0);
> +		sg_dma_address(new_sgl) = new_addr;
> +		sg_dma_len(new_sgl) = sg_dma_len(sgl);
> +
> +		new_sgl = sg_next(new_sgl);
> +	}
> +}
> +
> +static struct sg_table *xe_bo_create_new_sg(struct sg_table *sg,
> +					    struct xe_bo *bo)
> +{
> +	struct xe_device *xe = xe_bo_device(bo);
> +	struct iommu_domain *domain;
> +	struct sg_table *new_sg;
> +	struct pci_dev *pdev;
> +	phys_addr_t phys;
> +	int vfid;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return sg;
> +
> +	domain = iommu_get_domain_for_dev(xe->drm.dev);
> +	phys = domain ? iommu_iova_to_phys(domain, sg_dma_address(sg->sgl)) :
> +		sg_dma_address(sg->sgl);
> +
> +	if (page_is_ram(PFN_DOWN(phys)))
> +		return sg;
> +
> +	pdev = xe_find_vf_dev(xe, phys);
> +	if (!pdev)
> +		return sg;
> +
> +	vfid = pci_iov_vf_id(pdev);
> +	if (vfid < 0)
> +		return sg;
> +
> +	new_sg = kzalloc(sizeof(*new_sg), GFP_KERNEL);
> +	if (!new_sg)
> +		return sg;
> +
> +	if (sg_alloc_table(new_sg, sg->nents, GFP_KERNEL)) {
> +		kfree(new_sg);
> +		return sg;
> +	}
> +
> +	bo->is_devmem_external = true;
> +	xe_bo_translate_iova_to_dpa(xe, sg, new_sg, pdev);
> +
> +	return new_sg;
> +}
> +
>  /*
>   * The dma-buf map_attachment() / unmap_attachment() is hooked up here.
>   * Note that unmapping the attachment is deferred to the next
> @@ -577,7 +677,7 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
>  		return PTR_ERR(sg);
>  
>  	ttm_bo->sg = sg;
> -	xe_tt->sg = sg;
> +	xe_tt->sg = xe_bo_create_new_sg(sg, ttm_to_xe_bo(ttm_bo));
>  
>  out:
>  	ttm_bo_move_null(ttm_bo, new_res);
> @@ -1066,6 +1166,8 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
>  
>  static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>  {
> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> +
>  	if (!xe_bo_is_xe_bo(ttm_bo))
>  		return;
>  
> @@ -1079,6 +1181,10 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>  
>  		dma_buf_unmap_attachment(ttm_bo->base.import_attach, ttm_bo->sg,
>  					 DMA_BIDIRECTIONAL);
> +		if (bo->is_devmem_external && xe_tt->sg != ttm_bo->sg) {
> +			sg_free_table(xe_tt->sg);
> +			kfree(xe_tt->sg);
> +		}
>  		ttm_bo->sg = NULL;
>  		xe_tt->sg = NULL;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 8b9201775081..0fe619bc436d 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -67,6 +67,12 @@ struct xe_bo {
>  	/** @ccs_cleared */
>  	bool ccs_cleared;
>  
> +	/**
> +	 * @is_devmem_external: Whether this BO is an imported dma-buf that
> +	 * has a backing store in VRAM.
> +	 */
> +	bool is_devmem_external;
> +
>  	/**
>  	 * @cpu_caching: CPU caching mode. Currently only used for userspace
>  	 * objects. Exceptions are system memory on DGFX, which is always
> -- 
> 2.45.1
> 
