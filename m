Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A059C7A9CF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D13710E8BE;
	Fri, 21 Nov 2025 15:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gArfeFEl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583C510E141;
 Fri, 21 Nov 2025 15:48:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F011243B7A;
 Fri, 21 Nov 2025 15:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58CF7C4CEF1;
 Fri, 21 Nov 2025 15:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763740084;
 bh=LP19xB2HDi68fuNxVCCeUKCjpFYJR01O9e89Ljq/vBE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gArfeFEl7E2v8V9k8s2WjNhF4wZMdNkZzkWgc7KQY8OQ/FD5Hc+1k+raO/DlGaXWx
 /GceRDthNXPsCEH4F2NCAVsMsVJwHJP/PlMNkiMVfx39FlHwL1/ma3z734ELDG2Oyd
 LldNcvyOwLeV/boYVeOAYG6A4XF2fPqfz4loVZhgi7bS1Pk+ppALCIT326VJe04F44
 ZvSW+Z7e8o710Rg/3/P64GqV2ZzTp390cBoGs83UqrDC4gnWvhssHMfEDesVbRGZGz
 575P6s9ja9jrdFOmW3pQeHf7jHjtrLlcjw59AcxB/MsvNzwrbd22kf8IswCoJvDDwo
 5/qlR1iV7lZOw==
Date: Fri, 21 Nov 2025 16:48:02 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes
 as unsupported
Message-ID: <eiaxss57hauegv64ek4ddi3ib5x4t4g4xwiqvuaj43b52wpctb@p63ewh6tqblk>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>
 <20250910-furry-singing-axolotl-9aceac@houat>
 <z333ysst5ifakomo35jtbpydj44epqwwn4da76rcnsq4are62m@32gsmgx2pcdi>
 <20250925-didactic-spiked-lobster-fefabe@penduick>
 <jfxtcvh4l5kzyv74llmzz3bbt6m4mhzhhwl6lh5kfeqgqhkrhi@jzfvtxpedmyf>
 <20251003-primitive-sepia-griffin-cfca55@houat>
 <54a06852-4897-4dae-ab9c-330d99f3bf42@oss.qualcomm.com>
 <5cc5l2dihgdbgnwyugelwrklpaiiy5yaczqllu4bi6asvlt354@kib3flskh34g>
 <ez6y7q4lgbwt7kpnlpausjpznckr3yyejrwtxm7o6qw6wlhqoj@6iypzdhfthzy>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vnfz4xpbantfwz3r"
Content-Disposition: inline
In-Reply-To: <ez6y7q4lgbwt7kpnlpausjpznckr3yyejrwtxm7o6qw6wlhqoj@6iypzdhfthzy>
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


--vnfz4xpbantfwz3r
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes
 as unsupported
MIME-Version: 1.0

On Tue, Oct 14, 2025 at 07:02:03PM +0300, Dmitry Baryshkov wrote:
> On Tue, Oct 14, 2025 at 02:43:58PM +0200, Maxime Ripard wrote:
> > On Fri, Oct 03, 2025 at 06:41:58PM +0300, Dmitry Baryshkov wrote:
> > > On 03/10/2025 17:23, Maxime Ripard wrote:
> > > > On Thu, Sep 25, 2025 at 05:55:06PM +0300, Dmitry Baryshkov wrote:
> > > > > > > As we will be getting more and more features, some of the Inf=
oFrames
> > > > > > > or data packets will be 'good to have, but not required'.
> > > > > >=20
> > > > > > And drivers would be free to ignore those.
> > > > > >=20
> > > > > > > > So, no, sorry. That's still a no for me. Please stop sendin=
g that patch
> > > > > > >=20
> > > > > > > Oops :-)
> > > > > > >=20
> > > > > > > > unless we have a discussion about it and you convince me th=
at it's
> > > > > > > > actually something that we'd need.
> > > > > > >=20
> > > > > > > My main concern is that the drivers should not opt-out of the=
 features.
> > > > > > > E.g. if we start supporting ISRC packets or MPEG or NTSC VBI =
InfoFrames
> > > > > > > (yes, stupid examples), it should not be required to go throu=
gh all the
> > > > > > > drivers, making sure that they disable those. Instead the DRM=
 framework
