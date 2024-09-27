Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F6E988BD6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 23:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDF910ED30;
	Fri, 27 Sep 2024 21:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Vp5S1vm3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3A210ED30;
 Fri, 27 Sep 2024 21:34:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gmm9B+On6AhBJExNXN+VQeR4NAvl2XUzzYVWlmxduJmU8oK4Wfp8Q0z2VHioNZLYzKcKOmY8bv6wqrQrwdJtksOnsc4mrtiwjH2wRfH8wh+60kSG0Z+/F3gX8x979BXQ4FDn7ZskLsyvWhWXjFjJOtMzJyAnxo5EZPFHDasKHhMVQuM52sc17Z+AUHa3LWNvS0AITiSrjVOH4dHWp2IUPEJx21ETuWCJpFmL3zcuNGfvHdPc5K680S2vki1M9NxGWqCc1Wx9BdjJMkR04FqoBBn2e3yH82QZDTzfHVV3EdnzX9yEXgyP3+L0WDQGTfdwYII/PgPmsMpapSUs7l+pMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Afmu/Yn4t15jpMKjig4TJftlgnzcQsckq2uLex/PN4=;
 b=p87XoZAnWxtbk4/0JdWQLBUkasl4ItL73u+0XU0ukv+e/lek1z9rO8W4M2VUTu3rWo/q7jRDBcwROeE3PB4RY3mAB7DBMqUCRr327i5CdnKgYEcJzFw4yNEJafAjPZ5RehS8tK7J4baDHDpkLT5BIi+RNRnKatRFv5UVp9Tmtk/HWEoYvqf6ihO5PW+IDoeJJzkl8li80mveEvRYldfXjLy2V2Fhu8i8uCWOJW5/YKykpC23QAXq6yBUHmOV48uvHLg5mov48Fp/wx8ZtE9YcnaautZZuvc4J9SPondpfXtwRTYMIFkz34PZXMi0iilaSdJMq+L2o1Z6TdELPyT20Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Afmu/Yn4t15jpMKjig4TJftlgnzcQsckq2uLex/PN4=;
 b=Vp5S1vm3xtV2uqbsPtnj8DZaMKBG22GDlt6TWz9SVeAWIU+VpGpaGardi5O1JJvld1/Q2EvvpCLQW4yYGJc9iETUkYLqE/kpEAXGuO8CBTp9J4/GuJVzJkevavmqKslt1N197K5IgHkZlVw0SEKX3n/nFzvWe31fTT8t7AmhVP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9)
 by DM4PR12MB8500.namprd12.prod.outlook.com (2603:10b6:8:190::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.24; Fri, 27 Sep
 2024 21:34:47 +0000
Received: from IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692]) by IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692%6]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 21:34:47 +0000
Message-ID: <e71a2dbf-fbbf-4bd2-a8d8-a713070c4f90@amd.com>
Date: Fri, 27 Sep 2024 15:34:44 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/10] drm/amd/display: Use drm_edid for more code
To: Melissa Wen <mwen@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Broadworth, Mark" <Mark.Broadworth@amd.com>,
 "Wheeler, Daniel" <Daniel.Wheeler@amd.com>
