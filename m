Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F46CDEC34
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 15:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC9710E9B4;
	Fri, 26 Dec 2025 14:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5D310E9B4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 14:23:06 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1C0C23EA6F;
 Fri, 26 Dec 2025 15:23:04 +0100 (CET)
Date: Fri, 26 Dec 2025 15:23:02 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 05/11] drm/panel: Add panel driver for Samsung SOFEF01
 DDIC
Message-ID: <aU6Z6pqinEYgSGd1@SoMainline.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-5-82a87465d163@somainline.org>
 <CAD++jL=X1hX6kmodcOC3+x-w6t+Vg6XTaCMab-Dn=vHAeD82Gw@mail.gmail.com>
 <aU6XXi2HmgjZY8CY@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aU6XXi2HmgjZY8CY@SoMainline.org>
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

On 2025-12-26 15:16:30, Marijn Suijten wrote:
> On 2025-12-26 14:21:37, Linus Walleij wrote:
> ...
> > Only nitpicks follow:
> > 
> > > +       if (ctx->panel_type == PANEL_TYPE_TC01 ||
> > > +           ctx->panel_type == PANEL_TYPE_UT01 ||
> > > +           ctx->panel_type == PANEL_TYPE_UT04) {
> > > +               mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
> > 
> > The sofef00 driver tell us exactly what this sequence is:
> > 
> > #define sofef00_test_key_on_lvl2(ctx) \
> >         mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0x5a, 0x5a)
> > #define sofef00_test_key_off_lvl2(ctx) \
> >         mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0xa5, 0xa5)
> > 
> > I would just rename these two to sofef01_test_key_on/off_lvl2()
> > and use the same helpers in this driver to follow the sofef00 pattern.
> 
> Right, yes.  I think I already brought this up in V1, that some existing
> Samsung drivers call this (the 0xf0 part) the MCS PASSWORD, others call it the
> LEVEL_2_KEY or USER_KEY or ACCESSPROT.
> 
> I'm curious (though should probably look up the patch history) where these names
> come from, which of these names match the sofef01/03/souxp00 DDICs provided
> here, and what they're supposed to mean (MCS: Magic Command Sequence?).

I should have probably looked this up before asking; Manufacturer Command
Sequence.

Likely a generic prefix someone came up with to label commands that are not
part of DCS.

> Then there are possibly a lot more constants we can glean from other drivers,
> though again without confirmation that it's identical on this DDIC.
> 
> - Marijn
