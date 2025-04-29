Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6E1AA10FD
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 17:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C4310E4F4;
	Tue, 29 Apr 2025 15:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FUBjUxW/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBD110E4F1;
 Tue, 29 Apr 2025 15:53:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9cymGkAx4Tb/NYUHPdwRFVK2XjZpdR9o6PBF3U71id2n1Xjmz0aiJM36FZTKEeLwujTfJETmllfP5tGXQtnkUf2b5om02gwkkOXYYVMYhVg6HjIh1MhngYU5TiJma16cJz0QUCEZijfitjb2XQ4csyOwq8jyWo2rm0dL0yBK7BNwK+HGWfMBwcEfEbZinGC//hxCIThvbhF1qQiH0zogQLg5je2bJ84mMUvSiQoyYVxW8odUbnQp+qItR0duU3umthIfbELghuByWMGI7pFwawr7LYXtFlXzAqlrIR0gjH+K6DwBffZFclGwFBYKLcsG3XY2A26Y04aeb8CmTxrHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDZZGp1+zHZ9qILBTZkQQYbtEopMNq9+D0KDzsBM5lg=;
 b=s+mUWAqqQM+99UuWdqwBrsPDj8rh+f7SMJU7Gym0e6dbsmvi7hnmc7vgGPwYdFliVwOO/Lf8U0/HUy82l6BmjWROOr/WnQoLsrVubu5Rrds0NF5llvsVawR/wySCPL/EZ3XnWZdpHizYpY+LhXY4IYdQqrUoto/wuBp6/HKJbDglAGKBYSdPONCXHrjwprJ/kibwauTHlrWFd+g3Q/pP/s4LSVm50CEsKZ+SlSzxHrdcnpT44noGnYfV07tGBUvhFgmbjSOlJQ8NrWGWV940saZVUbQVB3g6Y0a40eEgVEAraRqng9qs/5njhDm+dcknfsrNxQEqNw8xgMtR9JUCSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDZZGp1+zHZ9qILBTZkQQYbtEopMNq9+D0KDzsBM5lg=;
 b=FUBjUxW/ANjjnQjwuhzWDTST0pZAdqGvvU74RYUWrDxgAg2IzwfiWTsIEFQEljFhleXg6HIJqR5bdVERmPGbNJyXUNwkHgrm6eQzmENvm+zcP2EFHFJXEsjRdjU9Zi49749VUjbL55M532syQ6ufLu6oXIQ9bn9wn6aM2NQjNaI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6408.namprd12.prod.outlook.com (2603:10b6:930:3b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 15:52:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 15:52:57 +0000
Message-ID: <cae88c6d-36e0-4add-872d-bbfa40c4ee25@amd.com>
Date: Tue, 29 Apr 2025 17:52:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 01/16] drm/sched: Add some scheduling quality unit tests
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250425102034.85133-1-tvrtko.ursulin@igalia.com>
 <20250425102034.85133-2-tvrtko.ursulin@igalia.com>
 <10501127-0315-45bc-96ed-f48c3af957ef@amd.com>
 <14d92cbe-fea0-478e-8b82-bc3a4ba26609@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <14d92cbe-fea0-478e-8b82-bc3a4ba26609@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6408:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d952179-8bdd-4454-ad94-08dd8735e910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjNZYTE1WU5MWE5hSzAzUHZ4c01YcTVGaEpDckQwcVRyVEZLaU9oU1JsR0w4?=
 =?utf-8?B?bnhwQWFlR3praGltWm5JQkZaMG9IYVZ6cUkwcEZYZW5KeU43elFkeWx5MlpJ?=
 =?utf-8?B?bTNiMDZJSEMxQUJsQjBhdjd6bXdTQURPQmlGL0Q5TjVCaDBsUDFRbmRWa2NT?=
 =?utf-8?B?ZWRLZFluOGgyNUVtUEFiNFFZYW5nVjJqaVhCQ3Z3cTA5NHZPckFuOUlUMnJ2?=
 =?utf-8?B?bm01cnR3aWtidlZ6WFd3TnQ1QjdtVkpNa2l2K1lGQ2RTcFY2VEY1MFhPWVFh?=
 =?utf-8?B?RHJVZWlJaGRHZnBCL2ZCWVNXbHVTWDBFUzZuR0xtbmNwMC9OQmhGbWdaNXoy?=
 =?utf-8?B?YlNGd3lHQktNdThoMmczOFVIenJNdG85UlhYYnEzT1BIMHpoMGFITXBadGEw?=
 =?utf-8?B?WHlsb0FzZnVpbkFJUktEcjZVSGYvYzJyOEJ3ZXNOd2xhbDVBZGVlUmwwemlo?=
 =?utf-8?B?dWNUV1hRSzE4aDRoS0YzTW9CeG10L3QwblMrM0QzYmNHSXlOSnRyamFnSE5h?=
 =?utf-8?B?eDZEaTNpSFA3RjhTN2pDK0VTVGg5d2UvN2pXNUVBWjRIZkZhQ0M5NHN1Slpn?=
 =?utf-8?B?elZwVTdBYXZLaUdhZnJkRHBxS0hDSGlsTkc2clByK3NJT01PKzFoNkpoRm1F?=
 =?utf-8?B?Y2R5c3NqSmIxQTlGMXZlR2xFdXNyazNtTDIvZEttdE9wc2ttQklpWWFCN0ZX?=
 =?utf-8?B?SVZLZEhNbWVqc1hZRmE2VElSTXBoUnlORS9UYnFVcVJzRFBnbkRkbFY2Q3ZI?=
 =?utf-8?B?N20wMWkwQjRhM1k1cVhYTldkK1dXUytHTnZGc2tDL1FKczBHV2c4MTM0ME10?=
 =?utf-8?B?RWRkWU1MU1JPNUQ3elduVWd5K2h6WjVDdDYyODV4aWZaWTNoLzJyQWNYK0RQ?=
 =?utf-8?B?VkFsRDNOQktMd0cxRW4rSTk1VHlQZXFDOEVPVHhEM0VrRllVMkZ6RE9rTFVj?=
 =?utf-8?B?RUFPYXJZRDkzWkFzdE5hL0JnbmNpYXU5KzFIVTAzREkrYTBscUZiNkZYU3Rm?=
 =?utf-8?B?Z3VqdmRLZ0c3cVdIZ3BvTEF6WXZuWWExTU9kMU5NNk1CMmU1V1dXbitYdGx5?=
 =?utf-8?B?L1ZqU3FwRnhYZW1TajA0MTJTMGR0TmZCL1o4ajd3YmJ3dkgxOXBwRVZmS2VQ?=
 =?utf-8?B?VUlmWVpIUFFReW81WGp0UGQvY3RrOEFaVmE0SWZJRTZPN3docmMwWWl6Nmpr?=
 =?utf-8?B?dGlDTjJ4bFc1VEdIdkxhdFI1NWIwSFZSdmFQendFRzliWVczSkRwL3JydjZO?=
 =?utf-8?B?Qmd5cVlTeURTMlB4Qit0VGVoek5KUDNpY2xpUnRkaFFpUHpsVG0wOWdEaDhq?=
 =?utf-8?B?d2ZSOEloNkxRWGI5azR5TnU0eFlicWZwWlptdDQxdXJUR3p3ZnoyZU5FRlZH?=
 =?utf-8?B?RTdXUXBJZ1JrQzNJY1gxdjIzMVNkU2FQbXo1MVM3VHRQR0t3RjErL3JzVmk2?=
 =?utf-8?B?Z3pESjBNbk52UGlOY1FsWTlZOU1NZUJ0RGtKK0hzbWVGOHBFaVJCUmJHRWZz?=
 =?utf-8?B?QXlKUGo0RC9HaHdQb3Nqb0hlMzliVjRZMnlMamliR2VQRXBNaXNZazg5cmVo?=
 =?utf-8?B?WG9hMWpadVZqR1J2SHBGSFZUOGE4OVpzY1orbHZFTmJFL01FcC85ZUFBV1ha?=
 =?utf-8?B?MXIzempzMWV2dGhyaDB3S1ZyS3hiSEhWcmxQRWd3VWhiL2V5WW00OENjVHYx?=
 =?utf-8?B?Q0RPYXlnNzdscy8rU2FuRW45OWZCNm82b0p0QlFscGhYbzd6SnpoME1VRk5s?=
 =?utf-8?B?UWlxTmNwMS8rQnEvVyt2UFcza09TM3JZRFJENEZyUjBpckR3Nkh0ZTBsaVVE?=
 =?utf-8?B?Q0NYdjFGeVZzVXNlMUNWczMwYlF3U3VjRmpmbktoQmEyb1c5dEp6bEx1ZnNU?=
 =?utf-8?B?WWRReDZOV2tpaktVa2twck1sZGx3dkNPNTN5bmNzOXYxNmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmNjNVNsdk1iRGw0VGY3YUVlTkY5VWd4enU4V3MrWWRvdGFiWFdhZko2U2tv?=
 =?utf-8?B?bEZ0cFZRWkRDajZQRlVsdkNLVW9ldUZ1b2l1N3FJL1FOTHM5SXBudk5sVjVN?=
 =?utf-8?B?b1V2OXY0UHd6MGVqQ0kzdzF0SUhQTWZENmloSUdaMkhtZlRISHhmSGk0N2lO?=
 =?utf-8?B?L0V4WURWVmNPQXNQdEZHZXp4UXd5ZFZCcjlya0swZTNvcld3V1pZOEtycFFo?=
 =?utf-8?B?OFhXdWZLakFXUi84UXlJZGJrU28vNUlMT2JHcUlQSkdESjBoQ3FXN214L0VK?=
 =?utf-8?B?Q2ZJNjdaZ3BWZWFxQzNyZHhtZjVGbFc2L0lqcnNKcXRwK3B6UnBFQ1ZhalRZ?=
 =?utf-8?B?eUFjSHV1ZjlxTkRpTStDT3ZFUDdOSVdnN2NFK2JqaW9XUTcxV3hQdGxES0J5?=
 =?utf-8?B?K3UxMit1eU9tb1l6dGZuaXpPVWFub0ZPMmt3bHpYMkp2ZXU4eU91b09HMytm?=
 =?utf-8?B?MkYyQm1oc3hNVHhuVm81UGp1RWJIQ0VYbGVDYnZ6cWMxN3dEakpUM2xpNWts?=
 =?utf-8?B?eDFMV29WYlF2RTBwTnZ5cjlTS0IvNTd1SVVxTkdzQW1rbkpvQ1VuZ05xYmRU?=
 =?utf-8?B?SmpmZTRqU201WWUxZGhFWUwxdnoyMDNIenIrdFRhcHFhR0JzZTZlMzVLVStU?=
 =?utf-8?B?djhURDg2UlFsOUV4OUpRN0tCdEtkN04zNC9TckJuOVNkbXY2RU9RU3hMS3B2?=
 =?utf-8?B?TXNZN2pXK3Y5RmtTNEVNZ1pPZEtGRlZ1dGptTWRBdDV5dGhxOG8yQjFlSVRo?=
 =?utf-8?B?ODdabytiaEdaYi9FMG1kdXM0RUpHQXplcDFHWUZQMWY4QThMcjVCN2RyeFdY?=
 =?utf-8?B?TzZhSnFmbHJrSUJZM3VJRWVOM1grWXQvalhXdkNFQlhvQWd3eGpNM0tpTHV1?=
 =?utf-8?B?d3NKYW8yOVlMZzc0ZUZBVlNLcGtqVGZaNGtudkpUSlVjRm1wNG9OSExWQmJI?=
 =?utf-8?B?QmQ4U2xxRVVBNCt2Y3Y0bEY1Mk5Ya3FMQUNrSWpkVDk3Q1RxcXNxL3g3T28v?=
 =?utf-8?B?OGRBd290VTVBc09nWW9OUHdubU81K0lydXA3OXNpa0ozeUhEYm0yOXFaaGxV?=
 =?utf-8?B?d1FWS2VwTnpqNTJVV1UyK1dmcHViMGllbkNtMENzeDB4TEVYc2h3bFFxbUR4?=
 =?utf-8?B?WnY1TzB2WmprSXpKRHJmeDllTUgrYXY2d0JLYncxVkd5VnoxWGMwdDlmU2hS?=
 =?utf-8?B?R1FESnI2WmpFTmhjbjRFUEE3eTg1UStHSDhPbzBYNXU5bnJBY1RUWHBBQ1hH?=
 =?utf-8?B?WnpCZlBJQTJyb0hRNjdmSDQ0enh4QWNHd2ZFTzcwR0lidmQ4TEtncUFTN3hU?=
 =?utf-8?B?dTBaMk80R2pLVE9SS2NDYXRSbnJpbjNsbU5pZ3dDK1FpeU9rRHpjdnVGVnVl?=
 =?utf-8?B?VmpIUE5wRks4SVRRRVBZblQ1N3VZT1MwVzljS0lxaWRBMHU3YlRCVGF0Wllk?=
 =?utf-8?B?ZVdPNTJzb09ETERwd2Z1WGlNbU5lVzZoZmlqampPQnRKNVNNVUl6NWVWUks0?=
 =?utf-8?B?VzZtYWt4blpiRnk2OTFVRk5qeFUyNHdWc0lML1U1QjZzUzREMkx2Lzd2YjlW?=
 =?utf-8?B?UXV3VWk3dDVKTDFTL0hzWnVqR1JZK1NnRzZoVlRHckxKenRWbnUzQ3dmNThI?=
 =?utf-8?B?TTQ1cjlYVXAxZDZCVzB5bkV5YSt0dU1kMGpoVWM0NHBPdStzbFRjRXhWanJQ?=
 =?utf-8?B?c1hkMlNZdmNPTFp2KytsYnp4RzJJOGpZSE9oYkk5ay9NNWtUVVBVNzVQQlht?=
 =?utf-8?B?dUNNYWJDcWxvYS9SY1hnMXpITlZaU0EzUUh2V3BBTUVFMGo5SDQwNUp0dzVV?=
 =?utf-8?B?YzVpQmg0ZmZuRms2dGd1Q3NwRVZUTWJPakswcjdrY2lXODdwMTlJT0tGdUVq?=
 =?utf-8?B?TkM3T2NuWVI5akVtS0NCeVNuVHg1RERCd3hMSmJDSUVHb0FFbFA4QUhXOGRT?=
 =?utf-8?B?blloRUc3NHprVlRWRGV6a3U1eVp0Q0NsM0xPZFVhT2d3cEpEbkkvOTdMdVhs?=
 =?utf-8?B?Yk1wRGUyc3Y2YTQyclZzNGJSUzJHV3V1TGNseXp1NUlZZkFzSUc4ek1VS3dp?=
 =?utf-8?B?RzVYUGg1ZmpaMXVMcmxPeDY5bk4vc2x4d2xON3lKQXVVbFBtKzErMitBeE9Z?=
 =?utf-8?Q?vz48ig8feOObrW1ZKoIZ0WYDC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d952179-8bdd-4454-ad94-08dd8735e910
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 15:52:57.2608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nsh6NFvxhkdhuYFtgoNlOL4nMSAnmCiwNJW5jhh6pkD5pJUw2+CjDwdFpPzn1NOU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6408
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

On 4/29/25 17:45, Michel Dänzer wrote:
> On 2025-04-29 17:03, Christian König wrote:
>> On 4/25/25 12:20, Tvrtko Ursulin wrote:
>>> Note that the PCT and CPS metrics are irrelevant for "unsync" clients
>>> since they manage to complete all of their cycles instantenuously.
>>
>> Typo instantanuously.
> 
> Make that "instantaneously".

So much for the quality of autocorrect :)

Cheers,
Christian.
