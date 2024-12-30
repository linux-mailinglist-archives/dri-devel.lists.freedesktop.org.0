Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8816D9FEEBF
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 11:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8A610E632;
	Tue, 31 Dec 2024 10:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=debian.org header.i=@debian.org header.b="UuxtOpUj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C2C10E008
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 02:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org; 
 s=smtpauto.stravinsky;
 h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=BeWo63al5Q9jX6hi9OUFCf7WTwROUVRvfEBDDGUsRVE=; b=UuxtOpUjYXKk5/JoecKoQ3msk4
 F+Oljxs5RTcVAhtK+npvBAieFFYxYAhDVpKs15tdmNiu/SFuOG6/KxUkIGwcbfjgnpjT62dTNA4TX
 F9blddjoK/oa8yVfLbTjOUq23hObaMLDJD1cCgBmX2JFgPotpQEaAFDwikB8egvFPoipQ5jRWIwTe
 h+gxPqvsuybuw2IfwcpGkyvx7d8hugEGE9clxi5KDXbSc0Vi6SHHSbq7B5LqPjM+xAAlCW2nNqvAI
 ESRZNKlamxMxtlhphmh//+8D15akoxpsdKhTrCHxT3o+nsVSMGeEJKDYTSQyRusd0MLybo9b2Eyh4
 ogfVAjgQ==;
Received: from authenticated user by stravinsky.debian.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <zeha@debian.org>)
 id 1tS5Or-005cYz-TA; Mon, 30 Dec 2024 02:20:58 +0000
Date: Mon, 30 Dec 2024 03:20:55 +0100
From: Chris Hofstaedtler <zeha@debian.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 quentin.schulz@cherry.de, Heiko Stuebner <heiko.stuebner@cherry.de>,
 Daniel Semkowicz <dse@thaumatec.com>, Dmitry Yashin <dmt.yashin@gmail.com>
Subject: Re: [PATCH v4 1/3] drm/bridge/synopsys: Add MIPI DSI2 host
 controller bridge
Message-ID: <Z3IDh0TOAKqaovz2@per.namespace.at>
References: <20241209231021.2180582-1-heiko@sntech.de>
 <20241209231021.2180582-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241209231021.2180582-2-heiko@sntech.de>
X-Debian-User: zeha
X-Mailman-Approved-At: Tue, 31 Dec 2024 10:34:56 +0000
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

Hi,

On Tue, Dec 10, 2024 at 12:10:19AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Add a Synopsys Designware MIPI DSI host DRM bridge driver for their
> DSI2 host controller, based on the Rockchip version from the driver
> rockchip/dw-mipi-dsi2.c in their vendor-kernel with phy & bridge APIs.
> 
> While the driver is heavily modelled after the previous IP, the register
> set of this DSI2 controller is completely different and there are also
> additional properties like the variable-width phy interface.
> 
> Tested-by: Daniel Semkowicz <dse@thaumatec.com>
> Tested-by: Dmitry Yashin <dmt.yashin@gmail.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
[..]
> +static void dw_mipi_dsi2_set_vid_mode(struct dw_mipi_dsi2 *dsi2)
> +{
> +	u32 val = 0, mode;
> +	int ret;
> +
> +	if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
> +		val |= BLK_HFP_HS_EN;
> +
> +	if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
> +		val |= BLK_HBP_HS_EN;
> +
> +	if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
> +		val |= BLK_HSA_HS_EN;

For all three of these: is setting an ENable bit the right thing to
turn features *off*?

> +	if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
> +		val |= VID_MODE_TYPE_BURST;
> +	else if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> +		val |= VID_MODE_TYPE_NON_BURST_SYNC_PULSES;
> +	else
> +		val |= VID_MODE_TYPE_NON_BURST_SYNC_EVENTS;
> +
> +	regmap_write(dsi2->regmap, DSI2_DSI_VID_TX_CFG, val);
> +
> +	regmap_write(dsi2->regmap, DSI2_MODE_CTRL, VIDEO_MODE);
> +	ret = regmap_read_poll_timeout(dsi2->regmap, DSI2_MODE_STATUS,
> +				       mode, mode & VIDEO_MODE,
> +				       1000, MODE_STATUS_TIMEOUT_US);
> +	if (ret < 0)
> +		dev_err(dsi2->dev, "failed to enter video mode\n");
> +}
...

Chris

