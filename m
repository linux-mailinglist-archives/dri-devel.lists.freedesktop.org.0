Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B3DB34DD4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 23:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E9A10E57F;
	Mon, 25 Aug 2025 21:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mSeUeAtW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F0010E57F;
 Mon, 25 Aug 2025 21:22:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khnmroGjnvIekv+FQa2kPJuJ5VImolR4lriFG1DxCaxSIqxxRMSsbrsrQdU+IxcE5WItKkJdUq9yhbWMjUydJAYT7cPbwcSG2+T2qY3k6EgJbJX738Dud241KpaZxi3StSd6bRvax6MUTOaFB3dUGYC+d9kD7ZhlBQBpkhX6R9Qy2Kim/LSXztDmdKLul14LRn6LKZJ7b438hL5kdm8nppUbGqJbBv5NqRRYHO6gB/U62zcjnXkXdoZqiGlv4Tv555BYfcu0aM/wrEwg5d5inccFw/nz+tjCWaaQ5R0pHt1shGSiWtGyG3KNIK/OX4gSHIOZeyzonor0Sz+21OibcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VeNi7CK18Az2Gju0Tu8oqLElUpU3lsy4E4J3iOZGeM=;
 b=Mq3SJfTzlth4vh7wZmnFUO89pbvXF5DZWKpABO7J5CUbKL0CgAmVNmaqK4xuvowjkeGmiojCCVa+r2tH+MBqCbMieLVnrT+wMdNt2sJkMrYcKF4Vl1UFsqh1tbwSUVRTlpyi/CwwatmfCps18eAEIgeWzf5lApFbMuZn1Odiv4+EqD5bUs0ERIXrpGiVlxfERsqa4V8BwaDGi7vJPNmGdArBRYA+zqyHfEM3TWQwImFeOtRVPIOVw17OKqM8uaeZqDpXmrcz5votY8hZhyBj3p8Qx2i/tNa2iP+AgTayvcbyBcTIjGO364RbjwWksBL9kvt0hCEFUAfWkuw8GGpCzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VeNi7CK18Az2Gju0Tu8oqLElUpU3lsy4E4J3iOZGeM=;
 b=mSeUeAtWolGjQ0CAeinFOXicCx3rPtsvDzKrnmTGHxshHSE873G3tzKf+FZgP+93UPxsfX6hW3yMz9TJH7l0gVTvGYGcKp69gLRk1HYxNmcThcP5vM2Ns66pzEbvLR1UnSnQ0qhXnBJjog3RsTwNG32pXi/HJRRfoBxm1Vf2DJ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB9128.namprd12.prod.outlook.com (2603:10b6:510:2f7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 21:22:23 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9052.017; Mon, 25 Aug 2025
 21:22:22 +0000
Message-ID: <b189d2c2-3b50-43c9-bcd8-7b0f353786f7@amd.com>
Date: Mon, 25 Aug 2025 16:22:20 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] drm: panel-backlight-quirks: Add brightness mask
 quirk
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, philm@manjaro.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250824200202.1744335-1-lkml@antheas.dev>
 <20250824200202.1744335-5-lkml@antheas.dev>
 <3b420fb9-9f85-4586-a887-f38804007cb8@amd.com>
 <CAGwozwGQgnZO0V1eNwbO3w7DyaEnfC+OXD0h6r_ZKLcTS42u9A@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAGwozwGQgnZO0V1eNwbO3w7DyaEnfC+OXD0h6r_ZKLcTS42u9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:806:22::7) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB9128:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ab7236-125d-43b7-91e9-08dde41d7b1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHp6RE5YZHQwRzAxZ01aWUcwaWZzck1lNlc4UGVlQm1ZME81cXBMTmlhT3U0?=
 =?utf-8?B?ckwxV0phQ0dTa0FoNHhRWjJRSXg3eFh0dzh5OXJ2d1BZZ0xoVkZxSFR5Z0Vv?=
 =?utf-8?B?VTcyVjVlVEMxZXNTaUtuYmlIOTJvZkJqN1NtaktScUJteWF3RkVWVWtwQndt?=
 =?utf-8?B?d3dWVi9pRHJpNENZdjMxTXl4SklGT3J3YStkM01HdlFoWUltYzU1YUl3VkFL?=
 =?utf-8?B?cC9kZllmanJCNDQ1NUxtbVBjcitzVW1SMXU3bU0xK2YwaHl3clVYMzljbE5Y?=
 =?utf-8?B?R0V4am5UaHhTeTNqeW02TDk2Nms3Y3dUT0JMd2loSEVoN3NpN0xXVE43bzNH?=
 =?utf-8?B?V29razNvK3dhNDhCc0N6dGVjZTQ0NTNISnVuR29FdlNXNk5PQzg4K0lUUTRG?=
 =?utf-8?B?ajlSYmd2NDdxSlRxMVU5Q0FLcmwvdUg2ejZJT3ZUZGxXaXdXaGRuZHg0K1Y5?=
 =?utf-8?B?YmlvWE9wdk5LVjZONy8wejlocVZCcU5kYjZNUkIrMkdKNEhyZTdLL3J6OGFh?=
 =?utf-8?B?RUNYQmlsOFEvSGpUakRPNzY4NjVWSTAwVkZ0M3BFVTJ5cCtVK1RwaUFSS1Qv?=
 =?utf-8?B?UlhlaFJyZDllY2kvZS9uMEZNSENYVHBqU1BaRHI1eDBETjFMcG1HL0FXQm5T?=
 =?utf-8?B?bWVQQjlTU3ZodVZNL2RsUnN5czMxdytGMlM1NlE5RWdmYk1jSGFDekFkcXlu?=
 =?utf-8?B?QjZOS09RZnNUbzJtQkpYUHVyeTY1aCt3Y2xwaStYbG9IZ0V1bVRUN1NCbEtj?=
 =?utf-8?B?TWt5R2w4eitHSno1ZG1ocHBEZng3dEdFb3ZkSFh2Q0s4Y1oyQTlCSVE1OXNT?=
 =?utf-8?B?K3VINnQvZExycjNtcVlkeDBJOVE2RzRjajIydXlkWHQzT3ZWNkJYU3BpNWYx?=
 =?utf-8?B?OEx4QTUrV3RYRUlka1AwT2JDblYya1h1VkRWVU1lZmlqVFZTTGtIRTJCOTli?=
 =?utf-8?B?TE8rYytEYzFOcmNYLy9wQVg1VXh4NTBMelRlbnQzbmdkcmxqdWxsTFIxSktI?=
 =?utf-8?B?clNvL2c2WmhlWTkxa1NjZFBuRHRrRWFUaUs4MU5qdjlsWS93U1M3OEE5L0xl?=
 =?utf-8?B?a1RybUN0eGJRdmNCRnZXMnBEU0hKT0U1T1BXVW0ycGxvVmJRb3g0UEdOUFRh?=
 =?utf-8?B?UFJ4RDN3MVRtd0NMb2VEUDVIRmMyMFBsWjE4UjlNbjhuZmYwQ252U2RGenVq?=
 =?utf-8?B?YzhCVUlqekRsbFZpWHpSYnczUzRiUU1hUFljeVBJQmVJMXpIMGdCL05TODBa?=
 =?utf-8?B?WG5zNWFuano0TFA5anJQUEh3RmxxWHk4VEFzeDVBSS8zNHhwREFHdWlVSmJw?=
 =?utf-8?B?LzFCbGZGemlxSTBsdmltWFdLMG1JdkxEU1hyeUJFZXZOazN6b3pGTTMxVS9w?=
 =?utf-8?B?aFBFdDBCT1VwMzgzMGNjNjl5TFRPN25UL01lOHV6WXl1MnZqSGd2SXdtOENW?=
 =?utf-8?B?a25veFNQNmtJQjBwUTFadW1qTzUxRlFOTUs2aDhXYUVFeEdLcGZVVmRCM3dp?=
 =?utf-8?B?UDc1eDQxNlRIVzVmRWQwaTVBbTd5NitVKzJFQVFUVWRjeEZWWlk1TjZhakhO?=
 =?utf-8?B?QktwQ3Vsbjd2VGxGVGxuRlF2UloveXFkcjJaOXFJS2xNaFhQYlE5dE5sM2FE?=
 =?utf-8?B?TUdob0hNNXJsZzFIMnFoZGJDMWJ6K1drcUluVEpPM2JsWHVEM25ERFh2ZjZE?=
 =?utf-8?B?eVVtYUE2WldINTd1T3ZKOWVpUk1FSDYwZUxaTGxJYW9Ga2pJajhjRENKZHRV?=
 =?utf-8?B?MytVb3JQNzNrcWZWcVN3QTE2cUJmUnhPVUJCVXdwS0VMV2Z5b0R6dzBQQ1gv?=
 =?utf-8?Q?73NboiXBvZQHmbX9aAEBGERsWJZ4r52OcOgEg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejZjeGE0Z0RlbExiMnpSRkRTblRwYjUwNS92eGVheVd5VzE4WVJZM3lDbnc5?=
 =?utf-8?B?SzNvRkJUTmZMaVRSQVJaV0pUb0N5Q1U2WEhnSGZyNkRkVFpOY0ordjMyeTl4?=
 =?utf-8?B?Vk44RWcrNWExSEJoMEd0d1hSUklXazFWL0dCVzhhcDBmbXNiTk4yWnN0UXZh?=
 =?utf-8?B?VHE5Tm93NlBTWnFCdkJ1cFpFUzdVQVRlMjJhRDJUMCtiUmVkMWFLV0NIRnNY?=
 =?utf-8?B?NlI0UHZKVGd0K2VtZ2N2SnNPb2RjMi8xdTdiSGJaUEhrYVN4akVodlRsYldO?=
 =?utf-8?B?U0RPbk9hcDdFQ0M4V2ZLcTFvMHJkZ2MyRmdYVnUxbWF4YW40MHBQdTB3bkJG?=
 =?utf-8?B?WmNuM3kxYXJTL0hHSVFvbXpNTXFqUW9tM0xTZGxnNnFXTVpmNVBOMnNRYSts?=
 =?utf-8?B?Z2JsREthSG12OEkvRWljVlI0NUN2VzVaN3lqVHplY0ducHBhR056em5TN2hq?=
 =?utf-8?B?VFF2R205b2dhRDJqMnJYeHIzQnhIZi9UMHNnOEtOVDA4Q0hpaDR2WUVSeUhK?=
 =?utf-8?B?U0IxZEQ1QkxGbGZlakxsMEJ6UGVBVVgxT3RlcTEvdXpMWE1jeFRXTXhKZWhM?=
 =?utf-8?B?SUNQZ0grQ2xPbTlBcTFRYU1YVUU0djBPeS9OSDlBbnB0WUtQR0huMGN4bFhw?=
 =?utf-8?B?d2JBN0hvOTM2Z0VUa3hGWXJrMW5BRXFXTzNZQzVYa1lnR0E3UFIwcUVubFlU?=
 =?utf-8?B?TnM4WlI1a3BGRm50blJ2dGZ4WG1vUmJQYzBBOUVvdEpERTBMV2hITEQ2MmJG?=
 =?utf-8?B?Nm1RWGdVdnlBZ2tPZkVCSGZzZWdmMVBUajErVXZTYXlZV2xLWVVPODVtOFc5?=
 =?utf-8?B?NEhiTEVPTnZMc0hJK3hlUGhOZDFGUDRWOUc2UFdQS3R6RnErTGxRckFtRFdH?=
 =?utf-8?B?dUNFejBPRFFHUFM0ZTZwczA2QkFRQzdZQjQ1ZmVEbkFIT1JzTGtyTmpwRmhT?=
 =?utf-8?B?MGNaSFV2RUk5Z25DMW93TFppUXorNmpkQStxVEZjUVQ1QURkT3owVXU5UkFM?=
 =?utf-8?B?WHVPbXFRdjJUTXNSR1V3ZnFsazAvR2dsV1dIOFBTMTA2Tm1qNG5pSXJaOUNu?=
 =?utf-8?B?OVIvRFNHL05TNWtNTzFNWkl5Z3lsVHFaM0JzS3lRTVUyS1VoNWVGOHp6REpE?=
 =?utf-8?B?bkk5cXBhRmRmVURaVkZML093czNIQStHd3FzK09JS2ZSN25PQWlHSlRSSEta?=
 =?utf-8?B?VDNGTm1LTDdlV2dUZC8wa3RPRVlWci9jVXkrNlprQjR1amRHckg4SElFdUNR?=
 =?utf-8?B?M3RZNTFJRjNicWlhMGUwOXRqSlZldHk0VVV0dkFGUTJock5tWHp3aXY5dVhX?=
 =?utf-8?B?RjFERTE2Ri93ZE9veDlDdGRxTUFBUW9sKzdoZ1BrWWJ0b01JcCtueXYwTlhQ?=
 =?utf-8?B?WXFxTDNwUmwvR0JiQWJIRklYU2tRWXd2TEpTd05rMUY4OS9tVmtsa3h4SUww?=
 =?utf-8?B?UEpGVjR5d3pOQ3lrOW9SRXRydE5leGpHVkFhOUxrQzIrelBZMFdkQWRPRTJu?=
 =?utf-8?B?RGh0TkNhOWJrSmhZdWl1OXlmaGlsWDViMG0rRFJvQ2RQOWl5V1poRitXdjgv?=
 =?utf-8?B?dGlCRXR3ZDFrcUpwYXJ3d0RnZnVPb3BxcFJRNDA4M3VyREFndU8zUk5kNnkx?=
 =?utf-8?B?Y1pDeFJJZmw2clE2a2ZDaVNtdjdzdDF5eHd4VGFlcUdic2tOSWZRdCtLdEhE?=
 =?utf-8?B?MlgxY1NpMVdMcWxyT0ZrL3pHc2tHREo2RklsWkxNMTl2aU5Yak9TdjJyL1pF?=
 =?utf-8?B?S2FVeWx6dGRuNEZ6Z29FdVRVSENjMmZ3TmZiNnVHTkVGMXpQUGlvZHZXZ0VV?=
 =?utf-8?B?b2xKM0xLOXZJc21rRTQ2bmRXZkp0T1N6MVBEMlBDS1lPVXZZc1lVS3F6Wk90?=
 =?utf-8?B?eW1FWElONmpWT1BwVnpnVEM4bmEvYXk2TmNacHB0R0MvUk0zZ0RwekdoaUt6?=
 =?utf-8?B?WWxac3h3bmRYbnRNK1N5dmd4Q3RIbk9rc25EdlBRU01WRlpmZEhJdzZ3dGU3?=
 =?utf-8?B?VVpqNW03TkkwUWgwdjdZbHZUU0RKNnFiYm9CcEZrTGE4clVyTEFIQWY4TTl6?=
 =?utf-8?B?ZTBpOXEydko5ZTE1UmpPdUFVVy9xWEszVFJGb3g4QWVjRExFOHV3cnM1Mlc1?=
 =?utf-8?Q?0/bJkpwJXRE5Yna25AmKc+UTu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ab7236-125d-43b7-91e9-08dde41d7b1f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 21:22:22.8632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wey2/oylw8ODjqP/Fmte2cnmYpI/O7RkOxxwHpObmoGznM/SkiYYCjAvLQdIZ2palUNvcwXyLJRUyr6BECmqxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9128
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

