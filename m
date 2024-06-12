Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF764904A03
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 06:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F2310E777;
	Wed, 12 Jun 2024 04:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="gQ01xmf6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B10110E777
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 04:31:29 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-656d8b346d2so4625351a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 21:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718166689; x=1718771489;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=26yCayUAzc76t5ERK7B6b8gwpGmJll8Ij+c08Bg2GMU=;
 b=gQ01xmf65KPdSX1SlacqRrgbF4g14iIl12GYseztlpEqRAJHGa3IWJ7rEoQGxzqgnZ
 HohFbgWEqmTLpYHzLaVXbWG6JkTc2h2A2ckHlCTICAiX7d+kT3p56CH40CzbBrx2EPPD
 Ds00nKrRTc+llpR7ovX6DeWRQZemu6ZCNpa64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718166689; x=1718771489;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=26yCayUAzc76t5ERK7B6b8gwpGmJll8Ij+c08Bg2GMU=;
 b=WRsWnpFd7Zj1QeDaQuJkb2C8S/xRM8sqnCB9KoPig2715rWbXuSYJ0ftJV+cgjGfpg
 8CkEH5Awr8Ffyo+Oukr4irbLe1+6gsFkaGUjpxjFNUzwgiHtr4A3Z8dBp5ItTQxcuVPZ
 tgOQ4kTg6+uiuGX0gFQkLO1aSKqguTDwuafaC0UfZ/ttY1pFtdh63X/pkAzo7MX11cUN
 M/dNtjrSIzuKr/9Fr4Ar7jyP5q7aOydoIM3Ta6lqVFqv5oTK8F1IxZYH13IL4YNVKU9y
 wn1v+dwzaEk1LM4tAWOX6vLIyS0HeCJrMEEfuV/DSMqaiFBu7667UR/quCkSeJLdLgGW
 6lxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFD5xtZiij0fOS1/TQZ/Vj1PXRyJTyv/oIWtc6uxUX7mbpjHy27Nvcnkh1Q8SWCiQeKxoCfanibV55QQ7+mJIZgHURyRoNzheRbT2elF/Z
X-Gm-Message-State: AOJu0YxJWgvupboCvSvr4+/H7O/kvmxfPu+37hiF5f1gKGNNyQfJKwU1
 n/Q6209rvHtxbBx/JF9psn3lNKOMpSaraSJ69wfHimd+MTZJAW2xinLl1/UebA==
X-Google-Smtp-Source: AGHT+IEDNIroERFQYahAEyUp89r/l251ag7KXTZkZl5/HBfB+fwRsfZPqR83QoYb4oKa3SSk62X7hQ==
X-Received: by 2002:a05:6a21:81a2:b0:1b2:2e3e:42dd with SMTP id
 adf61e73a8af0-1b8a9be9bb0mr745623637.34.1718166688682; 
 Tue, 11 Jun 2024 21:31:28 -0700 (PDT)
Received: from chromium.org (174.71.80.34.bc.googleusercontent.com.
 [34.80.71.174]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f74179d0basm11631455ad.122.2024.06.11.21.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 21:31:28 -0700 (PDT)
Date: Wed, 12 Jun 2024 13:31:22 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Jeffrey Kardatzke <jkardatzke@google.com>, 
 =?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Yong Wu <yong.wu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
 Steve Cho <stevecho@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6,03/24] v4l2: verify restricted dmabufs are used in
 restricted queue
Message-ID: <rw6dkzasaz4lnvtmxkxlkxte5nvphpjixigjouvjkpctscpdla@bheblt7kmj4y>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-4-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516122102.16379-4-yunfei.dong@mediatek.com>
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

On Thu, May 16, 2024 at 08:20:41PM +0800, Yunfei Dong wrote:
> From: Jeffrey Kardatzke <jkardatzke@google.com>
> 
> Verfies in the dmabuf implementations that if the restricted memory
> flag is set for a queue that the dmabuf submitted to the queue is
> unmappable.
> 
> Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 8 ++++++++
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 8 ++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 3d4fd4ef5310..35a3c1c01eae 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -710,6 +710,14 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
>  		return -EINVAL;
>  	}
>  
> +	/* Verify the dmabuf is restricted if we are in restricted mode, this is done
> +	 * by validating there is no page entry for the dmabuf.
> +	 */

Kernel coding style [1] defines multi-line comments to start with an empty
line.

[1] https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting

> +	if (buf->vb->vb2_queue->restricted_mem && !sg_dma_is_restricted(sgt->sgl)) {
> +		pr_err("restricted queue requires restricted dma_buf");
> +		return -EINVAL;

This would leak the mapping. We need to unmap the attachment here.

> +	}
> +
>  	/* checking if dmabuf is big enough to store contiguous chunk */
>  	contig_size = vb2_dc_get_contiguous_size(sgt);
>  	if (contig_size < buf->size) {
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 6975a71d740f..2399a9c074ba 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -570,6 +570,14 @@ static int vb2_dma_sg_map_dmabuf(void *mem_priv)
>  		return -EINVAL;
>  	}
>  
> +	/* Verify the dmabuf is restricted if we are in restricted mode, this is done
> +	 * by validating there is no page entry for the dmabuf.
> +	 */

Ditto.

> +	if (buf->vb->vb2_queue->restricted_mem && !sg_dma_is_restricted(sgt->sgl)) {
> +		pr_err("restricted queue requires restricted dma_buf");
> +		return -EINVAL;

Ditto.

Best regards,
Tomasz

> +	}
> +
>  	buf->dma_sgt = sgt;
>  	buf->vaddr = NULL;
>  
> -- 
> 2.25.1
> 
