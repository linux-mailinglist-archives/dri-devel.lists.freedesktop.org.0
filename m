Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2033B387810
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 13:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0018B6E876;
	Tue, 18 May 2021 11:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02306E876;
 Tue, 18 May 2021 11:51:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAQHK059RIbbfYjIT1eVcYjjQBnsUSuNwfsvHipR0fg28ZMPKkmrgdLeLAgL3FrpMKJp1Gtrg+TrDeemLcHeevp2T0X6UPfZkGa9S4hd+oxE90G/6c/H9EVWOKMt4O0A/zz1VFjmhGq4ZylzgoAmhGeAIml2XvVLQfdpP8i0VCa/yyhu/I30q3zqP+SwrVMOvSWQ9mdNDc9/D6pGNAtC04vtbVZH8K/xoOeNDh3nhWOVWTtAknKCxce61j2RYJnD25uFV+LBFW/l7KHyaMVl6onanYptr6OtR/0shWeZHEXKrOmwx7yL24veXlhAFp9qZ7A5hXlH9dyY/Pkm30D6mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prJOK/AqPH9+opNJx9xqu0eQd6aYBjajUhu4+FDaQ6w=;
 b=IdoK+Fx+E/g0Gq5TKgxhRmGQXYlOaeeGV28JPf8Pkt7Z3vjE/ovoeJhxtMGIt9NHEeM2P1DvPrHMGDLProsn2sftvL+LDs+CHQbCKtxXnc4T4IoB60FONOgRHz1ZFamofbfzkWFFsGoiWvuWUqKLcvZ415+/vDuE4eUh5i5w0iBTbiNx9Lt5UzanNx/irnIrkAkCjYyvD7hWo0Y5cg0t+sEGSJsQfNLXRW+KZvq51voRtLmc0IG3SE1YljIb0/xI/3s4mbHMVYO0rnjBNAnKQAU6tWjzDGYbMJEvHEeTdGvwHCDtL1TV6jUn6ASEidfGDTnxUo7JB2TCisxg0lbvBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prJOK/AqPH9+opNJx9xqu0eQd6aYBjajUhu4+FDaQ6w=;
 b=buW9uyQrPptASyTvdUIInUZF1MnXb5fYMSdQTWA5jWQ5EbGeOW1W1LxKltnQnBEoapo8kv/i2XPyb5QugJgUeD644t1/ZaRqce2soTyhC4rRynVOej8tYPCGFjWploPLOpYhHgdvgcL7jkYeGdHgs5zYpOEDHTroEySxWjDNEbA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4639.namprd12.prod.outlook.com (2603:10b6:208:a4::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 11:51:21 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 11:51:21 +0000
Subject: Re: [PATCH v2 04/15] drm/ttm: Export functions to initialize and
 finalize the ttm range manager standalone
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-5-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3feacf02-0854-68d4-f26b-88ed0528e9ff@amd.com>
Date: Tue, 18 May 2021 13:51:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210518082701.997251-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8470:36a5:2010:f0c4]
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8470:36a5:2010:f0c4]
 (2a02:908:1252:fb60:8470:36a5:2010:f0c4) by
 FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.11 via Frontend Transport; Tue, 18 May 2021 11:51:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7febe21e-7a4d-4543-0609-08d919f3410e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4639:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4639436C3F7F52E5C356F20F832C9@MN2PR12MB4639.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P7VqeOBKi0aeCxdtJdBX0ehy3nO7hJaFXNQGBkH4/eO7caogLIuZZjmYCBesDS5Npcl+Kly/ukcD+tje5YjQOz/+bHb/mBqlsQfnYULOmS0lE323o5ZtYb8WTsSrj/USK2H5dJTp21Jvc7JEXfkhkfgz8jBtdEnjZgtDKsLbQfRqaRg9zhMcqKD5vxfr+4Mlsbnl6k3K6TNfH7Ir5KHQ/M5GMgh19zT/tkxxjNDYjqzOKI3yBKQCf7SAtCNVeETBsXUtuYSd+I3hDzmnA3qVMxwr9qDBivIx4tLLOFTbH3T/lpZEhQlAr7ccG0KmrVBKIe0Tics02hG5PgU8z0YCZCQK07s8+sZY3ibiF7BIVkVVMXZapUxiUIUUbilofnu6NaYZbxUYlHyoIYWVw0ior9sTxVEllWslsQXYr8MVsDnEu75DyEB06leAXLdQDIJdQFfqSRR/RKWuVPjRug/Kq3vYQnqSl8RbRWtx4tc5+HCepTTu65V3DI+0GaZFZbUKB69Pv9GUA6sst+XNTgiua5RqvXnazoj/lyXzEUuoX2wtLKUeXt1qMlGDe8xtjhOYzu5QN2zOFuxXrOdJiJHeusLfnfoUt7n1uPRfDQWlinkRfcbbyKUuPhj4KHDbXdrack3TfSOzz/kxEPd9hx3CzP6xusXl+cLGtZEpNF+WqmiJdUw1fqJPHUR+PH/5wMNk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(136003)(366004)(346002)(396003)(6486002)(6666004)(38100700002)(66946007)(86362001)(478600001)(83380400001)(66574015)(31686004)(5660300002)(316002)(8936002)(2616005)(52116002)(16526019)(66476007)(186003)(36756003)(31696002)(66556008)(8676002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VFNEUGhaOVNNRk1DL3J4djV1VmJQMzRaQ0N3b3JqTk1oejhvZ0RKc3Z4K3RJ?=
 =?utf-8?B?NG85VHhjTDljOEZMeWlrMFVxZmY0SU0vVFBqNHJCS3U3Y3dPRDRSa1FQcy8v?=
 =?utf-8?B?cW5CMTVsZzZnVEFySkVLTkFuNE9kT0w5VXdPTTdmMEdXbERUcElYWWsraGNa?=
 =?utf-8?B?VmgrMVNXRjZ0eEJGZjFmM0tpQ2JhazhCVjVRUXhuU05qOFZXNTFMWjg5eXhm?=
 =?utf-8?B?b3BZRHViODhSMUU2dDZGak1JdDdXaHN6ZHFGeUUrbXZHK256bE9BZG0xSUo0?=
 =?utf-8?B?ZmN6enN2dll6d3ZnVXgvV0Y5b2xnNTYzdGU2SEF2K0RJajJyWloyalhUbEVq?=
 =?utf-8?B?bmhGR2tPQ1MvSjUvMmVLNm1jMFdZRkxvRmpRK3pXVmxDL0hMdG05RU5XNzNr?=
 =?utf-8?B?V1BZU0ZzTldOVGpJSU1ORXV6TnRQWHEwa1JtNktZbHNWYlVuek9PVUM0bmlD?=
 =?utf-8?B?WTBaNnNPdjJ0dm5kbEhKckNNa1FXMndlcTA1ZStaMGtDZ05BNUlISlV5ekJN?=
 =?utf-8?B?ZndpZHptVlB4dUhpVnRxQjNaWHNYYWFUYkdxUjVtaCtXd284WGtyZlI3a3B1?=
 =?utf-8?B?L2JCNVp4SEl4Mnk1WlU1b3JFdmF4N0pSVHJZaWptZzNvbmFKM05wenMybFlR?=
 =?utf-8?B?eWp4VXBaV014dm8wQjBYdUV5dW0wOGVWazRSQ1I2QVRyRVNnbm53N0RYcDdE?=
 =?utf-8?B?ZklaeXZiRytuNlVxZnlXdmloaGxVaFlvSFMwQkdXTW02MmRqZmRhTUZPZEZD?=
 =?utf-8?B?WFVNdEg0UWN4YUw5S0wvb3VOSUZHeDYzemZXYWlWRHovbnpncFZnQ25wRWRa?=
 =?utf-8?B?WnhEeHE3MEdIWFZvNmdxWGdDalAzWFlxYUlDVXpja1NtcG5iOGtpS29wQUhu?=
 =?utf-8?B?S2NxVngzU1djemV6d1cyQXVUTDRocGU2QWRCT2JXOTlFNS9pL0lScWZGRXpJ?=
 =?utf-8?B?T1pSTmExb25ka0tUTWtWSzM4aFBkaTVmQzFUUWxUaDU1UFdLb21wL0pmM0x5?=
 =?utf-8?B?OXRlWUUxT0tSaXpPZGhudFQrMW9OaTdGYmh0K2k0Z2JwYWZDenUwSEt4N09z?=
 =?utf-8?B?SzI5UGtJdmlIYXNGdU96U3U1WWZXK2xGbHIrakthMTJVUnNleGcydzlycGRi?=
 =?utf-8?B?bzhoOHRsalE4eGdicWtyRUtaS20zb1F2QVpnVzRQYVU1SnhyL2VFaEdNU0Qx?=
 =?utf-8?B?NWZ4U0FLcEpVU0NIUy9uSE56THVKZmRUemgzc0pTK0Rkd3pWZWxCdnBabnBR?=
 =?utf-8?B?TVJwaG15SCtOdCtsZHpMODQ1Q1NadnFGUW9HSFVKaEFMUHRtT1ZCdzI1Z2Qz?=
 =?utf-8?B?VEZUL0ZmRlJnWGNoL2FvTDNYUWdnakllSnA3b2ROM1o3cWdMeHJIcVZEZDhl?=
 =?utf-8?B?V3l2aWIyMU5BRGZ1dUN3dHl2UE81M200SWNuTnZVb2VxenVkQ1BzMEhvblNR?=
 =?utf-8?B?MW9lSnFEbU1yZ3J6YXJNVCtLUGRwQWZVcTl1N21WVk5sNkFzQnBCeUFzbkcx?=
 =?utf-8?B?ZGhDYnphSGJTTjJVVWdDakk4Yy9vWHRhOTRHZFNwZkJvVEFmVm4xNHMrUm96?=
 =?utf-8?B?OVMrR0lYdmdDbUp5djVPZFBXemV6azBuY0VBWEpwa2JEbEpoRUpsMFVSYytZ?=
 =?utf-8?B?RkRmL1RRODRPNkRsdG50V2pTb1NrNTJHalB0OFZqR3plcW9TNlZ2ck04S0dG?=
 =?utf-8?B?REY1V0o4eHRJRVhBdVplaWRzdDJMUzdXajdEQmI1dGExTWswTEtVdEd3OTZ1?=
 =?utf-8?B?WlgyeXZJaEo2V0I1OTk0OUtyNm9LQVdFZXV6QnUvZkRXUWRTZnhaQ05DZG5w?=
 =?utf-8?B?SE9KaXJHdXhLS0dlSWZ3bWpwa0gxalR3NFBZRGNPaEpNeGdUVnJYeGJQM0RR?=
 =?utf-8?Q?+FPiJLY+4+kPI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7febe21e-7a4d-4543-0609-08d919f3410e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 11:51:21.1439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0WJ1Iir8T5tBkrwtvmpYElUBEKYLSjAuOUKuGp5MmoHV3YxLBGJC9xj8oGBHkBvH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4639
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

Am 18.05.21 um 10:26 schrieb Thomas Hellström:
> i915 mock selftests are run without the device set up. In order to be able
> to run the region related mock selftests, export functions in order for the
> TTM range manager to be set up without a device to attach it to.

 From the code it looks good, but to be honest I don't think that this 
makes much sense from the organizational point of view.

If a self test exercises internals of TTM it should be moved into TTM as 
well.

Christian.

>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_range_manager.c | 55 +++++++++++++++++--------
>   include/drm/ttm/ttm_bo_driver.h         | 23 +++++++++++
>   2 files changed, 61 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index b9d5da6e6a81..6957dfb0cf5a 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -125,55 +125,76 @@ static const struct ttm_resource_manager_func ttm_range_manager_func = {
>   	.debug = ttm_range_man_debug
>   };
>   
> -int ttm_range_man_init(struct ttm_device *bdev,
> -		       unsigned type, bool use_tt,
> -		       unsigned long p_size)
> +struct ttm_resource_manager *
> +ttm_range_man_init_standalone(unsigned long size, bool use_tt)
>   {
>   	struct ttm_resource_manager *man;
>   	struct ttm_range_manager *rman;
>   
>   	rman = kzalloc(sizeof(*rman), GFP_KERNEL);
>   	if (!rman)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>   
>   	man = &rman->manager;
>   	man->use_tt = use_tt;
>   
>   	man->func = &ttm_range_manager_func;
>   
> -	ttm_resource_manager_init(man, p_size);
> +	ttm_resource_manager_init(man, size);
>   
> -	drm_mm_init(&rman->mm, 0, p_size);
> +	drm_mm_init(&rman->mm, 0, size);
>   	spin_lock_init(&rman->lock);
>   
> -	ttm_set_driver_manager(bdev, type, &rman->manager);
> +	return man;
> +}
> +EXPORT_SYMBOL(ttm_range_man_init_standalone);
> +
> +int ttm_range_man_init(struct ttm_device *bdev,
> +		       unsigned int type, bool use_tt,
> +		       unsigned long p_size)
> +{
> +	struct ttm_resource_manager *man;
> +
> +	man = ttm_range_man_init_standalone(p_size, use_tt);
> +	if (IS_ERR(man))
> +		return PTR_ERR(man);
> +
>   	ttm_resource_manager_set_used(man, true);
> +	ttm_set_driver_manager(bdev, type, man);
> +
>   	return 0;
>   }
>   EXPORT_SYMBOL(ttm_range_man_init);
>   
> +void ttm_range_man_fini_standalone(struct ttm_resource_manager *man)
> +{
> +	struct ttm_range_manager *rman = to_range_manager(man);
> +	struct drm_mm *mm = &rman->mm;
> +
> +	spin_lock(&rman->lock);
> +	drm_mm_clean(mm);
> +	drm_mm_takedown(mm);
> +	spin_unlock(&rman->lock);
> +
> +	ttm_resource_manager_cleanup(man);
> +	kfree(rman);
> +}
> +EXPORT_SYMBOL(ttm_range_man_fini_standalone);
> +
>   int ttm_range_man_fini(struct ttm_device *bdev,
>   		       unsigned type)
>   {
>   	struct ttm_resource_manager *man = ttm_manager_type(bdev, type);
> -	struct ttm_range_manager *rman = to_range_manager(man);
> -	struct drm_mm *mm = &rman->mm;
>   	int ret;
>   
>   	ttm_resource_manager_set_used(man, false);
> -
>   	ret = ttm_resource_manager_evict_all(bdev, man);
>   	if (ret)
>   		return ret;
>   
> -	spin_lock(&rman->lock);
> -	drm_mm_clean(mm);
> -	drm_mm_takedown(mm);
> -	spin_unlock(&rman->lock);
> -
> -	ttm_resource_manager_cleanup(man);
>   	ttm_set_driver_manager(bdev, type, NULL);
> -	kfree(rman);
> +	ttm_range_man_fini_standalone(man);
> +
>   	return 0;
>   }
>   EXPORT_SYMBOL(ttm_range_man_fini);
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index dbccac957f8f..734b1712ea72 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -321,6 +321,20 @@ int ttm_range_man_init(struct ttm_device *bdev,
>   		       unsigned type, bool use_tt,
>   		       unsigned long p_size);
>   
> +/**
> + * ttm_range_man_init_standalone - Initialize a ttm range manager without
> + * device interaction.
> + * @size: Size of the area to be managed in pages.
> + * @use_tt: The memory type requires tt backing.
> + *
> + * This function is intended for selftests. It initializes a range manager
> + * without any device interaction.
> + *
> + * Return: pointer to a range manager on success. Error pointer on failure.
> + */
> +struct ttm_resource_manager *
> +ttm_range_man_init_standalone(unsigned long size, bool use_tt);
> +
>   /**
>    * ttm_range_man_fini
>    *
> @@ -332,4 +346,13 @@ int ttm_range_man_init(struct ttm_device *bdev,
>   int ttm_range_man_fini(struct ttm_device *bdev,
>   		       unsigned type);
>   
> +/**
> + * ttm_range_man_fini_standalone
> + * @man: The range manager
> + *
> + * Tear down a range manager initialized with
> + * ttm_range_manager_init_standalone().
> + */
> +void ttm_range_man_fini_standalone(struct ttm_resource_manager *man);
> +
>   #endif

