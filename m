Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 451D8AB0706
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 02:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BFD10E226;
	Fri,  9 May 2025 00:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iIzIvUJw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452D210E226
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 00:27:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9055FA4E2AD
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 00:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C59FC4CEF0
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 00:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746750470;
 bh=EofVU9RaJO8fFSn090qY+nSJVNAGtpdF7uvKRTJZyCs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iIzIvUJwP5AMW2em5ZJsd52tw11N98vBKEYEDrLaBkj23sKr3I+MrpV7tDox2rHuw
 UBXJGjlXh5bwdY+FCnjTYV03Fth9rGsuRQZWecWJGLc07olIm0NnH37N56oARbKjDO
 vcye/to9Ue9TtPjoKWM9ul8xczvD7j4cDoZ89XhVpCvhKhaj6DLl6TWTPq0GLXjBdR
 WPHkHhwmcNZ3SAS9dRDEzgUehWm7CnBJWIT5pGMA1ON7Q7H+AH2ukMCCig3ZSSBIUj
 r7Tmy5EFJXr1gbILGVn81rw0svUglpjf2N8JsRRFVtsWEcxxJ9bPabf6N4DYN6yluM
 Gk71TN4L2NvCg==
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6f5496972d3so15305276d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 17:27:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXMfWQNvka00hRnqHh2zKnzimvuJXtt+FrlNnDmgLCC0FzLbsLqRPj3uptgH1kpU1kYNb2tZU2d/80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAv+5pG5OCmkVGBdmRg8XAyvkG+utRDJAU86v3pIvMwuj1RqLN
 CdkfKtl2pD/kHOm2ZAFz8S/NafAzXTDmdErDw7yLNsWZKmmrEbg6CjPFY5CFrELLhrdujvp+MY8
 LHcDynuUwsbJy2GhNzKcd08l2Qqc=
X-Google-Smtp-Source: AGHT+IGvlO4MI8GcZbzVx7jsPcMoZXRxilbdcz9LupGWaeI1mxIAZKH4cl4q1xWroFyqcUQ97CJgUfidPRz8wpMqFwI=
X-Received: by 2002:a05:6214:1c0e:b0:6e4:407c:fcfc with SMTP id
 6a1803df08f44-6f6e47b9989mr19117996d6.4.1746750469293; Thu, 08 May 2025
 17:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250508182025.2961555-1-tjmercier@google.com>
 <20250508182025.2961555-3-tjmercier@google.com>
In-Reply-To: <20250508182025.2961555-3-tjmercier@google.com>
From: Song Liu <song@kernel.org>
Date: Thu, 8 May 2025 17:27:38 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6cTCEwnbfRNX0KDGGs7M+N3xf+EP9FfS5Y_OHyXqs_Qw@mail.gmail.com>
X-Gm-Features: ATxdqUEzd3jkJFL3dYflNlv-tch_Y5Oz2sEMRRKvmSAFIy8j243R28FNueVT7eQ
Message-ID: <CAPhsuW6cTCEwnbfRNX0KDGGs7M+N3xf+EP9FfS5Y_OHyXqs_Qw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 2/5] bpf: Add dmabuf iterator
To: "T.J. Mercier" <tjmercier@google.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
 skhan@linuxfoundation.org, alexei.starovoitov@gmail.com, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
 simona@ffwll.ch, eddyz87@gmail.com, yonghong.song@linux.dev, 
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
 jolsa@kernel.org, mykolal@fb.com, shuah@kernel.org
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

On Thu, May 8, 2025 at 11:20=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> The dmabuf iterator traverses the list of all DMA buffers.
>
> DMA buffers are refcounted through their associated struct file. A
> reference is taken on each buffer as the list is iterated to ensure each
> buffer persists for the duration of the bpf program execution without
> holding the list mutex.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Acked-by: Song Liu <song@kernel.org>

With one nitpick below.

> ---
[...]
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 8ff4add71f88..7af2ea839f58 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -634,4 +634,6 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys=
_map *map);
>  void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map);
>  int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)=
;
>  void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *m=
ap);
> +struct dma_buf *dma_buf_iter_begin(void);
> +struct dma_buf *dma_buf_iter_next(struct dma_buf *dmbuf);
>  #endif /* __DMA_BUF_H__ */
> diff --git a/kernel/bpf/Makefile b/kernel/bpf/Makefile
> index 70502f038b92..3a335c50e6e3 100644
> --- a/kernel/bpf/Makefile
> +++ b/kernel/bpf/Makefile
> @@ -53,6 +53,9 @@ obj-$(CONFIG_BPF_SYSCALL) +=3D relo_core.o
>  obj-$(CONFIG_BPF_SYSCALL) +=3D btf_iter.o
>  obj-$(CONFIG_BPF_SYSCALL) +=3D btf_relocate.o
>  obj-$(CONFIG_BPF_SYSCALL) +=3D kmem_cache_iter.o
> +ifeq ($(CONFIG_DMA_SHARED_BUFFER),y)
> +obj-$(CONFIG_BPF_SYSCALL) +=3D dmabuf_iter.o
> +endif
>
>  CFLAGS_REMOVE_percpu_freelist.o =3D $(CC_FLAGS_FTRACE)
>  CFLAGS_REMOVE_bpf_lru_list.o =3D $(CC_FLAGS_FTRACE)
> diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
> new file mode 100644
> index 000000000000..96b4ba7f0b2c
> --- /dev/null
> +++ b/kernel/bpf/dmabuf_iter.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2025 Google LLC */
> +#include <linux/bpf.h>
> +#include <linux/btf_ids.h>
> +#include <linux/dma-buf.h>
> +#include <linux/kernel.h>
> +#include <linux/seq_file.h>
> +
> +BTF_ID_LIST_SINGLE(bpf_dmabuf_btf_id, struct, dma_buf)
> +DEFINE_BPF_ITER_FUNC(dmabuf, struct bpf_iter_meta *meta, struct dma_buf =
*dmabuf)

nit: It is better to move these two lines later, to where they
are about to be used.

> +
> +static void *dmabuf_iter_seq_start(struct seq_file *seq, loff_t *pos)
> +{
> +       if (*pos)
> +               return NULL;
> +
> +       return dma_buf_iter_begin();
> +}
> +
[...]
