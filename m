Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D20A75DE1
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 04:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4EC10E02C;
	Mon, 31 Mar 2025 02:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="tFcLGzOk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 442 seconds by postgrey-1.36 at gabe;
 Mon, 31 Mar 2025 02:39:09 UTC
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B16410E02C
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 02:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iA3f52jFA+lq6THCqAb/gECUyUNRkxJmBlphm/SquZA=;
 b=tFcLGzOkjzRYUjlx4ZIlPdmT4YVOpJuxr2waL4wh1mO+/IOrzjuRqyKf
 yjJJXDriFudEzbuCwSJ2SJZfiqJegyG1Bcdr9P7TVuKDJdzaPDDL6xnjR
 qb/FpDzx/Ur0w6s3YWyGn59x2Ey8hAKmW0fZ3eHpKGVzf3Wy3U3SYXyM4
 Ht/L9Cya5RLWxAUplS2akFO92NPyVuhbiMi0XqnKUXsiqVpR5shzJhgDS
 dIgsfXwhdhXLCQ8QrQ+Zs7J/e4/ewUatOWoeEdDJTjzU9Loahzr/GkGQw
 cKTJjYk118BKVEXNIbl6WrnyJ3h2ar5yt+nB9+lEaRL9AtxA35GF1IYft A==;
X-CSE-ConnectionGUID: KSBTkPvTQl+kPesvv8E8bg==
X-CSE-MsgGUID: dLeVnKtfQOeGf4YF1UYAdw==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 31 Mar 2025 10:31:38 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 52V2VW3f072601;
 Mon, 31 Mar 2025 10:31:32 +0800 (+08)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 31 Mar 2025 10:31:31 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68%6]) with mapi id
 15.01.2507.039; Mon, 31 Mar 2025 10:31:30 +0800
From: <Hermes.Wu@ite.com.tw>
To: <dmitry.baryshkov@oss.qualcomm.com>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <Pet.Weng@ite.com.tw>, <Kenneth.Hung@ite.com.tw>,
 <treapking@chromium.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 3/5] drm/bridge: it6505: modify DP link auto training
Thread-Topic: [PATCH v2 3/5] drm/bridge: it6505: modify DP link auto training
Thread-Index: AQHboaOwCHmdnK1oI0KkOS6uODt6r7OMgHHg
Date: Mon, 31 Mar 2025 02:31:30 +0000
Message-ID: <a6dcfa0c0a1e4f799dacda908888729a@ite.com.tw>
References: <20250326-fix-link-training-v2-0-756c8306f500@ite.com.tw>
 <20250326-fix-link-training-v2-3-756c8306f500@ite.com.tw>
 <cyanpojalscyqlpvlefd5czuyd2prrstws73pmza3tecq2ha2g@aegoyfuf6na6>
