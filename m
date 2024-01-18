Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2337083165C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 11:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C4310E192;
	Thu, 18 Jan 2024 10:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FF910E192
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 10:03:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZZdc1eYMKajVCO5WoJrw3celj88FfcwV5gEdzu5ZVzyWrGddIj36VvDUESbAuA833PXspg0E6WnYZy7e6dOqSnoVC53vLTF8+EZUWEMOsrqwM/BXTCwdP3xRL0585ULHfX+14yTI+6XwdtGY72HEfd526/knQ31oz6URLA3GE598NcuAawFspi1SBnH7hq3+I7KIl7+NHlHajGqFPpKNN1R25ksigMQwqBJUnhlaCS7md7y10VT5iDWbpEX7mgSTGU+ZURy6JIsmv0lrhAiBu8e2N2plMmct/QEtOoekkMxsTuoN7SSdufUoB3xiGiWvw6myHyXWr9C+UsbM5DLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7fDWCJHpxQ6ByzLIYgSDsVdTYce/RN//sPN8A9hEyc=;
 b=iAEeFeBwbHgBmTN7uVvoK5JIq7UaIQd1CwGoGiL2wo6blEKoYmvVUJRbKfHGVcCaG+4YPVIG7gU86j6T4ECRjsDR+pL6x2FNz+OVOV3GKmCeEMIv3m2T+WKX+m4MPzuH3NqoYhAlfken4fGxhI17dZDFKRAC0gB7Xue77eIc1VvcVwen98q+putnVMTTiC2MHjxSHY+bfNDy3SOfvWLYAGfidP3TXSDf8WwcpW3ZbqvvM46TVhYPauYWBTBL8VwFLgw8yCQqHet5h/9Y/7Fe/SAUqZlU4W0JuRFaHaaZcgIq/phr71sMoCtifucIQciB2D8RpjU4lwO4fF9oscmJGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7fDWCJHpxQ6ByzLIYgSDsVdTYce/RN//sPN8A9hEyc=;
 b=tZKYZ8NIaB5Ut/pL/vK9wf2E1XRU4bx6GjQkyx5EmNfWbD+ZUIKfokj4Rd+wko+nEm5cWmP7sA8ZAm1fyw2fQ76IoyU/71O+B28DJUTxT8tia5+CcNkBGuUAXQPfGLnkquIDxoCXAg4KANZFzztWNyujLCD22R/1g04NJpWoUWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4227.namprd12.prod.outlook.com (2603:10b6:a03:206::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Thu, 18 Jan
 2024 10:02:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 10:02:29 +0000
Content-Type: multipart/alternative;
 boundary="------------e9qSk2sYXbf5DiMrI9jyGXQS"
Message-ID: <20a68f86-27f0-48f4-a066-7dcf0092858e@amd.com>
Date: Thu, 18 Jan 2024 11:02:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: heaps: Don't track CMA dma-buf pages under
 RssFile
Content-Language: en-US
To: "T.J. Mercier" <tjmercier@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 Sandeep Patil <sspatil@android.com>, Laura Abbott <labbott@redhat.com>
References: <20240117181141.286383-1-tjmercier@google.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240117181141.286383-1-tjmercier@google.com>
X-ClientProxiedBy: FR5P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4227:EE_
X-MS-Office365-Filtering-Correlation-Id: f578dee8-0f4b-4adb-811f-08dc180c9488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sz6Ow55WpLFyY+SaNeQnJgESMviI6B0jaBnyBJqc53Yzj2C/CayBSeRrOCOA10wSw7hxkTPwUR+H1XIS6FCtT0D14U6sbgy1hXVHpdn5fg0+G21KRev47I3tVwdyTmfaPMiF3WgTB0zJ+XG40ZkolEYWG9kiR8ICxaJxLm9zCQrDHjGfQXhL5kVJmDdjQSuH1TIh1wLWd8mCK83iZTNki960YznK0euEM+riKRqyCvnuoZPiczhMSwX1g3l2nQ03msdo99epbQY2p8FSdDhIltHcs58JN/1eudiFLndcqdFl9irfZhsOjWbO34xF/MlWDOzG3obJk8fVTnbd8NFHRwvM8W9H+jpn+tKqSrB7AYr6Zzi8wdJgp/9TCDrWDbdedIaAQiMmBzDSy1qSx4c7v2f5XkIlSrJ0dzj9HNLkAR4ulUfbWL8BTyCPMXFh+Y8Qj1XyEvaMf/y5W2rWu7xVttl/IqPSGkxYCegnQWdjT68CXH7bOTLKx7w8c0nK17SjRy0+53ewIzcioqkYhKfpDKAGyPoy+FpdqsZ3DR9Ff6AV4p77EHWJ0Jvil/UHzHLZi3LYtIfE/BkzEkVlQtBksQDehcHKN/ZbVaz/hdIbbbzRtiH+xw36ndbFdWrz7Ue5N8rPVobkxl5cp3kvd9tljQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(39860400002)(376002)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38100700002)(166002)(86362001)(31696002)(6486002)(36756003)(316002)(66556008)(66946007)(66476007)(110136005)(54906003)(478600001)(966005)(6512007)(33964004)(6506007)(6666004)(2906002)(8936002)(5660300002)(7416002)(31686004)(4326008)(8676002)(41300700001)(83380400001)(26005)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blNEYVlHZ1JLWmx0K3F6dHpqcWtzeTNkU2kyYVhMNGhjNi9DNUtZMkpSWklq?=
 =?utf-8?B?WnJmRkhoOThsQ1dROGJOc0NycldKMUZOUGdsdE5HcEVSejVjVTYzd3MwQ3dV?=
 =?utf-8?B?bTd3Q2xKZkx2aWNRRGNXTDhFS3hvTUZoQXZXUGhlazl1VlBKRmI5YVY0T282?=
 =?utf-8?B?MWlKd0k4cnA3ay85Qk9RRWR3VkxSR0JVZlFwLzZOSVdJT3lGKysrMkdvYXVQ?=
 =?utf-8?B?YWlicEVCR0lDSE5TNzlRL0ZJeVFzeTRZdVh0TU42TUtNd3RMbm81dWlRem9w?=
 =?utf-8?B?RE5udk9qQnVSb3l3SVNheW9QZmRRVk4zc0p6aXkzVGhoaEZZb1RCdHc5TUdU?=
 =?utf-8?B?clcvVFVpMEptL01zck9KZ1hzdGpvSWdRUXBXR25BRGdxUGJramJ6VFQ0cml2?=
 =?utf-8?B?a09sNVBrNUZkSytlU1drOTZYRmplRHVBalZtSEtlbGhiSlE2TklaaVlZV2h1?=
 =?utf-8?B?YU9IeDNETVBWSGR0UzJtcFRTcnNlclJOcExSWkRvTTBRbGMwVURhMlhLU3JF?=
 =?utf-8?B?OXZhMU4wTGt2KzNNK3RiOUd2ZHA0a2QreFJxQnZOOE1nSGpOUkRUTmJWZCs0?=
 =?utf-8?B?UGJyVWxyRThRNndvTDlraWd2MEJ0NHozdVZVRGFKSExsZ0x1cVBPSDQvVmFZ?=
 =?utf-8?B?czY5RHl1cXU5clpmMTN2NXZBcmtDd3EyeTZVMGcrRkQ5WmdLWlN0Vy9RMzU4?=
 =?utf-8?B?S1ROTFEwZjUrcU94alFNMExIcnhZdmM3Zkd4d1RTR01QZE1vRXk0Y0xFNlJH?=
 =?utf-8?B?c3hncFdEQ21PbkdqLzkxb2ZZVmVEUWMrT1BoUmN5dGNmS2g3UHBuNFB6L25P?=
 =?utf-8?B?UStiRzB1bUlGbmgyMlYxdDR0TzBzUzQza1F2dklWUmNzcDRabFV2bjhjVk5z?=
 =?utf-8?B?N3VFT1IrbnhJcXY1R0N0cENrbDhIbFU5bUdWejBtOXQ4OGF6aGE2VHVoWDZP?=
 =?utf-8?B?OTZZandrTmhsK1N4L3RHNG5TRVBxdU8xTDNxS0ZrSFJ4cmFtM3JMYnRNczZT?=
 =?utf-8?B?WFJHY3JJVVdWU0V0ZGovYjBNamRtODh6L0N5WnNvckx4ZkkvVGlpeFcxeUVH?=
 =?utf-8?B?bU9pZktLb3JjVHFKV3dIeUxhaFUxbjIvdjBFSlc4MHJOM09sR0ZNVXVKR1Fy?=
 =?utf-8?B?ZGZyK1RlRzY0K09USTFnWjFicFdGdXVnYVVka3NIVHlEbmhDQ3dleTBLMzBR?=
 =?utf-8?B?elNta3ozYjQwUGhCSkphMi84UDZPWHphaDVUWEtFYmhHQ1NJRHRSaytkTUs0?=
 =?utf-8?B?UHVocnpTMGw3Q1VFNjZGbkVaU0J0eVc0V1loalJPQUVOaHpQdHc5Njhra0Nn?=
 =?utf-8?B?Wmhzd0E1aXR6T1kyTHBuZStVVUJVTjZja1d1UW50WFdFQk1UNWJPTDZ2MkNn?=
 =?utf-8?B?UysramUva2l4dmRxUW12U3J1cU93N01qOHYycFV4N0Y2UHVER29hMDluR0ha?=
 =?utf-8?B?NUJiK0pnV21TdmZhU2kzMGhSQVF4cHJ4TXMxTDE5TXB0U3FNb3kwYWh4K3dV?=
 =?utf-8?B?TXhsS1lHV3o5QmQyd21hQXViY0ZWbXB6dWFUbTQ1QkFMRjlTejJ6RHlhOGpt?=
 =?utf-8?B?d29CajQ4Q0ltSHNXQmxXOHAyeU1aSGVZNVhXaDd0OGNvMEx2UVhWelVmZUkr?=
 =?utf-8?B?VHZPaUh3YmdiNy94c3lhb2FLR3IzRTBSMVlBeEo2QldKbkhqclVtWEEwR0Rx?=
 =?utf-8?B?b3lPUlMwQVN1Umpvc3B1cU5wK0VYMFpuSklCbFhyaUkrazNzcHgyV2NiM1Aw?=
 =?utf-8?B?NWE1cERqVDNKUUM5SFVuRHdRSE5ENy9sWmlTWU5Ddi9JQktqM1NkNDhCd1lZ?=
 =?utf-8?B?UkU3QjVibGhBd1l3QXZRVW1PcWR2YjF6cFBmY2c5dWgrRmpTd0loN0tWVVI0?=
 =?utf-8?B?U2JYOXc4Qk9VYllzbXdyYVQrNkhIS0t1RWh2Slp6SVZNdjlsbWR4ejFCTFl1?=
 =?utf-8?B?ODFwdDkrWGxRUjBOUUxLSXNHZ3dTZENzUTJqNVlCaGd2TnpvOTdaWjRBbzJj?=
 =?utf-8?B?ZkoxWTIzeDdpRWNGc3ErREd0WXVrNUhyK3QxSm05aE8rekRLRzFidXNSQUoy?=
 =?utf-8?B?Q1RaYytlZEJRbFNhWWlZZVBPdHFqMW5BMFNiTE1TTnNIQXpFdnh1V1VjaVhw?=
 =?utf-8?Q?NX42fAuWBB3LShWZq3SSi/v0x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f578dee8-0f4b-4adb-811f-08dc180c9488
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 10:02:29.2832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iaQ9OZIEii1UFAgNfAu8DEyBo0FBTz/mO2D3tsPyP+YrbSJKhC1DSqEQhEDIuhEB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4227
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
Cc: android-mm@google.com, daniel@ffwll.ch, minchan@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------e9qSk2sYXbf5DiMrI9jyGXQS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 17.01.24 um 19:11 schrieb T.J. Mercier:
> DMA buffers allocated from the CMA dma-buf heap get counted under
> RssFile for processes that map them and trigger page faults. In
> addition to the incorrect accounting reported to userspace, reclaim
> behavior was influenced by the MM_FILEPAGES counter until linux 6.8, but
> this memory is not reclaimable. [1] Change the CMA dma-buf heap to set
> VM_PFNMAP on the VMA so MM does not poke at the memory managed by this
> dma-buf heap, and use vmf_insert_pfn to correct the RSS accounting.
>
> The system dma-buf heap does not suffer from this issue since
> remap_pfn_range is used during the mmap of the buffer, which also sets
> VM_PFNMAP on the VMA.

