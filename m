Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB4B61F424
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 14:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE9110E0CC;
	Mon,  7 Nov 2022 13:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC40210E30C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 13:18:52 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DB5E1660283A;
 Mon,  7 Nov 2022 13:18:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667827131;
 bh=tU1OAe0Vvp0aOciZukkqE9qUSHS3oLbNbkvzwrPYLkc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=L4C8TBHEQh4aCfg5EhyPfgDj7FBDr9tlaaqbeuI2gxoiauoPTJ0LRomeu3U3xn8yB
 cLs9jf3Qy5ulLx74oSSgelmTH9X5C4sVeW484q5SfPvgG+kcUvnYsjsfobsKfYjC04
 ZQk8R+V7AaQ6z1506vNkwdxgkBqBt/s6ODPYs3m5BkY1rmI8n/S2N2RCNR421rHjUn
 ASXerx/DVGAO8Cx0KStDw3qgbQZ5wCzTkfJ59lyqmzQ0G91Liny88HktJVxCPBkfOM
 Wofw5oBzikLshh4GzrlCvthIbamO2sQSZVn8DtnPtjjRTMfplep3iDt/8YvgPVBRZC
 k8M+6uS+puyHA==
Message-ID: <ae15dce7-5be2-8486-54b4-8c5ec656546e@collabora.com>
Date: Mon, 7 Nov 2022 14:18:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5] media: mediatek: vcodec: Add to support VP9 inner
 racing mode
Content-Language: en-US
To: =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
 "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 =?UTF-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 =?UTF-8?B?TWluZ2ppYSBaaGFuZyAo5byg5piO5L2zKQ==?=
 <Mingjia.Zhang@mediatek.com>, "tfiga@google.com" <tfiga@google.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
 <Andrew-CT.Chen@mediatek.com>, "acourbot@chromium.org"
 <acourbot@chromium.org>
References: <20221025014659.7158-1-mingjia.zhang@mediatek.com>
 <b7f6e258d00e9946852b900ada0548e342c1ce50.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <b7f6e258d00e9946852b900ada0548e342c1ce50.camel@mediatek.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
 "stevecho@chromium.org" <stevecho@chromium.org>,
 =?UTF-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?WGlhb3lvbmcgTHUgKOWNouWwj+WLhyk=?= <Xiaoyong.Lu@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "frkoenig@chromium.org" <frkoenig@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 07/11/22 12:46, Yunfei Dong (董云飞) ha scritto:
