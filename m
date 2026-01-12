Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB37D1345B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 15:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9B210E3F6;
	Mon, 12 Jan 2026 14:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ja8gTeB5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCA310E3F6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 14:47:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2BCDE4325F;
 Mon, 12 Jan 2026 14:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CD3C16AAE;
 Mon, 12 Jan 2026 14:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768229242;
 bh=vBh5+7wjLDHMjWPyGtwhZ1my9Rro606jkpR3pcAw3YI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ja8gTeB5MahdT23MVQBoYgJrO93p0hWyv5JUUGX3QoI1ZyxeX/ep04GYPubefUxwp
 DMTeCAoAa1NUMi76WVlvlfE+etWgXgDk1LndNWRrIjc1aXJ4yKFCO1GeZMEdP0m/ss
 AILsKaV4OzNnTChZErOf3yuzDXtWW46O3nFPP2zX8Ff+9jJtcDXRJUIaWqkcYwv4J/
 uOZQiQOkE++PZ+zT3bjIPNUzaUwYARCc70pOwFp3BPEFVg6Bfm3lAPYIIMqUFGmpyV
 9pqcSJ1cNiFX50QSWtbg0Jwatt7FBCV+NFw9WPxt2vlizh6kK1aGeeUlP6ItpIpjyh
 p0nS0bUoEr/jA==
Date: Mon, 12 Jan 2026 16:47:16 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Alex Williamson <alex@shazbot.org>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 0/4] dma-buf: add revoke mechanism to invalidate shared
 buffers
Message-ID: <20260112144716.GA179508@unreal>
References: <20260111-dmabuf-revoke-v1-0-fb4bcc8c259b@nvidia.com>
 <eed9fd4c-ca36-4f6a-af10-56d6e0997d8c@amd.com>
 <20260112121956.GE14378@unreal>
 <2db90323-9ddc-4408-9074-b44d9178bc68@amd.com>
 <20260112141440.GE745888@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260112141440.GE745888@ziepe.ca>
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

On Mon, Jan 12, 2026 at 10:14:40AM -0400, Jason Gunthorpe wrote:
> On Mon, Jan 12, 2026 at 01:57:25PM +0100, Christian König wrote:
> > Clear NAK to that plan. This is not something DMA-buf should need to
> > deal with and as far as I can see is incompatible with the UAPI.
> 
> We had this discussion with Simona and you a while back and there was
> a pretty clear direction we needed to add a revoke to sit inbetween
> pin and move. I think Leon has no quite got the "dmabuf lingo" down
> right to explain this.
> 
>  https://lore.kernel.org/dri-devel/Z4Z4NKqVG2Vbv98Q@phenom.ffwll.local/

<...>

> It is not intended to be UAPI changing, and Leon is not trying to say
> that importers have to drop their attachment. The attachment just
> becomes permanently non-present.

Leon also ensures that no UAPI semantic changes are introduced here; the
existing interface is simply extended.

Thanks

> 
> Jason
