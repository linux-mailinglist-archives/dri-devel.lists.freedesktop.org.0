Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054B0A138D9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 12:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EA610E571;
	Thu, 16 Jan 2025 11:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KNKtk+1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEB710E1E4;
 Thu, 16 Jan 2025 11:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737026589; x=1768562589;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R3hTk0TERuifd3vBbpXJBVJ28NXt5fHeAIYLMjDgeT8=;
 b=KNKtk+1rQVHXvQ0DhJQVcjbCHtqkT88CA+kHFqCgdLMAUvNYwSqLmb3y
 ZZUzn0MpKHCk4w2g5I516E4VWJbWq0FBUEhyk+YECpaueFpqmmQ/0GtbE
 6C36EMcTUhMQlskryfAbZ36+JhMUGjFujjV+zE4iUpnAOizUhRFVdYxAY
 AaB4RcolTXACjDbPoC5xXMtUmS0CJmb2CO3P4uOxWW5TKlCJ9+4xvgtC4
 nsYoNWcRj9xKn4P9FJTlPkZ8Y1rjLQ5VEFufY1kWyVmKl7Xz+J8cU7wk1
 M+dlkw9FKHMZtv4HHoIq5d/WputSMn6/xbPrImWYqj9KVUdK+TUnLgTgp A==;
X-CSE-ConnectionGUID: aN+Tm28QSRaNfYpD52FWMw==
X-CSE-MsgGUID: Mn3aIROAQheaPAs4bDlivw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="48409593"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="48409593"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 03:23:02 -0800
X-CSE-ConnectionGUID: B1bsgyFYS363ZylPKx53oA==
X-CSE-MsgGUID: o0E4+ZnkQEK2QLMisaWeSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="110443294"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 03:23:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 03:23:00 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 03:23:00 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 03:23:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rv25aV1/Isni3Rf6AUA9wZUmgYlCtbpZp5dXu0L+brGLicFHOL8xtXH6tADzpvoGvMJzuiQ4ncgxpn3LnviR9yKdNdbOCu6wap7T4sgIts53xHEphjeKGQZi9z6vJFsPI1yx7imhANpkeoC/4xkgDfoDX3JVfrXllg5bvq7swHl2LsU11B1aHleDj6D2e5zVLxOI4/IVq6M9hsEyWQyNn5imwP/X9v2tDFzKdBO4XaTxPbjMVjByTpqX4k0oUtEzjiVkHMfQ3bxgdXer0EqGPfCa2qFic5ZYDoPHodAy8Hq8m2ecjcRcHSozMbFbVjsuulK6x4HTRuyP3fzOBaQoXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ep1BlavgffPHzgNcYrwwQGuk2TxwZ6vjK7haeTm4q94=;
 b=tbyY8KqCmv5JxkMQtgiNfDfCqoxi7ETNYvJ2rWkf/do+KTLzKMyEHHH5w3kNB7MZ7nFosOSOmUJPlzf1u2Q3G9D6clNDUExISgrlrQ1/hIfQ+34PcIUqBSwcmVO/SavjWGHiUC0hqYGddt+f/hBGN65TL8k2oGwwDSfxnZ6ld5HuQ69YjEJ8uAQLjZwu2GCaRi2EMHc9o4Eg1LMdwVtp/OyyFKvfauS0RoBWLIr22VpX05RaQq+fv1eTYuYW6GsYA6hyYWj14Zac0cgum1JND4Xe/pVrTpSuqo9/dBVTmOBZ2JEsPTE9B8QPVS3PyhhKWYShV+cvQ9UIvr2uYh3KWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16)
 by DS7PR11MB8808.namprd11.prod.outlook.com (2603:10b6:8:257::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Thu, 16 Jan
 2025 11:22:58 +0000
Received: from MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6]) by MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 11:22:58 +0000
Message-ID: <16e02f7a-5dc4-49aa-b81e-25c0d313b9a1@intel.com>
Date: Thu, 16 Jan 2025 12:22:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/i915/gt: Use spin_lock_irqsave() in interruptible
 context
