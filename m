Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D896635F29
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 14:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E114010E552;
	Wed, 23 Nov 2022 13:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B47E10E551;
 Wed, 23 Nov 2022 13:17:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0D2BB61CAD;
 Wed, 23 Nov 2022 13:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC3BFC433D6;
 Wed, 23 Nov 2022 13:17:36 +0000 (UTC)
Message-ID: <73481668-9c41-7d01-d328-bd137a57c0b3@xs4all.nl>
Date: Wed, 23 Nov 2022 14:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH mm-unstable v1 13/20] media: videobuf-dma-sg: remove
 FOLL_FORCE usage
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-14-david@redhat.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20221116102659.70287-14-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org,
 linux-rdma@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org,
 etnaviv@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>,
 Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Oded Gabbay <ogabbay@kernel.org>, linux-mips@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/11/2022 11:26, David Hildenbrand wrote:
> GUP now supports reliable R/O long-term pinning in COW mappings, such
> that we break COW early. MAP_SHARED VMAs only use the shared zeropage so
> far in one corner case (DAXFS file with holes), which can be ignored
> because GUP does not support long-term pinning in fsdax (see
> check_vma_flags()).
> 
> Consequently, FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM is no longer required
> for reliable R/O long-term pinning: FOLL_LONGTERM is sufficient. So stop
> using FOLL_FORCE, which is really only for ptrace access.
> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Looks good!

	Hans

> ---
>  drivers/media/v4l2-core/videobuf-dma-sg.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/videobuf-dma-sg.c b/drivers/media/v4l2-core/videobuf-dma-sg.c
> index f75e5eedeee0..234e9f647c96 100644
> --- a/drivers/media/v4l2-core/videobuf-dma-sg.c
> +++ b/drivers/media/v4l2-core/videobuf-dma-sg.c
> @@ -151,17 +151,16 @@ static void videobuf_dma_init(struct videobuf_dmabuf *dma)
>  static int videobuf_dma_init_user_locked(struct videobuf_dmabuf *dma,
>  			int direction, unsigned long data, unsigned long size)
>  {
> +	unsigned int gup_flags = FOLL_LONGTERM;
>  	unsigned long first, last;
> -	int err, rw = 0;
> -	unsigned int flags = FOLL_FORCE;
> +	int err;
>  
>  	dma->direction = direction;
>  	switch (dma->direction) {
>  	case DMA_FROM_DEVICE:
> -		rw = READ;
> +		gup_flags |= FOLL_WRITE;
>  		break;
>  	case DMA_TO_DEVICE:
> -		rw = WRITE;
>  		break;
>  	default:
>  		BUG();
> @@ -177,14 +176,11 @@ static int videobuf_dma_init_user_locked(struct videobuf_dmabuf *dma,
>  	if (NULL == dma->pages)
>  		return -ENOMEM;
>  
> -	if (rw == READ)
> -		flags |= FOLL_WRITE;
> -
>  	dprintk(1, "init user [0x%lx+0x%lx => %lu pages]\n",
>  		data, size, dma->nr_pages);
>  
> -	err = pin_user_pages(data & PAGE_MASK, dma->nr_pages,
> -			     flags | FOLL_LONGTERM, dma->pages, NULL);
> +	err = pin_user_pages(data & PAGE_MASK, dma->nr_pages, gup_flags,
> +			     dma->pages, NULL);
>  
>  	if (err != dma->nr_pages) {
>  		dma->nr_pages = (err >= 0) ? err : 0;

