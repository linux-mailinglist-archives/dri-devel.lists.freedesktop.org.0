Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACE03FB25B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 10:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA40389CE3;
	Mon, 30 Aug 2021 08:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0947889C1B;
 Mon, 30 Aug 2021 08:21:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKNb0aX5dxl7RP1+BLMGlHr+O7mV3srjI6sUfGza76RDGwPKIlUgeoSsmSMcGY7UoeU6UsNT084xzvow6XOXeHSJbt35xqKwM8PDXadjr0LUs0FEj75Yd6oMi9vnWu6yKt+sThzoSTgvea3IpMDGwLKjwjU8Z9uSuuBqNDNfGSrOaPGW4VUSnrB3XSXCLH3ENB/fCZmLhs5WIF06mOmtA4vIqFtXtLs26K+pL7aUbXbRnQQT/5Yw7frwxxMpQnyw+qKUp/rtLpYV41Jke0Q4YcL/ls3J16GAk2NiHkCLWnrcw6uum0buP07aUzpkbfR84t9Q/9iF6hWFjKiCeqSm/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3Cibwiqzl43E495OrFqDaDip6Ux9bamQ/lWBEtrPqw=;
 b=fpHyhJfwiX0AIVS9u9eR3IcqeYpZUatxRRLL4aywhpXKGT+YbpnCThsh8yvnlra5PLwvc4m11NP/Hg6kMJLLZuLgNoT9DnSEqdFeLQxcb7h+JbdudApRGg8T4MBYits37jr1lGhGk8+8Zh3G6BAqrW43yEJsvUZHHrVntb4zuz7flm5CW3KPoj55yjVm1sIrI2Wg5g6QAx4DRY9Im6iSN9+R01w2NNsrT24BxsRarNQx0OX7eoqLT+X6nKUQPrAAOFLt6bxS9Xkvaw15SQjcMsP4BPH3zk6m2QGUGRxgXtOJiwCPSzCdMNkXk6E7qxyTQN07YlLNPxVhNtAx7c7oUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3Cibwiqzl43E495OrFqDaDip6Ux9bamQ/lWBEtrPqw=;
 b=yCJdwrGhpSOQL6f1Wp+lbcbo9pyVROB4/ixUy8elxVWQv/9amXEt5emTj2mfOLs+Pg2ONsPASmTcGKo9EQklz9QSBxVJo9DWkiItEQwDtk6NBu0aKgzoHYVJTKRzEX9tnIr1wyCRChEsnFNLIKm6xMKYR4H8vsNFDR6SNfe4HYg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2449.namprd12.prod.outlook.com (2603:10b6:207:40::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 08:06:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 08:06:33 +0000
Subject: Re: [PATCH] drm/ttm: Fix ttm_bo_move_memcpy() for subclassed struct
 ttm_resource
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Ben Skeggs <skeggsb@gmail.com>, Dave Airlie <airlied@gmail.com>
References: <20210830074835.16596-1-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6e831c94-7b87-3a4f-6896-fa13b90783f0@amd.com>
Date: Mon, 30 Aug 2021 10:06:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210830074835.16596-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 PR3P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 08:06:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f552b11f-5fc3-4f9d-08a0-08d96b8d14a2
X-MS-TrafficTypeDiagnostic: BL0PR12MB2449:
X-Microsoft-Antispam-PRVS: <BL0PR12MB244948DF8B9E1FAAFD96C21983CB9@BL0PR12MB2449.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gGGi5ZjONM4tv4YoXJudkGlFquBUMvhvFYxloOoUjYO338WFYodliQGKCkZbKGukvgXnQ0m78FveoZKDdeFW3YoVulNIRsSsidAERuSe4/lc5cuN4KY2xncF45akQX5ZSmnJ1AMKwRBpTACKlL+tnSHBm3DVHH7BeQ2r8QCAbkTo74HfKgjIS34eQNXee80ZOgFnJsiF8A0VglkQKzeptuo2LwyBCXujqEMMhAckxmEcEzTg+nCePLx0VTjNiwSqo0vgoC12DIL4Z2WspmHIG4S4u7aJY63CfiCosw0H4UDiSSOfwululUUViSgPLZa+uplQcmEw/JWCxFhpN3l2ef+ngBbf8MgGxlq7SCD5xpLRHh4WZf2P8E/VgTGZ/MXwhPk5xtfUGetUjh6ji9m7ZGTwTFGjDcoejhe9BxCX4/iwf2cQy2IbUIoVl6byHcDZrhQdNZN8pwKGmWNKYe4ATQSAJUkeEfQUqn4CHfj2N8nn6lp3o2dJBPOOwBSZBMAImt1HNF8AGxFSR4pEsDO63ojmIN2CmiZvc5dsOAl6ATrAFft2EL3CbLA92YVgXfPBtbtyuiPcsuSKW4uCGZ6pL5apVpt37bN33YXxWMVW+WbIWLWpe1E/w/7XdmYh7rNtq6BYhNnG/0QN9hgJaUtQPEPss+Py00vGGQbUOTA+H+4VTQG7cjE8jvmBRLBe+tDQLWf3FNZfLiiEWlbiiT/4O/ESo1OzfNC1dB7RB53aqcA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(86362001)(5660300002)(186003)(956004)(66476007)(31686004)(316002)(36756003)(83380400001)(66556008)(66946007)(8676002)(38100700002)(8936002)(2906002)(2616005)(6486002)(54906003)(31696002)(6666004)(4326008)(16576012)(26005)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXdXc1dFSytYR3I0ZlBoU1FnRUZFdS9YZm1HTVAyWmZTcjFqRVZ5STNDaFZB?=
 =?utf-8?B?NVArKzBnMW04dEl4L2l3MFoxTnlSNXlqajRhdndEVXB2ZTQrMnhldWxPZW5B?=
 =?utf-8?B?ZWVjVjE3eEhEOGRzVVdEMFFYL0xYT1RmbjFERFZjUUN6S050cUpUU2R3bVYv?=
 =?utf-8?B?NkZmVXFTQzFPZERua2dnUmVOaTBDTjVLZ25UbWNUV2psZWhZajlpZ1JPU01T?=
 =?utf-8?B?OC9jVVRFK001eGlOTVBFMk1Sb1FYSVBQYWRWUXN6VTJsRDJiZFZkV2NUUW9x?=
 =?utf-8?B?Y3FkeDNIYU1lRE80SzQwZE42Tk1IYXRvNjFNelI2ZmVuaEVRZXd1TFk4OUNs?=
 =?utf-8?B?MlQvaTV1YU5JaFdFQ2o4MHcxU2FHM3k3RDY1SDZhSkF3ZHpKT21teVBHK2gw?=
 =?utf-8?B?NVRld1MzdnJaRE5aa0c1eG5wYmxkYmM1QTFHL3ZTNWxLeGtFQldmSEcydnpF?=
 =?utf-8?B?YUs5MHdZd3hBcjB6TU1STDZEcng2SER1RUYzdnpIMzlhcXhrWmMvN0JnVUxD?=
 =?utf-8?B?Ynp4bk9VdXlvZllyckFsZ0FWUUx3NjhscHp4K20raDhyWkxRclhGcURZKzRq?=
 =?utf-8?B?MEpDWjNmcXlUK1ZCdkY5TDFPS1hPcm1RQ0Y2cTh5RFFKejRFRXZWSWhZL1Bm?=
 =?utf-8?B?RzlJVDYwMjJYMllySG9wUzFJa1ZaSUkramJkcnB5S3FBelBFWUtLU3hLdE81?=
 =?utf-8?B?WTdOUURETXY1aEpyVVdQNUZidEg0QytQSThVZ1liYzIrZDdQVkxDNTZCNGFJ?=
 =?utf-8?B?TXlsMHhsWlo2MU9uRURpVEFqRDVxdzAvMGU2RWFNekp5RHFGTEl2bWF1ZWFK?=
 =?utf-8?B?TnRtZUhwZ01oMmwrK1F0UGU1QzdqV2xIU3RUR1FRUE9xTkpsWjhmSVF2aXdm?=
 =?utf-8?B?QmMxc080bG9EREwrSWhCWXlDK3M4aS96NHZ3a3A4bDMzNUdEM1g3ck9QaWFC?=
 =?utf-8?B?a2RrZVdmcis2ajMwODluUElYcEVBb2EvOGswVFBRTmptOTZEOTJGazY3N1hr?=
 =?utf-8?B?WTdwMW96azRRRHp2cWtHdE5oaWIvQitwdkE1TVRoQXc5bTByOVc2Y0xLU2w4?=
 =?utf-8?B?OEJKTGdFTU1Vc01lSytFb2Q3QkxUVjhKSEl0M0dKZjZ4c29STUZiVGI0NXlK?=
 =?utf-8?B?aSszK2tiKzBUZTlqSDJRYXdjVUQ3enhnWm03Z1FGTEQ2Zk1iWUVJWFovRi8r?=
 =?utf-8?B?cExaOVN5ZHIrNU1oeUUwQ0gyc3BGRjJEYVJyQXhCc1l4OE8rK0lPS2U0aXNy?=
 =?utf-8?B?NThxdzkyYlE3NFNLM0xNeDAycW5mNE5UVFVhSFRZL0xQeFVBRGJCbk1PVUpt?=
 =?utf-8?B?OEhzODR1MFp0emR0c2xmd0pOUHk2cnhaVVB5bEhKejEzRmw4RWlYVnh3K1BN?=
 =?utf-8?B?Q0R3ajFyYmFtdkdqZW9hd1ZoOGNJQjRndWpQczJFODdSVDlIN2lGV1haNTMw?=
 =?utf-8?B?VktlWUVWblVEa0lXelpBYTMrbHFGc045NDdVY1g0RkJrejdlekNOR0NZMFdC?=
 =?utf-8?B?dTVVbjhGdFZmZU5ra0Z0eko0aHhycW5YZ1Z2NDVWM2NGMGx5a0FscGRNSTFk?=
 =?utf-8?B?UCtvRGdnYThyRU1YUHpnWWY0MEQ0WmplbXNQZW41bTNzVGZicGh4SmdJWFZr?=
 =?utf-8?B?bTlPOVVjQVgxa2t5alJjZ0tsVlk2eFAvODlxSUpOK1BubzBLU1RRR3RHQUVn?=
 =?utf-8?B?MlFodXVhRzVENHVOc1R2TUpLYS80eE1TWFYvN3EvM0xJUHozaHVOUjluakU3?=
 =?utf-8?Q?sfi1Ko0nMm2serQKzcb6mgfZRa75SH2M71YCQFV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f552b11f-5fc3-4f9d-08a0-08d96b8d14a2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 08:06:33.1609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ELmlQHKWR/IXYlDl8g53cTucLkhVFV5g29WPbBBfCI0ISQnuhs344GObxW6jQcDN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2449
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



Am 30.08.21 um 09:48 schrieb Thomas Hellström:
> The code was making a copy of a struct ttm_resource. However,
> recently the struct ttm_resources were allowed to be subclassed and
> also were allowed to be malloced, hence the driver could end up assuming
> the copy we handed it was subclassed and worse, the original could have
> been freed at this point.
>
> Fix this by using the original struct ttm_resource before it is
> potentially freed in ttm_bo_move_sync_cleanup()
>
> Reported-by: Ben Skeggs <skeggsb@gmail.com>
> Reported-by: Dave Airlie <airlied@gmail.com>
> Cc: Christian König <christian.koenig@amd.com>
> Fixes: 3bf3710e3718 ("drm/ttm: Add a generic TTM memcpy move for page-based iomem")
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 5c20d0541cc3..c893c3db2623 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -139,7 +139,6 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>   	struct ttm_resource *src_mem = bo->resource;
>   	struct ttm_resource_manager *src_man =
>   		ttm_manager_type(bdev, src_mem->mem_type);
> -	struct ttm_resource src_copy = *src_mem;
>   	union {
>   		struct ttm_kmap_iter_tt tt;
>   		struct ttm_kmap_iter_linear_io io;
> @@ -173,11 +172,10 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>   	if (!(clear && ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC)))
>   		ttm_move_memcpy(clear, dst_mem->num_pages, dst_iter, src_iter);
>   
> -	src_copy = *src_mem;
> +	if (!src_iter->ops->maps_tt)
> +		ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, src_mem);
>   	ttm_bo_move_sync_cleanup(bo, dst_mem);
>   
> -	if (!src_iter->ops->maps_tt)
> -		ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, &src_copy);
>   out_src_iter:
>   	if (!dst_iter->ops->maps_tt)
>   		ttm_kmap_iter_linear_io_fini(&_dst_iter.io, bdev, dst_mem);

