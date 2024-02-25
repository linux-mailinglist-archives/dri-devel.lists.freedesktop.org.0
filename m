Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A82862D0F
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 22:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67A110E15D;
	Sun, 25 Feb 2024 21:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F9710E15D
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 21:09:34 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-25-AJDdc1O7Pimm9mrvmQ8LqA-1; Sun, 25 Feb 2024 21:09:30 +0000
X-MC-Unique: AJDdc1O7Pimm9mrvmQ8LqA-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 25 Feb
 2024 21:09:29 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 25 Feb 2024 21:09:29 +0000
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
Thread-Index: AdpoCy246SYrYUdtTu+AtQRSWe90RAAAtXgAAAgCCqA=
Date: Sun, 25 Feb 2024 21:09:29 +0000
Message-ID: <056cfcf737e344acb47d612f642d58b3@AcuMS.aculab.com>
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

RnJvbTogTGludXMgVG9ydmFsZHMNCj4gU2VudDogMjUgRmVicnVhcnkgMjAyNCAxNzoxNA0KPiAN
Cj4gT24gU3VuLCAyNSBGZWIgMjAyNCBhdCAwODo1MywgRGF2aWQgTGFpZ2h0IDxEYXZpZC5MYWln
aHRAYWN1bGFiLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBUaGUgZXhwYW5zaW9ucyBvZiBtaW4oKSBh
bmQgbWF4KCkgY29udGFpbiBzdGF0ZW1lbnQgZXhwcmVzc2lvbnMgc28gYXJlDQo+ID4gbm90IHZh
bGlkIGZvciBzdGF0aWMgaW50aWFsaXNlcnMuDQo+ID4gbWluX2NvbnN0KCkgYW5kIG1heF9jb25z
dCgpIGFyZSBleHByZXNzaW9ucyBzbyBjYW4gYmUgdXNlZCBmb3Igc3RhdGljDQo+ID4gaW5pdGlh
bGlzZXJzLg0KPiANCj4gSSBoYXRlIHRoZSBuYW1lLg0KDQpQaWNraW5nIG5hbWUgaXMgYWx3YXlz
IGhhcmQuLi4NCg0KPiBOYW1pbmcgc2hvdWxkbid0IGJlIGFib3V0IGFuIGltcGxlbWVudGF0aW9u
IGRldGFpbCwgcGFydGljdWxhcmx5IG5vdA0KPiBhbiBlc290ZXJpYyBvbmUgbGlrZSB0aGUgIkMg
Y29uc3RhbnQgZXhwcmVzc2lvbiIgcnVsZS4gVGhhdCBjYW4gYmUNCj4gdXNlZnVsIGZvciBzb21l
IGludGVybmFsIGhlbHBlciBmdW5jdGlvbnMgb3IgbWFjcm9zLCBidXQgbm90IGZvcg0KPiBzb21l
dGhpbmcgdGhhdCByYW5kb20gcGVvcGxlIGFyZSBzdXBwb3NlZCB0byBVU0UuDQo+IA0KPiBUZWxs
aW5nIHNvbWUgcmFuZG9tIGRldmVsb3BlciB0aGF0IGluc2lkZSBhbiBhcnJheSBzaXplIGRlY2xh
cmF0aW9uIG9yDQo+IGEgc3RhdGljIGluaXRpYWxpemVyIHlvdSBuZWVkIHRvIHVzZSAibWF4X2Nv
bnN0KCkiIGJlY2F1c2UgaXQgbmVlZHMgdG8NCj4gc3ludGFjdGljYWxseSBiZSBhIGNvbnN0YW50
IGV4cHJlc3Npb24sIGFuZCBvdXIgcmVndWxhciAibWF4KCkiDQo+IGZ1bmN0aW9uIGlzbid0IHRo
YXQsIGlzIGp1c3QgKmhvcnJpZCouDQo+IA0KPiBObywgcGxlYXNlIGp1c3QgdXNlIHRoZSB0cmFk
aXRpb25hbCBDIG1vZGVsIG9mIGp1c3QgdXNpbmcgQUxMIENBUFMgZm9yDQo+IG1hY3JvIG5hbWVz
IHRoYXQgZG9uJ3QgYWN0IGxpa2UgYSBmdW5jdGlvbi4NCj4gDQo+IFllcywgeWVzLCB0aGF0IG1h
eSBlbmQgdXAgcmVxdWlyaW5nIGdldHRpbmcgcmlkIG9mIHNvbWUgY3VycmVudCB1c2VycyBvZg0K
PiANCj4gICAjZGVmaW5lIE1JTihhLGIpICgoYSk8KGIpID8gKGEpOihiKSkNCj4gDQo+IGJ1dCBk
YW1taXQsIHdlIGRvbid0IGFjdHVhbGx5IGhhdmUgX3RoYXRfIG1hbnkgb2YgdGhlbSwgYW5kIHdo
eSBzaG91bGQNCj4gd2UgaGF2ZSByYW5kb20gZHJpdmVycyBkb2luZyB0aGF0IGFueXdheT8NCg0K
SSdsbCBoYXZlIGEgbG9vayBhdCB3aGF0IGlzIHRoZXJlLg0KSXQgbWlnaHQgdGFrZSBhIHRocmVl
IHBhcnQgcGF0Y2ggdGhvdWdoLg0KVW5sZXNzIHlvdSBhcHBseSBpdCBhcyBhIHRyZWUtd2lkZSBw
YXRjaD8NCg0KT25lIG9wdGlvbiBpcyB0byBhZGQgYXMgbWF4X2NvbnN0KCksIHRoZW4gY2hhbmdl
IGFueSBleGlzdGluZyBNQVgoKQ0KdG8gYmUgbWF4KCkgb3IgbWF4X2NvbnN0KCkgYW5kIHRoZW4g
ZmluYWxseSByZW5hbWUgdG8gTUFYKCk/DQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJl
c3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsx
IDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=

