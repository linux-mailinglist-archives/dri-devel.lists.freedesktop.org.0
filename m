Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9230C9B316
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 17:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EF16ECC2;
	Fri, 23 Aug 2019 15:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792F76ECC2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 15:13:16 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 40975233A0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 15:13:16 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id 125so8450785qkl.6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 08:13:16 -0700 (PDT)
X-Gm-Message-State: APjAAAUvCvH2buVrH57scLwB8tT6M+7x9zrf//eZEPhrrh/pkqKt2Kp1
 dZAY56Dj0q0kKInhq/7Ya0jhzhpiBsOAQMLoZQ==
X-Google-Smtp-Source: APXvYqxTrXrewZKdAp0rr0K8uZK/8fuzubRe2+CSFPqpY68zx/bKg8WoipmthdeCmzYHZHYr5kT6QdkN7jXk+6NHR/Y=
X-Received: by 2002:a37:a010:: with SMTP id j16mr4603352qke.152.1566573195384; 
 Fri, 23 Aug 2019 08:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190823021216.5862-1-robh@kernel.org>
 <20190823021216.5862-4-robh@kernel.org>
 <2d4febdb-4db8-7e69-7798-9fea67c1cc8e@arm.com>
In-Reply-To: <2d4febdb-4db8-7e69-7798-9fea67c1cc8e@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 23 Aug 2019 10:13:03 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ3=Q3geTbE9thgroWMrJdqctoqRqF4hPzbVOLTowJUAQ@mail.gmail.com>
Message-ID: <CAL_JsqJ3=Q3geTbE9thgroWMrJdqctoqRqF4hPzbVOLTowJUAQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] drm/panfrost: Hold runtime PM reference until jobs
 complete
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566573196;
 bh=ONG15Jz1hbITzkk7o/bP83KiSEi2oriVltI66ktJ28g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=xP0O/J11VhJ2AJmN99Cr9XSYpPkVd5rR+eklulmBp7S71pOWz6rXCxMaydRpyihAe
 uZTT08lWKT2oBCyGzTRdr1HMih1DI43SXbGN4t4/B4s7M4W7SRlj2de0R/TxKIa0AA
 sw0tDJYuk0melGBmsUBPnG09zUFyRTf9zCrpQCdY=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgOTo1MCBBTSBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmlj
