Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EE7A3AB62
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 22:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9941C10E77C;
	Tue, 18 Feb 2025 21:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JC2LPRkU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F2B10E779;
 Tue, 18 Feb 2025 21:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739915638; x=1771451638;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dw2QvxmS94WLK882a8TmEqR4CgoKyD2K5oka4sjca8s=;
 b=JC2LPRkUrgJcbZXjzdIMf/VKsBs+nB76iQd9vgwd04DCTjO1bhAlIRgJ
 dNRTcwCN9o7zJDgm2gRv7OQm+q15YBUf/Zf7+K8cF133FtIP5ah/S8Wvf
 Hp/NwPOjpCs7xKMpt0MONLx1XXa8rUO7TbHfEwrWGrau5mJQNbYQm5Ln9
 w7xgyRRj7lJ5lYIkUNkx43g9gBHdepBT0CG6TGv7w5sfa7/NrAp5B7YTr
 OUWZVuzSZqP9h14Z9lIKkfLf7xcPmzzFbnkYWRMIMbrTqvHL5YDMYrMPU
 dFxF+6y8FMk11kf2Sn+U6UIQmn+ZwWs6H2jpYzUciU4UTzwDxTRjcwcZG g==;
X-CSE-ConnectionGUID: NkvCtazsRlK1dglnKmsjrw==
X-CSE-MsgGUID: ksDxVAPYQVSsz8PUtFtXew==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40757287"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="40757287"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 13:53:51 -0800
X-CSE-ConnectionGUID: HLYznAkmTQGfumGsr94MpA==
X-CSE-MsgGUID: /9QhOzHQTZmo0hcZHn6wXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114456606"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 13:53:48 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 13:53:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 13:53:44 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 13:53:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FB+Wsba8ZEBcK+rZOa4C81GHjv6oo3LeFyvJpCptO2jDaw7vG5vE/osAJ7zhqIDxpzzvIfWbGuX1o23iP2d+kB5xrWnX7WCkWjYrF0D5FquW9nWHnssCXGfBSFtAs9PSe/d9YYfvyLLIbQEFETqx9gNokyx2VBP49SVltzpjk8pyiB/qJ7LzX6DK0f7dLHRMO5WRInCVD3o3hmUvaQK6SOd6yanr+FzsHig0RKZW+80XBYJdNNUZeNBbu0k8LOa54lXCpvk0tAIAVBe3G0YnS4Ltn2nYrdNMRAB24RUFP4LBZgSl737Hx7BfEEt4vD7K4KZqoFbtLWnww54slHVljQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbzsYmRS3eZc05/raztpGEl0PFYcdJU38j4jGMA8tUw=;
 b=jljt2ajBwdROBuIo9d4SXTlULUbRaeaEvMGJQgw1NxZPvAfD56+99VU9nS5+9HA/9QYWk2MtUwo4ZkibwBSQ/Xb6WpZVt7TMBEO804JbZJP+0FGMDdPWTFdvrM+eI8y28WXArOqTkVWaah7zyRkWXaUkO0XpMDFo5PCzhlNon0mVUZGJ4g0MQnrYq/TUhDTkdyVArSaxQFd8l00mXmr9OEcBHvtK24vz/FBfmvmRatVWAvZml6Fj+NwzBvgkkMEf48Q+SjNnKfO7V5XZV5NhAQBiTm3UCXYkxVUVohKZH+T2sa0NkY9MKIBZI8mPOsbZe1OuYtNsvj3wUUcHa5R/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7184.namprd11.prod.outlook.com (2603:10b6:8:110::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 21:53:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 21:53:15 +0000
Date: Tue, 18 Feb 2025 13:54:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v5 27/32] drm/xe: Add SVM VRAM migration
Message-ID: <Z7UBiYFn3oq9dhXN@lstrano-desk.jf.intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-28-matthew.brost@intel.com>
 <ee155ea0-e7ef-4a5e-b409-d08b62762e5c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ee155ea0-e7ef-4a5e-b409-d08b62762e5c@intel.com>
