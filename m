Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1AA4B55DB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 17:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D89210E24C;
	Mon, 14 Feb 2022 16:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB0D89262
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 16:14:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTxWTRZ90Pc9k+oA2C1CxX3n262zGSxZTaAoAmSdT9Su6FQ+pk2RlWSqGDxsxQ2Fk2YpvWhp77el3UvqGGC78RSc8G7xDqGiV4xLtCFbcF5iIjj9kwtnQOy6v+7C4BHj8O5tV6EdMDViw/4KdeJRsmNJdQrJLlnnG1rbhQLfmW7P2JdMdZoTJzYJxxlCzws8iPowv7T1brrX+qr1nqXv/hjthI3zBiGinevHl/kWmD9a8atc48u+xPhxcN6/3iMUJSHNcxC8oTdtnPJSDOINOSr7bWrE08ya+n7LoOzZbSb16NolySmiN22s/fE04q8rVqalQ7ywW721Nh+LZHDhjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fDWQ9ie3Im+8qNDpo8j4F/6PRga8WQo6F+aMyBWRf0=;
 b=NsWPTvdr944bfFjuyUVjsnkWrdeXpGAtERcyCGnk+uBQYdx+I1NbDKVe95rfKK+ClZEge0NPZbsrEMrksgH4M19vVxt275Y1CuesHdClZdCEL8N+kb/zdqthtMkas/qmIYCxgoEo2ijJcM71zl6wKEPHIzwVupbav0PUocRrGGhlSsftlIuYkm6pIPEiZkp+HieOZaq8EsK1upOUBC69hV6qOX+o5O2qDb14gUj0PHUb5fvagNmVz7r31sRT1YEddz1HtetkF6jxBENsYSOANghqcAbEmK2NvmYew9BZVLbtf+TO5Uk0cQVkpUDbWQ94gd4O+CC5QeWtZQN9yuKA5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fDWQ9ie3Im+8qNDpo8j4F/6PRga8WQo6F+aMyBWRf0=;
 b=0vYeBgocN5cQbGxvrIitj+bGLBQV+IMTiPqLvcHCpNVWxH5rmu12o3cnJ6gOXcUZ4klGTOEMwI20j7PfhDl2EWVkQ+f+cbCU7fIyHH0wOATJXb5HRCvd/PtNv6CR9CYIDeTg/SnEx7K/GQnwO2o/6rGN/iwg1uytBtEgV0+9pIQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BYAPR12MB3637.namprd12.prod.outlook.com (2603:10b6:a03:da::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 16:14:23 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa%4]) with mapi id 15.20.4975.019; Mon, 14 Feb 2022
 16:14:23 +0000
Message-ID: <a5046f8e-4e80-4920-40c4-3a9e90bd8201@amd.com>
Date: Mon, 14 Feb 2022 11:14:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/11] drm/amdgpu: remove PL_PREEMPT accounting
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 matthew.william.auld@gmail.com, daniel@ffwll.ch,
 thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org
References: <20220214093439.2989-1-christian.koenig@amd.com>
 <20220214093439.2989-7-christian.koenig@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220214093439.2989-7-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0120.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::13) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30e2c3ae-bfbd-48d4-bb4f-08d9efd510a9
