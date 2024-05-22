Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBB68CC11B
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 14:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C72810E222;
	Wed, 22 May 2024 12:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="D2ofusLh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFC410E222
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 12:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716380570;
 bh=vKUjD5xrRJdZFC5xAW6BnnX0ntsGfgm6htxmrXd0/7s=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=D2ofusLhxYBOEir31iQ2umipbVEPo6fh0sgDg6bZmcVx3pOMaktNnIdzFqPwu3jTa
 xeoe/tfYL05M9OotJCqA4My1h1o1cyAukpzL5OuQaFOKvETmcy1SgSqW50xmFJq5Iz
 ObpM/Epzm1tHgTkVVScYy7eJkuGNDH0Rql4N39nQ9ue0vvj11PZxai8z4d6NP4qnRB
 rnMOIKsyvULmW1H5Ok52lEY8rNhCU+K14HyfBYyhbCiQIQEQwq01bMFqhRInSXowIo
 3k8U0XAVyOPmLJH9SBUNWpQLvESrM+VVsSR9CG4piNcwtCjHE3PtLtGlr1U20O1f6+
 +O3yrO+6h1zbw==
Received: from [100.95.196.182] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: andrzej.p)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A8DD937821A0;
 Wed, 22 May 2024 12:22:48 +0000 (UTC)
Message-ID: <00128c79-9a27-4410-88d5-d1cd9a6460c0@collabora.com>
Date: Wed, 22 May 2024 14:22:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v6, 10/24] media: mediatek: vcodec: send share memory data
 to optee
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
 <20240516122102.16379-11-yunfei.dong@mediatek.com>
Content-Language: en-US
In-Reply-To: <20240516122102.16379-11-yunfei.dong@mediatek.com>
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

Hi Yunfei & Jeffrey,

