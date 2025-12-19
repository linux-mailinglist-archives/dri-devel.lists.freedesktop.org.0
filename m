Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1EACD0800
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 16:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6774710F024;
	Fri, 19 Dec 2025 15:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UatoXraz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1493F10F023;
 Fri, 19 Dec 2025 15:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766158196; x=1797694196;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l4wQ1QAsp76M46+jyXSooXNN16kZvbJ63EUOwVDsuNk=;
 b=UatoXraz+bDJD5/pJGuCH1lIodu3jDUD0v9f7y3/cCe+9s6ZUr+UpIiP
 gxk+m/2KGWlQt85Ej39Nrv61DFNV+a3Ktdtc/Zv/lvFfJzh3+COy2r3Q4
 HzeKd1ckn5DYJB3eF1ELbNNusAc2FvTv5PHY9u1LXMDplbwiiNxxJ6sA2
 H5oUt9NLUjD80nCHLY6m8t83A0HOOT6pSkPVshkZLdmmk5M4h8JkJOUGM
 b4KeZf6VADDCL26ryumDmzmRTbzL9Tp8vI6uA+5NYRr9vx4sdFHSiLhgV
 lVIfR3wGT3sI5J4SgjjxjDw5r+wUR6DaKNKX3E4NhvXUjp+IzJNwMGLGQ Q==;
