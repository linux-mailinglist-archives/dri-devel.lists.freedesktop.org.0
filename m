Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B4B8CC124
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 14:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7EA10E41A;
	Wed, 22 May 2024 12:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="wGtt6tJ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB56E10E41A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 12:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716380626;
 bh=phyztzXqZHdPHKrf8rO419t6Fa+vJzO/hs+BEbFz/nw=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=wGtt6tJ8efObrlDVvEey44Szoh4c08bH3fMQfohugPaeRsm9KFwFA3jOqdSYSEAv+
 maoxRUVow1+2xlQCMMNQRPb3s4feJW1s9UewOa7ShgHaVdchpVZLJzwTI8ddNHGK0t
 HFcDYGDmTRixht+2huS7tt9hol7Nba0lW/E955CPt5wBqw1Dg6nYD2i4eCvzVugZ8J
 OL67a6QxlMHhfrCyx4kmP7taxCzYJNnZs+dvkrgOJu36Z5E+Hmha3AzGoQPYgT9CkB
 ilqG4Xc8xR9PKDEqJDo0aG7ymp/DWMUg5Q4w+W6nUzziwB8qDtvhft9Zg6bV9cnU5o
 LoW7f8jvWkuWQ==
Received: from [100.95.196.182] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: andrzej.p)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 40C6F37821A0;
 Wed, 22 May 2024 12:23:45 +0000 (UTC)
Message-ID: <b76dc54f-ca33-4851-9999-72740cd22060@collabora.com>
Date: Wed, 22 May 2024 14:23:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v6,09/24] media: mediatek: vcodec: allocate tee share
 memory
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
 <20240516122102.16379-10-yunfei.dong@mediatek.com>
Content-Language: en-US
In-Reply-To: <20240516122102.16379-10-yunfei.dong@mediatek.com>
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

Hi Yunfei,

