Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F709739D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 09:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81D56E92D;
	Wed, 21 Aug 2019 07:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F59C6E1BB;
 Wed, 21 Aug 2019 03:44:19 +0000 (UTC)
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=[192.168.1.17])
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i0HXi-0000zD-Ih; Wed, 21 Aug 2019 03:44:14 +0000
Subject: Re: [PATCH] drm/amd/display: Fix 32-bit divide error in
 wait_for_alt_mode
To: Nathan Chancellor <natechancellor@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>
References: <20190820235713.3429-1-natechancellor@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <fdb89dea-8da7-12af-fc73-aa3c13929e83@infradead.org>
Date: Tue, 20 Aug 2019 20:44:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820235713.3429-1-natechancellor@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:33:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mKEAQVe8pGeZG2unL0rDaPgFTJavZFuc/xTAFuOwVBE=; b=qkBxCppP0eq7zZvXrM0k7tNLaT
 KiYXt2hUP+V1+XDENHP5LdPNjJ6lDzjdcZwvIRdwFUJZSQTQl2trfzaXOH2uTVNlK2yBGJmDyPI++
 LcEkyb2sZoub5EvgflUfqufUQJcfAd/vvI6GrTdILYov7xeZQxD3ceyv4ZBvfz0RiZRbYslm87e2+
 Mu3CVD5KxG7U2EGL6KpD2/mBKKJX99ZIHP8WcCeD2ozCtdOmxUDzfHvh6AuJvbVdLd61q4DVwLCat
 8WqheE4qMG3np+1xCLI+Og6+EDCQgTrIYAn3F0zEJj/eGDqsF5qQ4H98BklKkCwH60J9OZkpBrB64
 Z11N/cBQ==;
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yMC8xOSA0OjU3IFBNLCBOYXRoYW4gQ2hhbmNlbGxvciB3cm90ZToKPiBXaGVuIGJ1aWxk
aW5nIGFybTMyIGFsbHllc2NvbmZpZzoKPiAKPiBsZC5sbGQ6IGVycm9yOiB1bmRlZmluZWQgc3lt
Ym9sOiBfX2FlYWJpX3VsZGl2bW9kCj4+Pj4gcmVmZXJlbmNlZCBieSBkY19saW5rLmMKPj4+PiBn
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5vOih3YWl0X2Zvcl9hbHRfbW9kZSkg
aW4gYXJjaGl2ZSBkcml2ZXJzL2J1aWx0LWluLmEKPj4+PiByZWZlcmVuY2VkIGJ5IGRjX2xpbmsu
Ywo+Pj4+IGdwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLm86KHdhaXRfZm9yX2Fs
dF9tb2RlKSBpbiBhcmNoaXZlIGRyaXZlcnMvYnVpbHQtaW4uYQo+IAo+IHRpbWVfdGFrZW5faW5f
bnMgaXMgb2YgdHlwZSB1bnNpZ25lZCBsb25nIGxvbmcgc28gd2UgbmVlZCB0byB1c2UgZGl2X3U2
NAo+IHRvIGF2b2lkIHRoaXMgZXJyb3IuCj4gCj4gRml4ZXM6IGI1YjFmNDU1NDkwNCAoImRybS9h
bWQvZGlzcGxheTogRW5hYmxlIHR5cGUgQyBob3RwbHVnIikKPiBSZXBvcnRlZC1ieTogUmFuZHkg
RHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogTmF0aGFuIENo
YW5jZWxsb3IgPG5hdGVjaGFuY2VsbG9yQGdtYWlsLmNvbT4KCkFja2VkLWJ5OiBSYW5keSBEdW5s
YXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4gIyBidWlsZC10ZXN0ZWQKClRoYW5rcy4KCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYyB8IDQgKyst
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5r
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKPiBpbmRl
eCBmMmQ3OGQ3YjA4OWUuLjg2MzQ5MjNiNDQ0NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKPiBAQCAtNzIxLDcgKzcyMSw3IEBAIGJvb2wg
d2FpdF9mb3JfYWx0X21vZGUoc3RydWN0IGRjX2xpbmsgKmxpbmspCj4gIAkJCXRpbWVfdGFrZW5f
aW5fbnMgPSBkbV9nZXRfZWxhcHNlX3RpbWVfaW5fbnMoCj4gIAkJCQlsaW5rLT5jdHgsIGZpbmlz
aF90aW1lc3RhbXAsIGVudGVyX3RpbWVzdGFtcCk7Cj4gIAkJCURDX0xPR19XQVJOSU5HKCJBbHQg
bW9kZSBlbnRlcmVkIGZpbmlzaGVkIGFmdGVyICVsbHUgbXNcbiIsCj4gLQkJCQkgICAgICAgdGlt
ZV90YWtlbl9pbl9ucyAvIDEwMDAwMDApOwo+ICsJCQkJICAgICAgIGRpdl91NjQodGltZV90YWtl
bl9pbl9ucywgMTAwMDAwMCkpOwo+ICAJCQlyZXR1cm4gdHJ1ZTsKPiAgCQl9Cj4gIAo+IEBAIC03
MzAsNyArNzMwLDcgQEAgYm9vbCB3YWl0X2Zvcl9hbHRfbW9kZShzdHJ1Y3QgZGNfbGluayAqbGlu
aykKPiAgCXRpbWVfdGFrZW5faW5fbnMgPSBkbV9nZXRfZWxhcHNlX3RpbWVfaW5fbnMobGluay0+
Y3R4LCBmaW5pc2hfdGltZXN0YW1wLAo+ICAJCQkJCQkgICAgZW50ZXJfdGltZXN0YW1wKTsKPiAg
CURDX0xPR19XQVJOSU5HKCJBbHQgbW9kZSBoYXMgdGltZWQgb3V0IGFmdGVyICVsbHUgbXNcbiIs
Cj4gLQkJCXRpbWVfdGFrZW5faW5fbnMgLyAxMDAwMDAwKTsKPiArCQkJZGl2X3U2NCh0aW1lX3Rh
a2VuX2luX25zLCAxMDAwMDAwKSk7Cj4gIAlyZXR1cm4gZmFsc2U7Cj4gIH0KPiAgCj4gCgoKLS0g
Cn5SYW5keQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
