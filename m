Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6540DCFBBD1
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 03:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC2B10E136;
	Wed,  7 Jan 2026 02:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EMM3QDNS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E2F10E08A;
 Wed,  7 Jan 2026 02:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767753194; x=1799289194;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JheMyoU4E9yEYjUdw+TzL1YH8O29V73cJh+xvYXbjXY=;
 b=EMM3QDNSbevuVhwgdHzpZuLSuedfr35o1/0unEiYVOXKN7iEGaElOj17
 h1yrYtck/pajYLO8T4/Op2ZMB2zTu+LiqrYGjm22BJaf0V3Zi7k7y0cDR
 wPT11sYzJxQeIGCQZ8fWMrv2pk5OQw2di+EcbIx2ngleh66tTqGuPlikC
 QBMYbIz6KQR0WlEn3Bh2Jmo4jROr/lPN0dld5JdCPG7VWP8hQvr5+KVJ2
 K65033WzaJnWMzLzBrwJqLAX1ckxdUCNzM2IQ3IA3T0Ob1+X7IoeDwvEK
 Dpdg3ycjflNncfTDzQNMLyjMMx96LEFTyJfqRoN48dTA8D+ygjxRolxXi Q==;
X-CSE-ConnectionGUID: HpLDdthWRaSMeIzgJb/HeQ==
X-CSE-MsgGUID: m8mm+70cSkiyhbVx4gUbqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="80485090"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="80485090"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 18:33:13 -0800
X-CSE-ConnectionGUID: WIDO0AiNRDuKC/nQ5itkxg==
X-CSE-MsgGUID: 814w9DSqTnu4iXUP1m3bfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="202858967"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 18:32:10 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 18:32:10 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 18:32:10 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 18:32:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXZGE+IjXdzGrGs0u6YUM/8bXVUdcyuu5Xk9NyYXbPU1bI/LeG2wSEJPvlEsYEFTIn/SyBxhfAoYfK/3un9drjh7prty39nl/+oYy1azx4PIxFli949voDhXEyxWHSJh1Ck+c/1QuJzT2nKyCFzz6dGcEBb3qw1PGHaq4IRLjjwQoZzyuPSwtg+ywCZ/VOGJexM6g5NyE4vNP7G1r4bYDRHXv+AEwGU1vuHUkuQD9Exl8hc7yC54teVFrhFJN53Bmz/jJ+RjZBmpJfbepTBTa9HrC5xd8qs4d0pt5alZlC15cyHwmjkd39eOdwwFLbt7ZMjozBtdkXLJsAt1QbiE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4QXwKd8wxEkDknCOaTnrzbMxuwiaJH3kmaL8rTsklY=;
 b=ZSFwtQAFMoaPbJ0SFcQC+CoBNjsVjqAoD8BxvDiRLN3jIITNGlecccHfRWE35WOu6cDnC+K+en3nSn92bY8iqlYQiQX1S2vWJ4ln2n2LdOuNlzg06zXxEWrV1jO/lawTdeESvpNyyOxtsi9Xm/aEUS6qUQIIw1UyIrZhAvPwOI43G/tLGgl+pN9/rwout0xJSLdiQFuTeYqCELScadwCmM1t5Hpx1AH89cUtlEAAXDY2wMVO9Tb0z4cSv26vFXD8BdSYyUeaAGmcEoO8oepvn/ZKT2DH2mTthshjeIZlqNufjwNh14dkVLUXhY/NGPBNM9ec/F1z7xpkkPpxsPz4Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8596.namprd11.prod.outlook.com (2603:10b6:806:3b5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 02:32:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Wed, 7 Jan 2026
 02:32:03 +0000
Date: Tue, 6 Jan 2026 18:32:01 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/5] DONOTMERGE drm/pagemap: Add drm_pagemap_cpages
Message-ID: <aV3FoQYYLGtJGkj+@lstrano-desk.jf.intel.com>
References: <20260105111945.73292-1-francois.dugast@intel.com>
 <20260105111945.73292-5-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260105111945.73292-5-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0159.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8596:EE_
