Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9E9A86590
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 20:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE4A10EC53;
	Fri, 11 Apr 2025 18:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="hO7NEx5u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6336210EC53
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 18:34:39 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7c56a3def84so210969185a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 11:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744396478; x=1745001278;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=N0AWpw5PkEqx4rxzE4AWKI4Octup9SsapRwIoW5iY7A=;
 b=hO7NEx5uRBIoGD45ho1cy4De8UoZAY4pu4Vl0UBZRzn7kZGSDHFuL45wpVJ3XCGflV
 SzE8gV/teXXyTiD74tBqmuBT3DfeaJWpMAEGXiC6Nf6OnMjceq2BlA8WYy2lKtVW1Lc7
 M8viP3aYFBGFFj65AexyTjJrcA6YoCkA6FaOoQtMuKwJ7jc+DEYgGiqFPbMZuERnJqhJ
 Mp5WYVezMqf1tdIpAehYnF+i2d774ZMCeTSW6gDXbsaofGTH4M+yCd7gceHFcMoJOoNU
 sKgX4MF+Jbm5p83hii5OlSzNZQarTJv5HIAdICcJVDHPoWCg/Dv6bXwg1TxR28BVbIOG
 Yrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744396478; x=1745001278;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N0AWpw5PkEqx4rxzE4AWKI4Octup9SsapRwIoW5iY7A=;
 b=svmN4L/CWSiLv+Uk15HwlwaWuxfshZ2qeHztx5BPG68P+qnHhr41mnLFlWXjoVsDxf
 oysxOx1c77q8mgKuoOPDiTlDBEdSFfhBNcx6zv+jvKy+k8X0YgjaQX1fKPTPkraXQZfP
 u8/lb2LVv8XjkbYpWjZv559AKi2QrHibu8h9aPWAABOV/1ysO10QA0WYtlZ+BPFjOnPp
 LEguN2zKgO4P45AUo9U8U1BZTtws71ILXK4g9EldxuVLH/T8z+wD+GOB2pqsOWneNpkO
 y1UhCvGe2DMp7lAmX6HNrA1KxlakY9x1eDhkHMCW3DRpNoM2+rXB+pmYIbxKo7D95nbm
 07Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjxBpMBBJORAixk3H53ELaNnVrzVKMxVuo9JLgsEHj/QsyssMiyXZJdL1ig532KtOPQOzsx7KNRmc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrF6zEIQ3JjaPz2t4I9D7mtNB6BZ2G9ocIVbtoVxcohiwtC0GB
 G33UEetSAOBMFjGX8cRexSGcqirBiqZH5qpYt6Q3Ch87infkdGa/sqmbrkZM8+0=
X-Gm-Gg: ASbGncusMEfLqA/LowgdD3EFFe6Ur7qXuL2h1JY8Ld73CM0Sa8oP/J4btLUtqZOfV/a
 F0LOMXFvvVlw4nvjzYhoLDyV7Kn5yvoW9BKhTXzwNgcOO+MgltQZJHnRBaYOmxvo9xwywiWVWRB
 5TBaATWbRThs5jZAN5taONRjbUvSrcok84Dny9xdbUO/dnz6RcN/5J50aPog0/S2H5PdonL2oo+
 Zg9LU8fPCkC4T9Lw7wbPHx4ivgpifNGNKXd1cIKRqt4As5CBRKSE5jeKnwezU6jMxvlxbRnVVmc
 BxcradyV1AUNSSNpXO5LIAbPngH8eF6rVrZ8liGUhmkRjg==
X-Google-Smtp-Source: AGHT+IFdO0dOsTvQQgEwYJzn7H07oQLyZuXyp8SlGmVZfE23qvHiI5+GWs8xrNT3RdytwsmGS6VF0w==
X-Received: by 2002:a05:620a:4694:b0:7c7:95ee:77bf with SMTP id
 af79cd13be357-7c7af0ce3bbmr510403485a.19.1744396478456; 
 Fri, 11 Apr 2025 11:34:38 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4796edd3e7fsm29533341cf.81.2025.04.11.11.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 11:34:37 -0700 (PDT)
