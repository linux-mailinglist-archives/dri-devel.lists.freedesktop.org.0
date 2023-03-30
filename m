Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A066D1196
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 23:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1162610F052;
	Thu, 30 Mar 2023 21:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Thu, 30 Mar 2023 21:59:14 UTC
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1697910F085
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 21:59:13 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-13-XNRIvLOrOXesN_kJbVyF0A-1; Thu, 30 Mar 2023 22:53:05 +0100
X-MC-Unique: XNRIvLOrOXesN_kJbVyF0A-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 30 Mar
 2023 22:53:04 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 30 Mar 2023 22:53:04 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Andrew Morton' <akpm@linux-foundation.org>, Jani Nikula
 <jani.nikula@intel.com>
Subject: RE: [PATCH 0/4] log2: make is_power_of_2() more generic
Thread-Topic: [PATCH 0/4] log2: make is_power_of_2() more generic
Thread-Index: AQHZY0DwWI19nDCca0eIs2l7T1UA9K8T1qTw
Date: Thu, 30 Mar 2023 21:53:03 +0000
Message-ID: <549987e4967d45159573901d330c96a0@AcuMS.aculab.com>
References: <20230330104243.2120761-1-jani.nikula@intel.com>
 <20230330125041.83b0f39fa3a4ec1a42dfd95f@linux-foundation.org>
In-Reply-To: <20230330125041.83b0f39fa3a4ec1a42dfd95f@linux-foundation.org>
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
Cc: David Gow <davidgow@google.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrew Morton
> Sent: 30 March 2023 20:51
>=20
> On Thu, 30 Mar 2023 13:42:39 +0300 Jani Nikula <jani.nikula@intel.com> wr=
ote:
>=20
> > is_power_of_2() only works for types <=3D sizeof(unsigned long) and it'=
s
> > also not a constant expression. There are a number of places in kernel
> > where is_power_of_2() is called on u64, which fails on 32-bit
> > builds. Try to remedy that. While at it, make it a constant expression
> > when possible.
>=20
> Yes, the current `is_power_of_2(unsigned long n)' isn't very general.
>=20
> But wouldn't all these issues be addressed by simply doing
>=20
> #define is_power_of_2(n) (n !=3D 0 && ((n & (n - 1)) =3D=3D 0))
>=20
> ?
>=20
> (With suitable tweaks to avoid evaluating `n' more than once)

I think you need to use the 'horrid tricks' from min() to get
a constant expression from constant inputs.

For non-constants this looks ok (see https://godbolt.org/z/G73MTr9jn)

=09David

static inline int lisp2(unsigned long n)
{
    return n && !(n & (n - 1));
}

static inline int llisp2(unsigned long long lln)
{
#if 0  // I think this looks worse, esp. for gcc on x86
    return lln && !(lln & (lln - 1));
#else
    unsigned long n =3D lln;
    if (lln >=3D 1ull << 32) {
        if (n)
            return 0;
        n =3D lln >> 32;=20
    }
    return lisp2(n);
#endif
}

#define isp2(n) (sizeof ((n)+0) =3D=3D sizeof (long) ? lisp2(n) : llisp2(n)=
)

int is12(unsigned long long  i)
{
    return isp2(i);
}

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

