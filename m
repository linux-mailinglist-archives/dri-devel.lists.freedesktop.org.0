Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6354196FBB4
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 21:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE2410EAE0;
	Fri,  6 Sep 2024 19:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLkM9+g8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F81110EAE0;
 Fri,  6 Sep 2024 19:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725649255; x=1757185255;
 h=date:from:cc:subject:message-id:references:in-reply-to:
 mime-version; bh=L78WdRPJ4yPxA+cu5kZwqEGd+64GHq9RbQ5KZ5U3LrM=;
 b=JLkM9+g8HQ91fLSNGEMH9l3d1BR/qZjEQSCHgL7S56Xxojl47h7vCFP2
 8fVaLhqzSFps9jg3sKQd3YHt2OBXFK7ptc+UfrDQbFrNrysmvkPeD4hel
 iWAhYBHMwVHoO2WtOEjOlyW8s3jwBOVbpvBPhcyeu7ZUYSyckbwvhiGPZ
 cK4Og0rg9xp4fLxjP07tx10anwg7rRd0ovcZ7wc7tlXH2Z9NQQyv6rk4W
 80XY3pctb3eVokzwmKxXo9CiLUworDYXYp4E+TUUGGTIgcBMXeMEQz6ul
 nu/c12h0PjCqPT3dyw7tuvq9qSH+A78WCyFHWis7IiqMiurz4XyZ461np w==;
X-CSE-ConnectionGUID: hdK6Do99QgmlOUJvo7omGA==
X-CSE-MsgGUID: rcWLGh8wSW2X/6wI469UUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="41899560"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="41899560"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 12:00:55 -0700
X-CSE-ConnectionGUID: gAxnRNrlSeyNdDAuGB4Ppw==
X-CSE-MsgGUID: JTnfs6xLSb+9z3rC9JHHNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="70171491"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 12:00:54 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 12:00:54 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 12:00:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 12:00:53 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 12:00:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWDfLOcta7gH/gW+2D04FGb9eDtBOn1/Hq+1AZ7hw6DKYtUwf7l8kjd2Buma7NBt8x4DqcOPoTPdQfpQa/mrmlSzL19gvyV/g/15N2PQaaT2kAYEh659zCsbbyaR3zw9rhxWyC/D1i+NW78dX8TL8Czx9lrFHRcZlQFbEpdGeJR45UoYjEjHTCQ7/w94zRTzt8xB+uHUI+OZO9xjchd3rVFWdlT7g08a0XWDZcjALol97UcdDfMI2gGZsexR86k0DH2U9se3TUpV741xAOyf6Q7KbMpuUkULg9VD5ZpNVMyEbtD/uqRcVB0Ajl1VYBShqJTOnSVrWiqSfDeALIHXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIEatjtdFXr4k+LEICsIU3lvluw/9YKwCtpwZyEiJhA=;
 b=bNqA7+3IIAjEW/yyQ1kF2e0kyE0GvQQzp5C9nEIRSaDV6pn/AkubCa4Tw79Fg3rsDChiQoPflTiVsMrg5L+JwvuSmWDHIOwQT8tRdeHmwcCcLstDOW3nHtFEooCmPqKREoeW7FsaWcc8To8tUKKhsJv0cSiXqBc1UngTpB4/AjMFjk4qlNK7K/wZQ6KpMWe1C3/MW1ifTRAp5XCedEAPlrv3Ur5aCpioedPc1dF7IT9Uy9rw821+DxrqLRmk22AhQGKjpQXDEuUcgTeGYdi+vFaB4XxM7ROtTwEQRzcRjG+wG+5dj9yCH/dgnJy3BK1wLxp/3vQJp/nSg7hq82Ay8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Fri, 6 Sep
 2024 19:00:32 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 19:00:29 +0000
Date: Fri, 6 Sep 2024 15:00:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/i915/guc: prevent a possible int overflow in wq
 offsets
