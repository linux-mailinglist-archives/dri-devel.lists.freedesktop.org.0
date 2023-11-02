Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FD87DF39C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 14:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B55D10E885;
	Thu,  2 Nov 2023 13:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9578610E885;
 Thu,  2 Nov 2023 13:23:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THjS/+xH3ucj2L3GCKz7gnUcRrDachk+J6D9z1rZHTp9MfVJowkT/avrFo2THYFhHJnHw5OT7Pk7j7YozEqrMhdRiiqo6mtgKYpdcXhBBB+yCoQHeQ1WniQf8Sg7jd6Ylwkh8/YM1oMBCTMqkYfo0YVU5BfwBwxQR8HcpAjmH5rmQ527N/oFnjig/QDoi7H6Xbvkrz6uziDuDAxVXzWkSPrVULHl+doOikFDsmy4NsRZVIRdEBoKKqP6SYK8yqlX2g3UiJEE/uhpVpjN7vwNMM7KensqjQDLVj33Nqcb/3/34+YJHv2cQQy/iiK1YHhtfEPwT++EMjevo2RMJbC7Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1wbRVnbwZbysfPF1r/2k38Pvw2YqMg8SrAfjx4aTCs=;
 b=HdxZXVMqhdQQX+vBw4qv5xlEDstKeY5bZCmvElEiSkZaEfBSadrEv56iu42zcFlDBRUjg2h+pXENLyUlzWiqpfPr6yfJbOTATIO5NAQEOMvtuCnp2bEPtBroOfpKsRwSQ2OiB/zWn9Pyvw+JeDx7Dia6YjjWIjqjnF3s8jH3ZuU4CnmKSTHLnIQRt7v/9pKrDxUPIDw7DTMx03tE8FLUQQwtipme8mYiL+MRcjrt8pRRRv8SA3/yMVh7b4c053flyhnuASb5jMnlBwZsDiMiI6ukgVPI5qgajtSZAO3+FDMgpA84aKgNjM0PrDRiqkMk8ki4+5pxalvJ6Qk6I6N7pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1wbRVnbwZbysfPF1r/2k38Pvw2YqMg8SrAfjx4aTCs=;
 b=wg68g9BfVMggIgGc1cnHZEmvyEk+4jM5rejElR/kMT/tVO/FMM4vjyRMTX2RO1GJJEYfnb0B+dwlBp70+NLy9EKDU91S6nKgi4/sQQUUI23ulvo5Q0Eg/QOf44it7PlNrpzqRWQ1Kre6202+MvObggVCGQUDj6Mk247Dl7KFViw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB7881.namprd12.prod.outlook.com (2603:10b6:806:34a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Thu, 2 Nov
 2023 13:23:37 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6933.029; Thu, 2 Nov 2023
 13:23:37 +0000
Message-ID: <0c2d2b4f-54a2-4a60-8f51-4ec06a629f4a@amd.com>
Date: Thu, 2 Nov 2023 14:23:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 03/11] drm: introduce drm evictable LRU
Content-Language: en-US
To: Oak Zeng <oak.zeng@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20231102043306.2931989-1-oak.zeng@intel.com>
 <20231102043306.2931989-4-oak.zeng@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231102043306.2931989-4-oak.zeng@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB7881:EE_
