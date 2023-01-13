Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6208E669313
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 10:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BB310E9D5;
	Fri, 13 Jan 2023 09:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C31210E9D5;
 Fri, 13 Jan 2023 09:37:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXg+7IhNZvt8NRodiH1OIsso4HHL7tJziz+G0w/YRe+0U/wExWq39273SuXzMbcqWzjIi8oK7AokLmpC3dYyqDHfKoyRGdN3v9dtG+/My59MY5n34N7UYjSSjsQZiKXz+ooqL0c3M0D778BXjGljEPl0sQOufp0k9jvV5X1hFNnO4dfod0sMLLR1dBC4p1ETwECq68siUkloNKS8+vuAO73z/LnW5pC4r9EZsMF1eO3eGu/le/M8z7Fh4k/C6f50zy6HB2dpwsXp/3C9orLXZ6JBW/dU4UOpa00eprB+cNZXh3ssOxDvZtnPfb7BmEgNIDrb9CvUK7QY3bvAj0IQWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3T6OToisLuYuD5oT8lRaeTYIqIhJkGb32Rv85mdvpDg=;
 b=Qrt+UaiLV0KFt5hWoj78af0xhcYpk4dQwYe1Mibq6QyeHaGrIE/JsgnsDgk0dJ0Pv/HE5JpaEDDgYpmiKpLgNK7GDFnJfN4Hhgo2l9Q71vHcuc7fOJp+HvwxZzqxH/scTxvplDVXZRNojwfk56Hon2Ym31W3H77jmXqOQu+rFLR+I06Ez0gc+mmiorWhqIRz+ZpGlyAXZSzUrbL56kRJ4xjLbeaA9MGJsufkkvzmnUxm6NRAzu8h1cQn2NPeSvzrm9RAY9bDeYzR+UOvH0xJjtqedYeocWvU2hcmiwmWK4iK9+FAcEFi+QIARTn+M+/DBeCUPfUvy9PCU/1zdeOuNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3T6OToisLuYuD5oT8lRaeTYIqIhJkGb32Rv85mdvpDg=;
 b=nLBY2uEmnOALm2dHEUEquxOvNANxREZIgC9LZ689KyTVnA1OkE0K1+iD+sLtEoKJ+rZPQGyUifvFcN+qrEK2RayBUkVjiGXb7VbvbrvSjB+KCRSZXFGcTgNhvWO8mvMHl7bOB2wuUUvu7utA1NLiF1ynChRUWun6tPpN/XOyTy8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV2PR12MB5752.namprd12.prod.outlook.com (2603:10b6:408:14d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 09:37:38 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 09:37:38 +0000
Message-ID: <92a649eb-b812-a3c5-01dd-2cd6301fbf97@amd.com>
Date: Fri, 13 Jan 2023 10:37:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] drm/ttm: Check ttm_debugfs_root before creating files
 under it
