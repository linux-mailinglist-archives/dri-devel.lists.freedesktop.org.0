Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5439BA2B37B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 21:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F7B10E95A;
	Thu,  6 Feb 2025 20:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="iNPRurgj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C194010E94B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 20:40:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1738874421; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CEFH29ZszeHLlTPnHhnLcSDNF95+9xVJ7xSm5+gUM++gmmyT+xzZZRHncrFKg0cbc7zWOPxMYJaOqDAaUKtM0sooaYJMSwEeDpeYH4c35NSuyfY1NM4ceVa+5DblHIgfLrW1yo8z7J0YxFWPYdaQaHwKcXLoMaglEyyXTjzD5Rw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1738874421;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=kACVQDpqq9CudHavl6P9Sm6lVRImK08+cDYq9z8OiAE=; 
 b=DfQdeOyA1fDWl4xo9Q5gwbYCFfsWBLF8x/yN+k7RQc7HttKYrqJGXHMv5+sxcXN2LAHSlUUd18RBqp84g10nt+ODk4Og3QRItuTh+dtG0hL1JbGKxmJsZ5jIHDyCIFVcsGELasfCJcVf3UVPVZiBJ2Dy2bjtsFUZfcnej/zzX1k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
 dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738874421; 
 s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=kACVQDpqq9CudHavl6P9Sm6lVRImK08+cDYq9z8OiAE=;
 b=iNPRurgj5kX2Ur4Ui6vWaTf1fuT8rxX1mPSoq1Lc4+q0QbBpQC2yEoyvVg5+xjOF
 4Ic+KI4+JFku2+MGafvCzDZ3KmZAS0fY2I4DNgAuiTYEb3QTme+a6pQVTNt6Y8VDkYe
 KO7sDGxlhAQD83KvzJ1SeulGqhzz+spi60YqoxmA=
Received: by mx.zohomail.com with SMTPS id 173887441820050.268923216844996;
 Thu, 6 Feb 2025 12:40:18 -0800 (PST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Jianfeng Liu <liujianfeng1994@gmail.com>,
 Niklas Cassel <cassel@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>,
 Kever Yang <kever.yang@rock-chips.com>, Johan Jonker <jbx6244@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Algea Cao <algea.cao@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v5 1/3] drm/bridge: synopsys: Add audio support for
 dw-hdmi-qp
Date: Thu, 06 Feb 2025 15:40:15 -0500
Message-ID: <13709044.uLZWGnKmhe@earth>
In-Reply-To: <db29945e-565a-490f-8a8c-387ecd47a198@cherry.de>
References: <20250203171925.126309-1-detlev.casanova@collabora.com>
 <20250203171925.126309-2-detlev.casanova@collabora.com>
 <db29945e-565a-490f-8a8c-387ecd47a198@cherry.de>
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

Hi Quentin,

