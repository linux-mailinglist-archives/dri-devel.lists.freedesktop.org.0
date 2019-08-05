Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EFB82069
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 17:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF64896EB;
	Mon,  5 Aug 2019 15:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::602])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8A5896EB
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 15:37:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lS0lxf7tzSG3WCsVVPVDFuU/ERTz8JqjIXwCCS+HG63gZWaAYale5ZCg+R1RBfD7OeVND+AKoMJuBk3CcaXcKNCJ2tdZCgjtZfh6Vv64HicoKcVHC/jkY7KwCj9LPIdJ9jZHxTvtj1PsCdvl7q1KQc0UWZvXyDBfPi5pU66NqYtC9iLMXxz77SwxmfeEkA/KRcbPni0wD6171c34PH2lR975sEqJgVOnTcBALNGAwNzIJyE4w822IRn49PMYU/q4Rgl6IBXjWFh4a6E1osavjXs4a/VLXd9KmVWGitiJZWNCDTrGLTJkkHiwX2OgSuMfinQlI2Xz8n9u/HyCs2HxiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U96rkqhjtO3+0+5R08ksYP4Vkf4pktkAULLoCqkcL4M=;
 b=mxDPPRx8P3SWckEGPzoRttYJvj+90J5txUDavZWymBCc0KVlNpzrh2VtzFwxKxzR1DLKdqjvHnLDoQ5Nm3XbXzjpDZkLjmets03qm98Gl9yPHVwjsQ75cnc3lqtMEUGet4F/VHDcbOQBcc5zQ3aLSlrze8E0HjrQMUIeW6FZC30tf3P/fMCNJemwAxs2hLIFFNbMMABTBK8j2soUum2CMJS6CIQyohcQp2hqlI6v5fBpoENrdsply+g2T9asqp0aRwzft4UdkMPp/sS/iYCdB237QCQoH42/svsFz9QP0iJrFBbCi6mzsk3ncUL7xELmN2dNdLQLrGjCh+vpI4NNiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from BY5PR05MB6883.namprd05.prod.outlook.com (52.132.255.33) by
 BY5PR05MB7140.namprd05.prod.outlook.com (10.255.89.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.11; Mon, 5 Aug 2019 15:37:22 +0000
Received: from BY5PR05MB6883.namprd05.prod.outlook.com
 ([fe80::6d09:ff82:988b:5e03]) by BY5PR05MB6883.namprd05.prod.outlook.com
 ([fe80::6d09:ff82:988b:5e03%5]) with mapi id 15.20.2157.011; Mon, 5 Aug 2019
 15:37:22 +0000
From: Deepak Singh Rawat <drawat@vmware.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] drm/vmwgfx: add local DRM_AUTH check for PRIME
 TO/FROM HANDLE
Thread-Topic: [PATCH v2 1/2] drm/vmwgfx: add local DRM_AUTH check for PRIME
 TO/FROM HANDLE
