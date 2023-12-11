Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6243080C77D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 11:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD0F10E39F;
	Mon, 11 Dec 2023 10:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AACD10E39F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 10:58:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8DDBB611A7;
 Mon, 11 Dec 2023 10:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9F0C433C7;
 Mon, 11 Dec 2023 10:58:38 +0000 (UTC)
Message-ID: <705ce6b0-e945-404c-8014-38881a01fbca@xs4all.nl>
Date: Mon, 11 Dec 2023 11:58:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3,03/21] v4l2: verify secure dmabufs are used in secure
 queue
Content-Language: en-US, nl
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
References: <20231206081538.17056-1-yunfei.dong@mediatek.com>
 <20231206081538.17056-4-yunfei.dong@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231206081538.17056-4-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Steve Cho <stevecho@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Matthias Brugger <matthias.bgg@gmail.com>, John Stultz <jstultz@google.com>,
 linux-arm-kernel@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, linux-mediatek@lists.infradead.org,
 "T . J . Mercier" <tjmercier@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yong Wu <yong.wu@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/12/2023 09:15, Yunfei Dong wrote:
> From: Jeffrey Kardatzke <jkardatzke@google.com>
> 
> Verfies in the dmabuf implementations that if the secure memory flag is

Verfies -> Verifies

> set for a queue that the dmabuf submitted to the queue is unmappable.
> 
> Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 6 ++++++
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 6 ++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 3d4fd4ef5310..ad58ef8dc231 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -710,6 +710,12 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
>  		return -EINVAL;
>  	}
>  
> +	/* verify the dmabuf is secure if we are in secure mode */
> +	if (buf->vb->vb2_queue->secure_mem && sg_page(sgt->sgl)) {

This needs a bit more explanation. I guess that for secure memory
sg_page returns NULL?

> +		pr_err("secure queue requires secure dma_buf");
> +		return -EINVAL;
> +	}
> +
>  	/* checking if dmabuf is big enough to store contiguous chunk */
>  	contig_size = vb2_dc_get_contiguous_size(sgt);
>  	if (contig_size < buf->size) {
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 28f3fdfe23a2..55428c73c380 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -564,6 +564,12 @@ static int vb2_dma_sg_map_dmabuf(void *mem_priv)
>  		return -EINVAL;
>  	}
>  
> +	/* verify the dmabuf is secure if we are in secure mode */
> +	if (buf->vb->vb2_queue->secure_mem && !sg_dma_secure(sgt->sgl)) {

I can't find the sg_dma_secure function. I suspect this patch series
depends on another series?

> +		pr_err("secure queue requires secure dma_buf");
> +		return -EINVAL;
> +	}
> +
>  	buf->dma_sgt = sgt;
>  	buf->vaddr = NULL;
>  

Regards,

	Hans
