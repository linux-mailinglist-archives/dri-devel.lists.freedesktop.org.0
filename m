Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B0ECA494B
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 17:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3B810E993;
	Thu,  4 Dec 2025 16:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="o67Uu8Jx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63A510E993
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 16:45:13 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4779e2ac121so67285e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 08:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764866712; x=1765471512;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0CyQocRCpW9wkr09JiCgFa32QuaN7pvC+ueWitNv43g=;
 b=o67Uu8JxdUshJ9r80uq81R3DF2VNawpRIMFS1Nlfxw2f8NeZVuRtPVGnP8R/ACAfNE
 z+GihJmQkzaVqZejGs6oeSTDDHkmV1Bkp02iGhjgew4I5yWedIh34rUu1UBi9JsOmxqT
 NzX5w/0kbcx0uSW12SXEjkLLT6DQ/unh0GlDofBSUjH7OqnyqqUIm/WUeGaD29I4p4Be
 kaN1OxMzq52Gw8XiMAswIUjP7rVpVe36IYaKYVJaGvBQ3MjX0LTWDuZM/5IZBk1YPHs1
 h2hhbvhZoIw3AiYPbyfy4S3RiGgOK71FLc8/HKuvSQDD2bViNPvlr6CAfJvsYuMyfA3V
 LQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764866712; x=1765471512;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0CyQocRCpW9wkr09JiCgFa32QuaN7pvC+ueWitNv43g=;
 b=pw3K3KziOHKtEwUqjAEAO5vHOwWyVuJ8e1kpXf96W1DjLY+XV+zirEQdCjnzR6tRQH
 6bDf9369pbHQaPHzaa8lCGHheXaoV0R9KH67WSGSN/t0r9fg62Ri+LQv+sN2PFkNpvlh
 zHVtvBpxRfmk63/TDlcqwzmk+qH9t3VJ0lP8jMlogAe8yK9siwtK8YkMjvAf1iaptrDP
 rAlCCShGN9YSNeouGrVjnO2FXGHucYvheLFFSq7X3L9UP0s4cysxabY2rjyuFf6tKPMc
 SsGcPGMOhMOK7olXvRCdanodle/O7sS83ndVzmwohX50CuTtbzEJuIo7pLB6lCfMG7DJ
 Xwsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrUg2NpAWIsfEsEEkqyGb+M7nE+q/WotTzRVQCfyJnalpcNIcEs/cqAYbKXGjyN6x+x6zDy01GCZo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzQ0zJo/k8J8i09iRpf44jrhvBjAfxM6jNdCsYRd8bvoeHjOSL
 Pa27alSnGuVZTne0/6c/jAyly+d2LH66yN1gpEc0HUO0kMzXXNU/IlQuPdecXg2jLRM4EhSFBg9
 NeN2IvWyk+nWnr4nDfrp0pSj6Nhl7jUVwOI21Gki9
X-Gm-Gg: ASbGncuU/XdQEoquXmU+QggWZMNggmjPxEm6IvRfKgQDM5HsVm4Hc+OnQydjPPzuv+2
 meqpJPE7Xzos3a9xrI9jHunKE4PaFdWhB7wPkE2FNbCiewozgpBoW/i5qziXfRRXRWpyX1g9pEY
 oDNHT9Z4c1yPl2W4QzB4WuHAqFfZ07mx6t9re/Exs3fbn/372adrVYjhhcPCv1L/F+vkwsPRcHa
 0ZbCI6wpTbzfUOsX79SapCMqC20jtnlz4IJDd07hwut+9LOB+PW1T6KDhSXFB9pYwMa7gZW3d3q
 bZ8BF8MBxpvgkc3ZVG/HzNRkGbnB+LgvsX9RyGRNF/wryPQxwEauCmHzh8XKBw==
X-Google-Smtp-Source: AGHT+IE0KMhH3k7qWdeBVVuAP+IUq1UipXwO7m3nwOYJmd54XwgIknZR5FukbGSdeibG3Qv+NPqrhPE4p5p9ITMRKrU=
X-Received: by 2002:a05:600c:581a:b0:477:86fd:fb18 with SMTP id
 5b1f17b1804b1-47932e04338mr205795e9.8.1764866712062; Thu, 04 Dec 2025
 08:45:12 -0800 (PST)
MIME-Version: 1.0
References: <20251204000348.1413593-1-tjmercier@google.com>
 <20251204000348.1413593-2-tjmercier@google.com>
In-Reply-To: <20251204000348.1413593-2-tjmercier@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 4 Dec 2025 08:44:59 -0800
X-Gm-Features: AWmQ_bnxDs0Em9c_P-3hJ2uCc6BRD7h1aEC-DbAd-yhfuFNLkrr8DTNbaj0gPCw
Message-ID: <CABdmKX0LxoPJPA755bzN8vRjUOQ0c4XucGhDX8QgbxqYXdB1pA@mail.gmail.com>
Subject: Re: [PATCH bpf 2/2] selftests/bpf: Add test for truncated dmabuf_iter
 reads
