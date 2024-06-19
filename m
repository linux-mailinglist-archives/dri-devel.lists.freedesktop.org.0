Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D87790E252
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 06:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D2B10E859;
	Wed, 19 Jun 2024 04:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Gcxh9moG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B14610E859
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 04:27:23 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ebe3bac675so4511871fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 21:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718771241; x=1719376041;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/U+cxAMgDXTuaBoZjBUZI7zxhscWza7MiDHr3eL9Des=;
 b=Gcxh9moG7lUM55RNCg0xBb1NpwOtSYY02OsmkCCWfpduc37p+UNimFYZ/rpuFfayC7
 EIwrItGBvY+iMrdcfr8D9qoDACITZBSVs4HYUWLllnaiRVu0Tiwc260uW2w22P4S3Gfu
 RQC68jhbEMu7MzbOxtY8wc8pNRq3atjMkYrx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718771241; x=1719376041;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/U+cxAMgDXTuaBoZjBUZI7zxhscWza7MiDHr3eL9Des=;
 b=lJ5g7j4kinixe/Q9xkpQpNbw7pxz8t9v7iIXs6p0VCXSGl6kQ3HpDIqnBtI3CXv5Kh
 lC9Mc3pr2QH5KGPbDw4m6Jh9Pk0+gagfRrv+ll+ovbbAHPIwzkTfkwMbgVFB8aPJORiE
 zeRU9a8qyAhoMpU5ScZq/wib2gQUGv2j0lxgOwVZF2AoAwvWN+2WiNcSS4tw7a4KJe1i
 TJq5wVQzvV2VhZO6EScfuFsceTXE5vfrI3epmZbzQNwzoZN7x4kvL14i758YAqbrmQB9
 x9caRIm+kPMAMBR92jZdM+yQmQqatA5tFQceqBHoBu0Y5Mr7CHVxyLzrjfa+eGApBVL9
 GL+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRo2K8XliR7bDg6r2p6OSVaXAvK7gpMdGcN661NcolLUPfQtfdBYcSHtNfePj4L5z2wkbxVa3m+Jt57QVqf+UaHWFNXbjh/Icpp66+99ZR
X-Gm-Message-State: AOJu0YwGD8Z+Gnhv26TyuPm1bUI06QOAvx8e4XaGGaqs6lpr+45lQjVp
 8DjB8wScEggokBnEVrp+188c0CtGixp2aTzHTzdcI/siVkZPbU/QfW6wz8Oplh1YrbgTsQKFD7C
 4aa3S
X-Google-Smtp-Source: AGHT+IHtv5ZwLaug1CpSoFIH1aFjmDWgFxuPEiE0z+pRG4QbyG0eOYpY7J2Xh0oWYvkY6mQd6nwC6w==
X-Received: by 2002:a2e:8755:0:b0:2eb:dbc5:7bd7 with SMTP id
 38308e7fff4ca-2ec34665872mr10716991fa.12.1718771240849; 
 Tue, 18 Jun 2024 21:27:20 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c9ad36sm18927341fa.135.2024.06.18.21.27.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 21:27:20 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52c84a21b8cso403827e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 21:27:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUcAjv5l8mztMV62eqfEmXzYFP3miTqVqn8PEoRnqMe4G2B4qhv29NpzlCXm3RxAJ98HBl0hwrT8mNXsNoMvtWnpOfkdX/F8NMrq6qdC6Kb
X-Received: by 2002:a17:907:2087:b0:a6f:53eb:dbe0 with SMTP id
 a640c23a62f3a-a6f9506f6f4mr245886666b.26.1718770776170; Tue, 18 Jun 2024
 21:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240618073004.3420436-1-tao.jiang_2@nxp.com>
 <CAAFQd5B_RTHsMwMdD59RAAyFne_0Ok_A4ExdkVOgi=G6-UGfRQ@mail.gmail.com>
 <036bf0d7f657cae444d20ea6d279b47e3bf0164e.camel@ndufresne.ca>
