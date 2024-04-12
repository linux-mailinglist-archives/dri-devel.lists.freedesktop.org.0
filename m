Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E61DD8A2ABD
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 11:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947C210F54C;
	Fri, 12 Apr 2024 09:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p1q7E4Ae";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2070.outbound.protection.outlook.com [40.107.102.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2578210F551
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 09:17:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+uXAiwo7GPLKQMb+E85jarU6f9XdZ4O5UsGv+84rvXVuq0O4nvN6M3u+fQQFBYc3xek4BBcZB3iy2kLIZMGseTLXv6kEc3t9OYoQnqk9gy82weNI4FUZcXFai6FZypYtIOh+ZA1ESJUoMiQocowHNTagntAzLvLIzutCpSuvsbXBqE0Fg+MIZQqMTzmX2cSRiO3P1tcAK5LdPu75JG86bLQJSDirgv8jfXnVIhsr33XX2IMU/6dHj0O8O1Ly7iDEJ2zD94EmUTQ7iDLgzxn3DLJ025Hwf9QJDVk47emc8j3Eu4kkwLDndbuES0+G68jIMyTE4FkZGmzH3JTz+98HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etB2/l/COzzBw7bzJWtmcuFjR139PFoLKVkU1aqbU/4=;
 b=WCERdvrkaC5YlyHrJmMK+sz5PYvtvu9FUoanlXQPLA3FSgNcullTYkV5f5rSruYEow2Bs8TyGIkEkVfMYGAnmcOih3DSGo3j4iv0QgZzE1VpI4DRHDxoM1sMAOPLWt0YZhLDkfzrUVO1xhKDDXsSnMdLJgJoCBCoejKc3kXieXbHwVds4ewpmUDnjD6PYLjGm93pMPQKBak9E/vEYafa1iGYch4mNqVoR9uvkS4jyE0T21itK2uyP5QBqcJ5fSXcaYvDVP5hqaRkUhKKpNUEEzi2Re4srLIhIBRknqAdUowZ6vUQcR7qsPceCAMPPdKrD7hMhXta7wj+MD73wwjC4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etB2/l/COzzBw7bzJWtmcuFjR139PFoLKVkU1aqbU/4=;
 b=p1q7E4AeMztu4/JUMZmhQAn/TbuNAawtGKapDp4czS6hWjNIBOynnEdMCWtlHji5RTPQtTXGKfW5+6snt+9IdnRbUfp/0HeVd2W73Ogt1HWnmE1WGuBbdCPRxVe3gIfxgdu8NhonKHtWy3gJded2mQNjlg2oubQpZ8YpvFRvqEA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB7317.namprd12.prod.outlook.com (2603:10b6:806:2ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 12 Apr
 2024 09:16:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7409.053; Fri, 12 Apr 2024
 09:16:57 +0000
Message-ID: <f3698562-5000-483e-bfd8-272bf6306b0e@amd.com>
Date: Fri, 12 Apr 2024 11:16:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5,05/23] dma-buf: heaps: Deduplicate docs and adopt
 common format
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240412090851.24999-1-yunfei.dong@mediatek.com>
 <20240412090851.24999-6-yunfei.dong@mediatek.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240412090851.24999-6-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: 33931949-a65a-425a-d9ad-08dc5ad14d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3l4SFNlYAF4xb4W0d9tt7fOOhz6vWSY75VqdZJ3EcPovuEXCgQFUsnrcf1xuTIDdn9AAHTedz6YYh1Fol4N1lC42WX2uSYC5RUq/jU+J5DgfETPlG8c9hp2u10EoIB5ZxDBPQ0aIWxB0IUhvRZ6gqklVJTUqaE4SggTuW1TkCNnpBKY91DYgMSFt2Q/Bv0lm7bgY974FiFEX8A7/cVNVDMobsh6IhDD0IB5G96xecI9V/9+zo/07iprSVNF5mXG12EXfJW/cLeodtXu1hl6WD5aHKBUnFexkxa0hh9pN2+m3zbxAc8gfVMA5VYuwFYDkhzqNEVkaTE5bRgXzxZgNGHIsUvVUVgZA3uEUIhMhumoekROT/oOonahiRU7Hyp/gtdw5JsLCKdl9Ev0tHgvIQqGGqj9s/IcqRBatUKd6w74MMKu0uhoBn9smsxIgzkUrTMSdpy+Z380NPVIWmcr4qweWQo8ZoabKLFduwsFquSJxsGJQaU/PcHP97xOea2qa+WDKLXaYglgEUUMp2Ze+lShL/5pnfmrICExu1WW16Z+oJpxuBeGWLoKGHFpYvgb9RbjkdtM8ONXLGTBgUnCOXnO3LnM2FIKcnbhW89e+bFE4Bpe+rbBK18h5ljSf6DxhpMMC7DbxcLWO/LTqEV7Pd5xGe2hpXMxPpBrQHCngKcRbNsh0VztmubakaWpdUD7iCmiDSq5Y6iuBzzwjQFNgxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(7416005)(366007)(921011); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1VmWUNGMjJFNHhJZXFta3I0MEEyMzF6WTlCa1cxTmdoTDVXc3RhV1MzZ25n?=
 =?utf-8?B?Wm1veXBvYjlRdDd0cENQa2xPdGVTci9Ob2orblFUWHVJRUd0OGEreTd6VW1Z?=
 =?utf-8?B?eVdnZjIxZG5zUzFJSkpJL0VyOThrN1V0NjRQeW5aMzUrNHhkQnAvbU1BTlJq?=
 =?utf-8?B?UFZtcmFzQVRYM2FiSE1XODZsVDRKQVhhVk9YT0hXZ2YweDA5VjB1ZW9hUlNP?=
 =?utf-8?B?NENCR0tPUnlIL1lpOGVKblBuRHE3RkJ2UXF0R3k0c09zS25WSUQ3QnBpaXlK?=
 =?utf-8?B?RVBING1lamF5Mk1lNHJtdzVxbDNUN1NZTngyQkY2ckRwUUlaYXhZcjdhQzdt?=
 =?utf-8?B?cm93cDlkSDhNTTdvK2hvbWJtNCtVbWd6UzFiSHR1VFJPd21EVE0wQ09odE56?=
 =?utf-8?B?UERSNG1LZXk1QlJxck1FNU1aTU9UalFVRU5kL0FubTFVeUN4WFBXWCtsNnJG?=
 =?utf-8?B?ZTA2eDlBUW1QcG0yakdsT3VDRnFBRE9ubjljeTBkSHhyNXhiL0I5emF4b3Bx?=
 =?utf-8?B?M0lSK2dkT3hCTGVHL05LWmZOR3FIS0xRdjJMcXhuOTJZaklYdVpsSWRhaWpn?=
 =?utf-8?B?dmgwcW44ODh0elQzQnJxT3ROc3l4Sll0dHY4cHJmSXQ4QmpGWDlVRFRsZHFo?=
 =?utf-8?B?c2hZUkw2TWNXaHJiellXUTcwcDExditUaWlNeUdVamx3cEFpWnJObisxMlBo?=
 =?utf-8?B?d3hWZm5RODJseEduSTE4M21BcUJxbU1FV3hLbEs5RGE1Vk9pYngyeisvbWlF?=
 =?utf-8?B?OUc4VUlMaDIzRTE3bWx0NytSRDI4QmpKRno1ZGlCQUlqL0JMcDNYUUl6VmJU?=
 =?utf-8?B?cGFQRkZNYWhyUlRiWHJPeUVMRGVYK3MvY2JLMWsrMU9iVVBSazIwQXJxZGJk?=
 =?utf-8?B?QWJDQXBjeE4wdFJkVDd1Zngzc0RtSllncHhRb2J1UWdZdUNGazQ5aVd4TGZq?=
 =?utf-8?B?ZVYzbCttWUVHYW45WGlqWVlCTk5vYkNnQmJCbGJXTlR4dCtveVNmb2xOem5D?=
 =?utf-8?B?WFZUWDZ5RVo3dHd6bnJtb1g1aDdNL2NkejdVRm1BeWVuM0QyaGdRQW5TakxT?=
 =?utf-8?B?alV2SGJOZnVEODByd3cvQUYxL2txdzVPMTVwbHZlQ2hoT1B0VmxmNUJyMU1H?=
 =?utf-8?B?eXErV0QvSXpwLzh1eGtFOXVobndBTWNJaC9KVFZBL2REZk1vNStNUXZha3Bx?=
 =?utf-8?B?dXZLMGZwSjJ4ai95Y1ZVNEc0S05iV3BpSXo5RU4wMUd5Y3RWNzNVOWpjeTRF?=
 =?utf-8?B?Z0wvMWQ5RHN1SnlyTEVJbk01eHljczlJcHYvbGZuZk5BK09KL0tvRU93OVpT?=
 =?utf-8?B?bElaTFJpT1FrNFJINlNVNDZkb2lnNnUzQU9oYUIxZkxrZHZ3cERQSGkzNTMv?=
 =?utf-8?B?QmtxdVQyZmVJaExYaDJOU0wvaDB2ZkdVQkRhbnRFeURJTURNRHFxTE9iNHVm?=
 =?utf-8?B?NmQwREJ2RzMzWFJKZU1qdkhQbE4zb1VvK3JMdndaUVZ3bko2RWJtWmNHZW1o?=
 =?utf-8?B?Z3FIVFRveTVRaU9rRmE3cWg1ekpyVHdzb3F6NjBnMGNDOWNubEhYV2xPbkRm?=
 =?utf-8?B?U0dENlNNM1ozeWRaR21OLzh6S3J4NTN6ejNsVVJRUXBCeG5uZm8vNWJZdDZC?=
 =?utf-8?B?bXE0ODZtd3krdVUxQnZzR1Q2QUhLODJCOFNOdmw2VGdnVWVqZk5nSDNtSjZq?=
 =?utf-8?B?OXRvOGwzajNzd1Q3STJzL0p3djR2ZUcvK3RYWkJjYzNydGY4Y01TemdtYzhO?=
 =?utf-8?B?QjY4S1ljM2d1UU1Zak9pdHFMbExHSzB6VllUNW9wRTZKcEVwaHB1QlY1bWs2?=
 =?utf-8?B?ZEl0WVN0cE9WdmR3Rk1QMlBQZ3luOGx3SFNSdkRFbTE4ZkR4bTBWN2xtWXVk?=
 =?utf-8?B?U044U3hMa0pyUDdpdjFaWjdCL3g3UHlwdVZhQzZ5SU5nOHp4bVJXTDdxZ2dQ?=
 =?utf-8?B?N2NTRkNGd25qdGNzVlFldnZ1azR0MVhLU0lxR3ZteitZODB2Qi94Q2hSZDBn?=
 =?utf-8?B?M092aktuNHlhOGE1Rnl4MmlCYnNoOTZSUWtZNmh1TEdsSkJiQnlOckNnRnNC?=
 =?utf-8?B?bUdxbDB3MDVKb1NjdzVRWlRSZnRsckV6Vjh5TDBqLzNZY1QvV0JZK0VTK2Zw?=
 =?utf-8?Q?ZOl20oko1fk/SJRiPLEXs2kdZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33931949-a65a-425a-d9ad-08dc5ad14d90
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 09:16:57.6903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yolCHiEtICIj6ORmigBsCzCKISCXshZKkX5ByTXGRkK9ak7kL8dJlIA4Vahf4RPq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7317
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

