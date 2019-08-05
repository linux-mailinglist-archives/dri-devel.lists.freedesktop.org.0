Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E08281D53
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 15:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D13D89C61;
	Mon,  5 Aug 2019 13:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978A489C61
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 13:32:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 06:32:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="373704380"
Received: from bwolny-mobl1.ger.corp.intel.com (HELO [10.252.38.76])
 ([10.252.38.76])
 by fmsmga006.fm.intel.com with ESMTP; 05 Aug 2019 06:32:20 -0700
Subject: Re: [PATCH] dma-buf: fix stack corruption in dma_fence_chain_release
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 david1.zhou@amd.com
References: <20190805073657.1389-1-christian.koenig@amd.com>
 <1ad7ef20-0207-7f80-ee12-ec98c1d5dfcb@intel.com>
 <af470fba-fb46-e0c4-caa0-220d6083ffc3@gmail.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <3fe2fe25-75f2-7461-8c33-01ffa1de29ba@intel.com>
Date: Mon, 5 Aug 2019 16:32:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <af470fba-fb46-e0c4-caa0-220d6083ffc3@gmail.com>
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

VGhhdCBvbmUgdGVzdCBjcmVhdGVzIGEgMzJrIGNoYWluIG9mIGZlbmNlcyBJIHRoaW5rLgpBbnl3
YXkgbXkga2VybmVsIGNyYXNoIHdhcyB1bnJlbGF0ZWQgOykKCi1MaW9uZWwKCk9uIDA1LzA4LzIw
MTkgMTY6MDIsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gTm90IGV2ZW4gcmVtb3RlbHkgOilJ
IHRlc3RlZCB0aGlzIHdpdGggbXkgb3duIGNyYWZ0ZWQgY29kZSBpbnNpZGUgdGhlIAo+IGtlcm5l
bC4KPgo+IEl0J3MgcHJvYmFibHkgcXVpdGUgc29tZSBoYXNzbGUgdG8gYWN0dWFsbHkgdHJpZ2dl
ciB0aGlzIHByb2JsZW0gZnJvbSAKPiB1c2Vyc3BhY2UgYW5kIEkgb25seSBmb3VuZCBpdCBiZWNh
dXNlIEkgY3JlYXRlZCBhIHZlcnkgdmVyeSBsb25nIAo+IHNlcXVlbmNlIGNoYWluIGJ5IGFjY2lk
ZW50Lgo+Cj4gQ2hyaXN0aWFuLgo+Cj4gQW0gMDUuMDguMTkgdW0gMTQ6MDMgc2NocmllYiBMaW9u
ZWwgTGFuZHdlcmxpbjoKPj4gQnkgYW55IGNoYW5nZSwgZGlkIHlvdSBydW4gaW50byB0aGlzIHdp
dGggYSBDVFMgdGVzdCB3aG9zZSBuYW1lIGVuZHMgCj4+IHdpdGggIi5jaGFpbiIgPyA6KQo+Pgo+
PiAtTGlvbmVsCj4+Cj4+IE9uIDA1LzA4LzIwMTkgMTA6MzYsIENocmlzdGlhbiBLw7ZuaWcgd3Jv
dGU6Cj4+PiBXZSBjYW4ndCBmcmVlIHVwIHRoZSBjaGFpbiB1c2luZyByZWN1cnNpb24gb3Igd2Ug
cnVuIGludG8gYSBzdGFjayAKPj4+IG92ZXJmbG93Lgo+Pj4KPj4+IE1hbnVhbGx5IGZyZWUgdXAg
dGhlIGRhbmdsaW5nIGNoYWluIG5vZGVzIHRvIGF2b2lkIHJlY3Vyc2lvbi4KPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+
PiAtLS0KPj4+IMKgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtY2hhaW4uYyB8IDI0ICsrKysr
KysrKysrKysrKysrKysrKysrLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2Rt
YS1mZW5jZS1jaGFpbi5jIAo+Pj4gYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWNoYWluLmMK
Pj4+IGluZGV4IGI1MDg5ZjY0YmUyYS4uNDRhNzQxNjc3ZDI1IDEwMDY0NAo+Pj4gLS0tIGEvZHJp
dmVycy9kbWEtYnVmL2RtYS1mZW5jZS1jaGFpbi5jCj4+PiArKysgYi9kcml2ZXJzL2RtYS1idWYv
ZG1hLWZlbmNlLWNoYWluLmMKPj4+IEBAIC0xNzgsOCArMTc4LDMwIEBAIHN0YXRpYyBib29sIGRt
YV9mZW5jZV9jaGFpbl9zaWduYWxlZChzdHJ1Y3QgCj4+PiBkbWFfZmVuY2UgKmZlbmNlKQo+Pj4g
wqAgc3RhdGljIHZvaWQgZG1hX2ZlbmNlX2NoYWluX3JlbGVhc2Uoc3RydWN0IGRtYV9mZW5jZSAq
ZmVuY2UpCj4+PiDCoCB7Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBkbWFfZmVuY2VfY2hhaW4gKmNo
YWluID0gdG9fZG1hX2ZlbmNlX2NoYWluKGZlbmNlKTsKPj4+ICvCoMKgwqAgc3RydWN0IGRtYV9m
ZW5jZSAqcHJldjsKPj4+ICsKPj4+ICvCoMKgwqAgLyogTWFudWFsbHkgdW5saW5rIHRoZSBjaGFp
biBhcyBtdWNoIGFzIHBvc3NpYmxlIHRvIGF2b2lkIAo+Pj4gcmVjdXJzaW9uCj4+PiArwqDCoMKg
wqAgKiBhbmQgcG90ZW50aWFsIHN0YWNrIG92ZXJmbG93Lgo+Pj4gK8KgwqDCoMKgICovCj4+PiAr
wqDCoMKgIHdoaWxlICgocHJldiA9IHJjdV9kZXJlZmVyZW5jZV9wcm90ZWN0ZWQoY2hhaW4tPnBy
ZXYsIHRydWUpKSkgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBkbWFfZmVuY2VfY2hhaW4g
KnByZXZfY2hhaW47Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGtyZWZfcmVhZCgmcHJl
di0+cmVmY291bnQpID4gMSkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFr
Owo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHByZXZfY2hhaW4gPSB0b19kbWFfZmVuY2VfY2hh
aW4ocHJldik7Cj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFwcmV2X2NoYWluKQo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqAgLyogTm8g
bmVlZCBmb3IgYXRvbWljIG9wZXJhdGlvbnMgc2luY2Ugd2UgaG9sZCB0aGUgbGFzdAo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqAgKiByZWZlcmVuY2UgdG8gcHJldl9jaGFpbi4KPj4+ICvCoMKgwqDCoMKg
wqDCoMKgICovCj4+PiArwqDCoMKgwqDCoMKgwqAgY2hhaW4tPnByZXYgPSBwcmV2X2NoYWluLT5w
cmV2Owo+Pj4gK8KgwqDCoMKgwqDCoMKgIFJDVV9JTklUX1BPSU5URVIocHJldl9jaGFpbi0+cHJl
diwgTlVMTCk7Cj4+PiArwqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3B1dChwcmV2KTsKPj4+ICvC
oMKgwqAgfQo+Pj4gK8KgwqDCoCBkbWFfZmVuY2VfcHV0KHByZXYpOwo+Pj4gwqAgLcKgwqDCoCBk
bWFfZmVuY2VfcHV0KHJjdV9kZXJlZmVyZW5jZV9wcm90ZWN0ZWQoY2hhaW4tPnByZXYsIHRydWUp
KTsKPj4+IMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3B1dChjaGFpbi0+ZmVuY2UpOwo+Pj4gwqDCoMKg
wqDCoCBkbWFfZmVuY2VfZnJlZShmZW5jZSk7Cj4+PiDCoCB9Cj4+Cj4+Cj4KPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
