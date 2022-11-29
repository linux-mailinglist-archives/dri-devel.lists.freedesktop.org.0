Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC6863CA61
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 22:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2487F10E3F4;
	Tue, 29 Nov 2022 21:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2082.outbound.protection.outlook.com [40.107.96.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FFE10E3EB;
 Tue, 29 Nov 2022 21:14:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kyENqZEw75raJwAA8uDQ0iP/xHSRo/HmNQhJeH9Q9erlVWilh/EYQSGhqXBlro2AVgl/BZlGQjdsn4q+/yBveXD4oa24sy7ZCw/a8566dvnfDEpo11310OzBZtowRv4Sf3G25N0rmTqbDy+qjfkE9Pe/MlyagnexMlYrp/AF4ZAwd5adqW/yFMmc49VPOyAwQFi9JbL6oE9NU691fVCudjeUwFIqMdOnbTLOsEE74LfLeTnCBQQFzdRs/dj00y9QSYZUjx49VxSDISnbfNQELG8Sktil7x4rxb9KjqlG+B57VLGvAQP9hIxFqIlXUm6kyjRUgNtf25OeJBKZuiDAbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TopLySu/KPzURiWMX4x5RSPnRlHYO7lEmIxo19hWdHY=;
 b=C7PBKuSOrounPCzaPhkGeOvNjkxvDa3As4pWIssU1NA5XExTb7FLMcpVheh82SvibbB3sW4/Q/xhCs5wbtqQbEfcbjS04G4BV40ynik1/3VIoCiGMJ1s5hhtl/jjE9N0+QMulIExj/GdGRF+aJSpYKEaU9ZnGnVg2EdSBJV/FzmBwrqQPLx0iIlWC4pq8s8yCSS5iSxBJYm/3fMlj3Wd3PRcOejgam38/sWS0YWoZbhv0lkaIOlajec9wsLtFg2/NV6hNm91HPklrKT+oM+hvkOLhQ1AS+++Dn0CSwBWntE5dDeV9hFAdrWbbW8KQYKPHvRlwrt+OcPQBj4/czEzpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TopLySu/KPzURiWMX4x5RSPnRlHYO7lEmIxo19hWdHY=;
 b=MjuiSc6NoMEYEO/Yw4n1bgmenJnie77/OFQyXBgg+wMu2uu0xpBu+Dn33lvwzNUpzABzoJWeBzNqk/uxGZiWrXaIxB+oagL7xxZwWoWxDO2qMxQQwuq9Ps7TCTLVFiD/UcWyX1XYEC6HFvZy4vx0sUXPjawC6VaeJw8NNlmQgVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA1PR12MB6065.namprd12.prod.outlook.com (2603:10b6:208:3ef::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 21:14:12 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::5d8:f3f2:d940:5350]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::5d8:f3f2:d940:5350%3]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 21:14:12 +0000
