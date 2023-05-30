Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F75716E9C
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 22:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39D410E420;
	Tue, 30 May 2023 20:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDA110E420;
 Tue, 30 May 2023 20:25:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wsuui2VgNL+uKBeC0x5bmOQX3otz9IwO1Q+iFk7qo47NKl6YMyJBs4sdUKr7ZE9AABsLtuDJlfO6Jx8+PR4dN1OklFjIAFWnIkWoqta777WD5DEm4G4uOxh7NJ/fj+s5cH0LfpK9/6q+EsMD1rEEoU+/8mUKRqt3RsXg4HmGaQeWpq74d1549+GoBWCHjRiqLMNBNC6aCqkQbj/gBj1jKYQBzqTym4GnWVyyfy/kK69rQjhOyvK5XeeI4uFXsyXMplqwT/EKO3FrwlIsqGkYgBoYX1eEBn04/SZoGpc0Xiw0sQYHrRKuDtkr4bm5wRFZgr3rVx1rp3+bZX1VuTeT9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqPIHb2cP6/Joie4gQh7AT6fK49GdAKsq5XjKIAQgJw=;
 b=kQYDcQeDlcTzGqkR4ZY3Ic9644n1rUi6c6J6HudYC9T2l/qwaT553TzyVQ+uCr/vook0fRHLOpUXg1nS/rEIx/NYq+g4VWv7nmNRF78rP3g3JUcyBTvkKVxd/pVRkfnLYEE8ooBEwT1QoEZ7Q/Rz4R5RRd7hgdQIeypYxlScg8rrfhjB1WWMY18U9O1oAGSx17GNtP9aSpJK0n5fVMRn6Jc72htvlS3JYvLstT68Pz0hZz77OiixGwfz59Jj5HAWU/dnOcZXz4xADAp/vCrITIRjl4eqT7afc12Wjbs7h0fY0fhs6bSwK6Gf8qjK8SkSyDRbB4KUu9PouTIEd5jmdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqPIHb2cP6/Joie4gQh7AT6fK49GdAKsq5XjKIAQgJw=;
 b=B27ksYx6r+BnsycKzutREvHKXJUMZX+LxBwXWocGKcBouG83Ift5cab52zrIUAaVvaI3dFcv5BfviYlcZt4uvmDirwMN/7wRpvcNAxtizoVdrw1TxW4yP3g4Trq8bWtre/L8Q8CCq4yDz70ZqvLUpMc03t3qbEK2bjNzVLDeMzA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB6184.namprd12.prod.outlook.com (2603:10b6:8:a6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.22; Tue, 30 May 2023 20:25:01 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 20:25:01 +0000
Message-ID: <1adcf9df-17fc-3199-51af-e8fdb319f78a@amd.com>
Date: Tue, 30 May 2023 16:24:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 26/33] drm/amdkfd: add debug suspend and resume process
 queues operation
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230525172745.702700-1-jonathan.kim@amd.com>
 <20230525172745.702700-26-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230525172745.702700-26-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::31) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM4PR12MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: a65e6608-17b9-4005-ba15-08db614bf1b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: THjKrqeXl9T/2+LhK4ff7jmhrE8TVSGAF3c7ogVtJ6WmwQdUXTdaYtixU+g8vk0OnYCzX2A1r8JCDsZMK5UoPLNrgPX6iWMT5bxJP1ZKxMb1tytf5YkQlc2zh0Fbp0MKlkDzaULtnyDrFwqySYeMuFRHt0aiAKF+t2EU2iTj47RxlSRAfqvly37r58PAM+bhVdHAlmarzgYJlO7KNkNkU/AAT7IYmr1Nza8bCyGWxfj7SY/KtDpyNgCmYSrbIy5XaCzuIq1UEYZro9wJwv5qJbhVYGT8YWiJY+OD8gKq62LXpr35i6kYveCp9eSZeIQr305K8FPlPOVGCyxu/WvWmuCsiGA2O1U1SzUz5w7HRV2MerQstx1sDdshzl3MQiX3+vEUZjP48KqOcVOOZxuzr7H+pyJ4PpUMOYvo9sOp+bEIlcUB1PqS5lPtHcxG61J0Z7s4g5eemwRdSh3FLauKIBy8jne/vXgnQWXbefA+GfUyAhFwVYIuaBpDWYiKkRjKaCB1Epm/2ddu7r5OqjzdsFCSjFx50ZV8tPXbqHt6NQkUygl5DmrgRo/Dy5uKPeOJ3Dm+MnFydRt9ll1gmJ1/RxfrkNi7WCoqcvGb+ppLbEkbHSdLPMshMRL1QJ8qRwgV7klPO2uNdGU8XjKL1k/Y5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199021)(478600001)(83380400001)(5660300002)(186003)(30864003)(4326008)(86362001)(6486002)(8676002)(15650500001)(2906002)(8936002)(316002)(41300700001)(31686004)(38100700002)(31696002)(6512007)(6506007)(26005)(44832011)(66946007)(450100002)(2616005)(66476007)(66556008)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGFTQUpINjVQNytLbkdaM25rTUpTbExLdGg5R0hmb1pnYjQ1cTZUendqdHNt?=
 =?utf-8?B?YmsyT1NsZmNqaUY1OFNUc05RMmx5bDhwL0hmMmQxa21sTzVHWXRlY05jcFg5?=
 =?utf-8?B?TWo0TXhQMmlkTHNqZm9GNGNZYVZnTDF2UEQxajdBeFh3TUdSL0VGdjgxeURN?=
 =?utf-8?B?aWhWR0Z4eUVLSU10Z3lNYUsxRCtyUFZMenpwdzAzNWpaSktCQUlOUFVqa3pk?=
 =?utf-8?B?Y3ZxUFZFMDRMUS9rdUtVN3NKa1c4L0VKbDFjMHRwdG45b1RHOUhWOGkwTzBh?=
 =?utf-8?B?L2hIeTJWZlZsdGVhZW5XT2gvTHF3bmFkeC9nbXV6ZVdZRjc4aXdTWDdabUdz?=
 =?utf-8?B?NTNwSW5XSk53QTJhNUZSdC8rWnlvM2l4OGZEdUtXbkU2cXJ0dlBrcWV1dmRU?=
 =?utf-8?B?V3RacnNYNGJjbGFlTU44N28wK2YxZ0QzVno0UEtyOGVEa0RZc1dtTnJLZC9L?=
 =?utf-8?B?M1ZuZFJGT204K1RsMWVmd3NyV2Zna24yY0RuQ3dscjJVUVlnVXBBdUhTVkNq?=
 =?utf-8?B?SlRsb3Ntd3pZWjE1aWR0dkZxeU9qUWRrL0dYMldkZ080SDFnUlJOM01iNkFN?=
 =?utf-8?B?OHh3cS9MTWNyWG9OYkVxRjN5cDk1cWl3RE5iaVA0cXpnMHF6aTlnYmFOaXY2?=
 =?utf-8?B?c0RCeFhYREJLZUt2VWhVaUU3VUZjTTFRelppejhGdHNRcVlGQTRGZUFvbFN5?=
 =?utf-8?B?SllUVTRvbHc2M2tFWnJpZjBtSG1XQjlqczVsdjJ4MndFS280a043dnQyQXNR?=
 =?utf-8?B?Q0dOK2VBL3lUd0JGeW82WUhsaW5FbEM0dFJaaXBPczYrOHFqYW1pQkdpczhl?=
 =?utf-8?B?QlkvV0VDVXJ1MHRKWmM4aS9JR3l6NjN1L2xEdjVNMFBPK0dBMjRmUStwdlZQ?=
 =?utf-8?B?dnp3QmtUdzlzaWZQVnVUSnJUMFpKLzNWSUlKeTFUSjRnMnFiYzJUVVgybmw3?=
 =?utf-8?B?Mml5RU5aeTJad1ZScnByUDRkNzY4eDNJdWZPWGNCMmpBWWEwLzRPaDZLMlFQ?=
 =?utf-8?B?SHRZeFBudUZkK2lpMVFPaEFLcU9jQ0xjcVVlWWdUNzUxd0NEOWVnR3JvUWVI?=
 =?utf-8?B?K1pxRVloMklpMGw1Mjc0MmxxU0VTU1czNmVEaUdmQ1ZTdjdPVVlTeGRQWHJq?=
 =?utf-8?B?clNWakpGejJVNXVoaXVQUTlGcXdGNC9XeE92d1Vpd080bVhYT2JpUDlYNzgr?=
 =?utf-8?B?aDNMclZtQ0dPeXNEbXV2RFlFa0JzM0xwMjdiLzRNMGVCc0YzdU0rNEpDbzNn?=
 =?utf-8?B?cVM3ZERCVkFnWVpZQWNCWlpUaG12eG9oNDBxNDR5TTk2K1ZkQnV4TGgvbzBR?=
 =?utf-8?B?VjZhK0dUSWZ2ejFsTXZ4bXNjMWlaY1V2U1ZTVkdiY2F6bGhJRVA3c21VZDNF?=
 =?utf-8?B?V2pEMlBKQUJoZ2JNQWFJZFBPYzc3UmZzMWFSU2xjWndJSFZSak9IT21zTVZ6?=
 =?utf-8?B?TDBIZG1JTVNodGtpWlVqSVNFMmFGL3paUlh2UTlONWRHWHNSVTIwY0UxMmJG?=
 =?utf-8?B?WXZZWlBSb2U0VTdaZ3BMSE1NKzhrUWJPYlFXemI1dE11U0F6WERMWXpGSGRJ?=
 =?utf-8?B?Rjc4SERTYk02amRWVGoydEhiRk55TTNQcnlsR0VvSHM2L2E3cmpZSjM3NUY5?=
 =?utf-8?B?Z0NaQWphQ0RqQjQxRVoxcXNrenR6bjdoUDlmRDFUbjQvTkNVM2FTVGFoNjVC?=
 =?utf-8?B?d2QrUUlYVG9ydllib2dkdUVGR2NxemVxSmZWUVB5ekNBR0k4SWN5SFpxZnh6?=
 =?utf-8?B?dmQ4N0pObE9xeHZ3LzVRbGVaS1RycVdzaTg1U1BrelZ1SU5RNGFzTndqQzJK?=
 =?utf-8?B?bTRUeVVKRVhRNjhyZTFFdFV3dDlubEJyTkJ3RHBUN1lQSGdQUnRxTXdHdk9o?=
 =?utf-8?B?N2ZzTE1uNXQwRXV1ejhmdnJueUw5MWVwcjJ4NFQrSEhHdVBEY0VTUXBiOHlh?=
 =?utf-8?B?a1VuTGVxSUVpVUFwaW9kRVduSjdJblVDa3JCUVRya3hSNnN3cXVpeFR6L3RE?=
 =?utf-8?B?c3p4U2dIY0xqNGZkUktoRmVPRmtDSWhGQWd2K2tOVFBsVG14Z0VMN08yeW45?=
 =?utf-8?B?WSszNkQ4eXNnYWoyQ0h2cERST1VZZnY4N2VuUWpRdmt0cUVpdmFSaXAzUmsv?=
 =?utf-8?Q?scSdtYTPSpdfPo7f1iXouV3+L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a65e6608-17b9-4005-ba15-08db614bf1b4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 20:25:01.1233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMyfXfznpb2O5kB/zERx2SfyB75RLDI2iSMR/yWRGneibCY9vYB27z4V28y9eI5GpJVomNK+SNfxvSQChCNw7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6184
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
Cc: Jinhuieric.Huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2023-05-25 um 13:27 schrieb Jonathan Kim:
> In order to inspect waves from the saved context at any point during a
> debug session, the debugger must be able to preempt queues to trigger
> context save by suspending them.
>
> On queue suspend, the KFD will copy the context save header information
> so that the debugger can correctly crawl the appropriate size of the saved
> context. The debugger must then also be allowed to resume suspended queues.
>
> A queue that is newly created cannot be suspended because queue ids are
> recycled after destruction so the debugger needs to know that this has
> occurred.  Query functions will be later added that will clear a given
> queue of its new queue status.
>
> A queue cannot be destroyed while it is suspended to preserve its saved
> context during debugger inspection.  Have queue destruction block while
> a queue is suspended and unblocked when it is resumed.  Likewise, if a
> queue is about to be destroyed, it cannot be suspended.
>
> Return the number of queues successfully suspended or resumed along with
> a per queue status array where the upper bits per queue status show that
> the request was invalid (new/destroyed queue suspend request, missing
> queue) or an error occurred (HWS in a fatal state so it can't suspend or
> resume queues).
>
> v2: fixup new kfd_node struct reference for mes fw check.
> also fixup missing EC_QUEUE_NEW flagging on newly created queue.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   5 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   1 +
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  11 +
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c        |   7 +
>   .../drm/amd/amdkfd/kfd_device_queue_manager.c | 447 +++++++++++++++++-
>   .../drm/amd/amdkfd/kfd_device_queue_manager.h |  10 +
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |  10 +
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c  |  15 +-
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   |  14 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   5 +-
>   .../amd/amdkfd/kfd_process_queue_manager.c    |   1 +
>   11 files changed, 512 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> index 98cd52bb005f..b4fcad0e62f7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> @@ -772,6 +772,11 @@ bool amdgpu_amdkfd_have_atomics_support(struct amdgpu_device *adev)
>   	return adev->have_atomics_support;
>   }
>   
> +void amdgpu_amdkfd_debug_mem_fence(struct amdgpu_device *adev)
> +{
> +	amdgpu_device_flush_hdp(adev, NULL);
> +}
> +
>   void amdgpu_amdkfd_ras_poison_consumption_handler(struct amdgpu_device *adev, bool reset)
>   {
>   	amdgpu_umc_poison_handler(adev, reset);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index dd740e64e6e1..2d0406bff84e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -322,6 +322,7 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>   				      uint64_t *mmap_offset);
>   int amdgpu_amdkfd_gpuvm_export_dmabuf(struct kgd_mem *mem,
>   				      struct dma_buf **dmabuf);
> +void amdgpu_amdkfd_debug_mem_fence(struct amdgpu_device *adev);
>   int amdgpu_amdkfd_get_tile_config(struct amdgpu_device *adev,
>   				struct tile_config *config);
>   void amdgpu_amdkfd_ras_poison_consumption_handler(struct amdgpu_device *adev,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 4b45d4539d48..adda60273456 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -410,6 +410,7 @@ static int kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
>   	pr_debug("Write ptr address   == 0x%016llX\n",
>   			args->write_pointer_address);
>   
> +	kfd_dbg_ev_raise(KFD_EC_MASK(EC_QUEUE_NEW), p, dev, queue_id, false, NULL, 0);
>   	return 0;
>   
>   err_create_queue:
> @@ -2996,7 +2997,17 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   				args->launch_mode.launch_mode);
>   		break;
>   	case KFD_IOC_DBG_TRAP_SUSPEND_QUEUES:
> +		r = suspend_queues(target,
> +				args->suspend_queues.num_queues,
> +				args->suspend_queues.grace_period,
> +				args->suspend_queues.exception_mask,
> +				(uint32_t *)args->suspend_queues.queue_array_ptr);
> +
> +		break;
>   	case KFD_IOC_DBG_TRAP_RESUME_QUEUES:
> +		r = resume_queues(target, args->resume_queues.num_queues,
> +				(uint32_t *)args->resume_queues.queue_array_ptr);
> +		break;
>   	case KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH:
>   	case KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH:
>   	case KFD_IOC_DBG_TRAP_SET_FLAGS:
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> index 53c3418562d4..f4d3dfb35cb3 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -339,6 +339,13 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
>   	}
>   
>   	kfd_dbg_set_workaround(target, false);
> +
> +	if (!unwind) {
> +		int resume_count = resume_queues(target, 0, NULL);
> +
> +		if (resume_count)
> +			pr_debug("Resumed %d queues\n", resume_count);
> +	}
>   }
>   
>   static void kfd_dbg_clean_exception_status(struct kfd_process *target)
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 9186903aa9ff..03fabe6e9cdb 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -952,6 +952,92 @@ static int update_queue(struct device_queue_manager *dqm, struct queue *q,
>   	return retval;
>   }
>   
> +/* suspend_single_queue does not lock the dqm like the
> + * evict_process_queues_cpsch or evict_process_queues_nocpsch. You should
> + * lock the dqm before calling, and unlock after calling.
> + *
> + * The reason we don't lock the dqm is because this function may be
> + * called on multiple queues in a loop, so rather than locking/unlocking
> + * multiple times, we will just keep the dqm locked for all of the calls.
> + */
> +static int suspend_single_queue(struct device_queue_manager *dqm,
> +				      struct kfd_process_device *pdd,
> +				      struct queue *q)
> +{
> +	bool is_new;
> +
> +	if (q->properties.is_suspended)
> +		return 0;
> +
> +	pr_debug("Suspending PASID %u queue [%i]\n",
> +			pdd->process->pasid,
> +			q->properties.queue_id);
> +
> +	is_new = q->properties.exception_status & KFD_EC_MASK(EC_QUEUE_NEW);
> +
> +	if (is_new || q->properties.is_being_destroyed) {
> +		pr_debug("Suspend: skip %s queue id %i\n",
> +				is_new ? "new" : "destroyed",
> +				q->properties.queue_id);
> +		return -EBUSY;
> +	}
> +
> +	q->properties.is_suspended = true;
> +	if (q->properties.is_active) {
> +		if (dqm->dev->kfd->shared_resources.enable_mes) {
> +			int r = remove_queue_mes(dqm, q, &pdd->qpd);
> +
> +			if (r)
> +				return r;
> +		}
> +
> +		decrement_queue_count(dqm, &pdd->qpd, q);
> +		q->properties.is_active = false;
> +	}
> +
> +	return 0;
> +}
> +
> +/* resume_single_queue does not lock the dqm like the functions
> + * restore_process_queues_cpsch or restore_process_queues_nocpsch. You should
> + * lock the dqm before calling, and unlock after calling.
> + *
> + * The reason we don't lock the dqm is because this function may be
> + * called on multiple queues in a loop, so rather than locking/unlocking
> + * multiple times, we will just keep the dqm locked for all of the calls.
> + */
> +static int resume_single_queue(struct device_queue_manager *dqm,
> +				      struct qcm_process_device *qpd,
> +				      struct queue *q)
> +{
> +	struct kfd_process_device *pdd;
> +
> +	if (!q->properties.is_suspended)
> +		return 0;
> +
> +	pdd = qpd_to_pdd(qpd);
> +
> +	pr_debug("Restoring from suspend PASID %u queue [%i]\n",
> +			    pdd->process->pasid,
> +			    q->properties.queue_id);
> +
> +	q->properties.is_suspended = false;
> +
> +	if (QUEUE_IS_ACTIVE(q->properties)) {
> +		if (dqm->dev->kfd->shared_resources.enable_mes) {
> +			int r = add_queue_mes(dqm, q, &pdd->qpd);
> +
> +			if (r)
> +				return r;
> +		}
> +
> +		q->properties.is_active = true;
> +		increment_queue_count(dqm, qpd, q);
> +	}
> +
> +	return 0;
> +}
> +
>   static int evict_process_queues_nocpsch(struct device_queue_manager *dqm,
>   					struct qcm_process_device *qpd)
>   {
> @@ -1925,6 +2011,31 @@ static int execute_queues_cpsch(struct device_queue_manager *dqm,
>   	return map_queues_cpsch(dqm);
>   }
>   
> +static int wait_on_destroy_queue(struct device_queue_manager *dqm,
> +				 struct queue *q)
> +{
> +	struct kfd_process_device *pdd = kfd_get_process_device_data(q->device,
> +								q->process);
> +	int ret = 0;
> +
> +	if (pdd->qpd.is_debug)
> +		return ret;
> +
> +	q->properties.is_being_destroyed = true;
> +
> +	if (pdd->process->debug_trap_enabled && q->properties.is_suspended) {
> +		dqm_unlock(dqm);
> +		mutex_unlock(&q->process->mutex);
> +		ret = wait_event_interruptible(dqm->destroy_wait,
> +						!q->properties.is_suspended);
> +
> +		mutex_lock(&q->process->mutex);
> +		dqm_lock(dqm);
> +	}
> +
> +	return ret;
> +}
> +
>   static int destroy_queue_cpsch(struct device_queue_manager *dqm,
>   				struct qcm_process_device *qpd,
>   				struct queue *q)
> @@ -1944,11 +2055,16 @@ static int destroy_queue_cpsch(struct device_queue_manager *dqm,
>   				q->properties.queue_id);
>   	}
>   
> -	retval = 0;
> -
>   	/* remove queue from list to prevent rescheduling after preemption */
>   	dqm_lock(dqm);
>   
> +	retval = wait_on_destroy_queue(dqm, q);
> +
> +	if (retval) {
> +		dqm_unlock(dqm);
> +		return retval;
> +	}
> +
>   	if (qpd->is_debug) {
>   		/*
>   		 * error, currently we do not allow to destroy a queue
> @@ -1995,7 +2111,14 @@ static int destroy_queue_cpsch(struct device_queue_manager *dqm,
>   
>   	dqm_unlock(dqm);
>   
> -	/* Do free_mqd after dqm_unlock(dqm) to avoid circular locking */
> +	/*
> +	 * Do free_mqd and raise delete event after dqm_unlock(dqm) to avoid
> +	 * circular locking
> +	 */
> +	kfd_dbg_ev_raise(KFD_EC_MASK(EC_DEVICE_QUEUE_DELETE),
> +				qpd->pqm->process, q->device,
> +				-1, false, NULL, 0);
> +
>   	mqd_mgr->free_mqd(mqd_mgr, q->mqd, q->mqd_mem_obj);
>   
>   	return retval;
> @@ -2460,8 +2583,10 @@ struct device_queue_manager *device_queue_manager_init(struct kfd_node *dev)
>   		goto out_free;
>   	}
>   
> -	if (!dqm->ops.initialize(dqm))
> +	if (!dqm->ops.initialize(dqm)) {
> +		init_waitqueue_head(&dqm->destroy_wait);
>   		return dqm;
> +	}
>   
>   out_free:
>   	kfree(dqm);
> @@ -2601,6 +2726,320 @@ int release_debug_trap_vmid(struct device_queue_manager *dqm,
>   	return r;
>   }
>   
> +#define QUEUE_NOT_FOUND		-1
> +/* invalidate queue operation in array */
> +static void q_array_invalidate(uint32_t num_queues, uint32_t *queue_ids)
> +{
> +	int i;
> +
> +	for (i = 0; i < num_queues; i++)
> +		queue_ids[i] |= KFD_DBG_QUEUE_INVALID_MASK;
> +}
> +
> +/* find queue index in array */
> +static int q_array_get_index(unsigned int queue_id,
> +		uint32_t num_queues,
> +		uint32_t *queue_ids)
> +{
> +	int i;
> +
> +	for (i = 0; i < num_queues; i++)
> +		if (queue_id == (queue_ids[i] & ~KFD_DBG_QUEUE_INVALID_MASK))
> +			return i;
> +
> +	return QUEUE_NOT_FOUND;
> +}
> +
> +struct copy_context_work_handler_workarea {
> +	struct work_struct copy_context_work;
> +	struct kfd_process *p;
> +};
> +
> +static void copy_context_work_handler (struct work_struct *work)
> +{
> +	struct copy_context_work_handler_workarea *workarea;
> +	struct mqd_manager *mqd_mgr;
> +	struct queue *q;
> +	struct mm_struct *mm;
> +	struct kfd_process *p;
> +	uint32_t tmp_ctl_stack_used_size, tmp_save_area_used_size;
> +	int i;
> +
> +	workarea = container_of(work,
> +			struct copy_context_work_handler_workarea,
> +			copy_context_work);
> +
> +	p = workarea->p;
> +	mm = get_task_mm(p->lead_thread);
> +
> +	if (!mm)
> +		return;
> +
> +	kthread_use_mm(mm);
> +	for (i = 0; i < p->n_pdds; i++) {
> +		struct kfd_process_device *pdd = p->pdds[i];
> +		struct device_queue_manager *dqm = pdd->dev->dqm;
> +		struct qcm_process_device *qpd = &pdd->qpd;
> +
> +		list_for_each_entry(q, &qpd->queues_list, list) {
> +			mqd_mgr = dqm->mqd_mgrs[KFD_MQD_TYPE_CP];
> +
> +			/* We ignore the return value from get_wave_state
> +			 * because
> +			 * i) right now, it always returns 0, and
> +			 * ii) if we hit an error, we would continue to the
> +			 *      next queue anyway.
> +			 */
> +			mqd_mgr->get_wave_state(mqd_mgr,
> +					q->mqd,
> +					&q->properties,
> +					(void __user *)	q->properties.ctx_save_restore_area_address,
> +					&tmp_ctl_stack_used_size,
> +					&tmp_save_area_used_size);
> +		}
> +	}
> +	kthread_unuse_mm(mm);
> +	mmput(mm);
> +}
> +
> +static uint32_t *get_queue_ids(uint32_t num_queues, uint32_t *usr_queue_id_array)
> +{
> +	size_t array_size = num_queues * sizeof(uint32_t);
> +	uint32_t *queue_ids = NULL;
> +
> +	if (!usr_queue_id_array)
> +		return NULL;
> +
> +	queue_ids = kzalloc(array_size, GFP_KERNEL);
> +	if (!queue_ids)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (copy_from_user(queue_ids, usr_queue_id_array, array_size))
> +		return ERR_PTR(-EFAULT);
> +
> +	return queue_ids;
> +}
> +
> +int resume_queues(struct kfd_process *p,
> +		uint32_t num_queues,
> +		uint32_t *usr_queue_id_array)
> +{
> +	uint32_t *queue_ids = NULL;
> +	int total_resumed = 0;
> +	int i;
> +
> +	if (usr_queue_id_array) {
> +		queue_ids = get_queue_ids(num_queues, usr_queue_id_array);
> +
> +		if (IS_ERR(queue_ids))
> +			return PTR_ERR(queue_ids);
> +
> +		/* mask all queues as invalid.  unmask per successful request */
> +		q_array_invalidate(num_queues, queue_ids);
> +	}
> +
> +	for (i = 0; i < p->n_pdds; i++) {
> +		struct kfd_process_device *pdd = p->pdds[i];
> +		struct device_queue_manager *dqm = pdd->dev->dqm;
> +		struct qcm_process_device *qpd = &pdd->qpd;
> +		struct queue *q;
> +		int r, per_device_resumed = 0;
> +
> +		dqm_lock(dqm);
> +
> +		/* unmask queues that resume or already resumed as valid */
> +		list_for_each_entry(q, &qpd->queues_list, list) {
> +			int q_idx = QUEUE_NOT_FOUND;
> +
> +			if (queue_ids)
> +				q_idx = q_array_get_index(
> +						q->properties.queue_id,
> +						num_queues,
> +						queue_ids);
> +
> +			if (!queue_ids || q_idx != QUEUE_NOT_FOUND) {
> +				int err = resume_single_queue(dqm, &pdd->qpd, q);
> +
> +				if (queue_ids) {
> +					if (!err) {
> +						queue_ids[q_idx] &=
> +							~KFD_DBG_QUEUE_INVALID_MASK;
> +					} else {
> +						queue_ids[q_idx] |=
> +							KFD_DBG_QUEUE_ERROR_MASK;
> +						break;
> +					}
> +				}
> +
> +				if (dqm->dev->kfd->shared_resources.enable_mes) {
> +					wake_up_all(&dqm->destroy_wait);
> +					if (!err)
> +						total_resumed++;
> +				} else {
> +					per_device_resumed++;
> +				}
> +			}
> +		}
> +
> +		if (!per_device_resumed) {
> +			dqm_unlock(dqm);
> +			continue;
> +		}
> +
> +		r = execute_queues_cpsch(dqm,
> +					KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES,
> +					0,
> +					USE_DEFAULT_GRACE_PERIOD);
> +		if (r) {
> +			pr_err("Failed to resume process queues\n");
> +			if (queue_ids) {
> +				list_for_each_entry(q, &qpd->queues_list, list) {
> +					int q_idx = q_array_get_index(
> +							q->properties.queue_id,
> +							num_queues,
> +							queue_ids);
> +
> +					/* mask queue as error on resume fail */
> +					if (q_idx != QUEUE_NOT_FOUND)
> +						queue_ids[q_idx] |=
> +							KFD_DBG_QUEUE_ERROR_MASK;
> +				}
> +			}
> +		} else {
> +			wake_up_all(&dqm->destroy_wait);
> +			total_resumed += per_device_resumed;
> +		}
> +
> +		dqm_unlock(dqm);
> +	}
> +
> +	if (queue_ids) {
> +		if (copy_to_user((void __user *)usr_queue_id_array, queue_ids,
> +				num_queues * sizeof(uint32_t)))
> +			pr_err("copy_to_user failed on queue resume\n");
> +
> +		kfree(queue_ids);
> +	}
> +
> +	return total_resumed;
> +}
> +
> +int suspend_queues(struct kfd_process *p,
> +			uint32_t num_queues,
> +			uint32_t grace_period,
> +			uint64_t exception_clear_mask,
> +			uint32_t *usr_queue_id_array)
> +{
> +	uint32_t *queue_ids = get_queue_ids(num_queues, usr_queue_id_array);
> +	int total_suspended = 0;
> +	int i;
> +
> +	if (IS_ERR(queue_ids))
> +		return PTR_ERR(queue_ids);
> +
> +	/* mask all queues as invalid.  umask on successful request */
> +	q_array_invalidate(num_queues, queue_ids);
> +
> +	for (i = 0; i < p->n_pdds; i++) {
> +		struct kfd_process_device *pdd = p->pdds[i];
> +		struct device_queue_manager *dqm = pdd->dev->dqm;
> +		struct qcm_process_device *qpd = &pdd->qpd;
> +		struct queue *q;
> +		int r, per_device_suspended = 0;
> +
> +		mutex_lock(&p->event_mutex);
> +		dqm_lock(dqm);
> +
> +		/* unmask queues that suspend or already suspended */
> +		list_for_each_entry(q, &qpd->queues_list, list) {
> +			int q_idx = q_array_get_index(q->properties.queue_id,
> +							num_queues,
> +							queue_ids);
> +
> +			if (q_idx != QUEUE_NOT_FOUND) {
> +				int err = suspend_single_queue(dqm, pdd, q);
> +				bool is_mes = dqm->dev->kfd->shared_resources.enable_mes;
> +
> +				if (!err) {
> +					queue_ids[q_idx] &= ~KFD_DBG_QUEUE_INVALID_MASK;
> +					if (exception_clear_mask && is_mes)
> +						q->properties.exception_status &=
> +							~exception_clear_mask;
> +
> +					if (is_mes)
> +						total_suspended++;
> +					else
> +						per_device_suspended++;
> +				} else if (err != -EBUSY) {
> +					r = err;
> +					queue_ids[q_idx] |= KFD_DBG_QUEUE_ERROR_MASK;
> +					break;
> +				}
> +			}
> +		}
> +
> +		if (!per_device_suspended) {
> +			dqm_unlock(dqm);
> +			mutex_unlock(&p->event_mutex);
> +			if (total_suspended)
> +				amdgpu_amdkfd_debug_mem_fence(dqm->dev->adev);
> +			continue;
> +		}
> +
> +		r = execute_queues_cpsch(dqm,
> +			KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
> +			grace_period);
> +
> +		if (r)
> +			pr_err("Failed to suspend process queues.\n");
> +		else
> +			total_suspended += per_device_suspended;
> +
> +		list_for_each_entry(q, &qpd->queues_list, list) {
> +			int q_idx = q_array_get_index(q->properties.queue_id,
> +						num_queues, queue_ids);
> +
> +			if (q_idx == QUEUE_NOT_FOUND)
> +				continue;
> +
> +			/* mask queue as error on suspend fail */
> +			if (r)
> +				queue_ids[q_idx] |= KFD_DBG_QUEUE_ERROR_MASK;
> +			else if (exception_clear_mask)
> +				q->properties.exception_status &=
> +							~exception_clear_mask;
> +		}
> +
> +		dqm_unlock(dqm);
> +		mutex_unlock(&p->event_mutex);
> +		amdgpu_device_flush_hdp(dqm->dev->adev, NULL);
> +	}
> +
> +	if (total_suspended) {
> +		struct copy_context_work_handler_workarea copy_context_worker;
> +
> +		INIT_WORK_ONSTACK(
> +				&copy_context_worker.copy_context_work,
> +				copy_context_work_handler);
> +
> +		copy_context_worker.p = p;
> +
> +		schedule_work(&copy_context_worker.copy_context_work);
> +
> +
> +		flush_work(&copy_context_worker.copy_context_work);
> +		destroy_work_on_stack(&copy_context_worker.copy_context_work);
> +	}
> +
> +	if (copy_to_user((void __user *)usr_queue_id_array, queue_ids,
> +			num_queues * sizeof(uint32_t)))
> +		pr_err("copy_to_user failed on queue suspend\n");
> +
> +	kfree(queue_ids);
> +
> +	return total_suspended;
> +}
> +
>   int debug_lock_and_unmap(struct device_queue_manager *dqm)
>   {
>   	int r;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> index bb75d93712eb..d4e6dbffe8c2 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> @@ -263,6 +263,8 @@ struct device_queue_manager {
>   	uint32_t		current_logical_xcc_start;
>   
>   	uint32_t		wait_times;
> +
> +	wait_queue_head_t	destroy_wait;
>   };
>   
>   void device_queue_manager_init_cik(
> @@ -290,6 +292,14 @@ int reserve_debug_trap_vmid(struct device_queue_manager *dqm,
>   			struct qcm_process_device *qpd);
>   int release_debug_trap_vmid(struct device_queue_manager *dqm,
>   			struct qcm_process_device *qpd);
> +int suspend_queues(struct kfd_process *p,
> +			uint32_t num_queues,
> +			uint32_t grace_period,
> +			uint64_t exception_clear_mask,
> +			uint32_t *usr_queue_id_array);
> +int resume_queues(struct kfd_process *p,
> +		uint32_t num_queues,
> +		uint32_t *usr_queue_id_array);
>   int debug_lock_and_unmap(struct device_queue_manager *dqm);
>   int debug_map_and_unlock(struct device_queue_manager *dqm);
>   int debug_refresh_runlist(struct device_queue_manager *dqm);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
> index a0ac4f2fe6b5..94c0fc2e57b7 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
> @@ -237,6 +237,7 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
>   			  u32 *save_area_used_size)
>   {
>   	struct v10_compute_mqd *m;
> +	struct kfd_context_save_area_header header;
>   
>   	m = get_mqd(mqd);
>   
> @@ -255,6 +256,15 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
>   	 * accessible to user mode
>   	 */
>   
> +	header.wave_state.control_stack_size = *ctl_stack_used_size;
> +	header.wave_state.wave_state_size = *save_area_used_size;
> +
> +	header.wave_state.wave_state_offset = m->cp_hqd_wg_state_offset;
> +	header.wave_state.control_stack_offset = m->cp_hqd_cntl_stack_offset;
> +
> +	if (copy_to_user(ctl_stack, &header, sizeof(header.wave_state)))
> +		return -EFAULT;
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
> index 9a9b4e853516..31fec5e70d13 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
> @@ -291,7 +291,7 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
>   			  u32 *save_area_used_size)
>   {
>   	struct v11_compute_mqd *m;
> -	/*struct mqd_user_context_save_area_header header;*/
> +	struct kfd_context_save_area_header header;
>   
>   	m = get_mqd(mqd);
>   
> @@ -309,16 +309,15 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
>   	 * it's part of the context save area that is already
>   	 * accessible to user mode
>   	 */
> -/*
> -	header.control_stack_size = *ctl_stack_used_size;
> -	header.wave_state_size = *save_area_used_size;
> +	header.wave_state.control_stack_size = *ctl_stack_used_size;
> +	header.wave_state.wave_state_size = *save_area_used_size;
>   
> -	header.wave_state_offset = m->cp_hqd_wg_state_offset;
> -	header.control_stack_offset = m->cp_hqd_cntl_stack_offset;
> +	header.wave_state.wave_state_offset = m->cp_hqd_wg_state_offset;
> +	header.wave_state.control_stack_offset = m->cp_hqd_cntl_stack_offset;
>   
> -	if (copy_to_user(ctl_stack, &header, sizeof(header)))
> +	if (copy_to_user(ctl_stack, &header, sizeof(header.wave_state)))
>   		return -EFAULT;
> -*/
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> index 5b87c244e909..601bb9f68048 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> @@ -311,6 +311,7 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
>   			  u32 *save_area_used_size)
>   {
>   	struct v9_mqd *m;
> +	struct kfd_context_save_area_header header;
>   
>   	/* Control stack is located one page after MQD. */
>   	void *mqd_ctl_stack = (void *)((uintptr_t)mqd + PAGE_SIZE);
> @@ -322,7 +323,18 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
>   	*save_area_used_size = m->cp_hqd_wg_state_offset -
>   		m->cp_hqd_cntl_stack_size;
>   
> -	if (copy_to_user(ctl_stack, mqd_ctl_stack, m->cp_hqd_cntl_stack_size))
> +	header.wave_state.control_stack_size = *ctl_stack_used_size;
> +	header.wave_state.wave_state_size = *save_area_used_size;
> +
> +	header.wave_state.wave_state_offset = m->cp_hqd_wg_state_offset;
> +	header.wave_state.control_stack_offset = m->cp_hqd_cntl_stack_offset;
> +
> +	if (copy_to_user(ctl_stack, &header, sizeof(header.wave_state)))
> +		return -EFAULT;
> +
> +	if (copy_to_user(ctl_stack + m->cp_hqd_cntl_stack_offset,
> +				mqd_ctl_stack + m->cp_hqd_cntl_stack_offset,
> +				*ctl_stack_used_size))
>   		return -EFAULT;
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index cd2d56e5cdf0..05da43bf233a 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -510,6 +510,8 @@ struct queue_properties {
>   	uint32_t doorbell_off;
>   	bool is_interop;
>   	bool is_evicted;
> +	bool is_suspended;
> +	bool is_being_destroyed;
>   	bool is_active;
>   	bool is_gws;
>   	uint32_t pm4_target_xcc;
> @@ -535,7 +537,8 @@ struct queue_properties {
>   #define QUEUE_IS_ACTIVE(q) ((q).queue_size > 0 &&	\
>   			    (q).queue_address != 0 &&	\
>   			    (q).queue_percent > 0 &&	\
> -			    !(q).is_evicted)
> +			    !(q).is_evicted &&		\
> +			    !(q).is_suspended)
>   
>   enum mqd_update_flag {
>   	UPDATE_FLAG_DBG_WA_ENABLE = 1,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> index 70852a200d8f..01ccab607a69 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> @@ -187,6 +187,7 @@ static int init_user_queue(struct process_queue_manager *pqm,
>   
>   	/* Doorbell initialized in user space*/
>   	q_properties->doorbell_ptr = NULL;
> +	q_properties->exception_status = KFD_EC_MASK(EC_QUEUE_NEW);
>   
>   	/* let DQM handle it*/
>   	q_properties->vmid = 0;
