Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0214B97D579
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 14:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E73A10E830;
	Fri, 20 Sep 2024 12:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="L9xIfOZM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BD010E830
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 12:41:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C7A1240002;
 Fri, 20 Sep 2024 12:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1726836081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4z60SE2ViWubCiF9T9YXND4B8XSD+ZrhuspMHxaZeDA=;
 b=L9xIfOZMdADxBU5tb7Y+HnSz29RSLs2C9Lcaf5/ZLpVdIcBRoZ78ytthsx7cliSyoCjcSP
 noM3Xeey3TAexjLF9D65RjZGTvfkVdrfaROSn7Bc90b06kH5QzGRFDMfuz01ykzpm5dz14
 POMpfTtzdX4geORYZTAs9AkwvIfzZwiLKdlSorhFAcDeRKsfQ183e51HmpS5Mlsq1jJB6C
 lFPlPsiJFc3YawN6eFHFRAJDmH/prDVCJ46Y+ylMl8LOtWx+X3rPZ9EAM/RYlsNdVyKikG
 kCBGcOQYZeT9IYwt+d5U+60OHXw9YuJeUFVbWfL5Ezs7IlutQCNKmQkIZ6mq9w==
Date: Fri, 20 Sep 2024 14:41:13 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan
 <saravanak@google.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>, Jingoo
 Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, Paul Kocialkowski
 <contact@paulk.fr>, =?UTF-8?Q?Herv=C3=A9?= Codina
 <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, linux-fbdev@vger.kernel.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v4 6/8] backlight: led-backlight: add devlink to
 supplier LEDs
Message-ID: <20240920144113.427606a7@booty>
In-Reply-To: <20240919124323.GB28725@aspen.lan>
References: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
 <20240917-hotplug-drm-bridge-v4-6-bc4dfee61be6@bootlin.com>
 <20240919124323.GB28725@aspen.lan>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello Daniel,

On Thu, 19 Sep 2024 14:43:23 +0200
Daniel Thompson <daniel.thompson@linaro.org> wrote:

> On Tue, Sep 17, 2024 at 10:53:10AM +0200, Luca Ceresoli wrote:
> > led-backlight is a consumer of one or multiple LED class devices, but no
> > devlink is created for such supplier-producer relationship. One consequ=
ence
> > is that removal ordered is not correctly enforced.
> >
> > Issues happen for example with the following sections in a device tree
> > overlay:
> >
> >     // An LED driver chip
> >     pca9632@62 {
> >         compatible =3D "nxp,pca9632";
> >         reg =3D <0x62>;
> >
> > 	// ...
> >
> >         addon_led_pwm: led-pwm@3 {
> >             reg =3D <3>;
> >             label =3D "addon:led:pwm";
> >         };
> >     };
> >
> >     backlight-addon {
> >         compatible =3D "led-backlight";
> >         leds =3D <&addon_led_pwm>;
> >         brightness-levels =3D <255>;
> >         default-brightness-level =3D <255>;
> >     };
> >
> > On removal of the above overlay, the LED driver can be removed before t=
he
> > backlight device, resulting in:
> >
> >     Unable to handle kernel NULL pointer dereference at virtual address=
 0000000000000010
> >     ...
> >     Call trace:
> >      led_put+0xe0/0x140
> >      devm_led_release+0x6c/0x98 =20
>=20
> This looks like the object became invalid whilst we were holding a refere=
nce
> to it. Is that reasonable? Put another way, is using devlink here fixing a
> bug or merely hiding one?

Thanks for your comment.

Herv=C3=A9 and I just had a look at the code and there actually might be a
bug here, which we will be investigating (probably next week).

Still I think the devlink needs to be added to describe the
relationship between the supplier (LED) and consumer (backlight).

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