> Hi Mingjia,
> 
> Thanks for your patch.
> Some comments need to get your feedback.
> On Tue, 2022-10-25 at 09:46 +0800, Mingjia Zhang wrote:
>> Enable VP9 inner racing mode
>> We send lat trans buffer to the core when trigger lat to work,
>> instead of waiting for the lat decode done.
>> It can be reduce decoder latency.
>>
>> Signed-off-by: Mingjia Zhang <mingjia.zhang@mediatek.com>
>> ---
>> Changes from v3:
>>
>> - CTS/GTS test pass
>> - Fluster result: Ran 275/303 tests successfully
>>
>> Changes from v2:
>>
>> - CTS/GTS test pass
>> - Fluster result: Ran 240/303 tests successfully
>>
>> Changes from v1:
>>
>> - CTS/GTS test pass
>> ---
>>   .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 85 ++++++++++-------
>> --
>>   1 file changed, 47 insertions(+), 38 deletions(-)
>>
>> diff --git
>> a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
>> b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
>> index 81de876d51267..1b39119c89951 100644
>> ---
>> a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
>> +++
>> b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
>> @@ -436,6 +436,7 @@ struct vdec_vp9_slice_ref {
>>    * @frame_ctx:		4 frame context according to VP9 Spec
>>    * @frame_ctx_helper:	4 frame context according to newest
>> kernel spec
>>    * @dirty:		state of each frame context
>> + * @local_vsi:		local instance vsi information
>>    * @init_vsi:		vsi used for initialized VP9 instance
>>    * @vsi:		vsi used for decoding/flush ...
>>    * @core_vsi:		vsi used for Core stage
>> @@ -482,6 +483,8 @@ struct vdec_vp9_slice_instance {
>>   	struct v4l2_vp9_frame_context frame_ctx_helper;
>>   	unsigned char dirty[4];
>>   
>> +	struct vdec_vp9_slice_vsi local_vsi;
>> +
>>   	/* MicroP vsi */
>>   	union {
>>   		struct vdec_vp9_slice_init_vsi *init_vsi;
>> @@ -1616,16 +1619,10 @@ static int
>> vdec_vp9_slice_update_single(struct vdec_vp9_slice_instance *instance
>>   }
>>   
>>   static int vdec_vp9_slice_update_lat(struct vdec_vp9_slice_instance
>> *instance,
>> -				     struct vdec_lat_buf *lat_buf,
>> -				     struct vdec_vp9_slice_pfc *pfc)
>> +				     struct vdec_vp9_slice_vsi *vsi)
>>   {
>> -	struct vdec_vp9_slice_vsi *vsi;
>> -
>> -	vsi = &pfc->vsi;
>> -	memcpy(&pfc->state[0], &vsi->state, sizeof(vsi->state));
>> -
>>   	mtk_vcodec_debug(instance, "Frame %u LAT CRC 0x%08x %lx %lx\n",
>> -			 pfc->seq, vsi->state.crc[0],
>> +			 (instance->seq - 1), vsi->state.crc[0],
>>   			 (unsigned long)vsi->trans.dma_addr,
>>   			 (unsigned long)vsi->trans.dma_addr_end);
>>   
>> @@ -2090,6 +2087,13 @@ static int vdec_vp9_slice_lat_decode(void
>> *h_vdec, struct mtk_vcodec_mem *bs,
>>   		return ret;
>>   	}
>>   
>> +	if (IS_VDEC_INNER_RACING(ctx->dev->dec_capability)) {
>> +		vdec_vp9_slice_vsi_from_remote(vsi, instance->vsi, 0);
>> +		memcpy(&instance->local_vsi, vsi, sizeof(*vsi));
>> +		vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx,
>> lat_buf);
>> +		vsi = &instance->local_vsi;
>> +	}
>> +
>>   	if (instance->irq) {
>>   		ret = mtk_vcodec_wait_for_done_ctx(ctx,	MTK_INST_IRQ_
>> RECEIVED,
>>   						   WAIT_INTR_TIMEOUT_MS
>> , MTK_VDEC_LAT0);
>> @@ -2102,22 +2106,25 @@ static int vdec_vp9_slice_lat_decode(void
>> *h_vdec, struct mtk_vcodec_mem *bs,
>>   	}
>>   
>>   	vdec_vp9_slice_vsi_from_remote(vsi, instance->vsi, 0);
>> -	ret = vdec_vp9_slice_update_lat(instance, lat_buf, pfc);
>> +	ret = vdec_vp9_slice_update_lat(instance, vsi);
>>   
>> -	/* LAT trans full, no more UBE or decode timeout */
>> -	if (ret) {
>> -		mtk_vcodec_err(instance, "VP9 decode error: %d\n",
>> ret);
>> -		return ret;
>> -	}
>> +	if (!IS_VDEC_INNER_RACING(ctx->dev->dec_capability))
>> +		/* LAT trans full, no more UBE or decode timeout */
>> +		if (ret) {
>> +			mtk_vcodec_err(instance, "frame[%d] decode
>> error: %d\n",
>> +				       ret, (instance->seq - 1));
>> +			return ret;
>> +		}
>>   
> If inner racing decode error, how to do? Looks this error condition
> only in non inner racing mode.
>> -	mtk_vcodec_debug(instance, "lat dma addr: 0x%lx 0x%lx\n",
>> -			 (unsigned long)pfc->vsi.trans.dma_addr,
>> -			 (unsigned long)pfc->vsi.trans.dma_addr_end);
>>   
>> -	vdec_msg_queue_update_ube_wptr(&ctx->msg_queue,
>> -				       vsi->trans.dma_addr_end +
>> -				       ctx-
>>> msg_queue.wdma_addr.dma_addr);
>> -	vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx, lat_buf);
>> +	vsi->trans.dma_addr_end += ctx->msg_queue.wdma_addr.dma_addr;
>> +	vdec_msg_queue_update_ube_wptr(&ctx->msg_queue, vsi-
>>> trans.dma_addr_end);
>> +	if (!IS_VDEC_INNER_RACING(ctx->dev->dec_capability))
>> +		vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx,
>> lat_buf);
>> +
>> +	mtk_vcodec_debug(instance, "lat trans end addr(0x%lx), ube
>> start addr(0x%lx)\n",
>> +			 (unsigned long)vsi->trans.dma_addr_end,
>> +			 (unsigned long)ctx-
>>> msg_queue.wdma_addr.dma_addr);
>>   
>>   	return 0;
>>   }
>> @@ -2139,40 +2146,40 @@ static int vdec_vp9_slice_decode(void
>> *h_vdec, struct mtk_vcodec_mem *bs,
>>   static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
>>   {
>>   	struct vdec_vp9_slice_instance *instance;
>> -	struct vdec_vp9_slice_pfc *pfc;
>> +	struct vdec_vp9_slice_pfc *pfc = NULL;
>>   	struct mtk_vcodec_ctx *ctx = NULL;
>>   	struct vdec_fb *fb = NULL;
>>   	int ret = -EINVAL;
>>   
>>   	if (!lat_buf)
>> -		goto err;
>> +		return -EINVAL;
>>   
>>   	pfc = lat_buf->private_data;
>>   	ctx = lat_buf->ctx;
>>   	if (!pfc || !ctx)
>> -		goto err;
>> +		return -EINVAL;
>>   
>>   	instance = ctx->drv_handle;
>>   	if (!instance)
>> -		goto err;
>> +		return -EINVAL;
>>   
>>   	fb = ctx->dev->vdec_pdata->get_cap_buffer(ctx);
>>   	if (!fb) {
>>   		ret = -EBUSY;
>> -		goto err;
>> +		goto vdec_dec_end;
>>   	}
>>   
>>   	ret = vdec_vp9_slice_setup_core(instance, fb, lat_buf, pfc);
>>   	if (ret) {
>>   		mtk_vcodec_err(instance,
>> "vdec_vp9_slice_setup_core\n");
>> -		goto err;
>> +		goto vdec_dec_end;
>>   	}
>>   	vdec_vp9_slice_vsi_to_remote(&pfc->vsi, instance->core_vsi);
>>   
>>   	ret = vpu_dec_core(&instance->vpu);
>>   	if (ret) {
>>   		mtk_vcodec_err(instance, "vpu_dec_core\n");
>> -		goto err;
>> +		goto vdec_dec_end;
>>   	}
>>   
>>   	if (instance->irq) {
>> @@ -2190,24 +2197,26 @@ static int vdec_vp9_slice_core_decode(struct
>> vdec_lat_buf *lat_buf)
>>   	ret = vdec_vp9_slice_update_core(instance, lat_buf, pfc);
>>   	if (ret) {
>>   		mtk_vcodec_err(instance,
>> "vdec_vp9_slice_update_core\n");
>> -		goto err;
>> +		goto vdec_dec_end;
>>   	}
>>   
>> -	pfc->vsi.trans.dma_addr_end += ctx-
>>> msg_queue.wdma_addr.dma_addr;
>>   	mtk_vcodec_debug(instance, "core dma_addr_end 0x%lx\n",
>>   			 (unsigned long)pfc->vsi.trans.dma_addr_end);
>> -	vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc-
>>> vsi.trans.dma_addr_end);
>> -	ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf-
>>> src_buf_req);
>> -
>> -	return 0;
>>   
>> -err:
>> -	if (ctx && pfc) {
>> -		/* always update read pointer */
>> -		vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc-
>>> vsi.trans.dma_addr_end);
>> +vdec_dec_end:
>> +	/* always update read pointer */
>> +	if (IS_VDEC_INNER_RACING(ctx->dev->dec_capability))
>> +		vdec_msg_queue_update_ube_rptr(&ctx->msg_queue,
>> +					       pfc-
>>> vsi.trans.dma_addr);
>> +	else
>> +		vdec_msg_queue_update_ube_rptr(&ctx->msg_queue,
>> +					       pfc-
>>> vsi.trans.dma_addr_end);
>>   
>> +	if (ret) {
> No need {
> 

It's right, there's no *need* to, but in this case I'd keep it for the sake
of readability, as in..

	if (ret) {
		if (fb)
			some;
	} else {
		thing;
	}

looks more readable than

	if (ret)
		if (fb)
			some;
	else
		thing;

... alternatively, we can do something like ...

	if (ret == 0)
		thing;
	else if (fb)
		some;

But then, there's another consideration: vdec_vp9_slice_update_core() never
returns anything else than zero, so I don't see how, in this case, `ret` can
be different than zero.

This means that the "else if (fb)" part would never happen, so, unless you're
planning to introduce a change that may return a failure in
vdec_vp9_slice_update_core(), this branch makes no sense at all.

Of course, in case you plan to do that, you should add the check in that change
or you should add that change in this commit.

Regards,
Angelo

> Best Regards,
> Yunfei Dong
>>   		if (fb)
>>   			ctx->dev->vdec_pdata->cap_to_disp(ctx, 1,
>> lat_buf->src_buf_req);
>> +	} else {
>> +		ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf-
>>> src_buf_req);
>>   	}
>>   	return ret;
>>   }