X-MS-Office365-Filtering-Correlation-Id: 770f7401-5b34-4902-1d30-08de4d94f12b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W/uYreXh2RDyMV+dvOi7P0iUAOvLxz/YFfJcDvmBP/kmEK5JE3uitdkmS3et?=
 =?us-ascii?Q?ALYeeQ6d9ANQT5Jehu4NEzpkD+DxUuy+bZelKDtKBVJbhwF6q6hq09SaXt59?=
 =?us-ascii?Q?qgDJ3N/xmwYqX5KzpFVYzxCpgT+qLvY1poGBHMMAnfjjgUPurIU0/w6rSToq?=
 =?us-ascii?Q?8zFEv7Q36jQpJ0EJhUXQLlrFQSDZTvqrsVHHMFtUVrB/KPl4lt7ZgcL3/kiu?=
 =?us-ascii?Q?aeQuo1PZZssE5xFQip8QrdmEL3tWxtNI/nu2QE6hpQMW5XiLrsU4hL4KqtOa?=
 =?us-ascii?Q?oTU5KphIwF1ZhZdL4pgKUdctd3p1OJIiLseKzEE/1n0UDPOBvjvuPe0LF6Ww?=
 =?us-ascii?Q?2eZ0G0+IBv96yOr+Trvm8JqNa4em8ESXUtyHQXBblhmaX4OBSjom2SzzmOMV?=
 =?us-ascii?Q?Jk9xkK662fHki7p4NIuueMlCh9PbxVP5jqHVqEItZJioJFeI9QpqLLfvPz0w?=
 =?us-ascii?Q?IBOQIJUMzF7OU7cGbYYB71ASgzn9rylC7JKEaCq411lYZ2+ZSQ/Z2iWdS/Kz?=
 =?us-ascii?Q?eIwWMp9sZgqNbFtpPocoy/21+zBo85fd7egqWnp51tWp2Y9m/DkjncMhOnyT?=
 =?us-ascii?Q?3zsUQrw4WaMkgrpfUFQo1MmP97lT4+6FGDUtesgtpzj2Ql4dtV5U8uG5ETPx?=
 =?us-ascii?Q?gck0CcdAojnxoWo5rFDSoGwdjzW9pBsglVgwc9j1k3SpPhp+2uIXG01FZdUN?=
 =?us-ascii?Q?U3myOOThZrIqQlGmZmMayszEfIfBAqMhFjzO8dhbrUHNc4bp/A/Uh/TznWNM?=
 =?us-ascii?Q?ghtvEqqFDYa1stgQUbEPuAn698F0xpz9mcZD6AAXCorU0bf472wK0xuO8G5n?=
 =?us-ascii?Q?okOQN01vUyy5+NDP0Iv7skD3OS7afzQySBO0q9exmOOTlimDL2rJyDcrOMxc?=
 =?us-ascii?Q?leztWipcqtAwvCyxPQNAcx6iAvMTshbGnmD8GxrxLjbDAiC8zkK7cBDFenLf?=
 =?us-ascii?Q?Ea8wu0oyKeR1kayrBn7/suXPFLG+0/5UJiuvxoaSIyNMPKWUuGWJILJTYBZ+?=
 =?us-ascii?Q?pviRtKRwCFj/4zeOdLw0ecaeL1fKtXSJRpcdA3Q5/W0WSODxVbT6JFb7F5Xw?=
 =?us-ascii?Q?Waar+nUMABHSuSGZM+Sg8oSy/omf7sptFv3DMncKc0PI2wsyhy7+ZmhG8HLV?=
 =?us-ascii?Q?TC/gU89CtYUpf+XyPubc1TINZcCn6Q5PtNO/EsVrjknrNAF5cbFK/UQyLIXt?=
 =?us-ascii?Q?byEjwYsQph+mihdup2rPXQTIxJziJiqAxU4avJZaK6XN11Aq9Dt4w50/Ul6l?=
 =?us-ascii?Q?OTQmt2CNqLWWHco7Z9HaQ0ZT1KLH2QTHhsyk/Gys3lig37p5obObMJCi6QlP?=
 =?us-ascii?Q?kq2+HCk7bMdl9RNSZ7UlOO0iukdd/FBh/KgDAyzyr6RZ8ODFSKpB4N3oQc/Y?=
 =?us-ascii?Q?2eLo3O68nptU0GNuPTaLEbDh/naRT8m2siabnyE4eVM04zUXcy55bg26FtwG?=
 =?us-ascii?Q?djqELRlbfethWcbiZUjXNrai/XWB58XZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WXbThyj60eXdLEONz9IFn2jRmFbeOLNbf/VP2CdUfAqfQV4s/EcHQwxuBXK4?=
 =?us-ascii?Q?/9v5slKOva+CVkLop/fERna+Uam5Mxz68l/Bm+ZZ2Ut92stXe4E/I+xFZFjx?=
 =?us-ascii?Q?kWsR0P7aFpBSvFTtE0alxoyHyoCUZldal2R1H/icuos1CRFJpfWiarOdfXnZ?=
 =?us-ascii?Q?+u+UcQKR+vxDIpmy1M0MUedTz7m+SLji91msDm9KP8cD4igd4uxUhntHtThU?=
 =?us-ascii?Q?hUIcDm82MQ19ppo7aosuCI+90VDfZAnH9OCa9MZv8agcjVYMzMXyIB+sSien?=
 =?us-ascii?Q?CEWEc7HPUfUcgwHdKKv4TfuSAtQm5ZtjAwYcQLCen2qR84+lKsGfrHqFF6ab?=
 =?us-ascii?Q?qj9Z7pfxLsn7157WcLKajF7FkjTXAF575d+qyq9gP0XpYKFr4cEIrg9Sa7dm?=
 =?us-ascii?Q?u02eAkJUhIbcBtBz8DsfpboyDCLmWlHXrMWJwu63jag4Gh7SKQU/f7qUSSOF?=
 =?us-ascii?Q?lPlWscniU0RGkupxhcBKD/O205jBLSO3bQ78tXahu/Rw0Y1Q8GLs7bgXWyzx?=
 =?us-ascii?Q?/Kxeek7vhHfrWTQs8iqFHyl4mHetbdQ/0M3cYLWyxCqqnmcNi4NJn4UWnM6N?=
 =?us-ascii?Q?+ZC5Pkjcv4a4IK4liR/PIzx/6EdYHiwbu+XZIyYrt3gljzpC/z9uALScZzkN?=
 =?us-ascii?Q?q9znFXDIvcEMx4lrUiN4iwLPV2ZgrN7lYClT69UEN++v+Lf/oQ1pkrkCIbAc?=
 =?us-ascii?Q?j5KbeSNsUyXZHCGL9VDuAYRS+uPFjvQSNZtjzerg1po/+RmvKo6DzTME2N6f?=
 =?us-ascii?Q?zuWLrYNLHNpijF97tMf2SyiV4zj25UFKAR3fFNz0arWYV3mm7JqwAao0+ye0?=
 =?us-ascii?Q?aISTEeP/WPfv7ITxiPOJthImplB2TMh9dM/GK6Qt6yvpIrLtdZuDplqGzaL2?=
 =?us-ascii?Q?Vp1Kj9o2aBEF2BR+r2JNAhIYIo9zXTiyKnMLOegHeVToR6VKStDHKqEn2TPc?=
 =?us-ascii?Q?S8/FNoyq0Gk/i/OPYHqq9OtXDo/lKUR9yZKrqTDl9voZy4DNPeFtglFPGl/D?=
 =?us-ascii?Q?k3o00WOI763GTrl4yOgN2xtlCggNd9FsAytat9jiZogeRsikfN1FXwKa2DLa?=
 =?us-ascii?Q?MUaDZDrLQhEFpk+/een+SMQg+jnT3BjEN9aUuAteCIuIuDBjvwJRrn2HQ1Gm?=
 =?us-ascii?Q?IgbifnRB4Ejf2fwWX6ywKHrfCiSEPJYYRAfSMyxgbtlZoHZUF/lOrR4ifKOE?=
 =?us-ascii?Q?mHvDeZ+Q0Pw+vnBmMg7VP1bQ9nBu7HqWCOn4iW1VMubhj2Xfxm+cOoEA3+83?=
 =?us-ascii?Q?w74O9jp32l3+iaTDE2PG5Ro3FCu0fONSWQ23piF3RBKWm9ceYa76GX90B3Wi?=
 =?us-ascii?Q?hSN5dw7yWWTtNIEy8uua5dmDRjzWVSPDSZ+l+KBCNkdtBZ5Uf7Q7WCWKAXVZ?=
 =?us-ascii?Q?iNj3MB3w34b3fG6PecTbSqXLXnxVJ3zoTaJGA94bJqT7fcCINSHcyvDuIRgH?=
 =?us-ascii?Q?1jX20Vp+/7UiBlkffuotFvkfjrez1smGVjv2tgkZKkZGs202d1N7G4kNa6UH?=
 =?us-ascii?Q?8tFZj1ek1NYvvkhHOFwbdp5rhFsqMzV09oIo4MTB1COO8uC2FCFVfxHjSqwd?=
 =?us-ascii?Q?arwQwhDmUKKtc0jPYIPd6tPW5H6RUmQukcQgUQhch5V0/0w1KVSaDWTidVUx?=
 =?us-ascii?Q?W5i+0RpuSsp/JD1LtkGdGZONfP2q5ojPc2CrkXbTF9tB6bzHJZ617L9yEaE7?=
 =?us-ascii?Q?FjretvwPGZZ73+z8NBD4qosXPGM+sfk44KH426jOgitN6Y6yVi975Aip48ua?=
 =?us-ascii?Q?eptM1a/wchC9YSD1MNnQukXia0SB1NU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 770f7401-5b34-4902-1d30-08de4d94f12b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 02:32:03.1497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/lQujnCT/eimrhbVZwOOX9AuF6GX5LcH6DTCRyzUQr8c5ciHYVPWiSLy6lyjHcTCePE/Z9nN+YkpFm0i8MB7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8596
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

