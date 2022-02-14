Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B262F4B4903
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 11:18:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551EF10E4F6;
	Mon, 14 Feb 2022 10:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAB710E4F6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 10:18:37 +0000 (UTC)
Date: Mon, 14 Feb 2022 10:18:24 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v15 6/7] drm/ingenic: dw-hdmi: make hot plug detection
 work for CI20
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <OYHA7R.1BKMZ91MRSP31@crapouillou.net>
In-Reply-To: <88297a6ddd9d9eaf78c605e23030b7877bb521d8.1644681054.git.hns@goldelico.com>
References: <cover.1644681054.git.hns@goldelico.com>
 <88297a6ddd9d9eaf78c605e23030b7877bb521d8.1644681054.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
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
Cc: Paul Boddie <paul@boddie.org.uk>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-mips@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, letux-kernel@openphoenux.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

Le sam., f=E9vr. 12 2022 at 16:50:54 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> There is no hpd-gpio installed on the CI20 board HDMI connector.
> Hence there is no hpd detection by the connector driver and we
> have to enable polling by the dw-hdmi driver.
>=20
> We need to set .poll_enabled but that struct component
> can only be accessed in the core code. Hence we use the public
> setter function drm_kms_helper_hotplug_event().

As I said in your v13 - if you move your patch [2/7] after the patch=20
[5/7] then you can drop this patch (merge it with the patch that=20
introduces ingenic-dw-hdmi.c).

Otherwise between the introduction of the driver and the hotplug=20
detection fix, the driver is not usable.

Cheers,
-Paul

>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c=20
> b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
> index 34e986dd606cf..90547a28dc5c7 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
> @@ -55,6 +55,8 @@ ingenic_dw_hdmi_mode_valid(struct dw_hdmi *hdmi,=20
> void *data,
>  	if (mode->clock > 216000)
>  		return MODE_CLOCK_HIGH;
>=20
> +	dw_hdmi_enable_poll(hdmi, true);
> +
>  	return MODE_OK;
>  }
>=20
> --
> 2.33.0
>=20


