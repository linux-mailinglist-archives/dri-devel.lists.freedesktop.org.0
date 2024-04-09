Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE8C89E1A7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 19:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E81C112E6C;
	Tue,  9 Apr 2024 17:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5eIfPBx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A925112E6C;
 Tue,  9 Apr 2024 17:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712684077; x=1744220077;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RH21BjHrQ5RJ/RtskUAAYitf6UqyUkDf8RwwzTsHGx0=;
 b=f5eIfPBxLDGdHyVkwcmSEjZjCkHRUn7ZWOSwoaCZJ+FoHmpX8RRs/AnE
 gkqu7ue1mvprtCTHRM34sgLS4ZypDbk0tn/t6c6A98GQXkKfSVOpxYZf6
 GCj7/CSTp1UnsrCrIaWI0mnH7r8U5/+mdMq7hI50PJE/KILNh5/Ek+/v5
 5m6/szIRDiFOsTLVtVYoNvxF0xaAf1m1zsX8N1dZrLeEysiNH2NYDA0cl
 qH8+dASl79rlanxl2/K7D+eFbMuxd+lMoYj65wMjGAxgtLOQe4clNO5X7
 8RjAcLl5Dj92LjwibA8mTTYMM/TJ/vXJfKXRNPuc2IAHrw4aYlzCdd93g A==;
