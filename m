Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E501F62049
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 16:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD5989D9B;
	Mon,  8 Jul 2019 14:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790059.outbound.protection.outlook.com [40.107.79.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEEC89D60;
 Mon,  8 Jul 2019 14:16:48 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3511.namprd12.prod.outlook.com (20.179.94.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Mon, 8 Jul 2019 14:16:47 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b134:9f:3a1e:2b5a]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b134:9f:3a1e:2b5a%5]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 14:16:47 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm/amd/display: avoid 64-bit division
Thread-Topic: [PATCH] drm/amd/display: avoid 64-bit division
Thread-Index: AQHVNZRwAceE7Is9ZU6qN6YQ5j2Z96bAxGEA
Date: Mon, 8 Jul 2019 14:16:47 +0000
Message-ID: <cbe718e8-5a4e-9b53-138b-48119fa3018c@amd.com>
References: <20190708135238.651483-1-arnd@arndb.de>
In-Reply-To: <20190708135238.651483-1-arnd@arndb.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::37) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bc63d5c-7156-4453-67a9-08d703aee931
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3511; 
x-ms-traffictypediagnostic: BYAPR12MB3511:
x-microsoft-antispam-prvs: <BYAPR12MB3511D9F0DB58C93020E4EEFFECF60@BYAPR12MB3511.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(189003)(199004)(99286004)(305945005)(52116002)(72206003)(316002)(2906002)(102836004)(14454004)(386003)(4326008)(36756003)(53546011)(6506007)(54906003)(26005)(186003)(256004)(14444005)(6436002)(76176011)(68736007)(8676002)(71200400001)(446003)(11346002)(71190400001)(2616005)(486006)(476003)(81156014)(81166006)(8936002)(25786009)(5660300002)(229853002)(86362001)(6916009)(31696002)(66556008)(66446008)(66476007)(73956011)(64756008)(66946007)(6116002)(6246003)(3846002)(7736002)(53936002)(31686004)(66066001)(6486002)(478600001)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3511;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1v2HQ8MTcna/eHDTaZM/ELVW5ctdCUKzbAcdvyllk6PXMDtAK9fQJvygJ3tXvWS5oWIRhcuWF4iLotkhVc/YniBmYd+1mP/NA1ot6KE6SNw5ut/Eej3I2orgHrGU0uFj9izv8PONK/lZO4fzNEELcWewRpgmNRh+6dDQoGgFcMWQRC+YCPRFOspflkZqgucnr/ihD3DTaZzdWwu80LTMuc5nMcoYm6+wYxDa8+lA2+CIJGVl8rL4EfpBQnsBBgsMen3w4DmOj42+Gu5YCO0VFHXBhsyL38sRRWOqiil7u8H4CUqL68VhI20ouA2J+FoYm686wKj8FVc0057rbpow8qesPa4iFR4FVYZqFhS1wjSeXfBF8R/a0UawPP5K4rvnUCS18FmixpdJKb0VEiF4Id1DdcMrDCH2RCwWpSvVr4s=
Content-ID: <7974CE63145CD341BBC7EAA284EB17EE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc63d5c-7156-4453-67a9-08d703aee931
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 14:16:47.0884 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3511
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6Apzj7lzS/1+EYowuPJJm9HhG1CrVCdeNfTrFYAhN4=;
 b=sK//qlzcUKBd0FEp23WVC+zvKchgRcDq3lHauHhqIBrGmAKXNc6Xr1ggivEMTgahRWln5i/Lwn45XVxc7Ww3cLlelqf/UweOZssxlgBzANe86lObwwx0rYEm6CI1b4E3e+3d+yYI+JQfr/XNzK3vqDA/T+xI1kYptkMnZdLopdc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Lakha, 
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy84LzE5IDk6NTIgQU0sIEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+IE9uIDMyLWJpdCBhcmNo
aXRlY3R1cmVzLCBkaXZpZGluZyBhIDY0LWJpdCBpbnRlZ2VyIGluIHRoZSBrZXJuZWwNCj4gbGVh
ZHMgdG8gYSBsaW5rIGVycm9yOg0KPiANCj4gRVJST1I6ICJfX3VkaXZkaTMiIFtkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHUua29dIHVuZGVmaW5lZCENCj4gRVJST1I6ICJfX2RpdmRp
MyIgW2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5rb10gdW5kZWZpbmVkIQ0KPiAN
Cj4gQ2hhbmdlIHRoZSB0d28gcmVjZW50bHkgaW50cm9kdWNlZCBpbnN0YW5jZXMgdG8gYSBtdWx0
aXBseStzaGlmdA0KPiBvcGVyYXRpb24gdGhhdCBpcyBhbHNvIG11Y2ggY2hlYXBlciBvbiAzMi1i
aXQgYXJjaGl0ZWN0dXJlcy4NCj4gV2UgY2FuIGRvIHRoYXQgaGVyZSwgc2luY2UgYm90aCBvZiB0
aGVtIGFyZSByZWFsbHkgMzItYml0IG51bWJlcnMNCj4gdGhhdCBjaGFuZ2UgYSBmZXcgcGVyY2Vu
dC4NCj4gDQo+IEZpeGVzOiBiZWRiYmU2YWY0YmUgKCJkcm0vYW1kL2Rpc3BsYXk6IE1vdmUgbGlu
ayBmdW5jdGlvbnMgZnJvbSBkYyB0byBkY19saW5rIikNCj4gRml4ZXM6IGYxOGJjNGU1M2FkNiAo
ImRybS9hbWQvZGlzcGxheTogdXBkYXRlIGNhbGN1bGF0ZWQgYm91bmRpbmcgYm94IGxvZ2ljIGZv
ciBOViIpDQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQo+
IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYyAg
ICAgICAgIHwgNCArKy0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX3Jlc291cmNlLmMgfCAyICstDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NvcmUvZGNfbGluay5jDQo+IGluZGV4IGMxN2RiNWMxNDRhYS4uOGRiZjc1OWViYTQ1
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19s
aW5rLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlu
ay5jDQo+IEBAIC0zMDcyLDggKzMwNzIsOCBAQCB1aW50MzJfdCBkY19saW5rX2JhbmR3aWR0aF9r
YnBzKA0KPiAgIAkJICogYnV0IHRoZSBkaWZmZXJlbmNlIGlzIG1pbmltYWwgYW5kIGlzIGluIGEg
c2FmZSBkaXJlY3Rpb24sDQo+ICAgCQkgKiB3aGljaCBhbGwgd29ya3Mgd2VsbCBhcm91bmQgcG90
ZW50aWFsIGFtYmlndWl0eSBvZiBEUCAxLjRhIHNwZWMuDQo+ICAgCQkgKi8NCj4gLQkJbG9uZyBs
b25nIGZlY19saW5rX2J3X2ticHMgPSBsaW5rX2J3X2ticHMgKiA5NzBMTDsNCj4gLQkJbGlua19i
d19rYnBzID0gKHVpbnQzMl90KShmZWNfbGlua19id19rYnBzIC8gMTAwMExMKTsNCj4gKwkJbGlu
a19id19rYnBzID0gbXVsX3U2NF91MzJfc2hyKEJJVF9VTEwoMzIpICogOTcwTEwgLyAxMDAwLA0K
PiArCQkJCQkgICAgICAgbGlua19id19rYnBzLCAzMik7DQo+ICAgCX0NCj4gICAjZW5kaWYNCj4g
ICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9k
Y24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2Rj
bjIwX3Jlc291cmNlLmMNCj4gaW5kZXggYjM1MzI3YmFmYmM1Li43MGFjOGE5NWQyZGIgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNv
dXJjZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9yZXNvdXJjZS5jDQo+IEBAIC0yNjU3LDcgKzI2NTcsNyBAQCBzdGF0aWMgdm9pZCB1cGRhdGVf
Ym91bmRpbmdfYm94KHN0cnVjdCBkYyAqZGMsIHN0cnVjdCBfdmNzX2RwaV9zb2NfYm91bmRpbmdf
Ym94Xw0KPiAgIAkJY2FsY3VsYXRlZF9zdGF0ZXNbaV0uZHJhbV9zcGVlZF9tdHMgPSB1Y2xrX3N0
YXRlc1tpXSAqIDE2IC8gMTAwMDsNCj4gICANCj4gICAJCS8vIEZDTEs6VUNMSyByYXRpbyBpcyAx
LjA4DQo+IC0JCW1pbl9mY2xrX3JlcXVpcmVkX2J5X3VjbGsgPSAoKHVuc2lnbmVkIGxvbmcgbG9u
Zyl1Y2xrX3N0YXRlc1tpXSkgKiAxMDgwIC8gMTAwMDAwMDsNCj4gKwkJbWluX2ZjbGtfcmVxdWly
ZWRfYnlfdWNsayA9IG11bF91NjRfdTMyX3NocihCSVRfVUxMKDMyKSAqIDEwODAgLyAxMDAwMDAw
LCB1Y2xrX3N0YXRlc1tpXSwgMzIpOw0KDQpFdmVuIHRob3VnaCB0aGUgbXVsICsgc2hpZnQgd2ls
bCBiZSBmYXN0ZXIgaGVyZSwgSSB3b3VsZCBwcmVmZXIgdGhhdCANCnRoaXMganVzdCBiZSBhIGRp
dl91NjQgZm9yIGNsYXJpdHkuDQoNCk5pY2hvbGFzIEthemxhdXNrYXMNCg0KPiAgIA0KPiAgIAkJ
Y2FsY3VsYXRlZF9zdGF0ZXNbaV0uZmFicmljY2xrX21oeiA9IChtaW5fZmNsa19yZXF1aXJlZF9i
eV91Y2xrIDwgbWluX2RjZmNsaykgPw0KPiAgIAkJCQltaW5fZGNmY2xrIDogbWluX2ZjbGtfcmVx
dWlyZWRfYnlfdWNsazsNCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
