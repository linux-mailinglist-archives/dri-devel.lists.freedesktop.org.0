Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 110CEA06B35
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 03:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD8010E2B6;
	Thu,  9 Jan 2025 02:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="SmcD3s6x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD41710E2B6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 02:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c2C/YiQ1t2jAAFwvgTHmQiZ9HJK4WyQc/7Rf+KLdJGY=;
 b=SmcD3s6xFRNvNcTDiAg2A1gJtV1CKkuC7MgYE3a2kgsxSuyQlAQKjWrz
 ePisEEF7Zlr18JVIHq4R76STZawvAsQGOkehO/DH6Olqq+12pRTKvQzwF
 /jwZZc2hj6Ji8YSvw1n24wDJRmVzCpMCn3Vdd4JqTq6FB4YnbPbT35jW4
 p+G05Ry4Dso1ItV6DVkayXDzFj35zTzaCWC3flI17KzZ5ZFcZkYsguyHO
 2p+xxdl9T5xYrLWJtechGoU37kSvM1SD/ccROUE7hkceacqP5MEKqKHuR
 q6uJXsMjtC1mgAwNrkb6thEPGM0JNeNgwavEXTn8sLR+oLm0TA8y21OUm w==;
X-CSE-ConnectionGUID: pN4aVxtrT0ytN3g0l1ssUA==
X-CSE-MsgGUID: J8sVKztiT/Wc0aWYh5/Fhg==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 09 Jan 2025 10:36:27 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 5092aOPa027372;
 Thu, 9 Jan 2025 10:36:24 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 9 Jan 2025 10:36:23 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68%6]) with mapi id
 15.01.2507.039; Thu, 9 Jan 2025 10:36:23 +0800
From: <Hermes.Wu@ite.com.tw>
To: <dmitry.baryshkov@linaro.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <angelogioacchino.delregno@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <Pet.Weng@ite.com.tw>, <Kenneth.Hung@ite.com.tw>, <treapking@chromium.org>
Subject: RE: [PATCH] drm/bridge: it6505: fix HDCP V match check is not
 performed correctly
Thread-Topic: [PATCH] drm/bridge: it6505: fix HDCP V match check is not
 performed correctly
Thread-Index: AQHbYbosGn3W04zl5k2DeeI43uVSWrMNubaA
Date: Thu, 9 Jan 2025 02:36:23 +0000
Message-ID: <cb8f9927d2874ef29bdea3f16c4a9de1@ite.com.tw>
References: <20250108-fix-hdcp-v-comp-v1-1-9404811825cd@ite.com.tw>
 <lu2haon4sj3kvge6cowqgratgnoxg26kiwrjyjdgh7pt5v2hwi@v3xulffewwy6>
