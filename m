Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CDD234217
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 11:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0AA6EA3A;
	Fri, 31 Jul 2020 09:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6286EA3A
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 09:13:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5a1blQEvlidbL37aA3qm5/GrG9sywtfVTepMhf0ai1blvSCz7kbInoO9LCKZIV/9CW9rkw8f82KTGC3XZBxwompa7hZlTBQofRsvTgJQnbTuHMPN2vzHqCdrJSh8MgCdK3g0x9J52Iu0nxfYAwnH8GSzlMtdxqo67nA9nIjpYD++tmYdth/3qhXjt0VUx0/YKgasdw4vXMH9bSd13dd8o7YwX3FioFrjxUqKmw8ev1MnkigZ20mpXTlsToVXZoWXZPhuq1StMPzJRETEeT2/zmHdWW1n/usCw2Ccqja7WtrvdMWd/bua4/6J62seQhv04m5au64i/bzZzPqvYQMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GClbth7bIndxdM0NTX5eaT9A3YTaWtOsJ/uaQptepII=;
 b=l74/qXb/lkv7w8s9Ey9Uavs2+m4cb/IMhncbMFt3CLBCfQpVZNNNJr97HrOFICMljbxZ52reBVApaauaU0T9EqU80U3u9H0QTGxUz3r3XDCR+RsAzsWfzJS3Gm90HtMvKg2V10docx1y2GnzRE914MenNwUlD4QXiDjJzYCv2KlN4CAproaSvyFqYRu4txynQGfYmUqrG0bBYJJ9j+2b0HZ4K/d9oRX7xngwzzY4W7uXfD04LUt9teRWybIQvfuqk5d6o9lDCx4kcH6W7TZPVNWR6dAexG2iRXFCsw1gUW1HJ0+o5oc0eY6pJevaLGuoWY7sSaegUdw5jkCT3QLdAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GClbth7bIndxdM0NTX5eaT9A3YTaWtOsJ/uaQptepII=;
 b=KcHuhaOoq3ol1kfziN87q9BBKZhbW955fVAUGJpmyLYqt2VaujXGM5nlpYCFnnXmKOyx+E7OTyTEbb/MJhdssLI2e9XtRqPi7UYC0jB3OfxFsNDRsTcHSM7RBrcNVj287jrEGuCxz/n248yneuAkQKWsGazwOGBe4g1VmhuHmgo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2356.namprd12.prod.outlook.com (2603:10b6:207:4d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Fri, 31 Jul
 2020 09:12:58 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 09:12:58 +0000
Subject: Re: [PATCH 03/49] drm/ttm: split the mm manager init code
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-4-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6b901fc4-b7ef-87bb-b803-cbd5c65f49da@amd.com>
Date: Fri, 31 Jul 2020 11:12:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731040520.3701599-4-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: FRYP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::21)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FRYP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.9 via Frontend Transport; Fri, 31 Jul 2020 09:12:57 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5287dced-c072-4e12-30d4-08d83531ead8
X-MS-TrafficTypeDiagnostic: BL0PR12MB2356:
X-Microsoft-Antispam-PRVS: <BL0PR12MB23569BBAA14D4AD7560B525C834E0@BL0PR12MB2356.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K4L2+bmImqTFJ9Pc1nKR2f7WOuD5wSD+XJmkfOS8sfelUgmn8hitvV+gyNnZDg1C/Z0fYvNOfRJeB9bOb5DPCnFus6bu2Rm+3huzhrKMLvg7bYIA8zW5pDKMtfypQHH2AOA8q6JfYjg7Aqs0qqcrmT7VMk2G3s5nUBNxkqo7yb81qCVSye9G/cS3F/A0NqjU+C+yXaau6pmJPztL7ZZwiY6KXUdto9dGWgscB3PCOSIBRIypGzyMXnPgZc/Obz90FaucDUzigHUvF5Xs4IF/ENXr9wYYLRkLigNwZZ+eZKsnaCSTxjUp3XHi9SXoghYUWfkj/SrWedg97Q6kesHDvk7jL1u6B37ueS7I2xRncRXhsyvwNc5jl78jMhtIQxHh15fhWkcp3mmetSOpZ1JpGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(8936002)(86362001)(4326008)(5660300002)(66946007)(31696002)(66476007)(6486002)(36756003)(478600001)(66556008)(8676002)(186003)(16526019)(2906002)(31686004)(6666004)(83380400001)(52116002)(316002)(2616005)(87944003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Wc/IVJLyzCxVwNUJStx4gGx+LG8cWk5BtYnE10dFPizhaNvdL3vkgBGXmTixPOjBc9NOYXdsWxU4f7I44aEhDo65Ch+9QptPpLe8wB4kbPE//dO7zCHkolFSV5BXqIWh5i18uHQ+Fe2FOUa/77oRpyPgNB1kt9UDK1Xv32pulbGc4MPbwJ26TwJuFvSAFw74Z52Y02EQnK6+SUHEBtR7ZLksmlcyCJjwAGvwpGePcFec5KF054aTMmqtQUVaA4VwjffXrGbeIWIAiHC/re4tTj7De27F5/jV/Cbi6wXPwPg/tMXkLv1EyjI9pESQX1ohazd/zvE7nv4ycKOuUmp74mIIVD11EFdzNEZhtQSRSx2HOKJyIUI5SbfKRpNLiNquFzWx5n8MMCL6xg9Pw4Myq+ci0HYDZ1DY1V5fNml3TK9XvXvVUfDepq3e9LbFS2bMnaLLw3QFvKcH6use0L0Iu26NpxaYEUYoGVnWS1l5uKOe/QbJfUOMnn6/vLGE8KhmIZq8GLbjVBtslpZpOwgWACXIkx53AEMBqa+qXDpLk5koyUxkJlBL9TYKR4xx4LnFgraJgkzocbTzCfqBUTT2o2bUQXWFEWF2BTV2IGX6/ZAXSajwpRuB/iVqnlmGT6qe5+Krb0dsFLChvVr3VRcdm7PUApSgI4KsDxlPx0QqkGnp8hMz2e4lTSCmvGJojJaqnxKXMiBBnL/4fN0c/kqGyA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5287dced-c072-4e12-30d4-08d83531ead8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 09:12:58.5589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXu2yIg7YsAhtK8okC6tGaFQJoHWfgMat4wRMwGBPLYJGHmOx7+BzcYpeVXqWcBE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2356
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
Cc: sroland@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.07.20 um 06:04 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> This will allow the driver to control the ordering here better.
>
> Eventually the old path will be removed.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c    | 34 +++++++++++++++++++--------------
>   include/drm/ttm/ttm_bo_api.h    |  4 ++++
>   include/drm/ttm/ttm_bo_driver.h |  6 ++++++
>   3 files changed, 30 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 041a0e73cd1b..a658fd584c6d 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1503,35 +1503,41 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
>   }
>   EXPORT_SYMBOL(ttm_bo_evict_mm);
>   
> -int ttm_bo_init_mm(struct ttm_bo_device *bdev, unsigned type,
> -			unsigned long p_size)
> +void ttm_bo_init_mm_base(struct ttm_bo_device *bdev,
> +			 struct ttm_mem_type_manager *man,
> +			 unsigned long p_size)
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
> +EXPORT_SYMBOL(ttm_bo_init_mm_base);
>   
> +int ttm_bo_init_mm(struct ttm_bo_device *bdev, unsigned type,
> +			unsigned long p_size)
> +{
> +	int ret;
> +	struct ttm_mem_type_manager *man;
> +
> +	BUG_ON(type >= TTM_NUM_MEM_TYPES);
> +	ttm_bo_init_mm_base(bdev, &bdev->man[type], p_size);
> +
> +	if (type != TTM_PL_SYSTEM) {
> +		ret = (*man->func->init)(man, p_size);
> +		if (ret)
> +			return ret;
> +	}
> +	ttm_bo_use_mm(man);
>   	return 0;
>   }
>   EXPORT_SYMBOL(ttm_bo_init_mm);
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index a9e13b252820..0060925f507a 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -546,6 +546,10 @@ int ttm_bo_create(struct ttm_bo_device *bdev, unsigned long size,
>    * -ENOMEM: Not enough memory.
>    * May also return driver-specified errors.
>    */
> +struct ttm_mem_type_manager;
> +void ttm_bo_init_mm_base(struct ttm_bo_device *bdev,
> +			 struct ttm_mem_type_manager *man,
> +			 unsigned long p_size);

As I wrote before I would completely rename the backend functions to 
ttm_resource_* since this is not related to the buffer objects in any way.

Moving a good bunch of the handling into a separate file might be a good 
idea as well. But that can obviously come later as well.

Christian.

>   int ttm_bo_init_mm(struct ttm_bo_device *bdev, unsigned type,
>   		   unsigned long p_size);
>   
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index 7958e411269a..68e75c3b8c7a 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -678,6 +678,12 @@ static inline void ttm_bo_unreserve(struct ttm_buffer_object *bo)
>   	dma_resv_unlock(bo->base.resv);
>   }
>   
> +static inline void ttm_bo_use_mm(struct ttm_mem_type_manager *man)
> +{
> +	man->has_type = true;
> +	man->use_type = true;
> +}
> +
>   /*
>    * ttm_bo_util.c
>    */

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
