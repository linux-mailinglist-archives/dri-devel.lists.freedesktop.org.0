Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3560A45E889
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 08:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F92D6E868;
	Fri, 26 Nov 2021 07:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B616E868
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 07:36:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDACX/E2SbYH4uis7dfBhec4N30sO04UqIX+fQsOcw379iSd0ZIe53fxM35TuFS6G7BbqpjC90XKF8hKhbG/uRiW//2zsFCzNDKU63vkSeHLabt5PBJgg8OAjch9V9BztfqakuQWqV4z0z1Jt5oWWTNgNO3KvZCDnZ0PftsEPskOpBogRO9Jh6tAwjzKTM4e/0pwaawTe1isbMgKKJmNxEKmVKzkYdYV5QVmDZ+0bGZaTYpfCe9pXWXRRb3J8SaP1lLU+aTWbOCfLZCeJ4XV8VYhN94o2wWt9IY+omFMIo6u8gGB4a/dw89S2tMM4qu4RCDXGz9sBzgYDBGBkdJ+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59xY7cyy5cyH5SQqEWBO579bESxjbTzH+RFxy3FaULk=;
 b=L8KbdQGhJPfpi8GJvrlqzrj5SM22spTHyJ9sRlEIR9ZPzreDrYX4mauB8/hXbsEhAwT0lZxZFl3zV4X2Wxt0y64M/ABZKowYsT2fkgEi5PZJMA1dlqULjp4b/4O6l3kRpKV8gdxJLSTasYwD2siZImbOO5dHOwJa0MyXwawRit1s9dz46jS9uurUX+UcwBtw5jKj8rvCtS00RSLryXOc4OB5j7Z1BCFH0HVugxzhrY1QZFGRVsSh/q8sjttNgOGJZvj7roQej/hyLid9zKZ4HNQoTZDCBaPqUU9ZALrsnhmRzXRwVmov8wHo88N5ITu/YGPJEKLmXUhaUKSQ0g0WSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59xY7cyy5cyH5SQqEWBO579bESxjbTzH+RFxy3FaULk=;
 b=R/LU/HVorVgvVMWHJU1lPEiF8Ywp1HzQuKsjwYOdX1bVbpoTJ9vHay9IKSDcCFjSfmyuSQNuSXZ4N5vNQDBiAocSyKyMQ3J8xS2m2o6N2B2FIvfkbVgLuciRHkRUQkuTDPWur4lFeFBBgGoJebMyYzddbbXBcnBMn2Pc724/l7g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4918.namprd12.prod.outlook.com (2603:10b6:a03:1df::22)
 by BYAPR12MB3304.namprd12.prod.outlook.com (2603:10b6:a03:139::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 26 Nov
 2021 07:36:09 +0000
Received: from BY5PR12MB4918.namprd12.prod.outlook.com
 ([fe80::d519:1ea0:33a6:8193]) by BY5PR12MB4918.namprd12.prod.outlook.com
 ([fe80::d519:1ea0:33a6:8193%6]) with mapi id 15.20.4713.027; Fri, 26 Nov 2021
 07:36:09 +0000
Date: Fri, 26 Nov 2021 15:35:45 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 04/12] drm/ttm: add common accounting to the resource mgr
 v2
Message-ID: <YaCOUf2vwDv/5Dzk@amd.com>
References: <20211124124430.20859-1-christian.koenig@amd.com>
 <20211124124430.20859-5-christian.koenig@amd.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211124124430.20859-5-christian.koenig@amd.com>
X-ClientProxiedBy: HK2PR03CA0054.apcprd03.prod.outlook.com
 (2603:1096:202:17::24) To BY5PR12MB4918.namprd12.prod.outlook.com
 (2603:10b6:a03:1df::22)
