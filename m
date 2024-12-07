Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448889E8173
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 19:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917E410E647;
	Sat,  7 Dec 2024 18:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBC210E65A
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2024 18:08:32 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-90-ibaGRZ9SPyGPO9gonrHa7A-1; Sat, 07 Dec 2024 18:08:29 +0000
X-MC-Unique: ibaGRZ9SPyGPO9gonrHa7A-1
X-Mimecast-MFC-AGG-ID: ibaGRZ9SPyGPO9gonrHa7A
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sat, 7 Dec
 2024 18:07:38 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sat, 7 Dec 2024 18:07:38 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Vincent Mailhol' <vincent.mailhol@gmail.com>, Martin Uecker
 <muecker@gwdg.de>
CC: Linus Torvalds <torvalds@linux-foundation.org>, Luc Van Oostenryck
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
Thread-Index: AQHbROFPJXcuwP9wN0+yRzIQ2cx/pbLWa+gggAFf14CAACMqUIAC5S1rgAA568A=
Date: Sat, 7 Dec 2024 18:07:38 +0000
Message-ID: <00d233a607a84f73942cd706cc29f088@AcuMS.aculab.com>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
 <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
 <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de>
 <CAMZ6RqJGqBqvgxzp5yPFY1pk0WkkwEMM34qU-dZ3kXfsnKaqEg@mail.gmail.com>
 <429e7c6713ecc94494d9107e5f5a1f0c8e854f23.camel@gwdg.de>
 <CAMZ6RqL+iS6GVsY20=O6GdQakRpp7XdewZJsUbmE5OCsKaHR6Q@mail.gmail.com>
In-Reply-To: <CAMZ6RqL+iS6GVsY20=O6GdQakRpp7XdewZJsUbmE5OCsKaHR6Q@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zXtUXM1HNZ0eEXvuuooOp_Wfh_fg7T8DwPRsuu_Mqo0_1733594908
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

