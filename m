Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E51DFF9892
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 19:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6F06EBBD;
	Tue, 12 Nov 2019 18:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3BE6EBBD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 18:24:28 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id y194so15730208oie.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 10:24:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r31nz+kZF/TKNHaB6gtaSbNm2gH5BovCO5Pp07i/Wqw=;
 b=q5WhGBn/mqHB4zdndLY5qoA8taBaXO2eYVcrbR/mAi7hlfAwTe8qPVJ3DXCNWX9toD
 /Zquy+rvHtpl24MnTndYinMIOtcSRSTp7GEIPFB2qoyc78IEJ34asOR6hSnlDdV9HXV4
 R4B3qgBA/GYdBH8VSLkvB9f8qBfn8xLnRl0WcMad6Rdtsxh8fg8dO+aLWUdcquQlSgRG
 JMgWxWFQYDVVTVgmJDmBvQgsIxa45xkvMNFRWRuaSXqiWhVuapnMVZ1t7KpUYi7IU1Tw
 Ayz3sWzxUX30TMYbtfUvMqorvRdu9BABkUpKZZayFAf+q713Eiasy9gZSZDgh+Kijgan
 j9pQ==
X-Gm-Message-State: APjAAAW5feRaksHnV6eYsXY+y3rr5EXzbpnUUyHKeS/2MZf6FxhOgayA
 gGxcAgNcQDh/+69HsMq+MeN6jjQBr6WUTztRVlMOqQ==
X-Google-Smtp-Source: APXvYqzRgnCRMXxqQj79BtqZX1LPtWXkExcHdXYQWDqN4Kqq2E4Z9rVKxzMdBaB6Wc5vhP9G0tDMsM1gsn38R4D4eYA=
X-Received: by 2002:aca:b805:: with SMTP id i5mr308729oif.110.1573583067752;
 Tue, 12 Nov 2019 10:24:27 -0800 (PST)
MIME-Version: 1.0
References: <20191107114155.54307-1-mihail.atanassov@arm.com>
 <20191107114155.54307-6-mihail.atanassov@arm.com>
 <20191111155313.iiz37se2f7526ehp@e110455-lin.cambridge.arm.com>
 <39367348.R9gcQaf2xt@e123338-lin>
In-Reply-To: <39367348.R9gcQaf2xt@e123338-lin>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 12 Nov 2019 19:24:16 +0100
Message-ID: <CAKMK7uHB-mHmuBA-VkKuhUSRHQRu0wvHHJA+a=Q1fXSXaJgrpw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm/komeda: add rate limiting disable to
 err_verbosity
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r31nz+kZF/TKNHaB6gtaSbNm2gH5BovCO5Pp07i/Wqw=;
 b=RCD/1hgFNPTp/mnDzk1v9MF0BK0jZDLGEg9Kt8xJfdSlls7xEQ3sMC+h4Mkjzxrn2L
 Zxa8Kg0E98+n58D1Y8J5CqxUDorwG4Oyg+rloM5a0Rj5C9RE8MOoG3VsN6vtWqGKdVdZ
 J7jdNLMg1zQwh+6oiBDWK9O5MK6PK848/jyaw=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMjowMCBQTSBNaWhhaWwgQXRhbmFzc292CjxNaWhhaWwu
