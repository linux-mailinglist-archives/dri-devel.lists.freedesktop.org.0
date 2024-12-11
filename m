Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 501DC9ED44E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 19:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0103110E3FB;
	Wed, 11 Dec 2024 18:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="0C83S1fq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CCF10E3FB
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 18:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IVHnpLKAbs1P9zKMMrgIzagDvO+w36oIPk+2jsToDwg=; b=0C83S1fq97gn53rq0T/CVl46e6
 3XCpKkwcn/RffyjiKXUeijI3P7o0clz7e3okpsFw+Vu+NCkLJtwSAQvZ4+pzDUFo4yKl3xs0VJ+pI
 Dk+Uysaeqc9JOI8qAO9pxQag0R8KtNHGxBwxgzYuVBhvPBsH8kTBk3Q0BAPFGYWv+bujjBFQI++PW
 oIixUfFkDdQYMLwKE49C/PyMKq6aMutb6tM0MobIhmmsiP8Auqs81KTEz1sKxv2GMwLNRVLw5ODwZ
 fVe/rxSQtnmMUNIKqgLKz8+7/BJ678z81Stnzhk78oncTkAdB4KsVT8Hc9g+8H+WBZVYaDJ1PN5F6
 83mXfeyg==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tLR1Q-0006Ul-Ql; Wed, 11 Dec 2024 19:01:16 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Maxime Ripard <mripard@kernel.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 FUKAUMI Naoki <naoki@radxa.com>
Subject: Re: [PATCH v2 3/5] drm/rockchip: vop2: Improve display modes handling
 on RK3588 HDMI0
Date: Wed, 11 Dec 2024 19:01:15 +0100
Message-ID: <1756448.izSxrag8PF@diego>
In-Reply-To: <a4ex3s23r4k6wehyoaw3aylpcexfrclrxxykjpabhdfne2jgmu@ii6riiiga2zj>
References: <20241211-vop2-hdmi0-disp-modes-v2-0-471cf5001e45@collabora.com>
 <1820767.5KxKD5qtyk@diego>
 <a4ex3s23r4k6wehyoaw3aylpcexfrclrxxykjpabhdfne2jgmu@ii6riiiga2zj>
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

