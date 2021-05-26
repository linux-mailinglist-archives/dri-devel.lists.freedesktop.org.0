Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 829E5391A3E
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 16:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B718E6ED99;
	Wed, 26 May 2021 14:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD936ED92;
 Wed, 26 May 2021 14:32:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANYSkl6tPyTOBSHCrYUpe+g2CmW/EheA4lkXWMJdp/vjlhHgRBcwCaUi0a+AxiCeTTppbyZvSAJJOQn/f6xJcXmk8vMY/FIBHP03cNv7fiMM3bp/jflp+dTVS37sG9qtqQobM22KaQTmEzn+KwkLwk3hwqYHPMZB040Mikswk41oRkj6kVTTz76lT6CJycBDpNRGOxB1sOCewKpSR7p8scUksmaSQ/ZpEur+/dMJ7y4L/fqreb1mAmLcis8ezJ28zoHtyrOnrDsOjKpywgVmq09LqKHuoaouMq/JeYi0iZoAIM9RZbPENu62bFTeZSfuub36CyLtHyx5UCRVPytpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgzQrxtJG8YpLt3WljFj71TF9WqJ8ei2UNw66dJ1fb4=;
 b=EERXPiBrXAbH+xG9Ru8c5AxvXbyoAtD3HGbVKP0Nux5nm5ZoROb45GH9sEBENXvn7mgBsz/cfTFbsMkWvZKjoewLTCFz11P1vdNNuHz38gfzDgo2xuOKByYii2hqD8INtUSreXXEbCgAywyZ/QNt0g7mtliFcTLYDsZGuDBiQaBYWIvxCHKwHysT2AdV8P3HPzZtkU2E4qaIIqoRG1CfxK6hU4VsIUBWCUp8JfNgaIvKhK7dG5QdEQYZiVm4MPZCLWcjRV1S3CiLep5ODevsroNtEWg8Qmu6Ph3OXmX9DYHnZcLsHHBAuS9PCgrd+r0A8NALe3LUlHP/ayXuzd3UcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgzQrxtJG8YpLt3WljFj71TF9WqJ8ei2UNw66dJ1fb4=;
 b=N0QBA5gKzvmJNOuTAwI0uPnq5m5/6LcTA5PdIDLeUQoR7ff32C5kAREUK/nAVfRGn7LNWTA+eCLM+2wkudRy+4jBqFcGNae+tFkJsLbZYHMbc1rDCH46irCit+b8FjR5IRO7g4/UcRVXCm5gqhgqm6g6YFAP2FKyGuAjERlnE2s=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4301.namprd12.prod.outlook.com (2603:10b6:208:1d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Wed, 26 May
 2021 14:32:56 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 14:32:56 +0000
Subject: Re: [PATCH v4 09/15] drm/ttm: Document and optimize
 ttm_bo_pipeline_gutting()
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210526113259.1661914-1-thomas.hellstrom@linux.intel.com>
 <20210526113259.1661914-10-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e0fe6261-1c9c-f90a-7aba-074c0ca32c6a@amd.com>
Date: Wed, 26 May 2021 16:32:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210526113259.1661914-10-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:1950:35e:cae9:5bed]
X-ClientProxiedBy: AM4PR0501CA0050.eurprd05.prod.outlook.com
 (2603:10a6:200:68::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:1950:35e:cae9:5bed]
 (2a02:908:1252:fb60:1950:35e:cae9:5bed) by
 AM4PR0501CA0050.eurprd05.prod.outlook.com (2603:10a6:200:68::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26 via Frontend
 Transport; Wed, 26 May 2021 14:32:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5853df75-c155-4b9c-9eaa-08d920532733
X-MS-TrafficTypeDiagnostic: MN2PR12MB4301:
X-Microsoft-Antispam-PRVS: <MN2PR12MB430182B06C1E84044DF9D60D83249@MN2PR12MB4301.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4vH1eyPl/IruB1cvlj6a7fAbhSZydbKfm+zZULYGI/67351pDesxJnQ0hMgfHiekcupzapHoYfFp4sPekF/rPYiUSabDnyk/0kobHutaBztY4X7Pm2DxO4vCawEmtkiB9gcCAfLfmDn1KI8v79hoTjqjfsY8YdN+vOzrWcf6pDsVQJkPluP1nW6552jWqunlAeKhRQ72yoNQxNrfIe42E82EX82zCuwz8emRPRtdcA8hkawY6u3/yiNAmMS+KlN9iL4RrxsfBbnMnC0kxH5rZspERtz2oBQSFNGVqtqsVAj8ryrBew7Jg54W8Qwl7DzqiwPT9ijdTtoGL7G3LpgaZqnwl2uJ/TIoH4lp8CByn9nbEdpcT18fAnO1q5Hg2qiYTA1GX4Z4eZY8IP/IG4UK/iuN2G3h3+tSvZvzoezsjzzMWzVtRnUpt3pCufaPorwYP1SocFt+XoJHrw73h7iqVXk5tED6Wj0fKgH2h21k8P8VLxl7iAH1zxImHb5AgfEiKjySao5b6socqE5XDhbDbQGFLZrw13p8IwiuDX6dXI1hSXG9TEvB7OlN5aviB67gWemtnUg/aNRaOJHm68WV+h5i4g6Uk7wnTp3FanqWPZxdtsgc62cPGoVwi5Yw0jcy+8jXbJwg8os1q5anxGPpSsmsiEsdHGIpP35JOMtpjPBOhNwA/lUugX8px4eURXtO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39850400004)(52116002)(31696002)(6486002)(16526019)(86362001)(66556008)(66946007)(478600001)(83380400001)(66476007)(2616005)(186003)(36756003)(8936002)(316002)(31686004)(2906002)(5660300002)(66574015)(6666004)(38100700002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RGVxTU1DelpKdE0xR3d6eVMrSElFTnZ0T3FiTURtYmVEWVJGSVN6b0NqYTNl?=
 =?utf-8?B?NldZLytVbTkyY1JZb1NmbnFpTmszVDczbjR2bGRmUVZYQkkydnpYUzJCWEwz?=
 =?utf-8?B?R2lDeWE1akhMMlBHSGRZK3cybjJPYitmcFFDZWh6MDVIUi83ZFZveHVoenhZ?=
 =?utf-8?B?TlduMnpZWnJSRkEvUnFvdzM5eXVhWTN0c3BQM045SFptbkpDQ3A0MUsxUlNp?=
 =?utf-8?B?WkZ3ZzRaVXRpTzhuUEJqbjFkU1V1bnNMcjZ0d2hHdUZ3R2FLdklJdmV0ZnNF?=
 =?utf-8?B?ZklFdDhtMm81Y3NzVWVuN1Z2OXVHVlBDZTZDUzZQRFRoKy84SEZKb0RWaGNn?=
 =?utf-8?B?V01FMkRHUjZyRlgzRE1UdTZFZTZhbFJvSkdkRVg1QTA2UUhzR3U3ZnBzQlRj?=
 =?utf-8?B?akhMazRyaDJMTjRKdFYvdUY2OXh2M3hPc0IyczRuT3pTemVrZ1dVV05aTXl0?=
 =?utf-8?B?eG15eUUzVHVicDJ2bmNNRUpUYlVXSGJXNHRPZ1AvSXBRN0Y2TVdYZnljRCsz?=
 =?utf-8?B?aThHNW15aElYMExZZmFJOTArM3dSUUFuNWdhaEFwZFZERjArTTVWaWt0YWpL?=
 =?utf-8?B?d1FhSlIzSWZFb3ZiZnV1NE5vNm9JV3RVcVpibjV1WnZRN2NMcVNvNmtzSE1H?=
 =?utf-8?B?cGV0UG5wa3FLcTBvM3F3VGJUSmRPV2N4cWFPVzgzeXZoSDNmbGhjYVdWZDB5?=
 =?utf-8?B?VExreTVIR3NRTE9FcE9qYmxWTmU0THhWamlTdGpkemIxM2FVVmVrRHRPa3Q4?=
 =?utf-8?B?cVh5bWsvQlgxeU5uTE5hVmZ3VHhGZ3pjbEF6MkdFWU1vN25BeEV3dU5MWXoy?=
 =?utf-8?B?N0ZRamRhTmI2UzM3RG42dHhWd2tEbFl5NzBGSGVQOUc5cnF6KzBjT0hGU01E?=
 =?utf-8?B?VmR4NENmL0NGRDdsMkxZRHg3dHNNbFJBQnhicHd3ME02K3dCTlArQWhFazk5?=
 =?utf-8?B?U2R1cmhQRDFienREYUhxUFBkSmJocUpjQkVjdnE1LzQ4MzA3UUlqUUczbmFO?=
 =?utf-8?B?ZWpHRjBTeTJyMjZWbUJXdmdzZ0RTQ0cyY0VVZUYzOVdacjlla1F4bHJjLzdh?=
 =?utf-8?B?N3RNS2RPRnFqQlJOeG9rV0NENkk1SmxabEEyNWZKdHd2clJOMUdCdW9Uak5Y?=
 =?utf-8?B?ZXpFN3dtY3I2UzZDSzA0SGQxbFZCWWdlY3lTOVBtOHh1R1FTSVQ4TWxRTkFj?=
 =?utf-8?B?VVQzYk5tWkVvTkt6dEFTOW4zZmxBSy9LVEFOSjV4QmNLOTA0VFp3bVFtT0Fj?=
 =?utf-8?B?Uy9RVzJFUWlRZEhIaDROWUlveWtiOEtqRUpsY1g4ajcycjNlbmNWZDBVbFo5?=
 =?utf-8?B?NjBXcGxiYWZFQXlhVlBlTFM3LzkvNitmYlpWendabDJjRitaRFFQcmdacGFj?=
 =?utf-8?B?aTRQS1ZQZEJJckllOVdMakRwTE1ncVlvT1BjT3ordkVvNy9MUTRmQzNqRGI2?=
 =?utf-8?B?ZmNJZUNFcDZCcVovQWRZRGh1TW1UVkdUcURaWGpicHpUNHUrRjVaK0M4SEtu?=
 =?utf-8?B?dFFWTWJxcDN2dStlaW9USXZ1b0swb3Z1MGVVS0lsQUJ6Z2IydmZjNjRKNGYr?=
 =?utf-8?B?M3EzeFR4OGpwVHdWNWFodzQxWk13Zm9CaHJmOFluRDRBcnRKVVFoNTB3VXVj?=
 =?utf-8?B?VzJmcjA3QzhYL2NaRjR2Sk11MFhDNDlGU2ZHUUFuaXhoMzVReDdXREdMQzgv?=
 =?utf-8?B?NnF4Vll6YkRwT2JLWlVnY3E0ajdUdDV5U3JGYXRzS3B3YkpWL3grTHI1RHBX?=
 =?utf-8?B?NkVLd2liTVdmNWZWNHJ2SmFhQ2tjNTRDejV2dGxuQ2UyTWo1TXByV2dxY0Js?=
 =?utf-8?B?T0Y4REdMZlFXWmRjRVlacko4MjBMWHZZd2Fyelg4dCtaQ3JyL3cyTEdVVldu?=
 =?utf-8?Q?TmrGBpkEBYfmG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5853df75-c155-4b9c-9eaa-08d920532733
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 14:32:56.3753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJoUoJWGniVpe2IT1aWfJkNFkSSPeOXWbAsqHD6W4KG6NCRXHwzeWh6hPXKdPdFm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4301
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

Am 26.05.21 um 13:32 schrieb Thomas Hellström:
> If the bo is idle when calling ttm_bo_pipeline_gutting(), we unnecessarily
> create a ghost object and push it out to delayed destroy.
> Fix this by adding a path for idle, and document the function.
>
> Also avoid having the bo end up in a bad state vulnerable to user-space
> triggered kernel BUGs if the call to ttm_tt_create() fails.
>
> Finally reuse ttm_bo_pipeline_gutting() in ttm_bo_evict().
>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
> v4:
> - Clarify why we mark bo for clearing after ttm_bo_pipeline_gutting()
>    (Reported by Matthew Auld)
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c      | 20 +++++------
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 55 ++++++++++++++++++++++++++++---
>   drivers/gpu/drm/ttm/ttm_tt.c      |  5 +++
>   include/drm/ttm/ttm_tt.h          | 10 ++++++
>   4 files changed, 76 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 51a94fd63bd7..be0406466460 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -501,10 +501,15 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>   	bdev->funcs->evict_flags(bo, &placement);
>   
>   	if (!placement.num_placement && !placement.num_busy_placement) {
> -		ttm_bo_wait(bo, false, false);
> +		ret = ttm_bo_wait(bo, true, false);
> +		if (ret)
> +			return ret;
>   
> -		ttm_bo_cleanup_memtype_use(bo);
> -		return ttm_tt_create(bo, false);
> +		/*
> +		 * Since we've already synced, this frees backing store
> +		 * immediately.
> +		 */
> +		return ttm_bo_pipeline_gutting(bo);
>   	}
>   
>   	ret = ttm_bo_mem_space(bo, &placement, &evict_mem, ctx);
> @@ -976,13 +981,8 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
>   	/*
>   	 * Remove the backing store if no placement is given.
>   	 */
> -	if (!placement->num_placement && !placement->num_busy_placement) {
> -		ret = ttm_bo_pipeline_gutting(bo);
> -		if (ret)
> -			return ret;
> -
> -		return ttm_tt_create(bo, false);
> -	}
> +	if (!placement->num_placement && !placement->num_busy_placement)
> +		return ttm_bo_pipeline_gutting(bo);
>   
>   	/*
>   	 * Check whether we need to move buffer.
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index ebff603a97f4..4cca932f1c0e 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -590,26 +590,73 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
>   }
>   EXPORT_SYMBOL(ttm_bo_move_accel_cleanup);
>   
> +/**
> + * ttm_bo_pipeline_gutting - purge the contents of a bo
> + * @bo: The buffer object
> + *
> + * Purge the contents of a bo, async if the bo is not idle.
> + * After a successful call, the bo is left unpopulated in
> + * system placement. The function may wait uninterruptible
> + * for idle on OOM.
> + *
> + * Return: 0 if successful, negative error code on failure.
> + */
>   int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>   {
>   	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
>   	struct ttm_buffer_object *ghost;
> +	struct ttm_tt *ttm;
>   	int ret;
>   
> -	ret = ttm_buffer_object_transfer(bo, &ghost);
> +	/* If already idle, no need for ghost object dance. */
> +	ret = ttm_bo_wait(bo, false, true);
> +	if (ret != -EBUSY) {
> +		if (!bo->ttm) {
> +			/* See comment below about clearing. */
> +			ret = ttm_tt_create(bo, true);
> +			if (ret)
> +				return ret;
> +		} else {
> +			ttm_tt_unpopulate(bo->bdev, bo->ttm);
> +			if (bo->type == ttm_bo_type_device)
> +				ttm_tt_mark_for_clear(bo->ttm);
> +		}
> +		ttm_resource_free(bo, &bo->mem);
> +		ttm_resource_alloc(bo, &sys_mem, &bo->mem);
> +
> +		return 0;
> +	}
> +
> +	/*
> +	 * We need an unpopulated ttm_tt after giving our current one,
> +	 * if any, to the ghost object. And we can't afford to fail
> +	 * creating one *after* the operation. If the bo subsequently gets
> +	 * resurrected, make sure it's cleared (if ttm_bo_type_device)
> +	 * to avoid leaking sensitive information to user-space.
> +	 */
> +
> +	ttm = bo->ttm;
> +	bo->ttm = NULL;
> +	ret = ttm_tt_create(bo, true);
> +	swap(bo->ttm, ttm);
>   	if (ret)
>   		return ret;
>   
> +	ret = ttm_buffer_object_transfer(bo, &ghost);
> +	if (ret) {
> +		ttm_tt_destroy(bo->bdev, ttm);
> +		return ret;
> +	}
> +
>   	ret = dma_resv_copy_fences(&ghost->base._resv, bo->base.resv);
>   	/* Last resort, wait for the BO to be idle when we are OOM */
>   	if (ret)
>   		ttm_bo_wait(bo, false, false);
>   
> -	ttm_resource_alloc(bo, &sys_mem, &bo->mem);
> -	bo->ttm = NULL;
> -
>   	dma_resv_unlock(&ghost->base._resv);
>   	ttm_bo_put(ghost);
> +	bo->ttm = ttm;
> +	ttm_resource_alloc(bo, &sys_mem, &bo->mem);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 0e41227116b1..913b330a234b 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -134,6 +134,11 @@ void ttm_tt_destroy_common(struct ttm_device *bdev, struct ttm_tt *ttm)
>   }
>   EXPORT_SYMBOL(ttm_tt_destroy_common);
>   
> +void ttm_tt_mark_for_clear(struct ttm_tt *ttm)
> +{
> +	ttm->page_flags |= TTM_PAGE_FLAG_ZERO_ALLOC;
> +}
> +
>   void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>   {
>   	bdev->funcs->ttm_tt_destroy(bdev, ttm);
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 3102059db726..daa9c4cf48bb 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -170,6 +170,16 @@ int ttm_tt_populate(struct ttm_device *bdev, struct ttm_tt *ttm, struct ttm_oper
>    */
>   void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm);
>   
> +/**
> + * ttm_tt_mark_for_clear - Mark pages for clearing on populate.
> + *
> + * @ttm: Pointer to the ttm_tt structure
> + *
> + * Marks pages for clearing so that the next time the page vector is
> + * populated, the pages will be cleared.
> + */
> +void ttm_tt_mark_for_clear(struct ttm_tt *ttm);

Either implement the function directly here as static (it's a one liner 
anyway) or move the documentation to the implementation.

Apart from that the patch is Reviewed-by: Christian König 
<christian.koenig@amd.com>

Regards,
Christian.

> +
>   void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages);
>   
>   struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *iter_tt,

