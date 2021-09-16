Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F88F40D35D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 08:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C85D6EAB1;
	Thu, 16 Sep 2021 06:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5FB6EAB1;
 Thu, 16 Sep 2021 06:45:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsDs78F27CfBZ60KwOVIgvLYmmIG+nb75pJY2OY5Uh8tTAbfUsOqltkLJ4Ll1xxW0cX/umi8wwzoj839VsJRm5wp31mnXoRqY9Og+s43dnEuq0fnHC/kl8wzcVmXwYXAy78EHRkpHjL5gmkO+k/K8q0AkYpdyhw7pD5SUnTSV+DSAB6G5PNHSHZ+oM7awBx368dQSGVh5vHr+YjKzdF0GuN+31AQJ3opAivBAAP1b9kG1hu5IIrZ22Qw3XAFiX8HHeE2+cs0zp/wj0bmLXoFDFWsxhzfgaHWkLU2oKZbYaTzNy2+8u+dTFwnEIJm08pucZbDHvyQ6ByUPAfou0RENw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=J8Qt+hEPHW97Ve42GaFtnhrs+1rdvlY+ZgUpwjwJfkc=;
 b=WPbuTGxE2HH/fVAPJnh4dQ1M+367xOt3yoHhN6Eh1YpdvT7iuoPTCPeJk6dLxLh8aflR0ExsGRcM7Z9YRJHgu0ADx1Gu4OoynA+/KRSiVJTUoNtO+OB/V2wQab8ftkcz8rj7aHhyGLGBb8abuCjUjC6hbgOT175S5Y0ny/EWK7kNwhfORB3aVAmdA1X+Jz2x2Xf0bN1ZRBMALG4S0aGaVvveWFkph0nqIHoZCtKiuUMqyTqazMxnbIwaEfjagd9rHsGnLcaWlKnnQ8rIfwMwEdnSAE5Bqv+nxxrMfq9UG6CcI5cBIFEEv9WQR7wl2z9r7fH8D4om150IXLwXA8K5yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8Qt+hEPHW97Ve42GaFtnhrs+1rdvlY+ZgUpwjwJfkc=;
 b=V0mlACkOxFQ/S5j4B6QX2ikVfTLXkk1vhjmO7E7DLah08xo4RjCPzl550QnLzgiwLcZ1irsbPFrBb023GO/LlXEYydsZs6Lb0Zroy/EWotzbG915b1ar+Dz8NpMY+gV8bkDLHq3yww+QmbrZBOenIPwM1+jwoXQ4oOHlvJ3t6/w=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4565.namprd12.prod.outlook.com (2603:10b6:208:26b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 06:45:12 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4523.014; Thu, 16 Sep 2021
 06:45:12 +0000
Subject: Re: [PATCH v3 02/12] drm/ttm: move ttm_tt_{add,clear}_mapping into
 amdgpu
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210915185954.3114858-1-matthew.auld@intel.com>
 <20210915185954.3114858-2-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f6ba022d-a4b5-18dd-c1aa-ddb1e7bf42fb@amd.com>
Date: Thu, 16 Sep 2021 08:45:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210915185954.3114858-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR05CA0087.eurprd05.prod.outlook.com
 (2603:10a6:208:136::27) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR05CA0087.eurprd05.prod.outlook.com (2603:10a6:208:136::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 06:45:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53b87c94-0215-4e9a-3777-08d978dd8864
X-MS-TrafficTypeDiagnostic: MN2PR12MB4565:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4565C813AD9D8D70B879E3C483DC9@MN2PR12MB4565.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o0Lqp8UggSJ46vzHvK9JoJN02aQ+9PyesLEPGzk7XLGA/1M6RSaKPbhAF31M3PBt7EQDgrd+QhOnYpXC7vErr0K9ExP27bB59PlPNIRDeSZhDMszsvWxb0O9clERKn+o2j+Rga7Xa1+GmdIaRYBDmKscb06MwQmCl8KmHeaXmqDCVUJvkYUcQaV1gOlKEMx3fVsiAFmfcyE3ka1bnjXZDfUnTM5gUAcv4OrCsKxJSIpz5CDTIO9f4689OASOv5ShvWwx4SgiPzTP5zNc+yFNJARI+yjzoPXgK/lLg3gpXeJJtGEQjZ6Y77R6uC1opkma02z4/Uk7JuG+AGaS57pXLcVHV1tHnEAD6CdQkLGDIXyuCYqip2/D9O6fqf+xnOf0deURjTi5KiUsC9lOCCvzbFeKvfvKz7reEnYyKSJhe5Yw4XxubVIXcLqiVkkRrcosb6FImYRNlSDAJo2RuC+Qzp2G0jSuDUrcRXRHwVWpxlNcrqJkNiaMAfqZQdF6mkpPLaAcZq6rLZGdZmyXxfG/diznvF0K/dbLYkVjAN3f0b49xuflZXUDqfiwH8kDtAvHtlMt5pmaBbWG862GFwzjZe2398F5JiAzIook3kghEMM53GGdqey0ymhpusriNlw7QU9WGam4CW9/dcYFJfl7Bq1GtBDGsyLKlLusNS5iXaKULuZpZ8dd6X+g8QOGU2iKiZbwZf0l7ZBg/rmSGVDV8mNXwqLhhpL2kpWrKdxWtxg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(66574015)(6486002)(186003)(6666004)(4326008)(8676002)(8936002)(508600001)(26005)(2616005)(86362001)(316002)(66556008)(66476007)(66946007)(16576012)(36756003)(956004)(83380400001)(31686004)(38100700002)(2906002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1BnRnlUSGJBbFdqVG9DYlIrL2dqS0J0V3lyUVNpVXJyMm44SUhNeHV6alpE?=
 =?utf-8?B?OW50Y01neWw3ZjBqdllKTnlncFRpeWhjMGFYazBXZzBHZlMwUFY2LzZ6U1NG?=
 =?utf-8?B?Wnk3UkZ6bUZ6V0lpQjJoSVFSakVJNE04V2NvOHpaMXE1aDFFYTM3Um0zR2di?=
 =?utf-8?B?YU1YU05jMUdUT1R3OHFGZmpjT1BwZXI3Kzh4MTVEc2F4d3pxZFZDamdFeS9E?=
 =?utf-8?B?Uk1nZ0p1N24wTHhsNklWQ2ZKQ1RtOUI2RjMvQzlYUFVFc3dJWTVkTGhIeGhl?=
 =?utf-8?B?cmdmOENVNnhhYjZHbVY5S0s0cEhHc0Q4RTdCQ1djQ05jUGxrQ0o5cE5mVmNu?=
 =?utf-8?B?VXllNEVraFNhL05NamZ0aTdyc0pON2RiVW9TUjdsUjB5cXJrdFFSOXdHTjQv?=
 =?utf-8?B?UkJ6a3hlWHg1RXUwQzJvekFyU3czOW5hcFFJZ3V0aDRuRWZUVzcxM3VKbE11?=
 =?utf-8?B?WThQSVEzNGpjL0hmWjEwbm0rWGs2L1M5cGdzVHZLVksvNFBuZExKMXQ3NEM1?=
 =?utf-8?B?VUlEYXBRaUFzRjlseERwZlUvb3E0eG42cEZIcXZIMXA0a3kxVEhNZFlWOFRm?=
 =?utf-8?B?QnI5RFdwbGY3ckZISDVUM0JsemZZUnRTRTRmeVhodWViTUkyQUF0NWF5eS8v?=
 =?utf-8?B?T05VRjhQYTBXLzlWVGZnZk9xRlYrczl2aWJ5YmdzbTRSMGtoaHczck1DSUFk?=
 =?utf-8?B?UFN6UWN1dlNSaUFTMkJFcGNtdzFjdld0SnpEbUpJeUl0SEdST3ZlaWFzSFdV?=
 =?utf-8?B?a1kxNnBWRTIwa0UvcTNMYmN4QWZJNndaa3Y2WUljdllNbFkzQW1tYkM5MlhD?=
 =?utf-8?B?RGtKK1hiTTdpMUtZOHpqbGtOYVU4U2RFWUgxa2hTZDJSanhKMmV5THNiaTBj?=
 =?utf-8?B?WENSVXNKSCtkeUJTWkdib29pYXlJNU9SemJrOHRsSmhqYWo5YWN0NytyMlE0?=
 =?utf-8?B?NWdtWlBTUzVaUGNJWk9lZjlaL3hEV0pPcnFVSnZmUUdyUWNRQU1wUWVHWExZ?=
 =?utf-8?B?a0JpRndLU29rb0gwOVhxQlRFS1R1MG9vWDdTaDdSdDI0enlhb3ZvSzNPaGph?=
 =?utf-8?B?YVowSU0vSU5xdnBLRkNxMjMzaFhJczBIa2E0cFBvL0YrRGRNL1R6R2R2bXlC?=
 =?utf-8?B?QkxuajdFaFh3SXpMQWduZ2NVVFM2all4MzV2OFNqTzZ4TXlHMXRiMWhjSWtq?=
 =?utf-8?B?bjFYQnI1RlhWY3dySDZLWnM3VTFBQis1a1N2U2R4MVZVZisrcDBnYkRXQ2tt?=
 =?utf-8?B?dGtvQmdDM3FlOVFZN0UrTHUrelFDRWpJZDd5ZlVoclcxcjBGNXFJcll0bm9S?=
 =?utf-8?B?NzFWaFhZSk5MaDlFNFBNb2lUSUFkWWs2azFmRnM4N0xzZjRtdkNSY2hmekNt?=
 =?utf-8?B?alZPNDlJQ0NIMVFUMGs4TTBiWUZYM1VEUEJPM3ZPcnNSUnhBZ3JsSHZqYUVz?=
 =?utf-8?B?RFdwdE9vMzY0bmxUZUl6Ung2QkwvdXFPdXo3OG9XUnc4U05Ec2xZNG42RDFL?=
 =?utf-8?B?aXZZMmw2N1l2M3FBbHdpZ2dZTlpQaitqc2V5SzF4TGlHY3QzRGdBcWpGT3E5?=
 =?utf-8?B?VVRWWG5GdmlrRUFXZnhQWllBazl5blVCc1puMG5KOU1rQlM0d1V5a0xGbDBL?=
 =?utf-8?B?SXdCejh6eU13U2pBRzRvdTY3UWhyNnpoZTNxVEJCTjJOQ3c4Smh4cGF3ZEdI?=
 =?utf-8?B?djdzT3pSTUo3dTJsMENyMmJ6KzNlc1Q4V3o1bDQ2SElIUWxTSTN4MG5Mc3E3?=
 =?utf-8?Q?B4wpnzELHxAbt+htpo3Vn0XeS7FFajrF6LskUzv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b87c94-0215-4e9a-3777-08d978dd8864
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 06:45:12.5208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lG7U/COMQTp90WVs/Ovw/5hAY1+GQnyk3jZSVomgijTveKy2YEc1jU4fWbrj6Ant
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4565
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



Am 15.09.21 um 20:59 schrieb Matthew Auld:
> Now that setting page->index shouldn't be needed anymore, we are just
> left with setting page->mapping, and here it looks like amdgpu is the
> only user, where pointing the page->mapping at the dev_mapping is used
> to verify that the pages do indeed belong to the device, if userspace
> later tries to touch them.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 27 ++++++++++++++++++++++++-
>   drivers/gpu/drm/ttm/ttm_tt.c            | 25 -----------------------
>   2 files changed, 26 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 1129e17e9f09..c5fa6e62f6ca 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1107,6 +1107,24 @@ static struct ttm_tt *amdgpu_ttm_tt_create(struct ttm_buffer_object *bo,
>   	return &gtt->ttm;
>   }
>   
> +static void amdgpu_ttm_tt_add_mapping(struct ttm_device *bdev,
> +				      struct ttm_tt *ttm)
> +{
> +	pgoff_t i;
> +
> +	for (i = 0; i < ttm->num_pages; ++i)
> +		ttm->pages[i]->mapping = bdev->dev_mapping;
> +}
> +
> +static void amdgpu_ttm_tt_clear_mapping(struct ttm_tt *ttm)
> +{
> +	struct page **page = ttm->pages;
> +	pgoff_t i;
> +
> +	for (i = 0; i < ttm->num_pages; ++i)
> +		(*page)->mapping = NULL;
> +}
> +
>   /*
>    * amdgpu_ttm_tt_populate - Map GTT pages visible to the device
>    *
> @@ -1119,6 +1137,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
>   {
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
>   	struct amdgpu_ttm_tt *gtt = (void *)ttm;
> +	int ret;
>   
>   	/* user pages are bound by amdgpu_ttm_tt_pin_userptr() */
>   	if (gtt->userptr) {
> @@ -1131,7 +1150,12 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
>   	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
>   		return 0;
>   
> -	return ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);
> +	ret = ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);
> +	if (ret)
> +		return ret;
> +
> +	amdgpu_ttm_tt_add_mapping(bdev, ttm);

I don't really see why this needs to be a separate function. Just inline 
the loop here.

> +	return 0;
>   }
>   
>   /*
> @@ -1159,6 +1183,7 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
>   		return;
>   
>   	adev = amdgpu_ttm_adev(bdev);
> +	amdgpu_ttm_tt_clear_mapping(ttm);

Same here of course, apart from that looks good to me.

Christian.

>   	return ttm_pool_free(&adev->mman.bdev.pool, ttm);
>   }
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 1cc04c224988..980ecb079b2c 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -289,17 +289,6 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
>   	return ret;
>   }
>   
> -static void ttm_tt_add_mapping(struct ttm_device *bdev, struct ttm_tt *ttm)
> -{
> -	pgoff_t i;
> -
> -	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
> -		return;
> -
> -	for (i = 0; i < ttm->num_pages; ++i)
> -		ttm->pages[i]->mapping = bdev->dev_mapping;
> -}
> -
>   int ttm_tt_populate(struct ttm_device *bdev,
>   		    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
>   {
> @@ -336,7 +325,6 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	if (ret)
>   		goto error;
>   
> -	ttm_tt_add_mapping(bdev, ttm);
>   	ttm->page_flags |= TTM_PAGE_FLAG_PRIV_POPULATED;
>   	if (unlikely(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
>   		ret = ttm_tt_swapin(ttm);
> @@ -359,24 +347,11 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   }
>   EXPORT_SYMBOL(ttm_tt_populate);
>   
> -static void ttm_tt_clear_mapping(struct ttm_tt *ttm)
> -{
> -	pgoff_t i;
> -	struct page **page = ttm->pages;
> -
> -	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
> -		return;
> -
> -	for (i = 0; i < ttm->num_pages; ++i)
> -		(*page)->mapping = NULL;
> -}
> -
>   void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>   {
>   	if (!ttm_tt_is_populated(ttm))
>   		return;
>   
> -	ttm_tt_clear_mapping(ttm);
>   	if (bdev->funcs->ttm_tt_unpopulate)
>   		bdev->funcs->ttm_tt_unpopulate(bdev, ttm);
>   	else

