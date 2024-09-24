Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0AC98429C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 11:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC75C10E111;
	Tue, 24 Sep 2024 09:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UIsLSSX+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E4B10E111
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 09:51:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B7FD5A40EFE;
 Tue, 24 Sep 2024 09:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90C6C4CECD;
 Tue, 24 Sep 2024 09:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727171490;
 bh=igw/EcSOODy/LuZ3kSdwJEjQbI05MZlb8fOw+iDBQ10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UIsLSSX+nXBqbSWZR962dQohzcly2VG9rNrMaeeBD2aHgWfJ66UPifMCiKz3cXv/F
 Uepiftc12uPR2DlUR50fgAdiwQp1NZaj5KkLBpNCQXFA7/HVn7Lc+I6pK4Z4ag3hM1
 7cqMYUqg7ZdbJKdP1CvEs85+4TwolzV0x0CPNjYu7NCknJNcaVZq75KAMmNg6w6yZ2
 TuhlMiYVUMKQM5VSIdWT5QaNIul4V+9TVJP7hokDBVbenX0bVlvglzZqaYkBo9Pa1A
 6K1uPMtSfAqJlnoe5lCFelxPt+QWxeGjine4xmrkc2KxdLRh+G2rwmhp//6o2cOBs7
 Tty1bEVDpaTLA==
Date: Tue, 24 Sep 2024 11:51:27 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sandor Yu <sandor.yu@nxp.com>
Cc: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, 
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, 
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, 
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, 
 "vkoul@kernel.org" <vkoul@kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, 
 dl-linux-imx <linux-imx@nxp.com>, Oliver Brown <oliver.brown@nxp.com>, 
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>
Subject: Re: [EXT] Re: [PATCH v16 4/8] drm: bridge: Cadence: Add MHDP8501
 DP/HDMI driver
Message-ID: <20240924-miniature-jade-gibbon-c9a226@houat>
References: <cover.1719903904.git.Sandor.yu@nxp.com>
 <359914108b879e995d4a39de32a33310009f0fab.1719903904.git.Sandor.yu@nxp.com>
 <20240702-quartz-salamander-of-culture-eec264@houat>
 <PAXPR04MB94480AB0490BBF00D2BA17BBF4932@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <20240903-gay-capable-hound-3cbef2@houat>
 <PAXPR04MB9448EF507CB5C18A43239A80F49E2@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <20240912-zippy-mongoose-of-domination-2ebc1d@houat>
 <PAXPR04MB94484D86A71A7527ADD42EA4F4652@PAXPR04MB9448.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="j43latycugo6x7f7"
Content-Disposition: inline
In-Reply-To: <PAXPR04MB94484D86A71A7527ADD42EA4F4652@PAXPR04MB9448.eurprd04.prod.outlook.com>
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


