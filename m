Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF89E99E46B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 12:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C5F10E0D2;
	Tue, 15 Oct 2024 10:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="HHSFu0Zb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BAB10E0D2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 10:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w/WDsGlXUC4WQB+TvCOJP04BD85zjGZUzm0yF1i3HlA=;
 b=HHSFu0Zb5BIX+7jgFzIkoZwMbWbmVAZBaNesch89kC1a2TLfEUKR/1nw
 C/AhXw7VfgRZoC/RtHgp+I5wglBwE0KCA364TA9hupNV1ZT8xfsGZ7usk
 2ewg+MROIwAUSHkeWxPISlI82PAYVmjIxnJVbNbPpOqJ0E7Piy/Mk0XQm
 O8jxgg8U+Hb4xG0kfV6cfQOKqIFoLo6w34Gj76N3s1Z43/PoO/dxW7uVF
 qhdypndP/EhqBq5p783ZslbC9N0hjn0KtPDDrkgqVc//A3KauphQbCVr/
 fPKKx8iEkJHstwTPcmVvfxmWhh1QRX9YuzWmSrGdrBu6lpIWiZQOkv9ma g==;
X-CSE-ConnectionGUID: MceUQWIbQ+aXS067n3EL8A==
X-CSE-MsgGUID: Fj+CEXsvQ++Jea+32boxBw==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 15 Oct 2024 18:44:57 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 49FAir1k051183;
 Tue, 15 Oct 2024 18:44:53 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 18:44:52 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68%6]) with mapi id
 15.01.2507.039; Tue, 15 Oct 2024 18:44:52 +0800
From: <Hermes.Wu@ite.com.tw>
To: <dmitry.baryshkov@linaro.org>
CC: <treapking@chromium.org>, <Kenneth.Hung@ite.com.tw>, <Pet.Weng@ite.com.tw>,
 <angelogioacchino.delregno@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <jernej.skrabec@gmail.com>,
 <jonas@kwiboo.se>, <Laurent.pinchart@ideasonboard.com>,
 <linux-kernel@vger.kernel.org>, <rfoss@kernel.org>
Subject: RE: [PATCH v5 00/10]drm/bridge: it6505: fix HDCP CTS fail items and
 add MCCS support
Thread-Topic: [PATCH v5 00/10]drm/bridge: it6505: fix HDCP CTS fail items and
 add MCCS support
Thread-Index: AQHbHkIrffFY0R32qUmdgv9WFdJjGbKHoDVA
Date: Tue, 15 Oct 2024 10:44:52 +0000
Message-ID: <145004ad363c42eb87e321cd88b00eea@ite.com.tw>
References: <20241001064305.32180-1-Hermes.Wu@ite.com.tw>
 <jd2wxdsgcgqhiek557i32c7god3cb2ic6bovyrmwsljkqtdofb@lrerfednnobl>
In-Reply-To: <jd2wxdsgcgqhiek557i32c7god3cb2ic6bovyrmwsljkqtdofb@lrerfednnobl>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.80.25]
x-tm-snts-smtp: 52B9A7E3246D09DEEC1EFEB01942D9790D5F17591F9EFEB804913B1A1BEEEBD52002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 49FAir1k051183
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

