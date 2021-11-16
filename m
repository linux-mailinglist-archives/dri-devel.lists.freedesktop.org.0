Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFF245331A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 14:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D976ECDD;
	Tue, 16 Nov 2021 13:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7208C6EA96
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 09:50:50 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id iq11so15303343pjb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 01:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jbl1bKB28ZQInN+16uM3WF1uI4nnrdBSKaIDe4FDIn4=;
 b=NczuZoG9lJzIkj+khBgbYgrCnlf/dviLGHYxxjBvLZqdX3qYA8iMv51JgOHt0AbHSJ
 i8vVjtkhFLiVROY5Cq3hxHvFZWODNrlxIUPm2/Ux4G4h2oTOGtPy6xmP/leu9oyI5yhW
 YJDsKLi1482S1NFJaNCVtV0NaKmHYhV0vzw2SAHlaTmPQ3lBjcc+4BCnOCgLTvH15G9T
 8Qh+vFs+AM70fyR+tS52pq3WG/LyD6v5e06PK6rjmgek5L+dR4IuhntQIYVpbvyBXUFP
 Y2jR1djZSSTrGPex0XjKwTrPtyC1/BOvUeMh7p+OtUDfJPAUGGRrQHW+VGdIUxfDTh3k
 5tTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jbl1bKB28ZQInN+16uM3WF1uI4nnrdBSKaIDe4FDIn4=;
 b=0EtPS4zL5hgJOkIdxq2SSaYjE1/XxssBzVEMXV0cP/MgFGEogdxZ1im674blSgj5mt
 mPpLfOcxm503573FZ/JMI84qZPcYLDLX6BDmaWZkZj5jo7bu6i0hHhjhhJJ2HVnDw4q3
 wDidlOHy4BC3sxle3zjdJ+59lQ/1JjZs5OdP3smAMBDB6xivjnUVLU2wWByccFE4v+oM
 USu4do5x2LMQNijS4xBy2sQIBDOjqWXD3crHmQ75gvA6m6bB9vGKFJqX8lrKs9gm6hiE
 GHb8EERy10j6C+Ni4++7kEpa7ps5RAc9ZcaEro3Ay/Bw3HNR68xFqJL1IH8yMPipAeCB
 TRjw==
X-Gm-Message-State: AOAM531Y+u4lse7rx0Nm2LjNMYz9eYdBwXpXilxaZE4qje2jlIafRHvn
 6CDwaIn4h+a6C18CVRy//WTPuptUJEE7ewYMuNc=
X-Google-Smtp-Source: ABdhPJx0v8IzfnU05ejmdXMqJmDMXeb3PF++qh8Md5OR3XMUslrUChQ77cv06uovViNWiQhcy4Q3KXk00wiWecHoznA=
X-Received: by 2002:a17:90a:e54c:: with SMTP id
 ei12mr73525634pjb.81.1637056250074; 
 Tue, 16 Nov 2021 01:50:50 -0800 (PST)
MIME-Version: 1.0
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115142243.60605-1-paul@crapouillou.net>
 <20211115142243.60605-3-paul@crapouillou.net>
In-Reply-To: <20211115142243.60605-3-paul@crapouillou.net>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Tue, 16 Nov 2021 11:50:38 +0200
Message-ID: <CA+U=Dsp4P_q6gS9-iS1BujGfhia=uEjBZFy_VEZqFwT-rCOXQQ@mail.gmail.com>
Subject: Re: [PATCH 14/15] iio: buffer-dmaengine: Add support for cyclic
 buffers
To: Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 16 Nov 2021 13:45:51 +0000
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-iio <linux-iio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 4:23 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Handle the IIO_BUFFER_DMABUF_CYCLIC flag to support cyclic buffers.
>

Reviewed-by: Alexandru Ardelean <ardeleanalex@gmail.com>

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/iio/buffer/industrialio-buffer-dma.c      |  1 +
>  .../iio/buffer/industrialio-buffer-dmaengine.c    | 15 ++++++++++++---
>  include/linux/iio/buffer-dma.h                    |  3 +++
>  3 files changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
> index fb39054d8c15..6658f103ee17 100644
> --- a/drivers/iio/buffer/industrialio-buffer-dma.c
> +++ b/drivers/iio/buffer/industrialio-buffer-dma.c
> @@ -933,6 +933,7 @@ int iio_dma_buffer_enqueue_dmabuf(struct iio_buffer *buffer,
>         }
>
>         dma_block->bytes_used = iio_dmabuf->bytes_used ?: dma_block->size;
> +       dma_block->cyclic = iio_dmabuf->flags & IIO_BUFFER_DMABUF_CYCLIC;
>
>         switch (dma_block->state) {
>         case IIO_BLOCK_STATE_QUEUED:
> diff --git a/drivers/iio/buffer/industrialio-buffer-dmaengine.c b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> index 57a8b2e4ba3c..952e2160a11e 100644
> --- a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> +++ b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> @@ -81,9 +81,18 @@ static int iio_dmaengine_buffer_submit_block(struct iio_dma_buffer_queue *queue,
>         if (!block->bytes_used || block->bytes_used > max_size)
>                 return -EINVAL;
>
> -       desc = dmaengine_prep_slave_single(dmaengine_buffer->chan,
> -               block->phys_addr, block->bytes_used, dma_dir,
> -               DMA_PREP_INTERRUPT);
> +       if (block->cyclic) {
> +               desc = dmaengine_prep_dma_cyclic(dmaengine_buffer->chan,
> +                                                block->phys_addr,
> +                                                block->size,
> +                                                block->bytes_used,
> +                                                dma_dir, 0);
> +       } else {
> +               desc = dmaengine_prep_slave_single(dmaengine_buffer->chan,
> +                                                  block->phys_addr,
> +                                                  block->bytes_used, dma_dir,
> +                                                  DMA_PREP_INTERRUPT);
> +       }
>         if (!desc)
>                 return -ENOMEM;
>
> diff --git a/include/linux/iio/buffer-dma.h b/include/linux/iio/buffer-dma.h
> index 85e55fe35282..27639fdf7b54 100644
> --- a/include/linux/iio/buffer-dma.h
> +++ b/include/linux/iio/buffer-dma.h
> @@ -42,6 +42,7 @@ enum iio_block_state {
>   * @phys_addr: Physical address of the blocks memory
>   * @queue: Parent DMA buffer queue
>   * @state: Current state of the block
> + * @cyclic: True if this is a cyclic buffer
>   * @fileio: True if this buffer is used for fileio mode
>   * @dmabuf: Underlying DMABUF object
>   */
> @@ -65,6 +66,8 @@ struct iio_dma_buffer_block {
>          */
>         enum iio_block_state state;
>
> +       bool cyclic;
> +
>         bool fileio;
>         struct dma_buf *dmabuf;
>  };
> --
> 2.33.0
>
