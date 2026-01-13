Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B8ED15F87
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 01:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6762810E43D;
	Tue, 13 Jan 2026 00:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pp1dtQfZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690DD10E43D;
 Tue, 13 Jan 2026 00:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768263818; x=1799799818;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0UAu4Iz7YTNRQSNlw8C98tDWmoer3PhO+kBYwzHAcyM=;
 b=Pp1dtQfZTR0kJNxufXKOH74ntK5QmxDl4a4MhWw6bvOsRF8fEdr+1lhE
 zr9NjQbF5Hj4VQjfovF6CIRFtP9wrz+fs0gvRA1JUqYCLbHPbhLsJfaSW
 1k9ab3OkrAnORJx/5eksI41QqB3VSz4wIk/evdzK2E5PPoO48JRwg3Hu6
 vfIKGqQDdqkJbMZ/wFezgsuVBSggtBZ0uBTbzip3sdtTEg49+ekv5S/Rh
 pcehDWEXhDtMWtFeuhYBmTdhdFWogEjrzSGt2wGmhPM1CKWVepOJUrZdO
 K8tqiNcjyy6hHiyGqT9KFiPYNPUWULD3OvBR6F7biu+KNH82bTJmMmBad g==;
X-CSE-ConnectionGUID: g+UpqR4ZQUS5zXQVhNqmKw==
X-CSE-MsgGUID: 6e+DWyTGTDGFMsTJb4PqvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="72126870"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="72126870"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 16:23:38 -0800
X-CSE-ConnectionGUID: ylBhWH1NSI6aHb5R3FlNwQ==
X-CSE-MsgGUID: ReU39CeARa+LD/ck/MH/yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204137535"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 16:23:37 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 16:23:37 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 16:23:37 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 16:23:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWVmwJnPFtFsADRuvLLCg3v+8HZY871Uq+2W9+h0vylY+1en7v/joDAZRWLb036ORWB+Kuxju3Mv0PGdhykZmMZEdHCaEOs2XF27+oK02Q+cMGnzjR9q88CacXBdY3FZtO0U4cPXBx36cesKSd8he559pIfad7nzGkzao1CF0gPiQP9MWBHof4MZy5Jqe/HSqze0hy9Un21YCL8UEa5Qopb97ximya/vvZC2CjLHRLrw+dm+qXotjZ1pcUMXoy8fNB5zt00fRUrqiv61yxnhBCG3vrMLJHWjyhe8q4n1a5R7QIKVTFEj6yFm9DpCLHePFiHU3Wx5bsS+JbveVFUiBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMmvR4yyAgGV24MFR6Zgq/8I6HXA0KqFviE2RO7Twh8=;
 b=TNVVhDfvb6AGClp1HE4IFghRh1wGD91SwSjvB8i21A+npG6BzqV87p7x0401da+GS0VMTQy3xRT/8w0+z3H8wR3LTWIZdeJYjQGH3rod9iw1QgU7jq+bDZfKXPB8a20eA2svy+kM+nquTs9qcTjywAMqWXjmauc92Ilag/v0vhfXlpc3tY3+u71ztNVNxhQ7UsOy5AQlyxyM/ELYfobbAaYjAva4UVcjE+Utd5l/hcHJopKn8lijORqnwcPmpUiKCABMqUarPym3jIfaZxXCeLlSQMZCQkC6gF8Ws2EaaBs+WlPG5u98h2KMuXDaRNXzJ4kaQJuSuwkA3ie4AHcjOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4517.namprd11.prod.outlook.com (2603:10b6:208:24e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 00:23:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 13 Jan 2026
 00:23:35 +0000
Date: Mon, 12 Jan 2026 16:23:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: Balbir Singh <balbirs@nvidia.com>, Francois Dugast
 <francois.dugast@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Zi Yan <ziy@nvidia.com>, David Hildenbrand
 <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, Andrew Morton
 <akpm@linux-foundation.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, <linux-mm@kvack.org>,
 <linux-cxl@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/7] mm/zone_device: Add
 free_zone_device_folio_prepare() helper
Message-ID: <aWWQhOD8g8oLz1vX@lstrano-desk.jf.intel.com>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-3-francois.dugast@intel.com>
 <706ba3a6-5be2-46d7-9e7d-d613f2e061cc@nvidia.com>
 <aWRLeoUJAYAWbLD3@lstrano-desk.jf.intel.com>
 <k25qmqrfmhzkls2ngdaq4wdk3xtl3epv4z3dvukon5yj2cb2hl@yci7xdpvauh7>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <k25qmqrfmhzkls2ngdaq4wdk3xtl3epv4z3dvukon5yj2cb2hl@yci7xdpvauh7>
