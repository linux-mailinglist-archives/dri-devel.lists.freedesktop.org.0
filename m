Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54057AB7778
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 23:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C4410E73D;
	Wed, 14 May 2025 21:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m2GXJlzz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBC010E73D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 21:00:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 77C864A9C6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 21:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E483C4CEF9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 21:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747256420;
 bh=XnznhJhuk6zXlvzmK9mMxFBwsL2VmJ/Mxxl8DajyVUU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=m2GXJlzzZ3DcMGe5d5vupazK/2jueAV1szn5X3Xil6n/XAMSotwGSaBAGAPY2auE/
 IoZwk0Q+M3hxGtA+4RpGGdgi9Bf7BZEMacxhnrapqQVCL3jlbvLnAJtcuKld+l3w1l
 aGtTH88W23ZGTLzQggyrcNBcogsBSJ4sHmrygbuTBi14Jv9RILus0vxa7GOfxyLvNU
 dU8lSKB2nDExIyHxdpCVMZIxEVLqG30kUBAfxrOKf2b5EOF85oJ6QK1EZAj6DUqoGU
 y/V35NsteEa9OWYwQMDK1WTHf+0uBClAa6fHumlR7spVIyDUCyHIm5uyMTVXNxcyB0
 V1tuLBBZVJXCA==
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7c5e39d1db2so11576385a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 14:00:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXLBklCdNd41glSir0eB1nrXURQ1PKuJEtGu0HaUhvxrGYe5vcj5VncmC2K/SHYSHhXqG0qtZGrgf4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQCOHSckXx56IVri/rdgbFwvZDIYaQ1GJ2iy56p5A3D5jc+m28
 DRHs5jbH+t3qG1ovsKpNDHDcjd6YXaWtasmDf9R6SI958Hu1PdfF826uV4kp8wPxfzAW98yGYz5
 99saAcAPTi6iET7KL2uX7ZXLaCro=
X-Google-Smtp-Source: AGHT+IEhk7L+lq3nvFFbRnQz3zzW13v/TUfQdGY8T5liXifuEFN1njdktgiHu8lQDra2Hjw2x4vIHEc90h2a4f2wyjU=
X-Received: by 2002:a05:6214:29ea:b0:6f5:46b0:7d11 with SMTP id
 6a1803df08f44-6f896eacaa6mr95493576d6.36.1747256418120; Wed, 14 May 2025
 14:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250513163601.812317-1-tjmercier@google.com>
 <20250513163601.812317-6-tjmercier@google.com>
In-Reply-To: <20250513163601.812317-6-tjmercier@google.com>
From: Song Liu <song@kernel.org>
Date: Wed, 14 May 2025 14:00:06 -0700
X-Gmail-Original-Message-ID: <CAPhsuW50mA3hhirHBiZ2miBeC0uAN=KxyYKBJ_hHgmFx-cvaNw@mail.gmail.com>
X-Gm-Features: AX0GCFuntU3ESTAS15kAsHIf6pG-Tbi7KiDkSGJvlMEE3mBjavdb8gFnDOzUmFQ
Message-ID: <CAPhsuW50mA3hhirHBiZ2miBeC0uAN=KxyYKBJ_hHgmFx-cvaNw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v6 5/5] selftests/bpf: Add test for open coded
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

On Tue, May 13, 2025 at 9:36=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> Use the same test buffers as the traditional iterator and a new BPF map
> to verify the test buffers can be found with the open coded dmabuf
> iterator.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Acked-by: Song Liu <song@kernel.org>
> ---
>  .../testing/selftests/bpf/bpf_experimental.h  |  5 +++
>  .../selftests/bpf/prog_tests/dmabuf_iter.c    | 41 +++++++++++++++++++
>  .../testing/selftests/bpf/progs/dmabuf_iter.c | 38 +++++++++++++++++
>  3 files changed, 84 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testi=
ng/selftests/bpf/bpf_experimental.h
> index 6535c8ae3c46..5e512a1d09d1 100644
> --- a/tools/testing/selftests/bpf/bpf_experimental.h
> +++ b/tools/testing/selftests/bpf/bpf_experimental.h
> @@ -591,4 +591,9 @@ extern int bpf_iter_kmem_cache_new(struct bpf_iter_km=
em_cache *it) __weak __ksym
>  extern struct kmem_cache *bpf_iter_kmem_cache_next(struct bpf_iter_kmem_=
cache *it) __weak __ksym;
>  extern void bpf_iter_kmem_cache_destroy(struct bpf_iter_kmem_cache *it) =
__weak __ksym;
>
> +struct bpf_iter_dmabuf;
> +extern int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it) __weak __ksym=
;
> +extern struct dma_buf *bpf_iter_dmabuf_next(struct bpf_iter_dmabuf *it) =
__weak __ksym;
> +extern void bpf_iter_dmabuf_destroy(struct bpf_iter_dmabuf *it) __weak _=
_ksym;
> +
>  #endif
> diff --git a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c b/tools=
/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> index dc740bd0e2bd..6c2b0c3dbcd8 100644
> --- a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> +++ b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> @@ -219,14 +219,52 @@ static void subtest_dmabuf_iter_check_default_iter(=
struct dmabuf_iter *skel)
>         close(iter_fd);
>  }
>
> +static void subtest_dmabuf_iter_check_open_coded(struct dmabuf_iter *ske=
l, int map_fd)
> +{
> +       LIBBPF_OPTS(bpf_test_run_opts, topts);
> +       char key[DMA_BUF_NAME_LEN];
> +       int err, fd;
> +       bool found;
> +
> +       /* No need to attach it, just run it directly */
> +       fd =3D bpf_program__fd(skel->progs.iter_dmabuf_for_each);
> +
> +       err =3D bpf_prog_test_run_opts(fd, &topts);
> +       if (!ASSERT_OK(err, "test_run_opts err"))
> +               return;
> +       if (!ASSERT_OK(topts.retval, "test_run_opts retval"))
> +               return;
> +
> +       if (!ASSERT_OK(bpf_map_get_next_key(map_fd, NULL, key), "get next=
 key"))
> +               return;
> +
> +       do {
> +               ASSERT_OK(bpf_map_lookup_elem(map_fd, key, &found), "look=
up");
> +               ASSERT_TRUE(found, "found test buffer");

This check failed once in the CI, on s390:

Error: #89/3 dmabuf_iter/open_coded
9309 subtest_dmabuf_iter_check_open_coded:PASS:test_run_opts err 0 nsec
9310 subtest_dmabuf_iter_check_open_coded:PASS:test_run_opts retval 0 nsec
9311 subtest_dmabuf_iter_check_open_coded:PASS:get next key 0 nsec
9312 subtest_dmabuf_iter_check_open_coded:PASS:lookup 0 nsec
9313 subtest_dmabuf_iter_check_open_coded:FAIL:found test buffer
unexpected found test buffer: got FALSE

But it passed in the rerun. It is probably a bit flakey. Maybe we need some
barrier somewhere.

Here is the failure:

https://github.com/kernel-patches/bpf/actions/runs/15002058808/job/42234864=
754

To see the log, you need to log in GitHub.

Thanks,
Song

> +       } while (bpf_map_get_next_key(map_fd, key, key));
> +}

[...]
