Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3E42D3280
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 20:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3C16E03E;
	Tue,  8 Dec 2020 19:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AF06E03E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 19:02:57 +0000 (UTC)
Date: Tue, 8 Dec 2020 21:02:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607454176;
 bh=on7V4OWCmVPzcIia0frhRZpTXCRt5e/b3cclGe2h/vc=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=AWrmh7AdWcTdHB/rW/9k5hDWSjxkK6XQilu9LdiVu5TDSjcBq6T3BVuHyS2Difqbl
 BYaiQfKf0zrqJlScxqzMo17FxqxFcHpangAOlkxGzuw+wlaj+XAl8CVRLi7kYXUhdW
 +Hz3ZqKbCY9bp4F/TrVUBXlla8N4FHeFfQ933WEvrRYE2Zzy1L/Wyhbwyf2QImhWmG
 HvkJ3ypbHXCXY+zzAkDb3npeZV8wBaY25q7dk+lY+VXxnGvouhdVPXpySXApgpIH/6
 wMBSmCGIzY45V+INYmN9PYj8QFsgHUnBuD1VkpLtXUy5ho5HMZ4NgNaFiK5rGbK81T
 0dCFF+jeKYygQ==
From: Leon Romanovsky <leon@kernel.org>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [PATCH v13 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201208190252.GI4430@unreal>
References: <1607379353-116215-1-git-send-email-jianxin.xiong@intel.com>
 <1607379353-116215-2-git-send-email-jianxin.xiong@intel.com>
 <20201208070532.GE4430@unreal>
 <MW3PR11MB45554A727DA7940D81FE1C14E5CD0@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB45554A727DA7940D81FE1C14E5CD0@MW3PR11MB4555.namprd11.prod.outlook.com>
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
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 08, 2020 at 06:13:20PM +0000, Xiong, Jianxin wrote:
> > -----Original Message-----
> > From: Leon Romanovsky <leon@kernel.org>
> > Sent: Monday, December 07, 2020 11:06 PM
> > To: Xiong, Jianxin <jianxin.xiong@intel.com>
> > Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Jason Gunthorpe <jgg@ziepe.ca>;
> > Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel <daniel.vetter@intel.com>
> > Subject: Re: [PATCH v13 1/4] RDMA/umem: Support importing dma-buf as user memory region
> >
> > On Mon, Dec 07, 2020 at 02:15:50PM -0800, Jianxin Xiong wrote:
> > > Dma-buf is a standard cross-driver buffer sharing mechanism that can
> > > be used to support peer-to-peer access from RDMA devices.
> > >
> > > Device memory exported via dma-buf is associated with a file descriptor.
> > > This is passed to the user space as a property associated with the
> > > buffer allocation. When the buffer is registered as a memory region,
> > > the file descriptor is passed to the RDMA driver along with other
> > > parameters.
> > >
> > > Implement the common code for importing dma-buf object and mapping
> > > dma-buf pages.
> > >
> > > Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> > > Reviewed-by: Sean Hefty <sean.hefty@intel.com>
> > > Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > > Acked-by: Christian Koenig <christian.koenig@amd.com>
> > > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > >
> > > Conflicts:
> > > 	include/rdma/ib_umem.h
> >

<...>

> > > +	/*
> > > +	 * Although the sg list is valid now, the content of the pages
> > > +	 * may be not up-to-date. Wait for the exporter to finish
> > > +	 * the migration.
> > > +	 */
> > > +	fence = dma_resv_get_excl(umem_dmabuf->attach->dmabuf->resv);
> > > +	if (fence)
> > > +		dma_fence_wait(fence, false);
> >
> > Any reason do not check return result from dma_fence_wait()?
>
> This is called with interruptible flag set to false and normally should only return 0.
> I do see similar usage cases that check the result and don't check the result. Maybe
> we can add a WARN_ON here?

I have no idea :), just saw that other places check returned value.

<...>

> > > +
> > > +struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
> > > +				   unsigned long offset, size_t size,
> > > +				   int fd, int access,
> > > +				   const struct dma_buf_attach_ops *ops) {
> > > +	struct dma_buf *dmabuf;
> > > +	struct ib_umem_dmabuf *umem_dmabuf;
> > > +	struct ib_umem *umem;
> > > +	unsigned long end;
> > > +	long ret = -EINVAL;
> >
> > It is wrong type for the returned value. One of the possible options is to declare "struct ib_umem *ret;" and set ret = ERR_PTR(-EINVAL) or
> > ret = ERR_CAST(dmabuf);
>
> At the actual point the value is returned, ERR_PTR(ret) is used. I think we can change the
> variable name to "err" instead to avoid confusion.

The point is that "ret" should be declared as "struct ib_umem *" and not
as "long" and ERR_CAST() should be used instead of (void *).

<...>

> > > +static inline struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
> > > +						 unsigned long offset,
> > > +						 size_t size, int fd,
> > > +						 int access,
> > > +						 struct dma_buf_attach_ops *ops) {
> > > +	return ERR_PTR(-EINVAL);
> >
> > Probably, It should be EOPNOTSUPP and not EINVAL.
>
> EINVAL is used here to be consistent with existing definitions in the same file.

ok

Thanks
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
