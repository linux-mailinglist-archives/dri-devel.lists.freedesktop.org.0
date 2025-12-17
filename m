Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD1ACC651D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 07:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B838410E04B;
	Wed, 17 Dec 2025 06:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AWT4wj5H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F4B10E04B;
 Wed, 17 Dec 2025 06:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765954662; x=1797490662;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pajyaap5Tn9DTKNuKcTDREEPvxMnCxQr58wdeQtNX1w=;
 b=AWT4wj5HgOqssbQ/hoR7Q50gIp8daSaC6I3zeAe0aCe3xK9PRire5OzU
 CGAiPWZruWXZrSL95bROIM1eWMfSo2NoBpFaa6waRJvFF9AwU2PjbMow0
 ou25VHfKYJDwWZp2wHWb5HvxPInMfGYmuVIEfaGkPGJazjPnsslIEUe91
 GP9s2fwst4j17v/d+zLByqQhjUPDujn6IfKLCgc2YjecpJM8C9Twp8D/G
 emB1GZzUPKBpHB/OSEMPziJr5ZWswQxvPX/VD9rV0OxJw0w5IOVk96rL/
 h+Rte7GPrrA6oFS6e2Phw7bilHTIowSCwFJh2QetqdgeQ8gnc5m+sK9nY Q==;
X-CSE-ConnectionGUID: SdANrYW7SKGpUe//IxjJIg==
X-CSE-MsgGUID: 9uERuw5VR52jbVAG8NxOhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78194824"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="78194824"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 22:57:42 -0800
X-CSE-ConnectionGUID: CpkSWgvkS56HBzhPTwYrHQ==
X-CSE-MsgGUID: eOQQLd/7S++zJmZ+YggQXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="202610483"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 22:57:41 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 22:57:40 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 22:57:40 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 22:57:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBxRvnO/t94cPSWTQR0BYUsBIsGWjCnFBEs+tjyLdQgzm+3YwxHXPedZNo+XNiPV0VOHge1bcpXs6iZdxE/p0MiXjkCk1BFTsWvMvsadLBk8a2lHSsF91/hxurn1FGpO0BH68TyyUrSVZIaKNyCnDP0HvcMKiSUeVx/K9SBhA91Mg5F0bwdGWMjqEL3om57MJ2eym3Av4t4Ae6C99G1IwQNAYjh8atfvaG3A2XHVeBFZzEuLT677tnr4NEsGPtZud1dp/RMmDXVhpb45ezi4PcSUo7AZAJJaaP4jGZkP+TsWJGwf8ZBZnVkf4RJg9+jpgkqXy4igTPt5nMDK5l7FxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpUaOcGhm/tcBBzwHqAW5PuwzqYoUiZPPgSUjXAIoCk=;
 b=gxVVqqPIwgbBP8i6aYtsOSfA6Hrv5ne3u8zqs+1hYwyiuLcAEz93yj5VWSIT187ql7QTAcd2yOvbo4jYyXFvP2ywn6X6Ad0fj2EKnqwA6kMpyMxf4VbR4LjfR0cz0HJ5pgzZO8BnSuubx0dnu5B1MykD/qybeGi3wrFRtor60LTgIQDZspYSlQxMFc8Kvg5I7vVsvODH+Eyb4eZSyPhFdZWa4KJlxrQ12zmj9gAetXw7ZfDQs/0crnB880mIMLEEIRuBqb9oo34/S/MbPakpIFSxKubFaheRcjM+tueabW80qLmfVxnK1sReLpJ0BQRVOUbeHwO9vuEASLeC7M1gdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SA2PR11MB4875.namprd11.prod.outlook.com
 (2603:10b6:806:11a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 06:57:38 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5%8]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 06:57:38 +0000
Message-ID: <fbfdd84f-20e5-4df9-bdbe-b43a094dfbd4@intel.com>
Date: Wed, 17 Dec 2025 12:27:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/22] drm/gpusvm: Introduce a function to scan the
 current migration state
