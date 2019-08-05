Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BC181421
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 10:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CD489D4F;
	Mon,  5 Aug 2019 08:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907B089D4F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 08:25:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 01:23:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; d="scan'208";a="167903165"
Received: from vkdasari-mobl.ger.corp.intel.com (HELO [10.252.35.94])
 ([10.252.35.94])
 by orsmga008.jf.intel.com with ESMTP; 05 Aug 2019 01:23:28 -0700
Subject: Re: [PATCH] dma-buf: fix stack corruption in dma_fence_chain_release
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, david1.zhou@amd.com
References: <20190805073657.1389-1-christian.koenig@amd.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <b72f9058-41f7-caed-ee58-173c374a640f@intel.com>
Date: Mon, 5 Aug 2019 11:23:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805073657.1389-1-christian.koenig@amd.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDUvMDgvMjAxOSAxMDozNiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBXZSBjYW4ndCBm
cmVlIHVwIHRoZSBjaGFpbiB1c2luZyByZWN1cnNpb24gb3Igd2UgcnVuIGludG8gYSBzdGFjayBv
dmVyZmxvdy4KPgo+IE1hbnVhbGx5IGZyZWUgdXAgdGhlIGRhbmdsaW5nIGNoYWluIG5vZGVzIHRv
IGF2b2lkIHJlY3Vyc2lvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCgpUaGF0IGRlZmluaXRlbHkgbWFrZXMgc2Vuc2UgdG8g
bWUsIGJ1dCBJJ20gbm90IGFuIGV4cGVydCBpbiBSQ1UgZm9vIDovCgoKQWNrZWQtYnk6IExpb25l
bCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4KCgpJIGd1ZXNzIHRo
aXMgZGVzZXJ2ZXMgYQoKCkZpeGVzOiA3YmY2MGM1MmUwICgiZG1hLWJ1ZjogYWRkIG5ldyBkbWFf
ZmVuY2VfY2hhaW4gY29udGFpbmVyIHY3IikKCgo+IC0tLQo+ICAgZHJpdmVycy9kbWEtYnVmL2Rt
YS1mZW5jZS1jaGFpbi5jIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKystCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtY2hhaW4uYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEt
ZmVuY2UtY2hhaW4uYwo+IGluZGV4IGI1MDg5ZjY0YmUyYS4uNDRhNzQxNjc3ZDI1IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtY2hhaW4uYwo+ICsrKyBiL2RyaXZlcnMv
ZG1hLWJ1Zi9kbWEtZmVuY2UtY2hhaW4uYwo+IEBAIC0xNzgsOCArMTc4LDMwIEBAIHN0YXRpYyBi
b29sIGRtYV9mZW5jZV9jaGFpbl9zaWduYWxlZChzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSkKPiAg
IHN0YXRpYyB2b2lkIGRtYV9mZW5jZV9jaGFpbl9yZWxlYXNlKHN0cnVjdCBkbWFfZmVuY2UgKmZl
bmNlKQo+ICAgewo+ICAgCXN0cnVjdCBkbWFfZmVuY2VfY2hhaW4gKmNoYWluID0gdG9fZG1hX2Zl
bmNlX2NoYWluKGZlbmNlKTsKPiArCXN0cnVjdCBkbWFfZmVuY2UgKnByZXY7Cj4gKwo+ICsJLyog
TWFudWFsbHkgdW5saW5rIHRoZSBjaGFpbiBhcyBtdWNoIGFzIHBvc3NpYmxlIHRvIGF2b2lkIHJl
Y3Vyc2lvbgo+ICsJICogYW5kIHBvdGVudGlhbCBzdGFjayBvdmVyZmxvdy4KPiArCSAqLwo+ICsJ
d2hpbGUgKChwcmV2ID0gcmN1X2RlcmVmZXJlbmNlX3Byb3RlY3RlZChjaGFpbi0+cHJldiwgdHJ1
ZSkpKSB7Cj4gKwkJc3RydWN0IGRtYV9mZW5jZV9jaGFpbiAqcHJldl9jaGFpbjsKPiArCj4gKwkJ
aWYgKGtyZWZfcmVhZCgmcHJldi0+cmVmY291bnQpID4gMSkKPiArCQkgICAgICAgYnJlYWs7Cj4g
Kwo+ICsJCXByZXZfY2hhaW4gPSB0b19kbWFfZmVuY2VfY2hhaW4ocHJldik7Cj4gKwkJaWYgKCFw
cmV2X2NoYWluKQo+ICsJCQlicmVhazsKPiArCj4gKwkJLyogTm8gbmVlZCBmb3IgYXRvbWljIG9w
ZXJhdGlvbnMgc2luY2Ugd2UgaG9sZCB0aGUgbGFzdAo+ICsJCSAqIHJlZmVyZW5jZSB0byBwcmV2
X2NoYWluLgo+ICsJCSAqLwo+ICsJCWNoYWluLT5wcmV2ID0gcHJldl9jaGFpbi0+cHJldjsKPiAr
CQlSQ1VfSU5JVF9QT0lOVEVSKHByZXZfY2hhaW4tPnByZXYsIE5VTEwpOwo+ICsJCWRtYV9mZW5j
ZV9wdXQocHJldik7Cj4gKwl9Cj4gKwlkbWFfZmVuY2VfcHV0KHByZXYpOwo+ICAgCj4gLQlkbWFf
ZmVuY2VfcHV0KHJjdV9kZXJlZmVyZW5jZV9wcm90ZWN0ZWQoY2hhaW4tPnByZXYsIHRydWUpKTsK
PiAgIAlkbWFfZmVuY2VfcHV0KGNoYWluLT5mZW5jZSk7Cj4gICAJZG1hX2ZlbmNlX2ZyZWUoZmVu
Y2UpOwo+ICAgfQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
