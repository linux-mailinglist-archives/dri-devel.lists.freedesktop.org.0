Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C719A8D5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 09:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37B86EBD0;
	Fri, 23 Aug 2019 07:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF2066E4F1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 15:04:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C058E337;
 Thu, 22 Aug 2019 07:58:50 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64BD23F706;
 Thu, 22 Aug 2019 07:58:49 -0700 (PDT)
Subject: Re: [PATCH 4/4] drm/panfrost: Fix sleeping while atomic in
 panfrost_gem_open
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190819161204.3106-1-robh@kernel.org>
 <20190819161204.3106-5-robh@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <e578bbab-a235-84d0-34fa-e4d23ddfb02f@arm.com>
Date: Thu, 22 Aug 2019 15:58:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819161204.3106-5-robh@kernel.org>
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

T24gMTkvMDgvMjAxOSAxNzoxMiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gV2UgY2FuJ3QgaG9sZCB0
aGUgbW1fbG9jayBzcGlubG9jayBhcyBwYW5mcm9zdF9tbXVfbWFwKCkgY2FuIHNsZWVwOgo+IAo+
IEJVRzogc2xlZXBpbmcgZnVuY3Rpb24gY2FsbGVkIGZyb20gaW52YWxpZCBjb250ZXh0IGF0IGtl
cm5lbC9sb2NraW5nL211dGV4LmM6OTA5Cj4gaW5fYXRvbWljKCk6IDEsIGlycXNfZGlzYWJsZWQo
KTogMCwgcGlkOiA5NzQsIG5hbWU6IGdsbWFyazItZXMyLWRybQo+IDEgbG9jayBoZWxkIGJ5IGds
bWFyazItZXMyLWRybS85NzQ6Cj4gQ1BVOiA1IFBJRDogOTc0IENvbW06IGdsbWFyazItZXMyLWRy
bSBUYWludGVkOiBHICAgICAgICBXICAgIEwgICAgNS4zLjAtcmMxKyAjOTQKPiBIYXJkd2FyZSBu
YW1lOiA5NmJvYXJkcyBSb2NrOTYwIChEVCkKPiBDYWxsIHRyYWNlOgo+ICBkdW1wX2JhY2t0cmFj
ZSsweDAvMHgxMzAKPiAgc2hvd19zdGFjaysweDE0LzB4MjAKPiAgZHVtcF9zdGFjaysweGM0LzB4
MTBjCj4gIF9fX21pZ2h0X3NsZWVwKzB4MTU4LzB4MjI4Cj4gIF9fbWlnaHRfc2xlZXArMHg1MC8w
eDg4Cj4gIF9fbXV0ZXhfbG9jaysweDU4LzB4ODAwCj4gIG11dGV4X2xvY2tfaW50ZXJydXB0aWJs
ZV9uZXN0ZWQrMHgxYy8weDI4Cj4gIGRybV9nZW1fc2htZW1fZ2V0X3BhZ2VzKzB4MjQvMHhhMAo+
ICBkcm1fZ2VtX3NobWVtX2dldF9wYWdlc19zZ3QrMHg0OC8weGQwCj4gIHBhbmZyb3N0X21tdV9t
YXArMHgzOC8weGY4IFtwYW5mcm9zdF0KPiAgcGFuZnJvc3RfZ2VtX29wZW4rMHhjMC8weGQ4IFtw
YW5mcm9zdF0KPiAgZHJtX2dlbV9oYW5kbGVfY3JlYXRlX3RhaWwrMHhlOC8weDE5OAo+ICBkcm1f
Z2VtX2hhbmRsZV9jcmVhdGUrMHgzYy8weDUwCj4gIHBhbmZyb3N0X2dlbV9jcmVhdGVfd2l0aF9o
YW5kbGUrMHg3MC8weGEwIFtwYW5mcm9zdF0KPiAgcGFuZnJvc3RfaW9jdGxfY3JlYXRlX2JvKzB4
NDgvMHg4MCBbcGFuZnJvc3RdCj4gIGRybV9pb2N0bF9rZXJuZWwrMHhiOC8weDExMAo+ICBkcm1f
aW9jdGwrMHgyNDQvMHgzZjAKPiAgZG9fdmZzX2lvY3RsKzB4YmMvMHg5MTAKPiAga3N5c19pb2N0
bCsweDc4LzB4YTgKPiAgX19hcm02NF9zeXNfaW9jdGwrMHgxYy8weDI4Cj4gIGVsMF9zdmNfY29t
bW9uLmNvbnN0cHJvcC4wKzB4OTAvMHgxNjgKPiAgZWwwX3N2Y19oYW5kbGVyKzB4MjgvMHg3OAo+
ICBlbDBfc3ZjKzB4OC8weGMKPiAKPiBGaXhlczogNjgzMzdkMGI4NjQ0ICgiZHJtL3BhbmZyb3N0
OiBSZXN0cnVjdHVyZSB0aGUgR0VNIG9iamVjdCBjcmVhdGlvbiIpCj4gQ2M6IFRvbWV1IFZpem9z
byA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IFNpZ25l
ZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgpSZXZpZXdlZC1ieTogU3Rl
dmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9nZW0uYyB8IDEwICsrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2dlbS5jCj4gaW5kZXggZTA4NGJjNGU5MDgzLi5hY2IwN2ZlMDY1ODAg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5jCj4gQEAgLTY1LDE2
ICs2NSwxOCBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X2dlbV9vcGVuKHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqb2JqLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcAo+ICAJc3Bpbl9sb2NrKCZwcml2LT5t
bV9sb2NrKTsKPiAgCXJldCA9IGRybV9tbV9pbnNlcnRfbm9kZV9nZW5lcmljKCZwcml2LT5tbSwg
JmJvLT5ub2RlLAo+ICAJCQkJCSBzaXplID4+IFBBR0VfU0hJRlQsIGFsaWduLCBjb2xvciwgMCk7
Cj4gKwlzcGluX3VubG9jaygmcHJpdi0+bW1fbG9jayk7Cj4gIAlpZiAocmV0KQo+IC0JCWdvdG8g
b3V0Owo+ICsJCXJldHVybiByZXQ7Cj4gIAo+ICAJaWYgKCFiby0+aXNfaGVhcCkgewo+ICAJCXJl
dCA9IHBhbmZyb3N0X21tdV9tYXAoYm8pOwo+IC0JCWlmIChyZXQpCj4gKwkJaWYgKHJldCkgewo+
ICsJCQlzcGluX2xvY2soJnByaXYtPm1tX2xvY2spOwo+ICAJCQlkcm1fbW1fcmVtb3ZlX25vZGUo
JmJvLT5ub2RlKTsKPiArCQkJc3Bpbl91bmxvY2soJnByaXYtPm1tX2xvY2spOwo+ICsJCX0KPiAg
CX0KPiAtb3V0Ogo+IC0Jc3Bpbl91bmxvY2soJnByaXYtPm1tX2xvY2spOwo+ICAJcmV0dXJuIHJl
dDsKPiAgfQo+ICAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
