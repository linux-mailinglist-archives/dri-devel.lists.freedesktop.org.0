Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE25A172CD
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 19:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5692C10E0E1;
	Mon, 20 Jan 2025 18:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vQJQuf1U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16F910E0E1;
 Mon, 20 Jan 2025 18:49:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mo/ylxGoNVlqC/gaenOZ8MyTGBSftEKdTnwnls+5qY6rcJ0qRztGSTAQIgQwmH7ksZ3p2femFxtrhwTkbQP3ep1M1GkAUYyPK60mezEkCe6XgUcm3jafODwZphsjyy7ZqSf03/Wiq3ReJk9oGIpcwS6eqTJzkB2FArw3IJOwPCfcOAtYbsrT+KBgV0Vvlt1ApIw5Np5DlZepfMICRVtfJxhVRqEc75BaTR6xanO0ies/3vEBG9oNdcgP294cthVU+Jv9ciPAcu8JntFW5XuXPFE0wBE/VxbYU0aUbjiepmgkyBnXWfK256VeYFTLJoMGnVo6DZyrOQA2dKRwNmCqiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5FCBN5Q4IoPyq9Yi6SiKZxfaaifOXmiJQmHjOrNR+g=;
 b=IMJcywYnj+SI0rrF0P8xU46GgVWzQ/BdRXnDVoXeFpYfVNo8TFdThnSJt5VciOxiz5jwnWNtJhjvcToIazO3X7UupekaOXXnP0DvjAhD0AajwhOZMUOc1ffeB4b68dWf6TArT14hxEksTKhc0k7Aapiifex+ZTY0+CdxoNGeHg2HifJE3a+/DO93L7DYLd8p1dlTyPG+Qrs0BAm71WmGR3iUD4UXMF+aEjVDM7kv5N2zikdTP5tLTwOYKTTquwzdFXlDO2S1VSevvBlq+LBTK37Hm3dphGQ4G7fEfguZLrkDsYSeULAhlQ8k6p0XuwOhWaHEGYG8jg3R7ZD1muyMYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5FCBN5Q4IoPyq9Yi6SiKZxfaaifOXmiJQmHjOrNR+g=;
 b=vQJQuf1UpWoGQwryS0GDVFToWDF97yMEzMTz6XyOtxO0eIsRvocnEJMsfpGu0NbpHtnjSURAU9aiXSuOlHy3GCVwol9mp5w6+ymrvF4WeIj1dBeqKbVDo3M7ZgVJlmdjy6kX860z/mnz05rhcvQMwHzThm7ZaNkptjynG5nyTt8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8880.namprd12.prod.outlook.com (2603:10b6:610:17b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 18:49:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8356.014; Mon, 20 Jan 2025
 18:49:54 +0000
Message-ID: <4d6cb141-b60a-463c-a72d-6f76dab09525@amd.com>
Date: Mon, 20 Jan 2025 19:49:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/sched: Add job popping API
To: Danilo Krummrich <dakr@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
References: <20250120165240.9105-1-tvrtko.ursulin@igalia.com>
 <20250120165240.9105-2-tvrtko.ursulin@igalia.com> <Z46ESMfTh_FDm-eM@pollux>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z46ESMfTh_FDm-eM@pollux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0349.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: 383a5efd-0310-4bd6-d421-08dd39833a63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NThIQi8zTGhLTFA5cXkrQ25IejFWNm52b3Jhb0l2Qk5KK0M4VXUrd2RIVHRn?=
 =?utf-8?B?MThSOE1McHRYRXdsSUg5elRDZnB2ZEFHUW5ob09FRGZqNGxkbmUzUXdLRkNI?=
 =?utf-8?B?ZzlUZVR2bHFJN1h4ZEhEeWNHUUo4NlN4eUN6NkdsN2hEWnU1ZHBsL0ozSVBB?=
 =?utf-8?B?Q0hqT1RLYWVFcjRDUE9HVlh0N0FsWTVEVmdPNmkySTlGbEJudDVLSzJkbUdQ?=
 =?utf-8?B?amdHR2ZtR2pHK2lLNk1XL1dKcm9Cc0U3TzB2QlZtdEV5OWQ1eGpPM29BZmdh?=
 =?utf-8?B?OXZ2bXRBMjdCOStJeXVocXUrMjBPMEFlUHN2b2RycUZoODJjVDdkWVh6S21r?=
 =?utf-8?B?TDF4eGlTVU9UdDJncmNYRjRQSnpwWFN4MDRqMTRTUzNVR0c2V0tCWEF2NGdQ?=
 =?utf-8?B?WVNndDVhclE1U1NTRlVWemRjQm5WeU5JWXN0R3M1TjlEWkI2MTZYZnl5bjJX?=
 =?utf-8?B?c01NeDBlZHVRVjA0T3Nqc21aelFjWnQwRHZOUDlDTW03dTdXcTJjNWpWK0Nn?=
 =?utf-8?B?Rlc3bFZrNTZLaGNhQjJSRWM4b3ArT2o2ZjhNRWo2Nk0vSmliaCtzelU5a2Nt?=
 =?utf-8?B?bWIwMVVwWTBudHFRWXN6RjVBK05qRHRCako3dVo5U0VoT1Zod3ZoNUt5d3M0?=
 =?utf-8?B?NzN5U3BrekJvZ2NWOWw1bTE2TytjZmdPbFRyMXl5VlMzSzh4Qnp4Q05sQWZQ?=
 =?utf-8?B?MENWVGdkcDNsdCt6cVVuWVhySW4yTWlCZGRmZWw2VXlDNUhpQXdnV2owaVZO?=
 =?utf-8?B?bHpneWJwSnFabVRBUzJEUXEzUHV2L3h4NkZNL01MUWd3aTByUHJjZ2FIaEJo?=
 =?utf-8?B?eStkK3RubjJRL25CVzRldUloMGlKczAxMndER2gvaTBTeDZTK1A5MEgwdE5z?=
 =?utf-8?B?bnRYeVRwTXpMVHRrQ0kyQlhyRTJmWnVnSTBkcXpsbkpRYUs1Tk93b3RjR3V1?=
 =?utf-8?B?dUZ3cFBra0VBWUdDb0sxRU43dHNCbzFlMnVmV2Q0V3ovL0I2a1ordUROTWR2?=
 =?utf-8?B?TmFaNjdBcjRBempiYWtqSFMrY3VvcUJSc3ZDeFF3cUNqWTU5RDFvZmxYRUlP?=
 =?utf-8?B?MnNIYkIrVFFwRGI5aHFsUml0RmR1KzdJMnNldVVrSFdUaFRncXNXQUhwNFhs?=
 =?utf-8?B?YW9UWFhjb1RwdTV2MCs2K2lHbGFrWkZoOVltL1NsajJWY05UNEVwclZDNEJM?=
 =?utf-8?B?Tkp4OWFWc1AzeE9wNEVKam9yRnRZNmhPb0tBdGtUa3pibHFKV2xXblBGalNN?=
 =?utf-8?B?bGROWHlldnNMSDhwT2VqdFNWMHZkdktCK29MbllIN3l0TTlYaTFLN3A1WlYz?=
 =?utf-8?B?QWJVQkwrSXpyYUN0U2dsTUI1YTdyb2lqOENEcDFuZjZBRWE3WkJLelNCMm9H?=
 =?utf-8?B?MHo5NzlONDZtamhjWGNtdklCT2pDaVBIQVgxMEY4emJqb2pWaE4wM29hczFt?=
 =?utf-8?B?T1FteFV1WllmeXpLazN1OFE4ay83QlVFb2xzYVRPTS9XTE0rS2o3UWZ6S0di?=
 =?utf-8?B?TWVXV1hQRHR5R2EyVy9EV0YvR1RaMm1CejBpYk5XOHJZajFQNW51SmZUU3NB?=
 =?utf-8?B?anE5UUZScisvaHliVG5FTmlXWWpZQTQxRHBjZlh2eDZJMXpMa1FRcjlWOEJm?=
 =?utf-8?B?S1J0Y2x3dnVWcHVuYzZtRXJyNjJoWlZIR0czWTJoY1l2TjZhKytIRTVCdXJ6?=
 =?utf-8?B?VFNOcmYrb3RXNE1ONXFmR2ZCL1N0bmhqbnREazlrblB2OWhhQnV4UEZBVUpy?=
 =?utf-8?B?VytPV3R0V2NscmFiWVFTdVVZR1dpS2tDRFNuZzV0QjRlSEx5WDR0UEV2MWxI?=
 =?utf-8?B?blJxYXBMUzlJa0VaSkRzY3IrcmRWTTdMZGp0dVNBS2U1R2tTSWRzQlloOEpM?=
 =?utf-8?Q?VJ1UD3d7BihzX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGVWTE9TQi9LaFFIWHVHRGtzT0dBTDExM0RJYllTbEE2cmJRUWZ6ZXNGMHBW?=
 =?utf-8?B?Ym56RitQaTdsZ29PazltWlFrMnlVYVRqQnV5WmFWN0JtTGJuQzNTMlFta3p1?=
 =?utf-8?B?elRqQ0dsamxXeUxYNWpaUkFmTldaL1FjbzRPL3RNWVBHUitOeGxpL0FoeXVM?=
 =?utf-8?B?ZDhpWXhLY2VualdZSlNjUkxGamJzcm9wUWoyMnpMTThySUR5aGVPYzFaczJk?=
 =?utf-8?B?eUFvUUVhUTJUcVQ4VzkxNzFsWW1UTFRmK0ZTTTBOR1JVVEp3L09vZmxLUUVh?=
 =?utf-8?B?Sm02TjNrejJoUXJqTDEydlBMeTZwcElORVZxSkd3Ly8wVzE1c2JBaDhMWWlr?=
 =?utf-8?B?R0plZkJmdHQ5d3hndHBxWlh2WWppaklGM1lYM2NWN3Fib3VMWFZycm5sOFN4?=
 =?utf-8?B?dk84dDRCamlRRVJUN0Irc3gzdlMxOTJ5VjZESjlDUHMrQnhoYyt2V29uRnJi?=
 =?utf-8?B?Nk8xdXlFWUdhTGRVZWRkTU5sbzkvZ1NkSjdiSGRQNDlOby9NRlNacjdhaVJw?=
 =?utf-8?B?SmFtb1R3SDBGdkRKOFdCKzBJVHRGYnd6d2M2dmFGbTR2TWxOVUtjb0dMQjJt?=
 =?utf-8?B?Y1ZFQWtFVFVOREdxb0xrbmViRkd1RDJLK0UxbUJWQUVaZWxJSnlvYXpoeUdo?=
 =?utf-8?B?NE9neTBhUHZqMVRWRXR1NEJGYkxvaFJiV3FSckQvK0xOZC92dzllVGlPV0ly?=
 =?utf-8?B?S25Wdkp4OXpiaVkrb0pnM0RYQS9QRlZucTE2ODZkSW5uT1d1YlpRU1BTWnNr?=
 =?utf-8?B?ZFFIZFBsaEpXcElzL3owbGRtSEF2ZXhjTmREWk5mb1RlMjBBV2IyWmdaME5I?=
 =?utf-8?B?VmxGM2N6VXhwMHRObzRYNDZQODVmNUtPVXVRVEo1RGRyVkZON1B3WTdvNE1x?=
 =?utf-8?B?Zm9zM3QzaHd2ejREdzVhWGFkSEF4b09EbStQaE0rZUZsRFFIQjJpVWdTWUhR?=
 =?utf-8?B?V3Y2WGxVMEpPdnpUZ2I2b01vMEdtdGZvQzZFUjV6dURHTU9UTUxUUmI5aWhu?=
 =?utf-8?B?RExCcy9LbVo1UEdZcWJ5dUxLVTRpYlU2S0FtempoUjUyL212bStQZThqYm9U?=
 =?utf-8?B?TXFuMGhKQTZ1WllzZk5iakFuQ3pJTDd5UmM3emNVUFhNWTVFRnE5cUU5WHAr?=
 =?utf-8?B?MmNCMlBXaW5abktSOGo4NS9McmlYNFJRRjhTc042SHUxN3FKL1NyNFBUa0hF?=
 =?utf-8?B?eVp1YVlwRHJrVEJsMjBWbnkvOUlwcDNsbFpLdyt6SnVTaXplUWRXOEw1M0JH?=
 =?utf-8?B?V09sM2xvWnJlZXVxdHJyeDlwQWVZUHFjSjVBVnlKQ1RlOWl1Tm1LWkFsQTI0?=
 =?utf-8?B?R0llQmJxdm96NXQ4QzJjOEk2a3ZBK0g4Nk9IcFNRMUFCdUxHanFLRHNlY2wy?=
 =?utf-8?B?RUxsN1p3VFF1cVdvOHFwV04yR0pENzB0N3RJa0NSeW5MVEFPcGFnSTIxSWM2?=
 =?utf-8?B?Wko4OFd1KzIwZ3Y4ZG1XWkhidDFKRVNSSlJVUHgzZjVPeDdYcUdLZ3M1Sk1m?=
 =?utf-8?B?QktmQ1JLTEZuWTJPQXg3cFV4UTAzenFrQXRSYlhoZ252NlNHbTIra1dzcC93?=
 =?utf-8?B?aHkrKzNoYit5VFZKQS9rbXFxMXNuVVlKcU5UNWNtaWNpZXN2VklJdncyOHJ5?=
 =?utf-8?B?VldaNEdPY0VGOWlLZTVoNzFEOHdXOWVEcTdVdGkrcXVVNW13Z2h1Q1BXOGJF?=
 =?utf-8?B?N0E1QjVnK1p6a3EyOEF5dFdDVGpNVHdMNTIwUHVMbUR1MThPV1BGTHFlMjVh?=
 =?utf-8?B?ZXE5ejc1VndHc3BVQUh3V09CSUNFZmwyMTZvY2NYM1lvZ2JMRkFaa2VqOEZz?=
 =?utf-8?B?N1RuRzFnOWMxUzBEY3lEeHVaQ01QZ3crSXVTeTNqNmxLcllwWXpUNDNUNGVj?=
 =?utf-8?B?VE4vdUxNenVEK2hYVEhRaVA2ZCt3NDNpTlNqM1VQZ2J3ajNQbVFSbDNYNHht?=
 =?utf-8?B?MkpseW9pa3hXUnFWaGNxNnVnYnFpTEF4Rnp2NEgwdVNINDArcWhRSkYxR24v?=
 =?utf-8?B?S05nNFI4d0xTdEhwdFZJRVFuWW9lTzMvRXdhbXJPcFBKTGNQNWtzRExjRTV1?=
 =?utf-8?B?NnJGOEpCWEU3Y2J6NDBuT2d0M2JzbXFVTWZ2STV3Q3VqMjdyN1crYUtkQ0gw?=
 =?utf-8?Q?Bo1zBtJu3w5MLX8UN1vMUETw/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 383a5efd-0310-4bd6-d421-08dd39833a63
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 18:49:54.1031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mo2VKLCqJj4uktOM9LNkD4TAr9yatijvXF+ySh6wtrOLIpd8C4SR6oXGrHYNAho/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8880
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

Am 20.01.25 um 18:13 schrieb Danilo Krummrich:
> On Mon, Jan 20, 2025 at 04:52:37PM +0000, Tvrtko Ursulin wrote:
>> Idea is to add a helper for popping jobs from the entity with the goal
>> of making amdgpu use it in the next patch. That way amdgpu will decouple
>> itself a tiny bit more from scheduler implementation details.
> I object to adding this function if it's *only* used for something that looks
> like an abuse of the API by amdgpu. Let's not make that more convenient.

Completely agree. Since when do we have that?

I don't remember agreeing to anything which messes so badly with 
scheduler internals.

Regards,
Christian.

>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c |  2 +-
>>   include/drm/gpu_scheduler.h              | 21 +++++++++++++++++++++
>>   2 files changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 69bcf0e99d57..7c0d266a89ef 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -255,7 +255,7 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>>   	/* The entity is guaranteed to not be used by the scheduler */
>>   	prev = rcu_dereference_check(entity->last_scheduled, true);
>>   	dma_fence_get(prev);
>> -	while ((job = to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
>> +	while ((job = __drm_sched_entity_pop_job(entity))) {
>>   		struct drm_sched_fence *s_fence = job->s_fence;
>>   
>>   		dma_fence_get(&s_fence->finished);
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index a0ff08123f07..092242f2464f 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -611,6 +611,27 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>>   bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>>   int drm_sched_entity_error(struct drm_sched_entity *entity);
>>   
>> +/**
>> + * __drm_sched_entity_pop_job - Low level helper for popping queued jobs
>> + *
>> + * @entity: scheduler entity
>> + *
>> + * Low level helper for popping queued jobs. Drivers should not use it.
>> + *
>> + * Returns the job dequeued or NULL.
>> + */
>> +static inline struct drm_sched_job *
>> +__drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>> +{
>> +	struct spsc_node *node;
>> +
>> +	node = spsc_queue_pop(&entity->job_queue);
>> +	if (!node)
>> +		return NULL;
>> +
>> +	return container_of(node, struct drm_sched_job, queue_node);
>> +}
>> +
>>   struct drm_sched_fence *drm_sched_fence_alloc(
>>   	struct drm_sched_entity *s_entity, void *owner);
>>   void drm_sched_fence_init(struct drm_sched_fence *fence,
>> -- 
>> 2.47.1
>>

