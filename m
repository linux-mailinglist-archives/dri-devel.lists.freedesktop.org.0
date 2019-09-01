Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F0EA4A6E
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2019 18:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AEA89852;
	Sun,  1 Sep 2019 16:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03olkn081f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::81f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9943B8954A
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2019 16:14:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BjnK2TI7rVYUfkkbcTmzFNdApEKkjKrtVmai9SvbfeJTHy6JNr3ufUnUgEMrvN+vchIRrOm2oYTsYDjoLQ+u1VeLrrOrPwieulFyetqI/47oF82uAS09SD4CE/lKpRLRF+RvSCopnytrPVFOhyfhJ/6NPvD+Clgd1Pm9Q+ITSWJ1lcKkiABOLjVl9AyUv6RX7fT4G4SBms+XMat+ViOLtR70ch9QCAdSm2J/MmBc5Mr2BFI2SwsCkBnfA/DwIjkZBH4VY9RJv29A9fVdP7cI6QxRwQmntjgdtq90AATydbiBV0wqNlXzazh1GR691G+SPbDWiXBUFOwtmMDPBQ+lnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P437qGjgHJ4joyGOSSESljNIDRvC8H1crQnH6bic4xs=;
 b=MwmRTKkWMcN1o6H1O5JAhjsPBOv/YK10oxDpQlsd/DvR3K44ArkenSlOzXDWj1q5YOcDKs6PW4pzLf/IfWwM65btRBUkdcsbtlL/KhKZbJcw7XqWQua5tY4muS4K1iayFKsDGfYc9svuiEkOCs+g6aTkbHnJjXtVrsb0qRppU5fuRnkwRmS58eXfdiI3EfEc6QBXQIj2uEKr/UeykJh8xDaSFlvobov3I53t50a9anOXW8uMOzUKXtp/KELZ+wfdx3WjwBsa/lEln4ezWZpo7mjL0lu8OKJ7zY+l6LNgBv7CcpJH1kF8ovPawD7UDPRCS4tDEqMJE84O/mF2XJqk/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (10.152.16.55) by AM5EUR03HT110.eop-EUR03.prod.protection.outlook.com
 (10.152.17.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Sun, 1 Sep
 2019 16:14:39 +0000
Received: from AM0PR06MB4004.eurprd06.prod.outlook.com (10.152.16.51) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Sun, 1 Sep 2019 16:14:39 +0000
Received: from AM0PR06MB4004.eurprd06.prod.outlook.com
 ([fe80::f13e:4f8e:6777:bb87]) by AM0PR06MB4004.eurprd06.prod.outlook.com
 ([fe80::f13e:4f8e:6777:bb87%5]) with mapi id 15.20.2220.021; Sun, 1 Sep 2019
 16:14:39 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: [PATCH 2/5] drm: dw-hdmi: move dw_hdmi_connector_detect()
Thread-Topic: [PATCH 2/5] drm: dw-hdmi: move dw_hdmi_connector_detect()
Thread-Index: AQHVYOBbWV8Th1TB7E6oSuxlJ5RnAQ==
Date: Sun, 1 Sep 2019 16:14:39 +0000
Message-ID: <AM0PR06MB400415A45BFD6956950D9251ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
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
x-incomingtopheadermarker: OriginalChecksum:228A8DD11B64B3E7666AB60E5E47A2B6F77C29E963B1A868DA1A6232157C26FB;
 UpperCasedChecksum:CE7EBE31092929AE617E0B96A530497F27B0603AFC17793DD6D92C5394E2CCBC;
 SizeAsReceived:7966; Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn: [bqiqt4RLDZA9AC3c+4twBG+KizakMsvz]
x-microsoft-original-message-id: <20190901161426.1606-2-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:AM5EUR03HT110; 
x-ms-traffictypediagnostic: AM5EUR03HT110:
x-microsoft-antispam-message-info: wrbaIbi9jsAy3dAvoqRNBmc0A4G7l+kE0rxUCqQxkAdZ3h6NHyGsXjbkQt/H7LuQj6leFZuc3fuSvQDhhJ/JtwuQcdKpv1stlJWrph6MNN1ccYNqJwpAHvc24YeI1TM25sa5n2ZKjI4hWRLI57Nxp+RSim8nNTFUP83RxjTdr2sCkPD5ndUh37e+nXmyiHLV
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 58bfefe2-773a-400a-57b0-08d72ef77d54
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2019 16:14:39.3552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR03HT110
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

TW92ZSBkd19oZG1pX2Nvbm5lY3Rvcl9kZXRlY3QoKSBpdCB3aWxsIGNhbGwgZHdfaGRtaV9jb25u
ZWN0b3JfdXBkYXRlX2VkaWQoKS4KClNpZ25lZC1vZmYtYnk6IEpvbmFzIEthcmxtYW4gPGpvbmFz
QGt3aWJvby5zZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWku
YyB8IDMwICsrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0
aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWkuYwppbmRleCA4YWIyMTRkYzVhZTcuLjkxZDg2ZGRkNjYyNCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKQEAgLTIxNTYsMjEgKzIxNTYsNiBAQCBz
dGF0aWMgdm9pZCBkd19oZG1pX3VwZGF0ZV9waHlfbWFzayhzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkK
IAkJCQkJICBoZG1pLT5yeHNlbnNlKTsKIH0KIAotc3RhdGljIGVudW0gZHJtX2Nvbm5lY3Rvcl9z
dGF0dXMKLWR3X2hkbWlfY29ubmVjdG9yX2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yLCBib29sIGZvcmNlKQotewotCXN0cnVjdCBkd19oZG1pICpoZG1pID0gY29udGFpbmVy
X29mKGNvbm5lY3Rvciwgc3RydWN0IGR3X2hkbWksCi0JCQkJCSAgICAgY29ubmVjdG9yKTsKLQot
CW11dGV4X2xvY2soJmhkbWktPm11dGV4KTsKLQloZG1pLT5mb3JjZSA9IERSTV9GT1JDRV9VTlNQ
RUNJRklFRDsKLQlkd19oZG1pX3VwZGF0ZV9wb3dlcihoZG1pKTsKLQlkd19oZG1pX3VwZGF0ZV9w
aHlfbWFzayhoZG1pKTsKLQltdXRleF91bmxvY2soJmhkbWktPm11dGV4KTsKLQotCXJldHVybiBo
ZG1pLT5waHkub3BzLT5yZWFkX2hwZChoZG1pLCBoZG1pLT5waHkuZGF0YSk7Ci19Ci0KIHN0YXRp
YyBpbnQgZHdfaGRtaV9jb25uZWN0b3JfdXBkYXRlX2VkaWQoc3RydWN0IGRybV9jb25uZWN0b3Ig
KmNvbm5lY3RvciwKIAkJCQkJICBib29sIGFkZF9tb2RlcykKIHsKQEAgLTIyMDEsNiArMjE4Niwy
MSBAQCBzdGF0aWMgaW50IGR3X2hkbWlfY29ubmVjdG9yX3VwZGF0ZV9lZGlkKHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3IsCiAJcmV0dXJuIHJldDsKIH0KIAorc3RhdGljIGVudW0gZHJt
X2Nvbm5lY3Rvcl9zdGF0dXMKK2R3X2hkbWlfY29ubmVjdG9yX2RldGVjdChzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yLCBib29sIGZvcmNlKQoreworCXN0cnVjdCBkd19oZG1pICpoZG1p
ID0gY29udGFpbmVyX29mKGNvbm5lY3Rvciwgc3RydWN0IGR3X2hkbWksCisJCQkJCSAgICAgY29u
bmVjdG9yKTsKKworCW11dGV4X2xvY2soJmhkbWktPm11dGV4KTsKKwloZG1pLT5mb3JjZSA9IERS
TV9GT1JDRV9VTlNQRUNJRklFRDsKKwlkd19oZG1pX3VwZGF0ZV9wb3dlcihoZG1pKTsKKwlkd19o
ZG1pX3VwZGF0ZV9waHlfbWFzayhoZG1pKTsKKwltdXRleF91bmxvY2soJmhkbWktPm11dGV4KTsK
KworCXJldHVybiBoZG1pLT5waHkub3BzLT5yZWFkX2hwZChoZG1pLCBoZG1pLT5waHkuZGF0YSk7
Cit9CisKIHN0YXRpYyBpbnQgZHdfaGRtaV9jb25uZWN0b3JfZ2V0X21vZGVzKHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3IpCiB7CiAJcmV0dXJuIGR3X2hkbWlfY29ubmVjdG9yX3VwZGF0
ZV9lZGlkKGNvbm5lY3RvciwgdHJ1ZSk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
