Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C77A41D89
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 09:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6058930E;
	Wed, 12 Jun 2019 07:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150059.outbound.protection.outlook.com [40.107.15.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBEC8930E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 07:22:50 +0000 (UTC)
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3824.eurprd08.prod.outlook.com (20.178.15.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Wed, 12 Jun 2019 07:22:46 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e9f4:59c8:9be1:910b]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e9f4:59c8:9be1:910b%4]) with mapi id 15.20.1987.010; Wed, 12 Jun 2019
 07:22:46 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH v3 0/2] drm/komeda: Add SMMU support on Komeda driver
Thread-Topic: [PATCH v3 0/2] drm/komeda: Add SMMU support on Komeda driver
Thread-Index: AQHVIO+hjOl8+eDYHEKZvQDqBFbwVQ==
Date: Wed, 12 Jun 2019 07:22:45 +0000
Message-ID: <1560324143-25099-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::29) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d346c1ed-e1a2-4f02-4d1f-08d6ef06c3c7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3824; 
x-ms-traffictypediagnostic: VI1PR08MB3824:
x-ms-exchange-purlcount: 4
nodisclaimer: True
x-microsoft-antispam-prvs: <VI1PR08MB382463B6DBA4713C6A05CDBA9FEC0@VI1PR08MB3824.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(376002)(39860400002)(366004)(396003)(199004)(189003)(50226002)(64756008)(99286004)(6116002)(66946007)(305945005)(102836004)(7736002)(66556008)(5660300002)(66476007)(14444005)(25786009)(68736007)(8676002)(6636002)(53936002)(73956011)(256004)(4326008)(6506007)(55236004)(966005)(8936002)(386003)(81166006)(86362001)(52116002)(2501003)(6306002)(2201001)(316002)(6512007)(81156014)(6486002)(6436002)(66446008)(71190400001)(3846002)(54906003)(14454004)(110136005)(2616005)(66066001)(486006)(2906002)(478600001)(36756003)(476003)(72206003)(26005)(186003)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3824;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dVGSS6ksIHE+EjOkhkprkN04p1isCT6Ade8T7xziGCXOyj7sH+Ln14EjMHexp3D2Ed3hCe6DrhN6K17CHUqCiO3NV9R8sZ9B82mDk2y6xFBfvuDFSc2wuWrJMzjsxkx341TDqJWobYt8qZ4gg2W08ELbNkztJ/AGfXQi3VuEqiuG/tBV+XveAsMJ6yV66rDptnR7c+OPPkHncKjvUylwAGqmua5yOocYJd/LpHJnkt2nFKG2D9vVmSplQvWXu9r/xoxJ4DYbYEYYq1kwXvAdfTS0KYKrvY4yA/jljLc/yw1tJgoRDH2L1MXxPlTB1eh/SZibBZsT9yGLIqRjCelWzr3ViqurnoTd7u2IsKVXFUeHpQG9A8Cpid8ksRUrqnjMRO82YscqyDqclka6lRpHXqLf4aySRHU3qGT2x8OU8p0=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d346c1ed-e1a2-4f02-4d1f-08d6ef06c3c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 07:22:45.8498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lowry.Li@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3824
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IVJqOWsEjQpHNgGa5edKzYgujtRqlzFDQ6Ap2NdFKg=;
 b=qa8BBPq+nVcvSrAbEtt018gZNPpge03Y2qBuo4tO/VWmsXd6/WuJL5NTTYl8ANFFrnfx5i+baBHqe3uE3OeaaJCMCRffDM7bboOy24Dh3oIthmNwY5kczTrD3RMNJEJM0hyDee122GHNi0lh8sE5iYEHlECvu0YK72SX8nKdR1E=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNClRoaXMgc2VyaWUgYWltcyBhdCBhZGRpbmcgdGhlIHN1cHBvcnQgZm9yIFNNTVUgb24g
S29tZWRhIGRyaXZlci4NCkFsc28gdXBkYXRlcyB0aGUgZGV2aWNlLXRyZWUgZG9jIGFib3V0IGhv
dyB0byBlbmFibGUgU01NVSBieSBkZXZpY2V0cmVlLg0KDQpUaGlzIHBhdGNoIHNlcmllcyBkZXBl
bmRzIG9uOg0KLSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzU4NzEw
Lw0KLSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzU5MDAwLw0KLSBo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzU5MDAyLw0KLSBodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzYxNjUwLw0KDQpDaGFuZ2VzIHNpbmNl
IHYxOg0KLSBSZWJhc2UgdG8gdGhlIHBhdGNoIGluIHdoaWNoIGNvbnZlcnQgZHBfd2FpdF9jb25k
KCkgd2FzIGNoYW5nZWQgdG8NCnJldHVybiAtRVRJTUVET1VUIGFuZCB1cGRhdGUgZDcxX2Rpc2Nv
bm5lY3RfaW9tbXUoKSB0byBiZSBjb25zaXN0ZW50Lg0KLSBJZiBjb25uZWN0ZWQgSU9NTVUgZmFp
bGVkLCBzZXQgbWRldi0+aW9tbXUgYXMgTlVMTC4NCg0KQ2hhbmdlcyBzaW5jZSB2MjoNCi0gQ29y
cmVjdCB0aGUgY29kZSBmbG93IGJ5IG5vdCByZXR1cm5pbmcgLUVUSU1FRE9VVCBpZiBkcF93YWl0
X2NvbmQoKQ0KcmV0dXJucyB6ZXJvIGluIGQ3MV9jb25uZWN0X2lvbW11KCkuDQoNClRoYW5rcywN
Ckxvd3J5DQoNCkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgKDIpOg0KICBkcm0va29t
ZWRhOiBBZGRzIFNNTVUgc3VwcG9ydA0KICBkdC9iaW5kaW5nczogZHJtL2tvbWVkYTogQWRkcyBT
TU1VIHN1cHBvcnQgZm9yIEQ3MSBkZXZpY2V0cmVlDQoNCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2FybSxrb21lZGEudHh0ICAgICB8ICA3ICsrKysNCiAuLi4vZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyB8ICA1ICsrKw0KIGRyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYyAgIHwgNDkgKysrKysrKysrKysr
KysrKysrKysrKw0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rl
di5jICAgIHwgMTggKysrKysrKysNCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9kZXYuaCAgICB8ICA3ICsrKysNCiAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfZnJhbWVidWZmZXIuYyAgICB8ICAyICsNCiAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZnJhbWVidWZmZXIuaCAgICB8ICAyICsNCiA3IGZpbGVzIGNoYW5nZWQsIDkwIGlu
c2VydGlvbnMoKykNCg0KLS0gDQoxLjkuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
