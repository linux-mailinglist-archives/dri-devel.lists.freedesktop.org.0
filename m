Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB54666B61
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 08:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100DE10E884;
	Thu, 12 Jan 2023 07:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE5A10E884
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 07:06:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzSOIQ8dx0cNRle6V5k6CQiUdA0kB8nZB/FIoPjL3bcAeGWaStOStBXokfI2YJj4bEjOaoEGEyKgpQ1R9/7XxgH9X2E6zsKzVirC0DnlFNokHWZjHD1zVaoT3s5v7ou3eyb+IuQih3H6rMWHpHBCTeqAI+8n5wr3n5lCmaT+4/8QrzwHB7Cq5IkyJRGW93t7ZhDyv5J93obYBCndWuvZYod9b2gJqQXNlYlAiOqJ3kxJm4pYVJFKYC6keDdmchqcOvuh4QCEdMVVGuFN4iU7WCNufdwx2AVqNPcimA5OcuWBjbtJT6jwKTmD9+PfBz/CVK8bCSl8RcSdguI2sjpL2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fc3mXUOzy7xT7Wy0SC+xjub6YbXFKdVzN/1h6SQs5uw=;
 b=hHRc7d0BOoek439+qItoZGk6STbDQmMo7e1+CDNhn/OmdUuwxoaGLxq4labbLWAWih8uWW+iDQmbjAjBrG7iLE+UcvBN5rEK5MZW04Ye9uVHhV91uYbROabJ0tBKVBnffV3egLvOqrhM22fBPnjEhROngGgsQCrIdx3KDyy056mXNguHvrP4S5VcF59uvgT0CzXbObvqyuZljAh0zM9W0+v2Cy5SMaGnSKoTTHffmlZhGqOkKaRE6EbhpBJVwoRyDn2XljvDsos2OR0/hCLrBZsdc9VAYqHBpSYgtfybg9pqbb+GmZTBQftrwBRWU0X4kUSqXwBOBtVdtIF2Q9d+cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc3mXUOzy7xT7Wy0SC+xjub6YbXFKdVzN/1h6SQs5uw=;
 b=T1xSHNaaGhnNZIPVQA9d1tHgrT4KGioyZMYeUaUCN6Ziy0e9dx0xUcN0NKmXzizlvgCGqjgQ9tsQRNEqFf/1+oghAKwsjpjK4wW8a4ol4kQafRtXXdRBR2jB4YSWyF2HhgTO6PuSaeRoqInNQMR6eIYsETN9cbZ08PhzKQdBgfg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB7360.namprd12.prod.outlook.com (2603:10b6:303:22b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 07:06:11 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 07:06:11 +0000
Message-ID: <e19ffaee-c31c-2959-f3c5-463c1a8e4aad@amd.com>
Date: Thu, 12 Jan 2023 08:06:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/1] drm/ttm: Fix of rework on ttm_resource to use size_t
 type commit
