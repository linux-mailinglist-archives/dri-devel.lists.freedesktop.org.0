Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA978740397
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 20:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD6B10E33E;
	Tue, 27 Jun 2023 18:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9755A10E32B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 18:52:40 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-4007b5bafceso46631cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 11:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1687891959; x=1690483959;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XanXoDlHYuqu7WYlucQ21J3KG2JUv31j1KTL+YaYRcw=;
 b=tPrpWdnP56AC15CdynAtlLaMhZcoMrwTEd/uWTCfR3x6ZSk2aQs18un036H4Ui91Mz
 yipTpkAWSSEw3sBbMhjNPTFYagOc2smOlg8be0RQW47nzZtgo+C5Ptfe55oDSxjaSkX0
 idJ5n7fJQSXQxasfFIWbg2LKCscxSP6nA95ZRZt6P+sFiMDn6Y+k3aHiI3giIk0UJOI+
 RsBiyEWPVmLE1yxdaMJ8gPZHKUeeMrjGJJGfIo73hE1hVi5UIcHUAG/2LgLNnAze8rTB
 /iF1/wOik0/z5RMYKefbcBecyhdwgNOoRGVNJZZZCrdwIR3VXSMUnaseQ55GbmLr05Td
 l7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687891959; x=1690483959;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XanXoDlHYuqu7WYlucQ21J3KG2JUv31j1KTL+YaYRcw=;
 b=Qgu7lQmzNF9e3Nk6R5fTiUkny8gWvJw9bwf0hw89LfgJ4kfJ1Ky3zwAEgllycZlonQ
 OxdaLjxVgoDkE9LVedHEKldfBH3sufLlndFTsWfCDxEeQnTOx01hibnPCMlBUtL17oIW
 3E318UGVXF5BHrG4S9xIVwgBH8pttjZ7JEdvWbscjoelv4SwveateutP75eQbukvi353
 7ZDuRdOMSocIJasHLpmB7hKLiIdNpFuh++H0CvFSTfWpooGhQT8VSjgWifm16T7FFVcx
 PG072CfjqwI7xg65eRpH0ZZMJMxmm6aDJBEZ2ZzQ93+gi9HBoAY6jmwWN1O1ySJuRFHv
 txSQ==
X-Gm-Message-State: AC+VfDyAxT+sHsmmqRHLjS32l5dNZCWWJzP9Qi/7JIO2CXf2+OFiF32T
 u8fVToAJ5YmmZtDH13V+9lKqEOGuqF5kPkHfRa6a
X-Google-Smtp-Source: ACHHUZ5dfRe4sjCsi1avwvjKJ8EPuqVzC75vPw7U/LlRFR2FRvQRAfeRSfejLqd26KQk3zITWlc71jc5mXyGnWmKbCs=
X-Received: by 2002:ac8:5905:0:b0:3f8:5b2:aef0 with SMTP id
 5-20020ac85905000000b003f805b2aef0mr19156qty.24.1687891959197; Tue, 27 Jun
 2023 11:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230627144339.144478-1-Julia.Lawall@inria.fr>
 <20230627144339.144478-7-Julia.Lawall@inria.fr>
In-Reply-To: <20230627144339.144478-7-Julia.Lawall@inria.fr>
From: John Stultz <jstultz@google.com>
Date: Tue, 27 Jun 2023 11:52:27 -0700
Message-ID: <CANDhNCrPHJjDwGLMY_p8Z21bCnBvTzQmztYqRykTBD9t-+mbcQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/24] dma-buf: system_heap: use vmalloc_array and
 vcalloc
To: Julia Lawall <Julia.Lawall@inria.fr>
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, keescook@chromium.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>, linaro-mm-sig@lists.linaro.org,
 christophe.jaillet@wanadoo.fr, dri-devel@lists.freedesktop.org,
 kuba@kernel.org, Laura Abbott <labbott@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 27, 2023 at 7:44=E2=80=AFAM Julia Lawall <Julia.Lawall@inria.fr=
> wrote:
>
> Use vmalloc_array and vcalloc to protect against
> multiplication overflows.
>
> The changes were done using the following Coccinelle
> semantic patch:
>
> // <smpl>
> @initialize:ocaml@
> @@
>
> let rename alloc =3D
>   match alloc with
>     "vmalloc" -> "vmalloc_array"
>   | "vzalloc" -> "vcalloc"
>   | _ -> failwith "unknown"
>
> @@
>     size_t e1,e2;
>     constant C1, C2;
>     expression E1, E2, COUNT, x1, x2, x3;
>     typedef u8;
>     typedef __u8;
>     type t =3D {u8,__u8,char,unsigned char};
>     identifier alloc =3D {vmalloc,vzalloc};
>     fresh identifier realloc =3D script:ocaml(alloc) { rename alloc };
> @@
>
> (
>       alloc(x1*x2*x3)
> |
>       alloc(C1 * C2)
> |
>       alloc((sizeof(t)) * (COUNT), ...)
> |
> -     alloc((e1) * (e2))
> +     realloc(e1, e2)
> |
> -     alloc((e1) * (COUNT))
> +     realloc(COUNT, e1)
> |
> -     alloc((E1) * (E2))
> +     realloc(E1, E2)
> )
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
> v2: Use vmalloc_array and vcalloc instead of array_size.
> This also leaves a multiplication of a constant by a sizeof
> as is.  Two patches are thus dropped from the series.
>
>  drivers/dma-buf/heaps/system_heap.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff -u -p a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/=
system_heap.c
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -221,7 +221,7 @@ static void *system_heap_do_vmap(struct
>  {
>         struct sg_table *table =3D &buffer->sg_table;
>         int npages =3D PAGE_ALIGN(buffer->len) / PAGE_SIZE;
> -       struct page **pages =3D vmalloc(sizeof(struct page *) * npages);
> +       struct page **pages =3D vmalloc_array(npages, sizeof(struct page =
*));
>         struct page **tmp =3D pages;
>         struct sg_page_iter piter;
>         void *vaddr;

Seems reasonable. Thanks for sending this out!

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