On 8/25/2025 4:17 PM, Antheas Kapenekakis wrote:
> On Mon, 25 Aug 2025 at 20:02, Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>> On 8/24/2025 3:02 PM, Antheas Kapenekakis wrote:
>>> Certain OLED devices malfunction on specific brightness levels.
>>> Specifically, when DP_SOURCE_BACKLIGHT_LEVEL is written to with
>>> the first byte being 0x00 and sometimes 0x01, the panel forcibly
>>> turns off until the device sleeps again.
>>>
>>> Below are some examples. This was found by iterating over brighness
>>
>> brightness
>>
>>> ranges while printing DP_SOURCE_BACKLIGHT_LEVEL. It was found that
>>> the screen would malfunction on specific values, and some of them
>>> were collected. Summary examples are found below.
>>>
>>> This quirk was tested by removing the workarounds and iterating
>>> from 0 to 50_000 value ranges with a cadence of 0.2s/it. The
>>> range of the panel is 1000...400_000, so the values were slightly
>>> interpolated during testing. The custom brightness curve added on
>>> 6.15 was disabled.
>>>
>>>    86016:  10101000000000000
>>>    86272:  10101000100000000
>>>    87808:  10101011100000000
>>> 251648: 111101011100000000
>>> 251649: 111101011100000001
>>>
>>>    86144:  10101000010000000
>>>    87809:  10101011100000001
>>> 251650: 111101011100000010
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3803
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>
>> To me this sounds like a panel firmware bug that is best driven with the
>> panel vendor.  But I'm guessing you're reporting it on proudution
>> hardware already in the field right?  In the field it's basically
>> unheard of to update the panel firmware.  The process is generally
>> speaking too dangerous/fragile.
>>
>> So in that case a workaround would make sense.  The actual issue as I'm
>> hearing it is that some fractional brightness values aren't working?
>> The API takes millinits, and I guess this was exposed by increasing the
>> granularity of values that userspace can program recently.
>>
>> It's possible it was there before too, but there are probably "more"
>> values that can hit it.
> 
> Yes, it seems like if the first byte is 0 (always) or 1 (sometimes)
> then the panel turns off. The patch that forces using 100mnits works
> fully in my testing but Phil can still hit values on his device.
> Perhaps at a 1nit or 2 nit accuracy all the values are ok which is why
> Windows works fine
> 
> It has already shipped in 4 SKUs from 3 manufacturers as shown below.
> 
>>
>>> ---
>>>    .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  7 +++++
>>>    .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  6 ++++
>>>    drivers/gpu/drm/drm_panel_backlight_quirks.c  | 29 +++++++++++++++++++
>>>    include/drm/drm_utils.h                       |  1 +
>>>    4 files changed, 43 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index 4ad80ae615a2..156f2aae6828 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -3662,6 +3662,9 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
>>>                if (panel_backlight_quirk->min_brightness)
>>>                        caps->min_input_signal =
>>>                                panel_backlight_quirk->min_brightness - 1;
>>> +             if (panel_backlight_quirk->brightness_mask)
>>> +                     caps->brightness_mask =
>>> +                             panel_backlight_quirk->brightness_mask;
>>>        }
>>>    }
>>>
>>> @@ -4862,6 +4865,10 @@ static void amdgpu_dm_backlight_set_level(struct amdgpu_display_manager *dm,
>>>        brightness = convert_brightness_from_user(caps, dm->brightness[bl_idx]);
>>>        link = (struct dc_link *)dm->backlight_link[bl_idx];
>>>
>>> +     /* Apply brightness quirk */
>>> +     if (caps->brightness_mask)
>>> +             brightness |= caps->brightness_mask;
>>> +
>>
>> I guess a problem I could see with using a mask is that there are
>> basically a bunch of values that are basically becoming no-op.
> 
> Yeah, 1/3, but those were noops anyway, because 3mnit is not much.
> 
>> An alternative would be to decrease the max value (IE some number
>> smaller than 65535 and scale so userspace doesn't request these "broken"
>> values).
>>
>> I'm not sure it's worth the effort though because you will probably
>> still find some subset of values with this problem.
> 
> The patch that was with the VPE quirk essentially does that and works
> really well. But it is not perfect. That's at 100mnits.
> 
>> The other comment I would say is this is probably very specific to AMD
>> and the millinit based brightness API; it might be better to keep the
>> quirk localized to amdgpu.  I also talked to Phil offline about this and
>> he's got a draft patch that helps a similar system he's seeing this on
>> (presumably) with another panel.
>>
>> I think it's worth getting that patch onto the list and we can weigh out
>> the alternatives.
> 
> I think it is the same panel spec. Perhaps it is a different factory,
> but all affected devices are 7in OLED 1080p portrait panels with HDR.
> I sent this patch before I cleaned it up fully because Phil wanted to
> test it. It seems to work well. I think he's looking into implementing
> the same quirk essentially.
> 
> I would not say it is specific to AMD per say. The bug happens in the
> panel after being sent a command to set the brightness through a
> shared drm helper. The same panel on intel with the same value would
> have the same problem.

Does Intel also have millinits brightness control?  I wasn't sure.

> Perhaps not depending on the backlight code
> that preprocesses the values. The drm_panel_backlight_quirks is used
> only by amd currently in any case. And this quirk system allows
> specifying EDID information, where the DRM code one that you did did
> not. I only saw that after I had made this series.
> 
> Antheas

OK thanks.  As you and Phil both have affected devices that are very 
similar result get offline with Phil and come together with a new patch 
series that works for both of you via quirks.

> 
> 
>>>        /* Change brightness based on AUX property */
>>>        mutex_lock(&dm->dc_lock);
>>>        if (dm->dc->caps.ips_support && dm->dc->ctx->dmub_srv->idle_allowed) {
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> index b937da0a4e4a..340f9b5f68eb 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> @@ -200,6 +200,12 @@ struct amdgpu_dm_backlight_caps {
>>>         * @aux_support: Describes if the display supports AUX backlight.
>>>         */
>>>        bool aux_support;
>>> +     /**
>>> +      * @brightness_mask: After deriving brightness, or it with this mask.
>>> +      * This is used to workaround panels that have issues with certain
>>> +      * brightness values.
>>> +      */
>>> +     u32 brightness_mask;
>>>        /**
>>>         * @ac_level: the default brightness if booted on AC
>>>         */
>>> diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
>>> index 3d386a96e50e..78c430b07d6a 100644
>>> --- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
>>> +++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
>>> @@ -45,6 +45,35 @@ static const struct drm_get_panel_backlight_quirk drm_panel_min_backlight_quirks
>>>                .ident.name = "NE135A1M-NY1",
>>>                .quirk = { .min_brightness = 1, },
>>>        },
>>> +     /* Have OLED Panels with brightness issue when last byte is 0/1 */
>>> +     {
>>> +             .dmi_match.field = DMI_SYS_VENDOR,
>>> +             .dmi_match.value = "AYANEO",
>>> +             .dmi_match_other.field = DMI_PRODUCT_NAME,
>>> +             .dmi_match_other.value = "AYANEO 3",
>>> +             .quirk = { .brightness_mask = 3, },
>>> +     },
>>> +     {
>>> +             .dmi_match.field = DMI_SYS_VENDOR,
>>> +             .dmi_match.value = "ZOTAC",
>>> +             .dmi_match_other.field = DMI_BOARD_NAME,
>>> +             .dmi_match_other.value = "G0A1W",
>>> +             .quirk = { .brightness_mask = 3, },
>>> +     },
>>> +     {
>>> +             .dmi_match.field = DMI_SYS_VENDOR,
>>> +             .dmi_match.value = "ONE-NETBOOK",
>>> +             .dmi_match_other.field = DMI_PRODUCT_NAME,
>>> +             .dmi_match_other.value = "ONEXPLAYER F1Pro",
>>> +             .quirk = { .brightness_mask = 3, },
>>> +     },
>>> +     {
>>> +             .dmi_match.field = DMI_SYS_VENDOR,
>>> +             .dmi_match.value = "ONE-NETBOOK",
>>> +             .dmi_match_other.field = DMI_PRODUCT_NAME,
>>> +             .dmi_match_other.value = "ONEXPLAYER F1 EVA-02",
>>> +             .quirk = { .brightness_mask = 3, },
>>> +     }
>>>    };
>>>
>>>    static bool drm_panel_min_backlight_quirk_matches(
>>> diff --git a/include/drm/drm_utils.h b/include/drm/drm_utils.h
>>> index 82eeee4a58ab..6a46f755daba 100644
>>> --- a/include/drm/drm_utils.h
>>> +++ b/include/drm/drm_utils.h
>>> @@ -18,6 +18,7 @@ int drm_get_panel_orientation_quirk(int width, int height);
>>>
>>>    struct drm_panel_backlight_quirk {
>>>        u16 min_brightness;
>>> +     u32 brightness_mask;
>>>    };
>>>
>>>    const struct drm_panel_backlight_quirk *
>>
>>
> 

