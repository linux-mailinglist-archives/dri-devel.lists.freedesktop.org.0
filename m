Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C76C5678750
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 21:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B5E10E54F;
	Mon, 23 Jan 2023 20:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D0E10E54F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 20:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Ngc+CXDl+DsRbq3lWnI7piUsiNzsOROjyFJIUEysZJs=; b=bzGhtmRO6jbeOsswarmJVeMnGJ
 PR20MTV7RYmNRA5+zVjh3RcdblbYIX4PfGRdkeeHrOAAV7hgxTnV1765Sf+h/I8B4try7AX2xbAMH
 kX6i05ioo31SJlQy0wRDHcgHiNtCRQXKQCMqs/zCWD3tGqW94g9gx8HCkkuLKi4yAzCjaYVc8fBGr
 TWgqD8jt+62nusrZ/wgiFi56Ux+3t2Bnaj3HTWys8MriCwhBHt6Y24JfixJ/WPUoRUIGNwMsRNnj1
 pCw2z0L/V4dWwjgEkLiqcH7V47hwyDBHv0XTxRr5vJ7mL8PdD0MVQdl9hXxA/GnuUlUlTGr9i8bf+
 Nd/0SwTA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pK3AE-004Uoy-A2; Mon, 23 Jan 2023 20:11:34 +0000
Date: Mon, 23 Jan 2023 20:11:34 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [Lsf-pc] [LSF/MM/BPF proposal]: Physr discussion
Message-ID: <Y87p9i0vCZo/3Qa0@casper.infradead.org>
References: <Y8v+qVZ8OmodOCQ9@nvidia.com>
 <63cee1d3eaaef_3a36e529488@dwillia2-xfh.jf.intel.com.notmuch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63cee1d3eaaef_3a36e529488@dwillia2-xfh.jf.intel.com.notmuch>
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
Cc: nvdimm@lists.linux.dev, lsf-pc@lists.linuxfoundation.org,
 linux-rdma@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 dri-devel@lists.freedesktop.org, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org, iommu@lists.linux.dev,
 netdev@vger.kernel.org, Joao Martins <joao.m.martins@oracle.com>,
 Jason Gunthorpe via Lsf-pc <lsf-pc@lists.linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 23, 2023 at 11:36:51AM -0800, Dan Williams wrote:
> Jason Gunthorpe via Lsf-pc wrote:
> > I would like to have a session at LSF to talk about Matthew's
> > physr discussion starter:
> > 
> >  https://lore.kernel.org/linux-mm/YdyKWeU0HTv8m7wD@casper.infradead.org/
> > 
> > I have become interested in this with some immediacy because of
> > IOMMUFD and this other discussion with Christoph:
> > 
> >  https://lore.kernel.org/kvm/4-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com/
> 
> I think this is a worthwhile discussion. My main hangup with 'struct
> page' elimination in general is that if anything needs to be allocated

You're the first one to bring up struct page elimination.  Neither Jason
nor I have that as our motivation.  But there are reasons why struct page
is a bad data structure, and Xen proves that you don't need to have such
a data structure in order to do I/O.

> When I read "general interest across all the driver subsystems" it is
> hard not to ask "have all possible avenues to enable 'struct page' been
> exhausted?"

Yes, we should definitely expend yet more resources chasing a poor
implementation.
