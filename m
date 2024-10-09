Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B98996BE5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 15:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6938010E6EB;
	Wed,  9 Oct 2024 13:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fyywunHH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E03010E6C3
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 10:27:55 +0000 (UTC)
Received: from isaac-ThinkPad-T16-Gen-2.local
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F5ED2EC;
 Wed,  9 Oct 2024 12:26:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1728469577;
 bh=EnCse8YQGWK+UOsMAVUKFCn0pNdVUtbErZAVwAb4M7o=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=fyywunHHJy5Dmgz+1GjjIGC426Fwy3djtZFyEH03Wvr7VVVvVD8vIMLUCz4lcDx7r
 NaDV+NWTmntZDf+y8ckK5E9/J6vl8pv6wk7WD+hLNRf4NQ+2lexNMKfVU8Vrwm6Mqp
 hox6oi5uPqDeTt3BZGnNSULQvsezEeQ83Y51TCqg=
Message-ID: <8a78fcf2f1da1d4b8ca3446e8378517a71bf1e51.camel@ideasonboard.com>
Subject: Re: [PATCH 2/2] drm: bridge: ldb: Configure LDB clock in .mode_set
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>,  David Airlie <airlied@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Jernej Skrabec	 <jernej.skrabec@gmail.com>, Jonas
 Karlman <jonas@kwiboo.se>, Laurent Pinchart	
 <Laurent.pinchart@ideasonboard.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>,  Pengutronix
 Kernel Team	 <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>,
 Sascha Hauer	 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter	 <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, Thomas
 Zimmermann	 <tzimmermann@suse.de>, imx@lists.linux.dev,
 kernel@dh-electronics.com, 	linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Date: Wed, 09 Oct 2024 11:27:50 +0100
In-Reply-To: <20241008223846.337162-2-marex@denx.de>
References: <20241008223846.337162-1-marex@denx.de>
 <20241008223846.337162-2-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0 (by Flathub.org) 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Oct 2024 13:31:32 +0000
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

On Wed, 2024-10-09 at 00:38 +0200, Marek Vasut wrote:
> The LDB serializer clock operate at either x7 or x14 rate of the
> input
> LCDIFv3 scanout engine clock. Make sure the serializer clock and
> their
> upstream Video PLL are configured early in .mode_set to the x7 or x14
> rate of pixel clock, before LCDIFv3 .atomic_enable is called which
> would
> configure the Video PLL to low x1 rate, which is unusable.
>=20
> With this patch in place, the clock tree is correctly configured. The
> example below is for a 71.1 MHz pixel clock panel, the LDB serializer
> clock is then 497.7 MHz:

Awesome! Thank you for this, this seems to fix the regression and the
patches work as expected. I have tested both patches on v6.12-rc2 and
the display works well.

For both patches,=20

Tested-by: Isaac Scott <isaac.scott@ideasonboard.com>
>=20
> video_pll1_ref_sel=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 =
1 0=C2=A0 24000000 0 0 50000
> =C2=A0=C2=A0 video_pll1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 1 0 497700000 0 0 50000
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 video_pll1_bypass=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 =
1 0 497700000 0 0 50000
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 video_pll1_out=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2 2 0 497700000 0 0 50000
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media_=
ldb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 1 0 497700000 0 0 50000
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 media_ldb_root_clk=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 1 0 4=
97700000 0 0 50000
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media_=
disp2_pix=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 1 1 0=C2=A0 71100000 0 0 50000
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 media_disp2_pix_root_clk 1 1 0=C2=A0 71100000 0 0 50000
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Isaac Scott <isaac.scott@ideasonboard.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
> =C2=A0drivers/gpu/drm/bridge/fsl-ldb.c | 11 +++++++++++
> =C2=A01 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c
> b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 0e4bac7dd04ff..a3a31467fcc85 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -278,6 +278,16 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
> =C2=A0	return MODE_OK;
> =C2=A0}
> =C2=A0
> +static void fsl_ldb_mode_set(struct drm_bridge *bridge,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_display_mode *m=
ode,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_display_mode *a=
dj)
> +{
> +	struct fsl_ldb *fsl_ldb =3D to_fsl_ldb(bridge);
> +	unsigned long requested_link_freq =3D
> fsl_ldb_link_frequency(fsl_ldb, mode->clock);
> +
> +	clk_set_rate(fsl_ldb->clk, requested_link_freq);
> +}
> +
> =C2=A0static const struct drm_bridge_funcs funcs =3D {
> =C2=A0	.attach =3D fsl_ldb_attach,
> =C2=A0	.atomic_enable =3D fsl_ldb_atomic_enable,
> @@ -287,6 +297,7 @@ static const struct drm_bridge_funcs funcs =3D {
> =C2=A0	.atomic_get_input_bus_fmts =3D
> fsl_ldb_atomic_get_input_bus_fmts,
> =C2=A0	.atomic_reset =3D drm_atomic_helper_bridge_reset,
> =C2=A0	.mode_valid =3D fsl_ldb_mode_valid,
> +	.mode_set =3D fsl_ldb_mode_set,
> =C2=A0};
> =C2=A0
> =C2=A0static int fsl_ldb_probe(struct platform_device *pdev)

