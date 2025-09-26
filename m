Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3002CBA4E82
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 20:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A5710E148;
	Fri, 26 Sep 2025 18:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wkz37M3m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD36B10E0DE;
 Fri, 26 Sep 2025 18:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758911950; x=1790447950;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=upO6mZrX/7/Cv8B+fyeJylvvucvDV8mPpan0oxn7XlY=;
 b=Wkz37M3mi/xrK0JTnS200ts+/jU7twoRCgV46VeQxpzfkXOioBqlNoCL
 ieWmoSc8OZ+sZ+GDr+VQzmXx4CGUqgFFYvg6xldfoUXgY7vbH6Nb1wPMk
 LDhRtfwZZD56jF5qIXXpbjlG/dYSnFy7n3rKtriTLUd2vuuYfyvJkgRiz
 KHwjOzY8GAuMT3b8Ex+TEvwv7z2NzaqBDTZkr8yAEWn8iLJLp63rkqXnc
 GwBA5bR6xfh0ll5jQG3pFQ2oTVbrTObpSF3NCsPh3etAnjXg5imhrhdJ3
 OCk03TwyrX5LE8KABXHvZ6JePlUa8iN7K7GCk+pOpjiFzJFzVMRNaWlag Q==;
X-CSE-ConnectionGUID: Z+5SvcIORC6HiPG1DWP3Lg==
X-CSE-MsgGUID: WxSD1i15SlauyCzhfvFoIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65060991"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65060991"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 11:39:09 -0700
X-CSE-ConnectionGUID: kU2Z7uyLTs+dGYtJ5/hOAQ==
X-CSE-MsgGUID: DAAp2dUjR0eJZx6p7vw9tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="178090466"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 11:39:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 11:39:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 11:39:08 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 11:39:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1TWX3I30Ws/tcKDXAem/gsMPjCVXjfEpEF1ifOY7wjVunFlEUYvxha5YICU3lg8S67THX7pwmAxbVtbo27EJ6ylWLkIzezJpb1Y1HyhJemTRAZ+is1bwIWmCQIVIUuAs/p6fMwqkRpJ9LGT6rZiqwTEMuTAX7qWETIlxasrXTIf4h9wlxFDnbEZjjLbTPeqVdv99TDVzNwqJq8yud/Y9bjMactk04raU/cJqv+T69QkVlPHSPB2kU2EDhECgjQk8Wxm00HxfS1qk2DCgFleeJx9mvxlK0eqeDHsw76TtJeDB34mj4p0pU8Pe2Ze1aFI2S7YjSYlARwQ0HxEFx1H8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LsbisIuOjVQLBDcYaxGSXoyZzx9/efJIBAATB7Dp0s=;
 b=pj1LHwG01eqhhngFOba1Vvqj6JJ0OdG1wdowVhqP2emvabyZ6b4zZl1C6KeIzLt8tFk72uQ7W55XZ62MQzGpSVJvQ02LBekHBYSJjUGHcOTzXjqfDJEA92jf17cSltwpQFtTWEZx9egnqM3JXx5IzS4ASG53sxGameSe72qbDIu7HtMCSKMQO/qGalqUaGA+pVAh2EzBTxNIbKiqNXcoNvdCjNouwRMoPTrkjJs5bk2CDT27PFbJVnCSSZ3JOY0czlFINcXwCp8cRRnrX8nIXulSRJRcwIjvWe/FavRBdhYPN/I7GFh1Vvq1ws7A+DU+eEWpUnvvtPAYdosxG8EWNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SA1PR11MB5778.namprd11.prod.outlook.com (2603:10b6:806:23f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Fri, 26 Sep
 2025 18:39:06 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 18:39:06 +0000
Date: Fri, 26 Sep 2025 21:37:57 +0300
From: Imre Deak <imre.deak@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/6] drm/dp: Add helpers to query the branch DSC max
 throughput/line-width
Message-ID: <aNbdheibEF1nLDLJ@ideak-desk>
References: <20250924152332.359768-1-imre.deak@intel.com>
 <20250924152332.359768-3-imre.deak@intel.com>
 <aNbBe86ubBUMF3L8@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aNbBe86ubBUMF3L8@intel.com>
