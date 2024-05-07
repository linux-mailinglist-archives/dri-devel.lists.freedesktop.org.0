Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC618BDD3B
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 10:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3DB10F0B1;
	Tue,  7 May 2024 08:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="RZGqeEsS";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="QPZnrgN6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68A010F0B8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 08:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1715071081; x=1746607081;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kCgSfPagde6d/ABPspOMI3lsg3aDrKX9SBMWiVfXbrc=;
 b=RZGqeEsSyD7e/qN24QnJRmygNZ3cfg6FBt6UqUHC8TEBXrL+2xWVXjgF
 9lgZxhmlk0Ou7raMtsHYYmdKn0Gu8PzZAK0J4zIh/ifK4y4yw5p2+g4NN
 /ERgx0OVreySAatiMXuJdrG7vmS5sFANjRjAAv5mV8pJvquxNH1UNSSOU
 m5ikZfkTfB0uGfCiPVOdCd2vW1BvjkV6WSIG+IlfUktcFr/E38RaRot+w
 WqSgGOLRgaef33E9y93Jix+dMQW9vsDWczvh2aJO6UoyC20HWei3ZN3uS
 yKFE3KwvJf1DSarFesnvmBnNi1C/MeXPsjI/LvHr5UXk6SqbzgjNJc8eW w==;
X-CSE-ConnectionGUID: Svc8qAVLTSiOeuN7nyehnw==
X-CSE-MsgGUID: 2I61W6DfS5iDfT/LbGMx+A==
X-IronPort-AV: E=Sophos;i="6.07,260,1708383600"; d="scan'208";a="36780743"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 07 May 2024 10:37:59 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DEE5D176472; Tue,  7 May 2024 10:37:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1715071075;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=kCgSfPagde6d/ABPspOMI3lsg3aDrKX9SBMWiVfXbrc=;
 b=QPZnrgN6o+h3vyUvwj0wVo0UJUUiAfyFAdHT8nXdQARRbD1/AQQiMaWv0HDsoNBFU5vZjG
 nYWxaj4Vez9+E8JSKgUhbSG0VdkE2LUrGCrv4RVUkR2xXf3HE7/zjdAHdV8gBsixT2+JUF
 9jEl6x11SaXvMgiRVfxKDyscOmjcJAgVVL3lsyNrwPmvo8ZF+HRF4lzq2WX1eJxacxiFXF
 hDmzArHEU3NCrhtti+I/ZT7hxC9ZY76n9F0mRkuDpXA0CABTRLgYVWMpi51wx19+Hs5xNq
 lW3wq92IuckX2fFQaO5zs4Q6Ys4Ux5UN+Ia2VwfB/yeifesQ4q9efaWFv5dlxw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, Vinay Simha BN <simhavcs@gmail.com>,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 Michael Walle <mwalle@kernel.org>
Cc: Daniel Semkowicz <dse@thaumatec.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH 01/20] drm/bridge: add dsi_lp11_notify mechanism
Date: Tue, 07 May 2024 10:37:54 +0200
Message-ID: <2189493.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240506-tc358775-fix-powerup-v1-1-545dcf00b8dd@kernel.org>
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
 <20240506-tc358775-fix-powerup-v1-1-545dcf00b8dd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi Michael,

Am Montag, 6. Mai 2024, 15:34:30 CEST schrieb Michael Walle:
> Some bridges have very strict power-up reqirements. In this case, the
> Toshiba TC358775. The reset has to be deasserted while *both* the DSI
> clock and DSI data lanes are in LP-11 mode. After the reset is relased,
> the bridge needs the DSI clock to actually be able to process I2C
> access. This access will configure the DSI side of the bridge during
> which the DSI data lanes have to be in LP-11 mode.

Apparently this is an issue for a lot of DSI bridges. But enabling LP-11 for
a bridge is impossible with current documentation [1], which states "A DSI
host should keep the PHY powered down until the pre_enable operation is
called."
Additionally tc358767/tc9595 (DSI-DP bridge) needs LP-11 for AUX channel
access to even get EDID. This is a requirement before pre_enable would
even be possible.

So some changes to the current flow are needed. But I am not so sure
about LP-11 notification. IMHO a device request to the DSI host to
enable LP-11 seems more sensible.

Best regards,
Alexander

[1] https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html#mipi-ds=
i-bridge-operation

> After everything is
> configured the video stream can finally be enabled.
>=20
> This means:
>  (1) The bridge has to be configured completely in .pre_enable() op
>      (with the clock turned on and data lanes in LP-11 mode, thus
>      .pre_enable_prev_first has to be set).
>  (2) The bridge will enable its output in the .enable() op
>  (3) There must be some mechanism before (1) where the bridge can
>      release its reset while the clock lane is still in LP-11 mode.
>=20
> Unfortunately, (3) is crucial for a correct operation of the bridge.
> To satisfy this requriment, introduce a new callback .dsi_lp11_notify()
> which will be called by the DSI host driver.
>=20
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/gpu/drm/drm_bridge.c | 16 ++++++++++++++++
>  include/drm/drm_bridge.h     | 12 ++++++++++++
>  2 files changed, 28 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 28abe9aa99ca..98cd6558aecb 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1339,6 +1339,22 @@ void drm_bridge_hpd_notify(struct drm_bridge *brid=
ge,
>  }
>  EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
> =20
> +/**
> + * drm_bridge_dsi_lp11_notify - notify clock/data lanes LP-11 mode
> + * @bridge: bridge control structure
> + *
> + * DSI host drivers shall call this function while the clock and data la=
nes
> + * are still in LP-11 mode.
> + *
> + * This function shall be called in a context that can sleep.
> + */
> +void drm_bridge_dsi_lp11_notify(struct drm_bridge *bridge)
> +{
> +	if (bridge->funcs->dsi_lp11_notify)
> +		bridge->funcs->dsi_lp11_notify(bridge);
> +}
> +EXPORT_SYMBOL_GPL(drm_bridge_dsi_lp11_notify);
> +
>  #ifdef CONFIG_OF
>  /**
>   * of_drm_find_bridge - find the bridge corresponding to the device node=
 in
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 4baca0d9107b..4ef61274e0a8 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -630,6 +630,17 @@ struct drm_bridge_funcs {
>  	 */
>  	void (*hpd_disable)(struct drm_bridge *bridge);
> =20
> +	/**
> +	 * dsi_lp11_notify:
> +	 *
> +	 * Will be called by the DSI host driver while both the DSI clock
> +	 * lane as well as the DSI data lanes are in LP-11 mode. Some bridges
> +	 * need this state while releasing the reset, for example.
> +	 * Not all DSI host drivers will support this. Therefore, the DSI
> +	 * bridge driver must not rely on this op to be called.
> +	 */
> +	void (*dsi_lp11_notify)(struct drm_bridge *bridge);
> +
>  	/**
>  	 * @debugfs_init:
>  	 *
> @@ -898,6 +909,7 @@ void drm_bridge_hpd_enable(struct drm_bridge *bridge,
>  void drm_bridge_hpd_disable(struct drm_bridge *bridge);
>  void drm_bridge_hpd_notify(struct drm_bridge *bridge,
>  			   enum drm_connector_status status);
> +void drm_bridge_dsi_lp11_notify(struct drm_bridge *bridge);
> =20
>  #ifdef CONFIG_DRM_PANEL_BRIDGE
>  bool drm_bridge_is_panel(const struct drm_bridge *bridge);
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


