Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DAA90C35D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 08:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BEC10E169;
	Tue, 18 Jun 2024 06:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="d/kKB+pQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298D210E57D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 06:16:25 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-57cad452f8bso5636780a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 23:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718691383; x=1719296183;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RJr9JzMYPoHUkzMHoCiTq0VIt4qu1sC4HEHrc5vqagc=;
 b=d/kKB+pQ2S+dz7t/EyeMH8mQ9NVSvoj7Dtc5KtGNLAKkr+EcYXFHqgvGJyjThnmGLE
 jY2Wzx+hsIPSMUADeFQ2I3HJb2AE6z8DE4shUKSagenA2/cVQq5C3WaqyI8dDzCAeILE
 r+m00fwmXyQ6DsTOIoLtQjG5iUrPo2Wkuf6GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718691383; x=1719296183;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RJr9JzMYPoHUkzMHoCiTq0VIt4qu1sC4HEHrc5vqagc=;
 b=KAXPQ72w6ocjWh5glR5PKWBjb1haBp5pUc11aOd3bB4OCQOHIP4UaSt0vc6PbIigS3
 CVxaq4JuYSVnINuqg9q+EEhcmDd3ElVwi4B1XhjEGUHw1W6m0i9yhUpQyN8gX/JFVIhH
 JSNyPDgN08hAmiJOit3pB8UyT1sE7yT0lq5sHT0JPVErq2RK/0uM9Ir8Ig1fADxFYQfa
 bLTg3VnpxtasoC0MaSiCgU5SuTxZTQ3w8tFH5QDvJvgINq4GVP+Zg7K09diE3TVUP/Go
 EU9DBjhuCVZgxdkdNl2eI3mbN3bOnVEHDwkfHNXyrLR0VRh+jbrhcUUfXf8xkursNXW2
 DnEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaG31TwPVLkco8sNRxPTLTg9OKHsYS40vHqgsTQPpUhlJP959ckw9ewzSnJC4NG3zbnTp8etzTXFrSkDLsqbKocUgdMI9eeU+iYoqpkjTu
X-Gm-Message-State: AOJu0YwhiZ9OiOrmVCVC46VPryjnYNvy7kR//6N65wiVMdOPgLKG5/zo
 gKEiSGNyXzqu+8fDQLe7aNLF84FknNWYm8ptJL0ieQ4Wq8HtvGXowLH89YY3x6+mdwyvWksKTbl
 yHw==
X-Google-Smtp-Source: AGHT+IEEEL94SlcBeI4FGApGaaY0jzNjvZ26YcwZsyFdp7CatN8KXQQrit8WrfVX3cEBd9bwbhAPOg==
X-Received: by 2002:a50:c2c2:0:b0:57c:c019:a9f6 with SMTP id
 4fb4d7f45d1cf-57cc019ab8cmr6940737a12.32.1718691383261; 
 Mon, 17 Jun 2024 23:16:23 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com.
 [209.85.218.47]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72e9115sm7388088a12.46.2024.06.17.23.16.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 23:16:23 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a6f0e153eddso647925566b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 23:16:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVupAANIqtUE/J6F0l8dTrpNJ0PaJOIPKo9xuTnYDevE2VCFGDRyCKMI6mYLWtnHxPEAC/mx0x7eT9rTACKKASfEHvj/0YC9mu4VMyI+UH1
X-Received: by 2002:a17:906:b2c8:b0:a6f:5723:fb11 with SMTP id
 a640c23a62f3a-a6f60dc50bcmr730791166b.58.1718691382366; Mon, 17 Jun 2024
 23:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-13-yunfei.dong@mediatek.com>
 <4a5tf2cl744xzqslox4ddzmdpuvwksr54g3qk2jl4soatdts45@e6xmmm2ijmv6>
 <20fec212d49cc3f0479be7a855d9816f5739ce93.camel@mediatek.com>