X-MS-Office365-Filtering-Correlation-Id: 932eb19d-3048-47c2-3a51-08dbdba6ec32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qThif4q86HlIEh/Xms8QWyPwPFe+JnS+KoDFv+B61B24q04mZPN0ORI67EErPd4eX3zZebzX51nsw3lcNLzDZ7e4gPmhYzoJpNRqQTx/azslmtvzeH1idW/19scb1BLGsU3RMUvG2h3EpCa+NAwi22VTfw+GFt9nw2cJir6sRv3b2b7wnAvC8kBxq9CwflzYtit7QXjYVe81jKax4kIjpxxBdV9kwkHTJn7daDvg0DvOj0KDXHqErhGtDTZ3BOVmaitOfYi1019dbFE8Mp723YdX3ILk0KOxSnn3QAjIRLnv6Nnou3fzVBrvZV0cK4nbwciy+h+fxiiROFTwaLeLZcJcDM4CN4F97Mfe+O3T6NKwG8m7xSEx7Gc+AvXphorYkZGJt2+tWKSGEoGYcxz+qz8fTSgdTTGM2pLV3G6Pw/BrCIR9gfLrORMjAk3JdEz8IcIUKPzQVt9emh6LqQINC1FSNKraxps76UjU46/S19LvAAgpFzsxKwsfd3YcVQS1eRqw+NBpOOV3+6HpD1Ky3s2NFsq+53mqGoD0CE/0SSQgPJWB8n4e/4btzCSXlyjrvDWcakTwheVdo3FsoGCllNEtLruPqb4oCVrM/aEB9DsT7RvkId+0Fq3VxUotOSazo6HdGvxIe8APqi5wbah6wQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(396003)(366004)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(66899024)(316002)(30864003)(86362001)(31696002)(2616005)(66476007)(2906002)(83380400001)(26005)(66556008)(66946007)(6506007)(36756003)(478600001)(41300700001)(38100700002)(6512007)(6666004)(8676002)(4326008)(8936002)(31686004)(6486002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzlHRjJsR0RNek1JV1RZS1NNbVZscDZNbGlLUjVneWpIbmRIb2tqVkNSWXBM?=
 =?utf-8?B?eExRRUJaK1dlWkMvUk12QVBrK0hPTnBLRFlLd0pmd0x1ZjRuVTczMWdOZ3h2?=
 =?utf-8?B?RE1nUldjeU95d3pzRzJDayt4WTU0TiszOW9NV3ZGNWNodVVyeGlTTVlTMEFX?=
 =?utf-8?B?NWFsbXRvVXh3SytYcm9hdFpDeHB4dnIrOVozd2VyK3ArUlhqeUNOYzBKMlJL?=
 =?utf-8?B?VmNQcU9aRy9DZDNvdm9aUW1seUE4WGxrNFBmaTFnL2pLY3RlSUhaS0JMdUFN?=
 =?utf-8?B?NEE5bXM5SFlFa0MydU52V3JNSHFQcXd2MkNhZFF3eUx4aGZXa3B4RWVyT21p?=
 =?utf-8?B?c2Z3WUNERU9CdUdKalQyQ1RuUUUyRm10OWE4d0E5Q3hjVllKZ292dmIvWFdL?=
 =?utf-8?B?Tm9zenMyQ1pVb1AySCs0ZzcvUk5BZVlCUTBCVC9ZRUhSZEVZOEwzZWV4TVRG?=
 =?utf-8?B?S0dIVnA5TWdJZUVuVDAyMTNNZ3pldWVGMm5DS0RpOHZpVnpFemdZQjc4RFNp?=
 =?utf-8?B?eGtrSk9SMmJpOHdJN0VQYm1VNWlVeDJ6Wk16M1J4dGNYdDVGeFdkelpyMkQ3?=
 =?utf-8?B?dUx3UWpRMkFjYWF1QlRQTjJMQytwbGdiN0hEbkxFazkwN1NPM3hUdkVUTDhn?=
 =?utf-8?B?OVc0NlBTTzI3Q3ZNQ2RLek1vQ0taZWMxb0UvTlNROTJPbnVmTEU2NC9BK2FY?=
 =?utf-8?B?U2RMZDVub01SMUhseFpUMjg1UUdwMXhlS3M3aElzd1ZCcWx5MC9ad29tZHRP?=
 =?utf-8?B?Y2ZyQkZTQzBHZEVJV1Fmb1JXSm9EY05ES0V1Z3k2Mk1ZZVYxTnIvRXNyanFz?=
 =?utf-8?B?UG00TUlDcUNIR1E3dDRWTExvWTZRcnhNN2s0RTUvS0MvNy9uaGFvNUFCcE5N?=
 =?utf-8?B?OVdlT2Q5MkUxY0Ruc1JvTG8rYW4xLzNxWUtKOUZuSStHWUptZ1BvU0Z2SUdP?=
 =?utf-8?B?WXRBVGcyVVp6bzdveHd1WENJeTFUMnIxeVlHaGRnWEQ0UTkyNVBOTDBNeHo4?=
 =?utf-8?B?SlFvQXhyRXRISE94TENLMFFWeXZvN1hQTkl3ZFoxTHRBRjlhQWduemNVMUZj?=
 =?utf-8?B?Ylo4NUtKSy85S3p4WVgwS3docEVoVlVIaHpMdWY1bnhsSm0xM0hlV1JjUjRG?=
 =?utf-8?B?RFNzcU84VFo5K3hIZUdDbVIwUjQwbXBCT2tnUWt5UmE0OFlNNmp5QW8vK2t0?=
 =?utf-8?B?b0ovOXhLNTFXazFmcW9tR2thQ0s4K3VRbXJzZXBpV0Y2cTVoMytvSHh0NWNp?=
 =?utf-8?B?c2VDb3QxU0U4R3RVN0hUOUQ5UW1JS2JLbzNtWU5yejlxbHQ2RkQyUnF4UTg4?=
 =?utf-8?B?aDhoUndMeEttVFVMZUVFblVzTFZUMTlNZ0hCM1JBZmJOUGxYMG9mS2Y3OTNi?=
 =?utf-8?B?cEZkZ1BYOGduTUsrRzFmbGJVTjFxQm1JSWEyUVU4U3M5MzBXcW8yZk5EM3pa?=
 =?utf-8?B?UVZDLzFVVWl0dkdVY003VHVTSzFJTGF0MjZTQTFRaUxXMlZoR2lqRjc2ZFRv?=
 =?utf-8?B?VTNwdUFURmNMRWJxQ2x5YWhZWENpKzhPUi9EMXdYQnBBbmxDVnlnY082T0N5?=
 =?utf-8?B?TE8zaUwwbE5DRmpJNnd5OGNhUlkreDVwYjhFKy9pbVhRQm5PSmR1b09obUZI?=
 =?utf-8?B?aWY5cTcrY0JZS05wZ0NpQUNoZzVyOTVEYk96MWdlSlhqNWFiZXU5ZjF5Ym9x?=
 =?utf-8?B?c2pwTytYU2JRU1RNb3NNLzIvWHgrYjZHRHdyY2lQNkJOdFg1bnZhRHc4Q1R0?=
 =?utf-8?B?V0JZNFQ0WG9RZlo5czVBUTFQR1ErTXNKd2RBZ3lwR2haZW5kdzEwVDRCSkpq?=
 =?utf-8?B?b21QSEtZeHMzaGR5NHpaT2x3a3hUY2w4LzlKOGRYNGJEemk2U3FDVmdFN2ly?=
 =?utf-8?B?dzQxZ0x2YTVhZmdvZFVBRHpkNjczZ2tYMENnTll0UW9uWUFYTHdIUEFaRHd1?=
 =?utf-8?B?NVk3c3R4WW5rRWZnZUFoUzgzbi83QnYyTGxRNGJKMktMK0x1YktzK012SVJp?=
 =?utf-8?B?Q0VYN3YzayttdFQxZi9BVGdadkJpRHJ0QUZoeWlvOUNseGlDNG9sM3ZEc05n?=
 =?utf-8?B?bG9SZWZOYzRqVnJXaGplY29kVjJIQVNSOXMreFcwci9pWmNBRnhDUVBxd3RU?=
 =?utf-8?Q?coDohtRn+aDk20VonMbkprN9W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 932eb19d-3048-47c2-3a51-08dbdba6ec32
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 13:23:37.7794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGQJT9QtreUdG0NtDEMZvAJBHDupJYxZoKdj1HHhpGcr9QJdyNBz9aXB8v9OgsUA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7881
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
Cc: Thomas.Hellstrom@linux.intel.com, felix.kuehling@amd.com,
 brian.welty@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.11.23 um 05:32 schrieb Oak Zeng:
> drm LRU manager is introuced for resource eviction purpose. It maintains
> a LRU list per resource type.

Shouldn't we first add the possible resource types in a separate patch?

>   It provides functions to add or remove
> resource to or from the list. It also provides function to retrieve the
> first entity on the LRU list.

+ functions to iterate over them.

>
> drm LRU manager also provides functions for bulk moving resources
> on the LRU lists.
>
> drm LRU manager also does very basic memory accounting function, i.e.,
> LRU manager keeps a size of this resource type and a usage member
> for how much of resource has been added to this LRU manager's LRU
> list. TTM resource manager memory accounting functoins such as
> struct ttm_resource_manager::size and struct ttm_resource_manger::usage
> are still kept. In the future, when SVM codes are in the picture,
> those memory accounting functions need some rework to consider
> the memory used by both TTM and SVM.

Please keep in mind that this structure needs to extremely small to be 
usable for SVM. E.g. struct page size small :)

