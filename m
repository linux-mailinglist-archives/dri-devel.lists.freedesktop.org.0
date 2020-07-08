Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CED219906
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470F46E9BC;
	Thu,  9 Jul 2020 07:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6035B6E09E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 15:16:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 301EE2A1B15
Subject: Re: [RESEND PATCH 2/3] drm/mediatek: mtk_dpi: Convert to bridge driver
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200518173909.2259259-1-enric.balletbo@collabora.com>
 <20200518173909.2259259-3-enric.balletbo@collabora.com>
 <20200701135153.475db3a5@collabora.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <fcdc74a6-2ff9-34c6-6b07-ee7e55d6bc8d@collabora.com>
Date: Wed, 8 Jul 2020 17:15:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200701135153.475db3a5@collabora.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, drinkcat@chromium.org,
 narmstrong@baylibre.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, linux-mediatek@lists.infradead.org,
 laurent.pinchart@ideasonboard.com, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris,

Thank you for review the patch.

On 1/7/20 13:51, Boris Brezillon wrote:
> On Mon, 18 May 2020 19:39:08 +0200
> Enric Balletbo i Serra <enric.balletbo@collabora.com> wrote:
> 
>> Convert mtk_dpi to a bridge driver with built-in encoder support for
>> compatibility with existing component drivers.
>>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>> ---
>>
>>  drivers/gpu/drm/mediatek/mtk_dpi.c | 66 +++++++++++++++---------------
>>  1 file changed, 34 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> index 7112125dc3d1..baad198c69eb 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> @@ -61,6 +61,7 @@ enum mtk_dpi_out_color_format {
>>  struct mtk_dpi {
>>  	struct mtk_ddp_comp ddp_comp;
>>  	struct drm_encoder encoder;
>> +	struct drm_bridge bridge;
>>  	struct drm_bridge *next_bridge;
>>  	void __iomem *regs;
>>  	struct device *dev;
>> @@ -77,9 +78,9 @@ struct mtk_dpi {
>>  	int refcount;
>>  };
>>  
>> -static inline struct mtk_dpi *mtk_dpi_from_encoder(struct drm_encoder *e)
>> +static inline struct mtk_dpi *bridge_to_dpi(struct drm_bridge *b)
>>  {
>> -	return container_of(e, struct mtk_dpi, encoder);
>> +	return container_of(b, struct mtk_dpi, bridge);
>>  }
>>  
>>  enum mtk_dpi_polarity {
>> @@ -518,50 +519,44 @@ static const struct drm_encoder_funcs mtk_dpi_encoder_funcs = {
>>  	.destroy = mtk_dpi_encoder_destroy,
>>  };
>>  
>> -static bool mtk_dpi_encoder_mode_fixup(struct drm_encoder *encoder,
>> -				       const struct drm_display_mode *mode,
>> -				       struct drm_display_mode *adjusted_mode)
>> +static int mtk_dpi_bridge_attach(struct drm_bridge *bridge,
>> +				 enum drm_bridge_attach_flags flags)
>>  {
>> -	return true;
>> +	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
>> +
>> +	return drm_bridge_attach(bridge->encoder, dpi->next_bridge,
>> +				 &dpi->bridge, flags);
>>  }
>>  
>> -static void mtk_dpi_encoder_mode_set(struct drm_encoder *encoder,
>> -				     struct drm_display_mode *mode,
>> -				     struct drm_display_mode *adjusted_mode)
>> +static void mtk_dpi_bridge_mode_set(struct drm_bridge *bridge,
>> +				const struct drm_display_mode *mode,
>> +				const struct drm_display_mode *adjusted_mode)
>>  {
>> -	struct mtk_dpi *dpi = mtk_dpi_from_encoder(encoder);
>> +	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
>>  
>>  	drm_mode_copy(&dpi->mode, adjusted_mode);
>>  }
>>  
>> -static void mtk_dpi_encoder_disable(struct drm_encoder *encoder)
>> +static void mtk_dpi_bridge_disable(struct drm_bridge *bridge)
>>  {
>> -	struct mtk_dpi *dpi = mtk_dpi_from_encoder(encoder);
>> +	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
>>  
>>  	mtk_dpi_power_off(dpi);
>>  }
>>  
>> -static void mtk_dpi_encoder_enable(struct drm_encoder *encoder)
>> +static void mtk_dpi_bridge_enable(struct drm_bridge *bridge)
>>  {
>> -	struct mtk_dpi *dpi = mtk_dpi_from_encoder(encoder);
>> +	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
>>  
>>  	mtk_dpi_power_on(dpi);
>>  	mtk_dpi_set_display_mode(dpi, &dpi->mode);
>>  }
>>  
>> -static int mtk_dpi_atomic_check(struct drm_encoder *encoder,
>> -				struct drm_crtc_state *crtc_state,
>> -				struct drm_connector_state *conn_state)
>> -{
>> -	return 0;
>> -}
>> -
>> -static const struct drm_encoder_helper_funcs mtk_dpi_encoder_helper_funcs = {
>> -	.mode_fixup = mtk_dpi_encoder_mode_fixup,
>> -	.mode_set = mtk_dpi_encoder_mode_set,
>> -	.disable = mtk_dpi_encoder_disable,
>> -	.enable = mtk_dpi_encoder_enable,
>> -	.atomic_check = mtk_dpi_atomic_check,
>> +static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
>> +	.attach = mtk_dpi_bridge_attach,
>> +	.mode_set = mtk_dpi_bridge_mode_set,
>> +	.disable = mtk_dpi_bridge_disable,
>> +	.enable = mtk_dpi_bridge_enable,
>>  };
>>  
>>  static void mtk_dpi_start(struct mtk_ddp_comp *comp)
>> @@ -602,16 +597,13 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
>>  		dev_err(dev, "Failed to initialize decoder: %d\n", ret);
>>  		goto err_unregister;
>>  	}
>> -	drm_encoder_helper_add(&dpi->encoder, &mtk_dpi_encoder_helper_funcs);
>>  
>>  	/* Currently DPI0 is fixed to be driven by OVL1 */
>>  	dpi->encoder.possible_crtcs = BIT(1);
>>  
>> -	ret = drm_bridge_attach(&dpi->encoder, dpi->next_bridge, NULL, 0);
>> -	if (ret) {
>> -		dev_err(dev, "Failed to attach bridge: %d\n", ret);
> 
> Any reason your decided to drop this error message? If there's one,
> this should probably happen in a separate patch.
> 

Right, I'll maintain the error in next version.

>> +	ret = drm_bridge_attach(&dpi->encoder, &dpi->bridge, NULL, 0);
>> +	if (ret)
>>  		goto err_cleanup;
>> -	}
>>  
>>  	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
>>  	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
>> @@ -768,8 +760,15 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>>  
>>  	platform_set_drvdata(pdev, dpi);
>>  
>> +	dpi->bridge.funcs = &mtk_dpi_bridge_funcs;
>> +	dpi->bridge.of_node = dev->of_node;
>> +	dpi->bridge.type = DRM_MODE_CONNECTOR_DPI;
>> +
>> +	drm_bridge_add(&dpi->bridge);
> 
> I wonder if it's really useful to add the bridge when it's private (you
> don't want this bridge to be added to external bridge chains).
> 
>> +
>>  	ret = component_add(dev, &mtk_dpi_component_ops);
>>  	if (ret) {
>> +		drm_bridge_remove(&dpi->bridge);
>>  		dev_err(dev, "Failed to add component: %d\n", ret);
>>  		return ret;
>>  	}
>> @@ -779,7 +778,10 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>>  
>>  static int mtk_dpi_remove(struct platform_device *pdev)
>>  {
>> +	struct mtk_dpi *dpi = platform_get_drvdata(pdev);
>> +
>>  	component_del(&pdev->dev, &mtk_dpi_component_ops);
>> +	drm_bridge_remove(&dpi->bridge);
>>  
>>  	return 0;
>>  }
> 
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
