Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A8670CE15
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 00:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7B610E02C;
	Mon, 22 May 2023 22:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B10F10E02C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 22:38:52 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1EF773EB5B;
 Tue, 23 May 2023 00:38:50 +0200 (CEST)
Date: Tue, 23 May 2023 00:38:48 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH RFC 06/10] drm/panel/samsung-sofef01: Add panel driver
 for Sony Xperia 5 / 10 II
Message-ID: <6axjpyhseqhjrh7u6a6j2lhhefjqxuz5klvtqcyex6wgcinjpf@l73bzdydkv6s>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-6-541c341d6bee@somainline.org>
 <f34cd6a8-6d6d-9dcf-b681-56439416c4b4@linaro.org>
 <bd0b0193-90f1-d3e7-32f0-ed400d575b5c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd0b0193-90f1-d3e7-32f0-ed400d575b5c@linaro.org>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-22 18:30:08, Konrad Dybcio wrote:
> On 22.05.2023 03:19, Dmitry Baryshkov wrote:
> > On 22/05/2023 00:23, Marijn Suijten wrote:
> >> This SOFEF01-M Display-IC driver supports two modes with different
> >> compatibles to differentiate between slightly different physical sizes
> >> (panels) found on the Xperia 5 (6.1") and 10 II (6.0").
> >>
> >> It is currently also used to hardcode significantly higher fake porches
> >> for the Xperia 5, which are unused in transfers due to this being a
> >> command-mode panel but do have an effect on the clock rates set by
> >> dsi_host.c.  Without higher clock rates this panel fails to achieve
> >> 60fps and has significant tearing artifacts, while the same calculated
> >> clock rate works perfectly fine on the Xperia 10 II.

<snip>

> >> +/* Sony Xperia 5 (kumano bahamut) */
> >> +static const struct drm_display_mode samsung_sofef01_m_bahamut_mode = {
> >> +    /*
> >> +     * WARNING: These massive porches are wrong/useless for CMDmode
> >> +     * (and not defined in downstream DTS) but necessary to bump dsi
> >> +     * clocks higher, so that we can achieve proper 60fps without tearing.
> >> +     */
> >> +    .clock = (1080 + 156 + 8 + 8) * (2520 + 2393 + 8 + 8) * 60 / 1000,
> >> +    .hdisplay = 1080,
> >> +    .hsync_start = 1080 + 156,
> >> +    .hsync_end = 1080 + 156 + 8,
> >> +    .htotal = 1080 + 156 + 8 + 8,
> >> +    .vdisplay = 2520,
> >> +    .vsync_start = 2520 + 2393,
> >> +    .vsync_end = 2520 + 2393 + 8,
> >> +    .vtotal = 2520 + 2393 + 8 + 8,
> >> +    .width_mm = 61,
> >> +    .height_mm = 142,
> >> +};
> >> +
> >> +/* Sony Xperia 10 II (seine pdx201) */
> >> +static const struct drm_display_mode samsung_sofef01_m_pdx201_mode = {
> >> +    .clock = (1080 + 8 + 8 + 8) * (2520 + 8 + 8 + 8) * 60 / 1000,
> >> +    .hdisplay = 1080,
> >> +    .hsync_start = 1080 + 8,
> >> +    .hsync_end = 1080 + 8 + 8,
> >> +    .htotal = 1080 + 8 + 8 + 8,
> >> +    .vdisplay = 2520,
> >> +    .vsync_start = 2520 + 8,
> >> +    .vsync_end = 2520 + 8 + 8,
> >> +    .vtotal = 2520 + 8 + 8 + 8,
> >> +    .width_mm = 60,
> >> +    .height_mm = 139,
> >> +};
> >> +
> >> +static const struct of_device_id samsung_sofef01_m_of_match[] = {
> >> +    { .compatible = "samsung,sofef01-m-bahamut", .data = &samsung_sofef01_m_bahamut_mode },
> >> +    { .compatible = "samsung,sofef01-m-pdx201", .data = &samsung_sofef01_m_pdx201_mode },
> > 
> > Are there really two panels? Can we use one mode for both usecases?
> The porches differ by a significant margin but that may or may not
> matter for cmd mode.. If we come to unify them, one can add width-mm
> (or something like that) in the device tree if that turns out to be
> the only difference.

See patch description: they matter in that I can abuse them to force a
higher pclk on the DSI, otherwise the Xperia 5 refuses to vsync at 60fps
(and has artifacts) while the Xperia 10 II runs flawless (but I should
check the clock tree to confirm that the value is the same).

Downstream has:

    qcom,mdss-dsi-panel-clockrate = <1132293600>;

But that is for the bitclk, which should theoretically be multiplied by
lanes=4 and divided by bpp=24 for the pclk, and divided by 8 for the
byte clock (without being multiplied by lanes...?).

I do think I have the panel names now, which we could use to
differentiate these actually-different panels on the same Display-IC
instead.

- Marijn
