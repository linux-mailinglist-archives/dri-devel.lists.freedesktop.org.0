Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF80A41D3BD
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 08:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E796E30C;
	Thu, 30 Sep 2021 06:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5249E6E30C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 06:58:13 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id g41so21090171lfv.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 23:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AM58cnJzWheq7pN6e6L+Di8EyxwT/TZuwdLAOFe5lTM=;
 b=zUA02mDiD7ySh4VXdtJEkfF+YdiTY26SnB/zKlU6AV6H7K06hWuMhIkqyICSRgwmLh
 mMJqj75qYMRjZUryj8QznGOt1/uDr4q20FUyRlmfjvyWGDa9fNh1/KqmeTmllPC6LWsE
 x4UA5ycScWSfPjOhkCW04pIaQRZYoSk1kxBDhV5iIfdgOPXgQIurppjGXWQBQKV44tdK
 e3xYCw8TWtFK4EQHVWDRiAj+PrQUHjPo23h+iyjT1HwajPzvid5J/T6xDSKDma7HJFnH
 Cj5iu6tWUHc/wClUvPhMJJqFlksmjgvu0yQ5HqUPJilAeIxDFCaEgOlTE9y+38eHL9g4
 81Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AM58cnJzWheq7pN6e6L+Di8EyxwT/TZuwdLAOFe5lTM=;
 b=pxUnYe559MFPh9izDIjO6uTPM5rNPXo2C3KdIwHcYDcA7Ln/0RivXoY71y2Ig0iPv5
 nfzT8db/0ULHSq71kKHKgjWidxNslzuQRpG6RMmo8ssaMZZbgWojwCG9276cZ3vHiJIY
 nd8tTNE7qyciQUrr8Rjkj91vV8sb/HpStZHWq6628mz9rizBw6kkDVEBkq99rf73isaK
 0CTA8RRKULdBE6WSQ6WEiOTKQVBSlzdiOD2rNyERo3RGXSXf5T+hVg6OHpz1FAiL/PMt
 s5VsT76+okdfucBk0XWOL0zvjJPfZH3+WcXvvZjyF62r6TBdRW7g4VoJBrdMYgrG2933
 kQRQ==
X-Gm-Message-State: AOAM532EeUqBcicdM3ylyoiDqb5sVQ5PDCj96O5UJqvsMq7bBpjPS5M5
 KVjFks90g0qYmH7vIB2C8hFrfua7WYNHg1AJd6RQNg==
X-Google-Smtp-Source: ABdhPJyBqEgHtMpNYqgONgpO8bSsYcGCUmFFaeLYGEyFgNwtKcwbfga4y3No6ih2UN25mIxw8sdz+lK6j2VMsBbQMOg=
X-Received: by 2002:a19:f507:: with SMTP id j7mr4119788lfb.645.1632985091555; 
 Wed, 29 Sep 2021 23:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210930062014.38200-1-mie@igel.co.jp>
 <20210930062014.38200-2-mie@igel.co.jp>
 <CAD=hENdzYGNp14fm9y9+A71D2BJSjV5GewHMkSJKUzNOs0hqWg@mail.gmail.com>
In-Reply-To: <CAD=hENdzYGNp14fm9y9+A71D2BJSjV5GewHMkSJKUzNOs0hqWg@mail.gmail.com>
From: Shunsuke Mie <mie@igel.co.jp>
Date: Thu, 30 Sep 2021 15:58:00 +0900
Message-ID: <CANXvt5pcHbRVa9=Uqi-MN6RY1g6OY1MDecyhdedqL8Xmv0y6QQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/1] Providers/rxe: Add dma-buf support
To: Zhu Yanjun <zyjzyj2000@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Jianxin Xiong <jianxin.xiong@intel.com>, Leon Romanovsky <leon@kernel.org>, 
 Maor Gottlieb <maorg@nvidia.com>, Sean Hefty <sean.hefty@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org, 
 LKML <linux-kernel@vger.kernel.org>, 
 RDMA mailing list <linux-rdma@vger.kernel.org>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>, 
 Takanari Hayama <taki@igel.co.jp>, Tomohito Esaki <etom@igel.co.jp>
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

2021=E5=B9=B49=E6=9C=8830=E6=97=A5(=E6=9C=A8) 15:37 Zhu Yanjun <zyjzyj2000@=
gmail.com>:
>
> On Thu, Sep 30, 2021 at 2:20 PM Shunsuke Mie <mie@igel.co.jp> wrote:
> >
> > Implement a new provider method for dma-buf base memory registration.
> >
> > Signed-off-by: Shunsuke Mie <mie@igel.co.jp>
> > ---
> >  providers/rxe/rxe.c | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
> > diff --git a/providers/rxe/rxe.c b/providers/rxe/rxe.c
> > index 3c3ea8bb..84e00e60 100644
> > --- a/providers/rxe/rxe.c
> > +++ b/providers/rxe/rxe.c
> > @@ -239,6 +239,26 @@ static struct ibv_mr *rxe_reg_mr(struct ibv_pd *pd=
, void *addr, size_t length,
> >         return &vmr->ibv_mr;
> >  }
> >
> > +static struct ibv_mr *rxe_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t of=
fset,
> > +                                       size_t length, uint64_t iova, i=
nt fd,
> > +                                       int access)
> > +{
> > +       struct verbs_mr *vmr;
> > +       int ret;
> > +
> > +       vmr =3D malloc(sizeof(*vmr));
> > +       if (!vmr)
> > +               return NULL;
> > +
>
> Do we need to set vmr to zero like the following?
>
> memset(vmr, 0, sizeof(*vmr));
>
> Zhu Yanjun
Thank you for your quick response.

I think it is better to clear the vmr. Actually the mlx5 driver allocates
the vmr using calloc().

In addition, rxe_reg_mr() (not rxe_reg_dmabuf_mr()) is used the malloc
and not clear the vmr. I think It has to be fixed too. Should I make
another patch to fix this problem?

Thanks a lot.
Shunsuke

~
