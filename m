Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507C98282B3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 10:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99ABD10E30E;
	Tue,  9 Jan 2024 09:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9108210E30E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 09:07:42 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1rN85E-0007cY-31; Tue, 09 Jan 2024 10:07:40 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1rN859-001R7l-RJ; Tue, 09 Jan 2024 10:07:35 +0100
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1rN859-0002H7-2R;
 Tue, 09 Jan 2024 10:07:35 +0100
Message-ID: <fc30ce4736d43e367108c3651fec6f3b9a4d7852.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] gpu: drm: bridge: cadence: Add a driver and
 platform ops for StarFive JH7110 SoC
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Shengyang Chen <shengyang.chen@starfivetech.com>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Date: Tue, 09 Jan 2024 10:07:35 +0100
In-Reply-To: <20240109072516.24328-3-shengyang.chen@starfivetech.com>
References: <20240109072516.24328-1-shengyang.chen@starfivetech.com>
 <20240109072516.24328-3-shengyang.chen@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: andrzej.hajda@intel.com, tomi.valkeinen@ideasonboard.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 r-ravikumar@ti.com, rfoss@kernel.org, jernej.skrabec@gmail.com,
 u.kleine-koenig@pengutronix.de, conor+dt@kernel.org, jonas@kwiboo.se,
 mripard@kernel.org, robh+dt@kernel.org, aford173@gmail.com,
 neil.armstrong@linaro.org, keith.zhao@starfivetech.com, bbrezillon@kernel.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, jack.zhu@starfivetech.com,
 tzimmermann@suse.de, changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Di, 2024-01-09 at 15:25 +0800, Shengyang Chen wrote:
> +static int cdns_dsi_get_reset(struct device *dev, struct cdns_dsi *dsi)
> +{
> +	dsi->dpi_rst =3D devm_reset_control_get(dev, "dpi");
> +	if (IS_ERR(dsi->dpi_rst))
> +		return PTR_ERR(dsi->dpi_rst);

Please use devm_reset_control_get_exclusive() directly.

Also, consider using devm_reset_control_bulk_get_exclusive() instead,
to control "dpi"/"apb"/"txesc" resets together - if the hardware can
handle deasserting in reversed order.

> +
> +	dsi->apb_rst =3D devm_reset_control_get(dev, "apb");
> +	if (IS_ERR(dsi->apb_rst))
> +		return PTR_ERR(dsi->apb_rst);
> +
> +	dsi->txesc_rst =3D devm_reset_control_get(dev, "txesc");
> +	if (IS_ERR(dsi->txesc_rst))
> +		return PTR_ERR(dsi->txesc_rst);
> +
> +	dsi->txbytehs_rst =3D devm_reset_control_get(dev, "txbytehs");
> +	if (IS_ERR(dsi->txbytehs_rst))
> +		return PTR_ERR(dsi->txbytehs_rst);
> +
> +	return 0;
> +}

regards
Philipp
