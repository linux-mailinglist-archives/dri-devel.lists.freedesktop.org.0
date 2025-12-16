Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33861CC52D0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 22:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D316710E87E;
	Tue, 16 Dec 2025 21:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k1yx7Ihm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A9110E3AE;
 Tue, 16 Dec 2025 21:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765919378; x=1797455378;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1GkkkMTcbXeqloaiGRa+P4DE9SpRzaYHBRZ+Fcu8kyw=;
 b=k1yx7IhmzJrwK6HWIZh5+SxcPRV5MKR4ygofxrwwdhALA99B0vwfm1c2
 jgtdvfzP9bDfV0ibg7eKzcqrG7jhRdEJ8/UypymRLeH9LS4SmpNwEKiJi
 21Ye/dcqnubQf+SGMkn8fayzaE3lOyZ/gSB97cynuGLIZheHRHk4Ac/Ec
 sQ4TXDYZZeley2u8i0hlOnhhgeR8rFT/LXMxAKbgLXAKlxOTWKs0I9GmT
 B6/relE3RF3BBnW4AlUMAZCSTIK1tMKunx6hvEy2w7q2qlFPM63vIbQtJ
 dH6b836HHbxYeOCY1xBhTART6KakeGhL5Y8ppDMwAFZTAQkLscXmeKT8B A==;
