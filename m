Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C440B35A79
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 12:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD4B89121;
	Wed,  5 Jun 2019 10:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60069.outbound.protection.outlook.com [40.107.6.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853F889322
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 10:35:30 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4670.eurprd08.prod.outlook.com (10.255.114.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 10:35:26 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 10:35:26 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 0/3] drm/komeda: Unify mclk/pclk/pipeline->aclk to one ACLK
Thread-Topic: [PATCH 0/3] drm/komeda: Unify mclk/pclk/pipeline->aclk to one
 ACLK
Thread-Index: AQHVG4pjxvdVY3Ff9ES/w1HGkvX49g==
Date: Wed, 5 Jun 2019 10:35:26 +0000
Message-ID: <20190605103506.22863-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0041.apcprd03.prod.outlook.com
 (2603:1096:203:2f::29) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb2de0cb-9317-48f7-6df6-08d6e9a185b0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4670; 
x-ms-traffictypediagnostic: VE1PR08MB4670:
x-ms-exchange-purlcount: 11
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB46706C64479DEC0FE171C7B7B3160@VE1PR08MB4670.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(136003)(366004)(396003)(346002)(199004)(189003)(103116003)(3846002)(110136005)(86362001)(81156014)(81166006)(2501003)(36756003)(66066001)(71200400001)(71190400001)(1076003)(52116002)(316002)(4326008)(99286004)(2906002)(256004)(54906003)(26005)(8676002)(6116002)(2201001)(386003)(68736007)(55236004)(102836004)(25786009)(7736002)(14454004)(6506007)(2616005)(50226002)(486006)(6306002)(53936002)(6512007)(476003)(6486002)(6436002)(305945005)(966005)(8936002)(73956011)(66446008)(64756008)(66556008)(66476007)(66946007)(186003)(478600001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4670;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BD+zxcdp9DFMeoWmkVvK8Sj7wzmuvsmD/mYPRqYjmpdPKL7Wi7zvsNPv7G+o+OwcCwY0MvrvEmcaMHD5KFACkSzsmWLGmEsHiaX9Zcolmorr3wqViXGVFmQ/O9y+nZVTSCUeFLLSrZ14+tcAUicUmg9iFARHJOED3YlCL94WA99lRCZAaV3vrYNs9rEdkm7q8dz+aFbULmGkYFCxP4IgG6iUpUJzN1+GYc7cc94erpCjvWtucWVGx8dvcJdRIEQUA0zNX2X19jIKO3xjMs7qT//7oys/QJjpOW3G5dp++mb+oNMP6loFAuwUVfvn00PLU3NawtkHNiiEVN0/FDqR1PRQQLi6+5v4M6LxkGGgMR4xpLOn4hEK9mzWiZ5LUiwhYj/W+q76d/cnqMYozWrs4xWn8qb1spSzJvfkZgryTCk=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2de0cb-9317-48f7-6df6-08d6e9a185b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 10:35:26.5090 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4670
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5pKVQkc5GPfN3Lh305t7hry2+ovV3P7LZgqkI0UVzA=;
 b=R3xGb6Gn09wEdeljziDBzaKdA9ezK83rand4Hxm0sFb8x366aJ/Sn7utikXV39WDAR1LfAOs0kEn3Pd7cxaHq6DrFWmiF2Kc5GGDDAQQsHYKyymITwSa8B4QN28fZMHhdGguEms9j+MkoRulrTgKlI2G+6YJbvtzkQYuT8CQIHU=
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

Q3VycmVudCBrb21lZGEgZHJpdmVyIHVzZXMgdGhyZWUgZGVkaWNhdGVkIGNsa3MgZm9yIGEgc3Bl
Y2lmaWMgcHVycG9zZToNCi0gbWNsazogbWFpbiBlbmdpbmUgY2xvY2sNCi0gcGNsazogQVBCIGNs
b2NrDQotIHBpcGVsaW5lLT5hY2xrOiBBWEkgY2xvY2suDQoNCkJ1dCBwZXIgc3BlYyB0aGUga29t
ZWRhIEhXIG9ubHkgaGFzIHRocmVlIGlucHV0IGNsa3M6DQotIEFDTEs6IHVzZWQgZm9yIEFYSSBt
YXN0ZXJzLCBBUEIgc2xhdmUgYW5kIG1vc3QgcGlwZWxpbmUgcHJvY2Vzc2luZw0KLSBQWENMSyBm
b3IgcGlwZWxpbmUgMDogb3V0cHV0IHBpeGVsIGNsb2NrIGZvciBwaXBlbGluZSAwDQotIFBYQ0xL
IGZvciBwaXBlbGluZSAxOiBvdXRwdXQgcGl4ZWwgY2xvY2sgZm9yIHBpcGVsaW5lIDENCg0KU28g
b25lIEFDTEsgaXMgZW5vdWdoLCBubyBuZWVkIHRvIHNwbGl0IGl0IHRvIHRocmVlIG1jbGsvcGNs
ay9heGljbGsuDQoNCkRlcGVuZHMgb246DQotIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9zZXJpZXMvNTg3MTAvDQotIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9z
ZXJpZXMvNTkwMDAvDQotIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMv
NTkwMDIvDQotIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNTk3NDcv
DQotIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNTk5MTUvDQotIGh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjAwODMvDQotIGh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjA2OTgvDQotIGh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjA4NTYvDQotIGh0dHBzOi8vcGF0Y2h3b3JrLmZy
ZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjA4OTMvDQotIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9zZXJpZXMvNjEzNzAvDQotIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9y
Zy9zZXJpZXMvNjEzNzkvDQoNCkphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEp
ICgzKToNCiAgZHJtL2tvbWVkYTogVW5pZnkgbWNsay9wY2xrL3BpcGVsaW5lLT5hY2xrIHRvIG9u
ZSBNQ0xLDQogIGRybS9rb21lZGE6IFJlbmFtZSBtYWluIGVuZ2luZSBjbGsgbmFtZSAibWNsayIg
dG8gImFjbGsiDQogIGR0L2JpbmRpbmdzOiBkcm0va29tZWRhOiBVbmlmeSBtY2xrL3BjbGsvcGlw
ZWxpbmUtPmFjbGsgdG8gb25lIEFDTEsNCg0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2FybSxrb21l
ZGEudHh0ICAgICAgICAgICB8IDE2ICsrKy0tLS0NCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2Q3
MS9kNzFfY29tcG9uZW50LmMgICAgfCAxMCArKy0tLQ0KIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfY3J0Yy5jICB8IDQ1ICsrKysrKystLS0tLS0tLS0tLS0NCiAuLi4vZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jICAgfCAzOSArKysrKy0tLS0tLS0t
LS0tDQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCAgIHwgIDYg
Ky0tDQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaCAgIHwgIDYg
Ky0tDQogLi4uL2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmMgIHwgIDEg
LQ0KIC4uLi9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oICB8ICA2ICst
LQ0KIC4uLi9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYyAgICB8ICA0ICst
DQogOSBmaWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspLCA4NSBkZWxldGlvbnMoLSkNCg0K
LS0NCjIuMTcuMQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