Message-ID: <d19639fb0fbe5c0992a69d7783e6fad91c50561b.camel@ndufresne.ca>
Subject: Re: [PATCH 2/3] dma-buf: Add DMA_BUF_IOCTL_GET_DMA_ADDR
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>, Sumit Semwal	
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Date: Fri, 11 Apr 2025 14:34:37 -0400
In-Reply-To: <20250410-uio-dma-v1-2-6468ace2c786@bootlin.com>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
 <20250410-uio-dma-v1-2-6468ace2c786@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
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

Hi Bastien,

Le jeudi 10 avril 2025 =C3=A0 16:53 +0200, Bastien Curutchet a =C3=A9crit=
=C2=A0:
> There is no way to transmit the DMA address of a buffer to userspace.
> Some UIO users need this to handle DMA from userspace.

To me this API is against all safe practice we've been pushing forward
and has no place in DMA_BUF API.

If this is fine for the UIO subsystem to pass around physicial
addresses, then make this part of the UIO device ioctl.

regards,
Nicolas

>=20
> Add a new dma_buf_ops operation that returns the DMA address.
> Add a new ioctl to transmit this DMA address to userspace.
>=20
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
> ---
> =C2=A0drivers/dma-buf/dma-buf.c=C2=A0=C2=A0=C2=A0 | 21 ++++++++++++++++++=
+++
> =C2=A0include/linux/dma-buf.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0include/uapi/linux/dma-buf.h |=C2=A0 1 +
> =C2=A03 files changed, 23 insertions(+)
>=20
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index
> 398418bd9731ad7a3a1f12eaea6a155fa77a22fe..cbbb518981e54e50f479c3d1fcf
> 6da6971f639c1 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -454,6 +454,24 @@ static long dma_buf_import_sync_file(struct
> dma_buf *dmabuf,
> =C2=A0}
> =C2=A0#endif
> =C2=A0
> +static int dma_buf_get_dma_addr(struct dma_buf *dmabuf, u64 __user
> *arg)
> +{
> +	u64 addr;
> +	int ret;
> +
> +	if (!dmabuf->ops->get_dma_addr)
> +		return -EINVAL;
> +
> +	ret =3D dmabuf->ops->get_dma_addr(dmabuf, &addr);
> +	if (ret)
> +		return ret;
> +
> +	if (copy_to_user(arg, &addr, sizeof(u64)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> =C2=A0static long dma_buf_ioctl(struct file *file,
> =C2=A0			=C2=A0 unsigned int cmd, unsigned long arg)
> =C2=A0{
> @@ -504,6 +522,9 @@ static long dma_buf_ioctl(struct file *file,
> =C2=A0		return dma_buf_import_sync_file(dmabuf, (const void
> __user *)arg);
> =C2=A0#endif
> =C2=A0
> +	case DMA_BUF_IOCTL_GET_DMA_ADDR:
> +		return dma_buf_get_dma_addr(dmabuf, (u64 __user
> *)arg);
> +
> =C2=A0	default:
> =C2=A0		return -ENOTTY;
> =C2=A0	}
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index
> 36216d28d8bdc01a9c9c47e27c392413f7f6c5fb..ed4bf15d3ce82e7a86323fff459
> 699a9bc8baa3b 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -285,6 +285,7 @@ struct dma_buf_ops {
> =C2=A0
> =C2=A0	int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
> =C2=A0	void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map
> *map);
> +	int (*get_dma_addr)(struct dma_buf *dmabuf, u64 *addr);
> =C2=A0};
> =C2=A0
> =C2=A0/**
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-
> buf.h
> index
> 5a6fda66d9adf01438619e7e67fa69f0fec2d88d..f3aba46942042de6a2e3a4cca3e
> b3f87175e29c9 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -178,5 +178,6 @@ struct dma_buf_import_sync_file {
> =C2=A0#define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, __u64)
> =C2=A0#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2,
> struct dma_buf_export_sync_file)
> =C2=A0#define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct
> dma_buf_import_sync_file)
> +#define DMA_BUF_IOCTL_GET_DMA_ADDR	_IOR(DMA_BUF_BASE, 4, __u64
> *)
> =C2=A0
> =C2=A0#endif