On Mon, Jan 05, 2026 at 12:18:27PM +0100, Francois Dugast wrote:
> This code was written by Matt Brost. This is a placeholder until his
> patch is available.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 36 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index db3795f03aca..05e708730132 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -452,6 +452,39 @@ static int drm_pagemap_migrate_range(struct drm_pagemap_devmem *devmem,
>  	return ret;
>  }
>  
> +/**
> + * drm_pagemap_cpages() - Count collected pages
> + * @migrate_pfn: Array of migrate_pfn entries to account
> + * @npages: Number of entries in @migrate_pfn
> + *
> + * Compute the total number of minimum-sized pages represented by the
> + * collected entries in @migrate_pfn. The total is derived from the
> + * order encoded in each entry.
> + *
> + * Return: Total number of minimum-sized pages.
> + */
> +static int drm_pagemap_cpages(unsigned long *migrate_pfn, unsigned long npages)
> +{
> +	unsigned long i, cpages = 0;
> +
> +	for (i = 0; i < npages;) {
> +		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> +		struct folio *folio;
> +		unsigned int order = 0;
> +
> +		if (!page)
> +			goto next;

Actually I think on a NULL page we can check compond bit in the mpfn set
and increment by 512 too.

Matt

> +
> +		folio = page_folio(page);
> +		order = folio_order(folio);
> +		cpages += NR_PAGES(order);
> +next:
> +		i += NR_PAGES(order);
> +	}
> +
> +	return cpages;
> +}
> +
>  /**
>   * drm_pagemap_migrate_to_devmem() - Migrate a struct mm_struct range to device memory
>   * @devmem_allocation: The device memory allocation to migrate to.
> @@ -554,7 +587,8 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		goto err_free;
>  	}
>  
> -	if (migrate.cpages != npages) {
> +	if (migrate.cpages != npages &&
> +	    drm_pagemap_cpages(migrate.src, npages) != npages) {
>  		/*
>  		 * Some pages to migrate. But we want to migrate all or
>  		 * nothing. Raced or unknown device pages.
> -- 
> 2.43.0
> 