In-Reply-To: <036bf0d7f657cae444d20ea6d279b47e3bf0164e.camel@ndufresne.ca>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 19 Jun 2024 13:19:14 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DfbqOkZzPfCNRMGeMgv2NfM6WENWXeLUNsuMgkzeBQKw@mail.gmail.com>
Message-ID: <CAAFQd5DfbqOkZzPfCNRMGeMgv2NfM6WENWXeLUNsuMgkzeBQKw@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2: sync caches for dmabuf memory
To: Nicolas Dufresne <nicolas@ndufresne.ca>, m.szyprowski@samsung.com, 
 hverkuil-cisco@xs4all.nl
Cc: TaoJiang <tao.jiang_2@nxp.com>, mchehab@kernel.org, shawnguo@kernel.org, 
 robh+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com, 
 eagle.zhou@nxp.com, ming.qian@oss.nxp.com, imx@lists.linux.dev, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
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

On Wed, Jun 19, 2024 at 1:24=E2=80=AFAM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
>
> Le mardi 18 juin 2024 =C3=A0 16:47 +0900, Tomasz Figa a =C3=A9crit :
> > Hi TaoJiang,
> >
> > On Tue, Jun 18, 2024 at 4:30=E2=80=AFPM TaoJiang <tao.jiang_2@nxp.com> =
wrote:
> > >
> > > From: Ming Qian <ming.qian@nxp.com>
> > >
> > > When the memory type is VB2_MEMORY_DMABUF, the v4l2 device can't know
> > > whether the dma buffer is coherent or synchronized.
> > >
> > > The videobuf2-core will skip cache syncs as it think the DMA exporter
> > > should take care of cache syncs
> > >
> > > But in fact it's likely that the client doesn't
> > > synchronize the dma buf before qbuf() or after dqbuf(). and it's
> > > difficult to find this type of error directly.
> > >
> > > I think it's helpful that videobuf2-core can call
> > > dma_buf_end_cpu_access() and dma_buf_begin_cpu_access() to handle the
> > > cache syncs.
> > >
> > > Signed-off-by: Ming Qian <ming.qian@nxp.com>
> > > Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
> > > ---
> > >  .../media/common/videobuf2/videobuf2-core.c   | 22 +++++++++++++++++=
++
> > >  1 file changed, 22 insertions(+)
> > >
> >
> > Sorry, that patch is incorrect. I believe you're misunderstanding the
> > way DMA-buf buffers should be managed in the userspace. It's the
> > userspace responsibility to call the DMA_BUF_IOCTL_SYNC ioctl [1] to
> > signal start and end of CPU access to the kernel and imply necessary
> > cache synchronization.
> >
> > [1] https://docs.kernel.org/driver-api/dma-buf.html#dma-buffer-ioctls
> >
> > So, really sorry, but it's a NAK.
>
>
>
> This patch *could* make sense if it was inside UVC Driver as an example, =
as this
> driver can import dmabuf, to CPU memcpy, and does omits the required sync=
 calls
> (unless that got added recently, I can easily have missed it).

Yeah, currently V4L2 drivers don't call the in-kernel
dma_buf_{begin,end}_cpu_access() when they need to access the buffers
from the CPU, while my quick grep [1] reveals that we have 68 files
retrieving plane vaddr by calling vb2_plane_vaddr() (not necessarily a
100% guarantee of CPU access being done, but rather likely so).

I also repeated the same thing with VB2_DMABUF [2] and tried to
attribute both lists to specific drivers (by retaining the path until
the first - or _ [3]; which seemed to be relatively accurate), leading
to the following drivers that claim support for DMABUF while also
retrieving plane vaddr (without proper synchronization - no drivers
currently call any begin/end CPU access):

 i2c/video
 pci/bt8xx/bttv
 pci/cobalt/cobalt
 pci/cx18/cx18
 pci/tw5864/tw5864
 pci/tw686x/tw686x
 platform/allegro
 platform/amphion/vpu
 platform/chips
 platform/intel/pxa
 platform/marvell/mcam
 platform/mediatek/jpeg/mtk
 platform/mediatek/vcodec/decoder/mtk
 platform/mediatek/vcodec/encoder/mtk
 platform/nuvoton/npcm
 platform/nvidia/tegra
 platform/nxp/imx
 platform/renesas/rcar
 platform/renesas/vsp1/vsp1
 platform/rockchip/rkisp1/rkisp1
 platform/samsung/exynos4
 platform/samsung/s5p
 platform/st/sti/delta/delta
 platform/st/sti/hva/hva
 platform/verisilicon/hantro
 usb/au0828/au0828
 usb/cx231xx/cx231xx
 usb/dvb
 usb/em28xx/em28xx
 usb/gspca/gspca.c
 usb/hackrf/hackrf.c
 usb/stk1160/stk1160
 usb/uvc/uvc

