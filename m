Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2558FA3B16C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 07:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AA410E221;
	Wed, 19 Feb 2025 06:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KqAK/MLW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861EF10E1FC;
 Wed, 19 Feb 2025 06:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739945253; x=1771481253;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NWrzfjIZZSyqzSiUrNu9qzZwRxR3JVeYaFqeAGLNcGc=;
 b=KqAK/MLW0ZoJGzPk9o/tPdXVqlK0rMMJMniVX3zGWIx0RxSdkKP/aay+
 nrNf7RN07Q2yIjK+zjTksMKfeQpBxzVX1amSSxRWopVXxylz4dp/ozuLO
 5BUGe6m6Q50laBAqExiup9Q8cuzXCg4Rd1ceR7PBpfnO5ZphqSCay3Fj9
 j8Gwjh0GPh/cykZ2ma+Hrwr49hOq8x2NTcoTbU9w+iMBqegKPTHF26lIA
 E7SM7l0jryXa4Km/RUWKoDqRo7cMHnHIOIJmn4gAbo+/vmyjinGqrPS6m
 4o6pTNCv0hU3TITA7edxvXZP80QBMA705VpeRPTjh4SV/9GFJZJ3EaDCs Q==;
X-CSE-ConnectionGUID: BsGCfMygTq2Mi714WNM5vA==
X-CSE-MsgGUID: VvKksnoERKq/qvuQ9X8Sog==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40793566"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="40793566"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 22:07:33 -0800
X-CSE-ConnectionGUID: 52ODZNKCSTufEKxL1ajQtA==
X-CSE-MsgGUID: NsIaM7J2RcuJx/rPLq+52g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="114541012"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 22:07:32 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 22:07:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 22:07:31 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 22:07:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FoJuNwbM49u9RufP/7nO77Si35ZOidMijC+Zzvj+qx9HJmNfb0r6th6ltV8sxVEdDr3xGyF44Su+1YNF4fpvI/wqRl9lGSikKcHPfS6pFLWmhJFP0k/sNQZSCDn2KM9XjD+oOVHn9wgEVfFfFdI5U2STaijxVkRdAKuaczxWxiXVgaAhvW0qNeFqlNk5Y5GPtiVfng/inYonxqQOQESqHKK+TiKKjqSE7vClH70ro/aa9R/TuuQF5Val/a11KtSTlDr0Cx6mZF56YO6Si+x6D6Ekw1Mmg70zjr3mT6FaHvAbFnkF9q3nrIIoxqSLtPJRzYVxqYwLxx1NR6Kq9jT/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVCZ84utsIGXtMf7v+G2/mS2DEblfzhBcm2ugQ6geuE=;
 b=DiEC88pEj2IMw1t16amyjoc3CCjQj5vLfsRX8DqXMzSFp285rg2SJS8rfkl9RnffozfMQpZ6/VtSzpVTfPDOpx7XXyH4mqd46yykttMVWmiunwVqqPi9v8t+IqonCgQ7Nx8jZd6tAyOVCKBH+h5d+hZmQN+pPSXxr09iJXEvE8lnrFi5ofqlxJ1bjSvHUPP5biwEdeoL9eUHSKPHsrsRSRs7FRs5z4R3hG6uUFjl6xNEDQ9Qa5Gr4TtJiWgmB1de7G5gseFpInhFR8MZUAXte4ssOXcTsdLEti/+xWhkGf7l61xZy5LnHsulgzQFm0oInWlW5u+AlS4yjUOtHpwlQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8138.namprd11.prod.outlook.com (2603:10b6:610:158::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Wed, 19 Feb
 2025 06:07:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 06:07:29 +0000
Date: Tue, 18 Feb 2025 22:08:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v5 03/32] mm/migrate: Trylock device page in do_swap_page
Message-ID: <Z7V1X9mD8XnPZqwC@lstrano-desk.jf.intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-4-matthew.brost@intel.com>
 <roahnchztct5tff3elxhzssei537m5hijmq2zp2t2kbsyetwy2@e3b4msq4bbdr>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <roahnchztct5tff3elxhzssei537m5hijmq2zp2t2kbsyetwy2@e3b4msq4bbdr>
