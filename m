Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D9B700BC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 15:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F1789C28;
	Mon, 22 Jul 2019 13:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D5089C28;
 Mon, 22 Jul 2019 13:16:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 06:16:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="159876180"
Received: from unknown (HELO [10.252.50.208]) ([10.252.50.208])
 by orsmga007.jf.intel.com with ESMTP; 22 Jul 2019 06:16:38 -0700
Subject: Re: [PATCH] drm/syncobj: fix leaking dma_fence in
 drm_syncobj_query_ioctl
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20190722125938.43308-1-christian.koenig@amd.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <fb8e26b0-c3f0-d4c8-8375-ec21e2cebea3@intel.com>
Date: Mon, 22 Jul 2019 16:16:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190722125938.43308-1-christian.koenig@amd.com>
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

T24gMjIvMDcvMjAxOSAxNTo1OSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBXZSBuZWVkIHRv
IGNoZWNrIHRoZSBjb250ZXh0IG51bWJlciBpbnN0ZWFkIGlmIHRoZSBwcmV2aW91cyBzZXF1ZW5j
ZSB0byBkZXRlY3QKPiBhbiBlcnJvciBhbmQgaWYgYW4gZXJyb3IgaXMgZGV0ZWN0ZWQgd2UgbmVl
ZCB0byBkcm9wIHRoZSByZWZlcmVuY2UgdG8gdGhlCj4gY3VycmVudCBmZW5jZSBvciBvdGhlcndp
c2Ugd291bGQgbGVhayBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCkZpeGVzOiAyN2I1NzVhOWFhMmYgKCJkcm0vc3luY29i
ajogYWRkIHRpbWVsaW5lIHBheWxvYWQgcXVlcnkgaW9jdGwgdjYiKQpSZXZpZXdlZC1ieTogTGlv
bmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPgoKPiAtLS0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIHwgMTAgKysrKystLS0tLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lu
Y29iai5jCj4gaW5kZXggNzVjYjRiYjc2MTllLi4xNDM4ZGNiM2ViYjEgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X3N5bmNvYmouYwo+IEBAIC0xMjk4LDE0ICsxMjk4LDE0IEBAIGludCBkcm1fc3luY29ial9xdWVy
eV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAo+ICAgCQkJc3RydWN0
IGRtYV9mZW5jZSAqaXRlciwgKmxhc3Rfc2lnbmFsZWQgPSBOVUxMOwo+ICAgCj4gICAJCQlkbWFf
ZmVuY2VfY2hhaW5fZm9yX2VhY2goaXRlciwgZmVuY2UpIHsKPiAtCQkJCWlmICghaXRlcikKPiAt
CQkJCQlicmVhazsKPiAtCQkJCWRtYV9mZW5jZV9wdXQobGFzdF9zaWduYWxlZCk7Cj4gLQkJCQls
YXN0X3NpZ25hbGVkID0gZG1hX2ZlbmNlX2dldChpdGVyKTsKPiAtCQkJCWlmICghdG9fZG1hX2Zl
bmNlX2NoYWluKGxhc3Rfc2lnbmFsZWQpLT5wcmV2X3NlcW5vKQo+ICsJCQkJaWYgKGl0ZXItPmNv
bnRleHQgIT0gZmVuY2UtPmNvbnRleHQpIHsKPiArCQkJCQlkbWFfZmVuY2VfcHV0KGl0ZXIpOwo+
ICAgCQkJCQkvKiBJdCBpcyBtb3N0IGxpa2VseSB0aGF0IHRpbWVsaW5lIGhhcwo+ICAgCQkJCQkg
KiB1bm9yZGVyIHBvaW50cy4gKi8KPiAgIAkJCQkJYnJlYWs7Cj4gKwkJCQl9Cj4gKwkJCQlkbWFf
ZmVuY2VfcHV0KGxhc3Rfc2lnbmFsZWQpOwo+ICsJCQkJbGFzdF9zaWduYWxlZCA9IGRtYV9mZW5j
ZV9nZXQoaXRlcik7Cj4gICAJCQl9Cj4gICAJCQlwb2ludCA9IGRtYV9mZW5jZV9pc19zaWduYWxl
ZChsYXN0X3NpZ25hbGVkKSA/Cj4gICAJCQkJbGFzdF9zaWduYWxlZC0+c2Vxbm8gOgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
