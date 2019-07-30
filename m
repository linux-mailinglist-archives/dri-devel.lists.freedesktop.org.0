Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC687A966
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 15:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECF76E4F5;
	Tue, 30 Jul 2019 13:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810054.outbound.protection.outlook.com [40.107.81.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E226E4F5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 13:22:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehsxdIJtX3306zDp3tdqwu+yN2DBpLR0IkNi90WAdBvLoFhrfiIgsHsIj7ZhnPwCgQ8fFLfKsGlYcHEiEKeLv1nNksvXWYaX+NX5DoDVePK3C+XvnZVLDBS09pBv6An7O7lwcUD57jJUBApGpzO7MvDQLMqZMglMAgplWEz6um550xDvKmECd7IvwhHJqDm6Dzoog8rPwGd07l1VuE/EityaVfoaIK0cn8KJJhwpnHvyDyMeHewBC0IwbW833QssEd/Jk6cBGZ4BOf8R8NlumLp476JCVHR+96OcaeVece2C+yph0hp84qv8guvLzLZqztzc4MfROt52QsWPzLE05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/0dQDzAdr/icGLhtg7U3Cbjjg658l+Xeqk0nFkl2sc=;
 b=DTDTdaL2HKtZrZEg+Wo4LLuFdhm1efjb3xQL24CMwyrxgqwEjMYGiG49zopVBh7IbZUAjuhYfazEkiRpJ3XqtkG4OiL/d756ueeSNxLQeYFQcdqmFWxcqkOPCNEwgd5dg6cHEUuQtBdjSbXzNu/W/dKS18LsT8fCitSoh83ILwK9HfC6nRSs9F6K10B/neyBkeZKVYyFX4QcY/IzY3EfGYeIJFjn//7h0Xno5+J1RXahW32i8p7cum2OG+tO+lABeZxC/piQ2ZiTivSFuucJoZZ3O0v/5YKLVD9SElhT7R1hdGaMzo+BXGL1EvkpxLgiuqDs8y9fsh4kVPcRdtyZ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB2976.namprd12.prod.outlook.com (20.178.240.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Tue, 30 Jul 2019 13:22:19 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::889b:34f1:1aaa:1e67]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::889b:34f1:1aaa:1e67%7]) with mapi id 15.20.2136.010; Tue, 30 Jul 2019
 13:22:19 +0000
From: Chunming Zhou <zhoucm1@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Lionel Landwerlin
 <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH] drm/syncobj: extend syncobj query ability v3
Thread-Topic: [PATCH] drm/syncobj: extend syncobj query ability v3
Thread-Index: AQHVRtcNUs07r5tgiUqd+Ak68kvZFKbjJKwAgAABCwA=
Date: Tue, 30 Jul 2019 13:22:19 +0000
Message-ID: <78e2e61f-6faa-94e2-8583-faa6313eb423@amd.com>
References: <20190730130208.30977-1-david1.zhou@amd.com>
 <cfd2ad24-9210-0ba6-bc36-7cc44ac92112@amd.com>
