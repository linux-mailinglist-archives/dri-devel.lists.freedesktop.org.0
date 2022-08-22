Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6CE59C0B7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 15:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A758D905;
	Mon, 22 Aug 2022 13:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2758D8BD;
 Mon, 22 Aug 2022 13:39:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTyVuj9iHuEmyO7B6BdAE33dAIyotCHbe0Ln1dMT0GCTWYTznn0ZRHPacaLOdHa2rnDb1bkpT/dlcJrGFZ1w3XclS8va5mXz5K8G55Hh54bIqgMa/7FfDYoE0Qxz3viB5X9lsZVXiLPocQ/VVXBYL7GPggPRu5rkLC6SBsIuyJINcnSBYXdKs2XFzKM2MtTDJtX4tiCM8PQFqttncB/AMz6xbR0BYU0DK8LAktuCgSUMjcZ/DNVxk2gWZuW7MiSjZlYBtzFW3oJjcSN4/8621bu2NutGPboBRij7f35E9qTZrJeq7GqYfukcaMPKNdYJhmL4UQsR4RUTAw4aa+jADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jbOIK82C+RxNZwG8KzRCjfX6b9ZN1h/KKBO/cBj/zg=;
 b=B5774i8GWY8arh/MdCk3X5q3XN1Asd8ao/UJDLYvvCfAgbPw6I+Kru30mx52TZty1HciUbsQSssteXjF1JHNtxasgrPhYpzbgJk0oxLqRyEVE/Cyt1Cz9Di9DwhbRsJinmQQUjhUITICoiYft0c/AZmudE8RCUl26DrnOSfrtcwIFqYBOvf7TLmYW10cn9hZFVmoZQMXYRwgvlQGmEY0etTQrohIAfXKRQPOaUFKA18iyjG3fxwQewLLkz1dzQBx4FV9VRPJHqFdvgemegnVdvo7/+1ifW7qEEzDB5UWgeCZrod4qhJx1nQbUhpo14HdkmTlXf7Tlsn1QTkltG82oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jbOIK82C+RxNZwG8KzRCjfX6b9ZN1h/KKBO/cBj/zg=;
 b=5EwFUPNjNqWuMIJmBqxXGi4VfbkWJR3m21IOaPapD1jBBA7GqG4AqWz7VEFRyuPs/YYA7zxy/jeAIE6liYb0Q6efKmmlR3Hv5MQBmf+6+Y9xJ+/uGB4vAn8jDaYaqzvI4d088UoQZgvPNgvoxLfhPCDWnQ1bO0u9J3DShzE8hAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH0PR12MB5075.namprd12.prod.outlook.com (2603:10b6:610:e2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 13:38:58 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 13:38:58 +0000
Message-ID: <4582726e-4066-fc1c-0b0d-7860bf462c64@amd.com>
Date: Mon, 22 Aug 2022 15:38:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 1/6] drm/ttm: Add new callbacks to ttm res mgr
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20220820073304.178444-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220820073304.178444-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d64836e7-f5cd-4b84-46c0-08da8443aa3e
X-MS-TrafficTypeDiagnostic: CH0PR12MB5075:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i7IhjFBXQQEqn1rfLc9iqcH8B8ExXt/lhtOYwql3shGxe8poAQqbXJs3zhpwf/aOIRyxd1AV6hDKoPoUsdRAJC3Uf49xhSfHP/2u5kga6+w1TFNEeJfBGqtLHD/tilqo34B6UFn6qefJA+TVoCZz5kppmw3YrNF+x5D3gu/K0BpFSyFyolBsDt5fG1sASeoWYjRPBkHoc3e69QTTAl4Pv/Mu5Dm9rz8+EwHQ6zMEQG5Wdy8fRtFbdiMARZ1wN5xwWJIbnrKbkUltflik040sXcnNeJSZjaH4EJUdTcS5zwAfB3y+Q4j+XcDWvUCLQ6TfpQbNDv7NRou0YHJl+CmLk7t3ksZPF3TMYn7esV24jZjALRcqk4gqMhifKtl5Xf7OzLphT1ZiNJBpT8yl4jzmXK5TuNPo6TEeGx3yP2ovA+PS5LUVkmDeIvFHSeY7WN6t18Ie/bFS/XYsBZUms34TgkA06L0vkcaPAWLaSzt4faZ5X6MaxZ2SLmfY6hhMTgTq4kFfW3YN+G3hev0loOf2RgBNvTFUXuxVXxOdtQe4/5OWWtWMgQI5vSoUc+3jnDszAi/qLXpJ7Z7bCyM5Ty3VX6e0BgtZbjSPf5kk5ZEyGQuh7GiVVecDy7lxpXcMuYmHASoyn0iYUG6byfT5zUExWgKrROkTLuc2T4WSnS2tOOHKsfZ/wfd18tKnS9p+qwl/XumFapID2I3KVN/bJCgppyqvkZKFhh+ex3f5Ha5SfC10Wbd+I8H+4+UoEkiZY67HEn9sO26LYIBt22KyQTSVpXHaPiVgWeTVZqrpxtxqDLw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(8936002)(5660300002)(478600001)(6486002)(2906002)(31696002)(6506007)(6512007)(41300700001)(86362001)(6666004)(38100700002)(186003)(66574015)(2616005)(83380400001)(31686004)(316002)(4326008)(66946007)(8676002)(66556008)(66476007)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGE1KzJSbjZHUkUzRElHdEtmUGp6QUp0alNlOG45N3dVYlIwNFRUM3hqNGxq?=
 =?utf-8?B?T3BRU0R0V29Jd0t5WDd4d1dhSzdmdFJyRXAwQ1JXQ0dGRXBkT1BnS3A2Vkhy?=
 =?utf-8?B?MitlTGlKRUhiV21rK3hPWll3d0NWZ1VOZjVaRFdYOFY1blFpRW52VEhEQVdQ?=
 =?utf-8?B?MFJKL05GWlI1NGlZODlzMmlCS1lPRjRmQUYwQllGakoyWmFadkJKRURuZTdH?=
 =?utf-8?B?b1dZa0FuYjAxVjA3RlNGWFM5QWdlaWhrWGswc1dCbUpQemlQYzg0Z1MzWHdW?=
 =?utf-8?B?R010Q1NHT3BNMzhmeU50ZjdwdmJJQ1pqOGhtMDZHYXBjS0RrQnpzU2xpcTh3?=
 =?utf-8?B?VEFHcmlVMzBHcEx5dloxQW9uZGVhbEFjVGU1VXVUYnVJVVk3anhhTUdaWkdN?=
 =?utf-8?B?UmJqeDF0bmxvOFcwQ3cyTEx3YmU2V2JRcFo5S3ZDSVQ3UlJMWTk0TTM0eWJ2?=
 =?utf-8?B?clYrOUttdHpZd1lXS0NrU0NxUlRaR3hhU1RnUHJPZEJIQ2UxNER5aVdqbFFq?=
 =?utf-8?B?S2xRbVlubGpDNS9IOXh2aWR5RzNQYTFndldzNk15ZXl3WC9KdmFrUjFkbUt2?=
 =?utf-8?B?SnRMYk1CZkdaT2JOWDQxdHNzeXNsems4VFZveTgrdko1c2lBQzhvQVJCOEVv?=
 =?utf-8?B?bDZwMUZYbDJPOUduRVhqYWhEcVFOUHN1dE1UaTBTUzExRHBhQlRyaGE1Tmtr?=
 =?utf-8?B?M1Ryd3JBOWozbVBWQ00wTjRPaWZBa2RhRXhsSWhKY1dyZ2t0T2cxNGp2Tjdz?=
 =?utf-8?B?OWRhV0VJeis1MXoxRDMzYzM3S1k0ZE9IK205VkRTNmFLZ2tNWmhkdkhSSXNq?=
 =?utf-8?B?ZnYrZDhkc1llTVJ0TGxweXVjakxoN05IaGJnTFRBY0VYV2RVeU5keHRpS1NK?=
 =?utf-8?B?cEZXUVF1QzJmYWo2eW1ycFV1YVpPVkx6WkgydzlKWm5yLzN1ZldaL1NjOHNQ?=
 =?utf-8?B?ZlA3ZXZFUkd3RUJmb0F6VEwwbjh3S044d25SZEdFRSt1cmVLdG1ZK0hQQ0o2?=
 =?utf-8?B?cHJoRmsxRFJacVZKMldSMzE1Rnp1RnVuRGVlaVREUDA4KzFFODFJSUVQMUx5?=
 =?utf-8?B?QmtqbVdkbUFPZytYVVgvbFI2NWIrWkhxc3hZTXNIemQ4TWg3RXAra0NBeEQx?=
 =?utf-8?B?ek1SSmFUVGR4dFgxNlp3VkZMZ2R6SkRyZEpzVFpOU0tmR2dXRlFzVnhwam0v?=
 =?utf-8?B?c2swb243RTNreGd6anRSZFlJcXdpb05RbWtUMVNMZHZSazFkTjB5K1pBSFZu?=
 =?utf-8?B?dkt3dVpPeG5SNCtzNndMMGoyUTBZVFp0SE9uYk9ybjR3RmdsalRXWFV2dytp?=
 =?utf-8?B?RWtQN2thNUx1aUU1b1NQTDRUNW9NR1VlOUpwOTJ6MGFqOGRrR3ZIWk9nTWNL?=
 =?utf-8?B?YmNIeUVheDdEaEg4Q2NDYXRlSEdqcmZyUGp1VkZTYUVWRU5GM1dWRzNlWkg3?=
 =?utf-8?B?QVViY1UxZ1FkeXIyOWFWMUlES1J6RmoraWhYNUM5d0MxVW5KYWhWY2xBQTEy?=
 =?utf-8?B?RGNJTDAzTGdISWRCRG1GSDNleTg4WVUvSzUwMG41a2RwdXd6LzI0OHpjQVlB?=
 =?utf-8?B?bTQyMDh5TWFyMDUzWE5ENCtKZDg1MnNOcDJSTy81VWwxQkcrVTVQYkY5aXBZ?=
 =?utf-8?B?dWoyQ29HYVhBbHI0V2xweUNOZi9xYTBIUDNnd2JOY1NlWmY4MjhtcXdUdkpv?=
 =?utf-8?B?cm5EMXZ6TnZUVkVodFhxY3hubG5VS0k5dDIwUk1pTms4alFQN1JUZGdteHNC?=
 =?utf-8?B?dEx3TFBEOGVtd1pkaGV2aHYwV3EyU0FTUW56cUlNTkxldDQ4TFpxMGk1U1Fr?=
 =?utf-8?B?SklYY1luUUxuZW5pSStKZ0R0d1JVVWY5NmJ2aUpYZUJQdGtVeVoyU3E0U2RP?=
 =?utf-8?B?K2lsNWVWWngyZzRPZ29tV09RT2xneG5DSnFabjY5MWtJZ2RhM3hONDBES0xS?=
 =?utf-8?B?STVvTFNxc3ljWS9icjhZNzJnN0hSbnRyZ2RTb3dGVkM4cGFwdjZFOVIrNkl4?=
 =?utf-8?B?UzMvamFaQ042R3BTbkRISzFJdEt4aDdUbURoUVNaMWgxdjdZaUNQdUxkK2Jj?=
 =?utf-8?B?SjdORllaSUZCazFnNzRyL0NRcTFhZVRZMzRjN3V5dXJoM3NzZ0Z5UGd6d0RX?=
 =?utf-8?B?U1FGVHNjUEVYU1F1ZnJxNlBTTHBkZkx5dVpodmpvODVzcTFnYkdLVzNQU2F6?=
 =?utf-8?Q?bzQa4n8OEkQxCtICAv5w/6qRTVz1c5dWVHyovq56MRAy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d64836e7-f5cd-4b84-46c0-08da8443aa3e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 13:38:58.2417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgcCvK1cdg71TCraUEepoJyyoUx5z81Gp4AbzGYh2zn4fJeGRBFh8Yxs2zz4Q8FD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5075
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
Cc: alexander.deucher@amd.com, luben.tuikov@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.08.22 um 09:32 schrieb Arunpravin Paneer Selvam:
> We are adding two new callbacks to ttm resource manager
> function to handle intersection and compatibility of
> placement and resources.
>
> v2: move the amdgpu and ttm_range_manager changes to
>      separate patches (Christian)
> v3: rename "intersect" to "intersects" (Matthew)
> v4: move !place check to the !res if and return false
>      in ttm_resource_compatible() function (Christian)
> v5: move bits of code from patch number 6 to avoid
>      temporary driver breakup (Christian)
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>

