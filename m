Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D622D8D3962
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 16:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B5B10E498;
	Wed, 29 May 2024 14:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uXHh2yoK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8291310E4C2;
 Wed, 29 May 2024 14:34:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNROEAIl5I0JG3o9xzGYgMrvlZhodlrfjLrOES3Sh7lBNEeXF/jXlu3q5ycHsoGB31eXjeyvnDJI4eAw55FZW6Utjqp95mOo5eJLW0dVN5Ct7fHYUz+1DDG73GB5epjw1sV+C+26RxkKJOFG9yoU5XhJb3zIItMjT+SFSZi2qfZC8KCXBsmyyWGZtPsCPAMKegOZS7k5+DjdpWcHUDNiXeZWhzInsDAO/z57maMnDtpH2WhNlKU+Ekj7vInM2SoCB1S9TyNrX2glAHYPyiyc/WZMdxSvxT6XIU8WDy/gtVeYWPT3k+NtrV4GfyX1PfpkDtr9ieOiVj9lakA/NzeLuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D10IUCQ1GSE7YexWkBkM3tCRCfWCYNebXV4IvtBqMVo=;
 b=k6YBOk6c5vjGpUCTrvXqahIGtw/ZTBPOWcNRonuZn/ieUtANzx79l+dIveFiq+ieLMeQlJgPgS+1+WsUX47qUHj67RJTWj2ONDhSYILu3RR4FwibN+shMeKgZ/Bxr2ZQ+ijk4qfj1MAj6fqYf/NH9Uo+a7KcI/Jo4DqGyZvXi9WyuIpqvFOTEnWsPKZQJEgWeIu/nXfr1sfGg3cA/fxdy6wbuJJOlzIV3qj6Zr5DQN1JiCMsGrVkS7NF1FSfqH8K9tN21qilGNIKOUaauHZ/N10pihVWLThXHnQUsY+lD6c1Ri9oWIldvqHWQoblFWshcTbmOpBM7m9TyINniOIxdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D10IUCQ1GSE7YexWkBkM3tCRCfWCYNebXV4IvtBqMVo=;
 b=uXHh2yoK3kxOrB8PtjV/2SeeSGmvcpEJifdx8hxBvD8zhJHar/aJV8Vgl7PLEe77nqoprbhbbMBMMKCSizDE9lUWyc1iurLuqmNEJJIvdPoNJ+47qQj001oR1T7oSTwxh1N0qalfMmcEfvAyxky/Wa39+pvv/HdIgwtyvFyxZzM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB6812.namprd12.prod.outlook.com (2603:10b6:510:1b6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Wed, 29 May
 2024 14:34:42 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 14:34:42 +0000
Message-ID: <cff85fde-01d5-4487-ba4d-39c3b787a62b@amd.com>
Date: Wed, 29 May 2024 09:34:34 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/client: Detect when ACPI lid is closed during
 initialization
To: Alex Deucher <alexdeucher@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, Chris Bainbridge <chris.bainbridge@gmail.com>,
 hughsient@gmail.com
References: <20240528210319.1242-1-mario.limonciello@amd.com>
 <CADnq5_OzPT1MVnsqXs2vjr1L2_6jeM6x7jgs4ZtYpNzdDHM6uA@mail.gmail.com>
 <87r0dkiv4o.fsf@intel.com>
 <CADnq5_NiJ9a7uYPGj9iuePTRBFKGhhFA6G982bxO2kHe-_5ASA@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CADnq5_NiJ9a7uYPGj9iuePTRBFKGhhFA6G982bxO2kHe-_5ASA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::19) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: fc73841d-ea1f-4952-a495-08dc7fec7a77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|7416005|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWFUZVBkWnZjRWlRWUtFY3hudUV6MkFOd1ZSTEhoc2RxODdESjhwUWRUNXE0?=
 =?utf-8?B?RTRHaUxJeWxqdnV3R245UjJYZXhTcEpyWGNyTlhsNHMybFEyOEtyYWJWN1pU?=
 =?utf-8?B?c1BTVmZoWGN5UGFPcjdESnNyRU5aQU9jV1RhdmF4R0tidDBVa3VKM1EvdGVX?=
 =?utf-8?B?b2VRd0FFV2xKMmEwdUhwZXNkZVJTano3YmVLWktDdzNhcnVqekRheThPMVVD?=
 =?utf-8?B?dFN0Q094eU9Gai9zNm1INWp2V0ZWMkswUUM2MXpEdlJpTzNvN3NwRU1oS3Fo?=
 =?utf-8?B?eTRlWFloMFBYS2pHY3dhMW9SVDVoazJqRW5xSVhEaldWQTY3Z3ErdWhjcytX?=
 =?utf-8?B?dVlHUTQ4Q09raUdSNGRGRXNkVEJyTjZuVHJuSDkyZVY1cEk4aGtmcy9RQXFC?=
 =?utf-8?B?R04xOGU1bUdHRm9yS2poREZ2WkxyWGJibk5zWTdOUGxjS25TOTFkU2gzTTRF?=
 =?utf-8?B?TytOUldLUXpuSjEzTWwrTlVzS2lIdFV3UXJPdlNZTjhlSkhMTlhxelBrbm8z?=
 =?utf-8?B?QS9OU1ZTUnZiOGd4UDFOaXVQSWZKMTl5WUc4UnVLZENyMCsweXpyeG5BV05N?=
 =?utf-8?B?M25yNVEzWFNLb1NZVCtNQ2QyQ2RFdTRWN2JJWm1lOUdoakhtZG5qMHV6cS9y?=
 =?utf-8?B?WnlGVVNBQWZaRHRZNzNSay92ZVNwQnBnZmZSUWRPTmkwMGorb0FReDlKak44?=
 =?utf-8?B?REJWdVZLTVBIMjF6ck50NTRJYTc3MXNSVFh5SE9UVituOVBkUzlFanczODFO?=
 =?utf-8?B?cktHQndWT3p5eFB0MTMwaEdxVDBPRzc4M29vVHdtdFdkbE9RZ2cxc1V6a1ZU?=
 =?utf-8?B?TVczd3g3bEdaYkh4Z01tcUl6Zzh0dHJrbTR5YzltTW1jQ3lDZFlXemxqUnJ0?=
 =?utf-8?B?RzM3bFlTbnh5Z2o5L3htdGVKQnNOdjNjZVF5dzVDSVZKZHRrdzZGTUZPeFE3?=
 =?utf-8?B?M1prZ1BXVWtNNiszdWJmcE8zMEs5alBMVzh4YXBKOFlidWRZRmt1VVU2TzJ0?=
 =?utf-8?B?Qi9xa3o3bTlBZ2RpOHljUHNxaUxrVGZZeFVEMGp3aHJsckM2M3UxOEdDYi9Q?=
 =?utf-8?B?YWxGc2l5ZHYxTHdocUJ6aUhFOUxSQnpQZm5VTHVWbUN1Z1BiWDhMdlVleThl?=
 =?utf-8?B?R1dSS05ndzhBUGtpT2tUREZ6RUJad2wxUTExbnpDSU9aWlRWdnFuN3YvT2d6?=
 =?utf-8?B?ZkgvSExja1M5VXlCYnBFdmVzTlo2K3JHMDlSVmNXK3kwS0RvYVhLZGcxMlFW?=
 =?utf-8?B?WUlnZVVlM1Y1RnFTYmxmeU9lVnI2NGxIc0w4ajUxVW5UZmdyemFoOEFaYW1O?=
 =?utf-8?B?SFZLWE1QNE5rM3JnUVZFaVorQlFtM0x5SjJvRENQcTRLRXB5YkFjMWN4eDdX?=
 =?utf-8?B?WW1EdndzVXFhMk52ZVptNmNMRFU5MWFHT01KeFVPcVNOclRBc2cyT2NockdG?=
 =?utf-8?B?dVErRHdZRnl6TDR1WmhuQ25lQVhyalNnN1dJM01DWmxDTHA1aFYxZXhDZllK?=
 =?utf-8?B?MzFZcC9CeDZTQWxvUTFOZ05kWXg2ckR2YzhEUnpGQ01lSXUwbk02ckMxWUE3?=
 =?utf-8?B?VnBmL2hseDNheVhDZjVOTDlNSzdIQ2tFZzdBcXQ5N1M2eUtrVEZROXNPK3Vm?=
 =?utf-8?B?eWxJY0RZSVoyaE5sNnhIcUNrbDRnWnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(7416005)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2VvSUZSK3hLQWZCNGlPQjBEOTUydER4bUZ3bk5NNXZQeW1MRnU4aTNhSnNZ?=
 =?utf-8?B?Q2xKbzVjbzJmVnREVjZYWHFnb0RXdENpMGh5TjAwY2UxYmRLcjAzMDByYldz?=
 =?utf-8?B?OVhOZ0tUdmVSbUt0YlBKSnJXbFVGZFNZcHlPQU5WMVZxU2lZenBMeFRTSFhk?=
 =?utf-8?B?WkxVMXU3OVpXMVVlai9WSWZWeWw3N01BRTJ2a1oxVWFqUC8rT3hsODNpN0k5?=
 =?utf-8?B?cnRTTkw4SWQ3T2VscmV2YlFRcTNTVm85UTZwczVwMXQ3U3YxTERZRzcwakpz?=
 =?utf-8?B?bHo5VytzOWJQVkhIN3lQaDBUbVdabW5vdlZKcUlpbG9pUW5wWXFyNGhlOGFI?=
 =?utf-8?B?UENaeCttTGtsc204bHZ2RjdlSU4yR1diTmdZLzUwUjBVcGY1STZNRjRDdjNZ?=
 =?utf-8?B?bWw1NmhISTVZZmdFWGhLRkMyd2ppUGN1Zkx6aE5kY2xzUEpGeVZsT1czN1ZO?=
 =?utf-8?B?L0JQMi9yWWZscEtBNWxKcllVN0RIU2pwV0ZscDE4emFqNEFuamFUUlNjYXRv?=
 =?utf-8?B?YUEwOER5UCsrOHg0aUhzQW1tWFBCNjdEKytPV01ZZFMxZWZSTUpieEdmZU9J?=
 =?utf-8?B?Z1VoZUZGelVWTm1YWmk5MStpNVBvMXFWNVdQRTRMOTlVWUoyQkdtL1k5V2dj?=
 =?utf-8?B?cFU2MEdYRi9xV0xqSk5jdm5xNng5eHNqeFQrT3g3RjFoRS9mY3hRQk80WGsr?=
 =?utf-8?B?aEp4K2s2M0tBd0hQS1drd0x2OExqTW9IbVZHWDh2WTVBSmlacVNFYWFMNlhU?=
 =?utf-8?B?ZlM5UE5LaERVSEdUZUFmUTZvRXRJMVYrbDV2eDBueFFhNitIQ3Y5QTVOTm05?=
 =?utf-8?B?SUV6amJ3aHZsWXhETmEydHdlclFXWHpadlhrell3SEUwZGg1ak91RWxGOGo1?=
 =?utf-8?B?SFl6bEhCNlJWOEdxU3JjSXVNUE1JWGxPS2hYbkgzYnZkSGh2QlZOdXBERXN4?=
 =?utf-8?B?L0xUMDdkYXYwWnhYcTVlc1ZzajJqbzg1UXJzZzFZdEMyTkxMRWpKRElKVW9I?=
 =?utf-8?B?dTZMbURtZkhwbE9IdGRzMG5zYXF6dy9wMHRqK2t4alRVbUJyUGNDV2s5dXlH?=
 =?utf-8?B?M05Rb0QrRzVyVDEzbHUzM0YwaGlHVFh5QjRqbmFHV05SbWx1SHFMWWxRQU1O?=
 =?utf-8?B?V3ozVHdOSFN6cTBBUXIxcTJXSERsa3lwcFhFcVpsb2theHRQREtrWFNXdGph?=
 =?utf-8?B?cjlSbkREcmJaTGRiV08rcXlZZW43SlMxYU0vWmlxWXhmenN0aW5IQU8ycXRz?=
 =?utf-8?B?TERsOFZxVFdvOVNoazV0U0NsY3JwYmNaS09mZTc0ZFVQNEFZUjVwcEtOTHh0?=
 =?utf-8?B?bVFpT1lWUlFBZGV1SjhNVWZ5R1dDVTlzNUs3QkoyS1VEOGpIZCtZcTZGMzNB?=
 =?utf-8?B?b2piamwzdGZjajFOTjlvNlk4OE42OXpIRDViYXFQQmc4OUpNU2FFcDEwSjFw?=
 =?utf-8?B?NTh3K3lKYmFDQThIWmVXZERrdFZpb0xCaCszQWtLaU5FbHRuVlV3TDV4KzNp?=
 =?utf-8?B?VVlOOXI1K2xVTXI3OVNBU0FXZDJFYkMzeW5qVGx2bWVoVGwwMklBYm5iM3FI?=
 =?utf-8?B?a1FlSXVOSEY3d3dDek9UZFlFTHNxeUkvNmM3ell0UWZBREJmUEpNdnNJS1Ez?=
 =?utf-8?B?cTRkM1NUVklidzM0T2NSL29DdjBTbGJqYXhiQW5jWjFySXVoRVl6Um94dDNE?=
 =?utf-8?B?alVDLytienNrcGx1bWw1aVNXY2FFdWZ3UlJjV2pVQy9mZ3QvR043NXF0Rk5w?=
 =?utf-8?B?elZQbHpJK1pBOUlQY2VIeGNkMmVHeVJyc2U1anFteDlCWWNLa1lwM0l4NVor?=
 =?utf-8?B?SzJmcGpnZm1kSzk1Q1Q5SjJYTE5oeFRZek1sSUxMQ1VQOGV4ZFJ3endlZlZt?=
 =?utf-8?B?eERPWmllZGNER1dwY0xSeUQzanRXZEozSmRhZmZ3eW1ieGtSbS9TL05Rc1dk?=
 =?utf-8?B?QXMvVmpZSWpyL2F0TXpUL3huRThKMVlLQVZteEV6M1dJa095TGtmUWtQOGM1?=
 =?utf-8?B?S0tZRnNrdlhYcDVmRlF6QktFUzZpd2Rzcm5aTUJEY1F3K2tpMHlUcks2R1JX?=
 =?utf-8?B?Nmx2akVzZUY3N0JLNnlvT2lGSzZkR1pZYUlwU1E0dWV0Vkk3UEFQbUZNay84?=
 =?utf-8?Q?0S2UNmHsNaoy0OYs8xEszsnc7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc73841d-ea1f-4952-a495-08dc7fec7a77
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 14:34:42.4835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQ7PdDPV8fCg4MBC6MdERioxopvfvhH77yoy22kNDw6mcfpyexAtN0REmnKDCQqoxznrpc3/pNmSXqJU1H3uIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6812
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