> > > > > > > should be able to make decisions like:
> > > > > > >=20
> > > > > > > - The driver supports SPD and the VSDB defines SPD, enable th=
is
> > > > > > >    InfoFrame (BTW, this needs to be done anyway, we should no=
t be sending
> > > > > > >    SPD if it's not defined in VSDB, if I read it correctly).
> > > > > > >=20
> > > > > > > - The driver hints that the pixel data has only 10 meaninful =
bits of
> > > > > > >    data per component (e.g. out of 12 for DeepColor 36), the =
Sink has
> > > > > > >    HF-VSDB, send HF-VSIF.
> > > > > > >=20
> > > > > > > - The driver has enabled 3D stereo mode, but it doesn't decla=
re support
> > > > > > >    for HF-VSIF. Send only H14b-VSIF.
> > > > > > >=20
> > > > > > > Similarly (no, I don't have these on my TODO list, these are =
just
> > > > > > > examples):
> > > > > > > - The driver defines support for NTSC VBI, register a VBI dev=
ice.
> > > > > > >=20
> > > > > > > - The driver defines support for ISRC packets, register ISRC-=
related
> > > > > > >    properties.
> > > > > > >=20
> > > > > > > - The driver defines support for MPEG Source InfoFrame, provi=
de a way
> > > > > > >    for media players to report frame type and bit rate.
> > > > > > >=20
> > > > > > > - The driver provides limited support for Extended HDR DM Inf=
oFrames,
> > > > > > >    select the correct frame type according to driver capabili=
ties.
> > > > > > >=20
> > > > > > > Without the 'supported' information we should change atomic_c=
heck()
> > > > > > > functions to set infoframe->set to false for all unsupported =
InfoFrames
> > > > > > > _and_ go through all the drivers again each time we add suppo=
rt for a
> > > > > > > feature (e.g. after adding HF-VSIF support).
> > > > > >=20
> > > > > >  From what you described here, I think we share a similar goal =
and have
> > > > > > somewhat similar concerns (thanks, btw, it wasn't obvious to me=
 before),
> > > > > > we just disagree on the trade-offs and ideal solution :)
> > > > > >=20
> > > > > > I agree that we need to sanity check the drivers, and I don't w=
ant to go
> > > > > > back to the situation we had before where drivers could just ig=
nore
> > > > > > infoframes and take the easy way out.
> > > > > >=20
> > > > > > It should be hard, and easy to catch during review.
> > > > > >=20
> > > > > > I don't think bitflag are a solution because, to me, it kind of=
 fails
> > > > > > both.
> > > > > >=20
> > > > > > What if, just like the debugfs discussion, we split write_infof=
rame into
> > > > > > write_avi_infoframe (mandatory), write_spd_infoframe (optional),
> > > > > > write_audio_infoframe (checked by drm_connector_hdmi_audio_init=
?) and
> > > > > > write_hdr_infoframe (checked in drmm_connector_hdmi_init if max=
_bpc > 8)
> > > > > >=20
> > > > > > How does that sound?
> > > > >=20
> > > > > I'd say, I really like the single function to be called for writi=
ng the
> > > > > infoframes. It makes it much harder for drivers to misbehave or t=
o skip
> > > > > something.
> > > >=20
> > > >  From a driver PoV, I believe we should still have that single func=
tion
> > > > indeed. It would be drm_atomic_helper_connector_hdmi_update_infofra=
mes's
> > > > job to fan out and call the multiple callbacks, not the drivers.
> > >=20
> > > I like this idea, however it stops at the drm_bridge_connector abstra=
ction.
> > > The only way to handle this I can foresee is to make individual bridg=
es
> > > provide struct drm_connector_hdmi_funcs implementation (which I'm fin=
e with)
> > > and store void *data or struct drm_bridge *hdmi_bridge somewhere insi=
de
> > > struct drm_connector_hdmi in order to let bridge drivers find their d=
ata.
> >=20
> > Does it change anything? The last HDMI bridge should implement all the
> > infoframes it supports. I don't think we should take care of one bridge
> > with one infoframe type and some other with another?
>=20
> Note: I wrote about the _data_. So far the connector's write_infoframe /
> clear_infoframe callbacks get drm_connector as an arg. The fact that
> there is a drm_bridge which implements a callback is hidden well inside
> drm_bridge_connector (and only it knows the bridge_hdmi pointer).
> Otherwise, the bridge, trying to implement drm_connector_hdmi_funcs has
> no way to go from drm_connector to drm_bridge.
>=20
> The only possible solution would be to introduce something like
> drm_connector_hdmi::data (either void* or drm_bridge*) and use it
> internally. But for me this looks like a bit loose abstraction. Though,
> if it looks good from your POV, I agree, it would solve enough of
> issues.

I'm not sure I understand, sorry.

What prevents us from adding ~4 functions to bridge->funcs that take the
bridge, and drm_bridge_connector would get the connector, retrieve the
bridge instance from it, and pass it to the bridge actually implementing
it? Like we do currently for write_infoframe and clear_infoframe
already?

Maxime

--vnfz4xpbantfwz3r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaSCJsgAKCRAnX84Zoj2+
dh89AYC3OvDkzVUlxqCCClS0XtTSV3f+Nh4/Ge3ApQd7tPCinePMjVqIhRTX3dQG
WVZWcbMBfitqxdp4k9BqJt3mOot50bZme9uev5F+nwaHhM+5UZP2cO8R3UKSWVxx
o5Zr7qAz4A==
=c8cr
-----END PGP SIGNATURE-----

--vnfz4xpbantfwz3r--
