Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1778605BA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 23:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E1810EAA5;
	Thu, 22 Feb 2024 22:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ml1ldaw2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C4410EAA4;
 Thu, 22 Feb 2024 22:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708641215; x=1740177215;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j7qvCrd+Qp4a5AJMa1zadJqPcLFmdSkyknsE0qMuuww=;
 b=Ml1ldaw2rm+gmh4whivE3am+AMhauYjVrzirm7+RQdrvh1LcERQzoNpP
 7qKM5SPI7gnhylAJtyeSIU4KXb2i5Rd5vNIH2jSe1tD8y4FbqXEw82LzU
 zbT1IcH44cO4j3H6JS9pXh0txexqbS1+oIGKEMpU0gehmFOnAQZMI/a+w
 Ls/vEs0nWN2+kvO1iy0aB1VMSHqzIEOShV1H8Mz7TG640ZiPWDPk8fhH9
 6fV0Be11+HQOVyKcLJK5k53kr+DRsbQmv0B+N+vKfpgJKKNPPB07TMVg6
 H9q7GrkOqpZQ1O10HGAR180ePPStHRumQ7c3oUKEBc5OeYuAF/XpaSv2A w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3015074"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3015074"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 14:33:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="10321965"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 14:33:34 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 14:33:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 14:33:33 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 14:33:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdnsGFs3J1+sw12NYXZCgy/7jAukIzSj/ZPZOr2g3e5363mFhFaLKqmfD+MVjAb3BEgtomLNXEhTyMo4lToSIS36YO8QucCqtriJxZujzXOvw8ci2UqtF9QKz2XlYxTIIhxz/SteyhWIt0HIAndgoSjfAtoQcO6EN6pI8DGQpwVm/67FZIBcic9CJp8cyCc4wgnajtq66hSl+wSWdvSaBvIxd5Z0EviRNVPluYrkJ2NBsAJf7qv+OMy2/o4iTy74uY9yxuXzcm/9hEAZdS/D4AkPxjIZpgwvFo1rs3Dal2GckA1uIDjanTBPV24dve7re5J+bXCyCcKoPZIRVdYMuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BntB1V7dOTQxKfg1OVQUQ07pHkIP1dMiWufimAwoCbM=;
 b=a4hP6by8dqK9wXk13yyW1YlQqidluqwwbQXNrhTsAXT/eUA+HoQYDflRrHK/aGNMP7PN1z+Rg+E0EkiXci3Vn3Z+uYXlQp9zT+tH0UldQ7B8hL6U+Eb6JY9XZ8FWtUDM3nG8/K+Soqn1QOE8G5UZ33qxWzImMUD58ZiaCoIsbr+wX8E+ubsU1Ncm2BLZgidBnsRwySfA64yfKCgGbb+0FhmdsCdg+GUcDYTkbIj5cTvEHPEAoDWqHSTuNmtqh3yGQjorColCZgHlP+qMkKddPuWysOAthRjQlswresX/DJ6vhwapVGRp2lvdMdSalegd/eNvXZQh4ED0gJrK+tXDwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by SA2PR11MB4825.namprd11.prod.outlook.com (2603:10b6:806:111::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 22:33:30 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515%5]) with mapi id 15.20.7316.023; Thu, 22 Feb 2024
 22:33:30 +0000
Date: Thu, 22 Feb 2024 14:33:27 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, John Harrison <John.C.Harrison@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, <stable@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 2/2] drm/i915/gt: Enable only one CCS for compute
 workload
Message-ID: <20240222223327.GP718896@mdroper-desk1.amr.corp.intel.com>
References: <20240220143526.259109-1-andi.shyti@linux.intel.com>
 <20240220143526.259109-3-andi.shyti@linux.intel.com>
 <20240220233918.GG5347@mdroper-desk1.amr.corp.intel.com>
 <ZdU_4okr8GcSpTtm@ashyti-mobl2.lan>
 <20240221205104.GM718896@mdroper-desk1.amr.corp.intel.com>
 <ZdfEr2AyPNaq2Xh_@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZdfEr2AyPNaq2Xh_@ashyti-mobl2.lan>
