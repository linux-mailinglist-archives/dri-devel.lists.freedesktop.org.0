Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AB210D70D
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 15:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C566E91E;
	Fri, 29 Nov 2019 14:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF636E91E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 14:33:15 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D7FA02923DA;
 Fri, 29 Nov 2019 14:33:13 +0000 (GMT)
Date: Fri, 29 Nov 2019 15:33:10 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 2/8] drm/panfrost: Fix a race in panfrost_ioctl_madvise()
Message-ID: <20191129153310.2f9c80e1@collabora.com>
In-Reply-To: <dd8a946c-5666-a7b8-f7bc-06647e0d0bbc@arm.com>
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
 <20191129135908.2439529-3-boris.brezillon@collabora.com>
 <dd8a946c-5666-a7b8-f7bc-06647e0d0bbc@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyOSBOb3YgMjAxOSAxNDoyNDo0OCArMDAwMApTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5w
cmljZUBhcm0uY29tPiB3cm90ZToKCj4gT24gMjkvMTEvMjAxOSAxMzo1OSwgQm9yaXMgQnJlemls
bG9uIHdyb3RlOgo+ID4gSWYgMiB0aHJlYWRzIGNoYW5nZSB0aGUgTUFEVklTRSBwcm9wZXJ0eSBv
ZiB0aGUgc2FtZSBCTyBpbiBwYXJhbGxlbCB3ZQo+ID4gbWlnaHQgZW5kIHVwIHdpdGggYW4gc2ht
ZW0tPm1hZHYgdmFsdWUgdGhhdCdzIGluY29uc2lzdGVudCB3aXRoIHRoZQo+ID4gcHJlc2VuY2Ug
b2YgdGhlIEJPIGluIHRoZSBzaHJpbmtlciBsaXN0LiAgCj4gCj4gSSdtIGEgYml0IHdvcnJpZWQg
ZnJvbSB0aGUgcG9pbnQgb2YgdmlldyBvZiB1c2VyIHNwYWNlIHNhbml0eSB0aGF0IHlvdQo+IG9i
c2VydmVkIHRoaXMgLSBidXQgY2xlYXJseSB0aGUga2VybmVsIHNob3VsZCBiZSByb2J1c3QhCgpJ
dCdzIG5vdCBzb21ldGhpbmcgSSBvYnNlcnZlZCwganVzdCBmb3VuZCB0aGUgcmFjZSBieSBpbnNw
ZWN0aW5nIHRoZQpjb2RlLCBhbmQgSSB0aG91Z2h0IGl0IHdhcyB3b3J0aCBmaXhpbmcgaXQuCgo+
IAo+ID4gCj4gPiBUaGUgZWFzaWVzdCBzb2x1dGlvbiB0byBmaXggdGhhdCBpcyB0byBwcm90ZWN0
IHRoZQo+ID4gZHJtX2dlbV9zaG1lbV9tYWR2aXNlKCkgY2FsbCB3aXRoIHRoZSBzaHJpbmtlciBs
b2NrLgo+ID4gCj4gPiBGaXhlczogMDEzYjY1MTAxMzE1ICgiZHJtL3BhbmZyb3N0OiBBZGQgbWFk
dmlzZSBhbmQgc2hyaW5rZXIgc3VwcG9ydCIpCj4gPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBj
b2xsYWJvcmEuY29tPiAgCj4gCj4gUmV2aWV3ZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnBy
aWNlQGFybS5jb20+CgpUaGFua3MuCgo+IAo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2Rydi5jIHwgOSArKysrLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2Rydi5jCj4gPiBpbmRleCBmMjFiYzhhN2VlM2EuLmVmYzBhMjRkMWY0
YyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYu
Ywo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCj4gPiBA
QCAtMzQ3LDIwICszNDcsMTkgQEAgc3RhdGljIGludCBwYW5mcm9zdF9pb2N0bF9tYWR2aXNlKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gPiAgCQlyZXR1cm4gLUVOT0VOVDsK
PiA+ICAJfQo+ID4gIAo+ID4gKwltdXRleF9sb2NrKCZwZmRldi0+c2hyaW5rZXJfbG9jayk7Cj4g
PiAgCWFyZ3MtPnJldGFpbmVkID0gZHJtX2dlbV9zaG1lbV9tYWR2aXNlKGdlbV9vYmosIGFyZ3Mt
Pm1hZHYpOwo+ID4gIAo+ID4gIAlpZiAoYXJncy0+cmV0YWluZWQpIHsKPiA+ICAJCXN0cnVjdCBw
YW5mcm9zdF9nZW1fb2JqZWN0ICpibyA9IHRvX3BhbmZyb3N0X2JvKGdlbV9vYmopOwo+ID4gIAo+
ID4gLQkJbXV0ZXhfbG9jaygmcGZkZXYtPnNocmlua2VyX2xvY2spOwo+ID4gLQo+ID4gIAkJaWYg
KGFyZ3MtPm1hZHYgPT0gUEFORlJPU1RfTUFEVl9ET05UTkVFRCkKPiA+IC0JCQlsaXN0X2FkZF90
YWlsKCZiby0+YmFzZS5tYWR2X2xpc3QsICZwZmRldi0+c2hyaW5rZXJfbGlzdCk7Cj4gPiArCQkJ
bGlzdF9hZGRfdGFpbCgmYm8tPmJhc2UubWFkdl9saXN0LAo+ID4gKwkJCQkgICAgICAmcGZkZXYt
PnNocmlua2VyX2xpc3QpOwo+ID4gIAkJZWxzZSBpZiAoYXJncy0+bWFkdiA9PSBQQU5GUk9TVF9N
QURWX1dJTExORUVEKQo+ID4gIAkJCWxpc3RfZGVsX2luaXQoJmJvLT5iYXNlLm1hZHZfbGlzdCk7
Cj4gPiAtCj4gPiAtCQltdXRleF91bmxvY2soJnBmZGV2LT5zaHJpbmtlcl9sb2NrKTsKPiA+ICAJ
fQo+ID4gKwltdXRleF91bmxvY2soJnBmZGV2LT5zaHJpbmtlcl9sb2NrKTsKPiA+ICAKPiA+ICAJ
ZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKGdlbV9vYmopOwo+ID4gIAlyZXR1cm4gMDsKPiA+
ICAgCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
