Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE6E83F95F
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 20:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAA410E142;
	Sun, 28 Jan 2024 19:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 328 seconds by postgrey-1.36 at gabe;
 Sun, 28 Jan 2024 19:30:02 UTC
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D30610E142
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 19:30:02 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-318-8QfP3wKZN0SExZdtO-dIDg-1; Sun, 28 Jan 2024 19:28:15 +0000
X-MC-Unique: 8QfP3wKZN0SExZdtO-dIDg-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 28 Jan
 2024 19:27:51 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 28 Jan 2024 19:27:51 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>, "'Linus
 Torvalds'" <torvalds@linux-foundation.org>, 'Netdev'
 <netdev@vger.kernel.org>, "'dri-devel@lists.freedesktop.org'"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH next 03/11] minmax: Simplify signedness check
Thread-Topic: [PATCH next 03/11] minmax: Simplify signedness check
Thread-Index: AdpSIB/Zp5Jfu0DYRYSLz+RLoj6R6Q==
Date: Sun, 28 Jan 2024 19:27:51 +0000
Message-ID: <760fed5020ac42419cb0c3579ba1ed6c@AcuMS.aculab.com>
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

It is enough to check that both 'x' and 'y' are valid for either
a signed compare or an unsigned compare.
For unsigned they must be an unsigned type or a positive constant.
For signed they must be signed after unsigned char/short are promoted.

The predicate for _Static_assert() only needs to be a compile-time
constant not a constant integeger expression.
In particular the short-circuit evaluation of || && ?: can be used
to avoid the non-constantness of (pointer_type)1 in is_signed_type().

The '+ 0' in '(x) + 0 > =3D 0' is there to convert 'bool' to 'int'
and avoid a compiler warning because max() gets used for 'bool'
in one place (a very expensive 'or').
(The code is optimised away by two earlier checks - but the compiler
still bleats.)

Signed-off-by: David Laight <david.laight@aculab.com>
---
 include/linux/minmax.h | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/include/linux/minmax.h b/include/linux/minmax.h
index 900eec7a28e5..c32b4b40ce01 100644
--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -8,7 +8,7 @@
 #include <linux/types.h>
=20
 /*
- * min()/max()/clamp() macros must accomplish three things:
+ * min()/max()/clamp() macros must accomplish several things:
  *
  * - Avoid multiple evaluations of the arguments (so side-effects like
  *   "x++" happen only once) when non-constant.
@@ -26,19 +26,17 @@
 #define __typecheck(x, y) \
 =09(!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
=20
-/* is_signed_type() isn't a constexpr for pointer types */
-#define __is_signed(x) =09=09=09=09=09=09=09=09\
-=09__builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),=09\
-=09=09is_signed_type(typeof(x)), 0)
+/* Allow unsigned compares against non-negative signed constants. */
+#define __is_ok_unsigned(x) \
+=09(is_unsigned_type(typeof(x)) || (__is_constexpr(x) ? (x) + 0 >=3D 0 : 0=
))
=20
-/* True for a non-negative signed int constant */
-#define __is_noneg_int(x)=09\
-=09(__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >=3D=
 0)
+/* Check for signed after promoting unsigned char/short to int */
+#define __is_ok_signed(x) is_signed_type(typeof((x) + 0))
=20
-#define __types_ok(x, y) =09=09=09=09=09\
-=09(__is_signed(x) =3D=3D __is_signed(y) ||=09=09=09\
-=09=09__is_signed((x) + 0) =3D=3D __is_signed((y) + 0) ||=09\
-=09=09__is_noneg_int(x) || __is_noneg_int(y))
+/* Allow if both x and y are valid for either signed or unsigned compares.=
 */
+#define __types_ok(x, y)=09=09=09=09\
+=09((__is_ok_signed(x) && __is_ok_signed(y)) ||=09\
+=09 (__is_ok_unsigned(x) && __is_ok_unsigned(y)))
=20
 #define __cmp_op_min <
 #define __cmp_op_max >
--=20
2.17.1

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

