Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1CE9A8CB
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 09:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364B06EBC3;
	Fri, 23 Aug 2019 07:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3BEFF6EB2B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 13:23:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8796E337;
 Thu, 22 Aug 2019 06:23:08 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81F743F706;
 Thu, 22 Aug 2019 06:23:07 -0700 (PDT)
Subject: Re: [PATCH 3/4] drm/panfrost: Fix shrinker lockdep issues using
 drm_gem_shmem_purge()
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190819161204.3106-1-robh@kernel.org>
 <20190819161204.3106-4-robh@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <fa5ccd7b-5619-1e8c-db2f-b3a705b13154@arm.com>
Date: Thu, 22 Aug 2019 14:23:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819161204.3106-4-robh@kernel.org>
Content-Language: en-GB
X-Mailman-Approved-At: Fri, 23 Aug 2019 07:30:43 +0000
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
 Boris Brezillon <boris.brezillon@collabora.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTkvMDgvMjAxOSAxNzoxMiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gVGhpcyBmaXhlcyAyIGlz
c3VlcyBmb3VuZCBieSBsb2NrZGVwLiBGaXJzdCwgZHJtX2dlbV9zaG1lbV9wdXJnZSgpCj4gbm93
IHVzZXMgbXV0ZXhfdHJ5bG9jayBmb3IgdGhlIHBhZ2VzX2xvY2sgdG8gYXZvaWQgYSBjaXJjdWxh
cgo+IGRlcGVuZGVuY3kuCgpOSVQ6IFRoaXMgaXMgaW4gdGhlIHByZXZpb3VzIHBhdGNoLgoKPiBT
ZWNvbmQsIGl0IGRyb3BzIHRoZSBjYWxsIHRvIHBhbmZyb3N0X21tdV91bm1hcCgpIHdoaWNoIHRh
a2VzIHNldmVyYWwKPiBsb2NrcyBkdWUgdG8gcnVudGltZSBQTSBjYWxscy4gVGhlIGNhbGwgaXMg
bm90IG5lY2Vzc2FyeSBiZWNhdXNlIHRoZQo+IHVubWFwcGluZyBpcyBhbHNvIGNhbGxlZCBpbiBw
YW5mcm9zdF9nZW1fY2xvc2UoKSBhbHJlYWR5LgoKSSBjb3VsZCBiZSBjb21wbGV0ZWx5IG1pc3Rh
a2VuIGhlcmUsIGJ1dCBkb24ndCB3ZSBuZWVkIHRvIHVubWFwIHRoZQptZW1vcnkgZnJvbSB0aGUg
R1BVIGhlcmUgYmVjYXVzZSB0aGUgYmFja2luZyBpcyBmcmVlPyBUaGUKcGFuZnJvc3RfZ2VtX2Ns
b3NlKCkgY2FsbCBjb3VsZCBjb21lIHNpZ25pZmljYW50bHkgbGF0ZXIsIGJ5IHdoaWNoIHRpbWUK
YSBtYWxpY2lvdXMgdXNlciBzcGFjZSBjb3VsZCBoYXZlIHJ1biBzb21lIGpvYnMgb24gdGhlIEdQ
VSB0byB0YWtlIGEKbG9vayBhdCB3aGF0IHRob3NlIG1hcHBpbmdzIG5vdyBwb2ludCB0byAocXVp
dGUgbGlrZWx5IHNvbWUgb3RoZXIKcHJvY2Vzc2VzIG1lbW9yeSkuCgpTbyB0aGlzIGxvb2tzIHRv
IG1lIGxpa2UgYSBjcmFmdHkgd2F5IG9mIG9ic2VydmluZyAncmFuZG9tJyBtZW1vcnkgaW4KdGhl
IHN5c3RlbS4KClN0ZXZlCgo+IEZpeGVzOiAwMTNiNjUxMDEzMTUgKCJkcm0vcGFuZnJvc3Q6IEFk
ZCBtYWR2aXNlIGFuZCBzaHJpbmtlciBzdXBwb3J0IikKPiBDYzogVG9tZXUgVml6b3NvIDx0b21l
dS52aXpvc29AY29sbGFib3JhLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gU2lnbmVkLW9mZi1i
eTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2dlbV9zaHJpbmtlci5jIHwgMTUgKystLS0tLS0tLS0tLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtX3Nocmlua2Vy
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtX3Nocmlua2VyLmMKPiBp
bmRleCBkMTkxNjMyYjYxOTcuLmNjMTUwMDVkYzY4ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtX3Nocmlua2VyLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtX3Nocmlua2VyLmMKPiBAQCAtMzYsMTcgKzM2LDYg
QEAgcGFuZnJvc3RfZ2VtX3Nocmlua2VyX2NvdW50KHN0cnVjdCBzaHJpbmtlciAqc2hyaW5rZXIs
IHN0cnVjdCBzaHJpbmtfY29udHJvbCAqc2MKPiAgCXJldHVybiBjb3VudDsKPiAgfQo+ICAKPiAt
c3RhdGljIHZvaWQgcGFuZnJvc3RfZ2VtX3B1cmdlKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2Jq
KQo+IC17Cj4gLQlzdHJ1Y3QgZHJtX2dlbV9zaG1lbV9vYmplY3QgKnNobWVtID0gdG9fZHJtX2dl
bV9zaG1lbV9vYmoob2JqKTsKPiAtCW11dGV4X2xvY2soJnNobWVtLT5wYWdlc19sb2NrKTsKPiAt
Cj4gLQlwYW5mcm9zdF9tbXVfdW5tYXAodG9fcGFuZnJvc3RfYm8ob2JqKSk7Cj4gLQlkcm1fZ2Vt
X3NobWVtX3B1cmdlX2xvY2tlZChvYmopOwo+IC0KPiAtCW11dGV4X3VubG9jaygmc2htZW0tPnBh
Z2VzX2xvY2spOwo+IC19Cj4gLQo+ICBzdGF0aWMgdW5zaWduZWQgbG9uZwo+ICBwYW5mcm9zdF9n
ZW1fc2hyaW5rZXJfc2NhbihzdHJ1Y3Qgc2hyaW5rZXIgKnNocmlua2VyLCBzdHJ1Y3Qgc2hyaW5r
X2NvbnRyb2wgKnNjKQo+ICB7Cj4gQEAgLTYxLDggKzUwLDggQEAgcGFuZnJvc3RfZ2VtX3Nocmlu
a2VyX3NjYW4oc3RydWN0IHNocmlua2VyICpzaHJpbmtlciwgc3RydWN0IHNocmlua19jb250cm9s
ICpzYykKPiAgCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShzaG1lbSwgdG1wLCAmcGZkZXYtPnNo
cmlua2VyX2xpc3QsIG1hZHZfbGlzdCkgewo+ICAJCWlmIChmcmVlZCA+PSBzYy0+bnJfdG9fc2Nh
bikKPiAgCQkJYnJlYWs7Cj4gLQkJaWYgKGRybV9nZW1fc2htZW1faXNfcHVyZ2VhYmxlKHNobWVt
KSkgewo+IC0JCQlwYW5mcm9zdF9nZW1fcHVyZ2UoJnNobWVtLT5iYXNlKTsKPiArCQlpZiAoZHJt
X2dlbV9zaG1lbV9pc19wdXJnZWFibGUoc2htZW0pICYmCj4gKwkJICAgIGRybV9nZW1fc2htZW1f
cHVyZ2UoJnNobWVtLT5iYXNlKSkgewo+ICAJCQlmcmVlZCArPSBzaG1lbS0+YmFzZS5zaXplID4+
IFBBR0VfU0hJRlQ7Cj4gIAkJCWxpc3RfZGVsX2luaXQoJnNobWVtLT5tYWR2X2xpc3QpOwo+ICAJ
CX0KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
