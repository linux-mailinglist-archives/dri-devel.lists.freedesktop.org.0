Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64905B345AD
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 17:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B530710E4E9;
	Mon, 25 Aug 2025 15:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e60CMNrp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A95810E4E8;
 Mon, 25 Aug 2025 15:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756135599; x=1787671599;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dx4LDEvKv7Mw9YGYGX/DjMiZxL0rkADbnBSY0aNTsjM=;
 b=e60CMNrpkXIhCrwvY8p7uVP1OlxqKnu4BIrAx8+JA1oV16Rif14QDLGE
 atpzd4SlJNzS55CGuV4pm0lcEo4wYbl6Y/KeGD20NzXVD1f9MDkWwjvq2
 akBxcEpR0NtlkKwfZsFOiGx3VdPRAxvMARrkhP74ZGihFM0+Ld5kdW0Fe
 JL2Es3G9mxNgnk+0Xdu59NlSyexctWTPjtL4Rv5+D825nbtz0HYL4Tb4u
 h4SLVGXlhfh4RtXLprbqlvl8IVHXyCH6Trs8JEF+FgLYM7mv1VP0Qr9Ow
 ninkjFduETBZOXsejcM2RKLrFH/SiGVNmGAf2APq/GWVZpPFMoONwDo9i Q==;