Content-Language: en-US
To: Ma Jun <Jun.Ma2@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230113053416.2175988-1-Jun.Ma2@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230113053416.2175988-1-Jun.Ma2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV2PR12MB5752:EE_
X-MS-Office365-Filtering-Correlation-Id: 999388b2-853d-42b5-2ba4-08daf549cee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EOh0nnv8L6bR9qjT7649i54NLTvsstxROLq5YrZ5zlPSikAj5mXyFynMK12zaovrlRo74I5zh+996nhKJ1niSNRK4XkF2mxYh2sNkmdYjbLmvVgOhS9J0EKBC7b7+lA1wTTAh2GgaqBmvHzDn39Zu/sfOeq8efsrOqJcBU4ZDQ/PpUrUiAKn4TZ0jSuUwSJJhg1GiF2zptT6q1t8yzY7avNUUyjKGxD0I6oW1ZtBJfwOzc13BeDrPcwz7KbjDxBYbHp0d6wooCFkqMYKMkwoAlm1byTB1bku6hDinomt0ZjerfPTUvwOz5FO1aWNzBfE1DLG+53WbLUiOYJiwH7joefFRHN0yMIFc/v8HKkNdMzxqeEUjE0CFBGcAVKAU+l9/0jo+SWon6q+EB1a+yfMysWS7JYooZa3kVksY0ruSooBPLRIdUct2Yt5ZX+XEdp033lzflbz59tUty8pD7giaXTAaoU1cHcYqq7PehFAUDMKNcGpVEIQ/Pa9ZHgnkstfaCjoncW27Zb7FXkuoJU58TAuVuwrRDZolpq+AFQJw7Wgkt1DI7bVYdQahv1qjtxXJh4F1/xc2xybERH6p+nXv5G4GX6AgBQjYFzbnXXh33OQ8y6e86W0ElN5Ta7eBEFroSzW/gQFqRaQbTr7epQSzkAMVdI+ciT3mq1l+s54DIsVF1/6RXeWmGVargozc2EfZP8zv81VbWta94mSI2JgnF0x9ZYJTFgqRBZAD7Go1YA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199015)(86362001)(31696002)(38100700002)(83380400001)(66476007)(4326008)(6486002)(66946007)(5660300002)(2906002)(8676002)(8936002)(6512007)(186003)(450100002)(2616005)(6506007)(6666004)(316002)(41300700001)(478600001)(66556008)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmtRVDFib1FDVGZaQXNmMEVmZXZsZWJ4dkc5RnQ5UnRzWjh4aFFJVDd0Yy80?=
 =?utf-8?B?TEM5bmdNejV3dHpIQkcxNzFqRGZySllxczdzemVoQWYzWXBndWV1NEhmdmUv?=
 =?utf-8?B?T0lMdUx3QVlHRnd3VjgzdTBQU0hiTGtOWGFFaTNXZm1PL05SNThoNXpQUTFK?=
 =?utf-8?B?QkN1cFQzSFVHYVg4ZEpyNWxvRk80UGNiTU9KQVR3b0ROTHgwSEtGUUo5S2pG?=
 =?utf-8?B?S2h3MGNITU5aZTV5emw0R2RTSHJHSDVJQ2ZCQk4reFpvdXE0c29pM1RWaDdK?=
 =?utf-8?B?SnQzR0xmaVJXNUhhN2N0Y08vY3FPNFQ0YnJDU0ZlRllPekl3NnFhMnBvR1c2?=
 =?utf-8?B?U1lzK2hUaHptYlFhY2FtUXhMc3lRMW1DTTZha1VZbjZpNnBMc2ZLWlZGa2lP?=
 =?utf-8?B?bHZXRitxRXN5dzcyZnFPUnNuSGhHQWlWYkNveEx0NnEwcU43d3RCOWpFNFBD?=
 =?utf-8?B?Vk1xc0l3UVN4TXE4YkYyWEtMN0Jxck5LTmIzZGxtTGFMVGRTalpPUFEyQVJ2?=
 =?utf-8?B?bnhZSTVEQURSTTBtOElscTFMeXhGOUN3SVRtWTAyejRJalVDS2g2bUNvMENy?=
 =?utf-8?B?QTZxaFg2NzB6RUhuL0ttNW5kOE5lVlc2Y25yazZzZGNqbnRCWTJHODJkSVd1?=
 =?utf-8?B?UDIyVjJXTnhvMG1tYlF1ZG9HVDZvWi8xQkVYbmE3d2hDUkZNSUZtbkFLNWJy?=
 =?utf-8?B?bnFBbGhDdWlWT3o3L1dpY012ZmM0cG9IL1BnZi85eHFTRG8ySVJsL29reWE0?=
 =?utf-8?B?RTdVWTFQMElFN25keUU2eStpS1BZR2lzYjBvc1dxZXpsQkQ5REpxcjRlQWcv?=
 =?utf-8?B?T1oxSjh5bG1taklibFkzOE9PdVk5K1BjYm1kMEJWS2FVbzV5UWg1bVpzMm1p?=
 =?utf-8?B?ZzJITVY2UlRIcEZ6NUJiMmg0WGtydEtsY1g1NlRCdVdCNks0eEdmVDBWNVRT?=
 =?utf-8?B?SlJ5M3Z4d3l2b3JNTUZ0STVvME80K28zOFZKVGdCU3IxR0tvNkdUQlUxZ1Rv?=
 =?utf-8?B?L1F6V05RVTVhR2hWVGk2V2dDaUtqREpuWjBBcWl6OUlzbmlzUFp3R2F5VWtX?=
 =?utf-8?B?dnJMZHBLSFQxWjQ4N0xuM3A1eWlZUHpWa1FLRDlmNkMyTEpIeFhNbEVHZEF1?=
 =?utf-8?B?SjZEMmRRalE3NW1nYU5ORm5hWTczTExSV1dOS0VoWnFiWTNqdHVHclVpUHlU?=
 =?utf-8?B?aFZjdlRnWm82MGIxNjZ1UHI3MnVzREsyRGlRZFFzZFdidzB5NkRCbWlwbmgw?=
 =?utf-8?B?L2pHMGdaMXcvQ0Eza3BwZjJVMXRZcjJJSE1DWlV2OCttaERjbURBRFU0aEVD?=
 =?utf-8?B?ZWwxMnR1Nmxvc3RYVkFqWmFSU0hkVW9DdjhydmFGcEFJYncvMUtobVFBci9o?=
 =?utf-8?B?a0R6dzUyckFyZys3S3lPWXVCSXZsWXVmcEppaUlhYk5sSGtZY0xyV2wwL0hV?=
 =?utf-8?B?cnVrUTI5V21lL3Z3bDl4bE41VGtEU0hJc1hpTzJiSXlSTVRxdmJ1SDVPcmps?=
 =?utf-8?B?NkJxZVU1alNEaGlDaUVEdmR5S0VMRXYrandxN3EzYUVNYm13STE5Ti9yZFg1?=
 =?utf-8?B?bW84RkhSdytyYytPb2lJTGFDMDlGZE1vYnZ3OTJySTRnOVNkQUpVaEwxaldu?=
 =?utf-8?B?VUROdmk0enFPNlN2aHpKLzlxYWxSSUhXaXpCdGlEa3ZteUhYUWRPOHlSNzNt?=
 =?utf-8?B?c2QyYnpvYUNzZWlidnNpKzRrQVBpdkk1WGV2ei92dXhjUmw2aGRKRjNxUDN5?=
 =?utf-8?B?SDBtYW5WdTVUWVkwVytCM3RJNW1SRkRVWEhjUTIrL0FwWXhwWHJtR2MxT1ZP?=
 =?utf-8?B?emFxYVVXUmp4czFoK0hvT2NyYXk5RW1HUDVLZVhLa0tFL2tmM1BJeGRKcTFV?=
 =?utf-8?B?Y1JIN013OWFVMjZVajZ2NjlDMGxsWWZVRWQ1RnFXTE5KYmRLcFliVlJ4bm9G?=
 =?utf-8?B?akJBeDNqL2RLcEN2SHg5NURPQjVtS1pmdThlVWptRlA1V1ZsOVd4SHQzWURW?=
 =?utf-8?B?WTlxVmNMNmtzTUZHMkc5UnBuQ2k4eFpkRGp5THZQSFJOVk1oUUVtbnNsSnZp?=
 =?utf-8?B?TUtLR0cxY250Q1pPR2NxMllqOHp5SXRhZ3N5S0t6dGQ5TXdac01VL0x5U295?=
 =?utf-8?B?VGdEK2pFK1dhdXFtRHg2VDZBSC80RkJyQ0F1d1A4NmJjYmt4NkNsMUJRa0ho?=
 =?utf-8?Q?0QTYVhqaGoj4NOsfkMmmBzsX1Fd3/tvl1ziD7ODC3Iom?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 999388b2-853d-42b5-2ba4-08daf549cee7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 09:37:38.1051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6tbJKZ52SYjkJeghvHwGvEXR+ouY3M9/+MilaeFjwzzKAhktQABh46/yeHP9XYr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5752
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
Cc: majun@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.01.23 um 06:34 schrieb Ma Jun:
> Check the ttm_debugfs_root before creating files under it.
> If the ttm_debugfs_root is NULL, all the files created for
> ttm/ will be placed in the /sys/kerne/debug/ but not
> /sys/kernel/debug/ttm/

