Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3E6CFD97D
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 13:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA3B10E0C2;
	Wed,  7 Jan 2026 12:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="XXQItyR+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B9A10E0C2
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 12:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=4h8Jx2ZI8h/J6LJOiYzY01rdWQD1J3ZD0e23g8rEcw4=; b=XXQItyR+AdD0pBYgPF6Xvj4Ow7
 qVZOgNkle+9jo8i8Vrmxs2aPlmBET7SSe7eF1OyAsbpZmXDYFdQOw7+UjPjy+MB1FNcK8+KGyBHAj
 lyX3GYOFpi8vsm0+nW2cbIU9XLyqg2hx0VCDgDEQYWAu9Dv+EBeR0V6WPutjl2ZH7UoZRzc4J4qRS
 bVwkenez8q1yPufdg/gj+AjqpfyClU8FBqwMzgyKNtOVEL5w33UgeeOFivWUjkgcAY6DmTfVXuq/x
 VDxNcY3GmGT0IYvNagOZ7j7OAViKwnspI7C59ef5+zG0p5e+w+lcjJ9Z4w+lVs7F5ynNIpWXDz7Z2
 /hkApNAg==;
Received: from i53875b57.versanet.de ([83.135.91.87] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vdSUC-001NDi-JT; Wed, 07 Jan 2026 13:18:01 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH] drm/mipi-dsi: Only remove child devices that match the
 dsi device type
Date: Wed, 07 Jan 2026 13:18:00 +0100
Message-ID: <2718437.9Mp67QZiUf@diego>
In-Reply-To: <20251203115028.133-1-kernel@airkyi.com>
References: <20251203115028.133-1-kernel@airkyi.com>
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

Am Mittwoch, 3. Dezember 2025, 12:50:28 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Chaoyi Chen:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>=20
> This patch checks whether the device is a valid mipi_dsi_device before
> accessing it in mipi_dsi_remove_device_fn().
>=20
> The mipi_dsi_host_unregister() assumes that all child devices of the
> host device are mipi_dsi_devices and uses mipi_dsi_remove_device_fn()
> to perform subsequent operations specific to mipi_dsi_device.
>=20
> In rockchip platform, for dw-mipi-dsi-rockchip.c, it creates a dphy
> device, and it use the dsi host device as its parent device.
>=20
> And when we call dw_mipi_dsi_remove() in
> dw_mipi_dsi_rockchip_remove(), mipi_dsi_host_unregister() will get
> such a dphy child device and treat it as an mipi_dsi_device, which
> will lead to a further panic.
>=20
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_ds=
i.c
> index a712e177b350..5b9cc799eb87 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -349,7 +349,12 @@ EXPORT_SYMBOL(mipi_dsi_host_register);
> =20
>  static int mipi_dsi_remove_device_fn(struct device *dev, void *priv)
>  {
> -	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(dev);
> +	struct mipi_dsi_device *dsi;
> +
> +	if (!dev_is_mipi_dsi(dev))
> +		return 0;
> +
> +	dsi =3D to_mipi_dsi_device(dev);
> =20
>  	if (dsi->attached)
>  		mipi_dsi_detach(dsi);
>=20

This makes a lot of sense.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


=46or people reading along:
The DSI controllers on the RK3399 uses a phy that is _inside_ the
DW-DSI controller, instead of a separate IP block.

But this internal PHY can also work as a receiver for camera data
for the ISP block in the RK3399.

Heiko


