Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8DBB08480
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 08:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C6010E302;
	Thu, 17 Jul 2025 06:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JXSP8YNo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4B110E302
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 06:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752732277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tUkb4nCGAHcNyByaHU5iCpVWleaJyNw90ZAtHNo4HkE=;
 b=JXSP8YNo+m+8ITdVBAnBAa6UYBcS6tBAsn1hFa5PjIq2PsdPVmS3FuPRzCYinuj+biQ2P7
 O7N2WxA8y6SBRa23a95nCwz5q465KEzGNRDKr/GwV5BYDYeqmgnm9/1HMdarGF2dUoSgPX
 hd/EKrpK6NuYmXVMlsUG4sfowDS7sTM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-z20Rgs30P0yAozfoXw9fRg-1; Thu, 17 Jul 2025 02:04:35 -0400
X-MC-Unique: z20Rgs30P0yAozfoXw9fRg-1
X-Mimecast-MFC-AGG-ID: z20Rgs30P0yAozfoXw9fRg_1752732275
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-455f79a2a16so5254025e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 23:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752732275; x=1753337075;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tUkb4nCGAHcNyByaHU5iCpVWleaJyNw90ZAtHNo4HkE=;
 b=nHPGKkFuzlHMwJ8ognrerZRSm23ghsbzUjYjf9cOJPdWWT7r1TbUJtndguxGpBriTC
 e6nJ8QpbSDMDTZo45ym2SLNGENx7+cTuqLjsBVZZETge9bYg0RFVOtu/ZYYBRlb33q1r
 gTdPFqh2zMecFmybcgsGVBQUJHkn5Dz+4Ppd3B65/6Pf1dntYePL55n0l40MH9ZNPmLH
 Z7GY1h6PCn/3abm+ta9V0rc6atlDZZsJMH0XWMB5nDGW+/3qNM/CUFALdc1bGMj1vfyc
 1/Rri6riyzKR2YILVfLccUfPq46GC39FYS1hCpRSn/tMrG7ey6cPwrFqaC3r/1W4SqSc
 iiDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHRvKW5FXmlYgMma4VCGOYKRj5elh2j5PNMWBntFsw7Xn1m1KX8+zcqDLm81v5ZxUJHL/ud47GQ3A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweZfwMRCWF0+JplTAOQSOxj9f1LllKrdIdcve5m0kVkJrBnx90
 kwG7GRT9xXQqc9+qk7HZ8UWJl9qeinPKFufwVqQ+A7MBb5hrRWjbIpbiT6HW1+1DQwNYIQK0DKp
 QgV/ATO521JJ7abiNgUlwOPCLIq1DXVtXxdhPpoiDTZTibR6A5IGaDATimVnZnPiRNt9BAQ==
X-Gm-Gg: ASbGncsqLg/rxbtxwVgIXZ1bhvgqlwthDDGlEWeBZ4nzq7ge5uVHcB3A59396SCYbYA
 eVYkXqqcARQyQLd7EGE0U5LpqWM5z0NpMDUrgTVYbNLFsCgTeEKLqEmO06IvxlDgWfwosTbg82z
 Ofc0P5rUuH/HP/VtavNyZseHo7QH9qSnONVxJA3Dh4Ub6wEA1IFi93nqk6pxwW+p6pAexOn1sPx
 wmmTVzI0ZB5KBH5z/eKV2TCVMe5TrZCMMedk9C7K+5wK59Aufvf5fdMyq4BQAsoTNDyzi6OxYB0
 y6Uc+eFiUtQL3U0AZ8hkThjakWUvVTo8
X-Received: by 2002:a05:600c:a55:b0:456:1442:854 with SMTP id
 5b1f17b1804b1-4562e28616amr46679135e9.24.1752732274624; 
 Wed, 16 Jul 2025 23:04:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjrUfFCvAdm/MUeAz0hpuBCDwLEyQ3RVRuTxAsQFHlPQhXRkgs7ZoZlJruFXtXCDIWxuHA8Q==
X-Received: by 2002:a05:600c:a55:b0:456:1442:854 with SMTP id
 5b1f17b1804b1-4562e28616amr46678735e9.24.1752732274082; 
 Wed, 16 Jul 2025 23:04:34 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45634f5ea01sm11589685e9.14.2025.07.16.23.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 23:04:33 -0700 (PDT)
Date: Thu, 17 Jul 2025 02:04:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: jiang.peng9@zte.com.cn
Cc: jasowang@redhat.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 xu.xin16@zte.com.cn, yang.yang29@zte.com.cn
Subject: Re: [PATCH v3] virtio: Update kerneldoc in
 drivers/virtio/virtio_dma_buf.c
Message-ID: <20250717015524-mutt-send-email-mst@kernel.org>
References: <202507171041593886W7pGra5n2hPMaT1j17NV@zte.com.cn>
MIME-Version: 1.0
In-Reply-To: <202507171041593886W7pGra5n2hPMaT1j17NV@zte.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _81U72n2vGtLxR0BWWMUs-D1xqvg2kSStaGlQhOGfxc_1752732275
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

On Thu, Jul 17, 2025 at 10:41:59AM +0800, jiang.peng9@zte.com.cn wrote:
> From: Peng Jiang <jiang.peng9@zte.com.cn>
> 
> Fix kernel-doc descriptions in virtio_dma_buf.c to fix W=1 warnings:
> 
> drivers/virtio/virtio_dma_buf.c:41 function parameter 'dma_buf' not described in 'virtio_dma_buf_attach'
> drivers/virtio/virtio_dma_buf.c:41 function parameter 'attach' not described in 'virtio_dma_buf_attach'
> 
> Signed-off-by: Peng Jiang <jiang.peng9@zte.com.cn>
> ---
>  drivers/virtio/virtio_dma_buf.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
> index 3fe1d03b0645..986cc73c503f 100644
> --- a/drivers/virtio/virtio_dma_buf.c
> +++ b/drivers/virtio/virtio_dma_buf.c
> @@ -16,6 +16,8 @@
>   * This wraps dma_buf_export() to allow virtio drivers to create a dma-buf
>   * for an virtio exported object that can be queried by other virtio drivers
>   * for the object's UUID.
> + *
> + * Returns: dma-buf pointer on success, ERR_PTR on failure.

Most people write "dmabuf".


>   */
>  struct dma_buf *virtio_dma_buf_export
>         (const struct dma_buf_export_info *exp_info)
> @@ -36,6 +38,14 @@ EXPORT_SYMBOL(virtio_dma_buf_export);
> 
>  /**
>   * virtio_dma_buf_attach - mandatory attach callback for virtio dma-bufs
> + * @dma_buf: DMA buffer being attached to a device

And here it's different for some reason.

> + * @attach: Attachment metadata for the device-dma_buf association

and here in a third form.

> + *
> + * Allows virtio devices to perform device-specific setup when a DMA buffer
> + * is attached to a device. This is part of the DMA-BUF sharing mechanism
> + * that enables virtio devices to interoperate with other subsystems.

I'm sorry this is just empty of content.
I can not shake the feeling this is AI written.
If we wanted AI to document all APIs in this way, I'd just script it.

> + *
> + * Returns: 0 on success, negative on failure.

This one is ok.

>   */
>  int virtio_dma_buf_attach(struct dma_buf *dma_buf,
>                           struct dma_buf_attachment *attach)
> -- 
> 2.25.1

