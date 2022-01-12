Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570DB48CB1A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 19:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86BB10E3D7;
	Wed, 12 Jan 2022 18:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20AFB10E3D7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 18:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=d3mYL7vvYYZr7sYSXSZoJvLItuKF2IiEftPWgxK3tvo=; b=X45E3lNuJrpAEwLmEUkOPrwziM
 IBNiPalhlrj2QYU6klp+cJ2kP1PiK21hqA16D0chtvViP/3OYuYx7OOt2rxoNAcWW8HkjICxRW0V+
 BMczhcYFcEu/1JqcTAGI/9YPs+fuyB19cZHXfJPbMyR5otyPtlA1yagZ7WnFNmdjxPvUoM/sX5QfV
 OsOcixMCkLmUwHOQxOv0CeQt2B2gCqVq7RMW1lp8zLuKriV7Pj50w28yT0+V94iI6DjuJbzfkXCup
 OAIAeUfqYXr/uV0ONNGpxSFVIK3CawYG64OUO8FP1w35qmdy9ie9862kwk5mEtW2uVL+m4/Hez/KI
 AgvGhXgw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1n7iUZ-004Jsp-5A; Wed, 12 Jan 2022 18:37:03 +0000
Date: Wed, 12 Jan 2022 18:37:03 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: Phyr Starter
Message-ID: <Yd8fz4bY/aMMk24h@casper.infradead.org>
References: <YdyKWeU0HTv8m7wD@casper.infradead.org>
 <20220111004126.GJ2328285@nvidia.com>
 <Yd0IeK5s/E0fuWqn@casper.infradead.org>
 <20220111150142.GL2328285@nvidia.com>
 <Yd3Nle3YN063ZFVY@casper.infradead.org>
 <20220111202159.GO2328285@nvidia.com>
 <Yd311C45gpQ3LqaW@casper.infradead.org>
 <20220111225306.GR2328285@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111225306.GR2328285@nvidia.com>
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
Cc: nvdimm@lists.linux.dev, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 Joao Martins <joao.m.martins@oracle.com>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 11, 2022 at 06:53:06PM -0400, Jason Gunthorpe wrote:
> IOMMU is not common in those cases, it is slow.
> 
> So you end up with 16 bytes per entry then another 24 bytes in the
> entirely redundant scatter list. That is now 40 bytes/page for typical
> HPC case, and I can't see that being OK.

Ah, I didn't realise what case you wanted to optimise for.

So, how about this ...

Since you want to get to the same destination as I do (a
16-byte-per-entry dma_addr+dma_len struct), but need to get there sooner
than "make all sg users stop using it wrongly", let's introduce a
(hopefully temporary) "struct dma_range".

But let's go further than that (which only brings us to 32 bytes per
range).  For the systems you care about which use an identity mapping,
and have sizeof(dma_addr_t) == sizeof(phys_addr_t), we can simply
point the dma_range pointer to the same memory as the phyr.  We just
have to not free it too early.  That gets us down to 16 bytes per range,
a saving of 33%.