X-CSE-ConnectionGUID: LQIHXJDXRvS/QAMOALOmEg==
X-CSE-MsgGUID: ndZE1tK1TJaMzOzHQWbypw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="75950337"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="75950337"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 08:26:39 -0700
X-CSE-ConnectionGUID: t4HKlPpaQwmC4zINrYgcFA==
X-CSE-MsgGUID: BPiLJC6AQz6gRInDXMI4dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="200212615"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 08:26:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 08:26:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 08:26:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.83) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 08:26:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2PGsh2ooLQ12+Gad0zA1+PQmOKJ/iHjK6wa+lOlkvYCkNtpIbWnk/R4RRRF9piEzxms5iT8Pr1M0yjMgZlskLkqD93FBL+sF9hWTM8Z5i0KNp2coYwdyzOX7Wc7sFDg3au67V2E0PwYa/l8u4lYIP97PgAz9gU1h9cq9I16vkJgiDDMOVkUHBCTevWX/PjiQoGi8Mhv30XO1vwegsYwVSb6kpnyFpdDCNcKcXDLtkOreixKcMI3ow6j+FokIZf5sd5W7BhiZD2DufjD7GdF2TENgHdMvI9TlNW37gFD+KQSzNiRmzPJsO6vOA4JVE4GHSOK/OdLUVybDJpEgM8sNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNh9mT76DsOQqr3YEiR0PyWu2pIrcv8QWOsFmQPQ010=;
 b=wB+F2BmQ88ZKyYH30ipCL70DFaWfdKiVniEtXMddfgyzRetGWrO2c0QS3whUyQKKUxj0kIAvl/TeCP/BTEjbUhYC8Xb30BNPQZ+cIxzCBagrvZ4wUd5SZ9+NQUuAdz3Dw32bmIwYGlfQWwFtkwOKxbRI2AjJPl0o71n+XGYKiPuCqkGynnOE/WjLmPRhJ36Z47lZIXlFSib4rD/gPOoIvuDJoV0Pl2mXy7OrUCTmROkucHQn8l+MbR7IHDdHrNJqsAjIWQmmO1PaC/3guxnV++2pjSo/J4ghVMnJ1edE7AlukiQz+pCQ8quvPwhwPvg2XfKrD+yBQaSGhXg0VMNjrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CYXPR11MB8730.namprd11.prod.outlook.com (2603:10b6:930:e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 25 Aug
 2025 15:26:36 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Mon, 25 Aug 2025
 15:26:36 +0000
Date: Mon, 25 Aug 2025 11:26:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "Lucas De Marchi" <lucas.demarchi@intel.com>, ichal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti
 <andi.shyti@kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Skip creation of pcode sysfs files when pcode is
 disabled
Message-ID: <aKyApuCLCr5X0Css@intel.com>
References: <20250819175529.3722716-1-andi.shyti@kernel.org>
 <aKibCnAxTuYcKtWx@intel.com> <aKxzu8njh9Xc0wyU@ashyti-mobl2.lan>
 <aKx3vHwxnzf4cExx@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aKx3vHwxnzf4cExx@black.igk.intel.com>
X-ClientProxiedBy: BYAPR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:40::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CYXPR11MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: 806e3fee-a5dc-4a56-3f03-08dde3ebc79e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zj4GlRLnv5I1I0F/iQ0tIttvYQvYYSN2lUSvr1ssLL884jUvq7/0mBGsbjV/?=
 =?us-ascii?Q?Vtg+7+5KgRwl2L0z/VbNQJZE5iMuTqRahPCIdf6QvI/ZpdcVbNl4CBo9uDyB?=
 =?us-ascii?Q?22UtczCoIOy2MMeK51rviKvcLWOiy7x1JSydV7DMEqmAz/Zxfxr4nLaXy+js?=
 =?us-ascii?Q?0XTCUpk0c7aEspDJcv2x/ImH13fp9ocrzi78SrY41EpZEWz4a2zpiae2UiNq?=
 =?us-ascii?Q?nWUNTvq1mbLs6IKB4JqboeTaW2WD+VSEqFWrhWIYDbUt6+SZR+l3L7D0mIqO?=
 =?us-ascii?Q?wJTuG7/8VFM4Jahirn63l5os1vpvYSRFIFVv6PgcpI2bM1eEyu/0jaszEMLZ?=
 =?us-ascii?Q?geN63tNxMAix7J8MzmyMwVgJBGmH2t3P64E9aMMRp00YPCxnrKmV4EPSNJaP?=
 =?us-ascii?Q?R276EfqAJM1b07lbNio+jxBizx0O+wi2XxTaHbS6jU3xMLT+e8JyjxF9gJ3w?=
 =?us-ascii?Q?t8lRcQXNV8nmem+lpke5Hh3tKMxNfnPhgEIPAKuAhAoLmiy7JTXPGKDLsvU0?=
 =?us-ascii?Q?GuZdLoH9DGHP4o473d22i4X0lnmKS505t2YU/DgVsGbuIsug/FCbbQLbiBCi?=
 =?us-ascii?Q?6755Q5jQboyGnu/W0ykaiy5+57VoUWj+H0KyfHUJ6kRC99XvvSDv+3J/5DG1?=
 =?us-ascii?Q?HznZ4AjOrKPq9c2d/0h+9LipRuQPEG2iSPl4g/doJD5hC3cWiprTEf2VpzOe?=
 =?us-ascii?Q?3Tx+iCN4J2ylphT888ddp6RALebWcg4VNXRNAn4qG97/+AE7rHWKAJJUFC/T?=
 =?us-ascii?Q?xqhziSumsmzeU3E1vQLx4F16MnibffQdR9rWGkuGEKT+dGLGYwa+jwuu6xi4?=
 =?us-ascii?Q?jcqtpbazB1hzBd4hhHdZpn7jqMeahMKPriFaZDofKiGXQ4ZfeQdD5L6tVBD3?=
 =?us-ascii?Q?c7FlLOFOS/PjGlCrKsL/jMDdGnUt4qSmUKcob5WOi5phoPsOtEBRfF0rp8KQ?=
 =?us-ascii?Q?feuK5FcSEBHHW74kESMRTXOhxlnW/ad0x3zIYk26TCYYG+GjmLU2n5m4XuRr?=
 =?us-ascii?Q?VnvIninvwuJbk0USd910Ut0F1w/+S62ziDmETzI+8w9WlWfc4Bm9pz9XHz7B?=
 =?us-ascii?Q?OxHc5UMssGHDTP8vDtX0Nio0fsFUxh7h9uIcpPwpH67/+jMIS5a4avMkm7al?=
 =?us-ascii?Q?ze53S34AMd5Id0AeS91UwG+7KxJZY0k7YUM5zq9opSDVfBvRaQHJXnC472L2?=
 =?us-ascii?Q?rM/QWyHd5QeL97fngPox+3dFpfELqgVEpYV9H5NPH50bq4fN9lf4hLzdJSQd?=
 =?us-ascii?Q?THjkeEM8PtiE5pQugO5SR/rDYdUDw7BDSbN53VV/IeTt+tu4rZyM6BGQpsDG?=
 =?us-ascii?Q?3SiZmfQ35Moa86zkOK568ygouoTn9YIY9jFROioP1qhCnrCrpJ6Ul+Mb926f?=
 =?us-ascii?Q?WK9nRG7yhGo2eg/14+ByAM9XfyAaC//vYCgvRqZHYoIPEIm9mYzWbDrEkYyL?=
 =?us-ascii?Q?SdNwHhv89ss=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Aj7aExu2Ob7mvXl6nyoX5Otnb+8ZqBJGf50QODbhSU2AQjIr0+bcKllDsBbl?=
 =?us-ascii?Q?Q86tE4AuUPyeR+Piq2fuKAAo52xJ71RtGY4dJ4ZMJmBQE7+D95ZB5IdOqhOG?=
 =?us-ascii?Q?RIxZY2I7eJsWxwBDAfBT8y134l+hwT6NeECCfbuMLaKDQEyYZjbA5DsXZF0m?=
 =?us-ascii?Q?mTcbDcuc4H3Xb9CPoIWGN63kd/eDNeD+tul0bAu/uFeX+NzJPt0vGf6s+bRO?=
 =?us-ascii?Q?FQD4OpsbVgQNy2JdU5mmYR7styeBVbHHJ6iwad9nkKf7dcaIKeZOoFDL0URw?=
 =?us-ascii?Q?rupuosXFII0ihSqyG8u2+n628vK/UdvQQjgdneQqTP47Sp6m2JFJZXCi8IyD?=
 =?us-ascii?Q?T+2xIWPrFdIdBAV6ULmlMID2MkbqWLrdLoNVfgi9ejQX9mn++4MEgGwuksQ0?=
 =?us-ascii?Q?7hbucTF8KEtq/ktJf9ZoVYUjcshEGOUeuz4e1gqcFqfr5bUhe5E8c46FInlj?=
 =?us-ascii?Q?9XLpjPwKFF3bPXYoYvbaKuLG5TegiSjuzvys8OvOv4hUmJthYTGos8caMva8?=
 =?us-ascii?Q?GymBdTumlEY5NLQplmGuGh4oRUWZeSPUs1EhozIJc70ehoe07qjdVydNJVlX?=
 =?us-ascii?Q?sMythML3bTycA6HWFSYsxFxQrhqp8zzv0yRcikZYKvbMj5Ei70QXqlZH5qRv?=
 =?us-ascii?Q?Xs7qSyToYAWy5EVlhWy9cxtV0aDdhyliYur5Ay7zLmo/NeDJ9xvs0z9MnLoc?=
 =?us-ascii?Q?cYrt4iRmO2Fn5dlkjek6+iX2wHZVnMb6l9Jk7dXx2ysqzPdTIRN52zj5JrQX?=
 =?us-ascii?Q?JhgtQydgZWVVSOxmC8UoNDC0wX/I/xpIeuDkoM0qE55zr5iMqJtjfVfIT+Iu?=
 =?us-ascii?Q?SXZc0EpJFxJrBWgrpMg0JJ4gBHX4MjxTeDq5QYFAtiCvGZZzpk/PdSjZ5lKg?=
 =?us-ascii?Q?bKSI+Vxbff6LCePSkBxAbCNMI7dnaXRBzfX5f//c7WlYisVwK9cMMv4rj7/5?=
 =?us-ascii?Q?rrOmdnr+UUasgKqMWvaFzsncx3hAH1VK+po2MlfXbOADmFA2KnuXeMizF+oO?=
 =?us-ascii?Q?Pkk4k6cZKYm7E0Wqz7jAs68Xf98aYFBefKd+SIosrZ1eMpN1HMW8y6e6P9YD?=
 =?us-ascii?Q?6E90VaBJvfQpQ1ew8V133z4gCcnY9cwkZwVj072/Gs5Hw8w3XKTjSJMss9VC?=
 =?us-ascii?Q?AIJfS9PSn9se5IgXxP7s4FCuLDtenslBG4Nnpym8xUs2jyHf8atdCencRTRY?=
 =?us-ascii?Q?/RuodWorNIxrn7aAE3R7SwA2cdVI5Vhpl8qkFP5prO+2mz2V5PFZ9s0DJtf+?=
 =?us-ascii?Q?FuUPWPUh5ENjMdNjYs7dzU9PR4ZKweVhgHcRrcGzTfuY+s6tvznAdSW4BDZ0?=
 =?us-ascii?Q?hTC43yMLEaAHX5XsqHv3rukVlT2+SCn4BVT//2GGgudkcrPLXodhUHxnSKyr?=
 =?us-ascii?Q?vYsfq0xk1WwuVDGKRC3hcCj5BJ/LF/BmNHaVoD0nTghmfocahmvEoyNsQE2W?=
 =?us-ascii?Q?H6reCYNREY1DyyhIIJJoU8Ufkw9DRRQ98wgFc3d7HYB4Eq+g3QnAicr+narZ?=
 =?us-ascii?Q?rK2b1M+rXCDGCx+XxE82rcRFqKu1uetaEdZ7/MooXS6l0RJJR1wbo6Rxqcpz?=
 =?us-ascii?Q?oYC6WlKY/0v210WeGZ08dHaM79FnNOqjMXuuPHCm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 806e3fee-a5dc-4a56-3f03-08dde3ebc79e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 15:26:36.5251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9lkMqz++jDwYL7YGLsBMrswC0+BmHPFtQW1zWVAXi/zot6UbHZT+oCDRk05rxg5WUCmK290BvTeQplIzCu8mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8730
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

On Mon, Aug 25, 2025 at 04:48:28PM +0200, Raag Jadav wrote:
> On Mon, Aug 25, 2025 at 04:31:23PM +0200, Andi Shyti wrote:
> > Hi Rodrigo,
> > 
> > On Fri, Aug 22, 2025 at 12:30:02PM -0400, Rodrigo Vivi wrote:
> > > On Tue, Aug 19, 2025 at 04:55:29PM -0100, Andi Shyti wrote:
> > > > From: Andi Shyti <andi.shyti@linux.intel.com>
> > > > 
> > > > Coverity warns that 'cap' may be used uninitialised. If pcode
> > > > is disabled there is no need to go through the hassle of a
> > > > pcode read or taking a PM reference.
> > > 
> > > Please mark it as false positive!
> > 
> > this patch is not for fixing the Coverity warning, but I saw it
> > useless to step any further if there is skip pcode.
> > 
> > The same check is done later in the function, but in the meantime
> > we have done a few things that we could have spared.
> 
> I tried something similar a few days ago, but perhaps not very convincingly
> I presume.
> 
> [1] https://lore.kernel.org/intel-xe/20250806152256.748057-1-raag.jadav@intel.com/

Cc a bunch of folks...

Well, we have a mess to fix here indeed.

We should not be mixing platform checks with info checks that are coming from
platform definition...

Look comment in xe_info_init_early:
"Initialize device info content that only depends on static driver_data
passed to the driver at probe time from PCI ID table."

However this thread made me to realize that we are not respecting that
and we are indeed changing the info at runtime and not only based
on the platform:

sriov_update_device_info()

Hence these kind of patches poping up.

Jani, I remember you did a very good organization in i915 with the static
info vs info that can change in runtime. Any advice, guidance here?

Thanks,
Rodrigo.

> 
> Raag
> 
> > > We will only get here for BMG which has pcode for sure.
> > > 
> > > > 
> > > > Check skip_pcode early in the function and return if it is set.
> > > > 
> > > > No change for platforms where pcode is enabled.
> > > > 
> > > > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_device_sysfs.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > > index bd9015761aa0..3a083c215891 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > > @@ -156,6 +156,9 @@ static int late_bind_create_files(struct device *dev)
> > > >  	u32 cap;
> > > >  	int ret;
> > > >  
> > > > +	if (xe->info.skip_pcode)
> > > > +		return 0;
> > > > +
> > > >  	xe_pm_runtime_get(xe);
> > > >  
> > > >  	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> > > > -- 
> > > > 2.50.0
> > > > 