Pg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogRG1pdHJ5IEJhcnlzaGtvdiA8
ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPiANCj5TZW50OiBNb25kYXksIE9jdG9iZXIgMTQs
IDIwMjQgMTA6MDYgUE0NCj5UbzogSGVybWVzIFd1ICinZKjOp7spIDxIZXJtZXMuV3VAaXRlLmNv
bS50dz4NCj5DYzogUGluLXllbiBMaW4gPHRyZWFwa2luZ0BjaHJvbWl1bS5vcmc+OyBLZW5uZXRo
IEh1bmcgKKx4rmGt2ykgPEtlbm5ldGguSHVuZ0BpdGUuY29tLnR3PjsgUGV0IFdlbmcgKK/Opcmq
4ikgPFBldC5XZW5nQGl0ZS5jb20udHc+OyBBbGxlbiBDaGVuIDxhbGxlbi5jaGVuQGl0ZS5jb20u
dHc+OyBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdu
b0Bjb2xsYWJvcmEuY29tPjsgb3BlbiBsaXN0OkRSTSBEUklWRVJTIDxkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnPjsgSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQGdtYWlsLmNv
bT47IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT47IExhdXJlbnQgUGluY2hhcnQgPExh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT47IG9wZW4gbGlzdCA8bGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZz47IFJvYmVydCBGb3NzIDxyZm9zc0BrZXJuZWwub3JnPg0KPlN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjUgMDAvMTBdZHJtL2JyaWRnZTogaXQ2NTA1OiBmaXggSERDUCBDVFMg
ZmFpbCBpdGVtcyBhbmQgYWRkIE1DQ1Mgc3VwcG9ydA0KPg0KPk9uIFR1ZSwgT2N0IDAxLCAyMDI0
IGF0IDAyOjQyOjU5UE0gKzA4MDAsIEhlcm1lcyBXdSB3cm90ZToNCj4+IEZyb206IEhlcm1lcyBX
dSA8SGVybWVzLnd1QGl0ZS5jb20udHc+DQo+PiANCj4+IFRoaXMgaXMgYSB2NSBwYXRjaC1zZXQu
DQo+DQo+UGxlYXNlIGNoZWNrIHRoZSB3YXkgeW91IGFyZSBzZW5kaW5nIHlvdXIgcGF0Y2hlcy4g
Rm9yIHNvbWUgcmVhc29uIG15DQo+ZW1haWwgY2xpZW50IGxpc3RzIHBhdGNoZXMgMC00IHNlcGFy
YXRlbHksIHBhdGNoZXMgNi04IGFzIGEgc2VwYXJhdGUNCj50aHJlYWQgYW5kIHBhdGNoZXMgNSwg
OSwgMTAgYXMgaW5kaXZpZHVhbCBwYXRjaGVzLiBQbGVhc2UgdXNlIHNpbmdsZSBnaXQNCj5zZW5k
LWVtYWlsIGNvbW1hbmQgdG8gc2VuZCB0aGUgd2hvbGUgcGF0Y2hzZXQuDQoNClNlbmRpbmcgcGF0
Y2hlcyB1c2UgZ2l0IHNlbmQtZW1haWwgdmlhIHNtdHAgc2VydmVyIGluIGEgc2hvcnQgcGVyaW9k
IG9mIHRpbWUNCnJlYWNoIGxpbWl0cy4NCg0KTmV4dCBwYXRjaGVzIHdpbGwgdHJ5IHRvIHVzZSB3
ZWIgc3VibWlzc2lvbiBlbmRwb2ludA0KDQo+PiANCj4+IFRoZXJlIGFyZSBsb3RzIG9mIGZhaWx1
cmUgaXRlbXMgd2hpbGUgcnVubmluZyBIRENQIENUUyB1c2luZyBVTklHUkFGIERQUi0xMDAuDQo+
PiBJbiBPcmRlciB0byBmaXggdGhvc2UgZmFpbHVyZXMsIEhEQ1AgZmxvdyBuZWVkcyB0byBiZSBj
aGFuZ2VkLg0KPj4gDQo+PiBUaGUgRGlzcGxheVBvcnQgQVVYIHByb3RvY29sIHN1cHBvcnRzIEky
QyB0cmFuc3BvcnQuDQo+PiBJbiBPcmRlciB0byBzdXBwb3J0IE1DQ1MgdmlhIHRoZSBhdXggY2hh
bm5lbCwgdGhlIGF1eC1pMmMgb3BlcmF0aW9uIGlzIGFkZGVkLg0KPj4gDQo+PiB2NCAtPnY1Og0K
Pj4gCS1hZGQgbW9yZSBtZXNzYWdlcyBmb3IgY2hhbmdlcy4NCj4+IAktWzIvMTBdIG1vZGlmaWVk
IEFVWCB0cmFuc2ZlciBkYXRhIHNpemUganVkZ21lbnQuDQo+PiAJCWNoYW5nZSBmb3ItbG9vcCB0
byBkby13aGlsZS4NCj4+IAktWzcvMTBdIGNoYW5nZSBmb3ItbG9vcCB0byBkby13aGlsZS4NCj4+
IAktWzkvMTBdIGNoYW5nZSB3YWl0IHRpbWVyIHdpdGggdGltZXJfYWZ0ZXIoKQ0KPj4gDQo+PiAJ
bGlua3M6DQo+PiAJaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDI0MDkyNjA3NDc1NS4yMjE3Ni00LUhlcm1lcy5XdUBpdGUuY29tLnR3L19f
OyEhSHRuTEU4QSFBSEd3aEx1VTZheEczRTYwLUZjMU01Y1FWY19FVXdna2xuTjFuYzRZZURQM3d2
dFZ6VENvOEkydEVjdy1hRlNETHhFLVRERGpKZ1FIdzZSWUlmZUpmNEI0SkVURSQgDQo+PiAJaHR0
cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0
MDkyNjA3NTEzNC4yMjM5NC0xLUhlcm1lcy5XdUBpdGUuY29tLnR3L19fOyEhSHRuTEU4QSFBSEd3
aEx1VTZheEczRTYwLUZjMU01Y1FWY19FVXdna2xuTjFuYzRZZURQM3d2dFZ6VENvOEkydEVjdy1h
RlNETHhFLVRERGpKZ1FIdzZSWUlmZUpmMWVwX2Q0WCQgDQo+PiANCj4+IHYzIC0+djQ6DQo+PiAJ
LXNwbGl0IGNoYW5nZXMgIGludG8gcGF0Y2hlcy4NCj4+IA0KPj4gdjItID4gdjM6DQo+PiAJLXNw
bGl0IGF1eCByZWFkICBLU1YgZnVuY3Rpb24gdG8gYSBwYXRjaC4NCj4+IAktWzEvM10gbmV3IGlu
IHYzDQo+PiAJLVsyLzNdIGFkZCBkZXNjcmlwdGlvbiBvZiBwYXRjaA0KPj4gDQo+PiB2MSAtPiB2
MiA6DQo+PiAJLSBpZ25vcmVkLg0KPj4gDQo+PiANCj4+IA0KPj4gSGVybWVzIFd1ICgxMCk6DQo+
PiAgIGRybS9icmlkZ2U6IGl0NjUwNTogQ2hhbmdlIGRlZmluaXRpb24gb2YgQVVYX0ZJRk9fTUFY
X1NJWkUNCj4+ICAgZHJtL2JyaWRnZTogaXQ2NTA1OiBpbXByb3ZlIEFVWCBvcGVyYXRpb24gZm9y
IGVkaWQgcmVhZA0KPj4gICBkcm0vYnJpZGdlOiBpdDY1MDU6IGFkZCBBVVggb3BlcmF0aW9uIGZv
ciBIRENQIEtTViBsaXN0IHJlYWQNCj4+ICAgZHJtL2JyaWRnZTogaXQ2NTA1OiBDaGFuZ2UgZGVm
aW5pdGlvbiBNQVhfSERDUF9ET1dOX1NUUkVBTV9DT1VOVA0KPj4gICBkcm0vYnJpZGdlOiBpdDY1
MDU6IGZpeCBIRENQIEJzdGF0dXMgY2hlY2sNCj4+ICAgZHJtL2JyaWRnZTogaXQ2NTA1OiBmaXgg
SERDUCBlbmNyeXB0aW9uIHdoZW4gUjAgcmVhZHkNCj4+ICAgZHJtL2JyaWRnZTogaXQ2NTA1OiBm
aXggSERDUCBDVFMgS1NWIGxpc3QgcmVhZCB3aXRoIFVOSUdSQUYgRFBSLTEwMC4NCj4+ICAgZHJt
L2JyaWRnZTogaXQ2NTA1OiBmaXggSERDUCBDVFMgY29tcGFyZSBWIG1hdGNoaW5nDQo+PiAgIGRy
bS9icmlkZ2U6IGl0NjUwNTogZml4IEhEQ1AgQ1RTIEtTViBsaXN0IHdhaXQgdGltZXINCj4+ICAg
ZHJtL2JyaWRnZTogaXQ2NTA1OiBhZGQgSTJDIGZ1bmN0aW9uYWxpdHkgb24gQVVYDQo+PiANCj4+
ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2l0ZS1pdDY1MDUuYyB8IDMzNCArKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDI3NyBpbnNlcnRpb25zKCspLCA1
NyBkZWxldGlvbnMoLSkNCj4+IA0KPj4gLS0gDQo+PiAyLjM0LjENCj4+IA0KPg0KPi0tIA0KPldp
dGggYmVzdCB3aXNoZXMNCj5EbWl0cnkNCj4NCj4NCkJSLA0KSGVybWVzDQo=
