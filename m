Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9707150DB
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 23:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5735D10E2F2;
	Mon, 29 May 2023 21:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCC210E2F2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 21:11:24 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 65D193EBA6;
 Mon, 29 May 2023 23:11:21 +0200 (CEST)
Date: Mon, 29 May 2023 23:11:20 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH RFC 03/10] drm/panel: Add LGD panel driver for Sony
 Xperia XZ3
Message-ID: <brmrqeajbq3oyp3jjwmc6tuhiftz764u6az444xw6g7pwf5fr3@5tlp375qwhed>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-3-541c341d6bee@somainline.org>
 <ccc97880-8e74-b85b-9679-9c12c44c4b99@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccc97880-8e74-b85b-9679-9c12c44c4b99@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, Caleb Connolly <caleb@connolly.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sam Ravnborg <sam@ravnborg.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-22 04:16:20, Dmitry Baryshkov wrote:
<snip>
> > +	if (ctx->dsi->dsc) {
> 
> dsi->dsc is always set, thus this condition can be dropped.

I want to leave room for possibly running the panel without DSC (at a
lower resolution/refresh rate, or at higher power consumption if there
is enough BW) by not assigning the pointer, if we get access to panel
documentation: probably one of the magic commands sent in this driver
controls it but we don't know which.

> > +		drm_dsc_pps_payload_pack(&pps, ctx->dsi->dsc);
> > +
> > +		ret = mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
> > +		if (ret < 0) {
> > +			dev_err(panel->dev, "failed to transmit PPS: %d\n", ret);
> > +			goto fail;
> > +		}
> > +		ret = mipi_dsi_compression_mode(ctx->dsi, true);
> > +		if (ret < 0) {
> > +			dev_err(dev, "failed to enable compression mode: %d\n", ret);
> > +			goto fail;
> > +		}
> > +
> > +		msleep(28);
> > +	}
> > +
> > +	ctx->prepared = true;
> > +	return 0;
> > +
> > +fail:
> > +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> > +	regulator_disable(ctx->vddio);
> > +	return ret;
> > +}
<snip>
> > +	/* This panel only supports DSC; unconditionally enable it */

On that note I should perhaps reword this.

> > +	dsi->dsc = dsc = devm_kzalloc(&dsi->dev, sizeof(*dsc), GFP_KERNEL);
> 
> I think double assignments are frowned upon.

Ack.

> 
> > +	if (!dsc)
> > +		return -ENOMEM;
> > +
> > +	dsc->dsc_version_major = 1;
> > +	dsc->dsc_version_minor = 1;
> > +
> > +	dsc->slice_height = 32;
> > +	dsc->slice_count = 2;
> > +	// TODO: Get hdisplay from the mode
> 
> Would you like to fix the TODO?

I can't unless either migrating to drm_bridge (is that doable?) or
expand drm_panel.  That's a larger task, but I don't think this driver
is the right place to track that desire.  Should I drop the comment
entirely or reword it?

> > +	WARN_ON(1440 % dsc->slice_count);
> > +	dsc->slice_width = 1440 / dsc->slice_count;

<snip>

- Marijn
