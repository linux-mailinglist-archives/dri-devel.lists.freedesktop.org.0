Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72334934263
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 20:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDC210E33E;
	Wed, 17 Jul 2024 18:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEVNISJF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D933210E340
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 18:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721241925; x=1752777925;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kaF4cl1wHfbc2ctxN9dRBXpCveIG8RPrIpN9Oguh9kg=;
 b=cEVNISJF53gqejnRM+064E/LWnvz9rWXBy9qvyYNHTbo0l/F4pkuiKMy
 F22JWQPEURQ020wbzI1KMM6bP0wv3EPjOdSMngeux968EpTW8HeHui94B
 /Fa+gK8R6qcY479VqOjtywez4AThSwrt/uzDKvnHfoACmS6khq8P3bvCw
 IZByI6ksO11xDbfHaVoM8oj50ecy5CNHs+k4urA6Rjmysbrt5fXjblgZk
 Evz+5Vd6oddftu8hr4SjDfSkxabmLVLSN+VxzsrI09wrK8bbrUXvUCYyF
 j2qXb3jVPfpDN6Ui55/4ofAqujmiDaEheGfix4uRvzki4K+HJdO7vA6to A==;
X-CSE-ConnectionGUID: QjkLF2NARvSrY3UDpi9CPQ==
X-CSE-MsgGUID: ZwbvUdw5T/KXAAkq3AVXkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="22534704"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="22534704"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 11:45:08 -0700
X-CSE-ConnectionGUID: WQUueRjNTTiBV4/F936i/Q==
X-CSE-MsgGUID: 2qQ/Eg0cRmi0JFWt8fzXhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="51196794"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 11:45:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 11:45:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 11:45:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 11:45:03 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 11:45:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=is+138GNwvPXiszpFtN4we09j6rsg8Lm07AejtNTfQtx/WHK7sCValERSs6Rhgm2LUnW4AjqlgPMZutK++fdKRfZ7TLfYx9a7aOPSQc/ItmWL/nVipp6e/KxwN+/wQH2f2rwxYzG0VrTikBxPBczHZWqR1Fc0NnfWeKop2BQq8icqAJxcMcG/FTpSCVrPcBXu15Vh/os1BEu2d/w0daxw914u2GDCZp1nr7KvXRuZcBmTdS/wHiUJVALW0ExyooNeaQ5ZFUHqTLchv9zsKPf+Bm15eAqxbzEwtIoloadPXW6kEO8Wr6XPLTNR4jFipT+Y0pqhA6TbMdokrYr8DQPkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnDPpDq73lxC5jktfV3z3cHiD6gga1cHSw+qLN6Qpw4=;
 b=HWELvWxfdBVbUcycAGj9mEPNuFXkQkEztDmxumL6CgCQ3/LQI6HDN6i6Zofgv/GNYKPfk6kNkGELfixpFKXVs9MCprW6GvEmxPNLzNmyQKhldwi9Op68mjiJtF+GXLUTyjVzsKVOUev9/5pSS051vdeDI67xBm80apQEXiN03M+iqnwQomNALtwNCUpNmrXx9vUVE050aLE1F9TPTMc1DS04zyVW3COjcw9DqsxiRjrW2cs9p50skVPIFxJct+vO+MSlSVE+yS8f/cMwUQeIAMcL63lcu/m1dgmrPvDLePo699w87D57LdhF33DbLoeOGbyOUNt4Pdtb+quDbBesFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6206.namprd11.prod.outlook.com (2603:10b6:208:3c6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 18:44:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 18:44:57 +0000
Date: Wed, 17 Jul 2024 18:44:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: <thomas.hellstrom@linux.intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 9/9] drm/ttm: make ttm_bo_get internal
Message-ID: <ZpgQ9mKYsPVXIEVo@DUT025-TGLU.fm.intel.com>
References: <20240716123519.1884-1-christian.koenig@amd.com>
 <20240716123519.1884-10-christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240716123519.1884-10-christian.koenig@amd.com>
