Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666F4A45304
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 03:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCD110E1E5;
	Wed, 26 Feb 2025 02:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b9JcxL7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1734610E1E5;
 Wed, 26 Feb 2025 02:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740536493; x=1772072493;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5UEkHnRSp4r4SUUgR1M1xDe5eRAn3rcmnDadyKLfeYM=;
 b=b9JcxL7IzT0PcpOIHMEy3hNR+oyWTtZCCEAL9B9ngPiQEE/zjDX4lvJZ
 xsgy+6uzLgKQ2MbWBpQsEyN9DYqpZX00qtJrWYg1OOy+CZ68J73BYYEcq
 MEUfzZYxKyO0HFL18ht7/66guJVVC4mi+14mrGpp7o5yNiXqoji8G2zHw
 POp9CckX7FsNMKakqLPv+xAadHBarV9ehZC77ZFLjY8BaLzuVxNljrIZr
 PPj2V+TM4R+fmR8j2t8CLaqCAvEY+hm6gk5twoiYygwsjJKxZldVlRp4n
 pMp2I+nOBuz6WQ63Ix4ojn+D8JRXO/V3A/BEcB6nl4+SkZwHcbFTu2Tdt g==;
X-CSE-ConnectionGUID: 1pspx92xT7eSq67ZFKx8SQ==
X-CSE-MsgGUID: KkF+CcDqRgm3XKuLNoDDoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="44193111"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="44193111"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 18:21:31 -0800
X-CSE-ConnectionGUID: E6U81oZMT2mVU22c4eJosQ==
X-CSE-MsgGUID: mfqvHi1XQ8iwE1Oon92sEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121815042"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 18:21:32 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 18:21:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 18:21:31 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 18:21:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGZRV5JMSc/QLIUPe2ifVklnVArYBKcn6RYfqHFWZSr5A+Q96tb1vcCE4O+1ruTyDvPqvnJmcJLiEK7EUsgDWO8W0JN60yAliemEWT2SmJb0+LN1frO5+Sg5J8/HZxupobjj+n2wNmUXmpQwHhxR4y7q2evm7CopHy40I9QnHRnCGZyL1WIzsVbZ2jijnmddDAGl77ploYVD3bmMBXV5ssMFa9yddmWtGZbxnU75o6M9kxJNRteWGWcHe5ae6JxDZ+Pl1hqVtzhX6FjVWolzJQkOd98vclRVGCToqvS26ZAuZqzfwYG2vDLydQolTsb2tNME6Daf4Z+nhcfNTKa6QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QE2UMBA49exQika9fQD3g8CIDCE8Ie347QdiHoNYehU=;
 b=JO+m+cH6T7iWydL1qtEtDpwZuanKZMOL8bptiTZ1LNZxUKegkBcvsNqPzdwgw9S0DotLnJeLoxBM0lcsw3vCxhe6ABw7pgaaSy3kF2r2wqdixv2MWBkNPU0V2aBmZBkcgbvu8dX2/g3G0T34tweXh4ploPHG+3y9hgoEPr3VXr5RrdztiUeej4uYihl7hphUXKzwhGurUZ1nOrKSMlnlkGXOkxNh7IJmsf12YVaBBRWu0BdLyXQ5tgr4psDyN/h3Ude2Y4+axACHSHU7NpxVSzMiVc2exNxMzqzLfAeQ/ENoNqhpM4l466zxSu/MlSHbZw/fDjbZVePpNhodhOxmww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by DS0PR11MB7505.namprd11.prod.outlook.com (2603:10b6:8:153::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 02:20:48 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 02:20:48 +0000
Date: Tue, 25 Feb 2025 21:20:42 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Mingcong Bai <jeffbai@aosc.io>, <linux-kernel@vger.kernel.org>, "Kexy
 Biscuit" <kexybiscuit@aosc.io>, <stable@vger.kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matt Roper <matthew.d.roper@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, Pallavi Mishra
 <pallavi.mishra@intel.com>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>, Ilia Levi <ilia.levi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/regs: remove a duplicate definition for
 RING_CTL_SIZE(size)
Message-ID: <Z756ehDSHYDDR8gL@intel.com>
References: <20250225073104.865230-1-jeffbai@aosc.io>
 <Z75Taxl0rTXGxNfh@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z75Taxl0rTXGxNfh@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0257.namprd03.prod.outlook.com
 (2603:10b6:303:b4::22) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|DS0PR11MB7505:EE_
X-MS-Office365-Filtering-Correlation-Id: 71e3d4d9-465c-4f03-5325-08dd560c2e72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pTU6qRkMYxihDC+2P3So9Z1uw9TiHVKHiNqLJd3x4zQ5erHFfNPo2xjzfnou?=
 =?us-ascii?Q?pMvTJvOKLZGxWHiHPNoJGXCzbJT0L/oNAFpyDzmlst9DS6oUkIdpxwVyujCb?=
 =?us-ascii?Q?FzYLPR+2+nApQi8K4iqlcZuTOAWSHs3O/eP/EdGg2H4QR/dVfdorB3ZC0Rle?=
 =?us-ascii?Q?celjTI7vUEPolWvKAUgNSRIwY/qkEr+PTgwO2MZj4S2lNxsZCqb0VVPkA47f?=
 =?us-ascii?Q?qVNm3B0q826nf5wZspe75WtLFpP0z2xKCty4uDhNZDyYQVc25GpOFdOUlw4B?=
 =?us-ascii?Q?DXffIG7eyTRWndpTchZfYnzNjKZrlyWaQlB30fcRUhkHfd+fxal2H/uX84ea?=
 =?us-ascii?Q?fBsjszAQdLxVZ6FPjEL/LktKnLcIvDIYC5gb9MQ3j6Flj9phaYBYpg4220Ms?=
 =?us-ascii?Q?RS7ysXkkiKJM9vjVtzHZChEnC9joIkrJauEdLHBe5JN1DLwOeMxhYN3MTteh?=
 =?us-ascii?Q?kV1JB4418Agi3CGM+dflN9PN9pXDrI5TCTJjCplsYd1Gg4WNcSu/iRXg+URS?=
 =?us-ascii?Q?a2N+lwZQwuIhJUuANTnxH4AjlCsQXj22Ci8XkwNuBaKEDXhTXarCG1AgvBvn?=
 =?us-ascii?Q?LM0iQ/VTpdoa6rLM/21gx9bh4IvwUTtqX3jS0Z6Z65NXendj+hgKoP+p4PPd?=
 =?us-ascii?Q?aQ7in5ixgPaHxmJ3Q/E74VGv/6WJ3XEtw8MmK/sTgYxOsDz8p7NjrsRDUNBy?=
 =?us-ascii?Q?Zy2uzriO75QUbQvLzf+2Xh/xItNBFiW50PhNL6WSRZEyroI3+Igj2XMarFLl?=
 =?us-ascii?Q?pHEjD6uPNi+NNA2jykfEBR7dan+7BPCFv9+1uBQivmWRxoVV3+FSx1kBuMlZ?=
 =?us-ascii?Q?hHjJH8ybSPhRve+bpcXvEXoqkFC8ODlOO9ZkNs4QBWfwq/9qaiC2qCSv6G3t?=
 =?us-ascii?Q?lQDnxtmffPAhPFfTFlLC5ul0Gim5OhydzePm0+dcWvVJVNuyMEPVRDvonFoW?=
 =?us-ascii?Q?x18yKKTjIZhXQ/4XtQ9tvONuD6xb4jA6auty+HEm6oG3t1TSq1DI382VOUfj?=
 =?us-ascii?Q?6GnOhlmBQ7fp/wsDO60sp4ncu8VVAVIMLIO8102ZgzNdaRYWVRxD5nz/3gVc?=
 =?us-ascii?Q?V64gUL0HYmyo3XnTxwXHKxv9jmUlxXfdqmwewOiTOODbmY9CrKdv4uFyNPZW?=
 =?us-ascii?Q?q/tbZIkLiVO03XQoo0R0ApVZT53rGSLjrfbOwOyLBcWSWN1q9TgrKG54fOZl?=
 =?us-ascii?Q?JZ5T8Kf9kpSPu1N2h4WmEVejuuEXxik844khsQaf/5dHg5/X2izq2eAoIpi5?=
 =?us-ascii?Q?5UZpHDyKu6ThqeRsbBn0WFeK4h3aYFzC2q5i0HEVH7W31eS5NJAHoID4Z7lY?=
 =?us-ascii?Q?axNoQ+q52Wa57ZslHiAASAMAB1P55pA+0aMN+Crse2a3WbxJvM1/xt0Oe2N7?=
 =?us-ascii?Q?hIIDFPhi4DTh5WH05tuaNK2aeAmQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?27f7juB2OrE75cP/HwlzGwm5zgqpb11d8u5VgaHnY8mF+UAXcoUkeGOS91bp?=
 =?us-ascii?Q?DwRaJrLMnDNKaEr8GNgptSFFcVhLySOJMqlMwpdj77WdoWIwdDWZxF5eSqkP?=
 =?us-ascii?Q?e8Axau8qQRJIk7ZgkWUGeWFLgBJqeg2jiJeBbu8i625gIh2UsSsyzUkbzSdE?=
 =?us-ascii?Q?skozPT5OuRIQ1Mj/bSzat1E/2C9l8Tyqmpxlxp/kCr+8LSm2uHgz5KCIkahf?=
 =?us-ascii?Q?0GvjNq34xWTWwdHKz1PRa15E42WmYNKHpQiXol1aVXva0FMYRNTRVy/gYFmI?=
 =?us-ascii?Q?FgwZZESAhtG+lWzxpzYVzoXZ9hC2KnOXAguPjc2fvx2zfn7VM12pNoDscA5w?=
 =?us-ascii?Q?8d/4R92Ba8+clMr24Tz8m09BW2+ou1wTjKVY34qpx0Y7Jq4zrieUj/DPlJKi?=
 =?us-ascii?Q?MDWkvvxQyOjvX5nwLV0fNc/oZ90rRUMsussY25a65OTh4xlW2CPwS3d4lHVU?=
 =?us-ascii?Q?1CyFKx2jiMrkrJLELMZIY01pqNvpWqQYWYTKQbBG/1ofWr0495dhf/wuUW+T?=
 =?us-ascii?Q?aH5gjL6XuKo8EKfAgIX5oPhX/hEd7RxduU/JybNA69Ue89Fv3kOTcMIMPR7l?=
 =?us-ascii?Q?N0swrsj0dpPLs8QErVhErkVA9WAsSZDywcPrxmttDjE+sArWX9iBa9BP7uuf?=
 =?us-ascii?Q?El4FchDn9/YBtVWxEBcU7TImmc6q1ydQWatSv+E+tAqSw+L7Z8g1IM6d/f5R?=
 =?us-ascii?Q?QU0+f+XDZ24/WFcUjb3sIuc9Erl7zBFxNA+S9ISOi0U9W/D1Rm0lQa5vCzEl?=
 =?us-ascii?Q?1m9GWja8J7wBGLdGX8KCliqq8o47mP9voGARp6+A9uoeWkSFstmtxUleHO3t?=
 =?us-ascii?Q?QSjBHnOH+4YknNDmPggc6PYnoHIN00ny7xCCItGZ8kw7FO/pRFNyLgPPiytt?=
 =?us-ascii?Q?G5yqOFhqCHHOpHKheZQxRXPtP0j6IelDXfS4MrA9DoW3LX8GIoNnYsufV6+u?=
 =?us-ascii?Q?bQBcgxZJrPBMiSmUHj/Hv158xMJu6vin7PW5JRXv5HwVa//5x0CAJSbE1RxE?=
 =?us-ascii?Q?oKQQtuG43vLxG60lCQ4MZ0/wlmk2blqX3EzvMJnEiAOKeHrjnM26K6Y9+vcd?=
 =?us-ascii?Q?NXcVACdDtCtHDBIjgRc0xP/Fn22Ela7y/q7FPoMrAFgPKdr6RKMY/YQqkTu1?=
 =?us-ascii?Q?SK33gXEmDFJ/TbYmKCjQHlkoDw8TcztU1FSu5vS5DBZiU5cUiV/yBYdehJlb?=
 =?us-ascii?Q?MF/sVKBkaTtejzEPZxkVyZ+0Fd0ZGfxRE+QjbnCPoxQLCTvzVrASBMWK8a7T?=
 =?us-ascii?Q?jPgi/u78++jIN0scwfF/9Bqwkaakfl0txD3VZWi9gF/VPZjowIbI5cR52Z5w?=
 =?us-ascii?Q?9SrpEOkCMBx/xUVjT6YApGzWZvOV4vAUM5fLNCOBfdPWazOqlz73YtcylX81?=
 =?us-ascii?Q?DisZGMRmune+K9EYr6jlHbHWVDnjIxAZjOONvYAubg0Iwa380w84aTmWbDgn?=
 =?us-ascii?Q?NhGdOtzANcRLNc1gf279kGTqLoZda71xT+iCeoPoFYd3eKfeRBGiWd5e5U3R?=
 =?us-ascii?Q?Q34qqXw34ghqhu3IvrbD8FqA+YASiO7DCQB8+UpBY8FoqOh2GNiGRrwFguUU?=
 =?us-ascii?Q?E22hpya+3sI9XSVKTcrhczvwv9sVKc27AuePgsSaUTbBLULFBgPt3Snbo4c1?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e3d4d9-465c-4f03-5325-08dd560c2e72
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 02:20:47.9141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXJ9qutl0xDjnwaG0n5nsQUtYzB6OMYc9+Vh7iDGctARIXgv4ztejRlRlj/FrjXo3h96OqHa/DUPLCjQLkSHSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7505
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

On Tue, Feb 25, 2025 at 03:34:03PM -0800, Matthew Brost wrote:
> On Tue, Feb 25, 2025 at 03:31:01PM +0800, Mingcong Bai wrote:
> > Commit b79e8fd954c4 ("drm/xe: Remove dependency on intel_engine_regs.h")
> > introduced an internal set of engine registers, however, as part of this
> > change, it has also introduced two duplicate `define' lines for
> > `RING_CTL_SIZE(size)'. This commit was introduced to the tree in v6.8-rc1.
> > 
> > While this is harmless as the definitions did not change, so no compiler
> > warning was observed.
> > 
> > Drop this line anyway for the sake of correctness.
> > 
> > Cc: <stable@vger.kernel.org> # v6.8-rc1+
> > Fixes: b79e8fd954c4 ("drm/xe: Remove dependency on intel_engine_regs.h")
> > Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

pushed to drm-xe-next, thank you both

> 
> > ---
> >  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > index d86219dedde2a..b732c89816dff 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > @@ -53,7 +53,6 @@
> >  
> >  #define RING_CTL(base)				XE_REG((base) + 0x3c)
> >  #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
> > -#define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
> >  
> >  #define RING_START_UDW(base)			XE_REG((base) + 0x48)
> >  
> > -- 
> > 2.48.1
> > 
