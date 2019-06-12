Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A57042233
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 12:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94B089467;
	Wed, 12 Jun 2019 10:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70055.outbound.protection.outlook.com [40.107.7.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B2F89467
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 10:20:09 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5007.eurprd08.prod.outlook.com (10.255.159.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Wed, 12 Jun 2019 10:20:06 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1943.026; Wed, 12 Jun 2019
 10:20:06 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH v2 0/2] drm/komeda: Add writeback downscaling split support
Thread-Topic: [PATCH v2 0/2] drm/komeda: Add writeback downscaling split
 support
Thread-Index: AQHVIQhn3iDIYrsAw02rWYqUaZzfww==
Date: Wed, 12 Jun 2019 10:20:06 +0000
Message-ID: <20190612101947.1093-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR04CA0052.apcprd04.prod.outlook.com
 (2603:1096:202:14::20) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f998276-5a8e-4ffa-3c70-08d6ef1f8a08
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5007; 
x-ms-traffictypediagnostic: VE1PR08MB5007:
x-ms-exchange-purlcount: 10
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB50071E07F888AA7E3D46A332B3EC0@VE1PR08MB5007.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(376002)(136003)(396003)(39860400002)(199004)(189003)(6512007)(54906003)(4326008)(5660300002)(6486002)(36756003)(316002)(71190400001)(6436002)(2501003)(1076003)(71200400001)(256004)(25786009)(186003)(26005)(6306002)(3846002)(66446008)(73956011)(55236004)(102836004)(66476007)(7736002)(305945005)(66556008)(6116002)(52116002)(2201001)(2616005)(66066001)(14454004)(99286004)(110136005)(386003)(68736007)(6506007)(2906002)(966005)(478600001)(486006)(103116003)(81156014)(8936002)(8676002)(86362001)(53936002)(50226002)(476003)(81166006)(64756008)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5007;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: adtDGXgcl1MrS9g8xOUsKGzmabC916rMCoJxZwCj8rjnuzyzha7BOP821KGL6Y0B9bEtQzcgkQIDSPYjcJrccXK3EVUC9B4YoN3zcisIvl7qHDJwm6nau/vnYnmVUSJ4CA5u1gWr/DdkxM5OjjivPb3QBB+O9NkJ6CASqrISV23Y9NoqWw7ZgrHrM1nT0/KLoPOvaJk0fkKiwos4XQ6XoDwpzPX2yx/C+7UvmViQfltlFfI+ZXZzPgueQYpITqCF/LA7DtdSX8Nw5lxG8XebYhGGn6INHntS02v0S3spIL0tJrvOFl/JxzzD77QyDKKNGrZ7MFz835avVv6c34A4bIQtBUHfnbLoi4OHbOzD9ivIobyZ24vk/zA55PPv6qr5LBWVaYe4LTi+e/2lpcEC0lA7sljnBaqeBacBhMuhyYY=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f998276-5a8e-4ffa-3c70-08d6ef1f8a08
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 10:20:06.2641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5007
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXLBgcq0WG2F4oWifq7zv8EkBijevJQSJTNuIRLd/04=;
 b=5tyEkbjlDDgn3rEbbhNRj1O2tS3ozniPJEikj68K/yypWI85o7PIRQkZz54rqF1f8EDn9evez7bUZo4u5YbjfXZuX2vFJsWVc6StpzVBWnjzpANFoPPmHnc50sXFB6864K97cOw5X5A+s2YiPWi7k8MlCxjKSkd2f0CuyK47RtM=
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
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MTA3OS8NCi0gaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MTA4MS8NCg0KdjI6IFJlYmFzZQ0KDQpqYW1l
cyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSAoMik6DQogIGRybS9rb21lZGE6IEFk
ZCBuZXcgY29tcG9uZW50IGtvbWVkYV9zcGxpdHRlcg0KICBkcm0va29tZWRhOiBFbmFibGUgd3Jp
dGViYWNrIHNwbGl0IHN1cHBvcnQNCg0KIC4uLi9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9j
b21wb25lbnQuYyAgICB8ICA2MyArKysrKysrKysrDQogLi4uL2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX3BpcGVsaW5lLmMgIHwgICAzICsNCiAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfcGlwZWxpbmUuaCAgfCAgMjMgKysrLQ0KIC4uLi9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfcGlwZWxpbmVfc3RhdGUuYyAgICB8IDExNyArKysrKysrKysrKysrKysrLS0NCiAuLi4vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wcml2YXRlX29iai5jICAgfCAgNTAgKysrKysrKysNCiAu
Li4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYyAgfCAgMTcgKystDQog
NiBmaWxlcyBjaGFuZ2VkLCAyNTcgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQoNCi0t
DQoyLjE3LjENCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