X-ClientProxiedBy: SJ0PR13CA0150.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4517:EE_
X-MS-Office365-Filtering-Correlation-Id: 75e96ccc-638f-40d3-7b3b-08de5239fd43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VW1KSXdSZzdKUWtSNnBpZm5IeWxvOXh6YUJTd0RpSERuQ3JvZVpTakxESExy?=
 =?utf-8?B?T2ZaNkdrRHRsK3ZDZE5YNkV1Wkc1bHBodnN3T29vY25yUHVTOHZsRTEwdktk?=
 =?utf-8?B?cXRybndGSFp6bGRwUlU5UHR5REZsL3VQeDlzdm1lNlUybC9CQ2E1QTBxdjhC?=
 =?utf-8?B?Z3Y1ejJsakFaMGRZQ2pSQnJ4d2t1TktWelo0QnBudCtickxvUS9RZi9wU3Bh?=
 =?utf-8?B?eWNVanE2UzlvM1JCc2FMMHlRYkcxOGVNOFBYVURrRHJGblBwbFBmS0g0a0Vo?=
 =?utf-8?B?QzV5a0Fub1EyUURHWEVQSE1VeUlPL0RHNzB1STJpangrdTllLzFuOEhiUkhy?=
 =?utf-8?B?VTBickI3ZEl6Z3JGaWdkK25BSTFxMkJ4dWNRMjhVMEdtWFlzWHBhamRaWUlN?=
 =?utf-8?B?M01OcHJvU2wzSWU4MnZidzhnMjJ5R1VndjFHL0NQYW9NenB5RlRrdFdVRkZa?=
 =?utf-8?B?U1R2S1Z3NmVFREFzOGZ6UlpiSWNDMWFqaXFOM2NPZDgvWjVlRzdtWkVoT1Vj?=
 =?utf-8?B?NVhZZkJlQmhPRTNBdFRUY2Z5S1dGM3JSdnFlWm1PZm9ibTk4QUV0MEs2YmIx?=
 =?utf-8?B?NUp3Q1Z6ZWNVZ2U1Rmw3cVVaRit5L1BuRVFnOUw1OHE2QVphV1BXRmlYaUpF?=
 =?utf-8?B?MndSdnhhY0NhRUdQaEFwUU02ZmgvVWhJaFlxenE5bDB0S3ZWRnVIMmhnb3J4?=
 =?utf-8?B?cTBwcEx1S3hzT2pFVVptb2xMWC91aDMycnlkbXhBUUhCQ3FWZ05BTkY0VTdS?=
 =?utf-8?B?YmdmSys1QzBqcnN2a2tJVDM0bEZLSDNFZGJUcjdlancvcWxjWnNVMFpHSG0z?=
 =?utf-8?B?YjFwMktkK0JKamVNbitFR3kwLzgydkJ3ejR2Z1pTc2RsRWI5SUQxd1pCZWlk?=
 =?utf-8?B?aXJIUDBVOW83WXlhRjZaMzVqZzJwYU5kZVVYN1lmSkV2bE1oMkl0QXlRS1dV?=
 =?utf-8?B?WVBIaHdNWHVKSjNzRUdYM2Rrc3RZUHR2R0tHZFZBYWRlV1czY25uZEVhalZ4?=
 =?utf-8?B?NnpOay9Yc0xIU1VoZE5UdzcrYlRVRE13SXgvbEszazRBMUFvaHc5SXIrTkZ5?=
 =?utf-8?B?TTAyUTBEeEdSR0JxRnFOYVd1cWRuclpoNFgzUnBoS3UycTlITm1NbUNxRlpB?=
 =?utf-8?B?eGlkNVlxNDRiU0M3UW9uZWsvaDlOOXdLVFYrNlU3KzU3NFZsRWwxSyszOXdQ?=
 =?utf-8?B?WE1hQUo5NTE2MHc4V0oyclVnYzJQWEQ1d2VCeEVZVk1RWXJ2V3haMURNMDZS?=
 =?utf-8?B?Q0kxaFIyTGpRM0M3OVdLYkw4U1Y0S0RGeGhpN1MrZXRtaTZMYVp1SHFGTytr?=
 =?utf-8?B?dDVHaGpCSUcyN1FFK0lBeTJqeHk2ZWxuVmlYMWZ1eWVIa3M5UWJ0RDc2YjAz?=
 =?utf-8?B?MU9UKytoK0dPZjduckNJRWRlN3o4Y1czbUdYRGRWbHo2MFI0Z1BIdWx4SVB5?=
 =?utf-8?B?Y3A3Wk44eWM1OHRza3BxNWQvdGJ6SDFMQm5PVEVmL1prTy9Pby84eVFuTlBF?=
 =?utf-8?B?Ump4WWl2MktvbThSZ3JZMkxjUE85M3RSV2dlUytvN3BRbktWdVdVZEZQNGhV?=
 =?utf-8?B?bDNzNGEvN1NZNmRkUVFCNjAwZmZRamFWTHM4K1RkQ1pqUStCc0ZIV0FHRVlt?=
 =?utf-8?B?YWdITUpUNk13aWFCa0tNOEZoaTc2MWZ6cnVYMmliaXR1K1MvYkpuMkl4Y0to?=
 =?utf-8?B?dXMxVElobWI1KzRzdSt1dHFTQS9aUnNCa2dmQnl3Y21wbE5GL3docXRMRk9C?=
 =?utf-8?B?aytIQnpuRVhaUFA0ZTFmR1oveGoxRVRmaDBkV3kyOUNhVTQvSk5ua2ZvZ1pP?=
 =?utf-8?B?VllDK01ZeXVtTStGYUNFT1NRZlVxWjFCYmIyMWRCR0FVR0JIL3JvRVJvN1Jv?=
 =?utf-8?B?V1RqeklqaFNyTWlNTTdwZmM5RUtuNFp0d2NYWVRBVklHZzlNbnQxdEdpVVN1?=
 =?utf-8?B?VWdxVWlzbllmeHV5QXF4eTdaVHJ2ZGhpc3NjZ2diYTJoVG11RUlxV0o3clZw?=
 =?utf-8?B?eFNEcGcyZjZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWk1bkxaSkNpczJUeENxSkxVNmo0VmtMeXRncTZ5eEpZRmtjeWZ2a3owTHgv?=
 =?utf-8?B?aXZocTJ3TTMzaDhvVm41OHdWeHdONlBTektPZ1FZUVIxb3FIZVBFNUVXZVFp?=
 =?utf-8?B?UUUzMm1vUVd6TFFIMlZNT2NyK0svcTI2c0xjU29XeGV0S3VjenlZcE9abjJQ?=
 =?utf-8?B?NXdkSlp3bSs3SHo4WnJZUVBiaXhLV0dtblk2K1F2aVE4bE0wNlhhV3NkMWdv?=
 =?utf-8?B?LzFBUXJSUHEzUUNwZmw2ZEJkV0RwRnQ2K0dDRGJweGV5eW1BVmVDTlFQa1JJ?=
 =?utf-8?B?elU4RGlwOW9DS2pMa3VOSUpveXk3SnNuVW1ieWRlcUZ1YUI3RTY2L2plQ2Mv?=
 =?utf-8?B?NG9HSzdqdHNtSVp2azdTZW5NeVVGdnB2UldoUWpWTjhnQllFMFAzWHdRS0cr?=
 =?utf-8?B?WFNzUjVZd1c2YnAyZElOR21qdEpsM0RGT3Y1ZWFxaGM5NDdWZjVyWHZ0dWsr?=
 =?utf-8?B?d21Lakt5OTRYUGpGcDJLYUZURmZIamVYQmpTZDdqMmFYaDhEbGhLTUxqV2F2?=
 =?utf-8?B?SWZtMXc1N0RIQ0VmRll6aWUydlFrL2c2S2NHOFpLOG0xcDV2ejBtY0pqYU9t?=
 =?utf-8?B?ZEt4citOVmJBWTFGR1dYU0lCdmJjQ2tqNDdpMzJWeTd4L2FUZFZEcWVIdVYx?=
 =?utf-8?B?Y1kyMDdjSXY3eUFLQm1pTlpNdXJWcFgwcHUvdVBsYnZ5bkFZREsxYXdMUmZk?=
 =?utf-8?B?bTBFVThuejJxQU51TE9PQ1VwN3RNUWd3eVpETlpBRnBkSCtjUFhIZm1vMUM5?=
 =?utf-8?B?LzZBNmE2S2piYWtZM2RQR3RlU20rVEhkMjRVK3g4aTMrcWJzSU40ZWRJU2ZI?=
 =?utf-8?B?MjNmTzhpVVo4c1NXWUFyd3J6NU9GalV4YWJWcHdTVzJJdTl5anBCQzB2RitU?=
 =?utf-8?B?dGdQY05qQncwdVRNTlo0SzJrTmRRd1A2M0Vra0R0RW4zR2ZNeGhxek5ieFpt?=
 =?utf-8?B?WC9FTXdteUg2bEg1QnpVbkNQY3BZeVZiMmZyaTBjTmFBQ1VyWmdKOCt0dCtY?=
 =?utf-8?B?dUkxS1pZQThWdXk0OFJrcHgvd0NOUXdWTnhpckpXdHp2NlNQRU5UTHE3djk0?=
 =?utf-8?B?SWFLZXVJZXZobmVBVjdJTHQ4Ui9DWEZxeVh5azE0NEV2OGpPTU9CTDFDNVZm?=
 =?utf-8?B?dkcyNjJXTVRxYnNmcGRId1hIblllNktWcitCTjgrNjgrcE5YRkVGVEYwUjVn?=
 =?utf-8?B?MUJ2Rmx3NWhCWlZYQUY3ZGNSdGNzbTUvOExYeVFzeGN1NTVOT3BmMmoyaGNE?=
 =?utf-8?B?ck5NT2J0TlRLYzJxSzNraFp2WEZ4U3dnVUNsaVE4WDFPdUhyU0NGa0twZmlK?=
 =?utf-8?B?bFZwUWxuSkZnNHRObWozcjNiYjRVZTVRcUg0N2RVczJNbVhXejRIeW9ubUdN?=
 =?utf-8?B?MmRyckpFcTJ1Y2dVZXloLzdLUFJKUzI1eHBTak44NHlQUUFxRkRvblkrOG93?=
 =?utf-8?B?TlhKdTdyMjQxa2VVUDBKZlBWRmxueEgrRmRKU2hqRHJKVTZWYTVxY0IrVFFF?=
 =?utf-8?B?Zk5DSGQybTVSak1IRVplVFF5VUFZMkx5cWZtbk51UHh3WDF5ZDZUK3VqSzFL?=
 =?utf-8?B?WlU0S3FHZmpDNnBDeFNoQjRvWCtoQTFxbCszd1JRaElJYTIwRWF3RVRucHQ2?=
 =?utf-8?B?R3lGSzY5UmNCVU91TU9ObDlNVjBjbmhvU2N6MGJ0a0lmQksxTlVIRzdZL0xV?=
 =?utf-8?B?L0Y5RHJpMXFvaXFIVEhwMUFvRFFwR0QvcE1tRnNSSlhjcDFCY1Ivai9DUndO?=
 =?utf-8?B?QXprOFdrc1JPQ3FwdGNqeXdhSnFOQW93ZmtNd0VvVHdSWW9sSEJETWRRV1Qy?=
 =?utf-8?B?cXU0WnBQZFhiNFFRR3lBQ2J4bEViZEdkZ1lHZVBORjhDRWxXRld2V0hkOXZT?=
 =?utf-8?B?MWpBMnlEZndNZ2dPZDBjWnJGNElCVktzdVZ0SzdIZmxnWnVDQ3hlajVwbFNi?=
 =?utf-8?B?S0lkVWV5QzgyRFgrakRQcnFVN3hYZVNWc1o5emN2WU8wMC82TkMwaDU0ZFZ4?=
 =?utf-8?B?ZURzaXZjMXJnK0FUbS9WOFowaUFpSGNPb2pvd293ditqOFh4Mk9uNVF3THBv?=
 =?utf-8?B?d05GNmtZYVMvMVIxd0VaR0RNSU1vemhJQ3BYWXArSCs1Z0ZZdHAxcjdTNjQ2?=
 =?utf-8?B?R3IyOERlS3NyUGRWaWVBWlRnYU9EMVdzclZaSlBsOFRZeFJ4bWVQeHdtZkNE?=
 =?utf-8?B?UXZha3VRRUQ4eWdkUmdHTmRCQTJTWGFsQ2VMbEs5S3YwUlE3OTRZT21TVUtq?=
 =?utf-8?B?cUlJNEhaLzRmZjQyNk5IQ3Vka1FCNjI1bUpyQURpMHdDOGpyUGQyNUZUT2JW?=
 =?utf-8?B?bmJhTWtVWCtsN1lYTVBidGI3NFViVmRYaGkzSVpURmdUdXRMV3pRc0pJVGtD?=
 =?utf-8?Q?X2eadBc8q7ZRTusI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e96ccc-638f-40d3-7b3b-08de5239fd43
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 00:23:35.0555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POyoMOSivX7bdjGIjTIzDdr3VBYji6VRG2E5g8vl+NsnahokI8mBy8px3nQKVOOAG41Mb3Z3F8/hhLvX4gfskg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4517
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

