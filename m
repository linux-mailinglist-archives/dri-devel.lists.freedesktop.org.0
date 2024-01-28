Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B269883F970
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 20:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EAB510E7CB;
	Sun, 28 Jan 2024 19:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8E710E68D
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 19:34:07 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-20-3y7XOynoO5CZtz2J7xeVDg-1; Sun, 28 Jan 2024 19:33:00 +0000
X-MC-Unique: 3y7XOynoO5CZtz2J7xeVDg-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 28 Jan
 2024 19:32:36 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 28 Jan 2024 19:32:36 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>, "'Linus
 Torvalds'" <torvalds@linux-foundation.org>, 'Netdev'
 <netdev@vger.kernel.org>, "'dri-devel@lists.freedesktop.org'"
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH next 08/11 minmax: Add min_const() and max_const()
Thread-Topic: [PATCH next 08/11 minmax: Add min_const() and max_const()
Thread-Index: AdpSIMoE/wNceAjoSdeU09EW7XnMUA==
Date: Sun, 28 Jan 2024 19:32:36 +0000
Message-ID: <489d199159794ebcbd3d18d4082a88d7@AcuMS.aculab.com>
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

The expansions of min() and max() contain statement expressions so are
not valid for static intialisers.
min_const() and max_const() are expressions so can be used for static
initialisers.
The arguments are checked for being constant and for negative signed
values being converted to large unsigned values.

Using these to size on-stack arrays lets min/max be simplified.
Zero is added before the compare to convert enum values to integers
avoinding the need for casts when enums have been used for constants.

Signed-off-by: David Laight <david.laight@aculab.com>
---
 include/linux/minmax.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/minmax.h b/include/linux/minmax.h
index 278a390b8a4c..c08916588425 100644
--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -60,19 +60,34 @@
 =09=09=09#op "(" #x ", " #y ") signedness error, fix types or consider u" =
#op "() before " #op "_t()"); \
 =09=09__cmp_once(op, x, y, uniq); }))
=20
+#define __careful_cmp_const(op, x, y)=09=09=09=09\
+=09(BUILD_BUG_ON_ZERO(!__is_constexpr((x) - (y))) +=09\
+=09=09BUILD_BUG_ON_ZERO(!__types_ok(x, y)) +=09=09\
+=09=09__cmp(op, (x) + 0, (y) + 0))
+
 /**
  * min - return minimum of two values of the same or compatible types
  * @x: first value
  * @y: second value
+ *
+ * If @x and @y are constants the return value is constant, but not 'const=
ant
+ * enough' for things like static initialisers.
+ * min_const(@x, @y) is a constant expression for constant inputs.
  */
 #define min(x, y)=09__careful_cmp(min, x, y, __COUNTER__)
+#define min_const(x, y)=09__careful_cmp_const(min, x, y)
=20
 /**
  * max - return maximum of two values of the same or compatible types
  * @x: first value
  * @y: second value
+ *
+ * If @x and @y are constants the return value is constant, but not 'const=
ant
+ * enough' for things like static initialisers.
+ * max_const(@x, @y) is a constant expression for constant inputs.
  */
 #define max(x, y)=09__careful_cmp(max, x, y, __COUNTER__)
+#define max_const(x, y)=09__careful_cmp_const(max, x, y)
=20
 /**
  * umin - return minimum of two non-negative values
--=20
2.17.1

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

