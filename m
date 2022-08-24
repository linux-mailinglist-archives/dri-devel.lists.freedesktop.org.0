Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D2559F7DA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 12:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E0610E1B1;
	Wed, 24 Aug 2022 10:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F50410E1B1;
 Wed, 24 Aug 2022 10:32:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7843BB8239B;
 Wed, 24 Aug 2022 10:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52C3C433C1;
 Wed, 24 Aug 2022 10:32:35 +0000 (UTC)
Message-ID: <0609dbe4-5596-ee9d-abeb-3c126e7ba755@xs4all.nl>
Date: Wed, 24 Aug 2022 12:32:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 8/9] media: videobuf2: Stop using internal dma-buf lock
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Qiang Yu <yuq825@gmail.com>
References: <20220824102248.91964-1-dmitry.osipenko@collabora.com>
 <20220824102248.91964-9-dmitry.osipenko@collabora.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220824102248.91964-9-dmitry.osipenko@collabora.com>
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
Cc: lima@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nice!

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

On 24/08/2022 12:22, Dmitry Osipenko wrote:
> All drivers that use dma-bufs have been moved to the updated locking
> specification and now dma-buf reservation is guaranteed to be locked
> by importers during the mapping operations. There is no need to take
> the internal dma-buf lock anymore. Remove locking from the videobuf2
> memory allocators.
> 
> Acked-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 11 +----------
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 11 +----------
>  drivers/media/common/videobuf2/videobuf2-vmalloc.c    | 11 +----------
>  3 files changed, 3 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index de762dbdaf78..2c69bf0470e7 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -382,18 +382,12 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
>  	struct dma_buf_attachment *db_attach, enum dma_data_direction dma_dir)
>  {
>  	struct vb2_dc_attachment *attach = db_attach->priv;
> -	/* stealing dmabuf mutex to serialize map/unmap operations */
> -	struct mutex *lock = &db_attach->dmabuf->lock;
>  	struct sg_table *sgt;
>  
> -	mutex_lock(lock);
> -
>  	sgt = &attach->sgt;
>  	/* return previously mapped sg table */
> -	if (attach->dma_dir == dma_dir) {
> -		mutex_unlock(lock);
> +	if (attach->dma_dir == dma_dir)
>  		return sgt;
> -	}
>  
>  	/* release any previous cache */
>  	if (attach->dma_dir != DMA_NONE) {
> @@ -409,14 +403,11 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
>  	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir,
>  			    DMA_ATTR_SKIP_CPU_SYNC)) {
>  		pr_err("failed to map scatterlist\n");
> -		mutex_unlock(lock);
>  		return ERR_PTR(-EIO);
>  	}
>  
>  	attach->dma_dir = dma_dir;
>  
> -	mutex_unlock(lock);
> -
>  	return sgt;
>  }
>  
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 39e11600304a..e63e718c0bf7 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -424,18 +424,12 @@ static struct sg_table *vb2_dma_sg_dmabuf_ops_map(
>  	struct dma_buf_attachment *db_attach, enum dma_data_direction dma_dir)
>  {
>  	struct vb2_dma_sg_attachment *attach = db_attach->priv;
> -	/* stealing dmabuf mutex to serialize map/unmap operations */
> -	struct mutex *lock = &db_attach->dmabuf->lock;
>  	struct sg_table *sgt;
>  
> -	mutex_lock(lock);
> -
>  	sgt = &attach->sgt;
>  	/* return previously mapped sg table */
> -	if (attach->dma_dir == dma_dir) {
> -		mutex_unlock(lock);
> +	if (attach->dma_dir == dma_dir)
>  		return sgt;
> -	}
>  
>  	/* release any previous cache */
>  	if (attach->dma_dir != DMA_NONE) {
> @@ -446,14 +440,11 @@ static struct sg_table *vb2_dma_sg_dmabuf_ops_map(
>  	/* mapping to the client with new direction */
>  	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir, 0)) {
>  		pr_err("failed to map scatterlist\n");
> -		mutex_unlock(lock);
>  		return ERR_PTR(-EIO);
>  	}
>  
>  	attach->dma_dir = dma_dir;
>  
> -	mutex_unlock(lock);
> -
>  	return sgt;
>  }
>  
> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> index 7831bf545874..41db707e43a4 100644
> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> @@ -267,18 +267,12 @@ static struct sg_table *vb2_vmalloc_dmabuf_ops_map(
>  	struct dma_buf_attachment *db_attach, enum dma_data_direction dma_dir)
>  {
>  	struct vb2_vmalloc_attachment *attach = db_attach->priv;
> -	/* stealing dmabuf mutex to serialize map/unmap operations */
> -	struct mutex *lock = &db_attach->dmabuf->lock;
>  	struct sg_table *sgt;
>  
> -	mutex_lock(lock);
> -
>  	sgt = &attach->sgt;
>  	/* return previously mapped sg table */
> -	if (attach->dma_dir == dma_dir) {
> -		mutex_unlock(lock);
> +	if (attach->dma_dir == dma_dir)
>  		return sgt;
> -	}
>  
>  	/* release any previous cache */
>  	if (attach->dma_dir != DMA_NONE) {
> @@ -289,14 +283,11 @@ static struct sg_table *vb2_vmalloc_dmabuf_ops_map(
>  	/* mapping to the client with new direction */
>  	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir, 0)) {
>  		pr_err("failed to map scatterlist\n");
> -		mutex_unlock(lock);
>  		return ERR_PTR(-EIO);
>  	}
>  
>  	attach->dma_dir = dma_dir;
>  
> -	mutex_unlock(lock);
> -
>  	return sgt;
>  }
>  
