Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C99CBC6D1F
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 00:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF7410E8ED;
	Wed,  8 Oct 2025 22:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MzCx1YJo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14E110E0C5;
 Wed,  8 Oct 2025 22:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759963772; x=1791499772;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PMGO81E1jswasVzDBVCv9so1PE1xjadtUa81La+gfUM=;
 b=MzCx1YJonT2TZuht4ri08mVBSo6G6kNczvb0qLPCUWAoCv312/epxO67
 KAsRel8eS0QxDt3zrCO87fV0bEZiRtbEiOjyf5g4Cw9G8T6tGqBRz3Na6
 asYXJFlDXhOwGJ7KjS/WmkcSicZ6GF436FlGYEj5FzZi0hy85FUr9qG6b
 7jWFceWCi0AaDtDwmsY/+r17zNisLkgC9MgmgX2QYTJgPAB+1Yx/92JXg
 WMd7zfaZFQ+joQuVzhPOhIvw+PRIRSzqd2/aQ1jptvCZBuu//12KgKW+q
 e+hitGhHkaBTvQaNwbb83ZedMjrsfuDyzfi9PQD6uSWBCbTfv6lGgDn91 g==;
X-CSE-ConnectionGUID: 4ow2H/cVQZCvZRTXUAVr8A==
X-CSE-MsgGUID: +KX9GmfWQtG2jHLBdll+iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61205338"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="61205338"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 15:49:31 -0700
X-CSE-ConnectionGUID: mEOmIQElR6+z2Gz5+k6kEQ==
X-CSE-MsgGUID: 7YWFmxFRQDaLaJa2/T7owA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="180965619"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 15:49:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 15:49:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 15:49:30 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 15:49:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qo6Z0jp4dfFaiF/mL8kP8AKd0H6WPNNVBpzQ3+89Kx/UEsJVFTSIZJ/Q4ukUujOJ7+QFVHCoptY5HEF5btmJjgxDJbZVBnqacfjWFA+ngfpVZiIRBVEXg70mr/w53C9MDhEa4gn7ItSayYrIQsXfLXnUUZULRgJKcNufXHQ5CPXgDSqJe9ARd7gwcAf7KNas9DT5aU+U2PmbIB1yFlr+9S3YrR8qCHhLNe30XcSN7UvweaGrhepipw8fI6ZsYHsOqilB20oekxL/7uuest47a5wa8dhVtizbKjyhpCdgrT7tsWTi9RRjNIVQ+Vulp10DTjhbcFJ1mAHt85S/zQZxrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SW47Eo8kOvVOU0lKfwLdPpJU1tW2Je9G+ZxJVAnbaTs=;
 b=v/BUzKtnffuviKHwEQX9XTO1zokDMMsv9FQJdmes5GL/yA2oJPi8ulf33IaK6cGoaKGrmct/IvpuyU9YxD5FMTip2+EqzbU3kk9VjCQKwvn/PijX6D6oem2D8J7mCi0yPJbzA9glO7xXQCM01Ud+rP3wVQ+GqQ19C4R10fAA8uz2m/UJPuq8+5sdUV9MWMLT/hrT5ho4kViN0VLbeVkadKnQCwpJURN2i5LA8jcJfpETMH4aQXtCyITi7fQmf0cPwjmfmTK+0pLU0zVN5uNVjVTSlvMR7CfpHe+QfaXEjwE7f5LIVX68JXzOBzkiDhkophKWNJIIh+WnXU9eRS38gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7247.namprd11.prod.outlook.com (2603:10b6:208:42d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 22:49:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 22:49:28 +0000
Date: Wed, 8 Oct 2025 15:49:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kernel-dev@igalia.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, "Philipp
 Stanner" <phasta@kernel.org>
Subject: Re: [PATCH 06/28] drm/sched: Move run queue related code into a
 separate file
Message-ID: <aObqdqGRMs3mp1AP@lstrano-desk.jf.intel.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-7-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251008085359.52404-7-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:303:b8::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d2ce15-a880-4a3b-65b2-08de06bcf037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4UPClILKH6hj/wWmd2Aspli6ymCzy/E6CNTkCShnWzB8Jnh1ekBDw2/DyD?=
 =?iso-8859-1?Q?Jv4avum1Ktgixa5E/tET0OmzoPDkWCCnnrbZXcPKkAhKS8b62WGlmxGNfE?=
 =?iso-8859-1?Q?ABe6OeqSuaap4eI1Zq423KCiawI9hBpS+nzcC+CP+qQltIBFSE7tI4h+rB?=
 =?iso-8859-1?Q?ft747LPjksxDB3pcWD3fSpL53TT4Hlp7kFtiG3YXRwi5njv09nYlPs3NlM?=
 =?iso-8859-1?Q?qIG7L/gJlebV5M9YdnlpTPyGZuegmOzQXhiTIp3AAxoYE0cABOPtM1I7eh?=
 =?iso-8859-1?Q?ljRM1tB/kZaaCsY54yvc8FFIZl3qpi+w6ajjLnXuuOVqyfvINnEFuFMBnS?=
 =?iso-8859-1?Q?nsN+7LxhyduBnkrdsnDRMYmODYP4aCqoCVOY7fXIUwqSijssi6PKsP4lp7?=
 =?iso-8859-1?Q?pjDpDibelj9tm5dyfweiIws0j4+bl9bBIJYB0UH+V8W4m78xGPOYAAqh11?=
 =?iso-8859-1?Q?3s1TBIikmJBCtjTSEYJel9rv+ubdegX2jSPjKAQYsMEqHSU3XxIjEkSa6n?=
 =?iso-8859-1?Q?DFVRK1oSTHmH2nlnA5Owbksn3Eydmm+laeSj7htoARFUqwMguzpxBb7NXa?=
 =?iso-8859-1?Q?SCeBXAG0SQco5OWmlYN4Y4Iba8bHEkKWEPayspxUmujVnLwChBsrSYAjtW?=
 =?iso-8859-1?Q?2uVTiGPH0KokK79y7tRYWRklfQhCV/Ck9T78waNK9jVlSgJyLisgpbgmMX?=
 =?iso-8859-1?Q?1vXWLkqQC4MKi7IR774mAJsjyHmOJUfZsPQbNkv3cNo1kb1KW79nxlXAXk?=
 =?iso-8859-1?Q?hxzNOBRzSng7XzKgRZX58rY97sR1qaNQq/B33hzACJZCTuCvVFFLIRT15K?=
 =?iso-8859-1?Q?K+V1X8O919EXaip3dxguQ7WuosYLDycDtL2va3szelcaoidKKGo5MMUsHk?=
 =?iso-8859-1?Q?GwzdzgCbCl7CEZndZV1RPqZrjWTr0+kU1SMT39G5K66e9BhgyoJg029uxe?=
 =?iso-8859-1?Q?d0Mxl2HsdmVfNzK89nsBDAPGp0bnGFggqTI64ZLtQvDqm6jYHDxi7IY1oB?=
 =?iso-8859-1?Q?XQ+6x+Y61/CMb9/NgbvGuP+nI7to1WM2ewY0clRB6f7VJ/Sg9ael0pEMJc?=
 =?iso-8859-1?Q?v5SBASUEnSWYgFrJrip8At8dmFgQ3M1rNKVKorX4uVTQCdub2YsXSjpgx4?=
 =?iso-8859-1?Q?Z+0+yvN3fb1oGwXCcvo7Ymhyg0eDKsK9JMrLcjToEF+7uryxhtxjyYYnRm?=
 =?iso-8859-1?Q?McF40FMbxJvTR5enam42VcM1DaJUn9GuHWWWQE2hr7QHkKahHY3lFp4qVL?=
 =?iso-8859-1?Q?MvNHy3vvOluyXTAf7DBHhOZiGxnNg202rVotV52CiXuvGqyi5deTcGk4pJ?=
 =?iso-8859-1?Q?O+vK7wGczcxTWFrMvCcAHg6lk/vIj5YJf/LOZkJ3/v8qq4CqM46+F1ebb/?=
 =?iso-8859-1?Q?3pCO0qt6umeKzwWzsBmHdJzThwrZhPD7AfxVJCsrZvvKLpwxlOW1BT24pI?=
 =?iso-8859-1?Q?h2nFFWH+1wqu0AUErIadyjubKjs0iGYm2lAK1je06KX50IqJse4NsjpfkH?=
 =?iso-8859-1?Q?ANRTdDS12yeE87hzkHsT4b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hdnbcOiCMXvZRFvYJtn86LROIBSEA9ZA1N/U4FYDRDztOvShVeFxVDmxnh?=
 =?iso-8859-1?Q?XQGGoqX9vA+I3G+6M+f0GuGHuXetO6JSGTnF+lunaQbKz3lEgPHkCUCe7C?=
 =?iso-8859-1?Q?+vNSfKNOcoOijqqdN5hwXdKouB4Em6daZbA1L/ADKX15AAK6XswoS/COPP?=
 =?iso-8859-1?Q?XAcoVHk3d2URm+9pyOZvPZNNTAfeEhmifny6XeBBSvff+e2fO8gCaTh6DG?=
 =?iso-8859-1?Q?ZvSx00xy4KabdGMP53J2kkrSTj3VVnDVhsm2ETmXZatnqPGsh5EV8XtDZC?=
 =?iso-8859-1?Q?+wNtQctfiuVgstK9Y0EdwxBc1BlMlfQieJlVYB7+Z3VIjR//D1mVIbaROk?=
 =?iso-8859-1?Q?nm1qb173w3Wvyn8t1i61WT4TI+v/cHsl3e//7CyzMtHlKSgW208oyo97OK?=
 =?iso-8859-1?Q?2oEgJs8w9Lji2CMHtGOTC4HRlU5kNKb2ih/tkVcJdeW2UcE0+Z/i4dTM9V?=
 =?iso-8859-1?Q?qAKvfawzLmnZOG7sjtVmaqNm60WlH1Pmg7bBZk6460vjSGyK/RzZ8FQiEi?=
 =?iso-8859-1?Q?+7uphZC6g6Dy+n8ECtQ6LZDxJ1Af++8T3gGol0Mpl1C2Gl1ehkmNxoGV4I?=
 =?iso-8859-1?Q?1Fhe9Uvs9ZXIE+4o10CZbNQp2Uc3ZlRGkeaT398g5h4hhb/XhxkXsVjCg9?=
 =?iso-8859-1?Q?eFgAUFoBp+4R66FnPxqQ9wbbUOw/GwdeUWu0N2LFS7ysCM2cedCrcBY8Iw?=
 =?iso-8859-1?Q?t+K3FOzFkHBZ/xTg1bNIHKBT41XCSnmJVth4TCdNphnSfFTvAEF7TtIm9n?=
 =?iso-8859-1?Q?dCDOXtz7p3/Ni+zfezr3tgz0X3OGzNIGj7+OusOpZw0UkMtX+V5EGcmadt?=
 =?iso-8859-1?Q?ok5EcUQ3AHWTD/szO+pXz7vy8uvB2VCgaRCWgoFRv6J+M1kCqKKNESx5me?=
 =?iso-8859-1?Q?NTmMAbzRKRuefYcEcnt+OqMtd7MrjWCaCpbzFIvWDxUxrcsNLI26Effo5u?=
 =?iso-8859-1?Q?M6Cs/kzCrpD/HyG885yT8gAE1vg5YHSCnhmZhfpXUMyPD0DVwwUr21pkv4?=
 =?iso-8859-1?Q?GzWa4oANo2lMy7hxSElCf6eCurN7/ghfc9C9G/4iuu9meQy+VcdZhUg0MN?=
 =?iso-8859-1?Q?4b9TI/CITxUVVCg4cX06ZAdyolgstnqnd3qIAFSPMlLpkZSJxYs8yxxj17?=
 =?iso-8859-1?Q?TIvD89Rbjh/fQWujYeUwSYlUTNP/Ce1hb9NaB6ci93v0R9EDEK31BvYOWI?=
 =?iso-8859-1?Q?4M7FNyRxwzIDaEhppgnm05DC8kiB/C7JvsRu9WSrHyUF+9TyQb0alGnYly?=
 =?iso-8859-1?Q?rzLaw14Il6fzFw6VOKMlu1kFYcjfNj+hccAxcsSRkMxR63IIrzhQH0U3lX?=
 =?iso-8859-1?Q?yZTDyMxcZTmkZg6Dvwt+2M1HwbDTNwEOYiIY5fPPQ7PyYVzdqdrbI95BpP?=
 =?iso-8859-1?Q?Yu/AownQ1k5Ji2vKj1FK7tT6T/kWdQKj4HXZM29vFvbwGOKVgPSqhSXuUo?=
 =?iso-8859-1?Q?TOFhY41aUN5mMPrzQhYOzQn78BZcsHezCO63NIazqLKc7T49xemC0Qe+9T?=
 =?iso-8859-1?Q?YCbQ06IcqYF9xIaLRMd9WFKGwvEQJ8PtvuJxseusQS8mOFF+a2AtvE2VnT?=
 =?iso-8859-1?Q?8GogIga1Sy0HhpKdv5mubKzHjwx7w7mmHckVq9fnJqSQUZjeeG/oYtMV8g?=
 =?iso-8859-1?Q?2SvR33CmsTAI6xyObzgSGf0KFVpiRZFICL4m3q+AgKDzWlJ7g6qSFimg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d2ce15-a880-4a3b-65b2-08de06bcf037
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 22:49:28.8569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6K/0p2cgpTt/oAUhdFI/aLY+UNe0PTfd1z5jyHJBJAT040zf+iJKXabeL1OeUfy2eO1TqXgGwtHTOgBuPbptg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7247
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

On Wed, Oct 08, 2025 at 09:53:37AM +0100, Tvrtko Ursulin wrote:
> Lets move all the code dealing with struct drm_sched_rq into a separate
> compilation unit. Advantage being sched_main.c is left with a clearer set
> of responsibilities.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/gpu/drm/scheduler/Makefile         |   2 +-
>  drivers/gpu/drm/scheduler/sched_internal.h |   7 +
>  drivers/gpu/drm/scheduler/sched_main.c     | 218 +-------------------
>  drivers/gpu/drm/scheduler/sched_rq.c       | 222 +++++++++++++++++++++
>  4 files changed, 232 insertions(+), 217 deletions(-)
>  create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
> 
> diff --git a/drivers/gpu/drm/scheduler/Makefile b/drivers/gpu/drm/scheduler/Makefile
> index 6e13e4c63e9d..74e75eff6df5 100644
> --- a/drivers/gpu/drm/scheduler/Makefile
> +++ b/drivers/gpu/drm/scheduler/Makefile
> @@ -20,7 +20,7 @@
>  # OTHER DEALINGS IN THE SOFTWARE.
>  #
>  #
> -gpu-sched-y := sched_main.o sched_fence.o sched_entity.o
> +gpu-sched-y := sched_main.o sched_fence.o sched_entity.o sched_rq.o
>  
>  obj-$(CONFIG_DRM_SCHED) += gpu-sched.o
>  
> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
> index 8269c5392a82..5a8984e057e5 100644
> --- a/drivers/gpu/drm/scheduler/sched_internal.h
> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> @@ -10,8 +10,15 @@ extern int drm_sched_policy;
>  #define DRM_SCHED_POLICY_RR    0
>  #define DRM_SCHED_POLICY_FIFO  1
>  
> +bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> +			 struct drm_sched_entity *entity);
>  void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
>  
> +void drm_sched_rq_init(struct drm_sched_rq *rq,
> +		       struct drm_gpu_scheduler *sched);
> +struct drm_sched_entity *
> +drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> +			   struct drm_sched_rq *rq);
>  struct drm_gpu_scheduler *
>  drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts);
>  void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index e5d02c28665c..41bfee6b1777 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -112,8 +112,8 @@ static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
>   * Return true if we can push at least one more job from @entity, false
>   * otherwise.
>   */
> -static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> -				struct drm_sched_entity *entity)
> +bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> +			 struct drm_sched_entity *entity)
>  {
>  	struct drm_sched_job *s_job;
>  
> @@ -133,220 +133,6 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>  	return drm_sched_available_credits(sched) >= s_job->credits;
>  }
>  
> -static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
> -							    const struct rb_node *b)
> -{
> -	struct drm_sched_entity *ent_a =  rb_entry((a), struct drm_sched_entity, rb_tree_node);
> -	struct drm_sched_entity *ent_b =  rb_entry((b), struct drm_sched_entity, rb_tree_node);
> -
> -	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
> -}
> -
> -static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
> -					    struct drm_sched_rq *rq)
> -{
> -	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
> -		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
> -		RB_CLEAR_NODE(&entity->rb_tree_node);
> -	}
> -}
> -
> -static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
> -					    struct drm_sched_rq *rq,
> -					    ktime_t ts)
> -{
> -	/*
> -	 * Both locks need to be grabbed, one to protect from entity->rq change
> -	 * for entity from within concurrent drm_sched_entity_select_rq and the
> -	 * other to update the rb tree structure.
> -	 */
> -	lockdep_assert_held(&entity->lock);
> -	lockdep_assert_held(&rq->lock);
> -
> -	drm_sched_rq_remove_fifo_locked(entity, rq);
> -
> -	entity->oldest_job_waiting = ts;
> -
> -	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> -		      drm_sched_entity_compare_before);
> -}
> -
> -/**
> - * drm_sched_rq_init - initialize a given run queue struct
> - *
> - * @rq: scheduler run queue
> - * @sched: scheduler instance to associate with this run queue
> - *
> - * Initializes a scheduler runqueue.
> - */
> -static void drm_sched_rq_init(struct drm_sched_rq *rq,
> -			      struct drm_gpu_scheduler *sched)
> -{
> -	spin_lock_init(&rq->lock);
> -	INIT_LIST_HEAD(&rq->entities);
> -	rq->rb_tree_root = RB_ROOT_CACHED;
> -	rq->sched = sched;
> -}
> -
> -/**
> - * drm_sched_rq_add_entity - add an entity
> - *
> - * @entity: scheduler entity
> - * @ts: submission timestamp
> - *
> - * Adds a scheduler entity to the run queue.
> - *
> - * Returns a DRM scheduler pre-selected to handle this entity.
> - */
> -struct drm_gpu_scheduler *
> -drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
> -{
> -	struct drm_gpu_scheduler *sched;
> -	struct drm_sched_rq *rq;
> -
> -	/* Add the entity to the run queue */
> -	spin_lock(&entity->lock);
> -	if (entity->stopped) {
> -		spin_unlock(&entity->lock);
> -
> -		DRM_ERROR("Trying to push to a killed entity\n");
> -		return NULL;
> -	}
> -
> -	rq = entity->rq;
> -	spin_lock(&rq->lock);
> -	sched = rq->sched;
> -
> -	if (list_empty(&entity->list)) {
> -		atomic_inc(sched->score);
> -		list_add_tail(&entity->list, &rq->entities);
> -	}
> -
> -	if (drm_sched_policy == DRM_SCHED_POLICY_RR)
> -		ts = entity->rr_ts;
> -	drm_sched_rq_update_fifo_locked(entity, rq, ts);
> -
> -	spin_unlock(&rq->lock);
> -	spin_unlock(&entity->lock);
> -
> -	return sched;
> -}
> -
> -/**
> - * drm_sched_rq_remove_entity - remove an entity
> - *
> - * @rq: scheduler run queue
> - * @entity: scheduler entity
> - *
> - * Removes a scheduler entity from the run queue.
> - */
> -void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> -				struct drm_sched_entity *entity)
> -{
> -	lockdep_assert_held(&entity->lock);
> -
> -	if (list_empty(&entity->list))
> -		return;
> -
> -	spin_lock(&rq->lock);
> -
> -	atomic_dec(rq->sched->score);
> -	list_del_init(&entity->list);
> -
> -	drm_sched_rq_remove_fifo_locked(entity, rq);
> -
> -	spin_unlock(&rq->lock);
> -}
> -
> -static ktime_t
> -drm_sched_rq_get_rr_ts(struct drm_sched_rq *rq, struct drm_sched_entity *entity)
> -{
> -	ktime_t ts;
> -
> -	lockdep_assert_held(&entity->lock);
> -	lockdep_assert_held(&rq->lock);
> -
> -	ts = ktime_add_ns(rq->rr_ts, 1);
> -	entity->rr_ts = ts;
> -	rq->rr_ts = ts;
> -
> -	return ts;
> -}
> -
> -/**
> - * drm_sched_rq_pop_entity - pops an entity
> - *
> - * @entity: scheduler entity
> - *
> - * To be called every time after a job is popped from the entity.
> - */
> -void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
> -{
> -	struct drm_sched_job *next_job;
> -	struct drm_sched_rq *rq;
> -	ktime_t ts;
> -
> -	/*
> -	 * Update the entity's location in the min heap according to
> -	 * the timestamp of the next job, if any.
> -	 */
> -	next_job = drm_sched_entity_queue_peek(entity);
> -	if (!next_job)
> -		return;
> -
> -	spin_lock(&entity->lock);
> -	rq = entity->rq;
> -	spin_lock(&rq->lock);
> -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> -		ts = next_job->submit_ts;
> -	else
> -		ts = drm_sched_rq_get_rr_ts(rq, entity);
> -	drm_sched_rq_update_fifo_locked(entity, rq, ts);
> -	spin_unlock(&rq->lock);
> -	spin_unlock(&entity->lock);
> -}
> -
> -/**
> - * drm_sched_rq_select_entity - Select an entity which provides a job to run
> - *
> - * @sched: the gpu scheduler
> - * @rq: scheduler run queue to check.
> - *
> - * Find oldest waiting ready entity.
> - *
> - * Return an entity if one is found; return an error-pointer (!NULL) if an
> - * entity was ready, but the scheduler had insufficient credits to accommodate
> - * its job; return NULL, if no ready entity was found.
> - */
> -static struct drm_sched_entity *
> -drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> -			   struct drm_sched_rq *rq)
> -{
> -	struct rb_node *rb;
> -
> -	spin_lock(&rq->lock);
> -	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
> -		struct drm_sched_entity *entity;
> -
> -		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> -		if (drm_sched_entity_is_ready(entity)) {
> -			/* If we can't queue yet, preserve the current entity in
> -			 * terms of fairness.
> -			 */
> -			if (!drm_sched_can_queue(sched, entity)) {
> -				spin_unlock(&rq->lock);
> -				return ERR_PTR(-ENOSPC);
> -			}
> -
> -			reinit_completion(&entity->entity_idle);
> -			break;
> -		}
> -	}
> -	spin_unlock(&rq->lock);
> -
> -	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
> -}
> -
>  /**
>   * drm_sched_run_job_queue - enqueue run-job work
>   * @sched: scheduler instance
> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
> new file mode 100644
> index 000000000000..75cbca53b3d3
> --- /dev/null
> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> @@ -0,0 +1,222 @@
> +#include <linux/rbtree.h>
> +
> +#include <drm/drm_print.h>
> +#include <drm/gpu_scheduler.h>
> +
> +#include "sched_internal.h"
> +
> +static __always_inline bool
> +drm_sched_entity_compare_before(struct rb_node *a, const struct rb_node *b)
> +{
> +	struct drm_sched_entity *ea =
> +		rb_entry((a), struct drm_sched_entity, rb_tree_node);
> +	struct drm_sched_entity *eb =
> +		rb_entry((b), struct drm_sched_entity, rb_tree_node);
> +
> +	return ktime_before(ea->oldest_job_waiting, eb->oldest_job_waiting);
> +}
> +
> +static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
> +					    struct drm_sched_rq *rq)
> +{
> +	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
> +		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
> +		RB_CLEAR_NODE(&entity->rb_tree_node);
> +	}
> +}
> +
> +static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
> +					    struct drm_sched_rq *rq,
> +					    ktime_t ts)
> +{
> +	/*
> +	 * Both locks need to be grabbed, one to protect from entity->rq change
> +	 * for entity from within concurrent drm_sched_entity_select_rq and the
> +	 * other to update the rb tree structure.
> +	 */
> +	lockdep_assert_held(&entity->lock);
> +	lockdep_assert_held(&rq->lock);
> +
> +	drm_sched_rq_remove_fifo_locked(entity, rq);
> +
> +	entity->oldest_job_waiting = ts;
> +
> +	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> +		      drm_sched_entity_compare_before);
> +}
> +
> +/**
> + * drm_sched_rq_init - initialize a given run queue struct
> + *
> + * @rq: scheduler run queue
> + * @sched: scheduler instance to associate with this run queue
> + *
> + * Initializes a scheduler runqueue.
> + */
> +void drm_sched_rq_init(struct drm_sched_rq *rq,
> +		       struct drm_gpu_scheduler *sched)
> +{
> +	spin_lock_init(&rq->lock);
> +	INIT_LIST_HEAD(&rq->entities);
> +	rq->rb_tree_root = RB_ROOT_CACHED;
> +	rq->sched = sched;
> +}
> +
> +/**
> + * drm_sched_rq_add_entity - add an entity
> + *
> + * @entity: scheduler entity
> + * @ts: submission timestamp
> + *
> + * Adds a scheduler entity to the run queue.
> + *
> + * Returns a DRM scheduler pre-selected to handle this entity.
> + */
> +struct drm_gpu_scheduler *
> +drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
> +{
> +	struct drm_gpu_scheduler *sched;
> +	struct drm_sched_rq *rq;
> +
> +	/* Add the entity to the run queue */
> +	spin_lock(&entity->lock);
> +	if (entity->stopped) {
> +		spin_unlock(&entity->lock);
> +
> +		DRM_ERROR("Trying to push to a killed entity\n");
> +		return NULL;
> +	}
> +
> +	rq = entity->rq;
> +	spin_lock(&rq->lock);
> +	sched = rq->sched;
> +
> +	if (list_empty(&entity->list)) {
> +		atomic_inc(sched->score);
> +		list_add_tail(&entity->list, &rq->entities);
> +	}
> +
> +	if (drm_sched_policy == DRM_SCHED_POLICY_RR)
> +		ts = entity->rr_ts;
> +	drm_sched_rq_update_fifo_locked(entity, rq, ts);
> +
> +	spin_unlock(&rq->lock);
> +	spin_unlock(&entity->lock);
> +
> +	return sched;
> +}
> +
> +/**
> + * drm_sched_rq_remove_entity - remove an entity
> + *
> + * @rq: scheduler run queue
> + * @entity: scheduler entity
> + *
> + * Removes a scheduler entity from the run queue.
> + */
> +void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> +				struct drm_sched_entity *entity)
> +{
> +	lockdep_assert_held(&entity->lock);
> +
> +	if (list_empty(&entity->list))
> +		return;
> +
> +	spin_lock(&rq->lock);
> +
> +	atomic_dec(rq->sched->score);
> +	list_del_init(&entity->list);
> +
> +	drm_sched_rq_remove_fifo_locked(entity, rq);
> +
> +	spin_unlock(&rq->lock);
> +}
> +
> +static ktime_t
> +drm_sched_rq_get_rr_ts(struct drm_sched_rq *rq, struct drm_sched_entity *entity)
> +{
> +	ktime_t ts;
> +
> +	lockdep_assert_held(&entity->lock);
> +	lockdep_assert_held(&rq->lock);
> +
> +	ts = ktime_add_ns(rq->rr_ts, 1);
> +	entity->rr_ts = ts;
> +	rq->rr_ts = ts;
> +
> +	return ts;
> +}
> +
> +/**
> + * drm_sched_rq_pop_entity - pops an entity
> + *
> + * @entity: scheduler entity
> + *
> + * To be called every time after a job is popped from the entity.
> + */
> +void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
> +{
> +	struct drm_sched_job *next_job;
> +	struct drm_sched_rq *rq;
> +	ktime_t ts;
> +
> +	/*
> +	 * Update the entity's location in the min heap according to
> +	 * the timestamp of the next job, if any.
> +	 */
> +	next_job = drm_sched_entity_queue_peek(entity);
> +	if (!next_job)
> +		return;
> +
> +	spin_lock(&entity->lock);
> +	rq = entity->rq;
> +	spin_lock(&rq->lock);
> +	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> +		ts = next_job->submit_ts;
> +	else
> +		ts = drm_sched_rq_get_rr_ts(rq, entity);
> +	drm_sched_rq_update_fifo_locked(entity, rq, ts);
> +	spin_unlock(&rq->lock);
> +	spin_unlock(&entity->lock);
> +}
> +
> +/**
> + * drm_sched_rq_select_entity - Select an entity which provides a job to run
> + *
> + * @sched: the gpu scheduler
> + * @rq: scheduler run queue to check.
> + *
> + * Find oldest waiting ready entity.
> + *
> + * Return an entity if one is found; return an error-pointer (!NULL) if an
> + * entity was ready, but the scheduler had insufficient credits to accommodate
> + * its job; return NULL, if no ready entity was found.
> + */
> +struct drm_sched_entity *
> +drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> +			   struct drm_sched_rq *rq)
> +{
> +	struct rb_node *rb;
> +
> +	spin_lock(&rq->lock);
> +	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
> +		struct drm_sched_entity *entity;
> +
> +		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> +		if (drm_sched_entity_is_ready(entity)) {
> +			/* If we can't queue yet, preserve the current entity in
> +			 * terms of fairness.
> +			 */
> +			if (!drm_sched_can_queue(sched, entity)) {
> +				spin_unlock(&rq->lock);
> +				return ERR_PTR(-ENOSPC);
> +			}
> +
> +			reinit_completion(&entity->entity_idle);
> +			break;
> +		}
> +	}
> +	spin_unlock(&rq->lock);
> +
> +	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
> +}
> -- 
> 2.48.0
> 
