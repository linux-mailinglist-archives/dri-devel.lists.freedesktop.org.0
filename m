Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D2CADD933
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 19:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC8B10E41F;
	Tue, 17 Jun 2025 17:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwjRESRw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB92410E06D;
 Tue, 17 Jun 2025 17:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750179829; x=1781715829;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=56oKIvrrHNPYUwAUw9SEjYxg8iAqw0A+S+Rq3YUVEZo=;
 b=XwjRESRwhmYBZL0f/IlIRZ6sXvXnmLvvdkJMcTG1JwkeyaMCDUNmDvY/
 10GyO9qP2hoQW7JhOrIO4aPUu0qAp62yfyE2jfot649JKzpD713nueWI5
 okIrT6Ztj4DIo+OkYaTTHoMLvTFbfp2uHqE1fvjyW2sdUM6Uv7Y+nmNg/
 J4AnxQCMJDmhFQI80CaKJO410rniGK0KXnpGrvdLBUBumTLV9cX7RTNRi
 BPstD14jdiZOQi4x9FMETpH+rF+SLAyP63EZk1wWOD64S+xA7pKr1duxH
 OIGHMcKM3x9DRBEuKLtwk+7EOAL+x4hm0gZ9p4u0EjFjZ/m12t4FHQkT3 A==;
X-CSE-ConnectionGUID: xL+mA81HThuPtls+4QrtGg==
X-CSE-MsgGUID: RTCq5pGSTtyO5fq73pkr0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="56181553"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="56181553"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 10:03:48 -0700
X-CSE-ConnectionGUID: 0v7t0yB1SFGZDDxRCg86Ow==
X-CSE-MsgGUID: WTgnSvgKTVCcKpdfICrmEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="149214577"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 10:03:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 10:03:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 10:03:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.74)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 10:03:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdD5qHWW4vixOhVz8vW82Lk9TbRIvrOcx58hi5xm8xyJAySw7UE83CmqqrNu41QXMtoF3BaS5BTBdfajF6jajpAkc3ljWqTZ3PT5syn9zqMNoz4Oivnx18k/+fDcNryfh68erZ+hNs8H+yVyJJWcHJJ5hW+eRN8FK6nP/r/BxARWqZcxnqcyc8hYbasOjCvUOi60zwWVTpV046D2YsNocBGNpllpb2EYUOS+3seCM8CcHG3CDNi4gK2W9/U71JPI43y7mq9D4psrn4qfbsGU3v+nTzdjHde8B6vNvic8mxndXQSLE9l00zi7J9kKdyYhcXgWenopAWXA3VHMF0k8kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0siFTFKpPLmMO0p1Y5BLhLjRmH8YKahUhLwv5Uw8U7Q=;
 b=RJx/luQIR5gLu6Wa0Y3UOGDjqrBuRQmbOt04jZki2OjwmvTUD8dyb9PBqxDpOUMraZyNdD1wiEZNzGHd75wjUtm96FhzQNwritskxXqpIPdzSvjcUGt5pF337H8egcHPNIc6Z/GMPM2aF+KP+5fR8T9+G6D99Surkp3CKbCuwx4VX4gl9+IH5CIbQPu5L6NUON6Ogx8f8scGA6QCn2Q8gl4jI/FGzhaVwWyNm5ogH78oE9y2V9XGTdcOfFSK3ynKagZPPvOdV2rCRmnHrctlnF5n0LvnrwQO3k2qEsnshAwxSsCLkeQ4ekShwnDOcsSsQ+ypjPjkG7boUZF5QS/ilA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY8PR11MB7685.namprd11.prod.outlook.com (2603:10b6:930:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 17:03:39 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 17:03:39 +0000
Date: Tue, 17 Jun 2025 10:05:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, Felix =?iso-8859-1?Q?K=FChling?=
 <felix.kuehling@amd.com>, Philip Yang <philip.yang@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v3 2/3] drm/pagemap: Add a populate_mm op
