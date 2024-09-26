Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94106986F5E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 10:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A55810EB1A;
	Thu, 26 Sep 2024 08:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="l2uaZcye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B3E10EB1A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 08:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RxLiI92bh+rBDaKRwGtrPAnYkdyJvpCBNsdjO8fda/Q=;
 b=l2uaZcyeKwmWyBsRjGC5E9DBQWuvfgM12EZWTzIptUwQGESPeJppYFT0
 G7wHB19o6geoQns1nPPow3bFI22hyHEWZZ/nJ2f0WyR6xNaopjjtDWFmO
 9kNZroCrhn+joI9FadTv6qcrmcFvBos+ejWuvoTjPr69xwak889GbkQ/W
 LdnJO8ND+EQXojPN4+RZHMcEa7vHzfxihAKowiFT9/dqFSSmMZWb1HviG
 xVltbRNgQmmEFkuobZ7JH4c8e0/BMu3yiHFYcUlZyJGORQRzVNxN4NEWI
 g4c9q8R06W9k5dJ82qpZGhnOO5cUg3tYHdv+eNLsRNjX5GVVaak2xFZLv A==;
X-CSE-ConnectionGUID: bAaNbmiuRSG+15CVc8SXVg==
X-CSE-MsgGUID: yHPTxz8UQPOmdFKSY1O7IQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 26 Sep 2024 16:53:52 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 48Q8roh1095201;
 Thu, 26 Sep 2024 16:53:50 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 16:53:50 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68%6]) with mapi id
 15.01.2507.039; Thu, 26 Sep 2024 16:53:50 +0800
From: <Hermes.Wu@ite.com.tw>
To: <dmitry.baryshkov@linaro.org>
CC: <Kenneth.Hung@ite.com.tw>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <allen.chen@ite.com.tw>,
 <angelogioacchino.delregno@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 04/11] drm/bridge: it6505: fix aux command write to aux
 operaction register
Thread-Topic: [PATCH v4 04/11] drm/bridge: it6505: fix aux command write to
 aux operaction register
Thread-Index: AQHbD+pLHLYgwpqN9kqTXj10q/tqCbJpwu4w
Date: Thu, 26 Sep 2024 08:53:50 +0000
Message-ID: <f0626a7af4654d56b7f45b4b56ce3cd2@ite.com.tw>
References: <20240926074755.22176-1-Hermes.Wu@ite.com.tw>
 <20240926074755.22176-5-Hermes.Wu@ite.com.tw>
 <fcy6i4cfmtpsgnvuqfjm7pwlkyuno65rij5w32snmjbudma6wp@ht2jqtj2rsxq>
In-Reply-To: <fcy6i4cfmtpsgnvuqfjm7pwlkyuno65rij5w32snmjbudma6wp@ht2jqtj2rsxq>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [223.136.245.213]
x-tm-snts-smtp: 387984F609DA5C82751C7A2D7CADA9EFBBE6EBAD5A7B3A17B4D0760563D8AAF22002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 48Q8roh1095201
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

