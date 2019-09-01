Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B702A4A70
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2019 18:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96697895D7;
	Sun,  1 Sep 2019 16:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-oln040092072065.outbound.protection.outlook.com [40.92.72.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68F38968D
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2019 16:14:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e683ItcRYinKaRmiczp4ybWfQg5fjGqSAFjtELsrCT9L7bgZi+FDdu1t8gGgei2hqIsTWgoxsKVQ2qPpVZ8vSi/IBXMvgHPFqmDfP+0dBEQc4tQXl1luf+P+pxESV+ckMeFzCnlETk4PBLuvrLzxtpUcC12vHOV3vOpRSJ3OpVukvRVdv62vCy+kRyuNaqACIwPmCBhfE7yW1HzvQitZpb5ssCL7kKobWUjtGxILOxmkzdG+5HrWyZZHWTvCT9mrTDqyrSBF+cuJfj497o+oJCnbJLmTNaDfsJJQwLYqQxWnKyAf8Q7l0JOH3iBC/JQQIup3TDcbGyTHeq87G0Uz8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBbW2es+zEVxi1PJa2RuUXYr8tKyOCXV1lnyjw2zDHU=;
 b=hDNSVfSHodI6fmkCCCrqub1BAWWY+cKPEn/wtZJHLjBlpZLnMC3LlEmovuyar+eHfVVPtMvPGF2h/4akzf+65n+MJ3PFtOndazH+fgzcKpwq3CRHazbawtVaEx6chyLQZgYSGTdnw/fAn8NdzzeO80MmYMIGxUrit6Qal1PqlULOlDf8Hcm3uD51TYTQUInnza04NCRJHp18TkclcZWYzCWyVTnVQ4l4Z4ru8au3XJh3N9MXweO/Nx79of4t9GaAgtnyCP1TWEbYYFvDpRO3WYJBw1F7jKLRl+VgFmhiMXvtdOcZNH5XyNUvZlAJHqv/joyvf0qFDCQLWySpwSs56w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (10.152.16.51) by AM5EUR03HT010.eop-EUR03.prod.protection.outlook.com
 (10.152.16.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Sun, 1 Sep
 2019 16:14:40 +0000
Received: from AM0PR06MB4004.eurprd06.prod.outlook.com (10.152.16.51) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Sun, 1 Sep 2019 16:14:40 +0000
Received: from AM0PR06MB4004.eurprd06.prod.outlook.com
 ([fe80::f13e:4f8e:6777:bb87]) by AM0PR06MB4004.eurprd06.prod.outlook.com
 ([fe80::f13e:4f8e:6777:bb87%5]) with mapi id 15.20.2220.021; Sun, 1 Sep 2019
 16:14:40 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: [PATCH 3/5] drm: dw-hdmi: update CEC phys addr and EDID on HPD event
Thread-Topic: [PATCH 3/5] drm: dw-hdmi: update CEC phys addr and EDID on HPD
 event
Thread-Index: AQHVYOBbQpm/ZMlRykOhaECOU9r4vA==
Date: Sun, 1 Sep 2019 16:14:40 +0000
Message-ID: <AM0PR06MB4004285BAA935D14F1A68787ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
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
x-incomingtopheadermarker: OriginalChecksum:1F463C3D5BCABB046F9B08A9F9A9F40717038D88F37E3A3E8C7A6F2C4358B9BD;
 UpperCasedChecksum:F0FC40B25BB6A19D03E18C0A4EE87F0CA72A035A82E5C8BF327C10A3133D4FF3;
 SizeAsReceived:8000; Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn: [liv2rWy4Iqf8mgR7TuwgLhMEU2c1XhDZ]
x-microsoft-original-message-id: <20190901161426.1606-3-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:AM5EUR03HT010; 
x-ms-traffictypediagnostic: AM5EUR03HT010:
x-microsoft-antispam-message-info: CpBoPcxYXPGfvClL52zJAtARGuaXXSmUVZ2TzMwe5YSBrlyv7B5a8rLJuM4Fgl/wotl0k57z/9CieXw9QAWzSOPZE1ZjLwwkOv6WUCtptqxH+oP5n5DMCcQSRXU0RqRgYa+FOlffR+QENfserfhVP2T0VluVqkJ/ruWImFlhpRcWVCQT8/bXTi+LvoflHeDk
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a36b18-5bcd-41a9-d563-08d72ef77e07
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2019 16:14:40.5565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR03HT010
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

VXBkYXRlIENFQyBwaHlzIGFkZHIgYW5kIEVESUQgb24gSFBEIGV2ZW50LCBmaXhlcyBsb3N0IENF
QyBwaHlzIGFkZHIgYW5kCnN0YWxlIEVESUQgd2hlbiBIRE1JIGNhYmxlIGlzIHVucGx1Z2dlZC9y
ZXBsdWdnZWQgb3IgQVZSIGlzIHBvd2VyZWQgb24vb2ZmLgoKU2lnbmVkLW9mZi1ieTogSm9uYXMg
S2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lu
b3BzeXMvZHctaGRtaS5jIHwgMTYgKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lu
b3BzeXMvZHctaGRtaS5jCmluZGV4IDkxZDg2ZGRkNjYyNC4uMGYwN2JlMWI1OTE0IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwpAQCAtMjE4OSw2ICsyMTg5LDcg
QEAgc3RhdGljIGludCBkd19oZG1pX2Nvbm5lY3Rvcl91cGRhdGVfZWRpZChzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yLAogc3RhdGljIGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMKIGR3
X2hkbWlfY29ubmVjdG9yX2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBi
b29sIGZvcmNlKQogeworCWVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMgc3RhdHVzOwogCXN0cnVj
dCBkd19oZG1pICpoZG1pID0gY29udGFpbmVyX29mKGNvbm5lY3Rvciwgc3RydWN0IGR3X2hkbWks
CiAJCQkJCSAgICAgY29ubmVjdG9yKTsKIApAQCAtMjE5OCw3ICsyMTk5LDE0IEBAIGR3X2hkbWlf
Y29ubmVjdG9yX2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBib29sIGZv
cmNlKQogCWR3X2hkbWlfdXBkYXRlX3BoeV9tYXNrKGhkbWkpOwogCW11dGV4X3VubG9jaygmaGRt
aS0+bXV0ZXgpOwogCi0JcmV0dXJuIGhkbWktPnBoeS5vcHMtPnJlYWRfaHBkKGhkbWksIGhkbWkt
PnBoeS5kYXRhKTsKKwlzdGF0dXMgPSBoZG1pLT5waHkub3BzLT5yZWFkX2hwZChoZG1pLCBoZG1p
LT5waHkuZGF0YSk7CisKKwlpZiAoc3RhdHVzID09IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVk
KQorCQlkd19oZG1pX2Nvbm5lY3Rvcl91cGRhdGVfZWRpZChjb25uZWN0b3IsIGZhbHNlKTsKKwll
bHNlCisJCWNlY19ub3RpZmllcl9waHlzX2FkZHJfaW52YWxpZGF0ZShoZG1pLT5jZWNfbm90aWZp
ZXIpOworCisJcmV0dXJuIHN0YXR1czsKIH0KIAogc3RhdGljIGludCBkd19oZG1pX2Nvbm5lY3Rv
cl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKQEAgLTI0MzgsMTIg
KzI0NDYsNiBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgZHdfaGRtaV9pcnEoaW50IGlycSwgdm9pZCAq
ZGV2X2lkKQogCQlkd19oZG1pX3NldHVwX3J4X3NlbnNlKGhkbWksCiAJCQkJICAgICAgIHBoeV9z
dGF0ICYgSERNSV9QSFlfSFBELAogCQkJCSAgICAgICBwaHlfc3RhdCAmIEhETUlfUEhZX1JYX1NF
TlNFKTsKLQotCQlpZiAoKHBoeV9zdGF0ICYgKEhETUlfUEhZX1JYX1NFTlNFIHwgSERNSV9QSFlf
SFBEKSkgPT0gMCkgewotCQkJbXV0ZXhfbG9jaygmaGRtaS0+Y2VjX25vdGlmaWVyX211dGV4KTsK
LQkJCWNlY19ub3RpZmllcl9waHlzX2FkZHJfaW52YWxpZGF0ZShoZG1pLT5jZWNfbm90aWZpZXIp
OwotCQkJbXV0ZXhfdW5sb2NrKCZoZG1pLT5jZWNfbm90aWZpZXJfbXV0ZXgpOwotCQl9CiAJfQog
CiAJaWYgKGludHJfc3RhdCAmIEhETUlfSUhfUEhZX1NUQVQwX0hQRCkgewotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