Content-Language: en-US
To: Kevin Brace <kevinbrace@gmx.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20230111224544.4837-1-kevinbrace@gmx.com>
 <20230111224544.4837-2-kevinbrace@gmx.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230111224544.4837-2-kevinbrace@gmx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0207.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: a5e210fc-1db4-4f3c-8167-08daf46b7c41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AOPRvn9Wvh+OFztLXWOBpAjxrkQuhfkAD132cSHVhxZ58v1kW1uPKjPKPRYr45x955fV8Eqy6qo/xi7Lgk+oxYsjfHID4wjLlGYRTspcGlR2vQX1mVM9QBX4ZTRv7/f9ryA+DfHsq9I0t+58t3ltsMYa9PSJI8xnB2eyIGz+Duwe/gTbckR6Cn8j38Dm+r/UA/v75DO0wZYGi6mAfavvHxO93iqF/P+3eTxRO9gzdnuxo1BJVzA4YOfq10s7eyJxpOPPXPVqSSpYh7f1lcexLl2KhZ6XND5rkmfPkkpDFSwSY6tMu+eqQtcmrNVxenNqiMf7QOunIZRBisYm9xcH/HmShMRhWXAiYoaThBSR/USRqiPbo0UFJOx7YFYHI6HCvYS/7laNnAO/cINvt2XVz/UfUJwyx6hTziCE/YF3xP/XU+yc0rUswmqu9KM3VQKkPrfmqpsMUEmDvnuInIkjYITGDBVo/7fUSqb9yOVh4/1v/H5A/J96KeGNSBNj7BgX32SJTzy+I7lbfkHDAhjlUw5pS2ibCKSo6ErAw3pscRmBB00Pq88SjBCBObeDLBBUortL3p1Ai0WbuSD4ClL5NtdbWwKHY+IJ6DeVydXmic7I3qBRj7wERzE2Pl2gHhXwracI2KkiBM1upM1fLHY1Y5T4FS35EhopSYGimfetQUfHQChdOONFgL6FzkAbtDn7/BgU8N2PHSqxlL1CBrQbqaXpEKkvW7EulN/E7GZ7Q80Kn9wwQvxUoIZuz0L5LQHCa/FK5BUvMq23wRLY40y5dC4gvW6ExCh3AikGtv80PA0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199015)(66946007)(66476007)(4326008)(66556008)(8676002)(316002)(110136005)(5660300002)(2906002)(26005)(8936002)(41300700001)(36756003)(31696002)(83380400001)(6486002)(478600001)(6666004)(6506007)(38100700002)(2616005)(6512007)(186003)(31686004)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGRLM1pnZHBrcW5JTDF2Um9XRTVjNGFIMkM2d3BNQUNvZHo5RmFjMml5ZVlF?=
 =?utf-8?B?NVFIcGlGYWhCQll3QzlsV28rQmVsRi9ENXMzZ3VKakJtQmJxTUdRVUJGb3RB?=
 =?utf-8?B?ZHc0alRYNnZmOUZiVlFWNkVVMTNJcXl2bmR0MWovVmVKcGgyRCtjZVg4NDc0?=
 =?utf-8?B?UzNUYVhUTDlPSGo2ZnlIUzhqWHpzcDR0b3JKaHMybVdLc0lubmZ0Mm11K2Vi?=
 =?utf-8?B?OFVvd3FGaFpTSWpJQWpmM3FWc0FOdWxCelU3RWttT2tiRDNIQjJwT1NEc1k1?=
 =?utf-8?B?Ry8yRVJpZXJMbSthbldkbzhDVTAweWxneUIyTUllNTdjS2l3RDFsamtjcjl1?=
 =?utf-8?B?QUJUQWhGczZTbUxtcGNXQ0R0WTZNaTVRZXV6WS9FYWpZVG1LcUl5cGxHVVB2?=
 =?utf-8?B?dmt1bm5rWGIxc3l4YWg0eVF5RDFVdjdhcFRLbk0vdDh5V2RubFpKSVRsM1d3?=
 =?utf-8?B?cE5QUy9WNGtWaWdlUVMya0h1ZUpWWUUzMUlncDNkRERsMG1tdUkrcWdFVEw5?=
 =?utf-8?B?ZGRLT2l2RnVMVVBubjNMSExNUmxJWDFNK1k4OUloRnVSclZETVFNcFd3TzhU?=
 =?utf-8?B?U2NVZXZrd1RsSm9kRFVwY3QxR1lFckd2Y2hDYndyeHZJMFJxYWcwRmZ5Uk9U?=
 =?utf-8?B?YlFQeWYrbmxONitDb2VMYUl4bnN3MFZWTXlDSjBuVDNScFZ3MVZXcnNmMU9P?=
 =?utf-8?B?Wkt4RmxLS3lmMWZsUDVlU1dUdU1GYmFtZXp6akZsTld5bFdVdnRUVmRaVHZr?=
 =?utf-8?B?VnNvZGgvK0ZGTFl4cExGWm5DYmR1VVZ6T3pzRlpIYjZ5S2ZmV2dmdGhENkg2?=
 =?utf-8?B?K0RuNmxkQzZIdE5kOFpXSGg3bzdoSWM5ZXNsajFQVFdmd1JsZjhYTEJoWS81?=
 =?utf-8?B?TERONVZUTG1GTkNFdU1leitmcjhkQzY4T3NPZEtWSjJKT3lJRFh6ZUtkTEN2?=
 =?utf-8?B?MVIrOC9BR2dFRnJRb2xpVzRpekUxa0x5QjB3NTArczRBanhVSHphMlZuS2ZW?=
 =?utf-8?B?SFBHaFUzZXVIeXE2M1hnNUZhV1pMMEhQQ2J3TGdBUFF3aVZVeU0vU3ZhOGtr?=
 =?utf-8?B?N1NJS0wweW5oeUhxeFVvdWNEOWFCSElQcDJxTndtbmR3eTc3d0UxcitxV0E1?=
 =?utf-8?B?R0x6VHJ2TWZlcDdqa29hVnBJdkZRMFNiSVVSOU1BbWhNZlRKcTRhcmp6dnFw?=
 =?utf-8?B?VEJHTkN5WFIwZUwvbnNIZTVlSlhwbUdPdlhyUnRjWlB4SndCdWl6ZEMyRldB?=
 =?utf-8?B?ZzJESEJaYVlROXNpZXNrSjQzaTVDeUUyZmxVUGZ2S3VqVml4Tkh4aHhvbXpW?=
 =?utf-8?B?YTFOdkpEc0ZOV24vZkEwRUN4WHVHUElGTkF4V00yRGt5UkJ2em4zUFE3RFQv?=
 =?utf-8?B?bWdER0d6eWRmM3NjakZVMlVueUUvRi8wZEJid015L3RQZDNrT2ZuejZqV2VT?=
 =?utf-8?B?R2dOZXpRdTNDV1FEellrMVh6N0pjMXQ4TjFneGpjUlQ3UjNHMGM4UG10ZWRB?=
 =?utf-8?B?SmVxUnVwSjVWRE5MZ055dWZ1V0RGWnZjamJ0NGN4c256Vkl2OEJLdkNMcDhU?=
 =?utf-8?B?Nm1acHA2OEM2VUtmczlWME52aFlybUcvWjF5K3VEeVovbjJ6WGc0clpqTG9o?=
 =?utf-8?B?bm1kN0UvTVJHL0xsNktEV0Z5YVJnYm94RnMvOWMxaXNYb0lETGZxTUlUMlBy?=
 =?utf-8?B?NTZmSHhKRmY4MjhlUDZWTEZyNkc0MXd6Ukg5cFVXeWNBT2xId0FuakhMcmp3?=
 =?utf-8?B?NE4vWmRTTUFJbE0rcWMxV2hGRVFGWUN0aHEwdlhaNUlsMDFuRWJFM0hTZW54?=
 =?utf-8?B?Qi8zVjVvMEVmRmZRejdQekJtamdsQUx3Ris0TFA3QWFDWnV2TnFBU2hGZE1C?=
 =?utf-8?B?aWhqT3ZOWjYveHlwbnpRRiswSGdSWXBZSEJVUDNJdFZpcENucUtoR0tFbjFx?=
 =?utf-8?B?aUxsVXB3Y083cU4rZEdTL2NnUU55N1RaeUN1Mlkwd2pnUDBuRHgwdWFwcWJX?=
 =?utf-8?B?M0lUeFBVbFlmajJHaG5mK1V0dmNzc000cEFiMitpUlFva2o2Um12Tnd4cUY2?=
 =?utf-8?B?b0xwYXVOTlNtUVQwOC83V2xvc0duWTNxT1p2WUc3OTRwLytCOUJWbGszUjBH?=
 =?utf-8?Q?yahKEmPlRSOJHaQgdL/S/JwgF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e210fc-1db4-4f3c-8167-08daf46b7c41
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 07:06:11.2192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T3xv/Pb9T+uldGnqzEi9IC4nn5Gl8qR+kSALpEDhG/4Dpo1C7rSdHv6DYYFq20k/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7360
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.01.23 um 23:45 schrieb Kevin Brace:
> From: Kevin Brace <kevinbrace@bracecomputerlab.com>
>
> Commit e3c92eb4a84fb0f00442e6b5cabf4f11b0eaaf41 (drm/ttm: rework on
> ttm_resource to use size_t type) reworked ttm_resource{} to use size_t
> type size instead of unsigned long type num_pages.  In that commit,
> when ttm_move_memcpy() is being called from ttm_bo_move_memcpy(),
> the code was changed to specify the page size from ttm->num_pages
> instead of the original code's dst_mem->num_pages.  Since the commit
> is about reworking ttm_resource{} to use size_t type size instead of
> unsigned long type num_pages, the commit should have specified page
> size converted version of dst_mem->size.  Use PFN_UP macro to convert
> dst_mem->size to page size.

Zack already came up with the same patch, please review that one instead.

Thanks,
Christian.

>
> Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index ba3aa0a0fc43..da5493f789df 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -173,7 +173,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>   
>   	clear = src_iter->ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm));
>   	if (!(clear && ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC)))
> -		ttm_move_memcpy(clear, ttm->num_pages, dst_iter, src_iter);
> +		ttm_move_memcpy(clear, PFN_UP(dst_mem->size), dst_iter, src_iter);
>   
>   	if (!src_iter->ops->maps_tt)
>   		ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, src_mem);

