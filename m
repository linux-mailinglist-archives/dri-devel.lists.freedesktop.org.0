Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14897544048
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 02:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8832D10E8D1;
	Thu,  9 Jun 2022 00:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2081.outbound.protection.outlook.com [40.107.212.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064C110E8D1;
 Thu,  9 Jun 2022 00:05:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAuCWPvuUdSO+GXZZn+RB2T+crUp4Z8Ry+pYS+dmAuhYizxFamYgIyDjfwjbwLSZzJU//uksGekCNda5b9kfYj17QejqR0gKPPiCSyqvFoSncM3rSmOlBFYRawwsVD+qO0qB3BJ1ej/fuXYkKwhR9MrdkswUxN7HGS56wIq1vdSizA0gQwsSCOUq5YmdE86gCUWpy3hcmpOVUPIhmLlORqYcKbSzdlnF5297/3ODgnJlY94B42QZkRgPt5pD3DZCaPwmg6TOAaNi4vLcA5pP0SmhkF/xwbtNG2U8IGab+8iE44E3SSQeixipxvOOaWVu77XQMwf/ZvJ4vdJVtcNJsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3V14vTi6cE/Rxl4Ijd+hgKTuuq91Y0QOek/a96Fy9V8=;
 b=Hd879KYGCf/Nu6ZN1GP6Wmwk4oC55ZX7M5MlSiFo+x3QlrA3SFRRRggWVS2jgtksckuxIE6Nmw0if1xjYYAvnwwJcB8v+KJy5zfYQHeWdNl7jcfzM7CzoNZmj3WhRYs8kGqAuEb9q1fokpi58c7e51mVbThtmfNw1i1EuWI3e91g0rSRwqJQ1zADSsPAJwIA5DQDhxbEoen03X6I2p6522ynS7KXH7L2nyx1Lrn8TMr4sBXFVe2BADy1MXwKx+b3xLa9LTEkdEtp7cXtAp/g3K8YypiCZWiVq72aTfDR61bOhpumxNeoA2TJ0tFZjYVFzc74nDflcvMXQZ3WH8mUSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3V14vTi6cE/Rxl4Ijd+hgKTuuq91Y0QOek/a96Fy9V8=;
 b=pI5B65w3FrVpqEraClUYSZc27ZofJGBrfxHLCa0wlFXEnsZIeFkzTJ0VTBESa8y5vhj80uZn7657fG5aD3xJ2jZ/uZ+u6vjMX1qOERiIxOZlNBNcd6d1bKN9QtO8HkoLd3GGXRnaDVyj9vk6yHh6i8593eiwlnRXSGh7tHeH/4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA1PR12MB6091.namprd12.prod.outlook.com (2603:10b6:208:3ed::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Thu, 9 Jun
 2022 00:05:01 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::1cf6:2a9d:41d6:e8c3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::1cf6:2a9d:41d6:e8c3%4]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 00:05:01 +0000
Message-ID: <58e6d99b-8491-6168-564c-1c1acbddaef8@amd.com>
Date: Wed, 8 Jun 2022 20:04:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/8] drm/amdkfd: switch over to using drm_exec
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
References: <20220504074739.2231-1-christian.koenig@amd.com>
 <20220504074739.2231-4-christian.koenig@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20220504074739.2231-4-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR14CA0009.namprd14.prod.outlook.com
 (2603:10b6:610:60::19) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3ea6509-0b04-43d3-6bbc-08da49abb2aa
