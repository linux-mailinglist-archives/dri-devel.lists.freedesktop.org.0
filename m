Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2185A83F982
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 20:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC2110E80F;
	Sun, 28 Jan 2024 19:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851D410E7EF
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 19:37:12 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-227-RgW8bFtTPC263FLYeWYyZg-1; Sun, 28 Jan 2024 19:37:05 +0000
X-MC-Unique: RgW8bFtTPC263FLYeWYyZg-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 28 Jan
 2024 19:36:41 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 28 Jan 2024 19:36:41 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>, "'Linus
 Torvalds'" <torvalds@linux-foundation.org>, 'Netdev'
 <netdev@vger.kernel.org>, "'dri-devel@lists.freedesktop.org'"
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH next 11/11] minmax: min() and max() don't need to return
 constant expressions
Thread-Topic: [PATCH next 11/11] minmax: min() and max() don't need to return
 constant expressions
Thread-Index: AdpSIVojuBa8D6X6RNmhjGfjyElxVg==
Date: Sun, 28 Jan 2024 19:36:41 +0000
Message-ID: <30b5bc6c60a147f9985b47fb1cc08d2e@AcuMS.aculab.com>
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

After changing the handful of places max() was used to size an on-stack
array to use max_const() it is no longer necessary for min() and max()
to return constant expressions from constant inputs.
Remove the associated logic to reduce the expanded text.

Remove the 'hack' that allowed max(bool, bool).

Fixup the initial block comment to match current reality.

Signed-off-by: David Laight <david.laight@aculab.com>
---
 include/linux/minmax.h | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/linux/minmax.h b/include/linux/minmax.h
index c08916588425..5e65c98ff256 100644
--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -8,13 +8,10 @@
 #include <linux/types.h>
=20
 /*
- * min()/max()/clamp() macros must accomplish three things:
+ * min()/max()/clamp() macros must accomplish several things:
  *
  * - Avoid multiple evaluations of the arguments (so side-effects like
  *   "x++" happen only once) when non-constant.
- * - Retain result as a constant expressions when called with only
- *   constant expressions (to avoid tripping VLA warnings in stack
- *   allocation usage).
  * - Perform signed v unsigned type-checking (to generate compile
  *   errors instead of nasty runtime surprises).
  * - Unsigned char/short are always promoted to signed int and can be
@@ -22,13 +19,19 @@
  * - Unsigned arguments can be compared against non-negative signed consta=
nts.
  * - Comparison of a signed argument against an unsigned constant fails
  *   even if the constant is below __INT_MAX__ and could be cast to int.
+ *
+ * The return value of min()/max() is not a constant expression for
+ * constant parameters - so will trigger a VLA warging if used to size
+ * an on-stack array.
+ * Instead use min_const() or max_const() which do generate constant
+ * expressions and are also valid for static initialisers.
  */
 #define __typecheck(x, y) \
 =09(!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
=20
 /* Allow unsigned compares against non-negative signed constants. */
 #define __is_ok_unsigned(x) \
-=09(is_unsigned_type(typeof(x)) || (__is_constexpr(x) ? (x) + 0 >=3D 0 : 0=
))
+=09(is_unsigned_type(typeof(x)) || (__is_constexpr(x) ? (x) >=3D 0 : 0))
=20
 /* Check for signed after promoting unsigned char/short to int */
 #define __is_ok_signed(x) is_signed_type(typeof((x) + 0))
@@ -53,12 +56,10 @@
 =09typeof(y) __y_##uniq =3D (y);=09=09\
 =09__cmp(op, __x_##uniq, __y_##uniq); })
=20
-#define __careful_cmp(op, x, y, uniq)=09=09=09=09\
-=09__builtin_choose_expr(__is_constexpr((x) - (y)),=09\
-=09=09__cmp(op, x, y),=09=09=09=09\
-=09=09({ _Static_assert(__types_ok(x, y),=09=09\
-=09=09=09#op "(" #x ", " #y ") signedness error, fix types or consider u" =
#op "() before " #op "_t()"); \
-=09=09__cmp_once(op, x, y, uniq); }))
+#define __careful_cmp(op, x, y, uniq) ({=09\
+=09_Static_assert(__types_ok(x, y),=09\
+=09=09#op "(" #x ", " #y ") signedness error, fix types or consider u" #op=
 "() before " #op "_t()"); \
+=09__cmp_once(op, x, y, uniq); })
=20
 #define __careful_cmp_const(op, x, y)=09=09=09=09\
 =09(BUILD_BUG_ON_ZERO(!__is_constexpr((x) - (y))) +=09\
--=20
2.17.1

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

