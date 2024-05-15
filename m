Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B0D8C64FC
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 12:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40A710E442;
	Wed, 15 May 2024 10:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA9210E442
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 10:31:54 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1s7Bus-0002Hu-Fl; Wed, 15 May 2024 12:31:22 +0200
Message-ID: <0642186160bb31ca603b754a67aba47da1af716c.camel@pengutronix.de>
Subject: Re: [PATCH 00/14] improve Analogix DP AUX channel handling
From: Lucas Stach <l.stach@pengutronix.de>
To: Robert Foss <rfoss@kernel.org>
Cc: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>, Jingoo Han
 <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim
 <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,  dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de,  patchwork-lst@pengutronix.de
Date: Wed, 15 May 2024 12:31:18 +0200
In-Reply-To: <CAN6tsi73ks50-Xg78Jpj6Me80hpaR0ww=RXOMKJoT2V6Zg8_Yg@mail.gmail.com>
References: <20240503151129.3901815-1-l.stach@pengutronix.de>
 <CAN6tsi73ks50-Xg78Jpj6Me80hpaR0ww=RXOMKJoT2V6Zg8_Yg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Robert,

Am Dienstag, dem 07.05.2024 um 15:10 +0200 schrieb Robert Foss:
> On Fri, May 3, 2024 at 5:12=E2=80=AFPM Lucas Stach <l.stach@pengutronix.d=
e> wrote:
> >=20
> > Currently the AUX channel support in the Analogix DP driver is severely
> > limited as the AUX block of the bridge is only initialized when the vid=
eo
> > link is to be enabled. This is okay for the purposes of link training,
> > but does not allow to detect displays by probing for EDID. This series
> > reworks the driver to allow AUX transactions before the video link is
> > active.
> >=20
> > As this requires to rework some of the controller initialization and
> > also handling of both internal and external clocks, the series includes
> > quite a few changes to add better runtime PM handling.
> >=20
> > Lucas Stach (14):
> >   drm/bridge: analogix_dp: remove unused platform power_on_end callback
> >   drm/rockchip: analogix_dp: add runtime PM handling
> >   drm/bridge: analogix_dp: register AUX bus after enabling runtime PM
> >   drm/bridge: analogix_dp: handle clock via runtime PM
> >   drm/bridge: analogix_dp: remove unused analogix_dp_remove
> >   drm/bridge: analogix_dp: remove clk handling from
> >     analogix_dp_set_bridge
> >   drm/bridge: analogix_dp: move platform and PHY power handling into
> >     runtime PM
> >   drm/bridge: analogix_dp: move basic controller init into runtime PM
> >   drm/bridge: analogix_dp: remove PLL lock check from
> >     analogix_dp_config_video
> >   drm/bridge: analogix_dp: move macro reset after link bandwidth settin=
g
> >   drm/bridge: analogix_dp: don't wait for PLL lock too early
> >   drm/bridge: analogix_dp: simplify and correct PLL lock checks
> >   drm/bridge: analogix_dp: only read AUX status when an error occured
> >   drm/bridge: analogix_dp: handle AUX transfer timeouts
> >=20
> >  .../drm/bridge/analogix/analogix_dp_core.c    | 196 ++++++++----------
> >  .../drm/bridge/analogix/analogix_dp_core.h    |   7 +-
> >  .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  38 ++--
> >  .../gpu/drm/bridge/analogix/analogix_dp_reg.h |   9 +
> >  drivers/gpu/drm/exynos/exynos_dp.c            |   5 +-
> >  .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  26 +--
> >  include/drm/bridge/analogix_dp.h              |   4 +-
> >  7 files changed, 120 insertions(+), 165 deletions(-)
> >=20
> > --
> > 2.39.2
> >=20
>=20
> There are some checkpatch --strict warnings, and the patch 10/14 does
> not apply. Other than that the series looks very good.
>=20
> Maybe rebase on drm-misc/drm-misc-next, fix the applicable checkpatch
> --strict warnings and send a new version of this series. Then the last
> patches can be reviewed.

Thanks for the review so far. Patch 10/14 probably doesn't apply, as I
based the series on some patches I sent earlier [1]. Maybe you are also
willing to take a look at those, so I could squash them into a single
series for the resend?

Regards,
Lucas

[1] https://lore.kernel.org/dri-devel/20240318203925.2837689-1-l.stach@peng=
utronix.de/
