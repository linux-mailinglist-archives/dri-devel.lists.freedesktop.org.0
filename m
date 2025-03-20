Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79593A6AF65
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 21:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B2F10E6C9;
	Thu, 20 Mar 2025 20:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QaodT2qN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CFB10E291;
 Thu, 20 Mar 2025 20:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742503939; x=1774039939;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=94SZ2DfOAokAq823GhpQXBFBA09ocBlp4bvaBeXFfQ0=;
 b=QaodT2qNnJ5yuXJ3O5Ca51lHmbcIg6KyeW6NSU0fzHjM+IjJzB3QkoFu
 Ogk/7GxpPeytJa7g0gbJdoE+BBHKJo7JkitJEbNBBk9SVy6grDfE3ko/z
 sNmg83Ea1PEkfT8xyVk0MnIqVzO5dOrK/fOxidms9sZyEO9VCS8PecSol
 saCA+2OdLYX0mM+B3hEhZTxTa1JBxG8Lk6yG3Uut66nv6+bVXU5bZfrEJ
 f5QN+c9rQMFSTdfYYU/iewwevUEnt9/fv3HbzGIFlrd5H6NMgGPQ6bqmI
 XjQSbafzG1H8yObujKSnddgTAuuFJSsAO/Uv9tt95VQ2lb9/yRCWnWGOO g==;
