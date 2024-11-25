Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4139D8206
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C4E10E3A9;
	Mon, 25 Nov 2024 09:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RmiHhwjB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A5F10E3A9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:16:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1BF26A413FF;
 Mon, 25 Nov 2024 09:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772EFC4CECE;
 Mon, 25 Nov 2024 09:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732526189;
 bh=0k7jgGvkFXzafjUapZMYG1Qcle4a+6D/0t/ThVVD23g=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=RmiHhwjBNeTuge8/ebrVQFewoge1S35Ob75fEqEVLj4IZb5EuKI7ZiYIUn0ZK60T0
 y6MxkdbKCbojE/THM3VGgR2xTx1TY8QeDBmLixxXQ+CwJ8pAGojZZlVEEn85HuLnTA
 slsTF9clpq3Vm1vecEd297c/C2GlytGzOD9vpLAD/4PVug9KJp80nzikGN02k7OB+h
 l3wa4IeZzsbbFO6cESNxumWpnc+ooZaWV1x5DE1p4e59AvWx4Ow2/uT+1rt+Sba1dc
 RlRl4T6APZhshFRXzu3wPZUea5LXWvXo5pVyRssie73KpTmcPQVd39/T4SK0eQW1vh
 /N6nMYNpbm0PA==
Message-ID: <7e21ca957adf9bea6df99767cc28fe82@kernel.org>
Date: Mon, 25 Nov 2024 09:16:27 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 03/10] drm/tests: hdmi: return meaningful value from
 set_connector_edid()
In-Reply-To: <20241122-hdmi-mode-valid-v4-3-2fee4a83ab79@linaro.org>
References: <20241122-hdmi-mode-valid-v4-3-2fee4a83ab79@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Chen-Yu Tsai" <wens@csie.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Fri, 22 Nov 2024 11:12:59 +0200, Dmitry Baryshkov wrote:
> The set_connector_edid() function returns a bogus 0, performing the
> check on the connector->funcs->fill_modes() result internally. Make the
> function pass the fill_modes()'s return value to the caller and move
> corresponding checks to the caller site.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
