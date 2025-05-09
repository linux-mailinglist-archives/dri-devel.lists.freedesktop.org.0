Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDF4AB1B6F
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 19:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A71F10E297;
	Fri,  9 May 2025 17:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="VY8xMlw3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED47910E297
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 17:14:09 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43d5f10e1aaso2435e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 10:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1746810848; x=1747415648;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=smM82pNC+KSoX+27bEVUeyoSpZ4hnMM+We8D5KWbT6U=;
 b=VY8xMlw3ORF9a6VMnD2RJ+cZ8mWpHi+4+n7FwC1R3alJA28cpBhmy8Z7UkcgDCD0Nz
 ND7qAgGkzNcs/4pqcUh814tx5cn7dV/dQxjJ8cHlSdro+fXCppJYNBsdzYspd+7rH2ou
 awZXjoX22a2gGKRRkNPSFKo2imeb+wqJLmft+wegiuGjE4ayMYLEP0sWUNBC+RsPiPiK
 LX0En5QVYfG4abRgZ8siM5PWf0nc5j3T1YFmS58JMkRnPK1ZM54gITvMiahHEnOWAv3h
 688mCXGQIoj5O4KvMcDun6JQnZ7MeqAcyoJL5iRH38juYi57j7ISYJtkGF1K/trfSxOy
 sfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746810848; x=1747415648;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=smM82pNC+KSoX+27bEVUeyoSpZ4hnMM+We8D5KWbT6U=;
 b=w2g+qtxV/2KP8UpL0cA3YGfMZPnIKn9/oOaB+mtI0uvoDsLPQZ6E1ncVld5nrA/lYb
 NB8QfURGYMtvBE7q0Y7iZaKPUJ9syFRMWivVQHuibLq73vodQE9t1+kSZFNtM2ZpDncX
 seY0ZbfXjWcTMH7EO/ZufWh41uag8T0qbOsCZucxF+9wCGrrCwCisHKvCXN/qoPrv3Y7
 j1rYhhc2JrjV5x9kwDLWKQQ6y8zaytXZwIbVN5IJvq8pnYBiSbqQe/7f86nG5Fet/6qp
 Xj5og8ZdjQXyzKiFqizSwI/xFJxSUUVLJkZec6cpzwEHjXlsnfMt9xK9cLH1QhgIDdhV
 MKTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdnbsJtoWCJyAxa+mEifGXfdHKjbY8jH3aNkcfh5eZQOf6q+SS/gZ0M2C//aa/76VDE9BABZDQk0Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx38OeD7PYRjdnkMy7dKgddw0q3Z1bre7LASLySVZCGNe93f4PY
 rWxzU90tTbKq1MGBhmmbJGnPQkYcUJCAFe9G2KNUK4vg4WHUItkK1hd3itmQKcgOEcPkUsVFFX1
 +RoKLXypRRFuYCVkKWT2oiiXNhic3aVaIMjQ2
X-Gm-Gg: ASbGncsfdEjjX6Yjiu1z19fMKjhsdfkpgMBLS8UbtT5cNa1JXA6nHJL/HSQbkZIw1SP
 cdy7SC5lDsE0EZ9yuFVobHZRTMP1KBMMh8JRqmNfqzr6k8rljVgX6an7/RD/1Ux02PZy55cr7o5
 w/T1cXbfdSA6T/9DgOsVxf
X-Google-Smtp-Source: AGHT+IH40mARNMU/tf7BP0uCdyGA5liGBuBykAAd7c4WUrmrx1q7itlR5BUHqvu/mY8+HZhP0nMjqB2T+rpZhsONAQE=
X-Received: by 2002:a05:600c:1ca1:b0:439:8d84:32ff with SMTP id
 5b1f17b1804b1-442d7c36971mr1213425e9.3.1746810848319; Fri, 09 May 2025
 10:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250508182025.2961555-1-tjmercier@google.com>
 <20250508182025.2961555-5-tjmercier@google.com>
 <CAPhsuW6z90sErDTA97_MN2=QKHc96Ge3HwGD1ZoMYj6Sh7GYVA@mail.gmail.com>
In-Reply-To: <CAPhsuW6z90sErDTA97_MN2=QKHc96Ge3HwGD1ZoMYj6Sh7GYVA@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 9 May 2025 10:13:56 -0700
X-Gm-Features: AX0GCFu8BoOcyJCPnA7QXYP7Ly2ZIBuYiyNl-jSbUErDvQFnq_Cx4tGRHuAx2Fg
Message-ID: <CABdmKX1A0Ard1yoV9SAV4jZfrD3tvMz2cftcuFPhQgkAKDk58w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 4/5] selftests/bpf: Add test for dmabuf_iter
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

On Thu, May 8, 2025 at 5:36=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Thu, May 8, 2025 at 11:20=E2=80=AFAM T.J. Mercier <tjmercier@google.co=
m> wrote:
> [...]
> > diff --git a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c b/too=
ls/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> > new file mode 100644
> > index 000000000000..35745f4ce0f8
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> > @@ -0,0 +1,224 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Copyright (c) 2025 Google */
> > +
> > +#include <test_progs.h>
> > +#include <bpf/libbpf.h>
> > +#include <bpf/btf.h>
> > +#include "dmabuf_iter.skel.h"
> > +
> > +#include <fcntl.h>
> > +#include <stdbool.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +#include <sys/ioctl.h>
> > +#include <sys/mman.h>
> > +#include <unistd.h>
> > +
> > +#include <linux/dma-buf.h>
> > +#include <linux/dma-heap.h>
> > +#include <linux/udmabuf.h>
> > +
> > +static int memfd, udmabuf;
>
> Global fds are weird. AFAICT, we don't really need them
> to be global? If we really need them to be global, please
> initialize them to -1, just in case we close(0) by accident.

Hmm, no we don't really need them to be global but I didn't really
want to pass all these variables around to all the setup and test
functions. The fd lifetimes are nearly the whole program lifetime
anyways, and just need to exist without actually being used for
anything. I'll add the -1 initialization as you suggest. If udmabuf
creation failed, we would have done a close(0) in
destroy_test_buffers() on the sysheap_dmabuf fd.


> > +static const char udmabuf_test_buffer_name[DMA_BUF_NAME_LEN] =3D "udma=
buf_test_buffer_for_iter";
> > +static size_t udmabuf_test_buffer_size;
> > +static int sysheap_dmabuf;
> > +static const char sysheap_test_buffer_name[DMA_BUF_NAME_LEN] =3D "sysh=
eap_test_buffer_for_iter";
> > +static size_t sysheap_test_buffer_size;