--j43latycugo6x7f7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 09:46:12AM GMT, Sandor Yu wrote:
> > Subject: Re: [EXT] Re: [PATCH v16 4/8] drm: bridge: Cadence: Add MHDP85=
01
> > DP/HDMI driver
> >=20
> > On Fri, Sep 06, 2024 at 02:50:08AM GMT, Sandor Yu wrote:
> > > > On Tue, Sep 03, 2024 at 06:07:25AM GMT, Sandor Yu wrote:
> > > > > > -----Original Message-----
> > > > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On
> > > > > > Behalf Of Maxime Ripard
> > > > > > Sent: 2024=E5=B9=B47=E6=9C=882=E6=97=A5 21:25
> > > > > > To: Sandor Yu <sandor.yu@nxp.com>
> > > > > > Cc: dmitry.baryshkov@linaro.org; andrzej.hajda@intel.com;
> > > > > > neil.armstrong@linaro.org; Laurent Pinchart
> > > > > > <laurent.pinchart@ideasonboard.com>; jonas@kwiboo.se;
> > > > > > jernej.skrabec@gmail.com; airlied@gmail.com; daniel@ffwll.ch;
> > > > > > robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> > > > > > shawnguo@kernel.org; s.hauer@pengutronix.de;
> > festevam@gmail.com;
> > > > > > vkoul@kernel.org; dri-devel@lists.freedesktop.org;
> > > > > > devicetree@vger.kernel.org;
> > > > > > linux-arm-kernel@lists.infradead.org;
> > > > > > linux-kernel@vger.kernel.org; linux-phy@lists.infradead.org;
> > > > > > kernel@pengutronix.de; dl-linux-imx <linux-imx@nxp.com>; Oliver
> > > > > > Brown <oliver.brown@nxp.com>; alexander.stein@ew.tq-group.com;
> > > > > > sam@ravnborg.org
> > > > > > Subject: [EXT] Re: [PATCH v16 4/8] drm: bridge: Cadence: Add
> > > > > > MHDP8501 DP/HDMI driver
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > There's still the scrambler issue we discussed on v15, but I
> > > > > > have some more comments.
> > > > > >
> > > > > > On Tue, Jul 02, 2024 at 08:22:36PM GMT, Sandor Yu wrote:
> > > > > > > +enum drm_connector_status cdns_mhdp8501_detect(struct
> > > > > > > +cdns_mhdp8501_device *mhdp) {
> > > > > > > +	u8 hpd =3D 0xf;
> > > > > > > +
> > > > > > > +	hpd =3D cdns_mhdp8501_read_hpd(mhdp);
> > > > > > > +	if (hpd =3D=3D 1)
> > > > > > > +		return connector_status_connected;
> > > > > > > +	else if (hpd =3D=3D 0)
> > > > > > > +		return connector_status_disconnected;
> > > > > > > +
> > > > > > > +	dev_warn(mhdp->dev, "Unknown cable status, hdp=3D%u\n",
> > hpd);
> > > > > > > +	return connector_status_unknown; }
> > > > > > > +
> > > > > > > +static void hotplug_work_func(struct work_struct *work) {
> > > > > > > +	struct cdns_mhdp8501_device *mhdp =3D container_of(work,
> > > > > > > +						     struct cdns_mhdp8501_device,
> > > > > > > +						     hotplug_work.work);
> > > > > > > +	enum drm_connector_status status =3D
> > > > cdns_mhdp8501_detect(mhdp);
> > > > > > > +
> > > > > > > +	drm_bridge_hpd_notify(&mhdp->bridge, status);
> > > > > > > +
> > > > > > > +	if (status =3D=3D connector_status_connected) {
> > > > > > > +		/* Cable connected  */
> > > > > > > +		DRM_INFO("HDMI/DP Cable Plug In\n");
> > > > > > > +		enable_irq(mhdp->irq[IRQ_OUT]);
> > > > > > > +	} else if (status =3D=3D connector_status_disconnected) {
> > > > > > > +		/* Cable Disconnected  */
> > > > > > > +		DRM_INFO("HDMI/DP Cable Plug Out\n");
> > > > > > > +		enable_irq(mhdp->irq[IRQ_IN]);
> > > > > > > +	}
> > > > > > > +}
> > > > > >
> > > > > > You shouldn't play with the interrupt being enabled here:
> > > > > > hotplug interrupts should always enabled.
> > > > > >
> > > > > > If you can't for some reason, the reason should be documented in
> > > > > > your
> > > > driver.
> > > > >
> > > > > iMX8MQ have two HPD interrupters, one for plugout and the other
> > > > > for plugin, because they could not be masked, so we have to enable
> > > > > one and
> > > > disable the other.
> > > > > I will add more comments here.
> > > >
> > > > Right, but why do you need to enable and disable them? Do you get
> > > > spurious interrupts?
> > >
> > > They don't have status registers and cannot be masked. If they are not
> > > disabled, they will continuously generate interrupts. Therefore, I ha=
ve to
> > disable one and enable the other.
> >=20
> > Sorry, I still don't get it. How can it be useful to detect hotplug int=
errupts if it
> > constantly sends spurious interrupts when it's enabled?
>=20
> Yes, this interrupt is different from a normal one; it's likely a design =
flaw.=20
> For instance, the plugin interrupt is continuously generated as long as t=
he cable is plugged in,
> only stopping when the cable is unplugged.
>
> That's why two interrupts are used to detect cable plugout and plugin
> separately. If interrupts aren't used, the only option is polling.

