Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E54CECAC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 21:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058456E17B;
	Mon,  7 Oct 2019 19:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-oln040092068022.outbound.protection.outlook.com [40.92.68.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF296E17B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 19:21:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GnoD+86XFqVf4Yy/M/EJPHUCCP9/h1kPqs7mkxQfblqYKAl7ZxAq6iYdBNUF6L9fW/zoonhVBUd7I8mlXRLPvZiOYX35Q6yLFoZYOT698opg6Rv3IxXetXRw5azS6xp2oKAU2zT0C987am0ugrih9XQ0zsKv1sHykI50dhJLfb4i6i9mwmKup+LXkltKJp/wHeU5ypakbNNKQ2dczYDQLIdyd9S9rCr1M3vQCUGge5dLSL633ZMMQ5WZJDEjpaI8KW1MBR76w76EPggop8zvfRJ2G8Qgk0rJQGqVpaDuC91Dj6rFSjc10JxjIQzSuA+HiS3io/oqY9Xn4AejokOVUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnXj0bICwjFFFTZYWcocvCHmrP5bwb9fqSgT6TUAkSk=;
 b=G0mSLlJ4/zhOVgF5Mt8hiLPmfvUQIxekmc073k5om7Fvu3o8Ea6FfQ98cgNKq0HKh6bi4wMRKbXnM9Nd+rxuhwAjPDh78aZyZJfuXltztlSQbQ/7RMFegzAn5QjaMIadJLfVm/QXs3ryRybDM8RTzG2QWd74x6lafe34QPZrYV0J5GpLjzJuzp2c4Fuy20+QnZAAgv12HaVkguIB5pmynNCpho1JxWJxa6QKCT+teR4v0ogSVXMmEQGqpqfynbsOmMt8+WY86u/rGyuZskDj0uAPa2Itu7o0FhF0VnRKNG++2mb17FkjGw53+fL9w/EZsDv7l3QCdRTZlQ8t6KIjDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM5EUR02FT039.eop-EUR02.prod.protection.outlook.com
 (10.152.8.53) by AM5EUR02HT237.eop-EUR02.prod.protection.outlook.com
 (10.152.8.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.20; Mon, 7 Oct
 2019 19:21:49 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.8.55) by
 AM5EUR02FT039.mail.protection.outlook.com (10.152.9.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.20 via Frontend Transport; Mon, 7 Oct 2019 19:21:49 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8%4]) with mapi id 15.20.2305.023; Mon, 7 Oct 2019
 19:21:49 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: [PATCH v2 2/4] drm/rockchip: Enable DRM InfoFrame support on RK3328
 and RK3399
Thread-Topic: [PATCH v2 2/4] drm/rockchip: Enable DRM InfoFrame support on
 RK3328 and RK3399
Thread-Index: AQHVfUR3JXY5xQIOykGs74DZOna4XQ==
Date: Mon, 7 Oct 2019 19:21:49 +0000
Message-ID: <HE1PR06MB4011C9579CA6BBCD96C87810AC9B0@HE1PR06MB4011.eurprd06.prod.outlook.com>
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
x-incomingtopheadermarker: OriginalChecksum:5B4191A7D513587D91584953D25E71089F789E8C9B84D3AB94C404A59F6E4FB4;
 UpperCasedChecksum:4C7E7BF373A2D39586CBA1A8B452FB28FAB477C199FA7A95DEEC584251568002;
 SizeAsReceived:8097; Count:51
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn: [Ik4UVVWh8enDFLkh6mvDKU4vxxATQVVJ]
x-microsoft-original-message-id: <20191007192135.4525-2-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 51
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: AM5EUR02HT237:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ow4zPY79ymRpJptUu+nFn5y3wmL2LexQoFASdvU3V/4aIMrRTA0IXM+lrIg+RffJe0L0bJ36SsYVwus3gMIuk35CkEo+QDS7i/0pG/4gMI5WizynHOc5GuldcQmkgUw0TNe628UkgeQUsfbuPj03sfS9n61mgxYbKLgpYLW4h0OSqwVU1C3PRGwyhBQ6Njmx
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 46408731-acc1-47b7-c856-08d74b5b99e1
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 19:21:49.5660 (UTC)
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
b24gUkszMzI4IGFuZCBSSzMzOTkuCgpDYzogU2FuZHkgSHVhbmcgPGhqY0Byb2NrLWNoaXBzLmNv
bT4KQ2M6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+ClNpZ25lZC1vZmYtYnk6IEpv
bmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KUmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWVibmVy
IDxoZWlrb0BzbnRlY2guZGU+ClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNh
bXN1bmcuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlw
LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMKaW5kZXggOTA2ODkxYjAzYTM4Li43ZjU2
ZDhjMzQ5MWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJv
Y2tjaGlwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAu
YwpAQCAtNDUwLDYgKzQ1MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHdfaGRtaV9wbGF0X2Rh
dGEgcmszMzI4X2hkbWlfZHJ2X2RhdGEgPSB7CiAJLnBoeV9vcHMgPSAmcmszMzI4X2hkbWlfcGh5
X29wcywKIAkucGh5X25hbWUgPSAiaW5ub19kd19oZG1pX3BoeTIiLAogCS5waHlfZm9yY2VfdmVu
ZG9yID0gdHJ1ZSwKKwkudXNlX2RybV9pbmZvZnJhbWUgPSB0cnVlLAogfTsKIAogc3RhdGljIHN0
cnVjdCByb2NrY2hpcF9oZG1pX2NoaXBfZGF0YSByazMzOTlfY2hpcF9kYXRhID0gewpAQCAtNDY0
LDYgKzQ2NSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHdfaGRtaV9wbGF0X2RhdGEgcmszMzk5
X2hkbWlfZHJ2X2RhdGEgPSB7CiAJLmN1cl9jdHIgICAgPSByb2NrY2hpcF9jdXJfY3RyLAogCS5w
aHlfY29uZmlnID0gcm9ja2NoaXBfcGh5X2NvbmZpZywKIAkucGh5X2RhdGEgPSAmcmszMzk5X2No
aXBfZGF0YSwKKwkudXNlX2RybV9pbmZvZnJhbWUgPSB0cnVlLAogfTsKIAogc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdfaGRtaV9yb2NrY2hpcF9kdF9pZHNbXSA9IHsKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
