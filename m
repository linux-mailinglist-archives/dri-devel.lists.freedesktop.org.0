Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CDB139555
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 16:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7816E0FE;
	Mon, 13 Jan 2020 15:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F72D6E0FE
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 15:55:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQJsuS3JwhJTJnD5cwb9dHanWw6X3vUAce34N286teGuCqcC2D/mzbhf2OqJQ360qPcm9/CLxlFNrmgKq/IL/20A01jQ82qlwqg/h+L91cMuYcAzlzDczX3awSLhtJ+P8J/Kxku7w4bzCDmhJUb9w0WOyfigQtVXPkflxaKfAhmRsXTlppV1U6Ixcsp3KWSbiVX6Jz9ZsmQI81sR5wGLHt6VaEUs/Tb7BB72Fali91pMjZoolsFFtqcMmtEXCDL4/SfHHuyRGSNfqa2OERBZauXHz3v4euce/R2mcfjg/XI1CPE4lzyjRSoC+EUKbhjKXA/0/TgkrlhEjIBdfYG7dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLPWq8D42ESuKs+vGGWa65Rbhv86/dt79zfyvRTSz6Y=;
 b=XMbqnCNCY88EUoXAddxJT4zIC5gzFPkVRnJBv5QQ+ETg35u3VxAakXqYgmH9ScRliu34gT04xHR8PQwm+VKYY1FgDGqFuawsSKNqGQ9E+wlr7AF/Bwig0d+AYRAkOO8DlBQ9/bZ3piWW7odZq5IKClnM2TaQALnXcodSxfSRpzfrfb7XUl38aT/cgg7NPylXJ1muYN/h2oTSatsHl989rVkhtjdCUhgythGwR9fDVmz3t/G4AzKLVguFJcdmRHyvBFh215UF/7t8EPCShoEoVncNwYGxwsv6TLpdoJ1sIWlRDoWSPN05TWLPYm9a/o2/WnabQTZ5Ecf1CdhNv6NoXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLPWq8D42ESuKs+vGGWa65Rbhv86/dt79zfyvRTSz6Y=;
 b=lU/7LporyIr+LV/4mc8vwc6UYm2obwCekeBfq0J1o8VeQOPhwLwzb2uohu/zDpe51pyViWdKTxvaNfyYv8mtQAkFn048INPOvG3Xg9hJB9B1nRHRf26U9hFBaNrlNsG9K0Cn17plHc0pDU4FnmWcr219TRtLT+UicsXJ780meeY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1852.namprd12.prod.outlook.com (10.175.87.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.10; Mon, 13 Jan 2020 15:55:53 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::8dde:b52a:d97a:e89]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::8dde:b52a:d97a:e89%2]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 15:55:53 +0000
Subject: Re: [PATCH RFC 3/3] drm/ttm: support memcg for ttm_tt
To: Qiang Yu <qiang.yu@amd.com>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
References: <20200113153543.24957-1-qiang.yu@amd.com>
 <20200113153543.24957-4-qiang.yu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f2075f28-94a2-1206-ba58-a3a6a32393f3@amd.com>
