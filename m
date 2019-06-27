Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 552C858567
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 17:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59C66E4F4;
	Thu, 27 Jun 2019 15:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rfout1.hes.trendmicro.com (rfout1.hes.trendmicro.com
 [54.193.4.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59CC6E4F4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 15:18:07 +0000 (UTC)
Received: from 0.0.0.0_hes.trendmicro.com (unknown [10.64.14.197])
 by rfout1.hes.trendmicro.com (Postfix) with ESMTPS id 9F6871126363
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 15:18:07 +0000 (UTC)
Received: from 0.0.0.0_hes.trendmicro.com (unknown [10.64.10.30])
 by rout1.hes.trendmicro.com (Postfix) with SMTP id 0CD9FEFC080;
 Thu, 27 Jun 2019 15:18:07 +0000 (UTC)
Received: from IND01-MA1-obe.outbound.protection.outlook.com (unknown
 [104.47.100.52])
 by relay1.hes.trendmicro.com (TrendMicro Hosted Email Security) with ESMTPS id
 678F4AFA018; Thu, 27 Jun 2019 15:18:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=H9GT1ItdO636RMkqpwHFDYeMQxYbHfDsOlTRQmZN6KdoxlN1qti1zddwCFHfAJcjuFibmrKOwOaNzqgcLdsERhNEzJfiQES8UynvF6Oc2C4TgiQU+dLdf7UAQiZ67EF+RG3oJH8DFqgHEjPlu9ACV+kHTgmSDsZ95DDrbLbjCdQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZY/k8UR77eYZU6JIYfLuzj484cpYuiXBWFLAl4Ce6I=;
 b=jgeuFBsK+kfgOyI0y+4kk+bDUfrlWXad1JNTYUpqEwIYr5yUaDGZxLv/fULeV8BzG8wreZ6/xdZnw3YDZHpN0SqW6T8Wwj/m8bgiHVCwJPFKDqSOQNMJ03vB7SvAs+aXN/WjBh5r5fi6VjKM+iq6nmvWu+OUCX4RN/viGfDGVKM=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM (10.174.217.139) by
 BMXPR01MB3030.INDPRD01.PROD.OUTLOOK.COM (52.133.134.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 27 Jun 2019 15:18:00 +0000
Received: from BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9bc:4b68:1344:f1ce]) by BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9bc:4b68:1344:f1ce%7]) with mapi id 15.20.2008.018; Thu, 27 Jun 2019
 15:18:00 +0000
From: Matt Redfearn <matt.redfearn@thinci.com>
To: Archit Taneja <architt@codeaurora.org>, Andrzej Hajda
 <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Thierry Reding
 <thierry.reding@gmail.com>
Subject: [PATCH v2] drm/bridge: adv7511: Attach to DSI host at probe time
Thread-Topic: [PATCH v2] drm/bridge: adv7511: Attach to DSI host at probe time
Thread-Index: AQHVLPuBf6e2UB9VrkOb0fCrDf7+Wg==
Date: Thu, 27 Jun 2019 15:18:00 +0000
Message-ID: <20190627151740.2277-1-matt.redfearn@thinci.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0446.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::26) To BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:13::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [87.242.198.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07a2561c-f303-4854-261a-08d6fb12a425
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BMXPR01MB3030; 
x-ms-traffictypediagnostic: BMXPR01MB3030:
x-microsoft-antispam-prvs: <BMXPR01MB303037C8A08D449DEC0B13ECF1FD0@BMXPR01MB3030.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39840400004)(136003)(346002)(376002)(396003)(366004)(189003)(199004)(66066001)(4326008)(71190400001)(71200400001)(25786009)(305945005)(186003)(54906003)(81166006)(8936002)(6506007)(66556008)(386003)(1076003)(64756008)(66476007)(8676002)(478600001)(68736007)(50226002)(81156014)(26005)(66446008)(52116002)(2616005)(486006)(476003)(5660300002)(73956011)(66946007)(6512007)(7736002)(53936002)(3846002)(110136005)(5024004)(36756003)(102836004)(14444005)(6116002)(6436002)(256004)(99286004)(2906002)(6486002)(316002)(7416002)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BMXPR01MB3030;
 H:BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: thinci.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: axy6Oh24s/HWfx1tjHD84Ge8x/lhsq/Si8VC+o1eLwLyXWW12pBPzjDJXDMsfVPD+SyWq4vK496ZNHQOqzoPeO/wDOhoIdKH2FkXIM8Ysllzy4gJcrPzHpVSMOQgzsiqCVo6xSJo6yTyrlV/dc8ojCZfJ2kFFT9J1KoAVudmzPQG0Xi0KdBqamPqT8a11u/QZPUEtjiPSSM+50LHG0IUwG9CNjALuryTk1NWhfUQLYVIEXg+yBNiJfkXkCYYlfsI9xAvdkL40+ZN34lXB0nKYxNp3Y+emdO9hNLM/V7xa336WLPTCyWaZWomZJUye1HkGbbDa3Iku7C05sI0ZibrI1aW/vDOlShogovYS9YXabuM3c9XHL61YnKFhc2zUa58PHX4CO5yFvQRnIRN5SXyhI02YZGuZhmh1WKCSb/K9K4=