Thread-Index: AQHVSVQCrXy7GEbpjUWWs3Yv/6jpIKbstPuA
Date: Mon, 5 Aug 2019 15:37:22 +0000
Message-ID: <5dfd670173701da38226bc0da071ba829b11cf4c.camel@vmware.com>
References: <20190802170117.10942-1-emil.l.velikov@gmail.com>
In-Reply-To: <20190802170117.10942-1-emil.l.velikov@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0038.namprd11.prod.outlook.com
 (2603:10b6:a03:80::15) To BY5PR05MB6883.namprd05.prod.outlook.com
 (2603:10b6:a03:1c9::33)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [66.170.99.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a3624b2-eda4-4bd2-287d-08d719bacebb
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR05MB7140; 
x-ms-traffictypediagnostic: BY5PR05MB7140:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR05MB7140D5853545119B6325CD74BADA0@BY5PR05MB7140.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(199004)(189003)(446003)(229853002)(186003)(53936002)(6512007)(99286004)(68736007)(2616005)(26005)(4326008)(6506007)(76176011)(305945005)(66066001)(386003)(7736002)(5660300002)(316002)(54906003)(107886003)(110136005)(6246003)(6116002)(3846002)(14454004)(256004)(486006)(102836004)(52116002)(478600001)(66556008)(64756008)(66946007)(66446008)(118296001)(66476007)(2501003)(25786009)(71190400001)(11346002)(50226002)(71200400001)(81166006)(2906002)(6436002)(8936002)(81156014)(6486002)(86362001)(36756003)(8676002)(476003)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR05MB7140;
 H:BY5PR05MB6883.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S/CfU/Gk3NeFxqs3RBsm//FTADWFDIfYYDX1syAdOg2RNwiy5BqDibBp7UNaFS+NgbZIDK4wnJjkjJOi1bXGObvHlp/zJGCMH/+OPiepYl++ZLwIdBU7vdEh3Cz9bLPrBigU+R+XbKOk15Db17q9XSroIeqhHjs31ci/hit72uO9osWQz/QI8YTZHYb9FaaLgDijZnehpVLsHbZ/TeXhWjIs6peF3UoJjjDlkDC9hi9p+9uVg3PLrw4V4dIz4O+WUM7PpNt8/riDcGc26so+w1NkE5nPMxDfVkH7e5o0VMnmh/mPwUjLjmcnqXAuevuIyC6s8l+eimSmgDRq2DELCahgtogM0zlymcHD54ampFbatK0wSrC0e2lOhjbt+pFxmjNJwucI5jxmFDkdNQwEbjWOIyTiR40Gmnyc9hlmrEc=
Content-ID: <DD2AC970A39C3B45B67ACFA0C87CB561@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3624b2-eda4-4bd2-287d-08d719bacebb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 15:37:22.2676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zpiEQ7CC1N7BF9V4QGuPoAV1QYgkz2AT0LM7QTgXcH7rhYrshng6rgPw/XDCJo9a7PNQmGS0KwuOTH1rY4q3SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR05MB7140
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U96rkqhjtO3+0+5R08ksYP4Vkf4pktkAULLoCqkcL4M=;
 b=uwJqliPXbzDkkD94SqGMFGN+6ciPqLYM9e0bZen5wskS4APe2O8p8nshLpCsWK3y7tmVRAlDz87V4nG5H/Gn8uNqv+2Q2iEJsitAzJWDMA/3ePHGle31hhjnwjKkGi+jNRaangA4WzL1MIxGIFQ7xsgpjWgTveyZJq8o+owHqq4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=drawat@vmware.com; 
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRW1pbCwNCg0KVGhhbmtzIGZvciBkb2luZyB0aGlzLiBMb29rcyBnb29kIHRvIG1lLiBCeSB0
aGUgd2F5IEkgdGhpbmsgVGhvbWFzIGhhZA0KYSBwYXRjaCB0byBnZXQgcmlkIG9mIGxlZ2FjeSBs
b2NraW5nIG1lY2hhbmlzbS4gSSBkb24ndCBrbm93IHdoZW4gaXQNCndpbGwgZ28gdXBzdHJlYW0u
IFdpdGggdGhhdCB3ZSBubyBuZWVkIGZvciB0aGUgYmVsb3cgY2hlY2suDQoNClJldmlld2VkLWJ5
OiBEZWVwYWsgUmF3YXQgPGRyYXdhdEB2bXdhcmUuY29tPg0KDQpPbiBGcmksIDIwMTktMDgtMDIg
YXQgMTg6MDEgKzAxMDAsIEVtaWwgVmVsaWtvdiB3cm90ZToNCj4gRnJvbTogRW1pbCBWZWxpa292
IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4NCj4gDQo+IFJlYWxpc3RpY2FsbHkgbm8gZHJp
dmVycywgYnV0IHZtd2dmeCBjYXJlIGFib3V0IHRoZSBEUk1fQVVUSCBmbGFnDQo+IGhlcmUuDQo+
IA0KPiBGb2xsb3ctdXAgd29yayBpbiB0aGlzIGRyaXZlciB3aWxsIHByb3Blcmx5IGlzb2xhdGUg
cHJpbWFyeSBjbGllbnRzDQo+IGZyb20NCj4gZGlmZmVyZW50IG1hc3RlciByZWFsbXMsIHRodXMg
d2UnbGwgbm8gbG9uZ2VyIG5lZWQgdG8gcGFyc2UgX2FueV8NCj4gaW9jdGwNCj4gZmxhZ3MuDQo+
IA0KPiBVbnRpbCB0aGF0IHdvcmsgbGFuZHMsIGFkZCBhIGxvY2FsIHdvcmthcm91bmQuDQo+IA0K
PiB2MjogVXNlIGJpdHdpc2Ugb3IgKERlZXBhaykNCj4gDQo+IENjOiBWTXdhcmUgR3JhcGhpY3Mg
PGxpbnV4LWdyYXBoaWNzLW1haW50YWluZXJAdm13YXJlLmNvbT4NCj4gQ2M6IFRob21hcyBIZWxs
c3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4NCj4gQ2M6IERlZXBhayBTaW5naCBSYXdhdCA8
ZHJhd2F0QHZtd2FyZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52
ZWxpa292QGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiBJJ2QgbGlrZSB0byBtZXJnZSB0aGlzIGFu
ZCB0aGUgbmV4dCBwYXRjaCBocm91Z2ggdGhlIGRybS1taXNjIHRyZWUuDQo+IEFjaw0KPiBhbmQg
cmIgYXJlIGFwcHJlY2lhdGVkLg0KPiANCj4gVGhhbmtzDQo+IEVtaWwNCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyB8IDkgKysrKysrKysrDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9kcnYuYw0KPiBpbmRleCBjZDBkNDlkOGE4ZGEuLjUzYWZiMWQ1OTdlOCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMNCj4gQEAgLTExMzQsNiArMTEzNCwxNSBAQCBzdGF0
aWMgbG9uZyB2bXdfZ2VuZXJpY19pb2N0bChzdHJ1Y3QgZmlsZQ0KPiAqZmlscCwgdW5zaWduZWQg
aW50IGNtZCwNCj4gIAl9IGVsc2UgaWYgKCFkcm1faW9jdGxfZmxhZ3MobnIsICZmbGFncykpDQo+
ICAJCXJldHVybiAtRUlOVkFMOw0KPiAgDQo+ICsJLyoNCj4gKwkgKiBMaXR0bGUgd29ya2Fyb3Vu
ZCB1bnRpbCB0aGUgdm13Z2Z4IHBhdGNoZXMgcHJvdmlkaW5nDQo+IGlzb2xhdGlvbiBvZg0KPiAr
CSAqIHByaW1hcnkgY2xpZW50cyBmcm9tIGRpZmZlcmVudCBtYXN0ZXIgcmVhbG1zIGxhbmQuDQo+
ICsJICogV2l0aCB0aGF0IHdvcmssIHdlJ2xsIG5vIGxvbmdlciBuZWVkIHRvIHBhcnNlIF9hbnlf
IGlvY3RsDQo+IGZsYWdzLg0KPiArCSAqLw0KPiArCWlmIChuciA9PSAweDJkIC8qIERSTV9JT0NU
TF9QUklNRV9IQU5ETEVfVE9fRkQgKi8gfHwNCj4gKwkgICAgbnIgPT0gMHgyZSAvKiBEUk1fSU9D
VExfUFJJTUVfRkRfVE9fSEFORExFICovKQ0KPiArCQlmbGFncyB8PSBEUk1fQVVUSDsNCj4gKw0K
PiAgCXZtYXN0ZXIgPSB2bXdfbWFzdGVyX2NoZWNrKGRldiwgZmlsZV9wcml2LCBmbGFncyk7DQo+
ICAJaWYgKElTX0VSUih2bWFzdGVyKSkgew0KPiAgCQlyZXQgPSBQVFJfRVJSKHZtYXN0ZXIpOw0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
