Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD88AB7852
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 23:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F28A10E746;
	Wed, 14 May 2025 21:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Y+31NJDo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCDB10E746
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 21:59:10 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43d5f10e1aaso22145e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 14:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747259949; x=1747864749;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N6BjLggY6RYhBduHWEU2r/0qSGTtOcmp2Rv7SfgPX2c=;
 b=Y+31NJDo8BfSKRxT0mvj0SM4VsJfQR/T1i1eRGzulrwLbaHsy96d97kgP5C/lptZWd
 Hi9WRqhR3V9Jo4poNwQa0WgdchkV7X4VE+9FzZl6+IYGRSghpuzNpxH3ZjXK2ONbO0UV
 TYzCFl7CBln4X7Q/Q4cvEVcIMLMwoe7MZnllomXif4Ho9a6dsJd+W6iGm7IcszAuWQpO
 DChdBKddT+jwvv9VVziPPVHhbPTvjgedqDo5fZLC+lBgjeG000srYVvgh10pJ5J8ltqk
 4qDLyS/1lqSlnQLbSNaLIq3DWYJEoCVCO8H06my7XqMbIDujI+oUyQ9ba/rgc+KM+fdW
 R+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747259949; x=1747864749;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N6BjLggY6RYhBduHWEU2r/0qSGTtOcmp2Rv7SfgPX2c=;
 b=GrpbRsVJOpAkeQbZT2bTqU3g3kgduIgwwnzygX97L7eOHkDGTQjpi6VMj4/Cb3fI8b
 55WLGenWlunWtdX/9le7nydw9nntXhx/pweJk9b95Hyn5F68izhDRMstih9h/ZxYycYD
 BUSRsvd8UdHaWrIttJ8jAOpC68dCijntplcqsip1Tx6sUfQkkzgY9ELOgdiBmx3+0l5I
 qq9moGHjilFJn1y2KpkmcdQSVjp+jk5mK2b+QU1m2mWxYoraxxEmujMrXk9qu+K3u4co
 r8qkD8wQfpQ1T2HxRSP/2a+Rg98nA3P3zU+OxNEfae4PIaz2UXXZmLX8B9SeJCEXSpXG
 nD7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD7S2Bur5Tq+gR1217Xq/ZMoJUh42RU37Yl+F5i2JayhSONSFVaDOcQnDEqpMoRviFeV/n2hxZi/I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHRQ+dYbJUiJRfaKkn4lYAOiFJcPnS7kRXSCAl4lCBFPXVd5kb
 orxhXl5JJmyMn3OX/topoC1H5tqouf9ENlDDlfcdpwRke0U7VoMzrcWhuMFR0aFkNw6xgpriGze
 Fz0FcusHKMuKMJoRmGV0pU5b19lluxPuamLAaaTF2
X-Gm-Gg: ASbGncvMdlsYWWFEXGOpTwsOD8P/rxWuutuAXh/gGmBmkDis6B+pwba4FNZ9BTwqbC9
 lVdON/s90TBSInvLenDlrpq4O5NTr5QTUkjqeo6HwlSc2wRCgS0BOweBM9oTL9MIc40OeNYDu3k
 BttKlh7A/L+KyisdgGKOFWTFMhNiezuN2A0PNJOIo8g995XAWXYqCFBMTOr56qg3s=
X-Google-Smtp-Source: AGHT+IF9CkMy8uQHae8tBwjfZQnl2xTDU2FaaHSwjDP6uOoyICX4dbqTYj1/pDGgkaVhdrmo/aPKYQuBWpB4B9m3R6w=
X-Received: by 2002:a05:600c:6095:b0:441:aaa8:312e with SMTP id
 5b1f17b1804b1-442f8b45ad1mr472635e9.6.1747259949004; Wed, 14 May 2025
 14:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250513163601.812317-1-tjmercier@google.com>
 <20250513163601.812317-5-tjmercier@google.com>
 <CAPhsuW4uKxFP=i2KgaKPvezD5sBcVheQRBF1fY5DyYafin_yFQ@mail.gmail.com>
In-Reply-To: <CAPhsuW4uKxFP=i2KgaKPvezD5sBcVheQRBF1fY5DyYafin_yFQ@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 14 May 2025 14:58:57 -0700
X-Gm-Features: AX0GCFvBkYq3GWDHm1043uOPWEQY2osVY6pw6Ua9BcA8wU905Xni8mQWiWzsG7M
Message-ID: <CABdmKX3Q5+bfbBBndSS6mxUhapFGY5zLr9CV-p0+CfNPOzuvGA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v6 4/5] selftests/bpf: Add test for dmabuf_iter
To: Song Liu <song@kernel.org>
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

On Wed, May 14, 2025 at 1:53=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Tue, May 13, 2025 at 9:36=E2=80=AFAM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > This test creates a udmabuf, and a dmabuf from the system dmabuf heap,
> > and uses a BPF program that prints dmabuf metadata with the new
> > dmabuf_iter to verify they can be found.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Acked-by: Song Liu <song@kernel.org>

Thanks.

>
> With one more comment below.
>
> [...]
>
> > diff --git a/tools/testing/selftests/bpf/progs/dmabuf_iter.c b/tools/te=
sting/selftests/bpf/progs/dmabuf_iter.c
> > new file mode 100644
> > index 000000000000..2a1b5397196d
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/progs/dmabuf_iter.c
> > @@ -0,0 +1,53 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Copyright (c) 2025 Google LLC */
> > +#include <vmlinux.h>
> > +#include <bpf/bpf_core_read.h>
> > +#include <bpf/bpf_helpers.h>
> > +
> > +/* From uapi/linux/dma-buf.h */
> > +#define DMA_BUF_NAME_LEN 32
> > +
> > +char _license[] SEC("license") =3D "GPL";
> > +
> > +/*
> > + * Fields output by this iterator are delimited by newlines. Convert a=
ny
> > + * newlines in user-provided printed strings to spaces.
> > + */
> > +static void sanitize_string(char *src, size_t size)
> > +{
> > +       for (char *c =3D src; *c && (size_t)(c - src) < size; ++c)
>
> We should do the size check first, right? IOW:
>
> for (char *c =3D src; (size_t)(c - src) < size && *c; ++c)

Yeah if you call the function with size =3D 0, which is kinda
questionable and not possible with the non-zero array size that is
tied to immutable UAPI. Let's change it like you suggest.


>
> > +               if (*c =3D=3D '\n')
> > +                       *c =3D ' ';
> > +}
> > +
> [...]