MIME-Version: 1.0
X-OriginatorOrg: thinci.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a2561c-f303-4854-261a-08d6fb12a425
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 15:18:00.3296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: matthew.redfearn@thinci.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB3030
X-TMASE-Version: StarCloud-1.3-8.2.1013-24722.000
X-TMASE-Result: 10--2.485800-4.000000
X-TMASE-MatchedRID: zQoDEar/LDjabBVcqlDcF0OLK43kW8U2XGjQf7uckKtSMUnCl2ZytCAC
 Ytpe6t5bLU30xMI04OOpQXNdjc3qgVdXhVJKmheRB89GKHo03nY5lSSSzBNFmPkuQv9PIVnNCuo
 xZM5aA8MRsDs7NFENSPFzX2yG+axfgJawayKJkD8sWKt1qrD4oUtc8DbogbSE31GU/N5W5BB4pq
 O87q5acOFHPH5lCktzviTqhu0vM00DB9NQYvNufm6HurDH4PpPc8WBPuRcugDJZP0jINAqUKPFj
 JEFr+olUkOfGeXobzQ1NebtJxIilNLvsKjhs0ldC24oEZ6SpSmb4wHqRpnaDrT7TEI5CSZDM7Ky
 rst+Onx+mRD0to5VPYTzHHaGd4K9M8+iDpAkUYPTpamMhVjlNOxKrs7JVGG2hkIeTok3OE3HJde
 LBZpAwANZw39tzKOjg1QYrp1kjWz/pvgJGwohuvlyhYNumVjFZyMWcibO/JI=
X-TM-Deliver-Signature: 54BDCC41FEC3250CB5E933A2685106EF
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thinciit.onmicrosoft.com; s=selector2-thinciit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZY/k8UR77eYZU6JIYfLuzj484cpYuiXBWFLAl4Ce6I=;
 b=iaICKttnQsxBX4qnHZCiZi3n/e6VZAcZ5TCoKdR7Vga26AKzRnUe/mcW9euFGIPqTeHsHjaRMscnFlGgXf3PrOqFVDicUGBQZowwQWu0svaF+tlrF9oseA6yIn2iIX9ujZ9RmDbGJT7Nhiy7Fcj8GYO7IaVyFnkinknt9yVImu0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=matthew.redfearn@thinci.com; 
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Redfearn <matthew.redfearn@thinci.com>,
 Sean Paul <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gY29udHJhc3QgdG8gYWxsIG9mIHRoZSBEU0kgcGFuZWwgZHJpdmVycyBpbiBkcml2ZXJzL2dw
