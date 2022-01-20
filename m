Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9AF49516C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA9810E4A1;
	Thu, 20 Jan 2022 15:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5D710E4A1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:27:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D837C61808;
 Thu, 20 Jan 2022 15:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F58CC340E0;
 Thu, 20 Jan 2022 15:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642692459;
 bh=Pw9woOKfBVJV94yKFOUNOSr0Qw3ODqyl0O2HtAePtz0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pOKuNzyOrqoltMx1Os0/MBtmr/0Xb8E2I3GsmntkfouHLWh2rc+3eAmcf3brDY4+t
 Fbmu+22jcLD8zPsoLRItEYBxaFP/LmFrM+ZNY+7Hu6v4pDwNmCdQmOBa84URMALXbP
 t0P5+cQEQdYOBsE97ZNpat/tAti3jxnQ18Y+zs6Ym7qyCTeHef5hOeQzXZcVJInPwz
 /GVflmj6mwk/B0emQh9mlNzIvE/iVZ0lh8yVxwGOrRE3cwmSIjCH0KPcw3OPiUydMC
 Ey4aZayhMg8op0x5rg+6sjZW9YF+bJzBfJCR6vCSv/xPMKQ/4LpvFwVvlVpa42q4+2
 EQV2Hzq9pBsJA==
Date: Thu, 20 Jan 2022 07:27:36 -0800
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: Phyr Starter
Message-ID: <20220120152736.GB383746@dhcp-10-100-145-180.wdc.com>
References: <YdyKWeU0HTv8m7wD@casper.infradead.org>
 <20220111004126.GJ2328285@nvidia.com>
 <20220120135602.GA11223@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120135602.GA11223@lst.de>
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
 Matthew Wilcox <willy@infradead.org>, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 netdev@vger.kernel.org, Joao Martins <joao.m.martins@oracle.com>,
 Logan Gunthorpe <logang@deltatee.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 20, 2022 at 02:56:02PM +0100, Christoph Hellwig wrote:
>  - on the input side to dma mapping the bio_vecs (or phyrs) are chained
>    as bios or whatever the containing structure is.  These already exist
>    and have infrastructure at least in the block layer
>  - on the output side I plan for two options:
> 
> 	1) we have a sane IOMMU and everyting will be coalesced into a
> 	   single dma_range.  This requires setting the block layer
> 	   merge boundary to match the IOMMU page size, but that is
> 	   a very good thing to do anyway.

It doesn't look like IOMMU page sizes are exported, or even necessarily
consistently sized on at least one arch (power).
