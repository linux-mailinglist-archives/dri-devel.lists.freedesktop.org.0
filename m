Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF51C2DDC3
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 15:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E011B6E314;
	Wed, 29 May 2019 13:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780048.outbound.protection.outlook.com [40.107.78.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC906E105;
 Wed, 29 May 2019 13:10:45 +0000 (UTC)
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3359.namprd12.prod.outlook.com (20.178.241.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Wed, 29 May 2019 13:10:42 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::385d:9453:a16d:3964]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::385d:9453:a16d:3964%6]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 13:10:42 +0000
From: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 10/10] drm/amdgpu: stop removing BOs from the LRU v3
Thread-Topic: [PATCH 10/10] drm/amdgpu: stop removing BOs from the LRU v3
Thread-Index: AQHVFhnlTooD/opJ8UCUJ/06TVD97qaCExFQ
Date: Wed, 29 May 2019 13:10:42 +0000
Message-ID: <MN2PR12MB29106FEA538E3B90BA903527B41F0@MN2PR12MB2910.namprd12.prod.outlook.com>
References: <20190529122702.13035-1-christian.koenig@amd.com>
 <20190529122702.13035-10-christian.koenig@amd.com>
In-Reply-To: <20190529122702.13035-10-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1dbfc164-c6f4-4621-75bf-08d6e4370dbd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3359; 
x-ms-traffictypediagnostic: MN2PR12MB3359:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3359354064D0893367B40AF9B41F0@MN2PR12MB3359.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(189003)(199004)(13464003)(66066001)(2201001)(186003)(26005)(11346002)(7736002)(476003)(66574012)(8676002)(81156014)(446003)(2906002)(81166006)(86362001)(53936002)(25786009)(6246003)(486006)(8936002)(71190400001)(76176011)(7696005)(229853002)(110136005)(33656002)(6506007)(53546011)(498600001)(5660300002)(71200400001)(6116002)(3846002)(305945005)(74316002)(14454004)(966005)(6436002)(66946007)(73956011)(6306002)(102836004)(68736007)(14444005)(256004)(99286004)(55016002)(9686003)(72206003)(76116006)(66446008)(64756008)(66556008)(66476007)(52536014)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3359;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5lt1Q4CAtF/dA9nU9CUfutoKOJsqxI4nSGLP9YNzC+RKIBbUu36Qi+SEMX7eU0JBXsxADvqYZz2hYlUctO/6EvF+Lpx0Rcc8iIR42C59I8DtSS5WnQEeHWr13kh9kL1h5SGgHgww6SJGhqo43SJkWe6jZvdW9vOqr88kY6pQJvVzFvsC4z5V6Dzt5mho4ddzkxA90sTOR8zh+yc8Xl1IdQFcoL6HXSafXV8wCDgH8W1BEprNsX6M9OPLlX7rdC4uG+us5nwZsrTyasTtzYlOAQktzPBYqPkZdT49TL1dXV6efjKS7GPmFvHsrMds2fo4+WIpkNgpwMj2Fu4Zw8euYNdt7Pr8+8uPvjhrhCoiFTqYno+QTwiEJybbYAgsswxG8Y2Pr734T0SJ33ePs0f+qcGpygGMCzDtoBKfd0/QuJo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dbfc164-c6f4-4621-75bf-08d6e4370dbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 13:10:42.3428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhoucm1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3359
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3W9xyrcfhHtNHpLgITj1W0vuDeINXzV7jCwt/xWVVU=;
 b=l5MxW5iw+lvOoiUmQ/d6JeN0ki1akYSTAOuDijaY2/xjNEnuKb1wU8JOBUhQQPerIaxfiSatbZM1IpUIqXet3qrqpDoJ4LYG24wUCI41xWqtdkutT6OGcBJvGVM6KYPjQfaLBOKZiGrTES0U0zLlNg5yFeiAYmfePhavxJHeBFE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGF0Y2ggIzEsIzUsIzYsIzgsIzksIzEwIGFyZSBSZXZpZXdlZC1ieTogQ2h1bm1pbmcgWmhvdSA8