At least HMM based implementations ideally wants to have one for each 
page or something like that.

> For one device, a global drm LRU manager per resource type should be
> created/initialized at device initialization time. Drm LRU manager
> instances are embedded in struct drm_device.
>
> It is pretty much moving some of the ttm resource manager functions
> to the drm layer. The reason of this code refactory is, we want to
> create a single LRU list for memory allocated from BO(buffer object)
> based driver and hmm/svm(shared virtual memory) based driver, thus BO
> driver and svm driver can evict memory from each other.
>
> Previously the LRU list in TTM resource manager (lru field in struct
> ttm_reource_manager) is coupled with ttm_buffer_object concept, i.e.,
> each ttm resource is backed by a ttm_buffer_object and the LRU list
> is essentially a list of ttm_buffer_object.

Actually it's the other way around. The resource provides the backing of 
the BO.

And when a BO moves around it can temporary be that multiple resource 
point to the same BO.

I also want to have a more advanced iterator at some point where we grab 
the BO lock for keeping a reference into the LRU list. Not sure how to 
do this if we don't have the BO here any more.

Need to think about that further,
Christian.

>   Due to this behavior, the
> TTM resource manager can't be used by hmm/svm driver as we don't plan
> to have the BO concept for the hmm/svm implemenation. So we decouple
> the evictable LRU list from the BO concept in this series.
>
> The design goal of drm lru manager is to make it as lean as possible.
> So each lru entity only has a list node member used to link this entity
> to the evictable LRU list, and the basic resource size/type/priority
> of this entity. It doesn't have any driver specify information. A lru
> entity also has a function pointer of evict function. This is used to
> implement ttm or svm specific eviction function. A lru entity is supposed
> to be embedded in a driver specific structure such as struct
> ttm_resource, see the usage in the next patch of this series.
>
> The ttm resource manager, and some of the ttm_bo functions such as
> ttm_mem_evict_first will be rewriten using the new drm lru manager
> library, see the next patch in this series.
>
> The future hmm/svm implemenation will call lru manager function to add
> hmm/svm allocations to the shared evictable lru list.
>
> Lock design: previously ttm_resource LRU list is protected by a device
> global ttm_device::lru_lock (bdev->lru_lock in codes). This lock also
> protects ttm_buffer_object::pin_count, ttm_resource_manager::usage,
> ttm_resource::bo, ttm_device::pinned list etc. With this refactory,
> lru_lock is moved out of ttm_device and is added to struct drm_deive, so
> it can be shared b/t ttm code and svm code.
>
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>   drivers/gpu/drm/Makefile            |   1 +
>   drivers/gpu/drm/drm_evictable_lru.c | 232 ++++++++++++++++++++++++++++
>   include/drm/drm_device.h            |   7 +
>   include/drm/drm_evictable_lru.h     | 188 ++++++++++++++++++++++
>   4 files changed, 428 insertions(+)
>   create mode 100644 drivers/gpu/drm/drm_evictable_lru.c
>   create mode 100644 include/drm/drm_evictable_lru.h
>
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 1ad88efb1752..13953b0d271b 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -46,6 +46,7 @@ drm-y := \
>   	drm_vblank_work.o \
>   	drm_vma_manager.o \
>   	drm_gpuva_mgr.o \
> +	drm_evictable_lru.o \
>   	drm_writeback.o
>   drm-$(CONFIG_DRM_LEGACY) += \
>   	drm_agpsupport.o \
> diff --git a/drivers/gpu/drm/drm_evictable_lru.c b/drivers/gpu/drm/drm_evictable_lru.c
> new file mode 100644
> index 000000000000..2ba9105cca03
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_evictable_lru.c
> @@ -0,0 +1,232 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/lockdep.h>
> +#include <linux/container_of.h>
> +#include <drm/drm_evictable_lru.h>
> +#include <drm/drm_device.h>
> +
> +static inline struct drm_lru_mgr *entity_to_mgr(struct drm_lru_entity *entity)
> +{
> +	struct drm_lru_mgr *mgr;
> +
> +	mgr = &entity->drm->lru_mgr[entity->mem_type];
> +	BUG_ON(!mgr->used);
> +
> +	return mgr;
> +}
> +
> +void drm_lru_entity_init(struct drm_lru_entity *entity, struct drm_device *drm,
> +			uint32_t mem_type, uint64_t size, uint32_t priority)
> +{
> +	entity->drm = drm;
> +	entity->mem_type = mem_type;
> +	entity->size = size;
> +	entity->priority = priority;
> +	INIT_LIST_HEAD(&entity->lru);
> +}
> +
> +/**
> + * drm_lru_mgr_init
> + *
> + * @mgr: drm lru manager to init
> + * @size: size of the resource managed by this manager
> + * @lock: pointer of the global lru_lock
> + *
> + * Initialize a drm lru manager
> + */
> +void drm_lru_mgr_init(struct drm_lru_mgr *mgr, uint64_t size, spinlock_t *lock)
> +{
> +	unsigned j;
> +
> +	mgr->used = true;
> +	mgr->size = size;
> +	mgr->usage = 0;
> +	mgr->lru_lock = lock;
> +
> +	for(j = 0; j < DRM_MAX_LRU_PRIORITY; j++)
> +		INIT_LIST_HEAD(&mgr->lru[j]);
> +}
> +
> +void drm_lru_bulk_move_init(struct drm_lru_bulk_move *bulk_move)
> +{
> +	memset(bulk_move, 0, sizeof(*bulk_move));
> +}
> +
> +/**
> + * drm_lru_first
> + *
> + * @mgr: drm lru manager to iterate over
> + * @cursor: cursor of the current position
> + *
> + * Returns the first entity in drm lru manager
> + */
> +struct drm_lru_entity *
> +drm_lru_first(struct drm_lru_mgr *mgr, struct drm_lru_cursor *cursor)
> +{
> +	struct drm_lru_entity *entity;
> +
> +	lockdep_assert_held(mgr->lru_lock);
> +
> +	for(cursor->priority = 0; cursor->priority < DRM_MAX_LRU_PRIORITY; ++cursor->priority)
> +		list_for_each_entry(entity, &mgr->lru[cursor->priority], lru)
> +			return entity;
> +
> +	return NULL;
> +}
> +
> +/**
> + * drm_lru_next
> + *
> + * @mgr: drm lru manager to iterate over
> + * @cursor: cursor of the current position
> + * @entity: the current lru entity pointer
> + *
> + * Returns the next entity from drm lru manager
> + */
> +struct drm_lru_entity *
> +drm_lru_next(struct drm_lru_mgr *mgr, struct drm_lru_cursor *cursor,
> +		struct drm_lru_entity *entity)
> +{
> +	lockdep_assert_held(mgr->lru_lock);
> +
> +	list_for_each_entry_continue(entity, &mgr->lru[cursor->priority], lru)
> +		return entity;
> +
> +	for(++cursor->priority; cursor->priority < DRM_MAX_LRU_PRIORITY; ++cursor->priority)
> +		list_for_each_entry(entity, &mgr->lru[cursor->priority], lru)
> +			return entity;
> +
> +	return NULL;
> +}
> +
> +/**
> + * drm_lru_move_to_tail
> + *
> + * @entity: the lru entity to move to lru tail
> + *
> + * Move a lru entity to lru tail
> + */
> +void drm_lru_move_to_tail(struct drm_lru_entity * entity)
> +{
> +	struct list_head *lru;
> +	struct drm_lru_mgr *mgr;
> +
> +	mgr = entity_to_mgr(entity);
> +	lockdep_assert_held(mgr->lru_lock);
> +	lru = &mgr->lru[entity->priority];
> +	list_move_tail(&entity->lru, lru);
> +}
> +
> +/**
> + * drm_lru_bulk_move_range_tail
> + *
> + * @range: bulk move range
> + * @entity: lru_entity to move
> + *
> + * Move a lru_entity to the tail of a bulk move range
> + */
> +void drm_lru_bulk_move_range_tail(struct drm_lru_bulk_move_range *range,
> +									struct drm_lru_entity *entity)
> +{
> +	if (entity == range->last)
> +		return;
> +
> +	if (entity == range->first)
> +		range->first = container_of(entity->lru.next, struct drm_lru_entity, lru);
> +
> +	if (range->last)
> +		list_move(&entity->lru, &range->last->lru);
> +
> +	range->last = entity;
> +}
> +EXPORT_SYMBOL(drm_lru_bulk_move_range_tail);
> +
> +/**
> + * drm_lru_bulk_move_tail - bulk move range of entities to the LRU tail.
> + *
> + * @bulk: bulk_move structure
> + *
> + * Bulk move entities to the LRU tail, only valid to use when driver makes sure that
> + * resource order never changes.
> + */
> +void drm_lru_bulk_move_tail(struct drm_lru_bulk_move *bulk)
> +{
> +
> +	unsigned i, j;
> +
> +	for (i = 0; i < DRM_NUM_MEM_TYPES; ++i) {
> +		for (j = 0; j < DRM_MAX_LRU_PRIORITY; ++j) {
> +			struct drm_lru_bulk_move_range *range = &bulk->range[i][j];
> +			struct drm_lru_mgr *mgr;
> +
> +			if (!range->first)
> +				continue;
> +
> +			mgr = entity_to_mgr(range->first);
> +			lockdep_assert_held(mgr->lru_lock);
> +			list_bulk_move_tail(&mgr->lru[range->first->priority], &range->first->lru,
> +					&range->last->lru);
> +		}
> +	}
> +}
> +EXPORT_SYMBOL(drm_lru_bulk_move_tail);
> +
> +/**
> + * drm_lru_add_bulk_move
> + *
> + * @entity: the lru entity to add to the bulk move range
> + * @bulk_move: the bulk move ranges to add the entity
> + *
> + * Add a lru entity to the tail of a bulk move range
> + */
> +void drm_lru_add_bulk_move(struct drm_lru_entity *entity,
> +						struct drm_lru_bulk_move *bulk_move)
> +{
> +	struct drm_lru_bulk_move_range *range;
> +
> +	range = &bulk_move->range[entity->mem_type][entity->priority];
> +
> +	if (!range->first) {
> +		range->first = entity;
> +		range->last = entity;
> +		return;
> +	}
> +
> +	drm_lru_bulk_move_range_tail(range, entity);
> +}
> +
> +EXPORT_SYMBOL(drm_lru_add_bulk_move);
> +/**
> + * drm_lru_del_bulk_move
> + *
> + * @entity: the lru entity to move from the bulk move range
> + * @bulk_move: the bulk move ranges to move the entity out of
> + *
> + * Move a lru entity out of bulk move range. This doesn't
> + * delete entity from lru manager's lru list.
> + */
> +void drm_lru_del_bulk_move(struct drm_lru_entity *entity,
> +					struct drm_lru_bulk_move *bulk_move)
> +{
> +	struct drm_lru_bulk_move_range *range;
> +
> +	range = &bulk_move->range[entity->mem_type][entity->priority];
> +
> +	if (unlikely(WARN_ON(!range->first || !range->last) ||
> +			(range->first == entity && range->last == entity))) {
> +		range->first = NULL;
> +		range->last = NULL;
> +	} else if (range->first == entity) {
> +		range->first = container_of(entity->lru.next,
> +				struct drm_lru_entity, lru);
> +	} else if (range->last == entity) {
> +		range->last = container_of(entity->lru.prev,
> +				struct drm_lru_entity, lru);
> +	} else {
> +		list_move(&entity->lru, &range->last->lru);
> +	}
> +}
> +EXPORT_SYMBOL(drm_lru_del_bulk_move);
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index d0b5f42786be..1bdcd34d3f6b 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -8,6 +8,7 @@
>   
>   #include <drm/drm_legacy.h>
>   #include <drm/drm_mode_config.h>
> +#include <drm/drm_evictable_lru.h>
>   
>   struct drm_driver;
>   struct drm_minor;
> @@ -331,6 +332,12 @@ struct drm_device {
>   	 */
>   	spinlock_t lru_lock;
>   
> +	/**
> +	 * @lru_mgr: Device global lru managers per memory type or memory
> +	 * region. Each lru manager manages a lru list of this memory type.
> +	 */
> +	struct drm_lru_mgr lru_mgr[DRM_NUM_MEM_TYPES];
> +
>   	/* Everything below here is for legacy driver, never use! */
>   	/* private: */
>   #if IS_ENABLED(CONFIG_DRM_LEGACY)
> diff --git a/include/drm/drm_evictable_lru.h b/include/drm/drm_evictable_lru.h
> new file mode 100644
> index 000000000000..3fd6bd2475d9
> --- /dev/null
> +++ b/include/drm/drm_evictable_lru.h
> @@ -0,0 +1,188 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _DRM_EVICTABLE_LRU_H_
> +#define _DRM_EVICTABLE_LRU_H_
> +
> +#include <linux/list.h>
> +#include <linux/spinlock_types.h>
> +#include <linux/spinlock.h>
> +
> +struct drm_device;
> +
> +#define DRM_MAX_LRU_PRIORITY 4
> +#define DRM_NUM_MEM_TYPES 8
> +
> +/**
> + * struct drm_lru_entity
> + *
> + * @drm: drm device that this entity belongs to
> + * @mem_type: The memory type that this entity belongs to
> + * @size: resource size of this entity
> + * @priority: The priority of this entity
> + * @lru: least recent used list node, see &drm_lru_mgr.lru
> + *
> + * This structure represents an entity in drm_lru_mgr's
> + * list. This structure is supposed to be embedded in
> + * user's data structure.
> + */
> +struct drm_lru_entity {
> +	struct drm_device *drm;
> +	uint32_t mem_type;
> +	uint64_t size;
> +	uint32_t priority;
> +	struct list_head lru;
> +};
> +
> +/**
> + * struct drm_lru_mgr
> + *
> + * @used: whether this lru manager is used or not
> + * @size: size of the resource
> + * @usage: how much resource has been used
> + * @lru_lock: a weak reference to the global lru_lock
> + * @lru: least recent used list, per priority
> + *
> + * This structure maintains all the buffer allocations
> + * in a least recent used list, so a victim for eviction
> + * can be easily found.
> + */
> +struct drm_lru_mgr {
> +	bool used;
> +	uint64_t size;
> +	uint64_t usage;
> +	spinlock_t *lru_lock;
> +	struct list_head lru[DRM_MAX_LRU_PRIORITY];
> +};
> +
> +/**
> + * struct drm_lru_cursor
> + *
> + * @priority: the current priority
> + *
> + * Cursor to iterate over all entities in lru manager.
> + */
> +struct drm_lru_cursor {
> +	unsigned priority;
> +};
> +
> +/**
> + * struct drm_lru_bulk_move_range
> + *
> + * @first: the first entity in the range
> + * @last: the last entity in the range
> + *
> + * Range of entities on a lru list.
> + */
> +struct drm_lru_bulk_move_range
> +{
> +	struct drm_lru_entity *first;
> +	struct drm_lru_entity *last;
> +};
> +
> +/**
> + * struct drm_lru_bulk_move
> + *
> + * @range: An array of bulk move range, each corelates to the drm_lru_mgr's
> + * lru list of the same memory type and same priority.
> + *
> + * A collection of bulk_move range which can be used to move drm_lru_entity
> + * on the lru list in a bulk way. It should be initialized through
> + * drm_lru_bulk_move_init. Add/delete a drm_lru_entity to bulk move should call
> + * drm_lru_add_bulk_move/drm_lru_del_bulk_move.
> + */
> +struct drm_lru_bulk_move {
> +	struct drm_lru_bulk_move_range range[DRM_NUM_MEM_TYPES][DRM_MAX_LRU_PRIORITY];
> +};
> +
> +
> +
> +/**
> + * drm_lru_add_entity
> + *
> + * @entity: the lru entity to add
> + * @mgr: the drm lru manager
> + * @priority: specify which priority list to add
> + *
> + * Add an entity to lru list
> + */
> +static inline void drm_lru_add_entity(struct drm_lru_entity *entity,
> +		struct drm_lru_mgr *mgr, unsigned priority)
> +{
> +	lockdep_assert_held(mgr->lru_lock);
> +	list_add_tail(&entity->lru, &mgr->lru[priority]);
> +	mgr->usage += entity->size;
> +}
> +
> +/**
> + * drm_lru_remove_entity
> + *
> + * @entity: the lru entity to remove
> + * @mgr: the drm lru manager
> + *
> + * Remove an entity from lru list
> + */
> +static inline void drm_lru_remove_entity(struct drm_lru_entity *entity,
> +		struct drm_lru_mgr *mgr)
> +{
> +	lockdep_assert_held(mgr->lru_lock);
> +	list_del_init(&entity->lru);
> +	mgr->usage -= entity->size;
> +}
> +
> +/**
> + * drm_lru_mgr_fini
> + *
> + * @mgr: the drm lru manager
> + *
> + * de-initialize a lru manager
> + */
> +static inline void drm_lru_mgr_fini(struct drm_lru_mgr *mgr)
> +{
> +	mgr->used = false;
> +}
> +
> +void drm_lru_entity_init(struct drm_lru_entity *entity, struct drm_device *drm,
> +			uint32_t mem_type, uint64_t size, uint32_t priority);
> +
> +struct drm_lru_entity *
> +drm_lru_first(struct drm_lru_mgr *mgr, struct drm_lru_cursor *cursor);
> +
> +struct drm_lru_entity *
> +drm_lru_next(struct drm_lru_mgr *mgr, struct drm_lru_cursor *cursor,
> +		struct drm_lru_entity *entity);
> +
> +void drm_lru_mgr_init(struct drm_lru_mgr *mgr, uint64_t size,
> +		spinlock_t *lru_lock);
> +
> +void drm_lru_move_to_tail(struct drm_lru_entity * entity);
> +
> +void drm_lru_bulk_move_init(struct drm_lru_bulk_move *bulk_move);
> +
> +
> +void drm_lru_bulk_move_tail(struct drm_lru_bulk_move *bulk);
> +
> +void drm_lru_bulk_move_range_tail(struct drm_lru_bulk_move_range *range,
> +		struct drm_lru_entity *entity);
> +
> +void drm_lru_add_bulk_move(struct drm_lru_entity *entity,
> +		struct drm_lru_bulk_move *bulk_move);
> +
> +void drm_lru_del_bulk_move(struct drm_lru_entity *entity,
> +		struct drm_lru_bulk_move *bulk_move);
> +/**
> + * drm_lru_for_each_entity
> + *
> + * @mgr: the drm lru manager
> + * @cursor: cursor for the current position
> + * @entity: the current drm_lru_entity
> + *
> + * Iterate over all entities in drm lru manager
> + */
> +#define drm_lru_for_each_entity(mgr, cursor, entity)		\
> +	for (entity = drm_lru_first(mgr, cursor); entity;	\
> +	     entity = drm_lru_next(mgr, cursor, entity))
> +
> +#endif

