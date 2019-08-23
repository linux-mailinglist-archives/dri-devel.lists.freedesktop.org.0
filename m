Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C369B2A0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 16:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D1C6ECB9;
	Fri, 23 Aug 2019 14:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 361136ECB9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 14:55:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A63D428;
 Fri, 23 Aug 2019 07:55:18 -0700 (PDT)
Received: from [10.1.31.94] (unknown [10.1.31.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E2463F718;
 Fri, 23 Aug 2019 07:55:16 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] drm/panfrost: Use mutex_trylock in
 panfrost_gem_purge
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190823021216.5862-1-robh@kernel.org>
 <20190823021216.5862-7-robh@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <753cef3d-6278-6f1e-7a26-aa7941269965@arm.com>
Date: Fri, 23 Aug 2019 15:55:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190823021216.5862-7-robh@kernel.org>
Content-Language: en-GB
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
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjMvMDgvMjAxOSAwMzoxMiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gTG9ja2RlcCByZXBvcnRz
IGEgY2lyY3VsYXIgbG9ja2luZyBkZXBlbmRlbmN5IHdpdGggcGFnZXNfbG9jayB0YWtlbiBpbgo+
IHRoZSBzaHJpbmtlciBjYWxsYmFjay4gVGhlIGRlYWRsb2NrIGNhbid0IGFjdHVhbGx5IGhhcHBl
biB3aXRoIGN1cnJlbnQKPiB1c2VycyBhdCBsZWFzdCBhcyBhIEJPIHdpbGwgbmV2ZXIgYmUgcHVy
Z2VhYmxlIHdoZW4gcGFnZXNfbG9jayBpcyBoZWxkLgo+IFRvIGJlIHNhZmUsIGxldCdzIHVzZSBt
dXRleF90cnlsb2NrKCkgaW5zdGVhZCBhbmQgYmFpbCBpZiBhIEJPIGlzIGxvY2tlZAo+IGFscmVh
ZHkuCj4gCj4gQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+Cj4g
Q2M6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cj4gQ2M6IEFseXNzYSBSb3Nl
bnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPgo+IENjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKUmV2aWV3
ZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cgo+IC0tLQo+IHYyOiBu
ZXcgcGF0Y2gKPiAKPiAgIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW1fc2hy
aW5rZXIuYyB8IDExICsrKysrKystLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfZ2VtX3Nocmlua2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZ2VtX3Nocmlua2VyLmMKPiBpbmRleCBkMTkxNjMyYjYxOTcuLjQ1OGYwZmE2ODEx
MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtX3No
cmlua2VyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtX3No
cmlua2VyLmMKPiBAQCAtMzYsMTUgKzM2LDE4IEBAIHBhbmZyb3N0X2dlbV9zaHJpbmtlcl9jb3Vu
dChzdHJ1Y3Qgc2hyaW5rZXIgKnNocmlua2VyLCBzdHJ1Y3Qgc2hyaW5rX2NvbnRyb2wgKnNjCj4g
ICAJcmV0dXJuIGNvdW50Owo+ICAgfQo+ICAgCj4gLXN0YXRpYyB2b2lkIHBhbmZyb3N0X2dlbV9w
dXJnZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKPiArc3RhdGljIGJvb2wgcGFuZnJvc3Rf
Z2VtX3B1cmdlKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQo+ICAgewo+ICAgCXN0cnVjdCBk
cm1fZ2VtX3NobWVtX29iamVjdCAqc2htZW0gPSB0b19kcm1fZ2VtX3NobWVtX29iaihvYmopOwo+
IC0JbXV0ZXhfbG9jaygmc2htZW0tPnBhZ2VzX2xvY2spOwo+ICsKPiArCWlmICghbXV0ZXhfdHJ5
bG9jaygmc2htZW0tPnBhZ2VzX2xvY2spKQo+ICsJCXJldHVybiBmYWxzZTsKPiAgIAo+ICAgCXBh
bmZyb3N0X21tdV91bm1hcCh0b19wYW5mcm9zdF9ibyhvYmopKTsKPiAgIAlkcm1fZ2VtX3NobWVt
X3B1cmdlX2xvY2tlZChvYmopOwo+ICAgCj4gICAJbXV0ZXhfdW5sb2NrKCZzaG1lbS0+cGFnZXNf
bG9jayk7Cj4gKwlyZXR1cm4gdHJ1ZTsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIHVuc2lnbmVkIGxv
bmcKPiBAQCAtNjEsOCArNjQsOCBAQCBwYW5mcm9zdF9nZW1fc2hyaW5rZXJfc2NhbihzdHJ1Y3Qg
c2hyaW5rZXIgKnNocmlua2VyLCBzdHJ1Y3Qgc2hyaW5rX2NvbnRyb2wgKnNjKQo+ICAgCWxpc3Rf
Zm9yX2VhY2hfZW50cnlfc2FmZShzaG1lbSwgdG1wLCAmcGZkZXYtPnNocmlua2VyX2xpc3QsIG1h
ZHZfbGlzdCkgewo+ICAgCQlpZiAoZnJlZWQgPj0gc2MtPm5yX3RvX3NjYW4pCj4gICAJCQlicmVh
azsKPiAtCQlpZiAoZHJtX2dlbV9zaG1lbV9pc19wdXJnZWFibGUoc2htZW0pKSB7Cj4gLQkJCXBh
bmZyb3N0X2dlbV9wdXJnZSgmc2htZW0tPmJhc2UpOwo+ICsJCWlmIChkcm1fZ2VtX3NobWVtX2lz
X3B1cmdlYWJsZShzaG1lbSkgJiYKPiArCQkgICAgcGFuZnJvc3RfZ2VtX3B1cmdlKCZzaG1lbS0+
YmFzZSkpIHsKPiAgIAkJCWZyZWVkICs9IHNobWVtLT5iYXNlLnNpemUgPj4gUEFHRV9TSElGVDsK
PiAgIAkJCWxpc3RfZGVsX2luaXQoJnNobWVtLT5tYWR2X2xpc3QpOwo+ICAgCQl9Cj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
