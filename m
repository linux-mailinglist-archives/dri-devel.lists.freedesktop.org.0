Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E04F46194B2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 11:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585F510E72E;
	Fri,  4 Nov 2022 10:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C0F10E0D6
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 10:42:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A3AE0B82C7A;
 Fri,  4 Nov 2022 10:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17ED7C433C1;
 Fri,  4 Nov 2022 10:42:24 +0000 (UTC)
Message-ID: <bd50df70-1a8b-08c4-1ad1-f9b23a77c1df@xs4all.nl>
Date: Fri, 4 Nov 2022 11:42:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 3/3] media: videobuf2: set dma_coherent flag for DMA-buf
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
 sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <20221020121316.3946-4-christian.koenig@amd.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20221020121316.3946-4-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 20/10/2022 14:13, Christian König wrote:
> When a device is snooping the CPU cache we assume that all importers
> must snoop the CPU cache as well.
> 
> Execpt for vmalloc allocations since those implement mmap() imports must
> always snoop the cache or we will run into coherency problems.

Looks reasonable.

For this series:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 2 ++
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 2 ++
>  drivers/media/common/videobuf2/videobuf2-vmalloc.c    | 1 +
>  3 files changed, 5 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 555bd40fa472..57433310c55c 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -11,6 +11,7 @@
>   */
>  
>  #include <linux/dma-buf.h>
> +#include <linux/dma-map-ops.h>
>  #include <linux/module.h>
>  #include <linux/refcount.h>
>  #include <linux/scatterlist.h>
> @@ -507,6 +508,7 @@ static struct dma_buf *vb2_dc_get_dmabuf(struct vb2_buffer *vb,
>  	exp_info.size = buf->size;
>  	exp_info.flags = flags;
>  	exp_info.priv = buf;
> +	exp_info.coherent = dev_is_dma_coherent(vb->vb2_queue->dev);
>  
>  	if (!buf->sgt_base)
>  		buf->sgt_base = vb2_dc_get_base_sgt(buf);
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 36981a5b5c53..dbdd753e4a39 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -10,6 +10,7 @@
>   * the Free Software Foundation.
>   */
>  
> +#include <linux/dma-map-ops.h>
>  #include <linux/module.h>
>  #include <linux/mm.h>
>  #include <linux/refcount.h>
> @@ -522,6 +523,7 @@ static struct dma_buf *vb2_dma_sg_get_dmabuf(struct vb2_buffer *vb,
>  	exp_info.size = buf->size;
>  	exp_info.flags = flags;
>  	exp_info.priv = buf;
> +	exp_info.coherent = dev_is_dma_coherent(vb->vb2_queue->dev);
>  
>  	if (WARN_ON(!buf->dma_sgt))
>  		return NULL;
> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> index 41db707e43a4..0b6874733e86 100644
> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> @@ -341,6 +341,7 @@ static struct dma_buf *vb2_vmalloc_get_dmabuf(struct vb2_buffer *vb,
>  	exp_info.size = buf->size;
>  	exp_info.flags = flags;
>  	exp_info.priv = buf;
> +	exp_info.coherent = true;
>  
>  	if (WARN_ON(!buf->vaddr))
>  		return NULL;