Am Mittwoch, 11. Dezember 2024, 18:47:44 CET schrieb Maxime Ripard:
> On Wed, Dec 11, 2024 at 06:23:03PM +0100, Heiko St=FCbner wrote:
> > Am Mittwoch, 11. Dezember 2024, 18:07:57 CET schrieb Maxime Ripard:
> > > On Wed, Dec 11, 2024 at 12:15:07PM +0200, Cristian Ciocaltea wrote:
> > > > The RK3588 specific implementation is currently quite limited in te=
rms
> > > > of handling the full range of display modes supported by the connec=
ted
> > > > screens, e.g. 2560x1440@75Hz, 2048x1152@60Hz, 1024x768@60Hz are jus=
t a
> > > > few of them.
> > > >=20
> > > > Additionally, it doesn't cope well with non-integer refresh rates l=
ike
> > > > 59.94, 29.97, 23.98, etc.
> > > >=20
> > > > Make use of HDMI0 PHY PLL as a more accurate DCLK source to handle
> > > > all display modes up to 4K@60Hz.
> > > >=20
> > > > Tested-by: FUKAUMI Naoki <naoki@radxa.com>
> > > > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > > > ---
> > > >  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 34 ++++++++++++++++=
++++++++++++
> > > >  1 file changed, 34 insertions(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers=
/gpu/drm/rockchip/rockchip_drm_vop2.c
> > > > index 8b2f53ffefdbf1cc8737b3a86e630a03a7fd9348..393fe6aa170aaee9663=
c4a6d98c1cd6a5ef79392 100644
> > > > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > > > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > > > @@ -158,6 +158,7 @@ struct vop2_video_port {
> > > >  	struct drm_crtc crtc;
> > > >  	struct vop2 *vop2;
> > > >  	struct clk *dclk;
> > > > +	struct clk *dclk_src;
> > > >  	unsigned int id;
> > > >  	const struct vop2_video_port_data *data;
> > > > =20
> > > > @@ -212,6 +213,7 @@ struct vop2 {
> > > >  	struct clk *hclk;
> > > >  	struct clk *aclk;
> > > >  	struct clk *pclk;
> > > > +	struct clk *pll_hdmiphy0;
> > > > =20
> > > >  	/* optional internal rgb encoder */
> > > >  	struct rockchip_rgb *rgb;
> > > > @@ -220,6 +222,8 @@ struct vop2 {
> > > >  	struct vop2_win win[];
> > > >  };
> > > > =20
> > > > +#define VOP2_MAX_DCLK_RATE		600000 /* kHz */
> > > > +
> > > >  #define vop2_output_if_is_hdmi(x)	((x) =3D=3D ROCKCHIP_VOP2_EP_HDM=
I0 || \
> > > >  					 (x) =3D=3D ROCKCHIP_VOP2_EP_HDMI1)
> > > > =20
> > > > @@ -1033,6 +1037,9 @@ static void vop2_crtc_atomic_disable(struct d=
rm_crtc *crtc,
> > > > =20
> > > >  	vop2_crtc_disable_irq(vp, VP_INT_DSP_HOLD_VALID);
> > > > =20
> > > > +	if (vp->dclk_src)
> > > > +		clk_set_parent(vp->dclk, vp->dclk_src);
> > > > +
> > > >  	clk_disable_unprepare(vp->dclk);
> > > > =20
> > > >  	vop2->enable_count--;
> > > > @@ -2049,6 +2056,27 @@ static void vop2_crtc_atomic_enable(struct d=
rm_crtc *crtc,
> > > > =20
> > > >  	vop2_vp_write(vp, RK3568_VP_MIPI_CTRL, 0);
> > > > =20
> > > > +	/*
> > > > +	 * Switch to HDMI PHY PLL as DCLK source for display modes up
> > > > +	 * to 4K@60Hz, if available, otherwise keep using the system CRU.
> > > > +	 */
> > > > +	if (vop2->pll_hdmiphy0 && mode->crtc_clock <=3D VOP2_MAX_DCLK_RAT=
E) {
> > > > +		drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encode=
r_mask) {
> > > > +			struct rockchip_encoder *rkencoder =3D to_rockchip_encoder(enco=
der);
> > > > +
> > > > +			if (rkencoder->crtc_endpoint_id =3D=3D ROCKCHIP_VOP2_EP_HDMI0) {
> > > > +				if (!vp->dclk_src)
> > > > +					vp->dclk_src =3D clk_get_parent(vp->dclk);
> > > > +
> > > > +				ret =3D clk_set_parent(vp->dclk, vop2->pll_hdmiphy0);
> > > > +				if (ret < 0)
> > > > +					drm_warn(vop2->drm,
> > > > +						 "Could not switch to HDMI0 PHY PLL: %d\n", ret);
> > > > +				break;
> > > > +			}
> > > > +		}
> > > > +	}
> > > > +
> > >=20
> > > It seems pretty fragile to do it at atomic_enable time, even more so
> > > since you don't lock the parent either.
> > >=20
> > > Any reason not to do it in the DRM or clock driver probe, and make su=
re
> > > you never change the parent somehow?
> >=20
> > On rk3588 we have 3 dclk_s and 2 hdmi controllers. Each video-port can
> > use the clock generated from either the hdmi0phy or hdmi1phy, depending
> > on which hdmi-controller it uses.
> >=20
> > So you actually need to know which vpX will output to which hdmiY to th=
en
> > reparent that dclk to the hdmiphy output.
>=20
> The Rockchip nomenclature isn't super obvious to me, sorry. Is there a
> datasheet for this somewhere? Also, does this vpX -> HDMI-Y mapping need
> to be dynamic?

VPs are CRTCs in drm-language and each of them can drive a differing
number of output encoders. Those video-ports also have differing output
characteristics in terms of supported resolution and other properties.

The rk3588 TRM has leaked in a number of places, and if you find a
TRM-part2, there is a section labeled "Display Output Interface Description"
that has a nice graphic for that.

Or in short:
=2D CRTC(VP)0 supports 8K resolution and can drive DP0+1, HDMI0+1, eDP0+1
  [if I'm reading things correctly, 8K together with CRTC1 somehow)
=2D CRTC(VP)1 supports 4K resolution and can drive DP0+1, HDMI0+1, eDP0+1
=2D CRTC(VP)2 supports 4K resolution and can drive DP0+1, HDMI0+1, eDP01, D=
SI0+1
=2D CRTC(VP)3 supports 2K resolution and can drive DSI0+1 and some BT1120,B=
T656

so for the 3 higher resolution CRTCs there are essentially 6 or 8 output op=
tions
depending on the board design


