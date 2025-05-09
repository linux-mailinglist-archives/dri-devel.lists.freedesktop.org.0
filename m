Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D793AB1C96
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 20:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848CF10EAB7;
	Fri,  9 May 2025 18:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q7oxhMVB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD98D10EAC3
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 18:46:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5BF494A988
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 18:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25757C4AF0D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 18:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746816410;
 bh=F/srgboolEoNxf0xX1d6ZqQ2GWgFKW9K2bjlRHJGoYE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q7oxhMVBiWbVUZReFjjltopRsrRmnIRmtM9f5C64yLOfNPa5ej2/yyNi4OXLzH0UR
 5YlcwF8GqVyGsoFU3PBADdbqNnwI0x7j19myjhiW5kLL61jm40em37MDBhr4jRFYOn
 W3vcNmhn9zOr2YRFiKsmxswHlUffMGb0nAEtWv09tMkt0a6uHgKfGJfzrL5rBumfHU
 L8RQYZI3AWSdzdPei7ElUTSeaCQ9gNpWpft1lm3us1JlvSC77an4cPKc2dhi6RMBAO
 Dz68Ti/fuSbLfLG0RfPsAWreRML5LQXVsB+J9XFgXKzNvCHWliXI+/enMGGIQGb/3t
 XHC/9ltW3jKJw==
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6f54e4f2989so39636576d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 11:46:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUf1K2CIbOP82c5CSdB0YmwlfeM/LkIK4v1aa6W+jSOjtSHYzc/dyShiCD8liTpAGB6XEIRDVQRrz8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDAnZ80KCzQNkYnkH161cylugtHLTXW7zae9bHZhv46TFCd4Hj
 5nEF202wru64INLM9TUcFwlQpkjIU4C19nOtE3pt7HHO82yC0XOm6bQNwfbtbP4vLnx2CLGhaUr
 +KwZK1Z4aPwlAeA6KlRxVcpMRzNA=
X-Google-Smtp-Source: AGHT+IHzegnveWO7yNyyJPV9oHHJDYKhi+KVMw2HxLK2dVU9AjengIKx1B1T4go18EbwEKwlkm3pkByd5qNjbxz1TBA=
X-Received: by 2002:a05:6214:528f:b0:6e8:9021:9090 with SMTP id
 6a1803df08f44-6f6e47fb43dmr64135446d6.26.1746816409199; Fri, 09 May 2025
 11:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250508182025.2961555-1-tjmercier@google.com>
 <20250508182025.2961555-6-tjmercier@google.com>
In-Reply-To: <20250508182025.2961555-6-tjmercier@google.com>
From: Song Liu <song@kernel.org>
Date: Fri, 9 May 2025 11:46:37 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5WOmyfPqBc_Hn7ApGWP_2uz_cJwyaDWF_VwiHJu9s_1A@mail.gmail.com>
X-Gm-Features: ATxdqUGGw_RTmwKfe1Qy3K0z0SH6aVXz07rdhh_MxtVslad1T1IwByDPS78WyqM
Message-ID: <CAPhsuW5WOmyfPqBc_Hn7ApGWP_2uz_cJwyaDWF_VwiHJu9s_1A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 5/5] selftests/bpf: Add test for open coded
 dmabuf_iter
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

On Thu, May 8, 2025 at 11:21=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> Use the same test buffers as the traditional iterator and a new BPF map
> to verify the test buffers can be found with the open coded dmabuf
> iterator.

The way we split 4/5 and 5/5 makes the code tricker to follow. I guess
the motivation is to back port default iter along to older kernels. But I
think we can still make the code cleaner.

>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---
[...]

>
> -static int create_udmabuf(void)
> +static int create_udmabuf(int map_fd)
>  {
>         struct udmabuf_create create;
>         int dev_udmabuf;
> +       bool f =3D false;
>
>         udmabuf_test_buffer_size =3D 10 * getpagesize();
>
> @@ -63,10 +64,10 @@ static int create_udmabuf(void)
>         if (!ASSERT_OK(ioctl(udmabuf, DMA_BUF_SET_NAME_B, udmabuf_test_bu=
ffer_name), "name"))
>                 return 1;
>
> -       return 0;
> +       return bpf_map_update_elem(map_fd, udmabuf_test_buffer_name, &f, =
BPF_ANY);

We don't really need this bpf_map_update_elem() inside
create_udmabuf(), right?

>  }
>
> -static int create_sys_heap_dmabuf(void)
> +static int create_sys_heap_dmabuf(int map_fd)
>  {
>         sysheap_test_buffer_size =3D 20 * getpagesize();
>
> @@ -77,6 +78,7 @@ static int create_sys_heap_dmabuf(void)
>                 .heap_flags =3D 0,
>         };
>         int heap_fd, ret;
> +       bool f =3D false;
>
>         if (!ASSERT_LE(sizeof(sysheap_test_buffer_name), DMA_BUF_NAME_LEN=
, "NAMETOOLONG"))
>                 return 1;
> @@ -95,18 +97,18 @@ static int create_sys_heap_dmabuf(void)
>         if (!ASSERT_OK(ioctl(sysheap_dmabuf, DMA_BUF_SET_NAME_B, sysheap_=
test_buffer_name), "name"))
>                 return 1;
>
> -       return 0;
> +       return bpf_map_update_elem(map_fd, sysheap_test_buffer_name, &f, =
BPF_ANY);

Same for this bpf_map_update_elem(), we can call this directly from
create_test_buffers().

>  }
>
> -static int create_test_buffers(void)
> +static int create_test_buffers(int map_fd)
>  {
>         int ret;
>
> -       ret =3D create_udmabuf();
> +       ret =3D create_udmabuf(map_fd);
>         if (ret)
>                 return ret;
>
> -       return create_sys_heap_dmabuf();
> +       return create_sys_heap_dmabuf(map_fd);

Personally, I would prefer we just merge all the logic of
create_udmabuf() and create_sys_heap_dmabuf()
into create_test_buffers().

>  }
>
[...]
> +
>  void test_dmabuf_iter(void)
>  {
>         struct dmabuf_iter *skel =3D NULL;
> +       int iter_fd, map_fd;
>         char buf[256];
> -       int iter_fd;
>
>         skel =3D dmabuf_iter__open_and_load();
>         if (!ASSERT_OK_PTR(skel, "dmabuf_iter__open_and_load"))
>                 return;
>
> -       if (!ASSERT_OK(create_test_buffers(), "create_buffers"))
> +       map_fd =3D bpf_map__fd(skel->maps.testbuf_hash);
> +       if (!ASSERT_OK_FD(map_fd, "map_fd"))
> +               goto destroy_skel;
> +
> +       if (!ASSERT_OK(create_test_buffers(map_fd), "create_buffers"))
>                 goto destroy;
>
>         if (!ASSERT_OK(dmabuf_iter__attach(skel), "skel_attach"))
> @@ -215,10 +246,13 @@ void test_dmabuf_iter(void)
>
>         if (test__start_subtest("default_iter"))
>                 subtest_dmabuf_iter_check_default_iter(skel);
> +       if (test__start_subtest("open_coded"))
> +               subtest_dmabuf_iter_check_open_coded(skel, map_fd);
>
>         close(iter_fd);
>
>  destroy:
>         destroy_test_buffers();
> +destroy_skel:
>         dmabuf_iter__destroy(skel);
>  }
[...]
