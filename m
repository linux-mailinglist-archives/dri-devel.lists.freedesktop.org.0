Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A07DBB2BBC
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 09:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C826A10E7A3;
	Thu,  2 Oct 2025 07:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Feo45RUn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122C610E7A3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 07:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759391265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CgVDpIUaXbRIFaGTvmSsiE/BFfaSBmSlnmsfDON0gMA=;
 b=Feo45RUn5sJEzBNX3IBbDb+Dn/lix3vmjA9pySojguy1Xop7mYMj2yN/yH3iotbrD+CLYp
 KGKsRwvEd4Lw8k6ChnnJZA74ttDxHnRzWI28FdehjaPQkR8S0uJL1q89R9wmOL2g8sdXq9
 L2gGBuYL8nIrR5OUBrVPlz6Rs27zsfM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-LfpmtGpsPfGCqo9OAgj6rw-1; Thu, 02 Oct 2025 03:47:43 -0400
X-MC-Unique: LfpmtGpsPfGCqo9OAgj6rw-1
X-Mimecast-MFC-AGG-ID: LfpmtGpsPfGCqo9OAgj6rw_1759391262
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-4255d025f41so414237f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 00:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759391262; x=1759996062;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CgVDpIUaXbRIFaGTvmSsiE/BFfaSBmSlnmsfDON0gMA=;
 b=awoyBm4RKJlGDzp0zgR5unlpemsONkSyoskUvYC5xx21eP6fKH9meuYWE9p6QObhNy
 jNxgboAy8973lqKFkhR6q0bCB+FQAG8HHf7hNHptU7pQAYsXBZbYd9/KrWxDD11yzp4b
 8O3raqz26Is53O17Qga4Dp60zt8BS7fNiqeo8iRBKgjSYF/sHWAOrAZr3sNGV2aCg/oe
 0LOZItkx9qaliLa6nU4MVoqlIesHJ60Hu9aB3HYyKCeFs3fBEMeaHMhtrByQUJ0JTp/3
 7QGGY+Bsj5/2K54blUsRQJH/Ku4p3Nh3FB2hhufLsTCGX2yVPNy2Q57ZejuTU2g6uxcx
 cN2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/Mi4wfUDb4EDP851GTYDuLtKNIvgeWA2Bww0IJjUol5AOtrBC5CakDy0APZvOG0Zi3jG1saBVVV8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1lR5dXdSEdHiQGRywxuQj1l6X21TcnnL6rgGYhp3+u2sfOp0P
 0tAAmjYNEwiE5wCV7OdnKSdfs55rdal15jMDFD310QrEjS3hR2j3AqjEEXMw7Q+GAkQhhc4NNZ2
 p5XRUjThsHkFcewRsI+5K5QoPb20XUu96TajpjYc5b2OLCMsyt0HsqIV6u0390/sl9NPpdA==
X-Gm-Gg: ASbGncvgn2PGSFa4ICG/dw1ShPq6dPob4qQELndWPwKhKr4TDRikwl3MJRlrtsiCeF3
 LZfJj6AxohCsu8vGy/zoLmbwAMYdmnoOlzjto8p5+Hm04sq4xtqJuwbgJPS7J55zvu0Vl14DtCd
 mzrRf3B2DyCBvvOKRm1wP6qdwNGFyRLaTETGI84ZrPKNI3246A3G4CDiQ4QbEB50qLqD2WY+sW9
 QM++i45ks1T4mjCaR+bX/f0fE7qwerwTePH34IBwjRS1u5BXqwK9SPiGT/0RuU4zk8CWsnuLyl0
 6WVti0jyENQjS2z02Eudqg==
X-Received: by 2002:a05:6000:615:b0:3eb:4e88:585 with SMTP id
 ffacd0b85a97d-4255780bf79mr4246074f8f.29.1759391262079; 
 Thu, 02 Oct 2025 00:47:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP/KnwbkkSVeQQvgR4f/j6yP7T3XyqaNDmBwlBCTQIJSAplcQo89U5KExVEQ0LiNnNhN8Wxw==
X-Received: by 2002:a05:6000:615:b0:3eb:4e88:585 with SMTP id
 ffacd0b85a97d-4255780bf79mr4246043f8f.29.1759391261558; 
 Thu, 02 Oct 2025 00:47:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6b5csm2470879f8f.5.2025.10.02.00.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 00:47:41 -0700 (PDT)
Date: Thu, 2 Oct 2025 09:47:40 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, 
 linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v12 2/9] dma-buf: dma-heap: export declared functions
Message-ID: <20251002-shaggy-mastiff-of-elevation-c8e1f0@houat>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
 <20250911135007.1275833-3-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="gqzh2ah3mmdu76ac"
Content-Disposition: inline
In-Reply-To: <20250911135007.1275833-3-jens.wiklander@linaro.org>
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


--gqzh2ah3mmdu76ac
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v12 2/9] dma-buf: dma-heap: export declared functions
MIME-Version: 1.0

Hi,

On Thu, Sep 11, 2025 at 03:49:43PM +0200, Jens Wiklander wrote:
> Export the dma-buf heap functions to allow them to be used by the OP-TEE
> driver. The OP-TEE driver wants to register and manage specific secure
> DMA heaps with it.
>=20
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>
> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/dma-buf/dma-heap.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 3cbe87d4a464..8ab49924f8b7 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -11,6 +11,7 @@
>  #include <linux/dma-buf.h>
>  #include <linux/dma-heap.h>
>  #include <linux/err.h>
> +#include <linux/export.h>
>  #include <linux/list.h>
>  #include <linux/nospec.h>
>  #include <linux/syscalls.h>
> @@ -202,6 +203,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
>  {
>  	return heap->priv;
>  }
> +EXPORT_SYMBOL_NS_GPL(dma_heap_get_drvdata, "DMA_BUF_HEAP");
> =20
>  /**
>   * dma_heap_get_name - get heap name
> @@ -214,6 +216,7 @@ const char *dma_heap_get_name(struct dma_heap *heap)
>  {
>  	return heap->name;
>  }
> +EXPORT_SYMBOL_NS_GPL(dma_heap_get_name, "DMA_BUF_HEAP");
> =20
>  /**
>   * dma_heap_add - adds a heap to dmabuf heaps
> @@ -303,6 +306,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_e=
xport_info *exp_info)
>  	kfree(heap);
>  	return err_ret;
>  }
> +EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");

It's not clear to me why we would need to export those symbols.

As far as I know, heaps cannot be removed, and compiling them as module
means that we would be able to remove them.

Now, if we don't expect the users to be compiled as modules, then we
don't need to export these symbols at all.

Am I missing something?

Maxime

--gqzh2ah3mmdu76ac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaN4uFwAKCRAnX84Zoj2+
dgXFAYCRqMeTP57unkLdOGOydUleXNO4Hyw5XxsQDOrGvzMhBXOO+wkmNxAyspbp
Ufq67PMBfjTtOUKXQIyMWncxOakNOIj4KKpCcpuXU8G+m0dpGkCeFoK4Z85nhhK9
lbC1byfHEQ==
=wMRm
-----END PGP SIGNATURE-----

--gqzh2ah3mmdu76ac--

