Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B7B9E86B2
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 17:50:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFA410E249;
	Sun,  8 Dec 2024 16:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3451910E249
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 16:49:56 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-319--F_qy5D-N-uYQShe1NBsMw-1; Sun, 08 Dec 2024 16:49:52 +0000
X-MC-Unique: -F_qy5D-N-uYQShe1NBsMw-1
X-Mimecast-MFC-AGG-ID: -F_qy5D-N-uYQShe1NBsMw
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 8 Dec
 2024 16:48:58 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 8 Dec 2024 16:48:58 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Martin Uecker' <muecker@gwdg.de>, Linus Torvalds
 <torvalds@linux-foundation.org>
CC: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Luc Van Oostenryck
 <luc.vanoostenryck@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, Rikard Falkeborn
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
Thread-Index: AQHbSQMFJXcuwP9wN0+yRzIQ2cx/pbLcMkGAgAAXzACAADyVgA==
Date: Sun, 8 Dec 2024 16:48:58 +0000
Message-ID: <e71fffb7ff0e4bf29692d006c0fe77c2@AcuMS.aculab.com>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
 <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
 <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de>
 <344b4cf41a474377b3d2cbf6302de703@AcuMS.aculab.com>
 <9a0c041b6143ba07c2b3e524572fccd841f5374b.camel@gwdg.de>
 <CAHk-=wjpVXEjX16PP=-hi4CgLqEGJ_U-WvKWq+J3C+FW-hSSfg@mail.gmail.com>
 <0a2996a7c63930b9d9a8d3792358dd9e494e27c1.camel@gwdg.de>
 <CAHk-=wjsfYYKBYuW8_6yKjdwHih0MMa2GwUJh_LHcuUNFR7-QA@mail.gmail.com>
 <9d9567dbdaf39688bbd0d240e29dec826a5931ee.camel@gwdg.de>
 <b71056c1b9e04aa383f2e5608c27290f@AcuMS.aculab.com>
 <6658618490381cf5ec35edbb66f1478024174e67.camel@gwdg.de>
In-Reply-To: <6658618490381cf5ec35edbb66f1478024174e67.camel@gwdg.de>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: INR9FzIbVPoWXY5vEaMOpfK3pPJDKYULdTWGj7-hALY_1733676591
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

