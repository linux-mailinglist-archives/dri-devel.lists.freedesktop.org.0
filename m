Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E03679A6F3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 11:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFD710E22E;
	Mon, 11 Sep 2023 09:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A6110E22E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:48:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtKIUNfdgFKIW3NdtH5FsdvbYUjBHABg36MRT0eId2PUVnGuX9n97c4GyzL0idmDazwVMbpftELRuXOvi+NoBpHjajYvZ9f7170YboHZAJXJw+SGlWdkWXB8tTXR/avzM3veUfIKlmb4DD6PH5kCg2T91BDmHrlEMvCVfXcQx1ouSXmFa0pwjspU2cP6UkyCTXZtD0qf7PcykQHo7ApEVtzVxirgYKMPMGW9Lbfo/NFq96NSKwn8S6+vgasPm8OJ7Ny9Bd3D7/HLMqgUxHgqG82kkvj0Ap38GH+90FCqWEPvlkGlb/YaAP3tHXx/ffNTiybaPXgADhrV1flaAYBQqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2uEhVECCncl7hA37mt7/jWTe1zjpAOxYbT+TCoQozU=;
 b=TpOUCWI4aNNlky/ry3KwonxlOVv/y8tkHOa7MeMH3oeC0oSqsntfpqiyv2fpLXoKvNct0mop7ugmi9A/SPv18G8tf+PLyqFTG9BfBKjtjMy8HV9I3mgZOZH2xajwwyWBXWXuCtkH8NHKRQQCri8VGCYWtiix7qQ3eRE4wM0Ceri4LauDOjDiQK+kawry7LpchqiUQIea2lUJmnbfU6F3+UZvRT4QZuCsWmOELEfNnoC3E5zKxmnH5WnVsKlLtc1KyLnIDdedWKLst9FQwYV24QFDMBqIoRatbyVtb9Vd2pYrWa5gRVYVgfbVkb8e2w+8G0Hrb918D7tK1c8I6T9kxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2uEhVECCncl7hA37mt7/jWTe1zjpAOxYbT+TCoQozU=;
 b=Nt0pOE5/HlFwD+rUG5Pl2cmEn9aAG3oy/AO1u+RAe/tCBwvB57zA2y/z3YGETg3MTT0PPNdRQplhWuhbnacnztl494UvS9Dy9KwuzciXMBiucJ2LL64OPYyY8saHmO8pVPSashinANaBZpqBIykGNATENW0Wzfatry/D2lCXfB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB6113.namprd12.prod.outlook.com (2603:10b6:208:3eb::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Mon, 11 Sep
 2023 09:48:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 09:48:55 +0000
Message-ID: <71c435a6-ba43-5d26-e658-f55bddbb8b98@amd.com>
Date: Mon, 11 Sep 2023 11:48:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/9] dma-heap: Add proper kref handling on dma-buf heaps
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-3-yong.wu@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230911023038.30649-3-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0110.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::39) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA1PR12MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e2b64d-ebfa-4b2a-40e5-08dbb2ac5046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L8995o9HvicxA11Js2PxXk8ptf48jmMYy5R2WwEW8EsRoUgwZJv+9MTl+svwfp+i5tWFQkQ4gZIuw9upy2SaB9c02fXQ0Co3Mr9LW4mPTMLaDd5D1ae+zZHhhxsvFL+WaXVPl51Ws6ZkxIHuA0WlOewPLsjEO+WUoNI3d+T6DRXMnmRLRJSMcmVTUhVG7h6o+CwKXnAlpZCkwbYttwuSmq1wjQ0QckAiuil31qU6LFqu+gJ8MM6tEnzIeG91TrDoRU5OpgcM2JrD1VuCy7pAdx1jQUpNma+Xq6aZPVIWx3BZaX9hMX2iX9XFqUPXgh+5BCivwdJiRv/LbltXPEANyW5Y0Z55N0FEOAnE7FtNxp1x1fdXf2r00d2NlvibyWKtcnoBYLXi1L28X71EMjrzCNyNtJExP3OySTV5JWm6HqCxllyX5twaTR8AdXl7azgLwqDBnc64ZuTdvLzz8jTe+ySxnSa+iM/zf4By2aE2UC6VgwDLzO37WAwX+1oopcKQawX+cyfxDyAYoW1Guz/kJu6W1nYs1GAQ82GLjW2W8yt7JCYWQzkML0BPcgHdLMZOFi1z5grio/ulqz4idcN14TFdE6doRq0ETFCtz9hTambW8YcCeBNe/gItOFhnnw/i1NutUQYbZwXkVJlD/OJu+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(136003)(366004)(346002)(1800799009)(451199024)(186009)(41300700001)(316002)(7416002)(26005)(31686004)(2906002)(8676002)(66946007)(8936002)(66476007)(4326008)(66556008)(54906003)(110136005)(5660300002)(478600001)(6666004)(6486002)(6506007)(6512007)(36756003)(2616005)(83380400001)(38100700002)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkIxVWdCYTgyUUF4NDJ0dHMwbjdlaHdPWUtzYjRxYXo2UCtEUWNnRld1MzBm?=
 =?utf-8?B?eTAweG9KbDBFN2RKcDI3UmR1YzlraGg3emRiU3NYekVXOFZTTnZHQUJlMVBX?=
 =?utf-8?B?Ty9oWGpraDRyNXZBbFEycW5aVmhkaW5JdWEraHRFd1pnQ0RmWi8vWVQ0Q0Rn?=
 =?utf-8?B?b0RtMksyK2pjMitzN0d1V25FdmVVeHN4VFg1UGNSWVI2ZzJwM1h1YTJLWHk2?=
 =?utf-8?B?SEtMcWN3aHJydGk3KzVhMEhnMSt4Y1lkL2pxMWtZcXdHWXlzeENyeFNuQmdk?=
 =?utf-8?B?akFIclRtaWNyNm93aE1hREc3TUtZLzBJQWttMGNsVVE2MmZGNGY3NDFZSmRV?=
 =?utf-8?B?clRBSitBUEwreVkrUDdES3Q5YjdCU0VuYU9VWXUzOGVYeWlySlBDTk96ZTJk?=
 =?utf-8?B?NnhySGpSMzdpdzFEcDhqVVU0TDBTM09nNFkwVHNYUUdFUXowcW15WEw1TEdL?=
 =?utf-8?B?czlVdGhWN0hqYytxaUllcUJIbUhhQlY5M2FtUnU4ZXNIREE3YVFiNVZhQk5n?=
 =?utf-8?B?ZXd4TXpweE0wSFc4Q0EzeEFiUlFna3ozVk11RDlSRGpXaUJacDU0ZDlnVzY4?=
 =?utf-8?B?clNlUGh4M2dISmRtTU1ZbmpWcHJyNlRYcTFNeitBSXhXUnBnZUZKeGxFTHA2?=
 =?utf-8?B?VURMSGlTQ1A0aTBnYXNuN0xabWpSY0txNFpxLzhUNnZFSEM0ZDhVWjF1NE42?=
 =?utf-8?B?WDdkWWgrUGw5MkIwaFZiQU9COE9pUGtUd2Zpd2NjWDQwRlBYc2xwY3Mvakx3?=
 =?utf-8?B?bnYxOUQvdURLeHd5dHZsd0dHTGhTWnBpOVY0ZkJ5L0RaY0ZyTXBUbjVOUHVN?=
 =?utf-8?B?TkF3MXJaZ1EvTVVtZGRHYmRqUlNCbndicE50eEhPdS8rb0xaNVNWd2tiUHc1?=
 =?utf-8?B?ZjE0VFJaOVgxY0lEUkdnZk80WXNCVkc5QUIybElCNTVKb0JxWnU5Wmxjem8x?=
 =?utf-8?B?Y3F1OGpuWG9JYWUveWJwaC84Y3NGd0tkRHBpWlBzY0diZkRjM3pydm5vaGlJ?=
 =?utf-8?B?QnVLSlh3amdPNm9hcGt6eVJQdXg4aFhNNFZvbFpGSUdEVGRxb1pweVZPUHZw?=
 =?utf-8?B?RUs2Rk4wRXNzYkZ4VUpjR0ZYa24ySS9hdXN1TTFQcWo0QlEwV3pDR1JiSEtS?=
 =?utf-8?B?TitVK1FoRHZVYmpTbTNQTjZucm5RRHJ1ZmdEalM5ZDRpWi9QNUQ1cjZ3T3hi?=
 =?utf-8?B?Nk1GQ1BsOEphUHVBOXhXelRkeWNYeldvK09RanpvOERycXFJNDUrUFZEMXlW?=
 =?utf-8?B?VHdMRGZmL1A5WjA5OXRtNEIzTTYvc3c2cS82bEVTekU0K2RISlQrWUx2b0da?=
 =?utf-8?B?RUtNSzRZdG05NklKL3dPdXVDTGptZ1FNdCtQcVlJbmZYM2lWYjhYWldUdFFF?=
 =?utf-8?B?WlFJYTJOK2Ezd1lYK2h6OC9OVElJdTdGaUdBN2l3UTl2dzZTWXVoVFhiaWxl?=
 =?utf-8?B?a1NnMmh2bHJUZ2l2MlBNNlEwcFl6aldIOWRwV0pqQVdEU1pLTDhwQmpMQk9m?=
 =?utf-8?B?aXhSN3FWTDU5eFZTZTlsVjQvMjh2cnZSRnBabzhRdGhPd2t2ZXhzYWVWaTNI?=
 =?utf-8?B?SWZCazBoLzJCcFlvVmN2Z0xJTTJxTDVFVmZ1Ym1mcWNlTkMwQjRnRnIxNXhU?=
 =?utf-8?B?WGJra0RDVkpodWFYMTdRcUw1alNycVJ4R2F2YTVJYkxNQ0MyZTJSeE92V21G?=
 =?utf-8?B?NlI3VXBYZDhyUGlPVzFVbStyay9mbHo3eGNxdVE1Vld3dUhNWXNHODlwWjJm?=
 =?utf-8?B?dXZNejA5NTJoaGZxSDFoUDU2VVF6NTl6QkxuUVFVV1FwRkdrbWJTanE1NFRj?=
 =?utf-8?B?Z3RzbUE2MmF5elZ3SkttSXdwak9TeG0vdWZUL2dHNGIvSFA1RGhRQ2s2bStD?=
 =?utf-8?B?RnlyWnFhV2dNT0NBTXpmaHkwZG9jNHFVS3RjV3MzTk1UblZrMzNJVjlPMGVQ?=
 =?utf-8?B?MGhuTkRIUlNYdDBxU09QWTZWQ3NVSHRSZnloMjJGRVhzY2w1YnlVUlh4Z0cr?=
 =?utf-8?B?cW9KWEV1VjkxOEFqeGRlVzUyT2VWL0lsWlZnZHkrUHFlclQySGJRZmFiY3Q0?=
 =?utf-8?B?NHQxTWZNQkJ5RHEyVXNPeVZQUkIwOXk5d0I3NVl1azBsTFdvcDVPem50Mksx?=
 =?utf-8?Q?c2ikDHn4/58j9kHE/No3URfaX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e2b64d-ebfa-4b2a-40e5-08dbb2ac5046
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 09:48:55.5003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5qkUIcT3si3qu33prnjY9GxcDaj2jUbB3UdxWxFM1cjpCHIQMA8VVtv+YufCIUJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6113
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tjmercier@google.com, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>, jianjiao.zeng@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.09.23 um 04:30 schrieb Yong Wu:
> From: John Stultz <jstultz@google.com>
>
> Add proper refcounting on the dma_heap structure.
> While existing heaps are built-in, we may eventually
> have heaps loaded from modules, and we'll need to be
> able to properly handle the references to the heaps
>
> Also moves minor tracking into the heap structure so
> we can properly free things.