In-Reply-To: <lu2haon4sj3kvge6cowqgratgnoxg26kiwrjyjdgh7pt5v2hwi@v3xulffewwy6>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.80.25]
x-tm-snts-smtp: 32DFB5D4E8BC7A7DF2B7BD95114DADD5F5E4D387A00ECCC84F1888391EE15FC32002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 5092aOPa027372
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aGkNCj4NCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IERtaXRyeSBCYXJ5c2hr
b3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4gDQo+U2VudDogV2VkbmVzZGF5LCBKYW51
YXJ5IDgsIDIwMjUgNjo0MyBQTQ0KPlRvOiBIZXJtZXMgV3UgKKdkqM6nuykgPEhlcm1lcy5XdUBp
dGUuY29tLnR3Pg0KPkNjOiBBbmRyemVqIEhhamRhIDxhbmRyemVqLmhhamRhQGludGVsLmNvbT47
IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPjsgUm9iZXJ0IEZvc3Mg
PHJmb3NzQGtlcm5lbC5vcmc+OyBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlk
ZWFzb25ib2FyZC5jb20+OyBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+OyBKZXJuZWog
U2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPjsgTWFhcnRlbiBMYW5raG9yc3QgPG1h
YXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT47IE1heGltZSBSaXBhcmQgPG1yaXBhcmRA
a2VybmVsLm9yZz47IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPjsgRGF2
aWQgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT47IFNpbW9uYSBWZXR0ZXIgPHNpbW9uYUBmZnds
bC5jaD47IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJl
Z25vQGNvbGxhYm9yYS5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBQZXQgV2VuZyAor86lyariKSA8UGV0LldlbmdAaXRl
LmNvbS50dz47IEtlbm5ldGggSHVuZyAorHiuYa3bKSA8S2VubmV0aC5IdW5nQGl0ZS5jb20udHc+
OyB0cmVhcGtpbmdAY2hyb21pdW0ub3JnDQo+U3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2JyaWRn
ZTogaXQ2NTA1OiBmaXggSERDUCBWIG1hdGNoIGNoZWNrIGlzIG5vdCBwZXJmb3JtZWQgY29ycmVj
dGx5DQo+DQo+T24gV2VkLCBKYW4gMDgsIDIwMjUgYXQgMDE6NDU6MTRQTSArMDgwMCwgSGVybWVz
IFd1IHZpYSBCNCBSZWxheSB3cm90ZToNCj4+IEZyb206IEhlcm1lcyBXdSA8SGVybWVzLnd1QGl0
ZS5jb20udHc+DQo+PiANCj4+IFRoZSBsb29wIG9mIFYgY29tcGFyZSBpcyBleHBlY3RlZCB0byBp
dGVyYXRlIGZvciA1IHRpbWVzIHdoaWNoIGNvbXBhcmUgDQo+PiBWIGFycmF5IGZvcm0gYXZbMF1b
XSB0byBhdls0XVtdLg0KPj4gSXQgc2hvdWxkIGNoZWNrIGxvb3AgY291bnRlciByZWFjaCB0aGUg
bGFzdCBzdGF0ZW1lbnQgYmVmb3JlIHJldHVybiANCj4+IHRydWUNCj4+IA0KPj4gRml4ZXM6IDA5
ODljMDJjN2E1YyAoImRybS9icmlkZ2U6IGl0NjUwNTogZml4IEhEQ1AgQ1RTIGNvbXBhcmUgViAN
Cj4+IG1hdGNoaW5nIikNCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogSGVybWVzIFd1IDxIZXJtZXMu
d3VAaXRlLmNvbS50dz4NCj4NCj5ObyBlbXB0eSBsaW5lcyBiZXR3ZWVuIHRhZ3MsIHBsZWFzZS4N
Cj4NCj4+IC0tLQ0KPj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jIHwgOSAr
KysrKystLS0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pdGUtaXQ2
NTA1LmMgDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jDQo+PiBpbmRl
eCANCj4+IDg4ZWY3NmEzN2ZlNmFjY2FjZGQzNDM4MzlmZjI1NjliMzFiMThjZWIuLmU4NzI0N2Fl
YTFkMmZmYmRhZDE5MmUyNDEwNTYNCj4+IGQzNGZkZmIzMjE2MyAxMDA2NDQNCj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2l0ZS1pdDY1MDUuYw0KPj4gQEAgLTIyNTQsOSArMjI1NCwxMiBAQCBzdGF0aWMg
Ym9vbCBpdDY1MDVfaGRjcF9wYXJ0Ml9rc3ZsaXN0X2NoZWNrKHN0cnVjdCBpdDY1MDUgKml0NjUw
NSkNCj4+ICAJCQlpZiAoYnZbaV1bM10gIT0gYXZbaV1bMF0gfHwgYnZbaV1bMl0gIT0gYXZbaV1b
MV0gfHwNCj4+ICAJCQkgICAgYXZbaV1bMV0gIT0gYXZbaV1bMl0gfHwgYnZbaV1bMF0gIT0gYXZb
aV1bM10pDQo+PiAgCQkJCWJyZWFrOw0KPj4gLQ0KPj4gLQkJCURSTV9ERVZfREVCVUdfRFJJVkVS
KGRldiwgIlYnIGFsbCBtYXRjaCEhICVkLCAlZCIsIHJldHJ5LCBpKTsNCj4+IC0JCQlyZXR1cm4g
dHJ1ZTsNCj4+ICsJCQlpZiAoaSA9PSA0KSB7DQo+DQo+SSB0aGluayB0aGVyZSB3YXMgYSBzaW1p
bGFyIHBhdGNoIHllc3RlZGF5Lg0KDQpJIGNhbid0IGZpbmQgcGF0Y2ggZm9yIGl0NjUwNSwgd291
bGQgeW91IHByb3ZpZGUgbGluaz8NCklmIGl0IGFsc28gZml4ZXMgdGhpcyBidWcsIHNob3VsZCBJ
IGp1c3QgZHJvcCB0aGlzIHBhdGNoPyAgDQoNCj5Bbnl3YXksIEkgaGF2ZSBleGFjdGx5IHRoZSBz
YW1lIGZlZWRiYWNrOiBwbGVhc2UgcHVsbCB0aGlzIG91dCBvZiB0aGUgbG9vcCwgdGhpcyBpcyBo
b3cgaXQncyB1c3VhbGx5IGNoZWNrZWQgLyBkb25lLg0KPg0KSSB3aWxsIG1vdmUgaXQgb3V0IHRo
ZSBsb29wLA0KDQpUaGFua3MuDQoNCj4+ICsJCQkJRFJNX0RFVl9ERUJVR19EUklWRVIoZGV2LA0K
Pj4gKwkJCQkJCSAgICAgIlYnIGFsbCBtYXRjaCEhICVkIiwNCj4+ICsJCQkJCQkgICAgIHJldHJ5
KTsNCj4+ICsJCQkJcmV0dXJuIHRydWU7DQo+PiArCQkJfQ0KPj4gIAkJfQ0KPj4gIAl9DQo+PiAg
DQo+PiANCj4+IC0tLQ0KPj4gYmFzZS1jb21taXQ6IDkzOGZiYjE2YWJhOGY3Yjg4ZTBmZGNmNTZm
MzE1YTViYmFkNDFhYWQNCj4+IGNoYW5nZS1pZDogMjAyNTAxMDctZml4LWhkY3Atdi1jb21wLTNi
YThlM2Q3YWRmMw0KPj4gDQo+PiBCZXN0IHJlZ2FyZHMsDQo+PiAtLQ0KPj4gSGVybWVzIFd1IDxI
ZXJtZXMud3VAaXRlLmNvbS50dz4NCj4+IA0KPj4gDQo+DQo+LS0NCj5XaXRoIGJlc3Qgd2lzaGVz
DQo+RG1pdHJ5DQo+DQoNCkJSLA0KSGVybWVzDQo=
