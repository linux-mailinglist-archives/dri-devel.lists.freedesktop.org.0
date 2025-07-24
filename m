Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A46DB10AD6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 15:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B153710E271;
	Thu, 24 Jul 2025 13:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="rqRYTOat";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DE710E271
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 13:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=2yUnl4vidy4gJvXblFDoJuJNs7hErSWbP5rsO2C/gB0=; b=rqRYTOatipp8MXoMnYvt0IchBY
 K6HjCQAtpimPUnQtSi/BNo/rhID2z3ZpYzeCo5d0nTA+EqsZqo5uResfrEERmPBEJ/EvesXgJL+pL
 pMg1t4i0xSPMpGxNrZGdHKYQyXoWWsKrJZ36Exq8A3t6QCpWaxm8fQ3uFqFrLs7xHNTLDUcU8t3zu
 ftz79uNn1goGeo7w3A2F+6RfZEXvpOjuNQJwC8wLypwf58/4o3AM8LoNA/PuO+GY/lg5qVStosIgY
 GBPCcmPrkXmSbj22AvKy1UkHkeNInX+DT7hZLGIfaYV/Av2EIf/fzaSOnYT2v99DqxboLboE5UWBp
 DGrJ3CaA==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uevZ5-0005kZ-4F; Thu, 24 Jul 2025 15:00:51 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v3 08/14] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
Date: Thu, 24 Jul 2025 15:00:49 +0200
Message-ID: <10694296.nUPlyArG6x@diego>
In-Reply-To: <20250724080304.3572457-9-damon.ding@rock-chips.com>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-9-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi Damon,

Am Donnerstag, 24. Juli 2025, 10:02:58 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Damon Ding:
> Apply drm_bridge_connector helper for Analogix DP driver.
>=20
> The following changes have been made:
> - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
>   and &drm_connector_helper_funcs.
> - Remove unnecessary parameter struct drm_connector* for callback
>   &analogix_dp_plat_data.attach.
> - Remove &analogix_dp_device.connector.
> - Convert analogix_dp_atomic_check()/analogix_dp_detect() to
>   &drm_bridge_funcs.atomic_check()/&drm_bridge_funcs.detect().
> - Split analogix_dp_get_modes() into &drm_bridge_funcs.get_modes() and
>   &drm_bridge_funcs.edid_read().
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

>  static enum drm_connector_status
> -analogix_dp_detect(struct drm_connector *connector, bool force)
> +analogix_dp_bridge_detect(struct drm_bridge *bridge)
>  {
> -	struct analogix_dp_device *dp =3D to_dp(connector);
> +	struct analogix_dp_device *dp =3D to_dp(bridge);
>  	enum drm_connector_status status =3D connector_status_disconnected;
> =20
>  	if (dp->plat_data->panel)

this needs an update to

 static enum drm_connector_status
=2Danalogix_dp_bridge_detect(struct drm_bridge *bridge)
+analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector =
*connector)

to follow Andy's patch [0] that got already applied to drm-misc-next

Heiko


[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5d156a9c3d5ea3d=
bec192121259dee2c2f938fa1


