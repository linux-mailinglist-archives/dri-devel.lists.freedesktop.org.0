Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE5DCEC9F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 21:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A08C6E172;
	Mon,  7 Oct 2019 19:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-oln040092068038.outbound.protection.outlook.com [40.92.68.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661C96E172
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 19:19:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjmgCzaUG9jSZiWnOSiBV+xmIavg/NkJXNSJ37qSk3knVCu4kwQsun2NABwF2OGJ3FOLybnKhCaDWXXtRd/CZwP79+VGS5nd4DKNVo0uzpjJIvXz8+EadKjkvypwcAyPcaNSA5AS0GbjVjRnotc0ruSY/VgTM5q9TRbABBZ3l7znqVVp6vCYTSUQyL+FrgtXE459rfddjxr1CT/n6gVt7U9JWn/PjOc8Jvzd0b7+ENatOxWdcpsWONz4n58hwXbR0gqSpyGK7ny0xCwR19ncjZxKQ0ZaEcPpAluJR8UJNKRPk4bEvcX87wyHWPSTHpoItNk1wT6vHq4qcC+ZeRqlIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLEu1xc3P3RKdxFXu+vKgEYK/PW5YgadoJmbGU1SOvE=;
 b=DmJJ+SpxGxhmeO27XYZvhkRZRBoCVTcxHFxeTuUstDsE9s0fi11QkWf8i+7xZSwRez0ZAAE/EOewpAiiwJMW1wprziV/O5LPEGUgmpub7lG+52LpNWjtotMuvwZ1kapSmFZUkfSMO+v5HPuY7Og6szPy1jAoYDVNdLYGw625o1tgRN8XjZT3VITHUqMIG7m04rbTgnwN/Phqtv+LHfxzDe+Jnbn24c01F4glId0U5/6ERTGwzZgc0W4B4+5GePD0n8KUJUiOTEIBPOvCQUdPiRaWOS9IDy7n3tiLPmRlgx7fckhfcYaZ7M7EJYk7liTkyG42uV/3ZG4nM/G5HBscgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM5EUR02FT039.eop-EUR02.prod.protection.outlook.com
 (10.152.8.57) by AM5EUR02HT213.eop-EUR02.prod.protection.outlook.com
 (10.152.9.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.20; Mon, 7 Oct
 2019 19:19:47 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.8.55) by
 AM5EUR02FT039.mail.protection.outlook.com (10.152.9.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.20 via Frontend Transport; Mon, 7 Oct 2019 19:19:47 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8%4]) with mapi id 15.20.2305.023; Mon, 7 Oct 2019
 19:19:47 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: [PATCH v2 0/4] drm/bridge: dw-hdmi: Add support for HDR metadata
Thread-Topic: [PATCH v2 0/4] drm/bridge: dw-hdmi: Add support for HDR metadata
Thread-Index: AQHVfUQurFQBzCU6+EuK40TBL0GPJw==
Date: Mon, 7 Oct 2019 19:19:47 +0000
Message-ID: <HE1PR06MB401113BF395C06E96503344FAC9B0@HE1PR06MB4011.eurprd06.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0334.eurprd05.prod.outlook.com
 (2603:10a6:7:92::29) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:4CBAF161DB2D60BAC2CD9CF55CE156D41B210AF0B530EBD8D2D5913312D2F003;
 UpperCasedChecksum:4D66C1F43DF28FDD1B8F0104EBD516A1F69A8FB08B341AA2DC8F309BEB042DAD;
 SizeAsReceived:7861; Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn: [67XXOCwNI9MGz6/R2TSwEOErznrlI/wG]
x-microsoft-original-message-id: <20191007191930.4471-1-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: AM5EUR02HT213:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9KjcubaKobG3SOMZc9cr0ZbZnrDafEWbqkCuVYPGtQQ8goPvm79jRbBpFlGQ/xCJtx3mMzRqLikg3gZDz/HxXpdYouEQdosP93sLox+iEEak49zGsstSlQWmHLVe3Ny44aV6ujNMudiH10Fdj/9wBOCDmMVGmh4pUQpT7bLuYQZm/UaZWRJE9qPwrVnCE8T2
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: be8b4149-eb69-473c-9c54-08d74b5b5134
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 19:19:47.6242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR02HT213
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

