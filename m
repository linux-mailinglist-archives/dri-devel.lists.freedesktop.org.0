Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87B1770541
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 17:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AAE910E726;
	Fri,  4 Aug 2023 15:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C6810E726
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 15:51:47 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-76-qm7ktrQ9OHKl6gBtn9SNaQ-1; Fri, 04 Aug 2023 16:50:20 +0100
X-MC-Unique: qm7ktrQ9OHKl6gBtn9SNaQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 4 Aug
 2023 16:50:18 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 4 Aug 2023 16:50:18 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Andrew Morton' <akpm@linux-foundation.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v4 1/1] drm/i915: Move abs_diff() to math.h
Thread-Topic: [PATCH v4 1/1] drm/i915: Move abs_diff() to math.h
Thread-Index: AQHZxi9qpYx0cq9pFEOYLGUrdsezOq/aSRTQ
Date: Fri, 4 Aug 2023 15:50:18 +0000
Message-ID: <7c1885528d474c719bb4d4e0cf985753@AcuMS.aculab.com>
References: <20230803131918.53727-1-andriy.shevchenko@linux.intel.com>
 <20230803102446.8edf94acc77e81ab2e09cee3@linux-foundation.org>
In-Reply-To: <20230803102446.8edf94acc77e81ab2e09cee3@linux-foundation.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Jiri Slaby <jirislaby@kernel.org>, Alexey Dobriyan <adobriyan@gmail.com>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrew Morton
> Sent: 03 August 2023 18:25
>=20
> On Thu,  3 Aug 2023 16:19:18 +0300 Andy Shevchenko <andriy.shevchenko@lin=
ux.intel.com> wrote:
>=20
> > abs_diff() belongs to math.h. Move it there.
> > This will allow others to use it.
> >
> > ...
> >
> > --- a/include/linux/math.h
> > +++ b/include/linux/math.h
> > @@ -155,6 +155,13 @@ __STRUCT_FRACT(u32)
> >  =09__builtin_types_compatible_p(typeof(x), unsigned type),=09=09\
> >  =09({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
> >
> > +#define abs_diff(a, b) ({=09=09=09\
> > +=09typeof(a) __a =3D (a);=09=09=09\
> > +=09typeof(b) __b =3D (b);=09=09=09\
> > +=09(void)(&__a =3D=3D &__b);=09=09=09\
> > +=09__a > __b ? (__a - __b) : (__b - __a);=09\
> > +})
>=20
> Can we document it please?
>=20
> Also, the open-coded type comparison could be replaced with __typecheck()=
?
>=20
> And why the heck isn't __typecheck() in typecheck.h, to be included by
> minmax.h.

And why would you want to use __typecheck() anyway?
It pretty much isn't the test you are looking for.
If you are trying to explicitly avoid converting negative value
to large positive unsigned ones then you want something like:
=09is_signed_type(typeof(a)) =3D=3D is_signed_type(typeof(b))
but it isn't even that simple :-)

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

