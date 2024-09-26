Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74648986F0B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 10:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFB010EB15;
	Thu, 26 Sep 2024 08:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="IegiOTK0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8410A10EB14
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 08:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=trOpQeIhuIuWT721yj96jjNl6Dwn+AWIxX9cOC/c9Ko=;
 b=IegiOTK0JB2ByK5MyB6yJfp41O+9JBAxNuLNCdH/nDd2nlmDOdPCaWsw
 svIHNGKU2bpBSQ/MJApcohhYCJldAbU/zQAqOAuVIMIDsh2CN5V2qb0LH
 +8kB/QwiH/kjQDrFlqCkER9CtFgnw1UXMlaZOiaA9RDPdpFP1Whr4Sof+
 4QHPlk9QVFx4onCPu37OcwQ5v32sxbf7YDhzlA3fbM76zp7SOM0Gu/Z7k
 7Dr6NCmHQ0yVCLjFz9dR7Yc6k0YvA335utVJe6V1oepM51cAT+3MkK0Wv
 BeKAnLVas1ZCmlTrAhBUbhl0UeV2rQN2E93bQpjjxyToE5aQKC4idOCUJ g==;
X-CSE-ConnectionGUID: JhVijtkCQcSUDaCli9zZ5g==
X-CSE-MsgGUID: 95cejNIQSSGWtgMN6l01KQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 26 Sep 2024 16:39:34 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 48Q8dVHj081730;
 Thu, 26 Sep 2024 16:39:31 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 16:39:30 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68%6]) with mapi id
 15.01.2507.039; Thu, 26 Sep 2024 16:39:30 +0800
From: <Hermes.Wu@ite.com.tw>
To: <dmitry.baryshkov@linaro.org>
CC: <Kenneth.Hung@ite.com.tw>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <angelogioacchino.delregno@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 10/11] drm/bridge: it6505: fix HDCP CTS ksv wait timer
Thread-Topic: [PATCH v4 10/11] drm/bridge: it6505: fix HDCP CTS ksv wait timer
Thread-Index: AQHbD+0B5FoTbAplhUmD/lCKfYxq0rJpvvzA
Date: Thu, 26 Sep 2024 08:39:30 +0000
Message-ID: <7ac7de7a5c7e417484bc2a4a1ad59ac3@ite.com.tw>
References: <20240926075134.22394-1-Hermes.Wu@ite.com.tw>
 <7pazkukfrskc6o2zd23h6o4wyt7ougjjgnmogy2effr2lof7di@7opphoswhebf>
In-Reply-To: <7pazkukfrskc6o2zd23h6o4wyt7ougjjgnmogy2effr2lof7di@7opphoswhebf>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [223.136.245.213]
x-tm-snts-smtp: 0D28B248CBFA2A82A0B39AFFF6C0CB0C08EFB7AB209D04BBF8C3EF6EDE0645682002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 48Q8dVHj081730
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