This is completely unnecessary, see below.

>
> Signed-off-by: John Stultz <jstultz@google.com>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> [Yong: Just add comment for "minor" and "refcount"]
> ---
>   drivers/dma-buf/dma-heap.c | 38 ++++++++++++++++++++++++++++++++++----
>   include/linux/dma-heap.h   |  6 ++++++
>   2 files changed, 40 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 51030f6c9d6e..dcc0e38c61fa 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -11,6 +11,7 @@
>   #include <linux/dma-buf.h>
>   #include <linux/dma-heap.h>
>   #include <linux/err.h>
> +#include <linux/kref.h>
>   #include <linux/list.h>
>   #include <linux/nospec.h>
>   #include <linux/syscalls.h>
> @@ -30,6 +31,8 @@
>    * @heap_devt:		heap device node
>    * @list:		list head connecting to list of heaps
>    * @heap_cdev:		heap char device
> + * @minor:		heap device node minor number
> + * @refcount:		reference counter for this heap device
>    *
>    * Represents a heap of memory from which buffers can be made.
>    */
> @@ -40,6 +43,8 @@ struct dma_heap {
>   	dev_t heap_devt;
>   	struct list_head list;
>   	struct cdev heap_cdev;
> +	int minor;
> +	struct kref refcount;
>   };
>   
>   static LIST_HEAD(heap_list);
> @@ -205,7 +210,6 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>   {
>   	struct dma_heap *heap, *h, *err_ret;
>   	struct device *dev_ret;
> -	unsigned int minor;
>   	int ret;
>   
>   	if (!exp_info->name || !strcmp(exp_info->name, "")) {
> @@ -222,12 +226,13 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>   	if (!heap)
>   		return ERR_PTR(-ENOMEM);
>   
> +	kref_init(&heap->refcount);
>   	heap->name = exp_info->name;
>   	heap->ops = exp_info->ops;
>   	heap->priv = exp_info->priv;
>   
>   	/* Find unused minor number */
> -	ret = xa_alloc(&dma_heap_minors, &minor, heap,
> +	ret = xa_alloc(&dma_heap_minors, &heap->minor, heap,
>   		       XA_LIMIT(0, NUM_HEAP_MINORS - 1), GFP_KERNEL);
>   	if (ret < 0) {
>   		pr_err("dma_heap: Unable to get minor number for heap\n");
> @@ -236,7 +241,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>   	}
>   
>   	/* Create device */
> -	heap->heap_devt = MKDEV(MAJOR(dma_heap_devt), minor);
> +	heap->heap_devt = MKDEV(MAJOR(dma_heap_devt), heap->minor);
>   
>   	cdev_init(&heap->heap_cdev, &dma_heap_fops);
>   	ret = cdev_add(&heap->heap_cdev, heap->heap_devt, 1);
> @@ -280,12 +285,37 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>   err2:
>   	cdev_del(&heap->heap_cdev);
>   err1:
> -	xa_erase(&dma_heap_minors, minor);
> +	xa_erase(&dma_heap_minors, heap->minor);
>   err0:
>   	kfree(heap);
>   	return err_ret;
>   }
>   
> +static void dma_heap_release(struct kref *ref)
> +{
> +	struct dma_heap *heap = container_of(ref, struct dma_heap, refcount);
> +
> +	/* Note, we already holding the heap_list_lock here */
> +	list_del(&heap->list);
> +
> +	device_destroy(dma_heap_class, heap->heap_devt);
> +	cdev_del(&heap->heap_cdev);
> +	xa_erase(&dma_heap_minors, heap->minor);

You can just use MINOR(heap->heap_devt) here instead.

> +
> +	kfree(heap);
> +}
> +
> +void dma_heap_put(struct dma_heap *h)
> +{
> +	/*
> +	 * Take the heap_list_lock now to avoid racing with code
> +	 * scanning the list and then taking a kref.
> +	 */

This is usually considered a bad idea since it makes the kref approach 
superfluous.

There are multiple possibilities how handle this, the most common one is 
to use kref_get_unless_zero() in your list traversal code and ignore the 
entry when that fails.

Alternatively you could use kref_put_mutex() instead. This gives you the 
same functionality as this here, but as far as I know it's normally only 
used in a couple of special cases.

> +	mutex_lock(&heap_list_lock);
> +	kref_put(&h->refcount, dma_heap_release);
> +	mutex_unlock(&heap_list_lock);
> +}
> +
>   static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
>   {
>   	return kasprintf(GFP_KERNEL, "dma_heap/%s", dev_name(dev));
> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> index c7c29b724ad6..f3c678892c5c 100644
> --- a/include/linux/dma-heap.h
> +++ b/include/linux/dma-heap.h
> @@ -64,4 +64,10 @@ const char *dma_heap_get_name(struct dma_heap *heap);
>    */
>   struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
>   
> +/**
> + * dma_heap_put - drops a reference to a dmabuf heap, potentially freeing it
> + * @heap: the heap whose reference count to decrement
> + */

Please don't add kerneldoc to the definition, add it to the 
implementation of the function.

Regards,
Christian.

> +void dma_heap_put(struct dma_heap *heap);
> +
>   #endif /* _DMA_HEAPS_H */

