Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 775E8987092
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 11:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488EA10EB83;
	Thu, 26 Sep 2024 09:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="hHKNDF8p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6BE10EB83
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 09:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iLtoThzw6k2rHC1id2maCbFiVQc3n947JtVOWxOdr0s=;
 b=hHKNDF8p6dec5A/KooV+gklLgxPC3gfDqYYUtYmuoHbEOGx/WsjuYD21
 Kbpw4A1jxphg69plp8o+HrxNkC5G4kDLMaI3nzSQUnLSZ0MRgyfdpN1jR
 sQzLIgk+PkasUMyG16kzc19TXeupGP31QDdGFTrboMbie3B453lavBLoL
 WPXMd2FarRHnpyG5zVFRpSl3//cQs9PxRjy3s0aaa5aK399xbY6+ZKjzU
 mPK2brRBK5q45Yd4cRjL0YysV8NfoIiQxNO+OePrY/FwoWwwabT+DcTZ4
 rcCl2mQ6dkqAJa7Tv55vT2z5V83As3mxlvPR45/TiKhvvzgLRtO2iEs8a Q==;
X-CSE-ConnectionGUID: SGhnUaAhS3aTTzHwg8FLog==
X-CSE-MsgGUID: kSau7jkfRlm9oOF6prvokw==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 26 Sep 2024 17:46:46 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 48Q9kggu039461;
 Thu, 26 Sep 2024 17:46:42 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 17:46:42 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68%6]) with mapi id
 15.01.2507.039; Thu, 26 Sep 2024 17:46:42 +0800
From: <Hermes.Wu@ite.com.tw>
To: <dmitry.baryshkov@linaro.org>
CC: <Kenneth.Hung@ite.com.tw>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <angelogioacchino.delregno@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 03/11] drm/bridge: it6505: add aux operation for HDCP
 ksv list read
Thread-Topic: [PATCH v4 03/11] drm/bridge: it6505: add aux operation for HDCP
 ksv list read
Thread-Index: AQHbD+nRXakZJqNYlUufHBhCJc3xGLJp0ZxA
Date: Thu, 26 Sep 2024 09:46:42 +0000
Message-ID: <2b3d3295278c47b8a79c9ff9b10cc7de@ite.com.tw>
References: <20240926074755.22176-1-Hermes.Wu@ite.com.tw>
 <20240926074755.22176-4-Hermes.Wu@ite.com.tw>
 <acpumgqlyjyt5ql2imnhrv32apdjzluahnx77xpqu2lzltko4q@j6fhqrb7sxai>
In-Reply-To: <acpumgqlyjyt5ql2imnhrv32apdjzluahnx77xpqu2lzltko4q@j6fhqrb7sxai>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [223.136.245.213]
x-tm-snts-smtp: 4B48528FA96BD83BE611873D554508D90C3DB07DFA78DBD855EAA6925D650E0C2002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 48Q9kggu039461
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

