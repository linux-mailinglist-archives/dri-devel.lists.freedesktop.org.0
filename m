Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D17542CFE14
	for <lists+dri-devel@lfdr.de>; Sat,  5 Dec 2020 20:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93AC6E444;
	Sat,  5 Dec 2020 19:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B2C6E444
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Dec 2020 19:15:06 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 44A8A804C8;
 Sat,  5 Dec 2020 20:15:04 +0100 (CET)
Date: Sat, 5 Dec 2020 20:15:02 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 2/2] drm: panel: add Khadas TS050 panel driver
Message-ID: <20201205191502.GB332836@ravnborg.org>
References: <20201204081949.38418-1-narmstrong@baylibre.com>
 <20201204081949.38418-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204081949.38418-3-narmstrong@baylibre.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=-T1gHi2C1pDd2DPyCjwA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

> +
> +static int khadas_ts050_panel_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct khadas_ts050_panel *khadas_ts050;
> +	int err;
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
> +
> +	khadas_ts050 = devm_kzalloc(&dsi->dev, sizeof(*khadas_ts050),
> +				    GFP_KERNEL);
> +	if (!khadas_ts050)
> +		return -ENOMEM;
> +
> +	mipi_dsi_set_drvdata(dsi, khadas_ts050);
> +	khadas_ts050->link = dsi;
> +
> +	err = khadas_ts050_panel_add(khadas_ts050);
> +	if (err < 0)
> +		return err;
> +
> +	return mipi_dsi_attach(dsi);
> +}

If mipi_dsi_attach() failes then da a drm_panel_remove() like this:

	ret = mipi_dsi_attach(dsi);
	if (ret)
		drm_panel_remove(&khadas_ts050->base);

	return ret;

This is again something several panels gets wrong.

With this fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I assume you will fix it while applying.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
