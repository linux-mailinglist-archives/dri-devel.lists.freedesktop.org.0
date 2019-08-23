Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C92A9B271
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 16:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBBF6ECB3;
	Fri, 23 Aug 2019 14:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CEF536ECB3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 14:50:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BE421570;
 Fri, 23 Aug 2019 07:50:58 -0700 (PDT)
Received: from [10.1.31.94] (unknown [10.1.31.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 885F53F718;
 Fri, 23 Aug 2019 07:50:56 -0700 (PDT)
Subject: Re: [PATCH v2 3/8] drm/panfrost: Hold runtime PM reference until jobs
 complete
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190823021216.5862-1-robh@kernel.org>
 <20190823021216.5862-4-robh@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <2d4febdb-4db8-7e69-7798-9fea67c1cc8e@arm.com>
Date: Fri, 23 Aug 2019 15:50:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190823021216.5862-4-robh@kernel.org>
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

T24gMjMvMDgvMjAxOSAwMzoxMiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gRG9pbmcgYSBwbV9ydW50
aW1lX3B1dCBhcyBzb29uIGFzIGEgam9iIGlzIHN1Ym1pdHRlZCBpcyB3cm9uZyBhcyBpdCBzaG91
bGQKPiBub3QgaGFwcGVuIHVudGlsIHRoZSBqb2IgY29tcGxldGVzLiBJdCB3b3JrcyBiZWNhdXNl
IHdlIGFyZSByZWx5aW5nIG9uIHRoZQo+IGF1dG9zdXNwZW5kIHRpbWVvdXQgdG8ga2VlcCB0aGUg
aC93IGVuYWJsZWQuCj4gCj4gQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9y
YS5jb20+Cj4gQ2M6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cj4gQ2M6IEFs
eXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPgo+IENjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
PgoKTmljZSBmaW5kLCBidXQgSSdtIGEgYml0IHdvcnJpZWQgYWJvdXQgb25lIHRoaW5nLgoKPiAt
LS0KPiB2MjogbmV3IHBhdGNoCj4gCj4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3Rfam9iLmMgfCAxNiArKysrKysrKystLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3Rfam9iLmMKPiBpbmRleCAwNWM4NWY0NWEwZGUuLjgwYzljYWI5YTAxYiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKPiBAQCAtMTUxLDcgKzE1MSw3IEBA
IHN0YXRpYyB2b2lkIHBhbmZyb3N0X2pvYl9od19zdWJtaXQoc3RydWN0IHBhbmZyb3N0X2pvYiAq
am9iLCBpbnQganMpCj4gICAJCXJldHVybjsKPiAgIAo+ICAgCWlmIChXQVJOX09OKGpvYl9yZWFk
KHBmZGV2LCBKU19DT01NQU5EX05FWFQoanMpKSkpCj4gLQkJZ290byBlbmQ7Cj4gKwkJcmV0dXJu
Owo+ICAgCj4gICAJY2ZnID0gcGFuZnJvc3RfbW11X2FzX2dldChwZmRldiwgJmpvYi0+ZmlsZV9w
cml2LT5tbXUpOwo+ICAgCj4gQEAgLTE4NywxMCArMTg3LDYgQEAgc3RhdGljIHZvaWQgcGFuZnJv
c3Rfam9iX2h3X3N1Ym1pdChzdHJ1Y3QgcGFuZnJvc3Rfam9iICpqb2IsIGludCBqcykKPiAgIAlq
b2Jfd3JpdGUocGZkZXYsIEpTX0NPTU1BTkRfTkVYVChqcyksIEpTX0NPTU1BTkRfU1RBUlQpOwo+
ICAgCj4gICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmcGZkZXYtPmh3YWNjZXNzX2xvY2ssIGZs
YWdzKTsKPiAtCj4gLWVuZDoKPiAtCXBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3kocGZkZXYtPmRl
dik7Cj4gLQlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChwZmRldi0+ZGV2KTsKPiAgIH0KPiAg
IAo+ICAgc3RhdGljIHZvaWQgcGFuZnJvc3RfYWNxdWlyZV9vYmplY3RfZmVuY2VzKHN0cnVjdCBk
cm1fZ2VtX29iamVjdCAqKmJvcywKPiBAQCAtMzg4LDkgKzM4NCwxMyBAQCBzdGF0aWMgdm9pZCBw
YW5mcm9zdF9qb2JfdGltZWRvdXQoc3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pvYikKPiAg
IAo+ICAgCW11dGV4X2xvY2soJnBmZGV2LT5yZXNldF9sb2NrKTsKPiAgIAo+IC0JZm9yIChpID0g
MDsgaSA8IE5VTV9KT0JfU0xPVFM7IGkrKykKPiArCWZvciAoaSA9IDA7IGkgPCBOVU1fSk9CX1NM
T1RTOyBpKyspIHsKPiAgIAkJZHJtX3NjaGVkX3N0b3AoJnBmZGV2LT5qcy0+cXVldWVbaV0uc2No
ZWQsIHNjaGVkX2pvYik7Cj4gLQo+ICsJCWlmIChwZmRldi0+am9ic1tpXSkgewo+ICsJCQlwbV9y
dW50aW1lX3B1dF9ub2lkbGUocGZkZXYtPmRldik7Cj4gKwkJCXBmZGV2LT5qb2JzW2ldID0gTlVM
TDsKCkkgY2FuJ3Qgc2VlIHdoYXQgcHJldmVudHMgdGhpcyByYWNpbmcgd2l0aCBwYW5mcm9zdF9q
b2JfaXJxX2hhbmRsZXIoKSAtIAp0aGUgam9iIGNvdWxkIGJlIGNvbXBsZXRpbmcgYXQgdGhlIHNh
bWUgdGltZSBhcyB3ZSBhc3NpZ24gTlVMTC4gVGhlbiAKcGFuZnJvc3Rfam9iX2lycV9oYW5kbGVy
KCkgd2lsbCBoYXBwaWx5IGRlcmVmZXJlbmNlIHRoZSBOVUxMIHBvaW50ZXIuLi4KCkFkbWl0dGVk
bHkgdGhpcyBwYXRjaCBpcyBhbiBpbXByb3ZlbWVudCBvdmVyIHRoZSBzaXR1YXRpb24gYmVmb3Jl
IDopCgpTdGV2ZQoKPiArCQl9Cj4gKwl9Cj4gICAJaWYgKHNjaGVkX2pvYikKPiAgIAkJZHJtX3Nj
aGVkX2luY3JlYXNlX2thcm1hKHNjaGVkX2pvYik7Cj4gICAKPiBAQCAtNDU1LDcgKzQ1NSw5IEBA
IHN0YXRpYyBpcnFyZXR1cm5fdCBwYW5mcm9zdF9qb2JfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9p
ZCAqZGF0YSkKPiAgIAkJCXBmZGV2LT5qb2JzW2pdID0gTlVMTDsKPiAgIAkJCXBhbmZyb3N0X21t
dV9hc19wdXQocGZkZXYsICZqb2ItPmZpbGVfcHJpdi0+bW11KTsKPiAgIAkJCXBhbmZyb3N0X2Rl
dmZyZXFfcmVjb3JkX3RyYW5zaXRpb24ocGZkZXYsIGopOwo+ICsKPiAgIAkJCWRtYV9mZW5jZV9z
aWduYWwoam9iLT5kb25lX2ZlbmNlKTsKPiArCQkJcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQo
cGZkZXYtPmRldik7Cj4gICAJCX0KPiAgIAo+ICAgCQlzdGF0dXMgJj0gfm1hc2s7Cj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
