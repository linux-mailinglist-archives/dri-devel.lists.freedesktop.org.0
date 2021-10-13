Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 025C442BF17
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 13:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661BE89993;
	Wed, 13 Oct 2021 11:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705FF89932
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 11:42:19 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t2so7316932wrb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 04:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=eDEZPOoYhgNdY0W+bckD5ycsSF3eiL9qBGkEwyK/NGU=;
 b=iVkiDefQPc+vMfsz/o+C7Aysi1GjzuTelnULer8vNHMGpDmnFC5uEFwmCTWhfCCgbc
 5JwepXtDywX4gGNXXXm2MSyIpWHLmzPFZEBa+OGzHZbkLOrLG35xpTSSLoHrX2COsYqK
 BXOHjBtR5rbTdKORf3o2B/igUpbyGfxCCgfI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=eDEZPOoYhgNdY0W+bckD5ycsSF3eiL9qBGkEwyK/NGU=;
 b=KB93LuEqaECDLwvg9Y6ppNFYnLciUw6G0nsFc3wjhe4Qjn7XNP+n33imqM/rAbYzAJ
 zOFGY9kK0lrMuZXbYrXEB28ACWg6VKgdus4iVMvs0mSYqmusTFm4ibE6iHy6QtyCbwNU
 dRViJf8AIRZ7cuZcZtBmJtGAosMrTOISWNtfNbJ3QZ6eTpFYokyo4Yi5O8FbFNMy4P2u
 pbTm6ZgR8tA/nwihxLMw6ZEkotCtNpcmwlp8N76Xr3pNYuPLlRqgrm0K5mmiyEc5KPJe
 XIcKLyeUBk5oD3bFrORxaIs5C9J/VyEgfWyX27Bp1AeC/LZnwuF3q+5xJe0KMVplpjy0
 dStA==
X-Gm-Message-State: AOAM5319+h9zqK/LD+Mt3a72TDVqgLSB5bJZGgx5kT65+QATYSvsN12V
 JVCB+xc2edxXbTbE/Rk3RQSCmQ==
X-Google-Smtp-Source: ABdhPJweynnRqFq59hOzQwrRfFURETZnA2yZQYOzLoAR09kFqa75YtsU8w+pbsxg2Jj0LgPpIiyHNw==
X-Received: by 2002:a5d:64a6:: with SMTP id m6mr39870595wrp.282.1634125337597; 
 Wed, 13 Oct 2021 04:42:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j14sm7674901wrw.12.2021.10.13.04.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 04:42:16 -0700 (PDT)
Date: Wed, 13 Oct 2021 13:42:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Shunsuke Mie <mie@igel.co.jp>
Cc: Zhu Yanjun <zyjzyj2000@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jianxin Xiong <jianxin.xiong@intel.com>,
 Leon Romanovsky <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>,
 Sean Hefty <sean.hefty@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 Takanari Hayama <taki@igel.co.jp>, Tomohito Esaki <etom@igel.co.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [RFC PATCH v2 2/2] RDMA/rxe: Add dma-buf support
Message-ID: <YWbGFkzkFRHmBcpa@phenom.ffwll.local>
Mail-Followup-To: Shunsuke Mie <mie@igel.co.jp>,
 Zhu Yanjun <zyjzyj2000@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jianxin Xiong <jianxin.xiong@intel.com>,
 Leon Romanovsky <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>,
 Sean Hefty <sean.hefty@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 Takanari Hayama <taki@igel.co.jp>, Tomohito Esaki <etom@igel.co.jp>
References: <20210929041905.126454-1-mie@igel.co.jp>
 <20210929041905.126454-3-mie@igel.co.jp>
 <YVXMkSDXybju88TU@phenom.ffwll.local>
 <CANXvt5rD82Lvvag_k9k+XE-Sj1S6Qwp5uf+-feUTvez1-t4xUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANXvt5rD82Lvvag_k9k+XE-Sj1S6Qwp5uf+-feUTvez1-t4xUA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Fri, Oct 01, 2021 at 12:56:48PM +0900, Shunsuke Mie wrote:
