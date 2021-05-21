Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA7438C16A
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 10:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F5E6F5CE;
	Fri, 21 May 2021 08:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453886F5CC;
 Fri, 21 May 2021 08:10:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKa35ndoV88aVjYgdwKEWnv9Q03iLO9D631sCD32uzOMT+8gbjZolmP4f7PANRMDA8sj9RJmJXgk7AciY6mu/hH2kLMeU0pXmB7y2tPhyBYknhPUpGuWH9z89K9TfKHGv0FwzH9p+5mBM+MhnyJUZfwhiyz/rf6BM7xrFc62mzWVNcy8ga3gxOCyPzMSo14CvxICWp/r8pl7ne0s62R20E/hN2S+Hb1xmV0lkMBvziG3DF8jI2aYhbC9IVjdP0nDEnsedyoVmDa6LK7ZdHsrlxHrI+bYKFxm+nujNITbOzx212s16tHMOOAlKpzHAXtE9S00uLOJO6ujZu7eg1jl+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42iKhvNNCXT2e7GyDcZlTRrk2bWy+Brs3bL7AMbwUXk=;
 b=IgGb6+SY6NPrzRNmbjeCFw0t5vPCVg1glxwl98RfFGXqfm6I6dJUqKoiTS83sSp6k3Lwwq/kN/811qY7zLLuw4a8Z+xMjccvqDKf2YS75QpFbt4P3JyEbT3+9AuwhDTtY4nKGX6abY2tv+H1JAxUF+SHZFb5pWXIHnVqOrgL8Reu/2L3vdj1urRlIdbSw32Ck3r7FVDW0pvr817Cyre/VyA7/RNmuDKlnZvS7ta9yMaAOc1uwQ+qx3xo8KHYjhUf/H6i7slaxtPLopRmWhmLIhjvwaEnAWD6WY4SZRhGPm03pRtXaiz0JAmSyTGdqmqazB799k+dETE7abKQMu8qTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42iKhvNNCXT2e7GyDcZlTRrk2bWy+Brs3bL7AMbwUXk=;
 b=V3ScY6Ry21olbK6iRxL/q8NK89LeUlX7CcoxNQJk1shafx0OOdQHXTsoLWz1i45NG76CpTDcfsh8CpaPmnGiE+ZPRB15Pa5us5ZkJd3E3kwzbUdJZOV4qVMtQZxLW30ZxM9ABWcw4UmV3IVigAcmqsBt0w97rvBXEHePT3hMFAk=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3933.namprd12.prod.outlook.com (2603:10b6:208:162::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 21 May
 2021 08:10:44 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Fri, 21 May 2021
 08:10:44 +0000
Subject: Re: [RFC PATCH 3/5] drm/ttm: Use drm_memcpy_from_wc for TTM bo moves
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210520150947.803891-1-thomas.hellstrom@linux.intel.com>
 <20210520150947.803891-4-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f917a62f-0552-e9e2-17d3-8f16c713fa8c@amd.com>
Date: Fri, 21 May 2021 10:10:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210520150947.803891-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
X-ClientProxiedBy: FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
 (2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d) by
 FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.12 via Frontend Transport; Fri, 21 May 2021 08:10:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd58ca74-1c81-44e0-b97f-08d91c2fed70
X-MS-TrafficTypeDiagnostic: MN2PR12MB3933:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39338731C944990D5289B3C983299@MN2PR12MB3933.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JOOEVwBSucYl7gEj5h7lz1HruiCh3LqHw16qQmt/Wh2rhjoPK3qNTkKGd4skhyURzi0QBj2CMBDAlNnAsOJZPMUYtjEY/oVgal2LDhUhXlrTQT9/oJXDEoo6IHJh4DiPP+LaAJMrFSZZEcekZxmXQLG9tS+a+in5Y3ZjCBkhzniw5uDMox4967CprG6S44pEfwPPbitU18XeOixOoHppp5bK43yJAFpeV0hbruPP0iAKwdzFFiYMm69VyXqybQa/Hs7AMR02SP1C/wYBoalZ43vVTecuXTnRni8wiG9Q4MT0fghsX8RClOSkCbkZA5P6Y3DkyeP6uAMoX94dGWGh0DzOdogUhj4jh3nCtKsbqH5TPWIWp6JVHkSJIObrF06aCpgnZIdezEpdicHmcF/kyGme5DE8Tjh2iUsMo0APyADn1vcuTYwsI/M0/gAByAxD9GE9zBakdRjRPA5Nq3gF/4QVSxLr+djro+H62MGu1BijMM2NZJd28Rh5oI9oAvDTn6Mb72iRO9ZIeymfPAn0uLIuFBkntJ0/bGmgNs1w+cmoD/cQvdmJSNehw1RLp1nHnbOnf88Hi2uzfgSJ/KFpt3BDcBAQLv/idqH4/Ev+adK8jKM3FzzRdR8RmhB3ZvucW62q8LkqvXUid7jlSYuxGo9DiHvZuGHHgYgH3HmUGM4zGPjUcipUA7Qu/pssMooW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(366004)(478600001)(66946007)(8676002)(8936002)(2906002)(16526019)(186003)(66476007)(66556008)(2616005)(31686004)(54906003)(5660300002)(6486002)(52116002)(316002)(31696002)(36756003)(38100700002)(83380400001)(86362001)(6666004)(66574015)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MHpUZTh2TStubGs0WjZrc0VqTHQ0QWpCanFmK3ZiQUNhTWZUOEIvZU90S2hq?=
 =?utf-8?B?c0JSZWRRQVJUYzh4RVhYODYvR1JtUGI5WVNpTUZKUW9kZG95aDQ2QnU1aUxS?=
 =?utf-8?B?TDNwa2FLTDNsdzg0RHRXcy8yU0hYZ0Q2dlFjcWQvKzNseDZhQmdjb05jZnNz?=
 =?utf-8?B?bVgwMkFKSklMZVlaZ28vb3dyYkw4Q2Z5bXJQN1c1RE5iUGk5cmlQTHBoTVZ1?=
 =?utf-8?B?MkxxaHEwM29melVPcXNkZFArUFl4N2RTcS9iS0JDUXNRL2ZpK2xaT2Z2d1pE?=
 =?utf-8?B?NzV0UWx0UTYwNndWakZWU3oveHhMK0UxNU9TVjBueVprTmRYSTRVVk41MDlw?=
 =?utf-8?B?eHFxdkF6bzlRV3ZSUTF6bTErS3lQK1ZJT05uVWF2NTRoMnZkNDBZdElOYUtX?=
 =?utf-8?B?Yi8rSjl4MTN5SE9hZ2xNWTVPblg0MG1Na0hmZ0NyNjI2UFRZOE9ESzByMmVi?=
 =?utf-8?B?NjBLMElYRjhiMjZIVFJVQVlLNU94S08rMWQ3SVJZUHlJYmhpdnVxckUwZ2Fq?=
 =?utf-8?B?aXVxTVBZdllvamJ5VDdIdnl5NWw1VzJoS25XeHRtbVptbUNFMWxnT1NqUEJk?=
 =?utf-8?B?RWl6L3Q1dlRhaSt2VnF4NWpGRUlyMVVqM1M2NkYrNlNtWTZjdGpnV2ZhdGJq?=
 =?utf-8?B?b1BVVktLdW1hSXVhNzBkamd5RjhKTXp4RFVnSDFabHQ5bFArZERrcm1HK1pq?=
 =?utf-8?B?YTluNEtWZ25mMEtmcWVRbWFFQ0FOY21ZazZyMmFYdExlS0lpVnJ3Vm4xZGhH?=
 =?utf-8?B?VlFQeFNSNWNaRXRGeTJpbDQ2ZFFiRkxSR1ZSTkRWYmxxaEVSb3JBM2lZNFhD?=
 =?utf-8?B?NWtaU1VBUStaVlhENEdDd0Q5M05nRVFnRnh5RFNNWDFvbHR6dW9lOFFCZkxX?=
 =?utf-8?B?c1NXNzdIWUxEeVZJTTcrVnRmY1NMcG1oSlVzeUlwd2tvU2VqL1VLUTZXSEQy?=
 =?utf-8?B?dmtoQTRoa2ExU21UTGljK1prUm9IckRJNy9FSTBaaHZHMUN2ZUdaYTV0TlNI?=
 =?utf-8?B?Z251Q1dtZFRiQ2ZZS1dIa01leGdQanM3dnUvMjNOcTVzclJMTE5CVFBFS20v?=
 =?utf-8?B?TVViM3R2ZTVYRFBBUFprRWllenJvcUFQWi92b3VwV2IzdUtrTXA3WWVoVUxD?=
 =?utf-8?B?VnJjL3JwejdnMWpkNWliR1QrNkE3TS9QS3pzWFJVYU94YmF0Z3NiWjFzV0Fh?=
 =?utf-8?B?anVEMWdWUC8vSVZEMnlJZmtMc0hpZTdjeWg2M2xDcWZsWWRjVDZpaFVhVGty?=
 =?utf-8?B?QnpqcVcxVjY5Z0pPYjRleGplbE5ETjBuVVZrNkl2dXZneHJNWVFQa2RBQVNv?=
 =?utf-8?B?SjFLOXpxWmZOVWsvRytiZnRSdjBTczZYR3FOaFJDdlFTZGplQmRwUk1nYmln?=
 =?utf-8?B?WXcxbllmVDFnT2lIK1I0bzUyQnhBaHowa1FSdWFCQXNyeEt0Yk1RdHhoOTMy?=
 =?utf-8?B?aFNTVmNRdlk1MWRLZ0dPaTMwTEZTekxTZnJwT2dLR3VrejV2MndCeWdNQVNH?=
 =?utf-8?B?SEY5VUhBeUhVMFBMNGlqNE9CNXNvVmo3ZVhTZndwZHlvdkxqYkZYTGxBVmdi?=
 =?utf-8?B?NXpWcnZtcmw3aE1xQU9tZDA4TTFXUTZ2MWgrQi9TelZoMTBjbXZ5dWxmakdw?=
 =?utf-8?B?cDJuOVVsSG9ueDh3RllYUkRjVDhOQWQ2d1YreUVLOUZ2N1EwNzFVOHZSVjJ4?=
 =?utf-8?B?UUYzeFp2QXcwL3lzTTF3U1lZNytjeVZUZVBZMEsxd21HU1ZOalZ6RzVISTlQ?=
 =?utf-8?B?R04vcnpFMGJoV0IyazhzVzVhYzZjc3Irb3Nrc1VkeFAwUWlKcHJJZHhaZ3Nj?=
 =?utf-8?B?UGtNYllVNGRmMWsyYnMrMU5vYkJhdHpWaU5sd3Frb1g5eUsyVytrdmpMNHp6?=
 =?utf-8?Q?OSkCKAZ9yy48b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd58ca74-1c81-44e0-b97f-08d91c2fed70
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 08:10:43.9284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /o2gMBm0mGNHsTd8r4aAERp7szveZLthqnwySMDPGHwDt8K7ldR5+tovM2ws/EJu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3933
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.05.21 um 17:09 schrieb Thomas Hellström:
> Use fast wc memcpy for reading out of wc memory for TTM bo moves.
>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Oh, yes I really wanted to have that in TTM for quite some time.

But I'm wondering if we shouldn't fix the memremap stuff first.

Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index bad9b16e96ba..919ee03f7eb3 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -31,6 +31,7 @@
>   
>   #include <drm/ttm/ttm_bo_driver.h>
>   #include <drm/ttm/ttm_placement.h>
> +#include <drm/drm_memcpy.h>
>   #include <drm/drm_vma_manager.h>
>   #include <linux/dma-buf-map.h>
>   #include <linux/io.h>
> @@ -185,6 +186,7 @@ void ttm_move_memcpy(struct ttm_buffer_object *bo,
>   	struct ttm_resource *old_mem = &bo->mem;
>   	struct ttm_resource_manager *old_man = ttm_manager_type(bdev, old_mem->mem_type);
>   	struct dma_buf_map old_map, new_map;
> +	bool wc_memcpy;
>   	pgoff_t i;
>   
>   	/* Single TTM move. NOP */
> @@ -208,11 +210,25 @@ void ttm_move_memcpy(struct ttm_buffer_object *bo,
>   		return;
>   	}
>   
> +	wc_memcpy = ((!old_man->use_tt || bo->ttm->caching != ttm_cached) &&
> +		     drm_has_memcpy_from_wc());
> +
> +	/*
> +	 * We use some nasty aliasing for drm_memcpy_from_wc, but assuming
> +	 * that we can move to memremapping in the not too distant future,
> +	 * reduce the fragility for now with a build assert.
> +	 */
> +	BUILD_BUG_ON(offsetof(typeof(old_map), vaddr) !=
> +		     offsetof(typeof(old_map), vaddr_iomem));
> +
>   	for (i = 0; i < new_mem->num_pages; ++i) {
>   		new_iter->ops->kmap_local(new_iter, &new_map, i);
>   		old_iter->ops->kmap_local(old_iter, &old_map, i);
>   
> -		if (!old_map.is_iomem && !new_map.is_iomem) {
> +		if (wc_memcpy) {
> +			drm_memcpy_from_wc(new_map.vaddr, old_map.vaddr,
> +					   PAGE_SIZE);
> +		} else if (!old_map.is_iomem && !new_map.is_iomem) {
>   			memcpy(new_map.vaddr, old_map.vaddr, PAGE_SIZE);
>   		} else if (!old_map.is_iomem) {
>   			dma_buf_map_memcpy_to(&new_map, old_map.vaddr,

