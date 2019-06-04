Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E0034463
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 12:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE26893EC;
	Tue,  4 Jun 2019 10:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740040.outbound.protection.outlook.com [40.107.74.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01527893EC
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 10:29:53 +0000 (UTC)
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6256.namprd05.prod.outlook.com (20.178.242.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Tue, 4 Jun 2019 10:29:46 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad%6]) with mapi id 15.20.1965.011; Tue, 4 Jun 2019
 10:29:46 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: "cai@lca.pw" <cai@lca.pw>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>
Subject: Re: [RESEND PATCH v2] drm/vmwgfx: fix a warning due to missing
 dma_parms
Thread-Topic: [RESEND PATCH v2] drm/vmwgfx: fix a warning due to missing
 dma_parms
Thread-Index: AQHVGk0pdSF6X2nLpkaeYBYmp783i6aLTD8A
Date: Tue, 4 Jun 2019 10:29:45 +0000
Message-ID: <081c38de98938c5d97da370a965a57d5852e527c.camel@vmware.com>
References: <1559594655-30324-1-git-send-email-cai@lca.pw>
In-Reply-To: <1559594655-30324-1-git-send-email-cai@lca.pw>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2909b0b5-98d7-4afa-ca7c-08d6e8d7909b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR05MB6256; 
x-ms-traffictypediagnostic: MN2PR05MB6256:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <MN2PR05MB62563E5646CF50AE78A6E218A1150@MN2PR05MB6256.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(39860400002)(366004)(376002)(346002)(189003)(199004)(36756003)(54906003)(25786009)(6512007)(110136005)(6436002)(186003)(53936002)(118296001)(76176011)(7736002)(305945005)(4326008)(66476007)(5660300002)(229853002)(66556008)(76116006)(73956011)(6486002)(478600001)(64756008)(6246003)(91956017)(66446008)(14454004)(5024004)(14444005)(256004)(66946007)(71200400001)(66066001)(2906002)(316002)(86362001)(2501003)(81166006)(81156014)(6506007)(8936002)(102836004)(486006)(26005)(3846002)(6116002)(68736007)(446003)(476003)(8676002)(11346002)(99286004)(71190400001)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6256;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CSrA07GHdrUerDASVHq0M9lcuId1Onv3rskWHmK3CF1PrpRKRoqBxj6j2+hWwP8S7MaC/4fmQHThqSNnly1IKFpogEYxBb7XaO5GglZtSn4A/Q7H2fs8teq1A36xzcwx9vY0Dx/V+rx3fB57kxTer+GNW070bgFG4AqPN4WVCSp7YhiIxhAcx2M5MD8F158RIxEsPKQS5KasMzvVaLd4uWk+X9NS2NGC4WDrM0r8e2iFWnKOjXS6uoAx5dCMl+i8sp/biFWmuAzdAl+DZMrkYro1UviMYwwrwAT9LLwbHAV/fzyxvnwo+ayqo4Q5QpbhW4H2j0uCF/TN8A+O+JmRx2rws+uPiwEbPbQ2U3o6U0DEZRkNslgZft3yy3TyMoKFf2nJX1goBuD6ZLGep2M/AulVq7Xxm0dAWwAviSnb62k=
Content-ID: <486C4FC79EAC944195958BE914B95201@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2909b0b5-98d7-4afa-ca7c-08d6e8d7909b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 10:29:45.9986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thellstrom@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6256
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rMsbvt3Z6nAtt9MeDh8YO5Crm1oJm6GJGvzYdGEmz4=;
 b=CcUKl+X9ZUk85UPpKQd+Jimp/MSt5IQOIqfY9IpCenIDJvCFc/YPxClzzAs7Slmv3Jb1xLu+yrdeg7qrknC3CeZF1PVx4hiH6OijTmWFqChcP8CDQVSNnrDVUPtMX+w+TksjFzuDADd88P8OuGo0h6YG4FjGeqrwqHKLbM2SuyM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "hch@lst.de" <hch@lst.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4NCg0K