RnJvbTogTWFydGluIFVlY2tlcg0KPiBTZW50OiAwOCBEZWNlbWJlciAyMDI0IDEyOjM4DQo+IA0K
PiBBbSBTb25udGFnLCBkZW0gMDguMTIuMjAyNCB1bSAxMToyNiArMDAwMCBzY2hyaWViIERhdmlk
IExhaWdodDoNCj4gPiBGcm9tOiBNYXJ0aW4gVWVja2VyDQo+ID4gPiBTZW50OiAwNyBEZWNlbWJl
ciAyMDI0IDIzOjUyDQo+ID4gLi4uDQo+ID4gPiBXaGlsZSB0aGUgY29tcGlsZXIgY2FuIG5vdCBh
dXRvbWF0aWNhbGx5IHByb3ZlIGV2ZXJ5IHVzZQ0KPiA+ID4gb2YgVkxBIGJvdW5kZWQsIGl0IGNh
biByZWxpYWJseSBkaWFnbm9zZSB0aGUgY2FzZXMgd2hlcmUgaXQNCj4gPiA+IGNhbsKgKm5vdCog
c2VlIHRoYXQgaXQgaXMgYm91bmRlZC4gQ29uc2lkZXIgdGhpcyBleGFtcGxlOg0KPiA+ID4NCj4g
PiA+IHZvaWQgb29iKGludCBuLCBjaGFyIHBbbl0pOw0KPiA+ID4gdm9pZCBmKHVuc2lnbmVkIGlu
dCBuKQ0KPiA+ID4gew0KPiA+ID4gICAgIGNoYXIgYnVmW01JTihuLCAxMDApXTsgLy8gYm91bmRl
ZA0KPiA+ID4gICAgIG9vYihuICsgMTAsIGJ1Zik7IC8vIHdhcm5pbmcNCj4gPiA+IH0NCj4gPiAu
Li4NCj4gPg0KPiA+IFRoZSBrZXJuZWwgc3RhY2sgaGFzIHRvIGhhdmUgZW5vdWdoIHNwYWNlIGZv
ciB0aGUgWzEwMF0NCj4gPiBzbyB0aGUgZnVsbCBhbW91bnQgbWlnaHQgYXMgd2VsbCBhbHdheXMg
YmUgYWxsb2NhdGVkLg0KPiA+IFRoZSBjaGFuY2Ugb2YgJ3RyYWRpbmcgb2ZmJyBzdGFjayB1c2Fn
ZSB3aXRoIGFub3RoZXIgZnVuY3Rpb24NCj4gPiBpbiB0aGUgc2FtZSBjYWxsIHN0YWNrIHRoYXQg
aXMgZ3VhcmFudGVlZCB0byB1c2UgbGVzcyB0aGFuDQo+ID4gaXRzIG1heGltdW0gaXMgYWJvdXQg
emVyby4NCj4gDQo+IEluIG51bWVyaWNhbCBjb21wdXRpbmcgdGhpcyBpcyBhIGJpZyBtb3RpdmF0
aW9uIGJlY2F1c2UNCj4geW91IGNhbiByZWR1Y2Ugc3RhY2sgdXNhZ2UgaW4gcmVjdXJzaXZlIGRp
dmlkZS1hbmQtY29ucXVlcg0KPiBhbGdvcml0aG1zLiAgRm9yIHRoZSBrZXJuZWwsIEkgYWdyZWUg
dGhpcyBpcyBub3QgYQ0KPiBjb21wZWxsaW5nIHVzZSBjYXNlLCBhbmQgdGhlIGJldHRlciBtb3Rp
dmF0aW9uIHdvdWxkIGJlDQo+IHByZWNpc2UgYm91bmRzIGNoZWNraW5nIGFuZCBjbGVhcmVyIHNl
bWFudGljcyBmb3IgYnVmZmVyDQo+IG1hbmFnZW1lbnQuDQoNCkV4Y2VwdCB0aGF0IGNoYW5naW5n
IHRoZSBzaXplIG9mIHRoZSBvbi1zdGFjayBhcnJheSBtYWtlcw0KYWJzb2x1dGVseSBubyBkaWZm
ZXJlbmNlLg0KSWRlYWxseSB0aGUga2VybmVsIHN0YWNrIHdvdWxkIGJlIGEgc2luZ2xlIDRrIHBh
Z2UsIGJ1dCB0b28NCm11Y2ggY29kZSB1c2VzIG9uLXN0YWNrIGJ1ZmZlcnMgc28gaXQgaGFzIGJl
ZW4gaW5jcmVhc2VkIGFuZA0KbWlnaHQgYmUgMTZrIChvciBtb3JlISkuDQpSZW1lbWJlciB0aGlz
IGlzIHBoeXNpY2FsIG1lbW9yeSBhbGxvY2F0ZWQgdG8gZXZlcnkgdXNlciB0aHJlYWQuDQpPbiBM
aW51eCBpdCBpcyBub3Qgc3dhcHBhYmxlLg0KDQouLi4NCj4gPiBUaGlzIGhhcHBlbmVkIGZvciAn
Y29uc3RhbnQnIHNpemVzIGZyb20gbWluKDE2LCBzaXplb2YgKHN0cnVjdCkpDQo+ID4gYmVjYXVz
ZSBtaW4oKSBuZWVkcyB0byBiZSBhIHN0YXRlbWVudCBmdW5jdGlvbiB0byBhdm9pZCByZS1ldmFs
dWF0aW5nDQo+ID4gaXRzIGFyZ3VtZW50cy4NCj4gDQo+IENhbiB5b3UgY2xhcmlmeSB0aGlzPyAg
SWYgdGhlIFZMQSBzaXplIGlzIGNvbnN0YW50LCBldmVuIHdoZW4NCj4gaXQgaXMgbm90IGFuIGlu
dGVnZXIgY29uc3RhbnQgZXhwcmVzc2lvbiBhY2NvcmRpbmcgdG8gSVNPIEMsDQo+IHRoZSBjb21w
aWxlciBzaG91bGQgbm90IHByb2R1Y2Ugd29yc2UgY29kZS4gIEZvciBleGFtcGxlLA0KDQpJIGp1
c3QgdHJpZWQgdG8gcmVwcm9kdWNlIHRoZSBmYWlsaW5nIGNhc2UgLSBhbmQgZmFpbGVkLg0KSXQg
d2FzIHNpbWlsYXIgdG8gX19idWlsdGluX2NvbnN0YW50X3AoKSBpbml0aWFsbHkgcmV0dXJuaW5n
ICdkb24ndCBrbm93Jw0Kc28gdGhlICd2YXJpYWJsZSBzaXplZCcgYXJyYXkgY29kZSBnb3QgYWRk
ZWQsIHRoZW4gbXVjaCBsYXRlcg0KYWZ0ZXIgZnVydGhlciBvcHRpbWlzYXRpb24gcGFzc2VzIHRo
ZSBleHByZXNzaW9uIGJlY2FtZSBjb25zdGFudC4NClNvIHlvdSBlbmRlZCB1cCB3aXRoIGEgJ2Zp
eGVkIHNpemUnIFZMQS4NCg0KQ29tcGlsZSB3aXRoIC1Xbm8tdmxhIChhbmQgLVdlcnJvcikgYW5k
IHRoZSBjb21waWxlIGZhaWxlZC4NCg0KLi4uDQo+IFNvIGEgbG90IG9mIHRoaXMgbWFjcm8gYnVz
aW5lc3Mgc2VlbXMgdG8gYmUgbmVjZXNzYXJ5DQo+IHRvIGF2b2lkIGNyZWF0aW5nIHdhcm5pbmdz
IGZvciBJU08gVkxBcyB3aGVuIGluc3RlYWQgeW91IHJlYWxseQ0KPiBjYXJlIGFib3V0IHRoZSBj
cmVhdGVkIGNvZGUgbm90IGhhdmluZyBhIGR5bmFtaWMgYWxsb2NhdGlvbiBvbg0KPiB0aGUgc3Rh
Y2suDQoNCkEgbG90IG9mIHRoZSAnbWFjcm8gYnVzaW5lc3MnIGZvciBtaW4vbWF4IGlzIGF2b2lk
aW5nIHVuZXhwZWN0ZWQNCmNvbnZlcnNpb24gb2YgbmVnYXRpdmUgdmFsdWVzIHRvIHZlcnkgbGFy
Z2UgdW5zaWduZWQgb25lcy4NCkFuZCBubywgLVdzaWduLWNvbXBhcmUgaXMgc3BlY3RhY3VsYXJs
eSB1c2VsZXNzLg0KDQouLg0KPiBUaGUgaXNzdWUgaGVyZSBpcyB0aGF0IHdlIG1pc3MgYSBsYW5n
dWFnZSBmZWF0dXJlIGluIEMgdG8NCj4gaW50cm9kdWNlIGxvY2FsIHZhcmlhYmxlcyB0aGF0IGhl
bHAgYXZvaWQgbXVsdGlwbGUgZXhwYW5zaW9uDQo+IG9mIG1hY3JvIGFyZ3VtZW50cy4gIEdDQydz
IHN0YXRlbWVudCBleHByZXNzaW9ucyBhbmQgX19hdXRvX3R5cGUNCj4gYXJlIGEgc29sdXRpb24N
Cg0Kb3IgaGlzdG9yaWNhbGx5ICd0eXBlb2YoeCkgX3ggPSB4Jw0KDQo+ICNkZWZpbmUgZm9vKHgp
ICh7IF9fYXV0b190eXBlIF9feCA9ICh4KTsgLi4uIH0pDQo+IA0KPiBidXQgdGhpcyBydW5zIGlu
dG8gdGhlIGN1cnJlbnQgbGltaXRhdGlvbnMgdGhhdCAoeyB9KSBjYW4gbm90IGJlIHVzZWQNCj4g
YXQgZmlsZS1zY29wZSBhbmQgY2FuIG5vdCByZXR1cm4gY29uc3RhbnQgZXhwcmVzc2lvbnMuDQo+
IA0KPiANCj4gRm9yIG90aGVyIHJlYXNvbnMgSSB3YXMgdGhpbmtpbmcgYWJvdXQgYWRkaW5nIG5h
bWVzIHRvIF9HZW5lcmljLA0KPiBhcyBpbg0KPiANCj4gX0dlbmVyaWMoeCwgaW50IGk6IChpICsg
MSkpOw0KPiANCj4gYmVjYXVzZSBvbmUgZGVzaWduIGlzc3VlcyB3aXRoIF9HZW5lcmljIGlzIHRo
YXQgaXQgdHlwZWNoZWNrcw0KPiBhbHNvIHRoZSB1bnRha2VuIGFzc29jaWF0aW9ucyBhbmQgdGhl
cmUgdGhlICd4JyB0aGVuIGhhcyB0aGUgd3JvbmcNCj4gdHlwZS4gIEhhdmluZyBhbiAnaScgd2l0
aCB0aGUgcmlnaHQgdHlwZSB3aGljaCBpcyBzZXQgdG8gdGhlIHZhbHVlDQo+IG9mICd4JyB3aGVu
IHRoZSBicmFuY2ggaXMgdGFrZW4gd291bGQgZml4IHRoaXMgaXNzdWUuDQoNClRoYXQgbG9va3Mg
ZXZlbiBtb3JlIHN5bnRhY3RpY2FsbHkgb2JzY3VyZSB0aGFuIF9HZW5lcmljIGl0c2VsZi4NCldo
eSBkb2VzIGl0IG5lZWQgdG8gZG8gbW9yZSB0aGFuIHZlcnkgc2ltcGxlIHN5bnRheCBhbmFseXNp
cyBvZg0KdGhlIHVud2FudGVkIGJyYW5jaGVzIC0gb3IgdGhleSBjb3VsZCBhdXRvbWF0aWNhbGx5
IGJlIGFuYWx5c2VkDQp3aXRoIHRoZSBuYW1lZCB2YXJpYWJsZSBoYXZlIHRoZSBzcGVjaWZpZWQg
dHlwZT8NCg0KPiBCdXQgdGhpcyBmZWF0dXJlIG1pZ2h0IGFsc28gYWxsb3cgd3JpdGluZyBtYWNy
b3MgdGhhdCBhdm9pZA0KPiBkb3VibGUgZXhwYW5zaW9uIHdpdGhvdXQgcmVxdWlyaW5nIHN0YXRl
bWVudCBleHByZXNzaW9ucyAod2hpY2gNCj4gYXJlIG1vcmUgZGlmZmljdWx0IHRvIGZpeCk6DQo+
IA0KPiAjZGVmaW5lIGZvbyh4KSBfR2VuZXJpYyh4LCBpbnQgaTogKGkgKyBpKSk7DQoNCkhvdyBj
YW4gdGhhdCB3b3JrIGZvciB0aGluZ3MgbGlrZSBtaW4oKSB0aGF0IGhhdmUgbXVsdGlwbGUgYXJn
dW1lbnRzPw0KTm90IGdvaW5nIHRvIHdvcmsgaWYgeW91IG5lZWQgX19hdXRvX3R5cGUgZWl0aGVy
Lg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJv
YWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24g
Tm86IDEzOTczODYgKFdhbGVzKQ0K

