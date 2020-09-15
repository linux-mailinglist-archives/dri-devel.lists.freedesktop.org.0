Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE1B26A01C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6633F6E09A;
	Tue, 15 Sep 2020 07:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175976E09A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 07:47:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oap+CJNEP2SawlKVTTlJTa4GDUANzyUYI2fm7jmLgpy13nXulFDWc6nqqRD79q1yJ660d0aebGJEU3QIyCh/MPB8JbdXGI6Ml95YzigsO3gxsNQN61xa02ZEEcl+dviH1AnY/7k3AqSi0sA5rpLBeKthFOZtwoIneloW3ykJhhUMfJ93PeoYMYirdFu0v+FlZ1FkkK98pnhyS58Lgxctme02UwkI6Uk9czd4H1OHWKO124rGJxrkn3+y3ApErxTUg6FGJ7ZGiT7pPOdUn/ROETPxumPB8kseGFKU3IVzdmYxJsESuxyimHhkszlipR04eNf6aBT17v299+JDdmh75Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5uYtcLe0AtUVkfuUaKxSwvcBcpzB3usAVgI0GerG90=;
 b=mhA01qxayRdoRpL8QI0B9idNlCm0rNty0ISZDb+Fcku9qioKyUADXMS0ZNCDtPZsODYq7Cuhq36weoDIqWzgC2O2lV1At/XeOhUVl64x+ha8muzmtxH8IfVpsVLO9AreV6eAZK0cXDlKGCiwZFHCSg7J/O4IicqR2rnYJXDexqPd7P+1Y68wonILGfgw/L58O00Kcg5mwIN6EMmL5tyA8iV8BxOgJef2PsSvjrbD39sGtGP0wimu37qW6PPq9Gpwci/xdYzBdpVuwEPENLo1J35Aho1tQXRbEiFbjzhxvPwM7r6l9SVFm25RcS0MijGMlx7TcFzepWlc6VEIrfhY7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5uYtcLe0AtUVkfuUaKxSwvcBcpzB3usAVgI0GerG90=;
 b=eQZ0b/B4yA6JXdUI6Z9HFYaS54/Edqt6qFdhyz6M/++5rz4aOcRU4LkYXsK/m/McSWT8dCbDjx2+2h4gE7iG4+Y2ccUsab4K5dnnmpzbeys3pSksTG1z4Ry6seYRc0AhMkIKodKg4yC8TBUafsDyuZuM++W3D9ZJyA8uqunUGcg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 07:47:40 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 07:47:39 +0000
Subject: Re: [PATCH 2/7] drm/ttm: wrap tt destroy.
To: dri-devel@lists.freedesktop.org
References: <20200915024007.67163-1-airlied@gmail.com>
 <20200915024007.67163-3-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <29da59ab-d955-1e37-cbc9-47ccf2cec1f4@amd.com>
