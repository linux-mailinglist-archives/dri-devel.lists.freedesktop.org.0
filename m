Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D26F27B66
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 13:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C1A89DB5;
	Thu, 23 May 2019 11:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05B389DB5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 11:10:00 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 AM0SPR01MB0043.eurprd08.prod.outlook.com (20.178.16.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Thu, 23 May 2019 11:09:57 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1922.017; Thu, 23 May 2019
 11:09:57 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH v2 1/6] drm/komeda: Attach scaler to drm as private object
Thread-Topic: [PATCH v2 1/6] drm/komeda: Attach scaler to drm as private object
Thread-Index: AQHVEVgOxJeSeZX9GU+RcpLRWDIdSQ==
Date: Thu, 23 May 2019 11:09:57 +0000
Message-ID: <20190523110933.10742-2-james.qian.wang@arm.com>
References: <20190523110933.10742-1-james.qian.wang@arm.com>
In-Reply-To: <20190523110933.10742-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0191.apcprd02.prod.outlook.com
 (2603:1096:201:21::27) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a618328-9262-4db7-91ed-08d6df6f30d0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0SPR01MB0043; 
x-ms-traffictypediagnostic: AM0SPR01MB0043:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0SPR01MB0043C4943DA0DAA2F5D58B76B3010@AM0SPR01MB0043.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(39860400002)(136003)(376002)(396003)(189003)(199004)(36756003)(1076003)(8936002)(103116003)(2616005)(446003)(54906003)(110136005)(4326008)(11346002)(53936002)(25786009)(6486002)(50226002)(256004)(81156014)(66066001)(68736007)(81166006)(486006)(2501003)(5024004)(99286004)(7736002)(386003)(5660300002)(66946007)(71200400001)(186003)(476003)(305945005)(6506007)(2201001)(2906002)(76176011)(55236004)(86362001)(102836004)(3846002)(26005)(6116002)(478600001)(316002)(66476007)(66556008)(73956011)(14454004)(6436002)(66446008)(6512007)(64756008)(52116002)(8676002)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0SPR01MB0043;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jPYezOkXaHeZfD0nCSjaRS8tNO/2BLmh+xSo4bYa2UJZRcwhTojGJDGdE6X64QwfNW7uwQgD6rH63jjwepzqnUE1cdmHmpfvrYdO6eUol0V93wae/c9Wj4yE1LXTzlTs012mPwZuY3yIRiwqCjPV4EGLrhAnXgzBbb07CGF+2SdFMn8W7Kr+8mPqLnUzvngVmdLj6pMA++GazdIKAn4oVq0TCfGMhMlVI3CfXn9n8/fOm/EXWHChJaNzu32wzl9AXPOtcUEDzkadxzToWYpSJ1C69TUC69whBXhzu/vSVe54+YbufrzrG5DNdviOtM4PcF2pTDN5PblDm5idZmC3IKKSLty69u77kI+udvtrEHlIgSqSJC3f8xSyyy5Hfk5FLQz9EC+DcvFtWv3X8IxsW/EsaWmo4aRVr7gl8Y3124w=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a618328-9262-4db7-91ed-08d6df6f30d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 11:09:57.6770 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0SPR01MB0043
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39T5F2wcnsfC0J7zBBnSmblpeF5L+NLK6DLYspLeVb8=;
 b=k5EaMTInpjiUryTdu6ZUvpBMfXWGpE61PpDmB/KRui9sSsrAX36ctn5cB26SVCqgUCOOsno8CeZMkmkkM+kencKlL+pQIBUguXCrgjXMtLjbHG81tBqaKpA31JGpwbct53FyAkXJOvz+86mc7bPn89JhAPG2HoPW71+0pjmWVMg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWNjb3JkaW5nIHRvIHRoZSBrb21lZGEgcGlwZWxpbmUgY29uZmlndXJhdGlvbiwgYXR0YWNoIHNj
