Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A1FC87A19
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 01:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9965B10E4D5;
	Wed, 26 Nov 2025 00:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qat+EwPq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFEC10E4D4;
 Wed, 26 Nov 2025 00:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764118587; x=1795654587;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NuZkHRDuMl6WSLodG1p/VoUXjuC6y5iSGo3RpvL7z28=;
 b=Qat+EwPqp5N1Ss9z+2bD31yA2pgvgyYeXlegxPdXpPtlh4O9Pzem438A
 xr9WjrKm7rnYnnPcZO0e7KWK9BN4Mfbx8w7dUy0IH9oDJyG9YHaZEA/st
 NLC1pmYnTL5Unsga2Id5uuHn8Vlw3YXMdtDY+UT/oqMPRu1GUJDvQIAbf
 DQ7uO0oyGPbyIKjfNZJFHlxdkgLNNpqOO/5E7C0Gd+izPyU7djRV583ev
 X4/7SlGSmdoM3wezeb9aULAuV+7DO1CIVHcC8wODBChnh1lg80yxmBBbG
 1rnbrASzqRmNhzQFUulx0fl3sK8OSCoTD/a6vT05k8RXIDvHeVi6a2yyo w==;
X-CSE-ConnectionGUID: uucmF4MHSLWQyYxdus/GxA==
X-CSE-MsgGUID: FyF+76yjRDufztBQVRxhbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66228174"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="66228174"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 16:56:27 -0800
X-CSE-ConnectionGUID: l9uDqqc5Tdigv99DzlFDxw==
X-CSE-MsgGUID: HvW1cbK5T8C21tUqZMhcIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="192884559"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 16:56:26 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 16:56:25 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 16:56:25 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 16:56:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XgrJ/i9OYab4ladSXPbDVo6+ETMSvrrw4oSOSbNchltfJTAL5CMCAI7NAitMysEl1MWFZtXeNntjepywufU0r4mijCoYV3p601naDwIjhiXd/37BqrvqkhP+1IQESOKFOkWO0aOrxD6iJjllsMwD9jO+kOqvvLV4e4/5kXOw51Uapo0kNsauIGnU1ZTyATeVM+DxwTdepJ21UlJml8TdGevn6YOh0nYyMaoTDCC/IiOGjCFJK6wRRoVyrjMZUfB6uS+L2Dzrfyw3B8tU2FT6cyBUCAnZFWVVLDZhTqwMbSR+ybQrsNliRAvxkzc9JPUWvl1egi5h6pXHNkZbY/kClw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5crCpwCo3DKu/qJzEoPMMskM2GncCwlZmMtlKmOyHqY=;
 b=RgLD5wF6g0YXnkSb9Lw6qngMokZPYCF9LbLvmC6YnkS29EV6lk0NPAGi2kaeKltiMRuaedOf4WcviMDp038Qk+iadoGhwYGKzK2APQhd5cdBOwHowekXw7dfTahss9VoukAvbFFKnQe2iZaVBMbNTU66ykMkLti6olRyfdbZygpCJqO0MlqORVb6gVyIdabAlgEA0g7Wy/wVC9Jn/Mu9BNtHjp0NcnwOUddj4t67e+W+HPrnWBujhSwe/SrGLX8u7SxV21+i1qeNmk33/MYjJiF5uGtgoSJeFeZZcxfb9ICH6BroQu4T+CGUE6pZeDygii1kI9a9y+IibJHCrdQZqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6502.namprd11.prod.outlook.com (2603:10b6:8:89::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.17; Wed, 26 Nov 2025 00:56:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 00:56:22 +0000
Date: Tue, 25 Nov 2025 16:56:19 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2 14/17] drm/xe: Support pcie p2p dma as a fast
 interconnect
