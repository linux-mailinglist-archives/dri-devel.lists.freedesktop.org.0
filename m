Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD49862D24
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 22:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6821210E3F4;
	Sun, 25 Feb 2024 21:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D85A10E3F4
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 21:26:36 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-274-tAV88Qm8MBmPtn9Zj4ylcQ-1; Sun, 25 Feb 2024 21:26:33 +0000
X-MC-Unique: tAV88Qm8MBmPtn9Zj4ylcQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 25 Feb
 2024 21:26:32 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 25 Feb 2024 21:26:32 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Linus Torvalds' <torvalds@linux-foundation.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Netdev
 <netdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Jens Axboe <axboe@kernel.dk>, "Matthew
 Wilcox (Oracle)" <willy@infradead.org>, Christoph Hellwig
 <hch@infradead.org>, "linux-btrfs@vger.kernel.org"
 <linux-btrfs@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "David S . Miller"
 <davem@davemloft.net>, Dan Carpenter <dan.carpenter@linaro.org>, Jani Nikula
 <jani.nikula@linux.intel.com>
Subject: RE: [PATCH next v2 08/11] minmax: Add min_const() and max_const()
Thread-Topic: [PATCH next v2 08/11] minmax: Add min_const() and max_const()
Thread-Index: AdpoCy246SYrYUdtTu+AtQRSWe90RAAAtXgAAAim0gA=
Date: Sun, 25 Feb 2024 21:26:31 +0000
Message-ID: <59ae7d89368a4dd5a8b8b3f7bc2ae957@AcuMS.aculab.com>
References: <0fff52305e584036a777f440b5f474da@AcuMS.aculab.com>
 <c6924533f157497b836bff24073934a6@AcuMS.aculab.com>
 <CAHk-=wgNh5Gw7RTuaRe7mvf3WrSGDRKzdA55KKdTzKt3xPCnLg@mail.gmail.com>
In-Reply-To: <CAHk-=wgNh5Gw7RTuaRe7mvf3WrSGDRKzdA55KKdTzKt3xPCnLg@mail.gmail.com>
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
Content-Transfer-Encoding: base64
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

Li4uDQo+IFllcywgeWVzLCB0aGF0IG1heSBlbmQgdXAgcmVxdWlyaW5nIGdldHRpbmcgcmlkIG9m
IHNvbWUgY3VycmVudCB1c2VycyBvZg0KPiANCj4gICAjZGVmaW5lIE1JTihhLGIpICgoYSk8KGIp
ID8gKGEpOihiKSkNCj4gDQo+IGJ1dCBkYW1taXQsIHdlIGRvbid0IGFjdHVhbGx5IGhhdmUgX3Ro
YXRfIG1hbnkgb2YgdGhlbSwgYW5kIHdoeSBzaG91bGQNCj4gd2UgaGF2ZSByYW5kb20gZHJpdmVy
cyBkb2luZyB0aGF0IGFueXdheT8NCg0KVGhleSBsb29rIGxpa2UgdGhleSBjb3VsZCBiZSBjaGFu
Z2VkIHRvIG1pbigpLg0KSXQgaXMgZXZlbiBsaWtlbHkgdGhlIGhlYWRlciBnZXRzIHB1bGxlZCBp
biBzb21ld2hlcmUuDQoNCkknbSBub3Qgc3VyZSBhYm91dCB0aGUgb25lcyBpbiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvKi4uKi8qLmMsIGJ1dCBpdA0Kd291bGRuJ3Qgc3VycHJpc2UgbWUg
aWYgdGhhdCBjb2RlIGRvZXNuJ3QgdXNlIGFueSBzdGFuZGFyZCBrZXJuZWwgaGVhZGVycy4NCklz
bid0IHRoYXQgYWxzbyB0aGUgY29kZSB0aGF0IG1hbmFnZXMgdG8gcGFzcyA0MiBpbnRlZ2VyIHBh
cmFtZXRlcnMNCnRvIGZ1bmN0aW9ucz8NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVz
cyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEg
MVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

