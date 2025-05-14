Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E148AB6CD6
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 15:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C0F10E635;
	Wed, 14 May 2025 13:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yNr6PyLV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28D410E2BD;
 Wed, 14 May 2025 13:35:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=onauRlft1Eu1mKRvPBm7S8f3e60sqjwza+Z8J9Rg5MWVBlfaWU2ikeARzOsbPp2iVnvzNsbuBRbAJxokDDGXK9nH1h5wM2xpqs5n+2SS9QidG0mqHf4jX748A3qEEU1jObwAZOFXeWpy0LE3t4SayZJaMBGdMC3UQ6+Npo2BZkRARGQd3JlnWu/9n73yBURoaGw9XmgO+AofBzSjEb8XraYcsMOFeYerjDpVdE58vOV5rvE5zLJzW22sVmhyRfp20lD3C09HFVmq0BtDEwPvty9PHR/c3whAM4liARbiHL/BH6xL1wp6p8f4Hc3G9+1rZYAuMI8+tgjbAPjikywu4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKYpY9BfKt8K8V0rTyHTvPYO/RUz/DBYF06TmCSFpMQ=;
 b=harZFGDjJvmO4UbPgRAEsIpjnSWOjpP7J6odoCUFArfRuuNiX7Yjqd5ybjn6Apest1Fg5QNBEurV/z6LGVrUQPEjpMoWe/wfTkw/jTXLptIqNh/UZGcPXEXYF3MnV+EYtQgxJ6ZfkDG9mKVq7HpAA32ae/XFA08GFQ7niUFH2EDY2ug+2gogbuTvnMohgI6phFTTzBJPus1hMLnOTPHyqHJnFpMnfZuerFsjh3hXVraooVRYeQil4btdNaByWmUQEDuOr8Vt37m8ZuhzcQaQDnuxzVQB+fVz2dljvaGwdgW3ZuNrAtcE+O6Aldb+1/nJKcAMOOZxe1aIM+gqLBNtkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKYpY9BfKt8K8V0rTyHTvPYO/RUz/DBYF06TmCSFpMQ=;
 b=yNr6PyLVx6FIhQ8bKluWd4xTIqkjZUz9pJUqfbn/j4NXjq0n9k4ELZQHh3anAveiVgLJzT1lHTy69Or6b2kvdAVnFoOY9ub7kdJO04Zgh4PtVu5bsnoYQY4nE+U5/2hz/sXrZ5i6S2Y4IiyUPSoPAUJKmjImBCkYPOp6M6YQyOY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6580.namprd12.prod.outlook.com (2603:10b6:208:3a0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Wed, 14 May
 2025 13:35:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 13:35:35 +0000
Message-ID: <c2ad5a10-25dd-4441-a239-5fec56cfaf6e@amd.com>
Date: Wed, 14 May 2025 15:35:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 05/10] drm/amdgpu: Use dma-fence driver and timeline name
 helpers
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250513074513.81727-1-tvrtko.ursulin@igalia.com>
 <20250513074513.81727-6-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250513074513.81727-6-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0034.namprd02.prod.outlook.com
 (2603:10b6:207:3c::47) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6580:EE_
