Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2144C31AA6
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 10:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3171489295;
	Sat,  1 Jun 2019 08:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD45489295
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 08:55:51 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 42A662612A0;
 Sat,  1 Jun 2019 09:55:50 +0100 (BST)
Date: Sat, 1 Jun 2019 10:55:47 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: Re: [PATCH] drm/panfrost: Make sure a BO is only unmapped when
 appropriate
Message-ID: <20190601105547.5efe481d@collabora.com>
In-Reply-To: <CAAObsKBYvVKVTJf6ZwSarAVr6FSCz-NDYNhEqrDhBWUM3q57Nw@mail.gmail.com>
References: <20190529091836.22060-1-boris.brezillon@collabora.com>
 <CAAObsKBYvVKVTJf6ZwSarAVr6FSCz-NDYNhEqrDhBWUM3q57Nw@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Rob Herring <robh+dt@kernel.org>, stable@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAzMSBNYXkgMjAxOSAxNDo1NDo1NCArMDIwMApUb21ldSBWaXpvc28gPHRvbWV1QHRv
bWV1dml6b3NvLm5ldD4gd3JvdGU6Cgo+IE9uIFdlZCwgMjkgTWF5IDIwMTkgYXQgMTE6MTgsIEJv
cmlzIEJyZXppbGxvbgo+IDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gbW11X29wcy0+dW5tYXAoKSB3aWxsIGZhaWwgd2hlbiBjYWxsZWQgb24gYSBCTyB0aGF0
IGhhcyBub3QgYmVlbgo+ID4gcHJldmlvdXNseSBtYXBwZWQsIGFuZCB0aGUgZXJyb3IgcGF0aCBp
biBwYW5mcm9zdF9pb2N0bF9jcmVhdGVfYm8oKQo+ID4gY2FuIGNhbGwgZHJtX2dlbV9vYmplY3Rf
cHV0X3VubG9ja2VkKCkgKHdoaWNoIGluIHR1cm4gY2FsbHMKPiA+IHBhbmZyb3N0X21tdV91bm1h
cCgpKSBvbiBhIEJPIHRoYXQgaGFzIG5vdCBiZWVuIG1hcHBlZCB5ZXQuCj4gPgo+ID4gS2VlcCB0
cmFjayBvZiB0aGUgbWFwcGVkL3VubWFwcGVkIHN0YXRlIHRvIGF2b2lkIHN1Y2ggaXNzdWVzLgo+
ID4KPiA+IEZpeGVzOiBmM2JhOTEyMjhlOGUgKCJkcm0vcGFuZnJvc3Q6IEFkZCBpbml0aWFsIHBh
bmZyb3N0IGRyaXZlciIpCj4gPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5oIHwg
MSArCj4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jIHwgOCArKysr
KysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW0uaCBiL2RyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW0uaAo+ID4gaW5kZXggMDQ1MDAwZWI1ZmNmLi42
ZGJjYWJhMDIwZmMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZ2VtLmgKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9n
ZW0uaAo+ID4gQEAgLTExLDYgKzExLDcgQEAgc3RydWN0IHBhbmZyb3N0X2dlbV9vYmplY3Qgewo+
ID4gICAgICAgICBzdHJ1Y3QgZHJtX2dlbV9zaG1lbV9vYmplY3QgYmFzZTsKPiA+Cj4gPiAgICAg
ICAgIHN0cnVjdCBkcm1fbW1fbm9kZSBub2RlOwo+ID4gKyAgICAgICBib29sIGlzX21hcHBlZDsK
PiA+ICB9Owo+ID4KPiA+ICBzdGF0aWMgaW5saW5lCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X21tdS5jCj4gPiBpbmRleCA3NjJiMWJkMmE4YzIuLmZiNTU2YWE4OTIwMyAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYwo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCj4gPiBAQCAtMTU2
LDYgKzE1Niw5IEBAIGludCBwYW5mcm9zdF9tbXVfbWFwKHN0cnVjdCBwYW5mcm9zdF9nZW1fb2Jq
ZWN0ICpibykKPiA+ICAgICAgICAgc3RydWN0IHNnX3RhYmxlICpzZ3Q7Cj4gPiAgICAgICAgIGlu
dCByZXQ7Cj4gPgo+ID4gKyAgICAgICBpZiAoYm8tPmlzX21hcHBlZCkKPiA+ICsgICAgICAgICAg
ICAgICByZXR1cm4gMDsgIAo+IAo+IEluIHdoYXQgY2lyY3Vtc3RhbmNlcyB3ZSB3YW50IHRvIHNp
bGVudGx5IGdvIG9uPyBJIHdvdWxkIGV4cGVjdCB0aGF0Cj4gZm9yIHRoaXMgZnVuY3Rpb24gdG8g
YmUgY2FsbGVkIHdoZW4gdGhlIEJPIGhhcyBiZWVuIG1hcHBlZCBhbHJlYWR5Cj4gd291bGQgbWVh
biB0aGF0IHdlIGhhdmUgYSBidWcgaW4gdGhlIGtlcm5lbCwgc28gd2h5IG5vdCBhIFdBUk4/Cj4g
Cj4gPiArCj4gPiAgICAgICAgIHNndCA9IGRybV9nZW1fc2htZW1fZ2V0X3BhZ2VzX3NndChvYmop
Owo+ID4gICAgICAgICBpZiAoV0FSTl9PTihJU19FUlIoc2d0KSkpCj4gPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIFBUUl9FUlIoc2d0KTsKPiA+IEBAIC0xODksNiArMTkyLDcgQEAgaW50IHBhbmZy
b3N0X21tdV9tYXAoc3RydWN0IHBhbmZyb3N0X2dlbV9vYmplY3QgKmJvKQo+ID4KPiA+ICAgICAg
ICAgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShwZmRldi0+ZGV2KTsKPiA+ICAgICAgICAgcG1f
cnVudGltZV9wdXRfYXV0b3N1c3BlbmQocGZkZXYtPmRldik7Cj4gPiArICAgICAgIGJvLT5pc19t
YXBwZWQgPSB0cnVlOwo+ID4KPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4gQEAgLTIw
Myw2ICsyMDcsOSBAQCB2b2lkIHBhbmZyb3N0X21tdV91bm1hcChzdHJ1Y3QgcGFuZnJvc3RfZ2Vt
X29iamVjdCAqYm8pCj4gPiAgICAgICAgIHNpemVfdCB1bm1hcHBlZF9sZW4gPSAwOwo+ID4gICAg
ICAgICBpbnQgcmV0Owo+ID4KPiA+ICsgICAgICAgaWYgKCFiby0+aXNfbWFwcGVkKQo+ID4gKyAg
ICAgICAgICAgICAgIHJldHVybjsgIAo+IAo+IFNpbWlsYXJseSwgSSB0aGluayB0aGF0IHdoYXQg
d2Ugc2hvdWxkIGRvIGlzIG5vdCB0byBjYWxsCj4gcGFuZnJvc3RfbW11X3VubWFwIHdoZW4gYSBC
TyBpcyBmcmVlZCBpZiB3ZSBrbm93IGl0IGlzbid0IG1hcHBlZC4gQW5kCj4gcHJvYmFibHkgYWRk
IGEgV0FSTiBoZXJlIGlmIGl0IHN0aWxsIGdldHMgY2FsbGVkIHdoZW4gdGhlIEJPIGlzbid0Cj4g
bWFwcGVkLgoKT2theSwgd2lsbCBhZGQgV0FSTl9PTigpcyBhbmQgYWRkIGEgY2hlY2sgaW4gdGhl
IGNhbGxlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
