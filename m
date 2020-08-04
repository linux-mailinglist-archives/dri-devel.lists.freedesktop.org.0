Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD2623B938
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 13:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5356E180;
	Tue,  4 Aug 2020 11:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760051.outbound.protection.outlook.com [40.107.76.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E976E180
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 11:10:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DaeMmEBNbpF9FLbM45iCtneKQAsBjfE1ZqF6+1Yk6kEF2hr8W8kIJQCXen2sqLnqcH/y4/css19sLB1XsMIz+Mjojek9btj8S1QeWab88jmQQdUBqA7gtIc2jvE9JQ2WEfByT4SWCbkgHfv8gjwzJY6+V2CZMgX1FHvDbqi7+uMlgRCdl3eWqHJ9khNrrUWtk4/TjTSKWlpSJEWpob1dRvNhUrSyTjYAe0UDEH2Kre3rE5sV1R/LGPg8P5bRrC8nr2ORmQIjIfSZeljquE7ypzuBMbl94ZZW9mGoGY7ti2ywxxgNRUP9UDWlp31s0k5w3C4hSCAzylI9PIcvGGsDzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVFAVhX0KgWwsXUiG7Zdz4lOCHHac2ib2tuo310P90w=;
 b=ULiH5b0jdUEFurfUESDK+CytUXjLZW5smTJDArskWWdlKfL8mJScUXIZeLFuhvKK5YPForocc/FOeCq67U0qJ7elB1YunyeywOfD0ZlNziDombeFCw0ck7FeHnsvHrL8v2mhKzhi0yAungpxifgXfgx6GIdSyIigdapg/SbtE6DyjEs+owI6Nj6iZQSsGkd2IrmeIoeqwSQ/t6u0qnNYdQX2Zar2caPRbgVvesfsnUSnoA5xvaKGU6HD4ne71cqFV3Ir1CvR/PPftN9eeHXEZgHam6FbrBxthM4GpW5rlMm/aBV21ez5Sbc+TLUU2LvxXen9GTUGMjRZICh90eLNyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVFAVhX0KgWwsXUiG7Zdz4lOCHHac2ib2tuo310P90w=;
 b=mPyNhTX3/wpZOfwcs4JOu2aMgb2fSHVws00ScN+59iXyTY607VKDtpTMGYk83KEfgj1nilyZ7Q3vB+pPMe+L11yWXthns1ZYjg4Xul03+4BPnp8gXqT16wgLKxTc9PqtqJKLJYQcyD2imbjochyHKcQmUxHCfucO46LfXSIrd2g=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2418.namprd12.prod.outlook.com (2603:10b6:207:4d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Tue, 4 Aug
 2020 11:10:28 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 11:10:28 +0000
Subject: Re: [PATCH 13/59] drm/ttm: split the mm manager init code (v2)
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-14-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e232fa73-175d-36f0-f1a3-7c52b4856b75@amd.com>
Date: Tue, 4 Aug 2020 13:10:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200804025632.3868079-14-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM5PR0601CA0053.eurprd06.prod.outlook.com
 (2603:10a6:206::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM5PR0601CA0053.eurprd06.prod.outlook.com (2603:10a6:206::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Tue, 4 Aug 2020 11:10:26 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d5437c83-bdf6-4b5a-2e92-08d83866fe5b
X-MS-TrafficTypeDiagnostic: BL0PR12MB2418:
X-Microsoft-Antispam-PRVS: <BL0PR12MB241860199B835CDAD0E79F12834A0@BL0PR12MB2418.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RN3Y1KiSf5BJ7AGGfnq5GG4oaNPd8POTm5cixStVMRHUR9tvqWj+W6UmHaG2wCD5a+tvjbGKPSw1fbqmY+OQayqYsRi1CuHmZxKR1HGE5YF3Ha01jNBzeVWN60aa9cqaSbgbWjcnoHs30V4Qv3qw0tFiyLGGXD3NhtiEKnt5Nh9rald2ziORyrWolytCBlg9XTWubwWbY1U/ia453mMYG0M9cpVfNAz7SoM1J7sOjdVLUlw6jq8v+HY/yI6yVeIOgSb6LXbMqc6H3BtyGLEiGEAeOESNAXARb7mC1Jb1K4cx7bcZfhr0zuFBj2+CNjJPTCJICoR9bFY8iNgF5OHEuh/RRWMAlJwI+Cd1XQRE9VJhpRQsCx2ZCXCX57yHRfahBJ7hjO3E+0Vk548LaFJTCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(86362001)(66556008)(31686004)(8936002)(2616005)(6666004)(66476007)(83380400001)(16526019)(4326008)(36756003)(66946007)(186003)(5660300002)(2906002)(6486002)(52116002)(8676002)(31696002)(316002)(478600001)(87944003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: T1t7k1gX3g2CKbU44cPFwN15JUEFWPeZK/SBalFqLu1FmpvS0+k9Hq8GHSC6pdD0MMyjW9VDw4Cyd6d7C6sBZyFrR7J6nQwZgz4RQXzQFiCdA/gj8O9+yD2pWIV0cPamQGowj3voTwq6QjOV/vu72WRfMIeUf3sd0164hvIJGrODTyTyg0F0RSVLmzUkcs5WQZHoPVzO7shTX54Aqhe3focDARZzwQFE0I3g5J2JLr3Q7OAhaz4exAUPBJFEn+5ftf/9DI5mrg9woxgwRF2ARnRUEL8IscjVl5wUeiONU3XU4Ubs0dnM762SQ9hjO2iztg60bjEPRoN27lXuMI7GthdTyS+zH2Fuu/P6H95EEYMcMGDYWoMPzkI/o30qYJK0pfNIMwoqa94pTVAijmgg6akj1hjRlt3+4yZzIzBiqQAEysHG0wFnfo3OUwCuaakJ7x2A/dqoSP58vAA0LTk7aRyQo9j4rYIMVExsmLXMVBZdXaXKmCkt04VrRzxOFHFajx8jYcTEg1WYfL9cDZ32ankeoYL3GxHhCJsC2fm15CNL3RzQVcGm/Scqy1axVXC0yWDrpqS0W1JT1vF7rMGXLz3ZHjWj1UkRD6GOf6om/hVXHZ/awTCaiNFWX2j1O8n2dWFREaW40ybpnRIdyK1F3PjqUFV8kyDhfI0O6tOHo7caefw+kYQpboPH17baWR0owIW0Lv9nVzdS/4dEO7wXbQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5437c83-bdf6-4b5a-2e92-08d83866fe5b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 11:10:28.0921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LuccRAtE9QgT+YKnQx8aMYA0l16k0xKal82EqnMatQz+xNVYtIaQNbOEL6VXZmC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2418
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
Cc: sroland@vmware.com, linux-graphics-maintainer@vmware.com,
 bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.08.20 um 04:55 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> This will allow the driver to control the ordering here better.
>
> Eventually the old path will be removed.
>
> v2: add docs for new APIs.
> rename new path to ttm_mem_type_manager_init/set_used(for now)
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c    | 34 +++++++++++++++++++--------------
>   include/drm/ttm/ttm_bo_api.h    | 15 +++++++++++++++
>   include/drm/ttm/ttm_bo_driver.h | 15 +++++++++++++++
>   3 files changed, 50 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 2ac70ec1f37d..300bcc10696a 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1509,35 +1509,41 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
>   }
>   EXPORT_SYMBOL(ttm_bo_evict_mm);
>   
> -int ttm_bo_init_mm(struct ttm_bo_device *bdev, unsigned type,
> -			unsigned long p_size)
> +void ttm_mem_type_manager_init(struct ttm_bo_device *bdev,
> +			       struct ttm_mem_type_manager *man,
> +			       unsigned long p_size)
>   {
> -	int ret;
> -	struct ttm_mem_type_manager *man;
>   	unsigned i;
>   
> -	BUG_ON(type >= TTM_NUM_MEM_TYPES);
> -	man = &bdev->man[type];
>   	BUG_ON(man->has_type);
>   	man->use_io_reserve_lru = false;
>   	mutex_init(&man->io_reserve_mutex);
>   	spin_lock_init(&man->move_lock);
>   	INIT_LIST_HEAD(&man->io_reserve_lru);
>   	man->bdev = bdev;
> -
> -	if (type != TTM_PL_SYSTEM) {
> -		ret = (*man->func->init)(man, p_size);
> -		if (ret)
> -			return ret;
> -	}
> -	man->has_type = true;
> -	man->use_type = true;
>   	man->size = p_size;
>   
>   	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>   		INIT_LIST_HEAD(&man->lru[i]);
>   	man->move = NULL;
> +}
> +EXPORT_SYMBOL(ttm_mem_type_manager_init);
>   
> +int ttm_bo_init_mm(struct ttm_bo_device *bdev, unsigned type,
> +			unsigned long p_size)
> +{
> +	int ret;
> +	struct ttm_mem_type_manager *man;
> +
> +	BUG_ON(type >= TTM_NUM_MEM_TYPES);
> +	ttm_mem_type_manager_init(bdev, &bdev->man[type], p_size);
> +
> +	if (type != TTM_PL_SYSTEM) {
> +		ret = (*man->func->init)(man, p_size);
> +		if (ret)
> +			return ret;
> +	}
> +	ttm_mem_type_manager_set_used(man, true);
>   	return 0;
>   }
>   EXPORT_SYMBOL(ttm_bo_init_mm);
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index a9e13b252820..89053e761a69 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -54,6 +54,8 @@ struct ttm_place;
>   
>   struct ttm_lru_bulk_move;
>   
> +struct ttm_mem_type_manager;
> +
>   /**
>    * struct ttm_bus_placement
>    *
> @@ -531,6 +533,19 @@ int ttm_bo_create(struct ttm_bo_device *bdev, unsigned long size,
>   		  uint32_t page_alignment, bool interruptible,
>   		  struct ttm_buffer_object **p_bo);
>   
> +/**
> + * ttm_mem_type_manager_init
> + *
> + * @bdev: Pointer to a ttm_bo_device struct.
> + * @man: memory manager object to init
> + * @p_size: size managed area in pages.
> + *
> + * Initialise core parts of a a manager object.
> + */

As far as I know we usually have the documentation on the function 
instead of the prototype in the Linux kernel.

Christian.

> +void ttm_mem_type_manager_init(struct ttm_bo_device *bdev,
> +			       struct ttm_mem_type_manager *man,
> +			       unsigned long p_size);
> +
>   /**
>    * ttm_bo_init_mm
>    *
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index 73f5d9c766cc..6b49c0356343 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -678,6 +678,21 @@ static inline void ttm_bo_unreserve(struct ttm_buffer_object *bo)
>   	dma_resv_unlock(bo->base.resv);
>   }
>   
> +/**
> + * ttm_mem_type_manager_set_used
> + *
> + * @man: A memory manager object.
> + * @used: usage state to set.
> + *
> + * Set the manager in use flag. If disabled the manager is no longer
> + * used for object placement.
> + */
> +static inline void ttm_mem_type_manager_set_used(struct ttm_mem_type_manager *man, bool used)
> +{
> +	man->has_type = true;
> +	man->use_type = used;
> +}
> +
>   /*
>    * ttm_bo_util.c
>    */

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
