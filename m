Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404539F530B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 18:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FF410EA2F;
	Tue, 17 Dec 2024 17:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EogvqqU9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4020310EA2F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 17:24:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 55A1F5C5E33;
 Tue, 17 Dec 2024 17:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB3A0C4CED7;
 Tue, 17 Dec 2024 17:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734456295;
 bh=1neTtSopNryfSXJpUTztXfgdin2CdL3yui9SkHic7sc=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=EogvqqU9oOnJ5EIFzyyngkskqdGRCP/nWMjNGQJtCFKlESW9sUMqjJVTyNyVoQnq+
 4yNdtA2nMz0N1XY2WBX1TdDY+vqBXBMoOHrORVPaD+OOb1J/1G7Dttwkf65CrfLYsA
 qiKUoUCw4nKMckzclhvvPO3LcLATPPlSJhGbmKJZAT3FXKUfKqVLnHkSVxKAx5Cs97
 /F6P3waG2AKau25BW5taRar4r1CPCr3bVwUimy9TR5Mh/vjduIIlAuZmwMOAUI1Pkk
 zjqJQOKuyDMXS6Nkhys8TXhpfnApHj8yLwZTaVkPcMvjTzmaYhpRa149+pxMeY2N8f
 5XHqodI69Xq+w==
Message-ID: <2dad2c52bb2babf3af0196f17c74a9fa@kernel.org>
Date: Tue, 17 Dec 2024 17:24:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v7 06/10] drm/display/hdmi: implement hotplug functions
In-Reply-To: <20241217-drm-bridge-hdmi-connector-v7-6-cb9df2b6a515@linaro.org>
References: <20241217-drm-bridge-hdmi-connector-v7-6-cb9df2b6a515@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, "Alain
 Volmat" <alain.volmat@foss.st.com>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Andy Yan" <andy.yan@rock-chips.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>,
 "Inki Dae" <inki.dae@samsung.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Jaroslav Kysela" <perex@perex.cz>,
 "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Mark Brown" <broonie@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Phong LE" <ple@baylibre.com>, "Raphael
 Gallais-Pou" <rgallaispou@gmail.com>,
 "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Russell King" <linux@armlinux.org.uk>, "Sandy
 Huang" <hjc@rock-chips.com>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Takashi Iwai" <tiwai@suse.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Tue, 17 Dec 2024 02:40:28 +0200, Dmitry Baryshkov wrote:
> The HDMI Connectors need to perform a variety of tasks when the HDMI
> connector state changes. Such tasks include setting or invalidating CEC
> address, notifying HDMI codec driver, updating scrambler data, etc.
> 
> Implementing such tasks in a driver-specific callbacks is error prone.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
