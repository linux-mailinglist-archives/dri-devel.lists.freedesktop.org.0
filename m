Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1AE6E3C95
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 00:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF8E10E0D8;
	Sun, 16 Apr 2023 22:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC8110E0D8
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 22:13:41 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A167C85D46;
 Mon, 17 Apr 2023 00:13:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1681683220;
 bh=7PbI+KkaZZTLDdNEdsw5NBsMDYvFroQp2MXTg73mOGg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZhDuNUxN0+2P/RHekLgAnF5qlsp1A87kFpzFMpmbmp41IS9MMEMGyOqojc8s748ZP
 XGjFD+cIhvShS2Zk7a2HI2lQ27ZhrQsQCe98sE0ojdnwZwdnFTqGL/jzWBC0OujrjK
 NAeJlQmIom2f1mo4IY0l3URQef1vvTAyIbCIZxMgO1m7XPQ9HK0nSH61dfkfiIOJLN
 E/T7WImkN94KuKPwH/o2tSQrlN2As1EzxtzyHvv0fQbUfeHtKDQKIPdjDiSRv6iSBA
 W4OSgbe3R+wBRnfSHlIwHBFTUnpMnTZq7omK4NJ1Pdron0TF8WTvBlGt+Btw/mPciC
 je+xh+pCueseg==
Message-ID: <807aa6c6-bbea-abcc-172d-17e22d1a3988@denx.de>
Date: Mon, 17 Apr 2023 00:13:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 5/6] drm: bridge: samsung-dsim: Support non-burst mode
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230415104104.5537-1-aford173@gmail.com>
 <20230415104104.5537-5-aford173@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230415104104.5537-5-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 aford@beaconembedded.com, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, m.szyprowski@samsung.com,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/15/23 12:41, Adam Ford wrote:
> The high-speed clock is hard-coded to the burst-clock
> frequency specified in the device tree.  However, when
> using devices like certain bridge chips without burst mode
> and varying resolutions and refresh rates, it may be
> necessary to set the high-speed clock dynamically based
> on the desired pixel clock for the connected device.

The link rate negotiation should happen internally between the nearest 
bridge and DSIM, so please add that to DRM core instead of hacking 
around it by tweaking the HS clock again.
