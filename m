Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F21B0776F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 15:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40DE10E399;
	Wed, 16 Jul 2025 13:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RzBhAzCJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C848310E399
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 13:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752674218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8fU90Rrx5Q2FZQjCI0B6EMx3qMx3LCWE+lzijdY4q10=;
 b=RzBhAzCJUl/s5ozcvzoOvk1Ux64xaBDA/Ppz21ZAUempTMjx39g10sKcd9hQXKIHFAIlOc
 Xkzrzwf8KKlLYhYkjdLK8G37Jv70fu/XN4+5KCQVAew9jKWlA2CVMqwp8sBgeSGQoKhzKF
 cFcrU0K6pQ2UAkwgnBeLcfkM+qWUzdc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-VNE8g-OwPaaeBKFe25cEPg-1; Wed, 16 Jul 2025 09:56:56 -0400
X-MC-Unique: VNE8g-OwPaaeBKFe25cEPg-1
X-Mimecast-MFC-AGG-ID: VNE8g-OwPaaeBKFe25cEPg_1752674215
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4f7ebfd00so2811593f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 06:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752674215; x=1753279015;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8fU90Rrx5Q2FZQjCI0B6EMx3qMx3LCWE+lzijdY4q10=;
 b=JuSo+csw3krDy5fypvmHCTuomNG5l9RbVrBrMyKu/pYtRcGDVzhTyoNmcjFWz5QWAc
 DRv7je1fqeoWtqu3fljMvjxhf0fu+vtZYktrqbO702JuplZaMbNkR5HEJDXg1TGAKacS
 fFmr4IVYoyBNBpkCpzK7jH80Vf7pLL4s8tDJ/bLufkF/P8bKLyjuaHJxwXUaI+5Fm+xg
 OgzXvJTGGWFjBrZVmpCrMYeoe9R2TmcyIibxlSQf7rqY4RVpakBnT8OIHasVtcv4U1JQ
 AoiPcPTUj+M19qevyv/zp8A+TPehBDd0h9GBUc5dgD4uAh//ffdCDazAPtby/1FPYrHf
 VsrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVoyiNZPwA4ZG2rRXNckZOhcEYU25ShBf+TXEFHSpJzWCe8M561B1uKrtbfq1Gl9rffS4Fm1ahGxg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKav3vHyD/TdXS/zcZ13DgD3ziDLYVzSauKpgUU9tL/+d1Fsfn
 halwcGQj4Mat8a+34nlCGTC2rTIx51zqaBN7icL47wBl7d8T0qCn47y7h64mqGMIQBNxIhRr3KO
 bCj6CoxjNu87tqiN909XJnimj2U0eFlJAaLmMa1LT1NYgRdvlPC2LYFoGlCKMlxvMySYI9w==
X-Gm-Gg: ASbGncvkyx31jqEK2il42Aq3r/2H8Lk3LmH5RAlywDfRogT0NinGwokJ6GhAu/rqsn7
 Z9UusEVIAMdyp2chzG7ZFqARLa3gjHo3bjxpWOUPhWJdybb4RlxDSm3wboRQxad8KQ5PjdJEShw
 E4knjqXrtxiaKaMsqC2LxEq/PQTzTcGVgxXHM4RT312lSi5t3bX5OyS2uYN1tRXKCalTTSrVM3R
 aP0hdptDjLxPSLSksJG3aI1hPCF2lV95s9jHKDXIgV4j0DK4EsAdSFLT9eNFKF0z5AJ7JGbmCN2
 mWnWUg7j7tBSQGJI2dZgtHG9ZC9xrBCC
X-Received: by 2002:adf:f64b:0:b0:3b6:936:92fa with SMTP id
 ffacd0b85a97d-3b60dd8df46mr2367239f8f.52.1752674215040; 
 Wed, 16 Jul 2025 06:56:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDkw4tjXyAdhQ6LVjUDIf1HaSWqF1ZS/CeOQWr/qZekbvwZ8qxdZocOeTQ+5WAYNkarEumJw==
X-Received: by 2002:adf:f64b:0:b0:3b6:936:92fa with SMTP id
 ffacd0b85a97d-3b60dd8df46mr2367218f8f.52.1752674214534; 
 Wed, 16 Jul 2025 06:56:54 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd15bfsm18252140f8f.19.2025.07.16.06.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 06:56:54 -0700 (PDT)
Date: Wed, 16 Jul 2025 09:56:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: jiang.peng9@zte.com.cn
Cc: jasowang@redhat.com, krzk@kernel.org, xuanzhuo@linux.alibaba.com,
 eperezma@redhat.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, xu.xin16@zte.com.cn,
 yang.yang29@zte.com.cn
Subject: Re: [PATCH v2] virtio: Update kerneldoc in
 drivers/virtio/virtio_dma_buf.c
