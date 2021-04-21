Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA4C366CEB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 15:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F1B6E1F4;
	Wed, 21 Apr 2021 13:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744636E1EE
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 13:34:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjvfN3xjRqhp8Ma/UD/LXRc8n5wAbB8PtGJY62FtJsbN/WFNksi7cUYpQyFpppJXLWJqtAjYgqYrp3XZHaZQ23gKpfhEU4cQQCr+jOL17tFTFDQARg8q5s0XiISzn+DAJRxBTPVXHUTOxMOaSIvqFXokg6mGZoBVTePJ70NKU8zQyLWys9ZzAMalE1PPqNGXYweXmDGMoIQ1Dr7ByxU17YwykgNrG2+33TPfUhvkSuEp2awvOs3cmWVpb1SySg4w4AzV2/7+oUmyc2LE4PH9p134t1RlrwH/6vBKsy1LGDXMI7dLySkd0lqZeuBhrVwwE52n+Q0cLzgf3klGZWlFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLlZ5SQTw1Rv0kh4GXzB9HMBbpC7Z+SfYPYve5kjAew=;
 b=d7z/vSnLHpkK3Ez1cToIaEcK7Brdb4VvheiMxEYucbtpSSA6V9TADCI34j8BAlcPgfuHB0Sm9d45bJxF4inpTO0HnWc0pOkwdCMRoWuKMBtRPZjoCGoILQjXWn9D9aLDEgSDCHpPiOcXaZaEXbEzChY3jROjV72tQUnkHYEVLj5udCaHbrlBbC+a+DktX+2s3SAibm3MahCTzRDmXnQ3ap2ge8fTqgqFIlYy0MoZtmtf/Qd3PGnE+UJL0iammlCevN2XZ5CMSWRx062DZl42Sya5/BJ3JLPVpQyuqo2yS+tRcVjRl/UlxFLRBcpjEMxENNfKIWen0FVK1Mvz4WrB0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLlZ5SQTw1Rv0kh4GXzB9HMBbpC7Z+SfYPYve5kjAew=;
 b=hBPKkiaC9HrUDi/w/53W41yXUc49VGZnmdVmW7ggx4oBF1xb+vIg7fbu2nHL/zIcECWiw3TZOYsDnztk2bwI0kLiN0XA3ptWmFmkR4dF4S3wYdOOyicP5b8nnOmDUka23O+uKI+q1b973NgcnXK13+OENmbd4vWcKmKywMofVBs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4334.namprd12.prod.outlook.com (2603:10b6:208:1d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 21 Apr
 2021 13:34:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 13:34:06 +0000
Subject: Re: [PATCH] drm/ttm: fix error handling if no BO can be swapped out
To: Shiwu Zhang <shiwu.zhang@amd.com>, dri-devel@lists.freedesktop.org
References: <20210420143257.13865-1-shiwu.zhang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <91c93764-119a-3ffa-a38d-2b2202fdaa51@amd.com>
Date: Wed, 21 Apr 2021 15:34:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210420143257.13865-1-shiwu.zhang@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:30c1:a1b7:433d:2c5d]
X-ClientProxiedBy: PR3P189CA0019.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:30c1:a1b7:433d:2c5d]
 (2a02:908:1252:fb60:30c1:a1b7:433d:2c5d) by
 PR3P189CA0019.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20 via Frontend Transport; Wed, 21 Apr 2021 13:34:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dd2fd03-9d2d-48bb-27a4-08d904ca22bd