X-MS-Office365-Filtering-Correlation-Id: 0315a2cd-4c76-4e1a-306c-08dd92ec34e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGRTRW8zYXZ2bHQyVFozOFFPRnIvNmkzMis0d0lzN2J5UUVVMnF5TjVwb0ZY?=
 =?utf-8?B?c3g2ZmFSakZSM29vZ3pIb2xRWXFzZ3lMaDZQdHBob1R4aUVpNUNjcXM5UzZs?=
 =?utf-8?B?VlhENHR0NFp6OVhHbHhIZ2JLaFpOeUx3Ry9iVXh5ZHFuQStESE1KMkl4cjNG?=
 =?utf-8?B?T3VGaFZIM1EwR0lURkNOZzEwQnJBdHhXYzRLbXV4OHdEZUhlazhmK0xUaW9x?=
 =?utf-8?B?SzNsd0lNU1k0Zy92djFIdFVPaStVa0FTekF5WmNtbTNpNzltTG5JMU5LcjZC?=
 =?utf-8?B?VFdKQWhDOUQwY0FkNmRqYmxCc3AwdEtjZ29URHZ6bXhGbUErUjFsMGNLV0sy?=
 =?utf-8?B?bi9kc2gzTCtVSEl1T2ZmWWY3MGFnMDF1T3BBNVExMm04RFJraXJ6WE81TEJq?=
 =?utf-8?B?WHdaR09UT1hmbG1icVE2cDc0KzlpZVZlQXQzOTBtSkRvcmRLMm9kWE5QVWNQ?=
 =?utf-8?B?d0oydGYrTE9vQi9VcDVzdEpyS2xMSXdabTJPcXhTc3k1czQxTnFGa0VtbDIz?=
 =?utf-8?B?c3ZSWGxXWm1MYk9nZEdXaDUrMmxrNGprcUg1cURhR2taZFo4cTR5ZnRQZm9W?=
 =?utf-8?B?aExsV3d5STNrUktYS2luTU1hMXRQMDc5VCtReDhkdlN3RnZTTUJkK2YyeVEy?=
 =?utf-8?B?MjcyRkJFODB5cGN6dUxhTTJMMmtXNkVGeTlZK2UrNTBxb0Y2a3lBTUs2WVJD?=
 =?utf-8?B?aGRyWldMYUZKdE9kbHFqa200b00yL3B2dUFUaUxIVUszTDR3WUphZkszVlJV?=
 =?utf-8?B?Yjk3MXB1N2lBYmxwbHNqSVlPOE1Ya3BqTjJmWHBOMW9HWjk0eGNOOWR0MUhh?=
 =?utf-8?B?b2gycndtZ1hZcDVRVFAyZ3pTUGlxemszaW44dmJjcitCbWJuQTdpNzZjUXBv?=
 =?utf-8?B?UzVPU0I1MXgvV25SK1FBQlFGQUJIMWFsd0VKZkhZU01hZUF2bGlhZXdwWkZp?=
 =?utf-8?B?N21DRml4RGtMckRBOHZIeUlFZllRZ3R2RVd3ME0xcmhTakNhMXJmQmlSQmVR?=
 =?utf-8?B?ekNZSlZWMDlHYndISTVqdWhzVHVsMmNNNDVaV0Y0S3BmMndTWDNORGN3b3NC?=
 =?utf-8?B?OU92M0h5SURWVm5Ja2R1bzN0cS84djRNcERuc0tzdHp4Vkx3aHZTVm9jbG1F?=
 =?utf-8?B?d2JpblNsNVhmM3B1WEpyeXBlWkl5WmhkY0UrK0hZU1dvMXpieTlRU3VSaU1v?=
 =?utf-8?B?TE93Ym5LNTFCdmVIbjRCVU9PN3hQMHhSNis1MmtsdVpDR1VaN2JuQVhHaE5X?=
 =?utf-8?B?cWhES1hGWnpvK2F2UE9lN21lRUI3UFBRMnVwRnh1M1JDa2tLb0QwaHJieWZi?=
 =?utf-8?B?RlJuU056TE5BWWZZQjhuWllRQnFQMnhjM240c09QamxhcWliTk1Rc1E5MjhB?=
 =?utf-8?B?N0lxL2REcERwWDZrOVRncGNiOVo1OWh1TlY4U2h6aldINTRsQ2tlVVl2bnpp?=
 =?utf-8?B?NXBlTzYxNWplZ1RleFBQT05ML1dzRW1FK1h2aDVqSk9MLzNWOWRvSHkzaU95?=
 =?utf-8?B?U2lYVC94RTlvNFNNd2ZreTNnbm5NdkFuV05nNEdpSFZIZkVxVkJXSDJUWmFM?=
 =?utf-8?B?cFVySGtsMXM0MW5FeEVObkJwdkZOT0E1RGhDN0RDcEUyVi91T0xTOS8yODlD?=
 =?utf-8?B?L3QvUXRZVFIvQkxxQTYyTlJUaUNYcTA3WDJRRGlIMS9yUFhLU2JqcFZBdnlF?=
 =?utf-8?B?N3BKdm1DdkRzQ3Q4Y082d2VDQ1dQZFBUb0RwUUF3NllrWEZMQzFuYjYyMmdV?=
 =?utf-8?B?K0RlbnJDWUVON0UxNmd2SDk5V1g1L3RyaWJwWFgxRlNtcDlNZ3FyVXREVXpw?=
 =?utf-8?B?QktlVnA3ZmhTa0VZWHVTeHA3MGorZy9qVXJSekEvYTIxQjBRSVpqWDhoZ1ZQ?=
 =?utf-8?B?c3grT2VkVEk4VjJwdGQ2eXNJZU9sMThweWIyT0xYcGdJVWlYN29tZVJWL0sx?=
 =?utf-8?Q?V5/LuPfbY10=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW1LME9Hbk5qRkxVY0hScGhxU1N2UC92dDRBYm1nYUQyRndmQkRBbGJXWkNW?=
 =?utf-8?B?SFZBakpMY3MvNmRaWE5kcHh0cXpoMkJQdjJCd0NOUU1jMUo1ZjVFUlJEc2tR?=
 =?utf-8?B?NzRObG5RNlVDUW41Y0o0MlJSYmJob2xyTFFHMDNvWFREcXhwOTVBeXY1VU1R?=
 =?utf-8?B?NXo4a0h3VWJ1UUswYkYyRnV5THQzdW4wUHNiSjR6R1RpZG4vZkd1NnQ4YmNF?=
 =?utf-8?B?Mm9lZUdmeGFUU2Z1TkYzM2hnT1VCaDV6QTJiNllvR0JrMnRzSDZqWVNwaEky?=
 =?utf-8?B?WndFRlZlTEQybVN4Sk1sWVEwT050dTdnaktyS1Jrdk1kZXNhY2Vmd3RnZTlI?=
 =?utf-8?B?RVFqWHlzQW94ZVBxM0hjNFZ2cDltWnc1dVNDWUprT1pkVlpsWnJIT29IQXI2?=
 =?utf-8?B?S3RZYUNSTXRJUVJua2V0UFRTWmowb25sNm5lTGJ4TTJuKzlBV1BuZXUxbXVW?=
 =?utf-8?B?Z2o5dSs4Sm1VRnQ5THVzYVpmbUVVZFVVWHY5RnJjcDR3TVVNcm5XTzFub0F3?=
 =?utf-8?B?YjlQNWR2eDhjNkJ3SEdzSExUUFczT0ZZM0VSSjkrcklpcG53STk2cGFEWFhz?=
 =?utf-8?B?UnVQaHVDRWJnV1c1cjBLc2lqRkJ1WWM0Vkt1M1V5L2VwZE5OZUlyd3E4dnZO?=
 =?utf-8?B?ODk3Vy8vVnBPYWQ1Y3ZxMFhKMlc4WllrbmZSV3MrWFlsejh1S250M1ErNnZK?=
 =?utf-8?B?WVhVWVhLeVZlT0M2ZUlvRXdBdWtLWllkWGhBczVsT2NvZGNKMEpKaTFCU2Rr?=
 =?utf-8?B?WWVoS0JwQ2lLZDhuMWh4bzhlajMxekVJQ2NDZlpkODNKQ1I2eWdVa2xJL1Vx?=
 =?utf-8?B?M1NOVVp3UHd5VHdPVXBrbjF3bVArdlV3Y1NWWHlLSGZ2NzNNLzU1L0RHYTVa?=
 =?utf-8?B?cmtGcFhiMURXL2RFdUtnSzNlUU5vVUk4SmE1aEJpa3Z6VHZYelROenY1enB1?=
 =?utf-8?B?Sk0zOUZjUHlKOHFENGVpZ3RpZWtLc1JFRG5MSTFiallOQUllcUI1ZDVlWE9w?=
 =?utf-8?B?am4rNXFheDNFdDBpd2JnRDNCZlcwckk5SmxBYjBWdEdxZFo3cTl0d2pnTlRI?=
 =?utf-8?B?RTFuSGtheGxDN1Z5YmNtbVVFWkpBZnpmRTE2Z0QzVzB2Mm5QdGI0aTBORkp6?=
 =?utf-8?B?alpiZ20yMXgrWm1HRmdyd0JZeWtEMGR3VXArcHVXVGU2VVowVzh6K2UwY1RW?=
 =?utf-8?B?VE9vUE9XQ0I4V3lGcGZJUWd0ZmRuQUhSSkdrVHZ2Z1d0emFQOUJJU0h4WjU1?=
 =?utf-8?B?WEJhQWRTVlZYQW9teVJ4ZGJLZkpiSXhxVWVzeW9Yd3g0U1JRc0Nnc1QwSVl6?=
 =?utf-8?B?ZHB1Y3Q2Zi92bm9OcjE2ajNIcytDazJXOVJYaE02SkhmTy9EWGljb0pwN2Rr?=
 =?utf-8?B?QklubjZSbDR2bHZ3MDFBaVZTbGl5TXg4NVRpcmdGNUdYV2sxTCtydldhc3l1?=
 =?utf-8?B?MjdrQWZQdVk3aDJ4eG5VSWZ4M2FTT2FvT3ZSUTVRVjJBNXJ1QnRMQm5LeGpr?=
 =?utf-8?B?UmV0VnArcmRpb2x4d3FnZSt6a2JwZnFCem5QMVI3R2RVSjhpT0REZkNWa3Qz?=
 =?utf-8?B?RFJXZlBzaDZ4Q2o2SmlxalZWSWVibjBSZXpBU0NzMDB1NThzYnF0YmNRb2dM?=
 =?utf-8?B?T0Q1NTdjNjkyRFQzR25NZWIrYzBJNENtN1Qyd2RNRjMxaGZiVnE5S25TR2xo?=
 =?utf-8?B?Tys1cHlYYXRvNlZGeGZQZE1JbkhqamRubjZ4ZDVoVENiTjlNcmpOZXUwb3ZX?=
 =?utf-8?B?b3lTc3hiU3pDdTJSUmJiRElvcU5JWkt3Y1hweEN6eVU3ZUd2ZE5DZWRoM1o0?=
 =?utf-8?B?NzVmSFdWa1d1TXJ5aUVmMlhlZmhpK2EzVWRIYXVJVWEvVjE0TFk3OFcwRWNu?=
 =?utf-8?B?NEZTQ3RRYllBZStDaEh2RGMxa01GMGp0VEVGenZscVJnd1JmTERFYlUyS3NX?=
 =?utf-8?B?TmFOTDdQc0huMVhHTDJSNlpDZFZ3WVdUOTdPUVFEL3M2T1NOcmhhcmh3NTZ0?=
 =?utf-8?B?MnVibWQ1a1JJK1pZTTY3RkVaZUVGS3ltR2dVOFUwZzhTME5xMk90R2hTZ3pT?=
 =?utf-8?B?c2xicUJaUFZBbWpmc0FnOE9tTzEyKy9neEhwWlEwbWVNWGxkbHRMbkdBY1hF?=
 =?utf-8?Q?S+KOb7X2En4n+NU199GcyPc/V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0315a2cd-4c76-4e1a-306c-08dd92ec34e7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 13:35:35.5458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GdmPvizrY0oAlW5RRYdpMKMFpv89++cC6MQvQMB31x1n8SBVfQqBmHMWukMBIbJk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6580
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

