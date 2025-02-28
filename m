Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D0BA48F65
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 04:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287AE10EBE6;
	Fri, 28 Feb 2025 03:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VyGJwKX1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFED910EBE4;
 Fri, 28 Feb 2025 03:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740713650; x=1772249650;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eJ2cQ1NcgDo/cXk3C62YTx0/Hfuh5SIcyremy9jeM4U=;
 b=VyGJwKX18XSascDLRB370WbpzcX/RTXRKU+fz2Vf4auNETYq5GmML1fO
 X1dd6XsiUaoJ/Z5jJrlZNBPyMw0cnmcBJeFKypMZjvgTlsF82Gt4Yzjz8
 CoP+n9ISKMUdV0JomNka5hIJlSWUor1LLK4aCBCn7AZi0bQb2b8Gr9umG
 IoHClihzm/H3dHb782nWv31REyL3pmoWNdG7RwgEtoPqqP/SF7CVBJJlU
 /lbzQ7sWsqpC3pOV/xWc0OoDLvX2aM4laM7s0R0h0PsGiHArI2t0VFISd
 3AZH2yJldXGg/GR5wzbYwz8wVaSW1KimFGEoqgaYnCxVTYjIgOYpWh/i9 w==;
X-CSE-ConnectionGUID: 5CckF7OGSm+tw259LjcjUQ==
X-CSE-MsgGUID: vtD95u8FR/mjmnaGC5TETQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41515148"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="41515148"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 19:34:07 -0800
X-CSE-ConnectionGUID: uBfPzOORTH+yzgeq4ter/A==
X-CSE-MsgGUID: R66LwUo9QxiWSVKidV3ysg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122446335"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 19:34:07 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Feb 2025 19:34:06 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 19:34:06 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 19:33:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzBly9OlwOsglpIu3XyrIhDQZUnmDJmiaIoIpFB+fvqF9P/VfJla8Iv+fjXrcEAFT5HpHu2D/eDVLCNfrvRBdGy3ZXgQBVxfOpZjhno9MtxHOdwU4Qk7alRNkGPXpYRpiUXdW3pwEOYCOlYd+Pt8EW5PIKB078KzWHCtsrvclfdgYcXcGWGM9vWO3co9HuCkKyHx6GIgnVHRyh8kGoUhxdLgh6Go6qKtuaZXXWXPjuyDLvBnJhona0uyIqB9syiuhpYSF1zS0QfM8vmXuyltv/GV6re8azlqHOKSi40njWCuUN5sBuOk6rz0tpBFfSUFn+jZmr3nvPLfK6Tl+tscaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LY9PjCL7wtUftUxPR6DfFH8v2j2kNKn7YGpTSRDKA78=;
 b=xy/5kbgsBwx7A0s43qgJiV0jmthmv9z8NveIGLpp68pdmAyUm0CoKd6M2vdvY0MpwTLfhR+lXas/jpw9jYXbIyWSxfJkudbH9yrlNTJV1NFUWr9ePBCPAoziksxD0NBrjDghAameiYwtZ+oGx5+9JbvxKToIxWBgGTKok5+hPMTxCtXoW9DxbEfjKss7IQMASo2cKBiL0vouwllp22stQO4jur91ynRuotwRMhke62wei7hkTiUMjoIAu0nhhva1o+RLb/s1W8iUh3yNfR62mixeXzkOqO/A9KsWvOUPP/leO68nBwgMPmczKAcXh9ig+IucaV/eUqoNm87JHKfYCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8466.namprd11.prod.outlook.com (2603:10b6:610:1ae::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 03:33:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 03:33:49 +0000
Date: Thu, 27 Feb 2025 19:34:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Mistat, Tomasz" <tomasz.mistat@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Gupta, saurabhg"
 <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>, "Zhang,
 Jianxun" <jianxun.zhang@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Message-ID: <Z8Eu3SqxBRiBtQ5B@lstrano-desk.jf.intel.com>
References: <20250226225557.133076-1-jonathan.cavitt@intel.com>
 <20250226225557.133076-7-jonathan.cavitt@intel.com>
 <Z8Ahdyn0KgfmE9M6@lstrano-desk.jf.intel.com>
 <CH0PR11MB5444E8B7371E3DE4708E1733E5CD2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444E8B7371E3DE4708E1733E5CD2@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW2PR16CA0001.namprd16.prod.outlook.com (2603:10b6:907::14)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8466:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e897610-ec3e-46a2-f828-08dd57a8b6d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IJ/UcXyk3gK+d4ePqIFtlnux+WoRkvV5oQT/A73J2nY2fK5hdMmcC5yTLlsm?=
 =?us-ascii?Q?YhPdRhTFuVF3jH9NIKLpO5jMxHkHqslw8jraY5qdr0gJ8kQLtcGwoQJrgJBr?=
 =?us-ascii?Q?6hWfT6CF5t+sW1peCNdnr9aMCBpTMQoFjcn8mbVjJ7Be87S5Fujb4B8p/1+W?=
 =?us-ascii?Q?hPttafcJSDwXiAVDotJZQcw53hXbAJI+jyrtzGKrFuAE6aZ90HAPKhEx50U2?=
 =?us-ascii?Q?qZiyl2KdSPyB13IqnOqO9Q4qu1GCbSyXZNEnYWO5NuSBuRKZvlIbgLd69+gN?=
 =?us-ascii?Q?bZ9fec9Xp7rDvuO99pX81BYPIMjud09Q7ZopYHJLsdLAzhRicIWqzR6xHCuQ?=
 =?us-ascii?Q?2kLaAzExJZIcTp0OoD0+3vwO0UvCUHiTV2ihACFpJj0CLKFCBIq2tNvlFzG/?=
 =?us-ascii?Q?ChA6wf5NZizOAt4j3QHuN+kslroMGYXCGhg+1QDogkAzA8faDvzm8OrXI1vT?=
 =?us-ascii?Q?mRTjpwJz+nfWyPSDtKxbBj+59NaEahm03OVASmq2mlr7mY229ZS6t3lg4SSP?=
 =?us-ascii?Q?zLNO1kWog21ledx4QOjWY3xw6iPwI2ATaC9pxD4hRPRzExN2ZyG12PquoBSM?=
 =?us-ascii?Q?If+fIuCPK52JvBVIC30YFjPlc/nbK70OTetdUpwtkN+nSDtuut2gpgyDau6W?=
 =?us-ascii?Q?hd6rZFgsIRFsZpYnqY58vtZcQCfy2QbHjX1YmW4TzhemeL1SlUoOpHZQ2eSr?=
 =?us-ascii?Q?ig27wbAVzPl96wMrVnmhfQ+Jz+HNIZiJL9qA5wL5b64CS5f8BTH6HW/1pl+k?=
 =?us-ascii?Q?AFo7q/t+H5wXvEjW0p50kP9U+e2YlAqx7lcSXqa8z4gh+Z8awCRpi78m0luk?=
 =?us-ascii?Q?8+BekMCWMvldU+jLpM42iaczXs61AvhXM/yBHkvRjhIcDVBtzX4GdYjb689M?=
 =?us-ascii?Q?f1HoYsfIFImixWdbKmsHjp0P0y7Lhq7eno/1pnYDrkzkcgooPUlLc4RdKPvC?=
 =?us-ascii?Q?QgGVjKnRY0Y3bYTqagwyJkoYUiwzEMMSBELwQT/e+JzPx8TSDaW9XvuFUWMb?=
 =?us-ascii?Q?8s00LsNHPbhg4BHptjvO1pOMtmmlPTUa3a3eYPiB4G6/ItyEmrXXXWsUon9t?=
 =?us-ascii?Q?PJAvgYcctrhj9PsyCXMKt31t2ukLEdUnQlRhRCSgVBdiHGhS+1+Wnsvr6BpM?=
 =?us-ascii?Q?UQnqONririY55uFh8qQu5YyI4kwC6aB51NDvJjLheCrqLsaDgI9+3LO9yjLY?=
 =?us-ascii?Q?0ZvtyYP1T2iXqMxbLPO112g5wOsHvvd5GtmnpA56oWkLs/D7yKoMeOApYIwX?=
 =?us-ascii?Q?lV9ltYmkh48kqNsK8pS4elj6qbgQUjUikAuyyCSextW3y+q0InUTBPURMJ+w?=
 =?us-ascii?Q?Hc45IsLry693tDGj81YDb3828Vd0hC3GoqFaFyL5gJURUA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l5fOYpQEFmmioFYGBlzrbPbtIwmO4wSC9JipNSSFRCHPNnB+21sjFk1IdHz+?=
 =?us-ascii?Q?TpZRUL8HZdSj0O8gy6BVCnQAncRlEiQfgQiN1wNQGf2eneZ/P234lFUcFMBb?=
 =?us-ascii?Q?gyxsxsiDXqRzL3eCjVJboNE6oHFlMz0o1SN+MXR/PeZLhhchWR7gzbvsSRHV?=
 =?us-ascii?Q?CisIiGwziZDjpeywyD7z26owre8ZDfIgyRo3yMpMrMz7GQQgOI7B6qezGwtI?=
 =?us-ascii?Q?Mkz/YOaixMmQF2cGtlz6NmISVYnWird2OzYZO3CagH1dvbBTisMdTKxoLzFe?=
 =?us-ascii?Q?5Q30b7CmackzIh7gV5xrntzpC8B5ULDj9oZ7+AG5+CBA5lIhirPe3W8AOAQT?=
 =?us-ascii?Q?Tsxmt+wLVP8i6f7pXWnt5b8BSaLoX3YpXU96K8hXGMAQLCnhImKfUotrZ/nC?=
 =?us-ascii?Q?ymYXAGvm0V0DE58mBOInQuywAOTGiOXikyzxuXPZo9YZCUa5lDOiJF6JG7tc?=
 =?us-ascii?Q?tFfHpyC1PbSjd7TsPfhTl+PuNwSSgTQYKm4X4LZnvi9sqzqa1eyAYtwcsba+?=
 =?us-ascii?Q?E7CVQ9g2PRlQyxd7Qt7yBTqisRELfHpcQ4+tjo/03WrK44TVJHgCzAS2XGbS?=
 =?us-ascii?Q?d4KExkithBsW7GWUdD4xVWRRPso/dNosO1cb17DmdPj9UeSlxjh/N6vUNoLQ?=
 =?us-ascii?Q?CaSyOO/t/FqckxdxjD85YL23jsl+C9HoAFSPU1+JMSzHTQKUJAzsZ/4FHguH?=
 =?us-ascii?Q?VE5jl0jE9o393VlwlKr4F8FvVaPMyJZwHUo/T+QzSuczD+vySf17fHrA7Y6n?=
 =?us-ascii?Q?k9emHAsXZJHNUOLOFlhETB4pUdasJB0+1tKM3H7duHkrwEQzSmcN052OUcyL?=
 =?us-ascii?Q?lKM8i+mqUiwFqVqMgpvGw+YgXo1U5fhvA8Ib0500oMJRT84XJPb7OL+J4uQ9?=
 =?us-ascii?Q?8Ujd5Zw3DhJgVbMP86/eEqCYDQlX6pfixT1zfjNn+be6lUdsM51QypKctt3L?=
 =?us-ascii?Q?jyoflUJ1O72h8XBTKeZGYc6Ai23fDuC+Ug+uGvZPawiMWD4fytmWvrarMWKx?=
 =?us-ascii?Q?h0JiI+a2d6TQVAXgjoMvojCxrRvHRO3YSXwKSoJhlPF3dOn+3f/6uyuBahn2?=
 =?us-ascii?Q?y5Ls6LEQLWZZC6fyUvOTd2YatVhitFzPrl8BRAP9h/5GamKwNSv8g2bIkC+6?=
 =?us-ascii?Q?rl7d0wtyLI8a4a/pVZ5MKQ8cbknK9LKN3K1v/ynhOQo08h8DDXv0isqrcN8R?=
 =?us-ascii?Q?PYj4+uk0dXklGj3t0JNYPDnqJ9WlUPgoit3h1/VuHraRuAtj8yFy8p+cf2mF?=
 =?us-ascii?Q?kSi29d/5DahyUDcggD7A7/zX8sVgbaEhbA2tigKLcMvwcycx+tSTeQSLYUFl?=
 =?us-ascii?Q?w6qaH625VhBMGGG3DRX0bEnGfxGQJzfFRWKRzLbFIptRB4Y3PYblkpZ3llAd?=
 =?us-ascii?Q?EM/7YG/ld0om6LiVYsNG88rWwfAa44tn66sGTXDY3LLW1nXUGG1naC59umls?=
 =?us-ascii?Q?4z/KtDqfPw99ObP9L3FCek1KnVyPZysGdP29WeqctkVd26pOWZlcCtOMzgcU?=
 =?us-ascii?Q?dMfJxjUFvbx5Kuu9SLxyfHbLCo/BIQFZcrDYH0+GtA/LlvMHL5YaG5z0wObX?=
 =?us-ascii?Q?D2TzqhDpfsZF2ure7+8MPvCLlotUhlH53EjVz3IEUYL4Gig9WgK8efwBwY1s?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e897610-ec3e-46a2-f828-08dd57a8b6d1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 03:33:49.1387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wp+EHNQSCIjZXSHHPnvz+YocIwofFCwG54wYxsRIQ5bsZ4I1JKidGsNxDMBh/Tt0ztHTDfkEmT3iA6l0broxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8466
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

On Thu, Feb 27, 2025 at 09:51:15AM -0700, Cavitt, Jonathan wrote:
> Some responses below.  If I skip over anything, just assume that I'm taking the request
> into consideration and that it will be fixed for version 2 of this patch series.
> 
> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com> 
> Sent: Thursday, February 27, 2025 12:25 AM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Zhang, Jianxun <jianxun.zhang@intel.com>; dri-devel@lists.freedesktop.org
> Subject: Re: [PATCH 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
> > 
> > On Wed, Feb 26, 2025 at 10:55:56PM +0000, Jonathan Cavitt wrote:
> > > Add support for userspace to get various properties from a specified VM.
> > > The currently supported properties are:
> > > 
> > > - The number of engine resets the VM has observed
> > > - The number of exec queue bans the VM has observed, up to the last 50
> > >   relevant ones, and how many of those were caused by faults.
> > > 
> > > The latter request also includes information on the exec queue bans,
> > > such as the ID of the banned exec queue, whether the ban was caused by a
> > > pagefault or not, and the address and address type of the associated
> > > fault (if one exists).
> > > 
> > 
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> [...]
> > 
> > > +
> > > +struct drm_xe_ban {
> > > +	/** @exec_queue_id: ID of banned exec queue */
> > > +	__u32 exec_queue_id;
> > 
> > I don't think we can reliably associate a page fault with an
> > exec_queue_id at the moment, given my above statement about having to
> > capture all state at the time of the page fault. Maybe we could with
> > some tricks between the page fault and the IOMMU CAT error G2H?
> > Regardless, let's ask the UMD we are targeting [1] if this information
> > would be helpful. It would seemingly have to be vendor-specific
> > information, not part of the generic Vk information.
> > 
> > Additionally, it might be good to ask what other vendor-specific
> > information, if any, we'd need here based on what the current page fault
> > interface supports.
> > 
> > [1] https://registry.khronos.org/vulkan/specs/latest/man/html/VK_EXT_device_fault.html
> 
> The original request was something along the lines of having a mirror of the
> DRM_IOCTL_I915_GET_RESET_STATS on XeKMD.  Those reset stats contain
> information on the "context" ID, which maps to the exec queue ID on XeKMD.
> 
> Even if we can't reasonably blame a pagefault on a particular exec queue, in
> order to match the request correctly, this information needs to be returned.
> 
> The I915 reset stats also contain information on the number of observed engine
> resets, so that needs to be returned as well.
> 
> @joonas.lahtinen@linux.intel.com can provide more details.  Or maybe
> @Mistat, Tomasz .
> 

You haven't really answered my question here or below where you say see
above. We a need UMD use case posted with any uAPI changes before
merging uAPI changes. I know the above Vk extension is going to be
implemented on top of this series but it is very unclear where the
number of resets requirement / UMD use case is coming from which makes
it impossible to review. 

Again I suggest focusing on the Vk use case first or go talk to our UMD
partners and figure out exactly why something similar to
DRM_IOCTL_I915_GET_RESET_STATS is required in Xe. I have made similar
comments on VLK-69424.

Matt

> > 
> > > +	/** @faulted: Whether or not the ban has an associated pagefault.  0 is no, 1 is yes */
> > > +	__u32 faulted;
> > > +	/** @address: Address of the fault, if relevant */
> > > +	__u64 address;
> > > +	/** @address_type: enum drm_xe_fault_address_type, if relevant */
> > > +	__u32 address_type;
> > 
> > We likely need a fault_size field to support VkDeviceSize
> > addressPrecision; as defined here [2]. I believe we can extract this
> > information from pagefault.fault_level.
> > 
> > [2] https://registry.khronos.org/vulkan/specs/latest/man/html/VkDeviceFaultAddressInfoEXT.html
> 
> I can add this field as a prototype, though it will always return SZ_4K until we
> can have a longer discussion on how to map between the fault_level and the
> fault_size.
> 
> > 
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +	/** @reserved: MBZ */
> > > +	__u64 reserved[3];
> > > +};
> > > +
> > > +struct drm_xe_faults {
> > > +	/** @num_faults: Number of faults observed on the VM */
> > > +	__u32 num_faults;
> > > +	/** @num_bans: Number of bans observed on the VM */
> > > +	__u32 num_bans;
> > 
> > I don't think num_bans and num_faults really provide any benefit for
> > supporting [1]. The requirement for [1] is device faults-nothing more.
> > With that in mind, I'd lean toward an array of a single structure
> > (returned in drm_xe_vm_get_property.data, number of faults can be
> > inferred from the returned size) reporting all faults, with each entry
> > containing all the fault information. If another use case arises for
> > reporting all banned queues, we can add a property for that.
> 
> I'm fairly certain the full ban list was directly requested, but I can break
> it into a third query at least.
> 
> Also, the abstraction is done here because that's how copy_from_user
> has historically been used.  I'd rather not experiment with trying to
> copy_from_user a structure array and bungling it, but I guess I can give
> it a try at least...
> 
> > 
> > > +	/** @reserved: MBZ */
> > > +	__u64 reserved[2];
> > > +	/** @list: Dynamic sized array of drm_xe_ban bans */
> > > +	struct drm_xe_ban list[];
> > 
> > list[0] would be the prefered way.
> 
> That is not how dynamic arrays are handled for
> struct drm_xe_query_engines,
> struct drm_xe_query_mem_regions,
> struct drm_xe_query_config,
> struct drm_xe_query_gt_list,
> struct drm_xe_query_topology_mask,
> struct drm_xe_oa_unit,
> or
> struct drm_xe_query_oa_units
> 
> > 
> > > +};
> > > +
> > > +/**
> > > + * struct drm_xe_vm_get_property - Input of &DRM_IOCTL_XE_VM_GET_PROPERTY
> > > + *
> > > + * The user provides a VM ID and a property to query to this ioctl,
> > > + * and the ioctl returns the size of the return value.  Calling the
> > > + * ioctl again with memory reserved for the data will save the
> > > + * requested property data to the data pointer.
> > > + *
> > > + * The valid properties are:
> > > + *  - %DRM_XE_VM_GET_PROPERTY_FAULTS : Property is a drm_xe_faults struct of dynamic size
> > > + *  - %DRM_XE_VM_GET_PROPERTY_NUM_RESETS: Property is a scalar
> > 
> > We need to consider where the number of resets requirement is coming
> > from. As far as I know, the Vk extension [1] we are targeting does not
> > need this information. I'm unsure about the compute UMD requirements at
> > the moment, so let's focus on supporting the Vk extension first.
> > 
> > Any uAPI must also have a UMD component, so focusing on one issue at a
> > time makes sense.
> 
> See first reply.
> -Jonathan Cavitt
> 
> > 
> > > + */
> > > +struct drm_xe_vm_get_property {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	/** @vm_id: The ID of the VM to query the properties of */
> > > +	__u32 vm_id;
> > > +
> > > +#define DRM_XE_VM_GET_PROPERTY_FAULTS		0
> > > +#define DRM_XE_VM_GET_PROPERTY_NUM_RESETS	1
> > > +	/** @property: The property to get */
> > > +	__u32 property;
> > > +
> > > +	/** @size: Size of returned property @data */
> > > +	__u32 size;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	/** @reserved: MBZ */
> > > +	__u64 reserved[2];
> > 
> > I'd put the reserved bits at the end.
> > 
> > > +
> > > +	/** @data: Pointer storing return data */
> > > +	__u64 data;
> > 
> > union {
> > 	__u64 data;
> > 	__u64 ptr;
> > };
> > 
> > We would simply return 'data' for properties that fit in a u64 and
> > perform the size=0, return size process for properties that require a
> > user allocation.
> > 
> > This may not be relevant at the moment if we drop
> > DRM_XE_VM_GET_PROPERTY_NUM_RESET.
> > 
> > Matt
> > 
> > > +};
> > > +
> > >  /**
> > >   * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
> > >   *
> > > -- 
> > > 2.43.0
> > > 
> > 