Pk9uIFRodSwgU2VwIDI2LCAyMDI0IGF0IDAzOjUxOjMzUE0gR01ULCBIZXJtZXMgV3Ugd3JvdGU6
DQo+PiBGcm9tOiBIZXJtZXMgV3UgPEhlcm1lcy53dUBpdGUuY29tLnR3Pg0KPj4gDQo+PiBXaGVu
IHJ1bm5pbmcgdGhlIEhEQ1AgQ1RTIHRlc3Qgb24gVU5JR1JBRiBEUFItMTAwLg0KPj4gSERDUCBt
dXN0IGRpc2FibGVkIGFmdGVyIHdhaXRpbmcgS1NWIGZvciA1cy4NCj4+IENvbnNpZGVyIHN5c3Rl
bSBrc3Ygd29yayBzY2hlZHVsZXMuIFRoZSBvcmlnaW5hbCB0aW1lciBoYXMgYSBjaGFuY2UgdG8g
ZXhwaXJlLg0KPg0KPkkgY2FuJ3QgdW5kZXJzdGFuZCB0d28gbGFzdCBzZW50ZW5jZXMsIGV4Y3Vz
ZSBtZS4NCj4NCj5OaXQ6IEtTViwgbm90IGtzdg0KDQpGb3JtIEhEQ1AgQ1RTLCBEVVQgc2hvdWxk
IHdhaXQgZG93bnN0cmVhbSBLU1YgbGlzdCBhdCBsZWFzdCA1cy4NCkFuZCBkcml2ZXIgdXNlIGEg
d2hpbGUgbG9vcCB3aXRoIGEgMjBtcyBzbGVlcCB0byByZWFjaCB0aGUgc2NvcGUuDQpUaGUgdHJ1
ZSB3YWl0IHRpbWVyIHdpbGwgcmVhY2ggMTBzIHdoaWNoIGlzIG11Y2ggbG9uZ2VyIHRoZW4gaXQg
c3VwcG9zZWQgdG8uDQoNCkl0IHNob3VsZCBiZXR0ZXIgdXNlIG90aGVyIEFQSXMgdG8gaW1wbGVt
ZW50IHRoaXMgd2FpdGluZywgcmF0aGVyIHRoYW4ganVzdCByZWR1Y2UgdGhlIGNvdW50ZXIuDQoN
Cgl0aW1lb3V0IC89IDIwOw0KCXdoaWxlICh0aW1lb3V0ID4gMCkgew0KCQlpZiAoIWl0NjUwNV9n
ZXRfc2lua19ocGRfc3RhdHVzKGl0NjUwNSkpDQoJCQlyZXR1cm47DQoNCgkJYnN0YXR1cyA9IGl0
NjUwNV9kcGNkX3JlYWQoaXQ2NTA1LCBEUF9BVVhfSERDUF9CU1RBVFVTKTsNCg0KCQlpZiAoYnN0
YXR1cyAmIERQX0JTVEFUVVNfUkVBRFkpDQoJCQlicmVhazsNCg0KCQltc2xlZXAoMjApOw0KCQl0
aW1lb3V0LS07DQoJfQ0KDQo+PiANCj4+IEZpeGVzOiBiNWM4NGE5ZWRjZDQgKCJkcm0vYnJpZGdl
OiBhZGQgaXQ2NTA1IGRyaXZlciIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBIZXJtZXMgV3UgPEhlcm1l
cy53dUBpdGUuY29tLnR3Pg0KPj4gLS0tDQo+PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pdGUt
aXQ2NTA1LmMgfCAzICsrLQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
aXRlLWl0NjUwNS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pdGUtaXQ2NTA1LmMNCj4+IGlu
ZGV4IGU3NWJjMTU3NWFhOC4uMjJkOWJlYzNmYWVhIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9pdGUtaXQ2NTA1LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvaXRlLWl0NjUwNS5jDQo+PiBAQCAtMjA5Myw3ICsyMDkzLDggQEAgc3RhdGljIHZvaWQgaXQ2
NTA1X2hkY3Bfd2FpdF9rc3ZfbGlzdChzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+PiAgCXN0
cnVjdCBpdDY1MDUgKml0NjUwNSA9IGNvbnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3QgaXQ2NTA1LA0K
Pj4gIAkJCQkJICAgICBoZGNwX3dhaXRfa3N2X2xpc3QpOw0KPj4gIAlzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSBpdDY1MDUtPmRldjsNCj4+IC0JdW5zaWduZWQgaW50IHRpbWVvdXQgPSA1MDAwOw0KPj4g
KwkvKiAxQi0wNCBmYWlsLCB3YWl0IHRvIGxvbmcgdG8gU3RvcCBlbmNyaXB0aW9uKDVzLT4zcyku
ICovDQo+DQo+ZW5jcnlwdGlvbiwgbW9zdCBsaWtlbHkgaXQncyBhbHNvICJ0b28gbG9uZyIuDQo+
DQo+PiArCXVuc2lnbmVkIGludCB0aW1lb3V0ID0gMzAwMDsNCj4NCj5XaGF0IGlzIHRoZSB0aW1l
b3V0IHBlciB0aGUgc3RhbmRhcmQ/DQo+DQo+PiAgCXU4IGJzdGF0dXMgPSAwOw0KPj4gIAlib29s
IGtzdl9saXN0X2NoZWNrOw0KPj4gIA0KPj4gLS0gDQo+PiAyLjM0LjENCj4+IA0KPg0KPi0tIA0K
PldpdGggYmVzdCB3aXNoZXMNCj5EbWl0cnkNCj4NCg==
