Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6D91E621F
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 15:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7736E54C;
	Thu, 28 May 2020 13:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C3BF36E530
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 13:22:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78148D6E;
 Thu, 28 May 2020 06:22:51 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 101303F52E;
 Thu, 28 May 2020 06:22:49 -0700 (PDT)
Subject: Re: [PATCH 06/15] drm/panfrost: properly handle error in probe
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
References: <20200510165538.19720-1-peron.clem@gmail.com>
 <20200510165538.19720-7-peron.clem@gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <6a5915af-680f-0e9f-1502-ccb4f8d3d199@arm.com>
Date: Thu, 28 May 2020 14:22:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200510165538.19720-7-peron.clem@gmail.com>
Content-Language: en-GB
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMDUvMjAyMCAxNzo1NSwgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+IEludHJvZHVjZSBh
IGJvb2xlYW4gdG8ga25vdyBpZiBvcHAgdGFibGUgaGFzIGJlZW4gYWRkZWQuCj4gCj4gV2l0aCB0
aGlzLCB3ZSBjYW4gY2FsbCBwYW5mcm9zdF9kZXZmcmVxX2ZpbmkoKSBpbiBjYXNlIG9mIGVycm9y
Cj4gYW5kIHJlbGVhc2Ugd2hhdCBoYXMgYmVlbiBpbml0aWFsaXNlZC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgoKTEdUTToKClJldmll
d2VkLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgoKPiAtLS0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgfCAyNSArKysrKysrKysr
KysrKysrLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVx
LmggfCAgMSArCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9kZXZmcmVxLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5j
Cj4gaW5kZXggNzg3NTNjZmI1OWZiLi5kOTAwN2Y0NGI3NzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMKPiBAQCAtMTAxLDYgKzEwMSw3IEBAIGlu
dCBwYW5mcm9zdF9kZXZmcmVxX2luaXQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCj4g
ICAJCXJldHVybiAwOwo+ICAgCWVsc2UgaWYgKHJldCkKPiAgIAkJcmV0dXJuIHJldDsKPiArCXBm
ZGV2ZnJlcS0+b3BwX29mX3RhYmxlX2FkZGVkID0gdHJ1ZTsKPiAgIAo+ICAgCXNwaW5fbG9ja19p
bml0KCZwZmRldmZyZXEtPmxvY2spOwo+ICAgCj4gQEAgLTEwOSw4ICsxMTAsMTAgQEAgaW50IHBh
bmZyb3N0X2RldmZyZXFfaW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKPiAgIAlj
dXJfZnJlcSA9IGNsa19nZXRfcmF0ZShwZmRldi0+Y2xvY2spOwo+ICAgCj4gICAJb3BwID0gZGV2
ZnJlcV9yZWNvbW1lbmRlZF9vcHAoZGV2LCAmY3VyX2ZyZXEsIDApOwo+IC0JaWYgKElTX0VSUihv
cHApKQo+IC0JCXJldHVybiBQVFJfRVJSKG9wcCk7Cj4gKwlpZiAoSVNfRVJSKG9wcCkpIHsKPiAr
CQlyZXQgPSBQVFJfRVJSKG9wcCk7Cj4gKwkJZ290byBlcnJfZmluaTsKPiArCX0KPiAgIAo+ICAg
CXBhbmZyb3N0X2RldmZyZXFfcHJvZmlsZS5pbml0aWFsX2ZyZXEgPSBjdXJfZnJlcTsKPiAgIAlk
ZXZfcG1fb3BwX3B1dChvcHApOwo+IEBAIC0xMTksOCArMTIyLDggQEAgaW50IHBhbmZyb3N0X2Rl
dmZyZXFfaW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKPiAgIAkJCQkJICBERVZG
UkVRX0dPVl9TSU1QTEVfT05ERU1BTkQsIE5VTEwpOwo+ICAgCWlmIChJU19FUlIoZGV2ZnJlcSkp
IHsKPiAgIAkJRFJNX0RFVl9FUlJPUihkZXYsICJDb3VsZG4ndCBpbml0aWFsaXplIEdQVSBkZXZm
cmVxXG4iKTsKPiAtCQlkZXZfcG1fb3BwX29mX3JlbW92ZV90YWJsZShkZXYpOwo+IC0JCXJldHVy
biBQVFJfRVJSKGRldmZyZXEpOwo+ICsJCXJldCA9IFBUUl9FUlIoZGV2ZnJlcSk7Cj4gKwkJZ290
byBlcnJfZmluaTsKPiAgIAl9Cj4gICAJcGZkZXZmcmVxLT5kZXZmcmVxID0gZGV2ZnJlcTsKPiAg
IAo+IEBAIC0xMzEsMTUgKzEzNCwyNSBAQCBpbnQgcGFuZnJvc3RfZGV2ZnJlcV9pbml0KHN0cnVj
dCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQo+ICAgCQlwZmRldmZyZXEtPmNvb2xpbmcgPSBjb29s
aW5nOwo+ICAgCj4gICAJcmV0dXJuIDA7Cj4gKwo+ICtlcnJfZmluaToKPiArCXBhbmZyb3N0X2Rl
dmZyZXFfZmluaShwZmRldik7Cj4gKwlyZXR1cm4gcmV0Owo+ICAgfQo+ICAgCj4gICB2b2lkIHBh
bmZyb3N0X2RldmZyZXFfZmluaShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKPiAgIHsK
PiAgIAlzdHJ1Y3QgcGFuZnJvc3RfZGV2ZnJlcSAqcGZkZXZmcmVxID0gJnBmZGV2LT5wZmRldmZy
ZXE7Cj4gICAKPiAtCWlmIChwZmRldmZyZXEtPmNvb2xpbmcpCj4gKwlpZiAocGZkZXZmcmVxLT5j
b29saW5nKSB7Cj4gICAJCWRldmZyZXFfY29vbGluZ191bnJlZ2lzdGVyKHBmZGV2ZnJlcS0+Y29v
bGluZyk7Cj4gLQlkZXZfcG1fb3BwX29mX3JlbW92ZV90YWJsZSgmcGZkZXYtPnBkZXYtPmRldik7
Cj4gKwkJcGZkZXZmcmVxLT5jb29saW5nID0gTlVMTDsKPiArCX0KPiArCj4gKwlpZiAocGZkZXZm
cmVxLT5vcHBfb2ZfdGFibGVfYWRkZWQpIHsKPiArCQlkZXZfcG1fb3BwX29mX3JlbW92ZV90YWJs
ZSgmcGZkZXYtPnBkZXYtPmRldik7Cj4gKwkJcGZkZXZmcmVxLT5vcHBfb2ZfdGFibGVfYWRkZWQg
PSBmYWxzZTsKPiArCX0KPiAgIH0KPiAgIAo+ICAgdm9pZCBwYW5mcm9zdF9kZXZmcmVxX3Jlc3Vt
ZShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuaCBiL2RyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9kZXZmcmVxLmgKPiBpbmRleCBlNjYyOTkwMGE2MTguLmFkZDIwM2NiMDBj
MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJl
cS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuaAo+
IEBAIC0xNSw2ICsxNSw3IEBAIHN0cnVjdCBwYW5mcm9zdF9kZXZpY2U7Cj4gICBzdHJ1Y3QgcGFu
ZnJvc3RfZGV2ZnJlcSB7Cj4gICAJc3RydWN0IGRldmZyZXEgKmRldmZyZXE7Cj4gICAJc3RydWN0
IHRoZXJtYWxfY29vbGluZ19kZXZpY2UgKmNvb2xpbmc7Cj4gKwlib29sIG9wcF9vZl90YWJsZV9h
ZGRlZDsKPiAgIAo+ICAgCWt0aW1lX3QgYnVzeV90aW1lOwo+ICAgCWt0aW1lX3QgaWRsZV90aW1l
Owo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
