Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7888D287E50
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 23:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4489B6EB17;
	Thu,  8 Oct 2020 21:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78686EB17
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 21:49:04 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7f89430001>; Thu, 08 Oct 2020 14:48:51 -0700
Received: from [10.2.48.215] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Oct
 2020 21:49:03 +0000
Subject: Re: [PATCH 1/4] mm: introduce vma_set_file function v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <chris@chris-wilson.co.uk>,
 <airlied@redhat.com>, <akpm@linux-foundation.org>, <daniel@ffwll.ch>,
 <sumit.semwal@linaro.org>
References: <20201008112342.9394-1-christian.koenig@amd.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <b6b77e60-f93d-efe4-e267-983a2bdbbe71@nvidia.com>
Date: Thu, 8 Oct 2020 14:49:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201008112342.9394-1-christian.koenig@amd.com>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602193731; bh=7i3jZC1P+1sGlWP35B+/rJtJPgw2xaej/RUlAUDj20A=;
 h=Subject:To:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=lT3noPjN6nsazaxazrkTAZJXXDq9MU9e9CfYXSbXg8tSCVoorFGM7M/YNUCd42FT1
 dKH9AByZMwx2YXJQZ83lwCkaqFQWC0YvYb72NUHoCzveaWNranS7KsOFaeMzZWy/6E
 5FA2ekF8rcO0uhRvVWrbzMmRyHVliNxHzH1Fb166Kd05XkEfBR7t0cddAjnymHDbXa
 as1wSoVJUoD2zt85swdV8Nl4uYzpW/NZFRmJUKfoaSVqZndhrNIn8JS0NbNJMifnxt
 X8UwMogZrGtl7zMXYwFpjv6td0b4hP7ukBua0ValYvHsujD4xfCzvmvEgmO/MImwBb
 8l3Yz+o5Z5zjg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvOC8yMCA0OjIzIEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEFkZCB0aGUgbmV3
IHZtYV9zZXRfZmlsZSgpIGZ1bmN0aW9uIHRvIGFsbG93IGNoYW5naW5nCj4gdm1hLT52bV9maWxl
IHdpdGggdGhlIG5lY2Vzc2FyeSByZWZjb3VudCBkYW5jZS4KPiAKPiB2MjogYWRkIG1vcmUgdXNl
cnMgb2YgdGhpcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jICAg
ICAgICAgICAgICAgICAgfCAxNiArKysrKy0tLS0tLS0tLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0v
ZXRuYXZpdi9ldG5hdml2X2dlbS5jICAgICAgfCAgNCArLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9nZW0vaTkxNV9nZW1fZG1hYnVmLmMgfCAgMyArLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2dlbS9pOTE1X2dlbV9tbWFuLmMgICB8ICA0ICsrLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9t
c20vbXNtX2dlbS5jICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9v
bWFwZHJtL29tYXBfZ2VtLmMgICAgICAgICB8ICAzICstLQo+ICAgZHJpdmVycy9ncHUvZHJtL3Zn
ZW0vdmdlbV9kcnYuYyAgICAgICAgICAgIHwgIDMgKy0tCj4gICBkcml2ZXJzL3N0YWdpbmcvYW5k
cm9pZC9hc2htZW0uYyAgICAgICAgICAgfCAgNSArKy0tLQo+ICAgaW5jbHVkZS9saW51eC9tbS5o
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysKPiAgIG1tL21tYXAuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDE2ICsrKysrKysrKysrKysrKysKPiAgIDEwIGZpbGVz
IGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQoKTG9va3MgbGlrZSBh
IG5pY2UgY2xlYW51cC4gVHdvIGNvbW1lbnRzIGJlbG93LgoKLi4uCgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fbW1hbi5jIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ2VtL2k5MTVfZ2VtX21tYW4uYwo+IGluZGV4IDNkNjllNTFmM2U0ZC4uYzlkNWYxYTM4
YWYzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9tbWFu
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fbW1hbi5jCj4gQEAg
LTg5Myw4ICs4OTMsOCBAQCBpbnQgaTkxNV9nZW1fbW1hcChzdHJ1Y3QgZmlsZSAqZmlscCwgc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gICAJICogcmVxdWlyZXMgYXZvaWRpbmcgZXh0cmFu
ZW91cyByZWZlcmVuY2VzIHRvIHRoZWlyIGZpbHAsIGhlbmNlIHdoeQo+ICAgCSAqIHdlIHByZWZl
ciB0byB1c2UgYW4gYW5vbnltb3VzIGZpbGUgZm9yIHRoZWlyIG1tYXBzLgo+ICAgCSAqLwo+IC0J
ZnB1dCh2bWEtPnZtX2ZpbGUpOwo+IC0Jdm1hLT52bV9maWxlID0gYW5vbjsKPiArCXZtYV9zZXRf
ZmlsZSh2bWEsIGFub24pOwo+ICsJZnB1dChhbm9uKTsKClRoYXQncyBvbmUgZnB1dCgpIHRvbyBt
YW55LCBpc24ndCBpdD8KCi4uLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2FuZHJv
aWQvYXNobWVtLmMgYi9kcml2ZXJzL3N0YWdpbmcvYW5kcm9pZC9hc2htZW0uYwo+IGluZGV4IDEw
YjRiZTFmM2U3OC4uYTUxZGMwODk4OTZlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9h
bmRyb2lkL2FzaG1lbS5jCj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2FuZHJvaWQvYXNobWVtLmMK
PiBAQCAtNDUwLDkgKzQ1MCw4IEBAIHN0YXRpYyBpbnQgYXNobWVtX21tYXAoc3RydWN0IGZpbGUg
KmZpbGUsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICAgCQl2bWFfc2V0X2Fub255bW91
cyh2bWEpOwo+ICAgCX0KPiAgIAo+IC0JaWYgKHZtYS0+dm1fZmlsZSkKPiAtCQlmcHV0KHZtYS0+
dm1fZmlsZSk7Cj4gLQl2bWEtPnZtX2ZpbGUgPSBhc21hLT5maWxlOwo+ICsJdm1hX3NldF9maWxl
KHZtYSwgYXNtYS0+ZmlsZSk7Cj4gKwlmcHV0KGFzbWEtPmZpbGUpOwoKU2FtZSBoZXJlOiB0aGF0
IGZwdXQoKSBzZWVtcyB3cm9uZywgYXMgaXQgd2FzIGFscmVhZHkgZG9uZSB3aXRoaW4gdm1hX3Nl
dF9maWxlKCkuCgoKdGhhbmtzLAotLSAKSm9obiBIdWJiYXJkCk5WSURJQQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
