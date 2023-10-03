Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE98A7B6C89
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 16:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E256489580;
	Tue,  3 Oct 2023 14:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227A189580
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 14:59:25 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-57bab8676f9so586131eaf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Oct 2023 07:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1696345164; x=1696949964;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=paCC2yP2dDTzgPbMIpAziwv1LCMCxhhjgQrwrl1gs1o=;
 b=wkL1dLJO9tcTskwsqp4s3XmvaGJ7Y06qjX/QO88zYmUNs6FFjKUT6QEXHi7ikg/sdJ
 081rRQfC66zRxx+KaFn6nxmHC/1h4z75L36QmFI9dRHzKogsKeOyWHpaKo8QclHHolI9
 f1Tg0Eu46sxIf8JpuVKj0bAuKv8hra84MepuQqBSEaN956SxnQgVuxObSvH22MxAslDB
 ZuvPuN5nCn4cQml7JRs6sfMkbD5zQc7mOTKcpDhl80TNE+zzdExYxtDCeXM3PsXZwWf6
 pVbxUkVbtCORBZq9QlIjGGFYihZz42mJEs97zMJ5IMF4SdimHl86vmSwPNIki1H5z3ma
 prZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696345164; x=1696949964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=paCC2yP2dDTzgPbMIpAziwv1LCMCxhhjgQrwrl1gs1o=;
 b=FGuuJ0ptNHFsWNCPNho7m1y5qWQZg6DEJpd4RT1CRBiK24OgeGEdRm3t/q/AjMq4WW
 I3GRHboNmakLnAt5f200AgjfwU6fXqAnApBAMZZnR3RkkjESHw/ikHVZwHuh3fdgLjm3
 yZ/iL619a1ozEpPyTVvqO579BqCHY4E4MYkg+J9op7cudtqYdLR6vYumhM0mIRh3lRmZ
 GjYD5TK/3NLVearCkXEfF9SJxTiCuXbZK9njrogeff8c3q3AL6ndIYwYmlKHhzS0ASGy
 webQeqxLymzWMIYzDqBES2X+AiJOzZteLS2P+6iL4O0+eSiwORtHj9Atplpomt4aAL5x
 iVzg==
X-Gm-Message-State: AOJu0Yw8B0ge35m0AjDoUHoRQwoONzPbkeQyOr4CVjRn7z7o8kU8mxf9
 cwD9FXRFwgyfct5fxshsRV4Joya/Who5rtmnY/xYsw==
X-Google-Smtp-Source: AGHT+IEC/Kn3ElM9sRc8RziFnK7dG4Mz8Mu+9fXziWBkbOanl/IOsnZjGUYnuFHW5isQpUi/P4sO/SVenJA9KUgaiWk=
X-Received: by 2002:a05:6358:2822:b0:143:8f7f:9150 with SMTP id
 k34-20020a056358282200b001438f7f9150mr14957693rwb.13.1696345163992; Tue, 03
 Oct 2023 07:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <bc145167-0471-4ab3-935c-aa5dc20e342a@moroto.mountain>
 <CABdmKX1PsCcRpsnUgwoS9yMhCXcin1bQt6D+N0b2mHP93cmX-A@mail.gmail.com>
 <04ea5706-7373-48c4-a93e-e69c50816a0b@kadam.mountain>
In-Reply-To: <04ea5706-7373-48c4-a93e-e69c50816a0b@kadam.mountain>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 3 Oct 2023 07:59:12 -0700
Message-ID: <CABdmKX3dg70gMnzmxOGHOM3ZucE6jFAFpskLShFNxE=g=LBy0g@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Fix off by one in cma_heap_vm_fault()
To: Dan Carpenter <dan.carpenter@linaro.org>
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 3, 2023 at 1:30=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> On Mon, Oct 02, 2023 at 10:16:24AM -0700, T.J. Mercier wrote:
> > On Mon, Oct 2, 2023 at 12:04=E2=80=AFAM Dan Carpenter <dan.carpenter@li=
naro.org> wrote:
> > >
> > > The buffer->pages[] has "buffer->pagecount" elements so this > compar=
ison
> > > has to be changed to >=3D to avoid reading beyond the end of the arra=
y.
> > > The buffer->pages[] array is allocated in cma_heap_allocate().
> > >
> > > Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the=
 cma_heap implementation")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >  drivers/dma-buf/heaps/cma_heap.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps=
/cma_heap.c
> > > index ee899f8e6721..bea7e574f916 100644
> > > --- a/drivers/dma-buf/heaps/cma_heap.c
> > > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > > @@ -165,7 +165,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fau=
lt *vmf)
> > >         struct vm_area_struct *vma =3D vmf->vma;
> > >         struct cma_heap_buffer *buffer =3D vma->vm_private_data;
> > >
> > > -       if (vmf->pgoff > buffer->pagecount)
> > > +       if (vmf->pgoff >=3D buffer->pagecount)
> > >                 return VM_FAULT_SIGBUS;
> > >
> > Hi Dan,
> >
> > Your fix looks correct to me, but I'm curious if you observed this
> > problem on a device? The mmap in dma-buf.c looks like it prevents
> > creating a mapping that is too large, and I think an access beyond the
> > VMA should segfault before reaching here.
>
> This is from static analysis and not from testing.  You could be correct
> that this bug can't affect real life.
>
> regards,
> dan carpenter

Ok, thanks Dan.

Reviewed-by: T.J. Mercier <tjmercier@google.com>
