Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A6D2F51C4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 19:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852016E868;
	Wed, 13 Jan 2021 18:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDD06E868
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 18:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fxk8FC/4d2crn+3zm1zGej5xKLXNtBBzyvyv/Y3Jjb8=; b=P29jVlBJb8/tSoZzi9BTOby85f
 bfW7U+7Rk8+3nkjfYlZ+IWGlexj2XIrFSk4RvTlqqlY7opSjxaOVi3odBildZJSYehUIr6qkb70Zq
 c+M3qwENQMKQ+cr1TE6wSHm3SoUDR48RLar8YoFfteoH2my8PQCW1ob/ygZ25fHyb6nShBm9RyiJi
 VFu8Sece24kXgDbYwUl7Mp0xxBZkZ3aLQHIPUv9jsRt9JfmEgVrDNh6e11/hNfGzRPRlLuJT9a8ym
 0tKUKE1F0QT6onXJI+CXzNBsjuty84JiHIRNCM+IkLcwQg3MCE6LansyIbU2iwQiCgwMLKvBI38gy
 S73SNZ/w==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kzkgd-0006bW-Ju; Wed, 13 Jan 2021 20:16:03 +0200
Subject: Re: [PATCH v5 04/21] gpu: host1x: Remove cancelled waiters immediately
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-5-mperttunen@nvidia.com>
 <1c2c4a31-68a2-c938-fe65-6059d9889126@gmail.com>
 <1f98ce42-dc6b-299c-f55e-f6dd87b99cab@kapsi.fi>
 <b0a983a1-6379-1a27-5c8d-05fee58e696a@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <0711f02f-8995-50c7-736d-4a8669bad288@kapsi.fi>
