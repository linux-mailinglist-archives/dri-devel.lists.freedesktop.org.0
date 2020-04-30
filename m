Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8301C0E9C
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2620C6EA7E;
	Fri,  1 May 2020 07:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from skedge03.snt-world.com (skedge03.snt-world.com [91.208.41.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341936E922;
 Thu, 30 Apr 2020 15:30:08 +0000 (UTC)
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
 by skedge03.snt-world.com (Postfix) with ESMTP id BC80367A902;
 Thu, 30 Apr 2020 17:30:06 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 30 Apr
 2020 17:30:06 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1913.007; Thu, 30 Apr 2020 17:30:06 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Daniel Baluta <daniel.baluta@nxp.com>, Adam Ford <aford173@gmail.com>,
 Anson Huang <Anson.Huang@nxp.com>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Fabio Estevam <festevam@gmail.com>, "Leonard
 Crestez" <leonard.crestez@nxp.com>, Li Jun <jun.li@nxp.com>, Lucas Stach
 <l.stach@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Peng Fan
 <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, "Russell
 King" <linux+etnaviv@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [RFC PATCH 1/4] drm/etnaviv: Prevent IRQ triggering at probe time
 on i.MX8MM
Thread-Topic: [RFC PATCH 1/4] drm/etnaviv: Prevent IRQ triggering at probe
 time on i.MX8MM
Thread-Index: AQHWHu1RaS/QCZFEh0aIMChy0QTuwqiRlogAgAASiIA=
Date: Thu, 30 Apr 2020 15:30:06 +0000
Message-ID: <8c724ada-2989-d2ad-b820-b16dbdd97f9b@kontron.de>
References: <20200430124602.14463-1-frieder.schrempf@kontron.de>
 <20200430124602.14463-2-frieder.schrempf@kontron.de>
 <5c4c994b-8868-f68c-cd0d-7f7a2530f697@nxp.com>
In-Reply-To: <5c4c994b-8868-f68c-cd0d-7f7a2530f697@nxp.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <023057C8A33D2E47B60978F651F2D072@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: BC80367A902.AE45A
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: aford173@gmail.com, anson.huang@nxp.com,
 christian.gmeiner@gmail.com, daniel.baluta@nxp.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, festevam@gmail.com, jun.li@nxp.com,
 kernel@pengutronix.de, l.stach@pengutronix.de,
 leonard.crestez@nxp.com, linux+etnaviv@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 linux-kernel@vger.kernel.org, peng.fan@nxp.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, shengjiu.wang@nxp.com
X-Spam-Status: No
X-Mailman-Approved-At: Fri, 01 May 2020 07:22:25 +0000
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzAuMDQuMjAgMTY6MjMsIERhbmllbCBCYWx1dGEgd3JvdGU6DQo+IE9uIDQvMzAvMjAgMzo0
NiBQTSwgU2NocmVtcGYgRnJpZWRlciB3cm90ZToNCj4+ICvCoMKgwqAgLyoNCj4+ICvCoMKgwqDC
oCAqIE9uIGkuTVg4TU0gdGhlcmUgaXMgYW4gaW50ZXJydXB0IGdldHRpbmcgdHJpZ2dlcmVkIGlt
bWVkaWF0ZWx5DQo+PiArwqDCoMKgwqAgKiBhZnRlciByZXF1ZXN0aW5nIHRoZSBJUlEsIHdoaWNo
IGxlYWRzIHRvIGEgc3RhbGwgYXMgdGhlIGhhbmRsZXINCj4+ICvCoMKgwqDCoCAqIGFjY2Vzc2Vz
IHRoZSBHUFUgcmVnaXN0ZXJzIHdoaXRob3V0IHRoZSBjbG9jayBiZWluZyBlbmFibGVkLg0KPj4g
K8KgwqDCoMKgICogRW5hYmxpbmcgdGhlIGNsb2NrcyBicmllZmx5IHNlZW1zIHRvIGNsZWFyIHRo
ZSBJUlEgc3RhdGUsIHNvIA0KPj4gd2UgZG8NCj4+ICvCoMKgwqDCoCAqIHRoaXMgaGVyZSBiZWZv
cmUgcmVxdWVzdGluZyB0aGUgSVJRLg0KPj4gK8KgwqDCoMKgICovDQo+PiArwqDCoMKgIGVyciA9
IGV0bmF2aXZfZ3B1X2Nsa19lbmFibGUoZ3B1KTsNCj4+ICvCoMKgwqAgaWYgKGVycikNCj4+ICvC
oMKgwqDCoMKgwqDCoCByZXR1cm4gZXJyOw0KPj4gKw0KPj4gK8KgwqDCoCBlcnIgPSBldG5hdml2
X2dwdV9jbGtfZGlzYWJsZShncHUpOw0KPj4gK8KgwqDCoCBpZiAoZXJyKQ0KPj4gK8KgwqDCoMKg
wqDCoMKgIHJldHVybiBlcnI7DQo+PiArDQo+PiArwqDCoMKgIGVyciA9IGRldm1fcmVxdWVzdF9p
cnEoJnBkZXYtPmRldiwgZ3B1LT5pcnEsIGlycV9oYW5kbGVyLCAwLA0KPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfbmFtZShncHUtPmRldiksIGdwdSk7DQo+PiAr
wqDCoMKgIGlmIChlcnIpIHsNCj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgImZhaWxl
ZCB0byByZXF1ZXN0IElSUSV1OiAlZFxuIiwgZ3B1LT5pcnEsIGVycik7DQo+PiArwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIGVycjsNCj4+ICvCoMKgwqAgfQ0KPiANCj4gU2hvdWxkbid0IHlvdSBkaXNh
YmxlIHRoZSBjbGsgYWZ0ZXIgZGV2bV9yZXF1ZXN0X2lycSBpcyBjYWxsZWQ/DQoNClRoYXQncyB3
aGF0IEkgZmlyc3QgdGhvdWdodCwgdG9vLiBCdXQgdGhlbiBJIGZvdW5kIG91dCwgdGhhdCBtZXJl
bHkgDQplbmFibGluZyB0aGUgY2xvY2tzIHdpbGwgY2xlYXIgdGhlIHNwYXJzZSBpbnRlcnJ1cHQg
YW5kIGNhdXNlIHRoZSANCmhhbmRsZXIgbm90IHRvIGJlIGNhbGxlZCBkdXJpbmcgcHJvYmUgYW55
bW9yZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