X-CSE-ConnectionGUID: 4vB2Lrm3S6iBDMrvyp/HQQ==
X-CSE-MsgGUID: dXuB0jaLQ6ChX74y1hMs+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="47533887"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="47533887"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 13:52:18 -0700
X-CSE-ConnectionGUID: y39HDZoJTKyyaWicUY92+A==
X-CSE-MsgGUID: SIR55LTdQYKpgdHx+byV2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="160439052"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 13:52:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 13:52:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 13:52:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 13:52:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ldzbsl0u2uewqhr93pE0rkTXqSLN6qc24lP7vGutu8dKdatnEYYbK5eN6bXrLKAOXhbFwhaGL+/o5rbPokJ8T+/Tjq7EPDSKk+l3rXrlZnF+PTF41l3Yvgl+kguRkyqsOwbGRZAf6nhdjFBgtHAQVGs5czp2jkBhYIzVRbQb88mcs/xt9JiuuF+IFepT6XqQ2S51DmW8S0jOc+yvNzjtARjp8Y9IQTaShSvolylni9lPWcNAS2pjyIPUXkR9mC5jSnORQAjjsW0OSxJt2PNha2L10S9Tjiw+wTEiTDmDe6gvfNdBB7LMh/8EjIXAvf7VHORlEy2DzD/9gWVurN6V9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NDtjXbGDIc5Qp358sGTq5H/c7fSjlnPxuAZa1uBXeo=;
 b=MYKWlPiWMM/6a7XOGT0RKqq20hwLhADKTt46DFtJegafJqX2dN+KbtWlZj30CATKrKeKjTyN41MX+hPuPFogHje+rVw6IYkIELgSvc9sDFH9DbiAGIbTGk6Rv2X3KEuGgjJkm/fsY0jzyM0POcwC+aAxjZO/OKnM/pm5VPNPyoGGEDG/TwIsrTBSbDPGfm/KIE987Nv3vPF3d3cn8oY/ZoTq2NDCZWc51YMXDMXLys2+kAEV02/gPnHVQp4YPRbA3gIfP9cWyCogwUYDVDtkfOoSZpT0eXyyDRAqNtIWzvIQ/R7FFIfQDHGQCbPTE8EzNB0pbCbGtd+NCKA/4/+0/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB6814.namprd11.prod.outlook.com (2603:10b6:a03:483::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 20:51:46 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 20:51:46 +0000
Date: Thu, 20 Mar 2025 13:52:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 7/7] drm/xe/userptr: replace xe_hmm with gpusvm
Message-ID: <Z9yAJ0PmaR9vnIUN@lstrano-desk.jf.intel.com>
References: <20250320172956.168358-9-matthew.auld@intel.com>
 <20250320172956.168358-16-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250320172956.168358-16-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0222.namprd04.prod.outlook.com
 (2603:10b6:303:87::17) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: 73434e4d-9a07-4a70-ac2d-08dd67f106eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?cWlG+S2MsK3dPgzXfAXEabry0ldhKYGQj47htsE/tXBrlOhNjadTSygwOo?=
 =?iso-8859-1?Q?u8ougyL8lEfU6Z8O3m7FByT8K2CPp627q+bDjKqvSWBnzNYBswt1SvO8/5?=
 =?iso-8859-1?Q?+l1DTP/rSlXRXVG1Ow+P9QfiWvtN8o0cIzpaZ9M7JlqVY96bkSel7jltlA?=
 =?iso-8859-1?Q?CA1TGphVmzMs/KvY7NQtXvyLgDBuOAV6LyLNF8phfnXL9SNmjK8yi0N92+?=
 =?iso-8859-1?Q?bviAegdl1H4KOQR7NJ8F1MW6kE1BWENX+ZW/DTY5A6Nexcq1vku/fp5PlZ?=
 =?iso-8859-1?Q?e/B8tfdGWRswWURIWDonEq+NZLk3Qr22FKaLQFY/s4C9SWBj2m6t+Njv8R?=
 =?iso-8859-1?Q?Oft97j+ZD9gL2XdsAobMJoGqAFlTLHMva0zdR19lK/IELfGpXfoC0RF4uM?=
 =?iso-8859-1?Q?mqTy+uM6gpCl+DHKASpSceBJLGF60DUXpOM4l065ASSjpNDRIucsyqTU29?=
 =?iso-8859-1?Q?CdXVGWtHeJIi/xRNM4fVGQgi01ibLdKI2UtXtky+7PZepGy+IhUJ2OF8Yd?=
 =?iso-8859-1?Q?J7nYWBWReIXZunnMwDC1n32i0z8BCs/sIZhLkzuPsrEh9udCIfLPo2EGie?=
 =?iso-8859-1?Q?1yaCw/x3JlVVKre3lLp8m7VZlJ6bqXzcFOkZ4VecqoTuegrSSViYB1BxxK?=
 =?iso-8859-1?Q?tJQH45rZnsuDn6J6s3ka/Je2eqUIUWyWT7oj/H8zHNhTOnm9OC7Hc4QJjS?=
 =?iso-8859-1?Q?wb8ROZrUUwDe8f2lAM2RvLvKJFAiv2rwN7KgS+m/IgXMiwkwR0pvtK6meh?=
 =?iso-8859-1?Q?bMbXilHgGTFfSgt44ZeuA0UJY5J02ibVPNguPmjvZU8vwVANlLHUdwKu1T?=
 =?iso-8859-1?Q?8e2GDQQX7BukZ/HkjkZe50j66SH9SPTDZhyCNl2RWMB40EsnEa/XVjH3qW?=
 =?iso-8859-1?Q?Hrx3qKXEEbG0cSVF1WQgKruiobNbKkUYUWfNCMpkBwSajTW3tx/0e1wZcG?=
 =?iso-8859-1?Q?thZs2P7Z05A2m5nw0G5BmukRZVFX5SR1b1T+CRiraTvFh8ujtUuDg522OV?=
 =?iso-8859-1?Q?toXxckg3hlIRg0pSHBrNCk2lMkJ9mDhwfY52Pg0zpbWSnYVhO6X5oELAhr?=
 =?iso-8859-1?Q?aMX7X/FGpnIjgsQeahJbW0cKO4uFZ1rzmQfz42Vxh+FGOHgtO8jPe/KliM?=
 =?iso-8859-1?Q?wWTvw3uRoRRxbSW0SFWFw/onRqNHtD28FvZ8cTuNYyrPL0iRGZr5P9KYJS?=
 =?iso-8859-1?Q?AWhW0LUzvX9xgQcE5vZtE8tdPPURoHdpsQ0LmreWrelFWIMQS7/x0nX55A?=
 =?iso-8859-1?Q?1mBlMNWUS34kjik0mkVB6+lUEkDwOd/TmVcg9SQSEDd+Iuzye18JcckohX?=
 =?iso-8859-1?Q?Vg9L70vvgqcwU3vS9hky2ifHel6s6FWaAVVu+8hw2QyCtMhLVbmwP2SbQY?=
 =?iso-8859-1?Q?9DQcDrUYwvIHv2TsOs5ymJTjPEenLzw8WPYM4AVTNhRbNyXc37Pn+Wdx8+?=
 =?iso-8859-1?Q?JmySDSNvgu4cr0Kj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KT7GJY/h3QgTsNC7xan0H5Kenz3COKlUQPq4PLS6E7pz272q3wrdoukrFG?=
 =?iso-8859-1?Q?kooGwf/x5vHHbSTfGxaPuJ91CEC+Fs97TtOp9xcWEGjiBmpOcrr80haWgR?=
 =?iso-8859-1?Q?vKSfQvyyrtA32uMMC28LxwwuDaI3Vnlu8NZEAi75gsQzcHT4c2TzEKh7s5?=
 =?iso-8859-1?Q?GSjYZ7TF9cmti1iaE/5Pr0M1X9uc1tLYnohDZ3bxMHSAjJR5K2oPsSpO7p?=
 =?iso-8859-1?Q?QvaqdbARZYqgwHAUMjgcU2GW2LUWjyNJs6PWzSc4uEw0VO3/YsAUuiFqAG?=
 =?iso-8859-1?Q?XLcDRMXxOPX388e337lZkWQ6hnWrAIN9nr5OaQvm1SyV1dUPKL59OJH2aU?=
 =?iso-8859-1?Q?ajtJzqEAsTJsYUxWPHPVvfw0fiplP5h8SZJlRMCBBffyxLQ2FMBM3R0mMd?=
 =?iso-8859-1?Q?VaDOCemwYpaO3vpgU5NmgskTFbhH59m+fSRcD4b+5H8WMwIQ0xRZlPEt1r?=
 =?iso-8859-1?Q?7C2dl1Yf15wJC/dGo1zI1K8NkcnwD6L+hj5DcWcKUhpBnxytvI51Aa86uN?=
 =?iso-8859-1?Q?DUJvNs5WJDENPiM/r6fcMXWx9BgBZAID/zXCOUrTvKB9pOAL5npuIq3Q2+?=
 =?iso-8859-1?Q?nLxDC4dTGnlrI6ZwPru44Ak81RFTKKxdPOs4yZvfECNYkdAVo2kGebILGO?=
 =?iso-8859-1?Q?8DtWQpcmC1zmcCOEtBFNBxJVpVo+vmrtdqy+p8WVm89amF5g9NKoqy6tPr?=
 =?iso-8859-1?Q?yIloNyZS4EI7mh/s4n96UKAjOT+kH2hN+nVMVjl9lNYn+6ZFLMFmHZMsX0?=
 =?iso-8859-1?Q?CX+HHtuqCAyt64HPSD3laSDxfpw8IgxXr5s3r3sdXzxW24QZmcZ+NTH4ok?=
 =?iso-8859-1?Q?kZ/fYwQDoi0XMhTdPARH0a/cpBnzUdwVRf+9smzcid/Grw2JAvCKE+v9JW?=
 =?iso-8859-1?Q?V5hg0YzAZXn2tOY3dEnFAQ1XW7tO1I4r6so4CsqaEAEt4RYxZjSCFwlhpk?=
 =?iso-8859-1?Q?sqaRvzGQGcasgSD3Zt5gKeEI/76xW+vINoJ9Cm3EQZtG+1JIHjr9gROVOT?=
 =?iso-8859-1?Q?V0mz+YinExwyLOuDsk8oznvQyeHgH0VTA9Ignk+WmwHb0INsMLCRFr4q1w?=
 =?iso-8859-1?Q?si/rryhisjJkmHZcthtY1l60Fvp0aciEITb/ogLDi9LE97pjAETRaX1yVS?=
 =?iso-8859-1?Q?uunGVTtp29ktTAys/1KHQ2+aNb2vTwPFP15VFM54bpSbQOyAeBoztyBws6?=
 =?iso-8859-1?Q?oRFA5XGjm6zv6Dc8zFPYWjwuJZLBbub6yfNIsst6FcZAbNRwPF0J4T3yuu?=
 =?iso-8859-1?Q?h9q7DsLo3ZKEf4Zj4sW+y8oYzBnn3gQOucf1K6eVcHn75ns8s1J5TvdWjh?=
 =?iso-8859-1?Q?bNMjffjmZgHEIRmhL+22/YAspjGeYWG8eEa1j7mbjrCjtuTXgr5Akk+lIC?=
 =?iso-8859-1?Q?W915ZS/o7gfRu3v/GaLn86lv3on7uKKg1hGbvgA2cLbV+ah9ZzDCBcRJ6T?=
 =?iso-8859-1?Q?aTi2Jmb6Wn1T0ZxOL/JNgEOejG8KZeWiNHtyqOdZgTbHIig3DuyA2CG7t9?=
 =?iso-8859-1?Q?nZYN6vdXXWiGIL1wBySVSpMc8Rc9pRAqIsTtLeRCwka4UPsAFx1jX9fXeb?=
 =?iso-8859-1?Q?Uj4LkdfrZB01gHfhyyxjCt0MzQUmAOZFrP4KIAHyI0HutfYYoo5Q71LIV0?=
 =?iso-8859-1?Q?Dnpvq0TkyizTfS/LmD4nY3EeqhgDjrB7NKup0QhtTuBCgTvIs8fXx7UQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73434e4d-9a07-4a70-ac2d-08dd67f106eb
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 20:51:46.0624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNu6ksm2p1PrEfZgwRzwRK/BCGnD01mxBocS+v9jU8bt2uxPIWJY7sDvs5A27DCijehPFPoXmEUJXO90HO1mfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6814
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

