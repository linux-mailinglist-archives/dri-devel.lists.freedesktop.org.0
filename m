Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2651C83DD0D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 16:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C9A10FAAA;
	Fri, 26 Jan 2024 15:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891EE10F5DD
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 15:07:03 +0000 (UTC)
Received: from [194.136.85.206] (port=60604 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rTNnJ-00036h-39;
 Fri, 26 Jan 2024 17:07:01 +0200
Date: Fri, 26 Jan 2024 17:07:00 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: drm: Stable identification of connectors?
Message-ID: <20240126170700.34be726a@eldfell>
In-Reply-To: <CAPY8ntA2yOUnP7DEeHahYsW8vC-Xpqf37ZmycDdO-NoobfjyDw@mail.gmail.com>
References: <AdpQQouNfGqYf3uSSdGt8uzEBuaRnw==>
 <4c03efeca8ce42beb41b2f70433e6634@iav.de>
 <CAPY8ntA2yOUnP7DEeHahYsW8vC-Xpqf37ZmycDdO-NoobfjyDw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/42_6C1wRHHyT.U_FW2f=kUY";
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
Cc: "Albert, Joerg \(TT-U\)" <Joerg.Albert@iav.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/42_6C1wRHHyT.U_FW2f=kUY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Jan 2024 14:18:36 +0000
Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:

> Raspberry Pi 5 has a similar issue that it has two independent DRM driver
> instances each initialising a DSI connector. Which one gets assigned DSI-1
> vs DSI-2 is down to probe order, and can change between boots.
> You also have the situation that a panel connected to the second connector
> is referred to as DSI-1 if nothing is connected to the first, but it'll
> probably bump up to DSI-2 should you later configure a panel on the first
> connector. Any configuration within a window manager based on display ID =
is
> therefore near useless if there is any change to the system.
>=20
> It's the same situation if you have more than one SPI display using the
> mipi-dbi-spi or tinyDRM drivers - ordering of display to SPI-x IDs is down
> to probe order, so near random.
>=20
> I haven't attempted to upstream this yet, but on our tree [1] I've adopted
> the same approach as the I2C and SPI subsystems take where a DT alias can
> be used to set the desired connector ID. Devices with no alias get assign=
ed
> IDs above the last assigned alias.

Hi Dave,

how does the DT make sure that the alias is always assigned to the same
physical connector?

Is there some persistent, permanent, stable hardware path that the DT
is keying off of?

How about finding a consensus on exposing such hardware paths in the
first place so that there is no need to set aliases in DT. That could
also help systems that don't use DT in the first place.

I think Ville had a serious attempt in
https://lists.freedesktop.org/archives/dri-devel/2019-June/221902.html
but I guess people were not interested?


Thanks,
pq

> Seeing as you've raised the same issue, it'd be interesting to know the
> view of the maintainers as to whether my solution is acceptable. There's =
no
> point in trying to upstream it if it's going to be immediately shot down.
>=20
> Thanks.
>   Dave
>=20
> [1]
> https://github.com/raspberrypi/linux/commit/3aa1f2477545ea6298bc6f2d7ffae=
68f090af9b8
> and fixup
> https://github.com/raspberrypi/linux/commit/f429fc1a072d4bb35e622a1012a5a=
52914eba4e3
>=20

--Sig_/42_6C1wRHHyT.U_FW2f=kUY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmWzypQACgkQI1/ltBGq
qqcOxA//ZazykNP7XYqcxZKfdrPAuS5MmDCjv1MkKg2uNaAWkeijLBnyS/blPo9O
sNuCUF2258A/bxiXUg9X9dJ3WEhkjpq4SZXU4HDuXkwBpCH34evihtG4r8Clc6//
pZ+Q5tLa8EuYG8VNadYQeSpQM2AsuvoqTIyDUP7bvE4dtNkKoGowRtDB89rHMKx+
trNnKWCMIjr1LQWvoPDKAIMEgTY10K/efLwg/I8Y5TP/P6qmHmf09wRyqwoTh0YK
BvvEVECYtJJWXZn2CM9egt0psG4Ag/NKd1qWAq+WsS+HhnjecIEmzG115bLu2XeL
6rFJXwTxbv5PQFeS0SHusiBTe62YgD59VlfGnA/FSIQBTa+1xr90HDMIsl2fsxpz
XjSDecBk8295QZlOudA020AJ1af2RuVUcxZ5J0HkRY4dTMmEIQuyHUJoPtPJdEAo
QzHgA/Dif7QHKfXtQciSrBXukBk5x9WLpAK/YWkqd2vZN0AwuRKyEWKTGIF3tZ8o
eZ0RBGXbB6V5J+/zUzQnmqDEeLCzXnZV4Fl54V1LL5xAqqaCCWhuOBStPC+GxMnM
ZZVIjLsvcgyAllT8xrCopn+sZg5MnseismdgtCLAUONdIgPteWefQ2yig/NbABpm
wI5Tiy/qIsPzWktwgvC0swJM2UxqjsckQDFQ30Oz2ZVHVPrkk+8=
=hqyv
-----END PGP SIGNATURE-----

--Sig_/42_6C1wRHHyT.U_FW2f=kUY--