Message-ID: <8ff841e3-8eef-9ec2-2ba5-4907f18873c0@amd.com>
Date: Tue, 29 Nov 2022 16:14:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/9] drm/ttm: use per BO cleanup workers
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-3-christian.koenig@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20221125102137.1801-3-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0042.namprd02.prod.outlook.com
 (2603:10b6:207:3d::19) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA1PR12MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: f3a0560c-b8cf-448b-574a-08dad24ea969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ns8n9jpqwH7ly132p468Tk6Tw2Qo6wDDFgxzDKz3xpKVk0J2HUZaf7bt4k3csNzzHprXqAPXIOYqQ7HFHLKAWiAuDFNZf1ONhJvY1fTEBkFmGkOxTRUiIP7yiBMLlUy60XV1WwBWrQvLLSKwiunbsBkRwgeHHsrxNumZ3/y3QOFKF9WZA9mvzhacLkWGm4ZXoAOhHIsbHxkZ9K1BcPYit2magT1Y9LFMac/iuuYVCBSY4fc9PW52VfnlTWEf/4wdHiTP0Iz6f9028JbHaFrmnjevrbLD3KfmvZQCwTV17nKbyfhCiIksXXCDJI6woZ1LZaX9NWXYiBWhVcRCNE7eD7xVSbrAYGWVXswDoIfKH2m0+BZmid5R22XXvl+B9+vk8eSPl2vosZ4B4abDPgdbhLF+H/lhFqf8OeRFJUf2V4aezUapOtJ6fJWXpjOKM5/9bFNGAL4PusY5Fgn5s9KBQxPlIkwxsoFcf7rhxW9761O9JlqOFaQf58V7R6MZXW8Z1T3DUA/+pc2oTBFnv/A51rszaiNLDDg/M8YRNhuSKKsLyrJATMUA/lS0G+Rv6f85ajnDZqjvKFroe75t9NRSAQkCERG/oIgvoOu1jgPM/YVgF8NY4LXPDrjOf8GQFkw/ScJ0kE0nnXhSwUx/TJ1NpgqjG1+kHi8uI55XETLyo5sFPjMGCWJLQOFfU2rfwiwl6tPz+8HinPGU6b5lG/2FrXhjmA6AwGVodYdw8yczEE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199015)(31696002)(8676002)(66946007)(6512007)(66556008)(53546011)(41300700001)(26005)(8936002)(6506007)(6486002)(478600001)(36916002)(2616005)(110136005)(316002)(38100700002)(30864003)(44832011)(5660300002)(66574015)(2906002)(4001150100001)(83380400001)(66476007)(31686004)(86362001)(186003)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFU2UkFGVHIxczNZcVlKZ0xvSHFKVjg3ZWhpK2wrUXQ4Mm5namlUZTBJb3dL?=
 =?utf-8?B?WFM1ZCtCV3cvSmZ5QWFOTEMrM0dVQUJhNktEVXNsdWR1ZUxiLzhTYjNZZUFm?=
 =?utf-8?B?U2V2QnVzZ2cyQzRSNi9YK0hqbEsvRmF2WkxRTHppRmNySFc1UjVyakVKNzVw?=
 =?utf-8?B?cW5nZXRZczdIQTkrbmZhMnZjVUZxUFp1c1FHNk5ZdmdWTmxQbzRrcVdCK0tY?=
 =?utf-8?B?eEErNmZXd1Fna01XSitBRzJCcGJxWERQOHo1bHlacDBic2V6M1dEUWhpcG1m?=
 =?utf-8?B?R0pyUXRHdExmQVdHY25KY2pqQmtwL21GamczUTJPWU9aa0E5bDVZenFwdXJ1?=
 =?utf-8?B?UzB6Lzk2dEx5RERPa253UGtoREtEVk9reVVvTkpFVCtLUFdmNDMyOGEwbCtZ?=
 =?utf-8?B?b3A4RzRPSnRqRmRFT3RzczZFdWkyYlkvQUdTVUhlQzVZVm54T2p3ZlFxY0Zr?=
 =?utf-8?B?NWQ0dDB4Q3QzbDRJcGVoRGQzQmhjVExwazJhUXVYZDhaV044eHBQQm9HcXcx?=
 =?utf-8?B?M3Q5RkhySnNQRE5Ba2N6MWhmRlpWTmZmaFU1WFVxRDhZZUxBMGJlN1RrbnBx?=
 =?utf-8?B?MFFmZTE5cVJvM2dGT1FabnI2RWxCSStnK0xHVTdOYVJzRjNpSTQ4Qi9tKzFG?=
 =?utf-8?B?SEJWV3B5N1NjSms4Y2JhcDJaWjlMdFh1MjFDY2VyeE5PMktGOGVOU2pjUFZ5?=
 =?utf-8?B?aDdJMmdZZ2hyNWdKVlBNYWNLM1BpbWhlcExWN0hXYk5zeDlaK2J1MllYaEVz?=
 =?utf-8?B?WUc1V2F4bGs2MnE1OXVFQWpDSDVsMGw1MGtvbEtMNmsrMmo1di80WStwNzhZ?=
 =?utf-8?B?YzhTYzdRQUlFWHZrYVM3V2N2SGZoektqc2tYMjM5MjBqQ1FlNkNqSDVjVCs2?=
 =?utf-8?B?eFJiRzNRRmR6THViNjhDVXZUT3JmVUFzMklXQ2VLOGVHU1RJd2VENThrTXJx?=
 =?utf-8?B?VmMxcFUzYi9Od3E2a25LWCs5MDhsbTQvNmgvckpKS0lIcG9KNzNjeTFkdS9Z?=
 =?utf-8?B?TXNJaDdrOE1kaVBuY1ZvK0svc21RbHVGajdId2ZPUFppSUwzU2g0M3JQcEkz?=
 =?utf-8?B?R3BVclBkeVJ1VE5na1NZMU5iM1ZPVXdQYlBKbnhSQmYzbDZEdjZPaVd2b3JR?=
 =?utf-8?B?M1EvRnowdVA3MmNxMVB4cm8yZi9qSnNrZlE0UTNWaTNBQWt1VWMzN0JTUmNB?=
 =?utf-8?B?bG5ib2RsNHpDajBsNUVUQnl2cXBPaTFnM2NjWnBOL00wMGdFNnE1UUxjNGgw?=
 =?utf-8?B?NWR6THB5cWpaOU1FSkhHNGRDRUU3YTFYWER3VjV6MURVSHh6Q1ZXREZhVGZ6?=
 =?utf-8?B?SEo5K3VqSzhnZDlzREN1Rzd2MTFnM3kvSUZkMnRINEp6YU5rTnJBUktYVWNW?=
 =?utf-8?B?ekhEVE03MnkyMUJLbXZ6bDBTclpWN1RXYXAzWFJzc21meE5iQVB0bVBzS1F5?=
 =?utf-8?B?QUFYRXlmT1NjeXNNV2kxcFNoNzFaY2JBNjRqMFVtUnZEUElTNzZjNWs2OEJr?=
 =?utf-8?B?bGxGb3RmUm9CYm9DQU5zYmVIUTY5RG9HSkhVV1djUEVhYWdDbXRvYU9jSm9l?=
 =?utf-8?B?eCtqam1PL0lPQ2dSRkhyekRrdTBhRGZscTdCcFFaZzFjSnFZamNIWDBEWUVQ?=
 =?utf-8?B?ZVAvUEJ5VThGUzNyd3N0azFGNFhHZWF0L3I0QThlL0ZHTzlWZ2w1WktWR2dv?=
 =?utf-8?B?QkloanB1LzdNN1ovbGkrQXFOMzJoZU1oQ3ZTTGczZStxMkJEOFA1OU5Sc2xt?=
 =?utf-8?B?TGttaEZGeTJ3bVEvMzVLNmxnTENrYitUYnFwYVdRbVN5S2s1NzdMRzJCVHZX?=
 =?utf-8?B?bUlqMnBvamRyWUZiUmtZSUpyOWQyazZDVnhJKytVclNDMit1ZlJjb0lJeEI5?=
 =?utf-8?B?VnRyRm9vbTZDL28zVmlWZjFjSDdaWDRyV2l0c2dORE5MVklIcGxNRXI0RE55?=
 =?utf-8?B?NEN1MHl6TzVpaUhRaFFjWEdpaVMyb2lhZ1VRZzBHMlg0T09yNCtnV2JOc1Fa?=
 =?utf-8?B?VGF1YlNYc1hJUHFOSk9KMEpuZmFIUXNsQlI3VS83M0MzbzNsY2Rxem55U2c4?=
 =?utf-8?B?NGc4dXBrWnhrNXh3OWtLUUJLK243RlZyczZ1ZG9hdkd2RGkrUWx5SUVZajRl?=
 =?utf-8?Q?cnmgPhyEZy5gV7HuMjofVjH+6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a0560c-b8cf-448b-574a-08dad24ea969
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 21:14:11.9443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6wrn6rPnyND4sQvPCxywd0Bm+A7YzqFF2+ac/MSOlnRSRXjjoUfz7wOm+Lc6ShAmkFd2fjyM22QPZ86FkoDBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6065
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

