Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2269E825A
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 22:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6A810E309;
	Sat,  7 Dec 2024 21:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACCD10E309
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2024 21:46:41 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-156-VaJ9he1jMMiHiJPvF4Kadg-1; Sat, 07 Dec 2024 21:46:38 +0000
X-MC-Unique: VaJ9he1jMMiHiJPvF4Kadg-1
X-Mimecast-MFC-AGG-ID: VaJ9he1jMMiHiJPvF4Kadg
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sat, 7 Dec
 2024 21:45:47 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sat, 7 Dec 2024 21:45:47 +0000
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
Thread-Index: AQHbSOF0JXcuwP9wN0+yRzIQ2cx/pbLbOmbggAALfgCAAAJWwA==
Date: Sat, 7 Dec 2024 21:45:47 +0000
Message-ID: <c3d21364d9ad43279352dc4d7348c97d@AcuMS.aculab.com>
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
 <20362fe79d494bd59471a9c0f002b2ef@AcuMS.aculab.com>
 <63f538fceadf4e2ba93cdcaae9fab266e5a000ac.camel@gwdg.de>
In-Reply-To: <63f538fceadf4e2ba93cdcaae9fab266e5a000ac.camel@gwdg.de>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: or4jwQNNHL0sUJRDuFmISqiVj88smJOtA8UwZsaBvgk_1733607997
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

RnJvbTogTWFydGluIFVlY2tlcg0KPiBTZW50OiAwNyBEZWNlbWJlciAyMDI0IDIxOjA2DQo+IA0K
PiBBbSBTYW1zdGFnLCBkZW0gMDcuMTIuMjAyNCB1bSAyMTowMCArMDAwMCBzY2hyaWViIERhdmlk
IExhaWdodDoNCj4gPiBGcm9tOiBNYXJ0aW4gVWVja2VyDQo+ID4gPiBTZW50OiAwNyBEZWNlbWJl
ciAyMDI0IDE5OjUyDQo+IC4uLg0KPiANCj4gPg0KPiA+ID4gVGhlcmUgZXhpc3QgcHJvcG9zYWxz
IGFsb25nIHRob3NlIGxpbmVzIGZvciBDMlkuDQo+ID4gPg0KPiA+ID4gRnJvbSBhIG1vcmUgbmVh
ci10ZXJtIHNvbHV0aW9uLCBJIHdvbmRlciBpZiBtYWtpbmcgaXQgcG9zc2libGUgKG9yDQo+ID4g
PiBlYXNpZXIpIHRvIHJldHVybiBpbnRlZ2VyIGNvbnN0YW50IGV4cHJlc3Npb25zIGZyb20gc3Rh
dGVtZW50DQo+ID4gPiBleHByZXNzaW9ucyBhbmQgYWxsb3dpbmcgYSByZXN0cmljdGVkIGZvcm0g
b2Ygc3RhdGVtZW50IGV4cHJlc3Npb25zDQo+ID4gPiBhdCBmaWxlIHNjb3BlIHdvdWxkIGhlbHA/
DQo+ID4NCj4gPiBJdCB3b3VsZCBoZWxwIGEgbG90IGlmIGEgI2RlZmluZSB0aGF0IGp1c3QgdXNl
ZCBsb2NhbCB2YXJpYWJsZXMNCj4gPiB0byBhdm9pZCBhcmd1bWVudHMgYmVpbmcgcmUtZXhwYW5k
ZWQgYW5kIGZvciBDU0UgY291bGQgc3RpbGwNCj4gPiBnZW5lcmF0ZSBhIGNvbnN0YW50IHZhbHVl
Lg0KPiA+IERvZXMgbmVlZCB0byBiZSBhICNkZWZpbmUgLSB0byBnZXQgdG9rZW4gcGFzdGluZyBh
bmQgJ3N0cmluZ2lmeScuDQo+ID4gQWx0aG91Z2ggeW91IHdvdWxkIG5lZWQgc29tZXRoaW5nIGZv
ciByZXBvcnRpbmcgZGV0ZWN0ZWQgZXJyb3JzLA0KPiA+IGFuZCBidWlsdGluIGNvbXBpbGVyIHN1
cHBvcnQgZm9yIGNvbnN0X3RydWUoKSBmb3IgdGhlIGRldGVjdGlvbg0KPiA+IGl0c2VsZi4NCj4g
DQo+IFdlIGFyZSBzdXBlciBjbG9zZToNCj4gDQo+IGh0dHBzOi8vZ29kYm9sdC5vcmcvei9UYXJx
ODliaGENCg0KKFRoZSBwcmVwcm9jZXNzIG91dHB1dCBpcyBhYm91dCA1MDAgYnl0ZXMgZm9yIGVh
Y2ggbGluZS4pDQoNCj4gKGlmIHdlIGlnbm9yZSB0aGUgZ3JvdGVzcXVlIGhhY2tzIHRvIGdldCB0
aGVyZSwgYnV0IHRoaXMgd291bGQgZ28NCj4gYXdheSBpZiB0aGUgY29tcGlsZXIgZG9lcyBpdCBp
bnRlcm5hbGx5KQ0KDQpTb21lIG9mIHRob3NlIGhhY2tzIGxvb2sgZXhjZXNzaXZlLg0KSXNuJ3Qg
SUZfQ09OU1QoeCwgeSwgeikganVzdA0KCV9HZW5lcmljKDAgPyAodm9pZCAqKSgoeCkgPyAwTCA6
IDBMKSA6IChjaGFyICopMCwgY2hhciAqOiB5LCB2b2lkICo6IHopDQphbmQgdGhhdCBnZXRzIHJp
ZCBzb21lIG9mIHRoZSBncm9zc25lc3MuDQpKdXN0IGhhdmluZyB0aGF0IGFzIGEgYnVpbHRpbiB3
b3VsZCBzaW1wbGlmeSBzb21lIHRoaW5ncy4NCkFsdGhvdWdoIHlvdSBjb3VsZCB1c2U6DQoJX19i
dWlsdGluX2Nob29zZV9leHByKElTX0NPTlNUKHgpLCB5LCB6KQ0KaWYgeW91IG5lZWQgeSBhbmQg
eiB0byBoYXZlIGRpZmZlcmVudCB0eXBlcywgYW5kIGp1c3Q6DQoJSVNfQ09OU1QoeCkgPyB5IDog
eg0Kb3RoZXJ3aXNlLg0KU2luY2UgQUZBSUNUIHRoZXkgYXJlIG90aGVyd2lzZSBlcXVpdmFsZW50
Lg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJv
YWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24g
Tm86IDEzOTczODYgKFdhbGVzKQ0K

