Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDF23FB2C9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 10:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2794898BC;
	Mon, 30 Aug 2021 08:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB178980C;
 Mon, 30 Aug 2021 08:59:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCuJQT6unHQykC0WAkxTMAL9Vft/PwgqOthDIHyr1IJ8+4vkNap6O/qrAU80gIa6AlzuyXxc4zXaS5uSRy27dstkh9dGmOagNKt5psD+XSEf+6e/++Ej9XeWES8NMNiaS5CsphcVzdRRUrOcNRhMr27SVtpXgNrTe6rfoTH9yKkP3hXZ6wrKXiEr/qeAmZRkz3DezHV4MyVpIFFRMGXvN7oLDVLYGJnFCvOsxIe0myihXC9Cr9r/ByoBeq16M6meFNJenV20zK7IxTEUmQy7snxT4/8kryX8v8RpE4iR6+jzFF/koOmafrJkhuDdIu2MMu+E7/Tk5ILnVy572u1zzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sra+s7uCZuJoMCH0qx/GFwUQFrmoX8KGN9XPxjMEQyc=;
 b=CIbH28lMU7WueX41pqSvjohi3/k3rJB93jJotZmKWPfNiv3iUsJffAS3s+X+Z/lRRfmLwC0iwydo1Yxo3Bv1iCkUbjEK7ROTk6b7WA/LmsWHecdIBkA1Zhqrbf+4es1Uv5+AwbZekWEmS8ltg2utZsvkw4j1HDZxk0s6fEzmuUBdff1XdtKbZcneKfpHraSOC6ZtI9AHuemZMHNSc6YFxDl6H4NS0V3PG8FyT8GAbi5udiJ9HjDh0ZNW+w0a9lFgHQERk+zFBoFReWF7TF18MM1erCX1+/a374H5+COwyWA9K6bzqJbjzj7uDgcmyeBD20DlHecMt4BDlP7aKcgGYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sra+s7uCZuJoMCH0qx/GFwUQFrmoX8KGN9XPxjMEQyc=;
 b=UnSG08Z9i3TEG+glmXgiWVfgAMMzIvPH/Ok3StTOT9ID+IrEX9Daxh+gY9oKsMCQKvPt3sWAID+D0o0p/9oOnkpEH+BjHsrI+PbC9EQCQIgBZNMiCfUYRsmTDCqa1VdfFSUtXyAHk6gjkaskHKyYkQ+F5yCxt4E+97bArhkCpJg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4253.namprd12.prod.outlook.com (2603:10b6:208:1de::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 08:59:07 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 08:59:02 +0000
Subject: Re: [PATCH v3 1/4] drm/ttm: Create pinned list
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: ckoenig.leichtzumerken@gmail.com
References: <20210827203910.5565-1-andrey.grodzovsky@amd.com>
 <20210827203910.5565-2-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a13d095d-1b0f-a31c-1479-1275c2e93877@amd.com>
Date: Mon, 30 Aug 2021 10:58:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210827203910.5565-2-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM8P189CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 AM8P189CA0012.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Mon, 30 Aug 2021 08:59:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3a75fc9-e478-42c6-69e9-08d96b9469b0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4253:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42538E953471E25766BB4D8D83CB9@MN2PR12MB4253.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3JLRXsNcT76d3LpSRjuM8waYPkvMDhRjMP1lqn5QbLKZ/iCztWMQrMEoorGMaTeE+5l7fg7C24zqnmskGbHfTbok4VPAC5L90zpDhjFIcrUArr3rqSsr4LpTbrI/2IugnAwasac26F3Kfr9CpxvzcC/eq5G0Y7TU1ku80gaVN6l3T7F6wMv0VIdpa62xOwA/Gz8/z/W9Xkero9tKEvLvtnkLZtFq9VlBQiv0yLJDABWUPcmJG97olMTRexO+RhkJbfYR4hIDgUPWKmp0VhtR3pANRu64AafpqrX9pZWP7GXA3xivhtMpPu9k8hXnI08NkYKUw1vMPCXpRdFCULXtCqmGfiTaSORA6Gx6DutaDGVDqcZ5MkwFkNCDYdEiNW7wB2l0OPF99ik+bmJO/DONorXEZZRhkolPg1uczaXZI0mAaqTRUDK5H9hJLW01a8y+TGXhkuPqdN8xVFYrLGgJBUzw27Vgf1KQnSQZRhuHWbygB2TMmXx53+XSPqOnht4n2sZ/o4vlYspEt/Ei7kqydIQ6oaeRWSbP7pHcONqY+3YBulZGlIp+961kxWBhAe5VUUwxaZL+b1rgm8rE3ZuIVJ/tC6hD3VsKKguLH3PuNBnxkW8GU0BnbKldqMPIgcJpKPi4OpLgF0H/RE7JvesB5pZXGc4FKSWiEIBjRpELx96buI0445YwkWQLSSVVeUWlW3A8cfl2JOBELKQImdQDMRpwwxy+arLkNklYwODAlfI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(186003)(2906002)(66476007)(6666004)(66556008)(26005)(316002)(16576012)(6486002)(8936002)(66946007)(4326008)(8676002)(478600001)(36756003)(86362001)(31696002)(31686004)(38100700002)(2616005)(956004)(83380400001)(66574015)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2JLbHBMMlJqclh4MjFtUS9sYWduRjdJWVhvbGN3eWRxQjFmK0hDTThFQ3VG?=
 =?utf-8?B?NHRlTTlvY3YyTS9FZXJVaG5peDUwOStRNlg5MFp1eC9OaE1ubnBZZlozcndD?=
 =?utf-8?B?QVJBTEhOVy9KcW9uQW40aGZpZ0tMaysxQVlVK1RzTTZ6YWZkdEcrVHhzUDRp?=
 =?utf-8?B?UVNQOWFCVTdTQ3I4eVBCNy8vcjY0azhVZ21qOWFDOWRIKzJGb3pWdm8zOEZL?=
 =?utf-8?B?VmVLbVErN0o4cmlRbmRUL3NTK3pzWUhESG5KQVo5bitoTVIvTHFJWjZYcnFG?=
 =?utf-8?B?UG5VbGNyM0Zlck81Z1NGM0k5TlVzRENkTXNtdFptRXU3OFJmZXNNRDR1bUVO?=
 =?utf-8?B?MExjUWppK0hxV0ZBY3RRQnh3VWhOWVIwdnlyczBERm94Q0JNakM0d3preVdD?=
 =?utf-8?B?N3NTTERCK2E3NzJaV1Z4cFRPS1VOakJnaEJ2UmlhSUZEZ3ZSUytCR0lVS1BL?=
 =?utf-8?B?WGcvcGNtMmV1S1loY0ZaRGRjaHc1VUxuU2FTUE5ILzQ5a0JKbjJsOURZekZ6?=
 =?utf-8?B?bmh0NnNZVmhqeG1hS0RGN25aK0NVd0sxTWwrcktwWkFYbjJ1OXBCcUw1eHQ0?=
 =?utf-8?B?VklQNGVGNTJqZlIrM2tJRnVrQ1cvTmlTOXlPRklJZ3Uzc1UyL0JCS1p4a3JR?=
 =?utf-8?B?ZEhUMjI0MGNhcTRLWXR1Y3p4Z2IzMmlVUysydjVnNnU3V2xETHdvQzY1M2Z0?=
 =?utf-8?B?SThaeUtWS2pVYkpQMVJZWFdaaUcwa0tzYnFTOXczZWR1SUJVWXdmVDlJY21K?=
 =?utf-8?B?WmRVbUpqOXl1eEJiemN6dHk4VmowOURQRm9EZElLcjBZVk5aOVBuT2FBQ3Ay?=
 =?utf-8?B?czNlREdGOEE4M0t5NzVLTnc0NldQeGdNanREb3VRcTl2U01MOFJRcGFWbSth?=
 =?utf-8?B?eDZLc0tVUTZIaVhVTk9NYm42RXZVVWJraVoyRGFMRW5pcm10RzNyb016QmdU?=
 =?utf-8?B?UXJUeVBRSGZnV2xVVlJCdjlXWllKWHk2aE9zZndjQzMzZkp4bU8yR1BIWlcx?=
 =?utf-8?B?d0FaV1RvMU9QbkdWTEJwd0FTV2xjMjlaUk92QjhwNGc3UTJPSDBlQnRlM29V?=
 =?utf-8?B?SENoMDdtMndTZnFubUVkQW9UcEh5S0hjblJVdGRNNjYycTBTYUo4OTQyb01w?=
 =?utf-8?B?M1huNlJ3bllZVnUzTDF5ZVpwUTIzSFVjbVQyd095Z2tKWDhqWTVGWGZtRWtR?=
 =?utf-8?B?OGdqR3Z2MFo1N3YwMTJBWFlhL2hYQWl3dVJkUllocG0zUkxWR1hoY2FKcURr?=
 =?utf-8?B?QVFxM2orOE5sU0h5bzh2QjV4Ulo3UURBWktNQUZtWVQ0SEc4L3JQaFlWQ0NN?=
 =?utf-8?B?bEEzZ21FSDR4MlRKbG0zUDE5ZWE5MzJLa1BweEtRZy90dkUydlpJMzlPbkhn?=
 =?utf-8?B?dlZ5QzhPVUxTYWZTb1N5U1IvaFljT0xaU0lGUGFidHhYcTVPcmcrZk0waTY5?=
 =?utf-8?B?MUQwdkIzVFRSWENRdVJndFBJdWhqdThpb0krN051bmdOQjBpTEtIV242THgw?=
 =?utf-8?B?Q2NYVEFqVWdlN29TNnNXSDMyb2tpR1BuTW55NzFTQzd5bTF5RDNGUVQrcjMr?=
 =?utf-8?B?Vk90bW9SdUNTUk1rMUhpdzd1SHNzRGpjaGQrc1dyV3RmRFBuVjRkR1FkODYz?=
 =?utf-8?B?L3oxRS95dmZ0UXQzVEM2SzRUMDkvRGJtSmU0elR4MHNzRytzVGorQ0lwM0No?=
 =?utf-8?B?RExuSk54V3o2Y2VIMjlkMkFmZzFsTjBqRWpuc3pGdDZ2VzhJWGxQcFhYaFNW?=
 =?utf-8?Q?nbzsvtmka5jxBwfn8P8ZPNuv/9Y9YFWoXnvSgev?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a75fc9-e478-42c6-69e9-08d96b9469b0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 08:59:02.4015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSsMg8qIPA6O7vlvomkFmMZVX/w8xZbYbkVRQQqhXjdzruNSVs9AYpzZLlLdtTF7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4253
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

Am 27.08.21 um 22:39 schrieb Andrey Grodzovsky:
> This list will be used to capture all non VRAM BOs not
> on LRU so when device is hot unplugged we can iterate
> the list and unmap DMA mappings before device is removed.
>
> v2: Reanme function to ttm_bo_move_to_pinned
> v3: Move the pinned list to ttm device

As far as I can see there is not list_del() remaining. So this won't 
work correctly.

I suggest to rather rebase on top of the stuff I'm working on for a 
while to move the LRU into the resource instead.

Just send out the latest patch set of this with you in CC.

Christian.

>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Suggested-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c     | 18 ++++++++++++++----
>   drivers/gpu/drm/ttm/ttm_device.c |  1 +
>   include/drm/ttm/ttm_device.h     |  1 +
>   3 files changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 1b950b45cf4b..1fedd0eb67ba 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -69,7 +69,17 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
>   	}
>   }
>   
> -static void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
> +static inline void ttm_bo_move_to_pinned(struct ttm_buffer_object *bo)
> +{
> +	struct ttm_device *bdev = bo->bdev;
> +
> +	list_move_tail(&bo->lru, &bdev->pinned);
> +
> +	if (bdev->funcs->del_from_lru_notify)
> +		bdev->funcs->del_from_lru_notify(bo);
> +}
> +
> +static inline void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
>   {
>   	struct ttm_device *bdev = bo->bdev;
>   
> @@ -98,7 +108,7 @@ void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
>   		dma_resv_assert_held(bo->base.resv);
>   
>   	if (bo->pin_count) {
> -		ttm_bo_del_from_lru(bo);
> +		ttm_bo_move_to_pinned(bo);
>   		return;
>   	}
>   
> @@ -339,7 +349,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
>   		return ret;
>   	}
>   
> -	ttm_bo_del_from_lru(bo);
> +	ttm_bo_move_to_pinned(bo);
>   	list_del_init(&bo->ddestroy);
>   	spin_unlock(&bo->bdev->lru_lock);
>   	ttm_bo_cleanup_memtype_use(bo);
> @@ -1154,7 +1164,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>   		return 0;
>   	}
>   
> -	ttm_bo_del_from_lru(bo);
> +	ttm_bo_move_to_pinned(bo);
>   	/* TODO: Cleanup the locking */
>   	spin_unlock(&bo->bdev->lru_lock);
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 5f31acec3ad7..530a9c36be37 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -208,6 +208,7 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
>   	INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
>   	spin_lock_init(&bdev->lru_lock);
>   	INIT_LIST_HEAD(&bdev->ddestroy);
> +	INIT_LIST_HEAD(&bdev->pinned);
>   	bdev->dev_mapping = mapping;
>   	mutex_lock(&ttm_global_mutex);
>   	list_add_tail(&bdev->device_list, &glob->device_list);
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index cd592f8e941b..03fb44d061e0 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -265,6 +265,7 @@ struct ttm_device {
>   	 */
>   	spinlock_t lru_lock;
>   	struct list_head ddestroy;
> +	struct list_head pinned;
>   
>   	/*
>   	 * Protected by load / firstopen / lastclose /unload sync.

