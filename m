Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B894811BD6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 19:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E6310E295;
	Wed, 13 Dec 2023 18:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC1210E295
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 18:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=j3ZC5EbD0G4TSJuMPyaj+089aRX2W7LOcU54bH3M1OU=; b=EEc2Ut8eH0HnGb/7iuvuIUTpba
 jgnw2489MXsJwEKNlNTvgJszqzJnzUJU8t89KYZijV9BHG8Wp84Z/gTBm8BhUdPXypJOBsqpFVTmZ
 2Not73u+nv0pkrHB7xoXAwNrcpukCuv//B20hObOJs3q5UvlpU+JHFTT2CGtyRy/s835UWhj2s9Zo
 awLOROUiiWfr+QGnl8PjzYL30b0PaF99RrLgn2SuYLi8daQtqyHpZQaVJB/61czMMDY5vQHoFevyt
 yc9MOSbeX3DjMpCbE0Uvbxn6L0+EpFYGdFwXcXKyTLgTirwOWrBlUnJa8+KnIvHm8oSAST4vlWVzK
 nq9yCWTw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1rDTaR-002OMJ-Bj; Wed, 13 Dec 2023 18:03:59 +0000
Date: Wed, 13 Dec 2023 18:03:59 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v7 5/6] udmabuf: Pin the pages using memfd_pin_folios()
 API (v5)
Message-ID: <ZXnyD6DL+j4R4M+l@casper.infradead.org>
References: <20231212073803.3233055-1-vivek.kasireddy@intel.com>
 <20231212073803.3233055-6-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212073803.3233055-6-vivek.kasireddy@intel.com>
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

On Mon, Dec 11, 2023 at 11:38:02PM -0800, Vivek Kasireddy wrote:
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -42,7 +42,7 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
>  	if (pgoff >= ubuf->pagecount)
>  		return VM_FAULT_SIGBUS;
>  
> -	pfn = page_to_pfn(&ubuf->folios[pgoff]->page);
> +	pfn = page_to_pfn(folio_page(ubuf->folios[pgoff], 0));

Why are you changing from &folio->page to folio_page(folio, 0) in
this patch?  Either that should have been done the other way in the
earlier patch, or it shouldn't be done at all.

My vote is that it shuoldn't be done at all.  These all seem like "I
have to convert back from folio to page because the APIs I want aren't
available", not "I want the first page from this folio".