Mhm, not an issue with this patch but Daniel wanted to add a check for 
VM_PFNMAP to dma_buf_mmap() which would have noted this earlier.

I don't fully remember the discussion but for some reason that was never 
committed. We should probably try that again.

> [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/mm/vmscan.c?id=fb46e22a9e3863e08aef8815df9f17d0f4b9aede
>
> Fixes: b61614ec318a ("dma-buf: heaps: Add CMA heap to dmabuf heaps")
> Signed-off-by: T.J. Mercier<tjmercier@google.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/heaps/cma_heap.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> index ee899f8e6721..4a63567e93ba 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -168,10 +168,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *vmf)
>   	if (vmf->pgoff > buffer->pagecount)
>   		return VM_FAULT_SIGBUS;
>   
> -	vmf->page = buffer->pages[vmf->pgoff];
> -	get_page(vmf->page);
> -
> -	return 0;
> +	return vmf_insert_pfn(vma, vmf->address, page_to_pfn(buffer->pages[vmf->pgoff]));
>   }
>   
>   static const struct vm_operations_struct dma_heap_vm_ops = {
> @@ -185,6 +182,8 @@ static int cma_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
>   	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
>   		return -EINVAL;
>   
> +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
> +
>   	vma->vm_ops = &dma_heap_vm_ops;
>   	vma->vm_private_data = buffer;
>   

--------------e9qSk2sYXbf5DiMrI9jyGXQS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 17.01.24 um 19:11 schrieb T.J. Mercier:<br>
    <blockquote type="cite" cite="mid:20240117181141.286383-1-tjmercier@google.com">
      <pre class="moz-quote-pre" wrap="">DMA buffers allocated from the CMA dma-buf heap get counted under
RssFile for processes that map them and trigger page faults. In
addition to the incorrect accounting reported to userspace, reclaim
behavior was influenced by the MM_FILEPAGES counter until linux 6.8, but
this memory is not reclaimable. [1] Change the CMA dma-buf heap to set
VM_PFNMAP on the VMA so MM does not poke at the memory managed by this
dma-buf heap, and use vmf_insert_pfn to correct the RSS accounting.

The system dma-buf heap does not suffer from this issue since
remap_pfn_range is used during the mmap of the buffer, which also sets
VM_PFNMAP on the VMA.</pre>
    </blockquote>
    <br>
    Mhm, not an issue with this patch but Daniel wanted to add a check
    for VM_PFNMAP to dma_buf_mmap() which would have noted this earlier.<br>
    <br>
    I don't fully remember the discussion but for some reason that was
    never committed. We should probably try that again.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20240117181141.286383-1-tjmercier@google.com">
      <pre class="moz-quote-pre" wrap="">[1] <a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/mm/vmscan.c?id=fb46e22a9e3863e08aef8815df9f17d0f4b9aede">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/mm/vmscan.c?id=fb46e22a9e3863e08aef8815df9f17d0f4b9aede</a>

Fixes: b61614ec318a (&quot;dma-buf: heaps: Add CMA heap to dmabuf heaps&quot;)
Signed-off-by: T.J. Mercier <a class="moz-txt-link-rfc2396E" href="mailto:tjmercier@google.com">&lt;tjmercier@google.com&gt;</a></pre>
    </blockquote>
    <br>
    Acked-by: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a><br>
    <br>
    <blockquote type="cite" cite="mid:20240117181141.286383-1-tjmercier@google.com">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/dma-buf/heaps/cma_heap.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index ee899f8e6721..4a63567e93ba 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -168,10 +168,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *vmf)
 	if (vmf-&gt;pgoff &gt; buffer-&gt;pagecount)
 		return VM_FAULT_SIGBUS;
 
-	vmf-&gt;page = buffer-&gt;pages[vmf-&gt;pgoff];
-	get_page(vmf-&gt;page);
-
-	return 0;
+	return vmf_insert_pfn(vma, vmf-&gt;address, page_to_pfn(buffer-&gt;pages[vmf-&gt;pgoff]));
 }
 
 static const struct vm_operations_struct dma_heap_vm_ops = {
@@ -185,6 +182,8 @@ static int cma_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 	if ((vma-&gt;vm_flags &amp; (VM_SHARED | VM_MAYSHARE)) == 0)
 		return -EINVAL;
 
+	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
+
 	vma-&gt;vm_ops = &amp;dma_heap_vm_ops;
 	vma-&gt;vm_private_data = buffer;
 
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------e9qSk2sYXbf5DiMrI9jyGXQS--