X-MS-TrafficTypeDiagnostic: MN2PR12MB4334:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB433438F4B5244EACD7C4E17083479@MN2PR12MB4334.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kwlB9riyqd4cPWudKNghXVsJJK1u4gcpT+ZWpEPj74euUu3NXTVpH9gAU5knJ0XdJ0neph3zH5KLtl4Jgh2wNEXLye4siyrkJIbmNeDXjwaDLCDeoc8qR95sUkkxlE7+3ZB0na/TwZKkqflTOMQUflLzD+f3wDnQuwo0MpH25GkYgcv0qoRO4BA/lZ1sMCBE7RErYwVXZq0R8qqR+/7KqDjplrc5IZZjSlbc5+feCgBGIQnZvsTdIRcJfAAL14wTb3pExN/UTrajT1WoQZuug2oT7SXeQ6bU2q/Suv3MAVaHwzVEsbtEVUIa5TR1ZX2NSuI0J4WOjvqExxz+7+JSLE6/hiiW28tckj3i6Q4bbKK+ya7RZrM4MeAeAL0wp3LoX3bogZoE4cDcKkosZ2htn1SDM+vAv0HjGrPXjEcdYrS/Ixre7akfAPbc7AuyvhqGmvj404Gx0NJfB6YPVrQmQ7obl7Q8v6nSigXxN2IT/tVO12t7w3AONopYEDkZ23drhWv1//okDxVJWKbiXfF8l9bngShCOXPqS/K3SQSi9QHSO1jv413GWX2huHFk2mm1tgg+DqwywKHJsClplc5ovzQ+ERpLXDg/iAngl6Az65083h3n6quyTOpXP6vjrusPbJQ3QNUa9RVgR40yt1FJZqIuWaApFhsXvjxBWi7rkFsFdupQlSJOohfL8laLmto5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39840400004)(366004)(136003)(376002)(66946007)(5660300002)(8676002)(316002)(66556008)(2616005)(478600001)(31696002)(52116002)(83380400001)(86362001)(6486002)(66476007)(6666004)(186003)(16526019)(38100700002)(2906002)(8936002)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QmNEdEJUaERqR1VoY3psYVZlQlV0TUtXRDZxa3lBWmRMTDlvZVFXNUNjbkpH?=
 =?utf-8?B?aTF2MFpCVGRXSXUxVTdyNVg4czViRUFtVWx0WmpGdk0yZVBxbU1yT3NldG5G?=
 =?utf-8?B?VUV1MXliUFo4UEcwMS9ReGFzRUwvZUxJQnN1RWR1dU1nU09FWlMwb1ZTNkdx?=
 =?utf-8?B?MitydHl3bWlpeFBVeU92RGdOM0prRFo5eWllWjVWMUlDOS91VnZtcHVaYzdS?=
 =?utf-8?B?TW1RNzBSTW1Zd3lheUNmTFgvSVlENTBHRURGRTAyTXlLUDBhZWV0bERTSjV5?=
 =?utf-8?B?cVZ4cHFJbWM2RHNxNmZ6TG5ZY0RobWhhL3IzWFowb1M1NExCY1FVREJ2WDhM?=
 =?utf-8?B?cnR0L3dXOWlpMzFKU0hVdXJuU21sbUNrZVhhNG4yQ1VRZFk2djVjbHFHek1s?=
 =?utf-8?B?c2FzVEg0ekxJRXlLMDZFOEJEWURIbHVUMXVFMVdBZjgxSEJWTGk2djZydzZP?=
 =?utf-8?B?aE1OaTVlZEVmUkRVcG1BUGtMbkI0ZDkxNVpxTXFsMVNBcmdsdVpXaWl1Zm5k?=
 =?utf-8?B?Z01ZUTB5eTB6OWRTcXVhaFZzd1F6M3Y2MW1XeUtEZWg1MDVpRU5Mb3hyeExQ?=
 =?utf-8?B?K1pxZWQ2RFpWQmVHNDkwekhQV3h5U3I5dlV1Rk5qaFJNTkdOcEJhbFF1K0Y5?=
 =?utf-8?B?ekxGQ2Z4cXVYOVY0V0dsRWNFNG9CZDlQMTNLd0dpenlSbGdRSjVUbEFHNlha?=
 =?utf-8?B?YmRiVmMrZTl1VFlqREVKNVMzd05wRHpzS09vV2VBVkNQdEE3VE5nZHVHVzVL?=
 =?utf-8?B?UTJlVitiZlR3bW9CNTJlY3BONHcwTCsveFNuWE9NQVVRYWZ5MTJDNkhGTUFv?=
 =?utf-8?B?SEZVdHpINDRwYnovME9QK1JRNXZjbU5ZSUVZNm9hUHlESnA4MHFxMHBnQkVH?=
 =?utf-8?B?ZGY2aSsyZVpGRnRaOHB2QmdNQWMrbklBdmYweEJpcGZYSkp0Z25vdldTdzA3?=
 =?utf-8?B?UXJkKzNRN3hxVGZ2Y0l2em5HY29VTXgybnRjYjNXNFpzWVJoVmsycEV2SE43?=
 =?utf-8?B?c0taMGJUd2p6ZVFOcVovemtkUERnM2ZQZlhuK3FPNjE3U0h2Z2g3M2dIeHoy?=
 =?utf-8?B?Smc3WVJZeldlcTUzRllNM1c5cklRM041TUVYem1rVllCZUxxdmlBaEpZTHI0?=
 =?utf-8?B?MjVidkZJdU55bDdxUlpzdW0rOC83SDFoay9BaXNwR01ELzB4V09tb0ZyTkFi?=
 =?utf-8?B?ZHgwWDI1M2JtWEVpR1prWEwzcHNWNk41RE9lK0tGMEpqNVQ0TlMrSXBTOGFk?=
 =?utf-8?B?M3lBVEpOeTFFZ1ppZ0NKMzlPcjRkcEltc0x4V2JteHY2d25Samt0ZDQyaEFt?=
 =?utf-8?B?eWN6dXB2ejRmdkN1MFdPdE5rZmtSclR2UnI1UUtNNWQ5bm1rQ3g1SHNhdUtt?=
 =?utf-8?B?eitOUVVKNDJEdlJmbm10QkhVVEk4MlU4WFh2c2h4aGtjWEs1aTR4cVlJQUdt?=
 =?utf-8?B?b2lxd1JML2djSnB4b2xONWdhTHl1UWpmSVgrSFpzMjRackFPWkN2aEtETHdu?=
 =?utf-8?B?WkIwOFF1OEhreGs5OFA0OVNDZjY5by9FcWd5MUtLbFZROWs5eXhDZkRUMFBa?=
 =?utf-8?B?Mll2NmtTNkJTVlBWZHhMSXFPbTQwWlEycUVxeEp1Qk4zOGh3b1Fhckx3VkY0?=
 =?utf-8?B?bnE3MUZDM2hEblZLOFZVSWRrY3plRXdIVHAwK0NXT25TVHRjVnRyaEhSaFFa?=
 =?utf-8?B?N21Zb216ZjhQanVtMGhVOU1nc1I4ajdsTFR2bUE2V01Gb1RQL0J1YnZ6Vk9j?=
 =?utf-8?B?ajIyN3RObHc5Y0wvaG1jMHJKZVpvMTQzQ2x1LzRhak9kdVpqZW81SkN1R2Ix?=
 =?utf-8?B?RWFBMWVvUklRMnZaWDYvSlVINDErN0dpWUlGR3ZqamUrS25zSEJPenFUQlQ4?=
 =?utf-8?Q?tu2vNS2JEKiJH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd2fd03-9d2d-48bb-27a4-08d904ca22bd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 13:34:06.6750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBLPhEb9URIgFAfC1f5DC/4vJ0F1/BYQNn1QNNnGb25Fv+7jY4wjZyfvo+hCqMkt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4334
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 20.04.21 um 16:32 schrieb Shiwu Zhang:
> In case that all pre-allocated BOs are busy, just continue to populate
> BOs since likely half of system memory in total is still free.
>
> Signed-off-by: Shiwu Zhang <shiwu.zhang@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 4 ++--
>   drivers/gpu/drm/ttm/ttm_tt.c     | 2 ++
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 1f2024164d72..0200709db9be 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -133,7 +133,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   	struct ttm_resource_manager *man;
>   	struct ttm_buffer_object *bo;
>   	unsigned i, j;
> -	int ret;
> +	int ret=-EBUSY;
>   
>   	spin_lock(&bdev->lru_lock);
>   	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
> @@ -161,7 +161,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   		}
>   	}
>   	spin_unlock(&bdev->lru_lock);
> -	return 0;
> +	return ret;

The function should return the number of pages swapped out. Returning 0 
here is already perfectly ok.

>   }
>   EXPORT_SYMBOL(ttm_device_swapout);
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 48c407cff112..4e1e06a04428 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -329,6 +329,8 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	       ttm_dma32_pages_limit) {
>   
>   		ret = ttm_global_swapout(ctx, GFP_KERNEL);
> +		if (ret == -EBUSY)
> +			break;
>   		if (ret < 0)
>   			goto error;

Here we should just have a check for ret == 0 instead of testing for -EBUSY.

Regards,
Christian.

>   	}

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
