Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E22276FCC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 13:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79306E1D6;
	Thu, 24 Sep 2020 11:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CD86E1D6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 11:22:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JR9gJ/0avlW6oseVS8d16Kz3HMBHci27lRn/UrSdCm4BnWqQDPeQeqYuPH3SieB/0mhNXQHJBPSfcpP4H7oeAdhWhgi5wBHxoVlwwTnbHqMoj0K+akRHUt9aBKKa45CLEQDSlhLFk3+hdHlYPhxCTPAWO8MOjwSX8mAdUnnN1aa6UPv8joX/ypzUaPeDl+7ZSihRmJMjjUlR96wuxNo8Djt9LqAZoNm1m0sBapnh9yPLCBDCAmufhYe7/KzPFfW5aw6KWCVRHzIHVgTlKadY55ps/2HUj3vlvstcCKaIgXCdvVmzElZLM8WVXPNe65p2hfFtXA0sLRBqmZa2fRYykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSt7XQgg+i/Xp+wPPCAVvGEqzB1pgAX7IrkFdM5XJpY=;
 b=DEJdUlJdLVPX0wliLbHtTtrh64G8hyUsJXvW/pdUCaWBoDSfqNkiX5chRwVfo/F+YG7jsiwOESyMYauzr4LtUleX47b9zrTIO1jh4RBQrsETGSPHip1xrtK33vPssj4BFyL2oyv6LezHUYfbVibl7U9AHlkl26YtRWIx6CcW9mdxT4hAEGawOmAgKggQrW3Wo+DX843pSd3BmGM+gzFz9EFWN+KnFcTSjSbSKdGQiV2O2EzGQK1iOkng9n2R/QxjzWLSdzKHRn3uPRvxpi8mt4JAZHc+icBm11j/hSpZj+8sW/0HV8fuHHf/b/lWsVvQ8pUErb42tDkM5wqaSFV3Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSt7XQgg+i/Xp+wPPCAVvGEqzB1pgAX7IrkFdM5XJpY=;
 b=Jkjt9lB6GCeXh59+aspAyslO8Dc1HOVpQWcjm0i2F+JygDHoOTyQMCCuEI4iC7KBBU1SOAY2MMoFOppcFlsNzPr5Tn3b6BI52hPU29Bj+jHqfX42jfBoQDxP3UpmuQ6BkZWfd0XmpHTHp2BWmIaciTY8G0B5nU/8KQ17kBiGvLw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Thu, 24 Sep
 2020 11:22:53 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Thu, 24 Sep 2020
 11:22:53 +0000
