Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F24AAC373
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 14:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0419B10E66E;
	Tue,  6 May 2025 12:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C4jMA2PZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1E810E66E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 12:10:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcbRH2zKB3/tHn8Xt3kZKdyYSXJ1y5eZ3YIpaOPjdKCpmvIVmTWbyu3e6JZnExTAZPR28TPFd0zvTs/KGXMnEKyJWDJkxhLHbUig6MRWZeHiWSjHnJ9P42EqPGCbL9/FuK/2O/nIDjEdFpMfAvnsLxAYVhgk1D2fj+yrJNOJGkT/DzrN18MdI97qMD8x0+4gMalYVNPJGfYzBMzdMBwuuMexXF65iPwlmRj7wTTHZKNEVsoH0QEkiWSI1IBWx1PtFEQ/7IEWjodANsg3/2NqO5aaUFfVdeR0bfuV84zy+mVRsJDK0DybjsCChgEZe6vNRwaMqS/fooh1bGNKCJ5HkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLPHNer5QEHmEJz/JlCK6DF/mvTJC9Sg8jVgqAVmoD0=;
 b=k2QrjiKspUGVgJqOz24RWOTuIVTqukMAbgARAaA9VN5n0upWCTDUlUruGDrxRqDFceC5SzICc8uIjnjp6hbSKPQ3DOCeLCd73YeFNUZnJhUhzRPXdhExZp9EDujTjQXnqUP11VnnEqTPdMZnLINP0QGZR8XZM81jre2wq1kftyLfDiiYWlycYte40EVYDsJXF+f/3VhEOF1fCS7ddZAWvpeuU3if4lqP4MNR/5z7ndiOy8PM6t3bMhdXwclWsZN0QqzGVW8Hk1OU+Rdg7agWOw+r9qRZjqeguJzRZMv682FwCUnsAm7kUevWlrceqeKU2SI32PI+0Su3TsmjJl+78g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLPHNer5QEHmEJz/JlCK6DF/mvTJC9Sg8jVgqAVmoD0=;
 b=C4jMA2PZdmF0difVRDL21fwubHlemULglj0kB2vSMkZW3dpYQHpp1258GM04a1do0TC6KnJwk+n3j4mIkFl7NQBr1Ywyciue7FX2YhlwirN6kM87HEe28Igh9Z7oDgehmgsCdGb2VpWQ3hydD/qZNHqLvm0JmJidxqsPV1opRnw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6469.namprd12.prod.outlook.com (2603:10b6:8:b6::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.23; Tue, 6 May 2025 12:10:14 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Tue, 6 May 2025
 12:10:14 +0000
Message-ID: <7cfa2fb3-f419-4037-8c86-7559570582e3@amd.com>
Date: Tue, 6 May 2025 14:10:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/shmem-helper: Import dmabuf without mapping
 its sg_table
To: oushixiong1025@163.com
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sean Paul <sean@poorly.run>, Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
References: <20250506094740.621420-1-oushixiong1025@163.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250506094740.621420-1-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0231.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: d9493404-48fa-4090-6556-08dd8c96f4cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3RQZi9YOXhEUnVzWDZRbUVYY05vaHo5TVg0Q214UVVmRDc5emhpTzExV2Ji?=
 =?utf-8?B?UmdPY3pab3ZFQy9vRlpwWXZsZGhTTncrLzBCTmNkYXR5NG1LalkveVlGMVhP?=
 =?utf-8?B?UWhaZWJyamV6bm5ZRjNGTGdTdXZVcVJtZ1JuaWdrNXFXNlJTK1lTNDRJQWsy?=
 =?utf-8?B?QmIrdWFNUmY1WVNoY3ZYbTRmMUkvMGswVCtpaWc2cU13Q1F5L1Zma3loQk0w?=
 =?utf-8?B?RmhkQnhPUEpxcU1ac1ZrdVNhY3RCYUg5QXB4NTdWQ1g0MnByQk90MjFCV0p3?=
 =?utf-8?B?OUNnRjZXZWdUcFhtWS9Nb2pVRnZkWEJZZmY0QkhpRlMvSi9hMEhzR2lhYkFm?=
 =?utf-8?B?OE1iTFNzeUc2ejA3UVA0TG5teGFBZlhQTkJpbVREbDBHM0ZVaG9xVjRHcEVP?=
 =?utf-8?B?TXQzWW9BajE3YTcxYUhyV0M3SDVLWUxueVNxQmE0bHB1VEFHRU1RdXVoUng4?=
 =?utf-8?B?SmFoMG5wQVNna3RCK3RsYnFValY1ZXNzd3o0OUVGRUczUEFwWDNNR0xYWVhn?=
 =?utf-8?B?cXMxa1RNQVJjbkF2Nmc5SzB6S01UMzdlV2Zmci9mWW92SDFBa01zWGlac1or?=
 =?utf-8?B?VFRnTXJjbitxcmtRTExhMUVoMEZzWmU3ekNtUVRPdDg3TU1PY1VNdkR4b1dn?=
 =?utf-8?B?ZS9iOXAwbnAxQjJuN205Z25kWWY3cUNnT0dFcThYOG12bTZ3MzVrU1htODBo?=
 =?utf-8?B?UkFzQU5KcXhLbisvaDlCWVUvancwL21NMGNmSjNMQ0ZINHhzMGpYbURyM1VG?=
 =?utf-8?B?SVRZRTZwS1lGWnJhSStWUXc3cDJCMlF3SGhHZ2wyOGw3Vmt6WG9vNFNvaURX?=
 =?utf-8?B?cjVaU2wxVnp6anFoNHExQTFDbkhrM2x0RjZJRWRLOVMrM2RyemhXbVJrZTRz?=
 =?utf-8?B?MUhuTEVreXpQNEVHN3hHVk94S1ovRWZBd2tvcDFobmtleTJGb2Qxd1BYN0pR?=
 =?utf-8?B?L25IaDByR3NuWUEzejRzNXRhWHF2VkxrYmFIeEFvK2paK2xOaklyL3h2RXo3?=
 =?utf-8?B?ZUVKVmRHNzZ6MUdHYnhodm1MSGgxQkdCemVpWGRpT0hsY2dqQVgxM2g2dlBk?=
 =?utf-8?B?eUtjQ1F4WWFIV2FIOEhLNDVaMktLalRnN21HOGNWek9QVmZVbnBQZlZyNXor?=
 =?utf-8?B?U3IxOXMyUnJhcStvUkRsRDhFOFhua0ZkeDl6OHk4REdrdlJRNEljcnc3a29h?=
 =?utf-8?B?bGY4azJWNWFCYVhaVGdlMDF1YjlDVkdPY2FSMXArQmszZ0pZbEk0OFQ5ZHJD?=
 =?utf-8?B?V1ZjUG56eTZrcUlNelQ4WFZQOC9ZT1A0NndjWHlQdFFwY2pLQ295amYvY3R3?=
 =?utf-8?B?M1JvRHJWVitSS05aaHB1VXZnMmxmZkNkMVRWbUxNc1RQcnlwMm1sc29RbDlM?=
 =?utf-8?B?ejExYkZZeER5WnhrU285aUx6Y1dzSENURGZJa3FPTm5uNmdrMzlycnVweHVC?=
 =?utf-8?B?TmJ4SXZwSDdCZldHaks1U1RtY0E3bGpPM3l4bHlYN2hYN1cwaGNuZDlPQUJG?=
 =?utf-8?B?eGpyNWloTDI5Q3kxMCtvUG0xZ2ZkdnZjRThFU2lGZi92VkNQSGFCRmtsT0pM?=
 =?utf-8?B?elJkbDV3T2FZUFNLUGJ2bWZsMzUwcm5JNDhETzc3R04ydGNMdGd2bVRtU3Jh?=
 =?utf-8?B?aVRWdkZrRmZMWHZldTBVQU4rNVF0UytwalNxZ2pUYkNQc1cweCswU0dCbXZ5?=
 =?utf-8?B?WFlaY3lUaUJMWU44TXZBZm5iaFpNdkVkM28rOEc2M3JBY3R5M09LbFh0TWpr?=
 =?utf-8?B?MmRCZ2Z1T3lyMnN5bTlFWGtNQ0JUdVh2MS9xUEJVTi90TGdYV29pd1drUGZp?=
 =?utf-8?B?elJZTldZVHBRL0wzMnVHMStubDBaempsOGFyWld1RE1ETzg3Q3FQbk5CdENY?=
 =?utf-8?B?L0hJQlBSakV2alJuenBvOUNTeURzRU9PZnFTdFY2cGIxQ3psZjArWHpISEtw?=
 =?utf-8?Q?QTaPJCxw2FM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmNSYjV2M2hadTh1R0NuTmNubTIwSk1nMHVpMmJBdTJpL3lONldiNTl1aGx4?=
 =?utf-8?B?eHhNTXdwVTcxSktsRXpQZEY2dTBva3g5VE0rSCtSRGtYLzU0dFZzTEZ1M1k0?=
 =?utf-8?B?anBvYmFvemJUQjVOeW91U3IramlKWGI0cVdyVGRicmkvQ2Q2NThyYk94dDcv?=
 =?utf-8?B?bTB4eVZjZ09UVGhyU0FrTVo4MjJBcjd4YWpxWU4xZjBRL2RNaFR4alFlR2Jy?=
 =?utf-8?B?elRHa21BVExvU1N5UGNaMXZ5UGFtak11c2xicUhqUTNyZUtGdmJab3ZaL2dt?=
 =?utf-8?B?L2ZLcUx2SjNjQlYwa2RDbTl0MDRwNlZBL2NLZmFsaEI5ZzA0UnFJNnNxM2ky?=
 =?utf-8?B?Q0xJcTV0UmhybkdlZ2czZnlQZG5VbkpjeGtlQjRUTVVpLzJaQkhISWlPZkE0?=
 =?utf-8?B?WEFLUjVobFZYWXFWbTF4VWNwQ0ZJS0VVcDhnVDF6eHp6eTlNRWdSV3orUW9F?=
 =?utf-8?B?N1JHMWNldThqQzZmU1dqMjhuL2NtcEFvTWlYNm4rTndIZzR6WldPUlk2SUNh?=
 =?utf-8?B?bm5ndlRCSVI1VHhBcDFzWG1tRnhjcjhRMEpyQWNkM3VYdkFya3ByTXRIZmI1?=
 =?utf-8?B?dU4vQ1FVZkRmQVF3dCsyKzVQVGo2VXBiYTFseTZkdlNubnlDUitPU0ZDYmhH?=
 =?utf-8?B?K1JVRG1GUVM5S1NNK0tNdzR3bkU5ZUFTR004eU44U3ZRUkM3bVNTNmhYRUJx?=
 =?utf-8?B?K1hsN01HY3haRFNyazUyaS9CL3NGU01BMnlkWXcyUDlEQ2RFZFB2ZFRhc0dr?=
 =?utf-8?B?NDlBYTdLQW1PUDVOOUdDY1ZIZ1pVYU1MUDV0Kzk3UC91QmJ2MjJCbG10SERF?=
 =?utf-8?B?M1Jpa2pmYWV0aTkxRklaaGNoZ3dYelFaR202L3ZsVlB3VFAzbFFPZ1N6N3ov?=
 =?utf-8?B?TDBTY0VSMWVBeEFVeGpyMkJCdVM3dUxRb3dWQXV5cGQrb2hCMGVCWElRWGZD?=
 =?utf-8?B?QTNJbG5WdzFoRi85MUUvcjNUaklNQ3lLSExEWjYySkVBR1ZYaldsb2dIY2RN?=
 =?utf-8?B?UlNTWUxNSU1SNjZvdnB6WjZmRXJQWmhSZUNaSHl6dDh0ZGR3ZExna3VWOTdY?=
 =?utf-8?B?bE1TMUJ5bHk4aFFPR3hOcHpnR3h2WlZpcks3R25iR3RPKy9zRXRxd0g2WGlF?=
 =?utf-8?B?alpCd0JkaEFTKzFHMFFUR0RiVHFrTDhabk81UlgydDY1UkhwYWhIOVcwbFo0?=
 =?utf-8?B?M3FnWnoyUGJEakhnaVd1M280Y0ZncGQwWW1aUzJuNVVtanp4VHI0SEsrdXY0?=
 =?utf-8?B?K3FkQTYrUElOWFArZ2RjZUx3eTQ5QjhSLzdwV3pUclJhQ1JTbnBWYjNkUGp6?=
 =?utf-8?B?eDFVNjJ3bTM1elJoS3hQc2VRaDY4aGxiWVRmL3FNUnRCTG5wRldsSFc4YTNr?=
 =?utf-8?B?QU0xajdyS1M5S3ZORnFXcmZLVTkwZkI0VG9udlVIVGdPOGpSMUlpZ1lEOWps?=
 =?utf-8?B?QUpIcWlXZEpqZC9PSGFDVzZNWkVSNEJXcVhBOUNnWUg0V3I1aFQ2cVp5MUJy?=
 =?utf-8?B?cCtEYzVvR0IrWFBsQTF6UEVLRTJLdFUzc0RoRHZhTXVjclIyUTlpcStCYVVj?=
 =?utf-8?B?b0t6L1NGN0trMXUrYkhuUzI2TTZMMllyL25NNE84d0xlL3kyMVN0Q2svRVBM?=
 =?utf-8?B?NG1ueGxqMVQ4NEc0L1o2aTBCUmhhY3RhKzlOUHMxYzlpcW8rSmRRYTFLaXlm?=
 =?utf-8?B?Z0t4dklWeTduYmNxTE9DeUkwTUFpd0tTaEhhN0JMdmhoQUp2SCt4SXJKSEFW?=
 =?utf-8?B?QXVZdUdMTmI0VXdMZUhlQW81QkxvejRuSkx6d2swY2ZyWk9yc1NkYitBaEIx?=
 =?utf-8?B?K0YxdGdtdVJyNDloMEtsVm54S29ZeGlRNkcwTjNJcWc4RW5vMXFhSGtBdktE?=
 =?utf-8?B?WUYzN09pZzFRV1FPd3V5YmwwY3F6ZWU3SUx4Z2dmdkVaVDAyaEpNa2xQYWcx?=
 =?utf-8?B?YllReG9HSTZ2eWpRSFFpeno5WXVVWjdaaFdvQUg1QUxiWE5xQ2NWVDUyUnVk?=
 =?utf-8?B?UnpGSkVtN2dOcEo5Y0lWVjZRdUh3K1lLMEZEZnZySTJRYTVOU1g0ak4zRE5C?=
 =?utf-8?B?QUl5MGJrdkplVWUvMHQrd1pFYTBtSzViRE9LbDNMWEYvWlc2QjRLKzkxWGl6?=
 =?utf-8?Q?fFq97aLJGQ3/S9Qn9M1me4QUj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9493404-48fa-4090-6556-08dd8c96f4cd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 12:10:13.8606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mAEfVLsQSuO5IylkzkdB+Yu7XgAJwRrVE+qtcUk7GZxeuv/mOEKhxHQE4TUtkeDK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6469
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

On 5/6/25 11:47, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
> 
> [WHY]
> 1. Drivers using DRM_GEM_SHADOW_PLANE_HELPER_FUNCS and
>    DRM_GEM_SHMEM_DRIVER_OPS (e.g., udl, ast) do not require
>    sg_table import.
>    They only need dma_buf_vmap() to access the shared buffer's
>    kernel virtual address.
> 
> 2. On certain Aspeed-based boards, a dma_mask of 0xffff_ffff may
>    trigger SWIOTLB during dmabuf import. However, IO_TLB_SEGSIZE
>    restricts the maximum DMA streaming mapping memory, resulting in
>    errors like:
> 
>    ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)
> 
> [HOW]
> Provide a gem_prime_import implementation without sg_table mapping
> to avoid issues (e.g., "swiotlb buffer is full"). Drivers that do not
> require sg_table can adopt this.
> 
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
> v1->v2:
> 	patch rebase.
> 
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 95 ++++++++++++++++++++++++++
>  include/drm/drm_gem_shmem_helper.h     | 25 +++++++
>  2 files changed, 120 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index aa43265f4f4f..0c81a4f97684 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -39,6 +39,7 @@ MODULE_IMPORT_NS("DMA_BUF");
>  static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
>  	.free = drm_gem_shmem_object_free,
>  	.print_info = drm_gem_shmem_object_print_info,
> +	.export = drm_gem_shmem_object_prime_export,
>  	.pin = drm_gem_shmem_object_pin,
>  	.unpin = drm_gem_shmem_object_unpin,
>  	.get_sg_table = drm_gem_shmem_object_get_sg_table,
> @@ -800,6 +801,100 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
>  
> +const struct dma_buf_ops drm_gem_shmem_prime_dmabuf_ops =  {
> +	.attach = drm_gem_map_attach,
> +	.detach = drm_gem_map_detach,
> +	.map_dma_buf = drm_gem_map_dma_buf,
> +	.unmap_dma_buf = drm_gem_unmap_dma_buf,
> +	.release = drm_gem_dmabuf_release,
> +	.mmap = drm_gem_dmabuf_mmap,
> +	.vmap = drm_gem_dmabuf_vmap,
> +	.vunmap = drm_gem_dmabuf_vunmap,
> +};