X-ClientProxiedBy: BYAPR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::34) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|SA2PR11MB4825:EE_
X-MS-Office365-Filtering-Correlation-Id: adff819f-17e3-484c-1caa-08dc33f64b56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XVv6oc0F6Z46PoLCEsZhnF7H1QA9Yw1mnCikeDhb57bgTa5N+wSE+m0DGpoGxG9VsJBSvjQn9Mmd/+bXGixukWdTFcptEMuHOJfKSPj9SRvSnrkQFul3UdezEH2SvOgDDPs21CF8RzqV+XtxaKoh4kJEYY4jSOLrz/DSZOdRFm9vxUYRPPc4lgpXJ47BN5aEjWngJCAeFJZnLdm+Z4CrQ9fr14PbUkYv7QAtggzJYNsgGu/dJVZdW1fLeJaHiCIMLXFZmKFYHIh7a7xTHPirY+mjlwUCiHi0aPyqnJBcRP2vd5JRwUd5zIzUwPO8bJSTTJOgT7LDckzJEonT/lFuleAKV/T4XMIPl+ZrQSM4HX2oH5vOy68UM0l9zxLM4xOvPvd4AE/e0igPs+1j3/94Ik+V7CD0IESizj7PvJhzCYAd+cVnx2TslVOvXXG0U4oQwmkawLC9YF2b61UJfs3rbHOofczCzzkRBOlbO5k4bmWQlfFtbjEEZfH33bgHzuqi7KqCyJ4d0w/bAxydEjLnl1KF6jgm+b94ihxxxYKSMyA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lSTIfkJnXyB0E+eTqLuWnsxs1t9KltFCvKsgubMDJCURoFvWKW2nRYyHdkb+?=
 =?us-ascii?Q?SoJ8pg8SCL35IYp9EYJSf/nZxgzpCBRpmL7ChZWpjbVpUn9FiKApvOC8tgo0?=
 =?us-ascii?Q?4WduW2MqBmX8xjAw++m1T/4b03/Tpk4qFhaDP7FKwqC7wXjDQGv+IziYoGaB?=
 =?us-ascii?Q?3Scv6OqUuoNSiB180UL/UdPH8oPvITiM554U5i+WQESANCH/L/x1b3UbsAzL?=
 =?us-ascii?Q?5W3R1eLMCvbMpqLCDHdMsU7iqORYxA1zzRHhOs7h02Crnq6lS3vdFZCSMrDa?=
 =?us-ascii?Q?8F+Wz3/ENy91Ax94af4HeL02mwjqUjCqEwPDRrjqzO2S1xBYMeaFz2LJF056?=
 =?us-ascii?Q?kriBi4QaVdqOgjgWDUBVaOjQA/s6jLrjw8ZYFzkl6bA/mwbyfAAwNRDG0NGY?=
 =?us-ascii?Q?MfXlnTWbjEsVUjL9M7dheV2+0SuAio18UGZbUBgzcCdTfKUypABFgODJzOg4?=
 =?us-ascii?Q?YSHjE/9Bbfh0JPFP7W9cLRWMoPCEAVss3WFqJFGW/Koi2s+ke3hZFxAP9Oao?=
 =?us-ascii?Q?O0gxGqs7nW76iBFL8yPK/CAt6RYMEcd/d7CE8ZmROMQVCbbnwI82mvHFnxTY?=
 =?us-ascii?Q?6idpXaJDFEsORlPScnMYhk8wkNGCv3HumXoWq69LrKb7O2OhsqXkYaObX/QL?=
 =?us-ascii?Q?3ClRrJ7cZsijQ0q7X6o66q4uV5wyiW5NLNMujd8J/wR8Q09l53Zj+bHSRDJ8?=
 =?us-ascii?Q?kfcUNUYQhSLMoMKtvUyrCJE4/1QFFYigaUocW2yQp/odzBsWP3aEBQ8wfBZW?=
 =?us-ascii?Q?thmK2bDpyI7R/7a5btewqTtM5A+GU7Ccl+lZzTMe6JPqpGpXt6RM7TJvKQ9E?=
 =?us-ascii?Q?CUtipEXZSv34SrN7Za60ApNPY9vQ6hkK597ZrGVDOxWmzU2g8PWtzEqlfiCx?=
 =?us-ascii?Q?XvLukXufd3D8gcNMfjvzJ8L52uWWRsyi1OQMe5BJteAI5vmjr71l0638L0M2?=
 =?us-ascii?Q?AY8/pj76DZmdUukdkUmwYNSzTZSI6mbcGn6pgmT/qPm8rLAVT39LKvpxDleV?=
 =?us-ascii?Q?Eqm4VNkMWjZe7+68gWD6C6Otbcmyp4ibmbHGU5jXqSA5US2FiMax0mQbO++0?=
 =?us-ascii?Q?bpCiz6fYENivn1k7cvqjqtTWW+LKjjkPfTQUVhSmniuiY77yjBHGJq9oZGXf?=
 =?us-ascii?Q?sB9UL3pVfaE6grhkuhq1hV2zXgepx1IEtCOEkf49TnkFv4ilua5PauoI+z20?=
 =?us-ascii?Q?ktHveCtfnJwMEx3kH9k/VG1d7mSNdHna0WDOMK0C8M6G8AOkhZA6Kj7jgq+V?=
 =?us-ascii?Q?3TUJ59ixfnRHQBGPfXl/Yxu9wxsiu2zdEKMcGWYpJNNdjQ2Fq2EVtWNGHGeY?=
 =?us-ascii?Q?Z2viDshJZ4KKyD3dn3XNgVDXVork+DtHnkl36j0wEfihnH4/8+n9nZTCKGIX?=
 =?us-ascii?Q?0ehzWk6yjLcLWsYCWoeJlBdxX+lmfSuQwY+zYIZIvqwBW/NUBgi+RvO8jLP1?=
 =?us-ascii?Q?5BOalCBj97PlQru2/tTtE/wiALznDMS0+T7FJj5/Nei3YUCtQlleTS2IXEHZ?=
 =?us-ascii?Q?mDwf09mFlCRDtJ94/0tHlRC+BrBCIk+tETu901074YwQ2KB9oyZ+5nQgdfZX?=
 =?us-ascii?Q?mLrTWLOAWM0wMp5mCvVLB0l6MAHE6z23M6/hteVLjr1ANgiDM1Jc5P8FI/bW?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adff819f-17e3-484c-1caa-08dc33f64b56
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 22:33:30.0822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21aVyDUi7dI3QBlOQaBL70zErxRAswOuap3QxU23guDCnM9wOyKf7yn6evpcltCbDN8DAlZrXJTsAESSXEVrwgB+Cjk3oMe2acESPLaqInk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4825
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