Subject: Re: [PATCH 11/45] drm/ttm: split out the move to system from move ttm
 code
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-12-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3fdf9aee-6fc4-e827-4aa5-c267172a2ced@amd.com>
Date: Thu, 24 Sep 2020 13:22:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924051845.397177-12-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR07CA0004.eurprd07.prod.outlook.com
 (2603:10a6:205:1::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR07CA0004.eurprd07.prod.outlook.com (2603:10a6:205:1::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.13 via Frontend Transport; Thu, 24 Sep 2020 11:22:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 41b13c37-2eb0-4fec-c929-08d8607c2d96
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-Microsoft-Antispam-PRVS: <MN2PR12MB44085084411521D6CA1B214A83390@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JwzNsnkAxIIoCwInJGsF1nE9PexlIjv/9BX66EAojvdfI7VFU0KTNcqmQHVPNxXlDex9HvBodFlH+wWtz5Xc7CUBZ/oyScCAIXpyTQt3XXd3aok8rCR2OYpr/HzS+niZwyUO6yHhANI9V4yd9R4os0IvSPflWxxSREheOh7qoSOCOel4gOHuBeEn4D+WUUykiy99D9Dweic4aGW4r+SiQchyYLG6UvYnt3P+NoM01g/f5uJvcteIC6omWG5jQE4tILz/lWkjyHvYPKG+fgwoXMjWywoxZEKuYB31wBgtgcYgg8thQZMig3CKgj5JkWLqoKI+GqOdGZpaQJnsM73UTSjWUcNOqWkcTHANw4ouTE6LeAn8ug72OtodPTd4sUHV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(31696002)(66946007)(16526019)(8676002)(186003)(66476007)(6666004)(5660300002)(2616005)(52116002)(83380400001)(66556008)(86362001)(2906002)(36756003)(316002)(6486002)(8936002)(31686004)(478600001)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: eNtlXcGLiTni0N6vO3UQgvkOoVsR4oIRgHEysxsdvkCdVTohardzAvU8SNUi+W25tL0hGus1dwfYnmhBpGcp0r35DnmFNC7HW5ctvVtwOSKnu11blmydobtOBwlP241fdLp2E6APcrTez+2DKnbfScDl+yRltNK7IDc+KGFPw/dP0nCWjyGgqwpr8mOfZ9wrJgJeR1Msv9EZ7FHCoO4029HG1pwiMbjmmzgnCkx366IZ3qQ56/EEQzqoKcvDMs7Mlcb7CRWnoV7SlDug53WyjSF9Gyg3yAsuZo18N2u9vLFtwmqdoGEYuL4Ebi5Z2uNf2PqOmg5t+0cK+qiGcDTR6XR7Dg2FlfxkJWSwFKBs5vqq+OxheHhEAttFSzQ7EfP+tXNoAe74ajN673lpLConuQLKJbfrNX9rext4LQPRN+2mpL1xKeuESjJ5UX9LS0BYFZoK/u5qZxGNB/J8KEgHP2fVaHMOKDj/lDr50EBJr3jlvjMOKvB4W9nfM5bN9s3IWsXW04OZGxaJcuXqlHsPHJfOqd9JmTYbNyCfpDh8xx7p2D5MmSlnqJ6St7qeyeQa6nXWlYAFwb/xjeQoj+ZnpcyEFuK4/BTUh/9Wx79GCcRDrB4t3+gLhpq8/0NJv9RBNjVnAxQyOyDR9Q8wixIIJb25O9/fsAewvQYMlTW8Vc6mDEVVF/P0fcrOQwhHTBioEuGQfJsKWWVYUE9O++AcyA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b13c37-2eb0-4fec-c929-08d8607c2d96
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 11:22:53.1322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QaqIkKiUM4WIkteknSqG/o1EOgzMgvwF80h+SCAi7q1Q+5EJQuFefgn2BuDS1gxR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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

What should that be good for?

Am 24.09.20 um 07:18 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 39 ++++++++++++++++++++-----------
>   1 file changed, 25 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index aecdb2d92a54..0ad02e27865d 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -73,27 +73,38 @@ int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
>   	return 0;
>   }
>   
> -int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
> -		   struct ttm_operation_ctx *ctx,
> -		    struct ttm_resource *new_mem)
> +static int ttm_bo_move_old_to_system(struct ttm_buffer_object *bo,
> +				     struct ttm_operation_ctx *ctx)
>   {
>   	struct ttm_resource *old_mem = &bo->mem;
>   	int ret;
>   
> -	if (old_mem->mem_type != TTM_PL_SYSTEM) {
> -		ret = ttm_bo_wait_ctx(bo, ctx);
> -
> -		if (unlikely(ret != 0)) {
> -			if (ret != -ERESTARTSYS)
> -				pr_err("Failed to expire sync object before unbinding TTM\n");
> -			return ret;
> -		}
> +	if (old_mem->mem_type == TTM_PL_SYSTEM)
> +		return 0;
>   
> -		ttm_bo_tt_unbind(bo);
> -		ttm_bo_free_old_node(bo);
> -		old_mem->mem_type = TTM_PL_SYSTEM;
> +	ret = ttm_bo_wait_ctx(bo, ctx);
> +	if (unlikely(ret != 0)) {
> +		if (ret != -ERESTARTSYS)
> +			pr_err("Failed to expire sync object before unbinding TTM\n");
> +		return ret;
>   	}
>   
> +	ttm_bo_tt_unbind(bo);
> +	ttm_bo_free_old_node(bo);
> +	old_mem->mem_type = TTM_PL_SYSTEM;
> +	return 0;
> +}
> +
> +int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
> +		   struct ttm_operation_ctx *ctx,
> +		    struct ttm_resource *new_mem)
> +{
> +	int ret;
> +
> +	ret = ttm_bo_move_old_to_system(bo, ctx);
> +	if (ret)
> +		return ret;
> +
>   	ret = ttm_bo_move_to_new_tt_mem(bo, ctx, new_mem);
>   	if (ret)
>   		return ret;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
