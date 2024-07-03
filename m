Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4059268F5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 21:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90ED110E0A0;
	Wed,  3 Jul 2024 19:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GyatwcAB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F6B10E084;
 Wed,  3 Jul 2024 19:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720034502; x=1751570502;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fHMeW2I7c0sE/Vd8BHBIu4tRheJaM7Zd579F9BNyjFI=;
 b=GyatwcABuz/WqOHwcD7+6fxvv+6f3BMKRwuwpVnUbghO/KXY7mIkuB0I
 GVdY8DTE5NMjM/gJfSfmnobO/F0if1Xt/F6Xixf+OkpEWi46HyOMXPfnH
 iQEfpta1gxnBsb6AUwvRdt6L5QwZuPEn1KCmvdqlUUIosteHZ3fCXCNQD
 2/zFCgjWg2YAUaE86HYgSyMi08nhjHgs9Hc+XmBHHIS14g0wKY72Pl3A+
 OecKPlykQ13UnuWtPuFEX4tX9hFkQ+8Mx1mqpB3TJonaW4xsalN8LUuHI
 8tatURCn62wljXZ4zX+At53GAXIf2zgYLAw90po8kPPdkUCjVYDJ+u7va g==;
X-CSE-ConnectionGUID: lBfmBkMNSW6H/N3muRw9Pw==
X-CSE-MsgGUID: sFcmRW1uQ8utl6DDEYtWGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="21159889"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="21159889"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 12:21:41 -0700
X-CSE-ConnectionGUID: xjpXcqGfSR6F2f+28K6bzg==
X-CSE-MsgGUID: rZtfnwp6StCVJ10F/PGeAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="47021341"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 12:21:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 12:21:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 12:21:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 12:21:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjqS1EMRCA9i2f6fWCb3OZRItPXiTv+XnX+4R4CE/GCGVipGg4DXuPoL2dDdLwhTvxCgkWfWKoLLd8Jo+DYo4Jwex4+SpH4JlFx/3ejxRLfqhPsLvU7gcREukvO1FqY7+sUnvbNrLVPlTX/QBTS/8u+Z8adPMLinYU+2NZXvvgqLZ3w8bDmD3H01qRVuYC70/RvuNFvWAFdWIx5lky3tQ/1DaOxjNkJTUtXCa8j/665gUk77mkR6SjH1ll+3auLhtATPnusVJ74L36rOhUJNKmg7XSlL5kI46FHe6WCO543eY+kFaYSEtSg816SNKCJ06QPyG9SAK2/EPX44K/XAuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOCj5GIyq1+smgX+FuUUsCwp+0pbRGla66z2IG55qoA=;
 b=Lz7BfOydiCQkARkI2N5tIBDBgvgoj1TmUVNDEwhYUKD19ApS0MZ07OFD2sZYY5+THp+XqLPpn16SWBVV8xAtarTK/uFZ37WXQDEmz/YDixgc6jyy/miBtfPkwEibjb5k3/B4PJ/xFoqDkjlH+syaVqCyBCwQwiH7fKIv8hl4BmeVNxsVEFKgKPnEPrWZ+0/aitI4AwdpuYhziJbHuyungzPt02XiPXuuG9yRh1D8BR+fZEdol3XzPdAvc6etc6+SvNNOkdp8YbRBYlCtFifc7pL+If63edYpmgJV0M+y7V+8jR2I68Vdjp4NjUM32LXxIF0sRuy3zWLgf8g6bN+Brw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA0PR11MB8418.namprd11.prod.outlook.com (2603:10b6:208:487::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Wed, 3 Jul
 2024 19:21:35 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 19:21:35 +0000
Date: Wed, 3 Jul 2024 19:20:52 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v6 07/12] drm/ttm: Use the LRU walker for eviction
Message-ID: <ZoWklH5Vk2YgTKET@DUT025-TGLU.fm.intel.com>
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-8-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240703153813.182001-8-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0095.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::36) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA0PR11MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: f0b83106-10cd-49b7-d035-08dc9b955a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8vIDX4oQbqNHRR087g1GNfmSzOAEugJ55cwAfKrsibvr6NFpk6YTw7WatC?=
 =?iso-8859-1?Q?hGrkdejyo6oQ5OUC9Rajow3fvarB28wUtpzC/Wx3De7Tz42AlnVSEW9ZEY?=
 =?iso-8859-1?Q?OHsd+jX6sFXfJdMQRmo9aX6Jg1SqEOt4A+yqnKanGEw46nGEIKdRj5c4uQ?=
 =?iso-8859-1?Q?iRNf3W8hoTAI2q+eASMWOTqhA414iHv8ZOwb5rY6tuoK+GScfBIv/80hse?=
 =?iso-8859-1?Q?yTyHwgBN0q+hXdodcv/eNypKOpijXzjtVaSI/HuuBAVSBu7GThRDmTmFdH?=
 =?iso-8859-1?Q?maAgdjQ9CWSG1vPEoECvUOgxmJUNq61XEo49iaf8C/s9SdNJdnBuCwuq7a?=
 =?iso-8859-1?Q?MZZPzSev7C1d886kjtwNhDpZ9djjxRnkQwKY7zAn+WSnjmocHP414bBwIQ?=
 =?iso-8859-1?Q?RGbDVg4+Y1+RCDWiHywZ2i/c0gzuaeJbi6U8Zt0YMAeDWyvDMlvA0iUoPf?=
 =?iso-8859-1?Q?LHn8kI0QAM9H8KqEBKPsuLQobH4BFxTS/BtX647JRtC6rO23NpSUXtc5AX?=
 =?iso-8859-1?Q?/PGlC6qGqUi9eqwXkiGBFRQo/rBfRqApfzD1aiARJEO1Q4AEmscOqRNDK7?=
 =?iso-8859-1?Q?3O3+nYmoG1/1cCSKqEGgqPuq6GB5U4fRZic6qZR09rMg3jXpblP7qW5iQZ?=
 =?iso-8859-1?Q?1wsdXh6bR1RW4HRonwBhDcsWKjF8ZtM+jgo/Xe3uo1KhCPfo/ZeqO8bsE7?=
 =?iso-8859-1?Q?XBQ2MgSnWku+FHdXQS1Fv/lBkR+DzX75Hht6NrU7X0Ot1I3D+vepcAzqC+?=
 =?iso-8859-1?Q?bLriIcpkI+lLm1/q8Aszb+5FMBkW1lpXtT8L8nB5kV9ShqG81FWdceg3Ln?=
 =?iso-8859-1?Q?gUxl/nzX/R8sZc+NuZC8Lsp4OcY6W5PNrWjufTxvR9PL43pb+K7vtnYPAj?=
 =?iso-8859-1?Q?jEwG5dRz4XLB31xTPy25oGqa1cFii+19TYRYQXjFJG1nf/yJX4No53VW09?=
 =?iso-8859-1?Q?1bmb8XcLGSVJEFWjsJednld8l25K2u8P5CeTFairZyPlibCCRCckC9mcgg?=
 =?iso-8859-1?Q?zP9MBSNjejB47bhCeskEw9cAY8+hXcCFSUCyJth+x82xMdHoKrzLltyO0q?=
 =?iso-8859-1?Q?YjRI7ssYaiiyFvZQpxeasYhdYV4pNdUUobYs3/6Z+kJY8zBZ4K6j5rnBlb?=
 =?iso-8859-1?Q?/KnV5KySedFCfSi3qv91aOXBx12gZ+Xsyy35a0LrkurNnTKHCojF2EuXJT?=
 =?iso-8859-1?Q?f4B/bTuLij39cTf8wxehrFf5ObWTyzmcjn+DNI/31z+/t4/tCQB1Nk9RD5?=
 =?iso-8859-1?Q?uVE9NZcADiPAoOrTa3cuVhV3taXfRQ3+7YCjKtzM9lDXQGMEMu+doKhGFm?=
 =?iso-8859-1?Q?GX6USZgjVLBf7HeSa2weERdSAsZ+A+9n0S9HyjaZ4t0Upjx/mNPqbbJ5Nf?=
 =?iso-8859-1?Q?jVvcnXh10l+AIylN2rZGHKRhgOwLUoIQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?p0UD99pRQ8JlcG7GuMcMW50tp6/pdTlnTWpsmEcxypLUcDjFtKnls1/pXC?=
 =?iso-8859-1?Q?H15JKLvUC0r6Ddra6mfvOYw/D+6Bgl33BI6UETn66QKuadbF03DDhkU6H7?=
 =?iso-8859-1?Q?88N7TFrdVaTXnGXobx1Ge1qB+PT8u3Fs4zELDWVnXMaacAfJH/yaXEaV63?=
 =?iso-8859-1?Q?X5X258032svn5qLa8iYasqDmS60fWHtNyglFsdtjHbdRUu3DrGkRn0X8HI?=
 =?iso-8859-1?Q?eydRckYYiWZlhyJY+Venk622bpebYqUxMB5L3iO6iJTfDiduN0T7IrjROt?=
 =?iso-8859-1?Q?ycvbGG83thZ7rRTm9Dt0b/66QDpnrO9WWvxWh4h7lcevQFjFqVq6fmjibt?=
 =?iso-8859-1?Q?428X3SWkrGy+026cm5Gi0JPikulnI7sruS2X+vj1xyU1encU8zrfzJOU3I?=
 =?iso-8859-1?Q?S2SW8t9y1TBDB2afva3pojXeQeVGebtR3ZormwSL4q0x0yIwBzxZ9XOuvd?=
 =?iso-8859-1?Q?uju7pP9Arve+1WHTmM6qnS4mMb0aFzWImpgT0AGnVZfuC5mz/pOldLAukK?=
 =?iso-8859-1?Q?ltJoCrmXsD68+B5YI2Jfciffxv7w1JKqA7dhTdq68T3ebFUM1oMg6VATAv?=
 =?iso-8859-1?Q?bymauio4svLKo4kpjE89zqwj6LPf3CiHC0iNIsK1B+ldAIY8UxsqqO88bS?=
 =?iso-8859-1?Q?O3RMJmm+zNv39TDnjXx4tzttPv1jDDJJJU97aX2LifZxUPx96s1pJrYGMx?=
 =?iso-8859-1?Q?OOOhCJXyCmFY4tQnfqmU8QeMMC8P7FtaBoFFeejBPkv6E3dAnd3WEJMJZx?=
 =?iso-8859-1?Q?XpvuAdTdT4ZKCch/q2rY0zNxAeR4KpqkXDmGJsy/KZ0tQdfCHSp/NDSmKu?=
 =?iso-8859-1?Q?IpfvaWdnS37wPaKlgsbqmOFP1VbfSQhE7s+OfgwiepMDEooYFn8GZ/QZkp?=
 =?iso-8859-1?Q?xxx7GIVB14pJp+zueFfV31KVsZBflTRLyGicFWOahnUUk6AFq5c3gcVptG?=
 =?iso-8859-1?Q?9eqMecLhlfrU+2D8NOzzJxTiEWjjW0YCzxHgm88fOKSMwik+1gGg1NTbfV?=
 =?iso-8859-1?Q?iIwxqoU2cg7w6Up/p8chPye5HjaUP0n5dDlxhMHh774e5qShLHeDyVUJkT?=
 =?iso-8859-1?Q?PWIF9RAVdHoAU3XKsTTuszHCYNMsmpRjeEZzcGgyuEe2YzwY9vB+72gpPQ?=
 =?iso-8859-1?Q?w6QQIhGKG/x2c1IOiUq4cfDNVFOVhbDObR4pmQ4R1OZhugDbWw2ioCu1Re?=
 =?iso-8859-1?Q?0xi429nJKAu8pUdM6nmWD5vPEo/LKjmRS7K0WsmOKU//1hKLG3Qc2nWbhC?=
 =?iso-8859-1?Q?m2h2JciPUsV9eyLFR/wJLF6c8X6S4wsrvWOeN77CUIIGioreMaXP1hQ0E1?=
 =?iso-8859-1?Q?Tcq9dIx4NUiB5dTJWS7l4n2aQkaZbnFf7hl/hNOnIEbuEUO9BTQjLEr9In?=
 =?iso-8859-1?Q?HrNw4aLOOeGHE9BjXvnB0y1GCco5/ZLg6oyFENJxIHxXqFITGSQxC4/H2B?=
 =?iso-8859-1?Q?nHXE6fUi/jKT7tdtT3EUSAKdFNepxCoe5LziN42MGaoG9p6xg7/mV8+Hes?=
 =?iso-8859-1?Q?n9VOBsm486JT9qegOz/nW27r4Nm7zD9FS7HbmvTesfZjPt0a4hAaZ2Wsqc?=
 =?iso-8859-1?Q?W29JJDVxTddqBsdnqvmbvLQ+m3P6EvhxzI312q2xuXlxq6jBuBpzNCOdEd?=
 =?iso-8859-1?Q?cXs5QbIYnYusGxoq3Bn+MWkRsBkp7PThhC6cWTICmgW2VKDqBzgFKmdw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b83106-10cd-49b7-d035-08dc9b955a5f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 19:21:35.0257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKEyZnp0c+nix78UpwOqV6eIKSVqEQiKivy+OYNdhZjfPwJeHU/VdZhrWNYCsPFr8jFRevZzqFQ3cPSdgdT4TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8418
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

