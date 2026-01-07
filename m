Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9118D001EC
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 22:16:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E839F10E5EF;
	Wed,  7 Jan 2026 21:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bKGvqmeL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C5710E115;
 Wed,  7 Jan 2026 21:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767820558; x=1799356558;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=v7DJlACh5AHpiIf9XTQ2fT3y1iIsfLCtEOAynXr6184=;
 b=bKGvqmeL/Co3IZqS/UjVKsqtl8b24SZJMFq8y2+DiOfB8FVvHpdtuOBV
 XQq6LLtSXYBDjZYPIk1HmpbYre/+sqaRZt9iSWPDnw1ZSW7G006FtJO1E
 DXnN3StemFBiXqLTJi7RWK3PDDBOMmARA8XIAkk6WTf7SvyPKOBt9/9KT
 w7YU9GjGkQL1ZfM+ygegnxrNoX+7IpYAqwME4s8Wg4FNctoBk8Tni5jOT
 /4t7+EmIhbb3VtNAQzQc8BmVUFNrpi7REWuMNGI8cLw/tDqsHB1mCfQap
 lbYfxl6kFN9iRKLVYCBEP6Cfd0/1dyJuNwF74Pv2tmC1se+mDfvaIdaqw w==;
X-CSE-ConnectionGUID: gOGp13RJRaii4aFs52xXtQ==
X-CSE-MsgGUID: RGDzdgSXR92bwihRnJ8UTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="86785697"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="86785697"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 13:15:57 -0800
X-CSE-ConnectionGUID: lWR57thTTTiXhE6R2693jA==
X-CSE-MsgGUID: HaBjC9gZTw+c5oigYPxrPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="234174081"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 13:15:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 13:15:56 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 13:15:56 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 13:15:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6Y8qRDfVAyGSJJ+laFmT5yHB8T8/nj1+OY62qZ5QJEXeG5em7BMt+1sJLhR39Os7DUwx0iLoF+PPYm03Y3b1WaxefcX/kl0PriJbh2BCwJQpte3KSI/6fXnRA6KdTeHFNzsqrcsDMBPIB4Th3Ohc4kq77CL6UjRZNHlOg3QDI90AHTK+9QPNfzFsG6uTUhOJ9zXR5R5EqmVF5iN7y9RvP9oGETVVQmdezyECc7F+NTxxzXeZnbCqs021iM36cfwNIpS2tLqTa9TDhrgDeCI5Tl7WgIoYNCdC++ykeDVXnn2CncPZBpEVikOsOrSGq9cqA1mgGJaILLaEgVTXtZ7kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQa3zA/Z9OlqFznFWSPW56HYj7wZekHjTEp9VHyhH4o=;
 b=Jw3bbLWavXZaE1UQN84drWjcZIzd5N5j+3ulTDQpanFW102oGSWeUfUmdfNJWtMVDm38Gr8jQrcVz5m0wdBfvdDIchFiWxlrDqEKo6LEUSSCcaMJP0yQhv6EzJVuSar3JRIyFuEqfJSEtTE0IhjOVcgTpcIXaIRwam0PDbbYCIJJMEq/kc+S6tXPfy8q5KDkpFCsGohM672w3at9ViUxKIczXDGPn3FFxxaB5rXatu7J+0i99sbjJ/n2lGD3yS7NAD+wT/d7FT5Bxf7HA1dcJwL765VOF4ZGMQS5N565YRdUVzT3N5gzIpVUnUztfLKFH7Sys8LUh6hSlPOYo1yKxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7211.namprd11.prod.outlook.com (2603:10b6:208:43f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 21:15:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Wed, 7 Jan 2026
 21:15:50 +0000
Date: Wed, 7 Jan 2026 13:15:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Zi Yan <ziy@nvidia.com>
CC: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, Balbir Singh <balbirs@nvidia.com>,
 <linux-mm@kvack.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Matthew Wilcox
 <willy@infradead.org>
Subject: Re: [PATCH 1/4] mm/migrate: Add migrate_device_split_page
Message-ID: <aV7NBE3NS1wdsXBo@lstrano-desk.jf.intel.com>
References: <20251216201206.1660899-1-francois.dugast@intel.com>
 <20251216201206.1660899-2-francois.dugast@intel.com>
 <F4EAA470-C922-4066-A115-13D6D055C73A@nvidia.com>
 <95BD5D5B-C8EB-4EFA-A895-CFD660504485@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95BD5D5B-C8EB-4EFA-A895-CFD660504485@nvidia.com>
X-ClientProxiedBy: SJ0PR03CA0060.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7211:EE_
X-MS-Office365-Filtering-Correlation-Id: efae8e66-67cc-4a8e-af49-08de4e31ef10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEx0UHYzdkFtRVJUdHEvdTk4T2lueHJ0TzE3dHVxWFJKNUdwVldFUVppRGFP?=
 =?utf-8?B?eTl2OTk0RndmTkxVK2tLdVlEUlk3SGxjUDRMSDNCVlNhdTd4aGM5dFdUMk9B?=
 =?utf-8?B?K3JWTDcvMldFS3BJQnVSZmNmZ0RxelY5UnJxbUpDeUF6eG1WQlhqOVhCbFVp?=
 =?utf-8?B?TldhdkxqNWZRaDBxamdyOXdTQWlmdXk3MFJWV0ZlWjdFUXFNK290aWVvMGFS?=
 =?utf-8?B?ei84THVrRlVTRTRQR3IxZmVIQnhvRi9Sc3JNVEhjZ2Z4UDZLQzUrbGgvZ3ZL?=
 =?utf-8?B?a2FjdEFBL2FzS2FzVEUzYS9sSHhJVmJIek5USEo3YklDQlZxVGZSWm1DL2V6?=
 =?utf-8?B?RDEwQ21PNHFsdzJ1UDAyeW51cVEwY054azZNdVFJRHZLWjZWNUpGOEJ3SDRt?=
 =?utf-8?B?clBpYnNXRS9YeWhhV0kyek9IaExBdzJuTDczZTJsRG5CUEhkWThoaTBwUXRi?=
 =?utf-8?B?c0tkSzhDa2FMQVpJb09Na2NTS3IxK3VvYTlKbHZXTi95QXF6QnNqZU02MXA1?=
 =?utf-8?B?bmYwcWtjc0JTcXVhRk1KMld2N1lLS0pvNXNNZk9SdTk2ZTg1dG55dGlEbkhB?=
 =?utf-8?B?RmJoa1UyVDFOSnJOVjFVWnJEdUFuL2NnV2V1ZUsxMU1nLzRwYk9xeUlvV2Ux?=
 =?utf-8?B?S1czNVNObGRvRkFZWW5SaVYrUjhOVnlSWHpMQ0xkdHJwZkFhcit5Uy9oKzZl?=
 =?utf-8?B?eFN2WUYrWmZpM0Nmd21NY3BWQW1jaUtsTkZvc1M4MVpyOVFydlhZbGRVVFdu?=
 =?utf-8?B?dSt1eHF6ajR2dFRtZ2xBSEFqY1Z2MDlwTllPMjhQTEVSa3ZXVnJsSUlNRW13?=
 =?utf-8?B?U095YzhiZktqbXZ4WWw3MDVmWjcyQVBmMnJRU1pVclRLSUNjWUdCUTI1Rm8x?=
 =?utf-8?B?SnF2TjVRNDc2VTdrbXRGSlhIYVJkUUFiL2gxMkdQdTd3WGdHOEQ2WUVCK3Iv?=
 =?utf-8?B?V1pweUJJVE1oa2VXOVlJN2hwdjlnVS9ySFo3cmlNbTRyUlRTZFFWUlBkSWpv?=
 =?utf-8?B?RUwvWS95dlZEZG1sRjRwK29iRHEySVVaeHZtRWlOdmpVdE1KWDk4Y3hCMVFD?=
 =?utf-8?B?NDMvcUl1M0VkSjgwai9Cb3JNSjNwWWNuMFVnbjNXQnpHWkZiMCtMYU5UOThr?=
 =?utf-8?B?V0dXTEdWWDdBL1pEM01jcHJ2Y3NYZmNCMzNzdmR2RWFNSnJCVW5VcDhXR3c4?=
 =?utf-8?B?YklPM3VpVWdEWTRyVXdlRlIxYWxUaExDR1pzUjVGUUpsVmxDZVU4aVVOSjZp?=
 =?utf-8?B?QXJxU2NXY0orVEFnUy9XYmNBcEtaaldodWxEc0VIbVhDWG5XN2JnajVBdHE2?=
 =?utf-8?B?VDFyaUdSa2xTTnZ3WTY4YUFYR0htbGcvRHlvaGpDSmh0NkIrWDdhd2QzSzRn?=
 =?utf-8?B?Sm5hOUs0UUwyN1l1OVEwelVOMGNHL1hKdnRoMjhlWnFFUUhQR3luRmczemJl?=
 =?utf-8?B?c2JHdXlJbzJtNUpjVlBmbkpwNVVWSlNKMEg4UlJOUGo3aHlNbmhDMXo2dkgw?=
 =?utf-8?B?c0xENFVnZlN6b0ZpcDdTRklVU3MrNVhNaU0rNnc4ZmtLTFgvaGxqZSs0UFFt?=
 =?utf-8?B?Q3h4WitVZUZrM3FpaGhqejBjRytzZ0p6aExrajJnTDR2aWpKOHNGTFRxVVFW?=
 =?utf-8?B?bE0wTUsvMmxiL0NoMURxbDRicnRpQWNreTQrR1F0SXRTNVNPWksxbGlQVEQx?=
 =?utf-8?B?dUFSNXRtUjBrV29maFF2MVFsQUVQanlzWFFyTzYzVjJuMzh2SFg0a3dod1Zj?=
 =?utf-8?B?QWJYN0pvdTlBdzlob3pnUkFhYnJVZkZiR1AraURXRU1EY0o3a005VDJaMEo0?=
 =?utf-8?B?by9DOHRQRklnaEdHYWptSFpWSysyUFVuMWs4SklFMDZyL2RkVVY4ZDFUZEFR?=
 =?utf-8?B?T1JlTEJjaEZQZ2lnVy9UMjJWUlluRGdndjV4WldLZEFzRDVGWGNyRjdCanF0?=
 =?utf-8?Q?+NnUeSTWohFSpIBQ4+rzrD/rQv+sYe0Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHUrNld3cVpZTTl2RFoyNlFLdElwZ3ZlbW94MUtldGhBa3FaYWNheEdyKy82?=
 =?utf-8?B?NlFYa2RrVWhkWWVlQ1VaVGp2QnFTTlEzcGs5V1FLd3Y0aExQbit2Smk5L25p?=
 =?utf-8?B?SzVnMGI2VGIwTGNYZTJuWE9LRkJoZFdTUkVMTm05V3pIOFEzR3RDMmxNUGlF?=
 =?utf-8?B?b21DYUluaytnRUM1WnBMOHNXSFhYWXQyZDdTRU1Md3A4c3lPSXllc2tkQVZ5?=
 =?utf-8?B?T2hSSzdhSS9KOVQzd2ZMNE5UTHBqeFRDNS9ENEVLd294NVNYbjhTdXhLcDlU?=
 =?utf-8?B?eDZOWVNhVUNWSHRyWkJWc1VvR25xRzVzZFp1ZWdFY050U2VTNmpVUUJxaWtP?=
 =?utf-8?B?YjdHdDZualVEdHBLMWpudHU0clpuNTUzR2FMNHoxMFlmVldUYm13VGdINEcx?=
 =?utf-8?B?TVVRVWRwMnU5NFhmcnlZSDVkNzRKWXg2S29obGVUZ3JpWFNVUnEyNFhmVGZR?=
 =?utf-8?B?SDA2WmlFTnRCR3F6dEVuM2xvWGl2aHJucUJaNGxOc09CNjFzUTlTczU5dWlm?=
 =?utf-8?B?RmJvaWlReDdoTGxxK3JYbUYzN2lBV0ZrNVh5Q3k1TjAwUnhTYUxzK2QzU29M?=
 =?utf-8?B?NFhQa3h2ODJCcEE2SmtTNXNEOHo4cVhhRGk4UTgwR1FHOHlHdFhZTmZGdU1Q?=
 =?utf-8?B?V2JVdURxcTVkb2Z5eWpUKzl4VXNqdStQRTJVOW1FQ2Zsd05kZ0RkVVJ0UmRl?=
 =?utf-8?B?NVgzcnU4andQdFgxZCtCSjlzZ2QycnE0bXlORld6SlZZT3ppR2ZtK2V3NVIv?=
 =?utf-8?B?L3M5Zk1tWk54bkJOOUp4SkYzYzBLblF4YTRTNjBLbUlMZ3JqOGhGNWl0RW85?=
 =?utf-8?B?RjRJcEJHOW40T3B4NUZtclFaOEEwQnRJaUdGQnNKQ3J1aTNpK09hUGdiSEI1?=
 =?utf-8?B?aFA0eSsreVB3Nk5EQUpXNmJKcmt6aE4yZldkK0wxdGJkaGNlS1Yvd29Ld1lO?=
 =?utf-8?B?OWdWYktSUVNpdlZncUpxdXdaL2hWOUprVEc3dzJObkE0clcyZGJpZ1hOZzB2?=
 =?utf-8?B?NW5XK2FLWFhOSlFLaUliM2FDM3JJbHY5VzB2b3c5TVB0K01FMTNtTWMyK3E3?=
 =?utf-8?B?S1hkRHNTUU0zbkg0VEhld2xJWlJIZ29HeENVN2FFdTNDbFhIditoMEwvVC9C?=
 =?utf-8?B?K0xOdUZMVnpVNVNnMTFYSFM4WVd1RlNkQmx0ZTZsU29nV1hlTXlmUk9XNjUw?=
 =?utf-8?B?UGVlNEo4OVEvaVkyTHZpUWhVc08rdks0bjhoUVNIR3JrNmU3bnRzNVFJZDVP?=
 =?utf-8?B?ZFBidHRtcG1Ialc0elNRcndhTVRubHNwK1ZOaFRITXkwTW1PU0ZFTDd4MGdt?=
 =?utf-8?B?NFdkUUZOb3Vxa01sK1ZuN2dDc0FZTGMxaGVFZ1RXTk94WXJrYlJpZFk1WS9O?=
 =?utf-8?B?QmtzVDJBVnVpSVFJNjErNmhKdXFNcDZBYXpMa2JTTzdlMWJZT002S20zdmh0?=
 =?utf-8?B?SGFTMzZsc2MwWjVLVjNYKzJYVi9HZ1ZYRFZwTElkbWJNdkhMK2VWamgwZU4x?=
 =?utf-8?B?UTdRSjR5dGd1L1RVbGMvbmZZVFAwQUxaaVJoOWtEb1ZCUUlMMjZCQ0FCRmM5?=
 =?utf-8?B?b0haSkM2Q2d1Z3FqSDR3MDVtOE1LT0t1VDRmamNHZlhRdzNoWlNoUThxNEZW?=
 =?utf-8?B?Y3ZqSU5URU5kSCtMMXkvayt6VEtVWlJYRUUvRFNkVU1YbVZyZDI3S1V3aFJz?=
 =?utf-8?B?aFAwVlExaW0vUkdaWEdTcStGN2ErU0M1STgwcmJrakhUZFQ3bVJvM202eHVu?=
 =?utf-8?B?UDR4MHZGR1pLeURFR2trYWFJMXdWelkvY20vbmdOWUlLc1lLZkR2bEFCTTMv?=
 =?utf-8?B?UVV4aVMrWlVzRDlVOVVWbk9FTTJTelh5Tmh4cHgxL2g4c1JGOXcrdXZMMVVW?=
 =?utf-8?B?OW9wbllRcEdjYnNzN2hXcHI2cGNBcktCWmxjMVVnRTRKSFBNM09oaVB4TUFr?=
 =?utf-8?B?Sms4LzFRMkpYcU1WVU9wZFlSTFViaExsbmJocDJGQWRiMDg3OVNsRXF0bTh4?=
 =?utf-8?B?VW9XNElzWWYyNUVKVHRBQzROckU2dGpxRmt4WjVlVHRWa1BHNWtNVDQwd2pQ?=
 =?utf-8?B?WlVpbndMejIyZjVCNEZnQ2hzODA0WnpsWmExN0QxcUlremR4aXgzT0pwbXdH?=
 =?utf-8?B?S2Z5SDBHVC9CSVdTMUV2eEI5SHluZHliQ29uWEpveHlydU80TW1LRXBSdTNE?=
 =?utf-8?B?WmxtQ25EOU1sakJZTUZUM2pJdW1vNUpwWDQ0aWJqWjdremNRK0xIVC90bmdx?=
 =?utf-8?B?RkdzVEZLeDRwYjlReUtKZjllUnBIWnQ0MGRtWGdrS05Ya1JEenA2Zm5ZNVNq?=
 =?utf-8?B?WXQ4VFl3VFpBOHJhNmRMUWxiYlk1NDNsUnlLeFBuSExsOHhoT0ZhOTg5MW5M?=
 =?utf-8?Q?gIgqPYELZyc7mICc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efae8e66-67cc-4a8e-af49-08de4e31ef10
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 21:15:50.6049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+VLwM3gXSRBij2ypOTpKOEcUSchVx7+HrQQaURR2rjl2teOrUElR47twxvPbGwAY92YsFF6x6JLVIR6gHJAtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7211
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

On Wed, Jan 07, 2026 at 03:38:35PM -0500, Zi Yan wrote:
> On 7 Jan 2026, at 15:20, Zi Yan wrote:
> 
> > +THP folks
> 
> +willy, since he commented in another thread.
> 
> >
> > On 16 Dec 2025, at 15:10, Francois Dugast wrote:
> >
> >> From: Matthew Brost <matthew.brost@intel.com>
> >>
> >> Introduce migrate_device_split_page() to split a device page into
> >> lower-order pages. Used when a folio allocated as higher-order is freed
> >> and later reallocated at a smaller order by the driver memory manager.
> >>
> >> Cc: Andrew Morton <akpm@linux-foundation.org>
> >> Cc: Balbir Singh <balbirs@nvidia.com>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: linux-mm@kvack.org
> >> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> >> ---
> >>  include/linux/huge_mm.h |  3 +++
> >>  include/linux/migrate.h |  1 +
> >>  mm/huge_memory.c        |  6 ++---
> >>  mm/migrate_device.c     | 49 +++++++++++++++++++++++++++++++++++++++++
> >>  4 files changed, 56 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> >> index a4d9f964dfde..6ad8f359bc0d 100644
> >> --- a/include/linux/huge_mm.h
> >> +++ b/include/linux/huge_mm.h
> >> @@ -374,6 +374,9 @@ int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list
> >>  int folio_split_unmapped(struct folio *folio, unsigned int new_order);
> >>  unsigned int min_order_for_split(struct folio *folio);
> >>  int split_folio_to_list(struct folio *folio, struct list_head *list);
> >> +int __split_unmapped_folio(struct folio *folio, int new_order,
> >> +			   struct page *split_at, struct xa_state *xas,
> >> +			   struct address_space *mapping, enum split_type split_type);
> >>  int folio_check_splittable(struct folio *folio, unsigned int new_order,
> >>  			   enum split_type split_type);
> >>  int folio_split(struct folio *folio, unsigned int new_order, struct page *page,
> >> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> >> index 26ca00c325d9..ec65e4fd5f88 100644
> >> --- a/include/linux/migrate.h
> >> +++ b/include/linux/migrate.h
> >> @@ -192,6 +192,7 @@ void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
> >>  			unsigned long npages);
> >>  void migrate_device_finalize(unsigned long *src_pfns,
> >>  			unsigned long *dst_pfns, unsigned long npages);
> >> +int migrate_device_split_page(struct page *page);
> >>
> >>  #endif /* CONFIG_MIGRATION */
> >>
> >> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> >> index 40cf59301c21..7ded35a3ecec 100644
> >> --- a/mm/huge_memory.c
> >> +++ b/mm/huge_memory.c
> >> @@ -3621,9 +3621,9 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
> >>   * Return: 0 - successful, <0 - failed (if -ENOMEM is returned, @folio might be
> >>   * split but not to @new_order, the caller needs to check)
> >>   */
> >> -static int __split_unmapped_folio(struct folio *folio, int new_order,
> >> -		struct page *split_at, struct xa_state *xas,
> >> -		struct address_space *mapping, enum split_type split_type)
> >> +int __split_unmapped_folio(struct folio *folio, int new_order,
> >> +			   struct page *split_at, struct xa_state *xas,
> >> +			   struct address_space *mapping, enum split_type split_type)
> >>  {
> >>  	const bool is_anon = folio_test_anon(folio);
> >>  	int old_order = folio_order(folio);
> >> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> >> index 23379663b1e1..eb0f0e938947 100644
> >> --- a/mm/migrate_device.c
> >> +++ b/mm/migrate_device.c
> >> @@ -775,6 +775,49 @@ int migrate_vma_setup(struct migrate_vma *args)
> >>  EXPORT_SYMBOL(migrate_vma_setup);
> >>
> >>  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> >> +/**
> >> + * migrate_device_split_page() - Split device page
> >> + * @page: Device page to split
> >> + *
> >> + * Splits a device page into smaller pages. Typically called when reallocating a
> >> + * folio to a smaller size. Inherently racy—only safe if the caller ensures
> >> + * mutual exclusion within the page's folio (i.e., no other threads are using
> >> + * pages within the folio). Expected to be called a free device page and
> >> + * restores all split out pages to a free state.
> >> + */
> 
> Do you mind explaining why __split_unmapped_folio() is needed for a free device
> page? A free page is not supposed to be a large folio, at least from a core
> MM point of view. __split_unmapped_folio() is intended to work on large folios
> (or compound pages), even if the input folio has refcount == 0 (because it is
> frozen).
> 

Well, then maybe this is a bug in core MM where the freed page is still
a THP. Let me explain the scenario and why this is needed from my POV.

Our VRAM allocator in Xe (and several other DRM drivers) is DRM buddy.
This is a shared pool between traditional DRM GEMs (buffer objects) and
SVM allocations (pages). It doesn’t have any view of the page backing—it
basically just hands back a pointer to VRAM space that we allocate from.
From that, if it’s an SVM allocation, we can derive the device pages.

What I see happening is: a 2M buddy allocation occurs, we make the
backing device pages a large folio, and sometime later the folio
refcount goes to zero and we free the buddy allocation. Later, the buddy
allocation is reused for a smaller allocation (e.g., 4K or 64K), but the
backing pages are still a large folio. Here is where we need to split
the folio into 4K pages so we can properly migrate the pages via the
migrate_vma_* calls. Also note: if you call zone_device_page_init with
an order of zero on a large device folio, that also blows up.

Open to other ideas here for how to handle this scenario.

> >> +int migrate_device_split_page(struct page *page)
> >> +{
> >> +	struct folio *folio = page_folio(page);
> >> +	struct dev_pagemap *pgmap = folio->pgmap;
> >> +	struct page *unlock_page = folio_page(folio, 0);
> >> +	unsigned int order = folio_order(folio), i;
> >> +	int ret = 0;
> >> +
> >> +	VM_BUG_ON_FOLIO(!order, folio);
> >> +	VM_BUG_ON_FOLIO(!folio_is_device_private(folio), folio);
> >> +	VM_BUG_ON_FOLIO(folio_ref_count(folio), folio);
> 
> Please use VM_WARN_ON_FOLIO() instead to catch errors. There is no need to crash
> the kernel
> 

Sure.

> >> +
> >> +	folio_lock(folio);
> >> +
> >> +	ret = __split_unmapped_folio(folio, 0, page, NULL, NULL, SPLIT_TYPE_UNIFORM);
> >> +	if (ret) {
> >> +	       /*
> >> +		* We can't fail here unless the caller doesn't know what they
> >> +		* are doing.
> >> +		*/
> >> +		VM_BUG_ON_FOLIO(ret, folio);
> 
> Same here.
> 

Will do.

Matt

> >> +
> >> +		return ret;
> >> +	}
> >> +
> >> +	for (i = 0; i < 0x1 << order; ++i, ++unlock_page) {
> >> +		page_folio(unlock_page)->pgmap = pgmap;
> >> +		folio_unlock(page_folio(unlock_page));
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  /**
> >>   * migrate_vma_insert_huge_pmd_page: Insert a huge folio into @migrate->vma->vm_mm
> >>   * at @addr. folio is already allocated as a part of the migration process with
> >> @@ -927,6 +970,11 @@ static int migrate_vma_split_unmapped_folio(struct migrate_vma *migrate,
> >>  	return ret;
> >>  }
> >>  #else /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
> >> +int migrate_device_split_page(struct page *page)
> >> +{
> >> +	return 0;
> >> +}
> >> +
> >>  static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
> >>  					 unsigned long addr,
> >>  					 struct page *page,
> >> @@ -943,6 +991,7 @@ static int migrate_vma_split_unmapped_folio(struct migrate_vma *migrate,
> >>  	return 0;
> >>  }
> >>  #endif
> >> +EXPORT_SYMBOL(migrate_device_split_page);
> >>
> >>  static unsigned long migrate_vma_nr_pages(unsigned long *src)
> >>  {
> >> -- 
> >> 2.43.0
> >
> >
> > Best Regards,
> > Yan, Zi
> 
> 
> Best Regards,
> Yan, Zi
