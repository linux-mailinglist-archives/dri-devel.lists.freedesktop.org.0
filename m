Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3743BA08516
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 03:01:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E153110EF82;
	Fri, 10 Jan 2025 02:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="LuZBNkSy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332E910EF82
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 02:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HHRX1KKweR/SDD6Ns6ZR8WDd72V+/mCZagIcffuVIvc=;
 b=LuZBNkSyCARDUVdWe46etimtPA9sBsj+w+l8xkxqC7zLm13zkLBXDvet
 JiyGYoGI2CD1tal1d2a1CkJ+1ZfzS5w4tTvFxvgttzEhvS7sesn31qUG1
 C2odh7MoJwbnj2v4VY/BSCrgsmyh69ClT/UejfOj/d2iWH9+BBEud75t8
 ywsSsMwctdKJSDKCEBuq6jccAV/P8bBy6Xh2cwX+52Hap0FaDv9Rxa74G
 3OAm8gBT0tkM/xMySwQY3C5Ix2iKjuSnsoJFicXPCH7hGQIKUX4detz9w
 tuA2dTgvGZvTbFoUfZRT7z7QTmjZQ5czcATYIdP+V60UZGPC/vMmntIyx w==;
X-CSE-ConnectionGUID: KqrvRTqHR+2zidgJaWqivA==
X-CSE-MsgGUID: tPHsBmd3RC+NophvmSLBTw==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 10 Jan 2025 10:00:43 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 50A20bPf023559;
 Fri, 10 Jan 2025 10:00:37 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 10 Jan 2025 10:00:35 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68%6]) with mapi id
 15.01.2507.039; Fri, 10 Jan 2025 10:00:35 +0800
From: <Hermes.Wu@ite.com.tw>
To: <dmitry.baryshkov@linaro.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <angelogioacchino.delregno@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <Pet.Weng@ite.com.tw>, <Kenneth.Hung@ite.com.tw>, <treapking@chromium.org>
Subject: RE: [PATCH v3] drm/bridge: it6505: fix HDCP V match check is not
 performed correctly
Thread-Topic: [PATCH v3] drm/bridge: it6505: fix HDCP V match check is not
 performed correctly
Thread-Index: AQHbYpeludpaTmAoLkaXS+bHUjRldrMPQA9Q
Date: Fri, 10 Jan 2025 02:00:35 +0000
Message-ID: <71b5a3243edc4765a4529d1254d7b7bc@ite.com.tw>
References: <20250109-fix-hdcp-v-comp-v3-1-1258edb249ab@ite.com.tw>
 <ofpb7annntdpa7lwdscozaftvmuuat47juwn55x3p2osjsei52@bjitidem3g7d>
In-Reply-To: <ofpb7annntdpa7lwdscozaftvmuuat47juwn55x3p2osjsei52@bjitidem3g7d>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.80.25]
x-tm-snts-smtp: 0281DBFCAA37FE11792A1C9DF78DEFAD6CBD5BC7B8B2A17A1ACE6381E7A0D2222002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 50A20bPf023559
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

aGkNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPiANClNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5
IDksIDIwMjUgOTowOSBQTQ0KVG86IEhlcm1lcyBXdSAop2Sozqe7KSA8SGVybWVzLld1QGl0ZS5j
b20udHc+DQpDYzogQW5kcnplaiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+OyBOZWls
IEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz47IFJvYmVydCBGb3NzIDxyZm9z
c0BrZXJuZWwub3JnPjsgTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPjsgSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPjsgSmVybmVqIFNrcmFi
ZWMgPGplcm5lai5za3JhYmVjQGdtYWlsLmNvbT47IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVu
Lmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+OyBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5l
bC5vcmc+OyBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47IERhdmlkIEFp
cmxpZSA8YWlybGllZEBnbWFpbC5jb20+OyBTaW1vbmEgVmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+
OyBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bj
b2xsYWJvcmEuY29tPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZzsgUGV0IFdlbmcgKK/Opcmq4ikgPFBldC5XZW5nQGl0ZS5jb20u
dHc+OyBLZW5uZXRoIEh1bmcgKKx4rmGt2ykgPEtlbm5ldGguSHVuZ0BpdGUuY29tLnR3PjsgdHJl
YXBraW5nQGNocm9taXVtLm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSCB2M10gZHJtL2JyaWRnZTog
aXQ2NTA1OiBmaXggSERDUCBWIG1hdGNoIGNoZWNrIGlzIG5vdCBwZXJmb3JtZWQgY29ycmVjdGx5
DQoNCk9uIFRodSwgSmFuIDA5LCAyMDI1IGF0IDAyOjQwOjA4UE0gKzA4MDAsIEhlcm1lcyBXdSB2
aWEgQjQgUmVsYXkgd3JvdGU6DQo+IEZyb206IEhlcm1lcyBXdSA8SGVybWVzLnd1QGl0ZS5jb20u
dHc+DQo+IA0KPiBUaGUgbG9vcCBvZiBWIGNvbXBhcmUgaXMgZXhwZWN0ZWQgdG8gaXRlcmF0ZSBm
b3IgNSB0aW1lcyB3aGljaCBjb21wYXJlIA0KPiBWIGFycmF5IGZvcm0gYXZbMF1bXSB0byBhdls0
XVtdLg0KPiBJdCBzaG91bGQgY2hlY2sgbG9vcCBjb3VudGVyIHJlYWNoIHRoZSBsYXN0IHN0YXRl
bWVudCAiaSA9PSA1Ig0KPiBiZWZvcmUgcmV0dXJuIHRydWUNCj4gDQo+IEZpeGVzOiAwOTg5YzAy
YzdhNWMgKCJkcm0vYnJpZGdlOiBpdDY1MDU6IGZpeCBIRENQIENUUyBjb21wYXJlIFYgDQo+IG1h
dGNoaW5nIikNCj4gUmV2aWV3ZWQtYnk6IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hr
b3ZAbGluYXJvLm9yZz4NCj5FeGN1c2UgbWUsIHdoZXJlIGRpZCB5b3UgZ2V0IHRoYXQgZnJvbT8/
IEkgZGlkbid0IHItYiBpdCAoeWV0KS4NCg0KU29ycnksDQoNCkkgdGhpbmsgSSBqdXN0IG1pc3Np
bmcgdW5kZXJzdGFuZGluZyBhYm91dCB0aGlzIHRhZy4NCkkgdGhvdWdodCBpdCBzaG91bGQgYWRk
IGlmIHNvbWVvbmUgZ2l2ZSBhZHZpY2UgdG8gYSBwYXRoLg0KDQpTbyBJIGFkZCBpdCBiZWZvcmUg
eW91IHItYiBpdCwNCg0KPiBTaWduZWQtb2ZmLWJ5OiBIZXJtZXMgV3UgPEhlcm1lcy53dUBpdGUu
Y29tLnR3Pg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSBUaGUgViB2YWx1ZSBjb21wYXJl
IGxvb3AgZnJvbSBpID0gMCB0byBpID0gNCBhbmQgc2hhbGwgZXhpdCB3aXRoIGkgPT0gNSANCj4g
ICBpZiBhbGwgViBlbGVtZW50IG1hdGNoZXMNCj4gLSBMaW5rIHRvIHYyOiANCj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvci8yMDI1MDEwOS1maXgtaGRjcC12LWNvbXAtdjItMS03ZGNlMGE1OTUy
M2ZAaQ0KPiB0ZS5jb20udHcNCj4gDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gcHVsbCB0aGUgY2hl
Y2sgb2Ygc3RhdG1lbnQgImkiIG91dCBvZiBWIHZhbHVlIGNoZWNrIGxvb3ANCj4gLSBMaW5rIHRv
IHYxOiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDEwOC1maXgtaGRjcC12LWNv
bXAtdjEtMS05NDA0ODExODI1Y2RAaQ0KPiB0ZS5jb20udHcNCj4gLS0tDQo+ICBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2l0ZS1pdDY1MDUuYyB8IDUgKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPi0tDQo+V2l0aCBiZXN0IHdpc2hl
cw0KPkRtaXRyeQ0KDQpCci4NCkhlcm1lcw0K
