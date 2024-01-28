Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C03A483F964
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 20:31:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C1C10E41B;
	Sun, 28 Jan 2024 19:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32A710E41B
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 19:31:49 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-169-WRvxRy7ONzyzi7NxjGX4Dw-1; Sun, 28 Jan 2024 19:31:47 +0000
X-MC-Unique: WRvxRy7ONzyzi7NxjGX4Dw-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 28 Jan
 2024 19:31:22 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 28 Jan 2024 19:31:22 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>, "'Linus
 Torvalds'" <torvalds@linux-foundation.org>, 'Netdev'
 <netdev@vger.kernel.org>, "'dri-devel@lists.freedesktop.org'"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH next 0711] minmax: minmax: Add __types_ok3() and optimise
 defines with 3 arguments
Thread-Topic: [PATCH next 0711] minmax: minmax: Add __types_ok3() and optimise
 defines with 3 arguments
Thread-Index: AdpSIJ67DKuJ6SuSTnaAcsGvmvekeg==
Date: Sun, 28 Jan 2024 19:31:22 +0000
Message-ID: <78f9c15ad67940fe91ac39b9c26113be@AcuMS.aculab.com>
References: <0ca26166dd2a4ff5a674b84704ff1517@AcuMS.aculab.com>
In-Reply-To: <0ca26166dd2a4ff5a674b84704ff1517@AcuMS.aculab.com>
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
Cc: 'Jens Axboe' <axboe@kernel.dk>,
 "'Matthew Wilcox \(Oracle\)'" <willy@infradead.org>,
 'Christoph Hellwig' <hch@infradead.org>,
 "'linux-btrfs@vger.kernel.org'" <linux-btrfs@vger.kernel.org>,
 'Andrew Morton' <akpm@linux-foundation.org>,
 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>,
 "'David S . Miller'" <davem@davemloft.net>, 'Dan
 Carpenter' <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

min3() and max3() were added to optimise nested min(x, min(y, z))
sequences, bit only moved where the expansion was requiested.

Add a separate implementation for 3 argument calls.
These are never required to generate constant expressiions to
remove that logic.

Signed-off-by: David Laight <david.laight@aculab.com>
---
 include/linux/minmax.h | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/include/linux/minmax.h b/include/linux/minmax.h
index 5c7fce76abe5..278a390b8a4c 100644
--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -38,6 +38,11 @@
 =09((__is_ok_signed(x) && __is_ok_signed(y)) ||=09\
 =09 (__is_ok_unsigned(x) && __is_ok_unsigned(y)))
=20
+/* Check three values for min3(), max3() and clamp() */
+#define __types_ok3(x, y, z)=09=09=09=09=09=09=09\
+=09((__is_ok_signed(x) && __is_ok_signed(y) && __is_ok_signed(z)) ||=09\
+=09 (__is_ok_unsigned(x) && __is_ok_unsigned(y) && __is_ok_unsigned(z)))
+
 #define __cmp_op_min <
 #define __cmp_op_max >
=20
@@ -87,13 +92,24 @@
 #define umax(x, y)=09\
 =09__careful_cmp(max, __zero_extend(x), _zero_extend(y), __COUNTER__)
=20
+#define __cmp_once3(op, x, y, z, uniq) ({=09\
+=09typeof(x) __x_##uniq =3D (x);=09=09\
+=09typeof(x) __y_##uniq =3D (y);=09=09\
+=09typeof(x) __z_##uniq =3D (z);=09=09\
+=09__cmp(op, __cmp(op, __x_##uniq, __y_##uniq), __z_##uniq); })
+
+#define __careful_cmp3(op, x, y, z, uniq) ({=09=09=09=09\
+=09static_assert(__types_ok3(x, y, z),=09=09=09=09\
+=09=09#op "3(" #x ", " #y ", " #z ") signedness error");=09\
+=09__cmp_once3(op, x, y, z, uniq); })
+
 /**
  * min3 - return minimum of three values
  * @x: first value
  * @y: second value
  * @z: third value
  */
-#define min3(x, y, z) min((typeof(x))min(x, y), z)
+#define min3(x, y, z) __careful_cmp3(min, x, y, z, __COUNTER__)
=20
 /**
  * max3 - return maximum of three values
@@ -101,7 +117,7 @@
  * @y: second value
  * @z: third value
  */
-#define max3(x, y, z) max((typeof(x))max(x, y), z)
+#define max3(x, y, z) __careful_cmp3(max, x, y, z, __COUNTER__)
=20
 /**
  * min_t - return minimum of two values, using the specified type
@@ -142,8 +158,7 @@
 =09__clamp(__val_##uniq, __lo_##uniq, __hi_##uniq); })
=20
 #define __careful_clamp(val, lo, hi, uniq) ({=09=09=09=09=09\
-=09_Static_assert(__types_ok(val, lo), "clamp() 'lo' signedness error");=
=09\
-=09_Static_assert(__types_ok(val, hi), "clamp() 'hi' signedness error");=
=09\
+=09_Static_assert(__types_ok3(val, lo, hi), "clamp() signedness error");=
=09\
 =09__clamp_once(val, lo, hi, uniq); })
=20
 /**
--=20
2.17.1

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

