Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C6AAADFF6
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 14:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F409C10E7B0;
	Wed,  7 May 2025 12:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FkNyEl72";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061.outbound.protection.outlook.com [40.107.96.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1C310E7B0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 12:59:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBtQftGPE35GVe9QmjRSeggwNDT0nz/opn5lojvM6x5+VjD79e3tmuVm1g5fYnwRR8PIvZhWRGv3q1b/E0D3zapUS+1kvbKwt9JnOE950tFWbrMPk/RTr9wGre+KoSNoriufREK7RmRNI+zE74NFtIiFKW487rnuUS7+DJWmF64gi4rxgdvrN07Uvad0bvbTQeSAeNuj1/EgEKXU1L/GnmAaShotq6dzo4jyEfiaSsNp3I6UQ6tD6qs7kYUa6Y7VYAoVQW8cgocLW3S0h9mB5AIGIw2peJAPg/wVnN9dPgyeveZWBT7ZXUrsBhqcwtaAFyC5hAUTCfHa0kX8ZNpUDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5v3rZm5uPopaBeeMYxfK9+VsOV4jnmBkLtFxr+pU7E=;
 b=yi0Hn2C+CtZckFw1pfrDsfatnT/vK9v3RDlV8aodEQNNQO+aIxVJ2z4hUXfJbLJQQm5lcwuxL/jIAzKUcUxCLyogL1pGSwcR1A/93nTFHM87pa4M6yWGFVgySLmol7A9oSBFQ3XuUKL7T5B+WYBbHTmF8nQ/9/JQiY72MoVgBqZUhv1El+1UJvqqBp56x8Phhc69VyCSXOTSPVKxbUawyUMKZA6wgQns7HvCX7GfBcE+9lpa6n5TMSMQc85XR2T/uLIrAJnz+3eAH/jbFXwHdjD/N8NR1fA72N+mo27fQw9oFbDdyUs1JH3NyrwQ6IisljnHvZijcQbAo/eOd0I44g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5v3rZm5uPopaBeeMYxfK9+VsOV4jnmBkLtFxr+pU7E=;
 b=FkNyEl72m8O8oo7v/uMPgmffqNbVDt/xFGqatf6WGnIiZk67uTJHoSTVg9WRxNmB6qMnY1d+qf4nAzUeGUARANUrPu4Ha5nMFfLtCKvw3QWGjyjyooPrJFNxIQE8fQL6Ae/oTIrW5YZMpNCfrVpLFzso5fPmaRtzMLZDgmcZ4vI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8182.namprd12.prod.outlook.com (2603:10b6:a03:4fd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 12:59:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Wed, 7 May 2025
 12:59:38 +0000
Message-ID: <6b1469c6-b463-44fc-bd91-bff5c5622270@amd.com>
Date: Wed, 7 May 2025 14:59:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/shmem-helper: Import dmabuf without mapping
 its sg_table
To: oushixiong1025@163.com
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sean Paul <sean@poorly.run>, Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
References: <20250507094728.603302-1-oushixiong1025@163.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250507094728.603302-1-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:208:256::29) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: e06e9256-35f0-4a71-7d11-08dd8d670670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czhVaTNrZUZ0b09JMllJenlZODJnMDVVdzVJcXlPVHE1VEM3L0tQYkNpY0Ft?=
 =?utf-8?B?V2xaWGFWMWdZdXRpOFFPYVlsWkJVMWtsMDdYclgvVWN3UkFSWkVLWDRYTDZD?=
 =?utf-8?B?RE5hRkIyNkdJbjM3R2xGNGpKODE4ZTkyQ3Z6S1hPWFQ5bGNQNHg0REl4VzdT?=
 =?utf-8?B?MTBSelEwMi9GWXFMdTF1VkVYaGJnWHY4ellTaHE5cktBdmxZZEZVUU1wd2Y1?=
 =?utf-8?B?cjVoYnFNNTZrbkJvd25GalFTK1FWZllzOTk1aTRtZ3dWZ1JBNG1CUzNIUFdD?=
 =?utf-8?B?RmRRd3lwUTk4K1l6dHpzaUt6MXJYYjlZRHVGd3h1MERXblF5cGxRSTlrNzNC?=
 =?utf-8?B?NFVIcXp4cnl2dWFBS24wcVZKM3dMRzllQXNnb1prUVJaeElJbGxsSTJ3WVNr?=
 =?utf-8?B?THFKQWZCZ1dVZGFhL1lESDhvVE9LaTROeUlzTUJranl2bythd3hQQ0VQYkQx?=
 =?utf-8?B?MXhBMXo4U1VwTUljdmtYYkJsV2NNbTBMOXNVZTNCNWk5NnFYK2hVVTF1eTUz?=
 =?utf-8?B?RmpHZDBJVmhEaWZVQkRCTHNReGhGcVZyQldDbUlZYVFDOFZ4U1ZmUTY2TWVi?=
 =?utf-8?B?clZINndzT0ZpejhwYzlCWUNzV1BNcGhSSURTb3NzZGQxMkYxS3BLS2dYM2xK?=
 =?utf-8?B?YzgvdFp6c3RLNGg3L3VVQVBiNXlLMHl4SzB3Uk5wL0J6SUpSMGRBanMvZTNV?=
 =?utf-8?B?YUhSSGpSYmdkWW1wcVBzZm9aQWJoR3pucW8zaG1Lc0lmSXhLQm1sVXRDa3Bk?=
 =?utf-8?B?ZHAxQ2dCM0RManplQ1F2ZUpGV01HYWhsZ1NJUjAyWE53dkxmUHF6ZWlJMENp?=
 =?utf-8?B?N3Q2VVhVKzdscDFmL0NsVXNLLzZObDlMbGd5TVpCdnlQZjRIUDE0Uk9WKzh1?=
 =?utf-8?B?cXRwbnhNTXZqSmJWWGtUME9QU2U3TzJoNHAySTl3SjlCVTRBZElwQXIwQXQ3?=
 =?utf-8?B?emxPVkh1SllkUWNSQmFVekxITThOTnVmU001TXZDNWhlZHRRcy94c1RuWHU2?=
 =?utf-8?B?R0REY3ZjQmRncWxWQlVFWUgzSUxIT2phcW1nNllxZFpXUzJQb2g0QzZURGlY?=
 =?utf-8?B?UkJ1aEZpbGRDWUo0NDdsTjJBL0dnN0xQZWx2Z1dKcVJrQkJzMkRxY1hPY25k?=
 =?utf-8?B?dlo3Z25jOUQvQjdEWWU4dDVrSFc3ZWdidzZ5VGl3QWwxYWZNeUZCVzJhSS9R?=
 =?utf-8?B?dDYvdjNCL1NTZmFoT28wZ0tQazN0S1h4emJvOEpUNnFDTHpMb0tEcEpoUlNy?=
 =?utf-8?B?Y3I4eWh2bldlUjNmU2FDcjMwdTJkUDVkdFRLeERubC9MV0ZCUkJzU1lUVVRy?=
 =?utf-8?B?UUVTbU41N3hXb3p6TVg2elFPZSt4SHUzZ2lLeVErdXg1N2huWUZuSThkK2Qx?=
 =?utf-8?B?NEpaSzk1bnhGc2QzUlU5WnJFNklCZEFTV2ZmbVc5Mzl6ODJsUWlwc1gxQnk4?=
 =?utf-8?B?dG1BRG5GM2s0T3BPVmx2S0dXdXg2cFRpSlhqcWNsNU9vVWJTbTYvSUZlTDRy?=
 =?utf-8?B?UWVVdUtBekVNdWxELy93U1M4Z0ZTTEp0Ym9UcTZiRGpSMklyemJoQkd5K3Mx?=
 =?utf-8?B?elliN2pUR3JtYXhKRzdVMXlkRWpYWk5CNjBLcDkwM0ZUTEQyZE15T0RhTHFJ?=
 =?utf-8?B?LzBkSjNwMno4MHBBRHRUejBFSko5OXAyUGJubDNneHVQYy9Ca1FPVUVjM3Rz?=
 =?utf-8?B?Z1FCYUFEMDltMFVWRElJM0FDTGVtb0VmTVpjYkM1ajlKczlzbjNxeUZwSFJ6?=
 =?utf-8?B?TSt4Z3dLZEttUTFwRGlvOEtTR2gzV3JCSy91YytNajZqbXZzZ08rY2ZidXVS?=
 =?utf-8?B?L1VVV085ZmhXS0srY3JvbVVvSkMrbXhGRU0rVHc3NnhxQlo2aGkxd3RxbGM4?=
 =?utf-8?B?RDFWK1JuVllnZFlmOXUzR1ZtOXFQVzl1VS9RRnBYTkVKTlVEUUpEZEs2eU4y?=
 =?utf-8?Q?ZOr7N2Cf7l0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWs5SWVlRXd3S1JSNjVIaXp5djN6YThmZzhDbnJnQi80MTE1am9ZaGw5ZnZK?=
 =?utf-8?B?NVdYZlpGZmRTaUJBTTY0NWxMRHhHZEMzUjRkMTgxS3VVUEVXaFBwRWxta3Vu?=
 =?utf-8?B?R1BaOGQ4MHY1eVpUekdSOFBYbklpSm5KS0FQSTBBcm5uUUg5aW5GM0pqbWJS?=
 =?utf-8?B?aFZGZHJBdzFCbmIyYWNDZlNIaHIwVDZxVWQ0R0FpMmtPemZtL2E5bWI2Q0lz?=
 =?utf-8?B?NGZxTnhOR0NydXV1ZVROZ1JGZWoyYkNERUliOXlKNVRmNk80dkJMWmtYbG5F?=
 =?utf-8?B?SndzNGN4VDhxbGJCOVBFeHBONWNrK2s1V1ZoZlQxaHRlcmY4emRmenNOU1Bs?=
 =?utf-8?B?MUowaHd4M0NKSUltUmRoS0JVZThPY3R1QlJ4L2daaWY3Q2MxU2luMVZyeHdF?=
 =?utf-8?B?MHNUQTlvNzM3dnRnM3lHYkc4alMyVHJ1aXZZMWJEUE1zWTNXRjI3Mk5QZDd0?=
 =?utf-8?B?SlNKUUl0YlNlT25UUXJMK2k2WHpXWmsrK0R6MVVxVmp5MitFenJ1V1F1Y0tE?=
 =?utf-8?B?dkJBT2V0c2N5V25Gd1QxV3BkM0Q2blBOdk15azJraStxTTE4amppQjVWMVps?=
 =?utf-8?B?QU9sazl5RFkyQStveXlUMTNlNWY5L0FaT3BxK0FrL1duZ1J5a3pVRWE3RUQ0?=
 =?utf-8?B?NlRsUThDRlJPeWhNUlBPTXkzdGNmZkRSSklOdi9hQVUzamh0UFZub1lodm9s?=
 =?utf-8?B?dDk4UmpyekVJN1VtQ0JFbEp4c0xzUTQxbGlJeUtWVDV1aUtSeERocXRkSnVH?=
 =?utf-8?B?MVdxODVhNERMM2VPREtyQVRzZjFMKzRuc1dtU284WnlPODFPdUY1K1VaTnFW?=
 =?utf-8?B?ZG9HelVHVGhrQklLcmhRaDQyTkd3WFhtcEhsYmtjNmVxOEJMY3JwZ3FRR08x?=
 =?utf-8?B?bUppSVFIcG1aRThKSTdlNlY5RzQ3ZGIrTEc5UzV3VjAvc3ppZ2lMalQrek1n?=
 =?utf-8?B?bkE2NjFZSDc5V3JSN3pWeWNVZnhac0psSi9UMFhOWjFiWHJhc1V0QVFLbE9W?=
 =?utf-8?B?aVpqUlRvRC9hdFZnWTBGR2FZdDNlRVRmQlhHbW5uR3FuVGhBYW9oaGZjMHlz?=
 =?utf-8?B?RXZibys5RjFwWXROQzNWOGFUNERrYllYbGlhaHQyeldvRmtOcWtNUEJrNEJY?=
 =?utf-8?B?UE5QT3NLRFdMckhUU2YrSGpRK0NKQ0lNdFVsRHJNbXBvUnN6WnkwaEE1VlVC?=
 =?utf-8?B?eUVFMlB1WkNxUklLUExNb0dLWHVQNkVreVhhZWhxQ0REVmcvUkRMNVFRWW5S?=
 =?utf-8?B?OVdacktTSzUzYnA1Zlh3SW5CL291ekpmMnZ5eXBUb1dyVFdjajFlam1hdVhJ?=
 =?utf-8?B?d0pNSWNmOWFRbWkzRWpEVHN6Ujh6bE03a2t4MWlpZTZwelE1STUyendZYWZ1?=
 =?utf-8?B?Q2JzT1NzMDcwV2FYRlR5bC9WVVF6cjB4K1VPNlBHdVU2eGZKV0FBNlpzVW8r?=
 =?utf-8?B?OFY3bk81b3N2K01qeUFOVnh1TFpHbVljQU1SdUtJSnJuSHpsbnBEeW5NQnlJ?=
 =?utf-8?B?MHpGVGw1aDc1U2tKM3B5TE5KdHdaNSs3ZWdCeE9QN2hvOGhDb29ZZmVUdXV0?=
 =?utf-8?B?TkZ5bS9FSEw3QWNJUXIzVWZkcXdwTDlhd2ZUVXNDbExxdktaRk5JZDg0ZEN2?=
 =?utf-8?B?dElZdzg3K3U5OVJkTXdtUkNHVmxkbEl1VStWUTJkaFMxZ1dWU2VaNUliVXpu?=
 =?utf-8?B?N0VPYmhKMVhRWG9vbHhlREVnR3BjdWdVaWUxcWNWUlRUNll3Q3hYQmxPTG1k?=
 =?utf-8?B?dEtDLzI3R2I0WnB5MmNxM2FVdzNkcTFtZ3ZLUVR3Z2JIRjYrYUxpakVTdVJj?=
 =?utf-8?B?NHF6elMvY2FCdmlaOHpoZDFCSjhtOXNkekMvWm5UR3pkVU9yVStST29ONjdV?=
 =?utf-8?B?S1BjRWVCSG1qVUlzWk1CQlQvYW5ZU09qVE42TmxBNjJDUS9QMmpwV0dnK055?=
 =?utf-8?B?aGFEZ2VhVU1uVGpDelZ4NW9WQlFBZnBlby9oL2pQdCt3WGN0ckN4bjBicFU4?=
 =?utf-8?B?cy9iUFp1N3M1cHU1aEhObEEvVzcrekJFKzFzZXB0dzkzNXBiOVYxRUlPU0pX?=
 =?utf-8?B?bHJIVnJSYkRSa2xJM3MwOHVsT2ZhclovRWVUWSt5N0JOYUFxQ0I2UWZhZW11?=
 =?utf-8?Q?V7QAMv3tUVLTViTakmekiOXYw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e06e9256-35f0-4a71-7d11-08dd8d670670
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 12:59:38.8961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Th+lRDSh+9aJsZa1zRnFidSYSsDlHup6CV20+Usqjc97Ut6xkHAGiXSP80QogFQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8182
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