References: <20240918213845.158293-1-mario.limonciello@amd.com>
 <c15c189d-08c0-4f7f-b4a5-7e58d530ea3e@amd.com>
 <a25b04c2-6fe9-4819-9587-6b8764cdca38@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <a25b04c2-6fe9-4819-9587-6b8764cdca38@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0003.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::16) To IA1PR12MB8495.namprd12.prod.outlook.com
 (2603:10b6:208:44d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8495:EE_|DM4PR12MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c4e0f6f-8448-4362-553d-08dcdf3c35c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3orUzZwQmNrenFlRS9nRTNkS01RZXZIUUhhcy90dDJmZUlYbEZkMm1XQ0Nv?=
 =?utf-8?B?endCSTVwM2labWRoVzhKcUZUbndCOEJ6dnRtSkEvVHVoVDlhU3pTTU12ZnRY?=
 =?utf-8?B?NWhVZ2tTQnVTa0JicXJ3VE5PTHcrOTZoemdvN0U2ZDNLcXIrR3B2NzNGc3B5?=
 =?utf-8?B?VkxsY2R5RkhuQW41K0lEaUdMbVFjUUlLZVI1WktTNGdkUThmck80eUxYMmMy?=
 =?utf-8?B?cW5xTEtjWkZkZEp6TzEzRTJwendhUjR2YVVzM1U1V1FLZ1IwWWRoTVNIMUht?=
 =?utf-8?B?QUZFK29BZnRQZzVXYjNaM2xQc3VJdDJVNFkxZkVUejN0ai9ReW5BczFQcEdN?=
 =?utf-8?B?TWlzdE4zblQvdDlUSVBsUTM1YmZrZm94bWZkaEZXNk5Na3JlZnprRjRjRE5q?=
 =?utf-8?B?ZUdqdE5OSzQ2Z2pmVHRXcVpyVkc4NGJQVEJhaE82dEU4eWhFMGl1RFk5MUFm?=
 =?utf-8?B?dmhuQk1vU2k5TWVVRWNaWHRkdk85Um14dkxWSnRLTlBnN0tXendGRTFIUzBR?=
 =?utf-8?B?SGJ5SFc0MHB2SFlIQTdVSmtGMVY1TXpHUVBvWWlmQlN6VjkyeFkrSmhmWEI0?=
 =?utf-8?B?Rm9ZaU85ZjVmeVNCZmRCcDZFeWtLTEI3M2YrLzAwcnNtTU9HN1NMMEEwTktI?=
 =?utf-8?B?SGF3V0R6em1uOFZReEN5MW9PaDBqRnNUSll0cm54MHRBdEVvdmR6Y0tmYmtQ?=
 =?utf-8?B?bm52Z2tFR2V3VlNUdVB3UkJyMU9JUUVjc0pxWkNRd2gzV3VjVkM0bWc0WmVa?=
 =?utf-8?B?aDlrVWVoLzFITXJNV0ZFVEM3NUxRMzkzUmU1d3BuSU15U3lWTzRCYldZSTVL?=
 =?utf-8?B?VythU2FyRDFpR2JtcUZ4S1hkcW80OFpZSVV3N1RqcStRSmRDUXN6ZWxvR1Rn?=
 =?utf-8?B?bWp5R0kzNUZFTG5CVlVSUGhNU2VBdVhBTHU1ZVlNbk9uVG5lZzYwQWQvdXox?=
 =?utf-8?B?TDRJSXk4ZzB3T2d2OHJtNUtUdTFOSzBudEkrUnBRZEZOcEJXUGc0aW9RZFA4?=
 =?utf-8?B?ckVta05IVXhRN09OeU5wczRGejVBSzdaUm9veUtUOWMyN2FZYlNTc0pJTGJM?=
 =?utf-8?B?WEJOMHhrN0N1MEtISG1Ddm50NTVkT0dhSVdmSHhaYkZvYzlWWnVCZGpBV0Zr?=
 =?utf-8?B?TEM0ZEM1QlJtY0xKZkNGanZ2cnIxN1krTHdIdm5Ra2IyNEZmdC9sbXdhUEhP?=
 =?utf-8?B?VVM1NzJNWUxDNGNOUGVpdnpVbUtkUWFVbXZZcnFoNkJpdU9HWVVQbWlJSS95?=
 =?utf-8?B?Z0hjREk2eUZJTCtoZU5jWThiQVJpZW5lQXBLcTBqR2VOTGZISFYvQ3M4MS9R?=
 =?utf-8?B?RGM0WkhXZ1laMVZ2WjNxc09JaEJEK3hNWnl3RGpGRndVenRFUGpFQjA4Tlo0?=
 =?utf-8?B?bWpPK0ZtTnNJK2IvRnZYU3JiT1NEKzBGOEl6V1BrY2gvbE1ITUMvZm55SThu?=
 =?utf-8?B?QXBFRUkrQ2U0dzUzN0hBVXUzaGZZZ01uU0xBbTgxN3Q3MFlBQTVwQVJneTNP?=
 =?utf-8?B?S2RFTmptNEdCUkRKd2duUUsyZjFkMXdpS2dyOGlDRU9BcW12elVhaGhIZWxk?=
 =?utf-8?B?UllwZHMvQ0hsdDhUQUVZUyt6eklDSGJCamxsbUVDbUxKcGJVeHJGejZyZkVZ?=
 =?utf-8?B?REJ1Nm8vN1VkaWI5dUVrek8vRFdYMEpRQS9BTVhXMFUySFFlRWFoMGQ3VHh6?=
 =?utf-8?B?Z2tUQks0T1hSRzd6bkJlczdlTDdKRGFZdWgrUGFaa29lYXlSaEV4WnMwVU83?=
 =?utf-8?Q?BwGQrLoPWgdRA0dv5U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8495.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWxXNE0xNVlvc1Q5dkdXdnpPSUhGWjZzc1NZUUtKTHp4QllSRDVsSEN3dS9q?=
 =?utf-8?B?TS9UdG5jWjlPTkNaR09xYVRZaWJFLzBaL1p4b28xWFJydWpuOUwzRThhTUho?=
 =?utf-8?B?VU05bTRYSzFWRDh1eFh3SGZtVHp0VTRWckhQRkRsUXU4UkRzS3FXTGNldlIr?=
 =?utf-8?B?TmJ5SmJkNlhlU1Blc0Yyc2I3ZE9Ec1hyeEJSM05jLzVLRXpma0JoMHFuSStl?=
 =?utf-8?B?cGpjQU5MTWhLN3ZyWTVUUDBFZVRhQjg4RWZNSXJQWitqa3ZzbkxYRDBVcURM?=
 =?utf-8?B?RGRzUjg1R2MwVnlVbFpqcGlLMG5vQVErS1cwN3BpV2JFMzdjU3ZmL2ptYUJP?=
 =?utf-8?B?NmtDM1MvRkIvamVka0d4ZytVdGJaekJReEZwT0FiaWhHSm8xcUdtQ203QStF?=
 =?utf-8?B?eEU0SHhXSFBsYWJyeHhFdSs3OXl0RnROOThuNmpFWEIzZ1JNVlhrOWhhOUsx?=
 =?utf-8?B?emJRdUxoVUQvQmNkYWV1VzF0K3BKb0g5OWtvcTVMbG1wR3FSV3NscjJramhU?=
 =?utf-8?B?cVlnQ3BwUnJ4NGxZMS9GbENSbDcvOXBQZ3A5Yk5zNnhIYlVMSTNDcm5WRVB2?=
 =?utf-8?B?aUFkazIxcEJvbHhWYUFKa2JDRmMwbkRMMlo3WDFQNWs2QVFVWkVJQUlOSU1T?=
 =?utf-8?B?VTB1MHlqMFVXTC9uVnRHd2dVTElYanY1cEdOcHlDWVdZS1JnY0M5dFM5VUIy?=
 =?utf-8?B?SDhhN1MzcHlXUGhnNzRHSkx5NTUzbjdjSUJiN3VzckFxVytSNXlXa2xkVk05?=
 =?utf-8?B?Q3d3OEJiTFdZOGkzMXF3MjRmc2ZKOXFValJQZTRMTnNPVEVobGRUZkxUc1p2?=
 =?utf-8?B?ZTlzVXU0UWQ1eTZrY2I0b0FpUHhtNS9rNGdMd1J4aTJFNWlIRm5ISlQ2bHlT?=
 =?utf-8?B?RXNpTGJhK1FhVjlya1RUVWIzOXExRGltWjdjMHdWYW90RjFibWtPQkJKdzhy?=
 =?utf-8?B?amFHZXdDcXZFUnUrUDRzSWwweG5MQ0d3S1premhOUTVoaUN3NW55amNqZHk5?=
 =?utf-8?B?ZTNnKzVJb3l0SDhOYWd2bk5WZktwTnQ5aHNKKzRYVms4RkhnMVl3dVI0Q3BI?=
 =?utf-8?B?MnhzRUZ5SzUzYThudXhxV0MxTFZzY0dYNzQ4bDJaMG1tdVY0c0tsZjY2V204?=
 =?utf-8?B?RFlKWjR2djR5SnlET2xxWGMyK3BEbTFDNnAyanRHcXlPbWVHQkkyN0IyK2lH?=
 =?utf-8?B?amtnYk0yK2FRczJZQzUwZ1BGRGo5TzdUYkRyR2FLNUI1K3NaMi9ZL3R6MUV6?=
 =?utf-8?B?R3I2SEkwTWZ0cExVWGVTbmhUeGxwa09yTFBCWXdpQ2pmRklxQmMwSW1KVXR0?=
 =?utf-8?B?MU85TDRldU54RlZSYXEwUkVrbm5qVEp2Z0ZCSGJyc2tLbHVaM1NYWm9qeWxD?=
 =?utf-8?B?OWlNOVNnRlR4cjVvS3J4dVgxTU85Z0VhandUeDFiYnVOVlQ3Q0IvcmxwNzFo?=
 =?utf-8?B?VVNPc0R5d2dCWmlJcVZ3WUUyMTBNVzVCN1J1Q0tMZkw0eWlGYmpYSTBCQVBW?=
 =?utf-8?B?TWllbXcwRVpyN0MrMkhxZ0NVODZIT1ljRHU5ay93Rlp0dGQ1Ulk2YzRQSmk3?=
 =?utf-8?B?MzZZN0pkd3BiaEhjbFVITGxSNmYyL1hkMXorY3ZHVGRqWEFrQzM4aEQ0SXR0?=
 =?utf-8?B?OVkrZDFkYll5dExkc3AzcFpFb09VTFp0YlNYVGJQUTNJK29vSG0rbkZHcGUx?=
 =?utf-8?B?NTJOSUZVMkQ5WWxuQ25DaWM3SjdFekl5RUExRy9KVU85dEowZDAySmNYYVNG?=
 =?utf-8?B?L0ZPSzlDR0ZUdkd1SXdnSkFVYWlUbkN3SDFYT3NXWDB1ODNCQUd2Z3NRakdE?=
 =?utf-8?B?aktyUjVZL0hlR0ZVaG5ZWGZJVXkzaVFMUVZVeUUvVVp4eUNxSHhLRDg0T3pq?=
 =?utf-8?B?NHYwWDlHLzljZUFFTE9jdVpXYTJaM1JqZ2xXcTYxdFB0QjUzY2JpRkNub2o0?=
 =?utf-8?B?M0ZMNjM3VE5ORHRON2ZZamlKUWNPaFVnQlptOS9uaUVLWU1jWlRYYWlCajE3?=
 =?utf-8?B?S2N1L3paZEM2Nzk2THN0U1hnNlVOT0NWZlhWWUlBa0RWR0M2R2xISE9jOEpV?=
 =?utf-8?B?YVVBbXU0VGpVSnpjWHBpeXhpMVI0cVZzdEg5a0NENUc2aDNyWUEyOXdYMmNz?=
 =?utf-8?Q?0CHRw6Ui7+a35peUzAE3kdIAp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4e0f6f-8448-4362-553d-08dcdf3c35c9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8495.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 21:34:47.4368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4H+quWdrSl9Lihk3NYlQ+GgLop9GmZp57ppfSlNJACz0GfRvLa3pSOubJ09Y5iP/Zih3ZtjgBF3dL56uYO/Cpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8500
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



On 9/27/24 14:45, Melissa Wen wrote:
> Hi Alex,
> 
> Thanks for the intensive testing.
> 
> I'll need some time to reproduce and debug these regressions.
> 
> So, we can divide this series into four steps:
> 1-2 are the basis for drm_edid migration
> 3-4 are code cleanups
> 5-9 are drm_edid_product_id migration
> 10 is for ACPI EDID feature.
> 
> Bearing this and the reported regressions around the product_id part in 
> mind, I wonder if we can start by applying the drm_edid migration and 
> the ACPI EDID feature, which means applying patches 1-4 and 10. And then 
> let the second part of product_id migration for the next iteration.
> IMHO it seems a smoother transition.
> 
> WDYT?

This sounds like a good plan.

Not all tests were completed on 1-4 + 10 as the series were dropped due 
to the regressions. I can send the 5 patches for tests next week again; 
however, 10 cannot be applied cleanly on top of 1-4, and help from Mario 
to rebase is probably needed.

As for the rest, let me know if you cannot reproduce these issues since 
you may or may not have the same hardware configs.

> 
> Melissa
> 
> 
> On 27/09/2024 15:48, Alex Hung wrote:
>> Hi Mario and Melissa,
>>
>> There are three regressions identified during the test, and 
>> improvement is required before the patches can be merged. Please see 
>> details below.
>>
>> 1. null pointer when hot-plugging a dsc hub (+ three 4k60 monitors).
>>
>> This may point to "drm/amd/display: use drm_edid_product_id for 
>> parsing EDID product info" since that's the only patch calling 
>> drm_edid_get_product_id.
>>
>>
>> [  227.797361] RIP: 0010:drm_edid_get_product_id+0x1d/0x50 [drm]
>> [  227.797388] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 
>> 00 00 55 48 89 e5 48 85 ff 74 24 48 8b 47 08 48 85 c0 74 1b 48 83 3f 
>> 7f 76 15 <48> 8b 50 08 5d 48 89 16 0f b7 40 10 66 89 46 08 e9 a9 47 ee 
>> ce 31
>> [  227.797391] RSP: 0018:ffffac58126f7930 EFLAGS: 00010216
>> [  227.797394] RAX: 000000000000372d RBX: ffff8eaeaf8ac808 RCX: 
>> ffff8eaeaf8ac107
>> [  227.797396] RDX: 0000000000000002 RSI: ffffac58126f7944 RDI: 
>> ffff8eaeeeaf9f80
>> [  227.797398] RBP: ffffac58126f7930 R08: ffff8eae8e500d00 R09: 
>> 0000000000000001
>> [  227.797400] R10: ffffac58126f7978 R11: 000000000017f81b R12: 
>> ffff8eae84cb0000
>> [  227.797402] R13: ffff8eaeeeaf9f80 R14: 0000000000000000 R15: 
>> 0000000000000100
>> [  227.797405] FS:  00007f031a616ac0(0000) GS:ffff8eb57cd80000(0000) 
>> knlGS:0000000000000000
>> [  227.797407] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [  227.797409] CR2: 0000000000003735 CR3: 000000014decc000 CR4: 
>> 0000000000750ef0
>> [  227.797411] PKRU: 55555554
>> [  227.797413] Call Trace:
>> [  227.797415]  <TASK>
>> [  227.797417]  ? show_regs+0x64/0x70
>> [  227.797423]  ? __die+0x24/0x70
>> [  227.797427]  ? page_fault_oops+0x160/0x520
>> [  227.797435]  ? do_user_addr_fault+0x2e9/0x6a0
>> [  227.797438]  ? dc_link_add_remote_sink+0x20/0x30 [amdgpu]
>> [  227.797654]  ? dm_dp_mst_get_modes+0xee/0x520 [amdgpu]
>> [  227.797882]  ? drm_helper_probe_single_connector_modes+0x1b5/0x670 
>> [drm_kms_helper]
>> [  227.797894]  ? exc_page_fault+0x7f/0x190
>> [  227.797899]  ? asm_exc_page_fault+0x27/0x30
>> [  227.797906]  ? drm_edid_get_product_id+0x1d/0x50 [drm]
>> [  227.797932]  dm_helpers_parse_edid_caps+0x69/0x260 [amdgpu]
>> [  227.798139] amdgpu 0000:0b:00.0: [drm:drm_dp_dpcd_write 
>> [drm_display_helper]] AMDGPU DM aux hw bus 2: 0x02003 AUX <- (ret=  1) 10
>> [  227.798158]  link_add_remote_sink+0xa8/0x1a0 [amdgpu]
>> [  227.798402]  dc_link_add_remote_sink+0x20/0x30 [amdgpu]
>> [  227.798615]  dm_dp_mst_get_modes+0xee/0x520 [amdgpu]
>> [  227.798843]  ? srso_alias_return_thunk+0x5/0xfbef5
>> [  227.798848] drm_helper_probe_single_connector_modes+0x1b5/0x670 
>> [drm_kms_helper]
>>
>>
>> 2. DP2 Display is not listed as an audio device
>>
>> Steps to reproduce:
>> - Attach display to system.
>> - Boot to Desktop (Wayland)
>> - Attempt to select display as an audio device.
>>
>> This points to patch "drm/amd/display: get SAD from drm_eld when 
>> parsing EDID caps"
>>
>>
>> 3. IGT amd_mem_leak'sconnector-suspend-resume fails on Navi 31.
>>
>> This points to the patch "drm/amd/display: remove dc_edid handler from 
>> dm_helpers_parse_edid_caps".
>>
>>
>> Using IGT_SRANDOM=1727192429 for randomisation
>> Opened device: /dev/dri/card0
>> Starting subtest: connector-suspend-resume
>> [cmd] rtcwake: assuming RTC uses UTC ...
>> rtcwake: wakeup from "mem" using /dev/rtc0 at Tue Sep 24 15:40:50 2024
>> unreferenced object 0xffff95c683517b00 (size 256):
>>   comm "kworker/u64:30", pid 3636, jiffies 4295452761
>>   hex dump (first 32 bytes):
>>     00 ff ff ff ff ff ff 00 22 0e c2 36 00 00 00 00 ........"..6....
>>     33 1d 01 04 b5 3c 22 78 3b 28 91 a7 55 4e a3 26 3....<"x;(..UN.&
>>   backtrace (crc 5800a91d):
>>     [<ffffffffbb73502a>] kmemleak_alloc+0x4a/0x80
>>     [<ffffffffbabbde07>] kmalloc_node_track_caller_noprof+0x337/0x410
>>     [<ffffffffbab631f8>] krealloc_noprof+0x58/0xb0
>>     [<ffffffffc04e8e38>] _drm_do_get_edid+0x138/0x410 [drm]
>>     [<ffffffffc04e9155>] drm_edid_read_custom+0x35/0xd0 [drm]
>>     [<ffffffffc04e9244>] drm_edid_read_ddc+0x44/0x80 [drm]
>>     [<ffffffffc1061808>] dm_helpers_read_local_edid+0x1d8/0x340 [amdgpu]
>>     [<ffffffffc11b7446>] detect_link_and_local_sink+0x356/0x1230 [amdgpu]
>>     [<ffffffffc11b8366>] link_detect+0x36/0x4f0 [amdgpu]
>>     [<ffffffffc13667a0>] dc_link_detect+0x20/0x30 [amdgpu]
>>     [<ffffffffc10536f0>] dm_resume+0x1e0/0x7d0 [amdgpu]
>>     [<ffffffffc0d25908>] amdgpu_device_ip_resume_phase2+0x58/0xd0 
>> [amdgpu]
>>     [<ffffffffc0d29cb7>] amdgpu_device_resume+0xa7/0x2e0 [amdgpu]
>>     [<ffffffffc0d2467c>] amdgpu_pmops_resume+0x4c/0x90 [amdgpu]
>>     [<ffffffffbb02e121>] pci_pm_resume+0x71/0x100
>>     [<ffffffffbb22c551>] dpm_run_callback+0x91/0x1e0
>> unreferenced object 0xffff95c6c58dd0c0 (size 16):
>>   comm "kworker/u64:30", pid 3636, jiffies 4295452764
>>   hex dump (first 16 bytes):
>>     00 01 00 00 00 00 00 00 00 7b 51 83 c6 95 ff ff .........{Q.....
>>   backtrace (crc 70d89717):
>>     [<ffffffffbb73502a>] kmemleak_alloc+0x4a/0x80
>>     [<ffffffffbabbbf3e>] kmalloc_trace_noprof+0x28e/0x300
>>     [<ffffffffc04e6845>] _drm_edid_alloc+0x35/0x60 [drm]
>>     [<ffffffffc04e9175>] drm_edid_read_custom+0x55/0xd0 [drm]
>>     [<ffffffffc04e9244>] drm_edid_read_ddc+0x44/0x80 [drm]
>>     [<ffffffffc1061808>] dm_helpers_read_local_edid+0x1d8/0x340 [amdgpu]
>>     [<ffffffffc11b7446>] detect_link_and_local_sink+0x356/0x1230 [amdgpu]
>>     [<ffffffffc11b8366>] link_detect+0x36/0x4f0 [amdgpu]
>>     [<ffffffffc13667a0>] dc_link_detect+0x20/0x30 [amdgpu]
>>     [<ffffffffc10536f0>] dm_resume+0x1e0/0x7d0 [amdgpu]
>>     [<ffffffffc0d25908>] amdgpu_device_ip_resume_phase2+0x58/0xd0 
>> [amdgpu]
>>     [<ffffffffc0d29cb7>] amdgpu_device_resume+0xa7/0x2e0 [amdgpu]
>>     [<ffffffffc0d2467c>] amdgpu_pmops_resume+0x4c/0x90 [amdgpu]
>>     [<ffffffffbb02e121>] pci_pm_resume+0x71/0x100
>>     [<ffffffffbb22c551>] dpm_run_callback+0x91/0x1e0
>>     [<ffffffffbb22ca76>] device_resume+0xb6/0x2c0
>> Stack trace:
>>   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
>>   #1 ../tests/amdgpu/amd_mem_leak.c:202 __igt_unique____real_main208()
>>   #2 ../tests/amdgpu/amd_mem_leak.c:208 main()
>>   #3 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
>>   #4 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>>   #5 [_start+0x25]
>> Subtest connector-suspend-resume: FAIL (9.535s)
>>
>> On 9/18/24 15:38, Mario Limonciello wrote:
>>> This is the successor of Melissa's v5 series that was posted [1] as well
>>> as my series that was posted [2].
>>>
>>> Melissa's patches are mostly unmodified from v5, but the series has been
>>> rebase on the new 6.10 based amd-staging-drm-next.
>>>
>>> As were both touching similar code for fetching the EDID, I've merged 
>>> the
>>> pertinent parts of my series into this one in allowing the connector to
>>> fetch the EDID from _DDC if available for eDP as well.
>>>
>>> There are still some remaining uses of drm_edid_raw() but they touch 
>>> pure
>>> DC code, so a wrapper or macro will probably be needed to convert them.
>>> This can be for follow ups later on.
>>>
>>> Link: https://lore.kernel.org/amd-gfx/20240807203207.2830-1- 
>>> mwen@igalia.com/ [1]
>>> Link: https://lore.kernel.org/dri-devel/20240214215756.6530-1- 
>>> mario.limonciello@amd.com/ [2]
>>>
>>> v7:
>>>   * Rebase on amd-staging-drm-next which is now 6.10 based
>>>   * Fix the two LKP robot reported issues
>>>
>>> Mario Limonciello (1):
>>>    drm/amd/display: Fetch the EDID from _DDC if available for eDP
>>>
>>> Melissa Wen (9):
>>>    drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid
>>>    drm/amd/display: switch to setting physical address directly
>>>    drm/amd/display: always call connector_update when parsing
>>>      freesync_caps
>>>    drm/amd/display: remove redundant freesync parser for DP
>>>    drm/amd/display: use drm_edid_product_id for parsing EDID product 
>>> info
>>>    drm/amd/display: parse display name from drm_eld
>>>    drm/amd/display: get SAD from drm_eld when parsing EDID caps
>>>    drm/amd/display: get SADB from drm_eld when parsing EDID caps
>>>    drm/amd/display: remove dc_edid handler from
>>>      dm_helpers_parse_edid_caps
>>>
>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 200 ++++++------------
>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   4 +-
>>>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 172 +++++++++------
>>>   .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  34 +--
>>>   drivers/gpu/drm/amd/display/dc/dm_helpers.h   |   1 -
>>>   .../drm/amd/display/dc/link/link_detection.c  |   6 +-
>>>   drivers/gpu/drm/amd/include/amd_shared.h      |   5 +
>>>   7 files changed, 200 insertions(+), 222 deletions(-)
>>>
>>>
>>> base-commit: 0569603f945225067d963c8ba4fda31d967ab584
>>
> 

