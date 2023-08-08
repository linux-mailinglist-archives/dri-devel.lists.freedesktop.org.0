Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C02077383A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 08:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4638E10E3A8;
	Tue,  8 Aug 2023 06:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9349810E3A8
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 06:33:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B96F31BF204;
 Tue,  8 Aug 2023 06:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1691476421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ebVksINinmVRuPTTbPyMv6YEQx1vti2JsoeV+wTH3Gw=;
 b=Q0u3t8aSfb2p0E7+MTlspxSfO20FIQgHN5W3uU9TWPIkdMtedc5g6nQv9IHeGdVysmCw1s
 L0YrB8ID/8/yUYn+EHI86P0F/CootdIUlOnKe/TWOpFsV1ke/ztGVPmQjNqLkOG5fyuM5J
 Of8EMt8seT83re/XzVkslHBnYWkMyScPu5667iLU/YgRvH8EhoKjRgQkjThhNlRgPOGLkj
 Ewtu/gBiyI7CldGvrpGMApE0tvA4+E7E4MaY4Os21mYu8Q1l1mka72uhHLsR5YEsXQHI6Y
 gJZydfFN/TBTFyjDcDZIulm61RiSmS6mIVKStt7vbHsHRrNzPgU3FCDUltoKJg==
Date: Tue, 8 Aug 2023 08:33:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm: atmel-hlcdc: Support inverting the pixel clock
 polarity
Message-ID: <20230808083338.5e31584c@xps-13>
In-Reply-To: <20230807165245.GA281773@ravnborg.org>
References: <20230609144843.851327-1-miquel.raynal@bootlin.com>
 <20230610200515.GA1041001@ravnborg.org>
 <20230807111246.663637a6@xps-13>
 <20230807165245.GA281773@ravnborg.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, rfoss@kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

sam@ravnborg.org wrote on Mon, 7 Aug 2023 18:52:45 +0200:

> Hi Miquel,
>=20
> On Mon, Aug 07, 2023 at 11:12:46AM +0200, Miquel Raynal wrote:
> > Hi Sam,
> >=20
> > sam@ravnborg.org wrote on Sat, 10 Jun 2023 22:05:15 +0200:
> >  =20
> > > On Fri, Jun 09, 2023 at 04:48:43PM +0200, Miquel Raynal wrote: =20
> > > > On the SoC host controller, the pixel clock can be:
> > > > * standard: data is launched on the rising edge
> > > > * inverted: data is launched on the falling edge
> > > >=20
> > > > Some panels may need the inverted option to be used so let's support
> > > > this DRM flag.
> > > >=20
> > > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>   =20
> > >=20
> > > Hi Miquel,
> > >=20
> > > the patch is:
> > > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > >=20
> > > I hope someone else can pick it up and apply it to drm-misc as
> > > my drm-misc setup is hopelessly outdated atm. =20
> >=20
> > I haven't been noticed this patch was picked-up, is your tree still
> > outdated or can you take care of it? =20
>=20
> I am still hopelessly behind on stuff.

No problem.

> I copied a few people on this mail that I hope can help.

Nice, thanks a lot!

> Link to the original patch:
> https://lore.kernel.org/dri-devel/20230609144843.851327-1-miquel.raynal@b=
ootlin.com/
>=20
> 	Sam

Let me know in case it's easier if I re-send it.

Thanks,
Miqu=C3=A8l
