Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE07D824966
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 21:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF6610E524;
	Thu,  4 Jan 2024 20:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E1F10E524
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 20:07:45 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1d3ea8d0f9dso30565ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jan 2024 12:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1704398865; x=1705003665;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f5ZXdX4bS3ERPeQksYREtFg6egDHCXXKYTYbIsKvCx8=;
 b=jBp03wwGQn0VqkJGH2nhcxOwZmpU2ZkiNbOPxY8xhMcTPchTf80OSp5pRLMuuq9MjI
 JVGEGMT9Sy+kOm50d/YsYyKAzOt22MQHJ+cGiadvsQP/CyWlGDaHe9RTPu3jPZyFhlYh
 XzUFfIC5adrHyDfrJlfm5vlObj1MhZx1SrkGDUMutzu8fQDpOv0QMgAfL5cowOFDzNbC
 +OfdQ26KodFJIeTYculUwvrSEQAlXr9GXS+LszFLLi5e4E6jWzF/cpAbqLVvwaw51r0p
 MQmNJopaZ8+mgmLNwbZaX9/a49OMyYhqeAQGTixx2b/JY0vOryA1ID/qt+oMMLYaf9Ec
 pKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704398865; x=1705003665;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f5ZXdX4bS3ERPeQksYREtFg6egDHCXXKYTYbIsKvCx8=;
 b=dlSFYxBL3j4MFFJEt4+qrsAEoZx97NjxI9JaFgCPFqXV+zLaYYJiMgUhORwWN+vPz6
 Wfy2quqLvYhUQgzJCnZNvNAUiWY/qPORoI1Ltzw6M5eG7RoRGROsew9nKAgEdfA1+uzd
 L1ROq5p4kyem7k3sPCYEMtN7vOzehG48exW3glgvqlJSEs9nTFJ50hu17DY4ChPPscnu
 l2ps3+MsvsPz02pBBnlUmlN7F2iEe0eZfaH21pPsWHHCxW/QM+4ed/3HkskLQSFvyQ89
 TvA8G0UZVzFQMlLQ5qpE7oy0zH0QU+CwFeoOvi7oLWR7tFkzx/5N/ziIwfwqPhREM+0V
 0nxw==
X-Gm-Message-State: AOJu0YxOkEDPX2WG7x9luxEZS9o8J38CeXq/KtPwBRsDiZnA8DFGPTn3
 ZTrpUXTbWyqj0BGxxAxgv8z6n6/aC8bULFsl/FPe+DEdppU=
X-Google-Smtp-Source: AGHT+IE1vkesK4ZOVeDXSnQesWkwfg2DZNXrNfara5a0m92sCbqwWjRcDNy568hvPKmtKyTR34K9s+lngyphSHVzEeE=
X-Received: by 2002:a17:902:e884:b0:1d4:d462:f5a9 with SMTP id
 w4-20020a170902e88400b001d4d462f5a9mr38645plg.20.1704398864639; Thu, 04 Jan
 2024 12:07:44 -0800 (PST)
MIME-Version: 1.0
References: <20231206081538.17056-1-yunfei.dong@mediatek.com>
 <20231206081538.17056-4-yunfei.dong@mediatek.com>
 <705ce6b0-e945-404c-8014-38881a01fbca@xs4all.nl>
In-Reply-To: <705ce6b0-e945-404c-8014-38881a01fbca@xs4all.nl>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Thu, 4 Jan 2024 12:07:32 -0800
Message-ID: <CA+ddPcPH+M=rnAzyPgq7rMUV2sAdCJ5xdEAncPUyTfspxswzjQ@mail.gmail.com>
Subject: Re: [PATCH v3,
 03/21] v4l2: verify secure dmabufs are used in secure queue
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
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
Cc: Steve Cho <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
 dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, devicetree@vger.kernel.org,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 linaro-mm-sig@lists.linaro.org, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "T . J . Mercier" <tjmercier@google.com>, Yong Wu <yong.wu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Nathan Hebert <nhebert@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 11, 2023 at 2:58=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> On 06/12/2023 09:15, Yunfei Dong wrote:
> > From: Jeffrey Kardatzke <jkardatzke@google.com>
> >
> > Verfies in the dmabuf implementations that if the secure memory flag is
>
> Verfies -> Verifies

Thanks. Yunfei, change that please.
>
> > set for a queue that the dmabuf submitted to the queue is unmappable.
> >
> > Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 6 ++++++
> >  drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 6 ++++++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/dr=
ivers/media/common/videobuf2/videobuf2-dma-contig.c
> > index 3d4fd4ef5310..ad58ef8dc231 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > @@ -710,6 +710,12 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
> >               return -EINVAL;
> >       }
> >
> > +     /* verify the dmabuf is secure if we are in secure mode */
> > +     if (buf->vb->vb2_queue->secure_mem && sg_page(sgt->sgl)) {
>
> This needs a bit more explanation. I guess that for secure memory
> sg_page returns NULL?

How about if we change it to:

/* verify the dmabuf is secure if we are in secure mode, this is done
by validating there is no page entry for the dmabuf */

>
> > +             pr_err("secure queue requires secure dma_buf");
> > +             return -EINVAL;
> > +     }
> > +
> >       /* checking if dmabuf is big enough to store contiguous chunk */
> >       contig_size =3D vb2_dc_get_contiguous_size(sgt);
> >       if (contig_size < buf->size) {
> > diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/driver=
s/media/common/videobuf2/videobuf2-dma-sg.c
> > index 28f3fdfe23a2..55428c73c380 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > @@ -564,6 +564,12 @@ static int vb2_dma_sg_map_dmabuf(void *mem_priv)
> >               return -EINVAL;
> >       }
> >
> > +     /* verify the dmabuf is secure if we are in secure mode */
> > +     if (buf->vb->vb2_queue->secure_mem && !sg_dma_secure(sgt->sgl)) {
>
> I can't find the sg_dma_secure function. I suspect this patch series
> depends on another series?

That was an oversight, it should be the same as in
videobuf2-dma-contig.c. Yunfei, can you change this to match what's in
videobuf2-dma-contig.c after the comment is reworded?
>
> > +             pr_err("secure queue requires secure dma_buf");
> > +             return -EINVAL;
> > +     }
> > +
> >       buf->dma_sgt =3D sgt;
> >       buf->vaddr =3D NULL;
> >
>
> Regards,
>
>         Hans