X-ClientProxiedBy: MW2PR16CA0029.namprd16.prod.outlook.com (2603:10b6:907::42)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: fad697d5-1b5d-4aa7-3887-08dd50abb0ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?JwdzKsaf06+Y6uHxXEy8o9DcsuzBu0kqAfT/AbBv0Dbv68dGLJza1B/77a?=
 =?iso-8859-1?Q?XFqCY7bpbAvP47E/yZrqb8go7/1b2NWDUAljRVN0maIZesPbPrOou7GKdF?=
 =?iso-8859-1?Q?VZrIFOYRtejQ+xV7kl40RkS8IFywrMtk4zDSuqnafDNu1i+7V5C1jg578/?=
 =?iso-8859-1?Q?6wfme7iUCXI3MaFbtIByQwJVottnG6cTpZyzu0rtcQDzd7Rb3mK8ZGrZrp?=
 =?iso-8859-1?Q?n/hlilTsGcH3JB4mgYvAkSbpBRssL+mNtxQJvQWVDtIO0fw/BR1V5CihBz?=
 =?iso-8859-1?Q?SgHPkYFrji5PJLlsI3OwqaJIDe+wleHPk6JBGZFhdhjxNtoc2P5Oy+pfYQ?=
 =?iso-8859-1?Q?405ijRxob7hy/zZMSNihHxV7lzJ3omPv0SQGJluddQ+YsLJSkv342LCvVo?=
 =?iso-8859-1?Q?6cpvykTMO2w14399IuL5y3ygZA+bchWG8udpRIN6XrDsZaoaUCx26Iqcr5?=
 =?iso-8859-1?Q?h+UyreeN3/rwcjUatyL3DjYybfmnm+pwbxiMLJNxT1RjEsu3jPZgP6nYeh?=
 =?iso-8859-1?Q?2hVYfDkQfF2t6BZddVooO2dRlRDzOwszbYFfos4nZbmGN8LUGkYhktux5z?=
 =?iso-8859-1?Q?DBSJkssGVJCDc9vuqpgMmUJ9TQ4AgHTMTC2SXbmFE+bQugqlXy1enTBYxg?=
 =?iso-8859-1?Q?PMTDPSNTgO8SBc3bDp7waOhhOb37RPkjoj409Pjcqf4oqK881N9qioJBjb?=
 =?iso-8859-1?Q?owRmDPVC4qRLwzECbqGtUC5LHNt0CF6wWregCFDor5K3usG5txAfcXGOQ+?=
 =?iso-8859-1?Q?lmLqtMqQSm9/6+ovWRrXjHwTag0Oq3GmSY8uw7ujXxr9p/CX1FynhGbeTJ?=
 =?iso-8859-1?Q?9FSjB9DNoXa3aPOWeje1pX6yFqgbNoGKaGtDUb+8/jn7xDq/YZmB+oiD/k?=
 =?iso-8859-1?Q?DslCfEA16pQmKWb4ZqMZxBFpEoBT/OaN8tWDfDc+nlgrhNljDFem3vEoR9?=
 =?iso-8859-1?Q?ac9UD/JYj3ocPXrX0+VwzFA5mFaO2F2+WxTELM6FYqegZ1z7/ad8SyRXMu?=
 =?iso-8859-1?Q?hdNzId/oT3JnjcWO9Rv1yGfpGL4R2f4WkwO4pIw65PZNGvpszX4FzUwKxj?=
 =?iso-8859-1?Q?csNnL/bfr57InZkIe6uxTe+Z76QQLX5QPImYc4wE9K3iszbFfZ1ecCiQmi?=
 =?iso-8859-1?Q?LRdTRC486QsfdVEaAYu2bL7it2Tk7+9Yc6xHVulbi//ZYBCzv0YqZenw3h?=
 =?iso-8859-1?Q?zFn3IjSGB26U7BaAoiv9nnW53gjqtvtkw7+5sHpDeVt7F3J8t0b1It8zYW?=
 =?iso-8859-1?Q?uHU0Qs9f6swCQspctDOwCJvGVEqezQb3j5C6LDoGbjmtUEVWKLm6CPMH3n?=
 =?iso-8859-1?Q?f65poqSymrL76uY1RqCnaRcjI8SdwiWoZsQDP9T0zWB4ZYQReUQ41jSBQM?=
 =?iso-8859-1?Q?+yUa/r+wM2nM7Nq9jCTwXEOmFWxEFDfA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DpEgBqgFwtmfFux1ku/s5hOkwLWADLyeJ9jWxv+F3r1NKRZyhrDL52yGvF?=
 =?iso-8859-1?Q?9T+eaJQ2MmKXE6/KCSepkTyITN3esnGLx/FSb4Rx5VrzZiUJQN7PYCQyj0?=
 =?iso-8859-1?Q?3L7AOtE2ckHdSkknMFxI+Mvsuw4F/TrH5HtxBhDJaxLz7V5Vz6JZslcWGe?=
 =?iso-8859-1?Q?356kU8tPlHPCcoKAjWRKqqzScRfrFgLqMigfKwtaIbKfBME6cKSc5ApSsH?=
 =?iso-8859-1?Q?mSu7YsbGNXMUhVukZU+45A0uVzzOiFFiiv1W1QwSb+42XiGjneVsbigXiW?=
 =?iso-8859-1?Q?OqGXIs6plVAVOyC1bOkqzRb1kKHkkux060oRQQcPSTqEqM3BZhXgguTyd8?=
 =?iso-8859-1?Q?5KTE+Stfe194guTuBGrmAPceXkTCu+IEg9PBcWV4hW0BRfAxabAG4kAoF8?=
 =?iso-8859-1?Q?oGtLC5TgQmFACIZSfri1iBMlogQoDZE9is1ACrGWC1VmX5oj6KlMVTGOJg?=
 =?iso-8859-1?Q?EFuXagIh0CR//d8QAa3daBC45WAeVVlc/k2UrMI8UMdjiY5dzWNghhNibg?=
 =?iso-8859-1?Q?o0ZW9UF1RJxBMBX2aJDZjhoVaKTwOr3hE1jA9nrXmEQVpH9qSdhJMbmxOC?=
 =?iso-8859-1?Q?G4M9gVPBDkE6T2+/9k2EYo76IX9SScElYktUmCojJ9jBID5fs2/lY2ZElW?=
 =?iso-8859-1?Q?Uq4+qyDaU94OzpSclXNbqQGfAQJJRbu4EDTDKrUNzRPh8XVoGcrBbE+2P+?=
 =?iso-8859-1?Q?qlif2KBP2YR0PakwN6rkzuClm0w9M8LxHEZCB31J77eL7OfUuTCQ+Ub0zt?=
 =?iso-8859-1?Q?8hud2PUUAjiwEgnbfbzhqU8wT/FWQqF50RhKWIBUammvxeH1oITB5waBSb?=
 =?iso-8859-1?Q?VtwxW0EdUvg8+PVmQ2IR9UscJazKzpQL4URlsNsvUfvD9cPpznes0maE39?=
 =?iso-8859-1?Q?fBLfIsnGG/87D/6JzdvuCNhtC+eB+/9K8xBkepEbKJXSsawMMak0uIlZmm?=
 =?iso-8859-1?Q?6ChXMZ1fIE1QkdoswlVOzuAh4I/gpEbuLmqJhoCa2wbsOIq5aPnauJbgjl?=
 =?iso-8859-1?Q?sl07RRJtpv0fgmO9vINmiuuORgiWr8ELQKp90oXEGMM5VDN0lPbub8IS1R?=
 =?iso-8859-1?Q?hEDgBn5GB3oizhqjkPcX8YWwyYXDfZvH0qOKAckaohT2/D7fsU24Tiukk4?=
 =?iso-8859-1?Q?jqvu1OMKmYl+uvjYYmnftu5/nYcJNdmykBJNGxr9zrjGz/cWPPEnK3SDF4?=
 =?iso-8859-1?Q?RGnWV+HPDHwLBmNXlF624TatsIElX/srVvOFslcIDcx7Ov1KP0zI8Q+LX9?=
 =?iso-8859-1?Q?Hbyv+Vhihi/nduO1Fr0Q7B6kF33WDFldqoFAM6YmJD05uxZu32jwFWSSip?=
 =?iso-8859-1?Q?lGhNXgPHEYJMZTcfsgrSewXkHXVXuGl70P9EEXN4qmoGWNiNXbhhrQorUc?=
 =?iso-8859-1?Q?KLEtKBtIupoYuFGt+Wwnk4hINX78Kmtj6cJptexKoMaYvbhp8h8n/VmVx+?=
 =?iso-8859-1?Q?DG1FYLRW3oa9AWGhpp+q6iXL53S8GD/EEG0LFSagIw3IoUaE6tw7m+jDE9?=
 =?iso-8859-1?Q?DVFX5NBLrspxMGsFeYL2MI++DYIV9Q7l7RjPXP0X7kWhkzBi/06H68QtK5?=
 =?iso-8859-1?Q?Pe/jFBNQs2oJHx4qmwYajr1JKWLO72fpSXA/7NBuUm229qzrSPR0R2kVBo?=
 =?iso-8859-1?Q?lMYlmmFlonQR7qIn+xGUTz6EJYuD3Q1uUPODwmy+rAVty+RDFeumtm/w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fad697d5-1b5d-4aa7-3887-08dd50abb0ed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 06:07:29.6041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1vMcNQ2y5sUA0XaVwrS0xzcsLvjVvpGavXvBlUnx76KeMmrnRtEJc+5+oRmAZS30o9IAOWLp/5IrUDlVvM4f1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8138
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