Well NAK for upstreaming. Why should ttm_debugfs_root be NULL here?

Regards,
Christian.

>
> Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_device.c |  3 ++-
>   drivers/gpu/drm/ttm/ttm_pool.c   | 10 ++++++----
>   drivers/gpu/drm/ttm/ttm_tt.c     |  5 +++--
>   3 files changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index e7147e304637..967bc2244df3 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -105,7 +105,8 @@ static int ttm_global_init(void)
>   	INIT_LIST_HEAD(&glob->device_list);
>   	atomic_set(&glob->bo_count, 0);
>   
> -	debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
> +	if(ttm_debugfs_root)
> +		debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
>   				&glob->bo_count);
>   out:
>   	if (ret && ttm_debugfs_root)
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 21b61631f73a..d95a65f759df 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -713,10 +713,12 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>   	}
>   
>   #ifdef CONFIG_DEBUG_FS
> -	debugfs_create_file("page_pool", 0444, ttm_debugfs_root, NULL,
> -			    &ttm_pool_debugfs_globals_fops);
> -	debugfs_create_file("page_pool_shrink", 0400, ttm_debugfs_root, NULL,
> -			    &ttm_pool_debugfs_shrink_fops);
> +	if(ttm_debugfs_root) {
> +		debugfs_create_file("page_pool", 0444, ttm_debugfs_root, NULL,
> +				    &ttm_pool_debugfs_globals_fops);
> +		debugfs_create_file("page_pool_shrink", 0400, ttm_debugfs_root, NULL,
> +				    &ttm_pool_debugfs_shrink_fops);
> +	}
>   #endif
>   
>   	mm_shrinker.count_objects = ttm_pool_shrinker_count;
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index d505603930a7..fec443494ef0 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -394,8 +394,9 @@ DEFINE_SHOW_ATTRIBUTE(ttm_tt_debugfs_shrink);
>   void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages)
>   {
>   #ifdef CONFIG_DEBUG_FS
> -	debugfs_create_file("tt_shrink", 0400, ttm_debugfs_root, NULL,
> -			    &ttm_tt_debugfs_shrink_fops);
> +	if(ttm_debugfs_root)
> +		debugfs_create_file("tt_shrink", 0400, ttm_debugfs_root, NULL,
> +				    &ttm_tt_debugfs_shrink_fops);
>   #endif
>   
>   	if (!ttm_pages_limit)