RnJvbTogVmluY2VudCBNYWlsaG9sDQo+IFNlbnQ6IDA3IERlY2VtYmVyIDIwMjQgMTM6NTENCi4u
Lg0KPiA+ID4gSXQgc2VlbXMgdG8gbWUgdGhhdCB0aGUgbG9uZyB0ZXJtIHNvbHV0aW9uIHRvIHRo
aXMgcHJvYmxlbSBhcmUgdGhlDQo+ID4gPiBjb25zdGV4cHIgZnVuY3Rpb25zLg0KPiA+DQo+ID4g
SG93IHdvdWxkIGNvbnN0ZXhwciBmdW5jdGlvbnMgaGVscCBoZXJlPyAgKEkgYW0gYSBiaXQgc2Nl
cHRpY2FsIGFib3V0DQo+ID4gY29uc3RleHByIGZ1bmN0aW9ucy4pDQo+IA0KPiBJIHdhcyB0aGlu
a2luZyBvZiBzb21lIG9mIHRoZSAic2lkZSBmZWF0dXJlcyIgb2YgY29uc3RleHByIGZ1bmN0aW9u
cy4gTmFtZWx5Og0KPiANCj4gICAtIHN0ZDo6aXNfY29uc3RhbnRfZXZhbHVhdGVkDQo+ICAgTGlu
azogaHR0cHM6Ly9lbi5jcHByZWZlcmVuY2UuY29tL3cvY3BwL3R5cGVzL2lzX2NvbnN0YW50X2V2
YWx1YXRlZA0KPiANCj4gICAtIGlmIGNvbnN0ZXZhbA0KPiAgIExpbms6IGh0dHBzOi8vZW4uY3Bw
cmVmZXJlbmNlLmNvbS93L2NwcC9sYW5ndWFnZS9pZiNDb25zdGV2YWxfaWYNCj4gDQo+IEkgZGlk
IG5vdCB0cnkgaXQsIGJ1dCBsb29raW5nIGF0IHRoZXNlLCBJIGJlbGlldmUgdGhhdCB0aGlzIHdv
dWxkDQo+IGFsbG93IHVzIHRvIHJld3JpdGUgbW9zdCBvZiBvdXIgbWFjcm9zIGludG8gc29tZSBj
b25zdGV4cHIgZnVuY3Rpb25zLg0KDQpJSVJDIChhbmQgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhl
IGRlZmluaXRpb25zKSB0aGV5IGFyZSBiYWNrd2FyZHMNCmZyb20gd2hhdCB0aGUga2VybmVsIHRl
c3RzIGFyZSB0cnlpbmcgdG8gYWNoaWV2ZS4NClRoZSBrZXJuZWwgd2FucyB0byBhZGQgYWRkaXRp
b25hbCBjb21waWxlLXRpbWUgdGVzdHMgd2hlcmUgcG9zc2libGUuDQpUaGlzIGlzIG9mdGVuIHJl
c3RyaWN0ZWQgdG8gY2hlY2tpbmcgdmFsdWVzIHRoYXQgYXJlIGNvbXBpbGUgdGltZQ0KY29uc3Rh
bnRzIChmb3Igc29tZSBkZWZpbml0aW9uIG9mIGNvbnN0YW50KS4NClRoZSBDKysgJ2NvbnN0ZXhw
cicgaXMgYWJvdXQgZGV0ZXJtaW5pbmcgdGhlIGNvbnRleHQgaW4gd2hpY2ggYQ0KZnVuY3Rpb24g
aXMgY2FsbGVkLg0KDQpSZW1lbWJlciBpbiBDICdzdGF0aWMgaW50IHggPSBleHByOycgcmVxdWly
ZXMgdGhhdCAnZXhwcicgaXMgYSBjb25zdGFudA0Kc28gdGhhdCB0aGUgYXNtIGNhbiBjb250YWlu
ICd4OiAud29yZCB2YWx1ZScsIGJ1dCBDKysgaXMgcGVyZmVjdGx5IHdpbGxpbmcNCnRvIGFkZCBh
biBlbnRyeSB0byB0aGUgJ2dsb2JhbCBjb25zdHJ1Y3RvcnMnIGFuZCBjYWxsIGEgZnVuY3Rpb24g
Zm9yIHlvdS4NClRoaXMgaXMgbm90IHVzZWZ1bCBkZWZhdWx0IGJlaGF2aW91ci4NClRoZSAnY29u
c3RleHByJyBzdHVmZiBzZWVtcyB0byBiZSBhYm91dCBkZXRlY3Rpbmcgc29tZSBvZiB0aGVzZSBj
YXNlcw0Kc28gdGhlIGZ1bmN0aW9uIGNhbiByZXR1cm4gYSBkaWZmZXJlbnQgdmFsdWUgLSBhbmQg
dGhlbiBwb3NzaWJseSBiZQ0Kb3B0aW1pc2VkIGF3YXkuDQpUaGUga2VybmVsIGlzIHRyeWluZyB0
byBnZXQgc29tZSB0ZXN0IGNvdmVyYWdlIGF0IGNvbXBpbGUgdGltZQ0Kd2l0aG91dCBhZmZlY3Rp
bmcgcnVuLXRpbWUuDQoNClRoZSBjb21waWxlLXRpbWUgY2hlY2tzIGFsbCBnZXQgbW9yZSBjb21w
bGljYXRlZCBiZWNhdXNlIHRoaW5ncyBsaWtlDQppbml0aWFsaXNlcnMgaGF2ZSB0byBiZSAnaW50
ZWdlciBjb25zdGFudCBleHByZXNzaW9ucycgcmF0aGVyIHRoYW4gdGhlDQptb3JlIHJlbGF4ZWQg
J2NvbXBpbGUgdGltZSBjb25zdGFudCcgKGFycmF5IGJvdW5kcyBwcm9iYWJseSBkbyBuZWVkDQp0
byBiZSB0aGUgZm9ybWVyKS4NClRoaXMgaXMgKHByb2JhYmx5KSB3aGF0IHN0b3BzICh7IGV4cHI7
IH0pIGJlaW5nIHVzZWQgZm9yIGluaXRpYWxpc2Vycw0KZXZlbiB3aGVuIHRoZSB2YWx1ZSBpcyBh
IGNvbXBpbGUgdGltZSBjb25zdGFudC4NClJlbGF4aW5nIHRoYXQgcnVsZSB3b3VsZCBiZSB1c2Vm
dWwuDQoNClRoZW4gdGhlcmUgaXMgdGhlIGJyYWluLWRlYWQgZGVmaW5pdGlvbiBvZiBfU3RhdGlj
X2Fzc2VydCgpIHRoYXQgbWFrZXMNCml0IHByZXR0eSBuZWFyIGNvbXBsZXRlbHkgdXNlbGVzcyAo
SSBjYW4ndCByZW1lbWJlciBMaW51cydzIHdvcmRzKSBmb3INCmFueXRoaW5nIG5vbi10cml2aWFs
Lg0KVG8gYmUgdXNlZnVsIGl0IHdvdWxkIG5lZWQgdG8gYmUgZGVmZXJyZWQgdW50aWwgYWZ0ZXIg
dGhlIG9wdGltaXNlcg0KaGFzIGRvbmUgYWxsIGl0cyBwcm9jZXNzaW5nIGFuIG9ubHkgdHJpZ2dl
ciBpZiB0aGUgY2FsbCBoYXNuJ3QgYmVlbg0Kb3B0aW1pc2VkIGF3YXkgYW5kIHRoZSBjb25kaXRp
b24gaXMgZWl0aGVyIG5vbi1jb25zdGFudCBvciBmYWxzZS4NCmNsYW5nJ3MgJ2luZmluaXRlIHdp
c2RvbScgZGVjaWRlZCB0byB1bmNvbmRpdGlvbmFsbHkgb3V0cHV0IHRoZSBjcHANCm91dHB1dCBv
ZiB0aGUgZXhwcmVzc2lvbiBpbiB0aGUgZXJyb3IgbWVzc2FnZSAoZXZlbiB3aGVuIHRoZXJlIHdh
cw0KYSBjYWxsZXIgcHJvdmlkZWQgbWVzc2FnZSkuIFdoZW4gbWluKCkgd2FzIHVzaW5nIGl0IHRo
YXQgY291bGQgYmUNCmEgZmV3IGh1bmRyZWQgYnl0ZXMgb2YgaW1wZW5ldHJhYmxlIHRleHQgaW4g
YSBub3JtYWwgY2FsbCAtIG5ldmVyDQptaW5kIHRoZSBuZXN0ZWQgb25lcyB0aGF0IGhpdCAxMCtN
QiBiZWNhdXNlIG9mIGEgcmVxdWlyZW1lbnQgdG8gcmV0dXJuDQonY29uc3RhbnQgaW50ZWdlciBl
eHByZXNzaW9ucycuDQoNCkl0IHdvdWxkIGFsc28gYmUgdXNlZnVsIHRvIGhhdmUgYSAnd2Fybmlu
ZycgZm9ybSAob3IgZXZlbiBhbiAnaW5mbycNCnRoYXQgaXNuJ3QgYW4gZXJyb3IgZXZlbiB3aXRo
IC1XZXJyb3IpLg0KDQpUaGVuIHlvdSBnZXQgX0dlbmVyaWMoKS4NCldURiBkbyB0aGUgdW5zZWxl
Y3RlZCBjYXNlcyBub3Qgb25seSBoYXZlIHRvIGJlIHZhbGlkIEMgYnV0IGFsc28gZ2V0DQpjaGVj
a2VkIGZvciBzb21lIHdhcm5pbmdzIChsaWtlIC1Xc2lnbi1jb21wYXJlIGFuZCAndW5zaWduZWQg
Pj0gMCcpLg0KDQouLi4NCj4gSSB3YXMgaW52aXRlZCB0byBXRzE0IHRoaXMgU2VwdGVtYmVyLiBG
b3Igbm93LCBJIGFtIG9ubHkgbHVya2luZy4gVGhlDQo+IHRoaW5nIEkgaGF2ZSBpbiBtaW5kIHJp
Z2h0IG5vdyBpcyB0byB3cml0ZSBhIHBhcGVyIHRvIGFsbG93IHRoZSB1c2Ugb2YNCj4gc3RhdGlj
X2Fzc2VydCgpIGluIGV4cHJlc3Npb25zIChpLmUuIG1ha2UgaXQgcmV0dXJuIDAgb24gc3VjY2Vz
cykuDQo+IFRoYXQgc2hvdWxkIGJlIGEgcmVsYXRpdmVseSBzbWFsbCBjaGFuZ2UsIGJ1dCB3b3Vs
ZCBicmluZyBhIG5pY2UNCj4gcXVhbGl0eSBvZiBsaWZlIGltcHJvdmVtZW50Lg0KDQpBZGRpbmcg
Z2NjJ3MgKHsgZXhwcjsgfSkgdG8gdGhlIHN0YW5kYXJkIGFuZCBhbGxvd2luZyBpdHMgb3V0cHV0
IHRvDQpiZSBhcyAnY29uc3RhbnQnIGFzIGFueXRoaW5nIGluICdleHByJyB3b3VsZCBzb2x2ZSBh
IGxvdCBvZiBpc3N1ZXMuDQoNCllvdSBuZWVkIHRvIGJlIGFibGUgdG8gaGF2ZToNCglpZiAoeCkN
CgkJc3RhdGljX2Fzc2VydCh5KQ0KZm9yIHN0YXRpY19hc3NlcnQoKSB0byBiZSB1c2FibGUgYXMg
dGhlIG1haW4gbWV0aG9kIG9mIHJlcG9ydGluZw0KdGhlc2Ugc29ydCBvbiBtZXNzYWdlcy4NClRo
ZSBiZXN0IG9uZSBpbiB0aGUga2VybmVsIChhYil1c2VzIHRoZSBtZXNzYWdlIGZvciBjYWxsaW5n
IGEgZGVwcmVjYXRlZA0KZnVuY3Rpb24uDQoNClRoZXJlIGFyZSBvdGhlciB0aGluZ3MgdGhhdCBn
ZXQgYW5ub3lpbmcuDQpJIHVuZGVyc3RhbmQgd2h5IG9mZnNldG9mKCkgbmVlZHMgdG8gYmUgYSAn
Y29tcGlsZSB0aW1lIGNvbnN0YW50JywNCmJ1dCB0aGF0IHNob3VsZCBvbmx5IGJlIGZvciBjb25z
dGFudCBpbnB1dC4NClRoZXJlIGlzIG5vIHJlYXNvbiB3aHkgb2Zmc2V0b2YoeCwgeVtleHByZXNz
aW9uXSkgc2hvdWxkIGJlIGludmFsaWQNCkMgZm9yIGEgbm9uLWNvbnN0YW50IGV4cHJlc3Npb24u
DQooQWx0aG91Z2ggSSd2ZSBoYWQgaXNzdWVzIGV2ZW4gd2l0aCBhIGNvbnN0YW50IGV4cHJlc3Np
b24gd2l0aCBhDQpjZXJ0YWluIGNvbXBpbGVyIEknbSBmb3JjZWQgdG8gdXNlIHNvbWV0aW1lcy4p
DQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9h
ZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBO
bzogMTM5NzM4NiAoV2FsZXMpDQo=

