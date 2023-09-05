Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCE27920E6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 09:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9887210E166;
	Tue,  5 Sep 2023 07:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85B310E166
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 07:55:25 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A98F96607033;
 Tue,  5 Sep 2023 08:55:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693900524;
 bh=xt47hUabKnjBtbHUoL8inJXCx6CIgoMdxyYnRODbfk4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Nm9jiGx03PuBQ6bzC3uYyuldX+v2XvpzGRYCoqsiMdDgQvlvmxZDE46YoBY/io4nL
 42t1gquH3BXJe6ygHMkY+ewiBe6BmuK+2GE/GYpn0Mzkfdpj0dU3FJSqvX5mHX0ovt
 ObeEbaotc/Xzgz+RwjjlyW0TGSdU9WkqIhjAm+GonA9AxnvNXNGtOnhakJlS3hPxio
 A2oZ+gACpzH0KRglts6dzTYrZhLvcI5MaPv1KZkbLWYUHVDAf64eNYGWEsvBccuTku
 JziVX1QqfJw9NgaKLAGjEPzDdZcYQ/dEjAk2vZ6MVWCc/M8eBzQdELy8l3Nt2YSxt7
 b3dERTjLrBpkA==
Message-ID: <d7e6917d-7315-12d6-d7d4-dc7ea8c58dc9@collabora.com>
Date: Tue, 5 Sep 2023 09:55:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/2] drm/mediatek: dpi/dsi: fix possible_crtcs
 calculation
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20230901174557.3617839-1-mwalle@kernel.org>
 <20230901174557.3617839-2-mwalle@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230901174557.3617839-2-mwalle@kernel.org>
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
Cc: Jitao Shi <jitao.shi@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Stu Hsieh <stu.hsieh@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 01/09/23 19:45, Michael Walle ha scritto:
> mtk_drm_find_possible_crtc_by_comp() assumed that the main path will
> always have the CRTC with id 0, the ext id 1 and the third id 2. This
> is only true if the paths are all available. But paths are optional (see
> also comment in mtk_drm_kms_init()), e.g. the main path might not be
> enabled or available at all. Then the CRTC IDs will shift one up, e.g.
> ext will be 0 and the third path will be 1.
> 
> To fix that, dynamically calculate the IDs by the presence of the paths.
> 
> Fixes: 5aa8e7647676 ("drm/mediatek: dpi/dsi: Change the getting possible_crtc way")
> Suggested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> v3:
>   - use data instead of priv_n->data
>   - fixed typos
>   - collected Rb and Tb tags
> v2:
>   - iterate over all_drm_private[] to get any vdosys
>   - new check if a path is available
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 72 +++++++++++++++++----
>   1 file changed, 58 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 771f4e173353..c00f4669cc50 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -507,6 +507,27 @@ static bool mtk_drm_find_comp_in_ddp(struct device *dev,
>   	return false;
>   }
>   
> +static bool mtk_ddp_path_available(const unsigned int *path,
> +				   unsigned int path_len,
> +				   struct device_node **comp_node)
> +{
> +	unsigned int i;
> +
> +	if (!path)
> +		return false;
> +
> +	for (i = 0U; i < path_len; i++) {
> +		/* OVL_ADAPTOR doesn't have a device node */
> +		if (path[i] == DDP_COMPONENT_DRM_OVL_ADAPTOR)
> +			continue;
> +
> +		if (!comp_node[path[i]])
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>   int mtk_ddp_comp_get_id(struct device_node *node,
>   			enum mtk_ddp_comp_type comp_type)
>   {
> @@ -526,21 +547,44 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
>   						struct device *dev)
>   {
>   	struct mtk_drm_private *private = drm->dev_private;
> -	unsigned int ret = 0;
> -
> -	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path, private->data->main_len,
> -				     private->ddp_comp))
> -		ret = BIT(0);
> -	else if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
> -					  private->data->ext_len, private->ddp_comp))
> -		ret = BIT(1);
> -	else if (mtk_drm_find_comp_in_ddp(dev, private->data->third_path,
> -					  private->data->third_len, private->ddp_comp))
> -		ret = BIT(2);
> -	else
> -		DRM_INFO("Failed to find comp in ddp table\n");
> +	const struct mtk_mmsys_driver_data *data;
> +	struct mtk_drm_private *priv_n;
> +	int i = 0, j;
> +
> +	for (j = 0; j < private->data->mmsys_dev_num; j++) {
> +		priv_n = private->all_drm_private[j];
> +		data = priv_n->data;
> +
> +		if (mtk_ddp_path_available(data->main_path, data->main_len,
> +					   priv_n->comp_node)) {
> +			if (mtk_drm_find_comp_in_ddp(dev, data->main_path,
> +						     data->main_len,
> +						     priv_n->ddp_comp))
> +				return BIT(i);
> +			i++;
> +		}
> +
> +		if (mtk_ddp_path_available(data->ext_path, data->ext_len,
> +					   priv_n->comp_node)) {
> +			if (mtk_drm_find_comp_in_ddp(dev, data->ext_path,
> +						     data->ext_len,
> +						     priv_n->ddp_comp))
> +				return BIT(i);
> +			i++;
> +		}
> +
> +		if (mtk_ddp_path_available(data->third_path, data->third_len,
> +					   priv_n->comp_node)) {
> +			if (mtk_drm_find_comp_in_ddp(dev, data->third_path,
> +						     data->third_len,
> +						     priv_n->ddp_comp))
> +				return BIT(i);
> +			i++;
> +		}
> +	}
>   
> -	return ret;
> +	DRM_INFO("Failed to find comp in ddp table\n");
> +	return 0;

At this point, I think that it would be sane to change this function to
return a signed type, so that we can return -ENOENT if we couldn't find
any DDP path (so, if we couldn't find any possible crtc).

This function is called only twice, once in DPI, once in DSI - so the
change should also be pretty straightforward to do.

Cheers,
Angelo

>   }
>   
>   int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,



