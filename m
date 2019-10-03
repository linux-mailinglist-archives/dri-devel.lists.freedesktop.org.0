Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 811D1C9E41
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 14:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE456E10F;
	Thu,  3 Oct 2019 12:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C98B6E10F;
 Thu,  3 Oct 2019 12:20:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 05:20:07 -0700
X-IronPort-AV: E=Sophos;i="5.67,252,1566889200"; d="scan'208";a="191253193"
Received: from paaron-mobl.ger.corp.intel.com (HELO [10.251.93.134])
 ([10.251.93.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/AES256-SHA;
 03 Oct 2019 05:20:07 -0700
Subject: Re: [Intel-gfx] [PATCH] dma-fence: Use non-atomic bitops while under
 the lock
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
References: <20191003101247.809-1-tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <994d2663-65d7-3351-3997-5a995e27d9f4@linux.intel.com>
Date: Thu, 3 Oct 2019 13:20:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003101247.809-1-tvrtko.ursulin@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDAzLzEwLzIwMTkgMTE6MTIsIFR2cnRrbyBVcnN1bGluIHdyb3RlOgo+IEZyb206IFR2cnRr
byBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Cj4gCj4gV2UgZG8gbm90IGhhdmUg
dG8gdXNlIGF0b21pYyBiaXRvcHMgd2hlbiBhbHJlYWR5IHVuZGVyIHRoZSBzcGlubG9jay4KPiAK
PiBTYXZlcyBvbiBhIGhhbmRmdWwgb2YgbG9jayBpbnN0cnVjdGlvbiBwcmVmaXhlcywgb24geDg2
IGF0IGxlYXN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJz
dWxpbkBpbnRlbC5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBD
YzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gLS0tCj4gICBkcml2
ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgfCAxNCArKysrKysrLS0tLS0tLQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5j
Cj4gaW5kZXggMmMxMzZhZWUzZTc5Li5mMGI0ODAwNDJlMmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9kbWEtYnVmL2RtYS1mZW5jZS5jCj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5j
Cj4gQEAgLTEzMywxNSArMTMzLDE1IEBAIGludCBkbWFfZmVuY2Vfc2lnbmFsX2xvY2tlZChzdHJ1
Y3QgZG1hX2ZlbmNlICpmZW5jZSkKPiAgIAo+ICAgCWxvY2tkZXBfYXNzZXJ0X2hlbGQoZmVuY2Ut
PmxvY2spOwo+ICAgCj4gLQlpZiAodW5saWtlbHkodGVzdF9hbmRfc2V0X2JpdChETUFfRkVOQ0Vf
RkxBR19TSUdOQUxFRF9CSVQsCj4gLQkJCQkgICAgICAmZmVuY2UtPmZsYWdzKSkpCj4gKwlpZiAo
dW5saWtlbHkoX190ZXN0X2FuZF9zZXRfYml0KERNQV9GRU5DRV9GTEFHX1NJR05BTEVEX0JJVCwK
PiArCQkJCQkmZmVuY2UtPmZsYWdzKSkpCgpUaGlzIGJyZWFrcyBsZWZ0IHJpZ2h0IGFuZCBjZW50
ZXIgc28gSSBndWVzcyBpdCBpcyBtb3JlIHN1YnRsZSB0aGFuIHRoaXMhCgpSZWdhcmRzLAoKVHZy
dGtvCgo+ICAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgIAo+ICAgCS8qIFN0YXNoIHRoZSBjYl9saXN0
IGJlZm9yZSByZXBsYWNpbmcgaXQgd2l0aCB0aGUgdGltZXN0YW1wICovCj4gICAJbGlzdF9yZXBs
YWNlKCZmZW5jZS0+Y2JfbGlzdCwgJmNiX2xpc3QpOwo+ICAgCj4gICAJZmVuY2UtPnRpbWVzdGFt
cCA9IGt0aW1lX2dldCgpOwo+IC0Jc2V0X2JpdChETUFfRkVOQ0VfRkxBR19USU1FU1RBTVBfQklU
LCAmZmVuY2UtPmZsYWdzKTsKPiArCV9fc2V0X2JpdChETUFfRkVOQ0VfRkxBR19USU1FU1RBTVBf
QklULCAmZmVuY2UtPmZsYWdzKTsKPiAgIAl0cmFjZV9kbWFfZmVuY2Vfc2lnbmFsZWQoZmVuY2Up
Owo+ICAgCj4gICAJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGN1ciwgdG1wLCAmY2JfbGlzdCwg
bm9kZSkgewo+IEBAIC0zNDMsOCArMzQzLDggQEAgaW50IGRtYV9mZW5jZV9hZGRfY2FsbGJhY2so
c3RydWN0IGRtYV9mZW5jZSAqZmVuY2UsIHN0cnVjdCBkbWFfZmVuY2VfY2IgKmNiLAo+ICAgCj4g
ICAJc3Bpbl9sb2NrX2lycXNhdmUoZmVuY2UtPmxvY2ssIGZsYWdzKTsKPiAgIAo+IC0Jd2FzX3Nl
dCA9IHRlc3RfYW5kX3NldF9iaXQoRE1BX0ZFTkNFX0ZMQUdfRU5BQkxFX1NJR05BTF9CSVQsCj4g
LQkJCQkgICAmZmVuY2UtPmZsYWdzKTsKPiArCXdhc19zZXQgPSBfX3Rlc3RfYW5kX3NldF9iaXQo
RE1BX0ZFTkNFX0ZMQUdfRU5BQkxFX1NJR05BTF9CSVQsCj4gKwkJCQkgICAgICZmZW5jZS0+Zmxh
Z3MpOwo+ICAgCj4gICAJaWYgKHRlc3RfYml0KERNQV9GRU5DRV9GTEFHX1NJR05BTEVEX0JJVCwg
JmZlbmNlLT5mbGFncykpCj4gICAJCXJldCA9IC1FTk9FTlQ7Cj4gQEAgLTQ3Myw4ICs0NzMsOCBA
QCBkbWFfZmVuY2VfZGVmYXVsdF93YWl0KHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlLCBib29sIGlu
dHIsIHNpZ25lZCBsb25nIHRpbWVvdXQpCj4gICAJCWdvdG8gb3V0Owo+ICAgCX0KPiAgIAo+IC0J
d2FzX3NldCA9IHRlc3RfYW5kX3NldF9iaXQoRE1BX0ZFTkNFX0ZMQUdfRU5BQkxFX1NJR05BTF9C
SVQsCj4gLQkJCQkgICAmZmVuY2UtPmZsYWdzKTsKPiArCXdhc19zZXQgPSBfX3Rlc3RfYW5kX3Nl
dF9iaXQoRE1BX0ZFTkNFX0ZMQUdfRU5BQkxFX1NJR05BTF9CSVQsCj4gKwkJCQkgICAgICZmZW5j
ZS0+ZmxhZ3MpOwo+ICAgCj4gICAJaWYgKHRlc3RfYml0KERNQV9GRU5DRV9GTEFHX1NJR05BTEVE
X0JJVCwgJmZlbmNlLT5mbGFncykpCj4gICAJCWdvdG8gb3V0Owo+IApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