Message-ID: <20250716095046-mutt-send-email-mst@kernel.org>
References: <20250705105803198ff11jYCkg1TxntcCEb00R@zte.com.cn>
MIME-Version: 1.0
In-Reply-To: <20250705105803198ff11jYCkg1TxntcCEb00R@zte.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w2O4aKI00s9KQSX3qZrG4rkx_d5pnE10w-YFDRWyxG0_1752674215
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Sat, Jul 05, 2025 at 10:58:03AM +0800, jiang.peng9@zte.com.cn wrote:
> From: Peng Jiang <jiang.peng9@zte.com.cn>
> 
> Fix kernel-doc descriptions in virtio_dma_buf.c to fix W=1 warnings:
> 
> drivers/virtio/virtio_dma_buf.c:41 function parameter 'dma_buf' not described in 'virtio_dma_buf_attach'
> drivers/virtio/virtio_dma_buf.c:41 function parameter 'attach' not described in 'virtio_dma_buf_attach'
> 
> Signed-off-by: Peng Jiang <jiang.peng9@zte.com.cn>


The extra documentation unfortunately just mechanically repeats what the
code does. Code comments should explain the reasoning behind the code,
instead.


> ---
>  drivers/virtio/virtio_dma_buf.c | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
> index 3fe1d03b0645..0b39b1b209ee 100644
> --- a/drivers/virtio/virtio_dma_buf.c
> +++ b/drivers/virtio/virtio_dma_buf.c
> @@ -9,13 +9,20 @@
>  #include <linux/virtio_dma_buf.h>
> 
>  /**
> - * virtio_dma_buf_export - Creates a new dma-buf for a virtio exported object
> + * virtio_dma_buf_export() - Creates a new dma-buf for a virtio exported object

virtio core uses the form without () consistently, everywhere.



>   * @exp_info: [in] see dma_buf_export(). ops MUST refer to a dma_buf_ops
>   *     struct embedded in a virtio_dma_buf_ops.
>   *
>   * This wraps dma_buf_export() to allow virtio drivers to create a dma-buf
>   * for an virtio exported object that can be queried by other virtio drivers
>   * for the object's UUID.
> + *
> + * Returns:
> + *   - Valid struct dma_buf pointer on success
> + *   - ERR_PTR(-EINVAL) if:
> + *     - exp_info->ops is NULL
> + *     - attach callback isn't virtio_dma_buf_attach()
> + *     - virtio_ops->get_uuid() is not implemented

Too verbose, no one will rememeber to update this when changing code.
Just 
	Returns the dma_buf or ERR_PTR

is enough.


>   */
>  struct dma_buf *virtio_dma_buf_export
>         (const struct dma_buf_export_info *exp_info)
> @@ -35,7 +42,16 @@ struct dma_buf *virtio_dma_buf_export
>  EXPORT_SYMBOL(virtio_dma_buf_export);
> 
>  /**
> - * virtio_dma_buf_attach - mandatory attach callback for virtio dma-bufs
> + * virtio_dma_buf_attach() - Mandatory attach callback for virtio dma-bufs
> + * @dma_buf: Pointer to the shared dma-buf structure
> + * @attach: Pointer to the newly created attachment metadata
> + *
> + * Implements the standard dma-buf attach operation for virtio devices.
> + * Retrieves virtio-specific operations through container_of macro,
> + * then invokes device-specific attach callback if present.
> + * This enables virtio devices to participate in dma-buf sharing.
> + *

Same thing pls do not repeat all of code.

> + * Return: 0 on success, error code on failure

we say "Returns zero or a negative error" elsewhere. seems clearer.

>   */
>  int virtio_dma_buf_attach(struct dma_buf *dma_buf,
>                           struct dma_buf_attachment *attach)
> @@ -55,8 +71,12 @@ int virtio_dma_buf_attach(struct dma_buf *dma_buf,
>  EXPORT_SYMBOL(virtio_dma_buf_attach);
> 
>  /**
> - * is_virtio_dma_buf - returns true if the given dma-buf is a virtio dma-buf
> - * @dma_buf: buffer to query
> + * is_virtio_dma_buf() - Check if a dma-buf was created by virtio DMA framework
> + * @dma_buf: [in] buffer to query
> + *
> + * Returns:
> + *   - true  if the dma-buf uses virtio_dma_buf_attach() as its attach callback
> + *   - false otherwise


one is return one is returns ... no consistency.

>   */
>  bool is_virtio_dma_buf(struct dma_buf *dma_buf)
>  {
> @@ -65,7 +85,7 @@ bool is_virtio_dma_buf(struct dma_buf *dma_buf)
>  EXPORT_SYMBOL(is_virtio_dma_buf);
> 
>  /**
> - * virtio_dma_buf_get_uuid - gets a virtio dma-buf's exported object's uuid
> + * virtio_dma_buf_get_uuid() - gets a virtio dma-buf's exported object's uuid
>   * @dma_buf: [in] buffer to query
>   * @uuid: [out] the uuid
>   *
> -- 
> 2.25.1

