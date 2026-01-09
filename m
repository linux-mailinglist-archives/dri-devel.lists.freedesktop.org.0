Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BCCD0C02B
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 20:08:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EE710E919;
	Fri,  9 Jan 2026 19:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RYFKyVyS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE6C10E919;
 Fri,  9 Jan 2026 19:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767985696; x=1799521696;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HABvYQPzGOyEHPdCwOCfxFHkIQlTYPwMNXzOKQQGUwk=;
 b=RYFKyVyS62cFw7kyiIC7J+tvaPIMLjYLgL7WA192LpTBORJpv+lhNt1f
 XlurN8jUYC5C6n8F2fA+dMz/+ndUCbLhQDcTzh5uyEXfWwVOqtJTfXQg3
 1qMJ7ZVxQVicIBp0M6PbBzB3CTF3q7oGLwOR+NWVCxsHjELpx/jczBCYl
 leMBpNU3FSmnJP0vJcPgsph43w0uFo+VZukMhEUTWFurTRi1eC3kfJlUR
 gr11KXaRcLEQXwjOUG+GMGlKGx95jFLj3RHAG8l5YkodBdlw45qaYFP3Q
 Y9ENckvgR1obB9l/80Uvr8Ug3g99tRQJtzE+szoyl13NT1PxpI6zXyLg5 Q==;
X-CSE-ConnectionGUID: uqeiUpHMQ3OqftQEzi/xdQ==
X-CSE-MsgGUID: SvI3Tt8GSRieQG02eF+FSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69271350"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="69271350"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 11:08:15 -0800
X-CSE-ConnectionGUID: 8tCrfkHLTkyIBmiMyNCunA==
X-CSE-MsgGUID: WU/pzeJdQBSNxvglBFHs6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="203160809"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 11:08:15 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 11:08:14 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 11:08:14 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 11:08:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXQRWv7Zqf0Nc/mktjCEcchHqjUFZTMcKRJh4CGFdHnQ6Z+XimLV5rb2p4kdfKf3TkVFgQgl+Occnj3hI12tyy9gA5oiVFWfkrDf0v5xZwqDTTbH0VUqwXrcGGpPDYfFxPeQVFcysnAG6wQpgUVV85aRiy3aV6JDw1cw6x1XhqasdiKNShxhn8IZtklU6sY3ouP3zuQWXUYNNMah0Dgm0mCwxCXgozFdHDGLOwQZjsi/3rkGutx+rJlNTV4g2kIwfy8UocWcL/vnWfDHd4e1GrJlDZOPvZeUkTuzERswrPWxpBzT0XLz/ARRS2PPgySnE65hwQ8H0ILIyh/i5YMicg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYy4nKsSmWBB4XP7xi/2jbNRQ/3UaiJspMf5VqmcoXc=;
 b=HfaBqvJ2VwPL/4Cf27a0td4WWD9ZQ4xBu+B11F9bVFiZ9KTrzfBgyxJsUsFE9DLH24Bh2rFxnL7mLgsMBRSvUxzOHzX0MgjMd1+kp38WnK53MRgdh65T+rw47OU6+ETe/NwI+/n8balC6PfnXw8vKksSdLu/LT9TJa69P5NXSSLAPMuykDTPXI1fzazJQGPBLOpm90fV6RrBWEyV3H8DCHcO3zt0PXl2cyAuQB6/F2WvbI/eHZAm/blYNyKqnEK5vljKzRnimffy7sX1Moy9eBi51Ol5VXM/K3r4X4qFmH37EoTtn08biCQQL2nff10jwSjq/EP4zZCCJuY7w9yjeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9064.namprd11.prod.outlook.com (2603:10b6:208:57f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 19:08:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 9 Jan 2026
 19:08:12 +0000
Date: Fri, 9 Jan 2026 11:08:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Zi Yan <ziy@nvidia.com>
CC: Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>, Francois Dugast
 <francois.dugast@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Balbir Singh <balbirs@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Andrew Morton
 <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
 <linux-cxl@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/7] mm: Split device-private and coherent folios
 before freeing
Message-ID: <aWFSGc7MIUqVsilw@lstrano-desk.jf.intel.com>
References: <20260109085605.443316-1-francois.dugast@intel.com>
 <20260109085605.443316-4-francois.dugast@intel.com>
 <d1d80b81-678d-4d28-9ac2-95cb74824e73@redhat.com>
 <DF5A6B81-7811-4654-855F-8EAB76CCCE51@nvidia.com>
 <aWFIW6XCKXPpIinv@lstrano-desk.jf.intel.com>
 <D9ED5F01-E758-4A89-87F2-ABFF5197231D@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D9ED5F01-E758-4A89-87F2-ABFF5197231D@nvidia.com>
