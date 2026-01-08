Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8DAD0186A
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 09:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6A610E69E;
	Thu,  8 Jan 2026 08:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gcK59WjK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B466D10E69E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 08:13:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 60F9E43D2B;
 Thu,  8 Jan 2026 08:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A5DC116C6;
 Thu,  8 Jan 2026 08:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767859990;
 bh=zKx0mVwbH19vuBhzvaR+1yZmiHRKxSzYZXrkt7qWcIc=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=gcK59WjK6IwUT12wechfhjhX6s021QUj4wR7GFRWe/KHrOOI3w1Ng2AHChaciqJyk
 84J6i7OP5B4eBbukfnRtk1mcnlTmicyXHcH7d0B9Y/9fuds5G/84Wn4KhDPu2V3C5n
 YIwklbf//9x22qXMeYp3ZifHW1tJ9vP/hnDRZWAWI6eJSoCAc3he9cRGeMO+K+ekpt
 k/mfqIsnh1JOoXYQOxoEstfHecTbd+Zr+ysnpOT3EVU2FrT6Rv5yiDCo50IQDk6XCJ
 BL3RXp8kntOF+PxwjWBcAcQRUuEIn8irecdDRYyHoZUz6lztsTu4W1kjoHK9/xo2TT
 umoQWDPjU5gpw==
Message-ID: <3d61916afc22b4ef596cee46473a29dd@kernel.org>
Date: Thu, 08 Jan 2026 08:13:07 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 2/6] drm/meson/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-2-ef48a517828e@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-2-ef48a517828e@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Hui Pu" <Hui.Pu@gehealthcare.com>,
 "Inki
 Dae" <inki.dae@samsung.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jerome
 Brunet" <jbrunet@baylibre.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Kevin
 Hilman" <khilman@baylibre.com>,
 "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Magnus Damm" <magnus.damm@gmail.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Seung-Woo
 Kim" <sw0312.kim@samsung.com>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Tomi Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>
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

On Wed, 7 Jan 2026 17:22:00 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>=20
> dw_hdmi->bridge is used only in dw_hdmi_top_thread_irq(), so in order to
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
