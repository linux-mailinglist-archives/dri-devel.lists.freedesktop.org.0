Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BE4A95592
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 19:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED8010E288;
	Mon, 21 Apr 2025 17:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fQOe5UJB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464E210E288
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 17:58:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3A5BE61154
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 17:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEFABC4AF0C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 17:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745258325;
 bh=iKIM2wKqUtlQpc6gV5GRUWYsCL1lGfAXIG3wkd4PEmE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fQOe5UJBrN84MHjBsV4gZyvpFqNidQ0PK7bygae3TpkuylyQXD4DWemS+wperSZGW
 T763QBAhUMxnT9fMd5JS72o/dAWEd+DmceHwOJOULQ0foD8B8WjYikr6XNoo4EAqoG
 uy/96sik7tEzG68I1QTqGVtOGsvs4UQGwMWbzhHvGCINbEHsGgFGCtKuoh+A9j3B+M
 nGYCvHXr/SD1QOcziiDVcesttQspk5JWZlzP4YVzTm4V/ZeGw0lWjU8ACPX6ilnuDT
 OAdyNjNoc/BV47bbfPOLzAxbLGosAjjlVooB7iHZRwuFCXDcUmy045B2lRHnb1vc6p
 3EuE6WYexzGuw==
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-47690a4ec97so45468471cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 10:58:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUjqDsAdOueiuToobQCfo03ONrBBF8baCsOBtOl0/KUmitxmrdIkcCv8VuGpJPdMfMfIddFJHdR9Cg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywe6RF6lJCO/2MFb/yHfVy9IoDceMCo5pxzWG7vG9SchQG2XO7r
 7Ysa3/iCOoIQUvJhXdmDRfn5VDKplXKEDHUqUVPVrU9clhx7uxLuatGmcfiPGGh9aPQZVvBNwjT
 xGxDuaPn1774OXda5YIKFuPaa2nw=
X-Google-Smtp-Source: AGHT+IE8HckTVa/ODHOBBiUx6mnBjmKzUKUF5RXS/PyOXaTpOyGidFR0Ah5YtlEwxLCsr1VDuIEeUXoMGTa7dTtikss=
X-Received: by 2002:ac8:5fc6:0:b0:479:be67:3bd2 with SMTP id
 d75a77b69052e-47aec3cb8f4mr213100921cf.23.1745258324932; Mon, 21 Apr 2025
 10:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
 <20250414225227.3642618-3-tjmercier@google.com>
In-Reply-To: <20250414225227.3642618-3-tjmercier@google.com>
From: Song Liu <song@kernel.org>
Date: Mon, 21 Apr 2025 10:58:33 -0700
X-Gmail-Original-Message-ID: <CAPhsuW54g5YCmLVX=cc3m2nfQTZrMH+6ZMBgouEMMfqcccOtww@mail.gmail.com>
X-Gm-Features: ATxdqUHDDdbJSbksFn4UCdL4tiOhDhDWdHN22eHXld_HEyeHr-qDylZwsTxwC7Y
Message-ID: <CAPhsuW54g5YCmLVX=cc3m2nfQTZrMH+6ZMBgouEMMfqcccOtww@mail.gmail.com>
Subject: Re: [PATCH 2/4] bpf: Add dmabuf iterator
To: "T.J. Mercier" <tjmercier@google.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
 skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
 simona@ffwll.ch, corbet@lwn.net, eddyz87@gmail.com, yonghong.song@linux.dev, 
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
 jolsa@kernel.org, mykolal@fb.com
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

On Mon, Apr 14, 2025 at 3:53=E2=80=AFPM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> The dmabuf iterator traverses the list of all DMA buffers. The list is
> maintained only when CONFIG_DEBUG_FS is enabled.
>
> DMA buffers are refcounted through their associated struct file. A
> reference is taken on each buffer as the list is iterated to ensure each
> buffer persists for the duration of the bpf program execution without
> holding the list mutex.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---
>  include/linux/btf_ids.h  |   1 +
>  kernel/bpf/Makefile      |   3 +
>  kernel/bpf/dmabuf_iter.c | 130 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 134 insertions(+)
>  create mode 100644 kernel/bpf/dmabuf_iter.c
>
> diff --git a/include/linux/btf_ids.h b/include/linux/btf_ids.h
> index 139bdececdcf..899ead57d89d 100644
> --- a/include/linux/btf_ids.h
> +++ b/include/linux/btf_ids.h
> @@ -284,5 +284,6 @@ extern u32 bpf_cgroup_btf_id[];
>  extern u32 bpf_local_storage_map_btf_id[];
>  extern u32 btf_bpf_map_id[];
>  extern u32 bpf_kmem_cache_btf_id[];
> +extern u32 bpf_dmabuf_btf_id[];

This is not necessary. See below.

>
>  #endif
> diff --git a/kernel/bpf/Makefile b/kernel/bpf/Makefile
> index 70502f038b92..5b30d37ef055 100644
> --- a/kernel/bpf/Makefile
> +++ b/kernel/bpf/Makefile
> @@ -53,6 +53,9 @@ obj-$(CONFIG_BPF_SYSCALL) +=3D relo_core.o
>  obj-$(CONFIG_BPF_SYSCALL) +=3D btf_iter.o
>  obj-$(CONFIG_BPF_SYSCALL) +=3D btf_relocate.o
>  obj-$(CONFIG_BPF_SYSCALL) +=3D kmem_cache_iter.o
> +ifeq ($(CONFIG_DEBUG_FS),y)
> +obj-$(CONFIG_BPF_SYSCALL) +=3D dmabuf_iter.o
> +endif
>
>  CFLAGS_REMOVE_percpu_freelist.o =3D $(CC_FLAGS_FTRACE)
>  CFLAGS_REMOVE_bpf_lru_list.o =3D $(CC_FLAGS_FTRACE)
> diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
> new file mode 100644
> index 000000000000..b4b8be1d6aa4
> --- /dev/null
> +++ b/kernel/bpf/dmabuf_iter.c

Maybe we should add this file to drivers/dma-buf. I would like to
hear other folks thoughts on this.

> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2025 Google LLC */
> +#include <linux/bpf.h>
> +#include <linux/btf_ids.h>
> +#include <linux/dma-buf.h>
> +#include <linux/kernel.h>
> +#include <linux/seq_file.h>
> +
> +BTF_ID_LIST_GLOBAL_SINGLE(bpf_dmabuf_btf_id, struct, dma_buf)

Use BTF_ID_LIST_SINGLE(), then we don't need this in btf_ids.h

> +DEFINE_BPF_ITER_FUNC(dmabuf, struct bpf_iter_meta *meta, struct dma_buf =
*dmabuf)
> +
> +static void *dmabuf_iter_seq_start(struct seq_file *seq, loff_t *pos)
> +{
> +       struct dma_buf *dmabuf, *ret =3D NULL;
> +
> +       if (*pos) {
> +               *pos =3D 0;
> +               return NULL;
> +       }
> +       /* Look for the first buffer we can obtain a reference to.
> +        * The list mutex does not protect a dmabuf's refcount, so it can=
 be
> +        * zeroed while we are iterating. Therefore we cannot call get_dm=
a_buf()
> +        * since the caller of this program may not already own a referen=
ce to
> +        * the buffer.
> +        */

We should use kernel comment style for new code. IOW,
/*
 * Look for ...
 */


Thanks,
Song

[...]
