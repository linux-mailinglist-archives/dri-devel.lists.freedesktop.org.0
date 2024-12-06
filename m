Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7329E79FB
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 21:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5D110F1AF;
	Fri,  6 Dec 2024 20:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44D710F1AF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 20:24:49 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-17-T5q5JrNWPoSE2npJYwkYcg-1; Fri, 06 Dec 2024 20:24:46 +0000
X-MC-Unique: T5q5JrNWPoSE2npJYwkYcg-1
X-Mimecast-MFC-AGG-ID: T5q5JrNWPoSE2npJYwkYcg
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 6 Dec
 2024 20:23:59 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 6 Dec 2024 20:23:59 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Linus Torvalds' <torvalds@linux-foundation.org>
CC: 'Vincent Mailhol' <vincent.mailhol@gmail.com>, 'Luc Van Oostenryck'
 <luc.vanoostenryck@gmail.com>, 'Nathan Chancellor' <nathan@kernel.org>,
 "'Nick Desaulniers'" <ndesaulniers@google.com>, 'Bill Wendling'
 <morbo@google.com>, 'Justin Stitt' <justinstitt@google.com>, 'Yury Norov'
 <yury.norov@gmail.com>, 'Rasmus Villemoes' <linux@rasmusvillemoes.dk>, 'Kees
 Cook' <kees@kernel.org>, "'Gustavo A. R. Silva'" <gustavoars@kernel.org>,
 'Jani Nikula' <jani.nikula@linux.intel.com>, 'Joonas Lahtinen'
 <joonas.lahtinen@linux.intel.com>, 'Rodrigo Vivi' <rodrigo.vivi@intel.com>,
 'Tvrtko Ursulin' <tursulin@ursulin.net>, 'David Airlie' <airlied@gmail.com>,
 'Simona Vetter' <simona@ffwll.ch>, 'Suzuki K Poulose'
 <suzuki.poulose@arm.com>, 'Mike Leach' <mike.leach@linaro.org>, 'James Clark'
 <james.clark@linaro.org>, 'Alexander Shishkin'
 <alexander.shishkin@linux.intel.com>, 'Rikard Falkeborn'
 <rikard.falkeborn@gmail.com>, "'linux-sparse@vger.kernel.org'"
 <linux-sparse@vger.kernel.org>, "'linux-kernel@vger.kernel.org'"
 <linux-kernel@vger.kernel.org>, "'llvm@lists.linux.dev'"
 <llvm@lists.linux.dev>, "'linux-hardening@vger.kernel.org'"
 <linux-hardening@vger.kernel.org>, "'intel-gfx@lists.freedesktop.org'"
 <intel-gfx@lists.freedesktop.org>, "'dri-devel@lists.freedesktop.org'"
 <dri-devel@lists.freedesktop.org>, "'coresight@lists.linaro.org'"
 <coresight@lists.linaro.org>, "'linux-arm-kernel@lists.infradead.org'"
 <linux-arm-kernel@lists.infradead.org>, "'uecker@tugraz.at'"
 <uecker@tugraz.at>
Subject: RE: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
Thread-Topic: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
Thread-Index: AQHbROFPJXcuwP9wN0+yRzIQ2cx/pbLWa+gggAFf14CAACMqUIABpzoGgAAClHCAAAPoAIAAAwjggAANnsA=
Date: Fri, 6 Dec 2024 20:23:59 +0000
Message-ID: <e806dd51b1ac4e289131297fbf30fc37@AcuMS.aculab.com>
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
In-Reply-To: <0f5c07b827c3468c8fa3928a93a98bfa@AcuMS.aculab.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: odQrul3Z01DTjiP3xLeH1Hjcz0YUBrH0AnsMr_YQHZo_1733516685
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

Li4uDQo+ID4gPiAjZGVmaW5lIGNvbnN0X05VTEwoeCkgX0dlbmVyaWMoMCA/ICh4KSA6IChjaGFy
ICopMCwgY2hhciAqOiAxLCB2b2lkICo6IDApDQo+ID4gPiAjZGVmaW5lIGNvbnN0X3RydWUoeCkg
Y29uc3RfTlVMTCgoeCkgPyBOVUxMIDogKHZvaWQgKikxTCkpDQo+ID4gPiAjZGVmaW5lIGNvbnN0
X2V4cHIoeCkgY29uc3RfTlVMTCgoeCkgPyBOVUxMIDogTlVMTCkpDQo+ID4gPiBJIHNlbmQgdGhp
cyBtb3JuaW5nLg0KPiA+ID4gTmVlZHMgJ3MvY2hhci9zdHJ1Y3Qga2pramtqa2p1aS8nIGFwcGxp
ZWQuDQo+ID4NCj4gPiBPaCBDaHJpc3QuIFlvdSByZWFsbHkgYXJlIHRha2luZyB0aGlzIHdob2xl
IHVnbHkgdG8gYW5vdGhlciBsZXZlbC4NCj4gDQo+IEkgc29ydCBvZiBsaWtlZCB0aGF0IHZlcnNp
b24gaW4gYSBwZXJ2ZXJzZSBzb3J0IG9mIHdheS4NCj4gSXQgZG9lcyBnaXZlIHlvdSBhIHNpbXBs
ZSB0ZXN0IGZvciBOVUxMICh1bmxlc3MgeW91J3ZlIHVzZWQgJ3N0cnVjdCBramtqa2pranVpJyku
DQoNCkV4Y2VwdCBjb25zdF9OVUxMKCkgcmVhbGx5IGRvZXNuJ3Qgd29yayBhdCBhbGwgLSBzbyB5
b3UgYXJlIGx1Y2t5IDotKQ0KDQpTbyBtYXliZSB0aGUgc2xpZ2h0bHkgbG9uZyBsaW5lczoNCiNk
ZWZpbmUgY29uc3RfdHJ1ZSh4KSBfR2VuZXJpYygwID8gKHZvaWQgKikoKHgpICsgMCA/IDBMIDog
MUwpIDogKGNoYXIgKikwLCBjaGFyICo6IDEsIHZvaWQgKjogMCkNCiNkZWZpbmUgY29uc3RfZXhw
cih4KSBfR2VuZXJpYygwID8gKHZvaWQgKikoKHgpICsgMCA/IDBMIDogMEwpIDogKGNoYXIgKikw
LCBjaGFyICo6IDEsIHZvaWQgKjogMCkNCg0KSSBtYWtlIHRoYXQgOTggY2hhcmFjdGVycy4NCk9m
IGNvdXJzZSwgeW91IGNhbiByZW1vdmUgYWxsIHRoZSBzcGFjZXMsIG9ubHkgb25lIG9mIHRoZSBj
b25zdGFudHMgbmVlZCB0aGUgTCBzdWZmaXgNCmFuZCAnaW50JyBpcyBhIHNob3J0ZXIgdHlwZSBu
YW1lLg0KVGhhdCBjdXRzIGlzIGRvd24gdG8gNzY6DQojZGVmaW5lIGNvbnN0X2V4cHIoeCkgX0dl
bmVyaWMoMD8odm9pZCopKCh4KSswPzBMOjApOihpbnQqKTAsaW50KjoxLHZvaWQqOjApDQp3aGlj
aCBzdGFydHMgbG9va2luZyBsaWtlIHRoZSBURUNPIGNvbW1hbmRzIHRvIHBhcnNlIGl0cyBjb21t
YW5kIGxpbmUhDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJy
YW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lz
dHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=

