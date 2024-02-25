Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B3B862C17
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 17:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81CC10E138;
	Sun, 25 Feb 2024 16:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474A810E138
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 16:56:20 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-258-4eUIVhTQPOq-JwK6Hr19cA-1; Sun, 25 Feb 2024 16:56:17 +0000
X-MC-Unique: 4eUIVhTQPOq-JwK6Hr19cA-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 25 Feb
 2024 16:56:16 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 25 Feb 2024 16:56:16 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>, "'Linus
 Torvalds'" <torvalds@linux-foundation.org>, 'Netdev'
 <netdev@vger.kernel.org>, "'dri-devel@lists.freedesktop.org'"
 <dri-devel@lists.freedesktop.org>
CC: 'Jens Axboe' <axboe@kernel.dk>, "'Matthew Wilcox (Oracle)'"
 <willy@infradead.org>, 'Christoph Hellwig' <hch@infradead.org>,
 "'linux-btrfs@vger.kernel.org'" <linux-btrfs@vger.kernel.org>, "'Andrew
 Morton'" <akpm@linux-foundation.org>, 'Andy Shevchenko'
 <andriy.shevchenko@linux.intel.com>, "'David S . Miller'"
 <davem@davemloft.net>, 'Dan Carpenter' <dan.carpenter@linaro.org>, "'Jani
 Nikula'" <jani.nikula@linux.intel.com>
Subject: [PATCH next v2 10/11] block: Use a boolean expression instead of
 max() on booleans
Thread-Topic: [PATCH next v2 10/11] block: Use a boolean expression instead of
 max() on booleans
Thread-Index: AdpoC3sh/004JKwJQQKikvnz7Zkpuw==
Date: Sun, 25 Feb 2024 16:56:16 +0000
Message-ID: <9561641946f1404b931d97a576bfbb28@AcuMS.aculab.com>
References: <0fff52305e584036a777f440b5f474da@AcuMS.aculab.com>
In-Reply-To: <0fff52305e584036a777f440b5f474da@AcuMS.aculab.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

blk_stack_limits() contains:
=09t->zoned =3D max(t->zoned, b->zoned);
These are bool, so can be replaced by bitwise or.
However it generates:
error: comparison of constant '0' with boolean expression is always true [-=
Werror=3Dbool-compare]
inside the signedness check that max() does unless a '+ 0' is added.
It is a shame the compiler generates this warning for code that will
be optimised away.

Change so that the extra '+ 0' can be removed.

Signed-off-by: David Laight <david.laight@aculab.com>
---
 block/blk-settings.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Changes for v2:
- Typographical and spelling corrections to the commit messages.
  Patches unchanged.

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 06ea91e51b8b..9ca21fea039d 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -688,7 +688,7 @@ int blk_stack_limits(struct queue_limits *t, struct que=
ue_limits *b,
 =09=09=09=09=09=09   b->max_secure_erase_sectors);
 =09t->zone_write_granularity =3D max(t->zone_write_granularity,
 =09=09=09=09=09b->zone_write_granularity);
-=09t->zoned =3D max(t->zoned, b->zoned);
+=09t->zoned =3D t->zoned | b->zoned;
 =09return ret;
 }
 EXPORT_SYMBOL(blk_stack_limits);
--=20
2.17.1

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

