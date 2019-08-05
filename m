Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0C4818C4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 14:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC1D6E408;
	Mon,  5 Aug 2019 12:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBBB6E408
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 12:03:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 05:03:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; d="scan'208";a="181661532"
Received: from bwolny-mobl1.ger.corp.intel.com (HELO [10.252.38.76])
 ([10.252.38.76])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Aug 2019 05:03:51 -0700
Subject: Re: [PATCH] dma-buf: fix stack corruption in dma_fence_chain_release
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, david1.zhou@amd.com
References: <20190805073657.1389-1-christian.koenig@amd.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <1ad7ef20-0207-7f80-ee12-ec98c1d5dfcb@intel.com>
Date: Mon, 5 Aug 2019 15:03:50 +0300
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

QnkgYW55IGNoYW5nZSwgZGlkIHlvdSBydW4gaW50byB0aGlzIHdpdGggYSBDVFMgdGVzdCB3aG9z
ZSBuYW1lIGVuZHMgCndpdGggIi5jaGFpbiIgPyA6KQoKLUxpb25lbAoKT24gMDUvMDgvMjAxOSAx
MDozNiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBXZSBjYW4ndCBmcmVlIHVwIHRoZSBjaGFp
biB1c2luZyByZWN1cnNpb24gb3Igd2UgcnVuIGludG8gYSBzdGFjayBvdmVyZmxvdy4KPgo+IE1h
bnVhbGx5IGZyZWUgdXAgdGhlIGRhbmdsaW5nIGNoYWluIG5vZGVzIHRvIGF2b2lkIHJlY3Vyc2lv
bi4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtY2hhaW4uYyB8IDI0
ICsrKysrKysrKysrKysrKysrKysrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1h
LWZlbmNlLWNoYWluLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWNoYWluLmMKPiBpbmRl
eCBiNTA4OWY2NGJlMmEuLjQ0YTc0MTY3N2QyNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2RtYS1i
dWYvZG1hLWZlbmNlLWNoYWluLmMKPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWNo
YWluLmMKPiBAQCAtMTc4LDggKzE3OCwzMCBAQCBzdGF0aWMgYm9vbCBkbWFfZmVuY2VfY2hhaW5f
c2lnbmFsZWQoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UpCj4gICBzdGF0aWMgdm9pZCBkbWFfZmVu
Y2VfY2hhaW5fcmVsZWFzZShzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSkKPiAgIHsKPiAgIAlzdHJ1
Y3QgZG1hX2ZlbmNlX2NoYWluICpjaGFpbiA9IHRvX2RtYV9mZW5jZV9jaGFpbihmZW5jZSk7Cj4g
KwlzdHJ1Y3QgZG1hX2ZlbmNlICpwcmV2Owo+ICsKPiArCS8qIE1hbnVhbGx5IHVubGluayB0aGUg
Y2hhaW4gYXMgbXVjaCBhcyBwb3NzaWJsZSB0byBhdm9pZCByZWN1cnNpb24KPiArCSAqIGFuZCBw
b3RlbnRpYWwgc3RhY2sgb3ZlcmZsb3cuCj4gKwkgKi8KPiArCXdoaWxlICgocHJldiA9IHJjdV9k
ZXJlZmVyZW5jZV9wcm90ZWN0ZWQoY2hhaW4tPnByZXYsIHRydWUpKSkgewo+ICsJCXN0cnVjdCBk
bWFfZmVuY2VfY2hhaW4gKnByZXZfY2hhaW47Cj4gKwo+ICsJCWlmIChrcmVmX3JlYWQoJnByZXYt
PnJlZmNvdW50KSA+IDEpCj4gKwkJICAgICAgIGJyZWFrOwo+ICsKPiArCQlwcmV2X2NoYWluID0g
dG9fZG1hX2ZlbmNlX2NoYWluKHByZXYpOwo+ICsJCWlmICghcHJldl9jaGFpbikKPiArCQkJYnJl
YWs7Cj4gKwo+ICsJCS8qIE5vIG5lZWQgZm9yIGF0b21pYyBvcGVyYXRpb25zIHNpbmNlIHdlIGhv
bGQgdGhlIGxhc3QKPiArCQkgKiByZWZlcmVuY2UgdG8gcHJldl9jaGFpbi4KPiArCQkgKi8KPiAr
CQljaGFpbi0+cHJldiA9IHByZXZfY2hhaW4tPnByZXY7Cj4gKwkJUkNVX0lOSVRfUE9JTlRFUihw
cmV2X2NoYWluLT5wcmV2LCBOVUxMKTsKPiArCQlkbWFfZmVuY2VfcHV0KHByZXYpOwo+ICsJfQo+
ICsJZG1hX2ZlbmNlX3B1dChwcmV2KTsKPiAgIAo+IC0JZG1hX2ZlbmNlX3B1dChyY3VfZGVyZWZl
cmVuY2VfcHJvdGVjdGVkKGNoYWluLT5wcmV2LCB0cnVlKSk7Cj4gICAJZG1hX2ZlbmNlX3B1dChj
aGFpbi0+ZmVuY2UpOwo+ICAgCWRtYV9mZW5jZV9mcmVlKGZlbmNlKTsKPiAgIH0KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
