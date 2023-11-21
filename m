Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9D77F28DD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 10:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8723710E45B;
	Tue, 21 Nov 2023 09:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2075.outbound.protection.outlook.com [40.107.95.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9114810E45B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 09:25:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYW2HtuKx+eJfm5XSekqdwLHQmlLIPMpVkbG1XIdBL5woEDGqFfM1ee7R3aCRjpTenL+yN41T5VFR120petmAyl2Wbcz3F0kQO88MWHhJVrWo9U5SJQ0wPibwlODW7kZoHWh3T5fQcfBo9up0dMmnysNiypuAce5Cmlxn5a6dxzMju4nqOW0RhPCP08GLuUnnbNhDUELWzb0rY+X8nWkNruk7kYRFC6VdB4yXVasavwxbsONjFFaKPz1mAyhbkzvDfimRVR8rl7EwCCQ0sCpmChE+TgD5RF9y7KshQ/IpEMGUEx70VcBoOkk6tSj86D31sYctmWEfMDLD1/1tMSWqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnk+z2eXTEQDEceSvLesMZSMmsABVaqsK8TvqEfwlLA=;
 b=OpP7mQHQqdiKoiCJzLKoeqZQq9MZHXIWysdhrTK1gBIV5UFcEoWKKozmSKo/uaCgS36zT8rYtpo8F497T95j+KexETdXA9tBovqybPWbMXAk2zsV/D/d7awqbrbUGBDLjbGYAPQxp3vXySCunu633Wux5jy2qXExyvyjN1ZalcGXhnJPQOHqc77QLARfTyoqlrKWXTFAV6PBEsQIriL7hMzyw4ZDj0Mm/sHwaj4ZC0H5GnYPcir4gRPhL3GFyXfUYLOefUjvcHpji4LCuqGdzz4/opOlE+WyvZLr28Ph1fBqHPHfwQy6TF8zB1r/O8C9z1Op5IqNgtSnbirCXh5wcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnk+z2eXTEQDEceSvLesMZSMmsABVaqsK8TvqEfwlLA=;
 b=c6jwAhyjGeWS8Qx6BSeCc+NhS/75SsYlXacmK73/YqAA1rzoi3MgrKxCX25sZ3gr9syjX04BMhPOJy78aC8Oyzro/ZZuxN6giGYirQbclmdZyEEJ6Ue1BZEARxIDf3PtgQtCFinL7wv1zpoVGnO/fQfrDnlIaNKFvpW6jDnsbkY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB7477.namprd12.prod.outlook.com (2603:10b6:806:24b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 09:25:24 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 09:25:24 +0000
Message-ID: <6f5b51ea-3d57-44e7-838c-3caaf80c0e7b@amd.com>
Date: Tue, 21 Nov 2023 10:25:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/8] drm/ttm/tests: Add tests for ttm_resource and
 ttm_sys_man
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1700207346.git.karolina.stolarek@intel.com>
 <3f185443f544f329aae19daa622bedaa25ce3b73.1700207346.git.karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3f185443f544f329aae19daa622bedaa25ce3b73.1700207346.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0235.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA0PR12MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: 56b13010-0920-4277-e0a7-08dbea73ca4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V+9M1lIkOd9spOW6X41K60p+1KX5g+xmQqccSIl9BPtjBt+KBdEhIFRYj5WtjrfLC1JVe8enSguvAmJ5wQ6zbuW598CVAuOmpK2ZtSODJVFSHk4KJ+s7j9N9FBk93uv03yV01eTOQ17BOdRrmJA2uLXrNLUDMy96WHe2k0Ynpejvvbnw6JmeJ7atERgu2drV5Y2ilq6sJkK26PctDThsoz0aqgrBk3BZFs9aT3+MOi2Wfni6P/J9aRLgzT09Wv4fSIHj6M5Y8lKGZ9OXm2jINnQcWSeGw7J7An/jb+cAZPrcITkn26vcTDU1iihFnNVKfK2c5hPCvkRU2URI4mF5gzXqXNL8ERlxYJOdglfKigG3ThdZEZE13rX2ybusiu+0HnLtQvInJk++h8LVkleWFpWOzx9X48VWdcebd2gv1jGmH6EVVQWP51ipqe6y08HH9Pj7+sjO6vguD10/VeD4/NPm99hItxjlzOc+bDyyDz1KUZWAWwQh1WzENZdHKajPaESRyCGOCbFU1YvnlF+df+IO2NkApzUqmT45iLSafGch/1SrcvWMwj69fN4Pvxx9/Z2nOedn1X/rFzT+kJgW2WpADpOYtv76kxJOdzOZ0TvDz9XAJAj67vSg6DR5LitiJGZyOa7FeR5XTBsFr26xjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(396003)(376002)(136003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(6486002)(83380400001)(6506007)(6512007)(478600001)(31686004)(2616005)(6666004)(26005)(66574015)(38100700002)(54906003)(66946007)(316002)(66476007)(66556008)(31696002)(86362001)(5660300002)(2906002)(30864003)(41300700001)(8936002)(8676002)(4326008)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTRmTmFrTy9WanZEU1RNTHJkMWw5Z1g4cWc0NFBwckpoc1JQWUljWFJPbkxu?=
 =?utf-8?B?N004M2g5RDRiWHZlcGlZandsV01aalE3aUFxdUxXMVNvS0U4RFR3MlNlVENq?=
 =?utf-8?B?YUtjM3BSejJLMHZPNWkxMHhzYVpvQkxBemREQm9RNktwK015ZzJxNGk4eCsz?=
 =?utf-8?B?bXllVUtYVGhhNHFuampaak1wQ3dlbUQxRnBvdXFLZnhsNkNKUXBPMXlZZ2M5?=
 =?utf-8?B?QzFDZGdDOUZTcEZZaDBEdWdxUXdFdldsYzJOY1RyT2QzaTVIdS81R3pCR0hk?=
 =?utf-8?B?N1ltaCs1bXZmeHNyUEJxMkZPQm94ZkJ0ZmNhZFRrRkhhN1VoaWhyY05VY2hO?=
 =?utf-8?B?dFlsK0lJdzlLZEVsdmdUbkNSWGVVWXRXZkthOXlmNU15ZUp6em90R2I4Tmxo?=
 =?utf-8?B?c2kwNS8zTExLSTQrRWtadUMrWnEyZWYxTC94QU5kb2grMkxycnFwV050ZGFX?=
 =?utf-8?B?REFmNDFjZ3U1NWJvOStZeTJBZnZSQVhzSlpySHl6anNKM2ZCUWdpY0xDYS8y?=
 =?utf-8?B?Yi9BMmJpWjkxSU1lTTcrSjZTR2NkZ1Z6T2l0L0F0bEtIR0dadnFycEx6M3dQ?=
 =?utf-8?B?dHBMbW9maTZHMUZTalNXYW5LNGRvSmFGTWYvWFpIMlYwcVAwdGFrUi9RQUpx?=
 =?utf-8?B?Y3M5ZndPN2Q1TmxYbXIwd3NEeG9raC9ZUm1nK1ZKcHRSZWsrbStuNnVBaUFw?=
 =?utf-8?B?R1o3UlhqQVRxRWlNY1RZSU5iZ3h1ZFdaeDdGcVc1OU0xOVExZXNORnV6Sk0x?=
 =?utf-8?B?dW55VmZuTjFoZzk3OHRBVDVDUVJ4ankyU2RQUGVkQWpRb0dhWVFVaEFXQk1G?=
 =?utf-8?B?cXlveHFiZDI1SzdBVUhxMFFqdmlmK3BnT0hRbi9xbWV5VGpBbmQyOVlRUnJE?=
 =?utf-8?B?WHViV1JzK2lKYTErR2w4Wm1rdEVCM0xMSVM5U1UwOHd3NGNOVGJQaVdWRHlO?=
 =?utf-8?B?QUUrSUVleTUyRFFEUFAxQ3pCQjRsRlkvTjg0ZkF1VkFvaTRBWGpDSlM1Z0Uy?=
 =?utf-8?B?TlNtV1p2bU5TVUVXdndTT2RMaXlRcHg3cUtSNmhaMWVuRENtNmt6WDFQSCs1?=
 =?utf-8?B?ZE81d3NnSFQ5VlRNZ1lVQXA1VzZSWGo0VStOTCtqbVM0cHlpV2JUNm1PWW5K?=
 =?utf-8?B?b3o4TG5KL3hTUmxpSCthQVhHVE1TSTZPVFVWWi9NajBMYUlVYXFNOXhQdklY?=
 =?utf-8?B?ZnI3RDNYYUgrOWlOR3l5RVdpc29kbzNnTklkY2swaWJ0MVg3cTRaSUlXb2lL?=
 =?utf-8?B?RW1TdndSM283cDQvRDVub1dMZFA1OTlOVTVrWjJVWTZYbGlKWnhVUVhFR1Zu?=
 =?utf-8?B?UFM2VktlY3pLS0owMVQrS21mQ2k5U1RkNUdvRUJWN2tLY0Yvc0kzR3lBaU10?=
 =?utf-8?B?OFZKK01qTGFDVy9tTDJkcnF5ZXRWT3pFTElGY2VQWFNJTlFiMExqdnN2cDZZ?=
 =?utf-8?B?aFJlb3pRa2VCWUF4L3ErZ0NDeU9mdGVBN2ZXSUh5a3NveXY3WDFXbFZKTXdN?=
 =?utf-8?B?TXJmd3V6Szh2bndhZk1WUFdHMVJNQytaMSttV0Mvc2V0M2d3bUh0bWVxQU9G?=
 =?utf-8?B?WGtmdG1BMWZ4dkVHZHFsNENGVWgwV0RRTkZqSXk0TWFvdzkvdG1GUFd3WDNY?=
 =?utf-8?B?OHJWZmJENXpYQ2xpdDFqMkQ0V1c5Njg2NUNKdlNIMWhONXdJSnpPdi9vMFUr?=
 =?utf-8?B?OW9Kd3pKZ2oxYjNERFA1TVRjcUVQdG1Cb1dTTi9EUmIxeFdvelVsZ2FHSFM2?=
 =?utf-8?B?OXpMU1BjWXVYbUlwUDBEa3NqQmtJajJxSmJ0aXg1eG5BUXlLMEd2bi8xY0JG?=
 =?utf-8?B?VEdxYUJyQXd3eWdPb3VtdnBtTkFQMXA0b0p4OG1VTFNLaUpEK3BhT05MNlRo?=
 =?utf-8?B?ZjBHWFRUcStSTVBYVDRaeXR0TmMyNGpMVlRDaDRBWlAwMkUvTmlTazh5MkRR?=
 =?utf-8?B?N3FMNVhGNExvMGN0emRzN2xxWVBJZlo0S2ZJQTRWbE9rWGhOZTE3S3c0YUVN?=
 =?utf-8?B?UHdCdHBvbjZDeGMwMEJLZ1FaMHZKN3pzWjhPNHBGQkNSeVY3K1R6UkJnc2dq?=
 =?utf-8?B?dFp1S21lbFlxaHpxSThuUGQ3ZGZmTGlpKzM2WFp2eWwrbTdyVllaUENWOWN6?=
 =?utf-8?Q?dT54sfFBwYIzOmL03tLs/wt2h?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b13010-0920-4277-e0a7-08dbea73ca4a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 09:25:24.0111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bntwb92whbxzAPGZLpm2sFNl+K1ygsu1Ord+AOax38Ja/JB4JecGJ6m+A2vDrWRO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7477
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
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.11.23 um 09:49 schrieb Karolina Stolarek:
> Test initialization of ttm_resource using different memory domains.
> Add tests for a system memory manager and functions that can be
> tested without a fully-featured resource manager. Update
> ttm_bo_kunit_init() to initialize BO's kref and a genuine GEM drm
> object. Export ttm_resource_alloc for test purposes only.
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> Tested-by: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  22 +-
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   3 +
>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++++++++++++
>   drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
>   5 files changed, 363 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>
> diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
> index ec87c4fc1ad5..c92fe2052ef6 100644
> --- a/drivers/gpu/drm/ttm/tests/Makefile
> +++ b/drivers/gpu/drm/ttm/tests/Makefile
> @@ -3,4 +3,5 @@
>   obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>           ttm_device_test.o \
>           ttm_pool_test.o \
> +        ttm_resource_test.o \
>           ttm_kunit_helpers.o
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> index 81661d8827aa..779fbc038f17 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -29,19 +29,39 @@ struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
>   					    struct ttm_test_devices *devs,
>   					    size_t size)
>   {
> -	struct drm_gem_object gem_obj = { .size = size };
> +	struct drm_gem_object gem_obj = { };
>   	struct ttm_buffer_object *bo;
> +	int err;
>   
>   	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, bo);
>   
>   	bo->base = gem_obj;
> +	err = drm_gem_object_init(devs->drm, &bo->base, size);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
>   	bo->bdev = devs->ttm_dev;
> +	kref_init(&bo->kref);
>   
>   	return bo;
>   }
>   EXPORT_SYMBOL_GPL(ttm_bo_kunit_init);
>   
> +struct ttm_place *ttm_place_kunit_init(struct kunit *test,
> +				       uint32_t mem_type, uint32_t flags)
> +{
> +	struct ttm_place *place;
> +
> +	place = kunit_kzalloc(test, sizeof(*place), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, place);
> +
> +	place->mem_type = mem_type;
> +	place->flags = flags;
> +
> +	return place;
> +}
> +EXPORT_SYMBOL_GPL(ttm_place_kunit_init);
> +
>   struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test)
>   {
>   	struct ttm_test_devices *devs;
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> index e261e3660d0b..2f51c833a536 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> @@ -8,6 +8,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/ttm/ttm_device.h>
>   #include <drm/ttm/ttm_bo.h>
> +#include <drm/ttm/ttm_placement.h>
>   
>   #include <drm/drm_kunit_helpers.h>
>   #include <kunit/test.h>
> @@ -28,6 +29,8 @@ int ttm_device_kunit_init(struct ttm_test_devices *priv,
>   struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
>   					    struct ttm_test_devices *devs,
>   					    size_t size);
> +struct ttm_place *ttm_place_kunit_init(struct kunit *test,
> +				       uint32_t mem_type, uint32_t flags);
>   
>   struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test);
>   struct ttm_test_devices *ttm_test_devices_all(struct kunit *test);
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> new file mode 100644
> index 000000000000..029e1f094bb0
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> @@ -0,0 +1,335 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#include <drm/ttm/ttm_resource.h>
> +
> +#include "ttm_kunit_helpers.h"
> +
> +#define RES_SIZE		SZ_4K
> +#define TTM_PRIV_DUMMY_REG	(TTM_NUM_MEM_TYPES - 1)
> +
> +struct ttm_resource_test_case {
> +	const char *description;
> +	uint32_t mem_type;
> +	uint32_t flags;
> +};
> +
> +struct ttm_resource_test_priv {
> +	struct ttm_test_devices *devs;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +};
> +
> +static const struct ttm_resource_manager_func ttm_resource_manager_mock_funcs = { };
> +
> +static int ttm_resource_test_init(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv;
> +
> +	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	priv->devs = ttm_test_devices_all(test);
> +	KUNIT_ASSERT_NOT_NULL(test, priv->devs);
> +
> +	test->priv = priv;
> +
> +	return 0;
> +}
> +
> +static void ttm_resource_test_fini(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +
> +	ttm_test_devices_put(test, priv->devs);
> +}
> +
> +static void ttm_init_test_mocks(struct kunit *test,
> +				struct ttm_resource_test_priv *priv,
> +				uint32_t mem_type, uint32_t flags)
> +{
> +	size_t size = RES_SIZE;
> +
> +	/* Make sure we have what we need for a good BO mock */
> +	KUNIT_ASSERT_NOT_NULL(test, priv->devs->ttm_dev);
> +
> +	priv->bo = ttm_bo_kunit_init(test, priv->devs, size);
> +	priv->place = ttm_place_kunit_init(test, mem_type, flags);
> +}
> +
> +static void ttm_init_test_manager(struct kunit *test,
> +				  struct ttm_resource_test_priv *priv,
> +				  uint32_t mem_type)
> +{
> +	struct ttm_device *ttm_dev = priv->devs->ttm_dev;
> +	struct ttm_resource_manager *man;
> +	size_t size = SZ_16K;
> +
> +	man = kunit_kzalloc(test, sizeof(*man), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, man);
> +
> +	man->use_tt = false;
> +	man->func = &ttm_resource_manager_mock_funcs;
> +
> +	ttm_resource_manager_init(man, ttm_dev, size);
> +	ttm_set_driver_manager(ttm_dev, mem_type, man);
> +	ttm_resource_manager_set_used(man, true);
> +}
> +
> +static const struct ttm_resource_test_case ttm_resource_cases[] = {
> +	{
> +		.description = "Init resource in TTM_PL_SYSTEM",
> +		.mem_type = TTM_PL_SYSTEM,
> +	},
> +	{
> +		.description = "Init resource in TTM_PL_VRAM",
> +		.mem_type = TTM_PL_VRAM,
> +	},
> +	{
> +		.description = "Init resource in a private placement",
> +		.mem_type = TTM_PRIV_DUMMY_REG,
> +	},
> +	{
> +		.description = "Init resource in TTM_PL_SYSTEM, set placement flags",
> +		.mem_type = TTM_PL_SYSTEM,
> +		.flags = TTM_PL_FLAG_TOPDOWN,
> +	},
> +};
> +
> +static void ttm_resource_case_desc(const struct ttm_resource_test_case *t, char *desc)
> +{
> +	strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(ttm_resource, ttm_resource_cases, ttm_resource_case_desc);
> +
> +static void ttm_resource_init_basic(struct kunit *test)
> +{
> +	const struct ttm_resource_test_case *params = test->param_value;
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource *res;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_resource_manager *man;
> +	uint64_t expected_usage;
> +
> +	ttm_init_test_mocks(test, priv, params->mem_type, params->flags);
> +	bo = priv->bo;
> +	place = priv->place;
> +
> +	if (params->mem_type > TTM_PL_SYSTEM)
> +		ttm_init_test_manager(test, priv, params->mem_type);
> +
> +	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, res);
> +
> +	man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
> +	expected_usage = man->usage + RES_SIZE;
> +
> +	KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[bo->priority]));
> +
> +	ttm_resource_init(bo, place, res);
> +
> +	KUNIT_ASSERT_EQ(test, res->start, 0);
> +	KUNIT_ASSERT_EQ(test, res->size, RES_SIZE);
> +	KUNIT_ASSERT_EQ(test, res->mem_type, place->mem_type);
> +	KUNIT_ASSERT_EQ(test, res->placement, place->flags);
> +	KUNIT_ASSERT_PTR_EQ(test, res->bo, bo);
> +
> +	KUNIT_ASSERT_NULL(test, res->bus.addr);
> +	KUNIT_ASSERT_EQ(test, res->bus.offset, 0);
> +	KUNIT_ASSERT_FALSE(test, res->bus.is_iomem);
> +	KUNIT_ASSERT_EQ(test, res->bus.caching, ttm_cached);
> +	KUNIT_ASSERT_EQ(test, man->usage, expected_usage);
> +
> +	KUNIT_ASSERT_TRUE(test, list_is_singular(&man->lru[bo->priority]));
> +
> +	ttm_resource_fini(man, res);
> +}
> +
> +static void ttm_resource_init_pinned(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource *res;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_resource_manager *man;
> +
> +	ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, 0);
> +	bo = priv->bo;
> +	place = priv->place;
> +
> +	man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
> +
> +	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, res);
> +	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
> +
> +	dma_resv_lock(bo->base.resv, NULL);
> +	ttm_bo_pin(bo);
> +	ttm_resource_init(bo, place, res);
> +	KUNIT_ASSERT_TRUE(test, list_is_singular(&bo->bdev->pinned));
> +
> +	ttm_bo_unpin(bo);
> +	ttm_resource_fini(man, res);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
> +}
> +
> +static void ttm_resource_fini_basic(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource *res;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_resource_manager *man;
> +
> +	ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, 0);
> +	bo = priv->bo;
> +	place = priv->place;
> +
> +	man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
> +
> +	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, res);
> +
> +	ttm_resource_init(bo, place, res);
> +	ttm_resource_fini(man, res);
> +
> +	KUNIT_ASSERT_TRUE(test, list_empty(&res->lru));
> +	KUNIT_ASSERT_EQ(test, man->usage, 0);
> +}
> +
> +static void ttm_resource_manager_init_basic(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource_manager *man;
> +	size_t size = SZ_16K;
> +
> +	man = kunit_kzalloc(test, sizeof(*man), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, man);
> +
> +	ttm_resource_manager_init(man, priv->devs->ttm_dev, size);
> +
> +	KUNIT_ASSERT_PTR_EQ(test, man->bdev, priv->devs->ttm_dev);
> +	KUNIT_ASSERT_EQ(test, man->size, size);
> +	KUNIT_ASSERT_EQ(test, man->usage, 0);
> +	KUNIT_ASSERT_NULL(test, man->move);
> +	KUNIT_ASSERT_NOT_NULL(test, &man->move_lock);
> +
> +	for (int i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
> +		KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[i]));
> +}
> +
> +static void ttm_resource_manager_usage_basic(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource *res;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_resource_manager *man;
> +	uint64_t actual_usage;
> +
> +	ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, TTM_PL_FLAG_TOPDOWN);
> +	bo = priv->bo;
> +	place = priv->place;
> +
> +	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, res);
> +
> +	man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
> +
> +	ttm_resource_init(bo, place, res);
> +	actual_usage = ttm_resource_manager_usage(man);
> +
> +	KUNIT_ASSERT_EQ(test, actual_usage, RES_SIZE);
> +
> +	ttm_resource_fini(man, res);
> +}
> +
> +static void ttm_resource_manager_set_used_basic(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource_manager *man;
> +
> +	man = ttm_manager_type(priv->devs->ttm_dev, TTM_PL_SYSTEM);
> +	KUNIT_ASSERT_TRUE(test, man->use_type);
> +
> +	ttm_resource_manager_set_used(man, false);
> +	KUNIT_ASSERT_FALSE(test, man->use_type);
> +}
> +
> +static void ttm_sys_man_alloc_basic(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource_manager *man;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_resource *res;
> +	uint32_t mem_type = TTM_PL_SYSTEM;
> +	int ret;
> +
> +	ttm_init_test_mocks(test, priv, mem_type, 0);
> +	bo = priv->bo;
> +	place = priv->place;
> +
> +	man = ttm_manager_type(priv->devs->ttm_dev, mem_type);
> +	ret = man->func->alloc(man, bo, place, &res);
> +
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	KUNIT_ASSERT_EQ(test, res->size, RES_SIZE);
> +	KUNIT_ASSERT_EQ(test, res->mem_type, mem_type);
> +	KUNIT_ASSERT_PTR_EQ(test, res->bo, bo);
> +
> +	ttm_resource_fini(man, res);
> +}
> +
> +static void ttm_sys_man_free_basic(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource_manager *man;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_resource *res;
> +	uint32_t mem_type = TTM_PL_SYSTEM;
> +
> +	ttm_init_test_mocks(test, priv, mem_type, 0);
> +	bo = priv->bo;
> +	place = priv->place;
> +
> +	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, res);
> +
> +	ttm_resource_alloc(bo, place, &res);
> +
> +	man = ttm_manager_type(priv->devs->ttm_dev, mem_type);
> +	man->func->free(man, res);
> +
> +	KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[bo->priority]));
> +	KUNIT_ASSERT_EQ(test, man->usage, 0);
> +}
> +
> +static struct kunit_case ttm_resource_test_cases[] = {
> +	KUNIT_CASE_PARAM(ttm_resource_init_basic, ttm_resource_gen_params),
> +	KUNIT_CASE(ttm_resource_init_pinned),
> +	KUNIT_CASE(ttm_resource_fini_basic),
> +	KUNIT_CASE(ttm_resource_manager_init_basic),
> +	KUNIT_CASE(ttm_resource_manager_usage_basic),
> +	KUNIT_CASE(ttm_resource_manager_set_used_basic),
> +	KUNIT_CASE(ttm_sys_man_alloc_basic),
> +	KUNIT_CASE(ttm_sys_man_free_basic),
> +	{}
> +};
> +
> +static struct kunit_suite ttm_resource_test_suite = {
> +	.name = "ttm_resource",
> +	.init = ttm_resource_test_init,
> +	.exit = ttm_resource_test_fini,
> +	.test_cases = ttm_resource_test_cases,
> +};
> +
> +kunit_test_suites(&ttm_resource_test_suite);
> +
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 46ff9c75bb12..02b96d23fdb9 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -30,6 +30,8 @@
>   #include <drm/ttm/ttm_placement.h>
>   #include <drm/ttm/ttm_resource.h>
>   
> +#include <drm/drm_util.h>
> +
>   /**
>    * ttm_lru_bulk_move_init - initialize a bulk move structure
>    * @bulk: the structure to init
> @@ -240,6 +242,7 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
>   	spin_unlock(&bo->bdev->lru_lock);
>   	return 0;
>   }
> +EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_resource_alloc);
>   
>   void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
>   {

