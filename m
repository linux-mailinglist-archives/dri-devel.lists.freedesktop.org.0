Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D043AB442E
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 20:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7990E10E49B;
	Mon, 12 May 2025 18:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aI81sbtS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B193110E4A7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:58:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0CD0E4AB4B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC37CC4CEF2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747076301;
 bh=DhqQMJeCz7KcqMO9pFZZ9SLZWQgVIgwsMsQ5GbkfyLE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aI81sbtSYxp4ZUFqKIdL8tPZyBnf7zssH2SFPfSa0SIJFYJz67c0ycT734TIISYJe
 voB4FpdUmvI5jCKlBayoenOgfCh0jSLg/AQtcefz/t1E4haqPDpLhMyrjiLjBNS4GG
 aRepWJ37m/l4ofO8hKelcnK/eCIxAKN7wHLZB5E/Qqzj0qpEQYtOD09jXEQjBgOl88
 wLh1a26PSJGASXkDVEqp7SyG6BKdLBL3s43vQcnlMoxklJgpXywBNgz9D7yWtDO+QI
 9dvvjAQxE9RG1vETmpuf3+icNC0Gk6LEJ9jnJ3/ouoam8Eh/KDqBdrCOfkFAhTExxX
 MiuHB4kIAWDCQ==
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6f548a4ea4dso51041126d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:58:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVlSm43y/1hqy6f0cmqhC0pQ4Lj5poy9ByV6+TIRUFpiw0Q2ZyIUwGTEkwj1B0osdcC72lEP0D988Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzB1mkvK0m9aVVicYYwj/077SJRZ/3v/3WUzS/aHbLXUKFoASX9
 pprzS8MXovQe8NwQUUOzIg1sPRzCPnvcnFWnhiPt7hUUdyvOB5vKrppBQokF/jcL7YKsNxn0hDr
 o1EvsZz7pgHpQV7MmpyaCggWYIgs=
X-Google-Smtp-Source: AGHT+IFyd6yL6raX/sTg46CKX63s6TNC5S7yKKUcNYsUtZqJrEQZJsF0fn7Rhu83nX52qQ9gtfsjefq2LxgweTQn6ss=
X-Received: by 2002:a05:6214:f6d:b0:6e8:fee2:aae6 with SMTP id
 6a1803df08f44-6f6e48151b9mr222853596d6.41.1747076300958; Mon, 12 May 2025
 11:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250512174036.266796-1-tjmercier@google.com>
 <20250512174036.266796-5-tjmercier@google.com>
In-Reply-To: <20250512174036.266796-5-tjmercier@google.com>
From: Song Liu <song@kernel.org>
Date: Mon, 12 May 2025 11:58:09 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6TUogokra2mJQG6jeuZ1_RZPwr4xGbBOUJZBUg9AqW3g@mail.gmail.com>
X-Gm-Features: AX0GCFvByoV9AZSi2Y8neroJoSZ_eSUedTGCmZtmiP0XEcoch5fMWNH94wsBues
Message-ID: <CAPhsuW6TUogokra2mJQG6jeuZ1_RZPwr4xGbBOUJZBUg9AqW3g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 4/5] selftests/bpf: Add test for dmabuf_iter
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

On Mon, May 12, 2025 at 10:41=E2=80=AFAM T.J. Mercier <tjmercier@google.com=
> wrote:
[...]
> +
> +static int udmabuf;

static int udmabuf =3D -1;

> +static const char udmabuf_test_buffer_name[DMA_BUF_NAME_LEN] =3D "udmabu=
f_test_buffer_for_iter";
> +static size_t udmabuf_test_buffer_size;
> +static int sysheap_dmabuf;

static int sysheap_dmabuf =3D -1;

> +static const char sysheap_test_buffer_name[DMA_BUF_NAME_LEN] =3D "syshea=
p_test_buffer_for_iter";
> +static size_t sysheap_test_buffer_size;
> +
> +static int create_udmabuf(void)
> +{
> +       struct udmabuf_create create;

nit: zero initialize create to be future proof.

> +       int dev_udmabuf, memfd, local_udmabuf;
> +
> +       udmabuf_test_buffer_size =3D 10 * getpagesize();

[...]

> +static void subtest_dmabuf_iter_check_default_iter(struct dmabuf_iter *s=
kel)
> +{
> +       bool found_test_sysheap_dmabuf =3D false;
> +       bool found_test_udmabuf =3D false;
> +       struct DmabufInfo bufinfo;
> +       size_t linesize =3D 0;
> +       char *line =3D NULL;
> +       FILE *iter_file;
> +       int iter_fd, f =3D INODE;
> +
> +       iter_fd =3D bpf_iter_create(bpf_link__fd(skel->links.dmabuf_colle=
ctor));
> +       ASSERT_OK_FD(iter_fd, "iter_create");

Should we check ASSERT_OK_FD() and exit early on
failures?

> +
> +       iter_file =3D fdopen(iter_fd, "r");
> +       ASSERT_OK_PTR(iter_file, "fdopen");

Same here.
[...]
> +/*
> + * Fields output by this iterator are delimited by newlines. Convert any
> + * newlines in user-provided printed strings to spaces.
> + */
> +static void sanitize_string(char *src, size_t size)
> +{
> +       for (char *c =3D src; c && (size_t)(c - src) < size; ++c)

Should this be:

  for (char *c =3D src; *c && (size_t)(c - src) < size; ++c)

?

Thanks,
Song

[...]
