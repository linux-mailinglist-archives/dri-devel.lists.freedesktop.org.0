Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 991C415CB28
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 20:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEB66E3EC;
	Thu, 13 Feb 2020 19:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFFD6E3EC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 19:29:49 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01DJThDF102619;
 Thu, 13 Feb 2020 13:29:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581622183;
 bh=RuTJ+VJ2Pc88q5lnPsUBgj/cO1GKaqQ3SPv2X2Mk8ls=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=nre9KTsFAD1xwHuZWEvEPrLp+pebKbZ95G9L7I97dDFKcFMGHB48L2oTdGtizgBQ4
 kzMxN5+Z6Gh74nnmqCNqQkwBs+TFmwKpZc9xMtawlyxPH3FlaRJu2MSuhhn12CCI/F
 z+fDhz9DpqCzyeyOVyNZwzPc62D7V8aHuoF1N6Ng=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01DJTh5j062438
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 13 Feb 2020 13:29:43 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 13
 Feb 2020 13:29:43 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 13 Feb 2020 13:29:43 -0600
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01DJTfRx119361;
 Thu, 13 Feb 2020 13:29:41 -0600
Subject: Re: [PATCH v3] drm/tidss: dispc: Rewrite naive plane positioning code
From: Jyri Sarha <jsarha@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, <dri-devel@lists.freedesktop.org>
References: <20200213104419.29617-1-jsarha@ti.com>
 <0cd1098f-fb3d-34cb-2f79-bb543ca99203@ti.com>
 <00af7a1a-7e3f-b505-75c8-edd493e26c76@ti.com>
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <711595e0-f6e2-dc36-86e0-512308323940@ti.com>
Date: Thu, 13 Feb 2020 21:29:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <00af7a1a-7e3f-b505-75c8-edd493e26c76@ti.com>
Content-Language: en-GB
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: praneeth@ti.com, peter.ujfalusi@ti.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTMvMDIvMjAyMCAxMzo1MiwgSnlyaSBTYXJoYSB3cm90ZToKPiBPbiAxMy8wMi8yMDIwIDEy
OjQ5LCBUb21pIFZhbGtlaW5lbiB3cm90ZToKPj4gT24gMTMvMDIvMjAyMCAxMjo0NCwgSnlyaSBT
YXJoYSB3cm90ZToKPj4KPj4+ICvCoMKgwqAgLyoKPj4+ICvCoMKgwqDCoCAqIElmIGEgcGxhbmUg
b24gYSBDUlRDIGNoYW5nZXMgYWRkIGFsbCBhY3RpdmUgcGxhbmVzIG9uIHRoYXQKPj4+ICvCoMKg
wqDCoCAqIENSVEMgdG8gdGhlIGF0b21pYyBzdGF0ZS4gVGhpcyBpcyBuZWVkZWQgZm9yIHVwZGF0
aW5nIHRoZQo+Pj4gK8KgwqDCoMKgICogcGxhbmUgcG9zaXRpb25zIGluIHRpZHNzX2NydGNfcG9z
aXRpb25fcGxhbmVzKCkgd2hpY2ggaXMKPj4+ICvCoMKgwqDCoCAqIGNhbGxlZCBmcm9tIGNydGNf
YXRvbWljX2VuYWJsZSgpIGFuZCBjcnRjX2F0b21pY19mbHVzaCgpLgo+Pj4gK8KgwqDCoMKgICog
VGhlIHVwZGF0ZSBpcyBuZWVkZWQgZm9yIHgseS1wb3NpdGlvbiBjaGFuZ2VzIHRvbywgc28KPj4+
ICvCoMKgwqDCoCAqIHpwb3NfY2hhbmdlZCBjb25kaXRpb24gaXMgbm90IGVub3VnaCBhbmQgd2Ug
bmVlZCB0aGlzIGlmCj4+PiArwqDCoMKgwqAgKiBwbGFuZXNfY2hhbmdlZCBpcyB0cnVlIHRvby4K
Pj4+ICvCoMKgwqDCoCAqLwo+Pj4gK8KgwqDCoCBmb3JfZWFjaF9uZXdfY3J0Y19pbl9zdGF0ZShz
dGF0ZSwgY3J0YywgY3N0YXRlLCBpKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGNzdGF0ZS0+
enBvc19jaGFuZ2VkIHx8IGNzdGF0ZS0+cGxhbmVzX2NoYW5nZWQpIHsKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldCA9IGRybV9hdG9taWNfYWRkX2FmZmVjdGVkX3BsYW5lcyhzdGF0ZSwg
Y3J0Yyk7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4gK8KgwqDCoMKgwqDCoMKgIH0K
Pj4+ICvCoMKgwqAgfQo+Pgo+PiBJIHRoaW5rIDk5Ljk5Li4uJSBvZiB0aGUgY29tbWl0cyBhcmUg
c3VjaCB3aGVyZSBvbmx5IHBsYW5lcycgZmIgYWRkcmVzcwo+PiBpcyBjaGFuZ2VkLiBJIHRoaW5r
ICJwbGFuZXNfY2hhbmdlZCIgaXMgdHJ1ZSBmb3IgdGhlc2UuIEkgd29uZGVyIGlmIGl0Cj4+IHdv
dWxkIGJlIGEgc2Vuc2libGUgb3B0aW1pemF0aW9uIHRvIHNraXAgdGhpcyBmb3IgdGhvc2UgOTku
OTkuLi4lIGNhc2VzLgo+PiBDYW4gd2UgZGV0ZWN0IHRoYXQgZWFzaWx5Pwo+Pgo+IAo+IFN1cmUg
YnkgbG9vcGluZyBhbGwgcGxhbmVzIGluIHRoZSBzdGF0ZSB0aHJvdWdoIHdpdGgKPiBmb3JfZWFj
aF9vbGRuZXdfcGxhbmVfaW5fc3RhdGUoKSBhbmQgY2hlY2tpbmcgaWYgY3J0Y194IG9yIGNydGNf
eSBoYXMKPiBjaGFuZ2VkLiBCdXQgdGhlbiBhZ2FpbiB3cml0aW5nIHRoZSBwb3NpdGlvbnMgb2Yg
bWF4IDQgcGxhbmVzIGlzIHJlYWxseQo+IG5vdCB0aGF0IGhlYXZ5IG9wZXJhdGlvbi4gVGhlcmUg
aXMgbW9yZSBjYWxjdWxhdGlvbiB0byBkbyBhbmQgbW9yZQo+IHJlZ2lzdGVycyB0byB3cml0ZSB3
aGVuIHVwZGF0aW5nIHRoZSBmcCwgc28gSSBkbyBub3QgdGhpbmsgYXZvaWRpbmcgdGhlCj4gT1ZS
IHVwZGF0ZSBqdXN0aWZpZXMgdGhlIGV4dHJhIGNvbXBsZXhpdHkuCj4gCgpXZWxsLCBJIGltcGxl
bWVudGVkIHRoaXMgYW55d2F5IGp1c3QgZm9yIHRoZSBmdW4gb2YgaXQuIEFmdGVyIGFsbCB0aGUK
YWRkZWQgY29tcGxleGl0eSBpcyBub3QgdGhhdCBtdWNoLCBzaW5jZSB3ZSBhbHJlYWR5IGhhdmUg
YW4gZXh0ZW5kZWQKQ1JUQyBzdGF0ZS4gSnVkZ2UgeW91ciBzZWxmLCBJJ2xsIHNlbmQgdjQgc2hv
cnRseS4KCkJlc3QgcmVnYXJkcywKSnlyaQoKPj4gV2VsbCwgd2UgaGF2ZW4ndCBvcHRpbWl6ZWQg
Zm9yIHRob3NlIDk5Ljk5Li4uJSBjYXNlcyBhbnl3aGVyZSBlbHNlCj4+IGVpdGhlciwgc28gaXQn
cyBwb3NzaWJsZSBpdCBkb2Vzbid0IG1hdHRlci4KPj4KPiAKPiAKPiAKPiAKPiAKCgotLSAKVGV4
YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lu
a2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6
IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
