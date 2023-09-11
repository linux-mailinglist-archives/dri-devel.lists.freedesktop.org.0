Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9105179A727
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 12:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D897810E272;
	Mon, 11 Sep 2023 10:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2088.outbound.protection.outlook.com [40.107.100.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10DF10E272
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 10:13:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCKX13hn6u39iZBft0F+NxDIg/zFIyh5loETF8Du6kZb9SPR5RrcMb/UOOjCbS5ITJhIC4n7AdaDfWl5xAUZgHRLGImfODdvhu07nqPU5HlgHmcRj35w59j/z9NiPGCU51MmNkCFnZFWnPToyKm+nyFNdJZAqY5jgJwHOIG8zKRLfZj74cVjBkU1FHJiPM0XawkKU0bKzjlj5+NNUWwb2vqYidpSa3u2SBEYU/ydq3C52ViasUQMISIgHqbXVOXPxmAJcWpn4JYettpipQJMO/fiER4GpBjB8YLmQt3oCwn2ak9aNmXaazYjgMjkkGqIeV1gxm9IjMC+BnrORF1mFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82WS5ze9mfKQ3VMJE6VR/FyRpYWCAMKAza5KvnDrfho=;
 b=lu0r56Z60oXZq8+ndWg1h708aO8xLaQJNp969Gn2abCiaqeK/SwBXu9GKk9eagvcAgnU0mRqg9/0y/+2IYf0q51A95zKuRPwwLtj0pJLfYPEaAlSbaOBM7mUnjG31Y6AECdWrjEgkE4I4C29blCT5Z8w7m5vg1zsaQEXNfA5hZQGFcGN/kT0Ulcv4ruk4+IiclpZ4uGPKU6hVwqrt0OEclp1ebhCzxDn7Lo7I4AQPR76bYZgCFO28DcLhqhrwVgDgnfk8j0anNKZ6yXfQA5GyCzfnF2a+epigHfsf/5ZVpvHBaz1rceJPjTEm4gpuiUOqb9tmw7linwHL4mFysTFOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82WS5ze9mfKQ3VMJE6VR/FyRpYWCAMKAza5KvnDrfho=;
 b=F/IRdCO4e2ijMQifGTNxtlDgm/CgjdZg49ImOQLPdocNnax+osr0ru/5ZbbXquzXBfXrxae8oEKn3gQWmghsttdHevYL1j4Z5gK7jQUVgypXmREaCSWIB1vtE8zatCD9n+/SZSyjcIC6ACbo+L4UvPSkIObKHbYDIGATVJ+6Zo8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4562.namprd12.prod.outlook.com (2603:10b6:5:2aa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 10:13:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 10:13:55 +0000
Message-ID: <803846bc-fd1d-d2ec-2855-456af22c82f8@amd.com>
Date: Mon, 11 Sep 2023 12:13:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/9] dma-heap: Provide accessors so that in-kernel drivers
 can allocate dmabufs from specific heaps
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-4-yong.wu@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230911023038.30649-4-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4562:EE_
X-MS-Office365-Filtering-Correlation-Id: 117cffd2-7960-42a8-807d-08dbb2afcdfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4gmDjXmT8Pdf+3Ef1KOA7ckvmucguKgJgtMKtdF2NluS9LAXKIeHIjzCJsLiCrvnElcrrVGB48SYrol0Nq6D1X1LtfgRMsixpEE8+cmeQ+MoUi2zk837ITDIkDfMa+lOHWvQM79JXYbQzvdTKjI9qfzZFGCJZD4EkVK7HkXZmjagIBk8xx7yGyGOPj4rYDXcwjo4AeR11wfIaqwzaBaxdHGv3j9c0krTDrylf7JOy4k+eYlYdErO4EdlNpcw/lY2gp4payccWBK1K0mFgVBKtV04e4nCqr62/nTA7Uektp0ytZgdKs91RbMWHaJnAkHmIePTtVnfNm7OCF4pDJQ7duDSmRcoEBPLe80UvWe8fH2yxD6+baRat8ldPRCCDxbzHoe5yBlQTAUhQhO+uLRG88uR17vZkxeApkvNiZ2XMnDXWt8TulJ4YcgEtBqx6S4Muvl3cPLioICQUeKJYsK1KictBm0T1CTP0bQ2KsohYYUmDS9mb66oTUwxxmd5sjvBHmJiou4gwm+360pFhH4Slf2ma9L7NgUW4POMh9zND9QepuaUsjxw/sdbodetEC8pJJHdx61iYdLvZTKKv0YeeL/68hst/Cdoq+3XJYrI5WXlU5cZSNUZK7Yteat1ZN7Hj8HT7CWIcDR9tniCVGPKHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(39860400002)(366004)(346002)(1800799009)(186009)(451199024)(110136005)(6506007)(6486002)(6666004)(966005)(6512007)(478600001)(83380400001)(2616005)(26005)(7416002)(54906003)(66476007)(66556008)(66946007)(4326008)(316002)(2906002)(41300700001)(5660300002)(8676002)(8936002)(86362001)(36756003)(31696002)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkZ2UXFhSEMvcUQxWVJKdmtEeE52MllVS3B0dTZ5eFBydnpENjU5NmRYRmRr?=
 =?utf-8?B?M0JaM1NXVFFYeVpQcnJmWFc0akowd1hJL1Z3N3M0OEIwWGIxaSs1amtpZUdy?=
 =?utf-8?B?MGo3U2ZOSGlRdHpDWFVEa3ZFelpxYzVTQk9xR3ZvMlRFQThpSitmUFhvSWZU?=
 =?utf-8?B?WlFoUFVkQ3UxWGRVVWU1S1ZTWk5xL0hDcXJEVWF1Vld6VXpmTTZlS0dZTjdO?=
 =?utf-8?B?Tk15ZWY3TEdWbWJleG54cUhWS1pkTEFreGRoTG9CY3RVRVlFT1JybCs3VkpK?=
 =?utf-8?B?elNyUTF6Z1FJUHo3MWRhT3ppVVlLUGF0cHFlNmt1U2JzMDNtSmJ6ekVIZEc2?=
 =?utf-8?B?TnJCMnNWQU5jRVFwcVBUZmtGTmtUak1idjNjOGgyVmljcGJHa3dMb3B0Rity?=
 =?utf-8?B?S3ZONlEzSmFhUWZmRFNCYjdNalhqNXA1R2ZiOUNIbTdnL3VGV1NDQm9lYVUz?=
 =?utf-8?B?ZTFudnpEeGZTZlpjRUxCMmVqUTBUa284SFBzRm0vN3hNQm01WEJlNjhQRmVr?=
 =?utf-8?B?UHFrTTJaL0o5OEdVU1ZIVUZnWnRaNy8wNEtGck5xeUpLOXE4M3BMSXpBdEJ2?=
 =?utf-8?B?TXNQekt5RjdJV3BrN3ZUMG9YT3QxbEx6ejU2Y0lpeUNzczI3U081OWJCZW5v?=
 =?utf-8?B?T1NXLytRZWNLb1Qrc2F0ZGR1c0JZZUtCYlZYbzNjbzJKWnc5dGR3Y3c1RExs?=
 =?utf-8?B?WklrSXF1ZGpHN3pOZmVRNTRoMkJMTHYvOXlSeTdNNFU0L2wrTDJaNFBXK3ZF?=
 =?utf-8?B?eUxoRitLVmplSWFIdllwYlQxaXNJUGNYb1ZxaWdYS21lT0JUUW9wdmp3NDV2?=
 =?utf-8?B?U0ZUREZ4dUFVWmc5Tk9BY3dPRlczN2Y5N1JFZ2gvaC9GS0lQR2wxbnJkQmJk?=
 =?utf-8?B?Ym9rQmliVmFmeVZ6d2luVHNMVWxpY1FDSExPb1JwR3FicWpqd0d0L2l2bDVw?=
 =?utf-8?B?OFpra09QS1pxSTY4SW9MSUx6MHdxY2RzNWw4ZU9PenlUY0x2d0U5NTNsUFA2?=
 =?utf-8?B?SlZiaFR3dzRab1V2aG1samI0K0x4ZXVlZlJ4SXVEQVRqcldUb2I5RDBpcEtD?=
 =?utf-8?B?QnhEcTBDS3dFME5lRlRubEhuTWtDZlVrOU5rRExLb2E0NGx2Y2ZXd01jTVlh?=
 =?utf-8?B?anJBUzg2NE5LLzIrRlVkVnJ2NlVrbTFXQ2poblJJVk51UC9KSXZJeVVoU0R2?=
 =?utf-8?B?NER3ck1CWEVCNXlnTzdrZm1vbVdyWndveVBWN1hHaW40WWdoeVQzUlFKR0I1?=
 =?utf-8?B?WkY2RU9rVzliaE5IT0hCOW1rdTlFNytOaUtUc0NiYjlLZ2JLS0x4azYwTnV6?=
 =?utf-8?B?TEVnNzZjNTRHK3ErWVZWVGpTbXhidGppM3N4MFdrUllzRGJDaFNiTklnejA3?=
 =?utf-8?B?ZFp5NUdvdkJmbWZKait5SHcxRDB3RVlvb1VDV1p1WWpaMVlPM3JEa2NNaGVQ?=
 =?utf-8?B?azZIQitpUm9JY0Z1TEVuYndPek1JQ0pTRlV0dUk3R2tNalBGWEV3THJvV0pM?=
 =?utf-8?B?Z09kUU9tMHYzczJkZGJLQnB3bmthZmx1V3AwbCswYWRXVXkyZ0gxQ3RDWGIv?=
 =?utf-8?B?ekd3SEE4RFFkbTR4dk0wRXhhcGhudnVURWVFVWVNYlNLWitnZisvamhBREVY?=
 =?utf-8?B?d25kYmwvYUxiMDN1V0hhUFpiaUY3WXlMVzlVUFMremZLdFVMT0pvemJEbWo1?=
 =?utf-8?B?MHNEY2d2M0pHZEdiQ0VRZVE1cUxGeitVa0ZjVFVBRFpWUHRuYjNuNm9UTlhx?=
 =?utf-8?B?SFM0MElkU2NrSUxFMmxKQTh0R1dyUWlDN05lZG8yRHZkZlhrWmJGR1p4L3N1?=
 =?utf-8?B?ZldsUHpWVVFOVmRzUEFLWTlkZENIQlBTT0liTk1rQnVrMjFaNU1kcWdzeDNO?=
 =?utf-8?B?VVRzWDdyOUxWZHlwUHdRT2NKOWh6bjlJLzYyVUFSVkFHWS8zazhRTldvU2RT?=
 =?utf-8?B?ZXUrZTFZYlRTZ29UbDJ4ZzBRcE43MzZGd29HYTJoRzJzN2kwZ0txMFViRTNs?=
 =?utf-8?B?Y2VtUUtYeXl1MGU3WnJ3UWxPYUUyQTN3eGNvbnY3ZVhkcUkrQUhHVnEvaWZP?=
 =?utf-8?B?UmxFSldseTRvWkg2MElaSFdzMmJJMy9PV1ZsOXNOa0xTYm9kaTZreHJLck9x?=
 =?utf-8?Q?NDv19ZMRZnXemwh9AUk7MGzU3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 117cffd2-7960-42a8-807d-08dbb2afcdfc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 10:13:55.0746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7OZCHNyCNYebOTp/Jo8bbhHpBOlg1jsWELeYHwf3AbariSw1wIkrL+/Z9pxvYs7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4562
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
> This allows drivers who don't want to create their own
> DMA-BUF exporter to be able to allocate DMA-BUFs directly
> from existing DMA-BUF Heaps.
>
> There is some concern that the premise of DMA-BUF heaps is
> that userland knows better about what type of heap memory
> is needed for a pipeline, so it would likely be best for
> drivers to import and fill DMA-BUFs allocated by userland
> instead of allocating one themselves, but this is still
> up for debate.

The main design goal of having DMA-heaps in the first place is to avoid 
per driver allocation and this is not necessary because userland know 
better what type of memory it wants.

The background is rather that we generally want to decouple allocation 
from having a device driver connection so that we have better chance 
that multiple devices can work with the same memory.

I once create a prototype which gives userspace a hint which DMA-heap to 
user for which device: 
https://patchwork.kernel.org/project/linux-media/patch/20230123123756.401692-2-christian.koenig@amd.com/

Problem is that I don't really have time to look into it and maintain 
that stuff, but I think from the high level design that is rather the 
general direction we should push at.

Regards,
Christian.

>
> Signed-off-by: John Stultz <jstultz@google.com>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> [Yong: Fix the checkpatch alignment warning]
> ---
>   drivers/dma-buf/dma-heap.c | 60 ++++++++++++++++++++++++++++----------
>   include/linux/dma-heap.h   | 25 ++++++++++++++++
>   2 files changed, 69 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index dcc0e38c61fa..908bb30dc864 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -53,12 +53,15 @@ static dev_t dma_heap_devt;
>   static struct class *dma_heap_class;
>   static DEFINE_XARRAY_ALLOC(dma_heap_minors);
>   
> -static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
> -				 unsigned int fd_flags,
> -				 unsigned int heap_flags)
> +struct dma_buf *dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
> +				      unsigned int fd_flags,
> +				      unsigned int heap_flags)
>   {
> -	struct dma_buf *dmabuf;
> -	int fd;
> +	if (fd_flags & ~DMA_HEAP_VALID_FD_FLAGS)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
> +		return ERR_PTR(-EINVAL);
>   
>   	/*
>   	 * Allocations from all heaps have to begin
> @@ -66,9 +69,20 @@ static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
>   	 */
>   	len = PAGE_ALIGN(len);
>   	if (!len)
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>   
> -	dmabuf = heap->ops->allocate(heap, len, fd_flags, heap_flags);
> +	return heap->ops->allocate(heap, len, fd_flags, heap_flags);
> +}
> +EXPORT_SYMBOL_GPL(dma_heap_buffer_alloc);
> +
> +static int dma_heap_bufferfd_alloc(struct dma_heap *heap, size_t len,
> +				   unsigned int fd_flags,
> +				   unsigned int heap_flags)
> +{
> +	struct dma_buf *dmabuf;
> +	int fd;
> +
> +	dmabuf = dma_heap_buffer_alloc(heap, len, fd_flags, heap_flags);
>   	if (IS_ERR(dmabuf))
>   		return PTR_ERR(dmabuf);
>   
> @@ -106,15 +120,9 @@ static long dma_heap_ioctl_allocate(struct file *file, void *data)
>   	if (heap_allocation->fd)
>   		return -EINVAL;
>   
> -	if (heap_allocation->fd_flags & ~DMA_HEAP_VALID_FD_FLAGS)
> -		return -EINVAL;
> -
> -	if (heap_allocation->heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
> -		return -EINVAL;
> -
> -	fd = dma_heap_buffer_alloc(heap, heap_allocation->len,
> -				   heap_allocation->fd_flags,
> -				   heap_allocation->heap_flags);
> +	fd = dma_heap_bufferfd_alloc(heap, heap_allocation->len,
> +				     heap_allocation->fd_flags,
> +				     heap_allocation->heap_flags);
>   	if (fd < 0)
>   		return fd;
>   
> @@ -205,6 +213,7 @@ const char *dma_heap_get_name(struct dma_heap *heap)
>   {
>   	return heap->name;
>   }
> +EXPORT_SYMBOL_GPL(dma_heap_get_name);
>   
>   struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>   {
> @@ -290,6 +299,24 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>   	kfree(heap);
>   	return err_ret;
>   }
> +EXPORT_SYMBOL_GPL(dma_heap_add);
> +
> +struct dma_heap *dma_heap_find(const char *name)
> +{
> +	struct dma_heap *h;
> +
> +	mutex_lock(&heap_list_lock);
> +	list_for_each_entry(h, &heap_list, list) {
> +		if (!strcmp(h->name, name)) {
> +			kref_get(&h->refcount);
> +			mutex_unlock(&heap_list_lock);
> +			return h;
> +		}
> +	}
> +	mutex_unlock(&heap_list_lock);
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(dma_heap_find);
>   
>   static void dma_heap_release(struct kref *ref)
>   {
> @@ -315,6 +342,7 @@ void dma_heap_put(struct dma_heap *h)
>   	kref_put(&h->refcount, dma_heap_release);
>   	mutex_unlock(&heap_list_lock);
>   }
> +EXPORT_SYMBOL_GPL(dma_heap_put);
>   
>   static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
>   {
> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> index f3c678892c5c..59e70f6c7a60 100644
> --- a/include/linux/dma-heap.h
> +++ b/include/linux/dma-heap.h
> @@ -64,10 +64,35 @@ const char *dma_heap_get_name(struct dma_heap *heap);
>    */
>   struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
>   
> +/**
> + * dma_heap_find - get the heap registered with the specified name
> + * @name: Name of the DMA-Heap to find
> + *
> + * Returns:
> + * The DMA-Heap with the provided name.
> + *
> + * NOTE: DMA-Heaps returned from this function MUST be released using
> + * dma_heap_put() when the user is done to enable the heap to be unloaded.
> + */
> +struct dma_heap *dma_heap_find(const char *name);
> +
>   /**
>    * dma_heap_put - drops a reference to a dmabuf heap, potentially freeing it
>    * @heap: the heap whose reference count to decrement
>    */
>   void dma_heap_put(struct dma_heap *heap);
>   
> +/**
> + * dma_heap_buffer_alloc - Allocate dma-buf from a dma_heap
> + * @heap:	DMA-Heap to allocate from
> + * @len:	size to allocate in bytes
> + * @fd_flags:	flags to set on returned dma-buf fd
> + * @heap_flags: flags to pass to the dma heap
> + *
> + * This is for internal dma-buf allocations only. Free returned buffers with dma_buf_put().
> + */
> +struct dma_buf *dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
> +				      unsigned int fd_flags,
> +				      unsigned int heap_flags);
> +
>   #endif /* _DMA_HEAPS_H */