Message-ID: <ZttRSCOFSjT89Gxk@intel.com>
References: <20240725155925.14707-1-n.zhandarovich@fintech.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240725155925.14707-1-n.zhandarovich@fintech.ru>
X-ClientProxiedBy: MW4PR03CA0106.namprd03.prod.outlook.com
 (2603:10b6:303:b7::21) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ1PR11MB6204:EE_
X-MS-Office365-Filtering-Correlation-Id: 63a1b22c-4d0c-4f29-f5b1-08dccea62c83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CqKdHrZBl24lvRE2QioVCo7HpWfghGNShLfbb1yKa/NYtPvUJmAa/Rcs05d6?=
 =?us-ascii?Q?UYaqvrUSWl1gzDlx6e0y7fKO4s8KRnhiXS0jyek96RHpT7Fu1X36kontZ6ky?=
 =?us-ascii?Q?sktF+/UEhK7raJFLxfPD69DB2LpPFfccfkWewo/IeqpAVBPx2PUH/XVu5Vcm?=
 =?us-ascii?Q?XIjfxnpGKV8DKx0sj+Ju0hynzeBtnRPOAQcubFb+dnmSpoR+1FyvSNhQi82C?=
 =?us-ascii?Q?MBd48E+kbmD9tP5XilBG2niZD8cw/c9pVqQszAOO8KiKM0sGTEiuorzHgcb0?=
 =?us-ascii?Q?ncgka4OQH8wjavODbTfPqrdL5rCx3P5OGsLFNtlmWm0key/MnOXgLWSXHrdN?=
 =?us-ascii?Q?GwwFejIE71O7pnnMUGp7qFplaczfHoNZm/0wsIAn/zvQciGhqqn6IfyZJ6Se?=
 =?us-ascii?Q?8Wi5MJ1LYbMdICVdjBN+ybAn+hF3MpoROs9boDrYHQgxbLgZXTeEqUqMmTXU?=
 =?us-ascii?Q?22q0KoOCU2d9QStpkEB4vTQ7ITNWB3k1OTrTJKxMHamSRhXda5xJcRUEIqSJ?=
 =?us-ascii?Q?RuibA7M4JMRCl9IlyybG7gbcYICAET0CDXlOvExipIqlf8ButUD7vnKbLVFj?=
 =?us-ascii?Q?0z+XyCD/OcQ2Q3OEFokZX1+4UYTnsN85BHY+MFj1avBvP7TEiIPI4i0vKXRt?=
 =?us-ascii?Q?UXVkP27SLQdEaUogVWvEA7V1x7JTZbEx8Jvc3WxcEpPgehdtRI5tu5R0aoUm?=
 =?us-ascii?Q?4NCqlB3qvmpFhSVy6ttZew7q8AOz/nNmAeoQqulwyT5sbU+jPDD3sP1NglwJ?=
 =?us-ascii?Q?5rNah6QvF3IonqCrymhHJbURKehEMm3KGsHGb3Ci3Ch+lP4xTfgz2MTD0OJt?=
 =?us-ascii?Q?RHdlY3oVgvPH3ATrVSmdXjqkQE5lFExYq5gk5y7jYfbvo83Ke6Gq1R0sTLHq?=
 =?us-ascii?Q?LIvr8KY43PA3vZTuU7A/r/jvFRUQEs6RVslQaQYVFRxnzJfclzf6KNMTJrNk?=
 =?us-ascii?Q?syakE6x4uE5Dce1QbNy5IhkZH5ywXlQ887OBqgAflN6zJKaBinaZqbgdk9A4?=
 =?us-ascii?Q?9GuCr5xgmvv1U10ZPh28F1Azfs1gSGpQvjkcOeI4KHzG0z5V64PE/MoCuqWr?=
 =?us-ascii?Q?uiX4kub+0Bbh0whaVvobFrPjorNyPfkTodirv0BVvbO7GrsijIpUIjGeqzSW?=
 =?us-ascii?Q?Z/xXBxTj2JXxfcepHUHG6UQbLHkiDlGQ0/NDnA8DHTyRqzUlWKS0d2WADdT3?=
 =?us-ascii?Q?CA0/epXG85cISOh4uolNu18qYDgBQEykAs9h4IS6gA8SB1eKE2gUpzrPkvEc?=
 =?us-ascii?Q?ycJONvwl0pgqmEOmftQhhbyhv/sZ+MsUH4aHZzyX3EQU0zc7iS/mE22TPk9E?=
 =?us-ascii?Q?v/S0qSXvDAxfy+eo8mKfSzvNQD7VtzQeyzqDgZNG4ZMZPw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FA7qnF8abF86AG1/X63TjSVy+41xcX3AZcyu51NS8hcwkNNoVyQ/Fw38qRMN?=
 =?us-ascii?Q?3Xai28nMNcqxf3ANjPLuRco/yeP+APtk5hdYDcb5RMNvAVjEHQTkRIjoHZ0M?=
 =?us-ascii?Q?hxbxipYt3sj7fGUc7/j8plJda1U3j5PjuBjraolnN20wYy/jPOj+Ht1kR854?=
 =?us-ascii?Q?UDyp6hymnAYgTBr9Od7/o1Hj1HikFEsUbo0v7gZwOR53r0JX9RxLwMTpA+v7?=
 =?us-ascii?Q?GCEDPxq1FWIcfN4OFq+netlOs8soIm/zudoGWSqt+9x/cYAAQzoSTlIHFrca?=
 =?us-ascii?Q?uNnZJeNCsmBgOrKeMvOqnA+nCoDSlmCLoFVcociKtjNu7ALaFeuIq5WJZtOY?=
 =?us-ascii?Q?42RGFASjpS5/kWTLK+C3yrzHNIzJjn5XWrVcbJH4WiLgFqFs9f/s4II7dHdl?=
 =?us-ascii?Q?kiayyyj37IUQGAOB8rn7NNP++nRp8SuCP5jkdJrGWWPAHYKmSBleXt+i09jt?=
 =?us-ascii?Q?Rb/UAqoJDTLIpNxRE3h8/rXRrQrybCmKkBAMlHQGXvW5OsM9Yrh/b60cF3QQ?=
 =?us-ascii?Q?/nWuPF6Ca4KGZezRFHUyx3LsdUBrH0OvWNfgOagIkk9o/N6Qr8AqSh5VpJcj?=
 =?us-ascii?Q?fkuD7ImLqcw+ZGHftNtfiDkQgr0hISNoCD1WddSpLTOXNaGbgmkMat9JDx+z?=
 =?us-ascii?Q?W6l3aPZiz2cIoInx2HWVZ+NnAvx30DO7zl6l0qvxSbIfogQTelwLMoKLEAdG?=
 =?us-ascii?Q?6JoMLG5r0qWGUgiahyFTiY21CtyBAIPMEiiv+o+WIrfGCw3MHDIsrzHyDiU2?=
 =?us-ascii?Q?UwnRTHu1SVqlGIon+FtbFQmho5v79I7f5DHAN380luaUo8Vzh+jYoEvZrsCk?=
 =?us-ascii?Q?VOSdlOUeNNuieZiyVZmdaYX4b+CPuxZi3heBh8XkKff4NY0i+ngfG+LW2k+p?=
 =?us-ascii?Q?C3elRanRA79Lu6UsWSYtqOZJJDK0XOgWfNodVvmnVmiS0YacmPJgD6jqVtY+?=
 =?us-ascii?Q?ba1gkQpjfA4VfgmMdU2+ytzGxOQC/hknJBcDMutoHuWZNTseUx+118fgUZZ+?=
 =?us-ascii?Q?T/ZloX2ci4KOuXDZ4Rhbk6A6kSZk4w63vyVMrFF1N5GcykBrUxTyha/utQ4p?=
 =?us-ascii?Q?k4E8fvU9s3oo5S9oAlq22X4QYTtzOcezLtZafbGm3cbvcbLegeg6f+JlgxAk?=
 =?us-ascii?Q?EzUILro3SDEg7UOsz9avoAF73zXebmsMjP0i0iYHHU3Q+Co1g4S6f55IPRUc?=
 =?us-ascii?Q?oPpdZmx0gMqTLqNzr2OzRf+ZL+0taioNjWRx29oyf2d0KWfZ/ymmGAdymb0L?=
 =?us-ascii?Q?qSuVHkdf7EVlvosS1oDT+ThwfH6oWe1Irj80fTH91eQmTfdboe6ZbWTcVUVv?=
 =?us-ascii?Q?guYNKTl7bRDLsttRGtC18oPC7BfGL3xtH0fw+WptJTGGLdgJZEx5A+9a4KXC?=
 =?us-ascii?Q?Yr+06m0Zq+d9c4QTZXzR2kSrc0CODJJ/Gf6DFq5oZ5cruxdSEdoc0LiIZK1Q?=
 =?us-ascii?Q?dh4EJnzhZLj4E/QERqGcrHk3X8lOkn9H5H1RYV6KjVqPr3qUBi+FhHfuojGo?=
 =?us-ascii?Q?x1FIvuhCXQqnTv9VnGyEqqSv2jYfMSZCJV6UX4Vgc8/bkfzfcRdAe12FxX1z?=
 =?us-ascii?Q?q/aDFDMdI1x/D3jtOqyExwv9Kupsn/ZAo/DnV2yAi62piuXWwLqBGI6yXLUx?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a1b22c-4d0c-4f29-f5b1-08dccea62c83
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 19:00:28.9414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZcGo6+2ibsGb8O9oViINgXhow/7LB37AweaMefJGnrevU6jC/FpK111EqTKxoCEna+i5rJ8TWluQEEnZ5B3tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6204
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

