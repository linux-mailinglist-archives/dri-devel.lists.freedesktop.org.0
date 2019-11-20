Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE94C104D04
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD026EB7A;
	Thu, 21 Nov 2019 07:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD5A6EA22
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 19:55:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKJqO9O003995; Wed, 20 Nov 2019 20:55:46 +0100
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wa9uvfqvn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 20:55:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4912210002A;
 Wed, 20 Nov 2019 20:55:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B6162C615F;
 Wed, 20 Nov 2019 20:55:44 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 20 Nov
 2019 20:55:43 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Wed, 20 Nov 2019 20:55:43 +0100
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/rect: Keep the clipped dst rectangle
 in place
Thread-Topic: [Intel-gfx] [PATCH 2/2] drm/rect: Keep the clipped dst rectangle
 in place
Thread-Index: AQHVn78evYAXRoXP9kuRS1gabTE6YaeUMxEAgAAH0ACAAC3XAA==
Date: Wed, 20 Nov 2019 19:55:43 +0000
Message-ID: <c936c1e3-b045-4dd6-8216-ade0da19f015@st.com>
References: <20191120162512.12484-1-ville.syrjala@linux.intel.com>
 <20191120162512.12484-2-ville.syrjala@linux.intel.com>
 <20191120164340.GS30416@phenom.ffwll.local> <20191120171138.GI1208@intel.com>