X-MS-TrafficTypeDiagnostic: BYAPR12MB3637:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3637A84916762B285B33FBD692339@BYAPR12MB3637.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8M80lBjkYlP9feHPkw6rfTUuumaItaGJ+ROxUU4t8YAKZcWUgCCP0VAaSrqx6l1tdsV7S5/Mr1CLXYq7UjEbeLbo3p8r2LjOvzzlRVIh0/q+Bo5OVm9k7/u5i2G7s1I1RoioqWElGgXCOpwB8koJ4W51OKHWnZest20iBQ8DcyVZw2bqLrOCNJHGE89GKHevBAZ64eoUkAvSTRcsk7u9cjWrLVZRpPN7cRJ/rRPQFn5+ZTH7hFyqBGIU9eVp5b89xjGY/MbLL7iP9VGv+MkrzXbdy7XXN/9/Ez/WJO9nb5GiPyjLqxTg+OU0SHqJrJnQcdc/sUYBgMrj1nhNQGwyGzrtPmNqK1wx/mykeE0kqfEiXDsD6Mvs5LeRAwK0NB0woYPATTq6OG6XTRySkf0oLARQtZnzOOFpTIwz16jrEbOjJTBZI/RVwFmnLmrLSYZdd6vlAa+Z3Kb2yBFtDWw0Mh/vk5OG/jpbok9QzmgSeRT87wEP/Oj95TS1iOUL0LGxFTCNLJaKpMviLPjUWt+GXHytdQEPe3svPPUen5Q4I7INnXvQYATk0bjb5KXovTxOcrbgb+KbTeFNATwVHqIYJ66/sGuRdZSNNVacKwLoQPK7uirN6i9wTpKD3iBj4SyPYyfhtQAunf8D9eY6/hXPhJPYPuHXAWHTdG+cQ8Iu1c90kn0JSDjiqmRG/ZF9nohDVNl8blKwFUDAa6T5NKAIitqHMvB0K+r+zJRKM2n3cQRn/eMmAAUK6vRY2DsyldGo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(186003)(26005)(316002)(6506007)(2616005)(6486002)(66574015)(83380400001)(86362001)(2906002)(31696002)(44832011)(5660300002)(8936002)(31686004)(508600001)(38100700002)(66556008)(66476007)(66946007)(8676002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEdmcUpEUzZ2SUFzRVBtSWdNUDVZSCt2TG85a2FMSXB2SkpUSkdWcEYxVWJl?=
 =?utf-8?B?UHpuU2lVa0JKR3NhRDVJQmp1b0R0MVpCeSttcXNUeVVYMm9TQVlBdDBOM3Uz?=
 =?utf-8?B?SzZRZjhzMUtqUEZMWldMT1p1TG1aY1N1Ty93c0JFTHBMNEwzSlZQVUNxWWY3?=
 =?utf-8?B?YTZzUkFvdFE4bWdKZlc4amp2ZVhsM1Y4V0NTSDR1WVVaaUZoMTQ0elNwa2VR?=
 =?utf-8?B?Y21RRjZXaSt2WGhoYmNjWDEzMlQ3VWttTTZaS2ZSZGt2ak9FNWRpMVFUQWtx?=
 =?utf-8?B?ZU5wQzlqMXJDN1NHemFHQXZMTVdHUHVjOGpoS2NHbW02LzNBbCtGQUJmTXN6?=
 =?utf-8?B?dFoxUUR0TTh5cnF0UXJlSGc4WFdneWRLYTUzMWppVCtHRlBpaURaM041b09m?=
 =?utf-8?B?bmNoVVgrd3Y3S2J3anVQbW9rT1NEbzFJelRLNnpzd0dObGFyMWk5VEI1dVkz?=
 =?utf-8?B?aHcrVmR2ZzlLemoyUzF2NEhDVEhGRUxOaHJsd01xeGgxNDRFd29zOHNQQytV?=
 =?utf-8?B?cmVzY2kvMjBUbnlJODZEZGFMT1A2ZHE0SE02ZnNhaTd2Qmt2c1YrWmhCdUpy?=
 =?utf-8?B?WlQrVTVKUWJ2VHJ6RHgyVUlFOXBNNVp1WE9ucXI0WG1tbHhMdndta0pkQWJZ?=
 =?utf-8?B?ODJvZE1NSGJIdXFLVU5ibE5GVVcrSGFVYURzakJsT2t6OUY5VmwrQjNUNms1?=
 =?utf-8?B?dEdGb3VTaUxVSXgrVGx5ZjBKNGlYcDZoZjJyTXZ2T3pkOU5PVVRrNnBkc1dl?=
 =?utf-8?B?VlBOdUdhb0NlYU5td01zVjZpV081Q01MNjBDQWZ6OWZldkNQY0FNYVk2a1VZ?=
 =?utf-8?B?eVJUSXRJYjcrdWdEV0VObVBmR3hLU05VMXB2bTlTazdiaGFFdzVqRUFVWjJq?=
 =?utf-8?B?SyttdlZrL1l4OUR0cUY1RGpSTjBlcENGOUgxMEpQMEI5S2Q3eDQ1WXJLRUNp?=
 =?utf-8?B?WWtLSTBYZ3hNOEVuMTdOcWR0dFRvSExhT2trOTB5RStYd0NDSkZxQ0V6NUkr?=
 =?utf-8?B?QzlXcWVib2lzV2FWTTN2U2U3QjcvYUdQQjh6UExManNNQi9GUk5sSlpQcWZU?=
 =?utf-8?B?Q21YQlZ3UGxZTVBTOE1QRUVxRVF6MHdVa0Roa1RVVzR2TU8wZzJzK3hzVFpN?=
 =?utf-8?B?RDJlaTMvUEJJTWlTaW5OY1czYkpEbHAvOEFDZ1kwQUdPOTRKMGRQT2tkT0dl?=
 =?utf-8?B?dWlnSWhqelRGWVdlL1JoMHRhM2h2QjZHaG9UeDduSE9HRlI0WXJnS01sTUNO?=
 =?utf-8?B?U3plVkhLQndsRUJxMmYwZ3YzT2RXcWFKQVR0eTUzU1E1SEM4TTd0cEJpNzdK?=
 =?utf-8?B?ZXY1TVFuSjE5WjVoUDJkSkMvdW9LSnJpbjROeTdmTlhoSEdwZWRWMW8vS2Fl?=
 =?utf-8?B?dkovRlo4TkI5NlFYTWxqK1NYYmkzOFlHRVhvMHpZcWhLa3NhZHhvT3NvaDlq?=
 =?utf-8?B?UzJYTndDNGN0QU1yRHAvc0dyYTVod1RYbGJaVVIxd25FcytLTUlpY21PUURG?=
 =?utf-8?B?N1NNVFhIaUZFcS9IaGdZVmFMS29nRzZrMWJUV1hna0xwUFJnZmp2eFFCMWhV?=
 =?utf-8?B?Z1hoMU93WDE0Z3p6ZUlFUUcxN04xMkEvWXpYZE54b3BLSThXc2xsUEdVVXMy?=
 =?utf-8?B?OEdzWi9ESW1jVU1aNW9sdjJHK0dJYWZlVXdPbi9lbktBZUQ3SklIOThzMUdq?=
 =?utf-8?B?ZHBQWEg1ZU9uMlUwSVVBSU9xcWJFRk9seS8yNFJMN3N5RlZIeUtmakpuNjAy?=
 =?utf-8?B?RmhqM1BadmR3L3NTWjBIdnFGaG9jN3Bwa1ljZDhVMkdGN0p0cXh3OUNXSEN2?=
 =?utf-8?B?aTExaWVsQmJHd1BkYzQwTlp3Q3Y4L0hISXV1dmEyRG40SDZmV0g3cHhUSG00?=
 =?utf-8?B?QlNyRWNhdG1IV2xhc003RUdZaEhEbUkrS2tGT3NySEVnR1RiUEpVQWJPVy9m?=
 =?utf-8?B?R0VXOUN6Z2U0RDYyY0VCbjdYampLS2p2MXRCdFF0Y0lEN21SSTU0VG9CYWYz?=
 =?utf-8?B?Qk5wTnFGWDdNY2ozbDJOK0t6MW5zNEJwWFllang1azQxd0JuNDZSZHk3a2hp?=
 =?utf-8?B?VnVTMzZJRGkxMC9ZNFNyakNzamVGL1lMNDhzbk9qV2xsaVF6c2FrMzBpcXF6?=
 =?utf-8?B?OWxkeHNrbW1CMTBXWUtXUzI1TU80NU03UklLK3pvWTkvdEx2U205L0pEK1Bo?=
 =?utf-8?Q?O4kKD/LtThRi/SRyswddPdU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e2c3ae-bfbd-48d4-bb4f-08d9efd510a9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 16:14:23.7985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +r4MVrLc5B5B03M0JQqJtchGdT/xAvyKiSv/7d7tltIE9Vda4HbsNFBajIWQ/m6TQ/G4EP59L5OZCGB1bQBFAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3637
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

Am 2022-02-14 um 04:34 schrieb Christian König:
> This is provided by TTM now.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>

This patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   .../gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c   | 62 ++-----------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  7 +--
>   2 files changed, 6 insertions(+), 63 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> index 0d85c2096ab5..e8adfd0a570a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> @@ -25,12 +25,6 @@
>   
>   #include "amdgpu.h"
>   
> -static inline struct amdgpu_preempt_mgr *
> -to_preempt_mgr(struct ttm_resource_manager *man)
> -{
> -	return container_of(man, struct amdgpu_preempt_mgr, manager);
> -}
> -
>   /**
>    * DOC: mem_info_preempt_used
>    *
> @@ -45,10 +39,9 @@ static ssize_t mem_info_preempt_used_show(struct device *dev,
>   {
>   	struct drm_device *ddev = dev_get_drvdata(dev);
>   	struct amdgpu_device *adev = drm_to_adev(ddev);
> -	struct ttm_resource_manager *man;
> +	struct ttm_resource_manager *man = &adev->mman.preempt_mgr;
>   
> -	man = ttm_manager_type(&adev->mman.bdev, AMDGPU_PL_PREEMPT);
> -	return sysfs_emit(buf, "%llu\n", amdgpu_preempt_mgr_usage(man));
> +	return sysfs_emit(buf, "%llu\n", ttm_resource_manager_usage(man));
>   }
>   
>   static DEVICE_ATTR_RO(mem_info_preempt_used);
> @@ -68,16 +61,12 @@ static int amdgpu_preempt_mgr_new(struct ttm_resource_manager *man,
>   				  const struct ttm_place *place,
>   				  struct ttm_resource **res)
>   {
> -	struct amdgpu_preempt_mgr *mgr = to_preempt_mgr(man);
> -
>   	*res = kzalloc(sizeof(**res), GFP_KERNEL);
>   	if (!*res)
>   		return -ENOMEM;
>   
>   	ttm_resource_init(tbo, place, *res);
>   	(*res)->start = AMDGPU_BO_INVALID_OFFSET;
> -
> -	atomic64_add((*res)->num_pages, &mgr->used);
>   	return 0;
>   }
>   
> @@ -92,49 +81,13 @@ static int amdgpu_preempt_mgr_new(struct ttm_resource_manager *man,
>   static void amdgpu_preempt_mgr_del(struct ttm_resource_manager *man,
>   				   struct ttm_resource *res)
>   {
> -	struct amdgpu_preempt_mgr *mgr = to_preempt_mgr(man);
> -
> -	atomic64_sub(res->num_pages, &mgr->used);
>   	ttm_resource_fini(man, res);
>   	kfree(res);
>   }
>   
> -/**
> - * amdgpu_preempt_mgr_usage - return usage of PREEMPT domain
> - *
> - * @man: TTM memory type manager
> - *
> - * Return how many bytes are used in the GTT domain
> - */
> -uint64_t amdgpu_preempt_mgr_usage(struct ttm_resource_manager *man)
> -{
> -	struct amdgpu_preempt_mgr *mgr = to_preempt_mgr(man);
> -	s64 result = atomic64_read(&mgr->used);
> -
> -	return (result > 0 ? result : 0) * PAGE_SIZE;
> -}
> -
> -/**
> - * amdgpu_preempt_mgr_debug - dump VRAM table
> - *
> - * @man: TTM memory type manager
> - * @printer: DRM printer to use
> - *
> - * Dump the table content using printk.
> - */
> -static void amdgpu_preempt_mgr_debug(struct ttm_resource_manager *man,
> -				     struct drm_printer *printer)
> -{
> -	struct amdgpu_preempt_mgr *mgr = to_preempt_mgr(man);
> -
> -	drm_printf(printer, "man size:%llu pages, preempt used:%lld pages\n",
> -		   man->size, (u64)atomic64_read(&mgr->used));
> -}
> -
>   static const struct ttm_resource_manager_func amdgpu_preempt_mgr_func = {
>   	.alloc = amdgpu_preempt_mgr_new,
>   	.free = amdgpu_preempt_mgr_del,
> -	.debug = amdgpu_preempt_mgr_debug
>   };
>   
>   /**
> @@ -146,8 +99,7 @@ static const struct ttm_resource_manager_func amdgpu_preempt_mgr_func = {
>    */
>   int amdgpu_preempt_mgr_init(struct amdgpu_device *adev)
>   {
> -	struct amdgpu_preempt_mgr *mgr = &adev->mman.preempt_mgr;
> -	struct ttm_resource_manager *man = &mgr->manager;
> +	struct ttm_resource_manager *man = &adev->mman.preempt_mgr;
>   	int ret;
>   
>   	man->use_tt = true;
> @@ -155,16 +107,13 @@ int amdgpu_preempt_mgr_init(struct amdgpu_device *adev)
>   
>   	ttm_resource_manager_init(man, &adev->mman.bdev, (1 << 30));
>   
> -	atomic64_set(&mgr->used, 0);
> -
>   	ret = device_create_file(adev->dev, &dev_attr_mem_info_preempt_used);
>   	if (ret) {
>   		DRM_ERROR("Failed to create device file mem_info_preempt_used\n");
>   		return ret;
>   	}
>   
> -	ttm_set_driver_manager(&adev->mman.bdev, AMDGPU_PL_PREEMPT,
> -			       &mgr->manager);
> +	ttm_set_driver_manager(&adev->mman.bdev, AMDGPU_PL_PREEMPT, man);
>   	ttm_resource_manager_set_used(man, true);
>   	return 0;
>   }
> @@ -179,8 +128,7 @@ int amdgpu_preempt_mgr_init(struct amdgpu_device *adev)
>    */
>   void amdgpu_preempt_mgr_fini(struct amdgpu_device *adev)
>   {
> -	struct amdgpu_preempt_mgr *mgr = &adev->mman.preempt_mgr;
> -	struct ttm_resource_manager *man = &mgr->manager;
> +	struct ttm_resource_manager *man = &adev->mman.preempt_mgr;
>   	int ret;
>   
>   	ttm_resource_manager_set_used(man, false);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 120b69ec9885..4e8577dad16a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -54,11 +54,6 @@ struct amdgpu_gtt_mgr {
>   	spinlock_t lock;
>   };
>   
> -struct amdgpu_preempt_mgr {
> -	struct ttm_resource_manager manager;
> -	atomic64_t used;
> -};
> -
>   struct amdgpu_mman {
>   	struct ttm_device		bdev;
>   	bool				initialized;
> @@ -75,7 +70,7 @@ struct amdgpu_mman {
>   
>   	struct amdgpu_vram_mgr vram_mgr;
>   	struct amdgpu_gtt_mgr gtt_mgr;
> -	struct amdgpu_preempt_mgr preempt_mgr;
> +	struct ttm_resource_manager preempt_mgr;
>   
>   	uint64_t		stolen_vga_size;
>   	struct amdgpu_bo	*stolen_vga_memory;
