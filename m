Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB85C3D435
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 20:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E40410E9C0;
	Thu,  6 Nov 2025 19:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="LAc7KxzN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D0210E9C0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 19:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=fbewH0AF1zwBWF/L/JW/wVvoIg0eBxwJ3drbHbIHh1g=; b=LAc7KxzNkl0iUZclB18yXMzh4X
 j1f90hqDtSbxM8SeKE12FB/0WNsLNSSMDv++/XEwX4xObFn80jHszlI/0/KCgmF0WeASWadAZLOmv
 KqkoyZhE+lbx8CnRqJdl+fCsNyp8B+YknCq1L7a8mWVzx3oYk50aG6KkrKypvxJknkipi5NSEiZrX
 +/LfDJ4qbR+5/UqegZLn+beYiKOUzStxDf3hHPfYhVJsoivyPhVy2BlOIoONFXLU1hzQnQ3Fly+CF
 5IT0Nk+k9mtHBeKkEKdx5lwguHyM48bah1z5MHKoS76uRwViGX7Es+asgat3YXbqoLGuG0u2BqdRL
 y12KUbqQ==;
Received: from i53875bac.versanet.de ([83.135.91.172] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vH5qq-0000iJ-V7; Thu, 06 Nov 2025 20:40:56 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, Laurent.pinchart@ideasonboard.com, 
 rfoss@kernel.org, neil.armstrong@linaro.org, andrzej.hajda@intel.com,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 tzimmermann@suse.de, mripard@kernel.org, andy.yan@rock-chips.com,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 2/3] drm/bridge: dw-hdmi-qp: Add support for missing HPD
Date: Thu, 06 Nov 2025 20:40:55 +0100
Message-ID: <2301926.irdbgypaU6@phil>
In-Reply-To: <20251106180914.768502-3-macroalpha82@gmail.com>
References: <20251106180914.768502-1-macroalpha82@gmail.com>
 <20251106180914.768502-3-macroalpha82@gmail.com>
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

Am Donnerstag, 6. November 2025, 19:09:13 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Chris Morgan:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add support for the dw-hdmi-qp driver to handle devices with missing
> HPD pins.
>=20
> Since in this situation we are now polling for the EDID data via i2c
> change the error message to a debug message when we are unable to
> complete an i2c read, as a disconnected device would otherwise fill
> dmesg with i2c read errors.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

> @@ -1074,12 +1095,18 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platfor=
m_device *pdev,
>  	if (ret)
>  		return ERR_PTR(ret);
> =20
> +	if (of_property_present(pdev->dev.of_node, "no-hpd"))
> +		hdmi->no_hpd =3D 1;
> +	else
> +		hdmi->no_hpd =3D 0;
> +

what is the argument against

hdmi->no_hpd =3D of_property_read_bool(pdev->dev.of_node, "no-hpd")); ?