Message-ID: <aFGgS0qa2YvsB6AQ@lstrano-desk.jf.intel.com>
References: <20250613140219.87479-1-thomas.hellstrom@linux.intel.com>
 <20250613140219.87479-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613140219.87479-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0098.namprd03.prod.outlook.com
 (2603:10b6:303:b7::13) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY8PR11MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b5db0ab-3930-4918-32f2-08ddadc0e808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?wcgCNTkr3a9x3lgwWUwLY1If9hnPydW78Gm2nWpiIAxqqzH2DT/Nwn6jzi?=
 =?iso-8859-1?Q?R5KVd2IKeYl+zGUqnY30l5QUDyvvKbFNnMBx1/An/HQagXn6AjsTdVWHia?=
 =?iso-8859-1?Q?C1CvS36UvDLUm1YF5IsSDU0T+F371URWYPXHsDCizoYEQR/i1/M299+WV+?=
 =?iso-8859-1?Q?fa4WFzMJjTBi0ETmUnvE/3IOpGiaVnmcgBpCw1CTNDBG/F0g3/3MG74gHi?=
 =?iso-8859-1?Q?HUBDn2Fq/bKSjSTbI1KD51fB9wuz3BY9Kzp7RGCPsjfeIW+NKwjhyskZt3?=
 =?iso-8859-1?Q?Gd4KGthAs9sgYVQQ0yFDBAJ75ckRQBi382YMD/J8mOKuZ65aCvQdgKD0/5?=
 =?iso-8859-1?Q?D/g2L+cJfQWDkhOWU5N7NRQ4MYhvZGNJL3SCMtmCVIP/kkobheR/+A3kFp?=
 =?iso-8859-1?Q?4BeKh4ntsPFoEhtMUlRXXR00LhuQgXs+lPzKepnPrQdUZdUu5Cu47WiZ7e?=
 =?iso-8859-1?Q?qTIkk6QGMgj7XJOTpgfDg2z63T6AQQvnUFcxMxEgT/x5JMMITHRnJJm9az?=
 =?iso-8859-1?Q?zLS4IBTWCrKEKVWJyg7OboTazk3Kg9mYo1icGB70/DoTrUH/SSoFU0wg1v?=
 =?iso-8859-1?Q?ACfx1mMnGWDf3BOP4kwLMbGm6htEuUIQwBhYFUd/AF8Q5LIdc7x9sGs4gH?=
 =?iso-8859-1?Q?dAyPMJZO4TdvnBgwx6l6HSJKBDxutEzapRWMWyC4Xwlz6YjrYNrFyn7Hu4?=
 =?iso-8859-1?Q?+F104m1kQL6lCLL3JHDyEnebre4bMlemhoOihfefoxHXOgiJw+yonzbDkE?=
 =?iso-8859-1?Q?8eHL5IrkJ5npvjN7jD4Am2sqANRw/0urN2/TWHwHi4kz1ZV+3aGcGXQ8fW?=
 =?iso-8859-1?Q?Hf6Gwwh7jI3JiPGlXJuHx9na3gaAhmmaQb8t7yRhipmfhRfseanJ+6BK3d?=
 =?iso-8859-1?Q?6DG1tvZwaTdSepeGGSpCnciD2sr5OTcv1eOjyDr0EuTYPT8LsT+R0xUWLp?=
 =?iso-8859-1?Q?xZ397WMBv5pHj0aFXp/eu7M6Q3xZukNAv5yWpAhNmMpXKYkah7OmpMNMRO?=
 =?iso-8859-1?Q?mk5FuTdA3+sAKuRj0+P3WQU4u6kAx86IaNrnvT7ud4RjVD0mrfpb2v1C6t?=
 =?iso-8859-1?Q?AmmvenHqRGeoguKmR9pEojc7EjLvsJIGjY5JfxGY92kVwjWe9AhLqsUrmi?=
 =?iso-8859-1?Q?MSFbBnYwXzb1uUyRXt5cZJ1grN7URVWo/Un8pmwOSBJx53ZyphPX53+k6d?=
 =?iso-8859-1?Q?aQI+gm5GOa8pvTHgQUFLAcfliNBVdOk7SYKaUB5YAgWTdy9a37r8j9dXcn?=
 =?iso-8859-1?Q?9JN59X35n4mal0xLfe5ZwUpHo+/WBYHVo6g8IXe4rvb6FtIVmlW75FH8X+?=
 =?iso-8859-1?Q?diGmbSJZM47lWFaivQl+7lYoTklw3u8+c0xh7/cnbr3mmJ11dbb/ACXgus?=
 =?iso-8859-1?Q?qRn4uFonaTooUthmelICxBtCF8m2QG7YbxuCdsrOYRs0CH5Vs2kpVeZXXq?=
 =?iso-8859-1?Q?hzvhuoakv+wfKmehECPPSUs4G7uPU2LwKxlvfOiuhMYIq/UzdvAJBZZt8w?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?e+7GZVX1EIEzkYch7vMqe7xVv39/TyqigREGIMToy/MyCZP0EbDtDkfAv8?=
 =?iso-8859-1?Q?kkerUNO1EiBbWc2bdvNmHO0JnUuXoWxJA6NtHxmE7Qwb+LbLdFzmy0CZE+?=
 =?iso-8859-1?Q?s51gKnDIiFq7z466s4fXBd0GhjkdQusqikUl2zPUo/eOmRm1AW8SQ2YBR7?=
 =?iso-8859-1?Q?btAFchj16YWwKYhJcdJk/mmF0VB/IwOoFCcqZsqfCW/+3fIZ479I+fL7VX?=
 =?iso-8859-1?Q?4eyGAk/zJryJZkQLX8pwoR/5n0L9qYcYAC0wQQidAa/irsEA6ztpdT2ziy?=
 =?iso-8859-1?Q?kKEuMSL1aix7h67QnEfsyWpcOO8EOBrSuImelhojbIVuAzW6rKzUTPl9No?=
 =?iso-8859-1?Q?h/zmdBGMybr09krIjcLqwS91jCjh3MtwmYgXv5L+cPPu2ztciJ/0uTNyWo?=
 =?iso-8859-1?Q?j2Urvh5X94T8VW8sBKHfwI1H8uIzyKpKgqCEI5+5MlRHb6SHxs1pKZa7Ef?=
 =?iso-8859-1?Q?IdMGSYGHUb/zWyJGhSJKrAZLQ+c3TtFLMA2fAD/u90iC8yDJBFfeicI2A1?=
 =?iso-8859-1?Q?W/FUpdyybSkoCgxrc1L7+mRX3k/emzCzZ+Snt0PWqrbW8yzVYM2vLdyWjH?=
 =?iso-8859-1?Q?qr8OQH/HX234HdNwBTMkyme28GXsgn1pZrj3MGFxCbmgKYZLTiPdyMLmYQ?=
 =?iso-8859-1?Q?1yEzf9LuWhVopMFn/E47tRQBrCivKgqv1383zkSfvQofnWsx1AWmyYZVQl?=
 =?iso-8859-1?Q?bZUTUkDMPtyBxKhSL/e/MUew7hlt8rSTSEzbRjTZSU8d/k04fTump5lCYy?=
 =?iso-8859-1?Q?Sh8jFhGa3l3MARn0//O+o1s8+Rxs12Fx/HPNJPNLy1G8bIYgEdFKbkDIU5?=
 =?iso-8859-1?Q?F2p7sBPsU1FkwsmUXCayhsL5kqcqWZ0x5LcLtjdL9IpXZrB5pubOoCyFfy?=
 =?iso-8859-1?Q?ajSu4o6WtHBVlz39rTMw9iiwhAT+iXgO628kjhLZQ4PMg9ECQe2hVfWidw?=
 =?iso-8859-1?Q?K51EOw/O431P58ADY38ETM3uOCJDn+91438/kAdMBtSoVtTRA9XXoMYRJp?=
 =?iso-8859-1?Q?vbbAhBJxEtLRORU1m2vLppFXRsrPZTamdwFGmhu1Pj1I7equ3ZINgHRqQO?=
 =?iso-8859-1?Q?MNQScOTN4PVewE2Bnh37wvdMuwA/kzoNSPOGQLWzw/BgIDs3MsNBZoI75S?=
 =?iso-8859-1?Q?IzN13295vjkKkPTBhvtt4DI5ROLIWfJ1NOFfgp6tY+P+/phxbWlTnn4HXH?=
 =?iso-8859-1?Q?UFHfH4be3BfGwo8llZqstdjv7OVSofAqeTuBgwxdMBzskEzr8eWSCD1myE?=
 =?iso-8859-1?Q?Jfurexsd7Qs2q5dshyXBMyJqU0Vw/YGvcRIIGBjKqtTdrRPrwRIwHH1klM?=
 =?iso-8859-1?Q?CxW0ke9QTzPKTbwqXqiu+RHdozr+p0IbwqZ4gB1/Y+gA1V900p21LPPqKl?=
 =?iso-8859-1?Q?yMK9vFf0MqFDocy4YFr1nVms/xSrDKm2dkmC1ihDnR6dH1XekwrKmzdRd3?=
 =?iso-8859-1?Q?wwnltNSnFoFlS25gM7e/mxQOph80cO7Y5oNtonG9OnvFAcNnGC+djFpuES?=
 =?iso-8859-1?Q?TcjDyWQy+QU/kE5EcZEvVkkAiTaEiSHGzbZgW71Ln5+FxFwr+6SBrjNV2A?=
 =?iso-8859-1?Q?TzmQTpEj4OdEyLxHvLuLJuk51ID7T18OZR/b7qvjVLsqbTYjOqjuo12utX?=
 =?iso-8859-1?Q?LqTmP5d34geYCkT9Th8aEcEC7GsAGOeQlA45VgRzQzK54yEYPVTJ9JMQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5db0ab-3930-4918-32f2-08ddadc0e808
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 17:03:39.6422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyCp+yEk2AYKbh+KNQfa5lZaiiUTvJd43Bxb3cFazhkFShCZoT7hbhpVDjI8FinvXzczYOcmJnVqUIVkKLOk1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7685
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

