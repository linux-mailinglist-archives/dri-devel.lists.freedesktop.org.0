Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3E4CA5110
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 20:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B6710E9AF;
	Thu,  4 Dec 2025 19:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rJith8/G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7059710E9AF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 19:07:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7DBB560051;
 Thu,  4 Dec 2025 19:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA03C116C6;
 Thu,  4 Dec 2025 19:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764875275;
 bh=0T0myU9ZH1tB3I+V7V43BU4jBwzUFIVwxphPm1myBzk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rJith8/Gx4Wd98GNbJ7JgxHjEk0D7lIa7DnpsSn1yMaGQI1EqxuiciLXwN8wZjnEJ
 qlxn4LehW7CPwkt/TTMulNZcItXi43kAMUvpYKmyfbKYiRELimMl9ItWI0kgWE/kNY
 DfWbzXb0XWX6awag8QffycQU0ga5vSjnsYEqXVBd4zpvHQQQX3d1dxhOaC5FzIJ6Ma
 Hy0H7EzRJg/nhYxMd5AhbzQ9AjRWFsCy3fbNeeBFBkprwe4nvjOnrPt+oWQqfVnP6K
 TFX5BFa3hA3MJBYZfIM9zGb8IH9ErkKMEgjMl3Ts9QSjnlc/e0kR6/Uc/FgMonv2Sx
 JSCz/VsurrB9A==
Date: Thu, 4 Dec 2025 12:07:51 -0700
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, linux-block@vger.kernel.org,
 io-uring@vger.kernel.org, Vishal Verma <vishal1.verma@intel.com>,
 tushar.gohad@intel.com, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [RFC v2 06/11] nvme-pci: add support for dmabuf reggistration
Message-ID: <aTHcB7Vm80XDMiaH@kbusch-mbp>
References: <cover.1763725387.git.asml.silence@gmail.com>
 <9bc25f46d2116436d73140cd8e8554576de2caca.1763725388.git.asml.silence@gmail.com>
 <aTFpsl3o7IoJ_xPg@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTFpsl3o7IoJ_xPg@infradead.org>
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

On Thu, Dec 04, 2025 at 03:00:02AM -0800, Christoph Hellwig wrote:
> Why do you care about alignment to the controller page size?
> 
> > +	for_each_sgtable_dma_sg(sgt, sg, tmp) {
> > +		dma_addr_t dma = sg_dma_address(sg);
> > +		unsigned long sg_len = sg_dma_len(sg);
> > +
> > +		while (sg_len) {
> > +			dma_list[i++] = dma;
> > +			dma += NVME_CTRL_PAGE_SIZE;
> > +			sg_len -= NVME_CTRL_PAGE_SIZE;
> > +		}
> > +	}
> 
> Why does this build controller pages sized chunks?

I think the idea was that having fixed size entries aligned to the
device's PRP unit is that it's efficient to jump to the correct index
for any given offset. A vector of mixed sizes would require you walk the
list to find the correct starting point, which we want to avoid.

This is similar to the way io_uring registered memory is set up, though
io_uring has extra logic to use largest common contiguous segment size,
or even just one segment if it coalesces. We could probably do that too.

Anyway, that representation naturally translates to the PRP format, but
this could be done in the SGL format too.
