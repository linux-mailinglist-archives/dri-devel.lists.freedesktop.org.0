Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666A4581441
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 15:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E65A90C4F;
	Tue, 26 Jul 2022 13:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A0210E308
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 09:16:04 +0000 (UTC)
X-UUID: e8ee800c05ff41459e7984d877b1f0f6-20220726
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:55bed568-d55e-4f2d-9247-14b2fc126e32, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:0f94e32, CLOUDID:c32787b3-06d2-48ef-b2dd-540836705165,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: e8ee800c05ff41459e7984d877b1f0f6-20220726
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1719183704; Tue, 26 Jul 2022 17:15:56 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 26 Jul 2022 17:15:55 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 26 Jul 2022 17:15:54 +0800
Message-ID: <9385f8642e6ad5491a036360c644dc21b9a3f009.camel@mediatek.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Support HDMI_I2S audio format
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss
 <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Tue, 26 Jul 2022 17:15:54 +0800
In-Reply-To: <20220726033058.403715-1-xji@analogixsemi.com>
References: <20220726033058.403715-1-xji@analogixsemi.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-Mailman-Approved-At: Tue, 26 Jul 2022 13:35:02 +0000
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
Cc: qwen@analogixsemi.com, bliang@analogixsemi.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hsinyi@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-07-26 at 11:30 +0800, Xin Ji wrote:
> 1. Support HDMI_I2S audio format.
> 2. Return 0 if there is no sink connection in .hw_param callback.
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 23 +++++++++++++++++--
> ----
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 
Acked-by: Jiaxin Yu<jiaxin.yu@mediatek.com>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c
> b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 79fc7a50b497..c74b5df4cade 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1797,8 +1797,13 @@ static int anx7625_audio_hw_params(struct
> device *dev, void *data,
>  	int wl, ch, rate;
>  	int ret = 0;
>  
> -	if (fmt->fmt != HDMI_DSP_A) {
> -		DRM_DEV_ERROR(dev, "only supports DSP_A\n");
> +	if (anx7625_sink_detect(ctx) == connector_status_disconnected)
> {
> +		DRM_DEV_DEBUG_DRIVER(dev, "DP not connected\n");
> +		return 0;
> +	}
> +
> +	if (fmt->fmt != HDMI_DSP_A && fmt->fmt != HDMI_I2S) {
> +		DRM_DEV_ERROR(dev, "only supports DSP_A & I2S\n");
>  		return -EINVAL;
>  	}
>  
> @@ -1806,10 +1811,16 @@ static int anx7625_audio_hw_params(struct
> device *dev, void *data,
>  			     params->sample_rate, params->sample_width,
>  			     params->cea.channels);
>  
> -	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> -				    AUDIO_CHANNEL_STATUS_6,
> -				    ~I2S_SLAVE_MODE,
> -				    TDM_SLAVE_MODE);
> +	if (fmt->fmt == HDMI_DSP_A)
> +		ret = anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> +					   AUDIO_CHANNEL_STATUS_6,
> +					   ~I2S_SLAVE_MODE,
> +					   TDM_SLAVE_MODE);
> +	else
> +		ret = anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> +					   AUDIO_CHANNEL_STATUS_6,
> +					   ~TDM_SLAVE_MODE,
> +					   I2S_SLAVE_MODE);
>  
>  	/* Word length */
>  	switch (params->sample_width) {

