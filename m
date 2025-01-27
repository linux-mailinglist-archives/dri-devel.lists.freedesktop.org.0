Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7F4A1DD6B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 21:34:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B7D10E0E9;
	Mon, 27 Jan 2025 20:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="HsZUtmfF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7133F10E0E9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 20:34:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1738010072; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JvPNQXAjRihfB45A8uBw9MuIKFhA55RWkOYdOW5G/IJgIGWw2P0IzIgRWSBPu3yEFtLYxZVvuihariIzSeguPN8fyFI8ht0ZbP9wFqXke30pupo2A6T+/fh8i7anvPMMUreq7JeGqjCNCU6KCVwUajnWPJqzRSgkJA0aJ/IJ8RA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1738010072;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=dRwpVnoMHPQMiPuilTgQ/bbK1mdxwl1rfZxvWnvOjZE=; 
 b=BVSG0sqGkJyE3vhMA9CcO0LEc2avYnEbFuHMq+Uq2PRsjEr+QUq0nlhiuIjzyzzcOaNiA2LZTd3NF6V+XbPwOoP5pWsmx52bEeo9RHuLxh67csnpdt/0EYMJWjpNYSlS0ZV2lSsZVMJfi3JUf9zT4umcMqC9qDyZ872HaTZ2YGE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
 dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738010072; 
 s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=dRwpVnoMHPQMiPuilTgQ/bbK1mdxwl1rfZxvWnvOjZE=;
 b=HsZUtmfFZQqYGo7HkY6orYjhRMEyiZ6FM1+qo2ZmZxBQ25ac8iER6fsPld80uC2B
 nsu+6JanqVBZ0jJsPBcquVcGRsGd5HRi2TTE4JslHuk2PvTb/wS1R+KHs/MVDHzBCR1
 Y0wLyCtA3QOj7kAUIvhfHWX9xX7NXsVqWJiKm+sY=
Received: by mx.zohomail.com with SMTPS id 1738010064065940.6144380297951;
 Mon, 27 Jan 2025 12:34:24 -0800 (PST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Alexey Charkov <alchark@gmail.com>, Jianfeng Liu <liujianfeng1994@gmail.com>, 
 Dragan Simic <dsimic@manjaro.org>, FUKAUMI Naoki <naoki@radxa.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Johan Jonker <jbx6244@gmail.com>, Kever Yang <kever.yang@rock-chips.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Algea Cao <algea.cao@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v2 1/2] drm/bridge: synopsys: Add audio support for
 dw-hdmi-qp
Date: Mon, 27 Jan 2025 15:34:21 -0500
Message-ID: <4954567.GXAFRqVoOG@earth>
In-Reply-To: <mpj5o2kdadkwsutjdtmze6riycdan3w7mohgqdzxiwfpvlh7zx@eocnqikqwrwt>
References: <20250123222850.223255-1-detlev.casanova@collabora.com>
 <20250123222850.223255-2-detlev.casanova@collabora.com>
 <mpj5o2kdadkwsutjdtmze6riycdan3w7mohgqdzxiwfpvlh7zx@eocnqikqwrwt>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
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