QWRkIHN1cHBvcnQgZm9yIEhEUiBtZXRhZGF0YSB1c2luZyB0aGUgaGRyX291dHB1dF9tZXRhZGF0
YSBjb25uZWN0b3IgcHJvcGVydHksCmNvbmZpZ3VyZSBEeW5hbWljIFJhbmdlIGFuZCBNYXN0ZXJp
bmcgSW5mb0ZyYW1lIGFjY29yZGluZ2x5LgoKQSB1c2VfZHJtX2luZm9mcmFtZSBmbGFnIGlzIGFk
ZGVkIHRvIGR3X2hkbWlfcGxhdF9kYXRhIHRoYXQgcGxhdGZvcm0gZHJpdmVycwpjYW4gdXNlIHRv
IHNpZ25hbCB3aGVuIER5bmFtaWMgUmFuZ2UgYW5kIE1hc3RlcmluZyBpbmZvZnJhbWVzIGlzIHN1
cHBvcnRlZC4KVGhpcyBmbGFnIGlzIG5lZWRlZCBiZWNhdXNlIEFtbG9naWMgR1hCQiBhbmQgR1hM
IHJlcG9ydCBzYW1lIERXLUhETUkgdmVyc2lvbiwKYW5kIG9ubHkgR1hMIHN1cHBvcnQgRFJNIElu
Zm9GcmFtZS4KClRoZSBmaXJzdCBwYXRjaCBhZGQgZnVuY3Rpb25hbGl0eSB0byBjb25maWd1cmUg
RFJNIEluZm9GcmFtZSBiYXNlZCBvbiB0aGUKaGRyX291dHB1dF9tZXRhZGF0YSBjb25uZWN0b3Ig
cHJvcGVydHkuCgpUaGUgcmVtYWluaW5nIHBhdGNoZXMgc2V0cyB0aGUgdXNlX2RybV9pbmZvZnJh
bWUgZmxhZyBvbiBzb21lIFNvQ3Mgc3VwcG9ydGluZwpEeW5hbWljIFJhbmdlIGFuZCBNYXN0ZXJp
bmcgSW5mb0ZyYW1lLgoKdjIgaGFzIGJlZW4gcnVudGltZSB0ZXN0ZWQgb24gYSBSb2NrNjQgKFJL
MzMyOCkgYW5kIFJvY2sgUGkgNCAoUkszMzk5KSwKb25seSBidWlsZCB0ZXN0ZWQgZm9yIEFtbG9n
aWMgYW5kIEFsbHdpbm5lci4KCkNoYW5nZXMgaW4gdjI6CiAgKiBhZGRyZXNzIGNvbW1lbnRzIGZy
b20gQW5kcnplaiBIYWpkYQogIC0gcmVuYW1lZCBibG9iX2VxdWFsIHRvIGhkcl9tZXRhZGF0YV9l
cXVhbAogIC0gcmVuYW1lZCBkcm1faW5mb2ZyYW1lIGZsYWcgdG8gdXNlX2RybV9pbmZvZnJhbWUK
ICAtIHVzZSBoZG1pX2RybV9pbmZvZnJhbWVfcGFjayBhbmQgYSBsb29wIHRvIHdyaXRlIHJlZ3MK
ICAtIHJlbW92ZSBoZG1pIHZlcnNpb24gY2hlY2sgaW4gaGRtaV9jb25maWdfZHJtX2luZm9mcmFt
ZQoKSm9uYXMgS2FybG1hbiAoNCk6CiAgZHJtL2JyaWRnZTogZHctaGRtaTogQWRkIER5bmFtaWMg
UmFuZ2UgYW5kIE1hc3RlcmluZyBJbmZvRnJhbWUgc3VwcG9ydAogIGRybS9yb2NrY2hpcDogRW5h
YmxlIERSTSBJbmZvRnJhbWUgc3VwcG9ydCBvbiBSSzMzMjggYW5kIFJLMzM5OQogIGRybS9tZXNv
bjogRW5hYmxlIERSTSBJbmZvRnJhbWUgc3VwcG9ydCBvbiBHWEwsIEdYTSBhbmQgRzEyQQogIGRy
bS9zdW40aTogRW5hYmxlIERSTSBJbmZvRnJhbWUgc3VwcG9ydCBvbiBINgoKIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jICAgfCA4MSArKysrKysrKysrKysrKysrKysr
KysKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5oICAgfCAzNyArKysr
KysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jICAgICAgIHwgIDUg
KysKIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMgfCAgMiArCiBk
cml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5jICAgICAgIHwgIDIgKwogZHJpdmVy
cy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuaCAgICAgICB8ICAxICsKIGluY2x1ZGUvZHJt
L2JyaWRnZS9kd19oZG1pLmggICAgICAgICAgICAgICAgfCAgMSArCiA3IGZpbGVzIGNoYW5nZWQs
IDEyOSBpbnNlcnRpb25zKCspCgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