In-Reply-To: <cfd2ad24-9210-0ba6-bc36-7cc44ac92112@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR0401CA0001.apcprd04.prod.outlook.com
 (2603:1096:202:2::11) To MN2PR12MB2910.namprd12.prod.outlook.com
 (2603:10b6:208:af::27)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4122aa98-2c9c-4ae8-4bd8-08d714f0f2ab
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB2976; 
x-ms-traffictypediagnostic: MN2PR12MB2976:
x-microsoft-antispam-prvs: <MN2PR12MB2976AFB22F4BF0ABA5B23110B4DC0@MN2PR12MB2976.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(189003)(199004)(14454004)(7736002)(53936002)(305945005)(229853002)(99286004)(66446008)(81156014)(81166006)(316002)(478600001)(110136005)(66066001)(6436002)(26005)(386003)(186003)(6486002)(102836004)(6506007)(5660300002)(52116002)(6512007)(8936002)(66946007)(2501003)(66476007)(8676002)(66556008)(76176011)(64756008)(3846002)(6116002)(486006)(2616005)(476003)(71200400001)(71190400001)(2906002)(256004)(446003)(11346002)(6246003)(25786009)(36756003)(68736007)(31696002)(31686004)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2976;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OXUEcP3Imtm9NjXXlkNbZGNiy+ZIY9bX0UALP+YsjDtbn8FadzkjGUN5NoKU0BSXcjl5QD/qRSroxxUpuSFdDC5RZMttgHt7xeCsgmuE1vaWZyPCAw0DYREThDlPHsdU/zOnnvBn/F90gm5xSrEBVMixZLes1uODwPLh/NuGWJf2x533uFbMXISv4kyXNM1M9lKFkHG+2QdFf4jgizuU0tY7IRJXgNO19YEaUrLG5pr0Nstv00/YRjajsp0YDgNGARSR8sTULHKj6k/5pV09L9UABsmC2pmQ2kDH3QIZBt8+rzdAvxvXpTmXJ5ommurSad/L5PNsW0FII8YcB6xRINMXLSJdLidCqEA75mZTI/NyHyTdsmEj47c6WTKNmIA/x0O8gFX1xD9DLBNmSOEsGQFo/pkIH5nfhyUI0ojU2OY=
Content-ID: <8F2A31A6058A104FA0B95C1CB0C831BE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4122aa98-2c9c-4ae8-4bd8-08d714f0f2ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 13:22:19.3292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhoucm1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2976
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/0dQDzAdr/icGLhtg7U3Cbjjg658l+Xeqk0nFkl2sc=;
 b=xtW7nyyGyV5lMMmBqVnlnynUr4hKeBmJqwa5QPMCnrCoZUyw8RQZXxdNXBZeJbRiMw1gJ33krHZuuBI7EvaLhQLP9TsCbuSosnT/zQdi53n+/M/iU7iRrnxZXvgJyln+6EZSUhA2CNhIqxzfA841GtRNAN3V5Zxcq5l3Mg1NnWI=
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