dS9kcm0vcGFuZWwNCndoaWNoIGF0dGFjaCB0byB0aGUgRFNJIGhvc3QgdmlhIG1pcGlfZHNpX2F0
dGFjaCgpIGF0IHByb2JlIHRpbWUsIHRoZQ0KQURWNzUzMyBicmlkZ2UgZGV2aWNlIGRvZXMgbm90
LiBJbnN0ZWFkIGl0IGRlZmVycyB0aGlzIHRvIHRoZSBwb2ludCB0aGF0DQp0aGUgdXBzdHJlYW0g
ZGV2aWNlIGNvbm5lY3RzIHRvIGl0cyBicmlkZ2UgdmlhIGRybV9icmlkZ2VfYXR0YWNoKCkuDQpU
aGUgZ2VuZXJpYyBTeW5vcHN5cyBNSVBJIERTSSBob3N0IGRyaXZlciBkb2VzIG5vdCByZWdpc3Rl
ciBpdCdzIG93bg0KZHJtX2JyaWRnZSB1bnRpbCB0aGUgTUlQSSBEU0kgaGFzIGF0dGFjaGVkLiBC
dXQgaXQgZG9lcyBub3QgY2FsbA0KZHJtX2JyaWRnZV9hdHRhY2goKSBvbiB0aGUgZG93bnN0cmVh
bSBkZXZpY2UgdW50aWwgdGhlIHVwc3RyZWFtIGRldmljZQ0KaGFzIGF0dGFjaGVkLiBUaGlzIGxl
YWRzIHRvIGEgY2hpY2tlbiBhbmQgdGhlIGVnZyBmYWlsdXJlIGFuZCB0aGUgRFJNDQpwaXBlbGlu
ZSBkb2VzIG5vdCBjb21wbGV0ZS4NClNpbmNlIGFsbCBvdGhlciBtaXBpX2RzaV9kZXZpY2UgZHJp
dmVycyBjYWxsIG1pcGlfZHNpX2F0dGFjaCgpIGluDQpwcm9iZSgpLCBtYWtlIHRoZSBhZHY3NTMz
IG1pcGlfZHNpX2RldmljZSBkbyB0aGUgc2FtZS4gVGhpcyBlbnN1cmVzIHRoYXQNCnRoZSBTeW5v
cHN5cyBNSVBJIERTSSBob3N0IHJlZ2lzdGVycyBpdCdzIGJyaWRnZSBzdWNoIHRoYXQgaXQgaXMN
CmF2YWlsYWJsZSBmb3IgdGhlIHVwc3RyZWFtIGRldmljZSB0byBjb25uZWN0IHRvLg0KDQpTaWdu
ZWQtb2ZmLWJ5OiBNYXR0IFJlZGZlYXJuIDxtYXR0LnJlZGZlYXJuQHRoaW5jaS5jb20+DQoNCi0t
LQ0KDQpDaGFuZ2VzIGluIHYyOg0KQ2xlYW51cCBpZiBhZHY3NTMzX2F0dGFjaF9kc2kgZmFpbHMu
DQoNCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYyB8IDEyICsr
KysrKysrKy0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUx
MV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jDQpp
bmRleCBlN2RkZDNlM2RiOS4uODA3ODI3YmQ5MTAgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCkBAIC04NzQsOSArODc0LDYgQEAgc3RhdGljIGlu
dCBhZHY3NTExX2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkNCiAJCQkJ
ICZhZHY3NTExX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOw0KIAlkcm1fY29ubmVjdG9yX2F0dGFj
aF9lbmNvZGVyKCZhZHYtPmNvbm5lY3RvciwgYnJpZGdlLT5lbmNvZGVyKTsNCiANCi0JaWYgKGFk
di0+dHlwZSA9PSBBRFY3NTMzKQ0KLQkJcmV0ID0gYWR2NzUzM19hdHRhY2hfZHNpKGFkdik7DQot
DQogCWlmIChhZHYtPmkyY19tYWluLT5pcnEpDQogCQlyZWdtYXBfd3JpdGUoYWR2LT5yZWdtYXAs
IEFEVjc1MTFfUkVHX0lOVF9FTkFCTEUoMCksDQogCQkJICAgICBBRFY3NTExX0lOVDBfSFBEKTsN
CkBAIC0xMjIyLDggKzEyMTksMTcgQEAgc3RhdGljIGludCBhZHY3NTExX3Byb2JlKHN0cnVjdCBp
MmNfY2xpZW50ICppMmMsIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkICppZCkNCiAJZHJtX2Jy
aWRnZV9hZGQoJmFkdjc1MTEtPmJyaWRnZSk7DQogDQogCWFkdjc1MTFfYXVkaW9faW5pdChkZXYs
IGFkdjc1MTEpOw0KKw0KKwlpZiAoYWR2NzUxMS0+dHlwZSA9PSBBRFY3NTMzKSB7DQorCQlyZXQg
PSBhZHY3NTMzX2F0dGFjaF9kc2koYWR2NzUxMSk7DQorCQlpZiAocmV0KQ0KKwkJCWdvdG8gZXJy
X3JlbW92ZV9icmlkZ2U7DQorCX0NCisNCiAJcmV0dXJuIDA7DQogDQorZXJyX3JlbW92ZV9icmlk
Z2U6DQorCWRybV9icmlkZ2VfcmVtb3ZlKCZhZHY3NTExLT5icmlkZ2UpOw0KIGVycl91bnJlZ2lz
dGVyX2NlYzoNCiAJaTJjX3VucmVnaXN0ZXJfZGV2aWNlKGFkdjc1MTEtPmkyY19jZWMpOw0KIAlp
ZiAoYWR2NzUxMS0+Y2VjX2NsaykNCi0tIA0KMi4xNy4xDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