Urgh. Ok. At least, you should document that in your code then.

> > > > > > > +	/* Mailbox protect for HDMI PHY access */
> > > > > > > +	mutex_lock(&mhdp->mbox_mutex);
> > > > > > > +	ret =3D phy_init(mhdp->phy);
> > > > > > > +	mutex_unlock(&mhdp->mbox_mutex);
> > > > > > > +	if (ret) {
> > > > > > > +		dev_err(dev, "Failed to initialize PHY: %d\n", ret);
> > > > > > > +		goto clk_disable;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	/* Mailbox protect for HDMI PHY access */
> > > > > > > +	mutex_lock(&mhdp->mbox_mutex);
> > > > > > > +	ret =3D phy_set_mode(mhdp->phy, phy_mode);
> > > > > > > +	mutex_unlock(&mhdp->mbox_mutex);
> > > > > > > +	if (ret) {
> > > > > > > +		dev_err(dev, "Failed to configure PHY: %d\n", ret);
> > > > > > > +		goto clk_disable;
> > > > > > > +	}
> > > > > >
> > > > > > Why do you need a shared mutex between the phy and HDMI
> > controller?
> > > > >
> > > > > Both PHY and HDMI controller could access to the HDMI firmware by
> > > > > mailbox, So add mutex to avoid race condition.
> > > >
> > > > That should be handled at either the phy or mailbox level, not in
> > > > your hdmi driver.
> > >
> > > In both HDMI driver and PHY driver, every mailbox access had protected
> > > by its owns mutex. However, this mutex can only protect each mailbox
> > > access within their respective drivers, and it cannot provide
> > > protection for access between the HDMI and PHY drivers.
> > >
> > > The PHY driver only provides two API functions, and these functions
> > > are only called in the HDMI driver. Therefore, when accessing these
> > > functions, we use a mutex to protect them. This ensures that mailbox
> > > access is protected across different PHY and HDMI drivers.
> >=20
> > It's really about abstraction. You're using a publicly defined API, and=
 change
> > the semantics for your driver only, and that's not ok.
> >=20
> > Why can't the mailbox driver itself serialize the accesses from any use=
r, HDMI
> > and PHY drivers included?
>
> In the current code implementation, cdns-mhdp-helper.c isn't a
> standalone driver but rather a library. It provides fundamental
> mailbox access functions and basic register read/write operations that
> rely on the mailbox. These functions are highly reusable across
> MHDP8501 and MHDP8546 and can be leveraged by future MHDP versions.
>=20
> However, most MHDP firmware interactions involve a sequence of mailbox
> accesses, including sending commands and receiving firmware responses.
> These commands constitute a significant portion of all firmware
> interactions, encompassing operations like EDID reading and DP link
> training. Unfortunately, these commands cannot be reused between
> MHDP8501 and MHDP8546.
>=20
> Creating a dedicated mailbox driver with its own mutex would
> effectively address race conditions. However, this would necessitate
> relocating all mailbox-related functions to this driver. Including
> these non-reusable functions would defeat the purpose of code reuse.
>=20
> To strike a balance between code reusability and race condition
> mitigation, adding mutexes to PHY access functions seems like a
> reasonable solution.

No, it's really not. You need to address this in some other way. Why
can't you put the mutex in cdns-mhdp-helper.c calls?

Maxime

--j43latycugo6x7f7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvKLmgAKCRAnX84Zoj2+
dtgDAYC97zkBZ6FfRAm8/ipveqsjGvff9RhcY4+DzDuxWXPeqHpKVh9OqdCydnSX
r6One7QBgOTBHfSvZQZ3vk/xJyl+2i8RitQVgCIesR+Yvhb1d0OuKPFpsy0YFZrP
afxoHqnoXg==
=QCHa
-----END PGP SIGNATURE-----

--j43latycugo6x7f7--