On 5/29/2024 08:55, Alex Deucher wrote:
> On Wed, May 29, 2024 at 9:51 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>
>> On Wed, 29 May 2024, Alex Deucher <alexdeucher@gmail.com> wrote:
>>> On Tue, May 28, 2024 at 5:03 PM Mario Limonciello
>>> <mario.limonciello@amd.com> wrote:
>>>>
>>>> If the lid on a laptop is closed when eDP connectors are populated
>>>> then it remains enabled when the initial framebuffer configuration
>>>> is built.
>>>>
>>>> When creating the initial framebuffer configuration detect the ACPI
>>>> lid status and if it's closed disable any eDP connectors.
>>>>
>>>> Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3349
>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>
>>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>>>
>>> Do you have drm-misc access or do you need someone to apply this for you?
>>
>> I've bounced this to intel-gfx and intel-xe lists to get CI testing. I'd
>> appreciate holding off on merging until we have results.
> 
> Sure.

Thanks for the review and pushing it to CI testing infra.

I don't have any drm-misc access so if everything looks good then one of 
you guys please merge it for me.

Thanks!

> 
> Alex
> 
>>
>> Thanks,
>> Jani.
>>
>>>
>>> Alex
>>>
>>>> ---
>>>> Cc: hughsient@gmail.com
>>>> v1->v2:
>>>>   * Match LVDS as well
>>>> ---
>>>>   drivers/gpu/drm/drm_client_modeset.c | 30 ++++++++++++++++++++++++++++
>>>>   1 file changed, 30 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
>>>> index 31af5cf37a09..0b0411086e76 100644
>>>> --- a/drivers/gpu/drm/drm_client_modeset.c
>>>> +++ b/drivers/gpu/drm/drm_client_modeset.c
>>>> @@ -8,6 +8,7 @@
>>>>    */
>>>>
>>>>   #include "drm/drm_modeset_lock.h"
>>>> +#include <acpi/button.h>
>>>>   #include <linux/module.h>
>>>>   #include <linux/mutex.h>
>>>>   #include <linux/slab.h>
>>>> @@ -257,6 +258,34 @@ static void drm_client_connectors_enabled(struct drm_connector **connectors,
>>>>                  enabled[i] = drm_connector_enabled(connectors[i], false);
>>>>   }
>>>>
>>>> +static void drm_client_match_edp_lid(struct drm_device *dev,
>>>> +                                    struct drm_connector **connectors,
>>>> +                                    unsigned int connector_count,
>>>> +                                    bool *enabled)
>>>> +{
>>>> +       int i;
>>>> +
>>>> +       for (i = 0; i < connector_count; i++) {
>>>> +               struct drm_connector *connector = connectors[i];
>>>> +
>>>> +               switch (connector->connector_type) {
>>>> +               case DRM_MODE_CONNECTOR_LVDS:
>>>> +               case DRM_MODE_CONNECTOR_eDP:
>>>> +                       if (!enabled[i])
>>>> +                               continue;
>>>> +                       break;
>>>> +               default:
>>>> +                       continue;
>>>> +               }
>>>> +
>>>> +               if (!acpi_lid_open()) {
>>>> +                       drm_dbg_kms(dev, "[CONNECTOR:%d:%s] lid is closed, disabling\n",
>>>> +                                   connector->base.id, connector->name);
>>>> +                       enabled[i] = false;
>>>> +               }
>>>> +       }
>>>> +}
>>>> +
>>>>   static bool drm_client_target_cloned(struct drm_device *dev,
>>>>                                       struct drm_connector **connectors,
>>>>                                       unsigned int connector_count,
>>>> @@ -844,6 +873,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>>>>                  memset(crtcs, 0, connector_count * sizeof(*crtcs));
>>>>                  memset(offsets, 0, connector_count * sizeof(*offsets));
>>>>
>>>> +               drm_client_match_edp_lid(dev, connectors, connector_count, enabled);
>>>>                  if (!drm_client_target_cloned(dev, connectors, connector_count, modes,
>>>>                                                offsets, enabled, width, height) &&
>>>>                      !drm_client_target_preferred(dev, connectors, connector_count, modes,
>>>> --
>>>> 2.43.0
>>>>
>>
>> --
>> Jani Nikula, Intel

