Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7333D70129
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 15:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F2E89C93;
	Mon, 22 Jul 2019 13:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931ED89C97;
 Mon, 22 Jul 2019 13:35:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 06:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="159880697"
Received: from unknown (HELO [10.252.50.208]) ([10.252.50.208])
 by orsmga007.jf.intel.com with ESMTP; 22 Jul 2019 06:35:25 -0700
Subject: Re: [PATCH] drm/syncobj: fix leaking dma_fence in
 drm_syncobj_query_ioctl
To: christian.koenig@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20190722125938.43308-1-christian.koenig@amd.com>
 <fb8e26b0-c3f0-d4c8-8375-ec21e2cebea3@intel.com>
 <a4c1c291-bff1-d7cb-f510-fdea63e1eb9b@gmail.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <dbcbce83-541a-417c-9e4d-321dcc812570@intel.com>
Date: Mon, 22 Jul 2019 16:35:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a4c1c291-bff1-d7cb-f510-fdea63e1eb9b@gmail.com>
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

T24gMjIvMDcvMjAxOSAxNjoyMSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAyMi4wNy4x
OSB1bSAxNToxNiBzY2hyaWViIExpb25lbCBMYW5kd2VybGluOgo+PiBPbiAyMi8wNy8yMDE5IDE1
OjU5LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4gV2UgbmVlZCB0byBjaGVjayB0aGUgY29u
dGV4dCBudW1iZXIgaW5zdGVhZCBpZiB0aGUgcHJldmlvdXMgc2VxdWVuY2UgCj4+PiB0byBkZXRl
Y3QKPj4+IGFuIGVycm9yIGFuZCBpZiBhbiBlcnJvciBpcyBkZXRlY3RlZCB3ZSBuZWVkIHRvIGRy
b3AgdGhlIHJlZmVyZW5jZSAKPj4+IHRvIHRoZQo+Pj4gY3VycmVudCBmZW5jZSBvciBvdGhlcndp
c2Ugd291bGQgbGVhayBpdC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+Cj4+IEZpeGVzOiAyN2I1NzVhOWFhMmYgKCJk
cm0vc3luY29iajogYWRkIHRpbWVsaW5lIHBheWxvYWQgcXVlcnkgaW9jdGwgdjYiKQo+PiBSZXZp
ZXdlZC1ieTogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29t
Pgo+Cj4gQ0Mgc3RhYmxlPyBJJ20gbm90IHN1cmUgd2hlbiB0aGlzIGdvdCB1cHN0cmVhbS4KPgo+
IENocmlzdGlhbi4KCgpJIHRob3VnaHQgaXQgd291bGQgZ2V0IHBpY2tlZCB1cCBhdXRvbWF0aWNh
bGx5IGZvciB0aGUgcmVsZXZhbnQgc3RhYmxlIAp2ZXJzaW9uIChhbmQgbm9uZSBpZiBpdCdzIG5v
dCB1cHN0cmVhbSB5ZXQpLgoKV2UgYWxzbyBoYXZlIHRvIGJlIG5pY2UgdG8gcGVvcGxlIGNoZXJy
eSBwaWNraW5nIHN0dWZmIGxpa2UgQ2hyb21lT1MuCgoKLUxpb25lbAoKCj4KPj4KPj4+IC0tLQo+
Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMgfCAxMCArKysrKy0tLS0tCj4+PiDC
oCAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4KPj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyAKPj4+IGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKPj4+IGluZGV4IDc1Y2I0YmI3NjE5ZS4uMTQzOGRjYjNl
YmIxIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKPj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCj4+PiBAQCAtMTI5OCwxNCArMTI5OCwx
NCBAQCBpbnQgZHJtX3N5bmNvYmpfcXVlcnlfaW9jdGwoc3RydWN0IAo+Pj4gZHJtX2RldmljZSAq
ZGV2LCB2b2lkICpkYXRhLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRt
YV9mZW5jZSAqaXRlciwgKmxhc3Rfc2lnbmFsZWQgPSBOVUxMOwo+Pj4gwqAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNlX2NoYWluX2Zvcl9lYWNoKGl0ZXIsIGZlbmNlKSB7Cj4+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghaXRlcikKPj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3B1dChsYXN0X3NpZ25hbGVkKTsKPj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFzdF9zaWduYWxlZCA9IGRtYV9mZW5jZV9nZXQo
aXRlcik7Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghdG9fZG1hX2Zl
bmNlX2NoYWluKGxhc3Rfc2lnbmFsZWQpLT5wcmV2X3NlcW5vKQo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiAoaXRlci0+Y29udGV4dCAhPSBmZW5jZS0+Y29udGV4dCkgewo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9wdXQo
aXRlcik7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyog
SXQgaXMgbW9zdCBsaWtlbHkgdGhhdCB0aW1lbGluZSBoYXMKPj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogdW5vcmRlciBwb2ludHMuICovCj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZG1hX2ZlbmNlX3B1dChsYXN0X3NpZ25hbGVkKTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbGFzdF9zaWduYWxlZCA9IGRtYV9mZW5jZV9nZXQoaXRlcik7Cj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBwb2ludCA9IGRtYV9mZW5jZV9pc19zaWduYWxlZChsYXN0X3NpZ25hbGVkKSA/Cj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxhc3Rfc2lnbmFsZWQtPnNlcW5vIDoKPj4K
Pj4KPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
