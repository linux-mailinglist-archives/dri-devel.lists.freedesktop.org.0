Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6A441E655
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 05:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653736E4FF;
	Fri,  1 Oct 2021 03:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3877C6E4FF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 03:57:03 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b20so33886078lfv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 20:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fXb8y+bXmPuBOybIV2eflC1DwdU53PBuIEygazZp4sE=;
 b=I6iV7EgHSf3PWPEgWYk8/lXb4YQgFwerV7wYq10LjwA5U1uSfmGntSEUnMGh1raMdn
 dDx+oQLSLVkkNS/4LTxT05M5iK7iuLXscIt02E76rpvHP0Xt5QyF4ll2d8CCnEfRJKaX
 cvJvTuPa7kP9qlrNYfoeayoAbS8PBEclCyUvoTIuwANks7VralukuBJ2tVE9lWrj+Ho+
 aJuPpOA+M9HGqGFXyGEfTc4zy0vRA/OaA806TR56tvpNAdGwwKPlEu9g3w339CBezGc1
 0t6ReYftPPzHvnIao93YWyr2j3BdBHe4XGkpZ4MDfj0kwb0V0JnGX3IULzRibQvsnzPv
 XHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fXb8y+bXmPuBOybIV2eflC1DwdU53PBuIEygazZp4sE=;
 b=GPGHniO/M+LsUbXZ/hsny1ZQN4ukJNlIGiXUBypGHxGggoLVmn89xvzKzqNeJ9XdKq
 E2MitWC7iRDmmCukv6UkECkBm7PWVchO1uayeM80cQZOTNFaGaFXlmsZenwDZP1xmyR7
 PY8b471GTXQZNkGPAdRBztgfnS0roeLVzgOR06t5QAdL9t+HHLq4KHiW+FmhBHHL+Z4I
 yjwJkXmR1cegWE/754aBgU+niFR/GjpD6zIpMDo6t3oD7MWv4msgSbzUUT5yHrbgHYJF
 +BBf6edoWFEjvyIRoaijoCeaYTpSCJh5WPAs5sBFUJonBiETwc+Ncd/WfxTNBs1ezZjS
 MCzA==
X-Gm-Message-State: AOAM5330FcaUq66NjE09oVY8zuwLrwf+aZEdpCJsd9l7cqYITAJyvUla
 0rnxbeIFwmUqkq4FftpdriqtruzNJHpwh11T8flZwA==
X-Google-Smtp-Source: ABdhPJxu9R18JSn4uqcGw0bcr1AkLe7/RY4D8aUUTW2lyZcpxgk2Fa1CJ0RvF7MLSHGJYX1eabn6aa7E6IWWS8QaLrY=
X-Received: by 2002:a05:651c:1795:: with SMTP id
 bn21mr9891765ljb.525.1633060621324; 
 Thu, 30 Sep 2021 20:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210929041905.126454-1-mie@igel.co.jp>
 <20210929041905.126454-3-mie@igel.co.jp>
 <YVXMkSDXybju88TU@phenom.ffwll.local>
In-Reply-To: <YVXMkSDXybju88TU@phenom.ffwll.local>
From: Shunsuke Mie <mie@igel.co.jp>
Date: Fri, 1 Oct 2021 12:56:48 +0900
Message-ID: <CANXvt5rD82Lvvag_k9k+XE-Sj1S6Qwp5uf+-feUTvez1-t4xUA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/2] RDMA/rxe: Add dma-buf support
To: Shunsuke Mie <mie@igel.co.jp>, Zhu Yanjun <zyjzyj2000@gmail.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Doug Ledford <dledford@redhat.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Jianxin Xiong <jianxin.xiong@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>,
 Sean Hefty <sean.hefty@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, 
 Damian Hobson-Garcia <dhobsong@igel.co.jp>, Takanari Hayama <taki@igel.co.jp>,
 Tomohito Esaki <etom@igel.co.jp>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

