Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECD0A15B3B
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2025 04:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0ABA10E0D0;
	Sat, 18 Jan 2025 03:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OGRtZan4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF95210E0D0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2025 03:32:05 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53f22fd6832so2908154e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 19:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737171124; x=1737775924; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hzhYcQ8TIQfms4jIUonylBO9hpxU9lIyBPmgiVcYCfA=;
 b=OGRtZan4i8CrFMAbhupTWEX0RlE75PxzW4Eeok4eCYNQr3U+j6ePUK/DXSxvnNP6ri
 RH09oYV4YVyRcLei1/kzFjHPBcrZDCSzCvSPxIUNQmHIdZ/PHqHNbdaTGQP6j/6CAeSM
 xN/PTPoydPRCxXx3Y+j4Bpd/9jSWlmyxQUNNXPcPiXJzGyPlWzzF30I4HqDXp4NqurbP
 8XHRBlIVxUyWXTZg9CemdU0TuYxAlNbUsV7Vqc4v+KHAQMJqBaLXLEVijPvdKI1zN6XL
 t5xvJrj7aRxnBMRTkRBrrrnVwm6ya5xFLJBvbgLtwxqNia6B9ezJcapM4d5PwhsR+iI0
 o3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737171124; x=1737775924;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hzhYcQ8TIQfms4jIUonylBO9hpxU9lIyBPmgiVcYCfA=;
 b=FewQKCsid27Kg2l3bhfVpWi18Kx5RVWLEftByGf3dCJ4XNvAIOvJ3BVtwLQ+Sq81TX
 HLkbNMnFAdZ6ZIi1vnXk1gFk8gFmA3YlJKtsVeZgfgBZ7ihxb8jrlb/7iNfWnGJOHJuO
 abgypeGKweviCShPCc8pyVX+64MWt9LIl5c9e4HrtKifJ/si6+doOHhNjMZzColgOD/t
 gHC/xyshvlo1hYsxCpZjBThyn+QMEyczY18fXxI7rtwnTCvKWXy9XNXRqrGpJh/lPvs6
 TqYb3exo4zcdmEb05QBxwlHPTv5WwdUZiVL67tM0H7sjt0Rjt1D0bK0HiWd5DCg0D+CN
 m8SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgngDoYoWuerOr7LAIB2DSwVSyP8p7VJdjbebJEUovzMjkbMFUvOhjeHhjkNP2imPpEYbN/pLFVMs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGt/buJ5N5Pt/Emlc+88jn2SiiqFkVMGf9kuJrShMExrwErf6D
 zBIo4FS7VZ75iQTQ04BvcZRLPyKHbiwe3VUMyX1k4hFvi/yUJyqSm/cjuRthtXg=
X-Gm-Gg: ASbGncv1+5aMqlmgyColKGCCvwXrlkgML2Mfx6RQDv9uEQCJRT6G0ah3HH4frW1Su1O
 Lu9kX7b10jyMOPEqPnySlaXR8v/+QvyMeL+X2NA5IydoqnbfwTbno8mJTEZTwL6gzfvCnHZQ6dB
 SEGlYSUsP6h1ZFAOtgPAa/9XzR7cM2uVO+gvWkOs7S8yPDh1j0rkxtU36FaPyqJy/gqWgzXega5
 +6yDXXxI0jLviGKQSgNOm7FDng8IhQOOmg0+oSulz5W5Ksfup0CymYYwi5KMkBJfbwb5z94p3Pu
 MdluvR907x2wt6eH8U0JhAaLqBNBA6ZkIHStq/tCtucR7jEaBg==
X-Google-Smtp-Source: AGHT+IEHCXhnR9Ifz788WfaTw8BC7iP0CpDRy+2jMi6d69znvkXj4Q2lQp7TuxJzYYy15v3Qpf7Fpg==
X-Received: by 2002:a05:6512:e8d:b0:542:9883:263 with SMTP id
 2adb3069b0e04-5439c246370mr1751170e87.14.1737171123682; 
 Fri, 17 Jan 2025 19:32:03 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af60970sm574860e87.116.2025.01.17.19.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 19:32:02 -0800 (PST)