> 2021年9月30日(木) 23:41 Daniel Vetter <daniel@ffwll.ch>:
> >
> > On Wed, Sep 29, 2021 at 01:19:05PM +0900, Shunsuke Mie wrote:
> > > Implement a ib device operation ‘reg_user_mr_dmabuf’. Generate a
> > > rxe_map from the memory space linked the passed dma-buf.
> > >
> > > Signed-off-by: Shunsuke Mie <mie@igel.co.jp>
> > > ---
> > >  drivers/infiniband/sw/rxe/rxe_loc.h   |   2 +
> > >  drivers/infiniband/sw/rxe/rxe_mr.c    | 118 ++++++++++++++++++++++++++
> > >  drivers/infiniband/sw/rxe/rxe_verbs.c |  34 ++++++++
> > >  drivers/infiniband/sw/rxe/rxe_verbs.h |   2 +
> > >  4 files changed, 156 insertions(+)
> > >
> > > diff --git a/drivers/infiniband/sw/rxe/rxe_loc.h b/drivers/infiniband/sw/rxe/rxe_loc.h
> > > index 1ca43b859d80..8bc19ea1a376 100644
> > > --- a/drivers/infiniband/sw/rxe/rxe_loc.h
> > > +++ b/drivers/infiniband/sw/rxe/rxe_loc.h
> > > @@ -75,6 +75,8 @@ u8 rxe_get_next_key(u32 last_key);
> > >  void rxe_mr_init_dma(struct rxe_pd *pd, int access, struct rxe_mr *mr);
> > >  int rxe_mr_init_user(struct rxe_pd *pd, u64 start, u64 length, u64 iova,
> > >                    int access, struct rxe_mr *mr);
> > > +int rxe_mr_dmabuf_init_user(struct rxe_pd *pd, int fd, u64 start, u64 length,
> > > +                         u64 iova, int access, struct rxe_mr *mr);
> > >  int rxe_mr_init_fast(struct rxe_pd *pd, int max_pages, struct rxe_mr *mr);
> > >  int rxe_mr_copy(struct rxe_mr *mr, u64 iova, void *addr, int length,
> > >               enum rxe_mr_copy_dir dir);
> > > diff --git a/drivers/infiniband/sw/rxe/rxe_mr.c b/drivers/infiniband/sw/rxe/rxe_mr.c
> > > index 53271df10e47..af6ef671c3a5 100644
> > > --- a/drivers/infiniband/sw/rxe/rxe_mr.c
> > > +++ b/drivers/infiniband/sw/rxe/rxe_mr.c
> > > @@ -4,6 +4,7 @@
> > >   * Copyright (c) 2015 System Fabric Works, Inc. All rights reserved.
> > >   */
> > >
> > > +#include <linux/dma-buf.h>
> > >  #include "rxe.h"
> > >  #include "rxe_loc.h"
> > >
> > > @@ -245,6 +246,120 @@ int rxe_mr_init_user(struct rxe_pd *pd, u64 start, u64 length, u64 iova,
> > >       return err;
> > >  }
> > >
> > > +static int rxe_map_dmabuf_mr(struct rxe_mr *mr,
> > > +                          struct ib_umem_dmabuf *umem_dmabuf)
> > > +{
> > > +     struct rxe_map_set *set;
> > > +     struct rxe_phys_buf *buf = NULL;
> > > +     struct rxe_map **map;
> > > +     void *vaddr, *vaddr_end;
> > > +     int num_buf = 0;
> > > +     int err;
> > > +     size_t remain;
> > > +
> > > +     mr->dmabuf_map = kzalloc(sizeof &mr->dmabuf_map, GFP_KERNEL);
> >
> > dmabuf_maps are just tagged pointers (and we could shrink them to actually
> > just a tagged pointer if anyone cares about the overhead of the separate
> > bool), allocating them seperately is overkill.
> 
> I agree with you. However, I think it is needed to unmap by
> dma_buf_vunmap(). If there is another simple way to unmap it. It is not
> needed I think. What do you think about it?

dma_buf_vunmap does not kfree the dma_buf_map argument, so that's no
reason to allocate it separately. Or I'm confused.

Also apologies, I'm way behind on mails.
-Daniel

> 
> > > +     if (!mr->dmabuf_map) {
> > > +             err = -ENOMEM;
> > > +             goto err_out;
> > > +     }
> > > +
> > > +     err = dma_buf_vmap(umem_dmabuf->dmabuf, mr->dmabuf_map);
> > > +     if (err)
> > > +             goto err_free_dmabuf_map;
> > > +
> > > +     set = mr->cur_map_set;
> > > +     set->page_shift = PAGE_SHIFT;
> > > +     set->page_mask = PAGE_SIZE - 1;
> > > +
> > > +     map = set->map;
> > > +     buf = map[0]->buf;
> > > +
> > > +     vaddr = mr->dmabuf_map->vaddr;
> >
> > dma_buf_map can be an __iomem too, you shouldn't dig around in this, but
> > use the dma-buf-map.h helpers instead. On x86 (and I think also on most
> > arm) it doesn't matter, but it's kinda not very nice in a pure software
> > driver.
> >
> > If anything is missing in dma-buf-map.h wrappers just add more.
> >
> > Or alternatively you need to fail the import if you can't handle __iomem.
> >
> > Aside from these I think the dma-buf side here for cpu access looks
> > reasonable now.
> > -Daniel
> I'll see the dma-buf-map.h and consider the error handling that you suggested.
> I appreciate your support.
> 
> Thanks a lot,
> Shunsuke.
> 
> > > +     vaddr_end = vaddr + umem_dmabuf->dmabuf->size;
> > > +     remain = umem_dmabuf->dmabuf->size;
> > > +
> > > +     for (; remain; vaddr += PAGE_SIZE) {
> > > +             if (num_buf >= RXE_BUF_PER_MAP) {
> > > +                     map++;
> > > +                     buf = map[0]->buf;
> > > +                     num_buf = 0;
> > > +             }
> > > +
> > > +             buf->addr = (uintptr_t)vaddr;
> > > +             if (remain >= PAGE_SIZE)
> > > +                     buf->size = PAGE_SIZE;
> > > +             else
> > > +                     buf->size = remain;
> > > +             remain -= buf->size;
> > > +
> > > +             num_buf++;
> > > +             buf++;
> > > +     }
> > > +
> > > +     return 0;
> > > +
> > > +err_free_dmabuf_map:
> > > +     kfree(mr->dmabuf_map);
> > > +err_out:
> > > +     return err;
> > > +}
> > > +
> > > +static void rxe_unmap_dmabuf_mr(struct rxe_mr *mr)
> > > +{
> > > +     struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(mr->umem);
> > > +
> > > +     dma_buf_vunmap(umem_dmabuf->dmabuf, mr->dmabuf_map);
> > > +     kfree(mr->dmabuf_map);
> > > +}
> > > +
> > > +int rxe_mr_dmabuf_init_user(struct rxe_pd *pd, int fd, u64 start, u64 length,
> > > +                         u64 iova, int access, struct rxe_mr *mr)
> > > +{
> > > +     struct ib_umem_dmabuf *umem_dmabuf;
> > > +     struct rxe_map_set *set;
> > > +     int err;
> > > +
> > > +     umem_dmabuf = ib_umem_dmabuf_get(pd->ibpd.device, start, length, fd,
> > > +                                      access, NULL);
> > > +     if (IS_ERR(umem_dmabuf)) {
> > > +             err = PTR_ERR(umem_dmabuf);
> > > +             goto err_out;
> > > +     }
> > > +
> > > +     rxe_mr_init(access, mr);
> > > +
> > > +     err = rxe_mr_alloc(mr, ib_umem_num_pages(&umem_dmabuf->umem), 0);
> > > +     if (err) {
> > > +             pr_warn("%s: Unable to allocate memory for map\n", __func__);
> > > +             goto err_release_umem;
> > > +     }
> > > +
> > > +     mr->ibmr.pd = &pd->ibpd;
> > > +     mr->umem = &umem_dmabuf->umem;
> > > +     mr->access = access;
> > > +     mr->state = RXE_MR_STATE_VALID;
> > > +     mr->type = IB_MR_TYPE_USER;
> > > +
> > > +     set = mr->cur_map_set;
> > > +     set->length = length;
> > > +     set->iova = iova;
> > > +     set->va = start;
> > > +     set->offset = ib_umem_offset(mr->umem);
> > > +
> > > +     err = rxe_map_dmabuf_mr(mr, umem_dmabuf);
> > > +     if (err)
> > > +             goto err_free_map_set;
> > > +
> > > +     return 0;
> > > +
> > > +err_free_map_set:
> > > +     rxe_mr_free_map_set(mr->num_map, mr->cur_map_set);
> > > +err_release_umem:
> > > +     ib_umem_release(&umem_dmabuf->umem);
> > > +err_out:
> > > +     return err;
> > > +}
> > > +
> > >  int rxe_mr_init_fast(struct rxe_pd *pd, int max_pages, struct rxe_mr *mr)
> > >  {
> > >       int err;
> > > @@ -703,6 +818,9 @@ void rxe_mr_cleanup(struct rxe_pool_entry *arg)
> > >  {
> > >       struct rxe_mr *mr = container_of(arg, typeof(*mr), pelem);
> > >
> > > +     if (mr->umem && mr->umem->is_dmabuf)
> > > +             rxe_unmap_dmabuf_mr(mr);
> > > +
> > >       ib_umem_release(mr->umem);
> > >
> > >       if (mr->cur_map_set)
> > > diff --git a/drivers/infiniband/sw/rxe/rxe_verbs.c b/drivers/infiniband/sw/rxe/rxe_verbs.c
> > > index 9d0bb9aa7514..6191bb4f434d 100644
> > > --- a/drivers/infiniband/sw/rxe/rxe_verbs.c
> > > +++ b/drivers/infiniband/sw/rxe/rxe_verbs.c
> > > @@ -916,6 +916,39 @@ static struct ib_mr *rxe_reg_user_mr(struct ib_pd *ibpd,
> > >       return ERR_PTR(err);
> > >  }
> > >
> > > +static struct ib_mr *rxe_reg_user_mr_dmabuf(struct ib_pd *ibpd, u64 start,
> > > +                                         u64 length, u64 iova, int fd,
> > > +                                         int access, struct ib_udata *udata)
> > > +{
> > > +     int err;
> > > +     struct rxe_dev *rxe = to_rdev(ibpd->device);
> > > +     struct rxe_pd *pd = to_rpd(ibpd);
> > > +     struct rxe_mr *mr;
> > > +
> > > +     mr = rxe_alloc(&rxe->mr_pool);
> > > +     if (!mr) {
> > > +             err = -ENOMEM;
> > > +             goto err2;
> > > +     }
> > > +
> > > +     rxe_add_index(mr);
> > > +
> > > +     rxe_add_ref(pd);
> > > +
> > > +     err = rxe_mr_dmabuf_init_user(pd, fd, start, length, iova, access, mr);
> > > +     if (err)
> > > +             goto err3;
> > > +
> > > +     return &mr->ibmr;
> > > +
> > > +err3:
> > > +     rxe_drop_ref(pd);
> > > +     rxe_drop_index(mr);
> > > +     rxe_drop_ref(mr);
> > > +err2:
> > > +     return ERR_PTR(err);
> > > +}
> > > +
> > >  static struct ib_mr *rxe_alloc_mr(struct ib_pd *ibpd, enum ib_mr_type mr_type,
> > >                                 u32 max_num_sg)
> > >  {
> > > @@ -1081,6 +1114,7 @@ static const struct ib_device_ops rxe_dev_ops = {
> > >       .query_qp = rxe_query_qp,
> > >       .query_srq = rxe_query_srq,
> > >       .reg_user_mr = rxe_reg_user_mr,
> > > +     .reg_user_mr_dmabuf = rxe_reg_user_mr_dmabuf,
> > >       .req_notify_cq = rxe_req_notify_cq,
> > >       .resize_cq = rxe_resize_cq,
> > >
> > > diff --git a/drivers/infiniband/sw/rxe/rxe_verbs.h b/drivers/infiniband/sw/rxe/rxe_verbs.h
> > > index c807639435eb..0aa95ab06b6e 100644
> > > --- a/drivers/infiniband/sw/rxe/rxe_verbs.h
> > > +++ b/drivers/infiniband/sw/rxe/rxe_verbs.h
> > > @@ -334,6 +334,8 @@ struct rxe_mr {
> > >
> > >       struct rxe_map_set      *cur_map_set;
> > >       struct rxe_map_set      *next_map_set;
> > > +
> > > +     struct dma_buf_map *dmabuf_map;
> > >  };
> > >
> > >  enum rxe_mw_state {
> > > --
> > > 2.17.1
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