Pushed to drm-misc-next.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c       |  9 ++--
>   drivers/gpu/drm/ttm/ttm_resource.c | 77 +++++++++++++++++++++++++++++-
>   include/drm/ttm/ttm_resource.h     | 40 ++++++++++++++++
>   3 files changed, 119 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index c1bd006a5525..f066e8124c50 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -518,6 +518,9 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>   bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   			      const struct ttm_place *place)
>   {
> +	struct ttm_resource *res = bo->resource;
> +	struct ttm_device *bdev = bo->bdev;
> +
>   	dma_resv_assert_held(bo->base.resv);
>   	if (bo->resource->mem_type == TTM_PL_SYSTEM)
>   		return true;
> @@ -525,11 +528,7 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   	/* Don't evict this BO if it's outside of the
>   	 * requested placement range
>   	 */
> -	if (place->fpfn >= (bo->resource->start + bo->resource->num_pages) ||
> -	    (place->lpfn && place->lpfn <= bo->resource->start))
> -		return false;
> -
> -	return true;
> +	return ttm_resource_intersects(bdev, res, place, bo->base.size);
>   }
>   EXPORT_SYMBOL(ttm_bo_eviction_valuable);
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 20f9adcc3235..0d1f862a582b 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -253,10 +253,84 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
>   }
>   EXPORT_SYMBOL(ttm_resource_free);
>   
> +/**
> + * ttm_resource_intersects - test for intersection
> + *
> + * @bdev: TTM device structure
> + * @res: The resource to test
> + * @place: The placement to test
> + * @size: How many bytes the new allocation needs.
> + *
> + * Test if @res intersects with @place and @size. Used for testing if evictions
> + * are valueable or not.
> + *
> + * Returns true if the res placement intersects with @place and @size.
> + */
> +bool ttm_resource_intersects(struct ttm_device *bdev,
> +			     struct ttm_resource *res,
> +			     const struct ttm_place *place,
> +			     size_t size)
> +{
> +	struct ttm_resource_manager *man;
> +
> +	if (!res)
> +		return false;
> +
> +	if (!place)
> +		return true;
> +
> +	man = ttm_manager_type(bdev, res->mem_type);
> +	if (!man->func->intersects) {
> +		if (place->fpfn >= (res->start + res->num_pages) ||
> +		    (place->lpfn && place->lpfn <= res->start))
> +			return false;
> +
> +		return true;
> +	}
> +
> +	return man->func->intersects(man, res, place, size);
> +}
> +
> +/**
> + * ttm_resource_compatible - test for compatibility
> + *
> + * @bdev: TTM device structure
> + * @res: The resource to test
> + * @place: The placement to test
> + * @size: How many bytes the new allocation needs.
> + *
> + * Test if @res compatible with @place and @size.
> + *
> + * Returns true if the res placement compatible with @place and @size.
> + */
> +bool ttm_resource_compatible(struct ttm_device *bdev,
> +			     struct ttm_resource *res,
> +			     const struct ttm_place *place,
> +			     size_t size)
> +{
> +	struct ttm_resource_manager *man;
> +
> +	if (!res || !place)
> +		return false;
> +
> +	man = ttm_manager_type(bdev, res->mem_type);
> +	if (!man->func->compatible) {
> +		if (res->start < place->fpfn ||
> +		    (place->lpfn && (res->start + res->num_pages) > place->lpfn))
> +			return false;
> +
> +		return true;
> +	}
> +
> +	return man->func->compatible(man, res, place, size);
> +}
> +
>   static bool ttm_resource_places_compat(struct ttm_resource *res,
>   				       const struct ttm_place *places,
>   				       unsigned num_placement)
>   {
> +	struct ttm_buffer_object *bo = res->bo;
> +	struct ttm_device *bdev = bo->bdev;
>   	unsigned i;
>   
>   	if (res->placement & TTM_PL_FLAG_TEMPORARY)
> @@ -265,8 +339,7 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
>   	for (i = 0; i < num_placement; i++) {
>   		const struct ttm_place *heap = &places[i];
>   
> -		if (res->start < heap->fpfn || (heap->lpfn &&
> -		    (res->start + res->num_pages) > heap->lpfn))
> +		if (!ttm_resource_compatible(bdev, res, heap, bo->base.size))
>   			continue;
>   
>   		if ((res->mem_type == heap->mem_type) &&
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index ca89a48c2460..5afc6d664fde 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -88,6 +88,38 @@ struct ttm_resource_manager_func {
>   	void (*free)(struct ttm_resource_manager *man,
>   		     struct ttm_resource *res);
>   
> +	/**
> +	 * struct ttm_resource_manager_func member intersects
> +	 *
> +	 * @man: Pointer to a memory type manager.
> +	 * @res: Pointer to a struct ttm_resource to be checked.
> +	 * @place: Placement to check against.
> +	 * @size: Size of the check.
> +	 *
> +	 * Test if @res intersects with @place + @size. Used to judge if
> +	 * evictions are valueable or not.
> +	 */
> +	bool (*intersects)(struct ttm_resource_manager *man,
> +			   struct ttm_resource *res,
> +			   const struct ttm_place *place,
> +			   size_t size);
> +
> +	/**
> +	 * struct ttm_resource_manager_func member compatible
> +	 *
> +	 * @man: Pointer to a memory type manager.
> +	 * @res: Pointer to a struct ttm_resource to be checked.
> +	 * @place: Placement to check against.
> +	 * @size: Size of the check.
> +	 *
> +	 * Test if @res compatible with @place + @size. Used to check of
> +	 * the need to move the backing store or not.
> +	 */
> +	bool (*compatible)(struct ttm_resource_manager *man,
> +			   struct ttm_resource *res,
> +			   const struct ttm_place *place,
> +			   size_t size);
> +
>   	/**
>   	 * struct ttm_resource_manager_func member debug
>   	 *
> @@ -329,6 +361,14 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
>   		       const struct ttm_place *place,
>   		       struct ttm_resource **res);
>   void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res);
> +bool ttm_resource_intersects(struct ttm_device *bdev,
> +			     struct ttm_resource *res,
> +			     const struct ttm_place *place,
> +			     size_t size);
> +bool ttm_resource_compatible(struct ttm_device *bdev,
> +			     struct ttm_resource *res,
> +			     const struct ttm_place *place,
> +			     size_t size);
>   bool ttm_resource_compat(struct ttm_resource *res,
>   			 struct ttm_placement *placement);
>   void ttm_resource_set_bo(struct ttm_resource *res,
>
> base-commit: 8869fa666a9e6782c3c896c1fa57d65adca23249

