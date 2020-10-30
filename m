Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E369629FFB2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:24:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413846E999;
	Fri, 30 Oct 2020 08:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from r3-19.sinamail.sina.com.cn (r3-19.sinamail.sina.com.cn
 [202.108.3.19])
 by gabe.freedesktop.org (Postfix) with SMTP id EDB1C6E961
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 07:53:00 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([103.193.190.174])
 by sina.com with ESMTP
 id 5F9BC5C700035BBA; Fri, 30 Oct 2020 15:50:33 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 18572715073642
From: Hillf Danton <hdanton@sina.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v4 7/7] dma-buf: system_heap: Add a system-uncached heap
 re-using the system heap
Date: Fri, 30 Oct 2020 15:50:23 +0800
Message-Id: <20201030075023.3250-1-hdanton@sina.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: James Jones <jajones@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
 Liam Mark <lmark@codeaurora.org>, lkml <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Oct 2020 21:04:30 -0700 John Stultz wrote:
> 
> But I'll try to share my thoughts:
> 
> So the system heap allows for allocation of non-contiguous buffers
> (currently allocated from page_alloc), which we keep track using
> sglists.
> Since the resulting dmabufs are shared between multiple devices, we
> want to provide a *specific type of memory* (in this case
> non-contiguous system memory), rather than what the underlying
> dma_alloc_attr() allocates for a specific device.

If the memory slice(just a page for simple case) from
dma_alloc_attr(for device-A) does not work for device-B, nor can
page_alloc do the job imho.
> 
> My sense is dma_mmap_wc() likely ought to be paired with switching to
> using dma_alloc_wc() as well, which calls down to dma_alloc_attr().
> Maybe one could use dma_alloc_attr against the heap device to allocate
> chunks that we track in the sglist. But I'm not sure how that saves us
> much other than possibly swapping dma_mmap_wc() for remap_pfn_range()?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
