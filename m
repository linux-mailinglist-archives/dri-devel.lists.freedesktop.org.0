Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4BCA70478
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 16:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFE510E598;
	Tue, 25 Mar 2025 15:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE77D10E58D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 15:01:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1tx5lo-00069R-Rt; Tue, 25 Mar 2025 16:00:48 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1tx5ln-001b4w-1A;
 Tue, 25 Mar 2025 16:00:47 +0100
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1tx5li-0009py-2A;
 Tue, 25 Mar 2025 16:00:42 +0100
Message-ID: <7cb810a0f80d61fea294b93ace2e2fb7515c077c.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Marek Vasut <marex@denx.de>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley
 <conor+dt@kernel.org>,  David Airlie <airlied@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Liviu
 Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring
 <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel
 <sre@kernel.org>,  Shawn Guo <shawnguo@kernel.org>, Simona Vetter
 <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,  Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  imx@lists.linux.dev
Date: Tue, 25 Mar 2025 16:00:42 +0100
In-Reply-To: <7233d56f-d07d-46c3-9954-57eb583a36ac@denx.de>
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-5-marex@denx.de>
 <20250324094333.7afb17a1@collabora.com>
 <22187ae5-7486-416b-b612-53021bfca11e@denx.de>
 <13376dff8d861389464b7ecdb2f82fe211638500.camel@pengutronix.de>
 <7233d56f-d07d-46c3-9954-57eb583a36ac@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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

On Di, 2025-03-25 at 15:27 +0100, Marek Vasut wrote:
> On 3/25/25 3:12 PM, Philipp Zabel wrote:
> > On Mo, 2025-03-24 at 20:05 +0100, Marek Vasut wrote:
> > > On 3/24/25 9:43 AM, Boris Brezillon wrote:
> > >=20
> > > [...]
> > >=20
> > > > > @@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev=
)
> > > > >   =20
> > > > >    	panthor_devfreq_suspend(ptdev);
> > > > >   =20
> > > > > +	reset_control_assert(ptdev->resets);
> > > >=20
> > > > Hm, that might be the cause of the fast reset issue (which is a fas=
t
> > > > resume more than a fast reset BTW): if you re-assert the reset line=
 on
> > > > runtime suspend, I guess this causes a full GPU reset, and the MCU =
ends
> > > > up in a state where it needs a slow reset (all data sections reset =
to
> > > > their initial state). Can you try to move the reset_control_[de]ass=
ert
> > > > to the unplug/init functions?
> > > The reset on the MX95 is not really a reset, it is clear-only
> > > set-never-again bit which goes only one way, the "unreset" way, so I
> > > don't think this has any impact.
> >=20
> > This sounds like the bit is initially set to 1 (reset asserted) and can
> > be cleared by writing 0 (once, to deassert the reset). But in the
> > reset-simple patch it looks to be the other way around (active_low =3D
> > true)?
> >=20
> > If the reset control can't be asserted again on this hardware, it would
> > be better to have custom driver that doesn't implement the .assert()
> > callback at all.
> Maybe the reset-simple driver can be extended with some mode of=20
> operation like this instead , to make it skip assert once deasserted ,=
=20
> for specific reset controllers ?

How about a second reset_control_ops struct without .assert, selected
in reset_simple_probe() by a new flag in reset_simple_devdata.

regards
Philipp
