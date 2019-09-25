Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471A0BE0A1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 16:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9295A89DD5;
	Wed, 25 Sep 2019 14:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750052.outbound.protection.outlook.com [40.107.75.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A77C89D99;
 Wed, 25 Sep 2019 14:54:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iq+UMITgC48x1QdPwV466l3JyG0xGEsnKEcsVZyxjrhrFvrUGF7T2oJ5ROjB10HFjKrRxVEjOa8oe5Ulx8Tw3PvEQ3WVByWXAm/gnJtHf3saVsl5+Qj16d8atspMv29147UWpYUlehS2SEDq7l2RnYAe4oKwvcT72pwPFLDThkdqVpKYgvQ/ftlM3CKHmPjrvBcCkupj9wUumW/AZkwMlOeA/FzWYNh4AR4z2uNQwPpw1jFutir2cdUeuX3j70pgU53GLahmtlqT5fQLQTt4CrJ3P/KnapVwUh/HmkHdQ1odScSP0D3nfPbaW1ITDwhgAbjTZTM1lF9sFD+m+IHArw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHQAU6F/wV+NTDE260+NaHeK8+QsNktU8QKf/8SnKP0=;
 b=Af9f0CBh7URhRPe6Ayrdd3GLYS1dYP+VD2TqM1PHp7gR3+k7z77dR8PkaT8fpzXj+kDBr8fos3/zCalPI6C7ES+lkpmp1TqZBpDiTe8aRExaXba4ZmRf5nt8WPfhZp0/vpdfuwjPKeZff6nnaFKAEwQnU++4dfLvjsI02NbWIu5QVvnOV7WBONu0ZUG2924l75ZhDUzTMFY2taxsC0mU3zF8mOZgNn+GLujYFtH1I/UwnJidDLiPSji4p7cCIz2uzKImovT2qAy/Rin6IQb0O0g62kzcTMzDVWTAsK+UIPKd1JpAKCwbB8d8sI0n08eEMBSWtiJhSFgoX/s73AimyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB4093.namprd12.prod.outlook.com (52.135.51.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 14:54:50 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2305.016; Wed, 25 Sep 2019
 14:54:50 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH v3 10/11] drm/amdgpu: job is secure iff CS is secure (v4)
Thread-Topic: [PATCH v3 10/11] drm/amdgpu: job is secure iff CS is secure (v4)
Thread-Index: AQHVc67eAOP3HjJHn0i9QUAnxAtta6c8eLkAgAAA+EA=
Date: Wed, 25 Sep 2019 14:54:50 +0000
Message-ID: <MN2PR12MB3309B9F92121C846639C87ECEC870@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <1569422279-6609-1-git-send-email-ray.huang@amd.com>
 <e04af4ef-aa3b-534b-8c5b-e6ee11f677a5@amd.com>
In-Reply-To: <e04af4ef-aa3b-534b-8c5b-e6ee11f677a5@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52e20341-d09c-4e49-a016-08d741c8513b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4093; 
x-ms-traffictypediagnostic: MN2PR12MB4093:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4093B813C85523981301C64FEC870@MN2PR12MB4093.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(13464003)(189003)(199004)(14454004)(6636002)(53546011)(7696005)(33656002)(186003)(6116002)(54906003)(99286004)(446003)(55016002)(52536014)(316002)(229853002)(6506007)(9686003)(66066001)(6246003)(3846002)(76176011)(486006)(102836004)(4326008)(476003)(64756008)(11346002)(66476007)(66446008)(25786009)(76116006)(66946007)(256004)(8676002)(450100002)(7736002)(2906002)(71190400001)(305945005)(6436002)(74316002)(86362001)(478600001)(110136005)(8936002)(81166006)(2501003)(26005)(66556008)(71200400001)(81156014)(2201001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4093;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KG4ZMsx7M4VCKMJwz0CQS4mU1+L/KlcMUGls6APqIfsRqlSLQ43SWC8iiDXlEE7xRPYC2E+ZHk3jA5xau5oAZqedFI/mydtGA2CMSXGe/4XosFSTb0cyUjd/oepxbpF4pHxcUvPbxWLCEQWQvkwTjNUleAlBnvdlS1tEG+ocPP1HJGch70UHzxhIF7B+hlPE87vS7N1iiWfKJEaelvqQPjsjMxGcQLNbRct6ShTmDpF4ZZ5g1bbty50XRTFexPEHtf874PQxpOqnWboqcb+NQhCGo10GbaFaGq/oapxiXlYcOzkPnMvFIq4z7ZSIYWrgZplGjRrGGDHo8ywOCH7X1fW4atZ6hx7ZQZLACz+i0IWIWgGF57NzutoI3izlVkVw4G/vRqdqZgwCrnXUAulM61mw0XAmoXg6ZBPGQYCF0T0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e20341-d09c-4e49-a016-08d741c8513b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 14:54:50.7151 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t7yzwa1PiiTZ++lfV3hUzbmN4cu2S4WiFboQ9H7KNkPm/riH27AW/5Kn7UVwi9MuapGr41miCcsDHx0um1+8YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4093
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHQAU6F/wV+NTDE260+NaHeK8+QsNktU8QKf/8SnKP0=;
 b=pjYI7v5JItfjbJiL9FMyXX5dzFzepP34tZpSTOByxZTMwp9Z4/ecFsc6S3C32CKQa2GmDrH8LapRhSOZuOEZNV19s9oUOJzvt1Cs5vC8GRG+YhTrJwQsMmf5KP9zrnniMzcVrSx5CiG8q2Pd4NFroEEsLDAHlykk1dpY6C6Pc+0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Tuikov, Luben" <Luben.Tuikov@amd.com>, "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLb2VuaWcsIENocmlzdGlhbiA8
Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAy
NSwgMjAxOSAxMDo0NyBQTQ0KPiBUbzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IERldWNoZXIsIEFsZXhhbmRlcg0KPiA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNv
bT4NCj4gQ2M6IFR1aWtvdiwgTHViZW4gPEx1YmVuLlR1aWtvdkBhbWQuY29tPjsgTGl1LCBBYXJv
bg0KPiA8QWFyb24uTGl1QGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMTAvMTFd
IGRybS9hbWRncHU6IGpvYiBpcyBzZWN1cmUgaWZmIENTIGlzIHNlY3VyZSAodjQpDQo+IA0KPiBB
bSAyNS4wOS4xOSB1bSAxNjozOCBzY2hyaWViIEh1YW5nLCBSYXk6DQo+ID4gTWFyayBhIGpvYiBh
cyBzZWN1cmUsIGlmIGFuZCBvbmx5IGlmIHRoZSBjb21tYW5kIHN1Ym1pc3Npb24gZmxhZyBoYXMN
Cj4gPiB0aGUgc2VjdXJlIGZsYWcgc2V0Lg0KPiA+DQo+ID4gdjI6IGZpeCB0aGUgbnVsbCBqb2Ig
cG9pbnRlciB3aGlsZSBpbiB2bWlkIDAgc3VibWlzc2lvbi4NCj4gPiB2MzogQ29udGV4dCAtLT4g
Q29tbWFuZCBzdWJtaXNzaW9uLg0KPiA+IHY0OiBmaWxsaW5nIGNzIHBhcnNlciB3aXRoIGNzLT5p
bi5mbGFncw0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1k
LmNvbT4NCj4gPiBDby1kZXZlbG9wZWQtYnk6IEx1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFt
ZC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogTHViZW4gVHVpa292IDxsdWJlbi50dWlrb3ZAYW1k
LmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
LmggICAgIHwgIDMgKysrDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Y3MuYyAgfCAxMSArKysrKysrKysrLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2liLmMgIHwgIDQgKystLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2pvYi5oIHwgIDIgKysNCj4gPiAgIDQgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1LmgNCj4gPiBpbmRleCA2OTdlOGU1Li5mZDYwNjk1IDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgNCj4gPiBAQCAtNDg1LDYgKzQ4NSw5IEBAIHN0cnVjdCBh
bWRncHVfY3NfcGFyc2VyIHsNCj4gPiAgIAl1aW50NjRfdAkJCWJ5dGVzX21vdmVkOw0KPiA+ICAg
CXVpbnQ2NF90CQkJYnl0ZXNfbW92ZWRfdmlzOw0KPiA+DQo+ID4gKwkvKiBzZWN1cmUgY3MgKi8N
Cj4gPiArCWJvb2wJCQkJaXNfc2VjdXJlOw0KPiA+ICsNCj4gPiAgIAkvKiB1c2VyIGZlbmNlICov
DQo+ID4gICAJc3RydWN0IGFtZGdwdV9ib19saXN0X2VudHJ5CXVmX2VudHJ5Ow0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jDQo+ID4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYw0KPiA+IGluZGV4IDUxZjNk
YjAuLjkwMzhkYzEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2NzLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Y3MuYw0KPiA+IEBAIC0xMzMsNiArMTMzLDE0IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX3BhcnNl
cl9pbml0KHN0cnVjdA0KPiBhbWRncHVfY3NfcGFyc2VyICpwLCB1bmlvbiBkcm1fYW1kZ3B1X2Nz
DQo+ID4gICAJCWdvdG8gZnJlZV9jaHVuazsNCj4gPiAgIAl9DQo+ID4NCj4gPiArCS8qKg0KPiA+
ICsJICogVGhlIGNvbW1hbmQgc3VibWlzc2lvbiAoY3MpIGlzIGEgdW5pb24sIHNvIGFuIGFzc2ln
bm1lbnQgdG8NCj4gPiArCSAqICdvdXQnIGlzIGRlc3RydWN0aXZlIHRvIHRoZSBjcyAoYXQgbGVh
c3QgdGhlIGZpcnN0IDgNCj4gPiArCSAqIGJ5dGVzKS4gRm9yIHRoaXMgcmVhc29uLCBpbnF1aXJl
IGFib3V0IHRoZSBmbGFncyBiZWZvcmUgdGhlDQo+ID4gKwkgKiBhc3NpZ25tZW50IHRvICdvdXQn
Lg0KPiA+ICsJICovDQo+ID4gKwlwLT5pc19zZWN1cmUgPSBjcy0+aW4uZmxhZ3MgJiBBTURHUFVf
Q1NfRkxBR1NfU0VDVVJFOw0KPiA+ICsNCj4gPiAgIAkvKiBnZXQgY2h1bmtzICovDQo+ID4gICAJ
Y2h1bmtfYXJyYXlfdXNlciA9IHU2NF90b191c2VyX3B0cihjcy0+aW4uY2h1bmtzKTsNCj4gPiAg
IAlpZiAoY29weV9mcm9tX3VzZXIoY2h1bmtfYXJyYXksIGNodW5rX2FycmF5X3VzZXIsIEBAIC0x
MjUyLDgNCj4gPiArMTI2MCw5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX3N1Ym1pdChzdHJ1Y3Qg
YW1kZ3B1X2NzX3BhcnNlciAqcCwNCj4gPiAgIAkJcC0+Y3R4LT5wcmVhbWJsZV9wcmVzZW50ZWQg
PSB0cnVlOw0KPiA+ICAgCX0NCj4gPg0KPiA+IC0JY3MtPm91dC5oYW5kbGUgPSBzZXE7DQo+ID4g
Kwlqb2ItPnNlY3VyZSA9IHAtPmlzX3NlY3VyZTsNCj4gPiAgIAlqb2ItPnVmX3NlcXVlbmNlID0g
c2VxOw0KPiA+ICsJY3MtPm91dC5oYW5kbGUgPSBzZXE7DQo+IA0KPiBBdCBsZWFzdCBpdCBpcyBu
byBsb25nZXIgYWNjZXNzaW5nIGNzLT5pbiwgYnV0IHRoYXQgc3RpbGwgbG9va3MgbGlrZSB0aGUg
d3JvbmcgcGxhY2UNCj4gdG8gaW5pdGlhbGl6ZSB0aGUgam9iLg0KPiANCj4gV2h5IGNhbid0IHdl
IGZpbGwgdGhhdCBpbiBkaXJlY3RseSBhZnRlciBhbWRncHVfam9iX2FsbG9jKCkgPw0KDQpUaGVy
ZSBpcyBub3QgaW5wdXQgbWVtYmVyIHRoYXQgaXMgc2VjdXJlIHJlbGF0ZWQgaW4gYW1kZ3B1X2pv
Yl9hbGxvYygpIGV4Y2VwdCBhZGQgYW4gb25lOg0KIA0KYW1kZ3B1X2pvYl9hbGxvYyhhZGV2LCBu
dW1faWJzLCBqb2IsIHZtLCBzZWN1cmUpDQoNCkl0IGxvb2tzIHRvbyBtdWNoLCBpc24ndCBpdD8N
Cg0KVGhhbmtzLA0KUmF5DQoNCj4gDQo+IFJlZ2FyZHMsDQo+IENocmlzdGlhbi4NCj4gDQo+ID4N
Cj4gPiAgIAlhbWRncHVfam9iX2ZyZWVfcmVzb3VyY2VzKGpvYik7DQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMNCj4gPiBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jDQo+ID4gaW5kZXggZTFkYzIyOS4uY2I5
YjY1MCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
aWIuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jDQo+
ID4gQEAgLTIxMCw3ICsyMTAsNyBAQCBpbnQgYW1kZ3B1X2liX3NjaGVkdWxlKHN0cnVjdCBhbWRn
cHVfcmluZyAqcmluZywNCj4gdW5zaWduZWQgbnVtX2licywNCj4gPiAgIAlpZiAoam9iICYmIHJp
bmctPmZ1bmNzLT5lbWl0X2NudHhjbnRsKSB7DQo+ID4gICAJCXN0YXR1cyB8PSBqb2ItPnByZWFt
YmxlX3N0YXR1czsNCj4gPiAgIAkJc3RhdHVzIHw9IGpvYi0+cHJlZW1wdGlvbl9zdGF0dXM7DQo+
ID4gLQkJYW1kZ3B1X3JpbmdfZW1pdF9jbnR4Y250bChyaW5nLCBzdGF0dXMsIGZhbHNlKTsNCj4g
PiArCQlhbWRncHVfcmluZ19lbWl0X2NudHhjbnRsKHJpbmcsIHN0YXR1cywgam9iLT5zZWN1cmUp
Ow0KPiA+ICAgCX0NCj4gPg0KPiA+ICAgCWZvciAoaSA9IDA7IGkgPCBudW1faWJzOyArK2kpIHsN
Cj4gPiBAQCAtMjI5LDcgKzIyOSw3IEBAIGludCBhbWRncHVfaWJfc2NoZWR1bGUoc3RydWN0IGFt
ZGdwdV9yaW5nICpyaW5nLA0KPiB1bnNpZ25lZCBudW1faWJzLA0KPiA+ICAgCX0NCj4gPg0KPiA+
ICAgCWlmIChyaW5nLT5mdW5jcy0+ZW1pdF90bXopDQo+ID4gLQkJYW1kZ3B1X3JpbmdfZW1pdF90
bXoocmluZywgZmFsc2UsIGZhbHNlKTsNCj4gPiArCQlhbWRncHVfcmluZ19lbWl0X3RteihyaW5n
LCBmYWxzZSwgam9iID8gam9iLT5zZWN1cmUgOiBmYWxzZSk7DQo+ID4NCj4gPiAgICNpZmRlZiBD
T05GSUdfWDg2XzY0DQo+ID4gICAJaWYgKCEoYWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBVKSkNCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5oDQo+
ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmgNCj4gPiBpbmRleCBk
YzdlZTkzLi5hYTBlMzc1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9qb2IuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9qb2IuaA0KPiA+IEBAIC02Myw2ICs2Myw4IEBAIHN0cnVjdCBhbWRncHVfam9iIHsNCj4g
PiAgIAl1aW50NjRfdAkJdWZfYWRkcjsNCj4gPiAgIAl1aW50NjRfdAkJdWZfc2VxdWVuY2U7DQo+
ID4NCj4gPiArCS8qIHRoZSBqb2IgaXMgZHVlIHRvIGEgc2VjdXJlIGNvbW1hbmQgc3VibWlzc2lv
biAqLw0KPiA+ICsJYm9vbAkJCXNlY3VyZTsNCj4gPiAgIH07DQo+ID4NCj4gPiAgIGludCBhbWRn
cHVfam9iX2FsbG9jKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1bnNpZ25lZCBudW1faWJz
LA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