X-CSE-ConnectionGUID: DsO3FIglRW6Ye7UjUL+Vww==
X-CSE-MsgGUID: vpnAWHiAQ0uBAI7HUR1+Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="85439077"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="85439077"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 13:09:37 -0800
X-CSE-ConnectionGUID: 38kGQH+oTuqf3/1aVOWsgA==
X-CSE-MsgGUID: ORZ02M5qQnKubLX5KELuCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="198605740"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 13:09:37 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 13:09:36 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 13:09:36 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 13:09:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUJYp2+ycW1Ljf6y2SIr1e+cYjw1C1+6ZXF1QklnWXW0VV8SPvzaD+JsUFrhD5w5sXaJNoNfwBDQmadfJWSs0Os24PuIg1LV3CEJ8oyVnV3fdGuHNNugVxQtWEmAEtWznwJn07NIhmYvjTzeYEYVI8CGCQYB+b+TmDdqws6MnZlnABCB65UkoMJF1hVtd0dK9F90i4NrsHCILeVjAJE6sfObH0od/LB9cQeK3iO/r00fY/MAETODJ1gKZv8RC6NNp3jDvCzRtXQnTKVUXc/oEPaLXho9Qbwlvbot5qqn0vGZq1YuoSJiogW+T+FwZkVsfwKdUOlNpkfpOyi6t7tFug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TgBAbcAWjTaNObkv9xFKprg8Bmpgsy0DX4YGAswNBk=;
 b=QNdOcUczwPpfovZsBv3hTwTKyyABthp9bPl5ARZnFcEw5oQ0hI0F29I5Yl3wM+12cQRtJ5l0Go+6bp9/0V7+9/y5wtKnhirIlSEfzQ3oO0/+PibvvdqR2ZxT1saszHhyh4sHb1PwMQYc+ueKcReFJdDUi6faBekoeElMceYeI1jh1raahelcYIl4Fd18oFbcOIUcv4Nzj4ziRXaKCfoeQrLOD5VDK82FN0SPb+myl/0tBUjUM37kG4tcA5xXniLseRARdDpAF8gefj/VDfVlsD6jvOH/ALwj/Ic69PfXG9umfZxxYF79AVUfY8usROv9wBprHGB4JHqUK2riWuLdVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4916.namprd11.prod.outlook.com (2603:10b6:303:9c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 21:09:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 21:09:33 +0000
Date: Tue, 16 Dec 2025 13:09:30 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, David Airlie <airlied@redhat.com>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Felix Kuehling <felix.kuehling@amd.com>,
 "Alistair Popple" <apopple@nvidia.com>, Dri Development Mailing List
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/gpusvm: Assign maintainers to the DRM GPUSVM helpers
Message-ID: <aUHKitcPTq2ST0M+@lstrano-desk.jf.intel.com>
References: <20251216092800.199824-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251216092800.199824-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4P222CA0019.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4916:EE_
X-MS-Office365-Filtering-Correlation-Id: beada819-ee93-4074-8a40-08de3ce76936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|13003099007|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?l69H6Jva1T5mhOcdXqHrdwXx91YXvEBRb7vTf+vial3TVwj2R0ukZPTqEU?=
 =?iso-8859-1?Q?fki2ZtApJ7Kmxo0TJ9VGBNEk4ip3DwaWOfJrbVb3X9aqAEJf2+IhaxUvgy?=
 =?iso-8859-1?Q?wblI5hmt0S1u+4iBLw8sLlKv2XUii1V0g1R7Zv2jmz8iRgnD02YlVaegCy?=
 =?iso-8859-1?Q?EOSh1WJ/ieewZSXinM/qX5NG9n/W4xycbYtGuLUNbJVeEoxk1931TgEB8x?=
 =?iso-8859-1?Q?EeYWyZomEVTeeuALyP3bjdD7ey5ryKJBP3ybDz5KNK3jMyKrJ3y4RS4fCf?=
 =?iso-8859-1?Q?zVggFO/Ekfe7OWNIp2rLLTNjVBlHhiHuWlOiM58Mo87pAkMUmCL/q6B44z?=
 =?iso-8859-1?Q?TXCPs+HHiKatkxXv7rKSiszByihOepugdMeh7PcdHur2G83ckZGqP6Le4Z?=
 =?iso-8859-1?Q?y1ouwONXGGBRSeCT2G3LPOEbpU0DhXUgD76qSQMQxwfYfkTxJ0aRZTxoB/?=
 =?iso-8859-1?Q?PAjm2aMcFzeRC1t1yO9m0R7M7MdG/iG4zb27agzaQfo5RXbjjdAtsu+0eR?=
 =?iso-8859-1?Q?LBEo8rspRfakg3LXFXAZjFHMRXOQ2n5UjlCnyTi8in+KVSMlGokMSC1DqH?=
 =?iso-8859-1?Q?uu6U8FgUk8kmdmq9sUiCvCN1YAmRg3ZmcHeGJUe9A0+i+305EEzC2Uqpwy?=
 =?iso-8859-1?Q?rzhcXjluI7Ey6czajA8ymZBaM+eSvKl90O20bCQ8YDWufG/y1BYJJD6h+O?=
 =?iso-8859-1?Q?y8RkEKDgQQAmM0SnXlmif1Yhom6XzSXBcCsRANi/LEH+1ocat7tlcAXoXH?=
 =?iso-8859-1?Q?Vo9nkSfNvpPnY9mF9mFKA7pB04Lz5/1tCWRXQ0kYYBtNXxsF+XTCndstNm?=
 =?iso-8859-1?Q?Q9MOBqvcfgoM8zutNFvKvq3oLIErAZrtoafUU12g6aTa6G9QptIvFSM9sK?=
 =?iso-8859-1?Q?WaDX4qk7FN3PyUdIfH2+eQyDZrZCMtEJRAv/n8+VMn92qY24usMNm2PEb4?=
 =?iso-8859-1?Q?SNdiMDmC3dD9JtvHCwADBtw0hk0G8QGwT+Eu6h/7yxnvMgu8VP3pU4uoR5?=
 =?iso-8859-1?Q?pZ0KQ2LE3kHaiGdWzMwTw9MIU54Yrtw9+vUzxXD6uapudLbQCaYUTc3Pt+?=
 =?iso-8859-1?Q?/N/qa0iBQE4Xfi6b5Z2mAvsILZZ4LHjbxSUsNLir3rbjHQp8Ps1+LsMlUQ?=
 =?iso-8859-1?Q?NxOdWrf0JjfXZvkEhhBEefVirJUs9Vdi69aytmORXHKtJt69iurjhdOVdy?=
 =?iso-8859-1?Q?4r3zma7pJca6nHFyTyUfOeZ4mtPKrUI1a1XgVpD/p5iGhzcmPUFN5AamOA?=
 =?iso-8859-1?Q?/rVpt8y20Nss4eRxqlfXwdN6zhGMbZkN3SNrHl9AunBWFX9nZ87QdTWwkj?=
 =?iso-8859-1?Q?YbQz5anDF/75wnK+2lE7GDOT1ynvb3GEGbhiwF85p1sLaqY8FvK99v+3cY?=
 =?iso-8859-1?Q?kxxVRX7ETQgjSpC4EGraCUP5lAecRjVdvzebusEqxtAE2npUORhCq8lXDI?=
 =?iso-8859-1?Q?yhldE9GRXSRkQIeqbJTia/UuC4Dh1UCxilRWzA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4J1PzeKe9Hv2ZvNjJRKudgTKN+UeJYssCpb7zYEJwml7cbBAvsMYUM3pbR?=
 =?iso-8859-1?Q?Fk9d7fxe/Qx+SyQivIzkljisxwi6v5I9FsBOQmF1gmnSJT52RWOxD2+GSk?=
 =?iso-8859-1?Q?fjuryp0INloEohOAPelHp8bBFmV7gIx5pnLWJGPnFgXQIqAMMeMeuoQn+R?=
 =?iso-8859-1?Q?iUXaqf72x7jis0fpcxyVfDq60c7/xp2YVZjB1tcEpL8lngHyH4dOzD5DDZ?=
 =?iso-8859-1?Q?X/PWbXjFF12XLzQFCoRVvLBEvr4TaU0W7selI+EyWygq1J+RE9OfRD77YD?=
 =?iso-8859-1?Q?kzKVrNB5ZzG1iwaZxRBfdT/REO8dNZijHyf4zB+uyBu6cn0usXsEnJFsMc?=
 =?iso-8859-1?Q?WntJiyWM5b/WZwcpOiPpJYMa+q9hUbi2UofKRgecV6enog7iYNf6Ib5qS9?=
 =?iso-8859-1?Q?U9L5I/wtizn/URsPld7d1xlt/yCC/BHVsxrqSmP/smYu5iUyC84NjjdguN?=
 =?iso-8859-1?Q?AyA9VYkfyfN/VAZzu4dMPpTRSzmFCxQDCSg4x9GdtoMkG0HOUz34XOBC1K?=
 =?iso-8859-1?Q?6uzzGl2J7fziDcOfRGNTn9WJUDoKDo13Eks/yfH9yY2bFcoGr6G740tnap?=
 =?iso-8859-1?Q?JZhr4/SmFx17/X2mOggTCaorVMWLomX13wjF8Yuuok/oDnLghsJei7OaiK?=
 =?iso-8859-1?Q?gGg2Z4spDASyD6Avy9OVYXxpDKEVod54BMhHQxieQhLdvNNmQrvo3tIg2S?=
 =?iso-8859-1?Q?OJ+ru1aVFvrQqGWmwsPZ5j+tN3bOd2czFzRah+Fs9s7kZKL/1RUC5sRzF5?=
 =?iso-8859-1?Q?qZ66t2wi2At8ZeyBesMs6llDhHNDcnWZlz56Dd2Gq2K+j/YTvbInAhiQfN?=
 =?iso-8859-1?Q?D1zlxpp4QRkpW5IPV8LsCOKJ5AWAQyuq2W5RZyL5OYrccDyEQUsgRFygcV?=
 =?iso-8859-1?Q?pffSwZXGBOAf5qkJVAW7yJhBRs+R8K/6SDMFiYNxnhfo9MaG9jPlCuFULF?=
 =?iso-8859-1?Q?A3e7G/2aGdskB53hv24H6hoYKFqtq8W5KdvYpQluXInWyTz9ettg9UDBHN?=
 =?iso-8859-1?Q?1R+VRUG/8apczrSe+FtjjeE//ecFN4hu6ej4EEkmvYv1NujjbhyT9fYN+Y?=
 =?iso-8859-1?Q?di8qNTEgmsOZ1ZkB1B3rIS3A2YgVgHiK4LIbvbzUdm/X2s7rAWvz6d+ldr?=
 =?iso-8859-1?Q?avwjN9wvo/Ef+HuTfs29iyPrOoX2dOQ07S2Aq7m5m7+0Sa416SsB32uff+?=
 =?iso-8859-1?Q?j9CfkSW6qdxXJYbWmcBqIyb6ki5DWpsB2i4cjL8plnktxBeBEo9PZ+ggQ6?=
 =?iso-8859-1?Q?fpdu83vcleKgwh9mysl1eXmsj85k1vcou20B96WSc72giQrLParzyjf2Y2?=
 =?iso-8859-1?Q?DQd88P2UhR7C93UpECXbXp+jnJrg/cdtHpmDm3Df6spdePdr0Gh3w+li/v?=
 =?iso-8859-1?Q?BtOhVkx8jnm1VCFG1FcxU4g2CqwHesnc5/WiDahErflMYMBTc9qvzAidOh?=
 =?iso-8859-1?Q?D2SicC1oknJJCWsaAZ4gSoe/W0ttS3Fncgm7xQi64H+3Rv+BUAIWMJ6DQM?=
 =?iso-8859-1?Q?MstZPnj5OVL211pF4xCFFYNZZ3NUakD1K3Aui/8y7ZLRlMhyeMirBOMYNU?=
 =?iso-8859-1?Q?7eSKugS2TWGotU8MMdef5f40t37qjYLoBxIhRypcBFPFNICsvnFEiYal6G?=
 =?iso-8859-1?Q?LXstUbh+31P0Zn7zqFktihpVSqqZ0dLv+lJA7Dvvik9aIJ1wD/VdCCAA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: beada819-ee93-4074-8a40-08de3ce76936
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 21:09:33.5440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SC5AFnvW7xmAHfcMX21zORFy5utOHeNKkMJ5RkyaKYmTUKbw8wMTaRRlKd9gdbdU3xT4vPFURUV4YqC7XCveaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4916
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

On Tue, Dec 16, 2025 at 10:28:00AM +0100, Thomas Hellström wrote:
> Document maintainers and reviewers of the DRM GPUSVM helpers
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Acked-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: David Airlie <airlied@redhat.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Felix Kuehling <felix.kuehling@amd.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Dri Development Mailing List <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  MAINTAINERS | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dd2970833dff..f6353315f216 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8714,6 +8714,18 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	drivers/gpu/drm/drm_gpuvm.c
>  F:	include/drm/drm_gpuvm.h
>  
> +DRM GPUSVM
> +M:	Matthew Brost <matthew.brost@intel.com>
> +R:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
> +R:	Ghimiray Himal Prasad <himal.prasad.ghimiray@intel.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	drivers/gpu/drm/drm_gpusvm.c
> +F:	drivers/gpu/drm/drm_pagemap.c
> +F:	include/drm/drm_gpusvm.h
> +F:	include/drm/drm_pagemap.h
> +
>  DRM LOG
>  M:	Jocelyn Falempe <jfalempe@redhat.com>
>  M:	Javier Martinez Canillas <javierm@redhat.com>
> -- 
> 2.51.1
> 
