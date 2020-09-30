Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8BE27E5B4
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 11:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157C16E088;
	Wed, 30 Sep 2020 09:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F7289CB9;
 Wed, 30 Sep 2020 09:53:25 +0000 (UTC)
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 155502075F;
 Wed, 30 Sep 2020 09:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601459605;
 bh=n7b9ZN9lWXqAAXqpvYhEZTZkNVvQeHxENX4KKFd7s9M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zlp5hRjXAbo8Cb3tqMZFlDt2iXHugyplO5KpoQHA35xj21Luw9UV2SE1NMbzEn1Th
 NWaA9Dh177egigRZUNdHfS116GxaJNzvsoz+pogGkCK+t++5wVfb/Ldv+IEQ+Etwrw
 kiqvESwSIgjPGPTiDha1J90UvqA0M/RzaxWRdgvQ=
Date: Wed, 30 Sep 2020 12:53:21 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH rdma-next v4 4/4] RDMA/umem: Move to allocate SG table
 from pages
Message-ID: <20200930095321.GL3094@unreal>
References: <20200927064647.3106737-1-leon@kernel.org>
 <20200927064647.3106737-5-leon@kernel.org>
 <20200929195929.GA803555@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929195929.GA803555@nvidia.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, Doug Ledford <dledford@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maor Gottlieb <maorg@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 04:59:29PM -0300, Jason Gunthorpe wrote:
> On Sun, Sep 27, 2020 at 09:46:47AM +0300, Leon Romanovsky wrote:
> > @@ -296,11 +223,17 @@ static struct ib_umem *__ib_umem_get(struct ib_device *device,
> >  			goto umem_release;
> >
> >  		cur_base += ret * PAGE_SIZE;
> > -		npages   -= ret;
> > -
> > -		sg = ib_umem_add_sg_table(sg, page_list, ret,
> > -			dma_get_max_seg_size(device->dma_device),
> > -			&umem->sg_nents);
> > +		npages -= ret;
> > +		sg = __sg_alloc_table_from_pages(
> > +			&umem->sg_head, page_list, ret, 0, ret << PAGE_SHIFT,
> > +			dma_get_max_seg_size(device->dma_device), sg, npages,
> > +			GFP_KERNEL);
> > +		umem->sg_nents = umem->sg_head.nents;
> > +		if (IS_ERR(sg)) {
> > +			unpin_user_pages_dirty_lock(page_list, ret, 0);
> > +			ret = PTR_ERR(sg);
> > +			goto umem_release;
> > +		}
> >  	}
> >
> >  	sg_mark_end(sg);
>
> Does it still need the sg_mark_end?

It is preserved here for correctness, the release logic doesn't rely on
this marker, but it is better to leave it.

Thanks

>
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
