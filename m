Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2C6A955AC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 20:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EF310E070;
	Mon, 21 Apr 2025 18:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n6UijCgv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480CD10E070
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 18:08:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AEA02A4BD59
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 18:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 417ABC4CEEF
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 18:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745258919;
 bh=kRWrlb0mKyUZMo8srF3rlmgcGTHlQmWQxSRM06U+wQ0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=n6UijCgvxoJtFfgTZBpSf48XgQboXMhdjNVf6pYlJX1GtADV9DpQ9f1hznZkqYrrw
 1BauHfQg3wfVy4tTOmcdULSzMEVcGydjKO7TTk/wfll41W874jZHWo1qASKn6I3w7m
 FKhWNVnQAQlKqff1FpWm3WOFDGjNP5+2yLa5XwykZ69zPunm8x4XHsKNjTkrms+K5z
 3vFapMnrD0DaLjDNwcxRB/t6kddeFJ7N16W95PgKbDgxpIRRYwGmM7LWDy721pV8Pg
 pbU9zEzUpQ7QNr/1fdS/95iMlIENPqgOHyItuKyGvjUnqZYVo1gBBLPeQNUg7TPn4C
 BLPv1zoiVa4hw==
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-47663aeff1bso40045371cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 11:08:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWAVelDmKHfx31uhY7ct76ZQmeXJEXLC3+YWHWjzH2ahK7BTJHbFLdn3YvF8B9nEp4rSqK2KrDJePA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAXFCP93GmoYAN/S0mycYrFKZ1iu5qaXhLBg2IZMAnmidHYytl
 Gg+wcPI3ZJX4D+XMdvbV+ppVL7LHnWOq6OzEIx2/s063DpVIE07juMooVA3WmoCaa52+e7SyLqG
 ApGd1hmS++cwf3/3ZUoSM16c1kQ4=
X-Google-Smtp-Source: AGHT+IHSrc2CEBuxQPRpCef6j5/wkytt/fvZedSLRju/Pks+fUjlY2m5g0TBoT3Lke+DVJshf0H3c72fDPl4JG6PfiQ=
X-Received: by 2002:ac8:7c43:0:b0:476:980c:10a9 with SMTP id
 d75a77b69052e-47aec3b688dmr197971051cf.21.1745258918422; Mon, 21 Apr 2025
 11:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
 <20250414225227.3642618-4-tjmercier@google.com>
In-Reply-To: <20250414225227.3642618-4-tjmercier@google.com>
From: Song Liu <song@kernel.org>
Date: Mon, 21 Apr 2025 11:08:27 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4t5eSCOQdzJGygG0PjFkyivyAgtCXJFwz_t=dL+ESPRw@mail.gmail.com>
X-Gm-Features: ATxdqUEgx0TATMQNydsQQJj1hjlrb84kRMUxA6FmuYAutj-tT-CNjIE_x5AhOEE
Message-ID: <CAPhsuW4t5eSCOQdzJGygG0PjFkyivyAgtCXJFwz_t=dL+ESPRw@mail.gmail.com>
Subject: Re: [PATCH 3/4] selftests/bpf: Add test for dmabuf_iter
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
> This test creates a udmabuf and uses a BPF program that prints dmabuf
> metadata with the new dmabuf_iter to verify it can be found.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---
[...]
> +
> +
> +static void subtest_dmabuf_iter_check_udmabuf(struct dmabuf_iter *skel)
> +{
> +       static const char test_buffer_name[] =3D "udmabuf_test_buffer_for=
_iter";
> +       const size_t test_buffer_size =3D 10 * getpagesize();
> +
> +       ASSERT_LE(sizeof(test_buffer_name), DMA_BUF_NAME_LEN, "NAMETOOLON=
G");
> +
> +       int memfd =3D memfd_create("memfd_test", MFD_ALLOW_SEALING);
> +       ASSERT_OK_FD(memfd, "memfd_create");

Please do not mix variable declaration with the rest of the code. Also,
please run checkpatch.pl on the patches. I see a few warnings.

> +
> +       ASSERT_OK(ftruncate(memfd, test_buffer_size), "ftruncate");
> +
> +       ASSERT_OK(fcntl(memfd, F_ADD_SEALS, F_SEAL_SHRINK), "seal");
> +
> +       int dev_udmabuf =3D open("/dev/udmabuf", O_RDONLY);
> +       ASSERT_OK_FD(dev_udmabuf, "open udmabuf");
> +
[...]
> +
> +       ASSERT_TRUE(found_test_udmabuf, "found_test_buffer");
> +
> +       free(line);
> +       fclose(iter_file);
> +       close(iter_fd);
> +       close(udmabuf);
> +       close(memfd);
> +}
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
> +       if (!ASSERT_OK(dmabuf_iter__attach(skel), "skel_attach"))
> +               goto destroy;
> +
> +       iter_fd =3D bpf_iter_create(bpf_link__fd(skel->links.dmabuf_colle=
ctor));
> +       if (!ASSERT_GE(iter_fd, 0, "iter_create"))

Use ASSERT_OK_FD here?

> +               goto destroy;
> +
> +       memset(buf, 0, sizeof(buf));
> +       while (read(iter_fd, buf, sizeof(buf) > 0)) {
> +               /* Read out all contents */
> +       }
> +

[...]
