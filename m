Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB7F45331B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 14:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9873D6ECDF;
	Tue, 16 Nov 2021 13:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6566E6E9EF
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 10:59:42 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so2505651pjb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 02:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FwJhNR6UVdEygqQ3NpO69n0AQg/9IjTmtT9BR0BsSDI=;
 b=Ewo6F1PsoUATgegT2NT/vHjl4DaF6x4zbQJuhePSSwF02g7aOM2Yf8SfftPULxqGWb
 quKiwGUIxf66Hvhwjajfdk1ONoIuiveXYuYJTVCeEV3mUozKT5yqZ3JXQdLfj3M7T8MI
 sl/U5SZMu3dlB7PgIxkJoD7I2znL/BzyjiKYFbJpsc7LwU2IPJziT4XwpVvAyRLWbVBj
 Ven6aMsVKtXJWC8fBqmcLJ3L0OfZuW/Qepe5GYTgSfTPIOlzb6kRmKig2Mt9UyevelFT
 wC4pKvWZNCYgrQ+n1/MRcKToyiSYV9R8o71Ewy5kROAWV+tReK+1R3sfvDXzSDFOBvYJ
 twVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FwJhNR6UVdEygqQ3NpO69n0AQg/9IjTmtT9BR0BsSDI=;
 b=ldFkI8PWKSfjK8yJJOaz1l/mBarXkNdWCmcP4Kif6NNtkDkZtvv7vxZ92YleRRf/Vk
 6G25EgkoqBlkzZgCdpU+LuCXvupOnKNmy2N3ohe9Au/poF9I98hW6wZF47xz3Nhzew9n
 j8Y3yXEPhumSRiC/OPEOPdIb67YHWmZMPANprZmTwCVilW0gyX/YTJYAZ7zBJzQntWBA
 /ft3kbpZOGLUhRJnM0gX6qA/d7N9nt7xQgcIexpzL3f1KXs/aKUhR5TTsanJnqucqyhM
 kdTh4uWAihhJjiqHMOICLk8asLO/XfAmFc+zPBqh8ZSecs2r/xaay8/16xiol97dDkfa
 ER0g==
X-Gm-Message-State: AOAM530rEmAyLdS/Frf4dDA/QVbEJLavJa9dkEZwb97jwNf9gNDfMoT6
 x2Rm4YWcCK0LDxuzK5gO6+UrM+Nvo+eyZzIAMB8=
X-Google-Smtp-Source: ABdhPJyrFmZgydacRbJ7ebXIcokEPtXardd6vRzH+DpmfljRBpWz4sIfT768ZJCEn/wLoeBC7NJdLfjfnps2MQuvAJ0=
X-Received: by 2002:a17:90a:e54c:: with SMTP id
 ei12mr73995641pjb.81.1637060382020; 
 Tue, 16 Nov 2021 02:59:42 -0800 (PST)
MIME-Version: 1.0
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115141925.60164-9-paul@crapouillou.net>
In-Reply-To: <20211115141925.60164-9-paul@crapouillou.net>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Tue, 16 Nov 2021 12:59:30 +0200
Message-ID: <CA+U=DsqP0Wg54xgL3_-SmRc2v0GXQv9fDf=350P+sLvJhhYnng@mail.gmail.com>
Subject: Re: [PATCH 08/15] iio: buffer-dma: split iio_dma_buffer_fileio_free()
 function
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
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 4:20 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> From: Alexandru Ardelean <alexandru.ardelean@analog.com>
>
> A part of the logic in the iio_dma_buffer_exit() is required for the change
> to add mmap support to IIO buffers.
> This change splits the logic into a separate function, which will be
> re-used later.
>

Not sure how the protocol is here, since my old @analog.com email
isn't working anymore.

But:

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>

Thanks :)
Alex

> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/iio/buffer/industrialio-buffer-dma.c | 39 +++++++++++---------
>  1 file changed, 22 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
> index eeeed6b2e0cf..eb8cfd3af030 100644
> --- a/drivers/iio/buffer/industrialio-buffer-dma.c
> +++ b/drivers/iio/buffer/industrialio-buffer-dma.c
> @@ -358,6 +358,27 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
>  }
>  EXPORT_SYMBOL_GPL(iio_dma_buffer_request_update);
>
> +static void iio_dma_buffer_fileio_free(struct iio_dma_buffer_queue *queue)
> +{
> +       unsigned int i;
> +
> +       spin_lock_irq(&queue->list_lock);
> +       for (i = 0; i < ARRAY_SIZE(queue->fileio.blocks); i++) {
> +               if (!queue->fileio.blocks[i])
> +                       continue;
> +               queue->fileio.blocks[i]->state = IIO_BLOCK_STATE_DEAD;
> +       }
> +       spin_unlock_irq(&queue->list_lock);
> +
> +       for (i = 0; i < ARRAY_SIZE(queue->fileio.blocks); i++) {
> +               if (!queue->fileio.blocks[i])
> +                       continue;
> +               iio_buffer_block_put(queue->fileio.blocks[i]);
> +               queue->fileio.blocks[i] = NULL;
> +       }
> +       queue->fileio.active_block = NULL;
> +}
> +
>  static void iio_dma_buffer_submit_block(struct iio_dma_buffer_queue *queue,
>         struct iio_dma_buffer_block *block)
>  {
> @@ -681,25 +702,9 @@ EXPORT_SYMBOL_GPL(iio_dma_buffer_init);
>   */
>  void iio_dma_buffer_exit(struct iio_dma_buffer_queue *queue)
>  {
> -       unsigned int i;
> -
>         mutex_lock(&queue->lock);
>
> -       spin_lock_irq(&queue->list_lock);
> -       for (i = 0; i < ARRAY_SIZE(queue->fileio.blocks); i++) {
> -               if (!queue->fileio.blocks[i])
> -                       continue;
> -               queue->fileio.blocks[i]->state = IIO_BLOCK_STATE_DEAD;
> -       }
> -       spin_unlock_irq(&queue->list_lock);
> -
> -       for (i = 0; i < ARRAY_SIZE(queue->fileio.blocks); i++) {
> -               if (!queue->fileio.blocks[i])
> -                       continue;
> -               iio_buffer_block_put(queue->fileio.blocks[i]);
> -               queue->fileio.blocks[i] = NULL;
> -       }
> -       queue->fileio.active_block = NULL;
> +       iio_dma_buffer_fileio_free(queue);
>         queue->ops = NULL;
>
>         mutex_unlock(&queue->lock);
> --
> 2.33.0
>