Am 12.04.24 um 11:08 schrieb Yunfei Dong:
> From: "T.J. Mercier" <tjmercier@google.com>
>
> The docs for dma_heap_get_name were incorrect, and since they were
> duplicated in the header they were wrong there too.
>
> The docs formatting was inconsistent so I tried to make it more
> consistent across functions since I'm already in here doing cleanup.
>
> Remove multiple unused includes and alphabetize.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> [Yong: Just add a comment for "priv" to mute build warning]
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

If nobody objects I'm going to cherry pick this cleanup here into 
drm-misc-next.

Regards,
Christian.

> ---
>   drivers/dma-buf/dma-heap.c | 27 +++++++++++++++------------
>   include/linux/dma-heap.h   | 21 +--------------------
>   2 files changed, 16 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 84ae708fafe7..22f6c193db0d 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -7,17 +7,15 @@
>    */
>   
>   #include <linux/cdev.h>
> -#include <linux/debugfs.h>
>   #include <linux/device.h>
>   #include <linux/dma-buf.h>
> +#include <linux/dma-heap.h>
>   #include <linux/err.h>
> -#include <linux/xarray.h>
>   #include <linux/list.h>
> -#include <linux/slab.h>
>   #include <linux/nospec.h>
> -#include <linux/uaccess.h>
>   #include <linux/syscalls.h>
> -#include <linux/dma-heap.h>
> +#include <linux/uaccess.h>
> +#include <linux/xarray.h>
>   #include <uapi/linux/dma-heap.h>
>   
>   #define DEVNAME "dma_heap"
> @@ -28,9 +26,10 @@
>    * struct dma_heap - represents a dmabuf heap in the system
>    * @name:		used for debugging/device-node name
>    * @ops:		ops struct for this heap
> - * @heap_devt		heap device node
> - * @list		list head connecting to list of heaps
> - * @heap_cdev		heap char device
> + * @priv:		private data for this heap
> + * @heap_devt:		heap device node
> + * @list:		list head connecting to list of heaps
> + * @heap_cdev:		heap char device
>    *
>    * Represents a heap of memory from which buffers can be made.
>    */
> @@ -193,11 +192,11 @@ static const struct file_operations dma_heap_fops = {
>   };
>   
>   /**
> - * dma_heap_get_drvdata() - get per-subdriver data for the heap
> + * dma_heap_get_drvdata - get per-heap driver data
>    * @heap: DMA-Heap to retrieve private data for
>    *
>    * Returns:
> - * The per-subdriver data for the heap.
> + * The per-heap data for the heap.
>    */
>   void *dma_heap_get_drvdata(struct dma_heap *heap)
>   {
> @@ -205,8 +204,8 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
>   }
>   
>   /**
> - * dma_heap_get_name() - get heap name
> - * @heap: DMA-Heap to retrieve private data for
> + * dma_heap_get_name - get heap name
> + * @heap: DMA-Heap to retrieve the name of
>    *
>    * Returns:
>    * The char* for the heap name.
> @@ -216,6 +215,10 @@ const char *dma_heap_get_name(struct dma_heap *heap)
>   	return heap->name;
>   }
>   
> +/**
> + * dma_heap_add - adds a heap to dmabuf heaps
> + * @exp_info: information needed to register this heap
> + */
>   struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>   {
>   	struct dma_heap *heap, *h, *err_ret;
> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> index 0c05561cad6e..fbe86ec889a8 100644
> --- a/include/linux/dma-heap.h
> +++ b/include/linux/dma-heap.h
> @@ -9,14 +9,13 @@
>   #ifndef _DMA_HEAPS_H
>   #define _DMA_HEAPS_H
>   
> -#include <linux/cdev.h>
>   #include <linux/types.h>
>   
>   struct dma_heap;
>   
>   /**
>    * struct dma_heap_ops - ops to operate on a given heap
> - * @allocate:		allocate dmabuf and return struct dma_buf ptr
> + * @allocate:	allocate dmabuf and return struct dma_buf ptr
>    *
>    * allocate returns dmabuf on success, ERR_PTR(-errno) on error.
>    */
> @@ -41,28 +40,10 @@ struct dma_heap_export_info {
>   	void *priv;
>   };
>   
> -/**
> - * dma_heap_get_drvdata() - get per-heap driver data
> - * @heap: DMA-Heap to retrieve private data for
> - *
> - * Returns:
> - * The per-heap data for the heap.
> - */
>   void *dma_heap_get_drvdata(struct dma_heap *heap);
>   
> -/**
> - * dma_heap_get_name() - get heap name
> - * @heap: DMA-Heap to retrieve private data for
> - *
> - * Returns:
> - * The char* for the heap name.
> - */
>   const char *dma_heap_get_name(struct dma_heap *heap);
>   
> -/**
> - * dma_heap_add - adds a heap to dmabuf heaps
> - * @exp_info:		information needed to register this heap
> - */
>   struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
>   
>   #endif /* _DMA_HEAPS_H */

