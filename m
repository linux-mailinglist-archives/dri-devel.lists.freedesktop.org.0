Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FFF7D839
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 11:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFC86E416;
	Thu,  1 Aug 2019 09:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C9D6E416
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 09:06:50 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7196mYf106951;
 Thu, 1 Aug 2019 04:06:48 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7196mmM077112
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 1 Aug 2019 04:06:48 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 1 Aug
 2019 04:06:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 1 Aug 2019 04:06:47 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7196ke6008558;
 Thu, 1 Aug 2019 04:06:46 -0500
Subject: Re: [PATCH v2 1/8] drm/omap: use refcount API to track the number of
 users of dma_addr
To: Jean-Jacques Hiblot <jjhiblot@ti.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
References: <20190708104520.24217-1-jjhiblot@ti.com>
 <20190708104520.24217-2-jjhiblot@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <f21777ae-51d5-1e0a-9e09-c7f8d3bc7078@ti.com>
Date: Thu, 1 Aug 2019 12:06:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190708104520.24217-2-jjhiblot@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1564650408;
 bh=3NeHdePVgQeiY5OuWFnZgfIlixtE5fKsAFshtDe7h50=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=asBWw2R8B+xZhqR6sAxH6f5gW0isVDHjzDMtQ6ZpcomSZ7Bqjg3uiBueabJh0WV+1
 VqI79XVSsYNy/aXUtX0AlurqeDf/kebx3vIZtTx1Ocq5Sge/0IP+ekPAeW4C8ivcLt
 bSGZFweO5qnZBGfRVLnFFDXoqSKDN7PduywylCWM=
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
Cc: jsarha@ti.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDgvMDcvMjAxOSAxMzo0NSwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKPiBUaGlzIHdv
dWxkIGdpdmUgdXMgYSBXQVJOX09OKCkgaWYgdGhlIHBpbi91bnBpbiBjYWxscyBhcmUgdW5iYWxh
bmNlZC4KPiAKPiBQcm9wb3NlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEplYW4tSmFjcXVlcyBIaWJsb3Qg
PGpqaGlibG90QHRpLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBf
Z2VtLmMgfCA0NSArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAyMyBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFw
ZHJtL29tYXBfZ2VtLmMKPiBpbmRleCAzNzM3OGRiYzUwZDAuLjBiNmVlZjEyMGNjOSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYwo+IEBAIC02NSw3ICs2NSw3IEBAIHN0cnVjdCBv
bWFwX2dlbV9vYmplY3Qgewo+ICAgCS8qKgo+ICAgCSAqICMgb2YgdXNlcnMgb2YgZG1hX2FkZHIK
PiAgIAkgKi8KPiAtCXUzMiBkbWFfYWRkcl9jbnQ7Cj4gKwlyZWZjb3VudF90IGRtYV9hZGRyX2Nu
dDsKPiAgIAo+ICAgCS8qKgo+ICAgCSAqIElmIHRoZSBidWZmZXIgaGFzIGJlZW4gaW1wb3J0ZWQg
ZnJvbSBhIGRtYWJ1ZiB0aGUgT01BUF9EQl9ETUFCVUYgZmxhZwo+IEBAIC03NzEsMTMgKzc3MSwx
NSBAQCBpbnQgb21hcF9nZW1fcGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBkbWFfYWRk
cl90ICpkbWFfYWRkcikKPiAgIAltdXRleF9sb2NrKCZvbWFwX29iai0+bG9jayk7Cj4gICAKPiAg
IAlpZiAoIW9tYXBfZ2VtX2lzX2NvbnRpZ3VvdXMob21hcF9vYmopICYmIHByaXYtPmhhc19kbW0p
IHsKPiAtCQlpZiAob21hcF9vYmotPmRtYV9hZGRyX2NudCA9PSAwKSB7Cj4gKwkJaWYgKHJlZmNv
dW50X3JlYWQoJm9tYXBfb2JqLT5kbWFfYWRkcl9jbnQpID09IDApIHsKPiAgIAkJCXUzMiBucGFn
ZXMgPSBvYmotPnNpemUgPj4gUEFHRV9TSElGVDsKPiAgIAkJCWVudW0gdGlsZXJfZm10IGZtdCA9
IGdlbTJmbXQob21hcF9vYmotPmZsYWdzKTsKPiAgIAkJCXN0cnVjdCB0aWxlcl9ibG9jayAqYmxv
Y2s7Cj4gICAKPiAgIAkJCUJVR19PTihvbWFwX29iai0+YmxvY2spOwo+ICAgCj4gKwkJCXJlZmNv
dW50X3NldCgmb21hcF9vYmotPmRtYV9hZGRyX2NudCwgMSk7Cj4gKwo+ICAgCQkJcmV0ID0gb21h
cF9nZW1fYXR0YWNoX3BhZ2VzKG9iaik7Cj4gICAJCQlpZiAocmV0KQo+ICAgCQkJCWdvdG8gZmFp
bDsKPiBAQCAtODExLDEwICs4MTMsMTAgQEAgaW50IG9tYXBfZ2VtX3BpbihzdHJ1Y3QgZHJtX2dl
bV9vYmplY3QgKm9iaiwgZG1hX2FkZHJfdCAqZG1hX2FkZHIpCj4gICAJCQlvbWFwX29iai0+Ymxv
Y2sgPSBibG9jazsKPiAgIAo+ICAgCQkJREJHKCJnb3QgZG1hIGFkZHJlc3M6ICVwYWQiLCAmb21h
cF9vYmotPmRtYV9hZGRyKTsKPiArCQl9IGVsc2Ugewo+ICsJCQlyZWZjb3VudF9pbmMoJm9tYXBf
b2JqLT5kbWFfYWRkcl9jbnQpOwo+ICAgCQl9Cj4gICAKPiAtCQlvbWFwX29iai0+ZG1hX2FkZHJf
Y250Kys7Cj4gLQoKV2FzIHRoZXJlIGEgcmVhc29uIHRvIG5vdCBoYXZlIHJlZmNvdW50X2luYygp
IGhlcmUsIGJ1dCB0byB1c2UgCnJlZmNvdW50X3NldCBhYm92ZT8KClJldmlld2VkLWJ5OiBUb21p
IFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgoKICBUb21pCgotLSAKVGV4YXMgSW5z
dHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClkt
dHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNp
bmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
