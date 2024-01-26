Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F6A83DBED
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 15:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F12410ED35;
	Fri, 26 Jan 2024 14:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3603 seconds by postgrey-1.36 at gabe;
 Fri, 26 Jan 2024 14:32:49 UTC
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6048B10FACE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 14:32:49 +0000 (UTC)
Received: from [194.136.85.206] (port=37072 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rTMK4-0007gG-3B;
 Fri, 26 Jan 2024 15:32:45 +0200
Date: Fri, 26 Jan 2024 15:32:31 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: "Albert, Joerg (TT-U)" <Joerg.Albert@iav.de>
Subject: Re: drm: Stable identification of connectors?
Message-ID: <20240126153231.6fd1a7f2@eldfell>
In-Reply-To: <4c03efeca8ce42beb41b2f70433e6634@iav.de>
References: <4c03efeca8ce42beb41b2f70433e6634@iav.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/10C.29x7Ja/gBsVbVPT5OV7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/10C.29x7Ja/gBsVbVPT5OV7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Jan 2024 10:30:10 +0000
"Albert, Joerg (TT-U)" <Joerg.Albert@iav.de> wrote:

> Hi,
>=20
>=20
> I=E2=80=99m pretty new to DRM/DRI and wonder if there is a way to have a
> stable identification of connectors across changes in the Linux
> kernel and/or in the devicetree?
>=20
> Our hardware contains an iMX8QM with two displays, each one connected
> to a MIPI-DSI channel. We use kernel 6.1.38. In the output of
> =E2=80=9Cmodetest -c=E2=80=9D the connectors are called LVDS-1 and LVDS-2=
. These
> names are built in modetest.c from connector_type and
> connector_type_id.
>=20
> connector_type_id is set in the kernel in
> drivers/gpu/drm/drm_connector.c in __drm_connector_init():
>=20
>=20
>        connector<https://elixir.bootlin.com/linux/latest/C/ident/connecto=
r>->connector_type_id<https://elixir.bootlin.com/linux/latest/C/ident/conne=
ctor_type_id>
> =3D
>=20
>               ida_alloc_min<https://elixir.bootlin.com/linux/latest/C/ide=
nt/ida_alloc_min>(connector_ida<https://elixir.bootlin.com/linux/latest/C/i=
dent/connector_ida>,
> 1,
> GFP_KERNEL<https://elixir.bootlin.com/linux/latest/C/ident/GFP_KERNEL>);
>=20
> Seems to me that this number depends on initialization order only. Is
> there any other way to identify a connector?
>=20
> If not, will the type_id be stable as long as we don=E2=80=99t change the
> kernel version and the device tree?

Hi,

the question of persistent connector and DRM device names (paths) comes
up every once in a while. Here is one take:
https://lists.freedesktop.org/archives/dri-devel/2019-June/221902.html

Yes, connector_type_id numbering depends on driver and connector
initialization order. Usually it has been a problem only for systems
with multiple display driver instances racing to initialize their
connectors.

One idea was to use the connector index in the KMS resources array UAPI
as a persistent device-private id. This does not work for MST and other
dynamically appearing and disappearing connectors though, and ISTR it
had some other problem too. It could be stable as long as a driver
registers its permanent connectors always in the same order.

There is the connector "PATH" property, but so far that only exists on
MST connectors, and I recall some doubts whether the current
implementation of even that was truly persistent.

In general, I believe the persistent naming of connectors is an
unsolved problem. Persistent naming of DRM devices at least has a
tentative solution as "device path", by e.g. PCI topology. I think that
breaks down if you happen to have multiple platform DRM KMS devices.

To me it seems some kind of "hardware path" would be the only truly
persistent device and connector naming scheme, assuming the hardware
remains the same.

I'd guess many desktops circumvent the problem by not identifying
connectors but displays based on their EDID serial number or hash.
Naturally that does not work always, either, EDID can lack a serial, be
identical, or not exist.


Thanks,
pq

--Sig_/10C.29x7Ja/gBsVbVPT5OV7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmWztG8ACgkQI1/ltBGq
qqcTLw/+KlecHxwOdZiVconmMWql7ky5p04/pWJeIo4J6cmllp5Fu3fmnKdskI9/
S1sKfGalxTwfPWzaiuJnPN0HFD71Bkh22TeneE2auIIhzHgmt/5XCJB870kDNhVJ
3oNWpCe4m5p+krmAPvet2AzuKmLQuKbWrOaC7Qjx7RilBaJBlFEy0fBakxIB69J8
d/Wu7ytnNRVmd5xIXec75/9YGq+7W6XvFEX8b/w8h8S8tVGG1xtrYy0pWYYT7cmC
27/GW/VSJRYEGVR+h5IVPdTIoKFMIVZM4QBQKLEHWaDooX7TakqwzGqwgdd5czjX
HssQsU3XwavZlc4gBW7/vlP/2h0bG7ayRnwr3QWjjukXYM+tPsskN/x881lzUhLj
2DFY7bInU7ycNodl0Z1i8eJmJBq1IuvMA0kunjqQUdLRmGpq6dCd+t/jYvAZ3l9+
R8oonvl8u4pakiKBn+hFoodI+YxNx7143vpslwdAb+MugPwbGOR2DjGYo7PR86Ul
oth1pDeJ0uhOG1amdegb8+XBwZM7S0xaDn6ON3VZJ7fh5T7kUdsgdON+MJED5aSY
yvaVBxouBt5ZTuuSVvPaW21vIVZsX6E0I/pNerMGVHO9I3XLP5QEQmFx84XXf0LY
pJ1bed6lTLMAtC1zMePr9EltUf9eBS6T2IUV798VVgvCwqzFcj4=
=4t39
-----END PGP SIGNATURE-----

--Sig_/10C.29x7Ja/gBsVbVPT5OV7--
