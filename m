Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B01C3287502
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 15:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0B66E145;
	Thu,  8 Oct 2020 13:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51EF6E145
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 13:13:02 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 07A4220578;
 Thu,  8 Oct 2020 13:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602162782;
 bh=f5CAh4zguc2F314h97m4g5FXYXF5tuswE6BnjI/hQNI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mb6qgfCUxqbWvlQDal5QCq8ws3ofepAoWt11LPSShWLSoUgWqaU8D+ekZe3faQmvz
 ZQSEaq3USGF3TfQKvrL2as7JB779BfVU/Y5ufDogWMakVF71EDJBDE+dwc70I7+WE7
 M6dYT3H+UMOvKcODxx9tG7wjlHCQhR84niYbELzo=
Date: Thu, 8 Oct 2020 08:18:24 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: christian.koenig@amd.com
Subject: Re: [PATCH] dma-buf: use struct_size macro
Message-ID: <20201008131824.GA6588@embeddedor>
References: <20201008081013.27384-1-christian.koenig@amd.com>
 <CAKMK7uHj4TEkXqiKmeU9x5m85ynPLoCaYR+GSWV6ZwZrSBbEog@mail.gmail.com>
 <5d1b3405-64d4-0e69-7337-caa456abcb78@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d1b3405-64d4-0e69-7337-caa456abcb78@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 08, 2020 at 10:40:10AM +0200, Christian K=F6nig wrote:
> Am 08.10.20 um 10:17 schrieb Daniel Vetter:
> > On Thu, Oct 8, 2020 at 10:10 AM Christian K=F6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > Instead of manually calculating the structure size.
> > > =

> > > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

> =

> Thanks, could anybody (not me) come up with a cocci script for this?
> =

> I'm pretty sure we have used this pattern more than once in the kernel.
> =


Sure thing. I'll take care of that. I saw this same pattern, recently[1]:

"
> +       size =3D offsetof(struct pmt_crashlog_priv, entry[pdev->num_resou=
rces]);
> +       priv =3D devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;

struct_size()
"

[1] https://lore.kernel.org/lkml/CAHp75VcP58Ub=3DgmbRVy0TPJtntKvnQZoi3tOakx=
E0qsEqzGPVA@mail.gmail.com/

Thanks
--
Gustavo

> =

> > =

> > > ---
> > >   drivers/dma-buf/dma-resv.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > =

> > > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > > index 1c8f2581cb09..bb5a42b10c29 100644
> > > --- a/drivers/dma-buf/dma-resv.c
> > > +++ b/drivers/dma-buf/dma-resv.c
> > > @@ -63,7 +63,7 @@ static struct dma_resv_list *dma_resv_list_alloc(un=
signed int shared_max)
> > >   {
> > >          struct dma_resv_list *list;
> > > =

> > > -       list =3D kmalloc(offsetof(typeof(*list), shared[shared_max]),=
 GFP_KERNEL);
> > > +       list =3D kmalloc(struct_size(list, shared, shared_max), GFP_K=
ERNEL);
> > >          if (!list)
> > >                  return NULL;
> > > =

> > > --
> > > 2.17.1
> > > =

> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > =

> > =

> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