On Tue, Jan 13, 2026 at 10:58:27AM +1100, Alistair Popple wrote:
> On 2026-01-12 at 12:16 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> > On Mon, Jan 12, 2026 at 11:44:15AM +1100, Balbir Singh wrote:
> > > On 1/12/26 06:55, Francois Dugast wrote:
> > > > From: Matthew Brost <matthew.brost@intel.com>
> > > > 
> > > > Add free_zone_device_folio_prepare(), a helper that restores large
> > > > ZONE_DEVICE folios to a sane, initial state before freeing them.
> > > > 
> > > > Compound ZONE_DEVICE folios overwrite per-page state (e.g. pgmap and
> > > > compound metadata). Before returning such pages to the device pgmap
> > > > allocator, each constituent page must be reset to a standalone
> > > > ZONE_DEVICE folio with a valid pgmap and no compound state.
> > > > 
> > > > Use this helper prior to folio_free() for device-private and
> > > > device-coherent folios to ensure consistent device page state for
> > > > subsequent allocations.
> > > > 
> > > > Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> > > > Cc: Zi Yan <ziy@nvidia.com>
> > > > Cc: David Hildenbrand <david@kernel.org>
> > > > Cc: Oscar Salvador <osalvador@suse.de>
> > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > Cc: Balbir Singh <balbirs@nvidia.com>
> > > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > > > Cc: Vlastimil Babka <vbabka@suse.cz>
> > > > Cc: Mike Rapoport <rppt@kernel.org>
> > > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > > Cc: Michal Hocko <mhocko@suse.com>
> > > > Cc: Alistair Popple <apopple@nvidia.com>
> > > > Cc: linux-mm@kvack.org
> > > > Cc: linux-cxl@vger.kernel.org
> > > > Cc: linux-kernel@vger.kernel.org
> > > > Suggested-by: Alistair Popple <apopple@nvidia.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > ---
> > > >  include/linux/memremap.h |  1 +
> > > >  mm/memremap.c            | 55 ++++++++++++++++++++++++++++++++++++++++
> > > >  2 files changed, 56 insertions(+)
> > > > 
> > > > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > > > index 97fcffeb1c1e..88e1d4707296 100644
> > > > --- a/include/linux/memremap.h
> > > > +++ b/include/linux/memremap.h
> > > > @@ -230,6 +230,7 @@ static inline bool is_fsdax_page(const struct page *page)
> > > >  
> > > >  #ifdef CONFIG_ZONE_DEVICE
> > > >  void zone_device_page_init(struct page *page, unsigned int order);
> > > > +void free_zone_device_folio_prepare(struct folio *folio);
> > > >  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> > > >  void memunmap_pages(struct dev_pagemap *pgmap);
> > > >  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> > > > diff --git a/mm/memremap.c b/mm/memremap.c
> > > > index 39dc4bd190d0..375a61e18858 100644
> > > > --- a/mm/memremap.c
> > > > +++ b/mm/memremap.c
> > > > @@ -413,6 +413,60 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(get_dev_pagemap);
> > > >  
> > > > +/**
> > > > + * free_zone_device_folio_prepare() - Prepare a ZONE_DEVICE folio for freeing.
> > > > + * @folio: ZONE_DEVICE folio to prepare for release.
> > > > + *
> > > > + * ZONE_DEVICE pages/folios (e.g., device-private memory or fsdax-backed pages)
> > > > + * can be compound. When freeing a compound ZONE_DEVICE folio, the tail pages
> > > > + * must be restored to a sane ZONE_DEVICE state before they are released.
> > > > + *
> > > > + * This helper:
> > > > + *   - Clears @folio->mapping and, for compound folios, clears each page's
> > > > + *     compound-head state (ClearPageHead()/clear_compound_head()).
> > > > + *   - Resets the compound order metadata (folio_reset_order()) and then
> > > > + *     initializes each constituent page as a standalone ZONE_DEVICE folio:
> > > > + *       * clears ->mapping
> > > > + *       * restores ->pgmap (prep_compound_page() overwrites it)
> > > > + *       * clears ->share (only relevant for fsdax; unused for device-private)
> > > > + *
> > > > + * If @folio is order-0, only the mapping is cleared and no further work is
> > > > + * required.
> > > > + */
> > > > +void free_zone_device_folio_prepare(struct folio *folio)
> 
> I don't really like the naming here - we're not preparing a folio to be
> freed, from the core-mm perspective the folio is already free. This is just
> reinitialising the folio metadata ready for the driver to reuse it, which may
> actually involve just recreating a compound folio.
> 
> So maybe zone_device_folio_reinitialise()? Or would it be possible to