W dniu 16.05.2024 o 14:20, Yunfei Dong pisze:
> Allocate two share memory for each lat and core hardware used to share
> information with optee-os. Msg buffer used to send ipi command and get ack
> command with optee-os, data buffer used to store vsi information which
> used for hardware decode.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   .../vcodec/decoder/mtk_vcodec_dec_optee.c     | 80 ++++++++++++++++++-
>   .../vcodec/decoder/mtk_vcodec_dec_optee.h     | 32 ++++++++
>   2 files changed, 111 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
> index 38d9c1c1785a..611fb0e56480 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
> @@ -47,13 +47,69 @@ int mtk_vcodec_dec_optee_private_init(struct mtk_vcodec_dec_dev *vcodec_dev)
>   }
>   EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_private_init);
>   
> +static void mtk_vcodec_dec_optee_deinit_memref(struct mtk_vdec_optee_ca_info *ca_info,
> +					       enum mtk_vdec_optee_data_index data_index)
> +{
> +	tee_shm_free(ca_info->shm_memref[data_index].msg_shm);
> +}
> +
> +static int mtk_vcodec_dec_optee_init_memref(struct tee_context *tee_vdec_ctx,
> +					    struct mtk_vdec_optee_ca_info *ca_info,
> +					    enum mtk_vdec_optee_data_index data_index)
> +{
> +	struct mtk_vdec_optee_shm_memref *shm_memref;
> +	int alloc_size = 0, err = 0;
> +	u64 shm_param_type = 0;
> +	bool copy_buffer;
> +
> +	switch (data_index) {
> +	case OPTEE_MSG_INDEX:
> +		shm_param_type = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT;
> +		alloc_size = MTK_VDEC_OPTEE_MSG_SIZE;
> +		copy_buffer = true;
> +		break;
> +	case OPTEE_DATA_INDEX:
> +		shm_param_type = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT;
> +		alloc_size = MTK_VDEC_OPTEE_HW_SIZE;
> +		copy_buffer = false;
> +		break;
> +	default:
> +		pr_err(MTK_DBG_VCODEC_STR "tee invalid data_index: %d.\n", data_index);
> +		return -EINVAL;
> +	}
> +
> +	shm_memref = &ca_info->shm_memref[data_index];
> +
> +	/* Allocate dynamic shared memory with decoder TA */
> +	shm_memref->msg_shm_size = alloc_size;
> +	shm_memref->param_type = shm_param_type;
> +	shm_memref->copy_to_ta = copy_buffer;
> +	shm_memref->msg_shm = tee_shm_alloc_kernel_buf(tee_vdec_ctx, shm_memref->msg_shm_size);
> +	if (IS_ERR(shm_memref->msg_shm)) {
> +		pr_err(MTK_DBG_VCODEC_STR "tee alloc buf fail: data_index:%d.\n", data_index);
> +		return -ENOMEM;
> +	}
> +
> +	shm_memref->msg_shm_ca_buf = tee_shm_get_va(shm_memref->msg_shm, 0);
> +	if (IS_ERR(shm_memref->msg_shm_ca_buf)) {
> +		pr_err(MTK_DBG_VCODEC_STR "tee get shm va fail: data_index:%d.\n", data_index);
> +		err = PTR_ERR(shm_memref->msg_shm_ca_buf);
> +		goto err_get_msg_va;
> +	}
> +
> +	return err;

Anything other than a zero possible here? In error-free exectution the return
value of zero is set far away from here. And then both error-free execution
and error recovery end in "return err;" which looks kind of weird to me.
Maybe that's just my personal preference, but I'd prefer "return 0;" here.
Alternatively, maybe rename "err" as "ret"? This applies to all patches.

I wouldn't mind a blank line here to visually separate the error recovery path
from error-free execution. This applies to all patches.

> +err_get_msg_va:
> +	tee_shm_free(shm_memref->msg_shm);
> +	return err;
> +}
> +
>   static int mtk_vcodec_dec_optee_init_hw_info(struct mtk_vdec_optee_private *optee_private,
>   					     enum mtk_vdec_hw_id hardware_index)
>   {
>   	struct device *dev = &optee_private->vcodec_dev->plat_dev->dev;
>   	struct tee_ioctl_open_session_arg session_arg;
>   	struct mtk_vdec_optee_ca_info *ca_info;
> -	int err = 0, session_func;
> +	int err, i, j, session_func;
>   
>   	/* Open lat and core session with vdec TA. */
>   	switch (hardware_index) {
> @@ -87,6 +143,24 @@ static int mtk_vcodec_dec_optee_init_hw_info(struct mtk_vdec_optee_private *opte
>   	dev_dbg(dev, MTK_DBG_VCODEC_STR "open vdec tee session hw_id:%d session_id=%x.\n",
>   		hardware_index, ca_info->vdec_session_id);
>   
> +	/* Allocate dynamic shared memory with decoder TA */
> +	for (i = 0; i < OPTEE_MAX_INDEX; i++) {
> +		err = mtk_vcodec_dec_optee_init_memref(optee_private->tee_vdec_ctx, ca_info, i);
> +		if (err) {
> +			dev_err(dev, MTK_DBG_VCODEC_STR "init vdec memref failed: %d.\n", i);
> +			goto err_init_memref;
> +		}
> +	}
> +
> +	return err;
> +err_init_memref:
> +	if (i != 0) {

Isn't i now equal to the index at which init memref failed?

> +		for (j = 0; j < i; j++)
> +			mtk_vcodec_dec_optee_deinit_memref(ca_info, j);
> +	}

So instead of the above maybe:

	--i;
	while (i >= 0)
		mtk_vcodec_dec_optee_deinit_memref(ca_info, i--);

after --i the i points to the last successfully initialized memref unless < 0.
This way you can eliminate the j.

> +
> +	tee_client_close_session(optee_private->tee_vdec_ctx, ca_info->vdec_session_id);
> +
>   	return err;
>   }
>   
> @@ -94,12 +168,16 @@ static void mtk_vcodec_dec_optee_deinit_hw_info(struct mtk_vdec_optee_private *o
>   						enum mtk_vdec_hw_id hw_id)
>   {
>   	struct mtk_vdec_optee_ca_info *ca_info;
> +	int i;
>   
>   	if (hw_id == MTK_VDEC_LAT0)
>   		ca_info = &optee_private->lat_ca;
>   	else
>   		ca_info = &optee_private->core_ca;
>   
> +	for (i = 0; i < OPTEE_MAX_INDEX; i++)
> +		mtk_vcodec_dec_optee_deinit_memref(ca_info, i);
> +
>   	tee_client_close_session(optee_private->tee_vdec_ctx, ca_info->vdec_session_id);
>   }
>   
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
> index 8b1dca49331e..24aa63af9887 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
> @@ -18,16 +18,48 @@
>   
>   #define MTK_OPTEE_MAX_TEE_PARAMS 4
>   
> +#define MTK_VDEC_OPTEE_MSG_SIZE     128
> +#define MTK_VDEC_OPTEE_HW_SIZE      (8 * SZ_1K)
> +
> +/**
> + * struct mtk_vdec_optee_shm_memref - share memory reference params

maybe s/share/shared ? Applies to other occurences as well.

Regards,

Andrzej

> + * @msg_shm:        message shared with TA in TEE.
> + * @msg_shm_ca_buf: ca buffer.
> + *
> + * @msg_shm_size:   share message size.
> + * @param_type:     each tee param types.
> + * @copy_to_ta:     need to copy data from ca to share memory.
> + */
> +struct mtk_vdec_optee_shm_memref {
> +	struct tee_shm *msg_shm;
> +	u8 *msg_shm_ca_buf;
> +
> +	u32 msg_shm_size;
> +	u64 param_type;
> +	bool copy_to_ta;
> +};
> +
>   /**
>    * struct mtk_vdec_optee_ca_info - ca related param
>    * @vdec_session_id:   optee TA session identifier.
>    * @hw_id:             hardware index.
>    * @vdec_session_func: trusted application function id used specific to the TA.
> + * @shm_memref:        share memory reference params.
>    */
>   struct mtk_vdec_optee_ca_info {
>   	u32 vdec_session_id;
>   	enum mtk_vdec_hw_id hw_id;
>   	u32 vdec_session_func;
> +	struct mtk_vdec_optee_shm_memref shm_memref[MTK_OPTEE_MAX_TEE_PARAMS];
> +};
> +
> +/*
> + * enum mtk_vdec_optee_data_index - used to indentify each share memory information
> + */
> +enum mtk_vdec_optee_data_index {
> +	OPTEE_MSG_INDEX = 0,
> +	OPTEE_DATA_INDEX,
> +	OPTEE_MAX_INDEX,
>   };
>   
>   /**