Ok, I think I got it now.

You basically don't want to block providing the sg_table, but rather just avoid that it is created al the time.

In that case duplicating the exporting side indeed doesn't make much sense.

> +
> +/**
> + * drm_gem_shmem_prime_export - implementation of the export callback
> + * @shmem: shmem GEM object
> + */
> +struct dma_buf *drm_gem_shmem_prime_export(struct drm_gem_shmem_object *shmem,
> +					   int flags)
> +{
> +	struct drm_gem_object *obj = &shmem->base;
> +	struct drm_device *dev = obj->dev;
> +	struct dma_buf_export_info exp_info = {
> +		.exp_name = KBUILD_MODNAME, /* white lie for debug */
> +		.owner = dev->driver->fops->owner,
> +		.ops = &drm_gem_shmem_prime_dmabuf_ops,
> +		.size = obj->size,
> +		.flags = flags,
> +		.priv = obj,
> +		.resv = obj->resv,
> +	};
> +
> +	return drm_gem_dmabuf_export(dev, &exp_info);
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_export);

And that here is then identical to drm_gem_prime_export().

> +
> +/**
> + * drm_gem_shmem_prime_import - Import dmabuf without mapping its sg_table
> + * @dev: Device to import into
> + * @dma_buf: dma-buf object to import
> + *
> + * Drivers that use the shmem helpers but also wants to import dmabuf without
> + * mapping its sg_table can use this as their &drm_driver.gem_prime_import
> + * implementation.
> + */
> +struct drm_gem_object *drm_gem_shmem_prime_import(struct drm_device *dev,
> +						  struct dma_buf *dma_buf)
> +{

This is the only function which actually has some functional difference.

> +	struct dma_buf_attachment *attach;
> +	struct drm_gem_shmem_object *shmem;
> +	size_t size;
> +	int ret;
> +


> +	if (dma_buf->ops == &drm_gem_shmem_prime_dmabuf_ops) {
> +		struct drm_gem_object *obj;
> +
> +		obj = dma_buf->priv;
> +		if (obj->dev == dev) {
> +			/*
> +			 * Importing dmabuf exported from our own gem increases
> +			 * refcount on gem itself instead of f_count of dmabuf.
> +			 */
> +			drm_gem_object_get(obj);
> +			return obj;
> +		}
> +	}

And you have the other two just to be able to check the dma_buf->ops in this chunk here.

I suggest that you either expose drm_gem_prime_dmabuf_ops to drm_gem_shmem_helper.c or make this chunk a separate function which is called from drm_gem_shmem_prime_import().

And BTW you need a better name than drm_gem_shmem_prime_import(), something which makes clear that only vmap is supported on the buffer.

Apart from that this seems to make sense to me now,
Christian.

> +
> +	attach = dma_buf_attach(dma_buf, dev->dev);
> +	if (IS_ERR(attach))
> +		return ERR_CAST(attach);
> +
> +	get_dma_buf(dma_buf);
> +
> +	size = PAGE_ALIGN(attach->dmabuf->size);
> +
> +	shmem = __drm_gem_shmem_create(dev, size, true, NULL);
> +	if (IS_ERR(shmem)) {
> +		ret = PTR_ERR(shmem);
> +		goto fail_detach;
> +	}
> +
> +	drm_dbg_prime(dev, "size = %zu\n", size);
> +
> +	shmem->base.import_attach = attach;
> +	shmem->base.resv = dma_buf->resv;
> +
> +	return &shmem->base;
> +
> +fail_detach:
> +	dma_buf_detach(dma_buf, attach);
> +	dma_buf_put(dma_buf);
> +
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import);
> +
>  MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
>  MODULE_IMPORT_NS("DMA_BUF");
>  MODULE_LICENSE("GPL v2");
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index b4f993da3cae..f2b4cc85b7f9 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -121,6 +121,8 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
>  void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
>  				 struct iosys_map *map);
>  int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma);
> +struct dma_buf *drm_gem_shmem_prime_export(struct drm_gem_shmem_object *shmem,
> +					   int flags);
>  
>  int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem);
>  void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem);
> @@ -179,6 +181,19 @@ static inline void drm_gem_shmem_object_print_info(struct drm_printer *p, unsign
>  	drm_gem_shmem_print_info(shmem, p, indent);
>  }
>  
> +/**
> + * drm_gem_shmem_object_prime_export - GEM object function for export()
> + * @obj: GEM object
> + *
> + */
> +static inline struct dma_buf *drm_gem_shmem_object_prime_export(struct drm_gem_object *obj,
> +								int flags)
> +{
> +	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> +
> +	return drm_gem_shmem_prime_export(shmem, flags);
> +}
> +
>  /**
>   * drm_gem_shmem_object_pin - GEM object function for drm_gem_shmem_pin()
>   * @obj: GEM object
> @@ -287,6 +302,8 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>  				    struct sg_table *sgt);
>  int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>  			      struct drm_mode_create_dumb *args);
> +struct drm_gem_object *drm_gem_shmem_prime_import(struct drm_device *dev,
> +						  struct dma_buf *buf);
>  
>  /**
>   * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
> @@ -298,4 +315,12 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
>  	.dumb_create		   = drm_gem_shmem_dumb_create
>  
> +/**
> + * This macro provides a shmem GEM operations that implementate a simple
> + * gem_prime_import.
> + */
> +#define DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS \
> +	.gem_prime_import       = drm_gem_shmem_prime_import, \
> +	.dumb_create            = drm_gem_shmem_dumb_create
> +
>  #endif /* __DRM_GEM_SHMEM_HELPER_H__ */

