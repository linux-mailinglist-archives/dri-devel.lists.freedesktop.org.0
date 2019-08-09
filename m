Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 431E6875E9
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 11:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2DC6ED60;
	Fri,  9 Aug 2019 09:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060FB6ED3F;
 Fri,  9 Aug 2019 09:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 681CBFB03;
 Fri,  9 Aug 2019 11:28:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uFHu5MdeZ6tN; Fri,  9 Aug 2019 11:28:29 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id EDE7B4194F; Fri,  9 Aug 2019 11:28:28 +0200 (CEST)
Date: Fri, 9 Aug 2019 11:28:28 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 2/8] drm/etnaviv: split out cmdbuf mapping into
 address space
Message-ID: <20190809092828.GA2182@bogon.m.sigxcpu.org>
References: <20190705171727.27501-1-l.stach@pengutronix.de>
 <20190705171727.27501-2-l.stach@pengutronix.de>
 <20190808102625.GA4681@bogon.m.sigxcpu.org>
 <1565342233.2323.60.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565342233.2323.60.camel@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCk9uIEZyaSwgQXVnIDA5LCAyMDE5IGF0IDExOjE3OjEzQU0gKzAyMDAsIEx1Y2FzIFN0YWNo
IHdyb3RlOgo+IEFtIERvbm5lcnN0YWcsIGRlbiAwOC4wOC4yMDE5LCAxMjoyNiArMDIwMCBzY2hy
aWViIEd1aWRvIEfDvG50aGVyOgo+ID4gSGksCj4gPiBPbiBGcmksIEp1bCAwNSwgMjAxOSBhdCAw
NzoxNzoyMVBNICswMjAwLCBMdWNhcyBTdGFjaCB3cm90ZToKPiA+ID4gVGhpcyBhbGxvd3MgdG8g
ZGVjb3VwbGUgdGhlIGNtZGJ1ZiBzdWJhbGxvY2F0b3IgY3JlYXRlIGFuZCBtYXBwaW5nCj4gPiA+
IHRoZSByZWdpb24gaW50byB0aGUgR1BVIGFkZHJlc3Mgc3BhY2UuIEFsbG93aW5nIG11bHRpcGxl
IEFTIHRvIHNoYXJlCj4gPiA+IGEgc2luZ2xlIGNtZGJ1ZiBzdWJhbGxvYy4KPiA+ID4gCj4gPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4K
PiA+ID4gLS0tCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9idWZmZXIu
YyB8IDIzICsrKystLS0tCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9j
bWRidWYuYyB8IDM1ICsrKysrKy0tLS0tLQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2
L2V0bmF2aXZfY21kYnVmLmggfCAxMSArKystCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL2V0bmF2
aXYvZXRuYXZpdl9kdW1wLmPCoMKgwqB8wqDCoDYgKy0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0v
ZXRuYXZpdi9ldG5hdml2X2dwdS5jwqDCoMKgwqB8IDE5ICsrKysrLS0KPiA+ID4gwqBkcml2ZXJz
L2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5owqDCoMKgwqB8wqDCoDMgKy0KPiA+ID4gwqBk
cml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X21tdS5jwqDCoMKgwqB8IDcwICsrKysrKysr
KysrKysrKy0tLS0tLS0tLQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZf
bW11LmjCoMKgwqDCoHwgMTIgKystLQo+ID4gPiDCoDggZmlsZXMgY2hhbmdlZCwgMTE0IGluc2Vy
dGlvbnMoKyksIDY1IGRlbGV0aW9ucygtKQo+IFsuLi5dCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9ldG5hdml2L2V0bmF2aXZfY21kYnVmLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2V0bmF2aXYvZXRuYXZpdl9jbWRidWYuYwo+ID4gPiBAQCAtOCw2ICs4LDcgQEAKPiA+ID4gwqAj
aW5jbHVkZSA8ZHJtL2RybV9tbS5oPgo+ID4gPiDCoAo+ID4gPiDCoCNpbmNsdWRlICJldG5hdml2
X2NtZGJ1Zi5oIgo+ID4gPiArI2luY2x1ZGUgImV0bmF2aXZfZ2VtLmgiCj4gPiA+IMKgI2luY2x1
ZGUgImV0bmF2aXZfZ3B1LmgiCj4gPiA+IMKgI2luY2x1ZGUgImV0bmF2aXZfbW11LmgiCj4gPiA+
IMKgCj4gPiA+IEBAIC0yMSwxMCArMjIsNiBAQCBzdHJ1Y3QgZXRuYXZpdl9jbWRidWZfc3ViYWxs
b2Mgewo+ID4gPiA+ID4gwqAJdm9pZCAqdmFkZHI7Cj4gPiA+ID4gPiDCoAlkbWFfYWRkcl90IHBh
ZGRyOwo+ID4gPiDCoAo+ID4gPiA+ID4gLQkvKiBHUFUgbWFwcGluZyAqLwo+ID4gPiA+ID4gLQl1
MzIgaW92YTsKPiA+ID4gPiA+IC0Jc3RydWN0IGRybV9tbV9ub2RlIHZyYW1fbm9kZTsgLyogb25s
eSB1c2VkIG9uIE1NVXYyICovCj4gPiA+IC0KPiA+ID4gPiA+IMKgCS8qIGFsbG9jYXRpb24gbWFu
YWdlbWVudCAqLwo+ID4gPiA+ID4gwqAJc3RydWN0IG11dGV4IGxvY2s7Cj4gPiA+ID4gPiDCoAlE
RUNMQVJFX0JJVE1BUChncmFudWxlX21hcCwgU1VCQUxMT0NfR1JBTlVMRVMpOwo+ID4gPiBAQCAt
NTMsMjYgKzUwLDMxIEBAIGV0bmF2aXZfY21kYnVmX3N1YmFsbG9jX25ldyhzdHJ1Y3QgZXRuYXZp
dl9ncHUgKiBncHUpCj4gPiA+ID4gPiDCoAkJZ290byBmcmVlX3N1YmFsbG9jOwo+ID4gPiA+ID4g
wqAJfQo+ID4gPiDCoAo+ID4gPiA+ID4gLQlyZXQgPSBldG5hdml2X2lvbW11X2dldF9zdWJhbGxv
Y192YShncHUsIHN1YmFsbG9jLT5wYWRkciwKPiA+ID4gPiA+IC0JCQkJCcKgwqDCoMKgJnN1YmFs
bG9jLT52cmFtX25vZGUsIFNVQkFMTE9DX1NJWkUsCj4gPiA+ID4gPiAtCQkJCQnCoMKgwqDCoCZz
dWJhbGxvYy0+aW92YSk7Cj4gPiA+ID4gPiAtCWlmIChyZXQpCj4gPiA+ID4gPiAtCQlnb3RvIGZy
ZWVfZG1hOwo+ID4gPiAtCj4gPiAKPiA+IFRoaXMgcmVtb3ZlZCByZXQgYWxsIHJldCB1c2VzIGlu
IHRoYXQgZnVuY3Rpb24gc28gdGhlIGRlY2xhcmF0aW9uIG9mIHJldAo+ID4gY2FuIGJlIGRyb3Bw
ZWQgYXMgd2VsbC4KPiAKPiBBY3R1YWxseSwgbm8uIHJldCBpcyBzdGlsbCB1c2VkIGluIHRoZSBh
bGxvY2F0aW9uIGZhaWx1cmUgcGF0aC4KCllvdSdyZSByaWdodCwgd2hhdCBpIHdyb3RlIGlzIG9u
bHkgdHJ1ZSB3aXRob3V0IAoKICBkcm0vZXRuYXZpdjogZml4IGV0bmF2aXZfY21kYnVmX3N1YmFs
bG9jX25ldyByZXR1cm4gdmFsdWUKCndoaWNoIHNob3VsZCBnbyBpbiBiZWZvcmUgdGhpcy4KIC0t
IEd1aWRvCgoKPiAKPiBSZWdhcmRzLAo+IEx1Y2FzCj4gCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