To: yonghong.song@linux.dev, ast@kernel.org, daniel@iogearbox.net, 
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
 haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, bpf@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 android-mm@google.com
Cc: christian.koenig@amd.com, sumit.semwal@linaro.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
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

On Wed, Dec 3, 2025 at 4:05=E2=80=AFPM T.J. Mercier <tjmercier@google.com> =
wrote:
>
> If many dmabufs are present, reads of the dmabuf iterator can be
> truncated at PAGE_SIZE or user buffer size boundaries before the fix in
> "selftests/bpf: Add test for open coded dmabuf_iter".

Copy/paste error here. This should be "bpf: Fix truncated dmabuf
iterator reads" from the previous commit in patch 1. I didn't include
the sha because I don't think they're guaranteed to be stable at this
point.

I also saw the warning from CI about the extra newline before
subtest_dmabuf_iter_check_open_coded, but the current CI failures look
unrelated to this change.

Add a test to
> confirm truncation does not occur.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---
>  .../selftests/bpf/prog_tests/dmabuf_iter.c    | 47 +++++++++++++++++--
>  1 file changed, 42 insertions(+), 5 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c b/tools=
/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> index 6c2b0c3dbcd8..e442be9dde7e 100644
> --- a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> +++ b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> @@ -73,12 +73,10 @@ static int create_udmabuf(void)
>         return -1;
>  }
>
> -static int create_sys_heap_dmabuf(void)
> +static int create_sys_heap_dmabuf(size_t bytes)
>  {
> -       sysheap_test_buffer_size =3D 20 * getpagesize();
> -
>         struct dma_heap_allocation_data data =3D {
> -               .len =3D sysheap_test_buffer_size,
> +               .len =3D bytes,
>                 .fd =3D 0,
>                 .fd_flags =3D O_RDWR | O_CLOEXEC,
>                 .heap_flags =3D 0,
> @@ -110,7 +108,9 @@ static int create_sys_heap_dmabuf(void)
>  static int create_test_buffers(void)
>  {
>         udmabuf =3D create_udmabuf();
> -       sysheap_dmabuf =3D create_sys_heap_dmabuf();
> +
> +       sysheap_test_buffer_size =3D 20 * getpagesize();
> +       sysheap_dmabuf =3D create_sys_heap_dmabuf(sysheap_test_buffer_siz=
e);
>
>         if (udmabuf < 0 || sysheap_dmabuf < 0)
>                 return -1;
> @@ -219,6 +219,26 @@ static void subtest_dmabuf_iter_check_default_iter(s=
truct dmabuf_iter *skel)
>         close(iter_fd);
>  }
>
> +static void subtest_dmabuf_iter_check_lots_of_buffers(struct dmabuf_iter=
 *skel)
> +{
> +       int iter_fd;
> +       char buf[1024];
> +       size_t total_bytes_read =3D 0;
> +       ssize_t bytes_read;
> +
> +       iter_fd =3D bpf_iter_create(bpf_link__fd(skel->links.dmabuf_colle=
ctor));
> +       if (!ASSERT_OK_FD(iter_fd, "iter_create"))
> +               return;
> +
> +       while ((bytes_read =3D read(iter_fd, buf, sizeof(buf))) > 0)
> +               total_bytes_read +=3D bytes_read;
> +
> +       ASSERT_GT(total_bytes_read, getpagesize(), "total_bytes_read");
> +
> +       close(iter_fd);
> +}
> +
> +
>  static void subtest_dmabuf_iter_check_open_coded(struct dmabuf_iter *ske=
l, int map_fd)
>  {
>         LIBBPF_OPTS(bpf_test_run_opts, topts);
> @@ -275,6 +295,23 @@ void test_dmabuf_iter(void)
>                 subtest_dmabuf_iter_check_no_infinite_reads(skel);
>         if (test__start_subtest("default_iter"))
>                 subtest_dmabuf_iter_check_default_iter(skel);
> +       if (test__start_subtest("lots_of_buffers")) {
> +               size_t NUM_BUFS =3D 100;
> +               int buffers[NUM_BUFS];
> +               int i;
> +
> +               for (i =3D 0; i < NUM_BUFS; ++i) {
> +                       buffers[i] =3D create_sys_heap_dmabuf(getpagesize=
());
> +                       if (!ASSERT_OK_FD(buffers[i], "dmabuf_fd"))
> +                               goto cleanup_bufs;
> +               }
> +
> +               subtest_dmabuf_iter_check_lots_of_buffers(skel);
> +
> +cleanup_bufs:
> +               for (--i; i >=3D 0; --i)
> +                       close(buffers[i]);
> +       }
>         if (test__start_subtest("open_coded"))
>                 subtest_dmabuf_iter_check_open_coded(skel, map_fd);
>
> --
> 2.52.0.177.g9f829587af-goog
>