On Wed, Feb 19, 2025 at 04:36:54PM +1100, Alistair Popple wrote:
> On Wed, Feb 12, 2025 at 06:10:43PM -0800, Matthew Brost wrote:
> > Avoid multiple CPU page faults to the same device page racing by trying
> > to lock the page in do_swap_page before taking an extra reference to the
> > page. This prevents scenarios where multiple CPU page faults each take
> > an extra reference to a device page, which could abort migration in
> > folio_migrate_mapping. With the device page being locked in
> > do_swap_page, the migrate_vma_* functions need to be updated to avoid
> > locking the fault_page argument.
> > 
> > Prior to this change, a livelock scenario could occur in Xe's (Intel GPU
> > DRM driver) SVM implementation if enough threads faulted the same device
> > page.
> > 
> > v3:
> >  - Put page after unlocking page (Alistair)
> >  - Warn on spliting a TPH which is fault page (Alistair)
> >  - Warn on dst page == fault page (Alistair)
> > 
> > Cc: Alistair Popple <apopple@nvidia.com>
> > Cc: Philip Yang <Philip.Yang@amd.com>
> > Cc: Felix Kuehling <felix.kuehling@amd.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  mm/memory.c         | 13 ++++++---
> >  mm/migrate_device.c | 64 ++++++++++++++++++++++++++++++++-------------
> >  2 files changed, 55 insertions(+), 22 deletions(-)
> > 
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 539c0f7c6d54..1e010c5d67bc 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -4337,10 +4337,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> >  			 * Get a page reference while we know the page can't be
> >  			 * freed.
> >  			 */
> > -			get_page(vmf->page);
> > -			pte_unmap_unlock(vmf->pte, vmf->ptl);
> > -			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > -			put_page(vmf->page);
> > +			if (trylock_page(vmf->page)) {
> > +				get_page(vmf->page);
> > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > +				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > +				unlock_page(vmf->page);
> > +				put_page(vmf->page);
> > +			} else {
> > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > +			}
> >  		} else if (is_hwpoison_entry(entry)) {
> >  			ret = VM_FAULT_HWPOISON;
> >  		} else if (is_pte_marker_entry(entry)) {
> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > index 19960743f927..3470357d9bae 100644
> > --- a/mm/migrate_device.c
> > +++ b/mm/migrate_device.c
> > @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  				   struct mm_walk *walk)
> >  {
> >  	struct migrate_vma *migrate = walk->private;
> > +	struct folio *fault_folio = migrate->fault_page ?
> > +		page_folio(migrate->fault_page) : NULL;
> >  	struct vm_area_struct *vma = walk->vma;
> >  	struct mm_struct *mm = vma->vm_mm;
> >  	unsigned long addr = start, unmapped = 0;
> > @@ -88,11 +90,16 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  
> >  			folio_get(folio);
> >  			spin_unlock(ptl);
> > +			/* FIXME support THP */
> > +			if (WARN_ON_ONCE(fault_folio == folio))
> 
> This threw me until I realised this was the THP path because we'd expect to find
> the fault_folio during migrate_vma_collect_pmd(). Of course we don't currently
> have DEVICE_PRIVATE THP so faulting won't ever get here which makes sense, but a
> slightly more verbose comment along those lines would be nice.
> 

Can make the comment a bit more verbose in the next rev.

> Otherwise it looks good and passed my tests so please add:
> 
> Reviewed-by: Alistair Popple <apopple@nvidia.com>
> Tested-by: Alistair Popple <apopple@nvidia.com>
> 

Thanks!

If Nvidia / Nova might make use of GPU SVM, Sima requested an external
ack outside of Intel, as prerequisite to merging this series [1], on the
documentation patch [2] detailing the design principles, current status,
and future plans. If you think reviewing it is appropriate, any input
would be appreciated.

Matt

[1] https://patchwork.freedesktop.org/series/137870/
[2] https://patchwork.freedesktop.org/patch/636838/?series=137870&rev=5

> > +				return migrate_vma_collect_skip(start, end,
> > +								walk);
> >  			if (unlikely(!folio_trylock(folio)))
> >  				return migrate_vma_collect_skip(start, end,
> >  								walk);
> >  			ret = split_folio(folio);
> > -			folio_unlock(folio);
> > +			if (fault_folio != folio)
> > +				folio_unlock(folio);
> >  			folio_put(folio);
> >  			if (ret)
> >  				return migrate_vma_collect_skip(start, end,
> > @@ -192,7 +199,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  		 * optimisation to avoid walking the rmap later with
> >  		 * try_to_migrate().
> >  		 */
> > -		if (folio_trylock(folio)) {
> > +		if (fault_folio == folio || folio_trylock(folio)) {
> >  			bool anon_exclusive;
> >  			pte_t swp_pte;
> >  
> > @@ -204,7 +211,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  
> >  				if (folio_try_share_anon_rmap_pte(folio, page)) {
> >  					set_pte_at(mm, addr, ptep, pte);
> > -					folio_unlock(folio);
> > +					if (fault_folio != folio)
> > +						folio_unlock(folio);
> >  					folio_put(folio);
> >  					mpfn = 0;
> >  					goto next;
> > @@ -363,6 +371,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> >  					  unsigned long npages,
> >  					  struct page *fault_page)
> >  {
> > +	struct folio *fault_folio = fault_page ?
> > +		page_folio(fault_page) : NULL;
> >  	unsigned long i, restore = 0;
> >  	bool allow_drain = true;
> >  	unsigned long unmapped = 0;
> > @@ -427,7 +437,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> >  		remove_migration_ptes(folio, folio, 0);
> >  
> >  		src_pfns[i] = 0;
> > -		folio_unlock(folio);
> > +		if (fault_folio != folio)
> > +			folio_unlock(folio);
> >  		folio_put(folio);
> >  		restore--;
> >  	}
> > @@ -536,6 +547,8 @@ int migrate_vma_setup(struct migrate_vma *args)
> >  		return -EINVAL;
> >  	if (args->fault_page && !is_device_private_page(args->fault_page))
> >  		return -EINVAL;
> > +	if (args->fault_page && !PageLocked(args->fault_page))
> > +		return -EINVAL;
> >  
> >  	memset(args->src, 0, sizeof(*args->src) * nr_pages);
> >  	args->cpages = 0;
> > @@ -799,19 +812,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
> >  }
> >  EXPORT_SYMBOL(migrate_vma_pages);
> >  
> > -/*
> > - * migrate_device_finalize() - complete page migration
> > - * @src_pfns: src_pfns returned from migrate_device_range()
> > - * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > - * @npages: number of pages in the range
> > - *
> > - * Completes migration of the page by removing special migration entries.
> > - * Drivers must ensure copying of page data is complete and visible to the CPU
> > - * before calling this.
> > - */
> > -void migrate_device_finalize(unsigned long *src_pfns,
> > -			unsigned long *dst_pfns, unsigned long npages)
> > +static void __migrate_device_finalize(unsigned long *src_pfns,
> > +				      unsigned long *dst_pfns,
> > +				      unsigned long npages,
> > +				      struct page *fault_page)
> >  {
> > +	struct folio *fault_folio = fault_page ?
> > +		page_folio(fault_page) : NULL;
> >  	unsigned long i;
> >  
> >  	for (i = 0; i < npages; i++) {
> > @@ -824,6 +831,7 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >  
> >  		if (!page) {
> >  			if (dst) {
> > +				WARN_ON_ONCE(fault_folio == dst);
> >  				folio_unlock(dst);
> >  				folio_put(dst);
> >  			}
> > @@ -834,6 +842,7 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >  
> >  		if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE) || !dst) {
> >  			if (dst) {
> > +				WARN_ON_ONCE(fault_folio == dst);
> >  				folio_unlock(dst);
> >  				folio_put(dst);
> >  			}
> > @@ -841,7 +850,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >  		}
> >  
> >  		remove_migration_ptes(src, dst, 0);
> > -		folio_unlock(src);
> > +		if (fault_folio != src)
> > +			folio_unlock(src);
> >  
> >  		if (folio_is_zone_device(src))
> >  			folio_put(src);
> > @@ -849,6 +859,7 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >  			folio_putback_lru(src);
> >  
> >  		if (dst != src) {
> > +			WARN_ON_ONCE(fault_folio == dst);
> >  			folio_unlock(dst);
> >  			if (folio_is_zone_device(dst))
> >  				folio_put(dst);
> > @@ -857,6 +868,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >  		}
> >  	}
> >  }
> > +
> > +/*
> > + * migrate_device_finalize() - complete page migration
> > + * @src_pfns: src_pfns returned from migrate_device_range()
> > + * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > + * @npages: number of pages in the range
> > + *
> > + * Completes migration of the page by removing special migration entries.
> > + * Drivers must ensure copying of page data is complete and visible to the CPU
> > + * before calling this.
> > + */
> > +void migrate_device_finalize(unsigned long *src_pfns,
> > +			unsigned long *dst_pfns, unsigned long npages)
> > +{
> > +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
> > +}
> >  EXPORT_SYMBOL(migrate_device_finalize);
> >  
> >  /**
> > @@ -872,7 +899,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
> >   */
> >  void migrate_vma_finalize(struct migrate_vma *migrate)
> >  {
> > -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
> > +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
> > +				  migrate->fault_page);
> >  }
> >  EXPORT_SYMBOL(migrate_vma_finalize);
> >  
> > -- 
> > 2.34.1
> > 