X-ClientProxiedBy: LO4P123CA0433.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::6) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SA1PR11MB5778:EE_
X-MS-Office365-Filtering-Correlation-Id: 2618a9ae-5744-4dfa-aec4-08ddfd2bf8f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?LpNM/lhKiNHLeLlx4yreB/ursj7ZgfaKgymcdE+mDO9F9pRok+S1W9KzJV?=
 =?iso-8859-1?Q?2fPY0Ncgu9DHOgg7q5IhGoyTnAHVTaM2O3ixRLqlMLSbwRo6XFC1lnTqG/?=
 =?iso-8859-1?Q?CWIcCUxTbJL54/QcfhS8nmPd9679eAXeTGHLG+1U6aIOA2vsgk/1qZKPE/?=
 =?iso-8859-1?Q?M92yLFCOGrQBbEuwvQdfNMKH3Q5ywKF4hggs9wDzCeutPgg0o/TVN/DQ+W?=
 =?iso-8859-1?Q?4D7/dLN+QzN72EUzTkU+nt6qsUbsa5SLWHTiwJsHmAkpG9pT5QLwGlYMMh?=
 =?iso-8859-1?Q?dMX7nrw0sxsdLvnwOkhO2y1GuahIVmhJ7M32pc5xoEuY/sf4zn9kkem7Oe?=
 =?iso-8859-1?Q?HZaxGv5zYHDZC9TNnsSuO/z944COYDFwCoy/Uu2X1R8bgE7E445NcFiS3H?=
 =?iso-8859-1?Q?PnG8FkJ4eMGDyR6xpGGqDG4m5zz/xSJxNsANU8aAdAwZuIML7eOXPqHFt1?=
 =?iso-8859-1?Q?aYedxeMtfOUYxBqo4LRWvWE/cmJi22Rk7slm2ZGRywLLB/qnSWVCs8f7A4?=
 =?iso-8859-1?Q?x6cND53uU61iOuindYh1t64BN+/V04BPpmIhADKMksOpItnzn6mWC9aZSe?=
 =?iso-8859-1?Q?KqN6BL2pvUmEUXIxpKwHM+hQ5ECaubAcN2SNofxSqGKsctzUKDQN7xjSLs?=
 =?iso-8859-1?Q?sMynGV5L/Q7GZHfpcRNdTvzR0PVELkbZQbUlgZjRKEhTSk8XdqdAQQQVyB?=
 =?iso-8859-1?Q?Za4aENMw+pXAJIjqpgU+1OTulAp7ofMj1ugfH4TPC5n/2djLBkesWGW3xK?=
 =?iso-8859-1?Q?Q01f3CtqUmMwZwmOW+l4cevKpbCnbiGXbwn5ESz0C/0HmbJ4Y+//9/dktp?=
 =?iso-8859-1?Q?RoikMLf/0ZWQhsWGlG01Ls9Z1pWpUkIBOOeioogq1e2m8Q0fn+NCW/47s+?=
 =?iso-8859-1?Q?ZsO0UKucZH4nXDJAKiLISC+JBl1QNM6MyYg1MSQX5oym3EHHOK+5arLbo1?=
 =?iso-8859-1?Q?G4nBR0t9w1nSmdMnsBPd688MEWaipDBBv163EBiyoSUlvErsE2jbPXg2Gt?=
 =?iso-8859-1?Q?ku5xYE2d6sTvUPNxnzgsjGLixQwNpljvve619hEFDlyUXb6xyLH+IGFmL9?=
 =?iso-8859-1?Q?MrtcTgVScwXLoqJ84Lv7Uq2a5Gl84L2grAtfUYez11VUuu9zB4486XQ+rV?=
 =?iso-8859-1?Q?wf7Gr4QKKRwwcv6RwBjQXy0eaT/GxB0UZn6ObcA6HqzrwwBH6hlIXmRLD/?=
 =?iso-8859-1?Q?yVJbShF0C2IFCDtIovybMlUsAVUaaJ0OBt5slDhE+1Mq+o2MYNYtUTzDGH?=
 =?iso-8859-1?Q?nkPClyQUq6HQvzswewAZt5PKmdkKHDfgH6+h4E+uch92g0UMVLLKSNR0+G?=
 =?iso-8859-1?Q?UvIFoOZdl8VUE76HnanpCPJQPX+ACleLdXQAsQ2yaAsjKn1empf4HSo6us?=
 =?iso-8859-1?Q?b/oFyKtg8joZ0SxtZhogW6HaA8nCHBnYh0QJJwbqAB0j5Fhx+FXLBHf67R?=
 =?iso-8859-1?Q?9piFkmBJEsY3eEcMdKypXP+w/T1cfD0A15p56flCGy51A3X3JEEal6JVcM?=
 =?iso-8859-1?Q?Xlxg26nt7baZqLy3ZomkOl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3Ni2S8nhTrPqCtHdHi68Mwd0xLSv0XdHwzZpnt6dqJaFMNDwC+3SJ6TC7e?=
 =?iso-8859-1?Q?l31Qfqaz/M3eXcVhVykNLjqLZr4XDvCMpzQOVaYfxzwcq1v+cx67tTODul?=
 =?iso-8859-1?Q?GOwQt/YbuZmMqiCejF8bazPN/DkuzpNFlgpAwTfSyTAGqlTEHayCFF4Fur?=
 =?iso-8859-1?Q?Pg2Ycs+gxhFTbWDzbtCgd+aPB3puZek9Cv2eusfp8EwgKkrMLuzZIh4qqa?=
 =?iso-8859-1?Q?ixTK6AxCJ1C0S/sa+/327h6thzb6Sh73IiZBjjUQ6jb8ZqDVAWQiaSOGyl?=
 =?iso-8859-1?Q?/JQRvDw9nqxuHTd56F7H5ue2Q29VrvSnuUSreDZAA5G5GQtHwQoNdMtgRx?=
 =?iso-8859-1?Q?SM7cBD2x1En2WWofjFY+t6Jc6u8PKR5r+xGG8ZLZ7skwWEI9642OzaglxV?=
 =?iso-8859-1?Q?h0qYQWa5kZkZtffZ7ngtyPewT2L0YgJWNqpJREn7Ai6yUp2qg0qz1gcmjZ?=
 =?iso-8859-1?Q?mz7a7NxHiQSt/2ufHPY/m/4oEJ2QUuvw7IJpVGlpN9RDkIZyGNqeqxMV+j?=
 =?iso-8859-1?Q?Kk2ovCLRB0X3c92BYgGumDToD4PCX9s8ymsMHoaCK3TfbcRbiY+3Tor2UL?=
 =?iso-8859-1?Q?YnGCKzorX71LTXK4maeZOsQ2+T2pdHUkeJvKbj3QYMiDchES5XJhCP9c0/?=
 =?iso-8859-1?Q?is1vET9lWaeWYsClusi0OwZNyu2NdpdkeOWZOnoeb1dJO6S4zA55jATiEQ?=
 =?iso-8859-1?Q?rlEysuUbF6dMx47eWgc5r8uJbpbxhTO69Db2kTTO9hlVbdUvYFHAwZnKyU?=
 =?iso-8859-1?Q?0yKXimVbVLDCFBUQjAlLu9xREJ9mJzpHXhNMpJ71Atz9aPui4vHCesmFoL?=
 =?iso-8859-1?Q?xs2v9C9utqaMvDZSuKp2Tk07kJ9Mc39GHP576UA5vLsivASAOqMYk6MBOg?=
 =?iso-8859-1?Q?rEQ11lt7JS/M0i7fsxwxNmJcMfsDVzUOaGkY+awyxy3qiG+LIFmS2ViR/D?=
 =?iso-8859-1?Q?zFLAV7VPOLGgEXFOyarGIUEZG2NjttmrzvndcSwzaEokyNuyC4/otmmlzs?=
 =?iso-8859-1?Q?yjQyAWmTUkW+oQVSTTRjL1l2ik114R2nIUfZFNgeenLBWrpfGCZ0Z4k+NZ?=
 =?iso-8859-1?Q?DQ2GchZf0eM2fNrz17miWDu7vF3wuX+VkEVSrSVt+/ypCuWaeA0HDpvqmO?=
 =?iso-8859-1?Q?cCgvIUc3fwN4ndjfyklG/Y2KBePl2ROWDlTH79o1UHRDDAUn+6svGOVccC?=
 =?iso-8859-1?Q?Pyv6a7Uq4riG6h/atk4gv/tJbE9uhqXbwfwcVfYz2l4CI1vRHwer9WksaY?=
 =?iso-8859-1?Q?K6oaNchzm1ydCjIMxBAxjTZ1dyld1xcbmIws0ro1diHDY/hE6QBMpusrQb?=
 =?iso-8859-1?Q?Gipen5rrTO6//h9UihA0aHicRq11WrgYLIsHGR5O+7/HugicgoPRj9//mo?=
 =?iso-8859-1?Q?jKRS2A0MKjCTx40h0qNVynagF6aOJvwfSlM3wQhCv9csg8+dhj73DX4D97?=
 =?iso-8859-1?Q?QZ1TMHnNt1u4BymwHN6XvleYmA88Lh8j4QQ2rQ7jJ/3Qqlb+wZQutGpj5B?=
 =?iso-8859-1?Q?5zdswSpv4t4yHcBKV8QhgmFLM04XoaV6qVV+iLv9WrIFNtxNsLfCyMIPlE?=
 =?iso-8859-1?Q?gIb2PgU+LpTcYPaIE1keDeAD0frd/LRN2FYP6EQWtxu7N0c6yL9TLY5MAj?=
 =?iso-8859-1?Q?bm8dkW5HApT1thI2BAnNv4vkYImKx2DATzA8ohYAsGwad308tXECpcNO5+?=
 =?iso-8859-1?Q?uUZtvoeKSdqIb5a9EPGj48GNvgShCB8b7ZlP/P2O?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2618a9ae-5744-4dfa-aec4-08ddfd2bf8f2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 18:39:06.2114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KF19Se/dlJRimQ5ht0hbDnsL2kX0fTK/WvAXDeFxwWjE9toRdcvyFzkOLXoh+dcJbzXOx0NwZa2L9qAiq4cbog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5778
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 26, 2025 at 07:38:19PM +0300, Ville Syrjälä wrote:
> On Wed, Sep 24, 2025 at 06:23:28PM +0300, Imre Deak wrote:
> > Add helpers to query the DP branch device's per-slice throughput as well
> > as overall throughput and line-width capabilities.
> > 
> > Cc: dri-devel@lists.freedesktop.org
> > Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 133 ++++++++++++++++++++++++
> >  include/drm/display/drm_dp.h            |   1 +
> >  include/drm/display/drm_dp_helper.h     |   5 +
> >  3 files changed, 139 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index 1c74fe9459ad9..9d9928daaab59 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -2844,6 +2844,139 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
> >  }
> >  EXPORT_SYMBOL(drm_dp_dsc_sink_supported_input_bpcs);
> >  
> > +/*
> > + * See DP Standard v2.1a 2.8.4 Minimum Slices/Display, Table 2-159 and
> > + * Appendix L.1 Derivation of Slice Count Requirements.
> > + */
> > +static int dsc_branch_min_slice_throughput(int pixel_clock)

