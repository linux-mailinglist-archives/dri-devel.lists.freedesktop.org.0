Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DF0CECAD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 21:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84176E182;
	Mon,  7 Oct 2019 19:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-oln040092068022.outbound.protection.outlook.com [40.92.68.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920266E182
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 19:21:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xs4KXq4b8XdBdUDOdF4XHoKkdFvwlliggUhL95TdT3RA7l1mGiccUBp540tNhYSRLeBQ7Fl39konDQ6aETdNKsQde6vfxoY8WUVNM/PGp2Io1yFzuAOnl6HRqZHrPmJlqxJO/3ubJboZ66oTnBmEAnpJrqjY2gQQFCGKuoQaPjJd31N38oCiEXmc+9VgblGu2Q4mlHdXxqNz2r3fT/vI1DXYVGeXuLpoE8LzPbQf0FfLRqQjRm5QmlWTR5zavSGukQAP0rvZ3gq2sUDyLIFxzh58ESp84EIlAkCO2fp9bbTv8BXIFbmHq1z4icT3GXTtJpUwYXzvJlU1zVV+Ue+r6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLc8L5qQCi0pUmElDMGjHX2OonOIUPq279NDhdighZY=;
 b=F8dmQOosEWP2j3UQoya/DyJnAMrjY1pvZ2hJ7P4ZRESI3qIMUUe4dSZZDqxB7iW5TKAKWIzK+Ib0xupvlk84LhXPBHn5DV24xvuu2SZggifb9Gal9UtwoUojNy9KCNH/pCa2dI9UDOdpH4N1MLLE1/5iYP+I5f0yXXg4p/gM2FM4dKI0qaZ5eSty9jbI0vzZ0ZvOOh/QMrFHkh1y08iJr1QLP8jwSI+9L8wtb+2V5MoNp1k2GTLYAT6x0h2LS7U3hupGwqBs9akMc8mOkfrll14hYfBjYzSYsfXbyZO3CH/RbXcJeOhmdqqOKX48CV/WtMkBeWc3XcJ0doKnRCEhGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM5EUR02FT039.eop-EUR02.prod.protection.outlook.com
 (10.152.8.53) by AM5EUR02HT237.eop-EUR02.prod.protection.outlook.com
 (10.152.8.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.20; Mon, 7 Oct
 2019 19:21:50 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.8.55) by
 AM5EUR02FT039.mail.protection.outlook.com (10.152.9.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.20 via Frontend Transport; Mon, 7 Oct 2019 19:21:50 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8%4]) with mapi id 15.20.2305.023; Mon, 7 Oct 2019
 19:21:50 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: [PATCH v2 3/4] drm/meson: Enable DRM InfoFrame support on GXL, GXM
 and G12A
Thread-Topic: [PATCH v2 3/4] drm/meson: Enable DRM InfoFrame support on GXL,
 GXM and G12A
Thread-Index: AQHVfUR4VXUsmRcTa0qRNMTEEkbniA==
Date: Mon, 7 Oct 2019 19:21:50 +0000
Message-ID: <HE1PR06MB4011BB614A49253FD074BCCBAC9B0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB401113BF395C06E96503344FAC9B0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191007192135.4525-1-jonas@kwiboo.se>
In-Reply-To: <20191007192135.4525-1-jonas@kwiboo.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P18901CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::28) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:8897984F656CAFD5D019FF35F86727E7B16C96EB020469B996F045C8F555B2DD;
 UpperCasedChecksum:E5069E95D2C647470642CF3B56BE12BF0A7E9B2DC05CAAF1A22AF3A2456BD95B;
 SizeAsReceived:8107; Count:51
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn: [7dsOqHODkpSjBsJFfy5pzr072GXio++K]
x-microsoft-original-message-id: <20191007192135.4525-3-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 51
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: AM5EUR02HT237:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IvFVas48xPXWo/HMtHsEk6xoQjEgWzAppPfOttnymx76pYP54z5g0HmvvGfe4h72Twp1zEHYYP1bGqc9OiEgkAWcrOa50UATpU5B1gmiU78sWgUDHNWS9m8jfWpuPbJoHpmZYhokD8gQFQs6XBjkdLEKMlYxscYBn8u83J3cg/eGQUOWetfNkFk8R8lztVN6
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d77ad6c-e0df-4707-7194-08d74b5b9a5f
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 19:21:50.5904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR02HT237
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
 Kevin Hilman <khilman@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBlbmFibGVzIER5bmFtaWMgUmFuZ2UgYW5kIE1hc3RlcmluZyBJbmZvRnJhbWUg
b24gR1hMLCBHWE0gYW5kIEcxMkEuCgpDYzogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5
bGlicmUuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+
ClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYyB8IDUgKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVzb24vbWVzb25fZHdfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hk
bWkuYwppbmRleCAwMjIyODZkYzZhYjIuLjNiYjdmZmU1ZmMzOSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVz
b24vbWVzb25fZHdfaGRtaS5jCkBAIC05NzcsNiArOTc3LDExIEBAIHN0YXRpYyBpbnQgbWVzb25f
ZHdfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAog
CWR3X3BsYXRfZGF0YS0+aW5wdXRfYnVzX2Zvcm1hdCA9IE1FRElBX0JVU19GTVRfWVVWOF8xWDI0
OwogCWR3X3BsYXRfZGF0YS0+aW5wdXRfYnVzX2VuY29kaW5nID0gVjRMMl9ZQ0JDUl9FTkNfNzA5
OwogCisJaWYgKGR3X2hkbWlfaXNfY29tcGF0aWJsZShtZXNvbl9kd19oZG1pLCAiYW1sb2dpYyxt
ZXNvbi1neGwtZHctaGRtaSIpIHx8CisJICAgIGR3X2hkbWlfaXNfY29tcGF0aWJsZShtZXNvbl9k
d19oZG1pLCAiYW1sb2dpYyxtZXNvbi1neG0tZHctaGRtaSIpIHx8CisJICAgIGR3X2hkbWlfaXNf
Y29tcGF0aWJsZShtZXNvbl9kd19oZG1pLCAiYW1sb2dpYyxtZXNvbi1nMTJhLWR3LWhkbWkiKSkK
KwkJZHdfcGxhdF9kYXRhLT51c2VfZHJtX2luZm9mcmFtZSA9IHRydWU7CisKIAlwbGF0Zm9ybV9z
ZXRfZHJ2ZGF0YShwZGV2LCBtZXNvbl9kd19oZG1pKTsKIAogCW1lc29uX2R3X2hkbWktPmhkbWkg
PSBkd19oZG1pX2JpbmQocGRldiwgZW5jb2RlciwKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
