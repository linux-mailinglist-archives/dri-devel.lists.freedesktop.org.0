Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C757AD7069
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 14:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A730310E824;
	Thu, 12 Jun 2025 12:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vkktVysy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2055.outbound.protection.outlook.com [40.107.101.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C49710E820;
 Thu, 12 Jun 2025 12:30:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyZc/Jz6l1VRfum913YY6C+We1Mq4WsbHZAdpqJFjQcf2r7qvMwrNYlNQ/ENIsQal3bCUzdWKbwYaLZoTv8I1aNVEaVVtFo3/r3iLHT6UCMr7JGjHoWLPAm2BiJ+DoCbMwKH1qzc/ZDpWJ42HCMzb8azz6gx/wVjJlMNRoAn8gB+Hp/0RMltubwjdOJ5NQ0RYGHWGympFZvHMVSKqx2kc2uEKRcSuCdJhYzZziHa+dq7Yb1Layr0KsiQ0gMLp2GqJqZ/yjXBzIeZLw18H8BG1xjVeA04DczPp3ONvXPtgcxY5HTUImsrqXzsrkNVvm9r5pLOfhPOHIKXRjcuDiIr/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ciAkbItQEFsZVM6hDM7CRYY2QCNQv6Hzyieseepbl/I=;
 b=UuUGFCFrRs22Oo6h+iAtc5THlzMkSH0qY2cE19ImmCdi2PocLpyj9RrjW/JLFan5JQOrTzRKy/nK/XMqQ1ZIRxIRpigqgf666YNQcY8D1o06lbd2xPIezEl8gKKn+/fOCNPC8lxfISC0x0HxtUkssige/J7sjzkFlaJkmYmrPE3djX0kB3iTthznlgOT8TRK97oAjzlegqJxe6Rd6E0ENTrLS1kQdVE5Bf9acOBkWMp7Neue2qgF3mF9Q/gu/f/FC4ciWc+7NteRGkVy735kme5vOjcAyQav0KoaycgjmUWZClkEv7Clp4dT4vL/9LbPP8xWahf4Kc2A2q2jyOZhPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciAkbItQEFsZVM6hDM7CRYY2QCNQv6Hzyieseepbl/I=;
 b=vkktVysyg88OH5gMFX+QDuVZCs27sPOqYIIyrZKzIaircbPnPvpshNPfSgstXX10y7AhQQuORkhQPBzE2fmAbEFtt8YiIkAAMGNbWn6HBlYYyNxX4d80ihy6nMPlmQaXryIW1lT9MMsxD4/DO/b8FbHSrX4yCKwm7s8UWd92kCA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 PH7PR12MB8779.namprd12.prod.outlook.com (2603:10b6:510:26b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.18; Thu, 12 Jun 2025 12:30:03 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290%4]) with mapi id 15.20.8835.023; Thu, 12 Jun 2025
 12:30:02 +0000
Message-ID: <c3cc254a-4018-49e1-bb6e-25b245d62f4e@amd.com>
Date: Thu, 12 Jun 2025 17:59:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/pm: Avoid more large frame warnings
From: "Lazar, Lijo" <lijo.lazar@amd.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, alexander.deucher@amd.com
Cc: kenneth.feng@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, asad.kamal@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250610212141.19445-1-palmer@dabbelt.com>
 <afd99dae-52df-46dc-9939-5364396d25a2@amd.com>