Date: Wed, 13 Jan 2021 20:16:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b0a983a1-6379-1a27-5c8d-05fee58e696a@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMS8xMy8yMSA2OjI5IFBNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMTMuMDEuMjAyMSAw
MToyMCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+IE9uIDEvMTMvMjEgMTI6MDcgQU0s
IERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+IDExLjAxLjIwMjEgMTY6MDAsIE1pa2tvIFBlcnR0
dW5lbiDQv9C40YjQtdGCOgo+Pj4+IC12b2lkIGhvc3QxeF9pbnRyX3B1dF9yZWYoc3RydWN0IGhv
c3QxeCAqaG9zdCwgdW5zaWduZWQgaW50IGlkLCB2b2lkCj4+Pj4gKnJlZikKPj4+PiArdm9pZCBo
b3N0MXhfaW50cl9wdXRfcmVmKHN0cnVjdCBob3N0MXggKmhvc3QsIHVuc2lnbmVkIGludCBpZCwg
dm9pZAo+Pj4+ICpyZWYsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIGZsdXNo
KQo+Pj4+ICDCoCB7Cj4+Pj4gIMKgwqDCoMKgwqAgc3RydWN0IGhvc3QxeF93YWl0bGlzdCAqd2Fp
dGVyID0gcmVmOwo+Pj4+ICDCoMKgwqDCoMKgIHN0cnVjdCBob3N0MXhfc3luY3B0ICpzeW5jcHQ7
Cj4+Pj4gIMKgIC3CoMKgwqAgd2hpbGUgKGF0b21pY19jbXB4Y2hnKCZ3YWl0ZXItPnN0YXRlLCBX
TFNfUEVORElORywKPj4+PiBXTFNfQ0FOQ0VMTEVEKSA9PQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoCBXTFNfUkVNT1ZFRCkKPj4+PiAtwqDCoMKgwqDCoMKgwqAgc2NoZWR1bGUoKTsKPj4+PiAr
wqDCoMKgIGF0b21pY19jbXB4Y2hnKCZ3YWl0ZXItPnN0YXRlLCBXTFNfUEVORElORywgV0xTX0NB
TkNFTExFRCk7Cj4+Pj4gIMKgIMKgwqDCoMKgwqAgc3luY3B0ID0gaG9zdC0+c3luY3B0ICsgaWQ7
Cj4+Pj4gLcKgwqDCoCAodm9pZClwcm9jZXNzX3dhaXRfbGlzdChob3N0LCBzeW5jcHQsCj4+Pj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBob3N0MXhfc3luY3B0X2xvYWQoaG9zdC0+
c3luY3B0ICsgaWQpKTsKPj4+PiArCj4+Pj4gK8KgwqDCoCBzcGluX2xvY2soJnN5bmNwdC0+aW50
ci5sb2NrKTsKPj4+PiArwqDCoMKgIGlmIChhdG9taWNfY21weGNoZygmd2FpdGVyLT5zdGF0ZSwg
V0xTX0NBTkNFTExFRCwgV0xTX0hBTkRMRUQpID09Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIFdMU19D
QU5DRUxMRUQpIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgbGlzdF9kZWwoJndhaXRlci0+bGlzdCk7
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGtyZWZfcHV0KCZ3YWl0ZXItPnJlZmNvdW50LCB3YWl0ZXJf
cmVsZWFzZSk7Cj4+Pj4gK8KgwqDCoCB9Cj4+Pj4gK8KgwqDCoCBzcGluX3VubG9jaygmc3luY3B0
LT5pbnRyLmxvY2spOwo+Pj4+ICsKPj4+PiArwqDCoMKgIGlmIChmbHVzaCkgewo+Pj4+ICvCoMKg
wqDCoMKgwqDCoCAvKiBXYWl0IHVudGlsIGFueSBjb25jdXJyZW50bHkgZXhlY3V0aW5nIGhhbmRs
ZXIgaGFzCj4+Pj4gZmluaXNoZWQuICovCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHdoaWxlIChhdG9t
aWNfcmVhZCgmd2FpdGVyLT5zdGF0ZSkgIT0gV0xTX0hBTkRMRUQpCj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY3B1X3JlbGF4KCk7Cj4+Pj4gK8KgwqDCoCB9Cj4+Pgo+Pj4gQSBidXN5LWxv
b3Agc2hvdWxkbid0IGJlIHVzZWQgaW4ga2VybmVsIHVubGVzcyB0aGVyZSBpcyBhIHZlcnkgZ29v
ZAo+Pj4gcmVhc29uLiBUaGUgd2FpdF9ldmVudCgpIHNob3VsZCBiZSB1c2VkIGluc3RlYWQuCj4+
Pgo+Pj4gQnV0IHBsZWFzZSBkb24ndCBodXJyeSB0byB1cGRhdGUgdGhpcyBwYXRjaCwgd2UgbWF5
IG5lZWQgb3Igd2FudCB0bwo+Pj4gcmV0aXJlIHRoZSBob3N0MXgtd2FpdGVyIGFuZCB0aGVuIHRo
ZXNlIGFsbCB3YWl0ZXItcmVsYXRlZCBwYXRjaGVzIHdvbid0Cj4+PiBiZSBuZWVkZWQuCj4+Pgo+
Pgo+PiBZZXMsIHdlIHNob3VsZCBpbXByb3ZlIHRoZSBpbnRyIGNvZGUgdG8gcmVtb3ZlIGFsbCB0
aGlzIGNvbXBsZXhpdHkuIEJ1dAo+PiBsZXQncyBtZXJnZSB0aGlzIGZpcnN0IHRvIGdldCBhIGZ1
bmN0aW9uYWwgYmFzZWxpbmUgYW5kIGRvIGxhcmdlciBkZXNpZ24KPj4gY2hhbmdlcyBpbiBmb2xs
b3ctdXAgcGF0Y2hlcy4KPj4KPj4gSXQgaXMgY3VtYmVyc29tZSBmb3IgbWUgdG8gZGV2ZWxvcCBm
dXJ0aGVyIHNlcmllcyAob2Ygd2hpY2ggSSBoYXZlCj4+IHNldmVyYWwgdW5kZXIgd29yayBhbmQg
cGxhbm5pbmcpIHdpdGggdGhpcyBiYXNlbGluZSBzZXJpZXMgbm90IGJlaW5nCj4+IG1lcmdlZC4g
VGhlIHVuY2VydGFpbnR5IG9uIHRoZSBhcHByb3ZhbCBvZiB0aGUgVUFQSSBkZXNpZ24gYWxzbyBt
YWtlcyBpdAo+PiBoYXJkIHRvIGtub3cgd2hldGhlciBpdCBtYWtlcyBzZW5zZSBmb3IgbWUgdG8g
d29yayBvbiB0b3Agb2YgdGhpcyBjb2RlCj4+IG9yIG5vdCwgc28gSSdkIGxpa2UgdG8gZm9jdXMg
b24gd2hhdCdzIG5lZWRlZCB0byBnZXQgdGhpcyBtZXJnZWQgaW5zdGVhZAo+PiBvZiBmdXJ0aGVy
IHJlZGVzaWduIG9mIHRoZSBkcml2ZXIgYXQgdGhpcyB0aW1lLgo+IAo+IElzIHRoaXMgcGF0Y2gg
KGFuZCBzb21lIG90aGVycykgbmVjZXNzYXJ5IGZvciB0aGUgbmV3IFVBUEk/IElmIG5vdCwKPiBj
b3VsZCB3ZSBwbGVhc2UgbmFycm93IGRvd24gdGhlIHBhdGNoZXMgdG8gdGhlIG1pbmltdW0gdGhh
dCBpcyBuZWVkZWQKPiBmb3IgdHJ5aW5nIG91dCB0aGUgbmV3IFVBUEk/Cj4gCgpZZXMsIGl0IGlz
IG5lY2Vzc2FyeS4gSSB0cmllZCB0byByZXZlcnQgaXQgYW5kIGhhbGYgdGhlIHRlc3RzIGluIHRo
ZSAKdGVzdCBzdWl0ZSBzdGFydCBmYWlsaW5nLgoKSSB0aGluayBwYXRjaGVzIDAxLCAwMywgMTQg
YW5kIDE3IGFyZSBub3Qgc3RyaWN0bHkgcmVxdWlyZWQsIHRob3VnaCAKcmV2ZXJ0aW5nIDAzIHdp
bGwgY2F1c2Ugb25lIG9mIHRoZSBzeW5jcG9pbnQgdGVzdHMgdG8gZmFpbC4KCk1pa2tvCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