To: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dakr@kernel.org>, "Mrozek, Michal" <michal.mrozek@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>
References: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
 <20251211165909.219710-20-thomas.hellstrom@linux.intel.com>
 <aUHxevBTPGKx/YKA@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aUHxevBTPGKx/YKA@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::6) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SA2PR11MB4875:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b500bc7-c528-44aa-815d-08de3d39907b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dCtsUHV5aUVLaFl1am9IZEFTTG9UelNIb2FKbWJHdUZaUUIwR1ZTSjgxU0JW?=
 =?utf-8?B?d016R05GZ3N1WXQ4SVNkS0VlYlpTeElZcldMUzlueVcrV1ZDdWEzY0g5ekN1?=
 =?utf-8?B?eU9KRFBPZEpyVk8zRXJseHcyWUYxaTVkMXBmbS9Kd0FGLzVLaDlSOVdRSU45?=
 =?utf-8?B?a2gyUXExVEhxcHoyOWx3K2c3REd3K2pyWlA4VFpPOG8zaDF3QlB1WCticGJl?=
 =?utf-8?B?RGNLTXhJYVVpMXpiRDZGVFg5eEMxQ0NPYmI4clFLR3FYeVhrdjFpM2hxRGUx?=
 =?utf-8?B?Y1BlelNFMXpVeS9ObGxEVnRjTnlaN0plb2VVT3gyUW5jMGlBbm1nWjhXVHNq?=
 =?utf-8?B?RTFWdzhQWFF4Qk9QNlhyNEQ5eGp4aEVmTHRCcFhiaUxzRnJlQ2R6czZTSFFO?=
 =?utf-8?B?TEhONUF3bGJXcXJPTFJuRXhuQUV0OHZYbm1ycUxlS1pYbUNlNEdzNXgzZTl6?=
 =?utf-8?B?KzRiS0psMm0wbnRzQ0swMlBsTDE5MVNUeGJJWFE1eUxYM2p0Vjd6U3J0NXFQ?=
 =?utf-8?B?QnAveml6SlIvOXBua3JoM0s5VVZ5TXVwZ1FWTWd0dzcxcXlRUWpxbUN2dnA3?=
 =?utf-8?B?dkU1OCtHVWhaTTNHVkh1b1BmclF4ZVdULzg4cDRUdWY1b1B1bVZhaXczVUU3?=
 =?utf-8?B?ZFQ0THcrLy9POGsxdFZpaXZxU09PcS80SlM3QlJMODFWNk9heFE1QnNhNzFn?=
 =?utf-8?B?NGdhRjB3V0NzWUh1cFl6cmN5NElENkFGTFlLKytsUktsSGlUeUV4WGNTVit4?=
 =?utf-8?B?NVJpbWxoZWF0WldnRy84TVZrNTFhU3NzdkZYL3prUzZBT0FxRmg5NlJBSzhD?=
 =?utf-8?B?SDBHb2pWYVRsT2N2Vkx3aEZNRnUwNmhsbE5tVnczOXhyMmx4cS9PTlVJTmEz?=
 =?utf-8?B?cUhBbUhvbmVZb0xQa2F1WmNYcFNkSG5LYW43RndFbFByM2ZFUURGMmVJQTNi?=
 =?utf-8?B?QTNYeHdCaVk4YStVUGlkYUVDaVJmNGlrdGoxbjI2WHhDTWJ5RXJQQ2wvV2Ey?=
 =?utf-8?B?RlgrZHpRaGJPOUtOcUJHdnpvZVE5TDJjamo1OUhkM3VwRVBEM0tnV2l3b0JY?=
 =?utf-8?B?bG9Ua2diNnZNblN2VEV3S0ZJb1ZpblB6aWoxTGhTeWd2aGtFSnB4YWI0OHdx?=
 =?utf-8?B?WTRhNnhYMTVnNFdHMFJLSEVzWWkydlhMNkJjM3VIZWVSM2xDK2VKWXV1TmQ5?=
 =?utf-8?B?REJWejNLNWZ3MHNnNDJSUlZVUzk4Y2g0K29RYTRUK2pCRERtM0FINWtyTlNa?=
 =?utf-8?B?Y1FNUmltU2xWNTZkQklxSldLd2tFZjczWlVQa01XeDkrUzhOS0FmVEhZUzB5?=
 =?utf-8?B?Wk5xOFJ6S2M4S3Q0cThRQjdIQmZ0VmdwWEdkTlhPZGdrUzRsRFR5Tk9PYjMv?=
 =?utf-8?B?cWQ0ZDdDNk84dHVTa1FtNzR2ZTF5TWNiTFgveDNkVEJzdUw4ZmFTNnRJalZh?=
 =?utf-8?B?d1B6TWxnNkdsM01ocE1uRS9RcFVuNjdMRkxyaFZtOTdnUVlWSkszejI1N3dx?=
 =?utf-8?B?YytFSy9vV00vanFFQUh3Ky9SeFVyclhYQVRYT01wME5rSmtxZkJiaUN6ZHhw?=
 =?utf-8?B?L2N2RmlnMGRWc2lCdUNZa0pnMXpLTDBRVHlHUzBjQUJMdWFtMFBHRjlYSmtp?=
 =?utf-8?B?dmFzN29jaXYyWlNadEFZVmdzSmdGQjJRdUsyQnZBOGJJUUZZaHo0RDRwVlMz?=
 =?utf-8?B?VVhKQTlMakR6VjRvVjhUTWR3VXhBL20xdTE5bm5lOFJXMUpnSmVlVkg5NlQx?=
 =?utf-8?B?LzVNNTBsVXFiekVjNFlPK1E2cnI2dHgvTEdtQUZrY1Y2VkNMK204UHRTVVBy?=
 =?utf-8?B?eityWjhCU2kyd3lqOHhQZk93NVlCbFhDS0tZRk9Sajg0a3dtcGF1UWxkbXR3?=
 =?utf-8?B?MlFaanI3WXJGMUNNRkRKaGplVXlLRW4xdktoclNwVDE0dUNTOWpTWVZxOVRi?=
 =?utf-8?Q?C85s/bJS3x6yDoHpi2RYHHh3xKwEJjC0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enVxS3Z3SVlOTG1LL2R3a0R4d1FQZ1M5UUt2akF2dS8wQWc4QmYzcEFiL0JC?=
 =?utf-8?B?R0U5N0o4ZmxFQ2JVaDhvQkpBbXJocjY1WWM5MmxZRFRhYUk3UlpBbFpBeFU0?=
 =?utf-8?B?TFNSVXR0aXQwMzNjT3U4dGs3ZlFySU91MzNsakUxSm54S0syeG5vN1RILzFQ?=
 =?utf-8?B?dnBCMzNQTzVHQ1RWTy93amc3bDdYRGZxKzlWSkFjZVZJVGRlR0ZodHpmc3I0?=
 =?utf-8?B?SkVZbGF2YzBWTzBLY014MzdPL1NPdWo5VFVlOEhwK3kvK1RhaXNxQzMvUlY0?=
 =?utf-8?B?Y0F0TlkzbERIZVhBSGJqbmRMb0JmWGFuZXBrYTI2eU1haW9IR2ZKOE5NTnpH?=
 =?utf-8?B?aE5OcnRwR3hhVG5ENGZOQ1lKeEVMYS9sd0plTE1FVGN2RzIxRjN3aEFUbzJX?=
 =?utf-8?B?eDlEKzI0Y3ZraGF3cTh2M0JqQUx6ZUVvdVhpL3Z1a0l0VU5zeTVxMWZhYWJ2?=
 =?utf-8?B?azdNMzY0NXJ3bzFvOWIvRC9OWnFzcUxFU2JhOU1GV0N2L3RwRWo3cENaeldD?=
 =?utf-8?B?SWx1R3hIb01aV0ZaT1BjTkt2Rll3VlUrNmZnejE0S3lNWU05UUpMc3d2MXhP?=
 =?utf-8?B?QzdPRXlLWnZ0Y3pNaGVkMXpvdDgzeW1USTJmY0ZHS0hSU3FoeFUvUCt3ODUx?=
 =?utf-8?B?SWJuU2s0amNIbzFLYlN6dHV2SnYrc09zOC9DeU9KWHMvTjdOVStCQXBFTDJ3?=
 =?utf-8?B?Q1YwK0xoVzVFK3hMWlVidmhGMU1oWHE4MnhBblZRSnRTV0tYeWNYQXNETUtr?=
 =?utf-8?B?OU05S01UMGlMTUpwcDVUTXpseXpVSXRUUXpNbTEwYitBNVNLeUVyYVpIOWp6?=
 =?utf-8?B?K212NTdZUWNRY240TzlVeEtraVdxWUNYZUR3eXJ1QjEyQUhyR1gwK2J3eTlB?=
 =?utf-8?B?ZmxYOGpMSmZPcHlzYzhsY2oyV0tEcEZCNFpWcjA3WDdON2RROG9VSWJUT3M5?=
 =?utf-8?B?TnZBdnJPckZvblJwdFlidmp5N09HNjhtR1kyL1ZJZmovYUN4cDdFM3RuaFo2?=
 =?utf-8?B?UkVRYXlBU0s0UUVVdmhzNXNnUkNhK2FxbjRHdzNQZUNUQkpNekM0SzlQdnVX?=
 =?utf-8?B?SWNaR1djdmhtUEdIVTRpTk42R3MrWlVURU4vU3JJOUVRMmZpM3hBRzdVS2xP?=
 =?utf-8?B?UlhnTWNaMkJIVFdMSDV2K0ZnN0ZLUVdhMEt4eEhHcWphRzI1UFNGWEI2aEQ2?=
 =?utf-8?B?VzNPQ24rSnBZQWkvckVXQlRJVW42QXlNL1RxdnlxQmhiYUVNSjJYODVFa3Q5?=
 =?utf-8?B?L1FHNjlsQ2ljdllCMDl3K2llTE5TQVpIVCtoeGE2WllETk5VbGN4b2RlTWZM?=
 =?utf-8?B?cFhENld5cHpiYVZlSnVvUFE1UjJqaXBBcWNtSm83elBuYXp2N1NwWEJ0MjBO?=
 =?utf-8?B?V3M4MXpKenBEb0lkc0pTMXNlVkFzdGxRWCtrQ0lTaFJOTUFtSWhySXJ5TXVU?=
 =?utf-8?B?RUFmQXZ4RitzUDlVaHlOSml5TFlPVVJ6S2hBci9xcEpjK2Z6UEx5VTRnQjIz?=
 =?utf-8?B?MXZhVGZzd3g3ckhyT2NzWTFyRUEvYW1NN2l3L0dHb2NsQXJVYTJJeGF5Y1J0?=
 =?utf-8?B?VjdzV2hUd0lDNmsyMks5S2E5Y2QzVFlheWZPZkdDazk1ZVA3aURLVTJrMUhC?=
 =?utf-8?B?SkpDb0ZTNzVjcFFvQU8zUXpXbEpvb201ekhyMlI5SVl6eDd0YitFM3VWV1oz?=
 =?utf-8?B?WFg0ZDdFY2tDdm1obm1DbWhmTXFGaEFHdUNnd0JIWGhSV1RGOHFsM2IzNzRH?=
 =?utf-8?B?QVBVcm0zOHBpMXhiMlFnZkRBMHNrUUFaakFiTXVybTZzVWE5UlhtSDVGa3JC?=
 =?utf-8?B?aUVQa0ZIcFI3V0NZOGlFUE1QenVDSG5MVVR4QTNTN0hEUEVzRXBvWDJ2T2k3?=
 =?utf-8?B?NDEyeFUxNlJ1b25wRzBrNktzeCtIZlg4bVNFTlAxVm9sdzBudG5wanR3SVIw?=
 =?utf-8?B?RVJaRCs1UERsSFYyQjlpQTVud3JuTVYwUWhqOGR4ekc3alpDYWpsQjhTZTRn?=
 =?utf-8?B?aEZhL2VmSWNKUis3T0ZuTVZtM2ZNdmgvUzFkeXdLeFhUZ3NlSWFyZ0NsRmZ2?=
 =?utf-8?B?c0dXWWpQVU9JMmVtdGI1VlBhRzlDRVpPUUZ5VnRmNFpZZnU5TFdRSmhXUU9U?=
 =?utf-8?B?QVUzMlV0OVNrQnk3ZjEvK0xic01kMzRPcndXQ1ZYSVVIUHFNeitMNW1PWVF1?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b500bc7-c528-44aa-815d-08de3d39907b
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 06:57:38.4541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVig9wZKN9Faj7n8qfmqjDPvSt23lXgVIP+knfTwpiP4/Vw7BSS8izcWjEtbTloMfdVYTeGx4P49wLluYu7u6il4jLPKBuanQCIVV+nc854=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4875
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