On Thu, Feb 22, 2024 at 11:03:27PM +0100, Andi Shyti wrote:
> Hi Matt,
> 
> first of all thanks a lot for the observations you are raising.
> 
> On Wed, Feb 21, 2024 at 12:51:04PM -0800, Matt Roper wrote:
> > On Wed, Feb 21, 2024 at 01:12:18AM +0100, Andi Shyti wrote:
> > > On Tue, Feb 20, 2024 at 03:39:18PM -0800, Matt Roper wrote:
> > > > On Tue, Feb 20, 2024 at 03:35:26PM +0100, Andi Shyti wrote:
> 
> ...
> 
> > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> > > > > index a425db5ed3a2..e19df4ef47f6 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> > > > > +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> > > > > @@ -168,6 +168,14 @@ static void init_unused_rings(struct intel_gt *gt)
> > > > >  	}
> > > > >  }
> > > > >  
> > > > > +static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
> > > > > +{
> > > > > +	if (!IS_DG2(gt->i915))
> > > > > +		return;
> > > > > +
> > > > > +	intel_uncore_write(gt->uncore, XEHP_CCS_MODE, 0);
> > > > 
> > > > This doesn't look right to me.  A value of 0 means every cslice gets
> > > > associated with CCS0.
> > > 
> > > Yes, that's what I'm trying to do. The behavior I'm looking for
> > > is this one:
> > > 
> > > 	 /*
> > > 	  ...
> > >           * With 1 engine (ccs0):
> > >           *   slice 0, 1, 2, 3: ccs0
> > >           *
> > >           * With 2 engines (ccs0, ccs1):
> > >           *   slice 0, 2: ccs0
> > >           *   slice 1, 3: ccs1
> > >           *
> > >           * With 4 engines (ccs0, ccs1, ccs2, ccs3):
> > >           *   slice 0: ccs0
> > >           *   slice 1: ccs1
> > >           *   slice 2: ccs2
> > >           *   slice 3: ccs3
> > > 	  ...
> > > 	  */
> > > 
> > > where the user can configure runtime the mode, making sure that
> > > no client is connected to i915.
> > > 
> > > But, this needs to be written 
> > > 
> > > As we are now forcing mode '1', then all cslices are connected
> > > with ccs0.
> > 
> > Right --- and that's what I'm pointing out as illegal.  I think that
> > code comment above was taken out of context from a different RFC series;
> > that's not an accurate description of the behavior we want here.
> > 
> > First, the above comment is using ccs# to refer to userspace engines,
> > not hardware engines.  As a simple example, DG2-G11 only ever has a
> > single CCS which userspace sees as "instance 0" but which is actually
> > CCS1 at the hardware level.  If you try to follow the comment above when
> > programming CCS_MODE, you've assigned all of the cslices to a
> > non-existent engine and assigned no cslices to the CCS engine that
> > actually exists.  For DG2-G10 (and I think DG2-G12), there are different
> > combinations of fused-off / not-fused-off engines that will always show
> > up in userspace as CCS0-CCSn, even if those don't match the hardware
> > IDs.
> > 
> > Second, the above comment is assuming that you have a part with a
> > maximum fusing config (i.e., all cslices present).  Using DG2-G11 again
> > as an example, there's also only a single cslice (cslice1), so if you
> > tell CCS1 that it's allowed to use EUs from non-existent cslice0,
> > cslice2, and cslice3, you might not get the behavior you were hoping
> > for.
> 
> if the hardware slices are fused off we wouldn't see them in a
> first place, right? And that's anyway a permanent configuration
> that wouldn't affect the patch.

There are physically four possible cslices in the IP design.  The
presence/absence of each of those cslices can vary both by SKU and by
part-specific fusing.  Some SKUs (DG2-G11) wind up only ever having a
single possible configuration as far as I know, but the larger SKUs have
more part-to-part variation in terms of exactly which specific subset of
DSS (and by extension cslices) are present/absent.  The KMD determines
the configuration at runtime by reading the DSS fuse registers and
deriving the cslice presence/absence from that.

The register you're writing in this patch tells the CCS engine which
cslice(s) it can use to execute work.  If the KMD already knows that
cslice<x> doesn't exist, but it tells CCS<y> that it can go ahead and
use it anyway, things probably won't work properly.  That's why the spec
mandates that we always program 0x7 in the register for any cslices that
we know aren't present so that none of the CCS engines will incorrectly
try to utilize them.  If we ignore that rule, then it's a driver bug.

> 
> BTW, is there any machine I can test this scenario?

There should differently-fused DG2 systems in our internal pool,
although I'm not sure what the breakdown is.  I don't think the
reservation system makes the low-level cslice configuration immediately
obvious on the summary page, so you might just need to log into a few
systems and read the fuse registers to check which ones are best for
testing these cases.

> 
> > > > On a DG2-G11 platform, that will flat out break
> > > > compute since CCS0 is never present (G11 only has a single CCS and it's
> > > > always the hardware's CCS1).  Even on a G10 or G12 this could also break
> > > > things depending on the fusing of your card if the hardware CCS0 happens
> > > > to be missing.
> > > > 
> > > > Also, the register says that we need a field value of 0x7 for each
> > > > cslice that's fused off.  By passing 0, we're telling the CCS engine
> > > > that it can use cslices that may not actually exist.
> > > 
> > > does it? Or do I need to write the id (0x0-0x3) of the user
> > > engine? That's how the mode is calculated in this algorithm.
> > 
> > 0x0 - 0x3 are how you specify that a specific CCS engine can use the
> > cslice.  If the cslice can't be used at all (i.e., it's fused off), then
> > you need to program a 0x7 to ensure no engines try to use the
> > non-existent DSS/EUs.
> 
> I planned to limit this to the only DG2 (and ATSM, of course).
> Do you think it would it help?

Yes, definitely.  It's mandatory programming for these platforms.


Matt

> 
> Andi

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
