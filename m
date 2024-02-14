Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B92F78548F3
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 13:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D297510E20F;
	Wed, 14 Feb 2024 12:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jwDsCnnz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C75210E1C5;
 Wed, 14 Feb 2024 12:10:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIXBxZNeODV8mJnXHLn8bc6C18BvqZdCDDNVNwNYU3rmvDtkobhTEkswHzqT0qXD2gXShmynrf8jZjEnTUACf7F7Frv5SxQIqiBMj3822eU0KZuUdVq6jFoZ+UVpJM8GjlwD9RzhVa/J/HPf7f7K/ldv53zI9xaEPDcdZg8j2/bVCgABs/RMe4NaUJRqb1zzjZ4iqecJLBH1kS6dbwBmJDAIXH4eY46ij2Nt8QhOg4wZl7C7+edoe0LvMC4mvHB4AwV7v3iX1pmryOvsbq9D7WafCsiLc/Zypvewvuyl0eMqb+ntAuVotiBzOYH8jjl5JRmpGEfcPGKDfQ7Y5ANwOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ea50wnus8duH9Him96dfeWWE1NygmfEllaKmLVi/0A=;
 b=Xe/5O4G1KMHRrwaZvEM2KSU4Q2XFQCJKLr00RcFHIJoLCL/SWNTBvgYJjUT2cJ3cwlpc7iklJwdWyp8r5cl5HhAlgi5cZHxY+RMlWF81u9SWNvGKvH3uOSYR77NhTjJ79AxHVTDHiqf4ilz6bsN8AYQFX+apX/EjERgHw8xVpPVa6ZxV8aE4OX2WSnOXl/KXvRmmvzlGiG/z4IGzwnlvlxPqP+VX95JLRV7eOtmbj5t6mXvH6899CvzTztN+3k/1dUgCNQYRqjzIjD3KIgszyR7XvW7HEyzS2kL5gdPm/HdBTxFGOfuuhoIqODzUZg+HQ4iq1qv+HLtI7Hc+e7jT2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ea50wnus8duH9Him96dfeWWE1NygmfEllaKmLVi/0A=;
 b=jwDsCnnzdbgTBk+2VLBj5rQEtOpl3sKJ2YnAEf0rapi2L4FRUdNjHf452tcDloMk1DJ29eIGE/T1MOMXFnI66FVSs9WyhNqeYJMgux13873RQqRga/cVLpa8CGKiQ6Kh8ohTjT31+sO5BD08Ot3gu08aPv8DMh/LR71w8A0+pHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6247.namprd12.prod.outlook.com (2603:10b6:208:3c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Wed, 14 Feb
 2024 12:10:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7292.022; Wed, 14 Feb 2024
 12:10:48 +0000
Message-ID: <fdcb7378-1a51-4384-a6a4-b5442c0f7ba1@amd.com>
Date: Wed, 14 Feb 2024 13:10:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] amdgpu: use trace_dma_fence_sync_to in
 amdgpu_fence_sync
