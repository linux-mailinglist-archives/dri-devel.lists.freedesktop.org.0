Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDC6AB071B
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 02:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B6E10E22C;
	Fri,  9 May 2025 00:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d82Ra0RR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A67310E22C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 00:37:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 31E515C64F6
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 00:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90EFC4CEEF
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 00:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746751015;
 bh=AZW2tDzqhR6kl8hVLlq0BZl6cQswhNqm0MddJ0YN3ng=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d82Ra0RRPZlMLzz0ss/tBvTAYmFxJD0ChokPsZfJOiNM+ojJNLwsR8wM/1VhwsLq1
 hWvpGEy3n+P4W9hZSYsm1QXG6ieY3sQPXgAojh4+OA4tBqhCMHrWp2V2O+i1SvD1v9
 TORNVpQCOjR8fYBkBc2YczQD/e8osCpbLqpRzjk3ATc+aLbI/CnY2is6cqNS/ZraAl
 vErPLTt8mzEtW0MNyS7fVH8GCPabkgzgpZWGsBN4rWW6iRkaPHu54V4dA/C33hk9NS
 z0ubAI6enWeCj8TecltpgDT/dHj+cM4fUDp21g7/WlGuE6i+xsJ/r+lx7RTzZU3Md4
 saeQNbOy6H8qw==
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6f0ad744811so13527906d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 17:36:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWSNNo3l0ErkexenN7N/+jP6trm/riohzwsoAtjjNlVNG6TRNWQyzN1TvtDB7yeWdCndKV21vXTV58=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyA+4adddB4QPIiEHj8Gdw5lPsb9tY/j3bPjVTpvlCg/t/aqWIT
 2K3XhsjTuwy275iFXHpVRgZLML9YapBAX+EKoHhH3AvTgGY8jatb4fehWUV7kPDLP6UCswIoOyL
 gWKF2sGnkoVHNxan5CWgP2iGbSKA=
X-Google-Smtp-Source: AGHT+IFPnS4XZadcyyUhzgN6HY9nmLMHXqMuymGTqMUKPWKhB4+2wwClTHp7PhLPM/lboFUOmbhs5D2y2hYbLJXGrmc=
X-Received: by 2002:a05:6214:ca3:b0:6e6:6089:4978 with SMTP id
 6a1803df08f44-6f6e47f4988mr18078546d6.24.1746751014954; Thu, 08 May 2025
 17:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250508182025.2961555-1-tjmercier@google.com>
 <20250508182025.2961555-5-tjmercier@google.com>
In-Reply-To: <20250508182025.2961555-5-tjmercier@google.com>
From: Song Liu <song@kernel.org>
Date: Thu, 8 May 2025 17:36:43 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6z90sErDTA97_MN2=QKHc96Ge3HwGD1ZoMYj6Sh7GYVA@mail.gmail.com>
X-Gm-Features: ATxdqUELjq5b0VCoeVXJxxary8GpaKUCoHRUvUHGO6bCwjlnOaKxwpDPyWWKXW4
Message-ID: <CAPhsuW6z90sErDTA97_MN2=QKHc96Ge3HwGD1ZoMYj6Sh7GYVA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 4/5] selftests/bpf: Add test for dmabuf_iter
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
[...]
> diff --git a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c b/tools=
/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> new file mode 100644
> index 000000000000..35745f4ce0f8
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> @@ -0,0 +1,224 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2025 Google */
> +
> +#include <test_progs.h>
> +#include <bpf/libbpf.h>
> +#include <bpf/btf.h>
> +#include "dmabuf_iter.skel.h"
> +
> +#include <fcntl.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/ioctl.h>
> +#include <sys/mman.h>
> +#include <unistd.h>
> +
> +#include <linux/dma-buf.h>
> +#include <linux/dma-heap.h>
> +#include <linux/udmabuf.h>
> +
> +static int memfd, udmabuf;

Global fds are weird. AFAICT, we don't really need them
to be global? If we really need them to be global, please
initialize them to -1, just in case we close(0) by accident.

> +static const char udmabuf_test_buffer_name[DMA_BUF_NAME_LEN] =3D "udmabu=
f_test_buffer_for_iter";
> +static size_t udmabuf_test_buffer_size;
> +static int sysheap_dmabuf;
> +static const char sysheap_test_buffer_name[DMA_BUF_NAME_LEN] =3D "syshea=
p_test_buffer_for_iter";
> +static size_t sysheap_test_buffer_size;
