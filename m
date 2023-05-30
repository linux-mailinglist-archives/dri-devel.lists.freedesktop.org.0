Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E50C7158DC
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 10:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8981010E0F6;
	Tue, 30 May 2023 08:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B748210E0F6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 08:41:21 +0000 (UTC)
Received: from SoMainline.org (82-72-63-87.cable.dynamic.v4.ziggo.nl
 [82.72.63.87])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 8B8B820311;
 Tue, 30 May 2023 10:41:18 +0200 (CEST)
Date: Tue, 30 May 2023 10:41:17 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 03/10] drm/panel: Add LGD panel driver for Sony
 Xperia XZ3
Message-ID: <63qt5jmdi5qg7tvhbb7vk75kz53wmygc7iubwprfhcc3hvgwuv@ildrzq32ese3>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-3-541c341d6bee@somainline.org>
 <ccc97880-8e74-b85b-9679-9c12c44c4b99@linaro.org>
 <brmrqeajbq3oyp3jjwmc6tuhiftz764u6az444xw6g7pwf5fr3@5tlp375qwhed>
 <617c8f8a-1fc7-c6a0-eaa5-ce75ff2adc1b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <617c8f8a-1fc7-c6a0-eaa5-ce75ff2adc1b@linaro.org>
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
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-30 09:24:24, Neil Armstrong wrote:
> Hi Marijn, Dmitry, Caleb, Jessica,
> 
> On 29/05/2023 23:11, Marijn Suijten wrote:
> > On 2023-05-22 04:16:20, Dmitry Baryshkov wrote:
> > <snip>
> >>> +	if (ctx->dsi->dsc) {
> >>
> >> dsi->dsc is always set, thus this condition can be dropped.
> > 
> > I want to leave room for possibly running the panel without DSC (at a
> > lower resolution/refresh rate, or at higher power consumption if there
> > is enough BW) by not assigning the pointer, if we get access to panel
> > documentation: probably one of the magic commands sent in this driver
> > controls it but we don't know which.
> 
> I'd like to investigate if DSC should perhaps only be enabled if we
> run non certain platforms/socs ?
> 
> I mean, we don't know if the controller supports DSC and those particular
> DSC parameters so we should probably start adding something like :
> 
> static drm_dsc_config dsc_params_qcom = {}
> 
> static const struct of_device_id panel_of_dsc_params[] = {
> 	{ .compatible = "qcom,sm8150", , .data = &dsc_params_qcom },
> 	{ .compatible = "qcom,sm8250", , .data = &dsc_params_qcom },
> 	{ .compatible = "qcom,sm8350", , .data = &dsc_params_qcom },
> 	{ .compatible = "qcom,sm8450", , .data = &dsc_params_qcom },
> };

I'd absolutely hate hardcoding a list of compatible SoC names in a panel
driver.  For one these lists will fall out of date really soon even if
we store this list in a generic place: even the current DPU catalog and
new entries floating on the lists weren't faithfully representing DSC
capabilities (but that's all being / been fixed now).

What's more, most of these panel drivers are "hardcoded" for a specific
(smartphone) device (and SoC...) since we don't (usually) have the
DrIC/panel name nor documentation to make the commands generic enough.
I don't think we should be specific on that end, while being generic on
the DSC side.

That does mean I'll remove the if (dsc) here, as Dmitry noted most of
this driver expects/requires it is enabled.

> ...
> static int sony_akatsuki_lgd_probe(struct mipi_dsi_device *dsi)
> ...
> 	const struct of_device_id *match;
> 
> ...
> 	match = of_match_node(panel_of_dsc_params, of_root);
> 	if (match && match->data) {
> 		dsi->dsc = devm_kzalloc(&dsi->dev, sizeof(*dsc), GFP_KERNEL);
> 		memcpy(dsi->dsc, match->data, sizeof(*dsc));
> 	} else {
> 		dev_warn(&dsi->dev, "DSI controller is not marked as supporting DSC\n");
> 	}
> ...
> }
> 
> and probably bail out if it's a DSC only panel.
> 
> We could alternatively match on the DSI controller's dsi->host->dev instead of the SoC root compatible.

I'd much rather have the DSI host/controller state whether it is capable
of DSC (likely allowing us to expose different modes for panels that
support toggling DSC), but for starters also validate (in DPU?) that the
pointer is NULL when the hardware does not support it (but maybe that
already happens implicitly somewhere in e.g.
dpu_encoder_virt_atomic_mode_set when finding the DSC blocks).

- Marijn
