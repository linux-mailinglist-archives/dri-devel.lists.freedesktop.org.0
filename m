Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D028983F972
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 20:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45C610E62F;
	Sun, 28 Jan 2024 19:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 355 seconds by postgrey-1.36 at gabe;
 Sun, 28 Jan 2024 19:34:02 UTC
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA4410E62F
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 19:34:01 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-287-Kf3GQTitP5eD8y4OkzSb6A-1; Sun, 28 Jan 2024 19:26:38 +0000
X-MC-Unique: Kf3GQTitP5eD8y4OkzSb6A-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 28 Jan
 2024 19:26:13 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 28 Jan 2024 19:26:13 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>, "'Linus
 Torvalds'" <torvalds@linux-foundation.org>, 'Netdev'
 <netdev@vger.kernel.org>, "'dri-devel@lists.freedesktop.org'"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH next 01/11] minmax: Put all the clamp() definitions
 together
Thread-Topic: [PATCH next 01/11] minmax: Put all the clamp() definitions
 together
Thread-Index: AdpSH+hhFr878/ZhQb67LXPpPhAHFg==
Date: Sun, 28 Jan 2024 19:26:12 +0000
Message-ID: <10148287b1ee41df80d8240afbcc54be@AcuMS.aculab.com>
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

The defines for clamp() have got separated, move togther for readability.
Update description of signedness check.

Signed-off-by: David Laight <david.laight@aculab.com>
---
 include/linux/minmax.h | 120 +++++++++++++++++++----------------------
 1 file changed, 56 insertions(+), 64 deletions(-)

diff --git a/include/linux/minmax.h b/include/linux/minmax.h
index 2ec559284a9f..63c45865b48a 100644
--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -57,26 +57,6 @@
 =09=09__cmp(op, x, y),=09=09=09=09\
 =09=09__cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
=20
-#define __clamp(val, lo, hi)=09\
-=09((val) >=3D (hi) ? (hi) : ((val) <=3D (lo) ? (lo) : (val)))
-
-#define __clamp_once(val, lo, hi, unique_val, unique_lo, unique_hi) ({=09=
=09\
-=09typeof(val) unique_val =3D (val);=09=09=09=09=09=09\
-=09typeof(lo) unique_lo =3D (lo);=09=09=09=09=09=09\
-=09typeof(hi) unique_hi =3D (hi);=09=09=09=09=09=09\
-=09static_assert(__builtin_choose_expr(__is_constexpr((lo) > (hi)), =09\
-=09=09=09(lo) <=3D (hi), true),=09=09=09=09=09\
-=09=09"clamp() low limit " #lo " greater than high limit " #hi);=09\
-=09static_assert(__types_ok(val, lo), "clamp() 'lo' signedness error");=09=
\
-=09static_assert(__types_ok(val, hi), "clamp() 'hi' signedness error");=09=
\
-=09__clamp(unique_val, unique_lo, unique_hi); })
-
-#define __careful_clamp(val, lo, hi) ({=09=09=09=09=09\
-=09__builtin_choose_expr(__is_constexpr((val) - (lo) + (hi)),=09\
-=09=09__clamp(val, lo, hi),=09=09=09=09=09\
-=09=09__clamp_once(val, lo, hi, __UNIQUE_ID(__val),=09=09\
-=09=09=09     __UNIQUE_ID(__lo), __UNIQUE_ID(__hi))); })
-
 /**
  * min - return minimum of two values of the same or compatible types
  * @x: first value
@@ -124,6 +104,22 @@
  */
 #define max3(x, y, z) max((typeof(x))max(x, y), z)
