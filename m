Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126F4B2BC77
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 11:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1339610E344;
	Tue, 19 Aug 2025 09:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aEgxQ2C6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF21E10E344;
 Tue, 19 Aug 2025 09:03:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1891B5C5BFD;
 Tue, 19 Aug 2025 09:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314B1C113D0;
 Tue, 19 Aug 2025 09:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755594235;
 bh=U81+p77c0JQOTqk7IOzyd3hR2gXqfCNzh6rYyurZ5Eg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aEgxQ2C69qgc/E3qFBtTnEN5YhZhnpiBwiTtNRk3f7rG92qb2o4dGHM/zWPGz5sib
 qjOaifilW0lTtkcatgbMzeYCdiM3ORf3w62gUV7u/ou37VxECoP+mZ2M8Ww1BG5H+v
 VLwGwUzE6Xn1qp4MFbo9BhBzu23V94p8GqHdMo0BfieN/4lrU8zsDoOh/lii49ndxg
 t3h7P5PnNiew4XBQXz2qbKD6Ibq4ASeT0tdPcx31QNZBsQaKCBYfqRk2OkWO/Gv/Pk
 j6e4Jy6LP/lG2SMUcJK5L/2Nqmoi9sLBSiqG/nUXu8F7Ai1wrAVBHbIYRpfSLFJuUP
 L9W5Qw7/hz5eg==
Date: Tue, 19 Aug 2025 11:03:52 +0200
From: "mripard@kernel.org" <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "liviu.dudau@arm.com" <liviu.dudau@arm.com>, 
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 "kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>, 
 "Murthy, Arun R" <arun.r.murthy@intel.com>, "Shankar,
 Uma" <uma.shankar@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>, 
 "siqueira@igalia.com" <siqueira@igalia.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>, 
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "simona@ffwll.ch" <simona@ffwll.ch>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>, 
 "abhinav.kumar@linux.dev" <abhinav.kumar@linux.dev>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "jessica.zhang@oss.qualcomm.com" <jessica.zhang@oss.qualcomm.com>,
 "sean@poorly.run" <sean@poorly.run>, 
 "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
 "mcanal@igalia.com" <mcanal@igalia.com>, 
 "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>, 
 "tomi.valkeinen+renesas@ideasonboard.com"
 <tomi.valkeinen+renesas@ideasonboard.com>, 
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <wr76vyag2osox2xf7ducnkiaanzk2k5ehd2ahnoyqdm5qiywlk@penf4v5bvg5z>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
 <20250811094429.GE21313@pendragon.ideasonboard.com>
 <awtqznhquyn7etojonmjn7karznefsb7fdudawcjsj5g2bok3u@2iqcdviuiz2s>
 <20250811111546.GA30760@pendragon.ideasonboard.com>
 <2ah3pau7p7brgw7huoxznvej3djct76vgfwtc72n6uub7sjojd@zzaebjdcpdwf>
 <DM3PPF208195D8D0E55A761A3C16B87BAEEE32AA@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <aJ4LQvqli36TlETu@e110455-lin.cambridge.arm.com>
 <hc6f6wgsnauh72cowocpm55tikejhiha5z4mgufeq7v6gb2qml@kmgfd26bigos>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="skbefrsfocmocpeu"
Content-Disposition: inline
In-Reply-To: <hc6f6wgsnauh72cowocpm55tikejhiha5z4mgufeq7v6gb2qml@kmgfd26bigos>
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


--skbefrsfocmocpeu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
MIME-Version: 1.0

Hi,

On Sat, Aug 16, 2025 at 01:20:53AM +0300, Dmitry Baryshkov wrote:
> On Thu, Aug 14, 2025 at 05:13:54PM +0100, liviu.dudau@arm.com wrote:
> > Hi,
> >=20
> > On Wed, Aug 13, 2025 at 10:04:22AM +0000, Kandpal, Suraj wrote:
> > > > > > };
> > > > >
> > > > > I still don't like that. This really doesn't belong here. If anyt=
hing,
> > > > > the drm_connector for writeback belongs to drm_crtc.
> > > >=20
> > > > Why? We already have generic HDMI field inside drm_connector. I am =
really
> > > > hoping to be able to land DP parts next to it. In theory we can hav=
e a DVI-
> > > > specific entry there (e.g. with the subconnector type).
> > > > The idea is not to limit how the drivers subclass those structures.
> > > >=20
> > > > I don't see a good case why WB should deviate from that design.
> > > >=20
> > > > > If the issue is that some drivers need a custom drm_connector
> > > > > subclass, then I'd rather turn the connector field of
> > > > > drm_writeback_connector into a pointer.
> > > >=20
> > > > Having a pointer requires additional ops in order to get drm_connec=
tor from
> > > > WB code and vice versa. Having drm_connector_wb inside drm_connector
> > > > saves us from those ops (which don't manifest for any other kind of=
 structure).
> > > > Nor will it take any more space since union will reuse space alread=
y taken up by
> > > > HDMI part.
> > > >=20
> > > > >
> > >=20
> > > Seems like this thread has died. We need to get a conclusion on the d=
esign.
> > > Laurent do you have any issue with the design given Dmitry's explanat=
ion as to why this
> > > Design is good for drm_writeback_connector.
> >=20
> > I'm with Laurent here. The idea for drm_connector (and a lot of drm str=
uctures) are to
> > be used as base "classes" for extended structures. I don't know why HDM=
I connector ended
> > up inside drm_connector as not all connectors have HDMI functionality, =
but that's a cleanup
> > for another day.
>=20
> Maybe Maxime can better comment on it, but I think it was made exactly
> for the purpose of not limiting the driver's design. For example, a lot
> of drivers subclass drm_connector via drm_bridge_connector. If
> struct drm_connector_hdmi was a wrapper around struct drm_connector,
> then it would have been impossible to use HDMI helpers for bridge
> drivers, while current design freely allows any driver to utilize
> corresponding library code.

That's exactly why we ended up like this. With that design, we wouldn't
have been able to "inherit" two connector "classes": bridge_connector is
one, intel_connector another one.

See here for the rationale:
https://lore.kernel.org/dri-devel/ZOTDKHxn2bOg+Xmg@phenom.ffwll.local/

I don't think the "but we'll bloat drm_connector" makes sense either.
There's already a *lot* of things that aren't useful to every connector
(fwnode, display_info, edid in general, scaling, vrr, etc.)

And it's not like we allocate more than a handful of them during a
system's life.

Maxime

--skbefrsfocmocpeu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaKQ99AAKCRAnX84Zoj2+
dss/AYCDsxLbReOhvxm2/ItnX1NwLBeplh9X5QtqlMFGtACSlJY1IY0m/StI+3f5
mo8yNFoBgN6HXqzLYYWhMVbxXRVEQKIXD0+CH717KpLuEe2LfvOxFR4OrVqtC0CA
RG5v2F7KYw==
=NIHR
-----END PGP SIGNATURE-----

--skbefrsfocmocpeu--
