Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A947C8CD4C6
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 15:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F82E10E0E8;
	Thu, 23 May 2024 13:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TvMt8tQ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A17410E335
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 13:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716471157;
 bh=XeQz3w/hUWaPU3J2hnJbXUfOfb/MW7L/8XI55oK1Q1E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TvMt8tQ0na57JMSeUdhSEOtE6oFveOwVj7FLg6CwXMNVdAfTTwhvV+Eb3gvBybV76
 dGVQlH9w6nmCg6iD5BE6EG2hpE5IaiviT1BksksYMvdlAejEp6KEGNFlZgNDiIAjlt
 T0yFs7GqSboOLYKzVYPcrf5e2vFcmGuxMFeFAzurgsAyyLD77Ynyrurl9xueegZ4t5
 t9UQvSEh/2clybcLyje7HgASsmzPy36Lk5Iy/g20jKMPEx5dyYPb6J6uS0SSg4aHU1
 ue73Kn1VWRiqxh6GQ4ssEGB949Na/nswde1S5YmCTfbPaOfSteaYAgwqhJ+lvHtSD3
 g+ib9hYEVDyTQ==
Received: from [100.95.196.182] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: andrzej.p)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1918E37820E5;
 Thu, 23 May 2024 13:32:36 +0000 (UTC)
Message-ID: <1c219718-47fd-4671-a57c-8f057b7db431@collabora.com>
Date: Thu, 23 May 2024 15:32:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6, 23/24] media: mediatek: vcodec: support av1 svp decoder
 for mt8188
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-24-yunfei.dong@mediatek.com>
Content-Language: en-US
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20240516122102.16379-24-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yunfei and Xiaoyong,

W dniu 16.05.2024 o 14:21, Yunfei Dong pisze:
> From: Xiaoyong Lu <xiaoyong.lu@mediatek.com>
> 
> Change av1 driver to support secure video playback(svp) for
> mt8188. Need to map shared memory with optee interface and
> wait interrupt in optee-os.
> 
> Signed-off-by: Xiaoyong Lu <xiaoyong.lu@mediatek.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 97 ++++++++++++-------
>   1 file changed, 63 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
> index bf21f2467a0f..a3ad35df7f73 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
> @@ -58,6 +58,9 @@
>   #define SEG_LVL_ALT_Q 0
>   #define SECONDARY_FILTER_STRENGTH_NUM_BITS 2
>   
> +#define AV1_IQ_TABLE_SIZE	0x12200
> +#define AV1_CDF_TABLE_SIZE	0xFE80
> +
>   static const short div_lut[DIV_LUT_NUM + 1] = {
>   	16384, 16320, 16257, 16194, 16132, 16070, 16009, 15948, 15888, 15828, 15768,
>   	15709, 15650, 15592, 15534, 15477, 15420, 15364, 15308, 15252, 15197, 15142,
> @@ -641,6 +644,8 @@ struct vdec_av1_slice_fb {
>    * @frame:		current frame info
>    * @state:		status after decode done
>    * @cur_lst_tile_id:	tile id for large scale
> + * @tile_group:		tile group info
> + * @reservd:		reserved
>    */
>   struct vdec_av1_slice_vsi {
>   	/* lat */
> @@ -665,6 +670,8 @@ struct vdec_av1_slice_vsi {
>   	struct vdec_av1_slice_frame frame;
>   	struct vdec_av1_slice_state state;
>   	u32 cur_lst_tile_id;
> +	struct vdec_av1_slice_tile_group tile_group;
> +	unsigned int reservd[4];
>   };
>   
>   /**
> @@ -692,7 +699,6 @@ struct vdec_av1_slice_pfc {
>    * @cdf_temp:           cdf temp buffer
>    * @tile:               tile buffer
>    * @slots:              slots info
> - * @tile_group:         tile_group entry
>    * @level:              level of current resolution
>    * @width:              width of last picture
>    * @height:             height of last picture
> @@ -717,7 +723,6 @@ struct vdec_av1_slice_instance {
>   	struct mtk_vcodec_mem cdf_temp;
>   	struct mtk_vcodec_mem tile;
>   	struct vdec_av1_slice_slot slots;
> -	struct vdec_av1_slice_tile_group tile_group;
>   
>   	/* for resolution change and get_pic_info */
>   	enum vdec_av1_slice_resolution_level level;
> @@ -774,24 +779,28 @@ static int vdec_av1_slice_init_cdf_table(struct vdec_av1_slice_instance *instanc
>   
>   	ctx = instance->ctx;
>   	vsi = instance->vpu.vsi;
> -	remote_cdf_table = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> -						     (u32)vsi->cdf_table_addr);
> -	if (IS_ERR(remote_cdf_table)) {
> -		mtk_vdec_err(ctx, "failed to map cdf table\n");
> -		return PTR_ERR(remote_cdf_table);
> -	}
> -
> -	mtk_vdec_debug(ctx, "map cdf table to 0x%p\n", remote_cdf_table);
>   
>   	if (instance->cdf_table.va)
>   		mtk_vcodec_mem_free(ctx, &instance->cdf_table);
> +	vsi->cdf_table_size = AV1_CDF_TABLE_SIZE;
> +	mtk_vdec_debug(ctx, "svp %d. cdf table size 0x%x\n",
> +		       instance->ctx->is_secure_playback, vsi->cdf_table_size);
>   	instance->cdf_table.size = vsi->cdf_table_size;
>   
>   	ret = mtk_vcodec_mem_alloc(ctx, &instance->cdf_table);
>   	if (ret)
>   		return ret;
>   
> -	memcpy(instance->cdf_table.va, remote_cdf_table, vsi->cdf_table_size);
> +	if (!instance->ctx->is_secure_playback) {
> +		remote_cdf_table = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> +							     (u32)vsi->cdf_table_addr);
> +		if (IS_ERR(remote_cdf_table)) {
> +			mtk_vdec_err(ctx, "failed to map cdf table\n");
> +			return PTR_ERR(remote_cdf_table);
> +		}
> +
> +		memcpy(instance->cdf_table.va, remote_cdf_table, vsi->cdf_table_size);
> +	}
>   

In the original version mtk_vcodec_fw_map_dm_addr() is called before
mtk_vcodec_mem_alloc(), so if the former fails, the function terminates
early. After this patch is applied mtk_vcodec_mem_alloc() is called first and
when it is successful mtk_vcodec_fw_map_dm_addr() is called which may fail.
In case it fails maybe mtk_vcodec_mem_free() should be called before returning?

>   	return 0;
>   }
> @@ -805,25 +814,26 @@ static int vdec_av1_slice_init_iq_table(struct vdec_av1_slice_instance *instance
>   
>   	ctx = instance->ctx;
>   	vsi = instance->vpu.vsi;
> -	remote_iq_table = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> -						    (u32)vsi->iq_table_addr);
> -	if (IS_ERR(remote_iq_table)) {
> -		mtk_vdec_err(ctx, "failed to map iq table\n");
> -		return PTR_ERR(remote_iq_table);
> -	}
> -
> -	mtk_vdec_debug(ctx, "map iq table to 0x%p\n", remote_iq_table);
>   
>   	if (instance->iq_table.va)
>   		mtk_vcodec_mem_free(ctx, &instance->iq_table);
> +	vsi->iq_table_size = AV1_IQ_TABLE_SIZE;
>   	instance->iq_table.size = vsi->iq_table_size;
>   
>   	ret = mtk_vcodec_mem_alloc(ctx, &instance->iq_table);
>   	if (ret)
>   		return ret;
>   
> -	memcpy(instance->iq_table.va, remote_iq_table, vsi->iq_table_size);
> +	if (!instance->ctx->is_secure_playback) {
> +		remote_iq_table = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> +							    (u32)vsi->iq_table_addr);
> +		if (IS_ERR(remote_iq_table)) {
> +			mtk_vdec_err(ctx, "failed to map iq table\n");
> +			return PTR_ERR(remote_iq_table);
> +		}
>   
> +		memcpy(instance->iq_table.va, remote_iq_table, vsi->iq_table_size);
> +	}

