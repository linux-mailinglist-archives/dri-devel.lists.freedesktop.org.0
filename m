Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201E59E1B8E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 13:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D1810E334;
	Tue,  3 Dec 2024 12:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fdDeCtLV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21FC10E334
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 12:01:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C52165C6C7C;
 Tue,  3 Dec 2024 12:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBAF4C4CECF;
 Tue,  3 Dec 2024 12:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733227261;
 bh=rlz53vWDp5E/pYVOEj1URbYGt1AREB4Xo9ogjRjCu50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fdDeCtLVqECfRfNoqbCzzD0S2R+ze8fu4xgXlPdQFJQ+STayO+czgml6vxR6gAr9u
 SfvYrgXRdRmOjMEDiUcIg8Ywi35riI0nUxeZrJIGAla7/uurms7YmN220IRsCbVxR6
 0RLGXO472a27O/MHnrmTkWCsCE1MnHGszPPpy+ATOMh/r4ZUNj1XVz+G2aEnELC83Q
 5zXc30+JHwj5J8xXpxDpdRcwIa3kank2REKqd9CMrbu3SZA6RQSEQqgx6shuUaL3BU
 er9sxGEV01E1uZex0+a/6+JDYf3SqBVZ3ELFg7wS+IFimmHwT30DsHPjPlqmlPz8Tg
 GqLyWYoqGameA==
Date: Tue, 3 Dec 2024 13:00:58 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>, 
 Michael Jamet <michael.jamet@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>, 
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, Jiri Slaby <jirislaby@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Lee Duncan <lduncan@suse.com>, Chris Leech <cleech@redhat.com>, 
 Mike Christie <michael.christie@oracle.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Nilesh Javali <njavali@marvell.com>, 
 Manish Rangankar <mrangankar@marvell.com>,
 GR-QLogic-Storage-Upstream@marvell.com, 
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Alison Schofield <alison.schofield@intel.com>,
 Andreas Larsson <andreas@gaisler.com>, 
 Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, 
 Jens Axboe <axboe@kernel.dk>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org, 
 linux-gpio@vger.kernel.org, netdev@vger.kernel.org, linux-pwm@vger.kernel.org, 
 nvdimm@lists.linux.dev, linux1394-devel@lists.sourceforge.net, 
 linux-serial@vger.kernel.org, linux-sound@vger.kernel.org,
 open-iscsi@googlegroups.com, 
 linux-scsi@vger.kernel.org, linux-cxl@vger.kernel.org,
 sparclinux@vger.kernel.org, 
 linux-block@vger.kernel.org, arm-scmi@vger.kernel.org,
 linux-efi@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH v2 00/32] driver core: Constify API device_find_child()
 and adapt for various existing usages
Message-ID: <g32cigmktmj4egkq2tof27el2yss4liccfxgebkgqvkil32mlb@e3ta4ezv7y4m>
References: <20241203-const_dfc_done-v2-0-7436a98c497f@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="35h4iyqfzzpzpkno"
Content-Disposition: inline
In-Reply-To: <20241203-const_dfc_done-v2-0-7436a98c497f@quicinc.com>
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


--35h4iyqfzzpzpkno
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 00/32] driver core: Constify API device_find_child()
 and adapt for various existing usages
MIME-Version: 1.0

Hello,

On Tue, Dec 03, 2024 at 08:33:22AM +0800, Zijun Hu wrote:
> This patch series is to constify the following API:
> struct device *device_find_child(struct device *dev, void *data,
> 		int (*match)(struct device *dev, void *data));
> To :
> struct device *device_find_child(struct device *dev, const void *data,
> 				 device_match_t match);
> typedef int (*device_match_t)(struct device *dev, const void *data);

This series isn't bisectible. With only the first two patches applied I
hit:

  CC      drivers/pwm/core.o
drivers/pwm/core.c: In function =E2=80=98pwm_unexport_child=E2=80=99:
drivers/pwm/core.c:1292:55: error: passing argument 3 of =E2=80=98device_fi=
nd_child=E2=80=99 from incompatible pointer type [-Wincompatible-pointer-ty=
pes]
 1292 |         pwm_dev =3D device_find_child(pwmchip_dev, pwm, pwm_unexpor=
t_match);
      |                                                       ^~~~~~~~~~~~~=
~~~~~
      |                                                       |
      |                                                       int (*)(struc=
t device *, void *)
In file included from include/linux/acpi.h:14,
                 from drivers/pwm/core.c:11:
include/linux/device.h:1085:49: note: expected =E2=80=98device_match_t=E2=
=80=99 {aka =E2=80=98int (*)(struct device *, const void *)=E2=80=99} but a=
rgument is of type =E2=80=98int (*)(struct device *, void *)=E2=80=99
 1085 |                                  device_match_t match);
      |                                  ~~~~~~~~~~~~~~~^~~~~
drivers/pwm/core.c: In function =E2=80=98pwm_class_get_state=E2=80=99:
drivers/pwm/core.c:1386:55: error: passing argument 3 of =E2=80=98device_fi=
nd_child=E2=80=99 from incompatible pointer type [-Wincompatible-pointer-ty=
pes]
 1386 |         pwm_dev =3D device_find_child(pwmchip_dev, pwm, pwm_unexpor=
t_match);
      |                                                       ^~~~~~~~~~~~~=
~~~~~
      |                                                       |
      |                                                       int (*)(struc=
t device *, void *)
include/linux/device.h:1085:49: note: expected =E2=80=98device_match_t=E2=
=80=99 {aka =E2=80=98int (*)(struct device *, const void *)=E2=80=99} but a=
rgument is of type =E2=80=98int (*)(struct device *, void *)=E2=80=99
 1085 |                                  device_match_t match);
      |                                  ~~~~~~~~~~~~~~~^~~~~
make[5]: *** [scripts/Makefile.build:194: drivers/pwm/core.o] Error 1
make[4]: *** [scripts/Makefile.build:440: drivers/pwm] Error 2
make[3]: *** [scripts/Makefile.build:440: drivers] Error 2
make[2]: *** [Makefile:1989: .] Error 2
make[1]: *** [Makefile:372: __build_one_by_one] Error 2
make: *** [Makefile:251: __sub-make] Error 2

Best regards
Uwe

--35h4iyqfzzpzpkno
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdO8vgACgkQj4D7WH0S
/k5hrwgAmMfv4tgQM/zHhRunXZer+6rbqIrp5LbiXSYngMgHSWkkF/Aqcp/Uejmb
FQwdlGB47gyVlHT5SP4HCDeST+PhX0lg3vHxP2lg0HaHp7/vgJRZAI65iOfy7DY7
xqXQ+U2+YvtY+lwSneGFeXo9VZZtuu/YfpP8Qg6jH8dGaIojaU57rB+uJCpdvZmt
VJhc51IAA6eHPcPMGf5mvS8/A7M8uPDwyEgWBDP/MRE0z6oKEjVLPWYFzXjUaVnZ
MMOmGyzIfvhHTMxlkisgCC+PwmjrO2lZFsM1jD6SVNzMp6XeT2jiGa7lbfXaK9Rk
7TvM1d7dwtqa42JTuIjTWWBR7AfmBA==
=Sef0
-----END PGP SIGNATURE-----

--35h4iyqfzzpzpkno--
