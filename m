Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A868CB2EC
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 19:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F7A10E35E;
	Tue, 21 May 2024 17:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ScNN9Sdm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D1810E1AC;
 Tue, 21 May 2024 17:32:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSmgrDSrk54OMdVbNz2Ed6Kw14dZjbTfqrVQoLqtzyu5fhwLlfN/Zg+/o1TUhLg5Cd2IF68Sp8RDMxf6zrwCfYu0qkJYvdcK2K0RL3m/QGjmA8EfpyUEQ1DX/BPdFO2/nfEODU/qUIdEvBVC46tk3SiZbTdwRzhaDdSzmv8x+m1fsBhHmEF4UjcOR7gg5cGzeojN5iblY63H+qYwILxS80rlY1kikTm1/9wLZ9n7w+o6lf1ehboVhD6MxmmiOy4xV1v5iLPci/jheTLnIa5LK3y1u/7NnRnP16EilulCdnqRnmJB/FYaMGGeRzLwptejHcGM1eLOSYiUcLx+b3jnzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzaJtcfdS/825trcYILAzZbJYbQINNf4eiNhZRGL18k=;
 b=D2LapdjBML+6BdJ8zBAhjdd08vyA8o17q3Ckdqj1DDFXZN7wv/phO55mBAkRfJtyee0A+G/PK/C6vb+cpObKlerAX+XLq1pxJFwFzDClRPqhQ9fCStlr4zJvmZFO2A0LgmIw57FoWTyJlalYlggXLxkezZ5t2wnyGtkPv8WPp24rdsoX3BNl4SWJyPmZN2hpoqdGcy5e5iD4T/8eIYX++H2mg/Q5rDNZ50sXM32NaugoTnoInEo7Yn5XZMYZ+HZkPe7tooiwvOYUzbwiRe2iH5usSK5ZO0D8ZGMXXI3dHXMjQV1SXpT7jWYY52WNJofowcRvGiG9okl9m2/F3JltuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzaJtcfdS/825trcYILAzZbJYbQINNf4eiNhZRGL18k=;
 b=ScNN9SdmG5rRbFn97NFXt3tnV26wFQ2oZgDODUv7WzOtMiGCcbAZSGw4yCm7KonUrVXNOXQe8xAcVxE3C4wqEq94v6YhoQ6uKrz3ZkXYiZxUMgeFUm/6TtYZUmIK2XEJ5487Oqa1cKEvz2d6Qkqn8FhGpB2sTHKlUQamiyhBYAE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB8988.namprd12.prod.outlook.com (2603:10b6:806:38e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 17:32:06 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 17:32:06 +0000
Message-ID: <3dc3f386-9a6d-48ed-bf35-c445b1d0120d@amd.com>
Date: Tue, 21 May 2024 12:32:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for Panel Power Savings property
To: Leo Li <sunpeng.li@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>
Cc: Simon Ser <contact@emersion.fr>, amd-gfx@lists.freedesktop.org,
 Harry.Wentland@amd.com, dri-devel@lists.freedesktop.org,
 "seanpaul@google.com" <seanpaul@google.com>
References: <20240519130610.7773-1-mario.limonciello@amd.com>
 <-KAO9zJq5vTiesgtw-PMO0lDkSH1tuV271WNqlVuh3ZSkMzKWB9JQJce68-X-GwhD57QilHIBnLxN9k03I3-CMeYQm30NJMLizfyUUxTqHA=@emersion.fr>
 <e3a4331a-307e-4377-a349-8699024f8459@amd.com>
 <CAFZQkGyupsydjSEfv6OgMqPmHm9kMy4HQs7aNvzn77omSN+ZhQ@mail.gmail.com>
 <a35f2f5b-024f-42ed-9d59-48efcf4516a8@amd.com>
 <55205499-293e-45cd-870c-1ccccd05145d@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <55205499-293e-45cd-870c-1ccccd05145d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR04CA0092.namprd04.prod.outlook.com
 (2603:10b6:805:f2::33) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: 806f1490-3e74-43f8-dc37-08dc79bbef5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1FTdXlwUytacXpMV2NkMjBuSXU3M0tDQmJ2THhzUmRna3ZEQmNZV2JQQTkr?=
 =?utf-8?B?ZE5Sb3llblBqUFJMNlhZWHNxbG5BeHlSZ0l5ZnFLWGVqTitPZS9EamQ5NDhw?=
 =?utf-8?B?dFg2MHh1Rzd1aC9NU3A3bVpiTEp3SGVCR2lsTmE1ZVNMbGQ1N2RnSDdWWmVX?=
 =?utf-8?B?NnkxcnN3K3YvbEZRNHpXRm5wTlJ0NjM2MHoweVJoclUra2QvSHR3L0JtQTJ2?=
 =?utf-8?B?SERMQVFtVitxb3JOQzBKWFFTK0s0Znc5NEpvRVVkZDVsL0RBa3BZQ0lVSFRy?=
 =?utf-8?B?MndBRXpWNE5UelhSTUlYTmUxa3MwY1JvbHNaQWRNakNaeGoyRkV3ZG1YQy9X?=
 =?utf-8?B?RkJDNCtyUzU1aWN3cVZXSzQ1Z2NrK3RGTDNVeTFMR0ZjRFByM21DcjNuS2c4?=
 =?utf-8?B?RW83VDZsSWRHV2dRem5XdjhsOU94N3FPYWFWbVlUK01QWGdHamgrN3dEWERn?=
 =?utf-8?B?NmVlSmkrbkNkdUlvSzhrSCtNK1dvYko5cDRwQWRVZW9OM1FBWkpiMUc3N1NI?=
 =?utf-8?B?SkwrTXp6QVNyOGZSTkpodzI2OW5VekR0ZlJqVjFyQWh3MXRrUmthUFNTU2g3?=
 =?utf-8?B?OTRoVEdyM0cxSUpiMnp6ZlhHLzU4T21tSnhrS3BmS1BmRVljS3hDRWQ3M1M4?=
 =?utf-8?B?ZVBQRkJLUlVjcnFyY2JwaWo2MTVmaGNmbzB4QklUNEs0RlJpN3kyemRqbjlK?=
 =?utf-8?B?ZVQ2VmxZOHZ1eGxidW5NMFBtSlFuT0RwZ21RcTBvVGN5dlM5ZUhha2VpVGN5?=
 =?utf-8?B?aFFuNXlRV3BQbkk3THhlVW54UHhIZlNucTJObDF0NmdrWHgwN3JJcEJya3dE?=
 =?utf-8?B?NVRtUjdRaStzU2ErNDhmTE51NUJ3Mk93VnpkVnN1TEd1SCt2ZzVlcW5ra1ov?=
 =?utf-8?B?ajZiNG9mcG02Vkp5Q0hlWndqZnZkOGk1Q3gyLzEzZDJVaDNNUStZMzIzR2sr?=
 =?utf-8?B?enVQczVFOThFaS9majZrZm04RzdPSWduSy9vSHFlNlMzbWtOeFp0eFVtNWNp?=
 =?utf-8?B?VENYcjJUYmxIRFNmWEYxcGxhaXFpdnRPVjU5T1dLQVEvUHEvN2M5a2pQQXVj?=
 =?utf-8?B?KzBGNGFkOC91OG5MeDNLL2RYaVc4Z3g4YUR5dWpmdW85b0tJL1lVRU1qL0Q2?=
 =?utf-8?B?YjQrUDJRank3LzFleEVBVlU4ejJxUmxVdEdERHkzNktHb2FkcHJXcmFuL2VI?=
 =?utf-8?B?Vmg3WUJyVUpncDcyOUlSNk9nNGRzelpzb3RSYnNwbDZoNCthZ2hCQ2lJcTdP?=
 =?utf-8?B?QlI3d0FnRUp4dUhSekYxRVVvdWVmUjFHbGYrRzVHaExLMWdLTnNpZDNONmJW?=
 =?utf-8?B?cmdGTHBpVE03dHdyYnNzd0t0cEp3bzNrdE1HeWw4Snp3N29NNTNTRTJ1ZmNy?=
 =?utf-8?B?N3hmMjVabTN2bDJNRHNDZklMQ0JCWmMwZnF6dTBNRElsejVDOXQ0bDBxc2lX?=
 =?utf-8?B?TmpWV28rcER4d3ZNOHZjMVUrRklNNm1HYWw1S05SUU11akRhWVBQcFVDQ2I0?=
 =?utf-8?B?dFBRTGM1dlljY3ZaY2lwNERwSHZLbzRKSXRFelZFL3hpT1RnWkpiQ3I2bEVM?=
 =?utf-8?B?N2duS1ZhcE9IdktRdHpnTHl5M2lNMDJlRUlCZmx6MzdwRU5qQ2FmLzZkd04z?=
 =?utf-8?B?a0hKY2Z3cUYwS1F1OGtiRStQTk8zQWVWaUl5aDluMmxrMDdlejE5R1JGR3pF?=
 =?utf-8?B?b2ltOU0wMXJFWmNSY0JwcFFaVDh3ejdQc2VhK0syemRMMy82RHozb1h3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFUzSmVFUzVmNHQ3TjE4QVdXMzdUa2hUK05GaU9rc005S0NlcGgzNEVQREZE?=
 =?utf-8?B?MzlJT3hFcy85Ky9rMVZnVjN4VjNVNkJyR1Q5QzJYNldsaXhRWFNlZWNvQm5x?=
 =?utf-8?B?OHJtTVlDNlpVQ3lXRXRqOWQ1clBUUEszelJZUk8raEd1dDRSMEgxM1NhdklE?=
 =?utf-8?B?algrbTRmZWFTUTZWODNIVmxRcUZRb0E2bDV2WkJUZkxkM0o4U0pjcTMxRmRq?=
 =?utf-8?B?cGJBZzJ0cGErLzVqQkc4LzkzWTQ4aU92RWE0Vys1YVlmNi9aTUFQVXFaN2Vy?=
 =?utf-8?B?R21PYXFxRVUxWlM4WktkdEI5UlcvUUpGQXNVTjR6c1pZTTJ2Yms5ajM3Vk56?=
 =?utf-8?B?Zm03MTgzeDlqVmtnZmtrS0N5WUZzSTZhOXBxODBEeURmcjVZcVJFQndxMzJt?=
 =?utf-8?B?c1d6S3ZMencwRXY4aU55MTg2SUJoZDlpQ3NjN3hHSnRsWlMyLzdBWSt1cS9W?=
 =?utf-8?B?WGYvU1VhZU51NHdWWUErN0FSVEFOYzhGclpzbHVCUExjak9MWFY0S3Q1L1Vl?=
 =?utf-8?B?Q2dhWWJtV0RGR3R0VHV2RTlFZHlzV0prVk9YUWwzV1ZqZk1oK1pYLys1dzZZ?=
 =?utf-8?B?N0piUk9meFcxMXgydXJwZXluTGF1cDB0RHVPTlg3T1RLa2lQbXl5dnJFbmRo?=
 =?utf-8?B?eXB1LzVhU1p4Y1pHNEpESkZnbFRHK0RReGhIYkpnK2hSenZEZW1uc0lSOU54?=
 =?utf-8?B?aUVUbjAvekZRRGJZR3VEQWVYRXRTdjVyZ2xmWTkxcW8vckloTVFCTDM2bWJp?=
 =?utf-8?B?a1VwUVdrNTd3RG1FSFIwUnoySkxRZGtHY1Q2OStKZkZEZTNkNzVsQlR5dUJ6?=
 =?utf-8?B?RWM1Q1A4aFdFUFI1QXF3WlhpZktYbDNIQ0FOQ290eFRkUXQxK3JPOEUyMWNv?=
 =?utf-8?B?clNYa1RDRTNoSnFlM1dIK3NSRG5SYlZGUTNFL0YwaTVJbnhiOTFVaXBLR0Vk?=
 =?utf-8?B?YUxyRkJIb001eFArejIvRXlMc2h1TStBS1RMUm5xK0tCdjFmbUJMN3Z6bmw4?=
 =?utf-8?B?MGEzTVo0UHFMV21Va1hHektyMmtRR3JESUx0RFpHencvRlkrT3RtUXFRYW9D?=
 =?utf-8?B?RXorWG1oNVd3K1VDSnZXaFVJTFNVWFhldTZ5Yjl5cGlUWUJmTk82T3pmVDZN?=
 =?utf-8?B?VktFbE1idUVDN0twN242bW9zY0grUkl6cy9ibUJvVjBaSUdDanhlTUE3SUVZ?=
 =?utf-8?B?eVN5VllmRzk4L0k3R054RlJMY2pxdFp2MWF6OG95VkFrb2xwbS9mWDluVHNl?=
 =?utf-8?B?YytNQTlyQ2xvdE4wYUpSS0F3Q0VzZDhvYzRHTzNnL3Q0RlhHYnhULzdZY2dl?=
 =?utf-8?B?WWpUYlowam9ieGRWRS9UOFUwR05wa205WGQwRzA3bmZrcXBoN0ErT1p4Q1VL?=
 =?utf-8?B?VHpjTUF5cVV0RnR3R0hXVytJQm05S2ZTaEVVL3EyZ0wzbnoyOFU3SXhNdHBE?=
 =?utf-8?B?M3dBcys5OFBJSWJBWDlsVE9WQnQ4ck1UaEFLMkRxZGl4Vy92ekVWNlQ2cGp0?=
 =?utf-8?B?eTVUSlZoM3Vyb1ljM0FsSlYrN3ZnUTV2MFBySXBZeUE0REwwWENlWHN5Qnd0?=
 =?utf-8?B?eEI0ODh5TldVRld0Yk1GZkxCeVRzVXJKNGFlemZiU3JYNTg2REdUQk12YzhJ?=
 =?utf-8?B?VmtCQUJnMUJKU3RHQ04zN0tORXJzZm5vSTR3OGhSUnpjeFByYVNWQ0MvZEl4?=
 =?utf-8?B?UTFScGlwY3VRNDc2VGhjRFdXNnkwWjNLcU9zZ2NrSlZPd0trejZscXBBbEND?=
 =?utf-8?B?bkl1d29oSjl5Vng5VXR6Q0N5cWtDUk1pOXNlZ1JXMSsxSlI5dnlwMDVibW9x?=
 =?utf-8?B?OCt5K21DZmtRaXAwdlF6WUMybGhOKzJmbEpVbGRNVndkRUd4ZFlvSlBFRnVs?=
 =?utf-8?B?WHVNUmlQSUdJOEpnV1JNdGtrSTRWZ0N5TmFDVjBPejVwaUR5WlRjVWV5NWJE?=
 =?utf-8?B?YkpjeEFyb3VMZm5DZFVDNythMUZrQU1zaG90eWxVMk1qRC9NQ3FtRGlwQzY4?=
 =?utf-8?B?cllsL0V6YTlqODZzTlVieEVKcXd5SlZUUHErSzNMS2liTm54NzBod1N3MFhn?=
 =?utf-8?B?RFQzd3orVXRjS0NOUVhHRitKY1A3SHJYU29IU2RRelJxdWdLYjR4dC9xY2dO?=
 =?utf-8?Q?pbDKWlUPGkp7BJNEPebb/X15j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 806f1490-3e74-43f8-dc37-08dc79bbef5a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 17:32:06.3000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5DpW9cb8a/2tgPzEg+vmwgDCSzd9E2HfAcvAZCWttdaAUNZ6NCXFRa2KeLvJtQAKgsVKBAiqVnwcMwUBzOFQjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8988
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

On 5/21/2024 12:27, Leo Li wrote:
> 
> 
> On 2024-05-21 12:21, Mario Limonciello wrote:
>> On 5/21/2024 11:14, Xaver Hugl wrote:
>>> Am Di., 21. Mai 2024 um 16:00 Uhr schrieb Mario Limonciello
>>> <mario.limonciello@amd.com>:
>>>>
>>>> On 5/21/2024 08:43, Simon Ser wrote:
>>>>> This makes sense to me in general. I like the fact that it's simple 
>>>>> and
>>>>> vendor-neutral.
>>>>>
>>>>> Do we want to hardcode "panel" in the name? Are we sure that this will
>>>>> ever only apply to panels?
>>>>>
>>>>> Do we want to use a name which reflects the intent, rather than the
>>>>> mechanism? In other words, something like "color fidelity" = 
>>>>> "preferred"
>>>>> maybe? (I don't know, just throwing ideas around.)
>>>>
>>>> In that vein, how about:
>>>>
>>>> "power saving policy"
>>>> --> "power saving"
>>>> --> "color fidelity"
>>>
>>> It's not just about colors though, is it? The compositor might want to
>>> disable it to increase the backlight brightness in bright
>>> environments, so "color fidelity" doesn't really sound right
>>
>> Either of these better?
>>
>> "power saving policy"
>> --> "power saving"
>> --> "accuracy"
>>
>> "power saving policy"
>> --> "allowed"
>> --> "forbidden"
>>
>> Or any other idea?
> 
> Another consideration in addition to accuracy is latency.
> 
> I suppose a compositor may want to disable features such as PSR for 
> use-cases requiring low latency. Touch and stylus input are some examples.
> 
> I wonder if flags would work better than enums? A compositor can set 
> something like `REQUIRE_ACCURACY & REQUIRE_LOW_LATENCY`, for example.
> 

I thought we had said the PSR latency issue discussed at the hackfest 
was likely just a bug and that nominally it won't matter?

If it really will matter enough then yeah I think you're right that 
flags would be better.  More drivers would probably want to opt into the 
property for the purpose of turning off PSR/PSR2/panel replay as well then.

> - Leo
> 
>>
>>>
>>>>>
>>>>> Would be nice to add documentation for the property in the "standard
>>>>> connector properties" section.
>>>>
>>>> Ack.
>>>>
>>

