Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35FBC5293E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:58:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1C810E73D;
	Wed, 12 Nov 2025 13:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="owblRJuR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013030.outbound.protection.outlook.com
 [40.93.196.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408AB10E73D;
 Wed, 12 Nov 2025 13:58:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRHpc1O8sEaFjpFozPp7/jUJPe3xVRM/eWdLrAVvGUw97Fddy6KYo89FBlYUfTAPK+yAbSjrlGDmyUv+P0j2ELq0OCbRRy2VgksabWJTOfy4rfI0i3kG7RAHS8azsP/LJhzBDhM5xlRw3aWpGlpxakKS1bky3vQVhRsd8UDrT3ILT4ATWCMluz9QsqMs7UABmNhEPfNeVVGNJgrl8HoPjnDaxWsWL7ZqS5l6mRkl0G1KZNMS3eN4LrABbU0m++DS9paRoY3FiON4UFOZXrlaYw49zHQeD26zTAbuxqKXUvNVugcTqEKKNJgJn7T7jZ5B178EdafxH9McgH0Q268VTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esZbCv2qGwlQdX1g8at9cgEl6xdVmuO0oA6dk20COrw=;
 b=dwebSvLpY/rAegm++gOnTXXWSVw2WZoUtujhRedMes1ZdseIQ+ME+m7NGhIC3gBX5tn9W4zh5wZkLbHazrHUwcfMxjQ9oR3YzhSI++wvD5Nl7bEr4ZtMc1Z3lSeAXuRwXte3PYyr80vlsFKtXG5HBgPMJ3p45F+S0Lw5dd672/07rnq646JvyTazFzGM3AakYnTQDNt1opXm4nR9LB8qf8KoKKNX7An08yhVAgk/Rh0s5MzNgQSVu7F6tba7TJy/crPELZEGen/8jdnCT1JUzhVyGySfueBn5+okeNkPsb3J+S5rBV/HDaGHQ/uUEbE2xbjCZq43G5qXTCFo6fPODw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esZbCv2qGwlQdX1g8at9cgEl6xdVmuO0oA6dk20COrw=;
 b=owblRJuR6ADjEieDMrTzVJZ4D1m2u4NKsT62lQ8bsG22ECiVfxJKhXdrh6yfypTiyBCXys6sBgd8IVu8yGsmVP/cTTX5KH10ayHHLQbEXWNN+WpnRuSO5zubdSFyBUmc4QNUFQEEWTyRibUZCm19OP2DkNUc21j7/PGrPSygk6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB7006.namprd12.prod.outlook.com (2603:10b6:a03:486::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 13:58:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:58:27 +0000
Message-ID: <34d27804-5db1-48a9-8bbf-e09e19abbc46@amd.com>
Date: Wed, 12 Nov 2025 14:58:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/20] drm/sched: use inline locks for the drm-sched-fence
To: phasta@kernel.org, Tvrtko Ursulin <tursulin@ursulin.net>,
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, airlied@gmail.com,
 felix.kuehling@amd.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-10-christian.koenig@amd.com>
 <21cbf337-45be-4418-b9dc-d3e2034b4962@ursulin.net>
 <6f7b62fa37650c0a1bfdfe77e2b7b9e9a19eb234.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <6f7b62fa37650c0a1bfdfe77e2b7b9e9a19eb234.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: a10d9489-3a3d-41ad-b619-08de21f38d43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGNIOHJZNDVkNXZrcXFBTE9ZT1lyeE92RFdUdCtPd3NFc2hSQVo0RjgrUTIx?=
 =?utf-8?B?RWZrQ2tOSDdqU3hTZjgrb3ZjL2tWWlliQjYwbWdBZU5uSGRqVnpMYS9NZTZk?=
 =?utf-8?B?VEQwYzRSV25LZTgyQzYyS1lNbnV1b0tHeGZOUnVITDlMNG9ZaE9JTzdXNnFj?=
 =?utf-8?B?OW1YRnBXRFhUb01WaFh5bW1OaFZ2Tkp4VXZlaHV2Ni9namJOM2xhYy9sZC84?=
 =?utf-8?B?cTlLaGwrc1E0Zk5vdzZwL1EybityMklDc3B6dk9tYU41VXgxcERyZk00Y29C?=
 =?utf-8?B?YStLbFJ3d3BDVXNrQjJ3Kzc1ODM4ZE1oODMzbGdzVjhQRFExaEFZUUNHVDQ2?=
 =?utf-8?B?WDFWSFdiSW5wcVhEaHF5T29keVRFcm9nTkhaZmZrTGt5Z3RzTHNnaWY3NzJF?=
 =?utf-8?B?VHJCVGlTbFpGWk9weFpnVEwzZTJYMnZxemxJNlJ6Sm9DS082ZmpsVTNuMUNw?=
 =?utf-8?B?VUJ6RGN0SDcvY1NDN0U0aXQ1Y2tLMm10cU9Fb2lxWUJQQTk2OXVOUGlZVmNy?=
 =?utf-8?B?dFpTLzl1VG9yQjNTUG50SU1NcGQ2R05nVnRDVUNUcWZtbFdVMCt4UWRuOUZT?=
 =?utf-8?B?aWhaYTg1QkcvRkdXWnhncmpvYlNlV2dVY2FyeGF6YXY5MXVOenE1MWFaZFla?=
 =?utf-8?B?MFJvMmhYd0tWTEVua0puS1hlUnB1WjBNeEM3eUcrUjZnNVVySHg0cEt2RWZh?=
 =?utf-8?B?RjFHN3diRnAvOGVUYmJ4b1NQQ2MxOFljUVhVQVdSanpFa1ZZdEVwUjlWM0hh?=
 =?utf-8?B?Q0FKOVdBTDUzMG4vNjUyTnhZREpsS1MvM1VpNGNkd1dGNVVtbHNLUkllU1Zy?=
 =?utf-8?B?RmRJOG9FKyt1dUQ2Rkp3dDl3M044MGkvV3BDc1Q3NzhPNWxqQ0toamhXRXVz?=
 =?utf-8?B?MFBSbzFRcEEzUlFYZVQrbm4wZE1nUGlxenBQOHRGMjFFbzNlQ3F6WDNFQURl?=
 =?utf-8?B?SXFQbitQdTA3WkVwcEd6UURNcWpuRHBVbGtSN2QvMGR4bVFtdUNEU0FCK2xa?=
 =?utf-8?B?Wk02cFA0UjVvaTJBV2s1c0p3UlQxRXNTNWhxWUYyVTVQaXJIWmpyQklHNUJL?=
 =?utf-8?B?bU9yNkM5VnpMNkpzbzY4V2k4QkRGZ2pqZWh2azFlZGV1UG9SV2w2VU9IRkRw?=
 =?utf-8?B?SDRjNkNkd0ovQ2NXcXVXYVRIUmVCK3pRT2NtazVVK2tMZ3RZbWdUWWFQcTBs?=
 =?utf-8?B?M1NxS2tWT2RPUVdqeGFFNXF4bkdDUWFtSE1ZRStYN3VzRjR5N0dEeGJkTDNW?=
 =?utf-8?B?STkzMVpGTXhtcm5rc1d2T2lwL1VqR1VoVVRTMjJNdis5L2VWRndzaDltSmtE?=
 =?utf-8?B?R3VxMG9QT1ZtajF1MzBaeDhUdXFqZkhmdlc5azNKRWtmNkdVVG9lMUVwZk9q?=
 =?utf-8?B?aVd0c2czK1hrcFdqdlVYZEk3bDh2TVM2amR4S3FoSmxpRWw2ZzI4QmFuVTMx?=
 =?utf-8?B?eFR6dGZKT2FpUm9abEdVQkxpQXFSNmJWb3pOczhtcHdxMGJkWWJiNm9Vd05w?=
 =?utf-8?B?SkZwRm1jOEpqazE4OFhoWTdhSkpLZHY3SHBPUG5uTEYzYmxLZzJtRTdTK21a?=
 =?utf-8?B?K0czTStmS1QvejJCWFA4Z1ludXJMekVValEyNDIzSVN0Vnk0YmdtKzdKVUQ2?=
 =?utf-8?B?N0pncDd0S2JnRXczaEVBRGx0MS9zbCs0VWFXbDFURzZHdlZGQ21CVlptRHpo?=
 =?utf-8?B?UWhpZlhPelZQMlV5L2loRjlvTERLQ0N6cktRc2pEZHFKOXlIS2g1VXdMWVkz?=
 =?utf-8?B?eVc2TnhpWE5NT0llUnVEU1VFQ3BEVlcxNVd5anlUUDZrMU1ycUM5TmttbTdG?=
 =?utf-8?B?K0dMT2VoVGNNYTBIVDdMaTBZZjNyVWlaTm1tRHBiSm8vYnIybnNiOFZrUEYy?=
 =?utf-8?B?QkdwZTgrTnFBUTB0YklmUSsrWlliVnplczlBY3BPdzYwTU5IMllIeEp3WGpx?=
 =?utf-8?Q?UE1SbpDySx10HDb3qC4KgWaA3h+SgEdn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWgwc1M2cERkakZCdVJwaHlwcUszaENWMEZQN3NaNWV4emV0U3prcnpSTUp0?=
 =?utf-8?B?N3JVcTY5QjE5czBMQmhlUEhMS2xKaHZBejhOUWNXNi9HNXQ2a042b242aThY?=
 =?utf-8?B?M08rVEJSdllrRlpQMEFpK2dUUzZhaE1IY3FybTRrRmJEVTk0cFZWakpKT2t6?=
 =?utf-8?B?MVZkSi9zdU9YcUUyMXhwZDFxdktkbnNyajNNaVcwWi9jNUdOZGMzMEVydWZF?=
 =?utf-8?B?alBsT1ZFR3FqU2RydWJzY0xSUWhodmRqeXdKUnk5eEJEbjhqamFYMEwrems3?=
 =?utf-8?B?U0RBZFVJd1prVDhyVlV5eGRGSzk0SWR6RDRnL1c5dWNwWDV6OWpSUFFUY3JG?=
 =?utf-8?B?MHRFdDhFYkdZZ3Q5d1JPaEhueFFlcm1zZ2VtVGpjMUxmRGFSQjdxZUZOT1Zp?=
 =?utf-8?B?d1ZEM2lnang5SVZOWFFLUXJ0aloyMm1ZYzdnU0lwZlgyOHZiS1JSeWRjZjcx?=
 =?utf-8?B?RHJ3L2V2NTlYSWg1SzZYVFZya250R1U5OSs3R205QTY4cDQzZmhNSTVweVJh?=
 =?utf-8?B?YThSV2hKSHdQUVkwajNoQ3VORmRuZEZtc1NhY2x3cWtBSWY5Q2c4YW9wL245?=
 =?utf-8?B?S0VKZTFlK3FFZm43V3JjWTZDYVhsR1NtTlBZU0laVzNTRlMrcEVjSGJBOVlL?=
 =?utf-8?B?eStGK3YvMWxHQWRZWnZnT3U2ZGNoc1ZDOVNBT2V3VDNJZllyRlBUODlsZDBp?=
 =?utf-8?B?ZmpkelJ3TzJoYUJXcEo2VE9WV2k0ay8xU3Z1ZXFCUFN5ais1Z3l4ZFNQbzF5?=
 =?utf-8?B?cEEyaDZmeHlzVE9YbkFuSEdVV3dKSDdYWmkxVkczS1VIdHl0TXQyemdTalpj?=
 =?utf-8?B?am9TSVJQKzFQb2h6OFF3dVJpYjVrZmhwYXNReG5UalRrSVBsd1ZzV0NnRDBv?=
 =?utf-8?B?aDBqcHMzdU83OGtmMDBRWXFVc2ZGdTVlclV2RTcrSXNLNFNMbDV0WDdRSVVX?=
 =?utf-8?B?aUFRRGJVYkZBR2t4NTNmcE5qN2NrTzAyRzRyaUNkbHRUSENhT0xhUFFUbk9U?=
 =?utf-8?B?VC93WTJwUGNrYldpQWlPMko0cDd6bVp1eXdxZ0Q5RE9LQmpWLy92WlZVMGtr?=
 =?utf-8?B?RFdGOEs2Z09pbkZGNnp5R1dXZGdNOEZ6M0d0Q1VtMGh0czZlbUg1dnU4M2Y5?=
 =?utf-8?B?WklnQmI2TXp2NEhJNTc4MGJ0NnFYeGRYMEtPVU1DZnEwbUFuNlJqMzQrVG5w?=
 =?utf-8?B?SWxZbmlNQ3JLR1FTRUhQM2VuZXR0RUlyMTVYNHVGNU9rbkNKazc3VmEyRlFD?=
 =?utf-8?B?K0h4UTBGaWJ1T1JLNnB5dG1HNll4RDlhQW1WdUxkc21zSTlxNHNXSUFZZkpi?=
 =?utf-8?B?VEpWU2tFaXIwU2c5M3RDQ21Iby9ac0E2NzJpYmhyS0RZcHkwTmo3WHJSbkNF?=
 =?utf-8?B?VU1vYSsxZ0VQa2FtamVUMG5Vb1k3WVZscVZKRDRHMGtJOHFaV1Vpemt3WmNO?=
 =?utf-8?B?V1Z3NnlEakQwRmVubUNydjM2NGtrVVZjN3VqYmIxSTVyQUs4VHJpYUV3dlJB?=
 =?utf-8?B?ejdlaDd0czByMER5Y0FheHE3SEFKcFJSSGRwRElvcVQzMlRGeXNodWxncGtI?=
 =?utf-8?B?ZEpWMnNUY3hvdTkrMjVwaW1BV2w5cS9DbGlKN09GYSswOSthVmFhclRXNTJ1?=
 =?utf-8?B?dGhJN2VsbzMwcGV5ZFdEZEhkai9uN0JGR1d6V3RUdUpINkJwMHJ4SEcyb2ZQ?=
 =?utf-8?B?ZFMrWko4RVpubDY3VnZJUGxEajVHbVcveTM5dE5HUGVQZkpvV0hablJJZ0pC?=
 =?utf-8?B?STEwZDNLOGpBamMrU1k5Z0NqdlRTV1hkUUkzZ0hZWEErdUxTMVduMHo2UXpP?=
 =?utf-8?B?WmhCNUVmK3M0NjVaSjdvRGtKcUcrRU5GZ0xVZVJvSklBWGdsMHNHQU9KVmlo?=
 =?utf-8?B?aEUyUlpIcEJVaFgwdHNIc2E0a2dWdEVKUmlpeWMzQ2NpQTkzVnAwUGkvYUF5?=
 =?utf-8?B?UFoxL0ZoV3NNWUZuZkovWERDMm5UWDl1d0JjaGhUaXRJWUwxUXBtOXMycllH?=
 =?utf-8?B?MHJ5azJ0RnNmVXNtdUVFTVNPWFRIWEtRZE91M1pNa2J1UTlxYzMrVUkrRFY3?=
 =?utf-8?B?eEk2UjQxeDB2dEdXUTYyZ3Q0NUJLaXpVWmlxSDVpTW85WTNsNENBU1l0M241?=
 =?utf-8?Q?FeZJwkpTmXPZEq3EIUAQHcAZj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a10d9489-3a3d-41ad-b619-08de21f38d43
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:58:26.9808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10JEbKcocda4GQvAIdRcCn29vDit0abKXUwXlTZRfjXkfEw9npjvqyWBrJQGzkCC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7006
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

On 11/7/25 09:33, Philipp Stanner wrote:
> On Tue, 2025-11-04 at 15:12 +0000, Tvrtko Ursulin wrote:
>>
>> On 31/10/2025 13:16, Christian König wrote:
>>> Just as proof of concept and minor cleanup.
> 
> That's by the way why I'm asking whether this series is intended as an
> RFC.
> 
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_fence.c | 11 +++++------
>>>   include/drm/gpu_scheduler.h             |  4 ----
>>>   2 files changed, 5 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>> index 9391d6f0dc01..7a94e03341cb 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>> @@ -156,19 +156,19 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>>>   	struct dma_fence *parent;
>>>   	unsigned long flags;
>>>   
>>> -	spin_lock_irqsave(&fence->lock, flags);
>>> +	dma_fence_lock(f, flags);
>>
>> Moving to dma_fence_lock should either be a separate patch or squashed 
>> into the one which converts many other drivers. Even a separate patch
>> before that previous patch would be better.
> 
> Yes. +1

Now that I got what was meant here I agree as well.

> 
>>
>> Naming wise, I however still think dma_fence_lock_irqsave would probably 
>> be better to stick with the same pattern everyone is so used too.
> 
> I also think this would be better. Who knows, one day maybe someone
> really wants a lock that definitely must not be irqsave for some
> reason, and then the naming pattern would completely break.

Already done.

> 
>>>
>>>
> 
> […]
> 
>>> @@ -230,9 +229,9 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>>>   	fence->sched = entity->rq->sched;
>>>   	seq = atomic_inc_return(&entity->fence_seq);
>>>   	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>>> -		       &fence->lock, entity->fence_context, seq);
>>> +		       NULL, entity->fence_context, seq);
>>>   	dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
>>> -		       &fence->lock, entity->fence_context + 1, seq);
>>> +		       NULL, entity->fence_context + 1, seq);
>>>   }
> 
> Do we agree that there is no benefit in porting the scheduler to the
> non-shared spinlock?

It saves something like 4 bytes :)

> 
> If so, I really prefer to not do it.

k, going to drop it. On the other hand if I'm not completely mistaken it slightly reduces the complexity.

Regards,
Christian.

> 
> 
> P.

