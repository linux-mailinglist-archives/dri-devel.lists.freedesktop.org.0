Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 931D4AB851
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 14:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF326E13A;
	Fri,  6 Sep 2019 12:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CA0E66E13A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 12:42:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 629511570;
 Fri,  6 Sep 2019 05:42:54 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77D963F718;
 Fri,  6 Sep 2019 05:42:53 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Prevent race when handling page fault
To: Rob Herring <robh@kernel.org>
References: <20190905121141.42820-1-steven.price@arm.com>
 <CAL_JsqKyKUBOK7+fSpr+ShjUz72oXC91ySOKCST9WyWjd0nqww@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <d0fb9ba9-d8af-1523-192c-23376e467f12@arm.com>
Date: Fri, 6 Sep 2019 13:42:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKyKUBOK7+fSpr+ShjUz72oXC91ySOKCST9WyWjd0nqww@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDYvMDkvMjAxOSAxMjoxMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVGh1LCBTZXAgNSwg
MjAxOSBhdCAxOjExIFBNIFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+IHdyb3Rl
Ogo+Pgo+PiBXaGVuIGhhbmRsaW5nIGEgR1BVIHBhZ2UgZmF1bHQgYWRkcl90b19kcm1fbW1fbm9k
ZSgpIGlzIHVzZWQgdG8KPj4gdHJhbnNsYXRlIHRoZSBHUFUgYWRkcmVzcyB0byBhIGJ1ZmZlciBv
YmplY3QuIEhvd2V2ZXIgaXQgaXMgcG9zc2libGUgZm9yCj4+IHRoZSBidWZmZXIgb2JqZWN0IHRv
IGJlIGZyZWVkIGFmdGVyIHRoZSBmdW5jdGlvbiBoYXMgcmV0dXJuZWQgcmVzdWx0aW5nCj4+IGlu
IGEgdXNlLWFmdGVyLWZyZWUgb2YgdGhlIEJPLgo+Pgo+PiBDaGFuZ2UgYWRkcl90b19kcm1fbW1f
bm9kZSB0byByZXR1cm4gdGhlIHBhbmZyb3N0X2dlbV9vYmplY3Qgd2l0aCBhbgo+PiBleHRyYSBy
ZWZlcmVuY2Ugb24gaXQsIHByZXZlbnRpbmcgdGhlIEJPIGZyb20gYmVpbmcgZnJlZWQgdW50aWwg
YWZ0ZXIKPj4gdGhlIHBhZ2UgZmF1bHQgaGFzIGJlZW4gaGFuZGxlZC4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KPj4gLS0tCj4+Cj4+IEkn
dmUgbWFuYWdlZCB0byB0cmlnZ2VyIHRoaXMsIGdlbmVyYXRpbmcgdGhlIGZvbGxvd2luZyBzdGFj
ayB0cmFjZS4KPiAKPiBIdW1tLCB0aGUgYXNzdW1wdGlvbiB3YXMgdGhhdCBhIGZhdWx0IGNvdWxk
IG9ubHkgaGFwcGVuIGR1cmluZyBhIGpvYgo+IGFuZCBzbyBhIHJlZmVyZW5jZSB3b3VsZCBhbHJl
YWR5IGJlIGhlbGQuIE90aGVyd2lzZSwgY291bGRuJ3QgdGhlIEdQVQo+IGFsc28gYmUgYWNjZXNz
aW5nIHRoZSBCTyBhZnRlciBpdCBpcyBmcmVlZD8KCkFoLCBJIGd1ZXNzIEkgbWlzc2VkIHRoYXQg
aW4gdGhlIGNvbW1pdCBtZXNzYWdlLiBUaGlzIGlzIGFzc3VtaW5nIHRoYXQKdXNlciBzcGFjZSBk
b2Vzbid0IGluY2x1ZGUgdGhlIEJPIGluIHRoZSBqb2IgZXZlbiB0aG91Z2ggdGhlIEdQVSB0aGVu
CmRvZXMgdHJ5IHRvIGFjY2VzcyBpdC4gQUlVSSBtZXNhIHdvdWxkbid0IGRvIHRoaXMsIGJ1dCB0
aGlzIGlzIHN0aWxsCmVhc2lseSBwb3NzaWJsZSBpZiB1c2VyIHNwYWNlIHdhbnRzIHRvIGNyYXNo
IHRoZSBrZXJuZWwuCgo+IEFsc28sIGxvb2tpbmcgYXQgdGhpcyBhZ2FpbiwgSSB0aGluayB3ZSBu
ZWVkIHRvIGhvbGQgdGhlIG1tX2xvY2sKPiBhcm91bmQgdGhlIGRybV9tbV9mb3JfZWFjaF9ub2Rl
KCkuCgpBaCwgZ29vZCBwb2ludC4gU3F1YXNoaW5nIGluIHRoZSBmb2xsb3dpbmcgc2hvdWxkIGRv
IHRoZSB0cmljazoKCi0tLS04PC0tLS0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9tbXUuYwpiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9t
bXUuYwppbmRleCBjY2M1MzZkMmU0ODkuLjQxZjI5N2FhMjU5YyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9tbXUuYwpAQCAtMzk2LDI2ICszOTYsMzMgQEAgc3RhdGljIHN0cnVj
dCBwYW5mcm9zdF9nZW1fb2JqZWN0ICoKIGFkZHJfdG9fZHJtX21tX25vZGUoc3RydWN0IHBhbmZy
b3N0X2RldmljZSAqcGZkZXYsIGludCBhcywgdTY0IGFkZHIpCiB7CiAJc3RydWN0IHBhbmZyb3N0
X2dlbV9vYmplY3QgKmJvID0gTlVMTDsKKwlzdHJ1Y3QgcGFuZnJvc3RfZmlsZV9wcml2ICpwcml2
OwogCXN0cnVjdCBkcm1fbW1fbm9kZSAqbm9kZTsKIAl1NjQgb2Zmc2V0ID0gYWRkciA+PiBQQUdF
X1NISUZUOwogCXN0cnVjdCBwYW5mcm9zdF9tbXUgKm1tdTsKCiAJc3Bpbl9sb2NrKCZwZmRldi0+
YXNfbG9jayk7CiAJbGlzdF9mb3JfZWFjaF9lbnRyeShtbXUsICZwZmRldi0+YXNfbHJ1X2xpc3Qs
IGxpc3QpIHsKLQkJc3RydWN0IHBhbmZyb3N0X2ZpbGVfcHJpdiAqcHJpdjsKLQkJaWYgKGFzICE9
IG1tdS0+YXMpCi0JCQljb250aW51ZTsKKwkJaWYgKGFzID09IG1tdS0+YXMpCisJCQlicmVhazsK
Kwl9CisJaWYgKGFzICE9IG1tdS0+YXMpCisJCWdvdG8gb3V0OwoKLQkJcHJpdiA9IGNvbnRhaW5l
cl9vZihtbXUsIHN0cnVjdCBwYW5mcm9zdF9maWxlX3ByaXYsIG1tdSk7Ci0JCWRybV9tbV9mb3Jf
ZWFjaF9ub2RlKG5vZGUsICZwcml2LT5tbSkgewotCQkJaWYgKG9mZnNldCA+PSBub2RlLT5zdGFy
dCAmJgotCQkJICAgIG9mZnNldCA8IChub2RlLT5zdGFydCArIG5vZGUtPnNpemUpKSB7Ci0JCQkJ
Ym8gPSBkcm1fbW1fbm9kZV90b19wYW5mcm9zdF9ibyhub2RlKTsKLQkJCQlkcm1fZ2VtX29iamVj
dF9nZXQoJmJvLT5iYXNlLmJhc2UpOwotCQkJCWdvdG8gb3V0OwotCQkJfQorCXByaXYgPSBjb250
YWluZXJfb2YobW11LCBzdHJ1Y3QgcGFuZnJvc3RfZmlsZV9wcml2LCBtbXUpOworCisJc3Bpbl9s
b2NrKCZwcml2LT5tbV9sb2NrKTsKKworCWRybV9tbV9mb3JfZWFjaF9ub2RlKG5vZGUsICZwcml2
LT5tbSkgeworCQlpZiAob2Zmc2V0ID49IG5vZGUtPnN0YXJ0ICYmCisJCQkJb2Zmc2V0IDwgKG5v
ZGUtPnN0YXJ0ICsgbm9kZS0+c2l6ZSkpIHsKKwkJCWJvID0gZHJtX21tX25vZGVfdG9fcGFuZnJv
c3RfYm8obm9kZSk7CisJCQlkcm1fZ2VtX29iamVjdF9nZXQoJmJvLT5iYXNlLmJhc2UpOworCQkJ
YnJlYWs7CiAJCX0KIAl9CisKKwlzcGluX3VubG9jaygmcHJpdi0+bW1fbG9jayk7CiBvdXQ6CiAJ
c3Bpbl91bmxvY2soJnBmZGV2LT5hc19sb2NrKTsKIAlyZXR1cm4gYm87Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