In-Reply-To: <20fec212d49cc3f0479be7a855d9816f5739ce93.camel@mediatek.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 18 Jun 2024 15:16:01 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BgELHBm6zOckbOv6cg1OD8Ghwry-EG3EnETTh9hF7EzA@mail.gmail.com>
Message-ID: <CAAFQd5BgELHBm6zOckbOv6cg1OD8Ghwry-EG3EnETTh9hF7EzA@mail.gmail.com>
Subject: Re: [PATCH v6,12/24] media: mediatek: vcodec: add interface to
 allocate/free secure memory
To: =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
Cc: =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>, 
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "frkoenig@chromium.org" <frkoenig@chromium.org>,
 "stevecho@chromium.org" <stevecho@chromium.org>, 
 "wenst@chromium.org" <wenst@chromium.org>,
 "nhebert@chromium.org" <nhebert@chromium.org>, 
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "jstultz@google.com" <jstultz@google.com>, 
 "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, 
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "jkardatzke@google.com" <jkardatzke@google.com>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>, 
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>, 
 "tjmercier@google.com" <tjmercier@google.com>, 
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, 
 "nfraprado@collabora.com" <nfraprado@collabora.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
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

On Mon, Jun 17, 2024 at 3:53=E2=80=AFPM Yong Wu (=E5=90=B4=E5=8B=87) <Yong.=
Wu@mediatek.com> wrote:
>
> On Wed, 2024-06-12 at 14:22 +0900, Tomasz Figa wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On Thu, May 16, 2024 at 08:20:50PM +0800, Yunfei Dong wrote:
> > > Need to call dma heap interface to allocate/free secure memory when
> > playing
> > > secure video.
> > >
> > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > ---
> > >  .../media/platform/mediatek/vcodec/Kconfig    |   1 +
> > >  .../mediatek/vcodec/common/mtk_vcodec_util.c  | 122
> > +++++++++++++++++-
> > >  .../mediatek/vcodec/common/mtk_vcodec_util.h  |   3 +
> > >  3 files changed, 123 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/mediatek/vcodec/Kconfig
> > b/drivers/media/platform/mediatek/vcodec/Kconfig
> > > index bc8292232530..707865703e61 100644
> > > --- a/drivers/media/platform/mediatek/vcodec/Kconfig
> > > +++ b/drivers/media/platform/mediatek/vcodec/Kconfig
> > > @@ -17,6 +17,7 @@ config VIDEO_MEDIATEK_VCODEC
>
> [snip]
>
> > > -void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
> > > +static int mtk_vcodec_mem_alloc_sec(struct mtk_vcodec_dec_ctx
> > *ctx, struct mtk_vcodec_mem *mem)
> > > +{
> > > +struct device *dev =3D &ctx->dev->plat_dev->dev;
> > > +struct dma_buf *dma_buffer;
> > > +struct dma_heap *vdec_heap;
> > > +struct dma_buf_attachment *attach;
> > > +struct sg_table *sgt;
> > > +unsigned long size =3D mem->size;
> > > +int ret =3D 0;
> > > +
> > > +if (!size)
> > > +return -EINVAL;
> > > +
> > > +vdec_heap =3D dma_heap_find("restricted_mtk_cma");
> > > +if (!vdec_heap) {
> > > +mtk_v4l2_vdec_err(ctx, "dma heap find failed!");
> > > +return -EPERM;
> > > +}
> >
> > How is the heap name determined here? My recollection is that the
> > heap
> > name comes from the heap node in the DT, so it may vary depending on
> > the
> > board.
> >
> > Is the heap name documented anywhere in the DT bindings?
> >
> > Shouldn't we rather query DT for a phandle to the right heap?
> >
>
> Hi Tomasz,
>
> This heap name does not come from dt-binding. It is hard-coded in the
> driver[1]. Because the heap driver is a pure SW driver, there is no
> corresponding HW unit, and there is no way to add a dtsi node.
>
> [1]
> https://lore.kernel.org/linux-mediatek/20240515112308.10171-10-yong.wu@me=
diatek.com/

Okay, I see. Thanks for clarifying.

Best regards,
Tomasz