ZGF2aWQxLnpob3VAYW1kLmNvbT4NClBhdGNoICMyLCMzLCM0IGFyZSBBY2tlZC1ieTogQ2h1bm1p
bmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4NCg0KLURhdmlkDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0
cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBDaHJpc3RpYW4gSz9uaWcNCj4gU2Vu
dDogV2VkbmVzZGF5LCBNYXkgMjksIDIwMTkgODoyNyBQTQ0KPiBUbzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVj
dDogW1BBVENIIDEwLzEwXSBkcm0vYW1kZ3B1OiBzdG9wIHJlbW92aW5nIEJPcyBmcm9tIHRoZSBM
UlUgdjMNCj4gDQo+IFRoaXMgYXZvaWRzIE9PTSBzaXR1YXRpb25zIHdoZW4gd2UgaGF2ZSBsb3Rz
IG9mIHRocmVhZHMgc3VibWl0dGluZyBhdCB0aGUNCj4gc2FtZSB0aW1lLg0KPiANCj4gdjM6IGFw
cGx5IHRoaXMgdG8gdGhlIHdob2xlIGRyaXZlciwgbm90IGp1c3QgQ1MNCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gLS0t
DQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyAgICAgfCAyICstDQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3NhLmMgICAgfCAyICstDQo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgICAgfCA0ICsrLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaCB8IDIgKy0NCj4gIDQgZmls
ZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMNCj4gaW5kZXggMjBmMjk1NWQyYTU1Li4z
ZTJkYTI0Y2QxN2EgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9jcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5j
DQo+IEBAIC02NDgsNyArNjQ4LDcgQEAgc3RhdGljIGludCBhbWRncHVfY3NfcGFyc2VyX2Jvcyhz
dHJ1Y3QNCj4gYW1kZ3B1X2NzX3BhcnNlciAqcCwNCj4gIAl9DQo+IA0KPiAgCXIgPSB0dG1fZXVf
cmVzZXJ2ZV9idWZmZXJzKCZwLT50aWNrZXQsICZwLT52YWxpZGF0ZWQsIHRydWUsDQo+IC0JCQkJ
ICAgJmR1cGxpY2F0ZXMsIHRydWUpOw0KPiArCQkJCSAgICZkdXBsaWNhdGVzLCBmYWxzZSk7DQo+
ICAJaWYgKHVubGlrZWx5KHIgIT0gMCkpIHsNCj4gIAkJaWYgKHIgIT0gLUVSRVNUQVJUU1lTKQ0K
PiAgCQkJRFJNX0VSUk9SKCJ0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzIGZhaWxlZC5cbiIpOw0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzYS5jDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzYS5jDQo+IGluZGV4IDA2ZjgzY2Fj
MGQzYS4uZjY2MDYyOGU2YWY5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfY3NhLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2NzYS5jDQo+IEBAIC03OSw3ICs3OSw3IEBAIGludCBhbWRncHVfbWFwX3N0YXRpY19jc2Eo
c3RydWN0IGFtZGdwdV9kZXZpY2UNCj4gKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtLA0KPiAg
CWxpc3RfYWRkKCZjc2FfdHYuaGVhZCwgJmxpc3QpOw0KPiAgCWFtZGdwdV92bV9nZXRfcGRfYm8o
dm0sICZsaXN0LCAmcGQpOw0KPiANCj4gLQlyID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVycygmdGlj
a2V0LCAmbGlzdCwgdHJ1ZSwgTlVMTCwgdHJ1ZSk7DQo+ICsJciA9IHR0bV9ldV9yZXNlcnZlX2J1
ZmZlcnMoJnRpY2tldCwgJmxpc3QsIHRydWUsIE5VTEwsIGZhbHNlKTsNCj4gIAlpZiAocikgew0K
PiAgCQlEUk1fRVJST1IoImZhaWxlZCB0byByZXNlcnZlIENTQSxQRCBCT3M6IGVycj0lZFxuIiwg
cik7DQo+ICAJCXJldHVybiByOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2dlbS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dlbS5jDQo+IGluZGV4IGQ1MTNhNWFkMDNkZC4uZWQyNWE0ZTE0NDA0IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jDQo+IEBAIC0xNzEsNyArMTcxLDcgQEAg
dm9pZCBhbWRncHVfZ2VtX29iamVjdF9jbG9zZShzdHJ1Y3QNCj4gZHJtX2dlbV9vYmplY3QgKm9i
aiwNCj4gDQo+ICAJYW1kZ3B1X3ZtX2dldF9wZF9ibyh2bSwgJmxpc3QsICZ2bV9wZCk7DQo+IA0K
PiAtCXIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZ0aWNrZXQsICZsaXN0LCBmYWxzZSwgJmR1
cGxpY2F0ZXMsIHRydWUpOw0KPiArCXIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZ0aWNrZXQs
ICZsaXN0LCBmYWxzZSwgJmR1cGxpY2F0ZXMsIGZhbHNlKTsNCj4gIAlpZiAocikgew0KPiAgCQlk
ZXZfZXJyKGFkZXYtPmRldiwgImxlYWtpbmcgYm8gdmEgYmVjYXVzZSAiDQo+ICAJCQkid2UgZmFp
bCB0byByZXNlcnZlIGJvICglZClcbiIsIHIpOw0KPiBAQCAtNjA4LDcgKzYwOCw3IEBAIGludCBh
bWRncHVfZ2VtX3ZhX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+IHZvaWQgKmRhdGEs
DQo+IA0KPiAgCWFtZGdwdV92bV9nZXRfcGRfYm8oJmZwcml2LT52bSwgJmxpc3QsICZ2bV9wZCk7
DQo+IA0KPiAtCXIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZ0aWNrZXQsICZsaXN0LCB0cnVl
LCAmZHVwbGljYXRlcywgdHJ1ZSk7DQo+ICsJciA9IHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMoJnRp
Y2tldCwgJmxpc3QsIHRydWUsICZkdXBsaWNhdGVzLCBmYWxzZSk7DQo+ICAJaWYgKHIpDQo+ICAJ
CWdvdG8gZXJyb3JfdW5yZWY7DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X29iamVjdC5oDQo+IGluZGV4IGM0MzBlODI1OTAzOC4uZDYwNTkzY2M0MzZlIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oDQo+IEBAIC0x
NTUsNyArMTU1LDcgQEAgc3RhdGljIGlubGluZSBpbnQgYW1kZ3B1X2JvX3Jlc2VydmUoc3RydWN0
DQo+IGFtZGdwdV9ibyAqYm8sIGJvb2wgbm9faW50cikNCj4gIAlzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiA9IGFtZGdwdV90dG1fYWRldihiby0+dGJvLmJkZXYpOw0KPiAgCWludCByOw0KPiAN
Cj4gLQlyID0gdHRtX2JvX3Jlc2VydmUoJmJvLT50Ym8sICFub19pbnRyLCBmYWxzZSwgTlVMTCk7
DQo+ICsJciA9IF9fdHRtX2JvX3Jlc2VydmUoJmJvLT50Ym8sICFub19pbnRyLCBmYWxzZSwgTlVM
TCk7DQo+ICAJaWYgKHVubGlrZWx5KHIgIT0gMCkpIHsNCj4gIAkJaWYgKHIgIT0gLUVSRVNUQVJU
U1lTKQ0KPiAgCQkJZGV2X2VycihhZGV2LT5kZXYsICIlcCByZXNlcnZlIGZhaWxlZFxuIiwgYm8p
Ow0KPiAtLQ0KPiAyLjE3LjENCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
