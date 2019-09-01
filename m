Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D92A4A6D
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2019 18:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8E58954A;
	Sun,  1 Sep 2019 16:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-oln040092072028.outbound.protection.outlook.com [40.92.72.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDF08954A
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2019 16:14:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vfq5qrgvJcB0AIw9xKECdaU0bgm2dOOph9PzcmPLMx12yjf4nVe2CCOCAvuF4YXIkiRL1vh1RqTvW5tiKaKvzoqFQ19qxVG1mdV3/3yJyJmfjdGJQ9bulfYL0gNUlJHUNMYwQBQx1fPTSmF4BhB9DfxIx+NmM5acgXa2AegVYAb3PtMh6jaU+vVErHW/S+Wn9YxWZA8kcEk0gs8QQ9DsSAq8woIWUoU+MnzIpvTjzSRgJDn+Ashg+zwOIomLLcl8iaI+Gz/oNp7omaNa+mYLMXsPIBvIgREqzxuuVxDPm52CcvhyckqCPtvB/xegDIBtbZX74ziwNwyZOyvL7RIm4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsXKj14BbN3yO6ooEs4gfQiqF04TtDyDFlyX3vv8+Ig=;
 b=Rp3MzqbxhI3KugmQ8GVBdxXiY+h4hflFNKdEkVAvyzoMFH7pe5jbw4K/rTouRauz2HejCZSKFOeeFis2VRjhMWUJ+yCdN8MAGAUHPOj3Gh7kstfcL6XGQzBEgc0WorjFqUvyHfV0MCmiK7bnalsA4UfkDronV5zo4QQlugxbpvws+zL1uUVnH5E0mshU4GE7VEfJfnhwpZ7dv+c5N78k/2gm7u5oVqX4L8WtANvczO1xNONjqMmJ/47riT0s9R52PAAaJWNdXSR0qfCMMlshpuO/ysPSVKdFllXMT7JHFcBNf2nuWN2F/jlLnYX7wkKQn7WZ+gpBhhPzQ2JjbYXHiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (10.152.16.51) by AM5EUR03HT063.eop-EUR03.prod.protection.outlook.com
 (10.152.17.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Sun, 1 Sep
 2019 16:14:38 +0000
Received: from AM0PR06MB4004.eurprd06.prod.outlook.com (10.152.16.51) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Sun, 1 Sep 2019 16:14:38 +0000
Received: from AM0PR06MB4004.eurprd06.prod.outlook.com
 ([fe80::f13e:4f8e:6777:bb87]) by AM0PR06MB4004.eurprd06.prod.outlook.com
 ([fe80::f13e:4f8e:6777:bb87%5]) with mapi id 15.20.2220.021; Sun, 1 Sep 2019
 16:14:38 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: [PATCH 1/5] drm: dw-hdmi: extract dw_hdmi_connector_update_edid()
Thread-Topic: [PATCH 1/5] drm: dw-hdmi: extract dw_hdmi_connector_update_edid()
Thread-Index: AQHVYOBa+gt+lOgjFEWqXGzvKljODQ==
Date: Sun, 1 Sep 2019 16:14:38 +0000
Message-ID: <AM0PR06MB4004C3231CA859341E6CF8B9ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
References: <AM0PR06MB40049562E295DD62302C8DB7ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
In-Reply-To: <AM0PR06MB40049562E295DD62302C8DB7ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P190CA0022.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::32)
 To AM0PR06MB4004.eurprd06.prod.outlook.com
 (2603:10a6:208:b9::12)
x-incomingtopheadermarker: OriginalChecksum:F1ECB234EA06E1118480C8CA772F9979C2A14A33673757250464D489195B8BE6;
 UpperCasedChecksum:2F23F3DFF9C32C165CF49CEFCB7187F12D2B02DAC863E49B7FBB9671E8B71B94;
 SizeAsReceived:7995; Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn: [AWGFRvZjHhoglXqlRsFM3Re0vav0xUWH]
x-microsoft-original-message-id: <20190901161426.1606-1-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:AM5EUR03HT063; 
x-ms-traffictypediagnostic: AM5EUR03HT063:
x-microsoft-antispam-message-info: I6au+WBFuYG8wZbNlYp+TaLC3oNMojTwaMU+Jcs7jiszbPqKRs16mEHK4rtIePgx7Tsyx8cv4BG/vBF2IfgH9Lvn3u6TypJ5yrsE6OZ2b1GrE9zQYR67azJaMM8cmtq7SC0skurDFt2uEE+IBoBqtu+/32jKJJIwJi7vict8szzzzmJpOi2trE+ur4DiAEZg
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 741be15a-ca1a-43fb-ae7e-08d72ef77ca2
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2019 16:14:38.2258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR03HT063
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

RXh0cmFjdCBjb2RlIHRoYXQgdXBkYXRlcyBFRElEIGludG8gYSBkd19oZG1pX2Nvbm5lY3Rvcl91
cGRhdGVfZWRpZCgpCmhlbHBlciwgaXQgd2lsbCBiZSBjYWxsZWQgZnJvbSBkd19oZG1pX2Nvbm5l
Y3Rvcl9kZXRlY3QoKS4KClNpZ25lZC1vZmYtYnk6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJv
by5zZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyB8IDEx
ICsrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKaW5kZXggNTIx
ZDY4OTQxM2M4Li44YWIyMTRkYzVhZTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctaGRtaS5jCkBAIC0yMTcxLDcgKzIxNzEsOCBAQCBkd19oZG1pX2Nvbm5lY3Rvcl9kZXRl
Y3Qoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwgYm9vbCBmb3JjZSkKIAlyZXR1cm4g
aGRtaS0+cGh5Lm9wcy0+cmVhZF9ocGQoaGRtaSwgaGRtaS0+cGh5LmRhdGEpOwogfQogCi1zdGF0
aWMgaW50IGR3X2hkbWlfY29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubmVjdG9yKQorc3RhdGljIGludCBkd19oZG1pX2Nvbm5lY3Rvcl91cGRhdGVfZWRpZChzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAorCQkJCQkgIGJvb2wgYWRkX21vZGVzKQogewog
CXN0cnVjdCBkd19oZG1pICpoZG1pID0gY29udGFpbmVyX29mKGNvbm5lY3Rvciwgc3RydWN0IGR3
X2hkbWksCiAJCQkJCSAgICAgY29ubmVjdG9yKTsKQEAgLTIxOTAsNyArMjE5MSw4IEBAIHN0YXRp
YyBpbnQgZHdfaGRtaV9jb25uZWN0b3JfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IpCiAJCWhkbWktPnNpbmtfaGFzX2F1ZGlvID0gZHJtX2RldGVjdF9tb25pdG9yX2F1
ZGlvKGVkaWQpOwogCQlkcm1fY29ubmVjdG9yX3VwZGF0ZV9lZGlkX3Byb3BlcnR5KGNvbm5lY3Rv
ciwgZWRpZCk7CiAJCWNlY19ub3RpZmllcl9zZXRfcGh5c19hZGRyX2Zyb21fZWRpZChoZG1pLT5j
ZWNfbm90aWZpZXIsIGVkaWQpOwotCQlyZXQgPSBkcm1fYWRkX2VkaWRfbW9kZXMoY29ubmVjdG9y
LCBlZGlkKTsKKwkJaWYgKGFkZF9tb2RlcykKKwkJCXJldCA9IGRybV9hZGRfZWRpZF9tb2Rlcyhj
b25uZWN0b3IsIGVkaWQpOwogCQlrZnJlZShlZGlkKTsKIAl9IGVsc2UgewogCQlkZXZfZGJnKGhk
bWktPmRldiwgImZhaWxlZCB0byBnZXQgZWRpZFxuIik7CkBAIC0yMTk5LDYgKzIyMDEsMTEgQEAg
c3RhdGljIGludCBkd19oZG1pX2Nvbm5lY3Rvcl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm5lY3RvcikKIAlyZXR1cm4gcmV0OwogfQogCitzdGF0aWMgaW50IGR3X2hkbWlfY29u
bmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQoreworCXJl
dHVybiBkd19oZG1pX2Nvbm5lY3Rvcl91cGRhdGVfZWRpZChjb25uZWN0b3IsIHRydWUpOworfQor
CiBzdGF0aWMgdm9pZCBkd19oZG1pX2Nvbm5lY3Rvcl9mb3JjZShzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yKQogewogCXN0cnVjdCBkd19oZG1pICpoZG1pID0gY29udGFpbmVyX29mKGNv
bm5lY3Rvciwgc3RydWN0IGR3X2hkbWksCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