X-CSE-ConnectionGUID: OsVXhNkbQLanZnTbNzo1Uw==
X-CSE-MsgGUID: 4jytZrAiTOee63O7Hj6FfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8586071"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8586071"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 10:34:36 -0700
X-CSE-ConnectionGUID: 1H31wm0yT12YD51UuA2MVQ==
X-CSE-MsgGUID: N0OdVTS8TNewnWGgmV2chw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20307547"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 10:34:36 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 10:34:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 10:34:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 10:34:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMvNBkcOLAKg8MDyRRtptaHCPyVyScViD3ZDdstH5CC2imlo1Ijz3UtcX6Nw6eoZ3XGfOk7lVT7BcuzCcou02fc0n8Rm+b1nKO8q3u5tVYucWSQeQf9qUfECqSqW3fBvDTDEUshu1XFQldeEhfRx5q8Q5Mc/0hat+4QVaEYN7e3QS3RkYfyh4gPEJlxW7NyPWai1EXdNF7qFaRBV2NDsS2G9bUh/5DgvwplYzFfK4B31Az0tZJyjS7gcoqBPHwOWmlr+5I0kXOxZydQWdrqVeAP5OeTNwpdAO6rDR7fgSWBDKS920kBrepe1sxt06YV3XrPve9JAN9oiLjt9wgNGhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W26chvb7IAXxl/9Wu5JyXOh76pwaCoS1dxoP8S59gkk=;
 b=g+ocZ4d8r6k04p2P6oEUwyYxT+v3Ht5O79PluVgIYRpnPHKY3LHzasu540wqlh0rax2ZVQPDSJwaHAu+0YdemXQ+SipQvRevQEtzVbTMZkznpUyFwkrwg4CWgpGcBSIy5CRcAooh8KBDMwsUtYHq9tn5aFQT8IFD/JsoN28bTmtu7H/UWGRbCBuHgjyZCLR1QtL78MGosV1rqHOa4T1gpEbGQ987SvPni9RzhBvwDLj3mGtXuZGnRcj5RklE3DX2oqu6M97GDY6rkydMu5RxO71rtvVLNk2M0fzPIu9QJk/pZf+n+poxwUuPwpahy1pgatr2l+o5Y/sLKQ84G0cXfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5066.namprd11.prod.outlook.com (2603:10b6:806:110::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Tue, 9 Apr
 2024 17:34:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 17:34:32 +0000
Date: Tue, 9 Apr 2024 17:33:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <ZhV721Wc4NcJPTVa@DUT025-TGLU.fm.intel.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-7-oak.zeng@intel.com>
 <20240405003927.GA11940@nvidia.com>
 <SA1PR11MB6991E4CDCD61A5D1909BB4EF92032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405123725.GD5383@nvidia.com>
 <SA1PR11MB699170C0F6FFFA231985718092032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405180212.GG5383@nvidia.com>
 <SA1PR11MB6991A4BD0EDDDF051A9A2C5C92072@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB6991A4BD0EDDDF051A9A2C5C92072@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::39) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5066:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ae/YEBB3ce3ZYhWskYGZiXqyjDv5BPn2thrkO08prhV8c9AweuPY6eR0ybH9gStvUenwCHa5zeSXjx4aF/dfEm5C5ryrsKp/QMlILIuTYE3sUdv1RpzPACJijAliEQ1en0FkpikwgHpbYpyYCnCyljpy0j6Yi5ACHlAnof2jWh0ZLP1Kg+gMmxfc/BdU5Qzq3rQp6lAlg8uD/+V5szB6gsSrbJyh9IpdjGYgQpfnuwO8I1hDSGjjliWxzcv0ey4kCs/CEjh13Acdaz9NgrX0C+9zy1nL/05Z9uWXIql72wAa7dqkGS6iiVUii2Rh2nUXOTpso4ipUqgC5f5c9upyIRVcW01LNoelnZRKgfGm4J9Y1vT+aABzAj3a/cJrT9DqPhDa7M1lN+/nQrlMiqpJaFwZUZ5Xi14MMjUW71dvocwo2NcO3yTw2s4D7hBGxWjTXOHbcxgtcRaZfXO14r4ycjT3ylektaatYg59+pa8AEir1MfnF6ITIqR/sfz1ATRyFjlVKmCmxUzCFkC3jX1/KT8DQQtHtaPIiAkYgd2pTNFZEMARIQt6slNbTagJAncyOpmnetbUtgrs1NtDyhmMR67mq2t3+DxoW9phHmeeMzXBzeVxt+6DbOu9+UeOlAO4fVAjhfCsQK1YVbD3PewpEa3eUObwxBa29JEaP+QsZu4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tElIxuLpEMDsJi/KleEgwZICmYMFPowK9aOToAWO8hBZ1ZsQ2oRFYPZC6uwE?=
 =?us-ascii?Q?5aXkqEqAYeK/NoplaAyXmDxrWcj3Yki5K1c01xuenjTiUIrbKgeVGh06B6sB?=
 =?us-ascii?Q?iuEoNUilNUYC76ohfCqpc5uD3uvoVs91iL53We+rOGtndC7agF0KHyQoEWr/?=
 =?us-ascii?Q?etA46ScozfDIq2znEe3lx4GaYACabcwBUrJJB7gCCTbPNX/Te3Q9jyDC8pv9?=
 =?us-ascii?Q?iJPHzWVzgIdGGwkRxnE3+apkFawNZrNaBAQLJs1lc5mZgl09vS6/PtZtWGnp?=
 =?us-ascii?Q?D8eALiNHyEYBDPoa9esIB/OLHq8mzEjC6I9eVYSVaezsZLNllWkW3FmjMRAW?=
 =?us-ascii?Q?dcMbhOiFrKZ//B9AUfIebFRVTVoin7j5BXaP3fl42aoexcZsKVn9mr7e3Zxw?=
 =?us-ascii?Q?NxPkHkvuX9Sb4hlFxpG2ZdCGFFdimwhZ4tzlqwqfILTpNQB7BOomPIPqnimX?=
 =?us-ascii?Q?Dk2i3RzRJCTZ3dTty08+EhCieP+cCsYkkBx0buLhytvQHYKRo3JM2S6up0z0?=
 =?us-ascii?Q?J8a/cxjgv4ovypfVgJtE3CoySnTVEe6YBCN2GWE6X2WN4gpFpjcqH3df5wEv?=
 =?us-ascii?Q?NM0UxQpXfy5wdf1JY1prj1B33JF4qwsg5ncd/gpiIoiYcMdBfLdjOB13Cyyy?=
 =?us-ascii?Q?w91eD23Iq8SuaMTSAC0xXQU1fZbMJ1sJX9NMMaJX0f6ztvpf3DFAcE7u2WHD?=
 =?us-ascii?Q?IXMA1Jj9NlRciUnjJKIum920IqeTMhb+/ZPBYxputghinzRia9uUiIWG08+d?=
 =?us-ascii?Q?cr8TxHGr6kxZUaT1QKDBwE3Kzv/H1bmkAqSDdGM5iWZyJIYDKwtcv5QepsKS?=
 =?us-ascii?Q?Ym+HEzoRBZ/19+jGd2vKyYRlKXwrFkmal4aUnR0ZcYEiVb4edoEvbowAtoSE?=
 =?us-ascii?Q?wIFMROVCuJ75vdyVWgFR79NgZvO3+LiFrop/+qf72+0sC+uES3zqzbYFpnic?=
 =?us-ascii?Q?z14B5/JfYrN5PALtw6eUPw2jSqh3oytEqZBTh1oA/VM0vU1l0IMbENwzSdr1?=
 =?us-ascii?Q?+VOmljTEiKeMHn7sk8Kv2KX8z2v6CgPFAAeDoY4XGIfnMNPZb6uVmtRk7WLc?=
 =?us-ascii?Q?bhr1l3EJER+7tSWXiI64582q9/3DB7EoCJZwim8jrweRXfNLyozUH/iyeFyV?=
 =?us-ascii?Q?cebdSkELor64X7cbvIi3fUmjj4MZtqT7E13Irl6076UGl9TIapqo0byw9dLS?=
 =?us-ascii?Q?uSQa9hUx6FYCwL5pSysah6csRofpCFv7XUY32XfliQwsBdhcimN0TX9Wuud9?=
 =?us-ascii?Q?6SH1Fmqg8+hTwJQFeAmeFbAxdgIerXTYszWcMfwlcmZwdOqtbNLuMwDSCL8y?=
 =?us-ascii?Q?fI83U4cvdNTSckYq9qDYI7g4r7mUQUMC7OEgKQoqd32TUkwISVl9AkJyHKWY?=
 =?us-ascii?Q?cV0piVOdzukY71wtoWGTHTuDZUEe0R8enDsrToNhbk3dQ+ZLYuCigkYEzlYJ?=
 =?us-ascii?Q?G4NmxXn/ayYKdb2NyqoQ3rfQMLZND+caNV5Mao+mz3DLsxrszu3RIa22nsDP?=
 =?us-ascii?Q?IqdeZ5anT7yrFZwTs/0Am7W1LI1hhGXlWb1mM6dG5l01nXamM/NdOkcBYQWp?=
 =?us-ascii?Q?6wHiKQj4Keo2lLEU9AT+duFjqIueuYuwQ1QlYKF/eRswGNBoB/vRXho21yE0?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e00934-d454-417c-f947-08dc58bb5154
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 17:34:32.7873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmZKNsn8jvAjYXBlXBrj0a5DDrPjEoptWtIVKT0Uj3xXJboEUriExGvnkorXmpuHNOavKd0h8/XfkE6DgKut0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5066
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