X-ClientProxiedBy: MW4PR04CA0160.namprd04.prod.outlook.com
 (2603:10b6:303:85::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e1f5f7d-4a13-45fd-7a3a-08dd5066a581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N0Go03B3fpFEhbSbL8uVWlKv9ztRKuC25F5yzltYUeejEvCsN3Dv9L6Gvl5H?=
 =?us-ascii?Q?ucWf6l/iLPqdDpC2o03bLJKgEtFCon3A7DiOqn4s5AbeIle8ejSuJRR5/6ap?=
 =?us-ascii?Q?8je/iem6lIsckiMM2YdzF00CusTAHMYUo+Ae7fQhpLm8Kw4yaqOKGBh+aYdd?=
 =?us-ascii?Q?tcU4+G2CKkiPQKIh8X04VtarwJAarv8BGVup9unR0TpHD8JbNQTrTsYJQeUU?=
 =?us-ascii?Q?3MC0uZIKdYJtdCeyJRkC9RgwD5/XK20v9fRsczNfck17UKjdxjoluZA3bM5K?=
 =?us-ascii?Q?J9mhQAVQxM+Zvgq5Yxnm0jTw6XFc8s6nUQhWvCcrWuPvpqrlxoxlKS/ofkt9?=
 =?us-ascii?Q?sFSRw8Aq9eh36+RwnOKRSz0QELWLrgcZNNK4esie/s0rfWIpJ1DRl5ZGzAFR?=
 =?us-ascii?Q?VwVjB8pmWg4UCnYZj7L7X6i5xmft5mEALhlrY7CuN5xIZ5cMFoDRe/8TvZ07?=
 =?us-ascii?Q?H+ZOuiCdG/j7T09opWn41bnyeoU4OXU7BGBTZV8FvvI8r0S3Kb7vT0gzt2H1?=
 =?us-ascii?Q?q40LT3P0FpQHloAf32SfKoXCqnOMPZCKos5RWtVkJJWmymo8TgUbo1RyqOby?=
 =?us-ascii?Q?tJ+Cdfq+qkaYC78FU0x1NcetqSk3NPtd2mFbABYjoH1ezBSf3tdCTwaPVmK/?=
 =?us-ascii?Q?wefMnJZ5iqIsZLqmXG2tuHiqAsjfosyoPRlqwEH7fs24KT4L44HfZjvBMlIe?=
 =?us-ascii?Q?2AE/7SKpwm/D8MgKkGYvL38HRteaSM7pGFFv23uk8BC7fDiKRGZt1aacUF6L?=
 =?us-ascii?Q?a5sIWqos5Af921vpI0c2L44cN33GEwncdmlVDi67+VYPf/gNgDpreeFechAy?=
 =?us-ascii?Q?vheDyMdGGzawQN/8kvyorxMiIuARZBJaDArrB2GbeHMjBKkKQywwEK0g6iAL?=
 =?us-ascii?Q?WkgTzM8s9Atit3UGoipPKBN6u6xj6EjBvJ0HnEN5CTCEohXtQHqUiJhHc8Ma?=
 =?us-ascii?Q?7wl4bRvZShBDvd8Iab5BhU2r0kmZFyFEOXGikE/dgvbsH3SHZb/QbIgJ2aPN?=
 =?us-ascii?Q?jdaPuOm5/ctKxjVjQGNU84YswnUx1SsREHY4jnsOjd9aK68tk2QVWhPCp/ry?=
 =?us-ascii?Q?bxub7QcHzCr4bzTEBhVQYVNXFNlrKScQUSV2/hrqmBe/mrFjlXiC6RlhaVoB?=
 =?us-ascii?Q?kkfMT5/gYGeHp9cwHYLOYyEh8FTd6TwkouxxWMre1jp47XCV+vCIZZ5FY/P8?=
 =?us-ascii?Q?KFF+y84FY/bjViua7lP1eoMjywfwz9pSx56ay3aZPO5OH2KvWWtG4qKDiTqZ?=
 =?us-ascii?Q?dPce4i5j0GQn4ZCvohYTozUmADd4f92OMQK2s369nMnKc3fIOHBNNtnqugMU?=
 =?us-ascii?Q?5CF363pC7iRovUVsnZjf4P4+kB8KvxypIV6d00Y7KMi8VA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FoOerQH9nqptY9yI3LwRJaf84EIPQ+sOIS+lY/720/4ffEesu4x6/xT9VX0W?=
 =?us-ascii?Q?97MtG1u27xllR1aazGcTt2AFBeq1Y4tQpLonepqBQQb1RzsTVcrRVTCAIeua?=
 =?us-ascii?Q?DUrX70rpqG4p0aMnAAUwppMpayH39Ydx0rsCZlXTIkJQb+NwR3c0RZnzuneJ?=
 =?us-ascii?Q?Mnu4xDCuivid/HdSFbqarOPZHuK6tQWJbAw9euUwtulcoospiPEazsDSkgHr?=
 =?us-ascii?Q?Brfh5h3zlrGkmMkNKU8K/qg6/mNa9NmkdRg3Gr5UWMIGRc12mGOM5Xs7Ps1J?=
 =?us-ascii?Q?mXlL5U05Ccc/l/frt4qDloRKXTsLHesgCynsJvCq6mY3HJXtFFLngFk2rqYK?=
 =?us-ascii?Q?6WFpM5RjhRaAfZlN5rtP/fDiPlBVzcjioM/z693Fwv8yQD4mNyCAbABMuQoo?=
 =?us-ascii?Q?m40jtQDIHO6pP/YgM7h+/xGMOkQe4jU6aWazlXjdYgZgBmYMFUy8UPzf1yH+?=
 =?us-ascii?Q?88QUCTTDIE/MHIo+niRIgqVJWZMblmOH08+LhF0XN0pyGTvCS6ZW45SH8j9s?=
 =?us-ascii?Q?RLmOhRwMC3nCpddbdXnRZIyl8SNKZkeuE1TL7rE/Slyc94Vk/v79WHlwQGfF?=
 =?us-ascii?Q?gZ3hquvG9z5go9pTrEvjG5iXDgRimJvCIGfV0TJeTGG76TrqAHjFCnT008nf?=
 =?us-ascii?Q?RrRU5MCcPtvaTWNx3Cry9ne+2QhgiMSlf4Z+O7DRfMhlMGBbo4H2SiNYZmwL?=
 =?us-ascii?Q?B2oP+fvZfrQmDcaFufnqxkNz4hCNwdYDkZTuxO3l9b/UvIr8Q5OWu79NlsXX?=
 =?us-ascii?Q?X0U+h0vmG9BuuRuMD+PdPg4x5CFqjSPP/KVk8/Ydxg8ylKeOiClzQW86sAif?=
 =?us-ascii?Q?beivk2xo+nOvpztH9cCG2RQHhsySFgzFRnFUl7OHpBm7qjaK0e81ZvSWJb0P?=
 =?us-ascii?Q?Ia6pjXKlaKFxL7ghkxr3PngTD9c5nQGrHudfEX2mSi1KDtVQMNmxgLSy/Oa2?=
 =?us-ascii?Q?tJGGDnFiwBE/DHJw/4Y8Q3b6825JDdILdQN46oIb+AjAOPRK4TS83zf5ezC2?=
 =?us-ascii?Q?xar3e6piwjvcKvM7hUMJv3TI36+cEET+EFxsag+N+5Es3v6qDBI4vzETxiXI?=
 =?us-ascii?Q?nyL49WfdcKtZxBr7mUq/YIGCvPP+LHeX/Nd/79AMvzxZIJdwV/32xr9AOp/j?=
 =?us-ascii?Q?C/H9t9g0Ym1MNOJ6zPnq2WhFnhRUreNx7pwAm5qxg1PfR3XExG5MRPMPwvfO?=
 =?us-ascii?Q?ODinbHKhY2BdaPCWlc6yH+l4/I563yQbPP8mEN7CUSPJZWW/q2LcLaMvZ7hy?=
 =?us-ascii?Q?TeslrfSxylJ1EEbBZVnXKCVeqah9nyWB0K4pSNe5JnSb4rgypAbiPSqeoRw7?=
 =?us-ascii?Q?46G6y8j8f67B3HzGOWa8yq76eSZ3xTtZDQhBB0yXTDCEA+tUEAAaQKS3VtoL?=
 =?us-ascii?Q?ULZuqXjVh/CYz+2hcBaE0FGCESDIHiRSJGnU1wR7yOdTyr7UCfbFLBECM6tB?=
 =?us-ascii?Q?YNQ1kivFyWeAecJMfFeZRC9w8Kov+zW4bGuYpdhwDOq5TrIb+p/35lCE7qAd?=
 =?us-ascii?Q?bxkXfOTOH8aLb28y6gxl9a4Nsix6yn1NjxWnSuEpv/b6XLTrY9Lb/ys9TeC7?=
 =?us-ascii?Q?a/YDii/vu9Dk4O7m1xqa8Ks8iyfRgfvxkHbTOLGzoh9dt4KM/QUTNvvrNufr?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1f5f7d-4a13-45fd-7a3a-08dd5066a581
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 21:53:15.2852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vh35wj0lvUluQvOH34PRk5ntZSmfz1AO3rKS8xm8/yivh41G2sC56NaA+0qWbz0xQcX0uNU/9evWYMaTypyWBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7184
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

On Thu, Feb 13, 2025 at 11:58:27PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 13-02-2025 07:41, Matthew Brost wrote:
> > Migration is implemented with range granularity, with VRAM backing being
> > a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime of the
> > TTM BO is limited to when the SVM range is in VRAM (i.e., when a VRAM
> > SVM range is migrated to SRAM, the TTM BO is destroyed).
> > 
> > The design choice for using TTM BO for VRAM backing store, as opposed to
> > direct buddy allocation, is as follows:
> > 
> > - DRM buddy allocations are not at page granularity, offering no
> >    advantage over a BO.
> > - Unified eviction is required (SVM VRAM and TTM BOs need to be able to
> >    evict each other).
> > - For exhaustive eviction [1], SVM VRAM allocations will almost certainly
> >    require a dma-resv.
> > - Likely allocation size is 2M which makes of size of BO (872)
> >    acceptable per allocation (872 / 2M == .0004158).
> > 
> > With this, using TTM BO for VRAM backing store seems to be an obvious
> > choice as it allows leveraging of the TTM eviction code.
> > 
> > Current migration policy is migrate any SVM range greater than or equal
> > to 64k once.
> > 
> > [1] https://patchwork.freedesktop.org/series/133643/
> > 
> > v2:
> >   - Rebase on latest GPU SVM
> >   - Retry page fault on get pages returning mixed allocation
> >   - Use drm_gpusvm_devmem
> > v3:
> >   - Use new BO flags
> >   - New range structure (Thomas)
> >   - Hide migration behind Kconfig
> >   - Kernel doc (Thomas)
> >   - Use check_pages_threshold
> > v4:
> >   - Don't evict partial unmaps in garbage collector (Thomas)
> >   - Use %pe to print errors (Thomas)
> >   - Use %p to print pointers (Thomas)
> > v5:
> >   - Use range size helper (Thomas)
> >   - Make BO external (Thomas)
> >   - Set tile to NULL for BO creation (Thomas)
> >   - Drop BO mirror flag (Thomas)
> >   - Hold BO dma-resv lock across migration (Auld, Thomas)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_svm.c | 111 ++++++++++++++++++++++++++++++++++--
> >   drivers/gpu/drm/xe/xe_svm.h |   5 ++
> >   2 files changed, 112 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index 0a78a838508c..2e1e0f31c1a8 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -32,6 +32,11 @@ static unsigned long xe_svm_range_end(struct xe_svm_range *range)
> >   	return drm_gpusvm_range_end(&range->base);
> >   }
> > +static unsigned long xe_svm_range_size(struct xe_svm_range *range)
> > +{
> > +	return drm_gpusvm_range_size(&range->base);
> > +}
> > +
> >   static void *xe_svm_devm_owner(struct xe_device *xe)
> >   {
> >   	return xe;
> > @@ -512,7 +517,6 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
> >   	return 0;
> >   }
> > -__maybe_unused
> >   static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
> >   	.devmem_release = xe_svm_devmem_release,
> >   	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
> > @@ -592,6 +596,71 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
> >   	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
> >   }
> > +static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
> > +{
> > +	return &tile->mem.vram;
> > +}
> > +
> > +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> > +				       struct xe_svm_range *range,
> > +				       const struct drm_gpusvm_ctx *ctx)
> > +{
> > +	struct mm_struct *mm = vm->svm.gpusvm.mm;
> > +	struct xe_vram_region *vr = tile_to_vr(tile);
> > +	struct drm_buddy_block *block;
> > +	struct list_head *blocks;
> > +	struct xe_bo *bo;
> > +	ktime_t end = 0;
> > +	int err;
> > +
> > +	if (!mmget_not_zero(mm))
> > +		return ERR_PTR(-EFAULT);
> > +	mmap_read_lock(mm);
> > +
> > +retry:
> > +	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
> > +				 xe_svm_range_size(range),
> > +				 ttm_bo_type_device,
> > +				 XE_BO_FLAG_VRAM_IF_DGFX(tile));
> > +	if (IS_ERR(bo)) {
> > +		err = PTR_ERR(bo);
> > +		if (xe_vm_validate_should_retry(NULL, err, &end))
> > +			goto retry;
> > +		goto unlock;
> > +	}
> > +
> > +	drm_gpusvm_devmem_init(&bo->devmem_allocation,
> > +			       vm->xe->drm.dev, mm,
> > +			       &gpusvm_devmem_ops,
> > +			       &tile->mem.vram.dpagemap,
> > +			       xe_svm_range_size(range));
> > +
> > +	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
> > +	list_for_each_entry(block, blocks, link)
> > +		block->private = vr;
> > +
> > +	/*
> > +	 * Take ref because as soon as drm_gpusvm_migrate_to_devmem succeeds the
> > +	 * creation ref can be dropped upon CPU fault or unmap.
> > +	 */
> > +	xe_bo_get(bo);
> > +
> > +	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range->base,
> > +					   &bo->devmem_allocation, ctx);
> > +	xe_bo_unlock(bo);
> > +	if (err) {
> > +		xe_bo_put(bo);	/* Local ref */
> > +		xe_bo_put(bo);	/* Creation ref */
> > +		bo = ERR_PTR(err);
> > +	}
> > +
> > +unlock:
> > +	mmap_read_unlock(mm);
> > +	mmput(mm);
> > +
> > +	return bo;
> > +}
> > +
> >   /**
> >    * xe_svm_handle_pagefault() - SVM handle page fault
> >    * @vm: The VM.
> > @@ -600,7 +669,8 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
> >    * @fault_addr: The GPU fault address.
> >    * @atomic: The fault atomic access bit.
> >    *
> > - * Create GPU bindings for a SVM page fault.
> > + * Create GPU bindings for a SVM page fault. Optionally migrate to device
> > + * memory.
> >    *
> >    * Return: 0 on success, negative error code on error.
> >    */
> > @@ -608,11 +678,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >   			    struct xe_tile *tile, u64 fault_addr,
> >   			    bool atomic)
> >   {
> > -	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma), };
> > +	struct drm_gpusvm_ctx ctx = {
> > +		.read_only = xe_vma_read_only(vma),
> > +		.devmem_possible = IS_DGFX(vm->xe) &&
> > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > +		.check_pages_threshold = IS_DGFX(vm->xe) &&
> > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> > +	};
> >   	struct xe_svm_range *range;
> >   	struct drm_gpusvm_range *r;
> >   	struct drm_exec exec;
> >   	struct dma_fence *fence;
> > +	struct xe_bo *bo = NULL;
> >   	ktime_t end = 0;
> >   	int err;
> > @@ -620,6 +697,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >   	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
> >   retry:
> > +	xe_bo_put(bo);
> > +	bo = NULL;
> > +
> >   	/* Always process UNMAPs first so view SVM ranges is current */
> >   	err = xe_svm_garbage_collector(vm);
> >   	if (err)
> > @@ -635,9 +715,31 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >   	if (xe_svm_range_is_valid(range, tile))
> >   		return 0;
> > +	/* XXX: Add migration policy, for now migrate range once */
> > +	if (!range->migrated && range->base.flags.migrate_devmem &&
> > +	    xe_svm_range_size(range) >= SZ_64K) {
> > +		range->migrated = true;
> 
> 
> shouldn't this be set to true, only once xe_svm_alloc_vram is successfull ?
> In case of bo alloc failure retry wont enter here.
> 

No. The point of this is try to migrate once to avoid a live lock case
of concurrent CPU and GPU access. Once we have migration policy, I'd
suspect memory marked as prefered VRAM only try once too. If memory is
marked as VRAM only we'd retry to a limit and if reached kill the app.
We can work of those details when that code lands. Until then, trying
once seems reasonable.

Matt

> > +
> > +		bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
> > +		if (IS_ERR(bo)) {
> > +			drm_info(&vm->xe->drm,
> > +				 "VRAM allocation failed, falling back to retrying, asid=%u, errno %pe\n",
> > +				 vm->usm.asid, bo);
> > +			bo = NULL;
> > +			goto retry;
> > +		}
> > +	}
> > +
> >   	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> > -	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have changed */
> > +	/* Corner where CPU mappings have changed */
> > +	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
> > +		if (err == -EOPNOTSUPP)
> > +			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
> > +		drm_info(&vm->xe->drm,
> > +			 "Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno %pe\n",
> > +			 vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> >   		goto retry;
> > +	}
> >   	if (err)
> >   		goto err_out;
> > @@ -668,6 +770,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >   	dma_fence_put(fence);
> >   err_out:
> > +	xe_bo_put(bo);
> >   	return err;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > index 0fa525d34987..984a61651d9e 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -35,6 +35,11 @@ struct xe_svm_range {
> >   	 * range. Protected by GPU SVM notifier lock.
> >   	 */
> >   	u8 tile_invalidated;
> > +	/**
> > +	 * @migrated: Range has been migrated to device memory, protected by
> > +	 * GPU fault handler locking.
> > +	 */
> > +	u8 migrated	:1;
> >   };
> >   int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr);
> 
