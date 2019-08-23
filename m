Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 876B89AEF5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 14:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D59C6EC7B;
	Fri, 23 Aug 2019 12:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22C06EC80
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 12:17:09 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6DB4B23401
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 12:17:09 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id u34so10968668qte.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 05:17:09 -0700 (PDT)
X-Gm-Message-State: APjAAAU6OtNTWrb4YYaTYnq9FAEoF3drD62jJGXJ7u+46MNvoz4TrUdU
 f6P2wtkYJpbdxsHBxMYli4orbmkdHWAEhIXrJg==
X-Google-Smtp-Source: APXvYqyeEEXeNJbapC0pltnSlgK0tiHzytO9ehEIoqSnMNAa+sw5amx8kvS8e/Cbh7lv1a/vKDtGyoCrKBs/5p42XN4=
X-Received: by 2002:aed:24f4:: with SMTP id u49mr4442016qtc.110.1566562628598; 
 Fri, 23 Aug 2019 05:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190823021216.5862-1-robh@kernel.org>
 <20190823021216.5862-3-robh@kernel.org>
 <ba8554fc-26b6-02d0-134f-6c307d39dbd5@arm.com>
In-Reply-To: <ba8554fc-26b6-02d0-134f-6c307d39dbd5@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 23 Aug 2019 07:16:55 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Es4B3V4i0TJjABQr8MEJVPc6NVOhAQ+mP41b7v1a7Kw@mail.gmail.com>
Message-ID: <CAL_Jsq+Es4B3V4i0TJjABQr8MEJVPc6NVOhAQ+mP41b7v1a7Kw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] drm/panfrost: Rework runtime PM initialization
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566562629;
 bh=QMWYEJf2aMhyjk4GK/AlsnxNjoHwuoxYn0o6NWTnXus=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=1DOehfUKjFjoCb00OENRh82MlsBYkV+9O5aD7MzoK0E4hLmG8anpvfZx1+zPfsR8F
 dCM3kKIphhVfNdCYIg2UNXSv2u+TmzH3wtPqkn2GN9w6zGw6RJ6uRFhVgl1K+Q4noq
 iLHnAUz/xgiLjxuestWJPfjtN+ZxYxDaW9mDXS6o=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgNTo1NCBBTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBo
eUBhcm0uY29tPiB3cm90ZToKPgo+IE9uIDIzLzA4LzIwMTkgMDM6MTIsIFJvYiBIZXJyaW5nIHdy
b3RlOgo+ID4gVGhlcmUncyBhIGZldyBpc3N1ZXMgd2l0aCB0aGUgcnVudGltZSBQTSBpbml0aWFs
aXphdGlvbi4KPiA+Cj4gPiBUaGUgZG9jdW1lbnRhdGlvbiBzdGF0ZXMgcG1fcnVudGltZV9zZXRf
YWN0aXZlKCkgc2hvdWxkIGJlIGNhbGxlZCBiZWZvcmUKPiA+IHBtX3J1bnRpbWVfZW5hYmxlKCku
IFRoZSBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpIGNvdWxkIHN1c3BlbmQgdGhlIEdQVQo+
ID4gYmVmb3JlIHBhbmZyb3N0X3BlcmZjbnRfaW5pdCgpIGlzIGNhbGxlZCB3aGljaCB0b3VjaGVz
IHRoZSBoL3cuIFRoZQo+ID4gYXV0b3N1c3BlbmQgZGVsYXkga2VlcHMgdGhpbmdzIGZyb20gYnJl
YWtpbmcuIFRoZXJlJ3Mgbm8gbmVlZCBleHBsaWNpdGx5Cj4gPiBwb3dlciBvZmYgdGhlIEdQVSBv
bmx5IHRvIHdha2UgYmFjayB1cCB3aXRoIHBtX3J1bnRpbWVfZ2V0X3N5bmMoKS4gSnVzdAo+ID4g
ZGVsYXlpbmcgcG1fcnVudGltZV9lbmFibGUgdG8gdGhlIGVuZCBvZiBwcm9iZSBpcyBzdWZmaWNp
ZW50Lgo+ID4KPiA+IExldHMgbW92ZSBhbGwgdGhlIHJ1bnRpbWUgUE0gY2FsbHMgaW50byB0aGUg
cHJvYmUoKSBmdW5jdGlvbiBzbyB0aGV5IGFyZQo+ID4gYWxsIGluIG9uZSBwbGFjZSBhbmQgYXJl
IGRvbmUgYWZ0ZXIgYWxsIGluaXRpYWxpemF0aW9uLgo+ID4KPiA+IENjOiBUb21ldSBWaXpvc28g
PHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgo+ID4gQ2M6IFN0ZXZlbiBQcmljZSA8c3RldmVu
LnByaWNlQGFybS5jb20+Cj4gPiBDYzogQWx5c3NhIFJvc2VuendlaWcgPGFseXNzYS5yb3Nlbnp3
ZWlnQGNvbGxhYm9yYS5jb20+Cj4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
Pgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+IHYyOiBuZXcgcGF0
Y2gKPiA+Cj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYyB8
ICA5IC0tLS0tLS0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2
LmMgICAgfCAxMCArKysrKystLS0tCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAxMyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2RldmljZS5jCj4gPiBpbmRleCA0ZGE3MWJiNTZjMjAuLjczODA1MjEwODM0ZSAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYwo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCj4gPiBA
QCAtNSw3ICs1LDYgQEAKPiA+ICAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgo+ID4gICAjaW5jbHVk
ZSA8bGludXgvcmVzZXQuaD4KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5o
Pgo+ID4gLSNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+Cj4gPiAgICNpbmNsdWRlIDxsaW51
eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4KPiA+Cj4gPiAgICNpbmNsdWRlICJwYW5mcm9zdF9kZXZp
Y2UuaCIKPiA+IEBAIC0xNjYsMTQgKzE2NSw2IEBAIGludCBwYW5mcm9zdF9kZXZpY2VfaW5pdChz
dHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKPiA+ICAgICAgIGlmIChlcnIpCj4gPiAgICAg
ICAgICAgICAgIGdvdG8gZXJyX291dDQ7Cj4gPgo+ID4gLSAgICAgLyogcnVudGltZSBQTSB3aWxs
IHdha2UgdXMgdXAgbGF0ZXIgKi8KPiA+IC0gICAgIHBhbmZyb3N0X2dwdV9wb3dlcl9vZmYocGZk
ZXYpOwo+ID4gLQo+ID4gLSAgICAgcG1fcnVudGltZV9zZXRfYWN0aXZlKHBmZGV2LT5kZXYpOwo+
ID4gLSAgICAgcG1fcnVudGltZV9nZXRfc3luYyhwZmRldi0+ZGV2KTsKPiA+IC0gICAgIHBtX3J1
bnRpbWVfbWFya19sYXN0X2J1c3kocGZkZXYtPmRldik7Cj4gPiAtICAgICBwbV9ydW50aW1lX3B1
dF9hdXRvc3VzcGVuZChwZmRldi0+ZGV2KTsKPiA+IC0KPiA+ICAgICAgIGVyciA9IHBhbmZyb3N0
X3BlcmZjbnRfaW5pdChwZmRldik7Cj4gPiAgICAgICBpZiAoZXJyKQo+ID4gICAgICAgICAgICAg
ICBnb3RvIGVycl9vdXQ1Owo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYu
Ywo+ID4gaW5kZXggZDc0NDQyZDcxMDQ4Li5mMjdlM2Q2YWVjMTIgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwo+ID4gQEAgLTUyMywxMCArNTIzLDYgQEAg
c3RhdGljIGludCBwYW5mcm9zdF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+
ID4gICAgICAgbXV0ZXhfaW5pdCgmcGZkZXYtPnNocmlua2VyX2xvY2spOwo+ID4gICAgICAgSU5J
VF9MSVNUX0hFQUQoJnBmZGV2LT5zaHJpbmtlcl9saXN0KTsKPiA+Cj4gPiAtICAgICBwbV9ydW50
aW1lX3VzZV9hdXRvc3VzcGVuZChwZmRldi0+ZGV2KTsKPiA+IC0gICAgIHBtX3J1bnRpbWVfc2V0
X2F1dG9zdXNwZW5kX2RlbGF5KHBmZGV2LT5kZXYsIDUwKTsgLyogfjMgZnJhbWVzICovCj4gPiAt
ICAgICBwbV9ydW50aW1lX2VuYWJsZShwZmRldi0+ZGV2KTsKPiA+IC0KPiA+ICAgICAgIGVyciA9
IHBhbmZyb3N0X2RldmljZV9pbml0KHBmZGV2KTsKPiA+ICAgICAgIGlmIChlcnIpIHsKPiA+ICAg
ICAgICAgICAgICAgaWYgKGVyciAhPSAtRVBST0JFX0RFRkVSKQo+ID4gQEAgLTU0MSw2ICs1Mzcs
MTIgQEAgc3RhdGljIGludCBwYW5mcm9zdF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+ID4gICAgICAgICAgICAgICBnb3RvIGVycl9vdXQxOwo+ID4gICAgICAgfQo+ID4KPiA+
ICsgICAgIHBtX3J1bnRpbWVfc2V0X2FjdGl2ZShwZmRldi0+ZGV2KTsKPiA+ICsgICAgIHBtX3J1
bnRpbWVfdXNlX2F1dG9zdXNwZW5kKHBmZGV2LT5kZXYpOwo+ID4gKyAgICAgcG1fcnVudGltZV9z
ZXRfYXV0b3N1c3BlbmRfZGVsYXkocGZkZXYtPmRldiwgMCk7IC8qIH4zIGZyYW1lcyAqLwo+Cj4g
SG1tLi4uIGRpZmZlcmVudCB0aW1lb3V0LCBzYW1lIGNvbW1lbnQgLSBzb21ldGhpbmcgc2VlbXMg
YW1pc3MgdGhlcmUsCj4gdW5sZXNzIHBlcmhhcHMgaXQncyBhbGwgd2l0aGluIHJvdW5kaW5nIGVy
cm9yIGFueXdheT8KCkxlZnRvdmVyIGRlYnVnZ2luZyB0byBmb3JjZSBpc3N1ZXMuIEl0IHNob3Vs
ZCBiZSA1MC4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