On 2022-11-25 05:21, Christian König wrote:
> Instead of a single worker going over the list of delete BOs in regular
> intervals use a per BO worker which blocks for the resv object and
> locking of the BO.
>
> This not only simplifies the handling massively, but also results in
> much better response time when cleaning up buffers.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>

Just thinking out loud: If I understand it correctly, this can cause a 
lot of sleeping worker threads when 
AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE is used and many BOs are freed at 
the same time. This happens e.g. when a KFD process terminates or 
crashes. I guess with a concurrency-managed workqueue this isn't going 
to be excessive. And since it's on a per device workqueue, it doesn't 
stall work items on the system work queue or from other devices.

I'm trying to understand why you set WQ_MEM_RECLAIM. This work queue is 
not about freeing ttm_resources but about freeing the BOs. But it 
affects freeing of ghost_objs that are holding the ttm_resources being 
freed.

If those assumptions all make sense, patches 1-3 are

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
>   drivers/gpu/drm/i915/i915_gem.c            |   2 +-
>   drivers/gpu/drm/i915/intel_region_ttm.c    |   2 +-
>   drivers/gpu/drm/ttm/ttm_bo.c               | 112 ++++++++-------------
>   drivers/gpu/drm/ttm/ttm_bo_util.c          |   1 -
>   drivers/gpu/drm/ttm/ttm_device.c           |  24 ++---
>   include/drm/ttm/ttm_bo_api.h               |  18 +---
>   include/drm/ttm/ttm_device.h               |   7 +-
>   8 files changed, 57 insertions(+), 111 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 2b1db37e25c1..74ccbd566777 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3984,7 +3984,7 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
>   	amdgpu_fence_driver_hw_fini(adev);
>   
>   	if (adev->mman.initialized)
> -		flush_delayed_work(&adev->mman.bdev.wq);
> +		drain_workqueue(adev->mman.bdev.wq);
>   
>   	if (adev->pm_sysfs_en)
>   		amdgpu_pm_sysfs_fini(adev);
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 8468ca9885fd..c38306f156d6 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1099,7 +1099,7 @@ void i915_gem_drain_freed_objects(struct drm_i915_private *i915)
>   {
>   	while (atomic_read(&i915->mm.free_count)) {
>   		flush_work(&i915->mm.free_work);
> -		flush_delayed_work(&i915->bdev.wq);
> +		drain_workqueue(i915->bdev.wq);
>   		rcu_barrier();
>   	}
>   }
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
> index cf89d0c2a2d9..657bbc16a48a 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> @@ -132,7 +132,7 @@ int intel_region_ttm_fini(struct intel_memory_region *mem)
>   			break;
>   
>   		msleep(20);
> -		flush_delayed_work(&mem->i915->bdev.wq);
> +		drain_workqueue(mem->i915->bdev.wq);
>   	}
>   
>   	/* If we leaked objects, Don't free the region causing use after free */
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index b77262a623e0..4749b65bedc4 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -280,14 +280,13 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
>   		ret = 0;
>   	}
>   
> -	if (ret || unlikely(list_empty(&bo->ddestroy))) {
> +	if (ret) {
>   		if (unlock_resv)
>   			dma_resv_unlock(bo->base.resv);
>   		spin_unlock(&bo->bdev->lru_lock);
>   		return ret;
>   	}
>   
> -	list_del_init(&bo->ddestroy);
>   	spin_unlock(&bo->bdev->lru_lock);
>   	ttm_bo_cleanup_memtype_use(bo);
>   
> @@ -300,47 +299,21 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
>   }
>   
>   /*
> - * Traverse the delayed list, and call ttm_bo_cleanup_refs on all
> - * encountered buffers.
> + * Block for the dma_resv object to become idle, lock the buffer and clean up
> + * the resource and tt object.
>    */
> -bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all)
> +static void ttm_bo_delayed_delete(struct work_struct *work)
>   {
> -	struct list_head removed;
> -	bool empty;
> -
> -	INIT_LIST_HEAD(&removed);
> -
> -	spin_lock(&bdev->lru_lock);
> -	while (!list_empty(&bdev->ddestroy)) {
> -		struct ttm_buffer_object *bo;
> -
> -		bo = list_first_entry(&bdev->ddestroy, struct ttm_buffer_object,
> -				      ddestroy);
> -		list_move_tail(&bo->ddestroy, &removed);
> -		if (!ttm_bo_get_unless_zero(bo))
> -			continue;
> -
> -		if (remove_all || bo->base.resv != &bo->base._resv) {
> -			spin_unlock(&bdev->lru_lock);
> -			dma_resv_lock(bo->base.resv, NULL);
> -
> -			spin_lock(&bdev->lru_lock);
> -			ttm_bo_cleanup_refs(bo, false, !remove_all, true);
> -
> -		} else if (dma_resv_trylock(bo->base.resv)) {
> -			ttm_bo_cleanup_refs(bo, false, !remove_all, true);
> -		} else {
> -			spin_unlock(&bdev->lru_lock);
> -		}
> +	struct ttm_buffer_object *bo;
>   
> -		ttm_bo_put(bo);
> -		spin_lock(&bdev->lru_lock);
> -	}
> -	list_splice_tail(&removed, &bdev->ddestroy);
> -	empty = list_empty(&bdev->ddestroy);
> -	spin_unlock(&bdev->lru_lock);
> +	bo = container_of(work, typeof(*bo), delayed_delete);
>   
> -	return empty;
> +	dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP, false,
> +			      MAX_SCHEDULE_TIMEOUT);
> +	dma_resv_lock(bo->base.resv, NULL);
> +	ttm_bo_cleanup_memtype_use(bo);
> +	dma_resv_unlock(bo->base.resv);
> +	ttm_bo_put(bo);
>   }
>   
>   static void ttm_bo_release(struct kref *kref)
> @@ -369,44 +342,40 @@ static void ttm_bo_release(struct kref *kref)
>   
>   		drm_vma_offset_remove(bdev->vma_manager, &bo->base.vma_node);
>   		ttm_mem_io_free(bdev, bo->resource);
> -	}
> -
> -	if (!dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP) ||
> -	    !dma_resv_trylock(bo->base.resv)) {
> -		/* The BO is not idle, resurrect it for delayed destroy */
> -		ttm_bo_flush_all_fences(bo);
> -		bo->deleted = true;
>   
> -		spin_lock(&bo->bdev->lru_lock);
> +		if (!dma_resv_test_signaled(bo->base.resv,
> +					    DMA_RESV_USAGE_BOOKKEEP) ||
> +		    !dma_resv_trylock(bo->base.resv)) {
> +			/* The BO is not idle, resurrect it for delayed destroy */
> +			ttm_bo_flush_all_fences(bo);
> +			bo->deleted = true;
>   
> -		/*
> -		 * Make pinned bos immediately available to
> -		 * shrinkers, now that they are queued for
> -		 * destruction.
> -		 *
> -		 * FIXME: QXL is triggering this. Can be removed when the
> -		 * driver is fixed.
> -		 */
> -		if (bo->pin_count) {
> -			bo->pin_count = 0;
> -			ttm_resource_move_to_lru_tail(bo->resource);
> -		}
> +			spin_lock(&bo->bdev->lru_lock);
>   
> -		kref_init(&bo->kref);
> -		list_add_tail(&bo->ddestroy, &bdev->ddestroy);
> -		spin_unlock(&bo->bdev->lru_lock);
> +			/*
> +			 * Make pinned bos immediately available to
> +			 * shrinkers, now that they are queued for
> +			 * destruction.
> +			 *
> +			 * FIXME: QXL is triggering this. Can be removed when the
> +			 * driver is fixed.
> +			 */
> +			if (bo->pin_count) {
> +				bo->pin_count = 0;
> +				ttm_resource_move_to_lru_tail(bo->resource);
> +			}
>   
> -		schedule_delayed_work(&bdev->wq,
> -				      ((HZ / 100) < 1) ? 1 : HZ / 100);
> -		return;
> -	}
> +			kref_init(&bo->kref);
> +			spin_unlock(&bo->bdev->lru_lock);
>   
> -	spin_lock(&bo->bdev->lru_lock);
> -	list_del(&bo->ddestroy);
> -	spin_unlock(&bo->bdev->lru_lock);
> +			INIT_WORK(&bo->delayed_delete, ttm_bo_delayed_delete);
> +			queue_work(bdev->wq, &bo->delayed_delete);
> +			return;
> +		}
>   
> -	ttm_bo_cleanup_memtype_use(bo);
> -	dma_resv_unlock(bo->base.resv);
> +		ttm_bo_cleanup_memtype_use(bo);
> +		dma_resv_unlock(bo->base.resv);
> +	}
>   
>   	atomic_dec(&ttm_glob.bo_count);
>   	bo->destroy(bo);
> @@ -946,7 +915,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
>   	int ret;
>   
>   	kref_init(&bo->kref);
> -	INIT_LIST_HEAD(&bo->ddestroy);
>   	bo->bdev = bdev;
>   	bo->type = type;
>   	bo->page_alignment = alignment;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index ba3aa0a0fc43..ae4b7922ee1a 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -230,7 +230,6 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>   	 */
>   
>   	atomic_inc(&ttm_glob.bo_count);
> -	INIT_LIST_HEAD(&fbo->base.ddestroy);
>   	drm_vma_node_reset(&fbo->base.base.vma_node);
>   
>   	kref_init(&fbo->base.kref);
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index e7147e304637..e9bedca4dfdc 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -175,16 +175,6 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   }
>   EXPORT_SYMBOL(ttm_device_swapout);
>   
> -static void ttm_device_delayed_workqueue(struct work_struct *work)
> -{
> -	struct ttm_device *bdev =
> -		container_of(work, struct ttm_device, wq.work);
> -
> -	if (!ttm_bo_delayed_delete(bdev, false))
> -		schedule_delayed_work(&bdev->wq,
> -				      ((HZ / 100) < 1) ? 1 : HZ / 100);
> -}
> -
>   /**
>    * ttm_device_init
>    *
> @@ -215,15 +205,19 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
>   	if (ret)
>   		return ret;
>   
> +	bdev->wq = alloc_workqueue("ttm", WQ_MEM_RECLAIM | WQ_HIGHPRI, 16);
> +	if (!bdev->wq) {
> +		ttm_global_release();
> +		return -ENOMEM;
> +	}
> +
>   	bdev->funcs = funcs;
>   
>   	ttm_sys_man_init(bdev);
>   	ttm_pool_init(&bdev->pool, dev, use_dma_alloc, use_dma32);
>   
>   	bdev->vma_manager = vma_manager;
> -	INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
>   	spin_lock_init(&bdev->lru_lock);
> -	INIT_LIST_HEAD(&bdev->ddestroy);
>   	INIT_LIST_HEAD(&bdev->pinned);
>   	bdev->dev_mapping = mapping;
>   	mutex_lock(&ttm_global_mutex);
> @@ -247,10 +241,8 @@ void ttm_device_fini(struct ttm_device *bdev)
>   	list_del(&bdev->device_list);
>   	mutex_unlock(&ttm_global_mutex);
>   
> -	cancel_delayed_work_sync(&bdev->wq);
> -
> -	if (ttm_bo_delayed_delete(bdev, true))
> -		pr_debug("Delayed destroy list was clean\n");
> +	drain_workqueue(bdev->wq);
> +	destroy_workqueue(bdev->wq);
>   
>   	spin_lock(&bdev->lru_lock);
>   	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 7758347c461c..69e62bbb01e3 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -92,7 +92,6 @@ struct ttm_tt;
>    * @ttm: TTM structure holding system pages.
>    * @evicted: Whether the object was evicted without user-space knowing.
>    * @deleted: True if the object is only a zombie and already deleted.
> - * @ddestroy: List head for the delayed destroy list.
>    * @swap: List head for swap LRU list.
>    * @offset: The current GPU offset, which can have different meanings
>    * depending on the memory type. For SYSTEM type memory, it should be 0.
> @@ -135,19 +134,14 @@ struct ttm_buffer_object {
>   	struct ttm_tt *ttm;
>   	bool deleted;
>   	struct ttm_lru_bulk_move *bulk_move;
> +	unsigned priority;
> +	unsigned pin_count;
>   
>   	/**
> -	 * Members protected by the bdev::lru_lock.
> -	 */
> -
> -	struct list_head ddestroy;
> -
> -	/**
> -	 * Members protected by a bo reservation.
> +	 * @delayed_delete: Work item used when we can't delete the BO
> +	 * immediately
>   	 */
> -
> -	unsigned priority;
> -	unsigned pin_count;
> +	struct work_struct delayed_delete;
>   
>   	/**
>   	 * Special members that are protected by the reserve lock
> @@ -448,8 +442,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
>   
>   int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>   		     void *buf, int len, int write);
> -bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
> -
>   vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
>   
>   #endif
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index 95b3c04b1ab9..4f3e81eac6f3 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -251,11 +251,6 @@ struct ttm_device {
>   	 */
>   	spinlock_t lru_lock;
>   
> -	/**
> -	 * @ddestroy: Destroyed but not yet cleaned up buffer objects.
> -	 */
> -	struct list_head ddestroy;
> -
>   	/**
>   	 * @pinned: Buffer objects which are pinned and so not on any LRU list.
>   	 */
> @@ -270,7 +265,7 @@ struct ttm_device {
>   	/**
>   	 * @wq: Work queue structure for the delayed delete workqueue.
>   	 */
> -	struct delayed_work wq;
> +	struct workqueue_struct *wq;
>   };
>   
>   int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags);
