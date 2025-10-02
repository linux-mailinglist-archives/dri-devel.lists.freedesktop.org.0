Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 313B7BB50AF
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 21:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46AE10E388;
	Thu,  2 Oct 2025 19:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="R71dx/M2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D5910E388
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 19:45:55 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b3be330b1f5so273617066b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 12:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759434354; x=1760039154;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R4gQv0EOz4rGm7+DH/Ll/ylPaIILm6U8HqWQMm5vF7w=;
 b=R71dx/M2xocUoLvTgIL8yE6sIZ+qLuyri3hDaP/+8DtCNnviIfjW0thzRD7LrEc9Do
 busuUTNRn4NlogeklXYHErPQkzpRsky+yGibWf3Q5Q/lWkLuLH4gjiYEpNJ91cIHChaq
 mdQBeBsFPRz8GwSWU44tft++gbGgjNM5ukNIcambHYbu3d3P/yNwcUlLzhJbBH8SRGVw
 aOUAZVeXT++SlX6TMeYgDgAV2L+IjSYWaOc0yUu/vlgFNwHNTEUSoHJJb5d93/Bkr7CC
 qh7yyhVu7mot7lE6y4wtMntVmkQ499ovQdoxuQ06AhC7nstZL82R5ac1CN1uznVEmC1a
 1oUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759434354; x=1760039154;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R4gQv0EOz4rGm7+DH/Ll/ylPaIILm6U8HqWQMm5vF7w=;
 b=FuUQ1NUwKAQdhlMG2U3r/9XeVjBuOgulZNndi4t7YudzHbVUktemWaLZOB59JC/XFX
 cXtb0/MEcp8lL23xtnoVgxlcMWKsKzZQSCj6y9oEfaU/TdCepwNWwNftDOXqAa6+GtLJ
 ACLp4DJ8eDWrHlsv4wwdxJm3ogfQpP7YvqNwqmMTvnD7oT1VgH0+MonME1lLKQqa/i1u
 +AWbmYUpUZBustyITbxMO5pQsJKxMdtFECZMsG8O4PebYNrOu5gHUHzv+EkY+3ExHq2/
 t/qj405EvLrLT8LVsESfXJeAMKWxq2aUkXqOA27UT+n3gaTiVKclTDSlgH3Kt8ZxIjbD
 vp3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwS0WJCd6jUsoSGP6z1TTS6fNVMyJhWU7C91IM4t26y6IR93WNp0tZXJeXUGoL3P7WHrzknh3jkwM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+Js75yJl4ZpthxSFTPSJOcIYlQVrcZjt9CBEgA9VdXQGsQ2Il
 OSQK+ga1wJR5LPxW+jlr2CvCZ6xf40eaHkSBwDX4Aw09U2Moct4mOaT56zbOGkBNU+Ojwle82Gy
 8FMHYSymS/KHMcwETXoj6MP67PzDOK8h1Ehq3T5s=
X-Gm-Gg: ASbGncuN7Bdy3v9aHFRNCf7MarW02UK/qrLuxGDEQ3/JcgDJKdWILZDlx6AV+bGjdJm
 leX/uDR6aAO+eYRulp7T/T9RhYXPKIABJD5wFTVlccP5wnKO+haPCFAh35BkW0LWoyYWgJ14LIe
 YkdECUTjXwLvskAXNvWpeGD4ArmRH8qYcD8wWEeRenn8F+po5x4ESWlHWFcZy6Ri6BOPd8JaP79
 VZC1RYjCPz+D5peGhpFMHfSvLCI8jaMHCMWGMbK5l3B0FsZxIntTUxuuPDGRbi7l3E=
X-Google-Smtp-Source: AGHT+IHFUMZbxy2/RNA58+rbmrFxgard/FJeBDueJyRahdE9BuRrcf+Nu3HssY90NgcmF3JiiWGdZyfE5Xm8slA6aeE=
X-Received: by 2002:a17:906:dc94:b0:b3b:eb5f:9f1a with SMTP id
 a640c23a62f3a-b49c3933030mr76697066b.38.1759434353566; Thu, 02 Oct 2025
 12:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
 <20250911135007.1275833-3-jens.wiklander@linaro.org>
 <20251002-shaggy-mastiff-of-elevation-c8e1f0@houat>
In-Reply-To: <20251002-shaggy-mastiff-of-elevation-c8e1f0@houat>
From: John Stultz <jstultz@google.com>
Date: Thu, 2 Oct 2025 12:45:41 -0700
X-Gm-Features: AS18NWBdha9LdZ51VIWM4Jj3n7QLoIkRAEzrxrFPUOsILr8-gV57tRYN27CBzqA
Message-ID: <CANDhNCqS+WKhTWjeC7yBL+x4erK4S4bievTxdneaCu1haA8=hA@mail.gmail.com>
Subject: Re: [PATCH v12 2/9] dma-buf: dma-heap: export declared functions
To: Maxime Ripard <mripard@redhat.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
 linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, 
 Sumit Garg <sumit.garg@oss.qualcomm.com>
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

On Thu, Oct 2, 2025 at 12:47=E2=80=AFAM Maxime Ripard <mripard@redhat.com> =
wrote:
> On Thu, Sep 11, 2025 at 03:49:43PM +0200, Jens Wiklander wrote:
> > Export the dma-buf heap functions to allow them to be used by the OP-TE=
E
> > driver. The OP-TEE driver wants to register and manage specific secure
> > DMA heaps with it.
> >
> > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> > Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/dma-buf/dma-heap.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 3cbe87d4a464..8ab49924f8b7 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/dma-buf.h>
> >  #include <linux/dma-heap.h>
> >  #include <linux/err.h>
> > +#include <linux/export.h>
> >  #include <linux/list.h>
> >  #include <linux/nospec.h>
> >  #include <linux/syscalls.h>
> > @@ -202,6 +203,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> >  {
> >       return heap->priv;
> >  }
> > +EXPORT_SYMBOL_NS_GPL(dma_heap_get_drvdata, "DMA_BUF_HEAP");
> >
> >  /**
> >   * dma_heap_get_name - get heap name
> > @@ -214,6 +216,7 @@ const char *dma_heap_get_name(struct dma_heap *heap=
)
> >  {
> >       return heap->name;
> >  }
> > +EXPORT_SYMBOL_NS_GPL(dma_heap_get_name, "DMA_BUF_HEAP");
> >
> >  /**
> >   * dma_heap_add - adds a heap to dmabuf heaps
> > @@ -303,6 +306,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >       kfree(heap);
> >       return err_ret;
> >  }
> > +EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");
>
> It's not clear to me why we would need to export those symbols.
>
> As far as I know, heaps cannot be removed, and compiling them as module
> means that we would be able to remove them.
>
> Now, if we don't expect the users to be compiled as modules, then we
> don't need to export these symbols at all.
>
> Am I missing something?

For things like distro kernels (or in Android's case, the GKI),
there's a benefit for modules that can be loaded permanently (not
having a module_exit hook).
One doesn't have to bloat the base kernel image/memory usage for
everyone, while still not having to necessarily deal with
complications from module unloading issues.

thanks
-john