X-CSE-ConnectionGUID: 0uvjkkspT/SCpETPZPQ5vQ==
X-CSE-MsgGUID: pA8EhgrYRw+WJPp5so4gSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="90777226"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="90777226"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 07:29:56 -0800
X-CSE-ConnectionGUID: ZKFVl4BBQeGsyWGZ3wFKwQ==
X-CSE-MsgGUID: +OJhvPFEQ9Ovk60O02GGWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="236312240"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 07:29:56 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 07:29:54 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 07:29:54 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 07:29:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDTXPIseUVuJeS+96SylBGvlgVUwjUD8kKNsbLJyaF4E3Yi9SSPt8+1JZdiG/il8K7laao2bPPPAhLrrrn61obvdtK5K99da6SJF18PhsfWxP3Adynl4XV8epnoGmA2JgVUU/gU+1FF9MqDNOwg7vT4WPKAv4HHM+K0VPXQaDADXOT3OXm3Jd20iyHOAmKpvhthRvyLBnYvw8z0nIJAlmJ2Qj51Vb1r8Xt7+5VPAewyzJJ6Uc1sCe0VYl5s+5QCx9RVx7dyXBV5YtwHeR3g52b+83h9ZglL6ox+DdV/sD6XN0n7J8v2M+26BROvqU8BfwAUxsnY0bAfRdM1Z8MNZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPo2TLqGgu5zjmH+yH4+gccevF6+T2dg9uUiLQB/oOs=;
 b=q6mxzk9hbvvPW7xktu5NM+HKfWbjwcXJVQXrU5L4m8+yFk7dowh/zM4D5UmPX2MnwiJ3JVapI1qMo0BW/mb1FWXcCWCnANtF1ijq4KnOdv6o7peHqf/YTeOkETIjUUCJdvqAiDD5pyZH96169Wobhju52zjjLvZmADSsNaRyhO/HEyyHmd2gHLGeErka0gmkn9oKgckIMDm47UCOTeurEfmpVXiLtFhnnOjnfEKhoDR9AglvoDYlMRXuVMQCUziwbsrmiiWNRz5+jmbOipZOBjYQCpOZcHoBNYWOGQ456/l99RLmDj8uelX3UrAm9355VsKv3IrgbDML/nSRGLH5qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH7PR11MB6674.namprd11.prod.outlook.com (2603:10b6:510:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 15:29:52 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 15:29:52 +0000
Date: Fri, 19 Dec 2025 16:29:40 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/pagemap: Add helper to access zone_device_data
Message-ID: <aUVvZIhuQu5L_I8O@fdugast-desk>
References: <20251216201206.1660899-1-francois.dugast@intel.com>
 <20251216201206.1660899-4-francois.dugast@intel.com>
 <aUR97HW9UGMHObuf@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aUR97HW9UGMHObuf@lstrano-desk.jf.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0348.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::9) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH7PR11MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: a3929118-f47e-49b4-4ae0-08de3f13740d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3QF/wCCVCVoaP6xymdStjALtoU+gfU7vtBj8j27g2lFodWVgfjQmUpTiBJW+?=
 =?us-ascii?Q?kMXTbE4PbFY88Sqkh7mkf1fcQG9kxX5vuW7ytQns2OVE16tZxV0DKBCytwdM?=
 =?us-ascii?Q?30clkuURw5f5m4M6PwAhtk9D1F1Qxs6+Vm5qj3xhe/m7rrIb+Kyth94yk9cD?=
 =?us-ascii?Q?no+oykj0PDwMS2Y94fdWFDyce53bGqgI5TGciynLozZa8qzSuC0GVAvOk3hF?=
 =?us-ascii?Q?RFNCbQRHZaPaBXjl0OaOfrJ01Ela1C+uxyj5YCVO8DjSUjKDrCSWobyR1+cE?=
 =?us-ascii?Q?IFt/bnanhhvcAXG7BAu7djessUV3iMAPMTGS+yTtxXdT8fkBDA9mL7o6CRan?=
 =?us-ascii?Q?g2ZY/KU41yeZV/clc/srpPXWjGUrUL9ydhlwoT06OoTvkAubEOLucu8+RGd9?=
 =?us-ascii?Q?OK9ZaWHqQ8EIyB/mUNB1OK1NgMs964bc+GMTYfHVTUdo01l3FwlTteAouank?=
 =?us-ascii?Q?v0iC3jZk/MbsnYtp1zhxaljKW5D1Lfg+u88g926uuBtK8BJ4bKGL71eJ4Zot?=
 =?us-ascii?Q?xvqCcw6R/0qDW9coNxLIWJ8k50/ZB8U4esHEwWH55aROiiwbqAg1Gg/cCSkb?=
 =?us-ascii?Q?PHhjclhVk1hYzHAjvq7KPB8K62i72UCjwcXjH6IV1SNfpGBpxUtLT2+Lr4u1?=
 =?us-ascii?Q?pA9ujeu906VE1c++BQiXetpWjZOWYC6MkwXboUscA9ibvmIHJHsscjMR/YB2?=
 =?us-ascii?Q?knOKVPO6Fi0un5qPjVbBGQimecbY8b4bZyF+39Vy8lF8Au4+WzVB8FJD8w8m?=
 =?us-ascii?Q?Ba+j7GnexF3LEkgY7jEESBbcPzqdm3IUyW6z+NWlzFLJLkVjpHOwz4ZGrqkK?=
 =?us-ascii?Q?MA47SkkehRcs3sEctmIsF/TbQ/WcRzO30blvk+R97lcqFuuef7nqgUuCS6a/?=
 =?us-ascii?Q?VUvCrG6Vx0I+g4F+mTbzeON/1TbyLmH/9lT8pkP5d362yLQ+dVlZZsumoY0X?=
 =?us-ascii?Q?auoMbpLp+nnRlEx0aHRJp2azCcFH+9XoapI6L/sTpSPOeXmJbZASHct0TaA3?=
 =?us-ascii?Q?7RTDMHpt+uE1/YtOse0RGLeuDU/DLumRV0w9q2nbU71P1oIGehmovy67Gj1R?=
 =?us-ascii?Q?zTpXJFb+7REdm80ifPzMb5j4YesC+eXSe8cJoHWzVC4ghmmD8oGTbPs0U+EA?=
 =?us-ascii?Q?T+JOFU0LrnK1f2SaRYXigvsrunk60H7mnBxxpOQrnr9lqNzu9VSICMBY0Upi?=
 =?us-ascii?Q?33CB0UZfzOkNhphnNZ0s5Q/oI1dH2JDHcMNq722Dwc4mP9xhsfdIvsnYf0ur?=
 =?us-ascii?Q?gxmVcPxln5XOcbppxG/kPxm3ELVv2zry1HDyPrmglEsjy0RPMbl18mkCRHnD?=
 =?us-ascii?Q?OxZU2p0FM8XhDHTFVryckwZ15p1fLV7JxXDQfS6upaSp2qUEnPYPF8RiYRf9?=
 =?us-ascii?Q?caidSdA/IGfbV3j8mtKHHpF1cTpvetD90kinjs0wkUzFSIB1dutX+3zUBhe8?=
 =?us-ascii?Q?0bxB+PyPCWch/EUr7052dYlMFOzJKanD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aXO7hk5dF5/tletXYlBkHGBqsyDyCyqbSXEwIl58nenm8QXL1/S+olIxlDY8?=
 =?us-ascii?Q?32wbHPGqE8R39FMDxbdqb7ywJohsF/frREmYHc6oG+eBc40hj6FN/LHz9NKa?=
 =?us-ascii?Q?fpzNOUyLA++I3CPyHNd0k+ySFnfgdPHxPDO4hTBw8g42yBy431zCSgPLaE6V?=
 =?us-ascii?Q?wCNwTft18S1VR+T+MonFSvX4B4BSj/D9Y8dgWGITJNF3xeu/ZnfkEKPhmZfQ?=
 =?us-ascii?Q?XrYTcDIXGd9/1X8br5dMF5DO2qyVc3LLsCeF4LVqUgMRcwreRpcSfhyFiQR0?=
 =?us-ascii?Q?dXHIB8qwB94pn0ajOto811f0rhmIQ/dwgqvtNpTA1oYHezqZGT0dEVHGAoqA?=
 =?us-ascii?Q?vxIdq/jj4CyUEPz0CcPC7WZrhrF33TGE2hDa/xh4lFOvJpUP/qY8RjFo5B3E?=
 =?us-ascii?Q?HAx9Ap9xnOkLugf2yjnasATu0ZppP2u4ieit1IPoWJ7NSc8N6ha/Bq/xro2e?=
 =?us-ascii?Q?bqU+DFfj7QuWvPw7p1YbHbIywgZtXvVY4wnot2NcQeiIpmuY1Z2NERbRFQz5?=
 =?us-ascii?Q?jF+1MPHLVO4/tFW93e5/TOTuol1PGhpzYkMqLd+sVYCG04l9UEjjHWe+HSSo?=
 =?us-ascii?Q?iS7zevchwAiaGXtWvBojdXFf67YcUDGV2C6gHtomwgt8fId+Hltbavp/f8VT?=
 =?us-ascii?Q?BFVb3DAYOltR/Ij4E7zjlZ25aIFvN3xBCuN/LJwxGW28FEqrxfDL48eY1hHI?=
 =?us-ascii?Q?O7MKxwPnJEQQbTRg60slnQiA+D8xErUbDE+JksrqQn/DvnqLQBywG1kT9u8J?=
 =?us-ascii?Q?B2qewitmXmDqQNgFs4WJst6w7/WjCyha3+TbUnBX9Vdxhbc7scb7YbHyhKFa?=
 =?us-ascii?Q?mb6wCHnWBDKLWAsY+8lhnXBr/0fnKb+RI16UdC4dkVZnm9nKz2Bf2SOgmvI/?=
 =?us-ascii?Q?F0NegtIXIjTx1+iXtFiiJ4h8chJBDeQgPtvyHp0wF4ArYzYOplF2vY7JTaiB?=
 =?us-ascii?Q?1uxykw2KX0a7akydlT/zx0EVaYfGxytit0NseyisyeAZsupSsFITQL2tuWTQ?=
 =?us-ascii?Q?X898FOZ9uJKby0PV18I2RPRzY8JUcZrRgQRB0Q18RZ4laKPpFiI8EQCAQhr+?=
 =?us-ascii?Q?LNQJe9LyeVMZuXGGtTsueSi8DAIFB+D1vn2pmZ9c3VCfPs2H2E825Qnfiffq?=
 =?us-ascii?Q?89hqoxq6bIZfUjzHHSxbnry4zvvT8/Qe2zzTNi7VbD5dcdILJOLSs6d+k9/V?=
 =?us-ascii?Q?EH7iufiSgLp6fJlyKo5wfIcZmIo0UYFumUbz+dnc0BL6x00GALEIRfUwIL4Z?=
 =?us-ascii?Q?/0uLyV/3+T1agLoB7hUo8lrMw15uriBxyM2uR2TdnYe8zCi5t+1G8f85tEkf?=
 =?us-ascii?Q?1R8+zy1/PnOflHO1SO3WGvYyIQuw/9xB3kaYSHq93aeGRyHGHnFPpJWLWbKm?=
 =?us-ascii?Q?IRhs5rkzO8eZeRlS4xE3GzSoV6b2oimBOKd+3/qE+ES/QY6qREMcWDZcSpBe?=
 =?us-ascii?Q?fGshzptlef9IdR07HOCSSuFphTsfwpO4fNQanwvAidXBEvWM4WcuAn8hZkgC?=
 =?us-ascii?Q?UkW+aSvZPEH5eDdfFuSQjOqQmUfoWkBcE6eI6pkk2zmEqmGSdAATAd5DI6pE?=
 =?us-ascii?Q?ATfYoNGlbez0SXbXn6qUITI5yeLW2lAadA+cG9aQUZLG6i+2vKLeFXIPVezb?=
 =?us-ascii?Q?JpNpaZTzckX7Pm2Eu4GRzgxOeqZkI1mlWqT+Tkai4RuySrQKZQ5QG5UHLY5J?=
 =?us-ascii?Q?3wOqakuqtWjwEAiicWDh+cdCBSP4rxT/epUBTLDVcgns+ktDmkaiyovBpB/L?=
 =?us-ascii?Q?UAn1/AExdTUxh6APe+K0oDSjhtsQp5E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3929118-f47e-49b4-4ae0-08de3f13740d
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:29:51.8721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzCeydq92fRCMCZXsaKt7VUZk16RLmQn6OFuPEuF89vWN9QebBUtfAXmv6wl7fmsQPZnqDL4aUsWBlJz1fRhP0Ih2QRNCJTtywbu4llzDzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6674
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