Date: Tue, 15 Sep 2020 09:47:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200915024007.67163-3-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0033.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.6 via Frontend Transport; Tue, 15 Sep 2020 07:47:39 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a9e653ce-f03e-49bf-6659-08d8594b9ee6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4206:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42069F1B8F9E815F01248E0283200@MN2PR12MB4206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D5lp29Q4Kbi23J90GXJGCIxnZwZPHxhSPUa/g0r8L20I/HXEvwSuhElfFgXxBBia8sIh5CsIC0XlDsDCDhXRWHgioUSFanUNfTXgOf/UDiSXkcMuqxWV68HgBG3d9wGvwdlT0PfNP4uRgpSLQpLm2fsqmZGZi/oa39azMfoN24ONav5XLXtDdlLC4bgDlKTS4hyjJULmf9FE3nNzyjH1/sl9N1R8IsfgkGCWZ8Iz2vWPH4sosATPAmsxNu8a6r4mu2otP8Brzo4HqG7vgBpaCJiJ/gmAsulJ2xiBNRe0c18BriqqY/f8PWrJg+YYmgMH7OBfScbhUbPUC4o7g/5GRiCFHK8A2LAzrppwwmhD1YE2qffQjtF8s/AkClgnjqzC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(16526019)(186003)(2616005)(316002)(6486002)(66946007)(5660300002)(52116002)(36756003)(66476007)(66556008)(31686004)(31696002)(83380400001)(86362001)(4326008)(8936002)(2906002)(6916009)(8676002)(6666004)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: aoDip6q50aKmCdRm1opwCt0KOBQC2MTBykgAGcatiOeK88WL/h1w2rI/P/MHzp6RG1LJP5/nT/Higrh3SHbr9WJtTbfWIis9gkrU/dbxqFbbu4mqATQO7SnC2krtqY9yW+m9lnfRnuMk29qGZJfXVwOWIYBpAxpbyvRO5EdoB7STpmjdypVwTQA8iayVH3A3xtD3hrf0Q1eZYON4FsEFMzWWVZ2Ia6bed0Ppd2F/X3c2k81KcC5TGPUtwii2LQn2mumytrcapM3K4eXERPUe2uRWriB2det285dfjgFvUUWUky6xytOvgygMq3UbzCdao2uZjiY/UDb6t6VzCYNXVm94QwOPX9PigTMTqr13LDao2KfTikW9xghB7uhfXimu9RNFOLydLhD/jimWxIsvX7QTsFfShdIawO2tKNmvYrFXUWepVv7F7S7pzl2Cy9K6fsri1qijo6TTtZsD3ED/OP2yepzdl7nrwzJyC5pBZtNSEnrdL6uXchx4wNIAL1HB41rhEOifCaz7zmyPHh7pccKYYPVuOC3myAPv+Z+aC0k4QMf0nTOQUHLlAli3GHqDHZxdLGr3NoUH03Lj0DKZiq34x2XMNq3tL9TJgAUSItWHg9UAubJjAaw5Z4xw0NRjKfyfycUGOt3jWYnqVElYTXGFWVmWvnpuB+fvdrXYPvlu3kz9j0pKv/25Pw4leAa8dyTfuXbzD3aYs5JNRyhJKg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e653ce-f03e-49bf-6659-08d8594b9ee6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 07:47:39.8762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekqrDKVkw4U62yGICbXNK0f86gXdwaLO9UVGIV6KekFhqIoBp+X2KxKajpY/HkgP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206
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
Cc: bskeggs@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.09.20 um 04:40 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> All places this was called was using bo->ttm either direct
> or indirectly.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c      |  9 +++------
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 24 ++++++++++++------------
>   include/drm/ttm/ttm_bo_driver.h   |  5 +++++
>   3 files changed, 20 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index e2bfe3a13c63..9aae9e1bd8e8 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -301,10 +301,8 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>   
>   out_err:
>   	new_man = ttm_manager_type(bdev, bo->mem.mem_type);
> -	if (!new_man->use_tt) {
> -		ttm_tt_destroy(bdev, bo->ttm);
> -		bo->ttm = NULL;
> -	}
> +	if (!new_man->use_tt)
> +		ttm_bo_tt_destroy(bo);
>   
>   	return ret;
>   }
> @@ -322,8 +320,7 @@ static void ttm_bo_cleanup_memtype_use(struct ttm_buffer_object *bo)
>   	if (bo->bdev->driver->move_notify)
>   		bo->bdev->driver->move_notify(bo, false, NULL);
>   
> -	ttm_tt_destroy(bo->bdev, bo->ttm);
> -	bo->ttm = NULL;
> +	ttm_bo_tt_destroy(bo);
>   	ttm_resource_free(bo, &bo->mem);
>   }
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 44b47ccdeaf7..0ddaaa1ddafd 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -297,10 +297,8 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>   	*old_mem = *new_mem;
>   	new_mem->mm_node = NULL;
>   
> -	if (!man->use_tt) {
> -		ttm_tt_destroy(bdev, ttm);
> -		bo->ttm = NULL;
> -	}
> +	if (!man->use_tt)
> +		ttm_bo_tt_destroy(bo);
>   
>   out1:
>   	ttm_resource_iounmap(bdev, old_mem, new_iomap);
> @@ -542,10 +540,8 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
>   		if (ret)
>   			return ret;
>   
> -		if (!man->use_tt) {
> -			ttm_tt_destroy(bdev, bo->ttm);
> -			bo->ttm = NULL;
> -		}
> +		if (!man->use_tt)
> +			ttm_bo_tt_destroy(bo);
>   		ttm_bo_free_old_node(bo);
>   	} else {
>   		/**
> @@ -665,10 +661,8 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
>   		if (ret)
>   			return ret;
>   
> -		if (!to->use_tt) {
> -			ttm_tt_destroy(bdev, bo->ttm);
> -			bo->ttm = NULL;
> -		}
> +		if (!to->use_tt)
> +			ttm_bo_tt_destroy(bo);
>   		ttm_bo_free_old_node(bo);
>   	}
>   
> @@ -702,3 +696,9 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>   
>   	return 0;
>   }
> +
> +void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
> +{
> +	ttm_tt_destroy(bo->bdev, bo->ttm);
> +	bo->ttm = NULL;
> +}

Please put that into ttm_bo.c instead. I want to get rid of the utility 
functions sooner or later.

Apart from that looks good to me.

Christian.

> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index 303a89d1066d..c2e93f04d0ad 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -684,6 +684,11 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo);
>    */
>   pgprot_t ttm_io_prot(uint32_t caching_flags, pgprot_t tmp);
>   
> +/**
> + * ttm_bo_tt_destroy.
> + */
> +void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
> +
>   /**
>    * ttm_range_man_init
>    *

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
