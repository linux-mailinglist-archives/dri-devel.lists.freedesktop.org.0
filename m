Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F123A343437
	for <lists+dri-devel@lfdr.de>; Sun, 21 Mar 2021 19:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F436E061;
	Sun, 21 Mar 2021 18:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9CB6E061
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Mar 2021 18:58:18 +0000 (UTC)
Received: from p508fc3a3.dip0.t-ipconnect.de ([80.143.195.163]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lO3HC-0006z5-By; Sun, 21 Mar 2021 19:58:14 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonathan McDowell <noodles@earth.li>
Subject: Re: [PATCH] drm/rockchip: Cope with endpoints that haven't been
 registered yet
Date: Sun, 21 Mar 2021 19:58:13 +0100
Message-ID: <3104631.44csPzL39Z@phil>
In-Reply-To: <20210316182753.GA25685@earth.li>
References: <20210316182753.GA25685@earth.li>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Am Dienstag, 16. M=E4rz 2021, 19:27:53 CET schrieb Jonathan McDowell:
> The Rockchip RGB CRTC output driver attempts to avoid probing Rockchip
> subdrivers to see if they're a connected panel or bridge. However part
> of its checks assumes that if no OF platform device is found then it
> can't be a valid bridge or panel. This causes issues with I2C controlled
> bridges that have not yet been registered to the point they can be
> found.
> =

> Change this to return EPROBE_DEFER instead of ENODEV and don't ignore
> such devices. The subsequent call to drm_of_find_panel_or_bridge() will
> return EPROBE_DEFER as well if there's actually a valid device we should
> wait for.
> =

> Signed-off-by: Jonathan McDowell <noodles@earth.li>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 8 ++++++--
>  drivers/gpu/drm/rockchip/rockchip_rgb.c     | 7 ++++---
>  2 files changed, 10 insertions(+), 5 deletions(-)
> =

> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/dr=
m/rockchip/rockchip_drm_drv.c
> index 212bd87c0c4a..b0d63a566501 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -270,11 +270,15 @@ int rockchip_drm_endpoint_is_subdriver(struct devic=
e_node *ep)
>  	if (!node)
>  		return -ENODEV;
>  =

> -	/* status disabled will prevent creation of platform-devices */
> +	/*
> +	 * status disabled will prevent creation of platform-devices,
> +	 * but equally we can't rely on the driver having been registered
> +	 * yet (e.g. I2C bridges).
> +	 */
>  	pdev =3D of_find_device_by_node(node);
>  	of_node_put(node);
>  	if (!pdev)
> -		return -ENODEV;
> +		return -EPROBE_DEFER;

In general, how does that relate to i2c-bridge-drivers, as
of_find_device_by_node supposedly only acts on platform-devices?

Also if that points to a disabled bridge (hdmi, etc) that would likely make
it probe-defer indefinitly, as that device will never become available?

Maybe we could do something like of_device_is_available() which checks
the status property of the node. So something like:

  	pdev =3D of_find_device_by_node(node);
  	if (!pdev) {
		bool avail =3D of_device_is_available(node);

		of_node_put(node);

		/* if disabled
		if (!avail)
			return -ENODEV;
		else
			return -EPROBE_DEFER;
	}
  	of_node_put(node);

Though I still do not understand how that should actually pick up on
i2c devices at all.


Heiko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
