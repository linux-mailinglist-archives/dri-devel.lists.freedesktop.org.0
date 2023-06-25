Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D01873CF79
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 10:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106D410E11B;
	Sun, 25 Jun 2023 08:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0549110E11B
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 08:47:28 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-576a9507a9bso9832367b3.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 01:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687682847; x=1690274847;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jT0thIwO68HESVXBQpbJg4htP276Ynn85luHFgMgvjM=;
 b=Zprrn4oya8R5rpl5UxBDp1lX3nEX85qsiqDJxS9kQGT3DQARuwDCDqUzkpI+BWJqRA
 eV+w1OEbtucxMtbWVbyDgzzcS8ptjb42h9G1NTfBmJDiRCye6rSwBo4OUpUOupkK3rbE
 1n/DVJg4l3FbGasvzZE6uf+9gA3WMHoHA4rOvQVIik7LzpECaZ+ptV7GNNNmPuxjIzD4
 Zs1A+ovso5gcDiAUAniBalX0xuCA0qcuFApeRncDGGUZhMWphgojAVEESAm5NjvPPCw9
 52RDLuwDFqvM3mtreYC77EPk2KOsESFdN6cVvi6qAPdWOFJ7mKafREAV/eUa54uciiMA
 e52g==
X-Gm-Message-State: AC+VfDx35/s/xc9xrgbzfzznB3hchHhY1Vp7lSaAb/mLnyGkfieY6oOa
 BHKXtuDq/XxJGTGT0Bt30IvkGAYwBDmabQ==
X-Google-Smtp-Source: ACHHUZ6fvwYWsfj+KG2emfq5qDPp80OP1e4hm/hdxkWp/fWeyNNV3U6EILOUaeiQZ4rDOk7tSE7SQA==
X-Received: by 2002:a0d:d44f:0:b0:56d:3d8d:4f6a with SMTP id
 w76-20020a0dd44f000000b0056d3d8d4f6amr37174521ywd.10.1687682847435; 
 Sun, 25 Jun 2023 01:47:27 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 n197-20020a0dcbce000000b0056d3d7a59cesm739606ywd.12.2023.06.25.01.47.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 01:47:26 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-bcd0226607bso5110132276.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 01:47:26 -0700 (PDT)
X-Received: by 2002:a25:1046:0:b0:bc7:7fe4:afbc with SMTP id
 67-20020a251046000000b00bc77fe4afbcmr11054044ybq.20.1687682845949; Sun, 25
 Jun 2023 01:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
 <20230416115237.798604-4-dmitry.osipenko@collabora.com>
In-Reply-To: <20230416115237.798604-4-dmitry.osipenko@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 25 Jun 2023 10:47:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrJsmQx8X-_Tnxir9W752Mdh8ye7ob2srtY+6HFDEMGw@mail.gmail.com>
Message-ID: <CAMuHMdVrJsmQx8X-_Tnxir9W752Mdh8ye7ob2srtY+6HFDEMGw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] drm/virtio: Support sync objects
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 kernel@collabora.com, virtualization@lists.linux-foundation.org,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Sun, Apr 16, 2023 at 1:55=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
> Add sync object DRM UAPI support to VirtIO-GPU driver. Sync objects
> support is needed by native context VirtIO-GPU Mesa drivers, it also will
> be used by Venus and Virgl contexts.
>
> Reviewed-by; Emil Velikov <emil.velikov@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/virtio/virtgpu_submit.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_submit.c

> +static int
> +virtio_gpu_parse_deps(struct virtio_gpu_submit *submit)
> +{
> +       struct drm_virtgpu_execbuffer *exbuf =3D submit->exbuf;
> +       struct drm_virtgpu_execbuffer_syncobj syncobj_desc;
> +       size_t syncobj_stride =3D exbuf->syncobj_stride;
> +       u32 num_in_syncobjs =3D exbuf->num_in_syncobjs;
> +       struct drm_syncobj **syncobjs;
> +       int ret =3D 0, i;
> +
> +       if (!num_in_syncobjs)
> +               return 0;
> +
> +       /*
> +        * kvalloc at first tries to allocate memory using kmalloc and
> +        * falls back to vmalloc only on failure. It also uses GFP_NOWARN

GFP_NOWARN does not exist.

> +        * internally for allocations larger than a page size, preventing
> +        * storm of KMSG warnings.
> +        */
> +       syncobjs =3D kvcalloc(num_in_syncobjs, sizeof(*syncobjs), GFP_KER=
NEL);
> +       if (!syncobjs)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < num_in_syncobjs; i++) {
> +               u64 address =3D exbuf->in_syncobjs + i * syncobj_stride;
> +               struct dma_fence *fence;
> +

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
