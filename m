Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B148FD11E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 16:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631AD10E65A;
	Wed,  5 Jun 2024 14:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E192B897E0
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 14:49:15 +0000 (UTC)
Received: from i53875b65.versanet.de ([83.135.91.101] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1sErwP-00012r-Mi; Wed, 05 Jun 2024 16:48:41 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>,
 Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH 13/14] drm/bridge: synopsys: Add DW HDMI QP TX controller
 driver
Date: Wed, 05 Jun 2024 16:48:40 +0200
Message-ID: <2554679.TLnPLrj5Ze@diego>
In-Reply-To: <20240601-b4-rk3588-bridge-upstream-v1-13-f6203753232b@collabora.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
 <20240601-b4-rk3588-bridge-upstream-v1-13-f6203753232b@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Am Samstag, 1. Juni 2024, 15:12:35 CEST schrieb Cristian Ciocaltea:
> The Synopsys DesignWare HDMI 2.1 Quad-Pixel (QP) TX controller supports
> the following features, among others:
> 
> * Fixed Rate Link (FRL)
> * 4K@120Hz and 8K@60Hz video modes
> * Variable Refresh Rate (VRR) including Quick Media Switching (QMS), aka
>   Cinema VRR
> * Fast Vactive (FVA), aka Quick Frame Transport (QFT)
> * SCDC I2C DDC access
> * TMDS Scrambler enabling 2160p@60Hz with RGB/YCbCr4:4:4
> * YCbCr4:2:0 enabling 2160p@60Hz at lower HDMI link speeds
> * Multi-stream audio
> * Enhanced Audio Return Channel (EARC)
> 
> Add driver to enable basic support, i.e. RGB output up to 4K@60Hz,
> without audio, CEC or any HDMI 2.1 specific features.
> 
> Co-developed-by: Algea Cao <algea.cao@rock-chips.com>
> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/Makefile     |   2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 787 +++++++++++++++++++++++++
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h | 831 +++++++++++++++++++++++++++
>  include/drm/bridge/dw_hdmi.h                 |   8 +
>  4 files changed, 1627 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/Makefile b/drivers/gpu/drm/bridge/synopsys/Makefile
> index ce715562e9e5..8354e4879f70 100644
> --- a/drivers/gpu/drm/bridge/synopsys/Makefile
> +++ b/drivers/gpu/drm/bridge/synopsys/Makefile

> +static int dw_hdmi_qp_i2c_read(struct dw_hdmi *hdmi,
> +			       unsigned char *buf, unsigned int length)
> +{
> +	struct dw_hdmi_i2c *i2c = hdmi->i2c;
> +	int stat;
> +
> +	if (!i2c->is_regaddr) {
> +		dev_dbg(hdmi->dev, "set read register address to 0\n");
> +		i2c->slave_reg = 0x00;
> +		i2c->is_regaddr = true;
> +	}
> +
> +	while (length--) {
> +		reinit_completion(&i2c->cmp);
> +
> +		dw_hdmi_qp_mod(hdmi, i2c->slave_reg++ << 12, I2CM_ADDR,
> +			       I2CM_INTERFACE_CONTROL0);
> +
> +		dw_hdmi_qp_mod(hdmi, I2CM_FM_READ, I2CM_WR_MASK,
> +			       I2CM_INTERFACE_CONTROL0);

Somehow the segment handling is present in the rest of the i2c code here, but
not the actual handling for reads.

The vendor-kernel does:

-               dw_hdmi_qp_mod(hdmi, I2CM_FM_READ, I2CM_WR_MASK,
-                              I2CM_INTERFACE_CONTROL0);
+               if (i2c->is_segment)
+                       dw_hdmi_qp_mod(hdmi, I2CM_EXT_READ, I2CM_WR_MASK,
+                                      I2CM_INTERFACE_CONTROL0);
+               else
+                       dw_hdmi_qp_mod(hdmi, I2CM_FM_READ, I2CM_WR_MASK,
+                                      I2CM_INTERFACE_CONTROL0);

Without this change, connecting to a DVI display does not work, and
reading the EDID ends in the "i2c read error" below.

Adding the segment handling as above makes the DVI connection
work (as it does in the vendor-kernel).

So it would be nice if you could maybe incorporate this in the next version?


Thanks
Heiko


> +
> +		stat = wait_for_completion_timeout(&i2c->cmp, HZ / 10);
> +		if (!stat) {
> +			dev_err(hdmi->dev, "i2c read timed out\n");
> +			dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
> +			return -EAGAIN;
> +		}
> +
> +		/* Check for error condition on the bus */
> +		if (i2c->stat & I2CM_NACK_RCVD_IRQ) {
> +			dev_err(hdmi->dev, "i2c read error\n");
> +			dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
> +			return -EIO;
> +		}
> +
> +		*buf++ = dw_hdmi_qp_read(hdmi, I2CM_INTERFACE_RDDATA_0_3) & 0xff;
> +		dw_hdmi_qp_mod(hdmi, 0, I2CM_WR_MASK, I2CM_INTERFACE_CONTROL0);
> +	}
> +
> +	i2c->is_segment = false;
> +
> +	return 0;
> +}