W dniu 16.05.2024 o 14:20, Yunfei Dong pisze:
> Setting msg and vsi information to shared buffer, then call tee invoke
> function to send it to optee-os.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   .../vcodec/decoder/mtk_vcodec_dec_optee.c     | 140 ++++++++++++++++++
>   .../vcodec/decoder/mtk_vcodec_dec_optee.h     |  51 +++++++
>   2 files changed, 191 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
> index 611fb0e56480..f29a8d143fee 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
> @@ -241,3 +241,143 @@ void mtk_vcodec_dec_optee_release(struct mtk_vdec_optee_private *optee_private)
>   	mutex_unlock(&optee_private->tee_mutex);
>   }
>   EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_release);
> +
> +static int mtk_vcodec_dec_optee_fill_shm(struct tee_param *command_params,
> +					 struct mtk_vdec_optee_shm_memref *shm_memref,
> +					 struct mtk_vdec_optee_data_to_shm *data,
> +					 int index, struct device *dev)
> +{
> +	if (!data->msg_buf_size[index] || !data->msg_buf[index]) {
> +		pr_err(MTK_DBG_VCODEC_STR "tee invalid buf param: %d.\n", index);
> +		return -EINVAL;
> +	}
> +
> +	*command_params = (struct tee_param) {
> +		.attr = shm_memref->param_type,
> +		.u.memref = {
> +			.shm = shm_memref->msg_shm,
> +			.size = data->msg_buf_size[index],
> +			.shm_offs = 0,
> +		},
> +	};
> +
> +	if (!shm_memref->copy_to_ta) {
> +		dev_dbg(dev, MTK_DBG_VCODEC_STR "share memref data: 0x%x param_type:%llu.\n",
> +			*((unsigned int *)shm_memref->msg_shm_ca_buf), shm_memref->param_type);
> +		return 0;
> +	}
> +
> +	memset(shm_memref->msg_shm_ca_buf, 0, shm_memref->msg_shm_size);
> +	memcpy(shm_memref->msg_shm_ca_buf, data->msg_buf[index], data->msg_buf_size[index]);
> +
> +	dev_dbg(dev, MTK_DBG_VCODEC_STR "share memref data => msg id:0x%x 0x%x param_type:%llu.\n",
> +		*((unsigned int *)data->msg_buf[index]),
> +		*((unsigned int *)shm_memref->msg_shm_ca_buf),
> +		shm_memref->param_type);
> +
> +	return 0;
> +}
> +
> +void mtk_vcodec_dec_optee_set_data(struct mtk_vdec_optee_data_to_shm *data,
> +				   void *buf, int buf_size,
> +				   enum mtk_vdec_optee_data_index index)
> +{
> +	data->msg_buf[index] = buf;
> +	data->msg_buf_size[index] = buf_size;
> +}
> +EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_set_data);
> +
> +int mtk_vcodec_dec_optee_invokd_cmd(struct mtk_vdec_optee_private *optee_private,
> +				    enum mtk_vdec_hw_id hw_id,
> +				    struct mtk_vdec_optee_data_to_shm *data)
> +{
> +	struct device *dev = &optee_private->vcodec_dev->plat_dev->dev;
> +	struct tee_ioctl_invoke_arg trans_args;
> +	struct tee_param command_params[MTK_OPTEE_MAX_TEE_PARAMS];
> +	struct mtk_vdec_optee_ca_info *ca_info;
> +	struct mtk_vdec_optee_shm_memref *shm_memref;
> +	int ret, index;
> +
> +	if (hw_id == MTK_VDEC_LAT0)
> +		ca_info = &optee_private->lat_ca;
> +	else
> +		ca_info = &optee_private->core_ca;

You seem to be using this in several places. Maybe create a helper?

static inline struct mtk_vdec_optee_ca_info *get_ca_info(
	struct mtk_vdec_optee_private *optee_private,
	enum mtk_vdec_hw_id hw_id)
{
	return hw_id == MTK_VDEC_LAT0 ?
		&optee_private->lat_ca : &optee_private->core_ca;
}

(you want to clean up the line breaks in this suggested function)

and then

	ca_info = get_ca_info(optee_private, hw_id);

> +
> +	memset(&trans_args, 0, sizeof(trans_args));
> +	memset(command_params, 0, sizeof(command_params));
> +
> +	trans_args = (struct tee_ioctl_invoke_arg) {
> +		.func = ca_info->vdec_session_func,
> +		.session = ca_info->vdec_session_id,
> +		.num_params = MTK_OPTEE_MAX_TEE_PARAMS,
> +	};
> +
> +	/* Fill msg command parameters */
> +	for (index = 0; index < MTK_OPTEE_MAX_TEE_PARAMS; index++) {
> +		shm_memref = &ca_info->shm_memref[index];
> +
> +		if (shm_memref->param_type == TEE_IOCTL_PARAM_ATTR_TYPE_NONE ||
> +		    data->msg_buf_size[index] == 0)
> +			continue;
> +
> +		dev_dbg(dev, MTK_DBG_VCODEC_STR "tee share memory data size: %d -> %d.\n",
> +			data->msg_buf_size[index], shm_memref->msg_shm_size);
> +
> +		if (data->msg_buf_size[index] > shm_memref->msg_shm_size) {
> +			dev_err(dev, MTK_DBG_VCODEC_STR "tee buf size big than shm (%d -> %d).\n",

s/big/bigger ? Or s/big/greater ?

> +				data->msg_buf_size[index], shm_memref->msg_shm_size);
> +			return -EINVAL;
> +		}
> +
> +		ret = mtk_vcodec_dec_optee_fill_shm(&command_params[index], shm_memref,
> +						    data, index, dev);
> +		if (ret)
> +			return ret;

So if any of the iterations of this loop fails, then the data has been
potentially copied to several shm_memref->msg_shm_ca_buf and remains there until
next call to mtk_vcodec_dec_optee_fill_shm() for a corresponding ca_buf.
In other words, mtk_vcodec_dec_optee_fill_shm() has maybe filled several
ca_bufs, but if we return with error from this loop the tee function is not
invoked but the data prepared for its invocation remains in the buffers.
Don't know if this is a problem or not, but given we're dealing with restricted
aka secure memory you might want to think about it.

> +	}
> +
> +	ret = tee_client_invoke_func(optee_private->tee_vdec_ctx, &trans_args, command_params);
> +	if (ret < 0 || trans_args.ret != 0) {
> +		dev_err(dev, MTK_DBG_VCODEC_STR "tee submit command fail: 0x%x 0x%x.\n",
> +			trans_args.ret, ret);
> +		return (ret < 0) ? ret : trans_args.ret;
> +	}
> +
> +	/* clear all attrs, set all command param to unused */
> +	for (index = 0; index < MTK_OPTEE_MAX_TEE_PARAMS; index++) {
> +		data->msg_buf[index] = NULL;
> +		data->msg_buf_size[index] = 0;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_invokd_cmd);
> +
> +void *mtk_vcodec_dec_get_shm_buffer_va(struct mtk_vdec_optee_private *optee_private,
> +				       enum mtk_vdec_hw_id hw_id,
> +				       enum mtk_vdec_optee_data_index data_index)
> +{
> +	struct mtk_vdec_optee_ca_info *ca_info;
> +
> +	if (hw_id == MTK_VDEC_LAT0)
> +		ca_info = &optee_private->lat_ca;
> +	else
> +		ca_info = &optee_private->core_ca;
> +
> +	return ca_info->shm_memref[data_index].msg_shm_ca_buf;
> +}
> +EXPORT_SYMBOL_GPL(mtk_vcodec_dec_get_shm_buffer_va);
> +
> +int mtk_vcodec_dec_get_shm_buffer_size(struct mtk_vdec_optee_private *optee_private,
> +				       enum mtk_vdec_hw_id hw_id,
> +				       enum mtk_vdec_optee_data_index data_index)
> +{
> +	struct mtk_vdec_optee_ca_info *ca_info;
> +
> +	if (hw_id == MTK_VDEC_LAT0)
> +		ca_info = &optee_private->lat_ca;
> +	else
> +		ca_info = &optee_private->core_ca;
> +
> +	return ca_info->shm_memref[data_index].msg_shm_size;
> +}
> +EXPORT_SYMBOL_GPL(mtk_vcodec_dec_get_shm_buffer_size);
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
> index 24aa63af9887..c24a567ec877 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
> @@ -62,6 +62,16 @@ enum mtk_vdec_optee_data_index {
>   	OPTEE_MAX_INDEX,
>   };
>   
> +/**
> + * struct mtk_vdec_optee_data_to_shm - shm data used for TA
> + * @msg_buf:     msg information to TA.
> + * @msg_buf_len: length of msg information.
> + */
> +struct mtk_vdec_optee_data_to_shm {
> +	void *msg_buf[MTK_OPTEE_MAX_TEE_PARAMS];
> +	int msg_buf_size[MTK_OPTEE_MAX_TEE_PARAMS];
> +};
> +
>   /**
>    * struct mtk_vdec_optee_private - optee private data
>    * @vcodec_dev:     pointer to the mtk_vcodec_dev of the device
> @@ -102,4 +112,45 @@ int mtk_vcodec_dec_optee_private_init(struct mtk_vcodec_dec_dev *vcodec_dev);
>    */
>   void mtk_vcodec_dec_optee_release(struct mtk_vdec_optee_private *optee_private);
>   
> +/**
> + * mtk_vcodec_dec_optee_set_data - set buffer to share memref.
> + * @vcodec_dev: normal world data used to init optee share memory
> + * @buf: normal world buffer address
> + * @buf_size: buf size
> + * @data_index: indentify each share memory informaiton
> + */
> +void mtk_vcodec_dec_optee_set_data(struct mtk_vdec_optee_data_to_shm *data,
> +				   void *buf, int buf_size,
> +				   enum mtk_vdec_optee_data_index data_index);
> +
> +/**
> + * mtk_vcodec_dec_optee_invokd_cmd - send share memory data to optee .
> + * @optee_private: optee private context
> + * @hw_id: hardware index
> + * @data: normal world data used to init optee share memory
> + */
> +int mtk_vcodec_dec_optee_invokd_cmd(struct mtk_vdec_optee_private *optee_private,
> +				    enum mtk_vdec_hw_id hw_id,
> +				    struct mtk_vdec_optee_data_to_shm *data);
> +
> +/**
> + * mtk_vcodec_dec_get_shm_buffer_va - close the communication channels with TA.

This comment is most likely incorrect.

> + * @optee_private: optee private context
> + * @hw_id:         hardware index
> + * @@data_index: indentify each share memory informaiton
> + */
> +void *mtk_vcodec_dec_get_shm_buffer_va(struct mtk_vdec_optee_private *optee_private,
> +				       enum mtk_vdec_hw_id hw_id,
> +				       enum mtk_vdec_optee_data_index data_index);
> +
> +/**
> + * mtk_vcodec_dec_get_shm_buffer_size - close the communication channels with TA.

And so is this one.

Regards,

Andrzej

> + * @optee_private: optee private context
> + * @hw_id:         hardware index
> + * @@data_index: indentify each share memory informaiton
> + */
> +int mtk_vcodec_dec_get_shm_buffer_size(struct mtk_vdec_optee_private *optee_private,
> +				       enum mtk_vdec_hw_id hw_id,
> +				       enum mtk_vdec_optee_data_index data_index);
> +
>   #endif /* _MTK_VCODEC_FW_OPTEE_H_ */

