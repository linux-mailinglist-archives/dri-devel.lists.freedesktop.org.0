Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CBF732D21
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 12:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1646210E04B;
	Fri, 16 Jun 2023 10:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B513810E04B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 10:13:51 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686910427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dCdt8ydTrXKYCxEhLduicCEBqeIoTgA8Fak1EkYImKY=;
 b=jxD9vDfdrnO5MEeSTKs8pQxGzfjl+tfzg5bRvfNCMCt6GJvElxt3Y3QW0vXzLmi4cWRoFd
 T7yA1v57ezMZF59OaW5W2w60RpDyrVwXT0b/f00E7Vjx/UNVu0D8ZJAAStpwHMjsiuuxE6
 lqOZs/gfrLpxUySMMcPxv8UCrvJQAYqVgpWXO2Ql5VEOaOZkNe0vQDloSIdeScnZla4q2h
 TQ+MWUmFepU4+7mr8E0r5tk7RycpjDO9xawi9r0MFIsXKgwIHLrIwszR0A3iU9Ovmqjkvl
 P7jV8/Zq7nsqO9D6+W4KqX1gXsnlxbE5SKoUQpapQAa0UkcGO9LMCrcgUd56og==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7765A1BF213;
 Fri, 16 Jun 2023 10:13:46 +0000 (UTC)
Date: Fri, 16 Jun 2023 12:13:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 7/7] drm/panel: sitronix-st7789v: Check display ID
Message-ID: <20230616121345.2501c36a@xps-13>
In-Reply-To: <20230614232724.yer2ikvfzmaiejrd@mercury.elektranox.org>
References: <20230609145951.853533-1-miquel.raynal@bootlin.com>
 <20230609145951.853533-8-miquel.raynal@bootlin.com>
 <20230610204525.GA1042549@ravnborg.org>
 <20230614232724.yer2ikvfzmaiejrd@mercury.elektranox.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

sre@kernel.org wrote on Thu, 15 Jun 2023 01:27:24 +0200:

> Hi,
>=20
> On Sat, Jun 10, 2023 at 10:45:25PM +0200, Sam Ravnborg wrote:
> > Hi Miquel,
> >=20
> > On Fri, Jun 09, 2023 at 04:59:51PM +0200, Miquel Raynal wrote: =20
> > > A very basic debugging rule when a device is connected for the first
> > > time is to access a read-only register which contains known data in
> > > order to ensure the communication protocol is properly working. This
> > > driver lacked any read helper which is often a critical peace for
> > > fastening bring-ups.
> > >=20
> > > Add a read helper and use it to verify the communication with the pan=
el
> > > is working as soon as possible in order to fail early if this is not =
the
> > > case. =20
> >=20
> > The read helper seems like a log of general boiler plate code.
> > I briefly looked into the use of regmap for the spi communication,
> > but it did not look like it supported the bit9 stuff.
> >=20
> > I did not stare enough to add a reviewd by, but the approach is fine
> > and it is good to detech issues early. =20
>=20
> The st7789v datasheet describes a setup where SPI is connected
> unidirectional (i.e. without MISO). In that case the ID check
> will fail.

Right. I'll add a (spi->mode & SPI_NO_RX) check, as the default is to
have both lines, if there is no MISO line, I'd expect it to be
described in the DT, otherwise the description is broken.

Thanks,
Miqu=C3=A8l
