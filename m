Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9561F9E8227
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 22:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88C210E1D4;
	Sat,  7 Dec 2024 21:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D3F10E1D4
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2024 21:01:35 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-103-dzAXnY8wNQy5gutMXXWbiQ-1; Sat, 07 Dec 2024 21:01:32 +0000
X-MC-Unique: dzAXnY8wNQy5gutMXXWbiQ-1
X-Mimecast-MFC-AGG-ID: dzAXnY8wNQy5gutMXXWbiQ
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sat, 7 Dec
 2024 21:00:41 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sat, 7 Dec 2024 21:00:41 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Martin Uecker' <muecker@gwdg.de>, Linus Torvalds
 <torvalds@linux-foundation.org>, Vincent Mailhol <vincent.mailhol@gmail.com>
CC: "w@1wt.eu" <w@1wt.eu>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, James Clark
 <james.clark@linaro.org>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Rikard Falkeborn
 <rikard.falkeborn@gmail.com>, "linux-sparse@vger.kernel.org"
 <linux-sparse@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev"
 <llvm@lists.linux.dev>, "linux-hardening@vger.kernel.org"
 <linux-hardening@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "coresight@lists.linaro.org"
 <coresight@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
Thread-Topic: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
Thread-Index: AQHbSOF0JXcuwP9wN0+yRzIQ2cx/pbLbOmbg
Date: Sat, 7 Dec 2024 21:00:41 +0000
Message-ID: <20362fe79d494bd59471a9c0f002b2ef@AcuMS.aculab.com>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
 <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
 <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
 <d23fe8a5dbe84bfeb18097fdef7aa4c4@AcuMS.aculab.com>
 <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
 <0f5c07b827c3468c8fa3928a93a98bfa@AcuMS.aculab.com>
 <e806dd51b1ac4e289131297fbf30fc37@AcuMS.aculab.com>
 <CAMZ6RqLOR3aCRW_js2agV+VFiHdazb4S2+NdT5G4=WbDKNB8bA@mail.gmail.com>
 <b1ff4a65594a4d39b2e9b8b44770214e@AcuMS.aculab.com>
 <CAMZ6RqJFReLJTd-O8s02oQNeB0SPQh3C-Mg+Nif5vMB9gFtQww@mail.gmail.com>
 <CAHk-=wjpN4GWtnsWQ8XJvf=gBQ3UvBk512xK1S35=nGXA6yTiw@mail.gmail.com>
 <6b8c9b942ba6e85a3f1e4eef65a9916333502881.camel@gwdg.de>
In-Reply-To: <6b8c9b942ba6e85a3f1e4eef65a9916333502881.camel@gwdg.de>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zEHfpLc2a-c3kEaACdMxA_QmH3RAuO4adbNDcAHY0DA_1733605291
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