In-Reply-To: <cyanpojalscyqlpvlefd5czuyd2prrstws73pmza3tecq2ha2g@aegoyfuf6na6>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.80.57]
x-tm-snts-smtp: 9B3CD0DA97848AB4F1402F632AA1677AB0E38159D36E648D321B443C121D4D262002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 52V2VW3f072601
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

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1p
dHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0uY29tPiANCj5TZW50OiBNb25kYXksIE1hcmNoIDMx
LCAyMDI1IDI6NDQgQU0NCj5UbzogSGVybWVzIFd1ICinZKjOp7spIDxIZXJtZXMuV3VAaXRlLmNv
bS50dz4NCj5DYzogQW5kcnplaiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+OyBOZWls
IEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz47IFJvYmVydCBGb3NzIDxyZm9z
c0BrZXJuZWwub3JnPjsgTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPjsgSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPjsgSmVybmVqIFNrcmFi
ZWMgPGplcm5lai5za3JhYmVjQGdtYWlsLmNvbT47IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVu
Lmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+OyBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5l
bC5vcmc+OyBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47IERhdmlkIEFp
cmxpZSA8YWlybGllZEBnbWFpbC5jb20+OyBTaW1vbmEgVmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+
OyBQZXQgV2VuZyAor86lyariKSA8UGV0LldlbmdAaXRlLmNvbS50dz47IEtlbm5ldGggSHVuZyAo
rHiuYa3bKSA8S2VubmV0aC5IdW5nQGl0ZS5jb20udHc+OyB0cmVhcGtpbmdAY2hyb21pdW0ub3Jn
OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnDQo+U3ViamVjdDogUmU6IFtQQVRDSCB2MiAzLzVdIGRybS9icmlkZ2U6IGl0NjUwNTog
bW9kaWZ5IERQIGxpbmsgYXV0byB0cmFpbmluZw0KPg0KPk9uIFdlZCwgTWFyIDI2LCAyMDI1IGF0
IDAxOjM0OjE1UE0gKzA4MDAsIEhlcm1lcyBXdSB2aWEgQjQgUmVsYXkgd3JvdGU6DQo+PiBGcm9t
OiBIZXJtZXMgV3UgPEhlcm1lcy53dUBpdGUuY29tLnR3Pg0KPj4gDQo+PiBJVDY1MDUgc3VwcG9y
dHMgSFcgbGluayB0cmFpbmluZyB3aGljaCB3aWxsIHdyaXRlIERQQ0QgYW5kIGNoZWNrIA0KPj4g
dHJhaW5pbmcgc3RhdHVzIGF1dG9tYXRpY2FsbHkuDQo+PiANCj4+IEluIHRoZSBjYXNlIHRoYXQg
ZHJpdmVyIHNldCBsaW5rIHJhdGUgYXQgMi43RyBhbmQgSFcgZmFpbCB0byB0cmFpbmluZywgDQo+
PiBpdCB3aWxsIGNoYW5nZSBsaW5rIGNvbmZpZ3VyYXRpb24gYW5kIHRyeSAxLjY1Ry4gQW5kIHRo
aXMgd2lsbCBjYXVzZSANCj4+IElOVF9WSURfRklGT19FUlJPUiB0cmlnZ2VyZWQgd2hlbiBsaW5r
IGNsb2NrIGlzIGNoYW5nZWQuDQo+PiANCj4+IFdoZW4gdmlkZW8gZXJyb3Igb2NjdXJzLCB2aWRl
byBsb2dpYyBpcyByZXNldCBhbmQgbGluayB0cmFpbmluZyANCj4+IHJlc3RhcnQsIHRoaXMgd2ls
bCBjYXVzZSBlbmRsZXNzIGF1dG8gbGluayB0cmFpbmluZy4NCj4+IA0KPj4gTW9kaWZ5IGxpbmsg
YXV0byB0cmFpbmluZyB3aXRoIGRpc2FibGUgSU5UX1ZJRF9GSUZPX0VSUk9SIHRvIGF2b2lkIA0K
Pj4gbG9vcCBhbmQgY2hlY2sgSU5UX0xJTktfVFJBSU5fRkFJTCBldmVudCB0byBhYm9ydCB3YWl0
IHRyYWluaW5nIGRvbmUuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEhlcm1lcyBXdSA8SGVybWVz
Lnd1QGl0ZS5jb20udHc+DQo+PiAtLS0NCj4+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2l0ZS1p
dDY1MDUuYyB8IDM4IA0KPj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQ0K
Pj4gIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4+
IA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jIA0K
Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2l0ZS1pdDY1MDUuYw0KPj4gaW5kZXggDQo+PiAw
NjA3Zjk5NDQ2YjM3YzgyYjQxYTM3NmMyZjRlMTBjNzU2NWQxYjYxLi5lMGUxM2U3Mzc3NjNmYjgw
MWZkMWNkODAzNzM0DQo+PiBhMGQ2YWUxZGQ4MTIgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2l0ZS1pdDY1MDUuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9pdGUtaXQ2NTA1LmMNCj4+IEBAIC0xODAwLDExICsxODAwLDIwIEBAIHN0YXRpYyB2b2lkIGl0
NjUwNV9saW5rX3RyYWluaW5nX3NldHVwKHN0cnVjdCANCj4+IGl0NjUwNSAqaXQ2NTA1KQ0KPj4g
IA0KPj4gIHN0YXRpYyBib29sIGl0NjUwNV9saW5rX3N0YXJ0X2F1dG9fdHJhaW4oc3RydWN0IGl0
NjUwNSAqaXQ2NTA1KSAgew0KPj4gLQlpbnQgdGltZW91dCA9IDUwMCwgbGlua190cmFpbmluZ19z
dGF0ZTsNCj4+ICsJaW50IGxpbmtfdHJhaW5pbmdfc3RhdGU7DQo+PiAgCWJvb2wgc3RhdGUgPSBm
YWxzZTsNCj4+ICAJaW50IGludDAzOw0KPj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBpdDY1MDUt
PmRldjsNCj4+ICsJdW5zaWduZWQgbG9uZyB0aW1lb3V0Ow0KPj4gKw0KPj4gKwlndWFyZChtdXRl
eCkoJml0NjUwNS0+YXV4X2xvY2spOw0KPg0KPlBsZWFzZSBkb24ndCBtaXggZnVuY3Rpb25hbCBj
aGFuZ2VzIGFuZCByZWZhY3RvcmluZy4NCj4NCj4+ICsJLyogRGlzYWJsZSBGSUZPIGVycm9yIGlu
dGVycnVwdCB0cmlnZ2VyICAqLw0KPj4gKwkvKiB0byBwcmV2ZW50IHRyYWluaW5nIGZhaWwgbG9v
cCBpc3N1ZSAgICovDQo+PiArCWl0NjUwNV9zZXRfYml0cyhpdDY1MDUsIElOVF9NQVNLXzAzLCBC
SVQoSU5UX1ZJRF9GSUZPX0VSUk9SKSwgMCk7DQo+PiArDQo+PiArCWl0NjUwNV93cml0ZShpdDY1
MDUsIElOVF9TVEFUVVNfMDMsDQo+PiArCQkgICAgIEJJVChJTlRfTElOS19UUkFJTl9GQUlMKSB8
IEJJVChJTlRfVklEX0ZJRk9fRVJST1IpKTsNCj4+ICANCj4+IC0JbXV0ZXhfbG9jaygmaXQ2NTA1
LT5hdXhfbG9jayk7DQo+PiAgCWl0NjUwNV9zZXRfYml0cyhpdDY1MDUsIFJFR19UUkFJTl9DVFJM
MCwNCj4+ICAJCQlGT1JDRV9DUl9ET05FIHwgRk9SQ0VfRVFfRE9ORSwgMHgwMCk7DQo+PiAgCS8q
IHJlc2V0IGxpbmsgc3RhdGUgbWFjaGluZSBhbmQgcmUgc3RhcnQgdHJhaW5pbmcqLyBAQCAtMTgx
MiwzMiANCj4+ICsxODIxLDQxIEBAIHN0YXRpYyBib29sIGl0NjUwNV9saW5rX3N0YXJ0X2F1dG9f
dHJhaW4oc3RydWN0IGl0NjUwNSAqaXQ2NTA1KQ0KPj4gIAkJICAgICBGT1JDRV9SRVRSQUlOIHwg
TUFOVUFMX1RSQUlOKTsNCj4+ICAJaXQ2NTA1X3dyaXRlKGl0NjUwNSwgUkVHX1RSQUlOX0NUUkwx
LCBBVVRPX1RSQUlOKTsNCj4+ICANCj4+IC0Jd2hpbGUgKHRpbWVvdXQgPiAwKSB7DQo+PiArCXRp
bWVvdXQgPSBqaWZmaWVzICsgbXNlY3NfdG9famlmZmllcygxMDApICsgMTsNCj4+ICsJZm9yICg7
Oykgew0KPj4gIAkJdXNsZWVwX3JhbmdlKDEwMDAsIDIwMDApOw0KPj4gIAkJbGlua190cmFpbmlu
Z19zdGF0ZSA9IGl0NjUwNV9yZWFkKGl0NjUwNSwgUkVHX0xJTktfVFJBSU5fU1RTKTsNCj4+ICAJ
CWludDAzID0gaXQ2NTA1X3JlYWQoaXQ2NTA1LCBJTlRfU1RBVFVTXzAzKTsNCj4+ICAJCWlmIChp
bnQwMyAmIEJJVChJTlRfTElOS19UUkFJTl9GQUlMKSkgew0KPj4gLQkJCWl0NjUwNV93cml0ZShp
dDY1MDUsIElOVF9TVEFUVVNfMDMsDQo+PiAtCQkJCSAgICAgQklUKElOVF9MSU5LX1RSQUlOX0ZB
SUwpKTsNCj4+IC0NCj4+ICAJCQlEUk1fREVWX0RFQlVHX0RSSVZFUihkZXYsDQo+PiAgCQkJCQkg
ICAgICJJTlRfTElOS19UUkFJTl9GQUlMKCV4KSEiLA0KPj4gIAkJCQkJICAgICAgaW50MDMpOw0K
Pj4gIA0KPj4gKwkJCS8qIElnbm9yZSBJTlRfVklEX0ZJRk9fRVJST1Igd2hlbiBhdXRvIHRyYWlu
aW5nIGZhaWwqLw0KPj4gKwkJCWl0NjUwNV93cml0ZShpdDY1MDUsIElOVF9TVEFUVVNfMDMsDQo+
PiArCQkJCSAgICAgQklUKElOVF9MSU5LX1RSQUlOX0ZBSUwpIHwNCj4+ICsJCQkJICAgICBCSVQo
SU5UX1ZJRF9GSUZPX0VSUk9SKSk7DQo+DQo+V2h5IGNhbid0IGl0IHN0YXkgd2hlcmUgaXQgd2Fz
Pw0KDQpEbyB5b3UgbWVhbiBzdGF5IGF0IG9yaWdpbmFsIElOVF9MSU5LX1RSQUlOX0ZBSUwgY2xl
YXIgYW5kIGp1c3QgYWRkIElOVF9WSURfRklGT19FUlJPUj8NCg0KDQo+PiArDQo+PiArCQkJaWYg
KGludDAzICYgQklUKElOVF9WSURfRklGT19FUlJPUikpDQo+PiArCQkJCURSTV9ERVZfREVCVUdf
RFJJVkVSKGRldiwNCj4+ICsJCQkJCQkgICAgICJ2aWRlbyBmaWZvIGVycm9yIHdoZW4gdHJhaW5p
bmcgZmFpbCIpOw0KPg0KPklzbid0IHRoZSBmaXJzdCBtZXNzYWdlIGVub3VnaD8NCg0KSXQganVz
dCBsZWF2ZSBmb3IgY2hlY2tpbmcgaWYgSU5UX1ZJRF9GSUZPX0VSUk9SIGhhcHBlbiwNClRoZSBm
aXJzdCBtZXNzYWdlIGhhcyBzaG93biBpbnQwMyB2YWx1ZSwgYW5kIHRoaXMgbWVzc2FnZSB3aWxs
IHJlbW92ZSBuZXh0IHBhdGNoLg0KPj4gKw0KPj4gIAkJCWJyZWFrOw0KPj4gIAkJfQ0KPj4gIA0K
Pj4gIAkJaWYgKGxpbmtfdHJhaW5pbmdfc3RhdGUgPiAwICYmDQo+PiAgCQkgICAgKGxpbmtfdHJh
aW5pbmdfc3RhdGUgJiBMSU5LX1NUQVRFX05PUlApKSB7DQo+PiAgCQkJc3RhdGUgPSB0cnVlOw0K
Pj4gLQkJCWdvdG8gdW5sb2NrOw0KPj4gKwkJCWJyZWFrOw0KPj4gIAkJfQ0KPj4gIA0KPj4gLQkJ
dGltZW91dC0tOw0KPj4gKwkJaWYgKHRpbWVfYWZ0ZXIoamlmZmllcywgdGltZW91dCkpDQo+PiAr
CQkJYnJlYWs7DQo+PiAgCX0NCj4+IC11bmxvY2s6DQo+PiAtCW11dGV4X3VubG9jaygmaXQ2NTA1
LT5hdXhfbG9jayk7DQo+PiAgDQo+PiArCS8qIHJlY292ZXIgaW50ZXJydXB0IHRyaWdnZXIqLw0K
Pj4gKwlpdDY1MDVfc2V0X2JpdHMoaXQ2NTA1LCBJTlRfTUFTS18wMywNCj4+ICsJCQlCSVQoSU5U
X1ZJRF9GSUZPX0VSUk9SKSwgQklUKElOVF9WSURfRklGT19FUlJPUikpOw0KPj4gIAlyZXR1cm4g
c3RhdGU7DQo+PiAgfQ0KPj4gIA0KPj4gDQo+PiAtLQ0KPj4gMi4zNC4xDQo+PiANCj4+IA0KPg0K
Pi0tDQo+V2l0aCBiZXN0IHdpc2hlcw0KPkRtaXRyeQ0KPg0KDQpCUiwNCkhlcm1lcw0KDQoNCg==
