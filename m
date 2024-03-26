Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B57C88D00F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 22:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D79C10F362;
	Tue, 26 Mar 2024 21:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dgdbK6X0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9B410F35D;
 Tue, 26 Mar 2024 21:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711488648; x=1743024648;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+ou7L6CZUQ7yf0S+6j/zQd4tdFpeIf4mCmyLLt8vJyM=;
 b=dgdbK6X0bUjOW/uRw10wtdnp8zEdQNEVAZw609kzwb7XqBeRiWGIhLHR
 ClvHXJDqZsnOSTZIsdk8+YtMJX+ez8cCw9YIo3oeNj4DV71/x7ZtXQHi2
 JxGOGHpa1aHKP+qKS7K1jYI/Z6kSLMmdkJRpoptMFcg8dQUiWBaXhbgzn
 Sx4uSMzF8we2XCR+iq1TLC84M2AVLfmG3Z9Fivg9nfU960VeNCllro4Ve
 wxiTKlgY83zLwmQwl0XoHgjuNw2yshfuxJE56EJAGELjIAz4NlXuh5OBJ
 SMv9t0uAwylaOkf96UpY+vZ7XEVIXBvKuT3QfnguNoXz6ugi/gO2NVAyb Q==;
X-CSE-ConnectionGUID: I6GcG/EqS2yjaWorfOM0CA==
X-CSE-MsgGUID: 66SYLK7rRwOfWGafstSOUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6676099"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6676099"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 14:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="47269409"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 14:30:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 14:30:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 14:30:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 14:30:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 14:30:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naxH848blV+PGBRno/nNGc4HVhdWjMTl9L+YMzLL28eVs6TRqHeYbsGhslWwg9PCfGkjq0y7SaRjufxi4/SQIWdFYb7z91fSS45IDjtXC3VmlSCR8xv7wlwGoGds7/cgDGJVywENA9dgkugOL8CsoXsUUqgpT5Quq8xE6Orv2vRKU91nGzjoQv20kSMMD+zEHkW8M+jFTPhHl0HuxUDgKTkdT7V86pJBRAhJEexjqAEanYq4NR8Q92b24eaoldRAra5Zeh5KZ4ozK2CnNJ3g6Nu6n8Q/AWqpeN8fZW2jJbzbRq1HN4iuXAaDlb/fxXGmjFij3k3aha/7W3scEdu8YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yydi0fPdSuQwNbXtshxCJ9vEV+iFpjyWF0FToPlGd/I=;
 b=G3U2r8e5conMUUpsgczDIIqN/Rc3LR0VUp1Y5KeA17Dt7+reiw6GKMpyzEgnb5t1OPNdGC3ReMbXUTGiZTbvfD6RsbOM7DnjBh1X0TXZg+CfwfhzhekIxGs+GQ877qlhnR+0RxDUetQ+Os5wSExmIPY0xoZN+c68yiUmvS6Yp8w+6F43Dvz8qf0lWnOTHcXMnWVT70v1j/+MzBzac/0a6ES9Pd5xOZastDBk/zJl2YBNeW3mTmy+h0we+NVEojK5HWZnoLdIo/SD2j8i3bem7CQIoyRKCokXGa3mBdofBI0Vrx3inS9c2mPz3+8faOoQimfardBnZIuvbeEi2gesmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV3PR11MB8505.namprd11.prod.outlook.com (2603:10b6:408:1b7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 21:30:42 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Tue, 26 Mar 2024
 21:30:42 +0000
Date: Tue, 26 Mar 2024 14:30:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, John Harrison <John.C.Harrison@intel.com>, 
 <stable@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: Re: [PATCH v6 2/3] drm/i915/gt: Do not generate the command streamer
 for all the CCS
Message-ID: <20240326213033.GA1332995@mdroper-desk1.amr.corp.intel.com>
References: <20240313201955.95716-1-andi.shyti@linux.intel.com>
 <20240313201955.95716-3-andi.shyti@linux.intel.com>
 <20240326160310.GC718896@mdroper-desk1.amr.corp.intel.com>
 <ZgMXGlfsGSOhbC0b@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZgMXGlfsGSOhbC0b@ashyti-mobl2.lan>
X-ClientProxiedBy: SJ0PR13CA0033.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV3PR11MB8505:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E3pPmyxyqMwoJ7Ycx3CJygH+wx4HJAPCgZ2PIVkxfnWfurykE8XBW4h/MJ2jpQ09IJwc6mLemf8TE4QRp7i2r782IoU2xx53cDucE0iuA1T/qaQ0ncyB9tIdN9WmwPZVTvl0U/tuPH+5AGsIgno6QIMpJN5cHZBW4GjNTWfBB/h9PyLQtgqdBUxjAYnsc7khS+Rqtt4ajh6SNrjI1KgOmNaEK+rpKeVDlDMNrKPQjivO1y1IbUbi+uKOTHDxj1H/B8TYnmpuoO7Pajdc74kuO0ZcZtiURABXGAUyW8NWPSWJFp1k7fs+MObXLN/yOah9NKjZ5FdHm5A/6gCx5dU9Zj9sGvxf8V/wGmTc6DiTQkgOEzCbmapkz3wj+1+OX2kfmdEd2NF4Z7oyJgwARS3eEGB/M4Phvy+HsN2imh6uQqG0Vjx2gYNXGlBK0kG/d8YUzykB3SkwOea3H+6V66u4hlDLi3zvgFrSMsuCo+kw3DR5KgcUs5QpJm6EO/YijUHwFGzy/7z7NYyfS3JlIQdIUB6Otg3Gq6ou64aMC8/Epnypkdff52HaBC0bi5Iz199SqBav2sR8qyhekgUvxxVZJdZRUL7zcwt/gtOO3WMv6R1wG77xiL4DODw2qrEDTiuxelcQODh9JYqgCVwJUxr1iqTFZ+fnM94c2IwkwO3jNZM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HUQHCAZ4XDIcikXa08cLpeLvQVnXZChZnFakpo1MDuvBKX0ksiKLEHKFwvXE?=
 =?us-ascii?Q?rPpXiAV2Lt4osqIC/IyqwrxQ7rYunEk4Red8s9ZARiPC5hwwaa5HjbJJ27hc?=
 =?us-ascii?Q?ZInu0k7TqBTeoy7xBVTR7HmHn92E/kcOSO7jsq7suiSw3JZ4CUXjIgrAtQmi?=
 =?us-ascii?Q?23blYtsY2jl0omyy3wkkJfMzrYdQJq+ibJwu6EpBuZ5SLbdeF8Q6hDTC4abH?=
 =?us-ascii?Q?76LWV4ny0sy+FkvWxKIlNsxz69xGbkFLrw/nOlLQtvPOdswvTHjjRAg+2r24?=
 =?us-ascii?Q?uRz710v3G++WaD1Wpf1DXe5pyfcg2DQVhDqWT/7Djbn1nxWnRQRl2Rgteeqi?=
 =?us-ascii?Q?qgqtY8SORyCHrqh3TKskyJC2zB6CLbYH9F06wOVOAK0ZEsVESuPa/O+P5Xcw?=
 =?us-ascii?Q?HmoeaeiTptrIEuOc1gS/7oKMVt806NBV88tNwBUL++tL8v+5HiTNGewaEJ7j?=
 =?us-ascii?Q?xx5dupFETaDkwka9ewCep1htZyMPSK+yqvfMXtvaPQFm9pTRRbsI2N6lwgAX?=
 =?us-ascii?Q?8p4/X2uwe5DLsq2wpbYSRUXD5gIT6/WdA6vXercG826FFLV3GXAE25ho+eEt?=
 =?us-ascii?Q?nuYloq2CR4jeBvgMp8eSiaxLR1xtoyxPLWcVafq049lVEKhD+tvFyBWqp3kO?=
 =?us-ascii?Q?3PPenORkBjJGaKtcCHnwePi7qKchgCINGRICIZTVcMtkG93TYi4SG8WaCiJM?=
 =?us-ascii?Q?mUGyp0JBf6vv8+3zr2PbUf2W/MUUqYYw9f4hrBKV/EdL65c2o4OCbttnGjqg?=
 =?us-ascii?Q?KAfqum7aNnBjlCWVMMqg/37/y2gyPJGpTKc7XjJLegV6juXhvf9Iylo6C4wA?=
 =?us-ascii?Q?+5UbkD6IDiATc+9IzgVmWuuFJq56lTLgWI9vvO6vMgzkl6QeCGsJBdV/iYdR?=
 =?us-ascii?Q?k8/BwHLbm/97ommfn26AC8/fLA5C4OsCsZmKPgLajMdxdHIUpD63clgUbiGk?=
 =?us-ascii?Q?dYJcIJsezkhhWwIxrzPe8GPe+WBtzzF61awYCsPNw9f9FFs7QicX+cla2SLv?=
 =?us-ascii?Q?cNqmWMbpVLFMV6aU/w59lWdgfxzbnp48J90T6dgYeIc2Uyd2fUu735MBygw+?=
 =?us-ascii?Q?3qKuazOZtr2FoXIqO74akIt/qwMJiwUGCCclK++CwHfsbfIdN9efE/4UExFY?=
 =?us-ascii?Q?/+gtjG3czYGRLHXslCGv/71uNbhupLvCMxKIrckISG7iqO9mL8Ceh5zXZHO+?=
 =?us-ascii?Q?DepgxO+tVOdepHb9DJ8L/k+45ybn+VpxbSdYTWCQi5ngantXFH3UHwcD2JUq?=
 =?us-ascii?Q?N8YC+EPDUrqYtPaGjScY1PfpjgluTDCY1Iiry6KogyK0jZzUHRf7Ty9+HwJX?=
 =?us-ascii?Q?xOb7kXDvicegCphX1egsJOeidX1BZfkPJlUXK1lZKii79qHLGyNFJgUso5yR?=
 =?us-ascii?Q?0PYGuHtDUb0smXL5Rb9FWXtFOHLbpiNiE4Qz1H6GqVwacMTdrjTE1SYj7LBP?=
 =?us-ascii?Q?lqGyBHRPXouQW8zGDKKgkuBHZyE1jz7U4rOpIHgWfMo8vHYfbrzbLFaaNLKM?=
 =?us-ascii?Q?aXW9KLr+aD5518JRjrZNBHjGCKHX93954n/FIoivzoHjWz6YGr5jLN4Rcm+i?=
 =?us-ascii?Q?xjdFp8Yq0nLDMuHfRDUGEGFJ9gnfo5AZI9yAhHpufdsVCBmKPclnyH1VdOn+?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf4d4272-b8e0-4922-8941-08dc4ddbfd14
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 21:30:42.0680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SOBkGy+3pZHe+da4Av3ZmvmT5KsLVEBUTlXABtpcz+G9WaSBPVZJQDwTwpLkH/Gjsy4VMoRNTWCjLIPiw179ortCGXIqfE7OHGSIy42QoBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8505
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

On Tue, Mar 26, 2024 at 07:42:34PM +0100, Andi Shyti wrote:
> Hi Matt,
> 
> On Tue, Mar 26, 2024 at 09:03:10AM -0700, Matt Roper wrote:
> > On Wed, Mar 13, 2024 at 09:19:50PM +0100, Andi Shyti wrote:
> > > +			/*
> > > +			 * Do not create the command streamer for CCS slices
> > > +			 * beyond the first. All the workload submitted to the
> > > +			 * first engine will be shared among all the slices.
> > > +			 *
> > > +			 * Once the user will be allowed to customize the CCS
> > > +			 * mode, then this check needs to be removed.
> > > +			 */
> > > +			if (IS_DG2(i915) &&
> > > +			    class == COMPUTE_CLASS &&
> > > +			    ccs_instance++)
> > > +				continue;
> > 
> > Wouldn't it be more intuitive to drop the non-lowest CCS engines in
> > init_engine_mask() since that's the function that's dedicated to
> > building the list of engines we'll use?  Then we don't need to kill the
> > assertion farther down either.
> 
> Because we don't check the result of init_engine_mask() while
> creating the engine's structure. We check it only after and
> indeed I removed the drm_WARN_ON() check.
> 
> I think the whole process of creating the engine's structure in
> the intel_engines_init_mmio() can be simplified, but this goes
> beyong the scope of the series.
> 
> Or am I missing something?

The important part of init_engine_mask isn't the return value, but
rather that it's what sets up gt->info.engine_mask.  The HAS_ENGINE()
check that intel_engines_init_mmio() uses is based on the value stored
there, so updating that function will also ensure that we skip the
engines we don't want in the loop.


Matt

> 
> Thanks,
> Andi

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