On Friday, 24 January 2025 00:01:38 EST Dmitry Baryshkov wrote:
> On Thu, Jan 23, 2025 at 05:28:06PM -0500, Detlev Casanova wrote:
> > From: Sugar Zhang <sugar.zhang@rock-chips.com>
> > 
> > Register the dw-hdmi-qp bridge driver as an HDMI audio codec.
> > 
> > The register values computation functions (for n) are based on the
> > downstream driver, as well as the register writing functions.
> > 
> > The driver uses the generic HDMI Codec framework in order to implement
> > the HDMI audio support.
> > 
> > Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > ---
> > 
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 424 +++++++++++++++++++
> >  1 file changed, 424 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c index
> > b281cabfe992e..f79d38de4c6c4 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > @@ -36,6 +36,66 @@
> > 
> >  #define SCRAMB_POLL_DELAY_MS	3000
> > 
> > +/*
> > + * Unless otherwise noted, entries in this table are 100% optimization.
> > + * Values can be obtained from hdmi_compute_n() but that function is
> > + * slow so we pre-compute values we expect to see.
> > + *
> > + * All 32k and 48k values are expected to be the same (due to the way
> > + * the math works) for any rate that's an exact kHz.
> > + */
> > +static const struct dw_hdmi_audio_tmds_n {
> > +	unsigned long tmds;
> > +	unsigned int n_32k;
> > +	unsigned int n_44k1;
> > +	unsigned int n_48k;
> > +} common_tmds_n_table[] = {
> > +	{ .tmds = 25175000, .n_32k = 4096, .n_44k1 = 12854, .n_48k = 6144, 
},
> > +	{ .tmds = 25200000, .n_32k = 4096, .n_44k1 = 5656, .n_48k = 6144, },
> 
> These values do not seem to match the tables in HDMI, Appendix D. Is
> there any reason for that?

From what I see, this seems to be because CTS is never set in the driver (same 
behavior as downstream driver, which overrides CTS).
So for values where CTS != TMDS/1000 in the recommendations table, N is 
different here to make up for it.

Do you think I should Improve the behavior to set CTS when needed ?

This also made me realize that in this patch set, a CTS value is used but 
never set to anything different to 0, which needs to be changed anyway.

> > +	{ .tmds = 27000000, .n_32k = 4096, .n_44k1 = 5488, .n_48k = 6144, },
> > +	{ .tmds = 28320000, .n_32k = 4096, .n_44k1 = 5586, .n_48k = 6144, },
> > +	{ .tmds = 30240000, .n_32k = 4096, .n_44k1 = 5642, .n_48k = 6144, },
> > +	{ .tmds = 31500000, .n_32k = 4096, .n_44k1 = 5600, .n_48k = 6144, },
> > +	{ .tmds = 32000000, .n_32k = 4096, .n_44k1 = 5733, .n_48k = 6144, },
> > +	{ .tmds = 33750000, .n_32k = 4096, .n_44k1 = 6272, .n_48k = 6144, },
> > +	{ .tmds = 36000000, .n_32k = 4096, .n_44k1 = 5684, .n_48k = 6144, },
> > +	{ .tmds = 40000000, .n_32k = 4096, .n_44k1 = 5733, .n_48k = 6144, },
> > +	{ .tmds = 49500000, .n_32k = 4096, .n_44k1 = 5488, .n_48k = 6144, },
> > +	{ .tmds = 50000000, .n_32k = 4096, .n_44k1 = 5292, .n_48k = 6144, },
> > +	{ .tmds = 54000000, .n_32k = 4096, .n_44k1 = 5684, .n_48k = 6144, },
> > +	{ .tmds = 65000000, .n_32k = 4096, .n_44k1 = 7056, .n_48k = 6144, },
> > +	{ .tmds = 68250000, .n_32k = 4096, .n_44k1 = 5376, .n_48k = 6144, },
> > +	{ .tmds = 71000000, .n_32k = 4096, .n_44k1 = 7056, .n_48k = 6144, },
> > +	{ .tmds = 72000000, .n_32k = 4096, .n_44k1 = 5635, .n_48k = 6144, },
> > +	{ .tmds = 73250000, .n_32k = 4096, .n_44k1 = 14112, .n_48k = 6144, 
},
> > +	{ .tmds = 74250000, .n_32k = 4096, .n_44k1 = 6272, .n_48k = 6144, },
> > +	{ .tmds = 75000000, .n_32k = 4096, .n_44k1 = 5880, .n_48k = 6144, },
> > +	{ .tmds = 78750000, .n_32k = 4096, .n_44k1 = 5600, .n_48k = 6144, },
> > +	{ .tmds = 78800000, .n_32k = 4096, .n_44k1 = 5292, .n_48k = 6144, },
> > +	{ .tmds = 79500000, .n_32k = 4096, .n_44k1 = 4704, .n_48k = 6144, },
> > +	{ .tmds = 83500000, .n_32k = 4096, .n_44k1 = 7056, .n_48k = 6144, },
> > +	{ .tmds = 85500000, .n_32k = 4096, .n_44k1 = 5488, .n_48k = 6144, },
> > +	{ .tmds = 88750000, .n_32k = 4096, .n_44k1 = 14112, .n_48k = 6144, 
},
> > +	{ .tmds = 97750000, .n_32k = 4096, .n_44k1 = 14112, .n_48k = 6144, 
},
> > +	{ .tmds = 101000000, .n_32k = 4096, .n_44k1 = 7056, .n_48k = 6144, 
},
> > +	{ .tmds = 106500000, .n_32k = 4096, .n_44k1 = 4704, .n_48k = 6144, 
},
> > +	{ .tmds = 108000000, .n_32k = 4096, .n_44k1 = 5684, .n_48k = 6144, 
},
> > +	{ .tmds = 115500000, .n_32k = 4096, .n_44k1 = 5712, .n_48k = 6144, 
},
> > +	{ .tmds = 119000000, .n_32k = 4096, .n_44k1 = 5544, .n_48k = 6144, 
},
> > +	{ .tmds = 135000000, .n_32k = 4096, .n_44k1 = 5488, .n_48k = 6144, 
},
> > +	{ .tmds = 146250000, .n_32k = 4096, .n_44k1 = 6272, .n_48k = 6144, 
},
> > +	{ .tmds = 148500000, .n_32k = 4096, .n_44k1 = 5488, .n_48k = 6144, 
},
> > +	{ .tmds = 154000000, .n_32k = 4096, .n_44k1 = 5544, .n_48k = 6144, 
},
> > +	{ .tmds = 162000000, .n_32k = 4096, .n_44k1 = 5684, .n_48k = 6144, 
},
> > +
> > +	/* For 297 MHz+ HDMI spec have some other rule for setting N */
> > +	{ .tmds = 297000000, .n_32k = 3073, .n_44k1 = 4704, .n_48k = 5120, 
},
> > +	{ .tmds = 594000000, .n_32k = 3073, .n_44k1 = 9408, .n_48k = 10240, 
},
> > +
> > +	/* End of table */
> > +	{ .tmds = 0,         .n_32k = 0,    .n_44k1 = 0,    .n_48k = 0, },
> > +};
> > +
> > 
> >  struct dw_hdmi_qp_i2c {
> >  
> >  	struct i2c_adapter	adap;
> > 
> > @@ -83,6 +143,326 @@ static void dw_hdmi_qp_mod(struct dw_hdmi_qp *hdmi,
> > unsigned int data,> 
> >  	regmap_update_bits(hdmi->regm, reg, mask, data);
> >  
> >  }
> > 
> > +static struct dw_hdmi_qp *dw_hdmi_qp_from_bridge(struct drm_bridge
> > *bridge) +{
> > +	struct dw_hdmi_qp *hdmi = container_of(bridge, struct dw_hdmi_qp,
> > bridge); +
> > +	return hdmi;
> 
> Just `return container_of(bridge, struct dw_hdmi_qp, bridge);`
> 
> > +}
> > +
> 
> [...]
> 
> > +
> > +static int dw_hdmi_qp_audio_enable(struct drm_connector *connector,
> > +			    struct drm_bridge *bridge)
> > +{
> > +	struct dw_hdmi_qp *hdmi = dw_hdmi_qp_from_bridge(bridge);
> > +
> > +	if (connector->status == connector_status_connected)
> > +		dw_hdmi_qp_mod(hdmi, 0, 
AVP_DATAPATH_PACKET_AUDIO_SWDISABLE,
> > GLOBAL_SWDISABLE); +
> > +	return 0;
> > +}
> > +
> > +static int dw_hdmi_qp_audio_prepare(struct drm_connector *connector,
> > +			     struct drm_bridge *bridge,
> > +			     struct hdmi_codec_daifmt *fmt,
> > +			     struct hdmi_codec_params *hparms)
> > +{
> > +	struct dw_hdmi_qp *hdmi = dw_hdmi_qp_from_bridge(bridge);
> > +	struct drm_connector_state *conn_state =
> > +		drm_atomic_helper_connector_duplicate_state(connector);
> > +	bool ref2stream = false;
> > +	unsigned long long tmds_char_rate = conn_state->hdmi.tmds_char_rate;
> > +
> > +	drm_atomic_helper_connector_destroy_state(connector, conn_state);
> 
> This looks suspicious. I'd suggest storing tmds_char_rate to struct
> dw_hdmi_qp in .atomic_commit instead of playing with the state.

It is destroyed because it was duplicated above. I could store the value in 
.atomic_enable (is that what you meant ?) indeed.

> > +
> > +	if (connector->status != connector_status_connected) {
> > +		dev_dbg(hdmi->dev, "connector status is not connected\n");
> > +		return 0;
> > +	}
> > +
> > +	if (fmt->bit_clk_provider | fmt->frame_clk_provider) {
> > +		dev_err(hdmi->dev, "unsupported clock settings\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (fmt->bit_fmt == SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE)
> > +		ref2stream = true;
> > +
> > +	dw_hdmi_qp_set_audio_interface(hdmi, fmt, hparms);
> > +	dw_hdmi_qp_set_sample_rate(hdmi, tmds_char_rate, hparms-
>sample_rate);
> > +	dw_hdmi_qp_set_channel_status(hdmi, hparms->iec.status, ref2stream);
> > +	drm_atomic_helper_connector_hdmi_update_audio_infoframe(connector,
> > &hparms->cea); +
> > +	return 0;
> > +}
> > +
> > +static void dw_hdmi_qp_audio_disable(struct drm_connector *connector,
> > +			      struct drm_bridge *bridge)
> > +{
> > +	struct dw_hdmi_qp *hdmi = container_of(bridge, struct dw_hdmi_qp,
> > bridge); +
> > +	if (connector->status != connector_status_connected) {
> > +		dev_dbg(hdmi->dev, "connector status is not connected\n");
> > +		return;
> > +	}
> 
> Will audio stream be disabled on disconnect?

No, indeed, I need to review the disconnect sequence, as the HDMI audio 
registers cannot be accessed when the VOP has been disabled.

> And anyway the InfoFrame should be cleared by a call to
> drm_atomic_helper_connector_hdmi_clear_audio_infoframe().
> 
> > +
> > +	/*
> > +	 * Keep ACR, AUDI, AUDS packet always on to make SINK device
> > +	 * active for better compatibility and user experience.
> > +	 *
> > +	 * This also fix POP sound on some SINK devices which wakeup
> > +	 * from suspend to active.
> > +	 */
> > +	dw_hdmi_qp_mod(hdmi, I2S_BPCUV_RCV_DIS, I2S_BPCUV_RCV_MSK,
> > +		  AUDIO_INTERFACE_CONFIG0);
> > +	dw_hdmi_qp_mod(hdmi, AUDPKT_PBIT_FORCE_EN | AUDPKT_CHSTATUS_OVR_EN,
> > +		  AUDPKT_PBIT_FORCE_EN_MASK | AUDPKT_CHSTATUS_OVR_EN_MASK,
> > +		  AUDPKT_CONTROL0);
> > +
> > +	dw_hdmi_qp_mod(hdmi, AVP_DATAPATH_PACKET_AUDIO_SWDISABLE,
> > +		  AVP_DATAPATH_PACKET_AUDIO_SWDISABLE, GLOBAL_SWDISABLE);
> > +}
> > +
> > 
> >  static int dw_hdmi_qp_i2c_read(struct dw_hdmi_qp *hdmi,
> >  
> >  			       unsigned char *buf, unsigned int length)
> >  
> >  {
> > 
> > @@ -361,6 +741,40 @@ static int dw_hdmi_qp_config_drm_infoframe(struct
> > dw_hdmi_qp *hdmi,> 
> >  	return 0;
> >  
> >  }
> > 
> > +static int dw_hdmi_qp_config_audio_infoframe(struct dw_hdmi_qp *hdmi,
> > +					     const u8 *buffer, size_t 
len)
> > +{
> > +	/*
> > +	 * AUDI_CONTENTS0: { RSV, HB2, HB1, RSV }
> > +	 * AUDI_CONTENTS1: { PB3, PB2, PB1, PB0 }
> > +	 * AUDI_CONTENTS2: { PB7, PB6, PB5, PB4 }
> > +	 *
> > +	 * PB0: CheckSum
> > +	 * PB1: | CT3    | CT2  | CT1  | CT0  | F13  | CC2 | CC1 | CC0 |
> > +	 * PB2: | F27    | F26  | F25  | SF2  | SF1  | SF0 | SS1 | SS0 |
> > +	 * PB3: | F37    | F36  | F35  | F34  | F33  | F32 | F31 | F30 |
> > +	 * PB4: | CA7    | CA6  | CA5  | CA4  | CA3  | CA2 | CA1 | CA0 |
> > +	 * PB5: | DM_INH | LSV3 | LSV2 | LSV1 | LSV0 | F52 | F51 | F50 |
> > +	 * PB6~PB10: Reserved
> > +	 *
> > +	 * AUDI_CONTENTS0 default value defined by HDMI specification,
> > +	 * and shall only be changed for debug purposes.
> > +	 * So, we only configure payload byte from PB0~PB7(2 word total).
> > +	 */
> > +	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS1, &buffer[3], 2);
> 
> Please also update PKT_AUDI_CONTENTS0, in case it gets damaged somehow.

These are simply the values in the first 4 bytes of buffer then ?

> > +
> > +	/* Enable ACR, AUDI, AMD */
> > +	dw_hdmi_qp_mod(hdmi,
> > +		  PKTSCHED_ACR_TX_EN | PKTSCHED_AUDI_TX_EN | 
PKTSCHED_AMD_TX_EN,
> > +		  PKTSCHED_ACR_TX_EN | PKTSCHED_AUDI_TX_EN | 
PKTSCHED_AMD_TX_EN,
> > +		  PKTSCHED_PKT_EN);
> > +
> > +	/* Enable AUDS */
> > +	dw_hdmi_qp_mod(hdmi, PKTSCHED_AUDS_TX_EN, PKTSCHED_AUDS_TX_EN,
> > PKTSCHED_PKT_EN); +
> > +	return 0;
> > +}
> > +
> > 
> >  static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
> >  
> >  					    struct drm_bridge_state 
*old_state)
> >  
> >  {
> > 
> > @@ -477,6 +891,9 @@ static int dw_hdmi_qp_bridge_write_infoframe(struct
> > drm_bridge *bridge,> 
> >  	case HDMI_INFOFRAME_TYPE_DRM:
> >  		return dw_hdmi_qp_config_drm_infoframe(hdmi, buffer, len);
> > 
> > +	case HDMI_INFOFRAME_TYPE_AUDIO:
> > +		return dw_hdmi_qp_config_audio_infoframe(hdmi, buffer, len);
> > +
> > 
> >  	default:
> >  		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", 
type);
> >  		return 0;
> > 
> > @@ -494,6 +911,9 @@ static const struct drm_bridge_funcs
> > dw_hdmi_qp_bridge_funcs = {> 
> >  	.hdmi_tmds_char_rate_valid = 
dw_hdmi_qp_bridge_tmds_char_rate_valid,
> >  	.hdmi_clear_infoframe = dw_hdmi_qp_bridge_clear_infoframe,
> >  	.hdmi_write_infoframe = dw_hdmi_qp_bridge_write_infoframe,
> > 
> > +	.hdmi_audio_startup = dw_hdmi_qp_audio_enable,
> > +	.hdmi_audio_shutdown = dw_hdmi_qp_audio_disable,
> > +	.hdmi_audio_prepare = dw_hdmi_qp_audio_prepare,
> > 
> >  };
> >  
> >  static irqreturn_t dw_hdmi_qp_main_hardirq(int irq, void *dev_id)
> > 
> > @@ -603,6 +1023,10 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct
> > platform_device *pdev,> 
> >  	if (IS_ERR(hdmi->bridge.ddc))
> >  	
> >  		return ERR_CAST(hdmi->bridge.ddc);
> > 
> > +	hdmi->bridge.hdmi_audio_max_i2s_playback_channels = 8;
> > +	hdmi->bridge.hdmi_audio_dev = dev;
> > +	hdmi->bridge.hdmi_audio_dai_port = 1;
> > +
> > 
> >  	ret = devm_drm_bridge_add(dev, &hdmi->bridge);
> >  	if (ret)
> >  	
> >  		return ERR_PTR(ret);

Regards,

Detlev.


