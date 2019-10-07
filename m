Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C65A5CECAB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 21:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6316E175;
	Mon,  7 Oct 2019 19:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02olkn080c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe07::80c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB6A6E175
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 19:21:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cengtP4VhDEdTrpkzSSAeaX1870ohQYBMSXdcYJs68cJ7adphrB4FkebpTKvO3urPicoeCs02I0w/6BVS29EGzvyrEg9wWNDDQ8aCU5WEdv12dabDwfKtI8ckSYh2AJmg3cY9kBhjyiSOZV6OjygaUG9VA2PM9qKPi6UM7eXGXUAfurDdLPG6X/uS8KxOxeFCDjsBzNpvrWU8KeclpUxyvQpHjsrNTVRghtz4iutVnBDGTOfjfEFTXybmIWS4hAdyT7yXfAoHWc75o+oxTvQF2V+GfsFWRiWooS6a65bK0aZJg1t/fwoXk+D2b7fv1URe6bboXnZ0aFMB25m/0w0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMr7TSAw59HeQij82vZcWLy+Seko8ouxQb5xqDWfYKU=;
 b=VtD+2DVsCXT44zo9/DQLeVjgmSyW5mx4nu6i1ZA01Wty0rRXzq0u+VF0tkCi6BIwbzdfuU440s552lHIT0/53dGrZ5PNp3tVLNvjpuoBpHiIlv2c0sGknsXNNecra3yhnEdU0T3A3EfYG/BEKfp42URiM6RcFdbdnhlPka8+BxyT532BtaAepsoJIuX1WFw5HINd879OT0uAncGFZFmDuddviHohHyCRpO6SUYCrVoKJnAHxpP7gWXcZQ9wS08uVBuiwe7iWbI2+Ky7201Em8uGDMnE1OlZSxmPfsPL7d4DCKqNGB8ULCgfrmRDoStszzxm+uRF4tVKHyj2RI+I1/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM5EUR02FT039.eop-EUR02.prod.protection.outlook.com
 (10.152.8.57) by AM5EUR02HT223.eop-EUR02.prod.protection.outlook.com
 (10.152.9.249) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.20; Mon, 7 Oct
 2019 19:21:52 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.8.55) by
 AM5EUR02FT039.mail.protection.outlook.com (10.152.9.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.20 via Frontend Transport; Mon, 7 Oct 2019 19:21:51 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8%4]) with mapi id 15.20.2305.023; Mon, 7 Oct 2019
 19:21:51 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: [PATCH v2 4/4] drm/sun4i: Enable DRM InfoFrame support on H6
Thread-Topic: [PATCH v2 4/4] drm/sun4i: Enable DRM InfoFrame support on H6
Thread-Index: AQHVfUR4DEVZhP0iNUCc+IpngvnB+Q==
Date: Mon, 7 Oct 2019 19:21:51 +0000
Message-ID: <HE1PR06MB40119DBC0DAE7BA251DF7074AC9B0@HE1PR06MB4011.eurprd06.prod.outlook.com>
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
x-incomingtopheadermarker: OriginalChecksum:2EC0351338A8C7C026F6C35DB4240C2DA494C07F5556F28F755AF783A6B0B62A;
 UpperCasedChecksum:A3DE7AC9E2901186DF0FE5F62BFB249AFA6EE6F7EC1C6EA3276DBE5B8BB88DD5;
 SizeAsReceived:8117; Count:51
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn: [+DGfIH1tljwW6plgLJs9J94ZJkul7ZgA]
x-microsoft-original-message-id: <20191007192135.4525-4-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 51
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: AM5EUR02HT223:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PgXf706xoIspInLE1UtGYXHnElulJYd9UqhcZYa/CAGEPt/XGjJf2t0SQ3b+TF2tOJRzs2r1pFILGLgJq6CYjFLokYGPUWt1VfPi/MEtQS1wAWxUDbJx9hplZV+sxhGIp4JRN0Cjn6NpBQ46ebyJTcrM/9fwP5kdWSoLCxhhKAWF+YV7T2kQjXihl+XkBPIz
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9e58ce-bd17-400d-ad90-08d74b5b9b27
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 19:21:51.7048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR02HT223
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
 Maxime Ripard <maxime.ripard@bootlin.com>, Kevin Hilman <khilman@baylibre.com>,
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
b24gSDYuCgpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KQ2M6
IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4KU2lnbmVkLW9mZi1ieTog
Sm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpk
YSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlf
ZHdfaGRtaS5jIHwgMiArKwogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuaCB8
IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRp
L3N1bjhpX2R3X2hkbWkuYwppbmRleCBhNDRkY2E0YjAyMTkuLmU4YTMxN2Q1YmExOSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5jCkBAIC0yMjYsNiArMjI2LDcgQEAgc3RhdGlj
IGludCBzdW44aV9kd19oZG1pX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNl
ICptYXN0ZXIsCiAJc3VuOGlfaGRtaV9waHlfaW5pdChoZG1pLT5waHkpOwogCiAJcGxhdF9kYXRh
LT5tb2RlX3ZhbGlkID0gaGRtaS0+cXVpcmtzLT5tb2RlX3ZhbGlkOworCXBsYXRfZGF0YS0+dXNl
X2RybV9pbmZvZnJhbWUgPSBoZG1pLT5xdWlya3MtPnVzZV9kcm1faW5mb2ZyYW1lOwogCXN1bjhp
X2hkbWlfcGh5X3NldF9vcHMoaGRtaS0+cGh5LCBwbGF0X2RhdGEpOwogCiAJcGxhdGZvcm1fc2V0
X2RydmRhdGEocGRldiwgaGRtaSk7CkBAIC0zMDAsNiArMzAxLDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBzdW44aV9kd19oZG1pX3F1aXJrcyBzdW44aV9hODN0X3F1aXJrcyA9IHsKIAogc3RhdGlj
IGNvbnN0IHN0cnVjdCBzdW44aV9kd19oZG1pX3F1aXJrcyBzdW41MGlfaDZfcXVpcmtzID0gewog
CS5tb2RlX3ZhbGlkID0gc3VuOGlfZHdfaGRtaV9tb2RlX3ZhbGlkX2g2LAorCS51c2VfZHJtX2lu
Zm9mcmFtZSA9IHRydWUsCiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBz
dW44aV9kd19oZG1pX2R0X2lkc1tdID0gewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1
bjRpL3N1bjhpX2R3X2hkbWkuaCBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV9kd19oZG1p
LmgKaW5kZXggZDcwN2M5MTcxODI0Li44ZTY0OTQ1MTY3ZTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9zdW40aS9zdW44aV9kd19oZG1pLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRp
L3N1bjhpX2R3X2hkbWkuaApAQCAtMTc5LDYgKzE3OSw3IEBAIHN0cnVjdCBzdW44aV9kd19oZG1p
X3F1aXJrcyB7CiAJZW51bSBkcm1fbW9kZV9zdGF0dXMgKCptb2RlX3ZhbGlkKShzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yLAogCQkJCQkgICBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlf
bW9kZSAqbW9kZSk7CiAJdW5zaWduZWQgaW50IHNldF9yYXRlIDogMTsKKwl1bnNpZ25lZCBpbnQg
dXNlX2RybV9pbmZvZnJhbWUgOiAxOwogfTsKIAogc3RydWN0IHN1bjhpX2R3X2hkbWkgewotLSAK
Mi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
