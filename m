Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82316284942
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 11:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3488F6E106;
	Tue,  6 Oct 2020 09:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F6A6E106
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 09:22:18 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q5so1563237wmq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 02:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vqWUXovxlDHnIIpmXJAIMDOTP1UnC02nidaQuwXQABQ=;
 b=PQ3i7/bLhuxIrjSbCE7Rdi9k9GTyfAwaiee+Xz50N529u+tbf3WeMch/34eM+CuE3s
 9XieZESusb3rMVRbejugAeoQldsKtKbz3JChdScEUD4xK2fpxSsmiCvUzPdP+bcgG92x
 9REbf4vUVu8Ndv7T7F/rGQkG5hHU8EOPjxTFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vqWUXovxlDHnIIpmXJAIMDOTP1UnC02nidaQuwXQABQ=;
 b=o8mQAUM93afAVNjyF3xxo+Jzcfl/cfMaL/QSpyRAGzlSa11dJetPDhKuVeybBGuYJP
 UcDWrP7J7rJkejD2KTvDB9KxAqWwyZT/KN1J5N+lam6OEDiYCNQz9vYUveUHyfGL3VEp
 NkHRPs0qFSkA+HJhu2NabiYnN/MsfRrlDWvb6/7Qr6aCrKL1JoYYz4oiXPrO/DDzMEKC
 EV75PBLbfLMAZp7HYCIZ+V0kwJYyq2YJTzkA08Ec5wVi4E0v6Z8L+2K1WyGVJ4ovJivc
 KNKOeDK7Kiw7c+V+niM3s7C1JmdjhGyESMSg24BZwsWgjL0KjNfahW7GeXgOdnoMtxha
 CUeA==
X-Gm-Message-State: AOAM532fJwmjr3MfSP24rtvMXdeG2V39shdj/NcoUqDQhJjXL1hDDzwl
 FNKh/JNzXEIN/oZ12/NWd2wDMQ==
X-Google-Smtp-Source: ABdhPJwH5xsVL8Jtme2Bw6QxhXZvles3p74eY9ZX9xMw9WwjjJK57X6/dPcvGE0+clmE4fn5xVuKUw==
X-Received: by 2002:a1c:bb84:: with SMTP id l126mr3972820wmf.159.1601976136837; 
 Tue, 06 Oct 2020 02:22:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m14sm57086wro.43.2020.10.06.02.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 02:22:15 -0700 (PDT)