Date: Sat, 18 Jan 2025 05:31:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Alexey Charkov <alchark@gmail.com>, Jianfeng Liu <liujianfeng1994@gmail.com>, 
 Dragan Simic <dsimic@manjaro.org>, FUKAUMI Naoki <naoki@radxa.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Johan Jonker <jbx6244@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, 
 Algea Cao <algea.cao@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH v1 1/2] drm/bridge: synopsys: Add audio support for
 dw-hdmi-qp
Message-ID: <xtthbgdnyaevtcvjmkqsipje6ksxmbilkacbw5f4m4fvu62ggx@wm34iotb2a6d>
References: <20250117164815.67253-1-detlev.casanova@collabora.com>
 <20250117164815.67253-2-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117164815.67253-2-detlev.casanova@collabora.com>
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

On Fri, Jan 17, 2025 at 11:46:57AM -0500, Detlev Casanova wrote:
> From: Sugar Zhang <sugar.zhang@rock-chips.com>
> 
> Register the dw-hdmi-qp bridge driver as an HDMI audio codec.
> 
> The register values computation functions (for n) are based on the
> downstream driver, as well as the register writing functions.
> 
> The driver uses the generic HDMI Codec framework in order to implement
> the HDMI audio support.
> 
> Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 472 +++++++++++++++++++
>  1 file changed, 472 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> index b281cabfe992..55ceeb180bc6 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -36,6 +36,66 @@
>  
>  #define SCRAMB_POLL_DELAY_MS	3000
>  
> +/*
> + * Unless otherwise noted, entries in this table are 100% optimization.
> + * Values can be obtained from hdmi_compute_n() but that function is
> + * slow so we pre-compute values we expect to see.
> + *
> + * All 32k and 48k values are expected to be the same (due to the way
> + * the math works) for any rate that's an exact kHz.
> + */
> +static const struct dw_hdmi_audio_tmds_n {
> +	unsigned long tmds;
> +	unsigned int n_32k;
> +	unsigned int n_44k1;
> +	unsigned int n_48k;
> +} common_tmds_n_table[] = {
> +	{ .tmds = 25175000, .n_32k = 4096, .n_44k1 = 12854, .n_48k = 6144, },
> +	{ .tmds = 25200000, .n_32k = 4096, .n_44k1 = 5656, .n_48k = 6144, },
> +	{ .tmds = 27000000, .n_32k = 4096, .n_44k1 = 5488, .n_48k = 6144, },
> +	{ .tmds = 28320000, .n_32k = 4096, .n_44k1 = 5586, .n_48k = 6144, },
> +	{ .tmds = 30240000, .n_32k = 4096, .n_44k1 = 5642, .n_48k = 6144, },
> +	{ .tmds = 31500000, .n_32k = 4096, .n_44k1 = 5600, .n_48k = 6144, },
> +	{ .tmds = 32000000, .n_32k = 4096, .n_44k1 = 5733, .n_48k = 6144, },
> +	{ .tmds = 33750000, .n_32k = 4096, .n_44k1 = 6272, .n_48k = 6144, },
> +	{ .tmds = 36000000, .n_32k = 4096, .n_44k1 = 5684, .n_48k = 6144, },
> +	{ .tmds = 40000000, .n_32k = 4096, .n_44k1 = 5733, .n_48k = 6144, },
> +	{ .tmds = 49500000, .n_32k = 4096, .n_44k1 = 5488, .n_48k = 6144, },
> +	{ .tmds = 50000000, .n_32k = 4096, .n_44k1 = 5292, .n_48k = 6144, },
> +	{ .tmds = 54000000, .n_32k = 4096, .n_44k1 = 5684, .n_48k = 6144, },
> +	{ .tmds = 65000000, .n_32k = 4096, .n_44k1 = 7056, .n_48k = 6144, },
> +	{ .tmds = 68250000, .n_32k = 4096, .n_44k1 = 5376, .n_48k = 6144, },
> +	{ .tmds = 71000000, .n_32k = 4096, .n_44k1 = 7056, .n_48k = 6144, },
> +	{ .tmds = 72000000, .n_32k = 4096, .n_44k1 = 5635, .n_48k = 6144, },
> +	{ .tmds = 73250000, .n_32k = 4096, .n_44k1 = 14112, .n_48k = 6144, },
> +	{ .tmds = 74250000, .n_32k = 4096, .n_44k1 = 6272, .n_48k = 6144, },
> +	{ .tmds = 75000000, .n_32k = 4096, .n_44k1 = 5880, .n_48k = 6144, },
> +	{ .tmds = 78750000, .n_32k = 4096, .n_44k1 = 5600, .n_48k = 6144, },
> +	{ .tmds = 78800000, .n_32k = 4096, .n_44k1 = 5292, .n_48k = 6144, },
> +	{ .tmds = 79500000, .n_32k = 4096, .n_44k1 = 4704, .n_48k = 6144, },
> +	{ .tmds = 83500000, .n_32k = 4096, .n_44k1 = 7056, .n_48k = 6144, },
> +	{ .tmds = 85500000, .n_32k = 4096, .n_44k1 = 5488, .n_48k = 6144, },
> +	{ .tmds = 88750000, .n_32k = 4096, .n_44k1 = 14112, .n_48k = 6144, },
> +	{ .tmds = 97750000, .n_32k = 4096, .n_44k1 = 14112, .n_48k = 6144, },
> +	{ .tmds = 101000000, .n_32k = 4096, .n_44k1 = 7056, .n_48k = 6144, },
> +	{ .tmds = 106500000, .n_32k = 4096, .n_44k1 = 4704, .n_48k = 6144, },
> +	{ .tmds = 108000000, .n_32k = 4096, .n_44k1 = 5684, .n_48k = 6144, },
> +	{ .tmds = 115500000, .n_32k = 4096, .n_44k1 = 5712, .n_48k = 6144, },
> +	{ .tmds = 119000000, .n_32k = 4096, .n_44k1 = 5544, .n_48k = 6144, },
> +	{ .tmds = 135000000, .n_32k = 4096, .n_44k1 = 5488, .n_48k = 6144, },
> +	{ .tmds = 146250000, .n_32k = 4096, .n_44k1 = 6272, .n_48k = 6144, },
> +	{ .tmds = 148500000, .n_32k = 4096, .n_44k1 = 5488, .n_48k = 6144, },
> +	{ .tmds = 154000000, .n_32k = 4096, .n_44k1 = 5544, .n_48k = 6144, },
> +	{ .tmds = 162000000, .n_32k = 4096, .n_44k1 = 5684, .n_48k = 6144, },
> +
> +	/* For 297 MHz+ HDMI spec have some other rule for setting N */
> +	{ .tmds = 297000000, .n_32k = 3073, .n_44k1 = 4704, .n_48k = 5120, },
> +	{ .tmds = 594000000, .n_32k = 3073, .n_44k1 = 9408, .n_48k = 10240, },
> +
> +	/* End of table */
> +	{ .tmds = 0,         .n_32k = 0,    .n_44k1 = 0,    .n_48k = 0, },
> +};
> +
>  struct dw_hdmi_qp_i2c {
>  	struct i2c_adapter	adap;
>  
> @@ -59,6 +119,8 @@ struct dw_hdmi_qp {
>  		void *data;
>  	} phy;
>  
> +	struct mutex audio_mutex;

There should be a comment, what is being protected by this mutex.

> +
>  	struct regmap *regm;
>  };
>  

