Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0666EB39F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 23:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623C810E344;
	Fri, 21 Apr 2023 21:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730B210E344;
 Fri, 21 Apr 2023 21:28:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrYPzpFoQPRSJAHj5vReu54IsXDqiXHWG7R/Zbme7X/8tj7o7R2cER2bGHlW94D+nAeyg0NP59diCIAz4V0A48SwZYfQbfUeVOCQYcpy59oBWOp+B2vxMosEQ14J0u0ZUOJzCA+a77FKX+5kczj1R7iSDbcrMVtbNMaq2AjizDiqo+3y3RAlv2B+NppfPLGU4tQEAkszXzYuv9ac/obd7wpiGdezPqIZfo7iEOrm8/7TGzRXUKiAhGA6s2PlF2/gJuU/Zkgnw7ltpJaWKNxtS26EGUATk0GSwSCOK2pt+HWzicFqi7B1Bn5UUqGhx+avnU99Bs/2MqbHv6GOGggdwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0bCY6ln6KGSD+1qhBsyA+i1u1jJ8bw4+qVMBHgoyT8=;
 b=fw5WTXuCPrg3wP38LOAIYF8sTcG5JdWh6mK4repfrxUKe7zY07+/8ao3FXAQ6GhjLVpKELLgz8YxGD30nZ4T9GoinehPiz5g4EUu6prCiIDSBSzg6FfmZbp2dRSphDTIdJPrEd0od3Vqi+wljRrRU1zZ3CIDQKLbO0xwIjwckcwW50hZUVebhuQ9WO9o1YECY4qHy5r4cLpNTBMsU4KI+e0/duYswP2GU0JwDnDZpH1IqgcGyzqnFr83r9tGUsYwpCUY4ijWj0800bmq4JQiVY504lJ39JbkACz8ishLbiFaTS1NyasWrA4IxkRfOgrmAo+0+w4ONzkqAfreKhRbqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0bCY6ln6KGSD+1qhBsyA+i1u1jJ8bw4+qVMBHgoyT8=;
 b=r3ggsY+vYLReABjpPFXqoNaBdkDbGXNYHJmFl/Kb33GOeOEo9cEz+NJszPnIwMjuGgUMwlt07llWeEPkCEPmDCG1C3RsW6i22sseSR4tUPFEFPFViVAuqiB6PDi8vNhPIA5Exr+iv3GGWQFQXkAtiFO+LR90xyPQZkJqcUkvG/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH8PR12MB7445.namprd12.prod.outlook.com (2603:10b6:510:217::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 21:28:06 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f170:8d72:ca64:bb26]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f170:8d72:ca64:bb26%7]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 21:28:06 +0000
