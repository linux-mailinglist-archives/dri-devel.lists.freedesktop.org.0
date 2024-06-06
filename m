Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA018FE40B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 12:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690AD10E8BE;
	Thu,  6 Jun 2024 10:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC86110E8C7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 10:17:25 +0000 (UTC)
Received: from i53875b65.versanet.de ([83.135.91.101] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1sFAAx-0007vD-35; Thu, 06 Jun 2024 12:16:55 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>,
 Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH 13/14] drm/bridge: synopsys: Add DW HDMI QP TX controller
 driver
Date: Thu, 06 Jun 2024 12:16:53 +0200
Message-ID: <2491902.uoxibFcf9D@diego>
In-Reply-To: <25ba8753-b7e9-4f6f-a9ad-c5266540939a@collabora.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
 <2554679.TLnPLrj5Ze@diego>
 <25ba8753-b7e9-4f6f-a9ad-c5266540939a@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

Am Donnerstag, 6. Juni 2024, 11:53:23 CEST schrieb Cristian Ciocaltea:
> On 6/5/24 5:48 PM, Heiko St=FCbner wrote:
> > Am Samstag, 1. Juni 2024, 15:12:35 CEST schrieb Cristian Ciocaltea:
> >> The Synopsys DesignWare HDMI 2.1 Quad-Pixel (QP) TX controller supports
> >> the following features, among others:
> >>
> >> * Fixed Rate Link (FRL)
> >> * 4K@120Hz and 8K@60Hz video modes
> >> * Variable Refresh Rate (VRR) including Quick Media Switching (QMS), a=
ka
> >>   Cinema VRR
> >> * Fast Vactive (FVA), aka Quick Frame Transport (QFT)
> >> * SCDC I2C DDC access
> >> * TMDS Scrambler enabling 2160p@60Hz with RGB/YCbCr4:4:4
> >> * YCbCr4:2:0 enabling 2160p@60Hz at lower HDMI link speeds
> >> * Multi-stream audio
> >> * Enhanced Audio Return Channel (EARC)
> >>
> >> Add driver to enable basic support, i.e. RGB output up to 4K@60Hz,
> >> without audio, CEC or any HDMI 2.1 specific features.
> >>
> >> Co-developed-by: Algea Cao <algea.cao@rock-chips.com>
> >> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >>  drivers/gpu/drm/bridge/synopsys/Makefile     |   2 +-
> >>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 787 ++++++++++++++++++=
+++++++
> >>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h | 831 ++++++++++++++++++=
+++++++++
> >>  include/drm/bridge/dw_hdmi.h                 |   8 +
> >>  4 files changed, 1627 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/synopsys/Makefile b/drivers/gpu/dr=
m/bridge/synopsys/Makefile
> >> index ce715562e9e5..8354e4879f70 100644
> >> --- a/drivers/gpu/drm/bridge/synopsys/Makefile
> >> +++ b/drivers/gpu/drm/bridge/synopsys/Makefile
> >=20
> >> +static int dw_hdmi_qp_i2c_read(struct dw_hdmi *hdmi,
> >> +			       unsigned char *buf, unsigned int length)
> >> +{
> >> +	struct dw_hdmi_i2c *i2c =3D hdmi->i2c;
> >> +	int stat;
> >> +
> >> +	if (!i2c->is_regaddr) {
> >> +		dev_dbg(hdmi->dev, "set read register address to 0\n");
> >> +		i2c->slave_reg =3D 0x00;
> >> +		i2c->is_regaddr =3D true;
> >> +	}
> >> +
> >> +	while (length--) {
> >> +		reinit_completion(&i2c->cmp);
> >> +
> >> +		dw_hdmi_qp_mod(hdmi, i2c->slave_reg++ << 12, I2CM_ADDR,
> >> +			       I2CM_INTERFACE_CONTROL0);
> >> +
> >> +		dw_hdmi_qp_mod(hdmi, I2CM_FM_READ, I2CM_WR_MASK,
> >> +			       I2CM_INTERFACE_CONTROL0);
> >=20
> > Somehow the segment handling is present in the rest of the i2c code her=
e, but
> > not the actual handling for reads.
> >=20
> > The vendor-kernel does:
> >=20
> > -               dw_hdmi_qp_mod(hdmi, I2CM_FM_READ, I2CM_WR_MASK,
> > -                              I2CM_INTERFACE_CONTROL0);
> > +               if (i2c->is_segment)
> > +                       dw_hdmi_qp_mod(hdmi, I2CM_EXT_READ, I2CM_WR_MAS=
K,
> > +                                      I2CM_INTERFACE_CONTROL0);
> > +               else
> > +                       dw_hdmi_qp_mod(hdmi, I2CM_FM_READ, I2CM_WR_MASK,
> > +                                      I2CM_INTERFACE_CONTROL0);
>=20
> Hmm, for some reason this is not present in the stable-5.10-rock5 branch=
=20
> I've been using as an implementation reference:
>=20
> https://github.com/radxa/kernel/blob/stable-5.10-rock5/drivers/gpu/drm/br=
idge/synopsys/dw-hdmi-qp.c#L760
>=20
> Is there an updated fork?

I think the radxa code-base is quite old in terms of sdk-version it's based=
 on.
Grabbing a 6.1 branch from Radxa shows it in:
https://github.com/radxa/kernel/blob/linux-6.1-stan-rkr1/drivers/gpu/drm/br=
idge/synopsys/dw-hdmi-qp.c#L995

> > Without this change, connecting to a DVI display does not work, and
> > reading the EDID ends in the "i2c read error" below.
> >=20
> > Adding the segment handling as above makes the DVI connection
> > work (as it does in the vendor-kernel).
> >=20
> > So it would be nice if you could maybe incorporate this in the next ver=
sion?
>=20
> Sure, thanks for pointing this out!
>=20
> Cristian
>=20




