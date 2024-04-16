Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D958A7574
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 22:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32FB10F309;
	Tue, 16 Apr 2024 20:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B4710F309
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 20:22:38 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6CFBF3FC93;
 Tue, 16 Apr 2024 22:22:35 +0200 (CEST)
Date: Tue, 16 Apr 2024 22:22:34 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: David Wronek <david@mainlining.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/panel: Add driver for EDO RM69380 OLED panel
Message-ID: <e2jkc4gs74pe365danyiq22f7s7wqxvj27jrjlzehgsgigf2dd@gai76zslxr7o>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Wronek <david@mainlining.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20240415-raydium-rm69380-driver-v2-0-524216461306@mainlining.org>
 <20240415-raydium-rm69380-driver-v2-2-524216461306@mainlining.org>
 <yccnqb63gp5svx76rudfnphecpatkpwgp2wlfenojebulrigma@xfztf3ox6q7d>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yccnqb63gp5svx76rudfnphecpatkpwgp2wlfenojebulrigma@xfztf3ox6q7d>
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

On 2024-04-15 19:50:49, Dmitry Baryshkov wrote:
> On Mon, Apr 15, 20
[...]
> > +static int rm69380_on(struct rm69380_panel *ctx)
[...]
> ret = mipi_dsi_dcs_set_display_brightness_large(dsi, 0x7ff);

Downstream may send this here, but why?  As far as I've observed, update_status
also sets &backlight_properties.brightness which you configure below.

Try removing this line and maybe also set the initial brightness lower to the
benefit of users' eyes and OLED lifetime?

[...]
> > +
> > +	if (dsi_sec) {
> > +		dev_dbg(dev, "Using Dual-DSI\n");
> > +
> > +		const struct mipi_dsi_device_info info = { "RM69380", 0,

Personally I'm never really sure what to put in the name here, maybe something
that signifies the second DSI interface of the panel?

> > +							   dsi_sec };
> > +
> > +		dev_dbg(dev, "Found second DSI `%s`\n", dsi_sec->name);
> > +
> > +		dsi_sec_host = of_find_mipi_dsi_host_by_node(dsi_sec);
> > +		of_node_put(dsi_sec);
> > +		if (!dsi_sec_host) {
> > +			return dev_err_probe(dev, -EPROBE_DEFER,
> > +					     "Cannot get secondary DSI host\n");
> > +		}
> > +
> > +		ctx->dsi[1] =
> > +			mipi_dsi_device_register_full(dsi_sec_host, &info);
> 
> Either you should be using devm_mipi_dsi_device_register_full() here or
> you should call mipi_dsi_device_unregister() in the error and remove
> paths. I'd suggest the former.

There is also devm_mipi_dsi_attach() which may solve inadequate cleanup handling
in the error paths below, as pointed out by Christophe.

> 
> > +		if (IS_ERR(ctx->dsi[1])) {
> > +			return dev_err_probe(dev, PTR_ERR(ctx->dsi[1]),
> > +					     "Cannot get secondary DSI node\n");
> > +		}
> > +
> > +		dev_dbg(dev, "Second DSI name `%s`\n", ctx->dsi[1]->name);

It looks like you inerited /all/ my debug logging when copy-pasting this setup
from my in-progress dual-DSI dual-DSC Samsung ANA6707 panel driver.  Since it's
all working now, I suggest to remove mostly-useless debug lines like this.

I'll continue the review on v3, as I mainly wanted to extend the initial devm_
suggestion from Dmitry done on v2.

- Marijn