Message-ID: <de40000b-eb52-0dc4-0970-ee4575db4f0d@amd.com>
Date: Fri, 21 Apr 2023 17:28:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/9] drm/amdkfd: switch over to using drm_exec
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230228083406.1720795-1-christian.koenig@amd.com>
 <20230228083406.1720795-4-christian.koenig@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230228083406.1720795-4-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0427.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10b::18) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH8PR12MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: f1715a87-ca60-4123-e32d-08db42af4bd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5x3wuMIejcW3tdoBh1twYTQMH0v5//bo6lUwDqQdpINXJsscVMKVgxrs0W5DBuIkUq78W1r0btPkoP8eEuil7l1njn/M29+4VEfLT5e5j7rGobvpR0q6ae5IpZO/gtjuITys+h6hkX9tFeMnUI28Xgop6tUEz8dSoBJgp9xVL9xOsNfG2O65fXxRniPv2ecvp3UPQoi1L1VQ+2/MQFY9yM3NkCU/p3WPXy0GINt4wGcB0z2iZsJH5r54yvg/jTUCddZ5dynlenHQ85rLS7DTdda7oUiHZEIl6FgcQ5fXw6+aGjLkft/Mx2o5gGXf00kyIzfC5bCmkLyPKAZh9bkYD+4wV/WlL4YqkkmOkle77hy/vzTCMbf3NqOvuoqDu/kZV2aemkauTrWM9hFXcmvLTycvHnSmaHltFwPsDWDouOKQZOskwyF0in2BOeUqDR7Dsc3IrPgozpsvT2aCEEhjKFngIv8/r+sN/fRIt1Xg/piPBwWXTqpPWzw47TlAvT0TB4W1AiPzRCadhXsmQdlyvFMTR75xCzsGZ9jtN88P0ltJ6YTzHH9q+p/CM23ODwSUSQ9GfGBZ/Mvh0UgurVfPJQF5ciVqNHygsFKTAbKNvMcM9BCV7eSoOS9bFnKeZf/UqOagMrG7xGnoWvTRB2nixg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199021)(83380400001)(38100700002)(2906002)(53546011)(186003)(26005)(86362001)(6512007)(8676002)(30864003)(6506007)(8936002)(31696002)(4326008)(478600001)(66476007)(41300700001)(31686004)(5660300002)(44832011)(6486002)(66556008)(66946007)(36756003)(36916002)(316002)(2616005)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UklILzc0dk5CV3RUU3pjQVE4aE9GZTNJNFlDbGV1Rk9aRFEwNHBjVmNSdnlj?=
 =?utf-8?B?K3JGSU5QWnowKzN0WW1RQjE2ZHdkYXhEV3BxV3A0cWRwWk5Qa2c3Q0ozMGdP?=
 =?utf-8?B?TGs4UnNqNzNXVzRxRHZRYWFJc3M5L0wwdFpnT1BqcWNSbnhBK0taNDVUb0lj?=
 =?utf-8?B?d1RoL3NnNXkvdjlxaStvbTZjM1RId3NGNk9SdmQwRnplanpHSkhBY29UeXFl?=
 =?utf-8?B?eEsxVDJpZWc0MVlJdkFGR0pTNzJyQVlMNlZJN1I0NVMrTjFXaHZjeUR5SDhD?=
 =?utf-8?B?YzFJUjJnd2tZSWdHVTBXOFkzbUI5RTBqL0dRajBQUFlGRHRHYTE2TjY4QWh5?=
 =?utf-8?B?cXNpaWxxMy9MZWcvTGRrNVRiMDF6UitrVHZUVUxYNnY5U2F3TklJS2FPYVRt?=
 =?utf-8?B?cWc0dkEzZUVxRjl4aHpnTVhkK3lUN1A3S21OUFNyd0xka01sV1hnRnF4b0pw?=
 =?utf-8?B?L0FNRG9PaThGcG94b2JLb2RadlVXNjRMNnVCNm9XNkxneXcxMG0xOENRZVUw?=
 =?utf-8?B?alQwSFFUQnpWZWc0QnlZZUo1ZTRTSWcxMURiN0svVCtUWDVaekh3ZzE5dUtw?=
 =?utf-8?B?UnBoZldhL3FicSsvNXdScVdoL2JhdzQyZ0FCZVNFc0FzekMzL0RHNlZ3M1ZO?=
 =?utf-8?B?c00zRzhFYjRZL3FDUEdEV2xldlBaL0thZXV4aWVOS0VLcTMzU1dlbjdwL0dV?=
 =?utf-8?B?UEZ0c01OUG5zWmpueUhJejZtSVN5R05BeU9CYmdUc0JZL1dsaU5reFpsTEpx?=
 =?utf-8?B?TEc4b3ZSakt2dy9UNkJseVVuQnRMc1BvOG95YmxBT3BmZFQxT2hUMFdBY1lY?=
 =?utf-8?B?c2hJVGFXUVZVeXAzSitRQTZrL0kwY0NhWW8rdlNMcC9kTytSZHZyTjhPWXAx?=
 =?utf-8?B?WDJHamtJaVZjRGozWXZZWWZsWDQra2JVT3ZNdW9mZHRWME9qejdjVzREa3lO?=
 =?utf-8?B?Mkg5NGdrVGxvNDZvODM1L2VFUzhlcm5SV0JOU0lDOTFwUWtBZGl3ZlEzcGQx?=
 =?utf-8?B?TW4xcHF3K09XdGFGYXZHM1l5b0NkeTI0Qk9yYWNEb0dScUNjZ0lqQmt1ZldX?=
 =?utf-8?B?TFRlb3RyY09NaS9mQUtZdlJSUVluTnZVYjRpdExBWUhQTlhpM3BKZGF5NGdh?=
 =?utf-8?B?N3FGNlR2WjFxbC9JZXp2NW9GUC9QR1Z6NHQ2bndIWmpQeWtnMnFkQzdIR2J5?=
 =?utf-8?B?V0YwYk5KaGNCb29MbW5XUHFta2F3VGI4REp3M1R6ZzAveEl5ckphVDVUbmlp?=
 =?utf-8?B?NEZ6b1gwRXF3NGNNNzRGcVkxYTRySWdiS2cxMnFCYTNRcDJxQW16SGF1eVZx?=
 =?utf-8?B?a1haS1RSK0tTV2NyMDNGc2tqU0kvTGl3NnMxNi9VVzdPdUwrTEo5TEYxMGZJ?=
 =?utf-8?B?aitaU0ZsWTZxVXJDdHlIblJrV1BqS1NzQ0oyLzVyb2IvcVZMeStKSFVsWFF1?=
 =?utf-8?B?OFZvdkc4UWxKUmxKTkdYam1xQkJ2bHdrdXpqZjd6TmNQN3JlWGpUdEFoSVd6?=
 =?utf-8?B?TUlVSXl3MFcwTDZ0T0NHZGdWNXVtcWp2eDhpckxqbFJod1pMU2RIVGg4RVVL?=
 =?utf-8?B?ckR2TWFmYVZ6K1BTc3U0VjAzTUhVbkNSdFJwU2pLS1ZsQ1kxWmV3T2d0VjlX?=
 =?utf-8?B?R3BZZW9CMTNWUElPVktRS3NYWTFVajZNNkxKRjVGSUxGWXR4V2N6cURZVjla?=
 =?utf-8?B?RlhMZ3hqa1hIZFA5VDAxY0RYUEZkOEtnK0ZWU0pHN1NyZFZRUjR3YWYyQmth?=
 =?utf-8?B?Z0NNcjhmcDM3YThuYzMxclZTWXRxdElrNjV3VDRuTzg2VVdFSEVsQTdIcFJY?=
 =?utf-8?B?VU4yRlhHN3E2UVFIOE90d042d2dZWGwwbkhyMUE4OGplN1Vjbm4zalllOHE2?=
 =?utf-8?B?dlZvR2s2dS94cVdKdVJzYXk3YjRyMnNUS0VTSDhJVWFwc1hPUDVjbFJ0VUZO?=
 =?utf-8?B?UGI1VFA4S0c0Q0kwcUpZWG1rSWs2NUY4ZHozTGk5QkdLU3lONnkxaS9WeHRw?=
 =?utf-8?B?QlY1eW9saUxtd2RMeGZEWG4vNnVXa251K3B2dmlBQTYrdVlMYSt0RHhtSU5V?=
 =?utf-8?B?bXhEMGlOcmxBMGZUNTdjaGl4MEtnL3NOMTBHQ0ZhZWhuNW5zUDdSZ3R4cDdS?=
 =?utf-8?Q?2v513A+KA/3PMYYAEnNEREiGq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1715a87-ca60-4123-e32d-08db42af4bd1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 21:28:06.3338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OgGsxdLvnXn38DRH29PJi/h9XwVsS1b+/VpKpjHVcj9razRFerbz+ul1iUOLFt0xt1P+im0wfQzeRq7Qw3A1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7445
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
Cc: dakr@redhat.com, arunpravin.paneerselvam@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-28 03:34, Christian König wrote:
> Avoids quite a bit of logic and kmalloc overhead.