2021=E5=B9=B49=E6=9C=8830=E6=97=A5(=E6=9C=A8) 23:41 Daniel Vetter <daniel@f=
fwll.ch>:
>
> On Wed, Sep 29, 2021 at 01:19:05PM +0900, Shunsuke Mie wrote:
> > Implement a ib device operation =E2=80=98reg_user_mr_dmabuf=E2=80=99. G=
enerate a
> > rxe_map from the memory space linked the passed dma-buf.
> >
> > Signed-off-by: Shunsuke Mie <mie@igel.co.jp>
> > ---
> >  drivers/infiniband/sw/rxe/rxe_loc.h   |   2 +
> >  drivers/infiniband/sw/rxe/rxe_mr.c    | 118 ++++++++++++++++++++++++++
> >  drivers/infiniband/sw/rxe/rxe_verbs.c |  34 ++++++++
> >  drivers/infiniband/sw/rxe/rxe_verbs.h |   2 +
> >  4 files changed, 156 insertions(+)
> >
> > diff --git a/drivers/infiniband/sw/rxe/rxe_loc.h b/drivers/infiniband/s=
w/rxe/rxe_loc.h
> > index 1ca43b859d80..8bc19ea1a376 100644
> > --- a/drivers/infiniband/sw/rxe/rxe_loc.h
> > +++ b/drivers/infiniband/sw/rxe/rxe_loc.h
> > @@ -75,6 +75,8 @@ u8 rxe_get_next_key(u32 last_key);
> >  void rxe_mr_init_dma(struct rxe_pd *pd, int access, struct rxe_mr *mr)=
;
> >  int rxe_mr_init_user(struct rxe_pd *pd, u64 start, u64 length, u64 iov=
a,
> >                    int access, struct rxe_mr *mr);
> > +int rxe_mr_dmabuf_init_user(struct rxe_pd *pd, int fd, u64 start, u64 =
length,
> > +                         u64 iova, int access, struct rxe_mr *mr);
> >  int rxe_mr_init_fast(struct rxe_pd *pd, int max_pages, struct rxe_mr *=
mr);
> >  int rxe_mr_copy(struct rxe_mr *mr, u64 iova, void *addr, int length,
> >               enum rxe_mr_copy_dir dir);
> > diff --git a/drivers/infiniband/sw/rxe/rxe_mr.c b/drivers/infiniband/sw=
/rxe/rxe_mr.c
> > index 53271df10e47..af6ef671c3a5 100644
> > --- a/drivers/infiniband/sw/rxe/rxe_mr.c
> > +++ b/drivers/infiniband/sw/rxe/rxe_mr.c
> > @@ -4,6 +4,7 @@
> >   * Copyright (c) 2015 System Fabric Works, Inc. All rights reserved.
> >   */
> >
> > +#include <linux/dma-buf.h>
> >  #include "rxe.h"
> >  #include "rxe_loc.h"
> >
> > @@ -245,6 +246,120 @@ int rxe_mr_init_user(struct rxe_pd *pd, u64 start=
, u64 length, u64 iova,
> >       return err;
> >  }
> >
> > +static int rxe_map_dmabuf_mr(struct rxe_mr *mr,
> > +                          struct ib_umem_dmabuf *umem_dmabuf)
> > +{
> > +     struct rxe_map_set *set;
> > +     struct rxe_phys_buf *buf =3D NULL;
> > +     struct rxe_map **map;
> > +     void *vaddr, *vaddr_end;
> > +     int num_buf =3D 0;
> > +     int err;
> > +     size_t remain;
> > +
> > +     mr->dmabuf_map =3D kzalloc(sizeof &mr->dmabuf_map, GFP_KERNEL);
>
> dmabuf_maps are just tagged pointers (and we could shrink them to actuall=
y
> just a tagged pointer if anyone cares about the overhead of the separate
> bool), allocating them seperately is overkill.

I agree with you. However, I think it is needed to unmap by
dma_buf_vunmap(). If there is another simple way to unmap it. It is not
needed I think. What do you think about it?

> > +     if (!mr->dmabuf_map) {
> > +             err =3D -ENOMEM;
> > +             goto err_out;
> > +     }
> > +
> > +     err =3D dma_buf_vmap(umem_dmabuf->dmabuf, mr->dmabuf_map);
> > +     if (err)
> > +             goto err_free_dmabuf_map;
> > +
> > +     set =3D mr->cur_map_set;
> > +     set->page_shift =3D PAGE_SHIFT;
> > +     set->page_mask =3D PAGE_SIZE - 1;
> > +
> > +     map =3D set->map;
> > +     buf =3D map[0]->buf;
> > +
> > +     vaddr =3D mr->dmabuf_map->vaddr;
>
> dma_buf_map can be an __iomem too, you shouldn't dig around in this, but
> use the dma-buf-map.h helpers instead. On x86 (and I think also on most
> arm) it doesn't matter, but it's kinda not very nice in a pure software
> driver.
>
> If anything is missing in dma-buf-map.h wrappers just add more.
>
> Or alternatively you need to fail the import if you can't handle __iomem.
>
> Aside from these I think the dma-buf side here for cpu access looks
> reasonable now.
> -Daniel
I'll see the dma-buf-map.h and consider the error handling that you suggest=
ed.
I appreciate your support.

Thanks a lot,
Shunsuke.

> > +     vaddr_end =3D vaddr + umem_dmabuf->dmabuf->size;
> > +     remain =3D umem_dmabuf->dmabuf->size;
> > +
> > +     for (; remain; vaddr +=3D PAGE_SIZE) {
> > +             if (num_buf >=3D RXE_BUF_PER_MAP) {
> > +                     map++;
> > +                     buf =3D map[0]->buf;
> > +                     num_buf =3D 0;
> > +             }
> > +
> > +             buf->addr =3D (uintptr_t)vaddr;
> > +             if (remain >=3D PAGE_SIZE)
> > +                     buf->size =3D PAGE_SIZE;
> > +             else
> > +                     buf->size =3D remain;
> > +             remain -=3D buf->size;
> > +
> > +             num_buf++;
> > +             buf++;
> > +     }
> > +
> > +     return 0;
> > +
> > +err_free_dmabuf_map:
> > +     kfree(mr->dmabuf_map);
> > +err_out:
> > +     return err;
> > +}
> > +
> > +static void rxe_unmap_dmabuf_mr(struct rxe_mr *mr)
> > +{
> > +     struct ib_umem_dmabuf *umem_dmabuf =3D to_ib_umem_dmabuf(mr->umem=
);
> > +
> > +     dma_buf_vunmap(umem_dmabuf->dmabuf, mr->dmabuf_map);
> > +     kfree(mr->dmabuf_map);
> > +}
> > +
> > +int rxe_mr_dmabuf_init_user(struct rxe_pd *pd, int fd, u64 start, u64 =
length,
> > +                         u64 iova, int access, struct rxe_mr *mr)
> > +{
> > +     struct ib_umem_dmabuf *umem_dmabuf;
> > +     struct rxe_map_set *set;
> > +     int err;
> > +
> > +     umem_dmabuf =3D ib_umem_dmabuf_get(pd->ibpd.device, start, length=
, fd,
> > +                                      access, NULL);
> > +     if (IS_ERR(umem_dmabuf)) {
> > +             err =3D PTR_ERR(umem_dmabuf);
> > +             goto err_out;
> > +     }
> > +
> > +     rxe_mr_init(access, mr);
> > +
> > +     err =3D rxe_mr_alloc(mr, ib_umem_num_pages(&umem_dmabuf->umem), 0=
);
> > +     if (err) {
> > +             pr_warn("%s: Unable to allocate memory for map\n", __func=
__);
> > +             goto err_release_umem;
> > +     }
> > +
> > +     mr->ibmr.pd =3D &pd->ibpd;
> > +     mr->umem =3D &umem_dmabuf->umem;
> > +     mr->access =3D access;
> > +     mr->state =3D RXE_MR_STATE_VALID;
> > +     mr->type =3D IB_MR_TYPE_USER;
> > +
> > +     set =3D mr->cur_map_set;
> > +     set->length =3D length;
> > +     set->iova =3D iova;
> > +     set->va =3D start;
> > +     set->offset =3D ib_umem_offset(mr->umem);
> > +
> > +     err =3D rxe_map_dmabuf_mr(mr, umem_dmabuf);
> > +     if (err)
> > +             goto err_free_map_set;
> > +
> > +     return 0;
> > +
> > +err_free_map_set:
> > +     rxe_mr_free_map_set(mr->num_map, mr->cur_map_set);
> > +err_release_umem:
> > +     ib_umem_release(&umem_dmabuf->umem);
> > +err_out:
> > +     return err;
> > +}
> > +
> >  int rxe_mr_init_fast(struct rxe_pd *pd, int max_pages, struct rxe_mr *=
mr)
> >  {
> >       int err;
> > @@ -703,6 +818,9 @@ void rxe_mr_cleanup(struct rxe_pool_entry *arg)
> >  {
> >       struct rxe_mr *mr =3D container_of(arg, typeof(*mr), pelem);
> >
> > +     if (mr->umem && mr->umem->is_dmabuf)
> > +             rxe_unmap_dmabuf_mr(mr);
> > +
> >       ib_umem_release(mr->umem);
> >
> >       if (mr->cur_map_set)
> > diff --git a/drivers/infiniband/sw/rxe/rxe_verbs.c b/drivers/infiniband=
/sw/rxe/rxe_verbs.c
> > index 9d0bb9aa7514..6191bb4f434d 100644
> > --- a/drivers/infiniband/sw/rxe/rxe_verbs.c
> > +++ b/drivers/infiniband/sw/rxe/rxe_verbs.c
> > @@ -916,6 +916,39 @@ static struct ib_mr *rxe_reg_user_mr(struct ib_pd =
*ibpd,
> >       return ERR_PTR(err);
> >  }
> >
> > +static struct ib_mr *rxe_reg_user_mr_dmabuf(struct ib_pd *ibpd, u64 st=
art,
> > +                                         u64 length, u64 iova, int fd,
> > +                                         int access, struct ib_udata *=
udata)
> > +{
> > +     int err;
> > +     struct rxe_dev *rxe =3D to_rdev(ibpd->device);
> > +     struct rxe_pd *pd =3D to_rpd(ibpd);
> > +     struct rxe_mr *mr;
> > +
> > +     mr =3D rxe_alloc(&rxe->mr_pool);
> > +     if (!mr) {
> > +             err =3D -ENOMEM;
> > +             goto err2;
> > +     }
> > +
> > +     rxe_add_index(mr);
> > +
> > +     rxe_add_ref(pd);
> > +
> > +     err =3D rxe_mr_dmabuf_init_user(pd, fd, start, length, iova, acce=
ss, mr);
> > +     if (err)
> > +             goto err3;
> > +
> > +     return &mr->ibmr;
> > +
> > +err3:
> > +     rxe_drop_ref(pd);
> > +     rxe_drop_index(mr);
> > +     rxe_drop_ref(mr);
> > +err2:
> > +     return ERR_PTR(err);
> > +}
> > +
> >  static struct ib_mr *rxe_alloc_mr(struct ib_pd *ibpd, enum ib_mr_type =
mr_type,
> >                                 u32 max_num_sg)
> >  {
> > @@ -1081,6 +1114,7 @@ static const struct ib_device_ops rxe_dev_ops =3D=
 {
> >       .query_qp =3D rxe_query_qp,
> >       .query_srq =3D rxe_query_srq,
> >       .reg_user_mr =3D rxe_reg_user_mr,
> > +     .reg_user_mr_dmabuf =3D rxe_reg_user_mr_dmabuf,
> >       .req_notify_cq =3D rxe_req_notify_cq,
> >       .resize_cq =3D rxe_resize_cq,
> >
> > diff --git a/drivers/infiniband/sw/rxe/rxe_verbs.h b/drivers/infiniband=
/sw/rxe/rxe_verbs.h
> > index c807639435eb..0aa95ab06b6e 100644
> > --- a/drivers/infiniband/sw/rxe/rxe_verbs.h
> > +++ b/drivers/infiniband/sw/rxe/rxe_verbs.h
> > @@ -334,6 +334,8 @@ struct rxe_mr {
> >
> >       struct rxe_map_set      *cur_map_set;
> >       struct rxe_map_set      *next_map_set;
> > +
> > +     struct dma_buf_map *dmabuf_map;
> >  };
> >
> >  enum rxe_mw_state {
> > --
> > 2.17.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
