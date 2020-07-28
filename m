Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCE8230420
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 09:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E1F6E15D;
	Tue, 28 Jul 2020 07:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE516E15D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 07:30:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1ydbhfVXYaSf/Ih8tGHvqyiDSBV3ByzbI+alCAayLBl/N0ttQHfSIPpcDNpgCUv2lElh0Jcs5LNrDYy19/xjHxF1P9uIrBj0Vd4dQ+icEm6Hf+CL+82JxOXZLBp9E7ORMqOuIU7eIsHzbDJsGC75p+GWC2wEGZsPfcSA9D7hCkj+RXV6cAcUhLseIvgrwe2ALWJ+sG0orl5XwMgt3r0Ss9QhPDSP56FgcDtgj7qjfl3Th7YJDH5sqCSYn4UWi95b/wnXWnW/s12VP4FXLOaVf04JNqwu7H/LOqd5LjIwwGUHJKavmlqNnhHm4YXRXzxI3wmHFlKjOurIZV3r1nmRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbK6z8iGy5o3YvWoEZ1B6BAW1QXREFjuRC/2Y1YJ7A8=;
 b=ioOnuvfY6iz5UuKwoFJ87GJAq7PsURzktFDZQyreFoLUA/UkX3Verp0j4eso/iQ/pjd9ar4V1NLYvcbpdsyLfKKZaWtLGp4mWAFbZvszKw8udulp+nabS6Wp9+RejytbDOTzUZuj2pVfxUZ+7JKsLEAWxueQawV7DHAxVEcMVlIco761ZQ1NlXiKdoxwyVXx2sbv4Tjc9ByD0j9FcK7AV+51DO93OQLKmqfezxbDAWYBGLaCvfhyNxrlxTxoscr2f30VyHRQ3yqJzdWuo0UkCsrnpP3UL+OppSeTp4MWhRDtm9xgd0r70JokDBCYejF9hQZVO/9HsFr7mtp2J3cNOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbK6z8iGy5o3YvWoEZ1B6BAW1QXREFjuRC/2Y1YJ7A8=;
 b=OkXfuc2cyOCSnSuBB7FVIj0wyNWWvO6AVsT2xpvjGKbN488fUmF8HkH813b4V2HS/l7YVzhFGUpZIbnNIguH0YtWF6Hr8T593SAtz6HJsfYm8jDI8BvyksbzXzWCiJrdvEh3IzRPlTKoYz1xlUg7JMk2ukzmOmbfuESeuLj9JWI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3696.namprd12.prod.outlook.com (2603:10b6:208:169::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Tue, 28 Jul
 2020 07:30:02 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 07:30:02 +0000
Subject: Re: [PATCH] drm/ttm/nouveau: consolidate slowpath reserve
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200728062402.21942-1-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <90a2894b-7a9b-cc3e-d385-a6349e96d9e9@amd.com>
Date: Tue, 28 Jul 2020 09:29:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200728062402.21942-1-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0115.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0115.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Tue, 28 Jul 2020 07:30:01 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d3363585-791b-4af2-0e48-08d832c80a51
X-MS-TrafficTypeDiagnostic: MN2PR12MB3696:
X-Microsoft-Antispam-PRVS: <MN2PR12MB36961DBB48FDEC5D920597D283730@MN2PR12MB3696.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O6WPf7DBrwADNTo/Ej9hNApugwTI49OTy1KIc/cBZExz3ap+fOxiYftP0QSVzngI3uXuvDILTqFsjDYQE90L4T9v4BX//LVrzkU1uTCYibh580r0flWPiTqfppvd+z31oQQ0HyxUs2PfgEkS0YYj7EgtP+iJ8XgBvoVIINg+Voq5Osn3QWwzZFOaL9G9CP71hM1Psr4zQ36iVewfKzYY94ORY7oCvinSfGxYKCreaVujCqP4zunhZqOjnq6x/EHXrVSTWmVtMYFDFHWEepc02NfOJd0/IcqqMHOE7Buu70dDO7NG6q+m1HMADjGVBTNdJ2fpCkujdjpzRNT6IpTCqncOcGgBp2uMLV9nH9PtopFTXYFYKZN/Ft2lFFa3Pia/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(83380400001)(2616005)(36756003)(16526019)(4326008)(86362001)(66946007)(66476007)(66556008)(316002)(186003)(6666004)(31696002)(31686004)(2906002)(8676002)(478600001)(6486002)(52116002)(5660300002)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: wURCRDi33qwgUJoK2TI7Q19b207oJy2y6hqcCEWty9itXVqzvPkdCYNUUEkyhbWnvi/Gqk7SodhoCTOmAtPR3dALumtRaYbZ9SFVmhxkgKFf9TUgl9xJST07mXUQg/d6IunK/nqKyVkdAHTBZ2ZnMYtXKUzdFBaIDD6+r/k3Ks/YMGZSEifP9zcTHXVKJXiZPsADSeMlY7uMMhTBjMmrN+yNZF2j7RcRNO7DUUhQe6+0Ln64tHEWflXM61ty5cyXHDoUQdTeS1x/n/9qBU6WeLTsB8JcQIz00134+oRCQynAY8jPvE31viVQ9H+yNKiQNfZcmpuLzOxu4Ru9BBhvQ9g5X7izpI9hQ7dXsdHYOze3O1+YpqYbssSopHFsZ1bFWfgJHr8XMJcniZzdXMA3mZj5Zc1Gv2Tia9VUj9B4LGQLk3+JUv7LPRejBWduGLIz7i8usU89nAjrT7iOi6IOhVtJgWCPNVlx31+X1A/wOQxl1ILR69mzG18Q0NHVA3gA4Du+9D+WyXLHeUcvxMRKBNfltn+LGLCUn+06o7t5unaqW2gCvvcC4z/PYUCw5Cq6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3363585-791b-4af2-0e48-08d832c80a51
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 07:30:02.2756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XdeUS+BhAwVsdc4kzT6cV1hEvYlw5u1CXPiKD6bwoa1i1s3AqvFi+2udoEcH5bXV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3696
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

Am 28.07.20 um 08:24 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> The WARN_ON in the non-underscore path is off questionable value
> (can we drop it from the non-slowpath?). At least for nouveau
> where it's just looked up the gem object we know the ttm object
> has a reference always so we can skip the check.

Yeah, agreed. Wanted to look into removing that for quite some time as well.

> It's probably nouveau could use execbut utils here at some point
> but for now align the code between them to always call the __
> versions, and remove the non underscored version.

Can we do it the other way around and remove all uses of the __ versions 
of the functions instead and then merge the __ version into the normal 
one without the WARN_ON()?

Christian.

>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_gem.c  |  6 ++---
>   drivers/gpu/drm/ttm/ttm_execbuf_util.c | 10 +--------
>   include/drm/ttm/ttm_bo_driver.h        | 31 +++++++++++---------------
>   3 files changed, 17 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 81f111ad3f4f..d2d535d2ece1 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -422,15 +422,15 @@ validate_init(struct nouveau_channel *chan, struct drm_file *file_priv,
>   			break;
>   		}
>   
> -		ret = ttm_bo_reserve(&nvbo->bo, true, false, &op->ticket);
> +		ret = __ttm_bo_reserve(&nvbo->bo, true, false, &op->ticket);
>   		if (ret) {
>   			list_splice_tail_init(&vram_list, &op->list);
>   			list_splice_tail_init(&gart_list, &op->list);
>   			list_splice_tail_init(&both_list, &op->list);
>   			validate_fini_no_ticket(op, chan, NULL, NULL);
>   			if (unlikely(ret == -EDEADLK)) {
> -				ret = ttm_bo_reserve_slowpath(&nvbo->bo, true,
> -							      &op->ticket);
> +				ret = __ttm_bo_reserve_slowpath(&nvbo->bo, true,
> +								&op->ticket);
>   				if (!ret)
>   					res_bo = nvbo;
>   			}
> diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> index 1797f04c0534..a24f13bc90fb 100644
> --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> @@ -119,13 +119,7 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
>   		ttm_eu_backoff_reservation_reverse(list, entry);
>   
>   		if (ret == -EDEADLK) {
> -			if (intr) {
> -				ret = dma_resv_lock_slow_interruptible(bo->base.resv,
> -										 ticket);
> -			} else {
> -				dma_resv_lock_slow(bo->base.resv, ticket);
> -				ret = 0;
> -			}
> +			ret = __ttm_bo_reserve_slowpath(bo, intr, ticket);
>   		}
>   
>   		if (!ret && entry->num_shared)
> @@ -133,8 +127,6 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
>   								entry->num_shared);
>   
>   		if (unlikely(ret != 0)) {
> -			if (ret == -EINTR)
> -				ret = -ERESTARTSYS;
>   			if (ticket) {
>   				ww_acquire_done(ticket);
>   				ww_acquire_fini(ticket);
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index 5a37f1cc057e..563b970949a1 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -695,7 +695,7 @@ static inline int ttm_bo_reserve(struct ttm_buffer_object *bo,
>   }
>   
>   /**
> - * ttm_bo_reserve_slowpath:
> + * __ttm_bo_reserve_slowpath:
>    * @bo: A pointer to a struct ttm_buffer_object.
>    * @interruptible: Sleep interruptible if waiting.
>    * @sequence: Set (@bo)->sequence to this value after lock
> @@ -704,24 +704,19 @@ static inline int ttm_bo_reserve(struct ttm_buffer_object *bo,
>    * from all our other reservations. Because there are no other reservations
>    * held by us, this function cannot deadlock any more.
>    */
> -static inline int ttm_bo_reserve_slowpath(struct ttm_buffer_object *bo,
> -					  bool interruptible,
> -					  struct ww_acquire_ctx *ticket)
> +static inline int __ttm_bo_reserve_slowpath(struct ttm_buffer_object *bo,
> +					    bool interruptible,
> +					    struct ww_acquire_ctx *ticket)
>   {
> -	int ret = 0;
> -
> -	WARN_ON(!kref_read(&bo->kref));
> -
> -	if (interruptible)
> -		ret = dma_resv_lock_slow_interruptible(bo->base.resv,
> -								 ticket);
> -	else
> -		dma_resv_lock_slow(bo->base.resv, ticket);
> -
> -	if (ret == -EINTR)
> -		ret = -ERESTARTSYS;
> -
> -	return ret;
> +	if (interruptible) {
> +		int ret = dma_resv_lock_slow_interruptible(bo->base.resv,
> +							   ticket);
> +		if (ret == -EINTR)
> +			ret = -ERESTARTSYS;
> +		return ret;
> +	}
> +	dma_resv_lock_slow(bo->base.resv, ticket);
> +	return 0;
>   }
>   
>   /**

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