X-ClientProxiedBy: BY3PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:a03:255::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: c512c716-7017-4e9c-594c-08de4fb26f11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azkvZ3E3WUZ1V1A1M1RTa044Vk1wSENtUGI3cFE5V0RNb1AzUmlXRlpjZ2pq?=
 =?utf-8?B?c2RMMVJuaE9vTXFGRFlMbVhacm1BTjEwc1FkUzV1dC8yZlp3djYzT0JKb2tv?=
 =?utf-8?B?OE9TY1hEeC8vWFdCVGhDeUY0dEQ1ZkdLZFh6NTZndUFma2tDei9mT0E2N25v?=
 =?utf-8?B?bjJwcEtiUytMalhQcnArQTFIVk04alNFSGtLZHc5ZElnaXZwdTE3eGtDeG93?=
 =?utf-8?B?dE03WXJsYmpEY09WRXlnYnhOZ0U4QmlkV1JFTXFiRHEyWjdndzU4R3RHUG9l?=
 =?utf-8?B?VUlCZkNlbzBtQ2RJNGtYOE5HY2MrOHRBM0N2OVQrODNuRGQ5d2R0OTJ0bTVJ?=
 =?utf-8?B?T3M2alY3aHZYRnBoSkN3VnZQc3hBRW5WK0JKK1hrVHlLQlRUU0dmbGpNU0FJ?=
 =?utf-8?B?TlJPRmZMMktRdWNnVE1acjFySUtjYStEQlJ3bnl5eWx1bDE1NHFDQlBSMlRu?=
 =?utf-8?B?dVY0WHVXZ1JvZVlIbElIbDNYTWlZOXY4YnAxSExySFh4cDBEMnp4VW5YYTRB?=
 =?utf-8?B?Kzdlc0o0RlpRMDlmMUFQNlQxeDNxS3F3Z1pxVFpMd20zNkEwSGdxblA4eVhQ?=
 =?utf-8?B?NjUwYzIxbFJzNExYWXljMlpISHNuUmhFMmVhS1oxRDdmeU9kL3gzTjR5UFVa?=
 =?utf-8?B?VHpQYTFTa3MxNnlzNFVSNi8rcWJDZFZzNWExRjRSR1V3bVp3YVcrVERWZFVR?=
 =?utf-8?B?NnNjcTRYNTFXT3Via2l1VWN4eDFGWHBOMXdVd3NIeWpyL1ZxZXI2OTl3TmNX?=
 =?utf-8?B?alhQZ0JVYTZCR01xWVEwa3dGbGVGbGd2aWlneE9RdmJuSU9xUjRVSXFKRVVi?=
 =?utf-8?B?OXExTHl6WHo1WDJkTVpVbjNTMFMvZ2VLKy9NQ0JzeXNjVE9GcEJaTE9NRHJw?=
 =?utf-8?B?Mmc0ZzNNVlNlYVlVWUlwZzZrT1RjQWVXME9FY1ZhUzh0ZjdMZHk4WWJPMmM5?=
 =?utf-8?B?REJQT0EybnZGT25McVY0NHJXWkxwVFY5TllYR01aekNZQVNqakU1ejF1SW4r?=
 =?utf-8?B?NGpoeUlQd0V0cVVLOFE2ekRJK2RSSHhjUnlVWlFqeVJHU2lPN1lhNHFHdk9w?=
 =?utf-8?B?cTZUZFRoVDVrejJ4T3NPQU1UZ1F3aTlzYjdQeWZJRTZsVGlZNTV2M3Vpc3lu?=
 =?utf-8?B?ZW40YlVvY1BwWkdBbllGdS9SRy9IZlBRWmdSNVozeTA4M0lSNzluT1hUWlJN?=
 =?utf-8?B?TUJHWUFtTk9kQ1dVTjlLYWwzYjJSdWsza1p6aXNtQW1tQkRzRlZxN2ZsVVVP?=
 =?utf-8?B?YWNubTVOQVpPZmljZ08wKzdvK3JPWmVHM000YXlIWkJlMSs4S3hjQmdEcVk2?=
 =?utf-8?B?UFN1M21GNUJsQ0RlL29WVUd0bllTd3ZxNFhXb3dtTTNCRWl3SHFwK0lMU2Fj?=
 =?utf-8?B?eEpzeURGWE9oeHZiUndZV3hIN1h3Q1JGMlRibWhsSU0rWjEvZTRUNU9GRkE3?=
 =?utf-8?B?QnZ3TkdoWllNTmp0MEpKS0pWcDBjZERUMU9OTVFZV3JCYlJIczlQb1UvT3pq?=
 =?utf-8?B?TTBKbjl5VCsvQjBJbHJEL3VMZm5OTm5kT0l5M09HbFpKNjh2NldsOGNHVURX?=
 =?utf-8?B?REhkdi9NMWxnY2NJM05jdjVrYXBXQkYzQmtMWG9QV3oxVUdaM2h0a0lTaUxt?=
 =?utf-8?B?NDJmU0IzTlk0MDFMczFLRmhjU213UjRCS1UrTUtiQTN2WFdncTRETDd0TjZu?=
 =?utf-8?B?YjVhaDNWYUJwMGttQmtMVWRhTXNSY3IvRWhsWTdLVTc3eXJWTnBjVkhaNDlJ?=
 =?utf-8?B?d0o4RGp2bkpTMENoODJXTjdKMnkvamMrbXFiaUd0b1RwVFp4YlJmamxaLzVz?=
 =?utf-8?B?eW5rTEY1OHFoai8zaVU0eGtBU0IyMWtUSnJTR0c1TzBQUFpHSnZCRGxYVTBY?=
 =?utf-8?B?R28vWmJ3MXpUTnc0dVpKZ0lJVnF0OGZVbVZtTjMzSHBhUTh3VTZSbGdwdFVn?=
 =?utf-8?Q?IoE6diC4E188hnP2P6mfcbjHPrbh+ffB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGhCZmp2QXhLN0hrbVpaMnFYRk1LWTdSMXB2RDQ3ZlNLYWE3Ky9TUUgzRGVW?=
 =?utf-8?B?WVp3eUZiV0FVWU1xVlVOeEpkOFkwSTFTUno0TFVCUHNLTHhwcVovZlBtU2dS?=
 =?utf-8?B?U0MrMFhndTZnTzZxV3U1RVJyTVRVSTR1MWJUU0ZhblFNRmQwYWhJaU1ZQUp6?=
 =?utf-8?B?VW90L3poWnJDdGJuYXpicVZCZm5pL2xvdWx5ODd4dnJiakU2b0RxNVhVaDFk?=
 =?utf-8?B?S2ZuZE91WnI1V2FNSno1c2JUSGMxRFFEWFlrbUFBZm40Z3kyTUpaLzY0VTZF?=
 =?utf-8?B?WGxodXJ6YjlnV3MzcklJTjhNUFhacXlZbHZJaHZhSkVvVm83TmhuTDJ1RExl?=
 =?utf-8?B?cHQxalhkK09Ga0thVzQ1bXIzKzhsQ2I2WlJQcVJUcmhhUHAvb0NZWEw4UUF5?=
 =?utf-8?B?cWd3MFdmSUo2YS9YNWVEbEthMk5UM3orb254VlNvSEZaNHJrQnpINUhFK0ox?=
 =?utf-8?B?WEIvZGIyMVVhd012cHFLZ0lJc3ROVFlQUXFpQm5YLzFhdXRpUXBYWVRxZ2Ju?=
 =?utf-8?B?bVJnV0tMUk9reGhEM3VqSWU4UlFHRnROK2MveHBkcXBtNk14bllGdjg3VFpK?=
 =?utf-8?B?cHJkanFyaU1oOWEyVkttWS94eGpDZ0tma25CVXpTb3F6ODNzbUUwMGg4WUFw?=
 =?utf-8?B?dHdzMFpTQUpMOEtNaEpRa3pONW1DSm9UeEppRnQzT3lYczNHWkRBOUFRcWZH?=
 =?utf-8?B?eEY4MmJtNEc4djhjVC9YRzVrMDlKTkMybHJnV3hDa0RkTkNDZlVxaHhDM05H?=
 =?utf-8?B?WmtLL2R1RFVvQ0Z5OTRacmtGVVplOXNDN2pPVG5xU0EvZUJBK0NjbTFqaGhC?=
 =?utf-8?B?NHM4MmN4WWVMUTFKbmdldmNyR3BZRHFRV3NReFlMTlF0V2VEY3FGbkZNbzZN?=
 =?utf-8?B?Nlk0TWNhb0RxdXJSNE9SajRIeXBqdkpOVTNONHJZbUFKaTZQT2wvZ3JuUW5p?=
 =?utf-8?B?MFFLMlF4NEY3TmJUdm1lNWtDelFsQVpITGVUSnhJVldpTnVIaVh0eHZESU5S?=
 =?utf-8?B?cnU2RURvVERsYWRLaVN1S1AwQ2cyWnYxRTkrY1E4Sk1teCt2aEY5SVc5NnF1?=
 =?utf-8?B?MDZrV21KN2RseE1TVHNsMWFSRjF0cjdtUUZOaitNMXpmbHdQb1Fkd210L0hP?=
 =?utf-8?B?d0pqbjNHU0ZtaGVVcDFMajlUR0oxL1Boby9Rb1F1ejZBMW92UE02c09LL3lP?=
 =?utf-8?B?QXdDejlGMXMrdERsU2ZHWGZOdkpzcy9Kc0RHZWRTZ2ZPU2pVNWJWWDJzVUd3?=
 =?utf-8?B?Um5xMjVpSUNMWEdhOVJheG54TnUyaW1KMVdhc2kzc0d1MzNZMVRIN0lTbEt3?=
 =?utf-8?B?Sm5uU0lGd1dqdllib0kzU2lBU1VMb3NFdGs4WUZmaGlGV2xJaTQ5WC9DWTd1?=
 =?utf-8?B?a0tuYVhQT0ZjV1loOVdhRzR2c1AvOFlaZlhrTzFwRHBvT2FvbmVlUnN0TFFR?=
 =?utf-8?B?bEpCMHgzNmF2OVZBYjhsVVRKVzRhb2VYZjRWSVZTTTBQQjBoOHRnZ0t6M2FH?=
 =?utf-8?B?ejBtWllRVmcyRnFtWnk1dVBmWW5OeElJQXB4WlN1KzlxUWlmcmZ5VHpZeTcy?=
 =?utf-8?B?ODkzRzdkemY2alZhMitsRVFMY3lSbGhRTjRZcFVrWVlBTXpmQUl3dDdYcktU?=
 =?utf-8?B?ejFaT200U1loaFlJQlFTcVhIcWhsTUVVM1U4MXphWDZVdGxaaVVEVUtJUUlV?=
 =?utf-8?B?enUycmVEeEx5dUVhaFFRQU5PbVJjamZiNzVVMTBHby9ndWp6aUxYNlk3UUVO?=
 =?utf-8?B?VEdGRVJTVnBuUjhqdXA5SEpYRXpiRlFBOSsxWGxjblN5T203WWVkTk5CL2ND?=
 =?utf-8?B?TjZGcWhOZWg3ekNLbUVKOGp5VnptejhmTDRNajBuV2pmWm9wYTN5RnJHcTlq?=
 =?utf-8?B?WDFxOHIwUk96UHBVWGplT21yaGl0VFhOYkMxMjVRYXp4UWRObFg1L3llTGgz?=
 =?utf-8?B?b2N1VDhsb1M0NWJQLzNCdU1lYnJjMzJLcHhDNmVCVDc0UWdEWVNnb3dyV2hN?=
 =?utf-8?B?OVozbXphalF0SnpwSmh6eUYvNlpxVGFBUU9DS2ZiZlFSbW9PdUNMZkIxRVN4?=
 =?utf-8?B?U0h6L05xcXpIL3JyVGc4UFBFYU1qNEVZeE9RazZkcWd0Z2ZqVnQ0Y0VCR0Ev?=
 =?utf-8?B?NEszQVFTTU0xaW50Q0ZrM0JBWEw2T1l2YTI2VHcycTFtNlhPZFBzU2ttWU0y?=
 =?utf-8?B?U0dPSE1iUHZuTFptMUpwUlp6bXVTL3p2WHRPaHRiS2RZb1E4d1BRU2tyWGlI?=
 =?utf-8?B?MjlUTUh0MGh0eEc3UFZseG1pWlpiL1hiRnVqKzJHcU5zaUxPWUErU25FTlg4?=
 =?utf-8?B?NnJES0ZJcHg1LzFDZG55bU1GN1Eya0wvUUdnUkxkZUM2WEw2UWpWZ0lzNWZt?=
 =?utf-8?Q?QP3264cRSZlBQaNY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c512c716-7017-4e9c-594c-08de4fb26f11
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 19:08:12.0816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vK0NimWps5601KhL63HuA/V4s5jvBI1iT4XVKhHSE7A1BW6jUOuHg8cUzl1trpkGffcNa7v6N1grzAgSReM+Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9064
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

