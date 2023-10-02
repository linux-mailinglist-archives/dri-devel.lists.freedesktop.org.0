Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9747B58A9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 19:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077A710E2D2;
	Mon,  2 Oct 2023 17:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29A610E2D2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 17:16:37 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-59bebd5bdadso202857b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 10:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1696266997; x=1696871797;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E7Zhp7fexBV0fC94HK3n7XG2/Cz9uGTnvzo3kRDXo4Y=;
 b=B7VFQXcgSYSPzR6xDG2SOLbs06EyITw31TpxH7FZkxqRfA8M6f88FIey5huZiNtrbA
 VCJbeMnUfId5zYhmJwEsOVEJA7p4YytiuICzCXNZEnqw00g7fnPMSmRdkMGsumlv6tUZ
 qgI+hQkSTaSWanV+FdxICICcnAo+d87mcb4/kZlVB4uFaauciL7JqZYapdk3zqbxTyhI
 jHC64rhTAqaluXO2oLYoKRrLr+Ir29uyXazJmvk8ZSQc6vZ8oRVSSRIghE2boNHnfiTq
 Z3FajFwdDuSam1yndXNaK/QjrpUvmQ2lo0rdV5l8dj4Fb1CnIrhiBth/erpVxAztLLoy
 roMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696266997; x=1696871797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E7Zhp7fexBV0fC94HK3n7XG2/Cz9uGTnvzo3kRDXo4Y=;
 b=G0jFcNZSOM9HCxYuL2aV4FWNkvXPozHlxjgaRmcrJYhKja7Soo0bc6X1DqK43tIt+z
 EObQtEPJrVkGdCC2qnYMcjig0VC7YjSoaEavDn47ri65dRtDNnkds6NfSoZ8RcvR7Vt4
 oFcP7H93gADeJlXpc9totDywb6gZkAannrrh5YdHtfTDGYXlldHgQNQMmMmdXsaLkrEr
 px74v5jk+9fm8fCvoCZItisP6UG6weJWPRarEAOI1320xOT7zUCWxoKMZiXkeMUY2Bbo
 nend90QGYXYOyY0lNwIPeIya7R047LKUZLCoEThWZAkRkpKOppKt0YxvzbyKFPIl5cz1
 pLvQ==
X-Gm-Message-State: AOJu0YxrMV61rS3NM/5txlRKEi6MOl4oW/H0N0ZaZGQCehGsuFXLu8Wa
 CsMvD4IYQwZBW/3X1XbmEa+W1qcxThnb4F04Lt2Dlg==
X-Google-Smtp-Source: AGHT+IGczrijvRMqUeno/TKgH4xvzytFv3IKeSpkULE/VT0+zPJxHRO0kz92Wya/ACW5S+oE2CZNgPh4TUBkGNL8H1o=
X-Received: by 2002:a0d:d44c:0:b0:586:b686:822c with SMTP id
 w73-20020a0dd44c000000b00586b686822cmr13050234ywd.7.1696266996808; Mon, 02
 Oct 2023 10:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <bc145167-0471-4ab3-935c-aa5dc20e342a@moroto.mountain>
In-Reply-To: <bc145167-0471-4ab3-935c-aa5dc20e342a@moroto.mountain>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 2 Oct 2023 10:16:24 -0700
Message-ID: <CABdmKX1PsCcRpsnUgwoS9yMhCXcin1bQt6D+N0b2mHP93cmX-A@mail.gmail.com>
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

On Mon, Oct 2, 2023 at 12:04=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> The buffer->pages[] has "buffer->pagecount" elements so this > comparison
> has to be changed to >=3D to avoid reading beyond the end of the array.
> The buffer->pages[] array is allocated in cma_heap_allocate().
>
> Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the cma=
_heap implementation")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/dma-buf/heaps/cma_heap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index ee899f8e6721..bea7e574f916 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -165,7 +165,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *=
vmf)
>         struct vm_area_struct *vma =3D vmf->vma;
>         struct cma_heap_buffer *buffer =3D vma->vm_private_data;
>
> -       if (vmf->pgoff > buffer->pagecount)
> +       if (vmf->pgoff >=3D buffer->pagecount)
>                 return VM_FAULT_SIGBUS;
>
Hi Dan,

Your fix looks correct to me, but I'm curious if you observed this
problem on a device? The mmap in dma-buf.c looks like it prevents
creating a mapping that is too large, and I think an access beyond the
VMA should segfault before reaching here.

Thanks,
T.J.