RnJvbTogTWFydGluIFVlY2tlcg0KPiBTZW50OiAwNyBEZWNlbWJlciAyMDI0IDE5OjUyDQouLi4N
Cj4gPiBPZiBjb3Vyc2UsIG9mdGVuIHRoZSBjb21waWxlciAqZG9lcyogaGF2ZSBoZWxwZXIgYnVp
bHRpbnMsIGJ1dCB3ZQ0KPiA+IGNhbid0IHVzZSB0aGVtLCBiZWNhdXNlIHRoZXkgYXJlbid0ICpx
dWl0ZSogdGhlIHJpZ2h0IHRoaW5nLiBMaWtlIHRoYXQNCj4gPiAiX19idWlsdGluX2NvbnN0YW50
X3AoKSIgbm90IGFjdHVhbGx5IHdvcmtpbmcgZm9yIHNvbWUgc2l0dWF0aW9ucw0KPiA+IHdoZXJl
IHdlIGFic29sdXRlbHkgbmVlZCBub3QganVzdCBhIGNvbnN0YW50IHZhbHVlLCBidXQgYSBjb25z
dGFudA0KPiA+IF9leHByZXNzaW9uXyBkdWUgdG8gQyBwYXJzaW5nIHJ1bGVzLg0KDQpJbiBtYW55
IGNhc2VzIHRoZSBDIGxhbmd1YWdlIHNheXMgJ2NvbnN0YW50IGludGVnZXIgZXhwcmVzc2lvbicN
CmJ1dCBpcyByZWFsaXR5IHNvbWV0aGluZyB0aGF0IHBhc3NlcyBfX2J1aWx0aW5fY29uc3RhbnRf
cCgpDQppcyBsaWtlbHkgdG8gYmUgZmluZSAtIGJlY2F1c2UgdGhlIGFjdHVhbCB2YWx1ZSBpc24n
dCBuZWVkZWQNCnVudGlsIGxhdGUgb24gaW4gdGhlIGNvbXBpbGF0aW9uLg0KDQouLi4NCj4gPiBJ
ZiB0aGVyZSBpcyBvbmUgZmVhdHVyZSBvZiBDIEkgd291bGQgaGF2ZSBsaWtlZCBpdCBpcyAiYWxs
b3cgaW5saW5lDQo+ID4gZnVuY3Rpb25zIGFuZCBzdGF0ZW1lbnQgZXhwcmVzc2lvbnMgd2l0aCBj
b25zdGFudCBhcmd1bWVudHMgYXMNCj4gPiBjb25zdGFudCBleHByZXNzaW9ucyIuIE90aGVyIGxh
bmd1YWdlcyBoYXZlIGRvbmUgdGhhdCwgYW5kIGl0IHJlYWxseQ0KPiA+IGRvZXMgaGVscC4gQW5k
IHllcywgaXQgbWVhbnMgdGhhdCB5b3UgaGF2ZSB0byBiYXNpY2FsbHkgaGF2ZSBhDQo+ID4gbGFu
Z3VhZ2UgaW50ZXJwcmV0ZXIgaW4gdGhlIGNvbXBpbGVyICh5b3UgZG8gd2FudCB0byBhbGxvdyBs
b29wDQo+ID4gY29uc3RydWN0aW9ucyBldGMpLCBidXQgaXQgcmVhbGx5IGlzIHZlcnkgdXNlZnVs
Lg0KDQpJdCB0aGUgb3V0cHV0IG5lZWRzIHRvIGJlIGEgY29uc3RhbnQgdGhlIGxvb3Agd291bGQg
aGF2ZSB0byBiZSB1bnJvbGxhYmxlLg0KSW4gdGhvc2UgY2FzZXMgdGhlIHJlc3VsdCB3aWxsIGJl
ICdjb25zdGFudCBlbm91Z2gnIGZvciBfX2J1aWx0aW5fY29uc3RhbnRfcCgpDQphbmQgdGhlIGNv
bXBpbGVyIGlzIGFjdHVhbGx5IGFscmVhZHkgY2FwYWJsZSBkb2luZyBpdC4NCg0KLi4uDQo+ID4g
QXQgb25lIHBvaW50IEkgbGl0ZXJhbGx5IHdhcyB0aGlua2luZyBJJ2QgZG8gJ3NwYXJzZScgYXMg
YQ0KPiA+IHByZS1wcm9jZXNzb3IgZm9yIGtlcm5lbCBjb2RlLCBpbiBvcmRlciB0byBoYXZlIGV4
dGVuZGVkIGxhbmd1YWdlDQo+ID4gZmFjaWxpdGllcyBsaWtlIHRoYXQuDQoNCllvdSBjb3VsZCB1
c2UgbTQgOi0pIGFuZCBtYWtlIGl0IGVudGlyZWx5IHVucmVhZGFibGUuDQoNCj4gVGhlcmUgZXhp
c3QgcHJvcG9zYWxzIGFsb25nIHRob3NlIGxpbmVzIGZvciBDMlkuDQo+IA0KPiBGcm9tIGEgbW9y
ZSBuZWFyLXRlcm0gc29sdXRpb24sIEkgd29uZGVyIGlmIG1ha2luZyBpdCBwb3NzaWJsZSAob3IN
Cj4gZWFzaWVyKSB0byByZXR1cm4gaW50ZWdlciBjb25zdGFudCBleHByZXNzaW9ucyBmcm9tIHN0
YXRlbWVudA0KPiBleHByZXNzaW9ucyBhbmQgYWxsb3dpbmcgYSByZXN0cmljdGVkIGZvcm0gb2Yg
c3RhdGVtZW50IGV4cHJlc3Npb25zDQo+IGF0IGZpbGUgc2NvcGUgd291bGQgaGVscD8NCg0KSXQg
d291bGQgaGVscCBhIGxvdCBpZiBhICNkZWZpbmUgdGhhdCBqdXN0IHVzZWQgbG9jYWwgdmFyaWFi
bGVzDQp0byBhdm9pZCBhcmd1bWVudHMgYmVpbmcgcmUtZXhwYW5kZWQgYW5kIGZvciBDU0UgY291
bGQgc3RpbGwNCmdlbmVyYXRlIGEgY29uc3RhbnQgdmFsdWUuDQpEb2VzIG5lZWQgdG8gYmUgYSAj
ZGVmaW5lIC0gdG8gZ2V0IHRva2VuIHBhc3RpbmcgYW5kICdzdHJpbmdpZnknLg0KQWx0aG91Z2gg
eW91IHdvdWxkIG5lZWQgc29tZXRoaW5nIGZvciByZXBvcnRpbmcgZGV0ZWN0ZWQgZXJyb3JzLA0K
YW5kIGJ1aWx0aW4gY29tcGlsZXIgc3VwcG9ydCBmb3IgY29uc3RfdHJ1ZSgpIGZvciB0aGUgZGV0
ZWN0aW9uDQppdHNlbGYuDQoNCg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExh
a2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQs
IFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

