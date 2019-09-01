Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B87EA4A73
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2019 18:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC6889862;
	Sun,  1 Sep 2019 16:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-oln040092071045.outbound.protection.outlook.com [40.92.71.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BD689862
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2019 16:14:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCBFol1FSo+jVaGGeDDFGryn1DV7XxRrKzg+jynplZfH/X331wW6694G89oMx5QnIwq6+tFbz6uih2MwbGLYZiiDqx92flwgcRQXEDc9r8yVNaIRAADSpk+uRuBZ5UF9Gq0ptQSqK+GeaFnbe9rV/1INHTEdJwwCsEmI0bf3R1W1LPtKlhsPSr4Q86EoPUsWH4IEGK8nGa9oFcPwCf3ieX1LR0Suzt9zGqQtyYJ99tfiaqCuJigYXvLMeABDwG87d33uasNPSGQMUxbADKP69CE6h6GPyPF0AaobLjYgQKYgt4iPt+n1CPU6tOlL6v+/jRjBcf9Djwnkucb2UAB6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tVyJsnYu/muSVK4U3I+XApY3wyLPrfPJchIW7TdulA=;
 b=VC6zOzDn46MIcsx6ke1dD+7AB+2srx5f/sr6eXYV2CCRWR/undN2iiOoV0vGhusqCyeaz0pNyqgsUCRqjYXY9PrzcIIdvEDnDQnlghtED8DaFNPtMGcLHGa5CZsS3Nn29nNemMfqaNYsmjLi0uNnkMYnJ2aZqdbQPbV23Y+xTPSOqqldAUHie0QXxEKWf35ULH6E3sOhq2WRJTAiZfGrtZtMURBuBjNieH8XN7B6DJY+wPh136YK39K5r/MKk7aKiBjXHYIp3M9C4zHcUsbpVFCzYt7Mt7wF9sVXUfcZxcblxLHTd2kVunPNN0IA2qJ9qAeLAhxGCK0EpsNmZx8yPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (10.152.16.54) by AM5EUR03HT176.eop-EUR03.prod.protection.outlook.com
 (10.152.17.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Sun, 1 Sep
 2019 16:14:43 +0000
Received: from AM0PR06MB4004.eurprd06.prod.outlook.com (10.152.16.51) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Sun, 1 Sep 2019 16:14:43 +0000
Received: from AM0PR06MB4004.eurprd06.prod.outlook.com
 ([fe80::f13e:4f8e:6777:bb87]) by AM0PR06MB4004.eurprd06.prod.outlook.com
 ([fe80::f13e:4f8e:6777:bb87%5]) with mapi id 15.20.2220.021; Sun, 1 Sep 2019
 16:14:43 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: [PATCH 5/5] drm: dw-hdmi: update ELD on HPD event
Thread-Topic: [PATCH 5/5] drm: dw-hdmi: update ELD on HPD event
Thread-Index: AQHVYOBdkwNWYL4fs06Sbdhw7LQShQ==
Date: Sun, 1 Sep 2019 16:14:43 +0000
Message-ID: <AM0PR06MB4004F589E60DA4BA958FD316ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
References: <AM0PR06MB40049562E295DD62302C8DB7ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
 <20190901161426.1606-1-jonas@kwiboo.se>
In-Reply-To: <20190901161426.1606-1-jonas@kwiboo.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P190CA0022.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::32)
 To AM0PR06MB4004.eurprd06.prod.outlook.com
 (2603:10a6:208:b9::12)
x-incomingtopheadermarker: OriginalChecksum:19D77B1354EF3F02A9F8EE716E58885A525A7D27BB7CEB51996A298DCAEFA5DC;
 UpperCasedChecksum:63B0D6274CA04E015BA5AB2DFE8D3B7ECAACA3DEAA6B5846DC6F94129B9FAEE6;
 SizeAsReceived:7959; Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn: [LDAB+wgiQHiH+8AK7nSWcgFSAtLnhZUO]
x-microsoft-original-message-id: <20190901161426.1606-5-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:AM5EUR03HT176; 
x-ms-traffictypediagnostic: AM5EUR03HT176:
x-microsoft-antispam-message-info: 4RjpoEJcrk89gZdtEgSA2WDDlSbvxUtvPpx7urS02vhxKE1DqVA+6XLkb4KxOSr1ULDKywsEW5u+WHmd8zGG+2mvnqv5axP0KDrQ9whXMsQ+0XQ1xinsuMlGPmJ0RpnQtVc3NQUlFKFE4IyOyA4U9mbDa4f4zvs3FGRXs3TOSpGIvZuTpM214uOr+tPLu9H3
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 281d4fbc-de83-47ac-359c-08d72ef77fd6
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2019 16:14:43.6576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR03HT176
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXBkYXRlIGNvbm5lY3RvciBFTEQgb24gSFBEIGV2ZW50LCBmaXhlcyBzdGFsZSBFTEQgd2hlbgpI
RE1JIGNhYmxlIGlzIHVucGx1Z2dlZC9yZXBsdWdnZWQgb3IgQVZSIGlzIHBvd2VyZWQgb24vb2Zm
LgoKU2lnbmVkLW9mZi1ieTogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgMiArKwogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9k
dy1oZG1pLmMKaW5kZXggMGYwN2JlMWI1OTE0Li4wYTgyNjhiMjA1NjEgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCkBAIC0yMTc4LDYgKzIxNzgsOCBAQCBzdGF0
aWMgaW50IGR3X2hkbWlfY29ubmVjdG9yX3VwZGF0ZV9lZGlkKHN0cnVjdCBkcm1fY29ubmVjdG9y
ICpjb25uZWN0b3IsCiAJCWNlY19ub3RpZmllcl9zZXRfcGh5c19hZGRyX2Zyb21fZWRpZChoZG1p
LT5jZWNfbm90aWZpZXIsIGVkaWQpOwogCQlpZiAoYWRkX21vZGVzKQogCQkJcmV0ID0gZHJtX2Fk
ZF9lZGlkX21vZGVzKGNvbm5lY3RvciwgZWRpZCk7CisJCWVsc2UKKwkJCWRybV9lZGlkX3RvX2Vs
ZChjb25uZWN0b3IsIGVkaWQpOwogCQlrZnJlZShlZGlkKTsKIAl9IGVsc2UgewogCQlkZXZfZGJn
KGhkbWktPmRldiwgImZhaWxlZCB0byBnZXQgZWRpZFxuIik7Ci0tIAoyLjE3LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