=20
+/**
+ * min_t - return minimum of two values, using the specified type
+ * @type: data type to use
+ * @x: first value
+ * @y: second value
+ */
+#define min_t(type, x, y)=09__careful_cmp(min, (type)(x), (type)(y))
+
+/**
+ * max_t - return maximum of two values, using the specified type
+ * @type: data type to use
+ * @x: first value
+ * @y: second value
+ */
+#define max_t(type, x, y)=09__careful_cmp(max, (type)(x), (type)(y))
+
 /**
  * min_not_zero - return the minimum that is _not_ zero, unless both are z=
ero
  * @x: value1
@@ -134,39 +130,60 @@
 =09typeof(y) __y =3D (y);=09=09=09\
 =09__x =3D=3D 0 ? __y : ((__y =3D=3D 0) ? __x : min(__x, __y)); })
=20
+#define __clamp(val, lo, hi)=09\
+=09((val) >=3D (hi) ? (hi) : ((val) <=3D (lo) ? (lo) : (val)))
+
+#define __clamp_once(val, lo, hi, unique_val, unique_lo, unique_hi) ({=09=
=09\
+=09typeof(val) unique_val =3D (val);=09=09=09=09=09=09\
+=09typeof(lo) unique_lo =3D (lo);=09=09=09=09=09=09\
+=09typeof(hi) unique_hi =3D (hi);=09=09=09=09=09=09\
+=09static_assert(__builtin_choose_expr(__is_constexpr((lo) > (hi)),=09\
+=09=09=09(lo) <=3D (hi), true),=09=09=09=09=09\
+=09=09"clamp() low limit " #lo " greater than high limit " #hi);=09\
+=09static_assert(__types_ok(val, lo), "clamp() 'lo' signedness error");=09=
\
+=09static_assert(__types_ok(val, hi), "clamp() 'hi' signedness error");=09=
\
+=09__clamp(unique_val, unique_lo, unique_hi); })
+
+#define __careful_clamp(val, lo, hi) ({=09=09=09=09=09\
+=09__builtin_choose_expr(__is_constexpr((val) - (lo) + (hi)),=09\
+=09=09__clamp(val, lo, hi),=09=09=09=09=09\
+=09=09__clamp_once(val, lo, hi, __UNIQUE_ID(__val),=09=09\
+=09=09=09     __UNIQUE_ID(__lo), __UNIQUE_ID(__hi))); })
+
 /**
  * clamp - return a value clamped to a given range with strict typecheckin=
g
  * @val: current value
  * @lo: lowest allowable value
  * @hi: highest allowable value
  *
- * This macro does strict typechecking of @lo/@hi to make sure they are of=
 the
- * same type as @val.  See the unnecessary pointer comparisons.
+ * This macro checks that @val, @lo and @hi have the same signedness.
  */
 #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
=20
-/*
- * ..and if you can't take the strict
- * types, you can specify one yourself.
- *
- * Or not use min/max/clamp at all, of course.
- */
-
 /**
- * min_t - return minimum of two values, using the specified type
- * @type: data type to use
- * @x: first value
- * @y: second value
+ * clamp_t - return a value clamped to a given range using a given type
+ * @type: the type of variable to use
+ * @val: current value
+ * @lo: minimum allowable value
+ * @hi: maximum allowable value
+ *
+ * This macro does no typechecking and uses temporary variables of type
+ * @type to make all the comparisons.
  */
-#define min_t(type, x, y)=09__careful_cmp(min, (type)(x), (type)(y))
+#define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo)=
, (type)(hi))
=20
 /**
- * max_t - return maximum of two values, using the specified type
- * @type: data type to use
- * @x: first value
- * @y: second value
+ * clamp_val - return a value clamped to a given range using val's type
+ * @val: current value
+ * @lo: minimum allowable value
+ * @hi: maximum allowable value
+ *
+ * This macro does no typechecking and uses temporary variables of whateve=
r
+ * type the input argument @val is.  This is useful when @val is an unsign=
ed
+ * type and @lo and @hi are literals that will otherwise be assigned a sig=
ned
+ * integer type.
  */
-#define max_t(type, x, y)=09__careful_cmp(max, (type)(x), (type)(y))
+#define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
=20
 /*
  * Do not check the array parameter using __must_be_array().
@@ -211,31 +228,6 @@
  */
 #define max_array(array, len) __minmax_array(max, array, len)
=20
-/**
- * clamp_t - return a value clamped to a given range using a given type
- * @type: the type of variable to use
- * @val: current value
- * @lo: minimum allowable value
- * @hi: maximum allowable value
- *
- * This macro does no typechecking and uses temporary variables of type
- * @type to make all the comparisons.
- */
-#define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo)=
, (type)(hi))
-
-/**
- * clamp_val - return a value clamped to a given range using val's type
- * @val: current value
- * @lo: minimum allowable value
- * @hi: maximum allowable value
- *
- * This macro does no typechecking and uses temporary variables of whateve=
r
- * type the input argument @val is.  This is useful when @val is an unsign=
ed
- * type and @lo and @hi are literals that will otherwise be assigned a sig=
ned
- * integer type.
- */
-#define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
-
 static inline bool in_range64(u64 val, u64 start, u64 len)
 {
 =09return (val - start) < len;
--=20
2.17.1

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