X-ClientProxiedBy: BY5PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6206:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d6e332-dedd-4004-b76b-08dca6908e50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?J8P7vh3vRWicfxrxouiEg6yNO8RUF1VMe2Z26IJOTOHrzvL+Z8yxeoq6PR?=
 =?iso-8859-1?Q?AnmsH2thmFQVbaXH8tkBZaeeZZMO0/3UuNix04xyjFKIjlB56IqrW82fy0?=
 =?iso-8859-1?Q?uV1LZNxqs+k3q1Kn7O9vanSca4y2KrWCSomx2DohmDbci88y5LpTZFmo9u?=
 =?iso-8859-1?Q?IxtEBPv84miBUcG3z0RAfX2ihds8jYKYKQ7qmp6GJqE1j1ax5wGwK/shkz?=
 =?iso-8859-1?Q?z98SGP7MNLHJ9dqTE22qccZrp3pc/5k0Z5qE/1mumxt4fTUlkgTwSZh6bj?=
 =?iso-8859-1?Q?caFVrQzJuwZ2D2qIf0R8xEOmRPhjTCG5j/QzF3C/F7mlVn4XMpBCChtbDk?=
 =?iso-8859-1?Q?AmYQvKhV/idq3RWjGH/iyqMGxmDIJHuhk6Hvkjxaf7Bv2di9reZMy+CnX2?=
 =?iso-8859-1?Q?H4lk283nfglF0Zsi/2+igmTu9Ruq6ZZNiKpsFp8xmTAKmxcKsAcQ1ylhnD?=
 =?iso-8859-1?Q?HUIT6c6fe5NGl7twwG3XX+FaoE6RPpdutTcEhUguy47EW5Sq5NR7A9bBD5?=
 =?iso-8859-1?Q?2exDriCAAawHj6zc8R0iIPT4+y20g1i3KqmLJ4gJ793gUWqxVZKX6Ad/WG?=
 =?iso-8859-1?Q?DqHObVQUUK01TaPEjWQeVN8v2Vt2KKHwpA6iVQCvLoFQ3Yw1LAeECONqmc?=
 =?iso-8859-1?Q?OUeGn36aMP7Np0Mf4YxdtXWP8r98sdgnqBjgcmQaE4iJOk4pSBo7mogyvz?=
 =?iso-8859-1?Q?Dzhc42wAGNhbR26pWilgdbAZddM/eLM+E1+rQyAv410EI1WUk5udV09ezl?=
 =?iso-8859-1?Q?oQ6Fgl7q1Oqr9jwHeL5T/sLAcWos5LAA4US6aglyYR8NMNl2RjZpFbF78q?=
 =?iso-8859-1?Q?oaeca6/s5Vw33TczmJpGc3cx8D7AiLW8x7g2KTGOaXdeX8+ITkj+E19uh6?=
 =?iso-8859-1?Q?XBpJu/G6OpFpo/NWP7bCHsV0FlAKVCO3fFdhxdMc7pvBK+wjaxu50Y2FS7?=
 =?iso-8859-1?Q?jUlVaVKABuJyR5C4CNPiL+Q5KtoLdUo55LbqDyvbLH/tY1biDjkJJz1V3I?=
 =?iso-8859-1?Q?P0ICB+nCmdY/RYVWFLEjINW3Ua4iZU9Yo2j8NMAzYtJXaa4I2zGI2DXbWu?=
 =?iso-8859-1?Q?jvtDLkzfccPB5MwZkWIJYQL9spGMTtgQjJejRfyBzTtrpuAXdVHAAJgkO4?=
 =?iso-8859-1?Q?XOgxCdeuZ5/En6wYkaXKt5Dxytq7KcES02kiq3IO+wsbSYcu24y+hsRGs4?=
 =?iso-8859-1?Q?59nOHz3w/G1ydP/bWX+cz6bkbpoWLpJOln3cbZkzi5YmokIRChTQu++5OJ?=
 =?iso-8859-1?Q?OFhdPSdf7DjR0DyZNH9AHmo1J5skZ1xHfvHiiUOuBQFQO41e3CIr3OfE9D?=
 =?iso-8859-1?Q?vvO32EK2o25mVzfGfKXycVzYd0/sHeP/Y7BeKgWL/1lRYF9p+w4AONtsw/?=
 =?iso-8859-1?Q?WsP/oL0xfkw4K5pYsMRLiO6D+RHAbUgw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ae7BYRHwoQKjuPfEPKUG9V8sY1SSYJKvCypSBeLsqVUZJTh46eIqsssrn8?=
 =?iso-8859-1?Q?bQQSv6fXkywv6t4nZAbphr8w/TZ0FtQF1Wu5u9n5/wWFkUAsGYHEMlWizW?=
 =?iso-8859-1?Q?EF4x7Ajgksszh0dRicir8TeKAF5nbLA1YwnmchLODvfDdsw1Hq2/Q+uEMt?=
 =?iso-8859-1?Q?CdiLVsRnl1qXAZ11dCVjc12MXNkqQbE46Oq2buDW8ftPsPJ/g0TybpTlQT?=
 =?iso-8859-1?Q?erbv0EULS6mukeKa0dM2l4WHCQNWKJkEA2kSDUMMXpDSASlnG3BrpnDBSO?=
 =?iso-8859-1?Q?PvtRw9KFhbf1q/pPSRkpQg0j1fXcHprE3zgT7rUd5iBT78t8qDAbj7ySgp?=
 =?iso-8859-1?Q?eSJARYlNfTgj3mzaNLGZ+lRg+shJo0ULnQ+O+vehBd3nOjt5YAb0A6HJF7?=
 =?iso-8859-1?Q?/ktN4GzlfYc6V1ZCKghZW7kXXNFj/z9HeXy+B/azI4d2h+DjjUb280a1oJ?=
 =?iso-8859-1?Q?dBeEgPjve6RKYooLLppsyuBtBdCnSQLMgGIvBGGbz6h2JXHi+++kdhm9n7?=
 =?iso-8859-1?Q?tAkPS6tlk9TgXQPyrWk1jww1TIfD4GkXBcZZ0MKZZbr4XHYL6zWEwD6Tp5?=
 =?iso-8859-1?Q?AwXI8JyCp3k5hLDXTdOyWCIFkB/mQV4RkmGRIAg4gJ7XPpxOyiNrNw3cZ0?=
 =?iso-8859-1?Q?erx4njUf7bvXn7sA5Dvky3CerNYjnBZ0GAeP2NIurLwFTpVOwg9SnxtdOV?=
 =?iso-8859-1?Q?V497KvFSEmXTDMU+bLGEsV8HLRKJ+RLkfxwx3GfcyhWuXmp1w6o6lT/1ue?=
 =?iso-8859-1?Q?Wwag0NVevf9hnjLkCp8iYG6GMEtgpR4eUwctN98WCnkw4rBPMT1f0b/r/T?=
 =?iso-8859-1?Q?OFsKuaYYAupnBYL+o6nmi9wYER64GB2cTDT5XkNIvW0nSlPXIib+KnYcWL?=
 =?iso-8859-1?Q?RQoNEOgBNzV8vKYlffPpTsf3IR5NGzOE0gr7Iu/44C58zI1NVH+HAddCkj?=
 =?iso-8859-1?Q?HNfmyLpNxYp7UscELtIlpLbnuP5Afnd8R6OSwawrSnvBXW6ES0mheA6E2I?=
 =?iso-8859-1?Q?zxHi+jVB0KnkP5D8JR/fU+f9may2MSb6+h8uA6QxdxSx3E508IrkUUh9+L?=
 =?iso-8859-1?Q?NFQ8veXq6VBSh70T/Y3eNm4jMX4JIU9llxTi+hUz3aMAIsYbIuRbzL/DhF?=
 =?iso-8859-1?Q?yh6JbkKd4LWuUVmMygntZl9YC64L98Vj8Uv4UbQmUD1RlsYgc9QaK4QDFy?=
 =?iso-8859-1?Q?xD24SXuQNSjTkDIYhu65QGptb6jIdl0cWM08KpPjATO4M7ITVgoMFoswPs?=
 =?iso-8859-1?Q?IG7ZG4XmkgNEz0cmM2vfbaWtmS6GQYvVh7w3JgDqGtwlI0SxPfRQwPbT6r?=
 =?iso-8859-1?Q?lv8D6qaIXvq/BHr6ALeM4flb9a7Vu3NIzEtJwSRQ2NbjRLQWXI9wzTjv2V?=
 =?iso-8859-1?Q?tykkhhH0T6J/TxAMMdw7022zzScvGTZk3q000ZhnkEsKD6IA87VRaZlw3G?=
 =?iso-8859-1?Q?6g7YTLwhBuEJ20yDsZkOZnKLSnalV97fLuubdBWm7bN5STY1WJGrKuO1nF?=
 =?iso-8859-1?Q?QQcqwns/bwLf3fj/IgNkMFfW/ZD4R9bFj/jFKImF3h/ByZ6a1tzYAphEOB?=
 =?iso-8859-1?Q?NCy+bwCKhjnpqavyZR9B6kqLwkHgZNhHMaLX7j9QKOJFAEKJj8JejujUia?=
 =?iso-8859-1?Q?BAQws+3oFCCjGz0IfJUhtbBpoQd1LGaGV7II3d4rn56batXs1c6h69tQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d6e332-dedd-4004-b76b-08dca6908e50
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 18:44:57.3689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mC/51H1YHNXmUzgQoRIurbK15LSa3QfE/1V+Bc/2gIOCNO169HeMwIOMUJ+jRMRntYAFaKZeyzaZ2/WAbNrUYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6206
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