QXRhbmFzc292QGFybS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uZGF5LCAxMSBOb3ZlbWJlciAyMDE5
IDE1OjUzOjE0IEdNVCBMaXZpdSBEdWRhdSB3cm90ZToKPiA+IE9uIFRodSwgTm92IDA3LCAyMDE5
IGF0IDExOjQyOjQ0QU0gKzAwMDAsIE1paGFpbCBBdGFuYXNzb3Ygd3JvdGU6Cj4gPiA+IEl0J3Mg
cG9zc2libGUgdG8gZ2V0IG11bHRpcGxlIGV2ZW50cyBpbiBhIHNpbmdsZSBmcmFtZS9mbGlwLCBz
byBhZGQgYW4KPiA+ID4gb3B0aW9uIHRvIHByaW50IHRoZW0gYWxsLgo+ID4gPgo+ID4gPiBSZXZp
ZXdlZC1ieTogSmFtZXMgUWlhbiBXYW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFp
YW4ud2FuZ0Bhcm0uY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Cj4gPgo+ID4gRm9yIHRoZSB3aG9sZSBzZXJpZXM6Cj4g
Pgo+ID4gQWNrZWQtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgo+Cj4gVGhh
bmtzLCBhcHBsaWVkIHRvIGRybS1taXNjLW5leHQuCgpBbmQgbm93IGtvbWVkYSBkb2Vzbid0IGV2
ZW4gY29tcGlsZSBhbnltb3JlLiBJJ20gLi4uIGltcHJlc3NlZC4KCkkgbWVhbiBnZW5lcmFsbHkg
cGVvcGxlIGJyZWFrIG90aGVyIHBlb3BsZSdzIGRyaXZlciwgbm90IHRoZWlyIG93bi4KLURhbmll
bAoKPiA+Cj4gPiBCZXN0IHJlZ2FyZHMsCj4gPiBMaXZpdQo+ID4KPiA+ID4gLS0tCj4gPiA+Cj4g
PiA+ICB2MjogQ2xlYW4gdXAgY29udGludWF0aW9uIGxpbmUgd2FybmluZyBmcm9tIGNoZWNrcGF0
Y2guCj4gPiA+Cj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9kZXYuaCAgIHwgMiArKwo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZXZlbnQuYyB8IDIgKy0KPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCj4gPiA+IGluZGV4IGQ5ZmM5YzQ4ODU5YS4u
MTVmNTJlMzA0YzA4IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9kZXYuaAo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaAo+ID4gPiBAQCAtMjI0LDYgKzIyNCw4IEBAIHN0cnVj
dCBrb21lZGFfZGV2IHsKPiA+ID4gICNkZWZpbmUgS09NRURBX0RFVl9QUklOVF9JTkZPX0VWRU5U
UyBCSVQoMikKPiA+ID4gICAgIC8qIER1bXAgRFJNIHN0YXRlIG9uIGFuIGVycm9yIG9yIHdhcm5p
bmcgZXZlbnQuICovCj4gPiA+ICAjZGVmaW5lIEtPTUVEQV9ERVZfUFJJTlRfRFVNUF9TVEFURV9P
Tl9FVkVOVCBCSVQoOCkKPiA+ID4gKyAgIC8qIERpc2FibGUgcmF0ZSBsaW1pdGluZyBvZiBldmVu
dCBwcmludHMgKG5vcm1hbGx5IG9uZSBwZXIgY29tbWl0KSAqLwo+ID4gPiArI2RlZmluZSBLT01F
REFfREVWX1BSSU5UX0RJU0FCTEVfUkFURUxJTUlUIEJJVCgxMikKPiA+ID4gIH07Cj4gPiA+Cj4g
PiA+ICBzdGF0aWMgaW5saW5lIGJvb2wKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2V2ZW50LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVudC5jCj4gPiA+IGluZGV4IDdmZDYyNDc2MWEyYi4u
YmYyNjk2ODNmODExIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9ldmVudC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2V2ZW50LmMKPiA+ID4gQEAgLTExOSw3ICsxMTksNyBAQCB2
b2lkIGtvbWVkYV9wcmludF9ldmVudHMoc3RydWN0IGtvbWVkYV9ldmVudHMgKmV2dHMsIHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYpCj4gPiA+ICAgICAvKiByZWR1Y2UgdGhlIHNhbWUgbXNnIHByaW50
LCBvbmx5IHByaW50IHRoZSBmaXJzdCBldnQgZm9yIG9uZSBmcmFtZSAqLwo+ID4gPiAgICAgaWYg
KGV2dHMtPmdsb2JhbCB8fCBpc19uZXdfZnJhbWUoZXZ0cykpCj4gPiA+ICAgICAgICAgICAgIGVu
X3ByaW50ID0gdHJ1ZTsKPiA+ID4gLSAgIGlmICghZW5fcHJpbnQpCj4gPiA+ICsgICBpZiAoIShl
cnJfdmVyYm9zaXR5ICYgS09NRURBX0RFVl9QUklOVF9ESVNBQkxFX1JBVEVMSU1JVCkgJiYgIWVu
X3ByaW50KQo+ID4gPiAgICAgICAgICAgICByZXR1cm47Cj4gPiA+Cj4gPiA+ICAgICBpZiAoZXJy
X3ZlcmJvc2l0eSAmIEtPTUVEQV9ERVZfUFJJTlRfRVJSX0VWRU5UUykKPiA+ID4gLS0KPiA+ID4g
Mi4yMy4wCj4gPiA+Cj4gPgo+ID4gLS0KPiA+ID09PT09PT09PT09PT09PT09PT09Cj4gPiB8IEkg
d291bGQgbGlrZSB0byB8Cj4gPiB8IGZpeCB0aGUgd29ybGQsICB8Cj4gPiB8IGJ1dCB0aGV5J3Jl
IG5vdCB8Cj4gPiB8IGdpdmluZyBtZSB0aGUgICB8Cj4gPiAgXCBzb3VyY2UgY29kZSEgIC8KPiA+
ICAgLS0tLS0tLS0tLS0tLS0tCj4gPiAgICAgwq9cXyjjg4QpXy/Crwo+ID4KPgo+Cj4gLS0KPiBN
aWhhaWwKPgo+Cj4KCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwg
Q29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
