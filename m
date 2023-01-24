Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4830B67A470
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 21:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203D210E24C;
	Tue, 24 Jan 2023 20:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C4D10E24C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 20:57:46 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 04E958565F;
 Tue, 24 Jan 2023 21:57:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1674593865;
 bh=m75fPV50PKBt24Roed8UeV+VFummZ7hQF7unHI/F8eY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gYo/pMC5My7OI7n7mCng9xGkC0A0ercwIs3P9NRN6XUNzRQ2c/fZr6xWx6YMeOAJP
 Z9KS8UyilfW2ZvUiJhCmUZ7cv1ESyslEFl2tJkuF1AGL7fdLGXsIdc4TdE5ixumSnG
 9u+Eh/X+hGfmxf4+XKsoD/NTf1pNxYVXq+MfkI17WpN9iBauz21FHo0vOLFy5JUE0q
 PEhOlNHft6opXlZzBntA0QCqRtRoqrIcgU1AUvOZYTtpga1V/c1TB7kRMGO3C/6dOL
 wFP//fo2RRnBAP2c58s4d9LeIeetotU97Veq1EaDHBxfUJ/DCO76wDmEt2nBTvq0Ml
 FKqv34A2Inf+Q==
Message-ID: <04c45739-4175-5e7e-e432-b6da5d61ad32@denx.de>
Date: Tue, 24 Jan 2023 21:57:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v11 14/18] drm: bridge: Generalize Exynos-DSI
 driver into a Samsung DSIM bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-15-jagan@amarulasolutions.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230123151212.269082-15-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/23/23 16:12, Jagan Teki wrote:

[...]

> @@ -6738,6 +6738,15 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
>   F:	drivers/gpu/drm/panel/panel-samsung-db7430.c
>   
> +DRM DRIVER FOR SAMSUNG MIPI DSIM BRIDGE
> +M:	Jagan Teki <jagan@amarulasolutions.com>
> +M:	Marek Szyprowski <m.szyprowski@samsung.com>
> +M:	Inki Dae <inki.dae@samsung.com

Keep the list sorted.

> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	drivers/gpu/drm/bridge/samsung-dsim.c
> +F:	include/drm/bridge/samsung-dsim.h
> +
>   DRM DRIVER FOR SAMSUNG S6D27A1 PANELS
>   M:	Markuss Broks <markuss.broks@gmail.com>
>   S:	Maintained

[...]

With that fixed,

Reviewed-by: Marek Vasut <marex@denx.de>