On Thu, Dec 18, 2025 at 02:19:24PM -0800, Matthew Brost wrote:
> On Tue, Dec 16, 2025 at 09:10:13PM +0100, Francois Dugast wrote:
> > This new helper helps ensure all accesses to zone_device_data use the
> > correct API whether the page is part of a folio or not.
> > 
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/drm_gpusvm.c  |  7 +++++--
> >  drivers/gpu/drm/drm_pagemap.c | 32 +++++++++++++++++++++++++-------
> >  include/drm/drm_pagemap.h     |  2 ++
> >  3 files changed, 32 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> > index 39c8c50401dd..d0ff6b65e543 100644
> > --- a/drivers/gpu/drm/drm_gpusvm.c
> > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > @@ -1366,12 +1366,15 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
> >  		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
> >  		if (is_device_private_page(page) ||
> >  		    is_device_coherent_page(page)) {
> > +			struct drm_pagemap_zdd *__zdd =
> > +				drm_pagemap_page_zone_device_data(page);
> > +
> >  			if (!ctx->allow_mixed &&
> > -			    zdd != page->zone_device_data && i > 0) {
> > +			    zdd != __zdd && i > 0) {
> >  				err = -EOPNOTSUPP;
> >  				goto err_unmap;
> >  			}
> > -			zdd = page->zone_device_data;
> > +			zdd = __zdd;
> >  			if (pagemap != page_pgmap(page)) {
> >  				if (i > 0) {
> >  					err = -EOPNOTSUPP;
> > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > index 491de9275add..b71e47136112 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -192,6 +192,22 @@ static void drm_pagemap_migration_unlock_put_pages(unsigned long npages,
> >  	}
> >  }
> >  
> > +/**
> > + * drm_pagemap_page_zone_device_data() - Page to zone_device_data
> > + * @page: Pointer to the page
> > + *
> > + * Return: Page's zone_device_data
> > + */
> > +void *drm_pagemap_page_zone_device_data(struct page *page)
> > +{
> > +	struct folio *folio = page_folio(page);
> > +
> 
> I think we can actually just do:
> 
> return folio_zone_device_data(folio)

Agreed.

> 
> We still need the helper as if page is part of a folio the individual
> page->zone_device_data could be NULL.
> 
> Also since this called from GPU SVM maybe make this an inline in
> drm_pagemap.h too. We'd have to include 'linux/memremap.h' in
> drm_pagemap.h but I don't that is a huge deal. 

Yes that is better, will do.

Francois

> 
> Matt
> 
> > +	if (folio_order(folio))
> > +		return folio_zone_device_data(folio);
> > +
> > +	return page->zone_device_data;
> > +}
> > +
> >  /**
> >   * drm_pagemap_get_devmem_page() - Get a reference to a device memory page
> >   * @page: Pointer to the page
> > @@ -481,8 +497,8 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
> >  			goto next;
> >  
> >  		if (fault_page) {
> > -			if (src_page->zone_device_data !=
> > -			    fault_page->zone_device_data)
> > +			if (drm_pagemap_page_zone_device_data(src_page) !=
> > +			    drm_pagemap_page_zone_device_data(fault_page))
> >  				goto next;
> >  		}
> >  
> > @@ -670,7 +686,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
> >  	int i, err = 0;
> >  
> >  	if (page) {
> > -		zdd = page->zone_device_data;
> > +		zdd = drm_pagemap_page_zone_device_data(page);
> >  		if (time_before64(get_jiffies_64(),
> >  				  zdd->devmem_allocation->timeslice_expiration))
> >  			return 0;
> > @@ -722,7 +738,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
> >  		if (!page)
> >  			goto err_finalize;
> >  	}
> > -	zdd = page->zone_device_data;
> > +	zdd = drm_pagemap_page_zone_device_data(page);
> >  	ops = zdd->devmem_allocation->ops;
> >  	dev = zdd->devmem_allocation->dev;
> >  
> > @@ -768,7 +784,9 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
> >   */
> >  static void drm_pagemap_folio_free(struct folio *folio)
> >  {
> > -	drm_pagemap_zdd_put(folio->page.zone_device_data);
> > +	struct page *page = folio_page(folio, 0);
> > +
> > +	drm_pagemap_zdd_put(drm_pagemap_page_zone_device_data(page));
> >  }
> >  
> >  /**
> > @@ -784,7 +802,7 @@ static void drm_pagemap_folio_free(struct folio *folio)
> >   */
> >  static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
> >  {
> > -	struct drm_pagemap_zdd *zdd = vmf->page->zone_device_data;
> > +	struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(vmf->page);
> >  	int err;
> >  
> >  	err = __drm_pagemap_migrate_to_ram(vmf->vma,
> > @@ -847,7 +865,7 @@ EXPORT_SYMBOL_GPL(drm_pagemap_devmem_init);
> >   */
> >  struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
> >  {
> > -	struct drm_pagemap_zdd *zdd = page->zone_device_data;
> > +	struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
> >  
> >  	return zdd->devmem_allocation->dpagemap;
> >  }
> > diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> > index f6e7e234c089..3a8d0e1cef43 100644
> > --- a/include/drm/drm_pagemap.h
> > +++ b/include/drm/drm_pagemap.h
> > @@ -245,4 +245,6 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
> >  			    struct mm_struct *mm,
> >  			    unsigned long timeslice_ms);
> >  
> > +void *drm_pagemap_page_zone_device_data(struct page *page);
> > +
> >  #endif
> > -- 
> > 2.43.0
> > 
