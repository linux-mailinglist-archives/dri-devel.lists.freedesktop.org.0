Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A19AB447B
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 21:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6FC10E0F7;
	Mon, 12 May 2025 19:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="PfMOdcrA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EF710E0F7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 19:10:45 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43cf3192d8bso10505e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747077044; x=1747681844;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hm/PPoZA1XOQh100d62s3HDVZNFFqoCK54oYIZBXFgE=;
 b=PfMOdcrAoQJCQBMDCNhqLxO80Rp0AlVmmLgDCDhykr+z2FsqG4bPuZr+tivmG5E2B3
 JeLAwwfaBGwS5S3RiqCGmPEGdHWDHSsg3vHfiqEh24YO3SeBh688jDrJMh2HYddNMr+2
 A3rQ5Fr/5YJbMI/itpDw8agfqUROEubR6WEZig75F6xcg1HzWYjPu6yWrNvOYiEjrVz6
 vVAX2tMUlqJ3M1A8t5a/e54qiiIWSAI/d2OhRsJfHwB+KyuFjen8A31RvIEYqYP333qA
 JkoU+eFG8Nq2ggOXaRDiH2x6/yRSNDSOwVeNXUbjk3rgZXeZjVEFE5kwTGdz0JUY2dAj
 nSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747077044; x=1747681844;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hm/PPoZA1XOQh100d62s3HDVZNFFqoCK54oYIZBXFgE=;
 b=hUQccGZIEhX8hRW5SVZ14DpsFpSXWF+/m9QhqA9q0ejNX7lbYhvZivuAoa9wrZgPeO
 CIGLy8WQ7KEP78bhTT0uWOyjvrQKvaFJvZ7FBu1xXboz8pPde7Fos+xEo2LJ4qlo6FSS
 DBL8n1X5kkw3iVgjxkPLi9fX0jpywv3RTrugUGLqc3qX4twP1+LDZorFA+EO7xAhF1Vc
 SUvO/CiLjd6COz+gHCCj6PTQXRthbiBxB5IGZ7X3ET+/vJXjNdYd/b5xYCxl0s3mej2W
 2qghE7F/32AwE41LONaS3ckOFXTd0EmqEj49GMDjdOobW8aVSZZerC3PWtQE4Ba5GO/X
 rhPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4wtCsXmufjHeoX4hTqme9eaKkk+JB9khYB9rcXQgQIssmqlbTYLhV4wGcH2V6HEvKf0VRWfnPzXo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCgft7LUbHOYlkDi2VprwnClMYdkTD+pvNTf1CHdbxktX6p7lx
 eSCwzUJCtiQa6bf92OTKRd0ODTU/4WbSQTdmauhfENDWrIFczx8kj55RRbnS5k0VhCcXAuOkZkj
 rbPdBNyl4btyx6IH1+Sh1FLrqln8odAyKVk8N
X-Gm-Gg: ASbGncu9PDlMCnxHpkQJaSXe6C/phG64sijKVHAEjpzQwbepQlxovW1y0SffqXggfqi
 krydV6AdSvIhRFV0J9y0wTefFsyXqKyXqDT1ZsI29Ah21sJ406d2ftR82Zw1FLBFmMF9niPSAtY
 XFUonztwPOuyUEh7+4XTPx7085Q7asliZRpU5CeprA7g==
X-Google-Smtp-Source: AGHT+IEhJna6SF6AWqidUoCT2Jm/s8v5ZVMXBVF44DHVGLlvS0U5wRATEd00vS/y2Vx87UPbRiSHB0qxO5c6fEFlwVs=
X-Received: by 2002:a05:600c:308a:b0:43b:c2cc:5075 with SMTP id
 5b1f17b1804b1-442eb5c4ef0mr95615e9.5.1747077044127; Mon, 12 May 2025 12:10:44
 -0700 (PDT)
MIME-Version: 1.0
References: <20250512174036.266796-1-tjmercier@google.com>
 <20250512174036.266796-5-tjmercier@google.com>
 <CAPhsuW6TUogokra2mJQG6jeuZ1_RZPwr4xGbBOUJZBUg9AqW3g@mail.gmail.com>
In-Reply-To: <CAPhsuW6TUogokra2mJQG6jeuZ1_RZPwr4xGbBOUJZBUg9AqW3g@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 12 May 2025 12:10:31 -0700
X-Gm-Features: AX0GCFuAa1TiNYsj-36X4VBRhiCNdv4k59_jqcRfoVVDhkJg1nA6Timls4X60Xs
Message-ID: <CABdmKX200iB3+_6mVQpCH7agdcwsjbfR5cJKRyySuu-2BsL2gA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 4/5] selftests/bpf: Add test for dmabuf_iter
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

On Mon, May 12, 2025 at 11:58=E2=80=AFAM Song Liu <song@kernel.org> wrote:
>
> On Mon, May 12, 2025 at 10:41=E2=80=AFAM T.J. Mercier <tjmercier@google.c=
om> wrote:
> [...]
> > +
> > +static int udmabuf;
>
> static int udmabuf =3D -1;
>
> > +static const char udmabuf_test_buffer_name[DMA_BUF_NAME_LEN] =3D "udma=
buf_test_buffer_for_iter";
> > +static size_t udmabuf_test_buffer_size;
> > +static int sysheap_dmabuf;
>
> static int sysheap_dmabuf =3D -1;

We don't really need the -1 since the rework in this version
initializes them to -1 on failure, but I'll add it anyway.

> > +static const char sysheap_test_buffer_name[DMA_BUF_NAME_LEN] =3D "sysh=
eap_test_buffer_for_iter";
> > +static size_t sysheap_test_buffer_size;
> > +
> > +static int create_udmabuf(void)
> > +{
> > +       struct udmabuf_create create;
>
> nit: zero initialize create to be future proof.

Ok, done.

>
> > +       int dev_udmabuf, memfd, local_udmabuf;
> > +
> > +       udmabuf_test_buffer_size =3D 10 * getpagesize();
>
> [...]
>
> > +static void subtest_dmabuf_iter_check_default_iter(struct dmabuf_iter =
*skel)
> > +{
> > +       bool found_test_sysheap_dmabuf =3D false;
> > +       bool found_test_udmabuf =3D false;
> > +       struct DmabufInfo bufinfo;
> > +       size_t linesize =3D 0;
> > +       char *line =3D NULL;
> > +       FILE *iter_file;
> > +       int iter_fd, f =3D INODE;
> > +
> > +       iter_fd =3D bpf_iter_create(bpf_link__fd(skel->links.dmabuf_col=
lector));
> > +       ASSERT_OK_FD(iter_fd, "iter_create");
>
> Should we check ASSERT_OK_FD() and exit early on
> failures?

We should fallthrough on error, but let's add the early out.

>
> > +
> > +       iter_file =3D fdopen(iter_fd, "r");
> > +       ASSERT_OK_PTR(iter_file, "fdopen");
>
> Same here.
> [...]
> > +/*
> > + * Fields output by this iterator are delimited by newlines. Convert a=
ny
> > + * newlines in user-provided printed strings to spaces.
> > + */
> > +static void sanitize_string(char *src, size_t size)
> > +{
> > +       for (char *c =3D src; c && (size_t)(c - src) < size; ++c)
>
> Should this be:
>
>   for (char *c =3D src; *c && (size_t)(c - src) < size; ++c)
>
> ?

Yes! Thanks.

> Thanks,
> Song
>
> [...]
