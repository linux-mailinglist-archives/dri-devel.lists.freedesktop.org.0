Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5C42936D4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 10:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A846E0C1;
	Tue, 20 Oct 2020 08:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EC86E0C1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 08:31:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dG/pa9PnHf6rLJZiBBUPI1V/kpYzmomLuuBtjtWiSUvBgsJm8P0Ay9mWCXzwGVqbLQvPjJi7sdqI+rophvOZZdPrUjJGiNc9C0BIyjuEEJAoFUTHcqCMHKENqiIlsdMazZJdqWtKQ370mOtMzrVhDRT+2XV5Jcq9C/r+hm5xGOnHFMGSTab054pnfCJPZ1yFMCqoGSrNQxm8wFZlNjKIH82ymapQREDrmZ8G1B9ZLQTkjeCo+EbrzIktDExpbMG8nlO+0rKP0rAMazMnTowtMGM9iyfmjJXbBK1gFwHCROuRjJ4RXIuEh90YgDX0B/08eeySsriMjf1WDuYv66Yz2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYfLpoahyLRS5KoYvKBxvljsoBsdyMvP3GEHMWUqGOo=;
 b=DPu6mHjtnlFmE+KVzcMXSi2FBVXTGil17vdVPnFpBtCb87gVlsJ4jyoqrRU4POOMadMCzKlvb8MAkMZvTNlqcwQMWF6JDiESUk3uVKUuvQ4XCu+4HZWYE5Z/B1PCva2nSSAnHaHVM3Qi0dWCLBU6AVSAKP3rfdENDkdXVeLV8dZIUnZ+84foZrc9Fltd+sCWrtEPf7fgtWF5l/VuA8mn5rnfWkztaNXtS46IGiipv9B8C7ZwIls/r/0gHzGUbxPbY8lh5oa42qgTM1URMpuUPK3Ct/iUWudAEBfdjX1M7y8W/F4QH3coVuN57VnfqV3FKytvoYHUESYeM7O8X3hzjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYfLpoahyLRS5KoYvKBxvljsoBsdyMvP3GEHMWUqGOo=;
 b=SPhfX37ieu3hv2HXUo7BvDCPAz9r/1minWrWVXuq1TgGiLhg4GH9hOnWBUktoj8xR+ALs6V8Gz3bnFPE1KisBhbNRSF7RgErWAdQJ2xJpJZabCyZh51cRxM1Y714jpJPB2iVnjpTE1fEdSuX0+oV4AA7rCLHSvoavPDta1CYac4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Tue, 20 Oct
 2020 08:31:19 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 08:31:19 +0000
Subject: Re: [PATCH] [RFC/HACK] drm/ttm: avoid multihop moves in drivers.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20201020041606.1701145-1-airlied@gmail.com>
 <20201020041606.1701145-2-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4d47f905-5380-0208-672b-531ba91fed64@amd.com>
Date: Tue, 20 Oct 2020 10:30:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201020041606.1701145-2-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0042.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0042.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.23 via Frontend
 Transport; Tue, 20 Oct 2020 08:31:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3bac7601-94ed-486b-9241-08d874d284c2
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39999B33E77265500BE8CC6F831F0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Of9I1PexpVw9r4yVxLDisxB6z/QUJgbH2J5h2TDaLQlJmmzcOd6yOAl3Eq65SQiagPugVYV8+harhOvQg4fV2fhh6d6hm3nDgtwrIvKDkrU3DuP0QpsiQXJaO54SYTltUVv2DcMRyuEVHd/b7+pR5Dw+0zxU0f1oFeHIy/+lDSH/TqBB6XY571BrvZfJoqlABz9kqiZ6mvkg21kIuEAZajKPNqRftE6OIIuvNlC7RieTVRqesfMpdv40EHB94XDi2cesUyEDWz0xmw7Nqj6btBSUXy+uGHViFFiS7QO6dvSJNM2P0pfA+xuHbD+eKszS8/OuEAV/jP9Jql4NOruILNS75CjlflFw7zjyJVbP8WZEdcotBUMYFa5PEtO/WntK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(2616005)(6666004)(8936002)(8676002)(83380400001)(52116002)(31686004)(316002)(66556008)(66946007)(31696002)(5660300002)(36756003)(2906002)(66476007)(6486002)(478600001)(86362001)(186003)(16526019)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: yFhApCg/ZzUuFqaoI+lF1t3p6xwslKAwUotKn5UiFg+SXajM3clQlwfG2u72kEk2wUfHao1Sdvns9VPvbYCMHKCi5QNM6oqpbfUTIOvFmIgcDrjaKYN6qK6hn/ilhImf5mYcCRdflmG1S74FQ1eKsGPo7zFJNfPJnETQw9NhUKhPp/Yn6kHhKEr7qhOcFDpG1FjnmirUOJ6I2NCp55glb5IknKNiKSRlZvaV48LwDevYrdCqYXH4hhvLtoHwYmTRs0tBNOKZExGgv36hyfmy+dk7xlBfz839KbjYtLW2zOd6qWGU0eovuzJBLF2TY29gsEHU+ZteMqtKjE1CgWxdKcZHjBM4HplqgH8T78aO66mcLYoPMLGpBAZkgvkMFEafpp1uP4ZrwiUvKy8QnQIPpfmVBUFc8+Ftow4IzfUdLIy4BUl+3zE2Kxjvh7VXTq3WK7vJPKaCIQgUJMY6A06fItylRgE4bZ5+D9yI5YHfeqzydDFvMWEaluFdr4E9fAJIdWpTniPjRX54llzsGKkI+DlDGWEIn7derpLLY+m26epX05/kioLcJOaDZz9e8yw+NJHuyp8YiQoIhZl67Hgv6Jh6b9eE3sAeWFhkjz3Vm0QVRiI8PkHDO2y063MMXjsY1uRDjP9oZNfjTKWa6LBkWPAKIn7AJ9GlTfFkbVwVmLdZ6Azjyha+poTH3e7G0XvFv9eivaMGIJRCnSn8IkaJgA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bac7601-94ed-486b-9241-08d874d284c2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2020 08:31:19.5441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0mBRDfRMQ0hl2GbkUDSdVHThLcsw4YJgxD7+i4iFmWG8p+RwqrNMpf2qiJL+Oyf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
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