On Tue, Apr 09, 2024 at 10:45:22AM -0600, Zeng, Oak wrote:

Oak - A few drive by comments...

> Hi Jason
> 
> We are re-spinning this series based on the previous community feedback. I will send out a v2 soon. There were big changes compared to v1. So we would better to discuss this work with v2. 
> 
> See some reply inline.
> 
> > -----Original Message-----
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Friday, April 5, 2024 2:02 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Brost,
> > Matthew <matthew.brost@intel.com>; Thomas.Hellstrom@linux.intel.com;
> > Welty, Brian <brian.welty@intel.com>; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> > <krishnaiah.bommu@intel.com>; Vishwanathapura, Niranjana
> > <niranjana.vishwanathapura@intel.com>; Leon Romanovsky <leon@kernel.org>
> > Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table from
> > hmm range
> > 
> > On Fri, Apr 05, 2024 at 04:42:14PM +0000, Zeng, Oak wrote:
> > > > > Above codes deal with a case where dma map is not needed. As I
> > > > > understand it, whether we need a dma map depends on the devices
> > > > > topology. For example, when device access host memory or another
> > > > > device's memory through pcie, we need dma mapping; if the connection
> > > > > b/t devices is xelink (similar to nvidia's nvlink), all device's
> > > > > memory can be in same address space, so no dma mapping is needed.
> > > >
> > > > Then you call dma_map_page to do your DMA side and you avoid it for
> > > > the DEVICE_PRIVATE side. SG list doesn't help this anyhow.
> > >
> > > When dma map is needed, we used dma_map_sgtable, a different flavor
> > > of the dma-map-page function.
> > 
> > I saw, I am saying this should not be done. You cannot unmap bits of
> > a sgl mapping if an invalidation comes in.
> 
> You are right, if we register a huge mmu interval notifier to cover the whole address space, then we should use dma map/unmap pages to map bits of the address space. We will explore this approach.
> 
> Right now, in xe driver, mmu interval notifier is dynamically registered with small address range. We map/unmap the whole small address ranges each time. So functionally it still works. But it might not be as performant as the method you said. This is existing logic for our userptr codes. Our system allocator inherit this logic automatically as our system allocator design is built on top of userptr (will send out v2 soon ).We plan to make things work in the first stage then do some performance improvement like you suggested here.
>

Agree reworking the notifier design for initial phase is probably out of
scope as that would be fairly large rework. IMO if / when we switch from
a 1 to 1 relationship between VMA and PT state to a 1 to N, this is
likely when it would make sense to redesign our notifier too.

A 1 to N is basically a prerequisite for 1 notifier to work or at least
a new locking structure (maybe ref counting too?) to be able safely go
from large noifier -> invalidation chunk.

> > 
> > > The reason we also used (mis-used) sg list for non-dma-map cases, is
> > > because we want to re-use some data structure. Our goal here is, for
> > > a hmm_range, build a list of device physical address (can be
> > > dma-mapped or not), which will be used later on to program the
> > > device page table. We re-used the sg list structure for the
> > > non-dma-map cases so those two cases can share the same page table
> > > programming codes. Since sg list was originally designed for
> > > dma-map, it does look like this is mis-used here.
> > 
> > Please don't use sg list at all for this.
> 
> As explained, we use sg list for device private pages so we can re-used the gpu page table update codes. The input of the gpu page table update codes in this case is a list of dma address (in case of system memory) or device physical address (in case of device private pages). The gpu page table update codes in xe driver is pretty complicated, so re-use that codes is a preferable thing for us. If we introduce different data structure we would have to re-write part of the gpu page table update codes.
> 

Use the buddy blocks for the xe_res_cursor... We basically already have
this in place, see xe_res_first which takes a struct ttm_resource *res
as an argument and underneath uses buddy blocks for the cursor. 

> I don't see an obvious problem of this approach. But if you see this a problem, I am open to change it.
>

This should be trivial to change assuming buddy blocks are stored
somewhere (they must be, right?), so I'd do this right away.`

Only got to here, maybe reply a bit more later to below comments...

Matt
 
> > 
> > > Need to mention, even for some DEVICE_PRIVATE memory, we also need
> > > dma-mapping. For example, if you have two devices connected to each
> > > other through PCIe, both devices memory are registered as
> > > DEVICE_PRIVATE to hmm.
> > 
> > Yes, but you don't ever dma map DEVICE_PRIVATE.
> > 
> > > I believe we need a dma-map when one device access another device's
> > > memory. Two devices' memory doesn't belong to same address space in
> > > this case. For modern GPU with xeLink/nvLink/XGMI, this is not
> > > needed.
> > 
> > Review my emails here:
> > 
> > https://lore.kernel.org/dri-devel/20240403125712.GA1744080@nvidia.com/
> > 
> > Which explain how it should work.
> 
> You are right. Dma map is not needed for device private
> 
> > 
> > > > A 1:1 SVA mapping is a special case of this where there is a single
> > > > GPU VMA that spans the entire process address space with a 1:1 VA (no
> > > > offset).
> > >
> > > From implementation perspective, we can have one device page table
> > > for one process for such 1:1 va mapping, but it is not necessary to
> > > have a single gpu vma. We can have many gpu vma each cover a segment
> > > of this address space.
> > 
> > This is not what I'm talking about. The GPU VMA is bound to a specific
> > MM VA, it should not be created on demand.
> 
> Today we have two places where we create gpu vma: 1) create gpu vma during a vm_bind ioctl 2) create gpu vma during a page fault of the system allocator range (this will be in v2 of this series).
> 
> So for case 2), we do create gpu vma on demand. We also plan to explore doing this differently, such as only keep a gigantic gpu vma covering the whole address space for system allocator while only create some gpu page table state during page fault handling. This is planned for stage 2.
> 
> > 
> > If you want the full 1:1 SVA case to optimize invalidations you don't
> > need something like a VMA, 
> 
> A gpu vma (xe_vma struct in xe driver codes) is a very fundamental concept in our driver. Leveraging vma can re-use a lot of existing driver codes such as page table update.
> 
> But you are right, strictly speaking we don't need a vma. Actually in this v1 version I sent out, we don't have a gpu vma concept for system allocator. But we do have a svm range concept. We created a temporary vma for page table update purpose. Again this design will be obsolete in v2 - in v2 system allocator leverage userptr codes which incorporate with gpu vma. 
> 
> 
> a simple bitmap reducing the address space
> > into 1024 faulted in chunks or something would be much cheaper than
> > some dynamic VMA ranges.
> 
> 
> I suspect something dynamic is still necessary, either a vma or a page table state (1 vma but many page table state created dynamically, as planned in our stage 2). The reason is, we still need some gpu corresponding structure to match the cpu vm_area_struct. For example, when gpu page fault happens, you look up the cpu vm_area_struct for the fault address and create a corresponding state/struct. And people can have as many cpu vm_area_struct as they want.
> 
> Oak  
> 
> > 
> > Jason