On Thu, Mar 20, 2025 at 05:30:04PM +0000, Matthew Auld wrote:
> Goal here is cut over to gpusvm and remove xe_hmm, relying instead on
> common code. The core facilities we need are get_pages(), unmap_pages()
> and free_pages() for a given useptr range, plus a vm level notifier
> lock, which is now provided by gpusvm.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile      |   1 -
>  drivers/gpu/drm/xe/xe_exec.c     |   4 +-
>  drivers/gpu/drm/xe/xe_hmm.c      | 349 -------------------------------
>  drivers/gpu/drm/xe/xe_hmm.h      |  18 --
>  drivers/gpu/drm/xe/xe_pt.c       |  20 +-
>  drivers/gpu/drm/xe/xe_vm.c       |  74 ++++---
>  drivers/gpu/drm/xe/xe_vm_types.h |  30 ++-
>  7 files changed, 70 insertions(+), 426 deletions(-)
>  delete mode 100644 drivers/gpu/drm/xe/xe_hmm.c
>  delete mode 100644 drivers/gpu/drm/xe/xe_hmm.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 9699b08585f7..ada1f0fad629 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -124,7 +124,6 @@ xe-y += xe_bb.o \
>  	xe_wait_user_fence.o \
>  	xe_wopcm.o
>  
> -xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
>  xe-$(CONFIG_DRM_GPUSVM) += xe_svm.o
>  
>  # graphics hardware monitoring (HWMON) support
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index b75adfc99fb7..84daeedd65d4 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -294,7 +294,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		if (err)
>  			goto err_put_job;
>  
> -		err = down_read_interruptible(&vm->userptr.notifier_lock);
> +		err = down_read_interruptible(&vm->userptr.gpusvm.notifier_lock);
>  		if (err)
>  			goto err_put_job;
>  
> @@ -336,7 +336,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  
>  err_repin:
>  	if (!xe_vm_in_lr_mode(vm))
> -		up_read(&vm->userptr.notifier_lock);
> +		up_read(&vm->userptr.gpusvm.notifier_lock);
>  err_put_job:
>  	if (err)
>  		xe_sched_job_put(job);
> diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
> deleted file mode 100644
> index c3cc0fa105e8..000000000000
> --- a/drivers/gpu/drm/xe/xe_hmm.c
> +++ /dev/null
> @@ -1,349 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -/*
> - * Copyright © 2024 Intel Corporation
> - */
> -
> -#include <linux/scatterlist.h>
> -#include <linux/mmu_notifier.h>
> -#include <linux/dma-mapping.h>
> -#include <linux/memremap.h>
> -#include <linux/swap.h>
> -#include <linux/hmm.h>
> -#include <linux/mm.h>
> -#include "xe_hmm.h"
> -#include "xe_vm.h"
> -#include "xe_bo.h"
> -
> -static u64 xe_npages_in_range(unsigned long start, unsigned long end)
> -{
> -	return (end - start) >> PAGE_SHIFT;
> -}
> -
> -/**
> - * xe_mark_range_accessed() - mark a range is accessed, so core mm
> - * have such information for memory eviction or write back to
> - * hard disk
> - * @range: the range to mark
> - * @write: if write to this range, we mark pages in this range
> - * as dirty
> - */
> -static void xe_mark_range_accessed(struct hmm_range *range, bool write)
> -{
> -	struct page *page;
> -	u64 i, npages;
> -
> -	npages = xe_npages_in_range(range->start, range->end);
> -	for (i = 0; i < npages; i++) {
> -		page = hmm_pfn_to_page(range->hmm_pfns[i]);
> -		if (write)
> -			set_page_dirty_lock(page);
> -
> -		mark_page_accessed(page);
> -	}
> -}
> -
> -static int xe_alloc_sg(struct xe_device *xe, struct sg_table *st,
> -		       struct hmm_range *range, struct rw_semaphore *notifier_sem)
> -{
> -	unsigned long i, npages, hmm_pfn;
> -	unsigned long num_chunks = 0;
> -	int ret;
> -
> -	/* HMM docs says this is needed. */
> -	ret = down_read_interruptible(notifier_sem);
> -	if (ret)
> -		return ret;
> -
> -	if (mmu_interval_read_retry(range->notifier, range->notifier_seq)) {
> -		up_read(notifier_sem);
> -		return -EAGAIN;
> -	}
> -
> -	npages = xe_npages_in_range(range->start, range->end);
> -	for (i = 0; i < npages;) {
> -		unsigned long len;
> -
> -		hmm_pfn = range->hmm_pfns[i];
> -		xe_assert(xe, hmm_pfn & HMM_PFN_VALID);
> -
> -		len = 1UL << hmm_pfn_to_map_order(hmm_pfn);
> -
> -		/* If order > 0 the page may extend beyond range->start */
> -		len -= (hmm_pfn & ~HMM_PFN_FLAGS) & (len - 1);
> -		i += len;
> -		num_chunks++;
> -	}
> -	up_read(notifier_sem);
> -
> -	return sg_alloc_table(st, num_chunks, GFP_KERNEL);
> -}
> -
> -/**
> - * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
> - * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
> - * and will be used to program GPU page table later.
> - * @xe: the xe device who will access the dma-address in sg table
> - * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
> - * has the pfn numbers of pages that back up this hmm address range.
> - * @st: pointer to the sg table.
> - * @notifier_sem: The xe notifier lock.
> - * @write: whether we write to this range. This decides dma map direction
> - * for system pages. If write we map it bi-diretional; otherwise
> - * DMA_TO_DEVICE
> - *
> - * All the contiguous pfns will be collapsed into one entry in
> - * the scatter gather table. This is for the purpose of efficiently
> - * programming GPU page table.
> - *
> - * The dma_address in the sg table will later be used by GPU to
> - * access memory. So if the memory is system memory, we need to
> - * do a dma-mapping so it can be accessed by GPU/DMA.
> - *
> - * FIXME: This function currently only support pages in system
> - * memory. If the memory is GPU local memory (of the GPU who
> - * is going to access memory), we need gpu dpa (device physical
> - * address), and there is no need of dma-mapping. This is TBD.
> - *
> - * FIXME: dma-mapping for peer gpu device to access remote gpu's
> - * memory. Add this when you support p2p
> - *
> - * This function allocates the storage of the sg table. It is
> - * caller's responsibility to free it calling sg_free_table.
> - *
> - * Returns 0 if successful; -ENOMEM if fails to allocate memory
> - */
> -static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
> -		       struct sg_table *st,
> -		       struct rw_semaphore *notifier_sem,
> -		       bool write)
> -{
> -	unsigned long npages = xe_npages_in_range(range->start, range->end);
> -	struct device *dev = xe->drm.dev;
> -	struct scatterlist *sgl;
> -	struct page *page;
> -	unsigned long i, j;
> -
> -	lockdep_assert_held(notifier_sem);
> -
> -	i = 0;
> -	for_each_sg(st->sgl, sgl, st->nents, j) {
> -		unsigned long hmm_pfn, size;
> -
> -		hmm_pfn = range->hmm_pfns[i];
> -		page = hmm_pfn_to_page(hmm_pfn);
> -		xe_assert(xe, !is_device_private_page(page));
> -
> -		size = 1UL << hmm_pfn_to_map_order(hmm_pfn);
> -		size -= page_to_pfn(page) & (size - 1);
> -		i += size;
> -
> -		if (unlikely(j == st->nents - 1)) {
> -			xe_assert(xe, i >= npages);
> -			if (i > npages)
> -				size -= (i - npages);
> -
> -			sg_mark_end(sgl);
> -		} else {
> -			xe_assert(xe, i < npages);
> -		}
> -
> -		sg_set_page(sgl, page, size << PAGE_SHIFT, 0);
> -	}
> -
> -	return dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
> -			       DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
> -}
> -
> -static void xe_hmm_userptr_set_mapped(struct xe_userptr_vma *uvma)
> -{
> -	struct xe_userptr *userptr = &uvma->userptr;
> -	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> -
> -	lockdep_assert_held_write(&vm->lock);
> -	lockdep_assert_held(&vm->userptr.notifier_lock);
> -
> -	mutex_lock(&userptr->unmap_mutex);
> -	xe_assert(vm->xe, !userptr->mapped);
> -	userptr->mapped = true;
> -	mutex_unlock(&userptr->unmap_mutex);
> -}
> -
> -void xe_hmm_userptr_unmap(struct xe_userptr_vma *uvma)
> -{
> -	struct xe_userptr *userptr = &uvma->userptr;
> -	struct xe_vma *vma = &uvma->vma;
> -	bool write = !xe_vma_read_only(vma);
> -	struct xe_vm *vm = xe_vma_vm(vma);
> -	struct xe_device *xe = vm->xe;
> -
> -	if (!lockdep_is_held_type(&vm->userptr.notifier_lock, 0) &&
> -	    !lockdep_is_held_type(&vm->lock, 0) &&
> -	    !(vma->gpuva.flags & XE_VMA_DESTROYED)) {
> -		/* Don't unmap in exec critical section. */
> -		xe_vm_assert_held(vm);
> -		/* Don't unmap while mapping the sg. */
> -		lockdep_assert_held(&vm->lock);
> -	}
> -
> -	mutex_lock(&userptr->unmap_mutex);
> -	if (userptr->sg && userptr->mapped)
> -		dma_unmap_sgtable(xe->drm.dev, userptr->sg,
> -				  write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);
> -	userptr->mapped = false;
> -	mutex_unlock(&userptr->unmap_mutex);
> -}
> -
> -/**
> - * xe_hmm_userptr_free_sg() - Free the scatter gather table of userptr
> - * @uvma: the userptr vma which hold the scatter gather table
> - *
> - * With function xe_userptr_populate_range, we allocate storage of
> - * the userptr sg table. This is a helper function to free this
> - * sg table, and dma unmap the address in the table.
> - */
> -void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma)
> -{
> -	struct xe_userptr *userptr = &uvma->userptr;
> -
> -	xe_assert(xe_vma_vm(&uvma->vma)->xe, userptr->sg);
> -	xe_hmm_userptr_unmap(uvma);
> -	sg_free_table(userptr->sg);
> -	userptr->sg = NULL;
> -}
> -
> -/**
> - * xe_hmm_userptr_populate_range() - Populate physical pages of a virtual
> - * address range
> - *
> - * @uvma: userptr vma which has information of the range to populate.
> - * @is_mm_mmap_locked: True if mmap_read_lock is already acquired by caller.
> - *
> - * This function populate the physical pages of a virtual
> - * address range. The populated physical pages is saved in
> - * userptr's sg table. It is similar to get_user_pages but call
> - * hmm_range_fault.
> - *
> - * This function also read mmu notifier sequence # (
> - * mmu_interval_read_begin), for the purpose of later
> - * comparison (through mmu_interval_read_retry).
> - *
> - * This must be called with mmap read or write lock held.
> - *
> - * This function allocates the storage of the userptr sg table.
> - * It is caller's responsibility to free it calling sg_free_table.
> - *
> - * returns: 0 for success; negative error no on failure
> - */
> -int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
> -				  bool is_mm_mmap_locked)
> -{
> -	unsigned long timeout =
> -		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> -	unsigned long *pfns;
> -	struct xe_userptr *userptr;
> -	struct xe_vma *vma = &uvma->vma;
> -	u64 userptr_start = xe_vma_userptr(vma);
> -	u64 userptr_end = userptr_start + xe_vma_size(vma);
> -	struct xe_vm *vm = xe_vma_vm(vma);
> -	struct hmm_range hmm_range = {
> -		.pfn_flags_mask = 0, /* ignore pfns */
> -		.default_flags = HMM_PFN_REQ_FAULT,
> -		.start = userptr_start,
> -		.end = userptr_end,
> -		.notifier = &uvma->userptr.notifier,
> -		.dev_private_owner = vm->xe,
> -	};
> -	bool write = !xe_vma_read_only(vma);
> -	unsigned long notifier_seq;
> -	u64 npages;
> -	int ret;
> -
> -	userptr = &uvma->userptr;
> -
> -	if (is_mm_mmap_locked)
> -		mmap_assert_locked(userptr->notifier.mm);
> -
> -	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> -		return 0;
> -
> -	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
> -	if (notifier_seq == userptr->notifier_seq)
> -		return 0;
> -
> -	if (userptr->sg)
> -		xe_hmm_userptr_free_sg(uvma);
> -
> -	npages = xe_npages_in_range(userptr_start, userptr_end);
> -	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> -	if (unlikely(!pfns))
> -		return -ENOMEM;
> -
> -	if (write)
> -		hmm_range.default_flags |= HMM_PFN_REQ_WRITE;
> -
> -	if (!mmget_not_zero(userptr->notifier.mm)) {
> -		ret = -EFAULT;
> -		goto free_pfns;
> -	}
> -
> -	hmm_range.hmm_pfns = pfns;
> -
> -	while (true) {
> -		hmm_range.notifier_seq = mmu_interval_read_begin(&userptr->notifier);
> -
> -		if (!is_mm_mmap_locked)
> -			mmap_read_lock(userptr->notifier.mm);
> -
> -		ret = hmm_range_fault(&hmm_range);
> -
> -		if (!is_mm_mmap_locked)
> -			mmap_read_unlock(userptr->notifier.mm);
> -
> -		if (ret == -EBUSY) {
> -			if (time_after(jiffies, timeout))
> -				break;
> -
> -			continue;
> -		}
> -		break;
> -	}
> -
> -	mmput(userptr->notifier.mm);
> -
> -	if (ret)
> -		goto free_pfns;
> -
> -	ret = xe_alloc_sg(vm->xe, &userptr->sgt, &hmm_range, &vm->userptr.notifier_lock);
> -	if (ret)
> -		goto free_pfns;
> -
> -	ret = down_read_interruptible(&vm->userptr.notifier_lock);
> -	if (ret)
> -		goto free_st;
> -
> -	if (mmu_interval_read_retry(hmm_range.notifier, hmm_range.notifier_seq)) {
> -		ret = -EAGAIN;
> -		goto out_unlock;
> -	}
> -
> -	ret = xe_build_sg(vm->xe, &hmm_range, &userptr->sgt,
> -			  &vm->userptr.notifier_lock, write);
> -	if (ret)
> -		goto out_unlock;
> -
> -	xe_mark_range_accessed(&hmm_range, write);
> -	userptr->sg = &userptr->sgt;
> -	xe_hmm_userptr_set_mapped(uvma);
> -	userptr->notifier_seq = hmm_range.notifier_seq;
> -	up_read(&vm->userptr.notifier_lock);
> -	kvfree(pfns);
> -	return 0;
> -
> -out_unlock:
> -	up_read(&vm->userptr.notifier_lock);
> -free_st:
> -	sg_free_table(&userptr->sgt);
> -free_pfns:
> -	kvfree(pfns);
> -	return ret;
> -}
> diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
> deleted file mode 100644
> index 0ea98d8e7bbc..000000000000
> --- a/drivers/gpu/drm/xe/xe_hmm.h
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -/* SPDX-License-Identifier: MIT
> - *
> - * Copyright © 2024 Intel Corporation
> - */
> -
> -#ifndef _XE_HMM_H_
> -#define _XE_HMM_H_
> -
> -#include <linux/types.h>
> -
> -struct xe_userptr_vma;
> -
> -int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_mm_mmap_locked);
> -
> -void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma);
> -
> -void xe_hmm_userptr_unmap(struct xe_userptr_vma *uvma);
> -#endif
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index c43e7619cb80..824bf99e5f71 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -727,8 +727,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  
>  	if (!xe_vma_is_null(vma) && !range) {
>  		if (xe_vma_is_userptr(vma))
> -			xe_res_first_sg(to_userptr_vma(vma)->userptr.sg, 0,
> -					xe_vma_size(vma), &curs);
> +			xe_res_first_dma(to_userptr_vma(vma)->userptr.range.pages.dma_addr, 0,
> +					 xe_vma_size(vma), &curs);
>  		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
>  			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
>  				     xe_vma_size(vma), &curs);
> @@ -998,7 +998,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
>  	xe_pt_commit_prepare_locks_assert(vma);
>  
>  	if (xe_vma_is_userptr(vma))
> -		lockdep_assert_held_read(&vm->userptr.notifier_lock);
> +		lockdep_assert_held_read(&vm->userptr.gpusvm.notifier_lock);
>  }
>  
>  static void xe_pt_commit(struct xe_vma *vma,
> @@ -1336,7 +1336,7 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
>  	struct xe_userptr_vma *uvma;
>  	unsigned long notifier_seq;
>  
> -	lockdep_assert_held_read(&vm->userptr.notifier_lock);
> +	lockdep_assert_held_read(&vm->userptr.gpusvm.notifier_lock);
>  
>  	if (!xe_vma_is_userptr(vma))
>  		return 0;
> @@ -1366,7 +1366,7 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
>  {
>  	int err = 0;
>  
> -	lockdep_assert_held_read(&vm->userptr.notifier_lock);
> +	lockdep_assert_held_read(&vm->userptr.gpusvm.notifier_lock);
>  
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> @@ -1407,12 +1407,12 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	if (err)
>  		return err;
>  
> -	down_read(&vm->userptr.notifier_lock);
> +	down_read(&vm->userptr.gpusvm.notifier_lock);
>  
>  	list_for_each_entry(op, &vops->list, link) {
>  		err = op_check_userptr(vm, op, pt_update_ops);
>  		if (err) {
> -			up_read(&vm->userptr.notifier_lock);
> +			up_read(&vm->userptr.gpusvm.notifier_lock);
>  			break;
>  		}
>  	}
> @@ -2133,7 +2133,7 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>  	vma->tile_present |= BIT(tile->id);
>  	vma->tile_staged &= ~BIT(tile->id);
>  	if (xe_vma_is_userptr(vma)) {
> -		lockdep_assert_held_read(&vm->userptr.notifier_lock);
> +		lockdep_assert_held_read(&vm->userptr.gpusvm.notifier_lock);
>  		to_userptr_vma(vma)->userptr.initial_bind = true;
>  	}
>  
> @@ -2169,7 +2169,7 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>  	if (!vma->tile_present) {
>  		list_del_init(&vma->combined_links.rebind);
>  		if (xe_vma_is_userptr(vma)) {
> -			lockdep_assert_held_read(&vm->userptr.notifier_lock);
> +			lockdep_assert_held_read(&vm->userptr.gpusvm.notifier_lock);
>  
>  			spin_lock(&vm->userptr.invalidated_lock);
>  			list_del_init(&to_userptr_vma(vma)->userptr.invalidate_link);
> @@ -2414,7 +2414,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  	if (pt_update_ops->needs_svm_lock)
>  		xe_svm_notifier_unlock(vm);
>  	if (pt_update_ops->needs_userptr_lock)
> -		up_read(&vm->userptr.notifier_lock);
> +		up_read(&vm->userptr.gpusvm.notifier_lock);
>  
>  	return fence;
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 60303998bd61..fdc24718b9ad 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_vm.h"
>  
> +#include "drm/drm_gpusvm.h"
>  #include <linux/dma-fence-array.h>
>  #include <linux/nospec.h>
>  
> @@ -40,7 +41,6 @@
>  #include "xe_sync.h"
>  #include "xe_trace_bo.h"
>  #include "xe_wa.h"
> -#include "xe_hmm.h"
>  
>  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>  {
> @@ -53,7 +53,7 @@ static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>   *
>   * Check if the userptr vma has been invalidated since last successful
>   * repin. The check is advisory only and can the function can be called
> - * without the vm->userptr.notifier_lock held. There is no guarantee that the
> + * without the vm->userptr.gpusvm.notifier_lock held. There is no guarantee that the
>   * vma userptr will remain valid after a lockless check, so typically
>   * the call needs to be followed by a proper check under the notifier_lock.
>   *
> @@ -71,11 +71,17 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>  	struct xe_vma *vma = &uvma->vma;
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  	struct xe_device *xe = vm->xe;
> +	struct drm_gpusvm_ctx ctx = {
> +		.read_only = xe_vma_read_only(vma),
> +	};
>  
>  	lockdep_assert_held(&vm->lock);
>  	xe_assert(xe, xe_vma_is_userptr(vma));
>  
> -	return xe_hmm_userptr_populate_range(uvma, false);
> +	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> +		return 0;
> +
> +	return drm_gpusvm_basic_range_get_pages(&uvma->userptr.range, &ctx);
>  }
>  
>  static bool preempt_fences_waiting(struct xe_vm *vm)
> @@ -249,7 +255,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  	++vm->preempt.num_exec_queues;
>  	q->lr.pfence = pfence;
>  
> -	down_read(&vm->userptr.notifier_lock);
> +	down_read(&vm->userptr.gpusvm.notifier_lock);
>  
>  	drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, pfence,
>  				 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_BOOKKEEP);
> @@ -263,7 +269,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  	if (wait)
>  		dma_fence_enable_sw_signaling(pfence);
>  
> -	up_read(&vm->userptr.notifier_lock);
> +	up_read(&vm->userptr.gpusvm.notifier_lock);
>  
>  out_fini:
>  	drm_exec_fini(exec);
> @@ -305,14 +311,14 @@ void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>   * @vm: The VM.
>   *
>   * This function checks for whether the VM has userptrs that need repinning,
> - * and provides a release-type barrier on the userptr.notifier_lock after
> + * and provides a release-type barrier on the userptr.gpusvm.notifier_lock after
>   * checking.
>   *
>   * Return: 0 if there are no userptrs needing repinning, -EAGAIN if there are.
>   */
>  int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
>  {
> -	lockdep_assert_held_read(&vm->userptr.notifier_lock);
> +	lockdep_assert_held_read(&vm->userptr.gpusvm.notifier_lock);
>  
>  	return (list_empty(&vm->userptr.repin_list) &&
>  		list_empty(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
> @@ -546,9 +552,9 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	(!(__tries)++ || __xe_vm_userptr_needs_repin(__vm)) : \
>  	__xe_vm_userptr_needs_repin(__vm))
>  
> -	down_read(&vm->userptr.notifier_lock);
> +	down_read(&vm->userptr.gpusvm.notifier_lock);
>  	if (retry_required(tries, vm)) {
> -		up_read(&vm->userptr.notifier_lock);
> +		up_read(&vm->userptr.gpusvm.notifier_lock);
>  		err = -EAGAIN;
>  		goto out_unlock;
>  	}
> @@ -562,7 +568,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	/* Point of no return. */
>  	arm_preempt_fences(vm, &preempt_fences);
>  	resume_and_reinstall_preempt_fences(vm, &exec);
> -	up_read(&vm->userptr.notifier_lock);
> +	up_read(&vm->userptr.gpusvm.notifier_lock);
>  
>  out_unlock:
>  	drm_exec_fini(&exec);
> @@ -589,6 +595,9 @@ static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uv
>  	struct xe_vma *vma = &uvma->vma;
>  	struct dma_resv_iter cursor;
>  	struct dma_fence *fence;
> +	struct drm_gpusvm_ctx ctx = {
> +		.in_notifier = true,
> +	};
>  	long err;
>  
>  	/*
> @@ -625,7 +634,7 @@ static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uv
>  		XE_WARN_ON(err);
>  	}
>  
> -	xe_hmm_userptr_unmap(uvma);
> +	drm_gpusvm_basic_range_unmap_pages(&uvma->userptr.range, &ctx);
>  }
>  
>  static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
> @@ -646,11 +655,11 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>  	       "NOTIFIER: addr=0x%016llx, range=0x%016llx",
>  		xe_vma_start(vma), xe_vma_size(vma));
>  
> -	down_write(&vm->userptr.notifier_lock);
> +	down_write(&vm->userptr.gpusvm.notifier_lock);
>  	mmu_interval_set_seq(mni, cur_seq);
>  
>  	__vma_userptr_invalidate(vm, uvma);
> -	up_write(&vm->userptr.notifier_lock);
> +	up_write(&vm->userptr.gpusvm.notifier_lock);
>  	trace_xe_vma_userptr_invalidate_complete(vma);
>  
>  	return true;
> @@ -674,7 +683,7 @@ void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
>  	/* Protect against concurrent userptr pinning */
>  	lockdep_assert_held(&vm->lock);
>  	/* Protect against concurrent notifiers */
> -	lockdep_assert_held(&vm->userptr.notifier_lock);
> +	lockdep_assert_held(&vm->userptr.gpusvm.notifier_lock);
>  	/*
>  	 * Protect against concurrent instances of this function and
>  	 * the critical exec sections
> @@ -747,7 +756,7 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>  	}
>  
>  	if (err) {
> -		down_write(&vm->userptr.notifier_lock);
> +		down_write(&vm->userptr.gpusvm.notifier_lock);
>  		spin_lock(&vm->userptr.invalidated_lock);
>  		list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
>  					 userptr.repin_link) {
> @@ -756,7 +765,7 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>  				       &vm->userptr.invalidated);
>  		}
>  		spin_unlock(&vm->userptr.invalidated_lock);
> -		up_write(&vm->userptr.notifier_lock);
> +		up_write(&vm->userptr.gpusvm.notifier_lock);
>  	}
>  	return err;
>  }
> @@ -1222,7 +1231,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  			INIT_LIST_HEAD(&userptr->invalidate_link);
>  			INIT_LIST_HEAD(&userptr->repin_link);
>  			vma->gpuva.gem.offset = bo_offset_or_userptr;
> -			mutex_init(&userptr->unmap_mutex);
>  
>  			err = mmu_interval_notifier_insert(&userptr->notifier,
>  							   current->mm,
> @@ -1233,7 +1241,10 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  				return ERR_PTR(err);
>  			}
>  
> -			userptr->notifier_seq = LONG_MAX;
> +			drm_gpusvm_basic_range_init(&vm->userptr.gpusvm,
> +						    &userptr->range,
> +						    &userptr->notifier,
> +						    &userptr->notifier_seq);
>  		}
>  
>  		xe_vm_get(vm);
> @@ -1255,8 +1266,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>  		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
>  		struct xe_userptr *userptr = &uvma->userptr;
>  
> -		if (userptr->sg)
> -			xe_hmm_userptr_free_sg(uvma);
> +		drm_gpusvm_basic_range_free_pages(&uvma->userptr.range);
>  
>  		/*
>  		 * Since userptr pages are not pinned, we can't remove
> @@ -1264,7 +1274,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>  		 * them anymore
>  		 */
>  		mmu_interval_notifier_remove(&userptr->notifier);
> -		mutex_destroy(&userptr->unmap_mutex);
> +		drm_gpusvm_basic_range_fini(&uvma->userptr.range);
>  		xe_vm_put(vm);
>  	} else if (xe_vma_is_null(vma) || xe_vma_is_cpu_addr_mirror(vma)) {
>  		xe_vm_put(vm);
> @@ -1657,7 +1667,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  
>  	INIT_LIST_HEAD(&vm->userptr.repin_list);
>  	INIT_LIST_HEAD(&vm->userptr.invalidated);
> -	init_rwsem(&vm->userptr.notifier_lock);
>  	spin_lock_init(&vm->userptr.invalidated_lock);
>  
>  	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> @@ -1763,6 +1772,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  			goto err_close;
>  	}
>  
> +	drm_gpusvm_basic_init(&vm->userptr.gpusvm, "xe-vm-userptr", &xe->drm);
> +	drm_gpusvm_driver_set_lock(&vm->userptr.gpusvm, &vm->lock);
> +
>  	if (number_tiles > 1)
>  		vm->composite_fence_ctx = dma_fence_context_alloc(1);
>  
> @@ -1867,9 +1879,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  		vma = gpuva_to_vma(gpuva);
>  
>  		if (xe_vma_has_no_bo(vma)) {
> -			down_read(&vm->userptr.notifier_lock);
> +			down_read(&vm->userptr.gpusvm.notifier_lock);
>  			vma->gpuva.flags |= XE_VMA_DESTROYED;
> -			up_read(&vm->userptr.notifier_lock);
> +			up_read(&vm->userptr.gpusvm.notifier_lock);
>  		}
>  
>  		xe_vm_remove_vma(vm, vma);
> @@ -1916,6 +1928,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	if (xe_vm_in_fault_mode(vm))
>  		xe_svm_fini(vm);
>  
> +	drm_gpusvm_basic_fini(&vm->userptr.gpusvm);
> +
>  	up_write(&vm->lock);
>  
>  	down_write(&xe->usm.lock);
> @@ -2144,9 +2158,9 @@ static const u32 region_to_mem_type[] = {
>  static void prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
>  			     bool post_commit)
>  {
> -	down_read(&vm->userptr.notifier_lock);
> +	down_read(&vm->userptr.gpusvm.notifier_lock);
>  	vma->gpuva.flags |= XE_VMA_DESTROYED;
> -	up_read(&vm->userptr.notifier_lock);
> +	up_read(&vm->userptr.gpusvm.notifier_lock);
>  	if (post_commit)
>  		xe_vm_remove_vma(vm, vma);
>  }
> @@ -2625,9 +2639,9 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>  		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
>  
>  		if (vma) {
> -			down_read(&vm->userptr.notifier_lock);
> +			down_read(&vm->userptr.gpusvm.notifier_lock);
>  			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> -			up_read(&vm->userptr.notifier_lock);
> +			up_read(&vm->userptr.gpusvm.notifier_lock);
>  			if (post_commit)
>  				xe_vm_insert_vma(vm, vma);
>  		}
> @@ -2646,9 +2660,9 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>  			xe_vma_destroy_unlocked(op->remap.next);
>  		}
>  		if (vma) {
> -			down_read(&vm->userptr.notifier_lock);
> +			down_read(&vm->userptr.gpusvm.notifier_lock);
>  			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> -			up_read(&vm->userptr.notifier_lock);
> +			up_read(&vm->userptr.gpusvm.notifier_lock);
>  			if (post_commit)
>  				xe_vm_insert_vma(vm, vma);
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 84fa41b9fa20..08f295873a2b 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -52,26 +52,23 @@ struct xe_userptr {
>  	struct list_head invalidate_link;
>  	/** @userptr: link into VM repin list if userptr. */
>  	struct list_head repin_link;
> +	/**
> +	 * @range: gpusvm range for this user pointer.
> +	 */
> +	struct drm_gpusvm_basic_range range;
>  	/**
>  	 * @notifier: MMU notifier for user pointer (invalidation call back)
>  	 */
>  	struct mmu_interval_notifier notifier;
> -	/** @sgt: storage for a scatter gather table */
> -	struct sg_table sgt;
> -	/** @sg: allocated scatter gather table */
> -	struct sg_table *sg;
> +
>  	/** @notifier_seq: notifier sequence number */
>  	unsigned long notifier_seq;
> -	/** @unmap_mutex: Mutex protecting dma-unmapping */
> -	struct mutex unmap_mutex;
>  	/**
>  	 * @initial_bind: user pointer has been bound at least once.
> -	 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
> -	 * read: vm->userptr.notifier_lock in write mode or vm->resv held.
> +	 * write: vm->userptr.gpusvm.notifier_lock in read mode and vm->resv held.
> +	 * read: vm->userptr.gpusvm.notifier_lock in write mode or vm->resv held.
>  	 */
>  	bool initial_bind;
> -	/** @mapped: Whether the @sgt sg-table is dma-mapped. Protected by @unmap_mutex. */
> -	bool mapped;
>  #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
>  	u32 divisor;
>  #endif
> @@ -109,7 +106,7 @@ struct xe_vma {
>  	/**
>  	 * @tile_present: GT mask of binding are present for this VMA.
>  	 * protected by vm->lock, vm->resv and for userptrs,
> -	 * vm->userptr.notifier_lock for writing. Needs either for reading,
> +	 * vm->userptr.gpusvm.notifier_lock for writing. Needs either for reading,
>  	 * but if reading is done under the vm->lock only, it needs to be held
>  	 * in write mode.
>  	 */
> @@ -238,16 +235,17 @@ struct xe_vm {
>  
>  	/** @userptr: user pointer state */
>  	struct {
> +		/*
> +		 * @gpusvm: The gpusvm userptr for this vm. The
> +		 * gpusvm.notifier_lock protects notifier in write mode and
> +		 * submission in read mode.
> +		 */
> +		struct drm_gpusvm gpusvm;

This is not a full review, but I believe the notifier lock should be
shared between SVM and userptr (i.e., we should have a single drm_gpusvm
structure for both). The reasoning is that if we prefetch both SVM
ranges and userptr within the same list of VM bind operations, we take a
single lock at the final step for both. Following this approach,
xe_pt_userptr_pre_commit and xe_pt_svm_pre_commit would be merged into a
single function.

+Himal, Thomas to see if they agree with me here.

Matt

>  		/**
>  		 * @userptr.repin_list: list of VMAs which are user pointers,
>  		 * and needs repinning. Protected by @lock.
>  		 */
>  		struct list_head repin_list;
> -		/**
> -		 * @notifier_lock: protects notifier in write mode and
> -		 * submission in read mode.
> -		 */
> -		struct rw_semaphore notifier_lock;
>  		/**
>  		 * @userptr.invalidated_lock: Protects the
>  		 * @userptr.invalidated list.
> -- 
> 2.48.1
> 
