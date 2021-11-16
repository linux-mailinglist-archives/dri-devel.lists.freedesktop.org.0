Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E091453319
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 14:46:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35286ECD3;
	Tue, 16 Nov 2021 13:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875BF6EDDE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 09:50:15 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id y7so17032073plp.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 01:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LOEo7+eEw7HOmFubNhZ5NIb+kpAjTOtWN/+/owTaRTQ=;
 b=lg9HAcs2AQJqwWwikf1xHuQykcP79WUH7MT8HXFxMccsym9AafWmijDfhnYN3IoL1n
 sCpQHuwA5+jhCEoEYCIb+y+unEBRQu3KKD1Dbslf5hQmMxoDMIbutJMfca4UlZcvK41b
 qes4oeREIyGgdWeqjv3KMc6JFd+E/Pm/pIh/7BG1E5+8SLEBgZ3kDYnzioKkZINroEEG
 sNxTqo1aqhCYSNWoRDtkavrL3cF1Wt0H+sMunaGS4OoCQIGiC5qCwt02Nn8aUEyCzZNg
 3tKexTVRSn75VsedToXCGH8ntvBgaDVv5VLWiSBOD1uc/rCiWnwK0Nfr9de4KUQHGeqs
 17hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LOEo7+eEw7HOmFubNhZ5NIb+kpAjTOtWN/+/owTaRTQ=;
 b=AyUneU4sukr/1nR3Ly0nOf3seRVvKPA8M/kfICYis1OF8Tx/J6Yy7YJLKKGiQ8XVwj
 EFBdO7UFKXKHKlx1d3Ii2X5owrwcQZ84KYTikO35wDv5xs0agNGTZFw/idrBGH4YOw55
 2ydZ9JQD0Kp8KekYxLKYgYdqTUyga9HVfxAcTOAtYZ955SMuEYLLoHc2OA2OaOfekUxn
 1zTm0gJC1qTL5nCZk7C4FHcGbo2ABSVxqjsKFdoT08OmXTXRZrtpiISLQ/8L1pe5eE6/
 c/Il8tcSA6QaRsnWwyCRdkAtXckkpUV6TKlgB+Wcnx0IQgcZoko0Njc/4gj43ozlsyYG
 Yv3Q==
X-Gm-Message-State: AOAM5331sERhszhbfpFPngCykculOaZNiRLBFPXjEFClFQiV7aBil7Nf
 Qzi4cde93z6ZCq5NZxT3dLe4NK3Hlt5Em/1/lWJUKPVBA58=
X-Google-Smtp-Source: ABdhPJxjkwFXdhzCHzbozqRCnmGohriRD2ActA2SYX/tVP+evd9ZLHyQZfBC+bl7MpvRwzONNxG00ZpuXMx27S39qkk=
X-Received: by 2002:a17:902:748c:b0:142:5f2f:1828 with SMTP id
 h12-20020a170902748c00b001425f2f1828mr43623292pll.4.1637056215138; Tue, 16
 Nov 2021 01:50:15 -0800 (PST)
MIME-Version: 1.0
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115142243.60605-1-paul@crapouillou.net>
 <20211115142243.60605-2-paul@crapouillou.net>
In-Reply-To: <20211115142243.60605-2-paul@crapouillou.net>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Tue, 16 Nov 2021 11:50:03 +0200
Message-ID: <CA+U=DsoJWgifThUwcQ61M6851H7JVKH2s_O3=JJ0CsPeX8wdoA@mail.gmail.com>
Subject: Re: [PATCH 13/15] iio: core: Add support for cyclic buffers
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

On Mon, Nov 15, 2021 at 4:22 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Introduce a new flag IIO_BUFFER_DMABUF_CYCLIC in the "flags" field of
> the iio_dmabuf uapi structure.
>
> When set, the DMABUF enqueued with the enqueue ioctl will be endlessly
> repeated on the TX output, until the buffer is disabled.
>

Reviewed-by: Alexandru Ardelean <ardeleanalex@gmail.com>

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/iio/industrialio-buffer.c | 5 +++++
>  include/uapi/linux/iio/buffer.h   | 3 ++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
> index 30910e6c2346..41bc51c88002 100644
> --- a/drivers/iio/industrialio-buffer.c
> +++ b/drivers/iio/industrialio-buffer.c
> @@ -1600,6 +1600,11 @@ static int iio_buffer_enqueue_dmabuf(struct iio_buffer *buffer,
>         if (dmabuf.flags & ~IIO_BUFFER_DMABUF_SUPPORTED_FLAGS)
>                 return -EINVAL;
>
> +       /* Cyclic flag is only supported on output buffers */
> +       if ((dmabuf.flags & IIO_BUFFER_DMABUF_CYCLIC) &&
> +           buffer->direction != IIO_BUFFER_DIRECTION_OUT)
> +               return -EINVAL;
> +
>         return buffer->access->enqueue_dmabuf(buffer, &dmabuf);
>  }
>
> diff --git a/include/uapi/linux/iio/buffer.h b/include/uapi/linux/iio/buffer.h
> index e4621b926262..2d541d038c02 100644
> --- a/include/uapi/linux/iio/buffer.h
> +++ b/include/uapi/linux/iio/buffer.h
> @@ -7,7 +7,8 @@
>
>  #include <linux/types.h>
>
> -#define IIO_BUFFER_DMABUF_SUPPORTED_FLAGS      0x00000000
> +#define IIO_BUFFER_DMABUF_CYCLIC               (1 << 0)
> +#define IIO_BUFFER_DMABUF_SUPPORTED_FLAGS      0x00000001
>
>  /**
>   * struct iio_dmabuf_alloc_req - Descriptor for allocating IIO DMABUFs
> --
> 2.33.0
>