which means we potentially have ~30 drivers which likely don't handle
imported DMABUFs correctly (there is still a chance that DMABUF is
advertised for one queue, while vaddr is used for another).

I think we have two options:
1) add vb2_{begin/end}_cpu_access() helpers, carefully audit each
driver and add calls to those
2) take a heavy gun approach and just call vb2_begin_cpu_access()
whenever vb2_plane_vaddr() is called and then vb2_end_cpu_access()
whenever vb2_buffer_done() is called (if begin was called before).

The latter has the disadvantage of drivers not having control over the
timing of the cache sync, so could end up with less than optimal
performance. Also there could be some more complex cases, where the
driver needs to mix DMA and CPU accesses to the buffer, so the fixed
sequence just wouldn't work for them. (But then they just wouldn't
work today either.)

Hans, Marek, do you have any thoughts? (I'd personally just go with 2
and if any driver in the future needs something else, they could call
begin/end CPU access manually.)

[1] git grep vb2_plane_vaddr | cut -d":" -f 1 | sort | uniq
[2] git grep VB2_DMABUF | cut -d":" -f 1 | sort | uniq
[3] by running [1] and [2] through | cut -d"-" -f 1 | cut -d"_" -f 1 | uniq

Best,
Tomasz

>
> But generally speaking, bracketing all driver with CPU access synchroniza=
tion
> does not make sense indeed, so I second the rejection.
>
> Nicolas
>
> >
> > Best regards,
> > Tomasz
> >
> > > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/driver=
s/media/common/videobuf2/videobuf2-core.c
> > > index 358f1fe42975..4734ff9cf3ce 100644
> > > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > > @@ -340,6 +340,17 @@ static void __vb2_buf_mem_prepare(struct vb2_buf=
fer *vb)
> > >         vb->synced =3D 1;
> > >         for (plane =3D 0; plane < vb->num_planes; ++plane)
> > >                 call_void_memop(vb, prepare, vb->planes[plane].mem_pr=
iv);
> > > +
> > > +       if (vb->memory !=3D VB2_MEMORY_DMABUF)
> > > +               return;
> > > +       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> > > +               struct dma_buf *dbuf =3D vb->planes[plane].dbuf;
> > > +
> > > +               if (!dbuf)
> > > +                       continue;
> > > +
> > > +               dma_buf_end_cpu_access(dbuf, vb->vb2_queue->dma_dir);
> > > +       }
> > >  }
> > >
> > >  /*
> > > @@ -356,6 +367,17 @@ static void __vb2_buf_mem_finish(struct vb2_buff=
er *vb)
> > >         vb->synced =3D 0;
> > >         for (plane =3D 0; plane < vb->num_planes; ++plane)
> > >                 call_void_memop(vb, finish, vb->planes[plane].mem_pri=
v);
> > > +
> > > +       if (vb->memory !=3D VB2_MEMORY_DMABUF)
> > > +               return;
> > > +       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> > > +               struct dma_buf *dbuf =3D vb->planes[plane].dbuf;
> > > +
> > > +               if (!dbuf)
> > > +                       continue;
> > > +
> > > +               dma_buf_begin_cpu_access(dbuf, vb->vb2_queue->dma_dir=
);
> > > +       }
> > >  }
> > >
> > >  /*
> > > --
> > > 2.43.0-rc1
> > >
>
