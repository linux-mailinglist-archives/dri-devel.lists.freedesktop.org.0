Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B43A27D48E9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 09:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC2C10E2EB;
	Tue, 24 Oct 2023 07:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 574 seconds by postgrey-1.36 at gabe;
 Tue, 24 Oct 2023 00:23:42 UTC
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ED210E26F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 00:23:42 +0000 (UTC)
Received: from [192.168.68.112]
 (ppp118-210-136-142.adl-adc-lon-bras33.tpg.internode.on.net
 [118.210.136.142])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B500F20034;
 Tue, 24 Oct 2023 08:13:55 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1698106442;
 bh=xf45kMR6lFEzv3Mn9oNtZZ7uAthFMPRd7r9ZXIrWv7I=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=GUx5geqNxZPF0MtIxzsvsFTVESMyuDuDjKHiWQqcyqRia/okbxSE6uKQbWe5g5re7
 isGkc4IGs2cHg8pQT52IimK+B9wasH2ws3jzSxcyJ2gEG3WnW1ey5CCyqVtaHHPwHa
 uckM7NPQt/eBPF/181w1K6w9tX3stP3Hjc6j7N9fSlPeIyjF/ZgUoAwl+QzFiaKKUT
 9bhPHskstheOQUIYsyupO760PTI21905eYXRhNDgDGmxKi0fqdHZqHLv3SPuwrm/5w
 k+0crspYly9IZA0eq5iC9rzeTsO2uoNRITV5ohc6W8L0kgJB9+/Y0v+tsAuT06YqpS
 j7oxYADgJPEIQ==
Message-ID: <d4f77e13d3c5de613877450fd25bf5f77f1331a2.camel@codeconstruct.com.au>
Subject: Re: [PATCH] drm: Use device_get_match_data()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Joel
 Stanley <joel@jms.id.au>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>, NXP Linux
 Team <linux-imx@nxp.com>, Marek Vasut <marex@denx.de>, Stefan Agner
 <stefan@agner.ch>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 24 Oct 2023 10:43:55 +1030
In-Reply-To: <20231020125214.2930329-1-robh@kernel.org>
References: <20231020125214.2930329-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 24 Oct 2023 07:48:38 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2023-10-20 at 07:52 -0500, Rob Herring wrote:
> Use preferred device_get_match_data() instead of of_match_device() to
> get the driver match data in a single step. With this, adjust the
> includes to explicitly include the correct headers. That also serves as
> preparation to remove implicit includes within the DT headers
> (of_device.h in particular).
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/gpu/drm/armada/armada_crtc.c    | 24 +++++++-----------------
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 10 ++++------

For Aspeed:

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Thanks!