On Fri, Jun 13, 2025 at 04:02:18PM +0200, Thomas Hellström wrote:
> Add an operation to populate a part of a drm_mm with device
> private memory. Clarify how migration using it is intended
> to work.
> 
> v3:
> - Kerneldoc fixes and updates (Matt Brost).
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1

Review is still valid on this rev.

Matt

> ---
>  drivers/gpu/drm/drm_gpusvm.c  |  7 ++--
>  drivers/gpu/drm/drm_pagemap.c | 67 ++++++++++++++++++++++++++++-------
>  include/drm/drm_pagemap.h     | 34 ++++++++++++++++++
>  3 files changed, 91 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index ef81381609de..51afc8a9704d 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -175,11 +175,8 @@
>   *		}
>   *
>   *		if (driver_migration_policy(range)) {
> - *			mmap_read_lock(mm);
> - *			devmem = driver_alloc_devmem();
> - *			err = drm_pagemap_migrate_to_devmem(devmem, gpusvm->mm, gpuva_start,
> - *                                                          gpuva_end, driver_pgmap_owner());
> - *                      mmap_read_unlock(mm);
> + *			err = drm_pagemap_populate_mm(driver_choose_drm_pagemap(),
> + *                                                    gpuva_start, gpuva_end, gpusvm->mm);
>   *			if (err)	// CPU mappings may have changed
>   *				goto retry;
>   *		}
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index b7a0e6d15aff..e4120c8db262 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -6,6 +6,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/migrate.h>
>  #include <linux/pagemap.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_pagemap.h>
>  
>  /**
> @@ -20,23 +21,30 @@
>   * system.
>   *
>   * Typically the DRM pagemap receives requests from one or more DRM GPU SVM
> - * instances to populate struct mm_struct virtual ranges with memory.
> + * instances to populate struct mm_struct virtual ranges with memory, and the
> + * migration is best effort only and may thus fail. The implementation should
> + * also handle device unbinding by blocking (return an -ENODEV) error for new
> + * population requests and after that migrate all device pages to system ram.
>   */
>  
>  /**
>   * DOC: Migration
>   *
> - * The migration support is quite simple, allowing migration between RAM and
> - * device memory at the range granularity. For example, GPU SVM currently does
> - * not support mixing RAM and device memory pages within a range. This means
> - * that upon GPU fault, the entire range can be migrated to device memory, and
> - * upon CPU fault, the entire range is migrated to RAM. Mixed RAM and device
> - * memory storage within a range could be added in the future if required.
> - *
> - * The reasoning for only supporting range granularity is as follows: it
> - * simplifies the implementation, and range sizes are driver-defined and should
> - * be relatively small.
> - *
> + * Migration granularity typically follows the GPU SVM range requests, but
> + * if there are clashes, due to races or due to the fact that multiple GPU
> + * SVM instances have different views of the ranges used, and because of that
> + * parts of a requested range is already present in the requested device memory,
> + * the implementation has a variety of options. It can fail and it can choose
> + * to populate only the part of the range that isn't already in device memory,
> + * and it can evict the range to system before trying to migrate. Ideally an
> + * implementation would just try to migrate the missing part of the range and
> + * allocate just enough memory to do so.
> + *
> + * When migrating to system memory as a response to a cpu fault or a device
> + * memory eviction request, currently a full device memory allocation is
> + * migrated back to system. Moving forward this might need improvement for
> + * situations where a single page needs bouncing between system memory and
> + * device memory due to, for example, atomic operations.
>   *
>   * Key DRM pagemap components:
>   *
> @@ -786,3 +794,38 @@ struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
>  	return zdd->devmem_allocation->dpagemap;
>  }
>  EXPORT_SYMBOL_GPL(drm_pagemap_page_to_dpagemap);
> +
> +/**
> + * drm_pagemap_populate_mm() - Populate a virtual range with device memory pages
> + * @dpagemap: Pointer to the drm_pagemap managing the device memory
> + * @start: Start of the virtual range to populate.
> + * @end: End of the virtual range to populate.
> + * @mm: Pointer to the virtual address space.
> + * @timeslice_ms: The time requested for the migrated pages to
> + * be present in the cpu memory map before migrated back.
> + *
> + * Attempt to populate a virtual range with device memory pages,
> + * clearing them or migrating data from the existing pages if necessary.
> + * The function is best effort only, and implementations may vary
> + * in how hard they try to satisfy the request.
> + *
> + * Return: %0 on success, negative error code on error. If the hardware
> + * device was removed / unbound the function will return %-ENODEV.
> + */
> +int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
> +			    unsigned long start, unsigned long end,
> +			    struct mm_struct *mm,
> +			    unsigned long timeslice_ms)
> +{
> +	int err;
> +
> +	if (!mmget_not_zero(mm))
> +		return -EFAULT;
> +	mmap_read_lock(mm);
> +	err = dpagemap->ops->populate_mm(dpagemap, start, end, mm,
> +					 timeslice_ms);
> +	mmap_read_unlock(mm);
> +	mmput(mm);
> +
> +	return err;
> +}
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index dabc9c365df4..e5f20a1235be 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -92,6 +92,35 @@ struct drm_pagemap_ops {
>  			     struct device *dev,
>  			     struct drm_pagemap_device_addr addr);
>  
> +	/**
> +	 * @populate_mm: Populate part of the mm with @dpagemap memory,
> +	 * migrating existing data.
> +	 * @dpagemap: The struct drm_pagemap managing the memory.
> +	 * @start: The virtual start address in @mm
> +	 * @end: The virtual end address in @mm
> +	 * @mm: Pointer to a live mm. The caller must have an mmget()
> +	 * reference.
> +	 *
> +	 * The caller will have the mm lock at least in read mode.
> +	 * Note that there is no guarantee that the memory is resident
> +	 * after the function returns, it's best effort only.
> +	 * When the mm is not using the memory anymore,
> +	 * it will be released. The struct drm_pagemap might have a
> +	 * mechanism in place to reclaim the memory and the data will
> +	 * then be migrated. Typically to system memory.
> +	 * The implementation should hold sufficient runtime power-
> +	 * references while pages are used in an address space and
> +	 * should ideally guard against hardware device unbind in
> +	 * a way such that device pages are migrated back to system
> +	 * followed by device page removal. The implementation should
> +	 * return -ENODEV after device removal.
> +	 *
> +	 * Return: 0 if successful. Negative error code on error.
> +	 */
> +	int (*populate_mm)(struct drm_pagemap *dpagemap,
> +			   unsigned long start, unsigned long end,
> +			   struct mm_struct *mm,
> +			   unsigned long timeslice_ms);
>  };
>  
>  /**
> @@ -205,4 +234,9 @@ void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
>  			     const struct drm_pagemap_devmem_ops *ops,
>  			     struct drm_pagemap *dpagemap, size_t size);
>  
> +int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
> +			    unsigned long start, unsigned long end,
> +			    struct mm_struct *mm,
> +			    unsigned long timeslice_ms);
> +
>  #endif
> -- 
> 2.49.0
> 
