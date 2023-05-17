Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E5D706617
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 13:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007B710E3E6;
	Wed, 17 May 2023 11:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 368 seconds by postgrey-1.36 at gabe;
 Wed, 17 May 2023 11:05:29 UTC
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F06010E3E6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 11:05:29 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-21-rAgZD7axM7GFuHj9YrRhAw-1; Wed, 17 May 2023 11:59:16 +0100
X-MC-Unique: rAgZD7axM7GFuHj9YrRhAw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 17 May
 2023 11:59:14 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 17 May 2023 11:59:14 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'15330273260@189.cn'" <15330273260@189.cn>, Sui Jingfeng
 <suijingfeng@loongson.cn>, Li Yi <liyi@loongson.cn>
Subject: RE: [PATCH] drm/drm_vblank.c: avoid unsigned int to signed int cast
Thread-Topic: [PATCH] drm/drm_vblank.c: avoid unsigned int to signed int cast
Thread-Index: AQHZiBwkXHI4wBkIl0yfSK4Xtptrs69eSnTg
Date: Wed, 17 May 2023 10:59:14 +0000
Message-ID: <f6bd362145124f34a1af800dd330f8e9@AcuMS.aculab.com>
References: <20230516173026.2990705-1-15330273260@189.cn>
In-Reply-To: <20230516173026.2990705-1-15330273260@189.cn>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "loongson-kernel@lists.loongnix.cn" <loongson-kernel@lists.loongnix.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: 15330273260@189.cn
> Sent: 16 May 2023 18:30
>=20
> From: Sui Jingfeng <suijingfeng@loongson.cn>
>=20
> Both mode->crtc_htotal and mode->crtc_vtotal are u16 type,
> mode->crtc_htotal * mode->crtc_vtotal will results a unsigned type.

Nope, u16 gets promoted to 'signed int' and the result of the
multiply is also signed.

> Using a u32 is enough to store the result, but considering that the
> result will be casted to u64 soon after. We use a u64 type directly.
> So there no need to cast it to signed type and cast back then.
....
> -=09=09int frame_size =3D mode->crtc_htotal * mode->crtc_vtotal;
> +=09=09u64 frame_size =3D mode->crtc_htotal * mode->crtc_vtotal;
...
> -=09=09framedur_ns =3D div_u64((u64) frame_size * 1000000, dotclock);
> +=09=09framedur_ns =3D div_u64(frame_size * 1000000, dotclock);

The (u64) cast is there to extend the value to 64bits, not
because the original type is signed.
The compiler will detect that the old code is a 32x32 multiply
where a 64bit result is needed, that may not be true for the
changed code (it would need to track back as far as the u16s).

It is not uncommon to force a 64bit result from a multiply
by making the constant 64bit. As in:
=09div_u64(frame_size * 1000000ULL, dotclock);

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