Based on the comment later I'll rename this to
dsc_sink_min_slice_throughput().

> > +{
> > +	if (pixel_clock >= 4800000)
> > +		return 600000;
> > +	else if (pixel_clock >= 2700000)
> > +		return 400000;
> > +	else
> > +		return 340000;
> 
> One slightly worrying thing in the spec says the ppr is the cumulative
> rate for all streams feeding a single display. Then elsewhere it seems
> to be saying this only applies to MST streams. So I guess multiple
> links with SST doesn't count. And it's anyone's guess which way multiple
> links with MST should be interpreted...
> 
> Anyways, that's not really something this helper needs to deal with.
> But perhaps the "pixel_clock" needs to be changed to something else.
> So just "peak_pixel_rate"? Or maybe even "cumulative_peak_pixel_rate" 
> for extra clarity?

Ok, I didn't consider this. As we discussed off-line, this may matter
for a multi-tile MST display. For those the total pixel rate of all the
tiles should be considered here and then calculate from that first the
total count of slices spanning all the tiles. I.e. stg like:

peak_pixel_rate = tile_pixel_rate * tile_count
total_slice_count = peak_pixel_rate / dsc_sink_min_slice_throughput(peak_pixel_rate)
tile_slice_count = total_slice_count / tile_count

(not considering the required slice alignment).

To clarify the above I'd rename pixel_clock to peak_pixel_rate and
describe in the param's documentation what it means in case of tiled
displays.

> > +}
> > +
> > +/**
> > + * drm_dp_dsc_branch_max_slice_throughput() - Branch device's max DSC pixel throughput per slice
> > + * @dsc_dpcd: DSC capabilities from DPCD
> > + * @pixel_clock: Pixel clock of mode in kHz
> > + * @is_rgb_yuv444: The mode is either RGB or YUV444
> > + *
> > + * Return the branch device's maximum per slice DSC pixel throughput, based on
> > + * the device's DPCD DSC capabilities, @pixel_clock and whether the output
> > + * format @is_rgb_yuv444 or yuv422/yuv420.
> > + *
> > + * Returns:
> > + * The maximum DSC pixel throughput per slice supported by the branch device
> > + * in kPixels/sec.
> > + */
> > +int drm_dp_dsc_branch_max_slice_throughput(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
> 
> The "branch" in the name doesn't seem correct. Isn't this
> some kind of "DSC sink" limit?

Yes, I mixed this up somehow with the term for the overall branch caps.
I'll rename this to drm_dp_dsc_sink_max_slice_throughput().

> > +					   int pixel_clock, bool is_rgb_yuv444)
> > +{
> > +	int throughput;
> > +
> > +	throughput = dsc_dpcd[DP_DSC_PEAK_THROUGHPUT - DP_DSC_SUPPORT];
> > +
> > +	if (is_rgb_yuv444)
> > +		throughput = (throughput & DP_DSC_THROUGHPUT_MODE_0_MASK) >>
> > +			     DP_DSC_THROUGHPUT_MODE_0_SHIFT;
> > +	else
> > +		throughput = (throughput & DP_DSC_THROUGHPUT_MODE_1_MASK) >>
> > +			     DP_DSC_THROUGHPUT_MODE_1_SHIFT;
> > +
> > +	switch (throughput) {
> > +	case 0:
> > +		return dsc_branch_min_slice_throughput(pixel_clock);
> > +	case 1:
> > +		return 340000;
> > +	case 2 ... 14:
> > +		return 400000 + 50000 * (throughput - 2);
> > +	case 15:
> > +		return 170000;
> > +	default:
> > +		WARN(1, "Missing case %d\n", throughput);
> > +		return 340000;
> > +	}
> > +}
> > +EXPORT_SYMBOL(drm_dp_dsc_branch_max_slice_throughput);
> > +
> > +static u8 dsc_branch_dpcd_cap(const u8 dpcd[DP_DSC_BRANCH_CAP_SIZE], int reg)
> > +{
> > +	return dpcd[reg - DP_DSC_BRANCH_OVERALL_THROUGHPUT_0];
> > +}
> > +
> > +/**
> > + * drm_dp_dsc_branch_max_overall_throughput() - Branch device's max overall DSC pixel throughput
> > + * @dsc_branch_dpcd: DSC branch capabilities from DPCD
> > + * @is_rgb_yuv444: The mode is either RGB or YUV444
> > + *
> > + * Return the branch device's maximum overall DSC pixel throughput, based on
> > + * the device's DPCD DSC branch capabilities, and whether the output
> > + * format @is_rgb_yuv444 or yuv422/yuv420.
> > + *
> > + * Returns:
> > + * - 0:   The maximum overall throughput capability is not indicated by
> > + *        the device separately and it must be determined from the per-slice
> > + *        max throughput (see @drm_dp_dsc_branch_slice_max_throughput())
> > + *        and the maximum slice count supported by the device.
> > + * - > 0: The maximum overall DSC pixel throughput supported by the branch
> > + *        device in kPixels/sec.
> > + */
> > +int drm_dp_dsc_branch_max_overall_throughput(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE],
> > +					     bool is_rgb_yuv444)
> > +{
> > +	int throughput;
> > +
> > +	if (is_rgb_yuv444)
> > +		throughput = dsc_branch_dpcd_cap(dsc_branch_dpcd,
> > +						 DP_DSC_BRANCH_OVERALL_THROUGHPUT_0);
> > +	else
> > +		throughput = dsc_branch_dpcd_cap(dsc_branch_dpcd,
> > +						 DP_DSC_BRANCH_OVERALL_THROUGHPUT_1);
> > +
> > +	switch (throughput) {
> > +	case 0:
> > +		return 0;
> > +	case 1:
> > +		return 680000;
> > +	default:
> > +		return 600000 + 50000 * throughput;
> > +	}
> > +}
> > +EXPORT_SYMBOL(drm_dp_dsc_branch_max_overall_throughput);
> > +
> > +/**
> > + * drm_dp_dsc_branch_max_line_width() - Branch device's max DSC line width
> > + * @dsc_branch_dpcd: DSC branch capabilities from DPCD
> > + *
> > + * Return the branch device's maximum overall DSC line width, based on
> > + * the device's @dsc_branch_dpcd capabilities.
> > + *
> > + * Returns:
> > + * - 0:        The maximum line width is not indicated by the device
> > + *             separately and it must be determined from the maximum
> > + *             slice count and slice-width supported by the device.
> > + * - %-EINVAL: The device indicates an invalid maximum line width
> > + *             (< 2560 pixels).
> > + * - >= 2560:  The maximum line width in pixels.
> > + */
> > +int drm_dp_dsc_branch_max_line_width(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE])
> > +{
> > +	int line_width = dsc_branch_dpcd_cap(dsc_branch_dpcd, DP_DSC_BRANCH_MAX_LINE_WIDTH);
> > +
> > +	switch (line_width) {
> > +	case 0:
> > +		return 0;
> > +	case 1 ... 7:
> > +		return -EINVAL;
> > +	default:
> > +		return line_width * 320;
> > +	}
> > +}
> > +EXPORT_SYMBOL(drm_dp_dsc_branch_max_line_width);
> > +
> >  static int drm_dp_read_lttpr_regs(struct drm_dp_aux *aux,
> >  				  const u8 dpcd[DP_RECEIVER_CAP_SIZE], int address,
> >  				  u8 *buf, int buf_size)
> > diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> > index cf318e3ddb5c5..43978ddd15056 100644
> > --- a/include/drm/display/drm_dp.h
> > +++ b/include/drm/display/drm_dp.h
> > @@ -1686,6 +1686,7 @@ enum drm_dp_phy {
> >  #define DP_BRANCH_OUI_HEADER_SIZE	0xc
> >  #define DP_RECEIVER_CAP_SIZE		0xf
> >  #define DP_DSC_RECEIVER_CAP_SIZE        0x10 /* DSC Capabilities 0x60 through 0x6F */
> > +#define DP_DSC_BRANCH_CAP_SIZE		3
> >  #define EDP_PSR_RECEIVER_CAP_SIZE	2
> >  #define EDP_DISPLAY_CTL_CAP_SIZE	5
> >  #define DP_LTTPR_COMMON_CAP_SIZE	8
> > diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> > index e438c44409952..cb0cd13d632d2 100644
> > --- a/include/drm/display/drm_dp_helper.h
> > +++ b/include/drm/display/drm_dp_helper.h
> > @@ -211,6 +211,11 @@ u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
> >  u8 drm_dp_dsc_sink_line_buf_depth(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
> >  int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpc[DP_DSC_RECEIVER_CAP_SIZE],
> >  					 u8 dsc_bpc[3]);
> > +int drm_dp_dsc_branch_max_slice_throughput(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
> > +					   int mode_clock, bool is_rgb_yuv444);
> > +int drm_dp_dsc_branch_max_overall_throughput(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE],
> > +					     bool is_rgb_yuv444);
> > +int drm_dp_dsc_branch_max_line_width(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE]);
> >  
> >  static inline bool
> >  drm_dp_sink_supports_dsc(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
> > -- 
> > 2.49.1
> 
> -- 
> Ville Syrjälä
> Intel
