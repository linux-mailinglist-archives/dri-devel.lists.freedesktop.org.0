Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80105AB1CA8
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 20:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33E110EABE;
	Fri,  9 May 2025 18:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gFPghcQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EA810EABE
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 18:50:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D041D4A98E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 18:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89850C4CEF5
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 18:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746816612;
 bh=Nw2icyS2gV5tHa1D9rYpJZ+wGXpk3ib7WkwKezocKec=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gFPghcQ+g6Ow9fN25q0c90JbQo/nGkzH0y81T4XLX5PFSG16F/6zq6b+vvU92VHAD
 IulxDi9xgjPdU/ADecB1w0UTu4nKkIl9rc4KuCVMf3O9J4wKzGkKfV2f1LgmP32Fjd
 NVrUcsxXd0PArNhlEZ8CaJf01HIcfiYutctkQ/rjVeKxeyJXrgDbppkfX8iIyTwQ5P
 mgUzWoohx3oNk9tHWdTETFqoI0YQnGcN8GxGZ1PlIMRV/4RGcHyELPXGqtxYf5iQKK
 QX27STt8I7pQlx8PDeNJzWhOI6f+ARYeLTQ/c1MGZXcqbegmwBqO+jOOx7W2XUQSK7
 HC4bpoTekdA4A==
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6f2c45ecaffso25172826d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 11:50:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVRMi5GqT8WSbyR+PMCkD1f9PwaBgkWp67Latoq/EKomQ8RaurKHgxHUFBvbh3noWWsQyiVmoyTBOg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCWvejTqcduQIfycSjIgsstDxoU9x+61muq+HgJ0m0W90ChDlU
 UG0Ck+Kt/NLc3GizKcQUSHvJOPbaifCfFKg0zu21XfS6oeNw8+1L3uLdPH1ZqR6tu3q2AZ5HnfS
 QEGb1LQ+6vlFwk0fuBSp1SC4+hSk=
X-Google-Smtp-Source: AGHT+IGViwOqDoSNMIOEXeB3GdIvGbjcaeo4byd7FglN0JuWKHxLNlzbt1DVCaT9CHq9HWOw/2go8UY9Rkg8LznMS0k=
X-Received: by 2002:a05:6214:c48:b0:6f4:b8eb:4815 with SMTP id
 6a1803df08f44-6f6e470e2b8mr69583436d6.0.1746816611621; Fri, 09 May 2025
 11:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250508182025.2961555-1-tjmercier@google.com>
 <20250508182025.2961555-5-tjmercier@google.com>
In-Reply-To: <20250508182025.2961555-5-tjmercier@google.com>
From: Song Liu <song@kernel.org>
Date: Fri, 9 May 2025 11:50:00 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7vkmr_SMgzOwhgVCW4GOzJR3thuCQhZFOT5_17jy74_Q@mail.gmail.com>
X-Gm-Features: ATxdqUHqE3dBs_GqqtsEkebsXlPIJjQ8mIfly-oCmcZbVTRJUoQ4p6wXYOBC9U4
Message-ID: <CAPhsuW7vkmr_SMgzOwhgVCW4GOzJR3thuCQhZFOT5_17jy74_Q@mail.gmail.com>
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

> +
> +void test_dmabuf_iter(void)
> +{
> +       struct dmabuf_iter *skel =3D NULL;
> +       char buf[256];
> +       int iter_fd;
> +
> +       skel =3D dmabuf_iter__open_and_load();
> +       if (!ASSERT_OK_PTR(skel, "dmabuf_iter__open_and_load"))
> +               return;
> +
> +       if (!ASSERT_OK(create_test_buffers(), "create_buffers"))
> +               goto destroy;
> +
> +       if (!ASSERT_OK(dmabuf_iter__attach(skel), "skel_attach"))
> +               goto destroy;

From here...

> +       iter_fd =3D bpf_iter_create(bpf_link__fd(skel->links.dmabuf_colle=
ctor));
> +       if (!ASSERT_OK_FD(iter_fd, "iter_create"))
> +               goto destroy;
> +
> +       while (read(iter_fd, buf, sizeof(buf)) > 0)
> +               ; /* Read out all contents */
> +
> +       /* Next reads should return 0 */
> +       ASSERT_EQ(read(iter_fd, buf, sizeof(buf)), 0, "read");

to here, can be a separate subtest. Then iter_fd can be moved to
that subtest.

> +
> +       if (test__start_subtest("default_iter"))
> +               subtest_dmabuf_iter_check_default_iter(skel);
> +
> +       close(iter_fd);
> +
> +destroy:
> +       destroy_test_buffers();
> +       dmabuf_iter__destroy(skel);
[...]