Message-ID: <aSZQMxy4N4f0Cnp7@lstrano-desk.jf.intel.com>
References: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
 <20251111164408.113070-15-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111164408.113070-15-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0231.namprd03.prod.outlook.com
 (2603:10b6:303:b9::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6502:EE_
X-MS-Office365-Filtering-Correlation-Id: 8632efc3-b8d7-4643-b57f-08de2c869e30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vqGH99qUjmDaVGgEuWHx1EKKS6blPaiC335et8BF68lrinVZxwfutpeeqT?=
 =?iso-8859-1?Q?yHOve6A3bn4P7ZVm9ddSIObc4drCxg44HOOP5LzQgJkLDFQTyIy00G17RI?=
 =?iso-8859-1?Q?+98bl4V3Tacp6GGGAcv/fkmfTpPoEIxwIzIFKhkNWvNv+3F2TifG66ARUU?=
 =?iso-8859-1?Q?1A2A1ltm1tjy7QTHGoyyn7NlrJV2ysspAFnrTZt05xF0J5RCYMu0Di118t?=
 =?iso-8859-1?Q?1Tte76wgwADOwvCigFBxQYsXDcE0ZW+1U0TDCiSKPgLWSWNjhrPZ3eTPWa?=
 =?iso-8859-1?Q?N6lWjP6v3BiX8cuQGCr1T4tIJv5pA3uwC8JXG9Epb3B4dw5eEj3YiucVcS?=
 =?iso-8859-1?Q?nzneLrL5OzRCR45DL1Q5c4KypZsZYaaFBqSphi2YXifVE/5Ep+Oi48GzTs?=
 =?iso-8859-1?Q?ich9uboF/O54OsK3iADadyGhS7bWB2afdl9KlE+O/XT8BKXHVB4D+1Ob3X?=
 =?iso-8859-1?Q?iPe/3NK1F7xXDm2f4s2XpojDD0tbMJOqn6NVxtL+dWjVtD5DAV+g3HoUO+?=
 =?iso-8859-1?Q?HdCDiasoFM+1LsX6N8a8pbW++vYxGBJxGHkBjB+w9nB0+/GVLO0rr83JCa?=
 =?iso-8859-1?Q?8tzFZMDed6hO7KpykTqtFVjyfKIIRyDjnlULdUYn7QE+EAHk1SBKpFq/tv?=
 =?iso-8859-1?Q?XraAnxpAjo79TTd5t4rKoXTRIuSw5aBWtOZDFU3ieVDE4vx8pPkpQ97MHK?=
 =?iso-8859-1?Q?hv/svTkSqed3jhjkK9Dz7gOqmc9P6/5zLUJQlAnXrephEJ0uRL4flT9NSL?=
 =?iso-8859-1?Q?icQorSirpqsZYVIsmrodw2oHnoM0p85kg42GWYijfC+f0y6lgQyws/DJ0O?=
 =?iso-8859-1?Q?Jac+ExeTzgXSui2L6Iq2crwqzk7Woxpu2It9pUpXq7Dp0hn61b3OgWDg8u?=
 =?iso-8859-1?Q?hIpPMhM+aIMZdjGHwlgdorQ4VRXH0qR5eOfvy++wNJNPx04D3I+wWG8Com?=
 =?iso-8859-1?Q?yul9toTgIHdtCyvMIsEibO9b4113iyf697qTqk7cYTtdheMCf3mkLl+Xg8?=
 =?iso-8859-1?Q?7L9wVIVXIQNmlFczn4Yab/Pv7BHVdF3tuDhdA4z/AL1e0UaD9670Q1BpWN?=
 =?iso-8859-1?Q?7j8Ldm2U0d5EM+uZWZEPR3bcAvs2xm3+uh4b8SuyDxZOtcr9ShYNuJkQtY?=
 =?iso-8859-1?Q?sDGYMrmPfhzBdSlWJn1FK4HsSW43iUeu2vjozGCNMUn8MVz2ccnSjAhn5T?=
 =?iso-8859-1?Q?XVZTlMCEcWjz/CU+y3R6ilF1QvQSTe6k6aQS+XBeDxrMaScOsTZS600RJG?=
 =?iso-8859-1?Q?3I4K6QGZ0zdp2+NphnnHGJkErZYT9kX6xI2evKQILHX8tiNiw/8vGMIbWg?=
 =?iso-8859-1?Q?N8mvOhdYb9TCQkUkINXcGtB4a7SJVuqo7xmgmClcBdwjOB7wcKBNsnERlB?=
 =?iso-8859-1?Q?AHavDnRoJForhpngk2c8zUkHjA4wqOIAXoDpfKpg8QdCQ8jytN5bEH8IJ3?=
 =?iso-8859-1?Q?OwJQuInCTWnYGX/BYnBuzrjw18wubpJ4GGZVnEeIAvzFDXlJSOJN4cFsXn?=
 =?iso-8859-1?Q?yvh+dawIEZuR1Q4+jUobv7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Lh0W3cOGWbKShYynnkSyp5Bdq7dL2sp/9CSqoHB0dyihMlzq26FazZFRoJ?=
 =?iso-8859-1?Q?Wng7aqgYYdQ3oNeOAOfL1BUv64v7eJZ3O5pSHfKmt7gO9qA3dUiobV7/MZ?=
 =?iso-8859-1?Q?uotpsl9KjFWchwX8oJ3Y0MNEgX+mv/fpb0eexoP9Gf11yApKLmnEBqY19m?=
 =?iso-8859-1?Q?GGoRdmzpsYQIoSAS1YWsEdPWjF8tGSsz82uP/Ub+tcK8a76rv+dDe9nZZi?=
 =?iso-8859-1?Q?yeF66nBmA7GevkLcC3U6bTK0CO/1m2d3CGK4fsEnC9JfSNDeeQH2n1q9v7?=
 =?iso-8859-1?Q?0rZ695ii2MqfGPpGgMbvFf7vbHenPy+EFm4KfA9m8YMn/oHuYhcoH0Po96?=
 =?iso-8859-1?Q?sdjfXVtC1ul7ZmSW6sTx9FUwwKZTayNjIR7NjnxXQ8FkDldeYj1dCysd0B?=
 =?iso-8859-1?Q?5HdNXAeMetpCroLDWWlMOOZR3vA8m4iuSv9RC2HLp6mY2EzXAjfDvA0egr?=
 =?iso-8859-1?Q?CodoUmlu/vKFlsTblLt2RM/EmrVmMmC1xJRcEcuerE/yt7kIpz9Tg9mhB7?=
 =?iso-8859-1?Q?DxB9gYPBjcWD4Eb1JcjN19rWJ6Z5nZTvC8SMvI0JrLJgejrkxzc9wIMc5d?=
 =?iso-8859-1?Q?oe89yxi3Era9GfdEY3WjNwRSbuYgav6PkdHjij342UMw4VhtWtbOQlAbMb?=
 =?iso-8859-1?Q?EsvoJKzGuGkP/j/Fj4TggIdAQBoitJtn/t0PZBBuQcy5b77e0585Q8sank?=
 =?iso-8859-1?Q?79fXdeg9uHqGXED0UfeMY+zQyL/Bz3oLr2EmckXN0swfH/xrpeD4hX6Nmm?=
 =?iso-8859-1?Q?bucU5l4fDykidQaj2Y5evvqZi20MJucTuN280hUi8rN8SRAaogCbTEP7Jg?=
 =?iso-8859-1?Q?Rx9KGKBOBJ0no2Nx1fklOK6PsMANyneuvT9tSwDDKhBz5FHGFmHuWfNZJI?=
 =?iso-8859-1?Q?8a1XQgkmhMGWLh1VN03uek9r9IQMOXUxcv6yheiUITA6YxfGCbmhO7k8dy?=
 =?iso-8859-1?Q?ork2tJgsnHbYnEIoAACip50MuOGTL9ZRIQGgqdhUTlmfmfzDzEPPxuLLu8?=
 =?iso-8859-1?Q?HdD1DMJyYXGnqqHeQD4eg7a22QP0hXPa2Gw0zQVlLscgUE2LlZ7BxilPGx?=
 =?iso-8859-1?Q?8yIBcQUsoAOvuMMwls3kaX4Qb9ly+vjO2bza/PidcO8RqElRHMnXSlLbNO?=
 =?iso-8859-1?Q?keBJOpnFSVTyILpX2mEX7nZHEj7du2dLI8kpJlgfMhNf8Afo561KUm7bu/?=
 =?iso-8859-1?Q?nrpoZtQDO5tJC3OyRLH1owQ5fr9t+BdmxuzKeiNsgY7bbzWPHwxdMfjjfQ?=
 =?iso-8859-1?Q?zeGd9a7dw1FkEf4MqEdRPDJ73nD5trqUctZDLx+hHrZrF0JZL92ttyW2xx?=
 =?iso-8859-1?Q?RmVNqMLoPsnfU7NKiWyevnoM0HLwrDq9tbQHUGoxMF0N2u5r5tFJDm56wd?=
 =?iso-8859-1?Q?qO1vLL+3iXNlkOZ+5U+FvA426d1FK75jEKjq8UmAf9v/82xQeDJSO2jIjL?=
 =?iso-8859-1?Q?qclIsXU7+l7ZEnYD9Maa1lF+07MgZkaspRv2D5ETCEB7KLZYKRVr7U6Ngy?=
 =?iso-8859-1?Q?hiRSFqGGmsTyH8ZnozmqHjQ6Tn9tNmhUQixzyMOmCf56CVGU3f6m7uFkRf?=
 =?iso-8859-1?Q?2vwapLC1n40vyjyxqBFPNdtEDZ0uurtW7KYDgdYCt1co8VVnYWE4tHTjRF?=
 =?iso-8859-1?Q?JSxZIBYa7pvJtyPbNMAWKJqmncC/sN7BV8AFsI7aAb/GjPadS2NZ0hWA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8632efc3-b8d7-4643-b57f-08de2c869e30
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 00:56:22.5611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRt5qHy6ejsuOMg0lR+89DoeZx8RjAxA67edtChRmGHoG+O4Z4yZPB9SjM4OC9nm3I781griHqUntfTBhY3qbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6502
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

On Tue, Nov 11, 2025 at 05:44:04PM +0100, Thomas Hellström wrote:
> Mimic the dma-buf method using dma_[map|unmap]_resource to map
> for pcie-p2p dma.
> 
> There's an ongoing area of work upstream to sort out how this best
> should be done. One method proposed is to add an additional
> pci_p2p_dma_pagemap aliasing the device_private pagemap and use
> the corresponding pci_p2p_dma_pagemap page as input for
> dma_map_page(). However, that would incur double the amount of
> memory and latency to set up the drm_pagemap and given the huge
> amount of memory present on modern GPUs, that would really not work.
> Hence the simple approach used in this patch.
> 
> v2:
> - Simplify xe_page_to_pcie(). (Matt Brost)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_svm.c | 34 +++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_svm.h |  1 +
>  2 files changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index c0b17b548a00..86d7b0882b60 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2024 Intel Corporation
>   */
>  
> +#include <linux/pci-p2pdma.h>
> +
>  #include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_pagemap.h>
> @@ -441,6 +443,14 @@ static u64 xe_page_to_dpa(struct page *page)
>  	return dpa;
>  }
>  
> +static u64 xe_page_to_pcie(struct page *page)
> +{
> +	struct xe_pagemap *xpagemap = xe_page_to_pagemap(page);
> +	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
> +
> +	return xe_page_to_dpa(page) - vr->dpa_base + vr->io_start;
> +}
> +
>  enum xe_svm_copy_dir {
>  	XE_SVM_COPY_TO_VRAM,
>  	XE_SVM_COPY_TO_SRAM,
> @@ -792,7 +802,10 @@ static bool xe_has_interconnect(struct drm_pagemap_peer *peer1,
>  	struct device *dev1 = xe_peer_to_dev(peer1);
>  	struct device *dev2 = xe_peer_to_dev(peer2);
>  
> -	return dev1 == dev2;
> +	if (dev1 == dev2)
> +		return true;
> +
> +	return pci_p2pdma_distance(to_pci_dev(dev1), dev2, true) >= 0;
>  }
>  
>  static DRM_PAGEMAP_OWNER_LIST_DEFINE(xe_owner_list);
> @@ -1552,13 +1565,27 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
>  		addr = xe_page_to_dpa(page);
>  		prot = XE_INTERCONNECT_VRAM;
>  	} else {
> -		addr = DMA_MAPPING_ERROR;
> -		prot = 0;
> +		addr = dma_map_resource(dev,
> +					xe_page_to_pcie(page),
> +					PAGE_SIZE << order, dir,
> +					DMA_ATTR_SKIP_CPU_SYNC);
> +		prot = XE_INTERCONNECT_P2P;
>  	}
>  
>  	return drm_pagemap_addr_encode(addr, prot, order, dir);
>  }
>  
> +static void xe_drm_pagemap_device_unmap(struct drm_pagemap *dpagemap,
> +					struct device *dev,
> +					struct drm_pagemap_addr addr)
> +{
> +	if (addr.proto != XE_INTERCONNECT_P2P)
> +		return;
> +
> +	dma_unmap_resource(dev, addr.addr, PAGE_SIZE << addr.order,
> +			   addr.dir, DMA_ATTR_SKIP_CPU_SYNC);
> +}
> +
>  static void xe_pagemap_destroy_work(struct work_struct *work)
>  {
>  	struct xe_pagemap *xpagemap = container_of(work, typeof(*xpagemap), destroy_work);
> @@ -1595,6 +1622,7 @@ static void xe_pagemap_destroy(struct drm_pagemap *dpagemap, bool from_atomic_or
>  
>  static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
>  	.device_map = xe_drm_pagemap_device_map,
> +	.device_unmap = xe_drm_pagemap_device_unmap,
>  	.populate_mm = xe_drm_pagemap_populate_mm,
>  	.destroy = xe_pagemap_destroy,
>  };
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 60eae01a4220..64971c9b2a1a 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -13,6 +13,7 @@
>  #include <drm/drm_pagemap_util.h>
>  
>  #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
> +#define XE_INTERCONNECT_P2P (XE_INTERCONNECT_VRAM + 1)
>  
>  struct drm_device;
>  struct drm_file;
> -- 
> 2.51.1
> 
