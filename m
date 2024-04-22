Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484A08AC91F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 11:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8141C10F512;
	Mon, 22 Apr 2024 09:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GPgJ0SAk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE1710EA98;
 Mon, 22 Apr 2024 09:40:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9cfghiiWF62LcLFtasvo2QNnpvSDEmdPraivESQwVbqNFRpfYdj468pc5C2Ks/ZeuJaBMi/YX6l9VsrF0Ieywh5jdNjfI8Pt701+XEteU21rkNtMurm1SkxtkxC4maNtk28SLzh4SkbAYA2oE0Q49jZWxbDKA3RFLHrEuvmrj48AzeU8dMoo4p8EgjA6eEfQdpSSC4U2QqF5k6qWOoPCIzfdpZOjz2ZEt0i/fViSW0/+pPaFf9+EKVs0ofDUpMiUwtcaLiJMkwstqyZtHdQjGqNvNj8ACgElGL6qIDJcHisLlAsKXy8wxMj+WxZGE5Up69KhGKbUgGVmXoPmxrKDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7FfXNpOZkkBRwPP6eyREo12+AJDXI4SGosEdM/55yM=;
 b=JB8CbZfe6ej0mfZ8DDPERAcYrrT8dM4f0LWBTJXg29ncSfWFWNJDs00NQOkabii49nlQzjLvtE0y4faFZuRzKV9Vkwan7SnmcWgH07PEcxV6b4RlOi1Iaj6zv/laZ0eFierbVnxVcUOKYbypHAdt4OueDgBWU/atsShoJINbYhiI6luvspdfH4OZaeGAvHzSKWwN2p8txJlYKGCS2HX2djBCrZVzgK2U8rFHFBMyB0QgNhtcHn/vYbbGxih9KyB5Cne7YsRSJNZ1uE+pLMEzh08o6jRgAl3jZ4uLVoPVFK8cFQD8ajNwc+VZMAIkfhsG4em9abnCeJ41RY8bcL5EeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7FfXNpOZkkBRwPP6eyREo12+AJDXI4SGosEdM/55yM=;
 b=GPgJ0SAk6NmL8J4HoYFPn19omHT5VOfm3ncK5U4JCQkC3ZTgGNLcHss42pINHWxTGXaFk7j8F0jy3ZIE4I/eAAJt84SAf0eizAnYFSXb0V/6l40PjW0nRmAVLKzD3IM1u/FJqpYDjHB6RsJgDqb498GimVUjU8NlEUPq5GC5KQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB7577.namprd12.prod.outlook.com (2603:10b6:208:43e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 09:40:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 09:40:35 +0000
Message-ID: <68f02c5c-5591-4d6f-9926-b0fc6f9f6287@amd.com>
Date: Mon, 22 Apr 2024 11:40:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Fixup bad vram size on gmc v6 and v7
To: Qiang Ma <maqianga@uniontech.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 srinivasan.shanmugam@amd.com, Arunpravin.PaneerSelvam@amd.com,
 le.ma@amd.com, Felix.Kuehling@amd.com, mukul.joshi@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240422052608.5297-1-maqianga@uniontech.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240422052608.5297-1-maqianga@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB7577:EE_
X-MS-Office365-Filtering-Correlation-Id: 57757a7c-bda0-4709-59ac-08dc62b042b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1E3REdPU05RMGtNVmsrVVBQOVo0NG1yZzN6V2lJTEowQjJFbENTeTVGZGFL?=
 =?utf-8?B?VmtldTcvZ3Zocm91VjRzZzNTcFBKRU9GUGNOalVCMlp6c2k3dzZIQjc0cGNr?=
 =?utf-8?B?NXYyU1lWVkQxSHBtZThhbHAyemt5V1FScUdnTCtsWHVoUWs5d21BeXROQlpL?=
 =?utf-8?B?ZWxwNzlnSnl5N3FYUGRueVhmdDZwUlcydm85T0E4NGdLT3hraE1XcGJPUFNu?=
 =?utf-8?B?ajFrNHAwTkdUc2lEK0xDNTFEMVJNc3dpeVhnY0duQ01wK2dRZHc4dGdFN3hm?=
 =?utf-8?B?dnRCOHh4WDdJcDJWUVBnc3MxaVVTVkt3RlhSd2NveXZIcjdyQmczYXRnRnNw?=
 =?utf-8?B?Z1lHcnpXOUZCZTNmY2lUREhXbHA0a2xDT1BLajJDR1VVaFZMWHpPUkJ5ZCtO?=
 =?utf-8?B?RmRqZkxDaWdCeElzSDRyYjR5Q0dBZjU5NHJzRjN5RHBTcnd3T0pVcmQ1aXlD?=
 =?utf-8?B?N3kwaUdNWjJZOUdLM0o0M2lzckJsZXR2WGJ2UHBwRVY3VzNrUG9DeFg2Vnor?=
 =?utf-8?B?S2FKSklwSFRmYlMxbkdCbFRXYXNPTGwraThVRU1QSTVWblVlNm1FUmJHSlZ6?=
 =?utf-8?B?b0lQb2lhZm1Icms3RHI5dis0WE9UMW8zWUtIWERleVY0OVZzb29UcW1YOGdO?=
 =?utf-8?B?V1YzUFEreFFxT0dHQVpQYjZVTTlDUnM1MVZFRVpVcWg3eklpZXdTTXJwdWRP?=
 =?utf-8?B?Z0llUjNSYnMxNkxqTVliUHRnSXg3M1IzTmhIWTNDcUJYRkpGNnUva2F0SVF4?=
 =?utf-8?B?VUcrSmxXSm9yTmxxTGx3akhzTzRXempXZHovdVJjVnM4bHdFL2h5VWV4dUdz?=
 =?utf-8?B?ZlZlS3VDQlpMaDJaYlMyVkpXeitja1pBc1ZIWElVUVUxZXVXUlN5VDF6M1dI?=
 =?utf-8?B?MHk5QUk3bG0vaWxqREJCN0lvV3hnc2NPR2UxLzJsODdBUllNYko1dWgvZ1Ir?=
 =?utf-8?B?enA1TnhicU43eGpQU01SaVI2MWZlczNoR2x5TWJkbnB5UTd6UjRZTjZraTJV?=
 =?utf-8?B?MGU2ZWRWRVowZ3NXeUM3ckZmbnNGRkZvQzZ1NGhNdFROR25PYnJ5djg4QlQy?=
 =?utf-8?B?SVMyY21FdmhDbzRIWVl2ai8zTkcxcUFuM1N0TjZJZ0NSRktwZjlHQXdtQXRE?=
 =?utf-8?B?TUkwS29IUXU5WEdvVDFHNTVGQ3FGdCtDKzhEKzdNUDVhS2MvVmhMQmM3WXZn?=
 =?utf-8?B?aW1pRE50dkdVRVd4MmVudUZsZmdIR3o2eURaOVFKR2c0cWk0WkFCRFNJWXEy?=
 =?utf-8?B?eGl5WFE1SjViNnpBNXJFRjNVQ2JHanNtRXFicmN4emovM21xRW8yTVVRa3JV?=
 =?utf-8?B?VTlCZDMzb1R1TWp0TWNoWHo0RmhhWVEybFVjM0xSWnF2T3c5RVJ1eVhYbk5S?=
 =?utf-8?B?TmlVYnBSUjh2VWZjcExvaTNXTTFLbUxOWlp6UmQrenNqdHA5S2NLM01VdHhD?=
 =?utf-8?B?WnNFbXkwcis1SU90TG1PMG9xM21WZnVlNksxeXZHdVZuQWl5QkJGdXZMTVIy?=
 =?utf-8?B?ZGhyM1YvL0ZYdHFUcEI4QVhGbHhKTFVtajdsTjRnaVNLb3FhWFEwVnZxYzds?=
 =?utf-8?B?bFlwcW1sT1AyQlJ0b1RoU1R4MkdUKytNbTRLN2NPajh2QTVhVlhzSXZJaXRx?=
 =?utf-8?B?Vlh6RUJaRXhQMUVZdmIrMFpBNkxkNlpMamJ5VmNjcm52bHN1Ym1PSlJqS29s?=
 =?utf-8?B?OFhLdmJzenhyNHRveGhjZHZQYTZKZjNMREZDNHRFZHlJZ1N2WmF0eUJhUmhN?=
 =?utf-8?Q?VjBMbRicNw06xqQRuSbr2IiEnQkj4ylu2Ml8LQw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(921011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmphTVpoaktxcm5uTk1wcDhmRVNqTDdRWHVQVW4wZnlCVzNrbFdkMjc3T1Z4?=
 =?utf-8?B?M3p2NmpLa0ZqNFFxL09mMkk3MEhjODZYUmlTaHFabnVwNWNsNUY2ME1VYmtX?=
 =?utf-8?B?WG1zNHB3MUFaVlN5ajJIdXRKNUhTSFIwWEZCd3NMdDdwZnVZVy85REdlODg2?=
 =?utf-8?B?bDN2Z0s4TGlhVU8yREtXcU1NTjVrcXNZbWpUOWhnKzdzTkpyUFc3cytDd2U4?=
 =?utf-8?B?K3didmhWNCtmZWZBMEdGaHpRYW94MFhSSVM5SHEvbXNlOHNQenE0aW9Nek5J?=
 =?utf-8?B?UUE2RE1EY2diVmU2eDRFSkw2aWNxZkZGWHphOGIzSXdzbHY4TEZhSjlVYUlL?=
 =?utf-8?B?SXlaeGRNNGU3Z282MHhxeUJIclNRd3p0TG9tNHpQVng0My9EK2ptdUFpMXN5?=
 =?utf-8?B?eWgwa3ZLQ1dqaWtEeWNrQnZWZFJoQkV4K1A4dXM4a3lkMDFLOUVnbHlrTnRG?=
 =?utf-8?B?TEMvazZWaVVxbTZlMHhTYkpLUXpmbU1oaGEwRFpSVFFRTWdicmFuMk0xTlhw?=
 =?utf-8?B?dzVHbnI5R3UwcFVOVGRWYlp4ZlpGUUVpKy81aFp1aUtPYTZHclR4VXFZZ1NB?=
 =?utf-8?B?cS9GNGJPdW1YVkd3cVVMSWdEWlplTGFzb1dLNzZudHdkZ2hnNFFaOUJXSTly?=
 =?utf-8?B?TERWNnhUZVIyd2IveU5PdGxudng4Y3lpZ2dTZ2RwaFg5eHpFcTQ3UmpWb2xx?=
 =?utf-8?B?bSs2ODNSNUZMejBHRHl1UmNKWThqM0FYeml4REZnYnplalJCUEVwbDBEbG45?=
 =?utf-8?B?UzlLaWtZdDBqSmx1cGsvSVM2K0drY1ppSGkzUmhVK0lKWHNyRDdTb1NMWDYv?=
 =?utf-8?B?aDVHc2tnUkt6d0k0akdRSVBGSzZhNisyRG0wdlJlZU9LWUZlTjZIYitVNHdy?=
 =?utf-8?B?UFVmTngxRHJPQlIrUk5WN0I0UlU4bFdpdDZsQjZReWJFYTZnRDZDdDRXZ3R6?=
 =?utf-8?B?WlZWZmdBVDlhNEVGVmxXaVNjRmY0OFBMdFFRUlpxcEYzRGxxdkprK1lQUEt2?=
 =?utf-8?B?RlBOQXpRVFZkUmdhVTlwQVllSFVsdzkzc0ZNZGU1TFZOT0kwMisxbGNOZEt0?=
 =?utf-8?B?Q0RmUjFvTG5FdTM1MXE3MVJmR0Y1aG1TMGNmYVcwRVdRMG9IbEJvR2dWT1R1?=
 =?utf-8?B?YTVRbHJCRGJaU1ZLTFhBNEJmSU1wdUFab3lHVlJHaXNIckZWUll4blRIMm5J?=
 =?utf-8?B?aVZXb2xtRk4yMGxqdklLNWlmczMrdk5ad2NhM0lmQ3NqV3A3dnQ4a09ib25Y?=
 =?utf-8?B?Ti9wZU5lS1VLcEpyMU1aYkMwUzl2M1k1QVBXS2ZvQzBXZWM5c1dUOVg1NnMx?=
 =?utf-8?B?Tk9LaXVBOEVZSFFYMlBHS3U1eTBtR3VLTG9kUXlzWFJ6b1FCR1paVytYd21N?=
 =?utf-8?B?cFZWQ2JyeWcydWxWYXZrcWF4U1lqbDNad2V4c2FjVzJ5TVdVUFBxQWNra3ZQ?=
 =?utf-8?B?RHZSeFBuNERNdkt4anBGcHpvemxESDdOY1NjNG1WeTBHMGhwSDhENXB5NU4w?=
 =?utf-8?B?TFJGQUIyOURTRlFXTWRSZzh6Y3NlOHdYbmJWUll5WUx5Yk1lSXZMUU55cGF6?=
 =?utf-8?B?eDAzT1BnSWp2WkQyMENGVG9pL1gyQmFWelJ6cDBzRGFZM0dHNWVmMEpYQ1hD?=
 =?utf-8?B?YkFrTllHcjVGQ1Q4VkM4dnNwK290dUNFQUo2WHV5SVlGOFhXUEs0M3VKMVox?=
 =?utf-8?B?TTFUaEs3M1ArRnpyQW53c1lrSGNQTEsvN3doeTFCNGlud1kvZWhFc1hacjE4?=
 =?utf-8?B?aWR6YXAyRDlRUTAzNWV4YSs4V1ROQTlFUk1VeUtlVUlTb2dWV2IyVC9YS3kz?=
 =?utf-8?B?c3JtMElXeEJzbG1PTG9INURtdWg0ZENSYThBOVpUSTBua2ZETnFYN3h0V0JO?=
 =?utf-8?B?VjUxSzlwRXJKOW9OTW5wbWIzWGJYeTE0aVdzUkJkRXVMNnEzL1ROOHhsWFhQ?=
 =?utf-8?B?T1FHMnBmUU5SMDN6M2VnNjc4VnpTTVk3c05peDlobnJBNU0veWJkem84S2tP?=
 =?utf-8?B?UXBTamNobDRMV0kxMi8yWVdsRkx0TlgzcTBqYU1jMXlTSWMwYnNIYzNCOGhM?=
 =?utf-8?B?bGRvZ0c3a2hmRWkwbENDOTVYNEVNQkhMMTRrQUJ4bzloZFZIWGZkQmtnQjJM?=
 =?utf-8?Q?1Rzc/0KsfxgaB4FvRLw4Tk+9L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57757a7c-bda0-4709-59ac-08dc62b042b2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 09:40:35.4014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEeB1BCfo3AfWPZTTUvbU1cayYIn+LoCOWtt1VaUsBgFGZWKleOHH6BGpS6ry4J+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7577
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

Am 22.04.24 um 07:26 schrieb Qiang Ma:
> Some boards(like Oland PRO: 0x1002:0x6613) seem to have
> garbage in the upper 16 bits of the vram size register,
> kern log as follows:
>
> [    6.000000] [drm] Detected VRAM RAM=2256537600M, BAR=256M
> [    6.007812] [drm] RAM width 64bits GDDR5
> [    6.031250] [drm] amdgpu: 2256537600M of VRAM memory ready
>
> This is obviously not true, check for this and clamp the size
> properly. Fixes boards reporting bogus amounts of vram,
> kern log as follows:
>
> [    2.789062] [drm] Probable bad vram size: 0x86800800
> [    2.789062] [drm] Detected VRAM RAM=2048M, BAR=256M
> [    2.789062] [drm] RAM width 64bits GDDR5
> [    2.789062] [drm] amdgpu: 2048M of VRAM memory ready

Well we had patches like this one here before and so far we always 
rejected them.

When the mmCONFIG_MEMSIZE register isn't properly initialized then there 
is something wrong with your hardware.

Working around that in the software driver is not going to fly.

Regards,
Christian.

> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c | 11 +++++++++--
>   drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c | 13 ++++++++++---
>   2 files changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> index 23b478639921..3703695f7789 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> @@ -309,8 +309,15 @@ static int gmc_v6_0_mc_init(struct amdgpu_device *adev)
>   	}
>   	adev->gmc.vram_width = numchan * chansize;
>   	/* size in MB on si */
> -	adev->gmc.mc_vram_size = RREG32(mmCONFIG_MEMSIZE) * 1024ULL * 1024ULL;
> -	adev->gmc.real_vram_size = RREG32(mmCONFIG_MEMSIZE) * 1024ULL * 1024ULL;
> +	tmp = RREG32(mmCONFIG_MEMSIZE);
> +	/* some boards may have garbage in the upper 16 bits */
> +	if (tmp & 0xffff0000) {
> +		DRM_INFO("Probable bad vram size: 0x%08x\n", tmp);
> +		if (tmp & 0xffff)
> +			tmp &= 0xffff;
> +	}
> +	adev->gmc.mc_vram_size = tmp * 1024ULL * 1024ULL;
> +	adev->gmc.real_vram_size = adev->gmc.mc_vram_size;
>   
>   	if (!(adev->flags & AMD_IS_APU)) {
>   		r = amdgpu_device_resize_fb_bar(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> index 3da7b6a2b00d..1df1fc578ff6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> @@ -316,10 +316,10 @@ static void gmc_v7_0_mc_program(struct amdgpu_device *adev)
>   static int gmc_v7_0_mc_init(struct amdgpu_device *adev)
>   {
>   	int r;
> +	u32 tmp;
>   
>   	adev->gmc.vram_width = amdgpu_atombios_get_vram_width(adev);
>   	if (!adev->gmc.vram_width) {
> -		u32 tmp;
>   		int chansize, numchan;
>   
>   		/* Get VRAM informations */
> @@ -363,8 +363,15 @@ static int gmc_v7_0_mc_init(struct amdgpu_device *adev)
>   		adev->gmc.vram_width = numchan * chansize;
>   	}
>   	/* size in MB on si */
> -	adev->gmc.mc_vram_size = RREG32(mmCONFIG_MEMSIZE) * 1024ULL * 1024ULL;
> -	adev->gmc.real_vram_size = RREG32(mmCONFIG_MEMSIZE) * 1024ULL * 1024ULL;
> +	tmp = RREG32(mmCONFIG_MEMSIZE);
> +	/* some boards may have garbage in the upper 16 bits */
> +	if (tmp & 0xffff0000) {
> +		DRM_INFO("Probable bad vram size: 0x%08x\n", tmp);
> +		if (tmp & 0xffff)
> +			tmp &= 0xffff;
> +	}
> +	adev->gmc.mc_vram_size = tmp * 1024ULL * 1024ULL;
> +	adev->gmc.real_vram_size = adev->gmc.mc_vram_size;
>   
>   	if (!(adev->flags & AMD_IS_APU)) {
>   		r = amdgpu_device_resize_fb_bar(adev);

