Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA913B372F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 21:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD39F6EC61;
	Thu, 24 Jun 2021 19:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9146ECCB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 19:43:47 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id s129so992481ybf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 12:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h6q8HaZ+84zQCKOyUFwPa+dtWn3aDIb7oyq9WSst+ag=;
 b=EbzQRlgrV+M4PRE0Nh9q/rxRkPx8sB65Vp2f53rtUb/8gH/gQKU0+Rvh8CCUhB0eG7
 +FFlyxO9shULcV8auR0DBF1r98bk4+URCx8OK8yKOwrd6wPhWS2SDPoav/L8cRmG8qcP
 sEDTfTgsA0Lozl58MYS4m1ScZ+qLnUa3pAQ9rteI0OveW/mtaOuamMGdZLXiLIgE26Ph
 z6MrFlxIu0/n5RxKhfNM5Abfpi8sRCuSm06iuJh78JQ4v7VR/lizbk1h4h0GsrdkUjmt
 Ysy+8KgbUObW5F0iklZlDxZGsLvJoQKKqf/rpUP9v1ZPeCNoWj5VlkqdYoTT/e3xjygz
 kONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h6q8HaZ+84zQCKOyUFwPa+dtWn3aDIb7oyq9WSst+ag=;
 b=e6ZNLC5Ak6efd7Yp9qUGrfmVPoJQV1DkunurfonCCvrWZvOSO84bxWd8xpaH0AJao+
 GlQG6eTl/CkAhYzaWGlZ9wthn78kSe6EiPkUNTW7ChruwWNu/Bm6mX8AZOjglsZoQd00
 0SNp8BNsho4P+5XSKTzWpyaEfpLEinrkAT0y2m1i9ghht8J4VKJEHlvqGwm/55uJoxxs
 7HGcma9scKkghHyhudYERD3RqdFAef1Tuuyubn//raBdatq9j9nlfhYqQeKIvOtmr6Ik
 C2n9plyuf80pR3IKSZ3zhoCwClUEg8qORxEcrytIN2wbrBbRkATYy4HMg0+P8HvnpLod
 +9PQ==
X-Gm-Message-State: AOAM532WIVnvC4aQXaiz5+cgc77lj+gLSAkm1cYOBFlrdckd210ES1ig
 9usIcjdtqTf448EEoGLO9cSl49T5AKSV4hgm3mPERw==
X-Google-Smtp-Source: ABdhPJxePJBkOtRSvvQEkYsUstpOosNTqCS5TxGA1ooVIoDMyPZxA8FmO5HbKjKT8qjSN7UVWydJZvQtFhCA0YXcrIg=
X-Received: by 2002:a5b:392:: with SMTP id k18mr7799605ybp.180.1624563826697; 
 Thu, 24 Jun 2021 12:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210624174732.1754546-1-jason@jlekstrand.net>
 <2b69abeb-7c97-fe6a-384c-2e1f86529dba@amd.com>
In-Reply-To: <2b69abeb-7c97-fe6a-384c-2e1f86529dba@amd.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 24 Jun 2021 14:43:34 -0500
Message-ID: <CAOFGe961e4D+OdC8DQPk9aohpUqMmu34eant_LRfAzaAHQ_Ezw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf/sync_file: Don't leak fences on merge failure
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Gustavo Padovan <gustavo.padovan@collabora.co.uk>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I don't have drm-misc access.  Mind pushing?

On Thu, Jun 24, 2021 at 12:59 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 24.06.21 um 19:47 schrieb Jason Ekstrand:
> > Each add_fence() call does a dma_fence_get() on the relevant fence.  In
> > the error path, we weren't calling dma_fence_put() so all those fences
> > got leaked.  Also, in the krealloc_array failure case, we weren't
> > freeing the fences array.  Instead, ensure that i and fences are always
> > zero-initialized and dma_fence_put() all the fences and kfree(fences) o=
n
> > every error path.
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > Fixes: a02b9dc90d84 ("dma-buf/sync_file: refactor fence storage in stru=
ct sync_file")
> > Cc: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/dma-buf/sync_file.c | 13 +++++++------
> >   1 file changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> > index 20d9bddbb985b..394e6e1e96860 100644
> > --- a/drivers/dma-buf/sync_file.c
> > +++ b/drivers/dma-buf/sync_file.c
> > @@ -211,8 +211,8 @@ static struct sync_file *sync_file_merge(const char=
 *name, struct sync_file *a,
> >                                        struct sync_file *b)
> >   {
> >       struct sync_file *sync_file;
> > -     struct dma_fence **fences, **nfences, **a_fences, **b_fences;
> > -     int i, i_a, i_b, num_fences, a_num_fences, b_num_fences;
> > +     struct dma_fence **fences =3D NULL, **nfences, **a_fences, **b_fe=
nces;
> > +     int i =3D 0, i_a, i_b, num_fences, a_num_fences, b_num_fences;
> >
> >       sync_file =3D sync_file_alloc();
> >       if (!sync_file)
> > @@ -236,7 +236,7 @@ static struct sync_file *sync_file_merge(const char=
 *name, struct sync_file *a,
> >        * If a sync_file can only be created with sync_file_merge
> >        * and sync_file_create, this is a reasonable assumption.
> >        */
> > -     for (i =3D i_a =3D i_b =3D 0; i_a < a_num_fences && i_b < b_num_f=
ences; ) {
> > +     for (i_a =3D i_b =3D 0; i_a < a_num_fences && i_b < b_num_fences;=
 ) {
> >               struct dma_fence *pt_a =3D a_fences[i_a];
> >               struct dma_fence *pt_b =3D b_fences[i_b];
> >
> > @@ -277,15 +277,16 @@ static struct sync_file *sync_file_merge(const ch=
ar *name, struct sync_file *a,
> >               fences =3D nfences;
> >       }
> >
> > -     if (sync_file_set_fence(sync_file, fences, i) < 0) {
> > -             kfree(fences);
> > +     if (sync_file_set_fence(sync_file, fences, i) < 0)
> >               goto err;
> > -     }
> >
> >       strlcpy(sync_file->user_name, name, sizeof(sync_file->user_name))=
;
> >       return sync_file;
> >
> >   err:
> > +     while (i)
> > +             dma_fence_put(fences[--i]);
> > +     kfree(fences);
> >       fput(sync_file->file);
> >       return NULL;
> >
>