The same comment as above applies.

Regards,

Andrzej

>   	return 0;
>   }
>   
> @@ -1388,7 +1398,7 @@ static int vdec_av1_slice_setup_tile_group(struct vdec_av1_slice_instance *insta
>   					   struct vdec_av1_slice_vsi *vsi)
>   {
>   	struct v4l2_ctrl_av1_tile_group_entry *ctrl_tge;
> -	struct vdec_av1_slice_tile_group *tile_group = &instance->tile_group;
> +	struct vdec_av1_slice_tile_group *tile_group = &vsi->tile_group;
>   	struct vdec_av1_slice_uncompressed_header *uh = &vsi->frame.uh;
>   	struct vdec_av1_slice_tile *tile = &uh->tile;
>   	struct v4l2_ctrl *ctrl;
> @@ -1629,7 +1639,9 @@ static void vdec_av1_slice_setup_lat_buffer(struct vdec_av1_slice_instance *inst
>   
>   	vsi->tile.buf = instance->tile.dma_addr;
>   	vsi->tile.size = instance->tile.size;
> -	memcpy(lat_buf->tile_addr.va, instance->tile.va, 64 * instance->tile_group.num_tiles);
> +	if (!instance->ctx->is_secure_playback)
> +		memcpy(lat_buf->tile_addr.va, instance->tile.va,
> +		       64 * vsi->tile_group.num_tiles);
>   
>   	vsi->cdf_table.buf = instance->cdf_table.dma_addr;
>   	vsi->cdf_table.size = instance->cdf_table.size;
> @@ -1646,7 +1658,7 @@ static void vdec_av1_slice_setup_seg_buffer(struct vdec_av1_slice_instance *inst
>   	/* reset segment buffer */
>   	if (uh->primary_ref_frame == AV1_PRIMARY_REF_NONE || !uh->seg.segmentation_enabled) {
>   		mtk_vdec_debug(instance->ctx, "reset seg %d\n", vsi->slot_id);
> -		if (vsi->slot_id != AV1_INVALID_IDX) {
> +		if (!instance->ctx->is_secure_playback && vsi->slot_id != AV1_INVALID_IDX) {
>   			buf = &instance->seg[vsi->slot_id];
>   			memset(buf->va, 0, buf->size);
>   		}
> @@ -1657,7 +1669,7 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
>   					     struct vdec_av1_slice_vsi *vsi,
>   					     struct mtk_vcodec_mem *bs)
>   {
> -	struct vdec_av1_slice_tile_group *tile_group = &instance->tile_group;
> +	struct vdec_av1_slice_tile_group *tile_group = &vsi->tile_group;
>   	struct vdec_av1_slice_uncompressed_header *uh = &vsi->frame.uh;
>   	struct vdec_av1_slice_tile *tile = &uh->tile;
>   	u32 tile_num, tile_row, tile_col;
> @@ -1740,7 +1752,9 @@ static int vdec_av1_slice_setup_lat(struct vdec_av1_slice_instance *instance,
>   		return ret;
>   
>   	vdec_av1_slice_setup_seg_buffer(instance, vsi);
> -	vdec_av1_slice_setup_tile_buffer(instance, vsi, bs);
> +	if (!instance->ctx->is_secure_playback)
> +		vdec_av1_slice_setup_tile_buffer(instance, vsi, bs);
> +
>   	vdec_av1_slice_setup_lat_buffer(instance, vsi, bs, lat_buf);
>   
>   	return 0;
> @@ -1803,10 +1817,15 @@ static int vdec_av1_slice_setup_core_buffer(struct vdec_av1_slice_instance *inst
>   
>   	/* frame buffer */
>   	vsi->fb.y.dma_addr = fb->base_y.dma_addr;
> -	if (plane == 1)
> -		vsi->fb.c.dma_addr = fb->base_y.dma_addr + size;
> -	else
> -		vsi->fb.c.dma_addr = fb->base_c.dma_addr;
> +
> +	if (!instance->ctx->is_secure_playback) {
> +		if (plane == 1)
> +			vsi->fb.c.dma_addr = fb->base_y.dma_addr + size;
> +		else
> +			vsi->fb.c.dma_addr = fb->base_c.dma_addr;
> +	}
> +	vsi->fb.y.size = instance->ctx->picinfo.fb_sz[0];
> +	vsi->fb.c.size = instance->ctx->picinfo.fb_sz[1];
>   
>   	/* reference buffers */
>   	vq = v4l2_m2m_get_vq(instance->ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> @@ -1829,6 +1848,7 @@ static int vdec_av1_slice_setup_core_buffer(struct vdec_av1_slice_instance *inst
>   		}
>   
>   		vref->y.dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
> +		vref->y.size = size;
>   		if (plane == 1)
>   			vref->c.dma_addr = vref->y.dma_addr + size;
>   		else
> @@ -1905,7 +1925,13 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
>   		goto error_vsi;
>   	}
>   	instance->init_vsi = vsi;
> -	instance->core_vsi = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, (u32)vsi->core_vsi);
> +	if (ctx->is_secure_playback)
> +		instance->core_vsi =
> +			mtk_vcodec_dec_get_shm_buffer_va(ctx->dev->optee_private, MTK_VDEC_CORE,
> +							 OPTEE_DATA_INDEX);
> +	else
> +		instance->core_vsi = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> +							       (u32)vsi->core_vsi);
>   
>   	if (!instance->core_vsi) {
>   		mtk_vdec_err(ctx, "failed to get AV1 core vsi\n");
> @@ -1917,11 +1943,12 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
>   		mtk_vdec_err(ctx, "remote vsi size 0x%x mismatch! expected: 0x%zx\n",
>   			     vsi->vsi_size, sizeof(struct vdec_av1_slice_vsi));
>   
> -	instance->irq_enabled = 1;
> +	instance->irq_enabled = !ctx->is_secure_playback;
>   	instance->inneracing_mode = IS_VDEC_INNER_RACING(instance->ctx->dev->dec_capability);
>   
> -	mtk_vdec_debug(ctx, "vsi 0x%p core_vsi 0x%llx 0x%p, inneracing_mode %d\n",
> -		       vsi, vsi->core_vsi, instance->core_vsi, instance->inneracing_mode);
> +	mtk_vdec_debug(ctx, "secure %d:vsi 0x%p core_vsi 0x%llx 0x%p, inneracing_mode %d\n",
> +		       ctx->is_secure_playback, vsi, vsi->core_vsi, instance->core_vsi,
> +		       instance->inneracing_mode);
>   
>   	ret = vdec_av1_slice_init_cdf_table(instance);
>   	if (ret)
> @@ -2114,7 +2141,9 @@ static int vdec_av1_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>   			vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
>   		return -EBUSY;
>   	}
> -	vsi->trans.dma_addr_end += ctx->msg_queue.wdma_addr.dma_addr;
> +	if (!instance->ctx->is_secure_playback)
> +		vsi->trans.dma_addr_end += ctx->msg_queue.wdma_addr.dma_addr;
> +
>   	mtk_vdec_debug(ctx, "lat dma 1 0x%pad 0x%pad\n",
>   		       &pfc->vsi.trans.dma_addr, &pfc->vsi.trans.dma_addr_end);
>   