On 5/7/25 11:47, oushixiong1025@163.com wrote:
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

At least from my side that looks clean, so feel free to add Reviewed-by: Christian König <christian.koenig@amd.com>

But I would like to hear other opinions, e.g. Thomas as well. If nobody objects ping me to get this merged into drm-misc-next.

Regards,
Christian.

> ---
> v1->v2:
>         Patch rebase.
> v2->v3:
>         Rename the import callback function.
>         Remove drm_gem_shmem_prime_export() and separate some codes
>         to drm_gem_prime_import_self().
> 
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 51 ++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_prime.c            | 46 +++++++++++++++++------
>  include/drm/drm_gem_shmem_helper.h     | 15 ++++++++
>  include/drm/drm_prime.h                |  3 ++
>  4 files changed, 104 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index aa43265f4f4f..85900ec1954a 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -800,6 +800,57 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
>  
> +/**
> + * drm_gem_shmem_prime_import_no_sgt - Import dmabuf without mapping its sg_table
> + * @dev: Device to import into
> + * @dma_buf: dma-buf object to import
> + *
> + * Drivers that use the shmem helpers but also wants to import dmabuf without
> + * mapping its sg_table can use this as their &drm_driver.gem_prime_import
> + * implementation.
> + */
> +struct drm_gem_object *drm_gem_shmem_prime_import_no_sgt(struct drm_device *dev,
> +							 struct dma_buf *dma_buf)
> +{
> +	struct dma_buf_attachment *attach;
> +	struct drm_gem_shmem_object *shmem;
> +	struct drm_gem_object *obj;
> +	size_t size;
> +	int ret;
> +
> +	obj = drm_gem_prime_import_self(dev, dma_buf);
> +	if (obj)
> +		return obj;
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
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_no_sgt);
> +
>  MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
>  MODULE_IMPORT_NS("DMA_BUF");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index d828502268b8..1e43b6022329 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -910,6 +910,38 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>  }
>  EXPORT_SYMBOL(drm_gem_prime_export);
>  
> +
> +/**
> + * drm_gem_prime_import_self - Import a DMA-BUF exported from the same DRM device.
> + * @dev: drm_device to check against
> + * @dma_buf: dma-buf object to import
> + *
> + * This function checks if the DMA-BUF was exported from a GEM object belonging
> + * to @dev. If so, it increments the GEM object's refcount and returns it directly.
> + *
> + * Return: GEM object if it belongs to @dev, NULL otherwise.
> + */
> +struct drm_gem_object *drm_gem_prime_import_self(struct drm_device *dev,
> +						 struct dma_buf *dma_buf)
> +{
> +	struct drm_gem_object *obj;
> +
> +	if (dma_buf->ops == &drm_gem_prime_dmabuf_ops) {
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
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL(drm_gem_prime_import_self);
> +
>  /**
>   * drm_gem_prime_import_dev - core implementation of the import callback
>   * @dev: drm_device to import into
> @@ -933,17 +965,9 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
>  	struct drm_gem_object *obj;
>  	int ret;
>  
> -	if (dma_buf->ops == &drm_gem_prime_dmabuf_ops) {
> -		obj = dma_buf->priv;
> -		if (obj->dev == dev) {
> -			/*
> -			 * Importing dmabuf exported from our own gem increases
> -			 * refcount on gem itself instead of f_count of dmabuf.
> -			 */
> -			drm_gem_object_get(obj);
> -			return obj;
> -		}
> -	}
> +	obj = drm_gem_prime_import_self(dev, dma_buf);
> +	if (obj)
> +		return obj;
>  
>  	if (!dev->driver->gem_prime_import_sg_table)
>  		return ERR_PTR(-EINVAL);
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index b4f993da3cae..6e8e907bc43e 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -287,6 +287,8 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>  				    struct sg_table *sgt);
>  int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>  			      struct drm_mode_create_dumb *args);
> +struct drm_gem_object *drm_gem_shmem_prime_import_no_sgt(struct drm_device *dev,
> +							 struct dma_buf *buf);
>  
>  /**
>   * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
> @@ -298,4 +300,17 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
>  	.dumb_create		   = drm_gem_shmem_dumb_create
>  
> +/**
> + * DRM_GEM_SHMEM_DRIVER_OPS_FOR_VMAP - shmem GEM operations
> + * 				       without mapping sg_table on
> + * 				       imported buffer.
> + *
> + * This macro provides a shortcut for setting the shmem GEM operations in
> + * the &drm_driver structure for drivers that do not require a sg_table on
> + * imported buffers. Only vmap is supported on imported buffer.
> + */
> +#define DRM_GEM_SHMEM_DRIVER_OPS_FOR_VMAP \
> +	.gem_prime_import       = drm_gem_shmem_prime_import_no_sgt, \
> +	.dumb_create            = drm_gem_shmem_dumb_create
> +
>  #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
> index fa085c44d4ca..b5179a9cde93 100644
> --- a/include/drm/drm_prime.h
> +++ b/include/drm/drm_prime.h
> @@ -100,6 +100,9 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>  unsigned long drm_prime_get_contiguous_size(struct sg_table *sgt);
>  
>  /* helper functions for importing */
> +struct drm_gem_object *drm_gem_prime_import_self(struct drm_device *dev,
> +						 struct dma_buf *dma_buf);
> +
>  struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
>  						struct dma_buf *dma_buf,
>  						struct device *attach_dev);