On Tuesday, 4 February 2025 04:59:12 EST Quentin Schulz wrote:
> Hi Detlev,
> 
> Just some drive-by comment inline.
> 
> On 2/3/25 6:16 PM, Detlev Casanova wrote:
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
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Tested-by: Quentin Schulz <quentin.schulz@cherry.de>
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > ---
> > 
> >   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 497 +++++++++++++++++++
> >   1 file changed, 497 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c index
> > b281cabfe992e..ea5d8599cb56a 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> 
> [...]
> 
> > +static int dw_hdmi_qp_match_tmds_n_table(struct dw_hdmi_qp *hdmi,
> > +				   unsigned long pixel_clk,
> > +				   unsigned long freq)
> > +{
> > +	const struct dw_hdmi_audio_tmds_n *tmds_n = NULL;
> > +	int i;
> > +
> > +	for (i = 0; common_tmds_n_table[i].tmds != 0; i++) {
> > +		if (pixel_clk == common_tmds_n_table[i].tmds) {
> > +			tmds_n = &common_tmds_n_table[i];
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (tmds_n == NULL)
> > +		return -ENOENT;
> > +
> > +	switch (freq) {
> > +	case 32000:
> > +		return tmds_n->n_32k;
> > +	case 44100:
> > +	case 88200:
> > +	case 176400:
> > +		return (freq / 44100) * tmds_n->n_44k1;
> > +	case 48000:
> > +	case 96000:
> > +	case 192000:
> > +		return (freq / 48000) * tmds_n->n_48k;
> > +	default:
> > +		return -ENOENT;
> > +	}
> > +}
> > +
> > +static u64 dw_hdmi_qp_audio_math_diff(unsigned int freq, unsigned int n,
> > +				unsigned int pixel_clk)
> > +{
> > +	u64 final, diff;
> > +	u64 cts;
> > +
> > +	final = (u64)pixel_clk * n;
> > +
> > +	cts = final;
> > +	do_div(cts, 128 * freq);
> > +
> > +	diff = final - (u64)cts * (128 * freq);
> > +
> > +	return diff;
> 
> I believe
> 
> final = (u64)pixel_clk * n;
> do_div(cts, 128 * freq);
> diff = final - (u64)cts * (128 * freq);
> 
> is just an elaborate way of doing
> 
> ((u64)pixel_clk * n) % (128 * freq)
> 
> ? If that's the case, then I believe do_div(a, b) actually already
> returns the remainder of a by b.
> 
> If that's the case, isn't that function simply:
> 
> return do_div(mul_u32_u32(pixel_clk, n), mul_u32_u32(freq, 128))
> 
> ?
> 
> We could probably replace mul_u32_u32(freq, 128) with freq * 128
> considering that dw_hdmi_qp_match_tmds_n_table expects freq to be <
> 192000, so we won't get an overflow with that.
> 
> mul_u32_u32(pixel_clk, n) does the u32*u32->u64 without a temporary C
> variable.

I tested this and it is indeed doing the same. I'll change it and also change 
the function return type to u32 as that is what do_div() returns.
That makes sense as the reminder of a/b can't be wider than the size of b.

We just need one variable as the first argument of do_div() is used to store 
the integer division result.

> [...]
> 
> > +static void dw_hdmi_qp_set_audio_interface(struct dw_hdmi_qp *hdmi,
> > +					   struct hdmi_codec_daifmt 
*fmt,
> > +					   struct hdmi_codec_params 
*hparms)
> > +{
> > +	u32 conf0 = 0;
> > +
> > +	/* Reset the audio data path of the AVP */
> > +	dw_hdmi_qp_write(hdmi, AVP_DATAPATH_PACKET_AUDIO_SWINIT_P,
> > GLOBAL_SWRESET_REQUEST); +
> > +	/* Disable AUDS, ACR, AUDI */
> > +	dw_hdmi_qp_mod(hdmi, 0,
> > +		  PKTSCHED_ACR_TX_EN | PKTSCHED_AUDS_TX_EN | 
PKTSCHED_AUDI_TX_EN,
> > +		  PKTSCHED_PKT_EN);
> > +
> > +	/* Clear the audio FIFO */
> > +	dw_hdmi_qp_write(hdmi, AUDIO_FIFO_CLR_P, AUDIO_INTERFACE_CONTROL0);
> > +
> > +	/* Select I2S interface as the audio source */
> > +	dw_hdmi_qp_mod(hdmi, AUD_IF_I2S, AUD_IF_SEL_MSK,
> > AUDIO_INTERFACE_CONFIG0); +
> > +	/* Enable the active i2s lanes */
> > +	switch (hparms->channels) {
> > +	case 7 ... 8:
> > +		conf0 |= I2S_LINES_EN(3);
> > +		fallthrough;
> > +	case 5 ... 6:
> > +		conf0 |= I2S_LINES_EN(2);
> > +		fallthrough;
> > +	case 3 ... 4:
> > +		conf0 |= I2S_LINES_EN(1);
> > +		fallthrough;
> > +	default:
> > +		conf0 |= I2S_LINES_EN(0);
> > +		break;
> > +	}
> > +
> > +	dw_hdmi_qp_mod(hdmi, conf0, I2S_LINES_EN_MSK, 
AUDIO_INTERFACE_CONFIG0);
> > +
> > +	/*
> > +	 * Enable bpcuv generated internally for L-PCM, or received
> > +	 * from stream for NLPCM/HBR.
> > +	 */
> > +	switch (fmt->bit_fmt) {
> > +	case SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE:
> > +		conf0 = (hparms->channels == 8) ? AUD_HBR : AUD_ASP;
> > +		conf0 |= I2S_BPCUV_RCV_EN;
> > +		break;
> > +	default:
> > +		conf0 = AUD_ASP | I2S_BPCUV_RCV_DIS;
> > +		break;
> > +	}
> > +
> > +	dw_hdmi_qp_mod(hdmi, conf0, I2S_BPCUV_RCV_MSK | AUD_FORMAT_MSK,
> > +		  AUDIO_INTERFACE_CONFIG0);
> > +
> > +	/* Enable audio FIFO auto clear when overflow */
> > +	dw_hdmi_qp_mod(hdmi, AUD_FIFO_INIT_ON_OVF_EN, 
AUD_FIFO_INIT_ON_OVF_MSK,
> > +		  AUDIO_INTERFACE_CONFIG0);
> 
> This is all very I2S-centric while the HDMI controllers on RK3588 do
> have the ability (according to the TRM) to use S/PDIF instead of I2S. I
> assume the driver should be able to know which format to use based on
> simple-audio-card,format property? Is that correct? Then current support
> which doesn't even check for I2S would be fine and not conflict with a
> later commit which would add support for S/PDIF? (Essentially asking if
> we need another DT property for the HDMI controller node or elsewhere to
> specify which mode to run in instead of expecting it to always be I2S).

The hdmi_codec_daifmt::fmt field already has this information, based on the 
simple-audio-card,format = "i2s"; field in the device tree.

I could add a condition in dw_hdmi_qp_audio_prepare() to fail with -EINVAL if 
the devicetree specifies anything else than "i2s" for now.

I'm not willing to implement support for the SPDIF path for now, mainly 
because there's no need for that yet (I2S works well) and the downstream 
kernel doesn't implemented it, meaning it hasn't been tested a lot anyway.

Regards,
Detlev.


