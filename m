Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7DD2FA72
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 12:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DAD6E155;
	Thu, 30 May 2019 10:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30077.outbound.protection.outlook.com [40.107.3.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3C46E155
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 10:44:01 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4942.eurprd08.prod.outlook.com (10.255.158.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Thu, 30 May 2019 10:43:58 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1922.021; Thu, 30 May 2019
 10:43:58 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 0/2] drm/komeda: Add writeback downscaling split support
Thread-Topic: [PATCH 0/2] drm/komeda: Add writeback downscaling split support
Thread-Index: AQHVFtSWfnHeHgfsa0Wgx/8gmSiP5A==
Date: Thu, 30 May 2019 10:43:58 +0000
Message-ID: <20190530104335.2395-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR04CA0069.apcprd04.prod.outlook.com
 (2603:1096:202:15::13) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b90f080-5868-457a-202e-08d6e4ebb865
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VE1PR08MB4942; 
x-ms-traffictypediagnostic: VE1PR08MB4942:
x-ms-exchange-purlcount: 10
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB4942D13C33DF6437D2887A14B3180@VE1PR08MB4942.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00531FAC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(136003)(346002)(376002)(396003)(189003)(199004)(25786009)(26005)(66476007)(6116002)(3846002)(73956011)(103116003)(54906003)(66446008)(4326008)(476003)(2616005)(66556008)(256004)(68736007)(186003)(64756008)(386003)(14454004)(6306002)(66946007)(55236004)(102836004)(110136005)(52116002)(99286004)(6506007)(966005)(2201001)(50226002)(6436002)(8676002)(86362001)(6512007)(305945005)(6486002)(81156014)(71200400001)(81166006)(2501003)(66066001)(8936002)(36756003)(7736002)(2906002)(486006)(5660300002)(316002)(1076003)(53936002)(478600001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4942;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PsKcoIq43BomiEetCo3Rn79j73h5LTHXbpmAC9YaYndyXbhtjR9sGIjRBN/PNjQsh4xBb7PW32YEu7vd0mHjGC/IXSDdcTwtlKPuZOwWlTY0rRiGJNQEvM7ribnVj6mCZJjX/y78nPbUNGJaAohmMQ/b0saz/vfPHUwUDCVL4EwR+ZgjP1g1+NycvWauSDXa+BdK6PQfAIcMRHmQxayi1eovBaRHT0QnxfdY+p9C7Rhos5vmqsuebAV28gmSpcbPIO+arioMJFFck9Z6ZAom4Y74CMUuk4zsEvEfhDTMs6X99OQtWd/X+fBoEh7aZAyNe6bYCvKeBgWUJDmeLkh7Z5ngMQ88Tj6cAA3EgcqIlaMH+HlYrcH44vQGvbpBquGSCigjRa+63q/j5nDytkgMNq7ZuAtUx5JfaXEBe1BGlxE=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b90f080-5868-457a-202e-08d6e4ebb865
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2019 10:43:58.4994 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4942
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDyy5oM6CejoAPXC8eRyn4WaMFvf43wM9mhb2FcfdTE=;
 b=wXKeDR6cPpg0DSyLhv3tNPpaxW1KGrUgGtLoRN2aJfx7iDVWB1lswpugBb9/s3JKKh1IGEyDKHERxfNlKC2EXhdjfqwgECyuwdFPmX6MeT5kCftulesVs4jdZr/da9d0X+1+pT6dp71RHIf48of8ebP2N1NLNjmnjEVOPGCjtHw=
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

V3JpdGViYWNrIHNwbGl0IGlzIGFsc28gZm9yIHdvcmthcm91bmQgdGhlIHNpemUgbGltaXRhdGlv
biBvZiBkNzEgc2NhbGVyLg0KTGlrZSBsYXllcl9zcGxpdCwgd3JpdGViYWNrIGRvd25zY2FsaW5n
IGFsc28gY2FuIHVzZSB0d28gc2NhbGVycyB0byBoYW5kbGUNCnRoZSBzY2FsaW5nIGhhbGYtYnkt
aGFsZi4gVGhlIG9ubHkgZGlmZmVybmVuY2UgaXMgd3JpdGJhY2sgbmVlZHMgYQ0Kc3RhbmRhbG9u
ZSBjb21wb25lbnQgKHNwbGl0dGVyKSdzIGhlbHAgdG8gc3BsaXQgdGhlIGNvbXBvc2l0aW9uIHJl
c3VsdC4NClRoZSBkYXRhIHBpcGVsaW5lIG9mIHdyaXRlYmFjayBzcGxpdCBhcyBiZWxvdzoNCg0K
ICAgICAgICAgICAgICAgICAgIC8tPiBzY2FsZXItMCAtPlwNCiBjb21waXogLT4gc3BsaXR0ZXIg
ICAgICAgICAgICAgICAgbWVyZ2VyIC0+IHdiX2xheWVyIC0+IG1lbW9yeQ0KICAgICAgICAgICAg
ICAgICAgIFwtPiBzY2FsZXItMSAtPi8NCg0KRGVwZW5kcyBvbjoNCi0gaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81ODcxMC8NCi0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3Nlcmllcy81OTAwMC8NCi0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3Nlcmllcy81OTAwMi8NCi0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3Jn
L3Nlcmllcy81OTc0Ny8NCi0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmll
cy81OTkxNS8NCi0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MDA4
My8NCi0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MDY5OC8NCi0g
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MDg1Ni8NCi0gaHR0cHM6
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MDg5My8NCi0gaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MTM3MC8NCg0KSmFtZXMgUWlhbiBXYW5nIChB
cm0gVGVjaG5vbG9neSBDaGluYSkgKDIpOg0KICBkcm0va29tZWRhOiBBZGQgbmV3IGNvbXBvbmVu
dCBrb21lZGFfc3BsaXR0ZXINCiAgZHJtL2tvbWVkYTogRW5hYmxlIHdyaXRlYmFjayBzcGxpdCBz
dXBwb3J0DQoNCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgICAg
fCAgNjMgKysrKysrKysrKw0KIC4uLi9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBl
bGluZS5jICB8ICAgMyArDQogLi4uL2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVs
aW5lLmggIHwgIDIzICsrKy0NCiAuLi4vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0
YXRlLmMgICAgfCAxMTcgKysrKysrKysrKysrKysrKy0tDQogLi4uL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfcHJpdmF0ZV9vYmouYyAgIHwgIDUwICsrKysrKysrDQogLi4uL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMgIHwgIDE3ICsrLQ0KIDYgZmlsZXMgY2hhbmdl
ZCwgMjU3IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQ0KDQotLQ0KMi4xNy4xDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
