Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4DB40BAFE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 00:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC386E82B;
	Tue, 14 Sep 2021 22:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91DA6E82B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 22:12:35 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id g1so1545456lfj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 15:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LAvaIUH5OlRWAZQfOb+bWm3uVreewxT3eR+cClts1uI=;
 b=VLrCs/+hNIGuWHNfFM8FPpo9MdASxRdZfjTQbnUJQyNoarhnB48pzOHj92Uv+amr9p
 ixzRcYtYvH4tHeMTkq392YF521gX9qRP6RXpjY/MbnIpiM/U1DAP4rT3mhItZ+smgYPC
 HAnvOKCP691XE//yBgTqBGfOzo3Xk8LHh+rXW30yKTdtiIQEgJZOMlPkWV+fJ3uxpW4R
 nToOeYf0EHRW6z3YX/fLoUtleulbtYB1Liz6pppbcIZmFmkKstGWGpmXGDPpdxxXQDOO
 To6zI2pt1uDGWX1qSHzdUDUBiwjbHPMgxHrVOk9ocyyjcFoQBRhXrj0omC1wbF+Moi96
 n6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LAvaIUH5OlRWAZQfOb+bWm3uVreewxT3eR+cClts1uI=;
 b=hurwVRHSwbCAnClt03tqO2xdexq/sKcvWPw53U2eaZkbtttNDs6TCYKQAjiWbCeABo
 Q6FUgXb2Fg0XvAAoTl6IbMDD26P8IgmU03By8MX8UObtiCjtsnnR5/mnx7C2yK4aNJIw
 a9r5ZIifqLPFY/+mDwTRlSFpKHOtG6ZYB1EJj0TpERe483TQelTR/Ma8+8uxHS5yHLxa
 9WxiYj35Rzse6yIqrzbrejOt3sLr6mWukmlDdIypd3Dc2vQxypPuUftHEQDLMW58thcZ
 PoGFNiCXHDMWmZrOv711l86VRtwm8igVM+0wRf0ZHnzDxkPcLfPIjHHunZ/nzkpLNIOb
 7/lg==
X-Gm-Message-State: AOAM5326oARObNQKFbgNbJ8FC4IFXbYseUyfVfvqyfTapQAiqXnIuEIj
 M3NLqBTtP4VRvKm33ZEOnuZeTwjIes/Twjra7necWQ==
X-Google-Smtp-Source: ABdhPJwu3ztXRgAHEffeDYZFOfptVugQFO781IvsJ0Ym9L4qfm8T9QJBx3b1mwEoJsYA+Z6NYJX/ewEtSqtF71Fz60g=
X-Received: by 2002:a05:6512:132a:: with SMTP id
 x42mr14797863lfu.291.1631657553855; 
 Tue, 14 Sep 2021 15:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210914202202.1702601-1-dianders@chromium.org>
In-Reply-To: <20210914202202.1702601-1-dianders@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Sep 2021 00:12:22 +0200
Message-ID: <CACRpkdaTb4_UfFzCqw=fiAnQhHD+1sDDua529KdGQbgMVfjYBw@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] eDP: Support probing eDP panels dynamically
 instead of hardcoding
To: Douglas Anderson <dianders@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 MSM <linux-arm-msm@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Adam Ford <aford173@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andreas Kemnade <andreas@kemnade.info>, 
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Anson Huang <Anson.Huang@nxp.com>, 
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Chen-Yu Tsai <wens@csie.org>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Corentin Labbe <clabbe@baylibre.com>, 
 Daniel Thompson <daniel.thompson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Dmitry Osipenko <digetx@gmail.com>, Emil Velikov <emil.velikov@collabora.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, 
 Fabio Estevam <festevam@gmail.com>, Fabrice Gasnier <fabrice.gasnier@st.com>, 
 Florian Fainelli <f.fainelli@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Grygorii Strashko <grygorii.strashko@ti.com>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Joel Stanley <joel@jms.id.au>, Jonathan Hunter <jonathanh@nvidia.com>,
 Kees Cook <keescook@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Lionel Debieve <lionel.debieve@st.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 =?UTF-8?Q?Martin_J=C3=BCcker?= <martin.juecker@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Michael Walle <michael@walle.cc>, 
 NXP Linux Team <linux-imx@nxp.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nishanth Menon <nm@ti.com>, Olivier Moysan <olivier.moysan@st.com>, 
 Otavio Salvador <otavio@ossystems.com.br>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Razvan Stefanescu <razvan.stefanescu@microchip.com>,
 Robert Richter <rric@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, Tony Lindgren <tony@atomide.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Will Deacon <will@kernel.org>, William Cohen <wcohen@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-sunxi@lists.linux.dev, linux-tegra <linux-tegra@vger.kernel.org>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Sep 14, 2021 at 10:22 PM Douglas Anderson <dianders@chromium.org> wrote:

> Version 5 of this series just fixes the panel ID encode macro to be
> cleaner and adds Jani's review tags.
>
> It could possibly be ready to land?

Definitely IMO, the kernel look so much better after this change,
so for the series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