Not sure what's the status of this patch series. In general I'm in 
favour. I think it could help with some tricky locking cases for the 
work we're doing for validating GEM objects in KFD contexts.

Someone needs to run KFDTest to check for obvious regressions, with 
"export HSA_USE_SVM=0" to ensure the userptr code paths get tested, too.

Some comments inline.


>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   5 +-
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 302 +++++++-----------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  14 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   3 +
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  32 +-
>   5 files changed, 151 insertions(+), 205 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index 333780491867..e9ef493091a9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -25,13 +25,13 @@
>   #ifndef AMDGPU_AMDKFD_H_INCLUDED
>   #define AMDGPU_AMDKFD_H_INCLUDED
>   
> +#include <linux/list.h>
>   #include <linux/types.h>
>   #include <linux/mm.h>
>   #include <linux/kthread.h>
>   #include <linux/workqueue.h>
>   #include <linux/mmu_notifier.h>
>   #include <kgd_kfd_interface.h>
> -#include <drm/ttm/ttm_execbuf_util.h>
>   #include "amdgpu_sync.h"
>   #include "amdgpu_vm.h"
>   
> @@ -69,8 +69,7 @@ struct kgd_mem {
>   	struct hmm_range *range;
>   	struct list_head attachments;
>   	/* protected by amdkfd_process_info.lock */
> -	struct ttm_validate_buffer validate_list;
> -	struct ttm_validate_buffer resv_list;
> +	struct list_head validate_list;
>   	uint32_t domain;
>   	unsigned int mapped_to_gpu_memory;
>   	uint64_t va;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index d6320c836251..2f4aeaf711a9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -27,6 +27,8 @@
>   #include <linux/sched/task.h>
>   #include <drm/ttm/ttm_tt.h>
>   
> +#include <drm/drm_exec.h>
> +
>   #include "amdgpu_object.h"
>   #include "amdgpu_gem.h"
>   #include "amdgpu_vm.h"
> @@ -897,28 +899,19 @@ static void add_kgd_mem_to_kfd_bo_list(struct kgd_mem *mem,
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
>   	if (userptr)
> -		list_add_tail(&entry->head, &process_info->userptr_valid_list);
> +		list_add_tail(&mem->validate_list,
> +			      &process_info->userptr_valid_list);
>   	else
> -		list_add_tail(&entry->head, &process_info->kfd_bo_list);
> +		list_add_tail(&mem->validate_list, &process_info->kfd_bo_list);
>   	mutex_unlock(&process_info->lock);

You removed the mutex_lock, but the mutex_unlock is still here. That 
can't be right. I'm pretty sure you still need to take the 
process_info->lock above.


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
> @@ -1005,13 +998,12 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr,
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
> @@ -1035,35 +1027,24 @@ static int reserve_bo_and_vm(struct kgd_mem *mem,
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
> @@ -1080,63 +1061,39 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
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

The original code was getting entry->bo_va->base.vm here. You're always 
locking the same VM (which may be NULL), rather than the VM of the 
attachment being processed here. In the case that the vm parameter is 
NULL, we need to reserve all the VMs.


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
> @@ -1157,15 +1114,8 @@ static int unreserve_bo_and_vms(struct bo_vm_reservation_context *ctx,
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
> @@ -1752,7 +1702,6 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
>   	bool use_release_notifier = (mem->bo->kfd_bo == mem);
>   	struct kfd_mem_attachment *entry, *tmp;
>   	struct bo_vm_reservation_context ctx;
> -	struct ttm_validate_buffer *bo_list_entry;
>   	unsigned int mapped_to_gpu_memory;
>   	int ret;
>   	bool is_imported = false;
> @@ -1780,9 +1729,8 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
>   	}
>   
>   	/* Make sure restore workers don't access the BO any more */
> -	bo_list_entry = &mem->validate_list;
>   	mutex_lock(&process_info->lock);
> -	list_del(&bo_list_entry->head);
> +	list_del(&mem->validate_list);
>   	mutex_unlock(&process_info->lock);
>   
>   	/* Cleanup user pages and MMU notifiers */
> @@ -2324,14 +2272,14 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
>   	/* Move all invalidated BOs to the userptr_inval_list */
>   	list_for_each_entry_safe(mem, tmp_mem,
>   				 &process_info->userptr_valid_list,
> -				 validate_list.head)
> +				 validate_list)
>   		if (mem->invalid)
> -			list_move_tail(&mem->validate_list.head,
> +			list_move_tail(&mem->validate_list,
>   				       &process_info->userptr_inval_list);
>   
>   	/* Go through userptr_inval_list and update any invalid user_pages */
>   	list_for_each_entry(mem, &process_info->userptr_inval_list,
> -			    validate_list.head) {
> +			    validate_list) {
>   		invalid = mem->invalid;
>   		if (!invalid)
>   			/* BO hasn't been invalidated since the last
> @@ -2409,50 +2357,43 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
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
>   
>   	ret = process_validate_vms(process_info);
>   	if (ret)
> @@ -2461,7 +2402,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
>   	/* Validate BOs and update GPUVM page tables */
>   	list_for_each_entry_safe(mem, tmp_mem,
>   				 &process_info->userptr_inval_list,
> -				 validate_list.head) {
> +				 validate_list) {
>   		struct kfd_mem_attachment *attachment;
>   
>   		bo = mem->bo;
> @@ -2503,12 +2444,9 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
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
> @@ -2524,7 +2462,7 @@ static int confirm_valid_user_pages_locked(struct amdkfd_process_info *process_i
>   
>   	list_for_each_entry_safe(mem, tmp_mem,
>   				 &process_info->userptr_inval_list,
> -				 validate_list.head) {
> +				 validate_list) {
>   		bool valid = amdgpu_ttm_tt_get_user_pages_done(
>   				mem->bo->tbo.ttm, mem->range);
>   
> @@ -2536,7 +2474,7 @@ static int confirm_valid_user_pages_locked(struct amdkfd_process_info *process_i
>   		}
>   		WARN(mem->invalid, "Valid BO is marked invalid");
>   
> -		list_move_tail(&mem->validate_list.head,
> +		list_move_tail(&mem->validate_list,
>   			       &process_info->userptr_valid_list);
>   	}
>   
> @@ -2646,50 +2584,46 @@ static void amdgpu_amdkfd_restore_userptr_worker(struct work_struct *work)
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
> @@ -2707,7 +2641,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
>   
>   	/* Validate BOs and map them to GPUVM (update VM page tables). */
>   	list_for_each_entry(mem, &process_info->kfd_bo_list,
> -			    validate_list.head) {
> +			    validate_list) {
>   
>   		struct amdgpu_bo *bo = mem->bo;
>   		uint32_t domain = mem->domain;
> @@ -2780,8 +2714,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
>   	*ef = dma_fence_get(&new_fence->base);
>   
>   	/* Attach new eviction fence to all BOs except pinned ones */
> -	list_for_each_entry(mem, &process_info->kfd_bo_list,
> -		validate_list.head) {
> +	list_for_each_entry(mem, &process_info->kfd_bo_list, validate_list) {
>   		if (mem->bo->tbo.pin_count)
>   			continue;
>   
> @@ -2800,11 +2733,10 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
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
> index b9441ab457ea..f10a9331af9b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -34,6 +34,7 @@
>   #include <drm/amdgpu_drm.h>
>   #include <drm/drm_drv.h>
>   #include <drm/ttm/ttm_tt.h>
> +#include <drm/drm_exec.h>
>   #include "amdgpu.h"
>   #include "amdgpu_trace.h"
>   #include "amdgpu_amdkfd.h"
> @@ -334,6 +335,19 @@ void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
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
> index 856a64bc7a89..4066731d3065 100644
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
> @@ -389,6 +391,7 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm);
>   void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
>   			 struct list_head *validated,
>   			 struct amdgpu_bo_list_entry *entry);
> +int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec);
>   bool amdgpu_vm_ready(struct amdgpu_vm *vm);
>   int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   			      int (*callback)(void *p, struct amdgpu_bo *bo),
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index dc6fd6967050..6ca3c3ced9f0 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -24,6 +24,8 @@
>   #include <linux/types.h>
>   #include <linux/sched/task.h>
>   #include <drm/ttm/ttm_tt.h>
> +#include <drm/drm_exec.h>
> +
>   #include "amdgpu_sync.h"
>   #include "amdgpu_object.h"
>   #include "amdgpu_vm.h"
> @@ -1423,9 +1425,7 @@ struct svm_validate_context {
>   	struct svm_range *prange;
>   	bool intr;
>   	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
> -	struct ttm_validate_buffer tv[MAX_GPU_INSTANCE];
> -	struct list_head validate_list;
> -	struct ww_acquire_ctx ticket;
> +	struct drm_exec exec;
>   };
>   
>   static int svm_range_reserve_bos(struct svm_validate_context *ctx)
> @@ -1435,25 +1435,23 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx)
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

This is the only case where you test for -EDEADLK. Is there something 
special about this case compared to, e.g. 
amdgpu_amdkfd_gpuvm_restore_process_bos?

Regards,
   Felix


> +			continue;
> +		if (unlikely(r)) {
> +			pr_debug("failed %d to reserve bo\n", r);
> +			goto unreserve_out;
> +		}
>   	}
>   
>   	for_each_set_bit(gpuidx, ctx->bitmap, MAX_GPU_INSTANCE) {
> @@ -1476,13 +1474,13 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx)
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