X-MS-TrafficTypeDiagnostic: IA1PR12MB6091:EE_
X-Microsoft-Antispam-PRVS: <IA1PR12MB60916745C456270027995B6E92A79@IA1PR12MB6091.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +JJA0yoHGGTnsnXzQba/3johAVzEXRID7P7rpmLs9q5GsNIL/PLTLcq+bwOPYE026DdRl3lXvGLWtLzb14vUpzJm1BERAsTUrECHpMoaiyERp8+TtgTVC+pOq5/yLQ6LRQPI6tjleBPKpoF6R5sT/aUy/7t34Boj+D3nIiIkyvJNI0AFUEXQgSDB2hx+jZODGyZX6e8LNQpKtM/qjCeLjlc70+Qe/uJAeug7RaVVFR5lBUVRBhqW+jRiBiH973CrolQRM4cscOCNd6KqgW7oErPTx23bZ7la151yB0QsIhSfwqQzQHgGcGnb/IFljQfaTIhypgNy59eCwHd6XBzWVUt6pc2SOUJ4C65TN17LV/+AeZrnRH2NqTprk5aiYsURbgqD4g8lU5AwWIPxexMFwMVPluD0/i9i0kD9tShI+8nlhPUL2xy4nG0E+svUN3bA3KmEF2ERrj8Ual87bcWFg8/CFzw3RZroSS0KXcUvNJ5+KAaVki+o0Mhr1IRQj75D9RMSQveNgKuWT9dk4pfCTa65tNpyNx0LEGOMPU1b9pdVpmJL3kJ/Ed8rt3YNI57tW87Vz5xFdAzSOv6hFUXrwYdmiGtPaB+s+aWELhbBOnaQJKoGVbt3cUiHhkKMSTcMXEfhiM1V+gqIxTfsTuTU2yfqwZLSnQ7v1aPHgaTAfAT6RQSdkb0qb99eoyfS8C1hmZIvJ2x4leQctoe2A0ysYuO21RedLIdEyUNF5MmO5gbLxBOeOuqyK5D5gOj+qbTj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(86362001)(5660300002)(38100700002)(316002)(66476007)(31686004)(31696002)(66946007)(30864003)(44832011)(4326008)(186003)(8936002)(8676002)(66556008)(83380400001)(36756003)(66574015)(26005)(53546011)(6512007)(2616005)(2906002)(508600001)(6506007)(36916002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWlHM0JjL1pkSXZRRDNGckNMcTRGK1QyNGMyc1ZuL21OL1hWanJVeXFzbkIx?=
 =?utf-8?B?NnhQZ1dVWTFzNm40Z292Um03bm1wWjZoWEM1VFZFWTR3ZGNCdW96enlqY2M2?=
 =?utf-8?B?L0lKYlBwcWt2K2JFSm1jblJzRFoyZ0ZHcUZERE1LSTJ0MWhZWU9SczBwN0dO?=
 =?utf-8?B?MHM4NW9NS2laaldPRmlVemRhV0x5SzdKOEZNVUQ0QjArcWZTV3BNU0JiRDVo?=
 =?utf-8?B?U3lGNTBtTitGb3cvaHltQTRTWENwWTFDaGJFTTVlT28vTDFMT2VhN2RBa0FS?=
 =?utf-8?B?VnhqYWNxWlFyaVJwTUJ3OENPTUZnb2t1TzVzSjErMnZXL25yOHNHRjlPN3Y2?=
 =?utf-8?B?TDVhVXN6UGF3Vkp1cDFTQWp0V1Jtb2VnWHJFemExMFNmc3JQbkxTdGhGc1Jl?=
 =?utf-8?B?MmFRUjBibnlSWmdGdFRpQThuZEtjd3FJZllHM3ZGb0RJUThJT1NpQ25rVmFt?=
 =?utf-8?B?TW1nYmJZVmlzQjk4Vkk2Tkk3NTRhRkkrRmJNUDFWSkV5MnZwYzkrRUY4Zktq?=
 =?utf-8?B?ZGw1c0xhTTBEc0xURmxrQzlOTXJUMVgzUzRyZmgyY2FuTjNOSzVRMGZ2Vm5z?=
 =?utf-8?B?SUw0ZHFjeWZZWHZuZld1VW1XMkNaNmRRcS92MEE0MXUvaW5sTjhGdFdaOUto?=
 =?utf-8?B?cHlwUkNjRGZUdkhZSEtPdG9nZmhmSzlraGJXZ0hDQ0FycG5jYTVZOVBzbjly?=
 =?utf-8?B?djVOQmNFbWtEY204L3oxYzFlMWdvbDJyTkk2ZnhKd2lJaGkwUXJHVm5ESlZF?=
 =?utf-8?B?YkNjZFV3cUVTUHZvTjgrQUhVbUJjelRoZHZnRTNHZVNUSTdtZVFzQStsWmFK?=
 =?utf-8?B?REJlNlU2dEpuM201dGJnamJFbTBPRzVCdlNZLzVjVG9YdFJVcTQxcGwwT1NN?=
 =?utf-8?B?dW5QYUcxejNjcmExRkZJTzY5bGw2THVhOVc1RTBKcThYR2l2akZwbmMxVERj?=
 =?utf-8?B?NktzcmJESXJqaUZrbVBzeFhRM3M1akZDdCtwMlAzOThzOW5HSWYwanJzT3JY?=
 =?utf-8?B?ZXlCczZzMys1MWVpNjRVaXdpOElZdEtsSytyWEJuU2FXeDFQL3JNNlppVnVu?=
 =?utf-8?B?dnhTWjh6N2RMdmI4Kzg3QjQwbnAxZi9mVndzeDk3dU9nSlRkb0NSY2J2bHdo?=
 =?utf-8?B?NXJQRmkxd3VmUXcyZ0FTcjdDMEdFOE9Db2lLcTBnZnpsR3dxUC96eThXQlVj?=
 =?utf-8?B?a3g5Ty9sNVRxVWFRZ2tjMmpObW1BbUVUbFgrcldFYnFBNjRrTUppcXhsbnh2?=
 =?utf-8?B?UXd1eFEzR3dzbEExeWpYNUIyWEFENThwbEplczRvWTlMYlU3S1VwbkVKYUxl?=
 =?utf-8?B?VW9yOGgvT2RrdnNwcXdxNjhubDVSN1FDM251WFpBL01nczhnaVZzU3duVFlV?=
 =?utf-8?B?TXdsRXhaSzlUNTczZDVhL2JTOERzT0ROemNWdGNLZ2JuRElHQXB5TEFnZU1i?=
 =?utf-8?B?dmlRRnhuVEtmazk4blRXTVFhOVo0cDNueWl1d3Q1eDRCYnhhQnFNWWZVaVB5?=
 =?utf-8?B?b09aMStndGtGdUdlMjZhZkVZWDMybTFsRWlpdHR5MkV5SUpROExjTW43UVBO?=
 =?utf-8?B?TFdraWJoaFNpSHhjMWFqd3RLbzlsaERBOWFFMWtsTzJzcldLVzB0NTRjYWVp?=
 =?utf-8?B?Rmk2anpZWHJGeHRIVXk5NnZpM3ovcEpzRUdaZEFTUVAvQkJiZzRyUGZ1azhx?=
 =?utf-8?B?Tld5UGMyQ01GK1VUcGNoRE8vTk1ZY0pEUjVacW1kNnJkR1ZFSzF3NWlyL1Z6?=
 =?utf-8?B?UG5YVUpicDNGYjhmQ1lRcmVTSWhSWDk2Ui9ZRjF3WmdJakk3NkR5T3g5QUtO?=
 =?utf-8?B?OG53TFlHc09KUGdQK3RRMDF1Ri9DaGZpKzUxbzBSVUJFaUVmc1A2NWJ1SXlR?=
 =?utf-8?B?MmJtejJZYzNnSWRJRVE5QUNJMDNPS3E3eS9zRG8zaS9Hc3l1UUVEa0J4Smtv?=
 =?utf-8?B?c29CdHdDalJFUXpScjVLR29ZaVFtRmoyc29TUUpCLzF1NklOT2FBRUZyaGJt?=
 =?utf-8?B?cnNNcGhrVVh0dFhOcEZ2a0JFbm5kVXU0SjF0Z3h1dVk0c3Y5eHYrTEhZTjhs?=
 =?utf-8?B?UkJPVCt5S3REWWFZWWY4dmtOMXZ0L1dPRys0TjhBc3hlM1dyYzY4dE5GQXBx?=
 =?utf-8?B?L0FleUZKK2FvRlNmTjhiOUhYUTlvMzlIOGZSdkVMbzYyeHdvZVlYRmxoWnYx?=
 =?utf-8?B?OC9nY0pwZW1wVmRKV3ZRTkJMVHRkMU5IL2lsSDRDRkFpMmZ1SWVZVDRsVXFa?=
 =?utf-8?B?SktvZ0lMQnY2NE5PR1NSN3Y5bDV5cll3R21qUmNESUZOeWU1RWs3bHc1eGNZ?=
 =?utf-8?B?RjRzQXc1NEhWTEROMlp4eWpxNDNKWFhieThXZFVVVllEWlZMMWlJdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ea6509-0b04-43d3-6bbc-08da49abb2aa
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 00:05:01.3657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6LFk9MDvFq6qGmlBec4j5yTwbHL8EFd1iQSfW32INw9kgRQNi7w2R1mjKrKpXZyZUALk0ZyxUNRNNKD5LL5zlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6091
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-05-04 03:47, Christian König wrote:
> Avoids quite a bit of logic and kmalloc overhead.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   5 +-
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 303 +++++++-----------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  14 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   3 +
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  32 +-
>   5 files changed, 152 insertions(+), 205 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index 4cb14c2fe53f..3f3a994c68e2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -25,12 +25,12 @@
>   #ifndef AMDGPU_AMDKFD_H_INCLUDED
>   #define AMDGPU_AMDKFD_H_INCLUDED
>   
> +#include <linux/list.h>
>   #include <linux/types.h>
>   #include <linux/mm.h>
>   #include <linux/kthread.h>
>   #include <linux/workqueue.h>
>   #include <kgd_kfd_interface.h>
> -#include <drm/ttm/ttm_execbuf_util.h>
>   #include "amdgpu_sync.h"
>   #include "amdgpu_vm.h"
>   
> @@ -66,8 +66,7 @@ struct kgd_mem {
>   	struct dma_buf *dmabuf;
>   	struct list_head attachments;
>   	/* protected by amdkfd_process_info.lock */
> -	struct ttm_validate_buffer validate_list;
> -	struct ttm_validate_buffer resv_list;
> +	struct list_head validate_list;
>   	uint32_t domain;
>   	unsigned int mapped_to_gpu_memory;
>   	uint64_t va;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 3dc5ab2764ff..64ac4f8f49be 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -25,6 +25,8 @@
>   #include <linux/sched/mm.h>
>   #include <linux/sched/task.h>
>   
> +#include <drm/drm_exec.h>
> +
>   #include "amdgpu_object.h"
>   #include "amdgpu_gem.h"
>   #include "amdgpu_vm.h"
> @@ -770,28 +772,19 @@ static void add_kgd_mem_to_kfd_bo_list(struct kgd_mem *mem,
>   				struct amdkfd_process_info *process_info,
>   				bool userptr)
>   {
> -	struct ttm_validate_buffer *entry = &mem->validate_list;
> -	struct amdgpu_bo *bo = mem->bo;
> -
> -	INIT_LIST_HEAD(&entry->head);
> -	entry->num_shared = 1;
> -	entry->bo = &bo->tbo;
> -	mutex_lock(&process_info->lock);

You removed mutex_lock, but left mutex_unlock below. Other than that, 
this patch looks reasonable. But my eyes may have glazed over with this 
much churn.

Regards,
   Felix


>   	if (userptr)
> -		list_add_tail(&entry->head, &process_info->userptr_valid_list);
> +		list_add_tail(&mem->validate_list,
> +			      &process_info->userptr_valid_list);
>   	else
> -		list_add_tail(&entry->head, &process_info->kfd_bo_list);
> +		list_add_tail(&mem->validate_list, &process_info->kfd_bo_list);
>   	mutex_unlock(&process_info->lock);
>   }
>   
>   static void remove_kgd_mem_from_kfd_bo_list(struct kgd_mem *mem,
>   		struct amdkfd_process_info *process_info)
>   {
> -	struct ttm_validate_buffer *bo_list_entry;
> -
> -	bo_list_entry = &mem->validate_list;
>   	mutex_lock(&process_info->lock);
> -	list_del(&bo_list_entry->head);
> +	list_del(&mem->validate_list);
>   	mutex_unlock(&process_info->lock);
>   }
>   
> @@ -875,13 +868,12 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr,
>    * object can track VM updates.
>    */
>   struct bo_vm_reservation_context {
> -	struct amdgpu_bo_list_entry kfd_bo; /* BO list entry for the KFD BO */
> -	unsigned int n_vms;		    /* Number of VMs reserved	    */
> -	struct amdgpu_bo_list_entry *vm_pd; /* Array of VM BO list entries  */
> -	struct ww_acquire_ctx ticket;	    /* Reservation ticket	    */
> -	struct list_head list, duplicates;  /* BO lists			    */
> -	struct amdgpu_sync *sync;	    /* Pointer to sync object	    */
> -	bool reserved;			    /* Whether BOs are reserved	    */
> +	/* DRM execution context for the reservation */
> +	struct drm_exec exec;
> +	/* Number of VMs reserved */
> +	unsigned int n_vms;
> +	/* Pointer to sync object */
> +	struct amdgpu_sync *sync;
>   };
>   
>   enum bo_vm_match {
> @@ -905,35 +897,24 @@ static int reserve_bo_and_vm(struct kgd_mem *mem,
>   
>   	WARN_ON(!vm);
>   
> -	ctx->reserved = false;
>   	ctx->n_vms = 1;
>   	ctx->sync = &mem->sync;
> -
> -	INIT_LIST_HEAD(&ctx->list);
> -	INIT_LIST_HEAD(&ctx->duplicates);
> -
> -	ctx->vm_pd = kcalloc(ctx->n_vms, sizeof(*ctx->vm_pd), GFP_KERNEL);
> -	if (!ctx->vm_pd)
> -		return -ENOMEM;
> -
> -	ctx->kfd_bo.priority = 0;
> -	ctx->kfd_bo.tv.bo = &bo->tbo;
> -	ctx->kfd_bo.tv.num_shared = 1;
> -	list_add(&ctx->kfd_bo.tv.head, &ctx->list);
> -
> -	amdgpu_vm_get_pd_bo(vm, &ctx->list, &ctx->vm_pd[0]);
> -
> -	ret = ttm_eu_reserve_buffers(&ctx->ticket, &ctx->list,
> -				     false, &ctx->duplicates);
> -	if (ret) {
> -		pr_err("Failed to reserve buffers in ttm.\n");
> -		kfree(ctx->vm_pd);
> -		ctx->vm_pd = NULL;
> -		return ret;
> +	drm_exec_init(&ctx->exec, true);
> +	drm_exec_while_not_all_locked(&ctx->exec) {
> +		ret = amdgpu_vm_lock_pd(vm, &ctx->exec);
> +		if (likely(!ret))
> +			ret = drm_exec_prepare_obj(&ctx->exec, &bo->tbo.base,
> +						   0);
> +		drm_exec_continue_on_contention(&ctx->exec);
> +		if (unlikely(ret))
> +			goto error;
>   	}
> -
> -	ctx->reserved = true;
>   	return 0;
> +
> +error:
> +	pr_err("Failed to reserve buffers in ttm.\n");
> +	drm_exec_fini(&ctx->exec);
> +	return ret;
>   }
>   
>   /**
> @@ -950,63 +931,39 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
>   				struct amdgpu_vm *vm, enum bo_vm_match map_type,
>   				struct bo_vm_reservation_context *ctx)
>   {
> -	struct amdgpu_bo *bo = mem->bo;
>   	struct kfd_mem_attachment *entry;
> -	unsigned int i;
> +	struct amdgpu_bo *bo = mem->bo;
>   	int ret;
>   
> -	ctx->reserved = false;
> -	ctx->n_vms = 0;
> -	ctx->vm_pd = NULL;
>   	ctx->sync = &mem->sync;
> +	drm_exec_init(&ctx->exec, true);
> +	drm_exec_while_not_all_locked(&ctx->exec) {
> +		ctx->n_vms = 0;
> +		list_for_each_entry(entry, &mem->attachments, list) {
> +			if ((vm && vm != entry->bo_va->base.vm) ||
> +				(entry->is_mapped != map_type
> +				&& map_type != BO_VM_ALL))
> +				continue;
>   
> -	INIT_LIST_HEAD(&ctx->list);
> -	INIT_LIST_HEAD(&ctx->duplicates);
> -
> -	list_for_each_entry(entry, &mem->attachments, list) {
> -		if ((vm && vm != entry->bo_va->base.vm) ||
> -			(entry->is_mapped != map_type
> -			&& map_type != BO_VM_ALL))
> -			continue;
> -
> -		ctx->n_vms++;
> -	}
> -
> -	if (ctx->n_vms != 0) {
> -		ctx->vm_pd = kcalloc(ctx->n_vms, sizeof(*ctx->vm_pd),
> -				     GFP_KERNEL);
> -		if (!ctx->vm_pd)
> -			return -ENOMEM;
> -	}
> -
> -	ctx->kfd_bo.priority = 0;
> -	ctx->kfd_bo.tv.bo = &bo->tbo;
> -	ctx->kfd_bo.tv.num_shared = 1;
> -	list_add(&ctx->kfd_bo.tv.head, &ctx->list);
> -
> -	i = 0;
> -	list_for_each_entry(entry, &mem->attachments, list) {
> -		if ((vm && vm != entry->bo_va->base.vm) ||
> -			(entry->is_mapped != map_type
> -			&& map_type != BO_VM_ALL))
> -			continue;
> -
> -		amdgpu_vm_get_pd_bo(entry->bo_va->base.vm, &ctx->list,
> -				&ctx->vm_pd[i]);
> -		i++;
> -	}
> +			ret = amdgpu_vm_lock_pd(vm, &ctx->exec);
> +			drm_exec_break_on_contention(&ctx->exec);
> +			if (unlikely(ret))
> +				goto error;
> +			++ctx->n_vms;
> +		}
> +		drm_exec_continue_on_contention(&ctx->exec);
>   
> -	ret = ttm_eu_reserve_buffers(&ctx->ticket, &ctx->list,
> -				     false, &ctx->duplicates);
> -	if (ret) {
> -		pr_err("Failed to reserve buffers in ttm.\n");
> -		kfree(ctx->vm_pd);
> -		ctx->vm_pd = NULL;
> -		return ret;
> +		ret = drm_exec_prepare_obj(&ctx->exec, &bo->tbo.base, 1);
> +		drm_exec_continue_on_contention(&ctx->exec);
> +		if (unlikely(ret))
> +			goto error;
>   	}
> -
> -	ctx->reserved = true;
>   	return 0;
> +
> +error:
> +	pr_err("Failed to reserve buffers in ttm.\n");
> +	drm_exec_fini(&ctx->exec);
> +	return ret;
>   }
>   
>   /**
> @@ -1027,15 +984,8 @@ static int unreserve_bo_and_vms(struct bo_vm_reservation_context *ctx,
>   	if (wait)
>   		ret = amdgpu_sync_wait(ctx->sync, intr);
>   
> -	if (ctx->reserved)
> -		ttm_eu_backoff_reservation(&ctx->ticket, &ctx->list);
> -	kfree(ctx->vm_pd);
> -
> +	drm_exec_fini(&ctx->exec);
>   	ctx->sync = NULL;
> -
> -	ctx->reserved = false;
> -	ctx->vm_pd = NULL;
> -
>   	return ret;
>   }
>   
> @@ -1616,7 +1566,6 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
>   	unsigned long bo_size = mem->bo->tbo.base.size;
>   	struct kfd_mem_attachment *entry, *tmp;
>   	struct bo_vm_reservation_context ctx;
> -	struct ttm_validate_buffer *bo_list_entry;
>   	unsigned int mapped_to_gpu_memory;
>   	int ret;
>   	bool is_imported = false;
> @@ -1644,9 +1593,8 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
>   	}
>   
>   	/* Make sure restore workers don't access the BO any more */
> -	bo_list_entry = &mem->validate_list;
>   	mutex_lock(&process_info->lock);
> -	list_del(&bo_list_entry->head);
> +	list_del(&mem->validate_list);
>   	mutex_unlock(&process_info->lock);
>   
>   	/* No more MMU notifiers */
> @@ -1945,7 +1893,7 @@ int amdgpu_amdkfd_gpuvm_map_gtt_bo_to_kernel(struct amdgpu_device *adev,
>   
>   	amdgpu_amdkfd_remove_eviction_fence(
>   		bo, mem->process_info->eviction_fence);
> -	list_del_init(&mem->validate_list.head);
> +	list_del_init(&mem->validate_list);
>   
>   	if (size)
>   		*size = amdgpu_bo_size(bo);
> @@ -2107,7 +2055,7 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
>   	 */
>   	list_for_each_entry_safe(mem, tmp_mem,
>   				 &process_info->userptr_valid_list,
> -				 validate_list.head) {
> +				 validate_list) {
>   		if (!atomic_read(&mem->invalid))
>   			continue; /* BO is still valid */
>   
> @@ -2124,7 +2072,7 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
>   			return -EAGAIN;
>   		}
>   
> -		list_move_tail(&mem->validate_list.head,
> +		list_move_tail(&mem->validate_list,
>   			       &process_info->userptr_inval_list);
>   	}
>   
> @@ -2133,7 +2081,7 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
>   
>   	/* Go through userptr_inval_list and update any invalid user_pages */
>   	list_for_each_entry(mem, &process_info->userptr_inval_list,
> -			    validate_list.head) {
> +			    validate_list) {
>   		invalid = atomic_read(&mem->invalid);
>   		if (!invalid)
>   			/* BO hasn't been invalidated since the last
> @@ -2184,50 +2132,44 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
>    */
>   static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
>   {
> -	struct amdgpu_bo_list_entry *pd_bo_list_entries;
> -	struct list_head resv_list, duplicates;
> -	struct ww_acquire_ctx ticket;
> +	struct ttm_operation_ctx ctx = { false, false };
>   	struct amdgpu_sync sync;
> +	struct drm_exec exec;
>   
>   	struct amdgpu_vm *peer_vm;
>   	struct kgd_mem *mem, *tmp_mem;
>   	struct amdgpu_bo *bo;
> -	struct ttm_operation_ctx ctx = { false, false };
> -	int i, ret;
> -
> -	pd_bo_list_entries = kcalloc(process_info->n_vms,
> -				     sizeof(struct amdgpu_bo_list_entry),
> -				     GFP_KERNEL);
> -	if (!pd_bo_list_entries) {
> -		pr_err("%s: Failed to allocate PD BO list entries\n", __func__);
> -		ret = -ENOMEM;
> -		goto out_no_mem;
> -	}
> -
> -	INIT_LIST_HEAD(&resv_list);
> -	INIT_LIST_HEAD(&duplicates);
> +	int ret;
>   
> -	/* Get all the page directory BOs that need to be reserved */
> -	i = 0;
> -	list_for_each_entry(peer_vm, &process_info->vm_list_head,
> -			    vm_list_node)
> -		amdgpu_vm_get_pd_bo(peer_vm, &resv_list,
> -				    &pd_bo_list_entries[i++]);
> -	/* Add the userptr_inval_list entries to resv_list */
> -	list_for_each_entry(mem, &process_info->userptr_inval_list,
> -			    validate_list.head) {
> -		list_add_tail(&mem->resv_list.head, &resv_list);
> -		mem->resv_list.bo = mem->validate_list.bo;
> -		mem->resv_list.num_shared = mem->validate_list.num_shared;
> -	}
> +	amdgpu_sync_create(&sync);
>   
> +	drm_exec_init(&exec, true);
>   	/* Reserve all BOs and page tables for validation */
> -	ret = ttm_eu_reserve_buffers(&ticket, &resv_list, false, &duplicates);
> -	WARN(!list_empty(&duplicates), "Duplicates should be empty");
> -	if (ret)
> -		goto out_free;
> +	drm_exec_while_not_all_locked(&exec) {
> +		/* Reserve all the page directories */
> +		list_for_each_entry(peer_vm, &process_info->vm_list_head,
> +				    vm_list_node) {
> +			ret = amdgpu_vm_lock_pd(peer_vm, &exec);
> +			drm_exec_break_on_contention(&exec);
> +			if (unlikely(ret))
> +				goto unreserve_out;
> +		}
> +		drm_exec_continue_on_contention(&exec);
>   
> -	amdgpu_sync_create(&sync);
> +		/* Reserve the userptr_inval_list entries to resv_list */
> +		list_for_each_entry(mem, &process_info->userptr_inval_list,
> +				    validate_list) {
> +			struct drm_gem_object *gobj;
> +
> +			gobj = &mem->bo->tbo.base;
> +			ret = drm_exec_prepare_obj(&exec, gobj, 1);
> +			drm_exec_break_on_contention(&exec);
> +			if (unlikely(ret))
> +				goto unreserve_out;
> +		}
> +		drm_exec_continue_on_contention(&exec);
> +	}
> +	WARN(!drm_exec_has_duplicates(&exec), "Duplicates should be empty");
>   
>   	ret = process_validate_vms(process_info);
>   	if (ret)
> @@ -2236,7 +2178,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
>   	/* Validate BOs and update GPUVM page tables */
>   	list_for_each_entry_safe(mem, tmp_mem,
>   				 &process_info->userptr_inval_list,
> -				 validate_list.head) {
> +				 validate_list) {
>   		struct kfd_mem_attachment *attachment;
>   
>   		bo = mem->bo;
> @@ -2251,7 +2193,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
>   			}
>   		}
>   
> -		list_move_tail(&mem->validate_list.head,
> +		list_move_tail(&mem->validate_list,
>   			       &process_info->userptr_valid_list);
>   
>   		/* Update mapping. If the BO was not validated
> @@ -2279,12 +2221,9 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
>   	ret = process_update_pds(process_info, &sync);
>   
>   unreserve_out:
> -	ttm_eu_backoff_reservation(&ticket, &resv_list);
> +	drm_exec_fini(&exec);
>   	amdgpu_sync_wait(&sync, false);
>   	amdgpu_sync_free(&sync);
> -out_free:
> -	kfree(pd_bo_list_entries);
> -out_no_mem:
>   
>   	return ret;
>   }
> @@ -2381,50 +2320,46 @@ static void amdgpu_amdkfd_restore_userptr_worker(struct work_struct *work)
>    */
>   int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
>   {
> -	struct amdgpu_bo_list_entry *pd_bo_list;
>   	struct amdkfd_process_info *process_info = info;
>   	struct amdgpu_vm *peer_vm;
>   	struct kgd_mem *mem;
> -	struct bo_vm_reservation_context ctx;
>   	struct amdgpu_amdkfd_fence *new_fence;
> -	int ret = 0, i;
>   	struct list_head duplicate_save;
>   	struct amdgpu_sync sync_obj;
>   	unsigned long failed_size = 0;
>   	unsigned long total_size = 0;
> +	struct drm_exec exec;
> +	int ret;
>   
>   	INIT_LIST_HEAD(&duplicate_save);
> -	INIT_LIST_HEAD(&ctx.list);
> -	INIT_LIST_HEAD(&ctx.duplicates);
>   
> -	pd_bo_list = kcalloc(process_info->n_vms,
> -			     sizeof(struct amdgpu_bo_list_entry),
> -			     GFP_KERNEL);
> -	if (!pd_bo_list)
> -		return -ENOMEM;
> -
> -	i = 0;
>   	mutex_lock(&process_info->lock);
> -	list_for_each_entry(peer_vm, &process_info->vm_list_head,
> -			vm_list_node)
> -		amdgpu_vm_get_pd_bo(peer_vm, &ctx.list, &pd_bo_list[i++]);
>   
> -	/* Reserve all BOs and page tables/directory. Add all BOs from
> -	 * kfd_bo_list to ctx.list
> -	 */
> -	list_for_each_entry(mem, &process_info->kfd_bo_list,
> -			    validate_list.head) {
> -
> -		list_add_tail(&mem->resv_list.head, &ctx.list);
> -		mem->resv_list.bo = mem->validate_list.bo;
> -		mem->resv_list.num_shared = mem->validate_list.num_shared;
> -	}
> +	drm_exec_init(&exec, false);
> +	drm_exec_while_not_all_locked(&exec) {
> +		list_for_each_entry(peer_vm, &process_info->vm_list_head,
> +				    vm_list_node) {
> +			ret = amdgpu_vm_lock_pd(peer_vm, &exec);
> +			drm_exec_break_on_contention(&exec);
> +			if (unlikely(ret))
> +				goto ttm_reserve_fail;
> +		}
> +		drm_exec_continue_on_contention(&exec);
>   
> -	ret = ttm_eu_reserve_buffers(&ctx.ticket, &ctx.list,
> -				     false, &duplicate_save);
> -	if (ret) {
> -		pr_debug("Memory eviction: TTM Reserve Failed. Try again\n");
> -		goto ttm_reserve_fail;
> +		/* Reserve all BOs and page tables/directory. Add all BOs from
> +		 * kfd_bo_list to ctx.list
> +		 */
> +		list_for_each_entry(mem, &process_info->kfd_bo_list,
> +				    validate_list) {
> +			struct drm_gem_object *gobj;
> +
> +			gobj = &mem->bo->tbo.base;
> +			ret = drm_exec_prepare_obj(&exec, gobj, 1);
> +			drm_exec_break_on_contention(&exec);
> +			if (unlikely(ret))
> +				goto ttm_reserve_fail;
> +		}
> +		drm_exec_continue_on_contention(&exec);
>   	}
>   
>   	amdgpu_sync_create(&sync_obj);
> @@ -2442,7 +2377,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
>   
>   	/* Validate BOs and map them to GPUVM (update VM page tables). */
>   	list_for_each_entry(mem, &process_info->kfd_bo_list,
> -			    validate_list.head) {
> +			    validate_list) {
>   
>   		struct amdgpu_bo *bo = mem->bo;
>   		uint32_t domain = mem->domain;
> @@ -2515,8 +2450,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
>   	*ef = dma_fence_get(&new_fence->base);
>   
>   	/* Attach new eviction fence to all BOs */
> -	list_for_each_entry(mem, &process_info->kfd_bo_list,
> -		validate_list.head)
> +	list_for_each_entry(mem, &process_info->kfd_bo_list, validate_list)
>   		amdgpu_bo_fence(mem->bo,
>   			&process_info->eviction_fence->base, true);
>   
> @@ -2529,11 +2463,10 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
>   	}
>   
>   validate_map_fail:
> -	ttm_eu_backoff_reservation(&ctx.ticket, &ctx.list);
>   	amdgpu_sync_free(&sync_obj);
>   ttm_reserve_fail:
> +	drm_exec_fini(&exec);
>   	mutex_unlock(&process_info->lock);
> -	kfree(pd_bo_list);
>   	return ret;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 5277c10d901d..c82c580f1df5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -33,6 +33,7 @@
>   
>   #include <drm/amdgpu_drm.h>
>   #include <drm/drm_drv.h>
> +#include <drm/drm_exec.h>
>   #include "amdgpu.h"
>   #include "amdgpu_trace.h"
>   #include "amdgpu_amdkfd.h"
> @@ -639,6 +640,19 @@ void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
>   	list_add(&entry->tv.head, validated);
>   }
>   
> +/**
> + * amdgpu_vm_lock_pd - lock PD in drm_exec
> + *
> + * @vm: vm providing the BOs
> + * @exec: drm execution context
> + *
> + * Lock the VM root PD in the DRM execution context.
> + */
> +int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec)
> +{
> +	return drm_exec_prepare_obj(exec, &vm->root.bo->tbo.base, 4);
> +}
> +
>   /**
>    * amdgpu_vm_move_to_lru_tail - move all BOs to the end of LRU
>    *
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index bd7892482bbf..15d26f442e70 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -36,6 +36,8 @@
>   #include "amdgpu_ring.h"
>   #include "amdgpu_ids.h"
>   
> +struct drm_exec;
> +
>   struct amdgpu_bo_va;
>   struct amdgpu_job;
>   struct amdgpu_bo_list_entry;
> @@ -383,6 +385,7 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm);
>   void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
>   			 struct list_head *validated,
>   			 struct amdgpu_bo_list_entry *entry);
> +int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec);
>   bool amdgpu_vm_ready(struct amdgpu_vm *vm);
>   int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   			      int (*callback)(void *p, struct amdgpu_bo *bo),
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index b3fc3e958227..b5cb234e9f77 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -23,6 +23,8 @@
>   
>   #include <linux/types.h>
>   #include <linux/sched/task.h>
> +#include <drm/drm_exec.h>
> +
>   #include "amdgpu_sync.h"
>   #include "amdgpu_object.h"
>   #include "amdgpu_vm.h"
> @@ -1373,9 +1375,7 @@ struct svm_validate_context {
>   	struct svm_range *prange;
>   	bool intr;
>   	unsigned long bitmap[MAX_GPU_INSTANCE];
> -	struct ttm_validate_buffer tv[MAX_GPU_INSTANCE];
> -	struct list_head validate_list;
> -	struct ww_acquire_ctx ticket;
> +	struct drm_exec exec;
>   };
>   
>   static int svm_range_reserve_bos(struct svm_validate_context *ctx)
> @@ -1385,25 +1385,23 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx)
>   	uint32_t gpuidx;
>   	int r;
>   
> -	INIT_LIST_HEAD(&ctx->validate_list);
> +	drm_exec_init(&ctx->exec, true);
>   	for_each_set_bit(gpuidx, ctx->bitmap, MAX_GPU_INSTANCE) {
>   		pdd = kfd_process_device_from_gpuidx(ctx->process, gpuidx);
>   		if (!pdd) {
>   			pr_debug("failed to find device idx %d\n", gpuidx);
> -			return -EINVAL;
> +			r = -EINVAL;
> +			goto unreserve_out;
>   		}
>   		vm = drm_priv_to_vm(pdd->drm_priv);
>   
> -		ctx->tv[gpuidx].bo = &vm->root.bo->tbo;
> -		ctx->tv[gpuidx].num_shared = 4;
> -		list_add(&ctx->tv[gpuidx].head, &ctx->validate_list);
> -	}
> -
> -	r = ttm_eu_reserve_buffers(&ctx->ticket, &ctx->validate_list,
> -				   ctx->intr, NULL);
> -	if (r) {
> -		pr_debug("failed %d to reserve bo\n", r);
> -		return r;
> +		r = amdgpu_vm_lock_pd(vm, &ctx->exec);
> +		if (unlikely(r == -EDEADLK))
> +			continue;
> +		if (unlikely(r)) {
> +			pr_debug("failed %d to reserve bo\n", r);
> +			goto unreserve_out;
> +		}
>   	}
>   
>   	for_each_set_bit(gpuidx, ctx->bitmap, MAX_GPU_INSTANCE) {
> @@ -1426,13 +1424,13 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx)
>   	return 0;
>   
>   unreserve_out:
> -	ttm_eu_backoff_reservation(&ctx->ticket, &ctx->validate_list);
> +	drm_exec_fini(&ctx->exec);
>   	return r;
>   }
>   
>   static void svm_range_unreserve_bos(struct svm_validate_context *ctx)
>   {
> -	ttm_eu_backoff_reservation(&ctx->ticket, &ctx->validate_list);
> +	drm_exec_fini(&ctx->exec);
>   }
>   
>   static void *kfd_svm_page_owner(struct kfd_process *p, int32_t gpuidx)
