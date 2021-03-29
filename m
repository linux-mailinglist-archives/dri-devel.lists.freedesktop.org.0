Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CB434D9AA
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 23:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC68B89BF1;
	Mon, 29 Mar 2021 21:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CF989BF1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 21:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wy22N1jF4sTNLDcBhxcpPYwRlOEwjfqWBMSTIw0JZu8=; b=1p18iyOCT1MSwqxm/3/f8vPnjH
 I1epAs2IfB4Q7/GjpsJq1QZVw+5mVk6ICCeCOe9kLSxWoCxssTqrZ1eNf6Z4RouiAbryLcB9X9Jho
 gdjhFTGfhN1fhiBtQqrwuybCtGzUM6WkouhRyft6BzTOsGtP3kUpMwFPMigiXAkI3kgX2ldPRGdGU
 TGSdGs07ItRI3YTgaCOm7fppKDth6f9GI5m6iSPqx8nsI1gr/2MzGgUbGfXnpvDA0p8XvbuqnTfDN
 tA8Qf03V9Thazl6S6D8O/liFIwaZA9GwBI5q1WjFIKy+Sh4Jw2VYBquqK1cVmXRGNBjyLhQB8W3fY
 KLJ7ZHvw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1lQzYU-0001ey-NG; Tue, 30 Mar 2021 00:36:14 +0300
Subject: Re: [PATCH v6 04/10] gpu: host1x: Remove cancelled waiters immediately
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com
References: <20210329133836.2115236-1-mperttunen@nvidia.com>
 <20210329133836.2115236-5-mperttunen@nvidia.com>
 <85ddc9a2-1355-1e3b-f164-f907c7fdb67c@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <2b4342c4-ad68-5118-2887-351a62dee400@kapsi.fi>