On 5/13/25 09:45, Tvrtko Ursulin wrote:
> Access the dma-fence internals via the previously added helpers.
> 
> Drop the macro while at it, since the length is now more manageable.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> index 11dd2e0f7979..4c61e4168f23 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -32,9 +32,6 @@
>  #define TRACE_SYSTEM amdgpu
>  #define TRACE_INCLUDE_FILE amdgpu_trace
>  
> -#define AMDGPU_JOB_GET_TIMELINE_NAME(job) \
> -	 job->base.s_fence->finished.ops->get_timeline_name(&job->base.s_fence->finished)
> -
>  TRACE_EVENT(amdgpu_device_rreg,
>  	    TP_PROTO(unsigned did, uint32_t reg, uint32_t value),
>  	    TP_ARGS(did, reg, value),
> @@ -168,7 +165,7 @@ TRACE_EVENT(amdgpu_cs_ioctl,
>  	    TP_ARGS(job),
>  	    TP_STRUCT__entry(
>  			     __field(uint64_t, sched_job_id)
> -			     __string(timeline, AMDGPU_JOB_GET_TIMELINE_NAME(job))
> +			     __string(timeline, dma_fence_timeline_name(&job->base.s_fence->finished))
>  			     __field(unsigned int, context)
>  			     __field(unsigned int, seqno)
>  			     __field(struct dma_fence *, fence)
> @@ -194,7 +191,7 @@ TRACE_EVENT(amdgpu_sched_run_job,
>  	    TP_ARGS(job),
>  	    TP_STRUCT__entry(
>  			     __field(uint64_t, sched_job_id)
> -			     __string(timeline, AMDGPU_JOB_GET_TIMELINE_NAME(job))
> +			     __string(timeline, dma_fence_timeline_name(&job->base.s_fence->finished))
>  			     __field(unsigned int, context)
>  			     __field(unsigned int, seqno)
>  			     __string(ring, to_amdgpu_ring(job->base.sched)->name)
> @@ -585,8 +582,6 @@ TRACE_EVENT(amdgpu_reset_reg_dumps,
>  		      __entry->address,
>  		      __entry->value)
>  );
> -
> -#undef AMDGPU_JOB_GET_TIMELINE_NAME
>  #endif
>  
>  /* This part must be outside protection */