Date: Mon, 13 Jan 2020 16:55:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200113153543.24957-4-qiang.yu@amd.com>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::24) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.12 via Frontend Transport; Mon, 13 Jan 2020 15:55:51 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4d392e2d-cd36-4813-86da-08d7984111ab
X-MS-TrafficTypeDiagnostic: DM5PR12MB1852:|DM5PR12MB1852:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1852C179A414001FFF6E29EC83350@DM5PR12MB1852.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 028166BF91
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(199004)(189003)(186003)(36756003)(4326008)(16526019)(31686004)(2616005)(52116002)(86362001)(478600001)(81156014)(8676002)(81166006)(6666004)(316002)(66476007)(66556008)(5660300002)(66946007)(6486002)(54906003)(31696002)(2906002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1852;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UGmqeTqP/6TeRf5OMDx3KW/YJKFVSafKtO9HhW+J4c/LwgTFHRN5rO4ae76ICjD3F80HFm6rOztisnekadVt5HmUPblfQqS5ZoXNyjjfc+EkRcWzuvvjiMMJBoM/HwQ3EDj4xqhQNyghAkJmr9KdNR3Mrs8MK1m7jkDul4rFR+CgDtEa6bEL92O9gM2eE/uXJ2vNHowOVIOfCdff1DvPGpjdcpmXQldpVUH908yd8wbBGI/MeGU/MAFAcAccn8icj1aT64pTC7EohY6u08S6p+JuuqG8J7+ozBfDRmlJD5RWCJiTvdu9dEL8s6DQ136rAdW6ucK1+gzCOr3NB9gKImOHe/P582748ag4h1DXcO/dUATZdh/cPtz4VfDN9Ccr8BZgl8LukKFVOCztEEEFHhYcl1YCzdBJ8+tbt07r0REJyG6+Bc9RVPApQP+ycRTV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d392e2d-cd36-4813-86da-08d7984111ab
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2020 15:55:53.6812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LmP0i33G4qVi4Jh025A59WEsfR2Cw/6lZkKZtIf3Xe+LnqcGFpkFsCrLvBq7XKBw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1852
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
Cc: David Airlie <airlied@linux.ie>, Kenny Ho <kenny.ho@amd.com>,
 Michal Hocko <mhocko@kernel.org>, Huang Rui <ray.huang@amd.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.01.20 um 16:35 schrieb Qiang Yu:
> Charge TTM allocated system memory to memory cgroup which will
> limit the memory usage of a group of processes.

NAK to the whole approach. This belongs into the GEM or driver layer, 
but not into TTM.

> The memory is always charged to the control group of task which
> create this buffer object and when it's created. For example,
> when a buffer is created by process A and exported to process B,
> then process B populate this buffer, the memory is still charged
> to process A's memcg; if a buffer is created by process A when in
> memcg B, then A is moved to memcg C and populate this buffer, it
> will charge memcg B.

This is actually the most common use case for graphics application where 
the X server allocates most of the backing store.

So we need a better handling than just accounting the memory to whoever 
allocated it first.

Regards,
Christian.

>
> Signed-off-by: Qiang Yu <qiang.yu@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c         | 10 ++++++++++
>   drivers/gpu/drm/ttm/ttm_page_alloc.c | 18 +++++++++++++++++-
>   drivers/gpu/drm/ttm/ttm_tt.c         |  3 +++
>   include/drm/ttm/ttm_bo_api.h         |  5 +++++
>   include/drm/ttm/ttm_tt.h             |  4 ++++
>   5 files changed, 39 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 8d91b0428af1..4e64846ee523 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -42,6 +42,7 @@
>   #include <linux/module.h>
>   #include <linux/atomic.h>
>   #include <linux/dma-resv.h>
> +#include <linux/memcontrol.h>
>   
>   static void ttm_bo_global_kobj_release(struct kobject *kobj);
>   
> @@ -162,6 +163,10 @@ static void ttm_bo_release_list(struct kref *list_kref)
>   	if (!ttm_bo_uses_embedded_gem_object(bo))
>   		dma_resv_fini(&bo->base._resv);
>   	mutex_destroy(&bo->wu_mutex);
> +#ifdef CONFIG_MEMCG
> +	if (bo->memcg)
> +		css_put(&bo->memcg->css);
> +#endif
>   	bo->destroy(bo);
>   	ttm_mem_global_free(&ttm_mem_glob, acc_size);
>   }
> @@ -1330,6 +1335,11 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
>   	}
>   	atomic_inc(&ttm_bo_glob.bo_count);
>   
> +#ifdef CONFIG_MEMCG
> +	if (bo->type == ttm_bo_type_device)
> +		bo->memcg = mem_cgroup_driver_get_from_current();
> +#endif
> +
>   	/*
>   	 * For ttm_bo_type_device buffers, allocate
>   	 * address space from the device.
> diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c b/drivers/gpu/drm/ttm/ttm_page_alloc.c
> index b40a4678c296..ecd1831a1d38 100644
> --- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
> +++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
> @@ -42,7 +42,7 @@
>   #include <linux/seq_file.h> /* for seq_printf */
>   #include <linux/slab.h>
>   #include <linux/dma-mapping.h>
> -
> +#include <linux/memcontrol.h>
>   #include <linux/atomic.h>
>   
>   #include <drm/ttm/ttm_bo_driver.h>
> @@ -1045,6 +1045,11 @@ ttm_pool_unpopulate_helper(struct ttm_tt *ttm, unsigned mem_count_update)
>   	ttm_put_pages(ttm->pages, ttm->num_pages, ttm->page_flags,
>   		      ttm->caching_state);
>   	ttm->state = tt_unpopulated;
> +
> +#ifdef CONFIG_MEMCG
> +	if (ttm->memcg)
> +		mem_cgroup_uncharge_drvmem(ttm->memcg, ttm->num_pages);
> +#endif
>   }
>   
>   int ttm_pool_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
> @@ -1059,6 +1064,17 @@ int ttm_pool_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
>   	if (ttm_check_under_lowerlimit(mem_glob, ttm->num_pages, ctx))
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_MEMCG
> +	if (ttm->memcg) {
> +		gfp_t gfp_flags = GFP_USER;
> +		if (ttm->page_flags & TTM_PAGE_FLAG_NO_RETRY)
> +			gfp_flags |= __GFP_RETRY_MAYFAIL;
> +		ret = mem_cgroup_charge_drvmem(ttm->memcg, gfp_flags, ttm->num_pages);
> +		if (ret)
> +			return ret;
> +	}
> +#endif
> +
>   	ret = ttm_get_pages(ttm->pages, ttm->num_pages, ttm->page_flags,
>   			    ttm->caching_state);
>   	if (unlikely(ret != 0)) {
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index e0e9b4f69db6..1acb153084e1 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -233,6 +233,9 @@ void ttm_tt_init_fields(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
>   	ttm->state = tt_unpopulated;
>   	ttm->swap_storage = NULL;
>   	ttm->sg = bo->sg;
> +#ifdef CONFIG_MEMCG
> +	ttm->memcg = bo->memcg;
> +#endif
>   }
>   
>   int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 65e399d280f7..95a08e81a73e 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -54,6 +54,8 @@ struct ttm_place;
>   
>   struct ttm_lru_bulk_move;
>   
> +struct mem_cgroup;
> +
>   /**
>    * struct ttm_bus_placement
>    *
> @@ -180,6 +182,9 @@ struct ttm_buffer_object {
>   	void (*destroy) (struct ttm_buffer_object *);
>   	unsigned long num_pages;
>   	size_t acc_size;
> +#ifdef CONFIG_MEMCG
> +	struct mem_cgroup *memcg;
> +#endif
>   
>   	/**
>   	* Members not needing protection.
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index c0e928abf592..10fb5a557b95 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -33,6 +33,7 @@ struct ttm_tt;
>   struct ttm_mem_reg;
>   struct ttm_buffer_object;
>   struct ttm_operation_ctx;
> +struct mem_cgroup;
>   
>   #define TTM_PAGE_FLAG_WRITE           (1 << 3)
>   #define TTM_PAGE_FLAG_SWAPPED         (1 << 4)
> @@ -116,6 +117,9 @@ struct ttm_tt {
>   		tt_unbound,
>   		tt_unpopulated,
>   	} state;
> +#ifdef CONFIG_MEMCG
> +	struct mem_cgroup *memcg;
> +#endif
>   };
>   
>   /**

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
