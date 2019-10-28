Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8CDE6FA0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 11:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EB9882A9;
	Mon, 28 Oct 2019 10:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDEA6E542
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 10:25:24 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9SAPLDM098092;
 Mon, 28 Oct 2019 05:25:21 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9SAPLSC011912
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 28 Oct 2019 05:25:21 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 28
 Oct 2019 05:25:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 28 Oct 2019 05:25:20 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9SAPITa029781;
 Mon, 28 Oct 2019 05:25:19 -0500
Subject: Re: [PATCH v5 1/8] drm/omap: use refcount API to track the number of
 users of dma_addr
To: Jean-Jacques Hiblot <jjhiblot@ti.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
References: <20191010120000.1421-1-jjhiblot@ti.com>
 <20191010120000.1421-2-jjhiblot@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <65fe59e8-9a93-73b3-cdc4-0488bbf0c7b2@ti.com>
Date: Mon, 28 Oct 2019 12:25:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191010120000.1421-2-jjhiblot@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1572258321;
 bh=UABUQoiSIZhQ6rLja9cgwblPkVtpIXG9ttWsHqCyvp0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=rO3xn89QtC/A2KbhGZooOHj1B406x+UGXtP3IzgTEB0VFSRhTStCtGsFbuiCiI5ip
 heBF0wBDuROR93PVq3xro+hroHKdjdNsTmTQZ9YG7lopbEHoCGy230T+ou6FTHOY3k
 DopvWrRmTTiXVzEgcKFbzJ6Ojao//QhvhUdE5Z8w=
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
Cc: jsarha@ti.com, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSkosCgpPbiAxMC8xMC8yMDE5IDE0OjU5LCBKZWFuLUphY3F1ZXMgSGlibG90IHdyb3RlOgo+
IFRoaXMgd291bGQgZ2l2ZSB1cyBhIFdBUk5fT04oKSBpZiB0aGUgcGluL3VucGluIGNhbGxzIGFy
ZSB1bmJhbGFuY2VkLgo+IAo+IFByb3Bvc2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmVhbi1KYWNxdWVz
IEhpYmxvdCA8ampoaWJsb3RAdGkuY29tPgo+IFJldmlld2VkLWJ5OiBUb21pIFZhbGtlaW5lbiA8
dG9taS52YWxrZWluZW5AdGkuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
b21hcF9nZW0uYyB8IDQ0ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJt
L29tYXBkcm0vb21hcF9nZW0uYwo+IGluZGV4IDA4ZjUzOWVmZGRmYi4uNjFjYWE3YTFhMjRiIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jCj4gQEAgLTY3LDcgKzY3LDcgQEAgc3Ry
dWN0IG9tYXBfZ2VtX29iamVjdCB7Cj4gICAJLyoqCj4gICAJICogIyBvZiB1c2VycyBvZiBkbWFf
YWRkcgo+ICAgCSAqLwo+IC0JdTMyIGRtYV9hZGRyX2NudDsKPiArCXJlZmNvdW50X3QgZG1hX2Fk
ZHJfY250Owo+ICAgCj4gICAJLyoqCj4gICAJICogSWYgdGhlIGJ1ZmZlciBoYXMgYmVlbiBpbXBv
cnRlZCBmcm9tIGEgZG1hYnVmIHRoZSBPTUFQX0RCX0RNQUJVRiBmbGFnCj4gQEAgLTc3MywxMyAr
NzczLDE1IEBAIGludCBvbWFwX2dlbV9waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIGRt
YV9hZGRyX3QgKmRtYV9hZGRyKQo+ICAgCW11dGV4X2xvY2soJm9tYXBfb2JqLT5sb2NrKTsKPiAg
IAo+ICAgCWlmICghb21hcF9nZW1faXNfY29udGlndW91cyhvbWFwX29iaikgJiYgcHJpdi0+aGFz
X2RtbSkgewo+IC0JCWlmIChvbWFwX29iai0+ZG1hX2FkZHJfY250ID09IDApIHsKPiArCQlpZiAo
cmVmY291bnRfcmVhZCgmb21hcF9vYmotPmRtYV9hZGRyX2NudCkgPT0gMCkgewo+ICAgCQkJdTMy
IG5wYWdlcyA9IG9iai0+c2l6ZSA+PiBQQUdFX1NISUZUOwo+ICAgCQkJZW51bSB0aWxlcl9mbXQg
Zm10ID0gZ2VtMmZtdChvbWFwX29iai0+ZmxhZ3MpOwo+ICAgCQkJc3RydWN0IHRpbGVyX2Jsb2Nr
ICpibG9jazsKPiAgIAo+ICAgCQkJQlVHX09OKG9tYXBfb2JqLT5ibG9jayk7Cj4gICAKPiArCQkJ
cmVmY291bnRfc2V0KCZvbWFwX29iai0+ZG1hX2FkZHJfY250LCAxKTsKPiArCj4gICAJCQlyZXQg
PSBvbWFwX2dlbV9hdHRhY2hfcGFnZXMob2JqKTsKPiAgIAkJCWlmIChyZXQpCj4gICAJCQkJZ290
byBmYWlsOwo+IEBAIC04MTMsMTAgKzgxNSwxMCBAQCBpbnQgb21hcF9nZW1fcGluKHN0cnVjdCBk
cm1fZ2VtX29iamVjdCAqb2JqLCBkbWFfYWRkcl90ICpkbWFfYWRkcikKPiAgIAkJCW9tYXBfb2Jq
LT5ibG9jayA9IGJsb2NrOwo+ICAgCj4gICAJCQlEQkcoImdvdCBkbWEgYWRkcmVzczogJXBhZCIs
ICZvbWFwX29iai0+ZG1hX2FkZHIpOwo+ICsJCX0gZWxzZSB7Cj4gKwkJCXJlZmNvdW50X2luYygm
b21hcF9vYmotPmRtYV9hZGRyX2NudCk7Cj4gICAJCX0KPiAgIAo+IC0JCW9tYXBfb2JqLT5kbWFf
YWRkcl9jbnQrKzsKPiAtCj4gICAJCSpkbWFfYWRkciA9IG9tYXBfb2JqLT5kbWFfYWRkcjsKPiAg
IAl9IGVsc2UgaWYgKG9tYXBfZ2VtX2lzX2NvbnRpZ3VvdXMob21hcF9vYmopKSB7Cj4gICAJCSpk
bWFfYWRkciA9IG9tYXBfb2JqLT5kbWFfYWRkcjsKPiBAQCAtODQ2LDIyICs4NDgsMTkgQEAgdm9p
ZCBvbWFwX2dlbV91bnBpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKPiAgIAo+ICAgCW11
dGV4X2xvY2soJm9tYXBfb2JqLT5sb2NrKTsKPiAgIAo+IC0JaWYgKG9tYXBfb2JqLT5kbWFfYWRk
cl9jbnQgPiAwKSB7Cj4gLQkJb21hcF9vYmotPmRtYV9hZGRyX2NudC0tOwo+IC0JCWlmIChvbWFw
X29iai0+ZG1hX2FkZHJfY250ID09IDApIHsKPiAtCQkJcmV0ID0gdGlsZXJfdW5waW4ob21hcF9v
YmotPmJsb2NrKTsKPiAtCQkJaWYgKHJldCkgewo+IC0JCQkJZGV2X2VycihvYmotPmRldi0+ZGV2
LAo+IC0JCQkJCSJjb3VsZCBub3QgdW5waW4gcGFnZXM6ICVkXG4iLCByZXQpOwo+IC0JCQl9Cj4g
LQkJCXJldCA9IHRpbGVyX3JlbGVhc2Uob21hcF9vYmotPmJsb2NrKTsKPiAtCQkJaWYgKHJldCkg
ewo+IC0JCQkJZGV2X2VycihvYmotPmRldi0+ZGV2LAo+IC0JCQkJCSJjb3VsZCBub3QgcmVsZWFz
ZSB1bm1hcDogJWRcbiIsIHJldCk7Cj4gLQkJCX0KPiAtCQkJb21hcF9vYmotPmRtYV9hZGRyID0g
MDsKPiAtCQkJb21hcF9vYmotPmJsb2NrID0gTlVMTDsKPiArCWlmIChyZWZjb3VudF9kZWNfYW5k
X3Rlc3QoJm9tYXBfb2JqLT5kbWFfYWRkcl9jbnQpKSB7Cj4gKwkJcmV0ID0gdGlsZXJfdW5waW4o
b21hcF9vYmotPmJsb2NrKTsKPiArCQlpZiAocmV0KSB7Cj4gKwkJCWRldl9lcnIob2JqLT5kZXYt
PmRldiwKPiArCQkJCSJjb3VsZCBub3QgdW5waW4gcGFnZXM6ICVkXG4iLCByZXQpOwo+ICsJCX0K
PiArCQlyZXQgPSB0aWxlcl9yZWxlYXNlKG9tYXBfb2JqLT5ibG9jayk7Cj4gKwkJaWYgKHJldCkg
ewo+ICsJCQlkZXZfZXJyKG9iai0+ZGV2LT5kZXYsCj4gKwkJCQkiY291bGQgbm90IHJlbGVhc2Ug
dW5tYXA6ICVkXG4iLCByZXQpOwo+ICAgCQl9Cj4gKwkJb21hcF9vYmotPmRtYV9hZGRyID0gMDsK
PiArCQlvbWFwX29iai0+YmxvY2sgPSBOVUxMOwoKVGhpcyBpcyBub3QgY29ycmVjdCwgYW5kIGNh
dXNlcyBwcm9ibGVtcyBvbiBkZXZpY2VzIHdpdGhvdXQgRE1NIChvciwgSSAKdGhpbmssIGFsc28g
b24gZGV2aWNlcyB3aXRoIERNTSBpZiB5b3UgZGlzYWJsZSBpdCBtYW51YWxseSkuCgpUaGUgb2xk
IGNvZGUgd2FzIHRyYWNraW5nIGRtYV9hZGRyX2NudCBvbmx5IGZvciBETU0gYnVmZmVycywgYW5k
IGluIApvbWFwX2dlbV91bnBpbigpIHRoZSBjb2RlIGNoZWNrcyBpZiBkbWFfYWRkcl9jbnQgPiAw
LCBhbmQgaWYgc28sIGl0IGdvZXMgCmFuZCBkZWNyZW1lbnRzIGFuZCBwb3NzaWJseSBmcmVlcyB0
aGUgRE1NIGJ1ZmZlci4gU28gZm9yIG5vbi1ETU0gCmJ1ZmZlcnMsIG5vdGhpbmcgd2FzIGRvbmUg
dGhlcmUuIEJ1dCB0aGlzIHZlcnNpb24gYWx3YXlzIGRlY3JlbWVudHMgdGhlIApkbWFfYWRkcl9j
bnQsIHdoaWNoIHRoZW4gYnJlYWtzIGRvd24uCgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50
cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMv
QnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