Date: Tue, 30 Mar 2021 00:36:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <85ddc9a2-1355-1e3b-f164-f907c7fdb67c@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMy8yOS8yMSAxMToyNyBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDI5LjAzLjIwMjEg
MTY6MzgsIE1pa2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+PiBCZWZvcmUgdGhpcyBwYXRjaCwg
Y2FuY2VsbGVkIHdhaXRlcnMgd291bGQgb25seSBiZSBjbGVhbmVkIHVwCj4+IG9uY2UgdGhlaXIg
dGhyZXNob2xkIHZhbHVlIHdhcyByZWFjaGVkLiBNYWtlIGhvc3QxeF9pbnRyX3B1dF9yZWYKPj4g
cHJvY2VzcyB0aGUgY2FuY2VsbGF0aW9uIGltbWVkaWF0ZWx5IHRvIGZpeCB0aGlzLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBNaWtrbyBQZXJ0dHVuZW4gPG1wZXJ0dHVuZW5AbnZpZGlhLmNvbT4KPj4g
LS0tCj4+IHY2Ogo+PiAqIENhbGwgc2NoZWR1bGUgaW5zdGVhZCBvZiBjcHVfcmVsYXggd2hpbGUg
d2FpdGluZyBmb3IgcGVuZGluZwo+PiAgICBpbnRlcnJ1cHQgcHJvY2Vzc2luZwo+PiB2NToKPj4g
KiBBZGQgcGFyYW1ldGVyIHRvIGZsdXNoLCBpLmUuIHdhaXQgZm9yIGFsbCBwZW5kaW5nIHdhaXRl
cnMgdG8KPj4gICAgY29tcGxldGUgYmVmb3JlIHJldHVybmluZy4gVGhlIHJlYXNvbiB0aGlzIGlz
IG5vdCBhbHdheXMgdHJ1ZQo+PiAgICBpcyB0aGF0IHRoZSBwZW5kaW5nIHdhaXRlciBtaWdodCBi
ZSB0aGUgcGxhY2UgdGhhdCBpcyBjYWxsaW5nCj4+ICAgIHRoZSBwdXRfcmVmLgo+PiAtLS0KPj4g
ICBkcml2ZXJzL2dwdS9ob3N0MXgvaW50ci5jICAgfCAyMyArKysrKysrKysrKysrKysrKy0tLS0t
LQo+PiAgIGRyaXZlcnMvZ3B1L2hvc3QxeC9pbnRyLmggICB8ICA0ICsrKy0KPj4gICBkcml2ZXJz
L2dwdS9ob3N0MXgvc3luY3B0LmMgfCAgMiArLQo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgMjEgaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2hvc3QxeC9pbnRyLmMgYi9kcml2ZXJzL2dwdS9ob3N0MXgvaW50ci5jCj4+IGluZGV4IDkyNDVh
ZGQyM2I1ZC4uNjliMGU4ZTQxNDY2IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9ob3N0MXgv
aW50ci5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2hvc3QxeC9pbnRyLmMKPj4gQEAgLTI0MiwxOCAr
MjQyLDI5IEBAIGludCBob3N0MXhfaW50cl9hZGRfYWN0aW9uKHN0cnVjdCBob3N0MXggKmhvc3Qs
IHN0cnVjdCBob3N0MXhfc3luY3B0ICpzeW5jcHQsCj4+ICAgCXJldHVybiAwOwo+PiAgIH0KPj4g
ICAKPj4gLXZvaWQgaG9zdDF4X2ludHJfcHV0X3JlZihzdHJ1Y3QgaG9zdDF4ICpob3N0LCB1bnNp
Z25lZCBpbnQgaWQsIHZvaWQgKnJlZikKPj4gK3ZvaWQgaG9zdDF4X2ludHJfcHV0X3JlZihzdHJ1
Y3QgaG9zdDF4ICpob3N0LCB1bnNpZ25lZCBpbnQgaWQsIHZvaWQgKnJlZiwKPj4gKwkJCSBib29s
IGZsdXNoKQo+PiAgIHsKPj4gICAJc3RydWN0IGhvc3QxeF93YWl0bGlzdCAqd2FpdGVyID0gcmVm
Owo+PiAgIAlzdHJ1Y3QgaG9zdDF4X3N5bmNwdCAqc3luY3B0Owo+PiAgIAo+PiAtCXdoaWxlIChh
dG9taWNfY21weGNoZygmd2FpdGVyLT5zdGF0ZSwgV0xTX1BFTkRJTkcsIFdMU19DQU5DRUxMRUQp
ID09Cj4+IC0JICAgICAgIFdMU19SRU1PVkVEKQo+PiAtCQlzY2hlZHVsZSgpOwo+PiArCWF0b21p
Y19jbXB4Y2hnKCZ3YWl0ZXItPnN0YXRlLCBXTFNfUEVORElORywgV0xTX0NBTkNFTExFRCk7Cj4+
ICAgCj4+ICAgCXN5bmNwdCA9IGhvc3QtPnN5bmNwdCArIGlkOwo+PiAtCSh2b2lkKXByb2Nlc3Nf
d2FpdF9saXN0KGhvc3QsIHN5bmNwdCwKPj4gLQkJCQlob3N0MXhfc3luY3B0X2xvYWQoaG9zdC0+
c3luY3B0ICsgaWQpKTsKPj4gKwo+PiArCXNwaW5fbG9jaygmc3luY3B0LT5pbnRyLmxvY2spOwo+
PiArCWlmIChhdG9taWNfY21weGNoZygmd2FpdGVyLT5zdGF0ZSwgV0xTX0NBTkNFTExFRCwgV0xT
X0hBTkRMRUQpID09Cj4+ICsJICAgIFdMU19DQU5DRUxMRUQpIHsKPj4gKwkJbGlzdF9kZWwoJndh
aXRlci0+bGlzdCk7Cj4+ICsJCWtyZWZfcHV0KCZ3YWl0ZXItPnJlZmNvdW50LCB3YWl0ZXJfcmVs
ZWFzZSk7Cj4+ICsJfQo+PiArCXNwaW5fdW5sb2NrKCZzeW5jcHQtPmludHIubG9jayk7Cj4gCj4g
TG9va3MgbGlrZSB3ZSBuZWVkIHRvIHVzZSBJUlEtc2FmZSB2ZXJzaW9uIG9mIHRoZSBsb2NraW5n
IGhlcmUgaW4gb3JkZXIKPiBub3QgdG8gcmFjZSB3aXRoIHRoZSBpbnRlcnJ1cHQgaGFuZGxlcig/
KSwgcHJldmVudGluZyBsb2NrdXAuCgpUaGUgcG90ZW50aWFsIGNvbnRlbnRpb24gaXMgd2l0aCB0
aGUgc3luY3B0X3RocmVzaF93b3JrIHNjaGVkdWxlZCB3b3JrLCAKYW5kIG5vdCB0aGUgYWN0dWFs
IGludGVycnVwdCBoYW5kbGVyLCBzbyB0aGVyZSBpcyBubyBpc3N1ZS4KCj4gCj4gQnV0IHdoYXQg
cmVhbCBidWcgaXMgZml4ZWQgYnkgdGhpcyBwYXRjaD8gSWYgbm8gcmVhbCBwcm9ibGVtIGlzIGZp
eGVkLAo+IHRoZW4gbWF5YmUgd2lsbCBiZSBiZXR0ZXIgdG8gZGVmZXIgdG91Y2hpbmcgdGhpcyBj
b2RlIHRpbGwgd2Ugd2lsbCBqdXN0Cj4gcmVwbGFjZSBpdCBhbGwgd2l0aCBhIHByb3BlciBkbWEt
ZmVuY2UgaGFuZGxlcnM/Cj4gCgpJdCBpbXByb3ZlcyB0aGluZ3MgaW4gdGhhdCB3ZSB3b24ndCBs
aXR0ZXIgdGhlIHdhaXRlciBkYXRhIHN0cnVjdHVyZXMgCndpdGggdW5ib3VuZGVkIHdhaXRlciBl
bnRyaWVzIHdoZW4gd2FpdHMgYXJlIGNhbmNlbGxlZC4gQWxzbywgSSBwcmVmZXIgCndvcmtpbmcg
aW4gc3RlcHMgd2hlbiBwb3NzaWJsZSAtIG5leHQgaXMgd3JpdGluZyBkbWFfZmVuY2VzIG9uIHRv
cCBvZiAKdGhpcyAod2hpY2ggaXMgYWxyZWFkeSBkb25lKSBhbmQgdGhlbiBldmVudHVhbGx5IHBo
YXNpbmcvcmVmYWN0b3JpbmcgCmNvZGUgZnJvbSBpbnRyLmMgdG8gZmVuY2UuYyBzbyBldmVudHVh
bGx5IG9ubHkgZG1hX2ZlbmNlcyByZW1haW4uIEluIG15IApleHBlcmllbmNlIHRoYXQgd29ya3Mg
YmV0dGVyIHRoYW4gYmlnIHJld3JpdGVzLgoKTWlra28KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