ZUBhcm0uY29tPiB3cm90ZToKPgo+IE9uIDIzLzA4LzIwMTkgMDM6MTIsIFJvYiBIZXJyaW5nIHdy
b3RlOgo+ID4gRG9pbmcgYSBwbV9ydW50aW1lX3B1dCBhcyBzb29uIGFzIGEgam9iIGlzIHN1Ym1p
dHRlZCBpcyB3cm9uZyBhcyBpdCBzaG91bGQKPiA+IG5vdCBoYXBwZW4gdW50aWwgdGhlIGpvYiBj
b21wbGV0ZXMuIEl0IHdvcmtzIGJlY2F1c2Ugd2UgYXJlIHJlbHlpbmcgb24gdGhlCj4gPiBhdXRv
c3VzcGVuZCB0aW1lb3V0IHRvIGtlZXAgdGhlIGgvdyBlbmFibGVkLgo+ID4KPiA+IENjOiBUb21l
dSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgo+ID4gQ2M6IFN0ZXZlbiBQcmlj
ZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cj4gPiBDYzogQWx5c3NhIFJvc2VuendlaWcgPGFseXNz
YS5yb3Nlbnp3ZWlnQGNvbGxhYm9yYS5jb20+Cj4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+IFNp
Z25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4KPiBOaWNlIGZpbmQs
IGJ1dCBJJ20gYSBiaXQgd29ycmllZCBhYm91dCBvbmUgdGhpbmcuCj4KPiA+IC0tLQo+ID4gdjI6
IG5ldyBwYXRjaAo+ID4KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pv
Yi5jIHwgMTYgKysrKysrKysrLS0tLS0tLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3Rfam9iLmMKPiA+IGluZGV4IDA1Yzg1ZjQ1YTBkZS4uODBjOWNhYjlhMDFiIDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKPiA+IEBAIC0xNTEsNyAr
MTUxLDcgQEAgc3RhdGljIHZvaWQgcGFuZnJvc3Rfam9iX2h3X3N1Ym1pdChzdHJ1Y3QgcGFuZnJv
c3Rfam9iICpqb2IsIGludCBqcykKPiA+ICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4KPiA+ICAg
ICAgIGlmIChXQVJOX09OKGpvYl9yZWFkKHBmZGV2LCBKU19DT01NQU5EX05FWFQoanMpKSkpCj4g
PiAtICAgICAgICAgICAgIGdvdG8gZW5kOwo+ID4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPgo+
ID4gICAgICAgY2ZnID0gcGFuZnJvc3RfbW11X2FzX2dldChwZmRldiwgJmpvYi0+ZmlsZV9wcml2
LT5tbXUpOwo+ID4KPiA+IEBAIC0xODcsMTAgKzE4Nyw2IEBAIHN0YXRpYyB2b2lkIHBhbmZyb3N0
X2pvYl9od19zdWJtaXQoc3RydWN0IHBhbmZyb3N0X2pvYiAqam9iLCBpbnQganMpCj4gPiAgICAg
ICBqb2Jfd3JpdGUocGZkZXYsIEpTX0NPTU1BTkRfTkVYVChqcyksIEpTX0NPTU1BTkRfU1RBUlQp
Owo+ID4KPiA+ICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnBmZGV2LT5od2FjY2Vzc19s
b2NrLCBmbGFncyk7Cj4gPiAtCj4gPiAtZW5kOgo+ID4gLSAgICAgcG1fcnVudGltZV9tYXJrX2xh
c3RfYnVzeShwZmRldi0+ZGV2KTsKPiA+IC0gICAgIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5k
KHBmZGV2LT5kZXYpOwo+ID4gICB9Cj4gPgo+ID4gICBzdGF0aWMgdm9pZCBwYW5mcm9zdF9hY3F1
aXJlX29iamVjdF9mZW5jZXMoc3RydWN0IGRybV9nZW1fb2JqZWN0ICoqYm9zLAo+ID4gQEAgLTM4
OCw5ICszODQsMTMgQEAgc3RhdGljIHZvaWQgcGFuZnJvc3Rfam9iX3RpbWVkb3V0KHN0cnVjdCBk
cm1fc2NoZWRfam9iICpzY2hlZF9qb2IpCj4gPgo+ID4gICAgICAgbXV0ZXhfbG9jaygmcGZkZXYt
PnJlc2V0X2xvY2spOwo+ID4KPiA+IC0gICAgIGZvciAoaSA9IDA7IGkgPCBOVU1fSk9CX1NMT1RT
OyBpKyspCj4gPiArICAgICBmb3IgKGkgPSAwOyBpIDwgTlVNX0pPQl9TTE9UUzsgaSsrKSB7Cj4g
PiAgICAgICAgICAgICAgIGRybV9zY2hlZF9zdG9wKCZwZmRldi0+anMtPnF1ZXVlW2ldLnNjaGVk
LCBzY2hlZF9qb2IpOwo+ID4gLQo+ID4gKyAgICAgICAgICAgICBpZiAocGZkZXYtPmpvYnNbaV0p
IHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBwbV9ydW50aW1lX3B1dF9ub2lkbGUocGZkZXYt
PmRldik7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcGZkZXYtPmpvYnNbaV0gPSBOVUxMOwo+
Cj4gSSBjYW4ndCBzZWUgd2hhdCBwcmV2ZW50cyB0aGlzIHJhY2luZyB3aXRoIHBhbmZyb3N0X2pv
Yl9pcnFfaGFuZGxlcigpIC0KPiB0aGUgam9iIGNvdWxkIGJlIGNvbXBsZXRpbmcgYXQgdGhlIHNh
bWUgdGltZSBhcyB3ZSBhc3NpZ24gTlVMTC4gVGhlbgo+IHBhbmZyb3N0X2pvYl9pcnFfaGFuZGxl
cigpIHdpbGwgaGFwcGlseSBkZXJlZmVyZW5jZSB0aGUgTlVMTCBwb2ludGVyLi4uCgpUaGUgZmFj
dCB0aGF0IDEgam9iJ3MgdGltZW91dCBoYW5kbGVyIGlzIGNsZWFuaW5nIHVwIGFsbCB0aGUgb3Ro
ZXIKam9icyBpcyBtZXNzeS4gSSdtIG5vdCBzdXJlIGlmIHRoZXJlJ3MgYSBiZXR0ZXIgd2F5Li4u
CgpXZSBjb3VsZCBwZXJoYXBzIGRpc2FibGUgdGhlIGpvYiBpbnRlcnJ1cHQgYXQgdGhlIGJlZ2lu
bmluZyB0aG91Z2ggSQp0aGluayB3ZSBjYW4gc3RpbGwgaGF2ZSBhIHJhY2UgYXMgd2UgY2FuJ3Qg
dXNlIGRpc2FibGVfaXJxKCkgd2l0aCBhCnNoYXJlZCBpcnEuIE9yIGRvIHRoaXMgYWZ0ZXIgdGhl
IHJlc2V0LgoKPiBBZG1pdHRlZGx5IHRoaXMgcGF0Y2ggaXMgYW4gaW1wcm92ZW1lbnQgb3ZlciB0
aGUgc2l0dWF0aW9uIGJlZm9yZSA6KQoKWWVzLCBhbmQgSSdkIGxpa2UgdG8gc3RvcCBkaWdnaW5n
IGEgZGVlcGVyIGhvbGUuLi4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