On 17-12-2025 05:25, Matthew Brost wrote:
> On Thu, Dec 11, 2025 at 05:59:06PM +0100, Thomas Hellström wrote:
>> With multi-device we are much more likely to have multiple
>> drm-gpusvm ranges pointing to the same struct mm range.
>>
>> To avoid calling into drm_pagemap_populate_mm(), which is always
>> very costly, introduce a much less costly drm_gpusvm function,
>> drm_gpusvm_scan_mm() to scan the current migration state.
>> The device fault-handler and prefetcher can use this function to
>> determine whether migration is really necessary.
>>
>> There are a couple of performance improvements that can be done
>> for this function if it turns out to be too costly. Those are
>> documented in the code.
>>
>> v3:
>> - New patch.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> We talked offline Himal, Thomas, and myself all agree this patch is good
> as is. I looked through the logic and everything looks correct to me.
> 
> With that:
> Reviewed-by; Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> 
>> ---
>>   drivers/gpu/drm/drm_gpusvm.c | 121 +++++++++++++++++++++++++++++++++++
>>   include/drm/drm_gpusvm.h     |  29 +++++++++
>>   2 files changed, 150 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
>> index 4c7474a331bc..aa9a0b60e727 100644
>> --- a/drivers/gpu/drm/drm_gpusvm.c
>> +++ b/drivers/gpu/drm/drm_gpusvm.c
>> @@ -743,6 +743,127 @@ static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
>>   	return err ? false : true;
>>   }
>>   
>> +/**
>> + * drm_gpusvm_scan_mm() - Check the migration state of a drm_gpusvm_range
>> + * @range: Pointer to the struct drm_gpusvm_range to check.
>> + * @dev_private_owner: The struct dev_private_owner to use to determine
>> + * compatible device-private pages.
>> + * @pagemap: The struct dev_pagemap pointer to use for pagemap-specific
>> + * checks.
>> + *
>> + * Scan the CPU address space corresponding to @range and return the
>> + * current migration state. Note that the result may be invalid as
>> + * soon as the function returns. It's an advisory check.
>> + *
>> + * TODO: Bail early and call hmm_range_fault() for subranges.
>> + *
>> + * Return: See &enum drm_gpusvm_scan_result.
>> + */
>> +enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
>> +					       void *dev_private_owner,
>> +					       const struct dev_pagemap *pagemap)
>> +{
>> +	struct mmu_interval_notifier *notifier = &range->notifier->notifier;
>> +	unsigned long start = drm_gpusvm_range_start(range);
>> +	unsigned long end = drm_gpusvm_range_end(range);
>> +	struct hmm_range hmm_range = {
>> +		.default_flags = 0,
>> +		.notifier = notifier,
>> +		.start = start,
>> +		.end = end,
>> +		.dev_private_owner = dev_private_owner,
>> +	};
>> +	unsigned long timeout =
>> +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
>> +	enum drm_gpusvm_scan_result state = DRM_GPUSVM_SCAN_UNPOPULATED, new_state;
>> +	unsigned long *pfns;
>> +	unsigned long npages = npages_in_range(start, end);
>> +	const struct dev_pagemap *other = NULL;
>> +	int err, i;
>> +
>> +	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
>> +	if (!pfns)
>> +		return DRM_GPUSVM_SCAN_UNPOPULATED;
>> +
>> +	hmm_range.hmm_pfns = pfns;
>> +
>> +retry:
>> +	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
>> +	mmap_read_lock(range->gpusvm->mm);
>> +
>> +	while (true) {
>> +		err = hmm_range_fault(&hmm_range);
>> +		if (err == -EBUSY) {
>> +			if (time_after(jiffies, timeout))
>> +				break;
>> +
>> +			hmm_range.notifier_seq =
>> +				mmu_interval_read_begin(notifier);
>> +			continue;
>> +		}
>> +		break;
>> +	}
>> +	mmap_read_unlock(range->gpusvm->mm);
>> +	if (err)
>> +		goto err_free;
>> +
>> +	drm_gpusvm_notifier_lock(range->gpusvm);
>> +	if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
>> +		drm_gpusvm_notifier_unlock(range->gpusvm);
>> +		goto retry;
>> +	}
>> +
>> +	for (i = 0; i < npages;) {
>> +		struct page *page;
>> +		const struct dev_pagemap *cur = NULL;
>> +
>> +		if (!(pfns[i] & HMM_PFN_VALID)) {
>> +			state = DRM_GPUSVM_SCAN_UNPOPULATED;
>> +			goto err_free;
>> +		}
>> +
>> +		page = hmm_pfn_to_page(pfns[i]);
>> +		if (is_device_private_page(page) ||
>> +		    is_device_coherent_page(page))
>> +			cur = page_pgmap(page);
>> +
>> +		if (cur == pagemap) {
>> +			new_state = DRM_GPUSVM_SCAN_EQUAL;
>> +		} else if (cur && (cur == other || !other)) {
>> +			new_state = DRM_GPUSVM_SCAN_OTHER;
>> +			other = cur;
>> +		} else if (cur) {
>> +			new_state = DRM_GPUSVM_SCAN_MIXED_DEVICE;
>> +		} else {
>> +			new_state = DRM_GPUSVM_SCAN_SYSTEM;
>> +		}
>> +
>> +		/*
>> +		 * TODO: Could use an array for state
>> +		 * transitions, and caller might want it
>> +		 * to bail early for some results.
>> +		 */
>> +		if (state == DRM_GPUSVM_SCAN_UNPOPULATED) {
>> +			state = new_state;
>> +		} else if (state != new_state) {
>> +			if (new_state == DRM_GPUSVM_SCAN_SYSTEM ||
>> +			    state == DRM_GPUSVM_SCAN_SYSTEM)
>> +				state = DRM_GPUSVM_SCAN_MIXED;
>> +			else if (state != DRM_GPUSVM_SCAN_MIXED)
>> +				state = DRM_GPUSVM_SCAN_MIXED_DEVICE;
>> +		}
>> +
>> +		i += 1ul << drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
>> +	}
>> +
>> +err_free:
>> +	drm_gpusvm_notifier_unlock(range->gpusvm);
>> +
>> +	kvfree(pfns);
>> +	return state;
>> +}
>> +EXPORT_SYMBOL(drm_gpusvm_scan_mm);
>> +
>>   /**
>>    * drm_gpusvm_range_chunk_size() - Determine chunk size for GPU SVM range
>>    * @gpusvm: Pointer to the GPU SVM structure
>> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
>> index 632e100e6efb..2578ac92a8d4 100644
>> --- a/include/drm/drm_gpusvm.h
>> +++ b/include/drm/drm_gpusvm.h
>> @@ -328,6 +328,35 @@ void drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
>>   			   struct drm_gpusvm_pages *svm_pages,
>>   			   unsigned long npages);
>>   
>> +/**
>> + * enum drm_gpusvm_scan_result - Scan result from the drm_gpusvm_scan_mm() function.
>> + * @DRM_GPUSVM_SCAN_UNPOPULATED: At least one page was not present or inaccessible.
>> + * @DRM_GPUSVM_SCAN_EQUAL: All pages belong to the struct dev_pagemap indicated as
>> + * the @pagemap argument to the drm_gpusvm_scan_mm() function.
>> + * @DRM_GPUSVM_SCAN_OTHER: All pages belong to exactly one dev_pagemap, which is
>> + * *NOT* the @pagemap argument to the drm_gpusvm_scan_mm(). All pages belong to
>> + * the same device private owner.
>> + * @DRM_GPUSVM_SCAN_SYSTEM: All pages are present and system pages.
>> + * @DRM_GPUSVM_SCAN_MIXED_DEVICE: All pages are device pages and belong to at least
>> + * two different struct dev_pagemaps. All pages belong to the same device private
>> + * owner.
>> + * @DRM_GPUSVM_SCAN_MIXED: Pages are present and are a mix of system pages
>> + * and device-private pages. All device-private pages belong to the same device
>> + * private owner.
>> + */
>> +enum drm_gpusvm_scan_result {
>> +	DRM_GPUSVM_SCAN_UNPOPULATED,
>> +	DRM_GPUSVM_SCAN_EQUAL,
>> +	DRM_GPUSVM_SCAN_OTHER,
>> +	DRM_GPUSVM_SCAN_SYSTEM,
>> +	DRM_GPUSVM_SCAN_MIXED_DEVICE,
>> +	DRM_GPUSVM_SCAN_MIXED,
>> +};
>> +
>> +enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
>> +					       void *dev_private_owner,
>> +					       const struct dev_pagemap *pagemap);
>> +
>>   #ifdef CONFIG_LOCKDEP
>>   /**
>>    * drm_gpusvm_driver_set_lock() - Set the lock protecting accesses to GPU SVM
>> -- 
>> 2.51.1
>>

