Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC0B90C493
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 09:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246DF10E49A;
	Tue, 18 Jun 2024 07:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="d+Z8IsP5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4513E10E271
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:48:24 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a6f1c4800easo622948466b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 00:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718696901; x=1719301701;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sCxa0N6a/etTSTm358fxjAycnT2MNf/L62aewqr2SjQ=;
 b=d+Z8IsP5rO5wQLD+9vG6SL5d2NnRaBW1lJzYMkVw+Z1qxx+uBa4EgG9+iX8zmXeYYt
 qRp8i+IGAikc7y5dUAuoXcM4zOz/ewuQjMxXE88gcTJpR6Pt5oNfeJuT99ywLSzw3ZQp
 Fx5nihh/HYHsPpsnw+c+da9cL4rFPpQa9c2Yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718696901; x=1719301701;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sCxa0N6a/etTSTm358fxjAycnT2MNf/L62aewqr2SjQ=;
 b=NjP9fMQpUdVsuMwC0Br62J4YlDH/nZtfRy/JjK3e3pU8L6tcPdNqaciYqAv4SJCAWr
 vtsiRV+1kCgcPpNiuPrSg+Y1FRIu6b6+A0c/wEe7WfCyxQ4TPHYI9GyYgtBvWQFcjCxc
 eFRvwWSdxUsGPQXpG7PjbBCLqbIR0jrIroC0ZvD1j4VC17rw8FhW1vcsm06b6E2Foei9
 H7q02mr8ppiFyDgcqwv7cZziB6PANcKRJ8aDaWUrgdvSyyQCYYvsckRDLEyTzWCgUpn6
 z0YQEsI95YfAPXzugFpqLDYqBuUtLlh+3Ph7cVKwtSi+tCwPuGTx7o1Go1zRCzSThZKf
 K69g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7PTldh/k2+XA7rVtX2/kFqcdIzouEni6bSIZZudiRZW5Wx51GvZOqEWycqDEAC50Yrgbwv0134udfS233t8TWbRGpZzDtnaUYosXkX1oG
X-Gm-Message-State: AOJu0Yxb9fZV/uGNypumqNg07JnSK+NKt5GO2qO+Ez78fzu/buIJJ+DD
 wpjFPMeUMjZUsQYc5z3TAPbHtejwGkNbc8kF2F4Q074YiNNURUPnC7HfVeWlWTv+8lz6rzzge7Q
 1ZO38
X-Google-Smtp-Source: AGHT+IGOGllh6MQ4MVJnIIBStIkTUzqMMOBfpZybDzuXHzD33KHRc7bo0G3p2zN62X2zJD+/ZnHX0Q==
X-Received: by 2002:a17:907:d408:b0:a6f:68b6:4e75 with SMTP id
 a640c23a62f3a-a6f68b65066mr909740566b.5.1718696901436; 
 Tue, 18 Jun 2024 00:48:21 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com.
 [209.85.218.43]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f41ad3sm586758666b.181.2024.06.18.00.48.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 00:48:20 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a63359aaaa6so764200566b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 00:48:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWwxxcqZZYBM9Lb6a5+IB0X4FElH3i4gQy9zI5Ggj/ErLAoSEp+p4lR7BBoB0Gvoa78LYUzlFRj7kojMMut4D+7DkBT4b1uThGS1K9Ybw6n
X-Received: by 2002:a17:906:ca0d:b0:a6f:fbc:b3f3 with SMTP id
 a640c23a62f3a-a6f60dc89cbmr680235166b.47.1718696899670; Tue, 18 Jun 2024
 00:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240618073004.3420436-1-tao.jiang_2@nxp.com>
In-Reply-To: <20240618073004.3420436-1-tao.jiang_2@nxp.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 18 Jun 2024 16:47:45 +0900
X-Gmail-Original-Message-ID: <CAAFQd5B_RTHsMwMdD59RAAyFne_0Ok_A4ExdkVOgi=G6-UGfRQ@mail.gmail.com>
Message-ID: <CAAFQd5B_RTHsMwMdD59RAAyFne_0Ok_A4ExdkVOgi=G6-UGfRQ@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2: sync caches for dmabuf memory
To: TaoJiang <tao.jiang_2@nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca, 
 shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, 
 xiahong.bao@nxp.com, eagle.zhou@nxp.com, ming.qian@oss.nxp.com, 
 imx@lists.linux.dev, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, m.szyprowski@samsung.com, 
 sumit.semwal@linaro.org, christian.koenig@amd.com, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Ming Qian <ming.qian@nxp.com>
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

Hi TaoJiang,

On Tue, Jun 18, 2024 at 4:30=E2=80=AFPM TaoJiang <tao.jiang_2@nxp.com> wrot=
e:
>
> From: Ming Qian <ming.qian@nxp.com>
>
> When the memory type is VB2_MEMORY_DMABUF, the v4l2 device can't know
> whether the dma buffer is coherent or synchronized.
>
> The videobuf2-core will skip cache syncs as it think the DMA exporter
> should take care of cache syncs
>
> But in fact it's likely that the client doesn't
> synchronize the dma buf before qbuf() or after dqbuf(). and it's
> difficult to find this type of error directly.
>
> I think it's helpful that videobuf2-core can call
> dma_buf_end_cpu_access() and dma_buf_begin_cpu_access() to handle the
> cache syncs.
>
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>

Sorry, that patch is incorrect. I believe you're misunderstanding the
way DMA-buf buffers should be managed in the userspace. It's the
userspace responsibility to call the DMA_BUF_IOCTL_SYNC ioctl [1] to
signal start and end of CPU access to the kernel and imply necessary
cache synchronization.

[1] https://docs.kernel.org/driver-api/dma-buf.html#dma-buffer-ioctls

So, really sorry, but it's a NAK.

Best regards,
Tomasz

> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/me=
dia/common/videobuf2/videobuf2-core.c
> index 358f1fe42975..4734ff9cf3ce 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -340,6 +340,17 @@ static void __vb2_buf_mem_prepare(struct vb2_buffer =
*vb)
>         vb->synced =3D 1;
>         for (plane =3D 0; plane < vb->num_planes; ++plane)
>                 call_void_memop(vb, prepare, vb->planes[plane].mem_priv);
> +
> +       if (vb->memory !=3D VB2_MEMORY_DMABUF)
> +               return;
> +       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> +               struct dma_buf *dbuf =3D vb->planes[plane].dbuf;
> +
> +               if (!dbuf)
> +                       continue;
> +
> +               dma_buf_end_cpu_access(dbuf, vb->vb2_queue->dma_dir);
> +       }
>  }
>
>  /*
> @@ -356,6 +367,17 @@ static void __vb2_buf_mem_finish(struct vb2_buffer *=
vb)
>         vb->synced =3D 0;
>         for (plane =3D 0; plane < vb->num_planes; ++plane)
>                 call_void_memop(vb, finish, vb->planes[plane].mem_priv);
> +
> +       if (vb->memory !=3D VB2_MEMORY_DMABUF)
> +               return;
> +       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> +               struct dma_buf *dbuf =3D vb->planes[plane].dbuf;
> +
> +               if (!dbuf)
> +                       continue;
> +
> +               dma_buf_begin_cpu_access(dbuf, vb->vb2_queue->dma_dir);
> +       }
>  }
>
>  /*
> --
> 2.43.0-rc1
>