zone_device_folio_reinitialise - that works for me... but seem like
everyone has a opinion. 

> roll this into a zone_device_folio_init() type function (similar to
> zone_device_page_init()) that just deals with everything at allocation time?
> 

I don’t think doing this at allocation actually works without a big lock
per pgmap. Consider the case where a VRAM allocator allocates two
distinct subsets of a large folio and you have a multi-threaded GPU page
fault handler (Xe does). It’s possible two threads could call
zone_device_folio_reinitialise at the same time, racing and causing all
sorts of issues. My plan is to just call this function in the driver’s
->folio_free() prior to returning the VRAM allocation to my driver pool.

> > > > +{
> > > > +	struct dev_pagemap *pgmap = page_pgmap(&folio->page);
> > > > +	int order, i;
> > > > +
> > > > +	VM_WARN_ON_FOLIO(!folio_is_zone_device(folio), folio);
> > > > +
> > > > +	folio->mapping = NULL;
> > > > +	order = folio_order(folio);
> > > > +	if (!order)
> > > > +		return;
> > > > +
> > > > +	folio_reset_order(folio);
> > > > +
> > > > +	for (i = 0; i < (1UL << order); i++) {
> > > > +		struct page *page = folio_page(folio, i);
> > > > +		struct folio *new_folio = (struct folio *)page;
> > > > +
> > > > +		ClearPageHead(page);
> > > > +		clear_compound_head(page);
> > > > +
> > > > +		new_folio->mapping = NULL;
> > > > +		/*
> > > > +		 * Reset pgmap which was over-written by
> > > > +		 * prep_compound_page().
> > > > +		 */
> > > > +		new_folio->pgmap = pgmap;
> > > > +		new_folio->share = 0;	/* fsdax only, unused for device private */
> > > > +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> > > > +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> > > 
> > > Does calling the free_folio() callback on new_folio solve the issue you are facing, or is
> > > that PMD_ORDER more frees than we'd like?
> > > 
> > 
> > No, calling free_folio() more often doesn’t solve anything—in fact, that
> > would make my implementation explode. I explained this in detail here [1]
> > to Zi.
> > 
> > To recap [1], my memory allocator has no visibility into individual
> > pages or folios; it is DRM Buddy layered on top of TTM BO. This design
> > allows VRAM to be allocated or evicted for both traditional GPU
> > allocations (GEMs) and SVM allocations.
> > 
> > Now, to recap the actual issue: if device folios are not split upon free
> > and are later reallocated with a different order in
> > zone_device_page_init, the implementation breaks. This problem is not
> > specific to Xe—Nouveau happens to always allocate at the same order, so
> > it works by coincidence. Reallocating at a different order is valid
> > behavior and must be supported.
> 
> I agree it's probably by coincidence but it is a perfectly valid design to
> always just (re)allocate at the same order and not worry about having to
> reinitialise things to different orders.
> 

I would agree with this statement too — it’s perfectly valid if a driver
always wants to (re)allocate at the same order.

Matt

>  - Alistair
> 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/patch/697710/?series=159119&rev=3#comment_1282413
> > 
> > > > +	}
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(free_zone_device_folio_prepare);
> > > > +
> > > >  void free_zone_device_folio(struct folio *folio)
> > > >  {
> > > >  	struct dev_pagemap *pgmap = folio->pgmap;
> > > > @@ -454,6 +508,7 @@ void free_zone_device_folio(struct folio *folio)
> > > >  	case MEMORY_DEVICE_COHERENT:
> > > >  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
> > > >  			break;
> > > > +		free_zone_device_folio_prepare(folio);
> > > >  		pgmap->ops->folio_free(folio, order);
> > > >  		percpu_ref_put_many(&folio->pgmap->ref, nr);
> > > >  		break;
> > > 
> > > Balbir
