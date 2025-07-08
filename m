Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 399D1AFD70E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 21:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF3E10E1C5;
	Tue,  8 Jul 2025 19:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D9LOT1dT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8DF10E1BB;
 Tue,  8 Jul 2025 19:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752002613; x=1783538613;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=keZjD31V9KPH3jTtXvewHfZSOwthCDX3OuwjWP2NgrI=;
 b=D9LOT1dTYvfUWH73N/uQCWwwZ7Xf5I9iSTp2jjt3aXV8jQB69iYzjKpW
 0zGchY/pCZjOBJcl6TDGXuWZ/P0eS285HW5G0UAqF3vWxYZ4fqvsvGIM4
 tugWeq0Vud+7xgJrYW3qrjOrA5VBsD0bn3VrOg1mrMDq4jLw5CPBwtszU
 PMiRv8Mnf7aRqhP02LV1BxY6P0eOF7sPCec1F7GFMjAy9ny7c5oN6Y+K4
 PydkpLTHzjyx/g+Ry/I/geHpRbfBhtQg5rUIG64qQcVSIMJSi4llz/ElH
 HqiKh6p7MbMzl6bWgx/v4DRfv9bKOwRuesnMGA+25C3ZpyqqtALXQXu1b A==;
X-CSE-ConnectionGUID: K7LK8dzDSxGXel71Gd8xsw==
X-CSE-MsgGUID: UjV2Xs3bTgWXdX6eWnZJFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64949106"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="64949106"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 12:23:32 -0700
X-CSE-ConnectionGUID: DjiaeadtSLabDNl72pNrKQ==
X-CSE-MsgGUID: r5vf1ut1Se2SBSfT36OmQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="159610717"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 12:23:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 12:23:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 12:23:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.68)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 12:23:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uv2+52DWzj9z63Sj/P5p67PEmu4TwaMKeWaoZ34UZP+RJ9uZVVymeudu/6q9SQK8nMxpP1JfhlZb94B5TSdt38CINKY/gSB0AO1G959NoiAtWQN+KgNOMU/ABbwX9lLilP4Wnk3/FHo+wX8YWnnrTUgw5Ut2ZL063tf1Ls0UotbLhXkewNOWopF65/2eSUZuxZthu8xu8auHCroxfglK+vWRKzZALUfvOb1ttaU7o5ssaJDDnLYVRM7sg+Ce3faWe0cvAUrLrCZhkvcSecrkap4MMV5nJ+SEk5ISCRnBkbrRKmFD80hX2TOqG5iXbIdjFK6sMHQphuI0HH4UgiXP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBCxccjlOrvAeK3qPRRi31hWBHzALcf/nJBY5eZqJf4=;
 b=INfc0HFfCZ7xlmnXO2h3jxssuseQrXh3eFXcYKiHRdttNvdkm3czOH2S8xjByB36CqDBaGScQ4bZIqaai5sqOBnmGq+/B3J6tVa8Nd0/0fwJQuKRtHy9f81a2qxG4U7Eovm7o4mIwio/vdUDyX8cQYE08nWTaXdXc/FSthGGPKA/KY8CnAHlvxilES1TSjQ3JQJkuwUJha5rBrE+73nrMoCs7az3B44CXE7JBCDMx3gOe6UxNwkRkxLtzNgYdWB/ZaJGx87+hF7E/8np6W0b680RHxEwR/jyWOLY3fvaQXGIJrrXI48fdJnqu8jehUEOifQrZ6XUyu6UySp32Xr7GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW6PR11MB8438.namprd11.prod.outlook.com (2603:10b6:303:241::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 19:23:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Tue, 8 Jul 2025
 19:23:15 +0000
Date: Tue, 8 Jul 2025 12:24:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <kernel-dev@igalia.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH] drm/sched: Consolidate drm_sched_rq_select_entity_rr
Message-ID: <aG1wiiEYB9WIHSvv@lstrano-desk.jf.intel.com>
References: <20250708122121.75689-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250708122121.75689-1-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4PR04CA0294.namprd04.prod.outlook.com
 (2603:10b6:303:89::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW6PR11MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b42681f-3ce2-4898-0570-08ddbe54e2fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Dkdz4UD4FjdDyaNBVqD2yZ/iiuap7Frd3V5YfccVIXWWwmJxZY9Dw9pxoJ?=
 =?iso-8859-1?Q?xsT5WerZaAPN5MCJW8dTtyFdy3NDyeoCaz5N8AMMV3YIPx9BCNbXpY10th?=
 =?iso-8859-1?Q?jqqIxOSSFwSq7wN/F9/6/POGPYgjTbrCiCdYOxIyv/zo8JHqLwn0MaJkDJ?=
 =?iso-8859-1?Q?dozPLaXMNEv7C1VeQVa96xN+yFNXZh+FstlooVLpaZo+LxQ2alWCi85aVp?=
 =?iso-8859-1?Q?QPvWKJjJuvvGCIEAYZ6t6RWxxvg8jirIsZDVd3c6EN+5nUokGcuE3i+BrU?=
 =?iso-8859-1?Q?J9FZEoweFQ8RJ3KaSTXTs9W6coGnVbBNWyjueE6JJ4t97NAwmF2/VPt6vM?=
 =?iso-8859-1?Q?rvWFB2DSBMrKjIGl6hb26X7rQNTFmWXVLjJsvpmwCxWtNgpwHjRxcfzB0F?=
 =?iso-8859-1?Q?1HQiHlVu4mzEGJt2w7NodHahTC9sjJwcOSv90jUfcmU8dFnE/QQuMYXFFw?=
 =?iso-8859-1?Q?zzn1leBsyJjqJ28jYlhXfVePET/aRh6b1Q1Y1XgwSWVXvQNCGYD9ZnDb4A?=
 =?iso-8859-1?Q?XoK5WI4AId6gEuh0alZWufZhyz0ryZ+H++ELApUIlAcTPYKkok+F+JjdK5?=
 =?iso-8859-1?Q?fgO58uQo7xOqb611hMj+MGAIztZivi4NmUQzk9EpmZT+5fPaHu4lf4koH2?=
 =?iso-8859-1?Q?0/mxykk471KqjgU9nAHhAQm+QUYUb/E7bvK+X3x9ekoVBPhHeAsn5Y32DY?=
 =?iso-8859-1?Q?5wz8lcpx41CYiS/E2/7sXERfMeSR60I6VwQZxunu+7MiYoOb9umWa82f4d?=
 =?iso-8859-1?Q?q2lPfKPZt/OFSPHksBgpSAhfxewyDRs6Vn7qtGK5ceZqO6PolC/ca9kpBX?=
 =?iso-8859-1?Q?EMEIrPwMlAqeQ6Nv3mD2U95Z44mYL/JuoNmwyUidd27NiQzLf/sRbvITPj?=
 =?iso-8859-1?Q?rA/nCVmoJl57wn8G8EBDWyWDJ51CaLZWCaH4cQj3M1LXpULaIlvEoCowVO?=
 =?iso-8859-1?Q?HETXANrqlMxf8//na8RmK7VA5DyXAJdZ/DdGaCAo3Ipd0SxhUcdGMkuF3m?=
 =?iso-8859-1?Q?7wHo94hFiexVa8BHYZ0GYABAqQH6jbUckWLDmpvwmpUO67UGyYLtTnQdse?=
 =?iso-8859-1?Q?83CV2gXmiD9nhjIKs+OulOQAn/sQLC9SCz6fjlvaZ5Nvksp+edxKuqz3g+?=
 =?iso-8859-1?Q?fbVrXp1HePfKC8uonOzne0gC1yozxsEggeafY4SD+E4bwjTjwkPVXsfJvb?=
 =?iso-8859-1?Q?ll8268W36gTahDNaGgF7AgbDuM1SVDO8LhGMeLJDSGX1VBgceZqF3+Oy7E?=
 =?iso-8859-1?Q?nKKUGTNO31TEmqyXPiBXf338vGo7XYEz9f2IV5BRKpyKbDJR3g0cB5gzF3?=
 =?iso-8859-1?Q?Em8Om5irFS8aLIvjAZpNUFBAlx3wQgl8O6FXq352UeGX4Qex0W/n3c6WCE?=
 =?iso-8859-1?Q?oO820sDoLHoFZLVr/r/YKKx+fyNvDYDTFaRRXp+aUIbYTMg+9BPG1grFYM?=
 =?iso-8859-1?Q?fybuEmQ+a+fv4uyDnUDqJ8tja7r7oXX3+E+PzJz7StFdL0Zqpedyq6nfBI?=
 =?iso-8859-1?Q?Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?34AQVp4cajqxhKoJikbMsYpf7wF1BKLNOuQRaSfAZk/qQ3+0kFaiv+5GU1?=
 =?iso-8859-1?Q?yuRexbpq4KrqFLZVX2QZJ3LQ3BNutOPFnsRhapTNf548hFD0MNccgUrgfn?=
 =?iso-8859-1?Q?gvbdltq42qIwYr/UmVCsIXyTZLSkwvGWBQ5iDCT+4iGLScBjpcRdQTURoZ?=
 =?iso-8859-1?Q?F1/lIwKacT6pCYLSz8wdefkMK49SB2TrgmtuiHnoJYRBKDM0fAwlcN9uPr?=
 =?iso-8859-1?Q?OdOSQ3D747HB5ceu76XbWx1wL2JU1a0h/35zstVVdX65fNNIS4JuxdJPzO?=
 =?iso-8859-1?Q?H96VOqPJu6Cx5Sc5lgY/VVqzacTpJbUq+qRUeUMcAYCANdSznfw+AHTUbm?=
 =?iso-8859-1?Q?45ImaRxz3KpDaRQjU6bhuYowrEoY3Us0eZ0rAftiHKTE670X3e79UnCqiK?=
 =?iso-8859-1?Q?2SoFPOUNxXS18dhnZ2wOu7ffrumZ692TOfL2uj9dZzaa1smqRQjnyeRVe0?=
 =?iso-8859-1?Q?nCR29oEw180qfsjkhLWiJKsAzx9hlO1ws/NhcgDx7k1eOo7v1V5dbFaa/z?=
 =?iso-8859-1?Q?3UYqxK31qt/+IBNi1F1nQu2eUnDyv9iGY6Locn0i9pmt8uMeuUiUwwg6wQ?=
 =?iso-8859-1?Q?E98lnLm63+aIIC0c+581bSYe9IR2aMox5k2/haiExF++I7gVvIh7v3zJxh?=
 =?iso-8859-1?Q?MqSFbam3d6H9OIw/jgA28eMO1Xz7AJh/twYYOVtFfqvbPsfTbkHt/kB73I?=
 =?iso-8859-1?Q?f/MhHz+3LVdQ9IugBSMaKtmAYOltbrocLl/q01D7dn8tEgVaY/SWBr4HGf?=
 =?iso-8859-1?Q?i1G0SE/BYMD2ThBTUjFD2yGCq6QJ3MIbfPSiqFcQ6Epk+aROC3IH0CsV9K?=
 =?iso-8859-1?Q?+0PzD4+Bahlw0oEnevIrPG3Ex8lmkZAPo27BebSir+h8vLmigJWwZBXo29?=
 =?iso-8859-1?Q?55UjcnAoaIJ+QBD9flLr8QWo0QiY3SZiyK2zLAlk/YOKDu95SPEQXXxP9O?=
 =?iso-8859-1?Q?gGxw3In+IXFR7JdtMftDHYQg37GT/vYGj64NmLm5jtLe7HYjViiHHVW19a?=
 =?iso-8859-1?Q?mclcrlvajEalVTO6tOsdlYdzDMzZWmrYMvDFqkg/SDzYRYCNWrxHSxoJVJ?=
 =?iso-8859-1?Q?2OmJDqE+/RbtQrx3ybmYqSyQfBEcrTYx77LunLkgMcDURlp5QfKPz4DFJG?=
 =?iso-8859-1?Q?QLK2vF7exDd0EyrNiDNoJt5jv5MYoXjqsGgxvF0QAOMhBOzZUOeo2txMzN?=
 =?iso-8859-1?Q?XPAHmrkUCE1pam+83eEweSfudcrSA2Fq+sz3d0eFHWtE28Q0GKrZXGLjqN?=
 =?iso-8859-1?Q?ccVDvdjrofWV9KyzHIfe6GV+SoPhL/gwrN9LqcQ8dwbpT2aEgJ4mAS3In9?=
 =?iso-8859-1?Q?bvR0fi0gBE95BxLoeLScTjFFmEF5866Do1LPmHOyQruVMF/utVkdOLkalQ?=
 =?iso-8859-1?Q?TTSi9KyzajAJZ2D7Fgc1srnKHxLKcghLt4hkVwwPC1NeZ/fmxlfNAf2XnA?=
 =?iso-8859-1?Q?SLZvcV6p/M8aCk7iq/uQx2xbMx2WT6v3yI2yX6Tjv+yfR6Lv11kgQ+xX0+?=
 =?iso-8859-1?Q?6t2DiCYC04dGTPwVacJAg1k9gAI9Y5H7MXcVcGUFMpunWwjdu9c+q5/w1I?=
 =?iso-8859-1?Q?k57mRbMsCnIjkEW7vvPY0GfWoOiyhIAXD1nI4CijXLZ6FT5ocatgAc/gzb?=
 =?iso-8859-1?Q?3OqUpHCT9hTPrbSKN4CAsG0HNPV+wmUeS4aUca8GGp2LEaYpIyCCteGw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b42681f-3ce2-4898-0570-08ddbe54e2fc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 19:23:15.2961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ad903BIYWwt1652IZzDf3HyQDISCuskl+MO7AeJ1HHLoySOS/0b8H7f0VuLq+DStQI4ZycxfLyCAs81Fv09ajw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8438
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

On Tue, Jul 08, 2025 at 01:21:21PM +0100, Tvrtko Ursulin wrote:
> Extract out two copies of the identical code to function epilogue to make
> it smaller and more readable.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 48 +++++++++++---------------
>  1 file changed, 20 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 2335df4de2b8..9212ebae7476 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -263,38 +263,14 @@ drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
>  	entity = rq->current_entity;
>  	if (entity) {
>  		list_for_each_entry_continue(entity, &rq->entities, list) {
> -			if (drm_sched_entity_is_ready(entity)) {
> -				/* If we can't queue yet, preserve the current
> -				 * entity in terms of fairness.
> -				 */
> -				if (!drm_sched_can_queue(sched, entity)) {
> -					spin_unlock(&rq->lock);
> -					return ERR_PTR(-ENOSPC);
> -				}
> -
> -				rq->current_entity = entity;
> -				reinit_completion(&entity->entity_idle);
> -				spin_unlock(&rq->lock);
> -				return entity;
> -			}
> +			if (drm_sched_entity_is_ready(entity))
> +				goto found;
>  		}
>  	}
>  
>  	list_for_each_entry(entity, &rq->entities, list) {
> -		if (drm_sched_entity_is_ready(entity)) {
> -			/* If we can't queue yet, preserve the current entity in
> -			 * terms of fairness.
> -			 */
> -			if (!drm_sched_can_queue(sched, entity)) {
> -				spin_unlock(&rq->lock);
> -				return ERR_PTR(-ENOSPC);
> -			}
> -
> -			rq->current_entity = entity;
> -			reinit_completion(&entity->entity_idle);
> -			spin_unlock(&rq->lock);
> -			return entity;
> -		}
> +		if (drm_sched_entity_is_ready(entity))
> +			goto found;
>  
>  		if (entity == rq->current_entity)
>  			break;
> @@ -303,6 +279,22 @@ drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
>  	spin_unlock(&rq->lock);
>  
>  	return NULL;
> +
> +found:
> +	if (!drm_sched_can_queue(sched, entity)) {
> +		/*
> +		 * If scheduler cannot take more jobs signal the caller to not
> +		 * consider lower priority queues.
> +		 */
> +		entity = ERR_PTR(-ENOSPC);
> +	} else {
> +		rq->current_entity = entity;
> +		reinit_completion(&entity->entity_idle);
> +	}
> +
> +	spin_unlock(&rq->lock);
> +
> +	return entity;
>  }
>  
>  /**
> -- 
> 2.48.0
> 