Pk9uIFRodSwgU2VwIDI2LCAyMDI0IGF0IDAzOjQ3OjU0UE0gR01ULCBIZXJtZXMgV3Ugd3JvdGU6
DQo+PiBGcm9tOiBIZXJtZXMgV3UgPEhlcm1lcy53dUBpdGUuY29tLnR3Pg0KPj4gDQo+PiBUaGUg
YXV4IGNvbnRyb2wgcmVnaXN0ZXIgY29tbWFuZCBpcyA0IGJpdHMgTFNCIG9ubHksIGFkZGluZyBh
IE1BQ1JPIHRvIA0KPj4gZ2V0IGNvcnJlY3Qgb3BlcmFjdGlvbiBjb21tYW5kLg0KPg0KPk5pdDog
QVVYLCBhZGQgKG5vdCBhZGRpbmcpLCBtYWNyby4NCj4NCj5XaGF0IGhhcHBlbnMgaWYgdGhlIGRy
aXZlciBkb2Vzbid0IGxpbWl0IHRoZSBmaWVsZD8gTGV0IG1lIGd1ZXNzLCB0aGUgS1NWIHJlYWRp
bmcgY29tbWFuZCBpcyAweDEwIChpdCBzaG91bGQgaGF2ZSBiZWVuIGEgcGFydCBvZiB0aGUgY29t
bWl0IG1lc3NhZ2UsIEJUVyksIHNvIGl0IG92ZXJyaWRlcyBzb21lIG90aGVyIGJpdHM/IEluIHN1
Y2ggYSBjYXNlIHRoaXMgZWl0aGVyIHNob3VsZCBiZSBhIHBhcnQgb2YgdGhlIHByZXZpb3VzIGNv
bW1pdCwgb3IsIGF0IGxlYXN0LCBjb21lIGJlZm9yZSBpdC4NCj4NCg0KTm90aGluZyBIYXBwZW5z
Lg0KDQpUaGUgQVVYIGNvbnRyb2wgY29tbWFuZCBhdCBjb250cm9sIHJlZ2lzdGVyIFJFR19BVVhf
Q01EX1JFUSBpcyA0IGJpdHMgTFNCIG9ubHksIGFuZCBiWzc6NF0gaXMgcmVhZHkgb25seS4NCkFV
WCBGSUZPIGFjY2VzcyBjYW5ub3QgcmVhY2ggYWxsIERQQ0QgYXJlYSwgb25seSBLU1YgRklGTyBh
dCBEUENEKDB4NjgwMkMpLg0KVGhlIGNvbW1lbmQgZGVmaW5lIHVzZSBbNzo0XSB0byBleHRlbmQg
b3JpZ2luYWwgQVVYX05BVElWRV9SRUFEKDApIGFzIEFVWF9OQVRJVkVfUkVBRCB3aXRoIEFVWCBG
SUZPDQoNCkl0IHNob3VsZCBiZSBhIHBhcnQgb2YgcHJldmlvdXMgY29tbWl0Lg0KDQo+PiBGaXhl
czogYjVjODRhOWVkY2Q0ICgiZHJtL2JyaWRnZTogYWRkIGl0NjUwNSBkcml2ZXIiKQ0KPj4gU2ln
bmVkLW9mZi1ieTogSGVybWVzIFd1IDxIZXJtZXMud3VAaXRlLmNvbS50dz4NCj4+IC0tLQ0KPj4g
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jIHwgNCArKystDQo+PiAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4gDQo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pdGUtaXQ2NTA1LmMgDQo+PiBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jDQo+PiBpbmRleCAwNTgzYWJkY2E3NWYuLmQxZjUy
MjBlMDRhNiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjUw
NS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2l0ZS1pdDY1MDUuYw0KPj4gQEAg
LTMyOSw2ICszMjksOCBAQCBlbnVtIGF1eF9jbWRfdHlwZSB7DQo+PiAgCUNNRF9BVVhfR0VUX0tT
Vl9MSVNUID0gMHgxMCwNCj4+ICB9Ow0KPj4gIA0KPj4gKyNkZWZpbmUgR0VUX0FVWF9DT05UUk9M
X0NPREUoY21kKSAoKGNtZCkgJiAweDBGKQ0KPj4gKw0KPj4gIGVudW0gYXV4X2NtZF9yZXBseSB7
DQo+PiAgCVJFUExZX0FDSywNCj4+ICAJUkVQTFlfTkFDSywNCj4+IEBAIC0xMDAwLDcgKzEwMDIs
NyBAQCBzdGF0aWMgc3NpemVfdCBpdDY1MDVfYXV4X29wZXJhdGlvbihzdHJ1Y3QgaXQ2NTA1ICpp
dDY1MDUsDQo+PiAgCQkJCSAgc2l6ZSk7DQo+PiAgDQo+PiAgCS8qIEF1eCBGaXJlICovDQo+PiAt
CWl0NjUwNV93cml0ZShpdDY1MDUsIFJFR19BVVhfQ01EX1JFUSwgY21kKTsNCj4+ICsJaXQ2NTA1
X3dyaXRlKGl0NjUwNSwgUkVHX0FVWF9DTURfUkVRLCBHRVRfQVVYX0NPTlRST0xfQ09ERShjbWQp
KTsNCj4+ICANCj4+ICAJcmV0ID0gaXQ2NTA1X2F1eF93YWl0KGl0NjUwNSk7DQo+PiAgCWlmIChy
ZXQgPCAwKQ0KPj4gLS0NCj4+IDIuMzQuMQ0KPj4gDQo+DQo+LS0gDQo+V2l0aCBiZXN0IHdpc2hl
cw0KPkRtaXRyeQ0KPg0KDQpCUiwNCkhlcm1lcw0KDQo=