Yes, please! That approach looks even better than what I had in mind.

A few comments below:

Am 20.10.20 um 06:16 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> [SNIP]
> +	/* don't go from system->vram in one hop,
> +	   report this back to the caller tell it
> +	   where to bounce this buffer through. */
> +
> +	if ((old_mem->mem_type == TTM_PL_SYSTEM &&
> +	     new_mem->mem_type == TTM_PL_VRAM) ||
> +	    (old_mem->mem_type == TTM_PL_VRAM &&
> +	     new_mem->mem_type == TTM_PL_SYSTEM)) {
> +		new_mem->mem_type = TTM_PL_TT;

Not sure if that is such a good idea, new_mem can be some allocated 
memory in the VRAM domain at this moment.

Maybe instead give the callback a separate bounce argument instead.

> +		new_mem->placement = 0;
> +		return -EMULTIHOP;

Using EMULTIHOP here is a really nice idea.

> [SNIP]
>
> +static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
> +				     struct ttm_resource *mem,
> +				     struct ttm_operation_ctx *ctx)
> +{
> +	struct ttm_place placement_memtype = {
> +		.fpfn = 0,
> +		.lpfn = 0,
> +		.mem_type = mem->mem_type,
> +		.flags = mem->placement,
> +	};
> +	struct ttm_placement bounce_placement;
> +	int ret;
> +
> +	bounce_placement.num_placement = bounce_placement.num_busy_placement = 1;
> +	bounce_placement.placement = bounce_placement.busy_placement = &placement_memtype;
> +
> +	/* find space in the bounce domain */
> +	ret = ttm_bo_mem_space(bo, &bounce_placement, mem, ctx);
> +	if (ret)
> +		return ret;
> +	/* move to the bounce domain */
> +	ret = ttm_bo_handle_move_mem(bo, mem, false, ctx);

Is this a recursion? I don't think it is, but I thought I better double 
check.

Regards,
Christian.


> +	if (ret)
> +		return ret;
> +	return 0;
> +}
> +
>   static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
>   			      struct ttm_placement *placement,
>   			      struct ttm_operation_ctx *ctx)
> @@ -954,11 +984,18 @@ static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
>   	/*
>   	 * Determine where to move the buffer.
>   	 */
> +bounce:
>   	ret = ttm_bo_mem_space(bo, placement, &mem, ctx);
>   	if (ret)
> -		goto out_unlock;
> +		return ret;
>   	ret = ttm_bo_handle_move_mem(bo, &mem, false, ctx);
> -out_unlock:
> +	if (ret == -EMULTIHOP) {
> +		ret = ttm_bo_bounce_temp_buffer(bo, &mem, ctx);
> +		if (ret)
> +			return ret;
> +		/* try and move to final place now. */
> +		goto bounce;
> +	}
>   	if (ret)
>   		ttm_resource_free(bo, &mem);
>   	return ret;
> @@ -1478,4 +1515,3 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
>   	ttm_tt_destroy(bo->bdev, bo->ttm);
>   	bo->ttm = NULL;
>   }
> -

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
