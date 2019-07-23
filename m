Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C79719F2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 16:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646A96E2BC;
	Tue, 23 Jul 2019 14:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750088.outbound.protection.outlook.com [40.107.75.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3557A6E2BC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 14:08:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSTpxvcXDrYrCRJCJTEEU3MLpXcLYcNFzLUwQaJrUkl/omslGX0PvlTIX9MtZ2PmdkGLFApH+c3phL49Pw+5DCkDjnOROeiNNnHRmFKtsht5iIoEg4SQmTuc4JdCV7WQo11agRno8IfaaCUz9ZWGzgmxyQLMv1FVUXUaesjCV/9XPiHBPVs030SNpvXzPzVE9oSigGjJX6vTZasjkQujEgyGUUhhL/5SygZuRLSGQ2sHDSLSK/1yCzahU8KjXIUQCgUphtn+ULLusPQw1XD7XBsoBpEZghjIScfQD5g8LB6cPvw33xPGvbf/PvcDjg7JWOTN5CRdd4c5SSZ6y5T0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2xBOytfZSL/kaFz95Dslz6BQSkyJZXcTxh1HeM102E=;
 b=VSuOowEuVbMpk2Ulv4oDDOI9++K4dgpjdSVzDMIXYupkbW2KOdYZ4j8WJaDCNyaRNcFCldYwJZ4mNXk07awCSeIoNKTLiIUT/aQe1pOCnlpd3FVuHFUi6jaYEdXfvgvniL0I39OIQJzb59s7K3XEThB98Kqu3KHP8Y4jg9jpMY/ebNtm9T2uzKIShB0mHtnTgkDqblSaTaSKkroQfTTsJCZ+EzD3hgKMccC+Jmplq9W2Lwb5YUWpmtjB6wVuknhfXH6tskAxFoASJ8dsdxTvl4SBurSWK11ixaM7lMWayw/ZUcVC/VymoM3X8DIahJ81VrJ2CCzdHA5ea8rVVdJM3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1740.namprd12.prod.outlook.com (10.175.89.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Tue, 23 Jul 2019 14:08:41 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2094.013; Tue, 23 Jul
 2019 14:08:41 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/syncobj: extend syncobj query ability
Thread-Topic: [PATCH] drm/syncobj: extend syncobj query ability
Thread-Index: AQHVQRbEyHnuqkVmP0qybSCa+o89TqbYOzmAgAACgYCAAABUgA==
Date: Tue, 23 Jul 2019 14:08:40 +0000
Message-ID: <adca21ee-24cc-7f66-ff96-59973d40051d@amd.com>
References: <20190723052257.14436-1-david1.zhou@amd.com>
 <1946e636-7c21-7456-3824-72a98c7305a4@amd.com>
 <d9ecceda-0ce2-341b-3f42-9202be302772@amd.com>
In-Reply-To: <d9ecceda-0ce2-341b-3f42-9202be302772@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM5PR04CA0027.eurprd04.prod.outlook.com
 (2603:10a6:206:1::40) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4d5dda9-e5e1-4c41-4aff-08d70f7743c0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1740; 
x-ms-traffictypediagnostic: DM5PR12MB1740:
x-microsoft-antispam-prvs: <DM5PR12MB1740D48CB22F9BAF6B5EC29E83C70@DM5PR12MB1740.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(199004)(189003)(6246003)(31696002)(36756003)(6436002)(53936002)(6512007)(86362001)(4326008)(7736002)(31686004)(110136005)(58126008)(316002)(305945005)(65956001)(52116002)(229853002)(65826007)(14454004)(76176011)(65806001)(8936002)(8676002)(2906002)(5660300002)(102836004)(68736007)(81156014)(81166006)(186003)(478600001)(256004)(66556008)(11346002)(476003)(6506007)(2501003)(6486002)(2616005)(66446008)(99286004)(386003)(46003)(64126003)(486006)(446003)(71190400001)(66476007)(64756008)(6116002)(25786009)(71200400001)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1740;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UzNH+3+mRd0VVR7ocw6WBviKfs4nU3hiB3/5oZpGdLsmoIeKvGS4sKuNGyM0AoBnz7GgwpwFcqs76yaAAinOe/CB7dgUqFxKTZYngoNngdohbVnypGTmn90NXMn9Wwm+WLyl3fmPDBeAvojTswT/rAWCTZY09DMFB1A/XAxyfL48W+li3zmPCrI1MW7bpAZaymmPdJC8RlAMdvK8eiAtp9EP/qeauCCeH9iPMS6AzPY0oUlONoO2NGkmJ/vzQ7Jx12ZRAxAlgzusl4WOkdV/N0LklFJ7DGyrZ4Zaye6PZKADHpYllGR7X8blb8+6P/pyY/pK5qcU9Efw70YLof0X87fI87p4gGqWGcrUwEyD1+8lN8GIEXsYLXg/eeOPmG6N1/x3yFJwuT1xiNGJXrLgwINwZ1ZrK0QeU7NkRovuQAA=
Content-ID: <CFCD876D27E6DC40BF81E73A54C181C8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d5dda9-e5e1-4c41-4aff-08d70f7743c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 14:08:41.0216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1740
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2xBOytfZSL/kaFz95Dslz6BQSkyJZXcTxh1HeM102E=;
 b=rrqWeBu+C5jb1RibMEOk0YOXCDAzlhZB2EOuTqjtKdNpIy1r0CQBUSv2pZlAYaKdMCJVfb58JkMHaqCjl0ZQX1iafWKaQW2HWerQoXpBGFcj89XvlGHk6WSUXcvz3dZQflbz8LH7Zo/dQfgkEqcpyJJml2GCpnoafOM8QIvQLPo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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

QW0gMjMuMDcuMTkgdW0gMTY6MDcgc2NocmllYiBaaG91LCBEYXZpZChDaHVuTWluZyk6DQo+IOWc
qCAyMDE5LzcvMjMgMjE6NTgsIEtvZW5pZywgQ2hyaXN0aWFuIOWGmemBkzoNCj4+IEFtIDIzLjA3
LjE5IHVtIDA3OjIyIHNjaHJpZWIgQ2h1bm1pbmcgWmhvdToNCj4+PiB1c2VyIHNwYWNlIG5lZWRz
IGEgZmxleGlhYmxlIHF1ZXJ5IGFiaWxpdHkuDQo+Pj4gU28gdGhhdCB1bWQgY2FuIGdldCBsYXN0
IHNpZ25hbGVkIG9yIHN1Ym1pdHRlZCBwb2ludC4NCj4+Pg0KPj4+IENoYW5nZS1JZDogSTY1MTJi
NDMwNTI0ZWJhYmU3MTVlNjAyYTJiZjVhYmIwYTdlNzgwZWENCj4+PiBTaWduZWQtb2ZmLWJ5OiBD
aHVubWluZyBaaG91IDxkYXZpZDEuemhvdUBhbWQuY29tPg0KPj4+IENjOiBMaW9uZWwgTGFuZHdl
cmxpbiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5jb20+DQo+Pj4gQ2M6IENocmlzdGlhbiBL
w7ZuaWcgPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCj4+IEkndmUgcmVjZW50bHkgZm91bmQg
YSBidWcgaW4gZHJtX3N5bmNvYmpfcXVlcnlfaW9jdGwoKSB3aGljaCBJJ20gZ29pbmcNCj4+IHRv
IGNvbW1pdCB0b21vcnJvdy4NCj4gWWVzLCBJJ3ZlIHJlYWxpemVkLiBMb2luZWwgaGFzIHB1dCBS
QiBvbiBpdC4NCj4NCj4NCj4+IEFwYXJ0IGZyb20gdGhhdCBpdCBsb29rcyBnb29kIHRvIG1lLA0K
PiBUaGFua3MsDQo+DQo+DQo+PiAgICBidXQgSSB0aGluayB3ZSBzaG91bGQgY2xlYW51cCBhIGJp
dA0KPj4gYW5kIG1vdmUgdGhlIGRtYV9mZW5jZV9jaGFpbl9mb3JfZWFjaCgpLi4uIGludG8gYSBo
ZWxwZXIgZnVuY3Rpb24gaW4NCj4+IGRtYS1mZW5jZS1jaGFpbi5jDQo+IERvIHlvdSBtaW5kIGEg
c2FwZXJhdGUgY2xlYW51cCBwYXRjaCBmb3IgdGhhdD8gSSBkb24ndCB3YW50IHRvIHRvdWNoDQo+
IGtlcm5lbCBkaXJlY3RvcnkgaW4gdGhpcyBwYXRjaCwgc28gdGhhdCB3ZSBjYW4gY2hlcnJ5LXBp
Y2sgaXQgZWFzaWx5Lg0KDQpZZWFoLCB3b3JrcyBmb3IgbWUgYXMgd2VsbC4NCg0KQ2hyaXN0aWFu
Lg0KDQo+DQo+DQo+IC1EYXZpZA0KPg0KPj4gQ2hyaXN0aWFuLg0KPj4NCj4+PiAtLS0NCj4+PiAg
ICAgZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMgfCAzNiArKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLQ0KPj4+ICAgICBpbmNsdWRlL3VhcGkvZHJtL2RybS5oICAgICAgICB8
ICAzICsrLQ0KPj4+ICAgICAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDE5IGRl
bGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lu
Y29iai5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMNCj4+PiBpbmRleCAzZDQwMDkw
NTEwMGIuLmY3MGRlZGYzZWY0ZiAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X3N5bmNvYmouYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jDQo+Pj4g
QEAgLTExOTcsOSArMTE5Nyw2IEBAIGRybV9zeW5jb2JqX3RpbWVsaW5lX3NpZ25hbF9pb2N0bChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLA0KPj4+ICAgICAJaWYgKCFkcm1fY29y
ZV9jaGVja19mZWF0dXJlKGRldiwgRFJJVkVSX1NZTkNPQkpfVElNRUxJTkUpKQ0KPj4+ICAgICAJ
CXJldHVybiAtRU9QTk9UU1VQUDsNCj4+PiAgICAgDQo+Pj4gLQlpZiAoYXJncy0+cGFkICE9IDAp
DQo+Pj4gLQkJcmV0dXJuIC1FSU5WQUw7DQo+Pj4gLQ0KPj4+ICAgICAJaWYgKGFyZ3MtPmNvdW50
X2hhbmRsZXMgPT0gMCkNCj4+PiAgICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4+PiAgICAgDQo+Pj4g
QEAgLTEyNjgsOSArMTI2NSw2IEBAIGludCBkcm1fc3luY29ial9xdWVyeV9pb2N0bChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLA0KPj4+ICAgICAJaWYgKCFkcm1fY29yZV9jaGVj
a19mZWF0dXJlKGRldiwgRFJJVkVSX1NZTkNPQkpfVElNRUxJTkUpKQ0KPj4+ICAgICAJCXJldHVy
biAtRU9QTk9UU1VQUDsNCj4+PiAgICAgDQo+Pj4gLQlpZiAoYXJncy0+cGFkICE9IDApDQo+Pj4g
LQkJcmV0dXJuIC1FSU5WQUw7DQo+Pj4gLQ0KPj4+ICAgICAJaWYgKGFyZ3MtPmNvdW50X2hhbmRs
ZXMgPT0gMCkNCj4+PiAgICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4+PiAgICAgDQo+Pj4gQEAgLTEy
OTEsMjMgKzEyODUsMjkgQEAgaW50IGRybV9zeW5jb2JqX3F1ZXJ5X2lvY3RsKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+Pj4gICAgIAkJaWYgKGNoYWluKSB7DQo+Pj4gICAg
IAkJCXN0cnVjdCBkbWFfZmVuY2UgKml0ZXIsICpsYXN0X3NpZ25hbGVkID0gTlVMTDsNCj4+PiAg
ICAgDQo+Pj4gLQkJCWRtYV9mZW5jZV9jaGFpbl9mb3JfZWFjaChpdGVyLCBmZW5jZSkgew0KPj4+
IC0JCQkJaWYgKCFpdGVyKQ0KPj4+IC0JCQkJCWJyZWFrOw0KPj4+IC0JCQkJZG1hX2ZlbmNlX3B1
dChsYXN0X3NpZ25hbGVkKTsNCj4+PiAtCQkJCWxhc3Rfc2lnbmFsZWQgPSBkbWFfZmVuY2VfZ2V0
KGl0ZXIpOw0KPj4+IC0JCQkJaWYgKCF0b19kbWFfZmVuY2VfY2hhaW4obGFzdF9zaWduYWxlZCkt
PnByZXZfc2Vxbm8pDQo+Pj4gLQkJCQkJLyogSXQgaXMgbW9zdCBsaWtlbHkgdGhhdCB0aW1lbGlu
ZSBoYXMNCj4+PiAtCQkJCQkgKiB1bm9yZGVyIHBvaW50cy4gKi8NCj4+PiAtCQkJCQlicmVhazsN
Cj4+PiArCQkJaWYgKGFyZ3MtPmZsYWdzICYNCj4+PiArCQkJICAgIERSTV9TWU5DT0JKX1FVRVJZ
X0ZMQUdTX0xBU1RfU1VCTUlUVEVEKSB7DQo+Pj4gKwkJCQlwb2ludCA9IGZlbmNlLT5zZXFubzsN
Cj4+PiArCQkJfSBlbHNlIHsNCj4+PiArCQkJCWRtYV9mZW5jZV9jaGFpbl9mb3JfZWFjaChpdGVy
LCBmZW5jZSkgew0KPj4+ICsJCQkJCWlmICghaXRlcikNCj4+PiArCQkJCQkJYnJlYWs7DQo+Pj4g
KwkJCQkJZG1hX2ZlbmNlX3B1dChsYXN0X3NpZ25hbGVkKTsNCj4+PiArCQkJCQlsYXN0X3NpZ25h
bGVkID0gZG1hX2ZlbmNlX2dldChpdGVyKTsNCj4+PiArCQkJCQlpZiAoIXRvX2RtYV9mZW5jZV9j
aGFpbihsYXN0X3NpZ25hbGVkKS0+cHJldl9zZXFubykNCj4+PiArCQkJCQkJLyogSXQgaXMgbW9z
dCBsaWtlbHkgdGhhdCB0aW1lbGluZSBoYXMNCj4+PiArCQkJCQkJKiB1bm9yZGVyIHBvaW50cy4g
Ki8NCj4+PiArCQkJCQkJYnJlYWs7DQo+Pj4gKwkJCQl9DQo+Pj4gKwkJCQlwb2ludCA9IGRtYV9m
ZW5jZV9pc19zaWduYWxlZChsYXN0X3NpZ25hbGVkKSA/DQo+Pj4gKwkJCQkJbGFzdF9zaWduYWxl
ZC0+c2Vxbm8gOg0KPj4+ICsJCQkJCXRvX2RtYV9mZW5jZV9jaGFpbihsYXN0X3NpZ25hbGVkKS0+
cHJldl9zZXFubzsNCj4+PiAgICAgCQkJfQ0KPj4+IC0JCQlwb2ludCA9IGRtYV9mZW5jZV9pc19z
aWduYWxlZChsYXN0X3NpZ25hbGVkKSA/DQo+Pj4gLQkJCQlsYXN0X3NpZ25hbGVkLT5zZXFubyA6
DQo+Pj4gLQkJCQl0b19kbWFfZmVuY2VfY2hhaW4obGFzdF9zaWduYWxlZCktPnByZXZfc2Vxbm87
DQo+Pj4gICAgIAkJCWRtYV9mZW5jZV9wdXQobGFzdF9zaWduYWxlZCk7DQo+Pj4gICAgIAkJfSBl
bHNlIHsNCj4+PiAgICAgCQkJcG9pbnQgPSAwOw0KPj4+ICAgICAJCX0NCj4+PiArCQlkbWFfZmVu
Y2VfcHV0KGZlbmNlKTsNCj4+PiAgICAgCQlyZXQgPSBjb3B5X3RvX3VzZXIoJnBvaW50c1tpXSwg
JnBvaW50LCBzaXplb2YodWludDY0X3QpKTsNCj4+PiAgICAgCQlyZXQgPSByZXQgPyAtRUZBVUxU
IDogMDsNCj4+PiAgICAgCQlpZiAocmV0KQ0KPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkv
ZHJtL2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS9kcm0uaA0KPj4+IGluZGV4IDY2MWQ3M2Y5YTkx
OS4uZmQ5ODdjZTI0ZDlmIDEwMDY0NA0KPj4+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtLmgN
Cj4+PiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybS5oDQo+Pj4gQEAgLTc3NywxMSArNzc3LDEy
IEBAIHN0cnVjdCBkcm1fc3luY29ial9hcnJheSB7DQo+Pj4gICAgIAlfX3UzMiBwYWQ7DQo+Pj4g
ICAgIH07DQo+Pj4gICAgIA0KPj4+ICsjZGVmaW5lIERSTV9TWU5DT0JKX1FVRVJZX0ZMQUdTX0xB
U1RfU1VCTUlUVEVEICgxIDw8IDApIC8qIGxhc3QgYXZhaWxhYmxlIHBvaW50IG9uIHRpbWVsaW5l
IHN5bmNvYmogKi8NCj4+PiAgICAgc3RydWN0IGRybV9zeW5jb2JqX3RpbWVsaW5lX2FycmF5IHsN
Cj4+PiAgICAgCV9fdTY0IGhhbmRsZXM7DQo+Pj4gICAgIAlfX3U2NCBwb2ludHM7DQo+Pj4gICAg
IAlfX3UzMiBjb3VudF9oYW5kbGVzOw0KPj4+IC0JX191MzIgcGFkOw0KPj4+ICsJX191MzIgZmxh
Z3M7DQo+Pj4gICAgIH07DQo+Pj4gICAgIA0KPj4+ICAgICANCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
