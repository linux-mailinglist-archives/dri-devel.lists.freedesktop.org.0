Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D02AAB22A2
	for <lists+dri-devel@lfdr.de>; Sat, 10 May 2025 10:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE76B10E220;
	Sat, 10 May 2025 08:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rhVEDlov";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7309E10E20D;
 Sat, 10 May 2025 08:57:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A70E9614BA;
 Sat, 10 May 2025 08:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA6BC4CEE2;
 Sat, 10 May 2025 08:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746867434;
 bh=qVqQPbhYwA9CnEWX7OYZ4feEjaspab26r13ottr7JkE=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=rhVEDlov9L+J/r108NFtXKxeB4Pdlq7LP7iEEVZptGdLYzku0Bbmh1m1tvQBo7nEp
 wDKYBpOeab+wcGAYTRXEb7zypfMas/HEeqG8wIkhUsv8ZM5S35Aa8G18k1eattrowv
 CtZ0iaNEDT50f7W+bNUjDL54h+N7lX1iCZsqyUb2y6dFLzuWELt+CxYUY/ZUg6lSpf
 bJ625ZD91408z4uBsWHbe8T4/xEvzVun354YFwfd+Ch4lJfWuCJeonn/JsIEcE5waz
 xGDNV83Jpuk6dW4Z02RWrtD1RLj/grawNxsIk4mBJylMFNkBXNuHij3Fltg1czl9J1
 sacUKeF0HCs9A==
Message-ID: <b9d480ecdb95f59b7e9f0af7694800ef@kernel.org>
Date: Sat, 10 May 2025 08:57:11 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 16/22] drm/sti: dvo: convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-16-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-16-b8bc1f16d7aa@bootlin.com>
Cc: asahi@lists.linux.dev, chrome-platform@lists.linux.dev,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, platform-driver-x86@vger.kernel.org,
 "Alain
 Volmat" <alain.volmat@foss.st.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Anusha
 Srivatsa" <asrivats@redhat.com>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>,
 "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Douglas
 Anderson" <dianders@chromium.org>, "Fabio Estevam" <festevam@gmail.com>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Jagan Teki" <jagan@amarulasolutions.com>,
 "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Paul Kocialkowski" <paulk@sys-base.io>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Raphael Gallais-Pou" <rgallaispou@gmail.com>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
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

On Fri, 9 May 2025 15:53:42 +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
>=20
> This driver allocates the DRM bridge separately from the main driver
> private struct, which prevents using the new devm_drm_bridge_alloc()
> API. Simplify the code by replacing the struct drm_bridge pointer with an
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
