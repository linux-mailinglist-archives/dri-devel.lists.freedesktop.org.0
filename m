Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E097238C2
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 15:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE4E8929C;
	Mon, 20 May 2019 13:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720055.outbound.protection.outlook.com [40.107.72.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916238929C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 13:50:11 +0000 (UTC)
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6702.namprd05.prod.outlook.com (20.178.247.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.10; Mon, 20 May 2019 13:50:03 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad%6]) with mapi id 15.20.1922.011; Mon, 20 May 2019
 13:50:03 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: "murray.mcallister@gmail.com" <murray.mcallister@gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: integer underflow in vmw_cmd_dx_set_shader()
 leading to an invalid read
Thread-Topic: [PATCH] drm/vmwgfx: integer underflow in vmw_cmd_dx_set_shader()
 leading to an invalid read
Thread-Index: AQHVDvKlN/fpmZU6PEeeQapES7AzUqZ0B/IA
Date: Mon, 20 May 2019 13:50:03 +0000
Message-ID: <03eb2b3900505c7aba39846b533abb04f9e5682c.camel@vmware.com>
References: <20190520095734.4655-1-murray.mcallister@gmail.com>
In-Reply-To: <20190520095734.4655-1-murray.mcallister@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08c206fb-ebe7-4d8a-e19a-08d6dd2a0f7b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:MN2PR05MB6702; 
x-ms-traffictypediagnostic: MN2PR05MB6702:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <MN2PR05MB670280D229C7C55A17967790A1060@MN2PR05MB6702.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(346002)(39860400002)(136003)(366004)(199004)(189003)(68736007)(256004)(1361003)(76176011)(14444005)(2351001)(102836004)(53936002)(6246003)(71200400001)(71190400001)(229853002)(316002)(6486002)(25786009)(6512007)(6436002)(5640700003)(64756008)(86362001)(66556008)(4326008)(6506007)(118296001)(7736002)(5660300002)(76116006)(54906003)(26005)(73956011)(186003)(91956017)(305945005)(66476007)(2906002)(6916009)(14454004)(66946007)(99286004)(36756003)(81166006)(81156014)(6116002)(8676002)(486006)(3846002)(446003)(11346002)(2616005)(478600001)(476003)(66066001)(8936002)(2501003)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6702;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: d6XXuCRag6W2IlwFhAFwSkL4znGFoTakvnhiixee9BG4cHyW41dvMwi709lg8xMavmYcsxfF6pxr7Zr9TECAFzwm6XFkJaMv1PeXzCS8bMAe9+08ox1Up1ifA5yR5mT6T4LcsPAw7Q4V8R92GqUGWON9oUDieKPZirf6KorCYWH5rJWR1BzjdPtIIZtClykd4KQYErG7Xtf7qYKdMil3QnA0ufKBs9eUtCGriJgX0IJpcbdFwXAa9pvrLpfILdgtbZ22I5LnRlerKCcQvX3mIzRpqz2eTaVcRQ5wJtfi3kWyndoRDL7VbwaoFc2xPgMCZNTDlYtAc/iTNhPh0agfa8onILyDh0VXQtqkEY+hFPzD/LXaUax5hvIToTFgpk2fnEPg903FkjWGr0auKFJ0MIQ7IsLgbK+HKgRmOXsaw3o=
Content-ID: <B0E31CDD1807F34981146390CAAE5CFE@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c206fb-ebe7-4d8a-e19a-08d6dd2a0f7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 13:50:03.6166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thellstrom@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6702
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhHkYTpBK3+lU7Fk+rIuWDJwzh0ps9k52SW4uzjDH6I=;
 b=Dm0+vC4GK+GhGY80/qFfB5bC5HIaazvDQITgNSFAcTxNLybBQWJIhW1wS62JxeTybZ5mDWo5ZnwH/kb2jbitgBl857IR42+hOQVmwcVM3bHKp10cW9rWBauysCBoAINl9qeVfU1EIka0sPZe1qx9rG7Xe1XT5pvPLuSwM68dbS8=
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzLCBNdXJyYXksDQoNCkknbGwgaW5jbHVkZSBpbiB0aGUgbmV4dCB2bXdnZngtZml4ZXMg
cHVsbCByZXF1ZXN0Lg0KDQpPbiBNb24sIDIwMTktMDUtMjAgYXQgMjE6NTcgKzEyMDAsIE11cnJh
eSBNY0FsbGlzdGVyIHdyb3RlOg0KPiBJZiBTVkdBXzNEX0NNRF9EWF9TRVRfU0hBREVSIGlzIGNh
bGxlZCB3aXRoIGEgc2hhZGVyIElEDQo+IG9mIFNWR0EzRF9JTlZBTElEX0lELCBhbmQgYSBzaGFk
ZXIgdHlwZSBvZg0KPiBTVkdBM0RfU0hBREVSVFlQRV9JTlZBTElELCB0aGUgY2FsY3VsYXRlZCBi
aW5kaW5nLnNoYWRlcl9zbG90DQo+IHdpbGwgYmUgNDI5NDk2NzI5NSwgbGVhZGluZyB0byBhbiBv
dXQtb2YtYm91bmRzIHJlYWQgaW4NCj4gdm13X2JpbmRpbmdfbG9jKCkNCj4gd2hlbiB0aGUgb2Zm
c2V0IGlzIGNhbGN1bGF0ZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNdXJyYXkgTWNBbGxpc3Rl
ciA8bXVycmF5Lm1jYWxsaXN0ZXJAZ21haWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X2V4ZWNidWYuYyB8IDMgKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfZXhlY2J1Zi5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfZXhlY2J1Zi5jDQo+IGluZGV4IDJmZjdiYTA0ZDhjOC4uOWFlYjU0NDhjZmMxIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9leGVjYnVmLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZXhlY2J1Zi5jDQo+IEBAIC0yMTkz
LDcgKzIxOTMsOCBAQCBzdGF0aWMgaW50IHZtd19jbWRfZHhfc2V0X3NoYWRlcihzdHJ1Y3QNCj4g
dm13X3ByaXZhdGUgKmRldl9wcml2LA0KPiAgDQo+ICAJY21kID0gY29udGFpbmVyX29mKGhlYWRl
ciwgdHlwZW9mKCpjbWQpLCBoZWFkZXIpOw0KPiAgDQo+IC0JaWYgKGNtZC0+Ym9keS50eXBlID49
IFNWR0EzRF9TSEFERVJUWVBFX0RYMTBfTUFYKSB7DQo+ICsJaWYgKGNtZC0+Ym9keS50eXBlID49
IFNWR0EzRF9TSEFERVJUWVBFX0RYMTBfTUFYIHx8DQo+ICsJICAgIGNtZC0+Ym9keS50eXBlIDwg
U1ZHQTNEX1NIQURFUlRZUEVfTUlOKSB7DQo+ICAJCVZNV19ERUJVR19VU0VSKCJJbGxlZ2FsIHNo
YWRlciB0eXBlICV1LlxuIiwNCj4gIAkJCSAgICAgICAodW5zaWduZWQgaW50KSBjbWQtPmJvZHku
dHlwZSk7DQo+ICAJCXJldHVybiAtRUlOVkFMOw0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