MIME-Version: 1.0
Received: from amd.com (165.204.134.251) by
 HK2PR03CA0054.apcprd03.prod.outlook.com (2603:1096:202:17::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.9 via Frontend Transport; Fri, 26 Nov 2021 07:36:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bb64ae9-78c7-49ee-d635-08d9b0af69b9
X-MS-TrafficTypeDiagnostic: BYAPR12MB3304:
X-Microsoft-Antispam-PRVS: <BYAPR12MB330429ACBECBD45B22B0E219EC639@BYAPR12MB3304.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oyfJzWfFxgfvDu4cta+z6d50gpzJA7vd/KscEaBLIAg+8eG8mX9B6D7M4r7G6UjtGUJ4gn5Zq8iJAsS8kNTpzIj5ferhie9e7fM8sA1JU6yd2YQKwdWNppQHE2wKjaX3XuTkmczS+shu2gLbtjcVavvxLjtAWzh9H0KjikraXE+J5MBpP6k/3KrFT/sQ4tOcaushDstZA812sO31AFjJ7cGyt5qmWxNWhR5gM2BY1cSKHWpxo7D3xHi87b2MDygSMORH28JAEXyXpu+fhcXDTW/BnCToDs/4TalRZaLzNVm7Y5ozcIVPWQ8BiZu9PTnQlZKH/KuCd8k8QTASIXmo+aeh2V22VHYO3bzKFQXtkvLRRgTMrMujRXOCx6iBndc58f/QnfEpuwzr+MV0ZP16OZXSg5VZCmU4mIyzohRcTLg/wgXPyMk3tNgMPuignA8tmzvsI2xxPh17nWR/RiuargKbSOBmkc4FDFirXQKBKNIVSaWpShhz5Uo6EnISjqqR/iCoRdFlxoZFqGsyJbLvvfkMonMxr3ZfJEJ4FuXB5Hx5wOi9Y+bDCsCF8VxjH5lOei1m5T6ASC4WMd1MJXweu/GmMLUJCutvP3wN9EztpVwhvZ+iwjuHeCnv5gEtJsZF3xmi3kL0k4H8TPhW9nPabg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4918.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(956004)(6916009)(4326008)(186003)(66476007)(38100700002)(508600001)(26005)(54906003)(83380400001)(6666004)(8936002)(86362001)(66556008)(8886007)(55016003)(36756003)(2906002)(7696005)(66574015)(5660300002)(15650500001)(66946007)(316002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rkbaxN4og7j5LnBVAVVzSatCFFqFCrnerClBkW4aDGpIgO+uW5Q4ZICrey?=
 =?iso-8859-1?Q?gBkXGfehVGMGittyQkQ57F+VNT0eAGS2FPd/Bx0gu/jSC1q4jPDK2l6kxB?=
 =?iso-8859-1?Q?FvfMg8HOVzbgs8s3bS7JRpgyHTmg/2hqcz7q4knNVTl4kc4i/L92siX0/W?=
 =?iso-8859-1?Q?mCJgjJ5cVQ6eUIoDnvS982lcK/09hmhJiVMNkn/qcwO363/G5TphatdLyf?=
 =?iso-8859-1?Q?b0RIXkojYMQ4Adzt/R4TbyXAve65GCIKC08VsV3v+9RazQQfBbz9fqaTOn?=
 =?iso-8859-1?Q?K8u/TfyywYi5pMvbvAO5Px/58CZcapQHbZK8PgVnJZHS1Kn3SM75C/1xwy?=
 =?iso-8859-1?Q?VYfCIJ/vl8LfHw+xzmwpAv+8jiZRwIecWp3AItodCNl7M9P9O1QQylWJPn?=
 =?iso-8859-1?Q?GnpSQSa3+hY6GWI5UWMHleyzIYeuhTNz6XAOMckKOeKe/CAL8DRx2e6eMx?=
 =?iso-8859-1?Q?T3bBSE9qaBnIv2LS/eNynN8fl++PBYPfWsKSij0uBJZM6N0mkS0i+mtxdo?=
 =?iso-8859-1?Q?OQ8fX2tDXFMRUGFIo+unYDIHCbSc3fxWC77s5m6iBy5vwsyHJuAaQ19sPf?=
 =?iso-8859-1?Q?KJt+vsNvcJPr5z36ypKjDdvpmBKSHsGAV6yUsBe2lYm++HlsYtCKZkkgwz?=
 =?iso-8859-1?Q?ZPODiNAMrya9l0xDOvCUfNnXnc7CXpI5H5NIbjNwWE+wb02OB8XJtmQueb?=
 =?iso-8859-1?Q?QuljScParOoVXnjIlLaFl1/tkUkXGijSAy+gnWVTx9BYem5jcdgZrwOFue?=
 =?iso-8859-1?Q?AAyPGzHUf18+uD4Ih1gCNEWhnnqBiduqBKcMNpr/hqK3O67b6fyTAlGzke?=
 =?iso-8859-1?Q?BB5U44ABFLYPk3Ocamu+gcJukU1Xubbi/K6UxA33xVD8Pg6dipz+2BfurP?=
 =?iso-8859-1?Q?i+yBhoTfvwK2ei0VOffCUAzUrX5lLfs/B/s9m5RjxqdARZH0k26+x2D9Op?=
 =?iso-8859-1?Q?X1mWKYoSqFIwgzG7ZA7A+HsQ6zsQJNmW2d0T3RKsDlwHVBL2L1B6X9bOU7?=
 =?iso-8859-1?Q?p3TBxEw1P8a8/zGuiNnMMRvSv2vx/YJCtp++Dj3iobZ/CTJGsIKO+yhGBP?=
 =?iso-8859-1?Q?Zxxnb/dmAPS096cEkOOE1ecPaOd+H2S+6W05KP0l9U5yWXZgZ5hSyOghk8?=
 =?iso-8859-1?Q?dYDdj2WLHLz+yIyekSLPoK1+cLyk/mlXqQODQxNnEXmPrkWUWQrpLUeX6o?=
 =?iso-8859-1?Q?Egp3MGgwa2syJhzD0UGkT2yhzQUI8Wmc9WlhwXol3mGlu9vzMeL39tcdYP?=
 =?iso-8859-1?Q?+NqLDufg7gCzry6IfbHupz3RVFdVRaN+JQj5eaNvWNE7zNi2G3VYltmO/w?=
 =?iso-8859-1?Q?YVwA1W496i5kfmyWX6fifusCRhQ3ltqTUjaDrq7djqTyb/jPYYatejfcjK?=
 =?iso-8859-1?Q?wM8eY7vXbvxArhjW6SU8aL7AI1HHtYv7KsNTFNppnKRGUlkWfFIG8z1UHd?=
 =?iso-8859-1?Q?kIsQz2xNPuCu/qLRq/PrGE/ZZU2c2dj/4xnqmYsfJHd7HCMhRB9XWoiP2p?=
 =?iso-8859-1?Q?Tg3cEt5BA5pT8bmT5YvquGhs6VSFjVQwOSSOdlu4NImI7pSAjjgSj477Ky?=
 =?iso-8859-1?Q?uNWwptWSZyAL4PJ8cUk6i5/nahzYDpKsVnGjVHJJMmiZOjIHRmlEdxjbs9?=
 =?iso-8859-1?Q?kc0+4wfh4gvVw8FRq7VHKUsCM5cuojsZgJCVlxZAtCa4G7JBHvppqfck/9?=
 =?iso-8859-1?Q?qmI0vrZ6ZHNtVg3Hfrc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb64ae9-78c7-49ee-d635-08d9b0af69b9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4918.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 07:36:09.1238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kow7L+z/gNv6+9qze/40SCdmSKlnhI1r75A1V6VQ+3PXTzbKNmM+DxsZi/UI9PGbLgJUOT+VgswrylxR6MC9OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3304
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
Cc: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 24, 2021 at 08:44:22PM +0800, Christian König wrote:
> It makes sense to have this in the common manager for debugging and
> accounting of how much resources are used.
> 
> v2: cleanup kerneldoc a bit
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_resource.c |  8 ++++++++
>  include/drm/ttm/ttm_resource.h     | 20 +++++++++++++++++++-
>  2 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 7fdd58b53c61..b8362492980d 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -33,6 +33,8 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>                         const struct ttm_place *place,
>                         struct ttm_resource *res)
>  {
> +	struct ttm_resource_manager *man;
> +
>  	res->start = 0;
>  	res->num_pages = PFN_UP(bo->base.size);
>  	res->mem_type = place->mem_type;
> @@ -42,12 +44,16 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>  	res->bus.is_iomem = false;
>  	res->bus.caching = ttm_cached;
>  	res->bo = bo;
> +
> +	man = ttm_manager_type(bo->bdev, place->mem_type);
> +	atomic64_add(bo->base.size, &man->usage);
>  }
>  EXPORT_SYMBOL(ttm_resource_init);
>  
>  void ttm_resource_fini(struct ttm_resource_manager *man,
>  		       struct ttm_resource *res)
>  {
> +	atomic64_sub(res->bo->base.size, &man->usage);
>  }
>  EXPORT_SYMBOL(ttm_resource_fini);
>  
> @@ -149,6 +155,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>  	spin_lock_init(&man->move_lock);
>  	man->bdev = bdev;
>  	man->size = p_size;
> +	atomic64_set(&man->usage, 0);
>  
>  	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>  		INIT_LIST_HEAD(&man->lru[i]);
> @@ -221,6 +228,7 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>  	drm_printf(p, "  use_type: %d\n", man->use_type);
>  	drm_printf(p, "  use_tt: %d\n", man->use_tt);
>  	drm_printf(p, "  size: %llu\n", man->size);
> +	drm_printf(p, "  usage: %llu\n", atomic64_read(&man->usage));
>  	if (man->func->debug)
>  		man->func->debug(man, p);
>  }
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 69eea9d6399b..3d391279b33f 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -27,6 +27,7 @@
>  
>  #include <linux/types.h>
>  #include <linux/mutex.h>
> +#include <linux/atomic.h>
>  #include <linux/dma-buf-map.h>
>  #include <linux/dma-fence.h>
>  #include <drm/drm_print.h>
> @@ -132,8 +133,12 @@ struct ttm_resource_manager {
>  	/*
>  	 * Protected by the global->lru_lock.
>  	 */
> -
>  	struct list_head lru[TTM_MAX_BO_PRIORITY];
> +
> +	/**
> +	 * @usage: How much of the region is used, has its own protection.
> +	 */
> +	atomic64_t usage;
>  };
>  
>  /**
> @@ -261,6 +266,19 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
>  	man->move = NULL;
>  }
>  
> +/**
> + * ttm_resource_manager_usage
> + *
> + * @man: A memory manager object.
> + *
> + * Return how many resources are currently used.
> + */
> +static inline uint64_t
> +ttm_resource_manager_usage(struct ttm_resource_manager *man)
> +{
> +	return atomic64_read(&man->usage);
> +}
> +
>  void ttm_resource_init(struct ttm_buffer_object *bo,
>                         const struct ttm_place *place,
>                         struct ttm_resource *res);
> -- 
> 2.25.1
> 
