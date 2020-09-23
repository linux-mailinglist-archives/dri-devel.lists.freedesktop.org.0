Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3CE275A8C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 16:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199C86E9BF;
	Wed, 23 Sep 2020 14:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDBE6E9BF
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 14:45:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJcJhPCVhZLnKUqFduHwDJUCPpDX0c6boII8miX+d/Oqh9/84+NL/N0wCLtMcXK/6PB1wDZeclVRyRH6J9U4V7jt4jWE3BcscHUoQSLUYoOLGJJz/Ukaq0nKaOevf2R3dRo8YHIhfM/NL/xRrZ95P1QrQCQeKZuWrI72KHjiXyAKoSevfy02jClNILOSAvF1ioA3WjiNBLPAEl5bEEjx8JJm++pCxN0BoBMURMGmYSe4dODc0nEYEbRhAR9UGODxs83C15fTuV3X1dEpRk1fWC9TNAFr33MA0Cl6+hy2VSD4PKeDFpjADN58vDolGsUZHAS397Ep1EK+RpxvwH8p7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e688Ziw0pTXxpnZXzrm1yGs56czZ4/Z1Y6cOhOzNyaQ=;
 b=eVhURgUlWcozB1o1qwcqmJRcDYDELrvjvRhpNeC6f6ejeur+AMAkZVX7paJwwMnlAToHt/HatWZUgL+AZqBgL/vsMy/XIzhD+D8+VYqSMy9iBJCJUKg+4CJTkrIhj+3X05hZURVzasOQ1pRUjwKDZpwf1eskgmXvgg/JiruSJ9M+/gkS6hipsx1fpj0mcmyi/kjPk2dxtE88Bmyl4q9c+VFsUEyUy2FaEzhc61i6lsDQMih3z1V+MdJ/iJsCGrdltt229Q29m/qyOd6geoHsxhLZE4gOpjt1QPWWL0gkX4JoDgnH7u9KdkOAaF5Jlnc7XEqKDb6GzqscfNF/DFlNJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e688Ziw0pTXxpnZXzrm1yGs56czZ4/Z1Y6cOhOzNyaQ=;
 b=c7eGTvvNDSX/BOD50TZ+n7pBmS9wMJWvA2mK3bhG3/Yfj8UbRScA1GiYasBH2T01a/9cKR1Xlq5DIOKK67UhaDqxR3a0LCe6x9NJXtsUtxB5UxZgNzdN6wlNJli7zcuRSUkf51825nn3BA2KzPC3UOsegMGdqhdm3IwXYpMvEfU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4239.namprd12.prod.outlook.com (2603:10b6:208:1d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Wed, 23 Sep
 2020 14:45:09 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Wed, 23 Sep 2020
 14:45:09 +0000
Subject: Re: [PATCH 10/10] drm/ttm: reverse move calling pattern.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200923030454.362731-1-airlied@gmail.com>
 <20200923030454.362731-11-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a66afa9c-2f3c-3e0a-8637-2cea7e7918c1@amd.com>
Date: Wed, 23 Sep 2020 16:45:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200923030454.362731-11-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR06CA0133.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::38) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR06CA0133.eurprd06.prod.outlook.com (2603:10a6:208:ab::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.22 via Frontend Transport; Wed, 23 Sep 2020 14:45:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1ae01383-d07b-47f9-3490-08d85fcf44c2
X-MS-TrafficTypeDiagnostic: MN2PR12MB4239:
X-Microsoft-Antispam-PRVS: <MN2PR12MB423910F9D91CE67FEF3B061483380@MN2PR12MB4239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9+ilN8vx2ng4mXDeN0rmX7VXSSOjDt9tgizni0Y76RpeJFugbULPSv9/zXs/aB6jr+ZgAa8tOe0oQwiRnwa1eCYGCzvUDcG1kasdTvdlHY9T2jgS0Kn/21X+Fsbr3lAxmg+ntzWbPZn6XPXyLWO52iPkUdTG0MfGVC9WuPl58zv3M1ug/CsyknNFn3lAkIZZxs0xmnL6Ht7Nid9oyeqg5KlybRPNR/Ea9JO0eiNFRFteeYjWkpm8HmTDfYs8wOlOrE+nWxeYdlAK/V+dg7L7ut+9pVvsqpgJNX+WRVW5oMBOTprGA9xWcYH4Gd5lqLzT9b3F36LTwUW+/iaAdNPEK4Ddvo53O44zEZASCkrh1ld46NdGPl1V9abpoppChr7e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(5660300002)(2616005)(86362001)(31686004)(16526019)(186003)(66476007)(83380400001)(66556008)(8676002)(8936002)(4326008)(31696002)(478600001)(66946007)(52116002)(6486002)(316002)(6666004)(2906002)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: NRmBak9gbcTRfn6ljamsC628wQLXr96FTqykFiS8D8E2waS6R91TRfJ1Rw2EFeOHbobDbLCZwvqa8ornmMVpSd43LuJp2ZU6FCP9u74x15fqx4x3bv4AyyLg1GRXL8RzBdtZxetUR9shc0agjgkXIa7jttEFig20g/7tESgoyoL4Qs2KpDnCHUK0A6atXczSaYi3vMxaMbbN5zK8uoyisH2Lkl3CNoP1H8pdBtsiWWzT8tq0+i6uPV9lgDUhy3Rd3cqjmrNv/8uPW+45MQ/gOKsnFm82SRGPjmuHWcI7AKo/3f+mNas6gDwfhiym6wZcwEiFhm6zT9guZPACv5ym7R4ZG8nyGhYZJ8UvTy9FfgWoX57W9A+eP+9ZDXbQKMvvkFeJ2PJ5t1lPvEyNWGurZyQUNlSP0wumpD8HAe68BucRFKD89C8fJsLicNBMUl/Lzu+X9YusRselb4Al5bhKdM47xFbqceKZ7Uv3uer03/8pqlfrtrhMZHC7G86Gxx178wZGUB6G19lhUdPntX5h+biHE1E8q/1Ll+WwHzyGQp4amvtsOq2o+Zr5Exy9NWXvO6k883wwYFotgzrk5kpS94cT9Fq/bhZyafZ2fAEx8LDzaJQQyNHRXXa8ouC1SxSYMMSc8tcZjw93NXbEwFQzHpv9wVDvtai7Efwvqug29HlbrFsTPQS4UlCSA0BB8R891P6Fqr4TKOVCodAvmPUf6g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae01383-d07b-47f9-3490-08d85fcf44c2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 14:45:09.1371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IkRhcZvHjoxBSry0Z1MXPjvotoXp7JpkMrJmIPQqzuTC7tD3Qg2Cjpt58NKuuesg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4239
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

Am 23.09.20 um 05:04 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> Call the driver move function if it exists, otherwise use the
> fallback ttm/memcpy paths.

I would rather like to see the move callback made mandatory instead.

Christian.

>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 28 +++++++++++++++++++---------
>   1 file changed, 19 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 993a87443c37..3d9c62cdf38d 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -229,6 +229,23 @@ void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk)
>   }
>   EXPORT_SYMBOL(ttm_bo_bulk_move_lru_tail);
>   
> +static int ttm_bo_move_fallback(struct ttm_buffer_object *bo,
> +				struct ttm_operation_ctx *ctx,
> +				struct ttm_resource *mem)
> +{
> +	struct ttm_resource_manager *old_man = ttm_manager_type(bo->bdev, bo->mem.mem_type);
> +	struct ttm_resource_manager *new_man = ttm_manager_type(bo->bdev, mem->mem_type);
> +
> +	if (old_man->use_tt && new_man->use_tt) {
> +		if (bo->mem.mem_type == TTM_PL_SYSTEM) {
> +			ttm_bo_assign_mem(bo, mem);
> +			return 0;
> +		} else
> +			return ttm_bo_move_ttm(bo, ctx, mem);
> +	} else
> +		return ttm_bo_move_memcpy(bo, ctx, mem);
> +}
> +
>   static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>   				  struct ttm_resource *mem, bool evict,
>   				  struct ttm_operation_ctx *ctx)
> @@ -270,17 +287,10 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>   	if (bdev->driver->move_notify)
>   		bdev->driver->move_notify(bo, evict, mem);
>   
> -	if (old_man->use_tt && new_man->use_tt) {
> -		if (bo->mem.mem_type == TTM_PL_SYSTEM) {
> -			ttm_bo_assign_mem(bo, mem);
> -			ret = 0;
> -		} else
> -			ret = ttm_bo_move_ttm(bo, ctx, mem);
> -	}
> -	else if (bdev->driver->move)
> +	if (bdev->driver->move)
>   		ret = bdev->driver->move(bo, evict, ctx, mem);
>   	else
> -		ret = ttm_bo_move_memcpy(bo, ctx, mem);
> +		ret = ttm_bo_move_fallback(bo, ctx, mem);
>   
>   	if (ret) {
>   		if (bdev->driver->move_notify) {

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