On Tue, Jul 16, 2024 at 02:35:19PM +0200, Christian König wrote:
> Prevent drivers from using this directly.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo_internal.h | 10 ++++++++++
>  include/drm/ttm/ttm_bo.h              | 10 ----------
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_internal.h b/drivers/gpu/drm/ttm/ttm_bo_internal.h
> index 6a7305efd778..9d8b747a34db 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_internal.h
> +++ b/drivers/gpu/drm/ttm/ttm_bo_internal.h
> @@ -27,6 +27,16 @@
>  
>  #include <drm/ttm/ttm_bo.h>
>  
> +/**
> + * ttm_bo_get - reference a struct ttm_buffer_object
> + *
> + * @bo: The buffer object.
> + */
> +static inline void ttm_bo_get(struct ttm_buffer_object *bo)
> +{
> +	kref_get(&bo->kref);
> +}
> +
>  /**
>   * ttm_bo_get_unless_zero - reference a struct ttm_buffer_object unless
>   * its refcount has already reached zero.
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 31ec7fd34eeb..8c1577d8793c 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -229,16 +229,6 @@ struct ttm_lru_walk {
>  s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>  			   struct ttm_resource_manager *man, s64 target);
>  
> -/**
> - * ttm_bo_get - reference a struct ttm_buffer_object
> - *
> - * @bo: The buffer object.
> - */
> -static inline void ttm_bo_get(struct ttm_buffer_object *bo)
> -{
> -	kref_get(&bo->kref);
> -}
> -
>  /**
>   * ttm_bo_reserve:
>   *
> -- 
> 2.34.1
> 