In-Reply-To: <20191120171138.GI1208@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <DE30B0D1905BD14C95003ABDD60B944F@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_06:2019-11-20,2019-11-20 signatures=0
X-Mailman-Approved-At: Thu, 21 Nov 2019 07:59:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=dz9EZ4+cL0+/kxhuo1FEe2OczLwYq5J//5cU9fznoPY=;
 b=ThS4uP2Bc3L+dCgzSUlrVcDvaz0uGiD8hbOfFfjOi4VJuqAEdC8kYCOK5DaV6o21fIta
 6nIwu4yvB3VBsdO9O56C9C8k2OI0xEmy4UO9JWyyuwAQ3YCQrs+Yu55Mi3FzgISpo6Zk
 hOCL/HoF0n+8HIconaXxr+azWq7lrP5SCphSZWcsqziJggZLK4DcpZUw/BWb82idqswu
 NHUXvif1vOLCbOWGmLaGvlU8HGp6+CZBdMNJcxG3zzMZH9VdkagonWzakyFn3/pgyiKu
 uRD2dfnKp34+NDiRj2bY2bhKQTgLMybQXTxiguRYyao7lziQKBebRuIlSZaF6gOKuHUw bw== 
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiAxMS8yMC8xOSA2OjExIFBNLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6DQo+IE9uIFdlZCwg
Tm92IDIwLCAyMDE5IGF0IDA1OjQzOjQwUE0gKzAxMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+
PiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAwNjoyNToxMlBNICswMjAwLCBWaWxsZSBTeXJqYWxh
IHdyb3RlOg0KPj4+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+DQo+Pj4NCj4+PiBOb3cgdGhhdCB3ZSd2ZSBjb25zdHJhaW5lZCB0aGUgY2xpcHBl
ZCBzb3VyY2UgcmVjdGFuZ2xlIHN1Y2gNCj4+PiB0aGF0IGl0IGNhbid0IGhhdmUgbmVnYXRpdmUg
ZGltZW5zaW9ucyBkb2luZyB0aGUgc2FtZSBmb3IgdGhlDQo+Pj4gZHN0IHJlY3RhbmdsZSBzZWVt
cyBhcHByb3ByaWF0ZS4gU2hvdWxkIGF0IGxlYXN0IHJlc3VsdCBpbg0KPj4+IHRoZSBjbGlwcGVk
IHNyYyBhbmQgZHN0IHJlY3RhbmdsZXMgYmVpbmcgYSBiaXQgbW9yZSBjb25zaXN0ZW50DQo+Pj4g
d2l0aCBlYWNoIG90aGVyLg0KPj4+DQo+Pj4gQ2M6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1p
bi5nYWlnbmFyZEBzdC5jb20+DQo+Pj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb20+DQo+Pj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4+IHNlbGZ0ZXN0cyBmb3IgdGhp
cyBzdHVmZj8gTG9va3MgbGlrZSB0aGUgcHJpbWUgZXhhbXBsZSwgd3JpdGUgdGVzdGNhc2UNCj4+
IHByb3ZpbmcgY29kZSBpcyBidXN0ZWQsIGZpeCBpdCwgZXZlcnlvbmUgY2VsZWJyYXRlPw0KPiBZ
ZWFoLCBzZWVtcyBsaWtlIGEgZ29vZCBpZGVhLiBUaG91Z2ggSSdsbCBoYXZlIHRvIGZpZ3VyZSBv
dXQgaWYgaXQncw0KPiBhY3R1YWxseSBicm9rZW4gb3Igbm90IDspDQo+DQo+IEhtbS4gT3VjaC4g
VGhlcmUncyBzZWVtcyB0byBiZSBhIGRpdiBieSB6ZXJvIGx1cmtpbmcgaW4gdGhlcmUgaWYNCj4g
ZHN0X3cvaCA9PSAwLiBJIHdvbmRlciB3aHkgbm90aGluZyBoYXMgaGl0IHRoYXQuDQoNCkF0IGxl
YXN0IFc9MSB3YXJuaW5ncyBoYXZlIGRpc2FwcGVhciB3aXRoIHRoZXNlIHBhdGNoZXMgOy0pDQoN
CkJlbmphbWluDQoNCj4+IC1EYW5pZWwNCj4+DQo+Pj4gLS0tDQo+Pj4gICBkcml2ZXJzL2dwdS9k
cm0vZHJtX3JlY3QuYyB8IDIyICsrKysrKysrKysrLS0tLS0tLS0tLS0NCj4+PiAgIDEgZmlsZSBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
cmVjdC5jDQo+Pj4gaW5kZXggNzc2MmI2ZTkyNzhkLi4yMjkzMjVmY2YzMzMgMTAwNjQ0DQo+Pj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9yZWN0LmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX3JlY3QuYw0KPj4+IEBAIC01MiwxNCArNTIsMTQgQEAgYm9vbCBkcm1fcmVjdF9pbnRl
cnNlY3Qoc3RydWN0IGRybV9yZWN0ICpyMSwgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpyMikNCj4+
PiAgIH0NCj4+PiAgIEVYUE9SVF9TWU1CT0woZHJtX3JlY3RfaW50ZXJzZWN0KTsNCj4+PiAgIA0K
Pj4+IC1zdGF0aWMgdTMyIGNsaXBfc2NhbGVkKHUzMiBzcmMsIHUzMiBkc3QsIHUzMiBjbGlwKQ0K
Pj4+ICtzdGF0aWMgdTMyIGNsaXBfc2NhbGVkKGludCBzcmMsIGludCBkc3QsIGludCAqY2xpcCkN
Cj4+PiAgIHsNCj4+PiAgIAl1NjQgdG1wOw0KPj4+ICAgDQo+Pj4gICAJLyogT25seSBjbGlwIHdo
YXQgd2UgaGF2ZS4gS2VlcHMgdGhlIHJlc3VsdCBib3VuZGVkIGFzIHdlbGwuICovDQo+Pj4gLQlj
bGlwID0gbWluKGNsaXAsIGRzdCk7DQo+Pj4gKwkqY2xpcCA9IG1pbigqY2xpcCwgZHN0KTsNCj4+
PiAgIA0KPj4+IC0JdG1wID0gbXVsX3UzMl91MzIoc3JjLCBkc3QgLSBjbGlwKTsNCj4+PiArCXRt
cCA9IG11bF91MzJfdTMyKHNyYywgZHN0IC0gKmNsaXApOw0KPj4+ICAgDQo+Pj4gICAJLyoNCj4+
PiAgIAkgKiBSb3VuZCB0b3dhcmQgMS4wIHdoZW4gY2xpcHBpbmcgc28gdGhhdCB3ZSBkb24ndCBh
Y2NpZGVudGFsbHkNCj4+PiBAQCAtOTIsMzQgKzkyLDM0IEBAIGJvb2wgZHJtX3JlY3RfY2xpcF9z
Y2FsZWQoc3RydWN0IGRybV9yZWN0ICpzcmMsIHN0cnVjdCBkcm1fcmVjdCAqZHN0LA0KPj4+ICAg
CWRpZmYgPSBjbGlwLT54MSAtIGRzdC0+eDE7DQo+Pj4gICAJaWYgKGRpZmYgPiAwKSB7DQo+Pj4g
ICAJCXUzMiBuZXdfc3JjX3cgPSBjbGlwX3NjYWxlZChkcm1fcmVjdF93aWR0aChzcmMpLA0KPj4+
IC0JCQkJCSAgICBkcm1fcmVjdF93aWR0aChkc3QpLCBkaWZmKTsNCj4+PiArCQkJCQkgICAgZHJt
X3JlY3Rfd2lkdGgoZHN0KSwgJmRpZmYpOw0KPj4+ICAgDQo+Pj4gICAJCXNyYy0+eDEgPSBzcmMt
PngyIC0gbmV3X3NyY193Ow0KPj4+IC0JCWRzdC0+eDEgPSBjbGlwLT54MTsNCj4+PiArCQlkc3Qt
PngxICs9IGRpZmY7DQo+Pj4gICAJfQ0KPj4+ICAgCWRpZmYgPSBjbGlwLT55MSAtIGRzdC0+eTE7
DQo+Pj4gICAJaWYgKGRpZmYgPiAwKSB7DQo+Pj4gICAJCXUzMiBuZXdfc3JjX2ggPSBjbGlwX3Nj
YWxlZChkcm1fcmVjdF9oZWlnaHQoc3JjKSwNCj4+PiAtCQkJCQkgICAgZHJtX3JlY3RfaGVpZ2h0
KGRzdCksIGRpZmYpOw0KPj4+ICsJCQkJCSAgICBkcm1fcmVjdF9oZWlnaHQoZHN0KSwgJmRpZmYp
Ow0KPj4+ICAgDQo+Pj4gICAJCXNyYy0+eTEgPSBzcmMtPnkyIC0gbmV3X3NyY19oOw0KPj4+IC0J
CWRzdC0+eTEgPSBjbGlwLT55MTsNCj4+PiArCQlkc3QtPnkxICs9IGRpZmY7DQo+Pj4gICAJfQ0K
Pj4+ICAgCWRpZmYgPSBkc3QtPngyIC0gY2xpcC0+eDI7DQo+Pj4gICAJaWYgKGRpZmYgPiAwKSB7
DQo+Pj4gICAJCXUzMiBuZXdfc3JjX3cgPSBjbGlwX3NjYWxlZChkcm1fcmVjdF93aWR0aChzcmMp
LA0KPj4+IC0JCQkJCSAgICBkcm1fcmVjdF93aWR0aChkc3QpLCBkaWZmKTsNCj4+PiArCQkJCQkg
ICAgZHJtX3JlY3Rfd2lkdGgoZHN0KSwgJmRpZmYpOw0KPj4+ICAgDQo+Pj4gICAJCXNyYy0+eDIg
PSBzcmMtPngxICsgbmV3X3NyY193Ow0KPj4+IC0JCWRzdC0+eDIgPSBjbGlwLT54MjsNCj4+PiAr
CQlkc3QtPngyIC09IGRpZmY7DQo+Pj4gICAJfQ0KPj4+ICAgCWRpZmYgPSBkc3QtPnkyIC0gY2xp
cC0+eTI7DQo+Pj4gICAJaWYgKGRpZmYgPiAwKSB7DQo+Pj4gICAJCXUzMiBuZXdfc3JjX2ggPSBj
bGlwX3NjYWxlZChkcm1fcmVjdF9oZWlnaHQoc3JjKSwNCj4+PiAtCQkJCQkgICAgZHJtX3JlY3Rf
aGVpZ2h0KGRzdCksIGRpZmYpOw0KPj4+ICsJCQkJCSAgICBkcm1fcmVjdF9oZWlnaHQoZHN0KSwg
JmRpZmYpOw0KPj4+ICAgDQo+Pj4gICAJCXNyYy0+eTIgPSBzcmMtPnkxICsgbmV3X3NyY19oOw0K
Pj4+IC0JCWRzdC0+eTIgPSBjbGlwLT55MjsNCj4+PiArCQlkc3QtPnkyIC09IGRpZmY7DQo+Pj4g
ICAJfQ0KPj4+ICAgDQo+Pj4gICAJcmV0dXJuIGRybV9yZWN0X3Zpc2libGUoZHN0KTsNCj4+PiAt
LSANCj4+PiAyLjIzLjANCj4+Pg0KPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQo+Pj4gSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdA0KPj4+IEludGVsLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeA0KPj4gLS0gDQo+PiBEYW5pZWwgVmV0dGVyDQo+
PiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24NCj4+IGh0dHA6Ly9ibG9nLmZm
d2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