To: Krzysztof Karas <krzysztof.karas@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: Tvrtko Ursulin <tursulin@ursulin.net>
References: <pusppq5ybyszau2oocboj3mtj5x574gwij323jlclm5zxvimmu@mnfg6odxbpsv>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <pusppq5ybyszau2oocboj3mtj5x574gwij323jlclm5zxvimmu@mnfg6odxbpsv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB7PR05CA0072.eurprd05.prod.outlook.com
 (2603:10a6:10:2e::49) To MW4PR11MB6864.namprd11.prod.outlook.com
 (2603:10b6:303:21b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6864:EE_|DS7PR11MB8808:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a4c05ce-f500-4be4-5459-08dd36202126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2V1QVZxV3ZkMENaak9sbitza3VCYTUyZWxWWGxoTmRycW1QRmxOeXREK0xz?=
 =?utf-8?B?TWg4Tks3aGZCNlczS0NaZ0IvdWtNaFpidkRrUkRmYnFOR1NvY0VBWm1rZ2ZI?=
 =?utf-8?B?bEQ3dlVYTHRCeEhPVXRnYXRyZXBjSk1rME9NZCtNelhYMThxd0JBRDRuVWYx?=
 =?utf-8?B?THFFWTc1RW9kTHFGN3RqQWNGeFZqY1lUaXh2QlRzZmV2NGlxdFllbWgxWkpl?=
 =?utf-8?B?bVlsdnNCNFJ4cnZNM0lKejBNcmxNaE9rS2pQbThaT0xMN1FIQStJYXB2QkJB?=
 =?utf-8?B?M202VUlaNWtrd1R0ZzR0OVZ3cTVDdWpTT2FCS2hkWDdDQ29WenFrekROMDVG?=
 =?utf-8?B?S1NrQlJhZmx6eHlQeW02YlpQdlBueW9rUEx4MHliZW9MWmRpZ3pmcWplKzdy?=
 =?utf-8?B?d1NGdUc2aVJ6T0hucVBVN044eUxYNmZKbU5LcEk1azZ0dmN4UXdpd3Q2Y3hH?=
 =?utf-8?B?dkUvS0YrTlNRMXB4Z1A5T0RpWkZvNWZaQVRQakQyTzNvcVFKSHlzYjFIemZ0?=
 =?utf-8?B?ODJGbi9qeFdvNG81RHllUGZucFdLRTZmR0RpOFdZazYwOVRjZ0FSR0FmTzl5?=
 =?utf-8?B?WFM2bHRIdmRmbS9adjdMOUZEeHRsbmZjQzdxanZrOFZsZFJSNjZFUHY1ako1?=
 =?utf-8?B?bkVHcEVNRlhNZm1zM29wTVR0ZDNoaWJQTS9XSUYxSTRIbDJ2OHpKRU8yMnNa?=
 =?utf-8?B?Yk9SMHU4d1pqaEg4NytJUWR4UXRQSmpQQXZKTGpWT202OHJqOGxnc0N4MzY5?=
 =?utf-8?B?ZVRjd2FDOUV5SFIrbjdWSFlTMTR6aFlvM3hYM0xDM1hIK0F1a2x6ZlZ6VnAw?=
 =?utf-8?B?eXdsMkdEaUlqME9HNVlqRkFRVUFtWmg3dGl0V1laUnEwaDRuQ1hmR0JPT0R0?=
 =?utf-8?B?OG5LcTVLMlVqTnNOZmJ5ak1GcDI1a1QyUVBiZGpHMmZWb3JUVGd3WEJUYTBS?=
 =?utf-8?B?UStFbTRvclFTYnA0L3RYdEovMWp0TU9qYTVhZ2h0dURhMVpEKzZ0MmRIN1Nm?=
 =?utf-8?B?UDNTdlRSZHVUS3dHSGhXZXhqbWs4M2Z6ZVNqWDFlR1BRUlJZajY0Mnd5eFhI?=
 =?utf-8?B?WnRad2cxcEFEUHBycmtBam45RmNSSFNmZlVzQXo0SnhXL2hVeHhrN3B5SHN5?=
 =?utf-8?B?alZOV1pWVS9aQXdNMGcwbEVpcjFlQnlidUlOVk5LTlFlOHIvUlRZcndlMXZl?=
 =?utf-8?B?cFJ1cEJHWTZCY21icXlmTTY5SjRQNXYvRm1pRFJZQ3dLVFQrbjRoNXgvOGxs?=
 =?utf-8?B?OC81cEZmbGRPZ004ZWtpS2FJQnFCWllMTWwvenVhNkJKdTJGYzcrWnlaQzNL?=
 =?utf-8?B?YzFLM0xEaldXRzdUQ2k1VWFVZFg5dmpkZUJkZ1hPK1hzbDRtc2RIMlBwNnVk?=
 =?utf-8?B?UlI2blc5bjNLLzBrQnQwUE43VDd2em16bFdqWjlETWNZTUYydVNZcElpTnR3?=
 =?utf-8?B?enJNeGxKcGwyL3JGaEp3Z3RVLzcxR2xzZlJRdGdpdXhiSkdKcUlaOWNONkps?=
 =?utf-8?B?U09tYmJJZloremNvTVNncW9Iekd3K1RxNzgvTTdEQUZ6QTg5clRsbXVhclhK?=
 =?utf-8?B?SU1OYnlDNmFUb0dEOUtHQnhWNmc4ZGVtQU1oWUY0NTZvblcwclpubm1TZkx3?=
 =?utf-8?B?ZnJVVURyTkpRQytDT1VPdXJpcXd6K01XdmxpWmx2eWxjRHhWNG1KNW5uNmZh?=
 =?utf-8?B?aDlaKzc0aXVUZ2FVRHJaSDgreE1iSkI3Y1hhVHRkVXEwZm1PMmlteTJ6cDI4?=
 =?utf-8?B?UmNSVDFLUHVsaEl6dXNDQ0htK0pFR0JXeU9tQnRxZGYrbnNOVlY3QXhRUFVp?=
 =?utf-8?B?Z0tqSUljWlVLeTV5NVptZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE9oRS9qWW5vcGN2ek1rejdIL0s2bGRySk0xTkxVYlFxb2VmMVVVTUNXeHhL?=
 =?utf-8?B?UnI4dVlFRTRQdHFOUUJRNC9vaGtVNzZpWFBSdjJ3anRxWWlnT05pK2JmQVFj?=
 =?utf-8?B?NG55akJmSVVOTFRNYWpjc1V0amtFTkpJU1ozK25hYTRzelhXdXNtS01ZaTg2?=
 =?utf-8?B?azI4bm9yKzNQYVpWVHFUWXpmYXNHZnN5VmNPeXdzV0UxUFlxK1BQVjJZakdK?=
 =?utf-8?B?VFJoZDhabGZ6WmthYWFkTXJlSXNsRU5HMndpRXI2MlZnRE8rb1pVaHBJSzB5?=
 =?utf-8?B?RG4rUWRhNW4yRUNKNlp5M0RWcjRtNFNRelNFMHBlM3JJajdmQWtwMVdUbWNh?=
 =?utf-8?B?a0tPcU5KeU1LWldGUk53Y3ArcVFhcTkxUy9QaFVyNFJHT3pOaG5MOGg4WUto?=
 =?utf-8?B?d1YreHdESWZZcFdjUTJDY2RPV0hQNmpLakt4Z0dBaldxZnFOSUlNYkUrLzkx?=
 =?utf-8?B?RW5IZ2NGM1JpNjY3N1U1WFRjUEhyT1hVd2FCZVZRWVJsTGNvU01IcUQzUG1h?=
 =?utf-8?B?V2hKS0Q3VnE3bUJFTmJYVDE5disyb3lnelhMS2JnYlF5bnF3c2ZTV2FSdkZR?=
 =?utf-8?B?STIyLytoY0p0alQ5bDloVEYvK28vMncwU2Z1OS9jZFdMMW44ZlVpd0duVSsx?=
 =?utf-8?B?a0VzWmhjMXVlMVdBeTI5QmFtUGcrLzNEai96bUhvRnErNDhGd1RqWVlRaUQv?=
 =?utf-8?B?ajhVSmxkZXZBQkNPUG04UFFwdnArTS9VS1hiSVkxN2ZYak5nbjI2Q1JTUGxy?=
 =?utf-8?B?Mk5SWlZNdW9VeCtCZHpGVzNWYXM4TG8wRnhtd0hzZE51aFJnSnkwMkJCbHl2?=
 =?utf-8?B?OXR6cE1xL2JBVlpYb3d4N21mbzdoQ0RyYS9xS0lqdUdydTVMRUVxMnhFblM2?=
 =?utf-8?B?MVRSajBMa0FxTTlKTzg2dGdVVU9kQjFzMGVyWE5NWk94ZnROQlZ6L29ka2pO?=
 =?utf-8?B?anVTSVROYXpsS0dkaEtRdVZJbHljQTJ0aVNMbWtNTDRKdktNOC8yQUtEeVpy?=
 =?utf-8?B?dWdkazhvT201L2d0WGRZSmEyajRURkltbzdXMTF1dWtRb056K0ZtdDlobmdC?=
 =?utf-8?B?RC85UWd0aFltc2xCVm8yMzY2K0ZIYWp5VG4xTXArUTJGUDR5Uk05cThTR051?=
 =?utf-8?B?WkQ0ajJmUnRGTmJvWVdicVM0amZqTklJeWxBM2YxaENzU3NYNytrTmQ4cmRK?=
 =?utf-8?B?SFo5N1BkTGlXaG9LN3FhNjRBNjJaZHo5V1U3bmNad2R3dGtwR0IwL3JSam9i?=
 =?utf-8?B?K3YxUTVHazdaWFpKK2JNdjNha2RRQWkzVkNzczdyZFNrdWZaOFo0WDJBNVY5?=
 =?utf-8?B?cHQ2em1NbHZXQkVhM1htOGY0emFrWGlCRHV3djd1K0VLUWdFRy83WnNxWTd5?=
 =?utf-8?B?MU1YZXFyQW5URWo2Q3pFY3haeDBKck9WSkR4UUgrSzViRUgxQnQ0VCtidERS?=
 =?utf-8?B?RVN3TElEZlBBZUdWKzFLRlRzdmpvWHFWVDBRL3JoaHVQRExQL3VIdythci9h?=
 =?utf-8?B?dkZhMXN6TTQzRFovS2xmR09PL2xwZjZRV3VHNytVNENSbHRnR1l0VWI1NlZs?=
 =?utf-8?B?Ly9SN0psQklRRFJHcm90ZjFTOGZDMjdzUlZlcUQrOEZ2ZlBVdTRnN1pwR1oy?=
 =?utf-8?B?UXVVdmdIZG8zbW1uUnUycTk5cEpra3JOZ1RneGxpK29sUkFhQ3ZSWEJsUmhE?=
 =?utf-8?B?eDF2aXVYNm0rNXBjcC9tcENrdDgzZjk0Y1EvS2ZkNVZwN1RodFhxcG0rMDJY?=
 =?utf-8?B?ZStnT281d3pFL0hPZEJZdGNvT09mc0ZMeno2Z1R4RTNCZUpkUzVvVG4vZytJ?=
 =?utf-8?B?dGN4aFNhQTRreDk0bVBKeXlQakVFTmJoOFlpT2srYVZiQ3RBN0R2VmFMT1ls?=
 =?utf-8?B?ZXBLYVdDZFRmVXR6R0ladk9HT3dyQlNWdGNCZ2F1ck1VMEUzN0ltNmNqUGsw?=
 =?utf-8?B?RWNzYTVRTzJyUjBpWGV3RExWQzRibXYyeTR4R0Z0bW9lWGRENzN2MUZpRUJH?=
 =?utf-8?B?ajVSejY5YlZjT25UYjd3M2wzMVFVREs5aCt6NitTa1RkTFhWdi9Pcm9xYWVT?=
 =?utf-8?B?Qk5ySEtrVFA3Z3dKd1FIZ3VaUWxTZkI0S2F3U1JkUmNCYmY2U002d1lMRVJT?=
 =?utf-8?B?cFNUaXR6TmovVjdRWlIrczZFUlB6dGczYTFuaEI4TXBWZXdmMCt4OTlUazdm?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4c05ce-f500-4be4-5459-08dd36202126
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 11:22:58.1724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rVlukzWnd1syRv1Kuk2Fn6Fxm8Z0a7iv0gnvBDj4cZm1FdavQwyq+eNhdQ2PMLLfgpRnzDDbD7KvTt9U15aUeC3cLYmiVz8n5I+vf9FAdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8808
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

On 16.01.2025 11:40, Krzysztof Karas wrote:

> spin_lock/unlock() functions used in interrupt contexts could
> result in a deadlock, as seen in GitLab issue #13399:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13399,
> which occurs when interrupt comes in while holding a lock.
>
> Try to remedy the problem by saving irq state before spin lock
> acquisition.
>
> v2: add irqs' state save/restore calls to all locks/unlocks in
>   signal_irq_work() execution (Maciej)
>
> v3: use with spin_lock_irqsave() in guc_lrc_desc_unpin() instead
>   of other lock/unlock calls and add Fixes and Cc tags (Tvrtko);
>   change title and commit message
>
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> Fixes: 2f2cc53b5fe7 ("drm/i915/guc: Close deregister-context race against CT-loss")
> Cc: <stable@vger.kernel.org> # v6.9+
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 12f1ba7ca9c1..29d9c81473cc 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -3433,10 +3433,10 @@ static inline int guc_lrc_desc_unpin(struct intel_context *ce)
>   	 */
>   	ret = deregister_context(ce, ce->guc_id.id);
>   	if (ret) {
> -		spin_lock(&ce->guc_state.lock);
> +		spin_lock_irqsave(&ce->guc_state.lock, flags);
>   		set_context_registered(ce);
>   		clr_context_destroyed(ce);
> -		spin_unlock(&ce->guc_state.lock);
> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   		/*
>   		 * As gt-pm is awake at function entry, intel_wakeref_put_async merely decrements
>   		 * the wakeref immediately but per function spec usage call this after unlock.

Looked at this and wasn't seeing it. There is spin_lock_irqsave() used 
earlier.

Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>