Date: Tue, 6 Oct 2020 11:22:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [RFC PATCH v3 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201006092214.GX438822@phenom.ffwll.local>
References: <1601838751-148544-1-git-send-email-jianxin.xiong@intel.com>
 <1601838751-148544-2-git-send-email-jianxin.xiong@intel.com>
 <20201005131302.GQ9916@ziepe.ca>
 <MW3PR11MB455572267489B3F6B1C5F8C5E50C0@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB455572267489B3F6B1C5F8C5E50C0@MW3PR11MB4555.namprd11.prod.outlook.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 05, 2020 at 04:18:11PM +0000, Xiong, Jianxin wrote:
> > -----Original Message-----
> > From: Jason Gunthorpe <jgg@ziepe.ca>
> > Sent: Monday, October 05, 2020 6:13 AM
> > To: Xiong, Jianxin <jianxin.xiong@intel.com>
> > Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> > <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> > <daniel.vetter@intel.com>
> > Subject: Re: [RFC PATCH v3 1/4] RDMA/umem: Support importing dma-buf as user memory region
> > 
> > On Sun, Oct 04, 2020 at 12:12:28PM -0700, Jianxin Xiong wrote:
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
> > > ---
> > >  drivers/infiniband/core/Makefile      |   2 +-
> > >  drivers/infiniband/core/umem.c        |   4 +
> > >  drivers/infiniband/core/umem_dmabuf.c | 291
> > > ++++++++++++++++++++++++++++++++++
> > >  drivers/infiniband/core/umem_dmabuf.h |  14 ++
> > >  drivers/infiniband/core/umem_odp.c    |  12 ++
> > >  include/rdma/ib_umem.h                |  19 ++-
> > >  6 files changed, 340 insertions(+), 2 deletions(-)  create mode
> > > 100644 drivers/infiniband/core/umem_dmabuf.c
> > >  create mode 100644 drivers/infiniband/core/umem_dmabuf.h
> > 
> > I think this is using ODP too literally, dmabuf isn't going to need fine grained page faults, and I'm not sure this locking scheme is OK - ODP is
> > horrifically complicated.
> > 
> 
> > If this is the approach then I think we should make dmabuf its own stand alone API, reg_user_mr_dmabuf()
> 
> That's the original approach in the first version. We can go back there.
> 
> > 
> > The implementation in mlx5 will be much more understandable, it would just do dma_buf_dynamic_attach() and program the XLT exactly
> > the same as a normal umem.
> > 
> > The move_notify() simply zap's the XLT and triggers a work to reload it after the move. Locking is provided by the dma_resv_lock. Only a
> > small disruption to the page fault handler is needed.
> > 
> 
> We considered such scheme but didn't go that way due to the lack of
> notification when the move is done and thus the work wouldn't know when
> it can reload.
> 
> Now I think it again, we could probably signal the reload in the page fault handler. 

For reinstanting the pages you need:

- dma_resv_lock, this prevents anyone else from issuing new moves or
  anything like that
- dma_resv_get_excl + dma_fence_wait to wait for any pending moves to
  finish. gpus generally don't wait on the cpu, but block the dependent
  dma operations from being scheduled until that fence fired. But for rdma
  odp I think you need the cpu wait in your worker here.
- get the new sg list, write it into your ptes
- dma_resv_unlock to make sure you're not racing with a concurrent
  move_notify

You can also grab multiple dma_resv_lock in atomically, but I think the
odp rdma model doesn't require that (gpus need that).

Note that you're allowed to allocate memory with GFP_KERNEL while holding
dma_resv_lock, so this shouldn't impose any issues. You are otoh not
allowed to cause userspace faults (so no gup/pup or copy*user with
faulting enabled). So all in all this shouldn't be any worse that calling
pup for normal umem.

Unlike mmu notifier the caller holds dma_resv_lock already for you around
the move_notify callback, so you shouldn't need any additional locking in
there (aside from what you need to zap the ptes and flush hw tlbs).

Cheers, Daniel

> 
> > > +	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
> > > +	sgt = dma_buf_map_attachment(umem_dmabuf->attach,
> > > +				     DMA_BIDIRECTIONAL);
> > > +	dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
> > 
> > This doesn't look right, this lock has to be held up until the HW is programmed
> 
> The mapping remains valid until being invalidated again. There is a sequence number checking before programming the HW. 
> 
> > 
> > The use of atomic looks probably wrong as well.
> 
> Do you mean umem_dmabuf->notifier_seq? Could you elaborate the concern?
> 
> > 
> > > +	k = 0;
> > > +	total_pages = ib_umem_odp_num_pages(umem_odp);
> > > +	for_each_sg(umem->sg_head.sgl, sg, umem->sg_head.nents, j) {
> > > +		addr = sg_dma_address(sg);
> > > +		pages = sg_dma_len(sg) >> page_shift;
> > > +		while (pages > 0 && k < total_pages) {
> > > +			umem_odp->dma_list[k++] = addr | access_mask;
> > > +			umem_odp->npages++;
> > > +			addr += page_size;
> > > +			pages--;
> > 
> > This isn't fragmenting the sg into a page list properly, won't work for unaligned things
> 
> I thought the addresses are aligned, but will add explicit alignment here.
> 
> > 
> > And really we don't need the dma_list for this case, with a fixed whole mapping DMA SGL a normal umem sgl is OK and the normal umem
> > XLT programming in mlx5 is fine.
> 
> The dma_list is used by both "polulate_mtt()" and "mlx5_ib_invalidate_range", which are used for XLT programming and invalidating (zapping), respectively.
> 
> > 
> > Jason
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