Content-Language: en-US
In-Reply-To: <afd99dae-52df-46dc-9939-5364396d25a2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0205.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::12) To DS0PR12MB7804.namprd12.prod.outlook.com
 (2603:10b6:8:142::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7804:EE_|PH7PR12MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e120ec8-4d0c-4598-cc54-08dda9acda84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QThoNFBJY2R1SnYrQWFOR0gwb2ozL1Y2M2NheXdnWDVaNWs5VHA1amlZWUh3?=
 =?utf-8?B?c0lwZ0FhdUxpZ1lHOHhHdGxnYk53QmU0b2hSTzAwRzRvL0V3QjdnY2NlMGlE?=
 =?utf-8?B?VUlra1ExSUMwSk8zQS9KREtVUXFWb0xTc3VUL2l5bkFIUTA1VERoRFA2UXlH?=
 =?utf-8?B?SGM1MTRRYm9UUU5mWEFvNFZoNFRMWm15KzB2dnVlOEo5ZHpEaXFSQi9DUUJx?=
 =?utf-8?B?SHhyazlzNWNUOXYxdCtUbis0ZytzL25KcVNkd0NkeXNVSWlYdkFZYUZ6N0JZ?=
 =?utf-8?B?eHkrQ2pFUlNGajFITkMvVVZncjZPMTBKTE1lc0Q3em1nMjV5aUYxK1RmTlFL?=
 =?utf-8?B?RElsVGhwUExnMjZ2Z2RRamZMYThnVjAwZnlRa3E5Z1pFMlhJU0VDSmhVdEF3?=
 =?utf-8?B?Y3lRa1FqUngvNWo3dmFucVdham1ZTXZYUU15bWhSelNsNzU0VnVIL3lkNlRU?=
 =?utf-8?B?SnN5S1Z4K1VUTVFZeVN6bEFNZGhLUFBVV3JqNi9lWktqcGRia0hGV2tjWDk1?=
 =?utf-8?B?REdiWHdxRWZMNDBKVWw0NGhBNiswQ0VBL3AwKzd5NDBET0J0anI2ZXYyUWZs?=
 =?utf-8?B?Q0FLdnB0azdMVXdwR3I0UUdneHArWXUxaU0ybTZUbnh1cVlBVDlrYUUvb2Fa?=
 =?utf-8?B?aGk4aGtpU3ZWRklvOGxTSWpaRzVwTHl1ZUlEdWZyZUw2TlBRQ1pvaGY3U2Zp?=
 =?utf-8?B?bGNZcXpDSWhrSDlrZ1p2eS9WRnBQL0l0eUZubWxEVHEwc1RTTHJEWmxTWTFZ?=
 =?utf-8?B?eDhnSHExTDg0cGE3UmZzMUE1NUhndk4vejlERHpteG9Ub2t0dDNpanIvVG9o?=
 =?utf-8?B?bWhDRFNyUTJzbnVYVVBnUTMrb1FFNkhQcEZ4Mm5yaGpZSDFCZm5WZkxyaDgr?=
 =?utf-8?B?a1JvNlpYcGdhN1A3bWNURTQzTTNQS3padHVRL3h4dWZVK1liQm9CNXdzaGpw?=
 =?utf-8?B?bnhZVEpENnphcjltRFpSYVFrdTIzTlZSbk5jZ0N2UUNBR0dxamFCZ2hjNkpq?=
 =?utf-8?B?dUhmUXZXdWNHZk9zZmdTSGlJK0paWWxYcVJ3aFVaY1h3M1VMaXg0UFpyc2t0?=
 =?utf-8?B?L1hMWHNiVjgwajk2bnJDSml6QmlsRUs0elBZbkEzd1hBbTBFY2I1eE5TSVlH?=
 =?utf-8?B?U01rRzl1VEFXUDgxNU9zY0lwSzJGRHBOK0dYVWtlai9KUlMzeUJIS3R2U05n?=
 =?utf-8?B?ZU0wcHN1MEQ1eXdTcHYvVlV4KzJIMk56cjdnd2k1K2wreVFyeThhVDZnNTcx?=
 =?utf-8?B?NWMwSHR5QkZaYlpXUXd1UUpiRG56VWRWSGsrUTJpWmc4b0oxYnlFWnRMOXBn?=
 =?utf-8?B?eURGQzBITEZqbDgzRTc2MW1ydDd4TXlSTENhcmo3ZkFhcmhzUkF5VFY3MDkv?=
 =?utf-8?B?My9XOTJWU0VEQUtGTUdJL1pFdm1BcWVUK0VyZEh2Rmx2SWExSFI3TGtzRGhK?=
 =?utf-8?B?WE1SV2JMenk2bDRDcXhTbGNNbGNYZTE2Mlc1eWltQ3N1R1YzTDdwTWFpY0pQ?=
 =?utf-8?B?bmtOVWN2R3JBa2IrakZaYzRiM0pIQUlULzRDSUQ4RWQ5MEYxd29aR0VyLzF0?=
 =?utf-8?B?VmEwTEJhVkJ1Z21YbE1yMHpzc3JLd3MxcHZhUXc0dXh3OUhCSENmM3VaWG5t?=
 =?utf-8?B?UFBzTTl0dHU2Wk5zcGNMNUNqUzY5dUZlTUlKbkwyZHFuVW4vN1V0K01LZEYv?=
 =?utf-8?B?U2NXUU1ycVpxNFNKK3NNWjVISUp0a2l3RFAxUDF5NWFYNHBMMlBRUzhicHFy?=
 =?utf-8?B?aWJqdlZ4NzRlOU5UaGFzaW1FNlMvMWF0ZUs0RHZmZ1Q2c21NTmJJSUgzRi9Y?=
 =?utf-8?Q?WzrCMHS5/gCqY2xayUqcl2bW4i0k3AIjPtSdg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czZtbmlJRkdkR2FZL0gxUzcrSEdGRzE2YkFmdGl5aUhIYUQ4WHpoOG5yeGZS?=
 =?utf-8?B?QmRyYzZXa2ZQTk5yYXZWa1FwRGgvYS81NnVYd3FJODRQUXJxQzA3MGNLV3lq?=
 =?utf-8?B?dnFqNml6UUJvR3U2NWpvWTh4Wis2MWV5eW1XUzFuVHRRa0JFRXFnQXBWajZo?=
 =?utf-8?B?L240a3NDMXphWUw3UXZUZjZhd1BCR2pyelBaTWFUbVhCVlFNRVJzb1F6ZHNs?=
 =?utf-8?B?S0ZKaXJRNjkrZXEydlUwWW4zYjBBYnJJWVR2d3VwdDhldE9HMW9pblZnaUpk?=
 =?utf-8?B?b0IzaG9FcXJ4N0tmU1VvY3k3b3czdml2Ymo4NkhlcVZmWkRJM3NwWVllc1My?=
 =?utf-8?B?bU1TeFcwZTVoamlMaENuY3hjNFJJUTRUcGFxV3Rwd0ozUEl0TUZjN1RjTUNX?=
 =?utf-8?B?S091ZWJsVnUrQXltelE1c05saDIxZkV5QXVVaU0waHRDaUgxSHdYOGdHcms4?=
 =?utf-8?B?ODBHekxqRGJBRG1kd0wyMnJSWTRSUldGU1BuNFJtYzRYV3JxeStvRDdOY2VP?=
 =?utf-8?B?N2Z4bjJ4alU4Q1VyMWlvWVRmZzJFKytKM3JJQTYyUTg5TmNzUndoK2hUNnBI?=
 =?utf-8?B?USttc2IwakJSRytWdFp2QVA2K2Yzd2ZVOUY2Ynk2Q1Btc005NVRnK2NjUTNu?=
 =?utf-8?B?MURldzg0ci81WTZwOUtzRTJsK1QwUDFIQk5oMktORjJleWZHNzIvcFVTRkRM?=
 =?utf-8?B?VEphaXpyaWF5TTFMc25jRXpSVnBHMm5ZQjFCdWZTVS9UQ0sxNS9aeXJJS2NS?=
 =?utf-8?B?Q1pzaDNrWXdyYXZ0K3Y0WThaTUxZVGNuckZiUDh2Zm5qdGtrbGh2SWJEaytK?=
 =?utf-8?B?M1Z6WjR0d2o2L1hIRHZmcVBiMmNZckdkbUNFN0xxdktWY0JTK0xVNEV2WDFn?=
 =?utf-8?B?VS9FUjdORHltU3ZCRXBQVUNUMFFYM2dvVnhnM0ZuQy9mNUVKN1JSaFM5eFZJ?=
 =?utf-8?B?WCtKZTZBYzZCR2tsNGZyYWl4RGYycGYvaVZhb0NvSEUrS2R4K1Mya2hUUVk3?=
 =?utf-8?B?cmo0NERtdHZrTEpHZmJucjlqM3l5RlNsbytyUWUwTDRuZzBMM05NR0lNeU5z?=
 =?utf-8?B?VjZMSzdyVlpaQmxFUk1JdDlRMGxjRVVTUE5peWpUWHEvVG1VYzRRNW8zRW9h?=
 =?utf-8?B?QnNQSndra2duS2w3Y01Cc0VmRy9JSDUrMGx3SGVpekU5Y3AwSDNtL0lqbFNn?=
 =?utf-8?B?ZkFhWFFHTzludDZRTUVzNVZmOUJoSlA2aWw4WVNUS2N3RVppekwzZVhNdk53?=
 =?utf-8?B?K0czTktHajZ0dTg0RXVnZ1FYeHN6WW9aNFlWdmdWYXA3czZxb1drUVYwRDkw?=
 =?utf-8?B?UGdwS01PT3FGZW04T3I2ZzZuQ0ZkWVRvVVFlK1l1SUxiYXd5aG13bFlhbXQ5?=
 =?utf-8?B?dTgreWlCZzZCVlhHY2VVMWhpbjNRV2dFSC8xMmlRZmJOS0pKTjhBMVpxWUY4?=
 =?utf-8?B?WGp0VjhNZTcvUnN1ZU9laDlrWE0zS2NzWEl3ZWg3cnZHd2FLZE9jMmIzQTdn?=
 =?utf-8?B?Mi80LzRPME9JUnRzYkYrYTNhZE9QSWY1STkrRXNYSEQvelNtVldJdlJ0WCtR?=
 =?utf-8?B?N3BMVnJ3N1dBSFk0T2tOazlucCsrbzcxejBKeDVGbmlHczYvWEl5OFlxMnFi?=
 =?utf-8?B?NmRIL0xGOGJ0a0tYd2F4aDAzOXFINDdnWVdmVHpJQ0oydEduaW1uQ3ZMOG9U?=
 =?utf-8?B?bXRZeHRIZ1R2OFdhZmo4ZS9iUWFQSGVCVlA5dXgvMkpRampSYXQ5RHdKVmlt?=
 =?utf-8?B?WENaTzl5SzNpM0JSb2hiUkliSkdCMXZIZUl5TUZtY3pVNU9ETVo0L2E1ZXE5?=
 =?utf-8?B?eUttYjkvRlZYNS9SRWVRS1UwdjRpR1ZHQnphandXRlFjcTI1MHZDVVhMRFJJ?=
 =?utf-8?B?a1NxRTVENUpQOC9NbGZxZnpRUTNwa2tXSVZCL1ZtK1JxM0FJVy9wV0UrNXVh?=
 =?utf-8?B?ZzRLNVR5ckRLc1dnb0RGUDJOa01hMDFNQThJczQ1YkdpWnppQWVNckJxRUNR?=
 =?utf-8?B?aWJOS055TUhHQVRObVVtUEx6NVdsRFI2UUQ5ZGpRMWk4aHZOS2RQalFYV2hE?=
 =?utf-8?B?aytiVlVrTTdCOENTcVd0RHg1VmRqNnhBWCtQb0o2MGRhUzFtSzI2NUlndHIx?=
 =?utf-8?Q?qHO0NF7hI+TVDHcqrPvjb21Ix?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e120ec8-4d0c-4598-cc54-08dda9acda84
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 12:30:02.8421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yRlJScsbP8CAUFOL8g1OiWD4Q0PEeKcEZR9TgwOWklWwIxFcvVNagVKkAhzgU67c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8779
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



On 6/11/2025 10:30 AM, Lazar, Lijo wrote:
> 
> 
> On 6/11/2025 2:51 AM, Palmer Dabbelt wrote:
>> From: Palmer Dabbelt <palmer@dabbelt.com>
>>
>> 9KiB frames seem pretty big, but without this I'm getting some warnings
>> as of 6.16-rc1
>>
>>       CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.o
>>     drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c: In function 'smu_v13_0_6_get_gpu_metrics':
>>     drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:2885:1: error: the frame size of 8304 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
>>      2885 | }
>>           | ^
>>     cc1: all warnings being treated as errors
>>
> 
> Could you also provide your build environment details?
> 
> With below in Makefile + gcc 11.4.0, stack frame size is 168 bytes.
> 
> ccflags-y += -fstack-usage
> 
> smu_v13_0_6_ppt.c:2667:16:smu_v13_0_6_get_gpu_metrics   168     static
> 
> Thanks,
> Lijo
> 