DQrlnKggMjAxOS83LzMwIDIxOjE3LCBLb2VuaWcsIENocmlzdGlhbiDlhpnpgZM6DQo+IEFtIDMw
LjA3LjE5IHVtIDE1OjAyIHNjaHJpZWIgQ2h1bm1pbmcgWmhvdToNCj4+IHVzZXIgc3BhY2UgbmVl
ZHMgYSBmbGV4aWFibGUgcXVlcnkgYWJpbGl0eS4NCj4+IFNvIHRoYXQgdW1kIGNhbiBnZXQgbGFz
dCBzaWduYWxlZCBvciBzdWJtaXR0ZWQgcG9pbnQuDQo+PiB2MjoNCj4+IGFkZCBzYW5pdGl6ZXIg
Y2hlY2tpbmcuDQo+PiB2MzoNCj4+IHJlYmFzZQ0KPj4NCj4+IENoYW5nZS1JZDogSTY1MTJiNDMw
NTI0ZWJhYmU3MTVlNjAyYTJiZjVhYmIwYTdlNzgwZWENCj4+IFNpZ25lZC1vZmYtYnk6IENodW5t
aW5nIFpob3UgPGRhdmlkMS56aG91QGFtZC5jb20+DQo+PiBDYzogTGlvbmVsIExhbmR3ZXJsaW4g
PGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPg0KPj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcg
PENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBMaW9uZWwgTGFuZHdl
cmxpbiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjcmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4NCj4gTGlvbmVsIGlzIHRo
ZSBJbnRlbCBjb2RlIHVzaW5nIHRoaXMgYWxyZWFkeSBwdWJsaWM/IE9yIERhdmlkIGFueSBjaGFu
Y2UNCj4gdGhhdCB3ZSBjYW4gZ2V0IGEgcHVibGljIGFtZHZsayByZWxlYXNlIHVzaW5nIHRoaXM/
DQoNCkluIGxhdGVzdCBwdWJsaWMgYW1kdmxrLCBXZSBzaG91bGQgYmUgYWJsZSB0byBzZWUgaG93
IHRpbWVsaW5lIHN5bmNvYmogDQppcyB1c2VkIGluIGl0Lg0KDQoNCi1EYXZpZA0KDQo+DQo+IENo
cmlzdGlhbi4NCj4NCj4+IC0tLQ0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMg
fCAzNyArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQ0KPj4gICAgaW5jbHVkZS91
YXBpL2RybS9kcm0uaCAgICAgICAgfCAgMyArKy0NCj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMjQg
aW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fc3luY29iai5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMN
Cj4+IGluZGV4IGNlY2ZmMmU0NDdiMS4uZDQ0MzJmMTUxM2FjIDEwMDY0NA0KPj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
c3luY29iai5jDQo+PiBAQCAtMTE5Nyw3ICsxMTk3LDcgQEAgZHJtX3N5bmNvYmpfdGltZWxpbmVf
c2lnbmFsX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+PiAgICAJ
aWYgKCFkcm1fY29yZV9jaGVja19mZWF0dXJlKGRldiwgRFJJVkVSX1NZTkNPQkpfVElNRUxJTkUp
KQ0KPj4gICAgCQlyZXR1cm4gLUVPUE5PVFNVUFA7DQo+PiAgICANCj4+IC0JaWYgKGFyZ3MtPnBh
ZCAhPSAwKQ0KPj4gKwlpZiAoYXJncy0+ZmxhZ3MgIT0gMCkNCj4+ICAgIAkJcmV0dXJuIC1FSU5W
QUw7DQo+PiAgICANCj4+ICAgIAlpZiAoYXJncy0+Y291bnRfaGFuZGxlcyA9PSAwKQ0KPj4gQEAg
LTEyNjgsNyArMTI2OCw3IEBAIGludCBkcm1fc3luY29ial9xdWVyeV9pb2N0bChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCB2b2lkICpkYXRhLA0KPj4gICAgCWlmICghZHJtX2NvcmVfY2hlY2tfZmVh
dHVyZShkZXYsIERSSVZFUl9TWU5DT0JKX1RJTUVMSU5FKSkNCj4+ICAgIAkJcmV0dXJuIC1FT1BO
T1RTVVBQOw0KPj4gICAgDQo+PiAtCWlmIChhcmdzLT5wYWQgIT0gMCkNCj4+ICsJaWYgKGFyZ3Mt
PmZsYWdzICYgfkRSTV9TWU5DT0JKX1FVRVJZX0ZMQUdTX0xBU1RfU1VCTUlUVEVEKQ0KPj4gICAg
CQlyZXR1cm4gLUVJTlZBTDsNCj4+ICAgIA0KPj4gICAgCWlmIChhcmdzLT5jb3VudF9oYW5kbGVz
ID09IDApDQo+PiBAQCAtMTI4OSwyNSArMTI4OSwzMiBAQCBpbnQgZHJtX3N5bmNvYmpfcXVlcnlf
aW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4+ICAgIAkJZmVuY2Ug
PSBkcm1fc3luY29ial9mZW5jZV9nZXQoc3luY29ianNbaV0pOw0KPj4gICAgCQljaGFpbiA9IHRv
X2RtYV9mZW5jZV9jaGFpbihmZW5jZSk7DQo+PiAgICAJCWlmIChjaGFpbikgew0KPj4gLQkJCXN0
cnVjdCBkbWFfZmVuY2UgKml0ZXIsICpsYXN0X3NpZ25hbGVkID0gTlVMTDsNCj4+IC0NCj4+IC0J
CQlkbWFfZmVuY2VfY2hhaW5fZm9yX2VhY2goaXRlciwgZmVuY2UpIHsNCj4+IC0JCQkJaWYgKGl0
ZXItPmNvbnRleHQgIT0gZmVuY2UtPmNvbnRleHQpIHsNCj4+IC0JCQkJCWRtYV9mZW5jZV9wdXQo
aXRlcik7DQo+PiAtCQkJCQkvKiBJdCBpcyBtb3N0IGxpa2VseSB0aGF0IHRpbWVsaW5lIGhhcw0K
Pj4gLQkJCQkJICogdW5vcmRlciBwb2ludHMuICovDQo+PiAtCQkJCQlicmVhazsNCj4+ICsJCQlz
dHJ1Y3QgZG1hX2ZlbmNlICppdGVyLCAqbGFzdF9zaWduYWxlZCA9DQo+PiArCQkJCWRtYV9mZW5j
ZV9nZXQoZmVuY2UpOw0KPj4gKw0KPj4gKwkJCWlmIChhcmdzLT5mbGFncyAmDQo+PiArCQkJICAg
IERSTV9TWU5DT0JKX1FVRVJZX0ZMQUdTX0xBU1RfU1VCTUlUVEVEKSB7DQo+PiArCQkJCXBvaW50
ID0gZmVuY2UtPnNlcW5vOw0KPj4gKwkJCX0gZWxzZSB7DQo+PiArCQkJCWRtYV9mZW5jZV9jaGFp
bl9mb3JfZWFjaChpdGVyLCBmZW5jZSkgew0KPj4gKwkJCQkJaWYgKGl0ZXItPmNvbnRleHQgIT0g
ZmVuY2UtPmNvbnRleHQpIHsNCj4+ICsJCQkJCQlkbWFfZmVuY2VfcHV0KGl0ZXIpOw0KPj4gKwkJ
CQkJCS8qIEl0IGlzIG1vc3QgbGlrZWx5IHRoYXQgdGltZWxpbmUgaGFzDQo+PiArCQkJCQkJKiB1
bm9yZGVyIHBvaW50cy4gKi8NCj4+ICsJCQkJCQlicmVhazsNCj4+ICsJCQkJCX0NCj4+ICsJCQkJ
CWRtYV9mZW5jZV9wdXQobGFzdF9zaWduYWxlZCk7DQo+PiArCQkJCQlsYXN0X3NpZ25hbGVkID0g
ZG1hX2ZlbmNlX2dldChpdGVyKTsNCj4+ICAgIAkJCQl9DQo+PiAtCQkJCWRtYV9mZW5jZV9wdXQo
bGFzdF9zaWduYWxlZCk7DQo+PiAtCQkJCWxhc3Rfc2lnbmFsZWQgPSBkbWFfZmVuY2VfZ2V0KGl0
ZXIpOw0KPj4gKwkJCQlwb2ludCA9IGRtYV9mZW5jZV9pc19zaWduYWxlZChsYXN0X3NpZ25hbGVk
KSA/DQo+PiArCQkJCQlsYXN0X3NpZ25hbGVkLT5zZXFubyA6DQo+PiArCQkJCQl0b19kbWFfZmVu
Y2VfY2hhaW4obGFzdF9zaWduYWxlZCktPnByZXZfc2Vxbm87DQo+PiAgICAJCQl9DQo+PiAtCQkJ
cG9pbnQgPSBkbWFfZmVuY2VfaXNfc2lnbmFsZWQobGFzdF9zaWduYWxlZCkgPw0KPj4gLQkJCQls
YXN0X3NpZ25hbGVkLT5zZXFubyA6DQo+PiAtCQkJCXRvX2RtYV9mZW5jZV9jaGFpbihsYXN0X3Np
Z25hbGVkKS0+cHJldl9zZXFubzsNCj4+ICAgIAkJCWRtYV9mZW5jZV9wdXQobGFzdF9zaWduYWxl
ZCk7DQo+PiAgICAJCX0gZWxzZSB7DQo+PiAgICAJCQlwb2ludCA9IDA7DQo+PiAgICAJCX0NCj4+
ICsJCWRtYV9mZW5jZV9wdXQoZmVuY2UpOw0KPj4gICAgCQlyZXQgPSBjb3B5X3RvX3VzZXIoJnBv
aW50c1tpXSwgJnBvaW50LCBzaXplb2YodWludDY0X3QpKTsNCj4+ICAgIAkJcmV0ID0gcmV0ID8g
LUVGQVVMVCA6IDA7DQo+PiAgICAJCWlmIChyZXQpDQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91
YXBpL2RybS9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtLmgNCj4+IGluZGV4IDY2MWQ3M2Y5
YTkxOS4uZmQ5ODdjZTI0ZDlmIDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm0u
aA0KPj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm0uaA0KPj4gQEAgLTc3NywxMSArNzc3LDEy
IEBAIHN0cnVjdCBkcm1fc3luY29ial9hcnJheSB7DQo+PiAgICAJX191MzIgcGFkOw0KPj4gICAg
fTsNCj4+ICAgIA0KPj4gKyNkZWZpbmUgRFJNX1NZTkNPQkpfUVVFUllfRkxBR1NfTEFTVF9TVUJN
SVRURUQgKDEgPDwgMCkgLyogbGFzdCBhdmFpbGFibGUgcG9pbnQgb24gdGltZWxpbmUgc3luY29i
aiAqLw0KPj4gICAgc3RydWN0IGRybV9zeW5jb2JqX3RpbWVsaW5lX2FycmF5IHsNCj4+ICAgIAlf
X3U2NCBoYW5kbGVzOw0KPj4gICAgCV9fdTY0IHBvaW50czsNCj4+ICAgIAlfX3UzMiBjb3VudF9o
YW5kbGVzOw0KPj4gLQlfX3UzMiBwYWQ7DQo+PiArCV9fdTMyIGZsYWdzOw0KPj4gICAgfTsNCj4+
ICAgIA0KPj4gICAgDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
