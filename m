Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C22556D18AC
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 09:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D6110F10B;
	Fri, 31 Mar 2023 07:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 34835 seconds by postgrey-1.36 at gabe;
 Fri, 31 Mar 2023 07:33:43 UTC
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6014910F10B
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 07:33:43 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-159-jibixo4mNCSA74dvMNHr1Q-1; Fri, 31 Mar 2023 08:33:40 +0100
X-MC-Unique: jibixo4mNCSA74dvMNHr1Q-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 31 Mar
 2023 08:33:39 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 31 Mar 2023 08:33:38 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Andrew Morton' <akpm@linux-foundation.org>
Subject: RE: [PATCH 0/4] log2: make is_power_of_2() more generic
Thread-Topic: [PATCH 0/4] log2: make is_power_of_2() more generic
Thread-Index: AQHZY0DwWI19nDCca0eIs2l7T1UA9K8T1qTw///9RgCAAKpk8A==
Date: Fri, 31 Mar 2023 07:33:38 +0000
Message-ID: <37671dff9b6b4e6bb07862c11cb69874@AcuMS.aculab.com>
References: <20230330104243.2120761-1-jani.nikula@intel.com>
 <20230330125041.83b0f39fa3a4ec1a42dfd95f@linux-foundation.org>
 <549987e4967d45159573901d330c96a0@AcuMS.aculab.com>
 <20230330151846.fdbc8edbfbaa6eaddb056dc7@linux-foundation.org>
In-Reply-To: <20230330151846.fdbc8edbfbaa6eaddb056dc7@linux-foundation.org>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Gow <davidgow@google.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrew Morton
> Sent: 30 March 2023 23:19
>=20
> On Thu, 30 Mar 2023 21:53:03 +0000 David Laight <David.Laight@ACULAB.COM>=
 wrote:
>=20
> > > But wouldn't all these issues be addressed by simply doing
> > >
> > > #define is_power_of_2(n) (n !=3D 0 && ((n & (n - 1)) =3D=3D 0))
> > >
> > > ?
> > >
> > > (With suitable tweaks to avoid evaluating `n' more than once)
> >
> > I think you need to use the 'horrid tricks' from min() to get
> > a constant expression from constant inputs.
>=20
> This
>=20
> --- a/include/linux/log2.h~a
> +++ a/include/linux/log2.h
> @@ -41,11 +41,11 @@ int __ilog2_u64(u64 n)
>   * *not* considered a power of two.
>   * Return: true if @n is a power of 2, otherwise false.
>   */
> -static inline __attribute__((const))
> -bool is_power_of_2(unsigned long n)
> -{
> -=09return (n !=3D 0 && ((n & (n - 1)) =3D=3D 0));
> -}
> +#define is_power_of_2(_n)=09=09=09=09\
> +=09({=09=09=09=09=09=09\
> +=09=09typeof(_n) n =3D (_n);=09=09=09\
> +=09=09n !=3D 0 && ((n & (n - 1)) =3D=3D 0);=09=09\
> +=09})
>=20
>  /**
>   * __roundup_pow_of_two() - round up to nearest power of two
> _
>=20
> worked for me in a simple test.
>=20
> --- a/fs/open.c~b
> +++ a/fs/open.c
> @@ -1564,3 +1564,10 @@ int stream_open(struct inode *inode, str
>  }
>=20
>  EXPORT_SYMBOL(stream_open);
> +
> +#include <linux/log2.h>
> +
> +int foo(void)
> +{
> +=09return is_power_of_2(43);
> +}
> _
>=20
>=20
> foo:
> # fs/open.c:1573: }
> =09xorl=09%eax, %eax=09#
> =09ret
>=20
>=20
> Is there some more tricky situation where it breaks?

Try:
static int x =3D is_power_of_2(43);

I suspect that some (all?) of the compile-time assert checks won't
like ({...}) either.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