On Fri, Jan 09, 2026 at 01:53:33PM -0500, Zi Yan wrote:
> On 9 Jan 2026, at 13:26, Matthew Brost wrote:
> 
> > On Fri, Jan 09, 2026 at 12:28:22PM -0500, Zi Yan wrote:
> >> On 9 Jan 2026, at 6:09, Mika Penttilä wrote:
> >>
> >>> Hi,
> >>>
> >>> On 1/9/26 10:54, Francois Dugast wrote:
> >>>
> >>>> From: Matthew Brost <matthew.brost@intel.com>
> >>>>
> >>>> Split device-private and coherent folios into individual pages before
> >>>> freeing so that any order folio can be formed upon the next use of the
> >>>> pages.
> >>>>
> >>>> Cc: Balbir Singh <balbirs@nvidia.com>
> >>>> Cc: Alistair Popple <apopple@nvidia.com>
> >>>> Cc: Zi Yan <ziy@nvidia.com>
> >>>> Cc: David Hildenbrand <david@kernel.org>
> >>>> Cc: Oscar Salvador <osalvador@suse.de>
> >>>> Cc: Andrew Morton <akpm@linux-foundation.org>
> >>>> Cc: linux-mm@kvack.org
> >>>> Cc: linux-cxl@vger.kernel.org
> >>>> Cc: linux-kernel@vger.kernel.org
> >>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> >>>> ---
> >>>>  mm/memremap.c | 2 ++
> >>>>  1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/mm/memremap.c b/mm/memremap.c
> >>>> index 63c6ab4fdf08..7289cdd6862f 100644
> >>>> --- a/mm/memremap.c
> >>>> +++ b/mm/memremap.c
> >>>> @@ -453,6 +453,8 @@ void free_zone_device_folio(struct folio *folio)
> >>>>  	case MEMORY_DEVICE_COHERENT:
> >>>>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
> >>>>  			break;
> >>>> +
> >>>> +		folio_split_unref(folio);
> >>>>  		pgmap->ops->folio_free(folio);
> >>>>  		percpu_ref_put_many(&folio->pgmap->ref, nr);
> >>>>  		break;
> >>>
> >>> This breaks folio_free implementations like nouveau_dmem_folio_free
> >>> which checks the folio order and act upon that.
> >>> Maybe add an order parameter to folio_free or let the driver handle the split?
> >
> > 'let the driver handle the split?' - I had consisder this as an option.
> >
> >>
> >> Passing an order parameter might be better to avoid exposing core MM internals
> >> by asking drivers to undo compound pages.
> >>
> >
> > It looks like Nouveau tracks free folios and free pages—something Xe’s
> > device memory allocator (DRM Buddy) cannot do. I guess this answers my
> > earlier question of how Nouveau avoids hitting the same bug as Xe / GPU
> > SVM with respect to reusing folios. It appears Nouveau prefers not to
> > split the folio, so I’m leaning toward moving this call into the
> > driver’s folio_free function.
> 
> No, that creates asymmetric page handling and is error prone.
> 

I agree it is asymmetric and symmetric is likely better.

> In addition, looking at nouveau’s implementation in
> nouveau_dmem_page_alloc_locked(), it gets a folio from drm->dmem->free_folios,
> which is never split, and passes it to zone_device_folio_init(). This
> is wrong, since if the folio is large, it will go through prep_compound_page()
> again. The bug has not manifested because there is only order-9 large folios.
> Once mTHP support is added, how is nouveau going to allocate a order-4 folio
> from a free order-9 folio? Maintain a per-order free folio list and
> reimplement a buddy allocator? Nevertheless, nouveau’s implementation

The way Nouveau handles memory allocations here looks wrong to me—it
should probably use DRM Buddy and convert a block buddy to pages rather
than tracking a free folio list and free page list. But this is not my
driver.

> is wrong by calling prep_compound_page() on a folio (already compound page).
>

I don’t disagree that this implementation is questionable.

So what’s the suggestion here—add folio order to folio_free just to
accommodate Nouveau’s rather odd memory allocation algorithm? That
doesn’t seem right to me either.

Matt
 
> Best Regards,
> Yan, Zi