Content-Language: en-US
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Alex Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-4-pierre-eric.pelloux-prayer@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240213155112.156537-4-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: c71f95d4-24f2-4926-970e-08dc2d55fad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Oi5GnFIMRvXjsaLiYu5qurQI/xFhHm7pB9SSYGgKB4F5lYZKqbylFjNXh0ixc3SdifC5f/sEXSZTtg71YPmbgIw8vtDNQbNVFzLZ0u0dKNz9CIgDb02IujpRqdlz3wcM9a6zCyxfMJn0XQQ7zSr1kW76qCZr8G7kT9AyoUUn5n2Pnd8oFQUcT9h7rMVTTwW9y/IYuvFgbtBjwN86EQf9gpBDjJF4XW62kzOMgm3WZGsgdHOktKxZC6Y9GqUU3eg99iwSoLzf9F1lMO7H1/qW75EpmzVKonLeT7Ij13LVPPmJDCKMOLRgkKhkIRtEv5t044XM4ioC/CJ8iH4LolIDyohJFi7ThcAZ30S9fgwidNb/3y6zHGDHjzvZC7DiGHKpCMPppzhP9BzlNsbGQnPoR7MOT24BBHpkANM51rdaEovO5BzQkHFlfZgCrsNVEmt74HSY1X3meHU7DNyDPUtNcA1PH+gt4NOdVWg6tNHIU/ke1/9IurFCtheQcjhDIF6JnPvWsvbGqFDRDa+/q+d1cef4VV80LSp2LHRSMJUKH54I+86TzT9ywlrkUagzKsyoqeetQ0J7rDV/PPV5wcBX9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(376002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(86362001)(83380400001)(31696002)(110136005)(316002)(6506007)(38100700002)(6486002)(478600001)(966005)(26005)(2616005)(66946007)(66476007)(6666004)(66556008)(6512007)(921011)(36756003)(31686004)(2906002)(30864003)(8936002)(5660300002)(41300700001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWMxVG9wTFBpbWJpNWlNYU9KV0o3Rm5nci95MnJ6U2pPQkkxak9ERXBIcitn?=
 =?utf-8?B?NGFwMjR6OUFqNW51Mmd5R2Q5M0lCd2d3emR4ZG5WZ2ZHZDN2RFVtejlXVmgz?=
 =?utf-8?B?MmpTdU5VOHdoOEIzOTRHVUY5ZHR2bUFPQkJZZTVJcGNtVjF4dnlHVkVRTWtR?=
 =?utf-8?B?M2VHL3czWlpqYWJydGF5d1pGdzk0K1NQcDVNYkZIVHpxY2ZnNGdvN0xPUlRT?=
 =?utf-8?B?bTNyS1hlNjM2em05VXMwQ3dhdk9oWHBONlowSEV5WTdja3k3VmRvNWZNWm5T?=
 =?utf-8?B?Vnp0cjQvQjlIWVFKZ0FvNjRoUUNvckpjb0dLMzZKVVE4QmtZWVhGd2J1Z2pt?=
 =?utf-8?B?Uyt0T1FoTUIyZlpUOEhhSEFGTmhnRnF0SkNOTi8yNUZMS2dVK2JVTXFWZCtw?=
 =?utf-8?B?eHVQRHdSYS9uUElzblNVT2JuK2VQdVhlOHhXU3daZ1RhWTZ1VUJxNmJOL01M?=
 =?utf-8?B?L3QwM1VzaUZsV0EzSVRYOWNzMWc1eC9KNHhzZzdPSmh3ZzY4SnczWTB5UEJH?=
 =?utf-8?B?R3NqK1o0eWZPSUtnZ3RUbldVZU1CNDduRnEwQVBHYW5kTitMMVZMYjA3RThr?=
 =?utf-8?B?aWs1VXdzYnlISHBna283ZS9JRnZzVFVQME5QQjNieXVtc3lYUEN0RUtiRHJt?=
 =?utf-8?B?Qm94bkZLYnBtbXo0YlRZaVNwTXZLcG0yenhwd2dRaTMyb0VSODA0WWMxdG9O?=
 =?utf-8?B?VlhlZC9haEdCTkx5TTgxdTFFcmNEeks1S1NabUN0cUlkK0dvLzVpY2pHVWVG?=
 =?utf-8?B?bDU4MjJrbGxkZ1d4MnYwQ2V4QlYrL2ZZVFIrd3YvSWMwVHJyeSt4dHRZQ01R?=
 =?utf-8?B?TEdHVTRoY3I1bTc1S1RRdUNjcVlPVG8rcUd2YWcxSnVJVnVmV2xzT0E1QkVn?=
 =?utf-8?B?bmNXY1ZoelJGNDdLMENlRVJ2a2dIRmlIdWlNcUpmOXphOHdSWk8rdzZibUZo?=
 =?utf-8?B?eHJHSkY5d1I2SDVlNlhYalkxc2RyaWhsYlJMUkxsaElJV09vR1BuQUZZcnkv?=
 =?utf-8?B?NDg2OVg3eXFOaVQvemNaSkRnb2VEWCtCOW00VGQ0cGJuZ0hBWWxCYkZmS3pV?=
 =?utf-8?B?VGx2NFlqczhRS0wxRnFDL3F1ZElzTTZEMXl2V3pFMGJxeDRrVkp2Z3hrZkJD?=
 =?utf-8?B?UUtPUXJrQkdMTG1oQXFkcURUeWxwRGRUWE92c2dIZFJnZGMyckdrbXA1a0RZ?=
 =?utf-8?B?RDZzMGVjMkxSaThsQ2daelBzeHB5NlU4L2FaU2lDRGphL3VCODY1Nk1jQzRa?=
 =?utf-8?B?aWZWQkQ4VkNxRjlJd2N1ekZvekZQNGE3M2xSSGF3aVZjUVhtc3BrL2FiM1pa?=
 =?utf-8?B?bkVnaUZ3MmtjZTRLQjNoeHZFQWE3NzBUZDJvczR0UGR5ZlcvLy9uLzhrOFkw?=
 =?utf-8?B?WUg0SzBmRkNFYXZnaW40bVkyZERBSStmSXlKR0RSaGZqbldSMmVmTHM2YkZW?=
 =?utf-8?B?c0U3UEJEU0ROUExNeGJzV2l5eS9JdTlyYzEwRzBZbytyMmVUZEhFQUZXeS9n?=
 =?utf-8?B?anZnNUo4aUZpcU1FTzFtdXpjTzdQRnJFcmkzNXdMVlNIQ0NDenJsMjhRVjNk?=
 =?utf-8?B?UkVhM3UwMzJUWERmUmdYaDllRmczQmJXRzk3S2J2dmVuTjRmTE5EcHNKOStP?=
 =?utf-8?B?TGR2NWJBZzdLNHozaVN5bElIR05tWlA4TnNxb1pma3ZUbFVnOXA1Lzd1S1Fn?=
 =?utf-8?B?MHNXZEc4L3JzamcvemNVbFptVGVNbTYrZCtzTXVlYnZ2UWt3NjhIT2czWW1l?=
 =?utf-8?B?WlBTN0VYaS9OYmhGOXVwWHE1M1Y2WVhZTVA0NXYxbEdReFRZbkdNUzNBNmxq?=
 =?utf-8?B?amFxT2cwTGlLbjVVbmdRUTdkYzVTbUhJUkluQU1PdlBZVW9jVGhqQmIza1Jx?=
 =?utf-8?B?UldlYjR1ZXFVTnNwTkR1bTRzNVY1bW9uVDd1dUJmZ1JRNWZMZjhQQ2RkNGxL?=
 =?utf-8?B?bTVKVnJNUjQvSHdmUTIrb1VySDNCWHRwaitrYkFjNVYxblcyQWRzMVFHK1Bl?=
 =?utf-8?B?elVTM0tCcy9ROGZIU1crZ3YyTzdBZW5BZ3BtcTZWcmY3Mnl0RU5wcWtvQ0tq?=
 =?utf-8?B?YVR1NWxObkJOTzB5NVBTaDV5WFZITFpCS2haWHhIaEN3UmdnVzdZRVZyKzJ0?=
 =?utf-8?Q?RnMT0q0hxNzCm6RzNeCGTGS2d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c71f95d4-24f2-4926-970e-08dc2d55fad2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 12:10:48.7918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xq/UR72iESW4PqgvpDodggSsMYfsLo90mYpGTu45hHvRGZ3kk7qY2nLTNYJy0tmM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6247
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



Am 13.02.24 um 16:50 schrieb Pierre-Eric Pelloux-Prayer:
> This makes it possible to understand the dependencies between jobs.
> Possible usage of this trace:
> * stuttering issues like Mesa !9189
> * incorrect synchronization: I don't have a link for this one, but having
>    these events was very useful to debug a virtio-gpu / native-context /
>    radeonsi sync issue
>
> I have prototype code using this in UMR, as can be see here:
>     https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37
>
> The 'reason' param currently uses __func__ but I didn't add a macro for
> this because it'd be interesting to use more descriptive names for each
> use of amdgpu_fence_sync.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  8 ++++----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           | 14 +++++++-------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c          |  8 +++-----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c          |  4 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c         | 11 ++++++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h         |  3 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c     |  4 ++--
>   7 files changed, 28 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index d17b2452cb1f..fde98e48c84b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -491,7 +491,7 @@ static int vm_update_pds(struct amdgpu_vm *vm, struct amdgpu_sync *sync)
>   	if (ret)
>   		return ret;
>   
> -	return amdgpu_sync_fence(sync, vm->last_update);
> +	return amdgpu_sync_fence(sync, vm->last_update, __func__);

__func__ is used so often that it probably deserves a macro.

Regards,
Christian.

>   }
>   
>   static uint64_t get_pte_flags(struct amdgpu_device *adev, struct kgd_mem *mem)
> @@ -1251,7 +1251,7 @@ static void unmap_bo_from_gpuvm(struct kgd_mem *mem,
>   
>   	amdgpu_vm_clear_freed(adev, vm, &bo_va->last_pt_update);
>   
> -	amdgpu_sync_fence(sync, bo_va->last_pt_update);
> +	amdgpu_sync_fence(sync, bo_va->last_pt_update, __func__);
>   }
>   
>   static int update_gpuvm_pte(struct kgd_mem *mem,
> @@ -1273,7 +1273,7 @@ static int update_gpuvm_pte(struct kgd_mem *mem,
>   		return ret;
>   	}
>   
> -	return amdgpu_sync_fence(sync, bo_va->last_pt_update);
> +	return amdgpu_sync_fence(sync, bo_va->last_pt_update, __func__);
>   }
>   
>   static int map_bo_to_gpuvm(struct kgd_mem *mem,
> @@ -2910,7 +2910,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
>   		}
>   		dma_resv_for_each_fence(&cursor, bo->tbo.base.resv,
>   					DMA_RESV_USAGE_KERNEL, fence) {
> -			ret = amdgpu_sync_fence(&sync_obj, fence);
> +			ret = amdgpu_sync_fence(&sync_obj, fence, __func__);
>   			if (ret) {
>   				pr_debug("Memory eviction: Sync BO fence failed. Try again\n");
>   				goto validate_map_fail;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 6adeddfb3d56..6830892383c3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -423,7 +423,7 @@ static int amdgpu_cs_p2_dependencies(struct amdgpu_cs_parser *p,
>   			dma_fence_put(old);
>   		}
>   
> -		r = amdgpu_sync_fence(&p->sync, fence);
> +		r = amdgpu_sync_fence(&p->sync, fence, __func__);
>   		dma_fence_put(fence);
>   		if (r)
>   			return r;
> @@ -445,7 +445,7 @@ static int amdgpu_syncobj_lookup_and_add(struct amdgpu_cs_parser *p,
>   		return r;
>   	}
>   
> -	r = amdgpu_sync_fence(&p->sync, fence);
> +	r = amdgpu_sync_fence(&p->sync, fence, __func__);
>   	dma_fence_put(fence);
>   	return r;
>   }
> @@ -1101,7 +1101,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>   	if (r)
>   		return r;
>   
> -	r = amdgpu_sync_fence(&p->sync, fpriv->prt_va->last_pt_update);
> +	r = amdgpu_sync_fence(&p->sync, fpriv->prt_va->last_pt_update, __func__);
>   	if (r)
>   		return r;
>   
> @@ -1112,7 +1112,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>   		if (r)
>   			return r;
>   
> -		r = amdgpu_sync_fence(&p->sync, bo_va->last_pt_update);
> +		r = amdgpu_sync_fence(&p->sync, bo_va->last_pt_update, __func__);
>   		if (r)
>   			return r;
>   	}
> @@ -1131,7 +1131,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>   		if (r)
>   			return r;
>   
> -		r = amdgpu_sync_fence(&p->sync, bo_va->last_pt_update);
> +		r = amdgpu_sync_fence(&p->sync, bo_va->last_pt_update, __func__);
>   		if (r)
>   			return r;
>   	}
> @@ -1144,7 +1144,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>   	if (r)
>   		return r;
>   
> -	r = amdgpu_sync_fence(&p->sync, vm->last_update);
> +	r = amdgpu_sync_fence(&p->sync, vm->last_update, __func__);
>   	if (r)
>   		return r;
>   
> @@ -1225,7 +1225,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
>   			continue;
>   		}
>   
> -		r = amdgpu_sync_fence(&p->gang_leader->explicit_sync, fence);
> +		r = amdgpu_sync_fence(&p->gang_leader->explicit_sync, fence, __func__);
>   		dma_fence_put(fence);
>   		if (r)
>   			return r;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> index ddd0891da116..96f68e025d8e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> @@ -309,7 +309,7 @@ static int amdgpu_vmid_grab_reserved(struct amdgpu_vm *vm,
>   	/* Good we can use this VMID. Remember this submission as
>   	* user of the VMID.
>   	*/
> -	r = amdgpu_sync_fence(&(*id)->active, &job->base.s_fence->finished);
> +	r = amdgpu_sync_fence(&(*id)->active, &job->base.s_fence->finished, __func__);
>   	if (r)
>   		return r;
>   
> @@ -369,8 +369,7 @@ static int amdgpu_vmid_grab_used(struct amdgpu_vm *vm,
>   		/* Good, we can use this VMID. Remember this submission as
>   		 * user of the VMID.
>   		 */
> -		r = amdgpu_sync_fence(&(*id)->active,
> -				      &job->base.s_fence->finished);
> +		r = amdgpu_sync_fence(&(*id)->active, &job->base.s_fence->finished, __func__);
>   		if (r)
>   			return r;
>   
> @@ -421,8 +420,7 @@ int amdgpu_vmid_grab(struct amdgpu_vm *vm, struct amdgpu_ring *ring,
>   			id = idle;
>   
>   			/* Remember this submission as user of the VMID */
> -			r = amdgpu_sync_fence(&id->active,
> -					      &job->base.s_fence->finished);
> +			r = amdgpu_sync_fence(&id->active, &job->base.s_fence->finished, __func__);
>   			if (r)
>   				goto error;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> index da48b6da0107..0f85370f69fa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> @@ -1219,14 +1219,14 @@ int amdgpu_mes_ctx_map_meta_data(struct amdgpu_device *adev,
>   		DRM_ERROR("failed to do vm_bo_update on meta data\n");
>   		goto error_del_bo_va;
>   	}
> -	amdgpu_sync_fence(&sync, bo_va->last_pt_update);
> +	amdgpu_sync_fence(&sync, bo_va->last_pt_update, __func__);
>   
>   	r = amdgpu_vm_update_pdes(adev, vm, false);
>   	if (r) {
>   		DRM_ERROR("failed to update pdes on meta data\n");
>   		goto error_del_bo_va;
>   	}
> -	amdgpu_sync_fence(&sync, vm->last_update);
> +	amdgpu_sync_fence(&sync, vm->last_update, __func__);
>   
>   	amdgpu_sync_wait(&sync, false);
>   	drm_exec_fini(&exec);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> index 1b013a44ca99..b6538f73eee9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> @@ -30,6 +30,7 @@
>    */
>   
>   #include <linux/dma-fence-chain.h>
> +#include <trace/events/dma_fence.h>
>   
>   #include "amdgpu.h"
>   #include "amdgpu_trace.h"
> @@ -149,10 +150,12 @@ static bool amdgpu_sync_add_later(struct amdgpu_sync *sync, struct dma_fence *f)
>    *
>    * @sync: sync object to add fence to
>    * @f: fence to sync to
> + * @reason: why do we sync to this fence
>    *
>    * Add the fence to the sync object.
>    */
> -int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f)
> +int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f,
> +		      const char *reason)
>   {
>   	struct amdgpu_sync_entry *e;
>   
> @@ -166,6 +169,8 @@ int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f)
>   	if (!e)
>   		return -ENOMEM;
>   
> +	trace_dma_fence_sync_to(f, reason);
> +
>   	hash_add(sync->fences, &e->node, f->context);
>   	e->fence = dma_fence_get(f);
>   	return 0;
> @@ -249,7 +254,7 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
>   			struct dma_fence *tmp = dma_fence_chain_contained(f);
>   
>   			if (amdgpu_sync_test_fence(adev, mode, owner, tmp)) {
> -				r = amdgpu_sync_fence(sync, f);
> +				r = amdgpu_sync_fence(sync, f, __func__);
>   				dma_fence_put(f);
>   				if (r)
>   					return r;
> @@ -358,7 +363,7 @@ int amdgpu_sync_clone(struct amdgpu_sync *source, struct amdgpu_sync *clone)
>   	hash_for_each_safe(source->fences, i, tmp, e, node) {
>   		f = e->fence;
>   		if (!dma_fence_is_signaled(f)) {
> -			r = amdgpu_sync_fence(clone, f);
> +			r = amdgpu_sync_fence(clone, f, __func__);
>   			if (r)
>   				return r;
>   		} else {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
> index cf1e9e858efd..0c58d6120053 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
> @@ -47,7 +47,8 @@ struct amdgpu_sync {
>   };
>   
>   void amdgpu_sync_create(struct amdgpu_sync *sync);
> -int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f);
> +int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f,
> +		      const char *reason);
>   int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
>   		     struct dma_resv *resv, enum amdgpu_sync_mode mode,
>   		     void *owner);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
> index bfbf59326ee1..5e30b371b956 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
> @@ -117,13 +117,13 @@ static int map_ring_data(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   	if (r)
>   		goto error_del_bo_va;
>   
> -	amdgpu_sync_fence(&sync, (*bo_va)->last_pt_update);
> +	amdgpu_sync_fence(&sync, (*bo_va)->last_pt_update, __func__);
>   
>   	r = amdgpu_vm_update_pdes(adev, vm, false);
>   	if (r)
>   		goto error_del_bo_va;
>   
> -	amdgpu_sync_fence(&sync, vm->last_update);
> +	amdgpu_sync_fence(&sync, vm->last_update, __func__);
>   
>   	amdgpu_sync_wait(&sync, false);
>   	drm_exec_fini(&exec);