SSdsbCBqdXN0IG5lZWQgdG8gZ2l2ZSB0aGlzIHNvbWUgbW9yZSB0ZXN0aW5nIGJlZm9yZSBxdWV1
ZWluZyBpdCBvbg0Kdm13Z2Z4LWZpeGVzLg0KDQpUaGFua3MsDQpUaG9tYXMNCg0KDQpPbiBNb24s
IDIwMTktMDYtMDMgYXQgMTY6NDQgLTA0MDAsIFFpYW4gQ2FpIHdyb3RlOg0KPiBCb290aW5nIHVw
IHdpdGggRE1BX0FQSV9ERUJVR19TRz15IGdlbmVyYXRlcyBhIHdhcm5pbmcgZHVlIHRvIHRoZQ0K
PiBkcml2ZXINCj4gZm9yZ290IHRvIHNldCBkbWFfcGFybXMgYXBwcm9wcmlhdGVseS4gU2V0IGl0
IGp1c3QgYWZ0ZXINCj4gdm13X2RtYV9tYXNrcygpDQo+IGluIHZtd19kcml2ZXJfbG9hZCgpLg0K
PiANCj4gRE1BLUFQSTogdm13Z2Z4IDAwMDA6MDA6MGYuMDogbWFwcGluZyBzZyBzZWdtZW50IGxv
bmdlciB0aGFuIGRldmljZQ0KPiBjbGFpbXMgdG8gc3VwcG9ydCBbbGVuPTIwOTcxNTJdIFttYXg9
NjU1MzZdDQo+IFdBUk5JTkc6IENQVTogMiBQSUQ6IDI2MSBhdCBrZXJuZWwvZG1hL2RlYnVnLmM6
MTIzMg0KPiBkZWJ1Z19kbWFfbWFwX3NnKzB4MzYwLzB4NDgwDQo+IEhhcmR3YXJlIG5hbWU6IFZN
d2FyZSwgSW5jLiBWTXdhcmUgVmlydHVhbCBQbGF0Zm9ybS80NDBCWCBEZXNrdG9wDQo+IFJlZmVy
ZW5jZSBQbGF0Zm9ybSwgQklPUyA2LjAwIDA0LzEzLzIwMTgNCj4gUklQOiAwMDEwOmRlYnVnX2Rt
YV9tYXBfc2crMHgzNjAvMHg0ODANCj4gQ2FsbCBUcmFjZToNCj4gIHZtd190dG1fbWFwX2RtYSsw
eDNiMS8weDViMCBbdm13Z2Z4XQ0KPiAgdm13X2JvX21hcF9kbWErMHgyNS8weDMwIFt2bXdnZnhd
DQo+ICB2bXdfb3RhYmxlc19zZXR1cCsweDJhOC8weDc1MCBbdm13Z2Z4XQ0KPiAgdm13X3JlcXVl
c3RfZGV2aWNlX2xhdGUrMHg3OC8weGMwIFt2bXdnZnhdDQo+ICB2bXdfcmVxdWVzdF9kZXZpY2Ur
MHhlZS8weDRlMCBbdm13Z2Z4XQ0KPiAgdm13X2RyaXZlcl9sb2FkLmNvbGQrMHg3NTcvMHhkODQg
W3Ztd2dmeF0NCj4gIGRybV9kZXZfcmVnaXN0ZXIrMHgxZmYvMHgzNDAgW2RybV0NCj4gIGRybV9n
ZXRfcGNpX2RldisweDExMC8weDI5MCBbZHJtXQ0KPiAgdm13X3Byb2JlKzB4MTUvMHgyMCBbdm13
Z2Z4XQ0KPiAgbG9jYWxfcGNpX3Byb2JlKzB4N2EvMHhjMA0KPiAgcGNpX2RldmljZV9wcm9iZSsw
eDFiOS8weDI5MA0KPiAgcmVhbGx5X3Byb2JlKzB4MWI1LzB4NjMwDQo+ICBkcml2ZXJfcHJvYmVf
ZGV2aWNlKzB4YTMvMHgxYTANCj4gIGRldmljZV9kcml2ZXJfYXR0YWNoKzB4OTQvMHhhMA0KPiAg
X19kcml2ZXJfYXR0YWNoKzB4ZGQvMHgxYzANCj4gIGJ1c19mb3JfZWFjaF9kZXYrMHhmZS8weDE1
MA0KPiAgZHJpdmVyX2F0dGFjaCsweDJkLzB4NDANCj4gIGJ1c19hZGRfZHJpdmVyKzB4MjkwLzB4
MzUwDQo+ICBkcml2ZXJfcmVnaXN0ZXIrMHhkYy8weDFkMA0KPiAgX19wY2lfcmVnaXN0ZXJfZHJp
dmVyKzB4ZGEvMHhmMA0KPiAgdm13Z2Z4X2luaXQrMHgzNC8weDEwMDAgW3Ztd2dmeF0NCj4gIGRv
X29uZV9pbml0Y2FsbCsweGU1LzB4NDBhDQo+ICBkb19pbml0X21vZHVsZSsweDEwZi8weDNhMA0K
PiAgbG9hZF9tb2R1bGUrMHgxNmE1LzB4MWE0MA0KPiAgX19zZV9zeXNfZmluaXRfbW9kdWxlKzB4
MTgzLzB4MWMwDQo+ICBfX3g2NF9zeXNfZmluaXRfbW9kdWxlKzB4NDMvMHg1MA0KPiAgZG9fc3lz
Y2FsbF82NCsweGM4LzB4NjA2DQo+ICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0
NC8weGE5DQo+IA0KPiBGaXhlczogZmIxZDk3MzhjYTA1ICgiZHJtL3Ztd2dmeDogQWRkIERSTSBk
cml2ZXIgZm9yIFZNd2FyZSBWaXJ0dWFsDQo+IEdQVSIpDQo+IFN1Z2dlc3RlZC1ieTogVGhvbWFz
IEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBRaWFu
IENhaSA8Y2FpQGxjYS5wdz4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9kcnYuYyB8IDIgKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jDQo+IGluZGV4IDRmZjExYTAwNzdlMS4u
NWY2OTA0MjllYjg5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYw0KPiBA
QCAtNzQ3LDYgKzc0Nyw4IEBAIHN0YXRpYyBpbnQgdm13X2RyaXZlcl9sb2FkKHN0cnVjdCBkcm1f
ZGV2aWNlDQo+ICpkZXYsIHVuc2lnbmVkIGxvbmcgY2hpcHNldCkNCj4gIAlpZiAodW5saWtlbHko
cmV0ICE9IDApKQ0KPiAgCQlnb3RvIG91dF9lcnIwOw0KPiAgDQo+ICsJZG1hX3NldF9tYXhfc2Vn
X3NpemUoZGV2LT5kZXYsIFUzMl9NQVgpOw0KPiArDQo+ICAJaWYgKGRldl9wcml2LT5jYXBhYmls
aXRpZXMgJiBTVkdBX0NBUF9HTVIyKSB7DQo+ICAJCURSTV9JTkZPKCJNYXggR01SIGlkcyBpcyAl
dVxuIiwNCj4gIAkJCSAodW5zaWduZWQpZGV2X3ByaXYtPm1heF9nbXJfaWRzKTsNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
