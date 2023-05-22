Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B3470CDFB
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 00:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2955A10E2C4;
	Mon, 22 May 2023 22:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D32C10E2C4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 22:32:33 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 36B2C3F20F;
 Tue, 23 May 2023 00:32:31 +0200 (CEST)
Date: Tue, 23 May 2023 00:32:30 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH RFC 06/10] drm/panel/samsung-sofef01: Add panel driver
 for Sony Xperia 5 / 10 II
Message-ID: <gzhxxdh235nsbjbns37thi33rpk546ynkihihjiam46pkngkud@opwtr2swvdau>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-6-541c341d6bee@somainline.org>
 <f34cd6a8-6d6d-9dcf-b681-56439416c4b4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f34cd6a8-6d6d-9dcf-b681-56439416c4b4@linaro.org>
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

On 2023-05-22 04:19:45, Dmitry Baryshkov wrote:
> On 22/05/2023 00:23, Marijn Suijten wrote:
> > This SOFEF01-M Display-IC driver supports two modes with different
> > compatibles to differentiate between slightly different physical sizes
> > (panels) found on the Xperia 5 (6.1") and 10 II (6.0").
> > 
> > It is currently also used to hardcode significantly higher fake porches
> > for the Xperia 5, which are unused in transfers due to this being a
> > command-mode panel but do have an effect on the clock rates set by
> > dsi_host.c.  Without higher clock rates this panel fails to achieve
> > 60fps and has significant tearing artifacts, while the same calculated
> > clock rate works perfectly fine on the Xperia 10 II.

<snip>

> > +/* Sony Xperia 5 (kumano bahamut) */
> > +static const struct drm_display_mode samsung_sofef01_m_bahamut_mode = {
> > +	/*
> > +	 * WARNING: These massive porches are wrong/useless for CMDmode
> > +	 * (and not defined in downstream DTS) but necessary to bump dsi
> > +	 * clocks higher, so that we can achieve proper 60fps without tearing.
> > +	 */
> > +	.clock = (1080 + 156 + 8 + 8) * (2520 + 2393 + 8 + 8) * 60 / 1000,
> > +	.hdisplay = 1080,
> > +	.hsync_start = 1080 + 156,
> > +	.hsync_end = 1080 + 156 + 8,
> > +	.htotal = 1080 + 156 + 8 + 8,
> > +	.vdisplay = 2520,
> > +	.vsync_start = 2520 + 2393,
> > +	.vsync_end = 2520 + 2393 + 8,
> > +	.vtotal = 2520 + 2393 + 8 + 8,
> > +	.width_mm = 61,
> > +	.height_mm = 142,
> > +};
> > +
> > +/* Sony Xperia 10 II (seine pdx201) */
> > +static const struct drm_display_mode samsung_sofef01_m_pdx201_mode = {
> > +	.clock = (1080 + 8 + 8 + 8) * (2520 + 8 + 8 + 8) * 60 / 1000,
> > +	.hdisplay = 1080,
> > +	.hsync_start = 1080 + 8,
> > +	.hsync_end = 1080 + 8 + 8,
> > +	.htotal = 1080 + 8 + 8 + 8,
> > +	.vdisplay = 2520,
> > +	.vsync_start = 2520 + 8,
> > +	.vsync_end = 2520 + 8 + 8,
> > +	.vtotal = 2520 + 8 + 8 + 8,
> > +	.width_mm = 60,
> > +	.height_mm = 139,
> > +};
> > +
> > +static const struct of_device_id samsung_sofef01_m_of_match[] = {
> > +	{ .compatible = "samsung,sofef01-m-bahamut", .data = &samsung_sofef01_m_bahamut_mode },
> > +	{ .compatible = "samsung,sofef01-m-pdx201", .data = &samsung_sofef01_m_pdx201_mode },
> 
> Are there really two panels? Can we use one mode for both usecases?

See the commit description where I explained exactly this: the panels
have different dimensions (6.1" vs 6.0", hence different DPI) and I also
abuse this to hack in higher clock rates via fake porches.

I just ended up on a scary website that supposedly contains the panel
names:

- Xperia 5 (bahamut, 6.1"): AMB609TC01
- Xperia 10 II (pdx201, 6.0"): AMS597UT01

- Marijn