[...]

> +static int dw_hdmi_qp_init_audio_infoframe(struct dw_hdmi_qp *hdmi)
> +{
> +	struct hdmi_audio_infoframe frame;
> +	u8 infoframe_buf[HDMI_INFOFRAME_SIZE(AUDIO)];
> +	int ret = 0;
> +
> +	hdmi_audio_infoframe_init(&frame);
> +
> +	frame.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
> +	frame.sample_frequency = HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
> +	frame.sample_size = HDMI_AUDIO_SAMPLE_SIZE_STREAM;
> +	frame.channels = 2;
> +
> +	ret = hdmi_audio_infoframe_pack(&frame, infoframe_buf,
> +					sizeof(infoframe_buf));
> +	if (ret < 0) {
> +		dev_err(hdmi->dev, "%s: Failed to pack audio infoframe: %d\n",
> +			__func__, ret);
> +		return ret;
> +	}
> +
> +	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS1, &infoframe_buf[3], 2);
> +	dw_hdmi_qp_mod(hdmi,
> +		  PKTSCHED_ACR_TX_EN | PKTSCHED_AUDI_TX_EN,
> +		  PKTSCHED_ACR_TX_EN | PKTSCHED_AUDI_TX_EN,
> +		  PKTSCHED_PKT_EN);
> +
> +	return 0;
> +}
> +
> +static void dw_hdmi_qp_set_audio_infoframe(struct dw_hdmi_qp *hdmi,
> +				    struct hdmi_codec_params *hparms)
> +{
> +	u8 infoframe_buf[HDMI_INFOFRAME_SIZE(AUDIO)];
> +	int ret = 0;
> +
> +	ret = hdmi_audio_infoframe_pack(&hparms->cea, infoframe_buf,
> +					sizeof(infoframe_buf));

Please use existing functions,
drm_atomic_helper_connector_hdmi_update_audio_infoframe() and
drm_atomic_helper_connector_hdmi_clear_audio_infoframe() to manage the
infoframe. The drm_atomic_helper_connector_hdmi_update_infoframes()
function will take care of updating the audio infoframe.

> +	if (!ret) {
> +		dev_err(hdmi->dev, "%s: Failed to pack audio infoframe: %d\n",
> +			__func__, ret);
> +		return;
> +	}
> +
> +	/*
> +	 * AUDI_CONTENTS0: { RSV, HB2, HB1, RSV }
> +	 * AUDI_CONTENTS1: { PB3, PB2, PB1, PB0 }
> +	 * AUDI_CONTENTS2: { PB7, PB6, PB5, PB4 }
> +	 *
> +	 * PB0: CheckSum
> +	 * PB1: | CT3    | CT2  | CT1  | CT0  | F13  | CC2 | CC1 | CC0 |
> +	 * PB2: | F27    | F26  | F25  | SF2  | SF1  | SF0 | SS1 | SS0 |
> +	 * PB3: | F37    | F36  | F35  | F34  | F33  | F32 | F31 | F30 |
> +	 * PB4: | CA7    | CA6  | CA5  | CA4  | CA3  | CA2 | CA1 | CA0 |
> +	 * PB5: | DM_INH | LSV3 | LSV2 | LSV1 | LSV0 | F52 | F51 | F50 |
> +	 * PB6~PB10: Reserved
> +	 *
> +	 * AUDI_CONTENTS0 default value defined by HDMI specification,
> +	 * and shall only be changed for debug purposes.
> +	 * So, we only configure payload byte from PB0~PB7(2 word total).
> +	 */
> +	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS1, &infoframe_buf[3], 2);

This should go to your dw_hdmi_qp_bridge_write_infoframe().

> +
> +	/* Enable ACR, AUDI, AMD */
> +	dw_hdmi_qp_mod(hdmi,
> +		  PKTSCHED_ACR_TX_EN | PKTSCHED_AUDI_TX_EN | PKTSCHED_AMD_TX_EN,
> +		  PKTSCHED_ACR_TX_EN | PKTSCHED_AUDI_TX_EN | PKTSCHED_AMD_TX_EN,
> +		  PKTSCHED_PKT_EN);
> +
> +	/* Enable AUDS */
> +	dw_hdmi_qp_mod(hdmi, PKTSCHED_AUDS_TX_EN, PKTSCHED_AUDS_TX_EN, PKTSCHED_PKT_EN);
> +	mutex_unlock(&hdmi->audio_mutex);
> +}
> +

-- 
With best wishes
Dmitry
