Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E96B811BC0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 19:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7985D10E095;
	Wed, 13 Dec 2023 18:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF25110E095
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 18:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ktJZ0d41GyynKto+sqLobmDOIfV0MP6FoedSStsH9RA=; b=eatWHUPRWvSEss1GcSYfmY11uk
 xWhoYIR4TkYsh8pwdvnLUMgn2VG3bL1l73l9YsF85o2CSR+et9jUVhTlsiStvHVdjDN5jsvxC585+
 pi1Q2dfJ4h0dCLroWL7jUGQnfUvpdZ+MMsJS2VNIZv7KuO1xWfCD2JM5qnAhC9MCLjrllwdmSwNAI
 QqL7WvfjkGOxuxklgnX/yJ2Lr+kJWZ5in5FEVDzpM+zcIkkJe27ELH5hUSM8844JilfKW3U7mFEOF
 4r+5FGmWsBqB2BI1X15XU1XDt9RCychU0fd/eel7Brhc7qPpkV52U/e4+oTx4XMnAWba9JKee8l8V
 OduTH1Nw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1rDTX5-002Nk0-Oz; Wed, 13 Dec 2023 18:00:31 +0000
Date: Wed, 13 Dec 2023 18:00:31 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v7 4/6] udmabuf: Convert udmabuf driver to use folios
Message-ID: <ZXnxP5tsL0TWyo43@casper.infradead.org>
References: <20231212073803.3233055-1-vivek.kasireddy@intel.com>
 <20231212073803.3233055-5-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212073803.3233055-5-vivek.kasireddy@intel.com>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hugh Dickins <hughd@google.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Junxiao Chang <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 11, 2023 at 11:38:01PM -0800, Vivek Kasireddy wrote:
> @@ -42,7 +42,7 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
>  	if (pgoff >= ubuf->pagecount)
>  		return VM_FAULT_SIGBUS;
>  
> -	pfn = page_to_pfn(ubuf->pages[pgoff]);
> +	pfn = page_to_pfn(&ubuf->folios[pgoff]->page);

We have folio_pfn().

>  static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
>  {
>  	struct udmabuf *ubuf = buf->priv;
> +	struct page **pages;
>  	void *vaddr;
> +	pgoff_t pg;
>  
>  	dma_resv_assert_held(buf->resv);
>  
> -	vaddr = vm_map_ram(ubuf->pages, ubuf->pagecount, -1);
> +	pages = kmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
> +	if (!pages)
> +		return -ENOMEM;
> +
> +	for (pg = 0; pg < ubuf->pagecount; pg++)
> +		pages[pg] = &ubuf->folios[pg]->page;
> +
> +	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
> +	kfree(pages);

We don't yet have a vm_map_ram() variant that takes an array of
folios.  We probably should; there was _something_ I was looking at
recently that would have liked it ...

> @@ -254,31 +262,70 @@ static int handle_shmem_pages(struct udmabuf *ubuf, struct file *memfd,
>  			      pgoff_t *pgbuf)
>  {
>  	pgoff_t pgidx, pgoff = offset >> PAGE_SHIFT;
> -	struct page *page;
> +	struct folio *folio = NULL;
>  
>  	for (pgidx = 0; pgidx < pgcnt; pgidx++) {
> -		page = shmem_read_mapping_page(memfd->f_mapping,
> -					       pgoff + pgidx);
> -		if (IS_ERR(page))
> -			return PTR_ERR(page);
> +		folio = shmem_read_folio(memfd->f_mapping,
> +					 pgoff + pgidx);

You could join these two lines.