On Wed, Jul 03, 2024 at 05:38:08PM +0200, Thomas Hellström wrote:
> Use the LRU walker for eviction. This helps
> removing a lot of code with weird locking
> semantics.
> 
> The functionality is slightly changed so that
> when trylocked buffer objects are exhausted, we
> continue to interleave walks with ticket-locks while
> there is still progress made. The list walks are
> not restarted in-between evictions.
> 
> Also provide a separate ttm_bo_evict_first()
> function for its single user. The context of that
> user allows sleeping dma_resv locks.
> 
> v6:
> - Various cleanups suggested by Matthew Brost.
> - Fix error return code of ttm_bo_evict_first(). (Matthew Brost)
> - Fix an error check that was inverted. (Matthew Brost)
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c       | 346 ++++++++++++-----------------
>  drivers/gpu/drm/ttm/ttm_resource.c |  21 +-
>  include/drm/ttm/ttm_bo.h           |   8 +-
>  3 files changed, 144 insertions(+), 231 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 1053cdca131e..603b9353f436 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -224,80 +224,6 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
>  	dma_resv_iter_end(&cursor);
>  }
>  
> -/**
> - * ttm_bo_cleanup_refs
> - * If bo idle, remove from lru lists, and unref.
> - * If not idle, block if possible.
> - *
> - * Must be called with lru_lock and reservation held, this function
> - * will drop the lru lock and optionally the reservation lock before returning.
> - *
> - * @bo:                    The buffer object to clean-up
> - * @interruptible:         Any sleeps should occur interruptibly.
> - * @no_wait_gpu:           Never wait for gpu. Return -EBUSY instead.
> - * @unlock_resv:           Unlock the reservation lock as well.
> - */
> -
> -static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
> -			       bool interruptible, bool no_wait_gpu,
> -			       bool unlock_resv)
> -{
> -	struct dma_resv *resv = &bo->base._resv;
> -	int ret;
> -
> -	if (dma_resv_test_signaled(resv, DMA_RESV_USAGE_BOOKKEEP))
> -		ret = 0;
> -	else
> -		ret = -EBUSY;
> -
> -	if (ret && !no_wait_gpu) {
> -		long lret;
> -
> -		if (unlock_resv)
> -			dma_resv_unlock(bo->base.resv);
> -		spin_unlock(&bo->bdev->lru_lock);
> -
> -		lret = dma_resv_wait_timeout(resv, DMA_RESV_USAGE_BOOKKEEP,
> -					     interruptible,
> -					     30 * HZ);
> -
> -		if (lret < 0)
> -			return lret;
> -		else if (lret == 0)
> -			return -EBUSY;
> -
> -		spin_lock(&bo->bdev->lru_lock);
> -		if (unlock_resv && !dma_resv_trylock(bo->base.resv)) {
> -			/*
> -			 * We raced, and lost, someone else holds the reservation now,
> -			 * and is probably busy in ttm_bo_cleanup_memtype_use.
> -			 *
> -			 * Even if it's not the case, because we finished waiting any
> -			 * delayed destruction would succeed, so just return success
> -			 * here.
> -			 */
> -			spin_unlock(&bo->bdev->lru_lock);
> -			return 0;
> -		}
> -		ret = 0;
> -	}
> -
> -	if (ret) {
> -		if (unlock_resv)
> -			dma_resv_unlock(bo->base.resv);
> -		spin_unlock(&bo->bdev->lru_lock);
> -		return ret;
> -	}
> -
> -	spin_unlock(&bo->bdev->lru_lock);
> -	ttm_bo_cleanup_memtype_use(bo);
> -
> -	if (unlock_resv)
> -		dma_resv_unlock(bo->base.resv);
> -
> -	return 0;
> -}
> -
>  /*
>   * Block for the dma_resv object to become idle, lock the buffer and clean up
>   * the resource and tt object.
> @@ -505,151 +431,153 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>  }
>  EXPORT_SYMBOL(ttm_bo_eviction_valuable);
>  
> -/*
> - * Check the target bo is allowable to be evicted or swapout, including cases:
> - *
> - * a. if share same reservation object with ctx->resv, have assumption
> - * reservation objects should already be locked, so not lock again and
> - * return true directly when either the opreation allow_reserved_eviction
> - * or the target bo already is in delayed free list;
> +/**
> + * ttm_bo_evict_first() - Evict the first bo on the manager's LRU list.
> + * @bdev: The ttm device.
> + * @man: The manager whose bo to evict.
> + * @ctx: The TTM operation ctx governing the eviction.
>   *
> - * b. Otherwise, trylock it.
> + * Return: 0 if successful or the resource disappeared. Negative error code on error.
>   */
> -static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
> -					   struct ttm_operation_ctx *ctx,
> -					   const struct ttm_place *place,
> -					   bool *locked, bool *busy)
> +int ttm_bo_evict_first(struct ttm_device *bdev, struct ttm_resource_manager *man,
> +		       struct ttm_operation_ctx *ctx)
>  {
> -	bool ret = false;
> +	struct ttm_resource_cursor cursor;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_resource *res;
> +	unsigned int mem_type;
> +	int ret = 0;
>  
> -	if (bo->pin_count) {
> -		*locked = false;
> -		if (busy)
> -			*busy = false;
> -		return false;
> +	spin_lock(&bdev->lru_lock);
> +	res = ttm_resource_manager_first(man, &cursor);
> +	if (!res) {
> +		ret = -ENOENT;
> +		goto out_no_ref;
>  	}
> +	bo = res->bo;
> +	if (!ttm_bo_get_unless_zero(bo))
> +		goto out_no_ref;
> +	mem_type = res->mem_type;
> +	spin_unlock(&bdev->lru_lock);
> +	ret = ttm_bo_reserve(bo, ctx->interruptible, ctx->no_wait_gpu, NULL);
> +	if (ret)
> +		goto out_no_lock;
> +	if (bo->resource != res || res->mem_type != mem_type)
> +		goto out_bo_moved;
>  
> -	if (bo->base.resv == ctx->resv) {
> -		dma_resv_assert_held(bo->base.resv);
> -		if (ctx->allow_res_evict)
> -			ret = true;
> -		*locked = false;
> -		if (busy)
> -			*busy = false;
> +	if (bo->deleted) {
> +		ret = ttm_bo_wait_ctx(bo, ctx);
> +		if (!ret)
> +			ttm_bo_cleanup_memtype_use(bo);
>  	} else {
> -		ret = dma_resv_trylock(bo->base.resv);
> -		*locked = ret;
> -		if (busy)
> -			*busy = !ret;
> -	}
> -
> -	if (ret && place && (bo->resource->mem_type != place->mem_type ||
> -		!bo->bdev->funcs->eviction_valuable(bo, place))) {
> -		ret = false;
> -		if (*locked) {
> -			dma_resv_unlock(bo->base.resv);
> -			*locked = false;
> -		}
> +		ret = ttm_bo_evict(bo, ctx);
>  	}
> +out_bo_moved:
> +	dma_resv_unlock(bo->base.resv);
> +out_no_lock:
> +	ttm_bo_put(bo);
> +	ttm_resource_cursor_fini(&cursor);
> +	return ret;
>  
> +out_no_ref:
> +	ttm_resource_cursor_fini_locked(&cursor);
> +	spin_unlock(&bdev->lru_lock);
>  	return ret;
>  }
>  
>  /**
> - * ttm_mem_evict_wait_busy - wait for a busy BO to become available
> - *
> - * @busy_bo: BO which couldn't be locked with trylock
> - * @ctx: operation context
> - * @ticket: acquire ticket
> - *
> - * Try to lock a busy buffer object to avoid failing eviction.
> + * struct ttm_bo_evict_walk - Parameters for the evict walk.
>   */
> -static int ttm_mem_evict_wait_busy(struct ttm_buffer_object *busy_bo,
> -				   struct ttm_operation_ctx *ctx,
> -				   struct ww_acquire_ctx *ticket)
> -{
> -	int r;
> -
> -	if (!busy_bo || !ticket)
> -		return -EBUSY;
> -
> -	if (ctx->interruptible)
> -		r = dma_resv_lock_interruptible(busy_bo->base.resv,
> -							  ticket);
> -	else
> -		r = dma_resv_lock(busy_bo->base.resv, ticket);
> -
> -	/*
> -	 * TODO: It would be better to keep the BO locked until allocation is at
> -	 * least tried one more time, but that would mean a much larger rework
> -	 * of TTM.
> -	 */
> -	if (!r)
> -		dma_resv_unlock(busy_bo->base.resv);
> -
> -	return r == -EDEADLK ? -EBUSY : r;
> -}
> +struct ttm_bo_evict_walk {
> +	/** @walk: The walk base parameters. */
> +	struct ttm_lru_walk walk;
> +	/** @place: The place passed to the resource allocation. */
> +	const struct ttm_place *place;
> +	/** @evictor: The buffer object we're trying to make room for. */
> +	struct ttm_buffer_object *evictor;
> +	/** @res: The allocated resource if any. */
> +	struct ttm_resource **res;
> +	/** @evicted: Number of successful evictions. */
> +	unsigned long evicted;
> +};
>  
> -int ttm_mem_evict_first(struct ttm_device *bdev,
> -			struct ttm_resource_manager *man,
> -			const struct ttm_place *place,
> -			struct ttm_operation_ctx *ctx,
> -			struct ww_acquire_ctx *ticket)
> +static long ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
>  {
> -	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
> -	struct ttm_resource_cursor cursor;
> -	struct ttm_resource *res;
> -	bool locked = false;
> -	int ret;
> +	struct ttm_bo_evict_walk *evict_walk =
> +		container_of(walk, typeof(*evict_walk), walk);
> +	long lret;
>  
> -	spin_lock(&bdev->lru_lock);
> -	ttm_resource_manager_for_each_res(man, &cursor, res) {
> -		bool busy;
> -
> -		if (!ttm_bo_evict_swapout_allowable(res->bo, ctx, place,
> -						    &locked, &busy)) {
> -			if (busy && !busy_bo && ticket !=
> -			    dma_resv_locking_ctx(res->bo->base.resv))
> -				busy_bo = res->bo;
> -			continue;
> -		}
> +	if (!bo->bdev->funcs->eviction_valuable(bo, evict_walk->place))
> +		return 0;
>  
> -		if (ttm_bo_get_unless_zero(res->bo)) {
> -			bo = res->bo;
> -			break;
> -		}
> -		if (locked)
> -			dma_resv_unlock(res->bo->base.resv);
> +	if (bo->deleted) {
> +		lret = ttm_bo_wait_ctx(bo, walk->ctx);
> +		if (!lret)
> +			ttm_bo_cleanup_memtype_use(bo);
> +	} else {
> +		lret = ttm_bo_evict(bo, walk->ctx);
>  	}
> -	ttm_resource_cursor_fini_locked(&cursor);
>  
> -	if (!bo) {
> -		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
> -			busy_bo = NULL;
> -		spin_unlock(&bdev->lru_lock);
> -		ret = ttm_mem_evict_wait_busy(busy_bo, ctx, ticket);
> -		if (busy_bo)
> -			ttm_bo_put(busy_bo);
> -		return ret;
> -	}
> +	if (lret)
> +		goto out;
>  
> -	if (bo->deleted) {
> -		ret = ttm_bo_cleanup_refs(bo, ctx->interruptible,
> -					  ctx->no_wait_gpu, locked);
> -		ttm_bo_put(bo);
> -		return ret;
> -	}
> +	evict_walk->evicted++;
> +	if (evict_walk->res)
> +		lret = ttm_resource_alloc(evict_walk->evictor, evict_walk->place,
> +					  evict_walk->res);
> +	if (lret == 0)
> +		return 1;
> +out:
> +	/* Errors that should terminate the walk. */
> +	if (lret == -ENOSPC)
> +		return -EBUSY;
>  
> -	spin_unlock(&bdev->lru_lock);
> +	return lret;
> +}
>  
> -	ret = ttm_bo_evict(bo, ctx);
> -	if (locked)
> -		ttm_bo_unreserve(bo);
> -	else
> -		ttm_bo_move_to_lru_tail_unlocked(bo);
> +static const struct ttm_lru_walk_ops ttm_evict_walk_ops = {
> +	.process_bo = ttm_bo_evict_cb,
> +};
>  
> -	ttm_bo_put(bo);
> -	return ret;
> +static int ttm_bo_evict_alloc(struct ttm_device *bdev,
> +			      struct ttm_resource_manager *man,
> +			      const struct ttm_place *place,
> +			      struct ttm_buffer_object *evictor,
> +			      struct ttm_operation_ctx *ctx,
> +			      struct ww_acquire_ctx *ticket,
> +			      struct ttm_resource **res)
> +{
> +	struct ttm_bo_evict_walk evict_walk = {
> +		.walk = {
> +			.ops = &ttm_evict_walk_ops,
> +			.ctx = ctx,
> +			.ticket = ticket,
> +		},
> +		.place = place,
> +		.evictor = evictor,
> +		.res = res,
> +	};
> +	long lret;
> +
> +	evict_walk.walk.trylock_only = true;
> +	lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
> +	if (lret || !ticket)
> +		goto out;
> +
> +	/* If ticket-locking, repeat while making progress. */
> +	evict_walk.walk.trylock_only = false;
> +	do {
> +		/* The walk may clear the evict_walk.walk.ticket field */
> +		evict_walk.walk.ticket = ticket;
> +		evict_walk.evicted = 0;
> +		lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
> +	} while (!lret && evict_walk.evicted);
> +out:
> +	if (lret < 0)
> +		return lret;
> +	if (lret == 0)
> +		return -EBUSY;
> +	return 0;
>  }
>  
>  /**
> @@ -760,6 +688,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>  	for (i = 0; i < placement->num_placement; ++i) {
>  		const struct ttm_place *place = &placement->placement[i];
>  		struct ttm_resource_manager *man;
> +		bool may_evict;
>  
>  		man = ttm_manager_type(bdev, place->mem_type);
>  		if (!man || !ttm_resource_manager_used(man))
> @@ -769,22 +698,21 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>  				    TTM_PL_FLAG_FALLBACK))
>  			continue;
>  
> -		do {
> -			ret = ttm_resource_alloc(bo, place, res);
> -			if (unlikely(ret && ret != -ENOSPC))
> +		may_evict = (force_space && place->mem_type != TTM_PL_SYSTEM);
> +		ret = ttm_resource_alloc(bo, place, res);
> +		if (ret) {
> +			if (ret != -ENOSPC)
>  				return ret;
> -			if (likely(!ret) || !force_space)
> -				break;
> -
> -			ret = ttm_mem_evict_first(bdev, man, place, ctx,
> -						  ticket);
> -			if (unlikely(ret == -EBUSY))
> -				break;
> -			if (unlikely(ret))
> +			if (!may_evict)
> +				continue;
> +
> +			ret = ttm_bo_evict_alloc(bdev, man, place, bo, ctx,
> +						 ticket, res);
> +			if (ret == -EBUSY)
> +				continue;
> +			if (ret)
>  				return ret;
> -		} while (1);
> -		if (ret)
> -			continue;
> +		}
>  
>  		ret = ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
>  		if (unlikely(ret)) {
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index b6a2daac5518..9dc727d416cc 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -512,24 +512,11 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>  	};
>  	struct dma_fence *fence;
>  	int ret;
> -	unsigned i;
> -
> -	/*
> -	 * Can't use standard list traversal since we're unlocking.
> -	 */
>  
> -	spin_lock(&bdev->lru_lock);
> -	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> -		while (!list_empty(&man->lru[i])) {
> -			spin_unlock(&bdev->lru_lock);
> -			ret = ttm_mem_evict_first(bdev, man, NULL, &ctx,
> -						  NULL);
> -			if (ret)
> -				return ret;
> -			spin_lock(&bdev->lru_lock);
> -		}
> -	}
> -	spin_unlock(&bdev->lru_lock);
> +	do {
> +		ret = ttm_bo_evict_first(bdev, man, &ctx);
> +		cond_resched();
> +	} while (!ret);
>  
>  	spin_lock(&man->move_lock);
>  	fence = dma_fence_get(man->move);
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index de97ea9fa75f..e577528f5dfc 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -422,11 +422,9 @@ long ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>  		    pgoff_t target);
>  void ttm_bo_pin(struct ttm_buffer_object *bo);
>  void ttm_bo_unpin(struct ttm_buffer_object *bo);
> -int ttm_mem_evict_first(struct ttm_device *bdev,
> -			struct ttm_resource_manager *man,
> -			const struct ttm_place *place,
> -			struct ttm_operation_ctx *ctx,
> -			struct ww_acquire_ctx *ticket);
> +int ttm_bo_evict_first(struct ttm_device *bdev,
> +		       struct ttm_resource_manager *man,
> +		       struct ttm_operation_ctx *ctx);
>  vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>  			     struct vm_fault *vmf);
>  vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
> -- 
> 2.44.0
> 