Pk9uIFRodSwgU2VwIDI2LCAyMDI0IGF0IDAzOjQ3OjUzUE0gR01ULCBIZXJtZXMgV3Ugd3JvdGU6
DQo+PiBGcm9tOiBIZXJtZXMgV3UgPEhlcm1lcy53dUBpdGUuY29tLnR3Pg0KPj4gDQo+PiBBZGQg
YXV4IG9wZXJhY3Rpb24gY29tbWFuZCB3aGljaCBzdXBwb3J0cyByZWFkIERQQ0QgS1NWIEZJRk8g
d2l0aCBhdXggDQo+PiBmaWZvLg0KPg0KPk5pdDogQVVYLCBGSUZPLiBQbGVhc2UgYmUgY29uc2lz
dGVudCBpbiB5b3VyIGNvbW1pdCBtZXNzYWdlcy4NCj4NCj4+IA0KPj4gDQo+PiBGaXhlczogYjVj
ODRhOWVkY2Q0ICgiZHJtL2JyaWRnZTogYWRkIGl0NjUwNSBkcml2ZXIiKQ0KPg0KPldoeSBpcyB0
aGlzIGNvbnNpZGVyZWQgdG8gYmUgYSBmaXg/IEZyb20gdGhlIGNvbW1pdCBtZXNzYWdlIGl0IHNv
dW5kcyBsaWtlIGEgbmV3IGZlYXR1cmUuDQoNCkl0IHdpbGwgYmUgYSBuZWNlc3NhcnkgY2hhbmdl
IGZvciBIRENQIHJlYWRzIEtTViBGSUZPLg0KDQoNCj4NCj5MR1RNIG90aGVyd2lzZQ0KPg0KPj4g
U2lnbmVkLW9mZi1ieTogSGVybWVzIFd1IDxIZXJtZXMud3VAaXRlLmNvbS50dz4NCj4+IC0tLQ0K
Pj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jIHwgMTIgKysrKysrKystLS0t
DQo+PiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4+
IA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jIA0K
Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2l0ZS1pdDY1MDUuYw0KPj4gaW5kZXggYjQ1MWQz
YzJhYzFkLi4wNTgzYWJkY2E3NWYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2l0ZS1pdDY1MDUuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pdGUtaXQ2
NTA1LmMNCj4+IEBAIC0zMjQsNiArMzI0LDkgQEAgZW51bSBhdXhfY21kX3R5cGUgew0KPj4gIAlD
TURfQVVYX05BVElWRV9SRUFEID0gMHgwLA0KPj4gIAlDTURfQVVYX05BVElWRV9XUklURSA9IDB4
NSwNCj4+ICAJQ01EX0FVWF9JMkNfRURJRF9SRUFEID0gMHhCLA0KPj4gKw0KPj4gKwkvKiBLU1Yg
bGlzdCByZWFkIHVzaW5nIEFVWCBuYXRpdmUgcmVhZCB3aXRoIEZJRk8gKi8NCj4+ICsJQ01EX0FV
WF9HRVRfS1NWX0xJU1QgPSAweDEwLA0KPj4gIH07DQo+PiAgDQo+PiAgZW51bSBhdXhfY21kX3Jl
cGx5IHsNCj4+IEBAIC05NjUsNyArOTY4LDggQEAgc3RhdGljIHNzaXplX3QgaXQ2NTA1X2F1eF9v
cGVyYXRpb24oc3RydWN0IGl0NjUwNSAqaXQ2NTA1LA0KPj4gIAlpdDY1MDVfc2V0X2JpdHMoaXQ2
NTA1LCBSRUdfQVVYX0NUUkwsIEFVWF9VU0VSX01PREUsIEFVWF9VU0VSX01PREUpOw0KPj4gIA0K
Pj4gIGF1eF9vcF9zdGFydDoNCj4+IC0JaWYgKGNtZCA9PSBDTURfQVVYX0kyQ19FRElEX1JFQUQp
IHsNCj4+ICsJLyogSFcgQVVYIEZJRk8gc3VwcG9ydHMgb25seSBFRElEIGFuZCBEQ1BEIEtTViBG
SUZPIGFyZWFkICovDQo+PiArCWlmIChjbWQgPT0gQ01EX0FVWF9JMkNfRURJRF9SRUFEIHx8IGNt
ZCA9PSBDTURfQVVYX0dFVF9LU1ZfTElTVCkgew0KPj4gIAkJLyogQVVYIEVESUQgRklGTyBoYXMg
bWF4IGxlbmd0aCBvZiBBVVhfRklGT19NQVhfU0laRSBieXRlcy4gKi8NCj4+ICAJCXNpemUgPSBt
aW5fdChzaXplX3QsIHNpemUsIEFVWF9GSUZPX01BWF9TSVpFKTsNCj4+ICAJCS8qIEVuYWJsZSBB
VVggRklGTyByZWFkIGJhY2sgYW5kIGNsZWFyIEZJRk8gKi8gQEAgLTEwMzAsNyArMTAzNCw3IA0K
Pj4gQEAgc3RhdGljIHNzaXplX3QgaXQ2NTA1X2F1eF9vcGVyYXRpb24oc3RydWN0IGl0NjUwNSAq
aXQ2NTA1LA0KPj4gIAkJZ290byBhdXhfb3Bfc3RhcnQ7DQo+PiAgCX0NCj4+ICANCj4+IC0JaWYg
KGNtZCA9PSBDTURfQVVYX0kyQ19FRElEX1JFQUQpIHsNCj4+ICsJaWYgKGNtZCA9PSBDTURfQVVY
X0kyQ19FRElEX1JFQUQgfHwgY21kID09IENNRF9BVVhfR0VUX0tTVl9MSVNUKSB7DQo+PiAgCQlm
b3IgKGkgPSAwOyBpIDwgc2l6ZTsgaSsrKSB7DQo+PiAgCQkJcmV0ID0gaXQ2NTA1X3JlYWQoaXQ2
NTA1LCBSRUdfQVVYX0RBVEFfRklGTyk7DQo+PiAgCQkJaWYgKHJldCA8IDApDQo+PiBAQCAtMTA1
NSw3ICsxMDU5LDcgQEAgc3RhdGljIHNzaXplX3QgaXQ2NTA1X2F1eF9vcGVyYXRpb24oc3RydWN0
IGl0NjUwNSAqaXQ2NTA1LA0KPj4gIAlyZXQgPSBpOw0KPj4gIA0KPj4gIGF1eF9vcF9lcnI6DQo+
PiAtCWlmIChjbWQgPT0gQ01EX0FVWF9JMkNfRURJRF9SRUFEKSB7DQo+PiArCWlmIChjbWQgPT0g
Q01EX0FVWF9JMkNfRURJRF9SRUFEIHx8IGNtZCA9PSBDTURfQVVYX0dFVF9LU1ZfTElTVCkgew0K
Pj4gIAkJLyogY2xlYXIgQVVYIEZJRk8gKi8NCj4+ICAJCWl0NjUwNV9zZXRfYml0cyhpdDY1MDUs
IFJFR19BVVhfQ1RSTCwNCj4+ICAJCQkJQVVYX0VOX0ZJRk9fUkVBRCB8IENMUl9FRElEX0ZJRk8s
IEBAIC0xMDc5LDcgKzEwODMsNyBAQCBzdGF0aWMgDQo+PiBzc2l6ZV90IGl0NjUwNV9hdXhfZG9f
dHJhbnNmZXIoc3RydWN0IGl0NjUwNSAqaXQ2NTA1LA0KPj4gIA0KPj4gIAltdXRleF9sb2NrKCZp
dDY1MDUtPmF1eF9sb2NrKTsNCj4+ICAJZm9yIChpID0gMDsgaSA8IHNpemU7ICkgew0KPj4gLQkJ
aWYgKGNtZCA9PSBDTURfQVVYX0kyQ19FRElEX1JFQUQpDQo+PiArCQlpZiAoY21kID09IENNRF9B
VVhfSTJDX0VESURfUkVBRCB8fCBjbWQgPT0gQ01EX0FVWF9HRVRfS1NWX0xJU1QpDQo+PiAgCQkJ
cmVxdWVzdF9zaXplID0gbWluX3QoaW50LCAoaW50KXNpemUgLSBpLCBBVVhfRklGT19NQVhfU0la
RSk7DQo+PiAgCQllbHNlDQo+PiAgCQkJcmVxdWVzdF9zaXplID0gbWluX3QoaW50LCAoaW50KXNp
emUgLSBpLCA0KTsNCj4+IC0tDQo+PiAyLjM0LjENCj4+IA0KPg0KPi0tIA0KPldpdGggYmVzdCB3
aXNoZXMNCj5EbWl0cnkNCj4NCg0KQlIsDQpIZXJtZXMNCg0K