On Thu, Jul 25, 2024 at 08:59:25AM -0700, Nikita Zhandarovich wrote:
> It may be possible for the sum of the values derived from
> i915_ggtt_offset() and __get_parent_scratch_offset()/
> i915_ggtt_offset() to go over the u32 limit before being assigned
> to wq offsets of u64 type.
> 
> Mitigate these issues by expanding one of the right operands
> to u64 to avoid any overflow issues just in case.
> 
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
> 
> Fixes: 2584b3549f4c ("drm/i915/guc: Update to GuC version 70.1.1")

this is not the correct fixes tag. The code is like this since

Fixes: c2aa552ff09d ("drm/i915/guc: Add multi-lrc context registration")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>

Also, this is theoretical only since I don't believe it is actually
possible like Tvrtko had mentioned already.

But let's give a piece of mind to the static analyzers and get this in.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

(pushing now with the fixes fixes tag)

> Cc: stable@vger.kernel.org
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 9400d0eb682b..908ebfa22933 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2842,9 +2842,9 @@ static void prepare_context_registration_info_v70(struct intel_context *ce,
>  		ce->parallel.guc.wqi_tail = 0;
>  		ce->parallel.guc.wqi_head = 0;
>  
> -		wq_desc_offset = i915_ggtt_offset(ce->state) +
> +		wq_desc_offset = (u64)i915_ggtt_offset(ce->state) +
>  				 __get_parent_scratch_offset(ce);
> -		wq_base_offset = i915_ggtt_offset(ce->state) +
> +		wq_base_offset = (u64)i915_ggtt_offset(ce->state) +
>  				 __get_wq_offset(ce);
>  		info->wq_desc_lo = lower_32_bits(wq_desc_offset);
>  		info->wq_desc_hi = upper_32_bits(wq_desc_offset);