YWxlciB0byBkcm0gYXMNCnByaXZhdGUgb2JqZWN0Lg0KDQp2MjogUmViYXNlDQoNClNpZ25lZC1v
ZmYtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFu
LndhbmdAYXJtLmNvbT4NCi0tLQ0KIC4uLi9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3ByaXZh
dGVfb2JqLmMgICB8IDQ5ICsrKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgNDkg
aW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcHJpdmF0ZV9vYmouYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX3ByaXZhdGVfb2JqLmMNCmluZGV4IGQ1M2JkNmMyM2M1ZC4uYmFjOTBh
YjhmZGM5IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfcHJpdmF0ZV9vYmouYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfcHJpdmF0ZV9vYmouYw0KQEAgLTYwLDYgKzYwLDQ5IEBAIHN0YXRpYyBpbnQg
a29tZWRhX2xheWVyX29ial9hZGQoc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMsDQogCXJldHVy
biAwOw0KIH0NCiANCitzdGF0aWMgc3RydWN0IGRybV9wcml2YXRlX3N0YXRlICoNCitrb21lZGFf
c2NhbGVyX2F0b21pY19kdXBsaWNhdGVfc3RhdGUoc3RydWN0IGRybV9wcml2YXRlX29iaiAqb2Jq
KQ0KK3sNCisJc3RydWN0IGtvbWVkYV9zY2FsZXJfc3RhdGUgKnN0Ow0KKw0KKwlzdCA9IGttZW1k
dXAob2JqLT5zdGF0ZSwgc2l6ZW9mKCpzdCksIEdGUF9LRVJORUwpOw0KKwlpZiAoIXN0KQ0KKwkJ
cmV0dXJuIE5VTEw7DQorDQorCWtvbWVkYV9jb21wb25lbnRfc3RhdGVfcmVzZXQoJnN0LT5iYXNl
KTsNCisJX19kcm1fYXRvbWljX2hlbHBlcl9wcml2YXRlX29ial9kdXBsaWNhdGVfc3RhdGUob2Jq
LCAmc3QtPmJhc2Uub2JqKTsNCisNCisJcmV0dXJuICZzdC0+YmFzZS5vYmo7DQorfQ0KKw0KK3N0
YXRpYyB2b2lkDQora29tZWRhX3NjYWxlcl9hdG9taWNfZGVzdHJveV9zdGF0ZShzdHJ1Y3QgZHJt
X3ByaXZhdGVfb2JqICpvYmosDQorCQkJCSAgIHN0cnVjdCBkcm1fcHJpdmF0ZV9zdGF0ZSAqc3Rh
dGUpDQorew0KKwlrZnJlZSh0b19zY2FsZXJfc3QocHJpdl90b19jb21wX3N0KHN0YXRlKSkpOw0K
K30NCisNCitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wcml2YXRlX3N0YXRlX2Z1bmNzIGtvbWVk
YV9zY2FsZXJfb2JqX2Z1bmNzID0gew0KKwkuYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZQk9IGtvbWVk
YV9zY2FsZXJfYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSwNCisJLmF0b21pY19kZXN0cm95X3N0YXRl
CT0ga29tZWRhX3NjYWxlcl9hdG9taWNfZGVzdHJveV9zdGF0ZSwNCit9Ow0KKw0KK3N0YXRpYyBp
bnQga29tZWRhX3NjYWxlcl9vYmpfYWRkKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zLA0KKwkJ
CQkgc3RydWN0IGtvbWVkYV9zY2FsZXIgKnNjYWxlcikNCit7DQorCXN0cnVjdCBrb21lZGFfc2Nh
bGVyX3N0YXRlICpzdDsNCisNCisJc3QgPSBremFsbG9jKHNpemVvZigqc3QpLCBHRlBfS0VSTkVM
KTsNCisJaWYgKCFzdCkNCisJCXJldHVybiAtRU5PTUVNOw0KKw0KKwlzdC0+YmFzZS5jb21wb25l
bnQgPSAmc2NhbGVyLT5iYXNlOw0KKwlkcm1fYXRvbWljX3ByaXZhdGVfb2JqX2luaXQoJmttcy0+
YmFzZSwNCisJCQkJICAgICZzY2FsZXItPmJhc2Uub2JqLCAmc3QtPmJhc2Uub2JqLA0KKwkJCQkg
ICAgJmtvbWVkYV9zY2FsZXJfb2JqX2Z1bmNzKTsNCisJcmV0dXJuIDA7DQorfQ0KKw0KIHN0YXRp
YyBzdHJ1Y3QgZHJtX3ByaXZhdGVfc3RhdGUgKg0KIGtvbWVkYV9jb21waXpfYXRvbWljX2R1cGxp
Y2F0ZV9zdGF0ZShzdHJ1Y3QgZHJtX3ByaXZhdGVfb2JqICpvYmopDQogew0KQEAgLTI1OCw2ICsz
MDEsMTIgQEAgaW50IGtvbWVkYV9rbXNfYWRkX3ByaXZhdGVfb2JqcyhzdHJ1Y3Qga29tZWRhX2tt
c19kZXYgKmttcywNCiAJCQkJcmV0dXJuIGVycjsNCiAJCX0NCiANCisJCWZvciAoaiA9IDA7IGog
PCBwaXBlLT5uX3NjYWxlcnM7IGorKykgew0KKwkJCWVyciA9IGtvbWVkYV9zY2FsZXJfb2JqX2Fk
ZChrbXMsIHBpcGUtPnNjYWxlcnNbal0pOw0KKwkJCWlmIChlcnIpDQorCQkJCXJldHVybiBlcnI7
DQorCQl9DQorDQogCQllcnIgPSBrb21lZGFfY29tcGl6X29ial9hZGQoa21zLCBwaXBlLT5jb21w
aXopOw0KIAkJaWYgKGVycikNCiAJCQlyZXR1cm4gZXJyOw0KLS0gDQoyLjE3LjENCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