Was able to see this issue in one of our systems. This patch fixed that
-  https://patchwork.freedesktop.org/patch/658216/

Please try and let me know if it works for your config.

Thanks,
Lijo

>> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
>> ---
>>  drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
>> index 51f1fa9789ab..9824b7f4827f 100644
>> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
>> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
>> @@ -23,9 +23,19 @@
>>  # Makefile for the 'smu manager' sub-component of powerplay.
>>  # It provides the smu management services for the driver.
>>  
>> +ifneq ($(CONFIG_FRAME_WARN),0)
>> +    frame_warn_limit := 9216
>> +    ifeq ($(call test-lt, $(CONFIG_FRAME_WARN), $(frame_warn_limit)),y)
>> +        frame_warn_flag := -Wframe-larger-than=$(frame_warn_limit)
>> +    endif
>> +endif
>> +
>>  SMU13_MGR = smu_v13_0.o aldebaran_ppt.o yellow_carp_ppt.o smu_v13_0_0_ppt.o smu_v13_0_4_ppt.o \
>>  	    smu_v13_0_5_ppt.o smu_v13_0_7_ppt.o smu_v13_0_6_ppt.o smu_v13_0_12_ppt.o
>>  
>>  AMD_SWSMU_SMU13MGR = $(addprefix $(AMD_SWSMU_PATH)/smu13/,$(SMU13_MGR))
>>  
>>  AMD_POWERPLAY_FILES += $(AMD_SWSMU_SMU13MGR)
>> +
>> +CFLAGS_$(AMD_SWSMU_PATH)/smu13/smu_v13_0_12_ppt.o := $(frame_warn_flag)
>> +CFLAGS_$(AMD_SWSMU_PATH)/smu13/smu_v13_0_6_ppt.o := $(frame_warn_flag)
> 

