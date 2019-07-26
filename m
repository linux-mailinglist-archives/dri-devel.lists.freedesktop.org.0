Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED54075F5C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 08:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E384F6E893;
	Fri, 26 Jul 2019 06:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740085.outbound.protection.outlook.com [40.107.74.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98AD96E893
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 06:57:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHBhBZxk3/rOw/S4aezHceyGz28zGKnfaT6kh0Lq1yaILd7vsHe+GkDkyUJp6dDr+MQ/F3jOmV+WedZUaRwKJ+SeJRk9tnf/WXZwuy2aAJI6oAmSoU/29owWkidncKOGJqgWXG2QoZodMzGEyjKznT2SPqYqLrGZ7aM8UFk/5JsngKQsFcwTxUbuq997JC2K5MIgVnc8s3v3fxFHYQT2O4RYhk+Im0rYkp7Q2shHFkUOY2iPVjcqXzSRgRlfzVxbQZroYSEmNCYeza4LoYXeJut1dKIZt2R0p69kRkDszQqrbuuiv7M9R9LUlpHuUPJJl3HpNAarydRUcu01nHlHlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJ4vLccP1QpGgSF9XH5D32nyKb5f0IVPRCgJvwULVx8=;
 b=U9+YuOUvhcMFYNyjy5YFTxYNblRMoyEAsF0/qRb/4aObEpy03biM3KdVOb4+YzczDKRZ2Yd6NKyLSoGHtzg/dk/qeVtO0DBEbkT3p2aitl4ap4i+QfBcRa6Ktb47K4F3szjRppLxlsPlvyRZ46Cx7ftdKEJYMOF4umnnqXuxZNAjDxZ1nv9kq/UPv5M8ntzsdO9o1vUG6bNgY48vfWOeeug5eUp8tM2OX35IUADukHZKL22qA4HMNfAZ+PzGv0cyR6HIvlEsUk6kJlvjqIkGxfAne/EP2Bp0U6CH1PvVKI10Dsbic+5PksmUZG+okXiyxyrO3HGdL31JsOaPclhtuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1786.namprd12.prod.outlook.com (10.175.91.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Fri, 26 Jul 2019 06:57:12 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2094.013; Fri, 26 Jul
 2019 06:57:12 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/amdgpu: Fill out gem_object->resv
Thread-Topic: [PATCH 3/4] drm/amdgpu: Fill out gem_object->resv
Thread-Index: AQHVQuzEf7jQ+x3mOEuh6m826GBFtabceNAA
Date: Fri, 26 Jul 2019 06:57:12 +0000
Message-ID: <77fa5ef8-82d4-7ce4-812b-f6db10e05cc9@amd.com>
References: <20190725132655.11951-1-daniel.vetter@ffwll.ch>
 <20190725132655.11951-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20190725132655.11951-4-daniel.vetter@ffwll.ch>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0060.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::24) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8b6aa79-6e01-4db8-6a9f-08d711967c45
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1786; 
x-ms-traffictypediagnostic: DM5PR12MB1786:
x-microsoft-antispam-prvs: <DM5PR12MB1786AE590189DB2182A74E7A83C00@DM5PR12MB1786.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(199004)(189003)(81156014)(66476007)(446003)(52116002)(86362001)(66946007)(66556008)(66446008)(65826007)(11346002)(305945005)(65806001)(76176011)(478600001)(65956001)(4326008)(31696002)(64756008)(66574012)(25786009)(476003)(5660300002)(36756003)(68736007)(71200400001)(6116002)(6486002)(71190400001)(2616005)(7736002)(14444005)(110136005)(256004)(58126008)(53936002)(6506007)(5024004)(386003)(99286004)(46003)(2906002)(102836004)(31686004)(6246003)(8676002)(64126003)(316002)(8936002)(229853002)(54906003)(486006)(186003)(6436002)(81166006)(14454004)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1786;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: A3cT1ao1mxvZjBd6uuK8Fk2L3gGkCYwaSQExg/x2uhlOONTwjl4YDWHRjAF0jWeFtV0V9HPnMetn315y+su80/sZyosRM/M2u8+CX+bDOTNkvmK3dklkfz7tgHruaz56ZMy3qSRvSsjKGsDV9Vw5lGc06ZT3dz4iZ/D1ReX2E0YG5xEcw5PFp6n+zw/UGr7UAF/cotY31PfpiQTYqOsY+9hWt/uOhK0GjCSjBdk2OQ3zMhK/efSn7sGv/B8QPTp2OgoAdeSyE93Jcw27TW2teBh/CiZhuYVVfBkaAiYLYeIlfB73Pwo0/TViAzK7ApoGMw54jW6eRJnrHhVazngseqibJxuNqp06egsoLPZGuyLruBzFieX2jGPolxwjMbuGTRPCUtMC6wXrb4DEKYfn3cKdtkpJF1i5/Llvegx+8C0=
Content-ID: <F3817020A537014894E0E4BC9896FCE5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b6aa79-6e01-4db8-6a9f-08d711967c45
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 06:57:12.5496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1786
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJ4vLccP1QpGgSF9XH5D32nyKb5f0IVPRCgJvwULVx8=;
 b=zTDVafJphz6EWZvtBuz5OxUEPXWVKeIaaDyiG2lXdSIwabdL1+VpZs/EsVsu6BgsY7r+ffucdFmSdUtgi6Ickgr9fXJwduU52W8pWQVP3Hr4tX61+pap3Xg7BpJbLWb8Pky/yjeH6du2UYkBozPa+MEKsj7itBEAljVnZG8Zt6c=
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
Cc: Thomas Zimmermann <contact@tzimmermann.org>, "Lin,
 Amber" <Amber.Lin@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Daenzer, Michel" <Michel.Daenzer@amd.com>, "Li, Samuel" <Samuel.Li@amd.com>,
 "Jiang, Sonny" <Sonny.Jiang@amd.com>, Junwei Zhang <Jerry.Zhang@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 "kraxel@redhat.com" <kraxel@redhat.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDcuMTkgdW0gMTU6MjYgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBUaGF0IHdheSB3
ZSBjYW4gZGl0Y2ggb3VyIGdlbV9wcmltZV9yZXNfb2JqIGltcGxlbWVudGF0aW9uLiBTaW5jZSB0
dG0NCj4gYWJzb2x1dGVseSBuZWVkcyB0aGUgcmlnaHQgcmVzZXJ2YXRpb24gb2JqZWN0IGFsbCB0
aGUgYm9pbGVycGxhdGUgaXMNCj4gYWxyZWFkeSB0aGVyZSBhbmQgd2UganVzdCBoYXZlIHRvIHdp
cmUgaXQgdXAgY29ycmVjdGx5Lg0KPg0KPiBOb3RlIHRoYXQgZ2VtL3ByaW1lIGRvZXNuJ3QgY2Fy
ZSB3aGVuIHdlIGRvIHRoaXMsIGFzIGxvbmcgYXMgd2UgZG8gaXQNCj4gYmVmb3JlIHRoZSBibyBp
cyByZWdpc3RlcmVkIGFuZCBzb21lb25lIGNhbiBjYWxsIHRoZSBoYW5kbGUyZmQgaW9jdGwNCj4g
b24gaXQuDQo+DQo+IEFzaWRlOiB0dG1fYnVmZmVyX29iamVjdC50dG1fcmVzdiBjb3VsZCBwcm9i
YWJseSBiZSBkaXRjaGVkIGluIGZhdm91cg0KPiBvZiBhbHdheXMgcGFzc2luZyBhIG5vbi1OVUxM
IHJlc3YgdG8gdHRtX2JvX2luaXQoKS4gQXQgbGVhc3QgZm9yIGdlbQ0KPiBkcml2ZXJzIHRoYXQg
d291bGQgYXZvaWQgaGF2aW5nIHR3byBvZiB0aGVzZSwgb24gaW4gdHRtX2J1ZmZlcl9vYmplY3QN
Cj4gYW5kIHRoZSBvdGhlciBpbiBkcm1fZ2VtX29iamVjdCwgb25lIGp1c3QgdGhlcmUgZm9yIGNv
bmZ1c2lvbi4NCj4NCj4gQWNrZWQtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29t
Pg0KPiBDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+DQo+IFJldmlld2VkLWJ5
OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4NCj4gQ2M6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gQ2M6ICJDaHJpc3RpYW4gS8O2
bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBmZndsbC5jaD4NCj4gQ2M6ICJNaWNoZWwgRMOkbnplciIgPG1pY2hlbC5kYWVu
emVyQGFtZC5jb20+DQo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51
az4NCj4gQ2M6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQo+IENjOiBGZWxpeCBLdWVo
bGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4gQ2M6IEFuZHJleSBHcm9kem92c2t5IDxh
bmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPg0KPiBDYzogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1k
LmNvbT4NCj4gQ2M6IFNvbm55IEppYW5nIDxzb25ueS5qaWFuZ0BhbWQuY29tPg0KPiBDYzogQW1i
ZXIgTGluIDxBbWJlci5MaW5AYW1kLmNvbT4NCj4gQ2M6ICJNaWNoYcWCIE1pcm9zxYJhdyIgPG1p
cnEtbGludXhAcmVyZS5xbXFtLnBsPg0KPiBDYzogSnVud2VpIFpoYW5nIDxKZXJyeS5aaGFuZ0Bh
bWQuY29tPg0KPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPGNvbnRhY3RAdHppbW1lcm1hbm4ub3Jn
Pg0KPiBDYzogU2FtdWVsIExpIDxTYW11ZWwuTGlAYW1kLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCg0KPiAtLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jIHwgMTcgKy0tLS0tLS0t
LS0tLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5o
IHwgIDEgLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyAgICAg
fCAgMSAtDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jICB8
ICAyICsrDQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9u
cygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RtYV9idWYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMN
Cj4gaW5kZXggNDgwOWQ0YTVkNzJhLi4wMmNkODQ1ZTc3YjMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYw0KPiBAQCAtMjY3LDIwICsyNjcsNiBA
QCBzdGF0aWMgdm9pZCBhbWRncHVfZG1hX2J1Zl9tYXBfZGV0YWNoKHN0cnVjdCBkbWFfYnVmICpk
bWFfYnVmLA0KPiAgIAlkcm1fZ2VtX21hcF9kZXRhY2goZG1hX2J1ZiwgYXR0YWNoKTsNCj4gICB9
DQo+ICAgDQo+IC0vKioNCj4gLSAqIGFtZGdwdV9nZW1fcHJpbWVfcmVzX29iaiAtICZkcm1fZHJp
dmVyLmdlbV9wcmltZV9yZXNfb2JqIGltcGxlbWVudGF0aW9uDQo+IC0gKiBAb2JqOiBHRU0gQk8N
Cj4gLSAqDQo+IC0gKiBSZXR1cm5zOg0KPiAtICogVGhlIEJPJ3MgcmVzZXJ2YXRpb24gb2JqZWN0
Lg0KPiAtICovDQo+IC1zdHJ1Y3QgcmVzZXJ2YXRpb25fb2JqZWN0ICphbWRncHVfZ2VtX3ByaW1l
X3Jlc19vYmooc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopDQo+IC17DQo+IC0Jc3RydWN0IGFt
ZGdwdV9ibyAqYm8gPSBnZW1fdG9fYW1kZ3B1X2JvKG9iaik7DQo+IC0NCj4gLQlyZXR1cm4gYm8t
PnRiby5yZXN2Ow0KPiAtfQ0KPiAtDQo+ICAgLyoqDQo+ICAgICogYW1kZ3B1X2RtYV9idWZfYmVn
aW5fY3B1X2FjY2VzcyAtICZkbWFfYnVmX29wcy5iZWdpbl9jcHVfYWNjZXNzIGltcGxlbWVudGF0
aW9uDQo+ICAgICogQGRtYV9idWY6IFNoYXJlZCBETUEgYnVmZmVyDQo+IEBAIC0zMzksOCArMzI1
LDcgQEAgY29uc3Qgc3RydWN0IGRtYV9idWZfb3BzIGFtZGdwdV9kbWFidWZfb3BzID0gew0KPiAg
ICAqIEBnb2JqOiBHRU0gQk8NCj4gICAgKiBAZmxhZ3M6IEZsYWdzIHN1Y2ggYXMgRFJNX0NMT0VY
RUMgYW5kIERSTV9SRFdSLg0KPiAgICAqDQo+IC0gKiBUaGUgbWFpbiB3b3JrIGlzIGRvbmUgYnkg
dGhlICZkcm1fZ2VtX3ByaW1lX2V4cG9ydCBoZWxwZXIsIHdoaWNoIGluIHR1cm4NCj4gLSAqIHVz
ZXMgJmFtZGdwdV9nZW1fcHJpbWVfcmVzX29iai4NCj4gKyAqIFRoZSBtYWluIHdvcmsgaXMgZG9u
ZSBieSB0aGUgJmRybV9nZW1fcHJpbWVfZXhwb3J0IGhlbHBlci4NCj4gICAgKg0KPiAgICAqIFJl
dHVybnM6DQo+ICAgICogU2hhcmVkIERNQSBidWZmZXIgcmVwcmVzZW50aW5nIHRoZSBHRU0gQk8g
ZnJvbSB0aGUgZ2l2ZW4gZGV2aWNlLg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kbWFfYnVmLmgNCj4gaW5kZXggN2Y3M2E0Zjk0MjA0Li41MDEyZTZhYjU4ZjEgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmgNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuaA0KPiBAQCAt
MzQsNyArMzQsNiBAQCBzdHJ1Y3QgZG1hX2J1ZiAqYW1kZ3B1X2dlbV9wcmltZV9leHBvcnQoc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpnb2JqLA0KPiAgIAkJCQkJaW50IGZsYWdzKTsNCj4gICBzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKmFtZGdwdV9nZW1fcHJpbWVfaW1wb3J0KHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsDQo+ICAgCQkJCQkgICAgc3RydWN0IGRtYV9idWYgKmRtYV9idWYpOw0KPiAtc3Ry
dWN0IHJlc2VydmF0aW9uX29iamVjdCAqYW1kZ3B1X2dlbV9wcmltZV9yZXNfb2JqKHN0cnVjdCBk
cm1fZ2VtX29iamVjdCAqKTsNCj4gICB2b2lkICphbWRncHVfZ2VtX3ByaW1lX3ZtYXAoc3RydWN0
IGRybV9nZW1fb2JqZWN0ICpvYmopOw0KPiAgIHZvaWQgYW1kZ3B1X2dlbV9wcmltZV92dW5tYXAo
c3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHZvaWQgKnZhZGRyKTsNCj4gICBpbnQgYW1kZ3B1
X2dlbV9wcmltZV9tbWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQo+IGluZGV4IGY2N2I1YmFlZDQ0MS4uOThkZjU1
NTM0YTZkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQo+
IEBAIC0xMzk3LDcgKzEzOTcsNiBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIga21zX2RyaXZl
ciA9IHsNCj4gICAJLnByaW1lX2ZkX3RvX2hhbmRsZSA9IGRybV9nZW1fcHJpbWVfZmRfdG9faGFu
ZGxlLA0KPiAgIAkuZ2VtX3ByaW1lX2V4cG9ydCA9IGFtZGdwdV9nZW1fcHJpbWVfZXhwb3J0LA0K
PiAgIAkuZ2VtX3ByaW1lX2ltcG9ydCA9IGFtZGdwdV9nZW1fcHJpbWVfaW1wb3J0LA0KPiAtCS5n
ZW1fcHJpbWVfcmVzX29iaiA9IGFtZGdwdV9nZW1fcHJpbWVfcmVzX29iaiwNCj4gICAJLmdlbV9w
cmltZV9nZXRfc2dfdGFibGUgPSBhbWRncHVfZ2VtX3ByaW1lX2dldF9zZ190YWJsZSwNCj4gICAJ
LmdlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUgPSBhbWRncHVfZ2VtX3ByaW1lX2ltcG9ydF9zZ190
YWJsZSwNCj4gICAJLmdlbV9wcmltZV92bWFwID0gYW1kZ3B1X2dlbV9wcmltZV92bWFwLA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jDQo+IGluZGV4IGJlYTZm
Mjk4ZGZkYy4uMTllYzc3NWI3YWE4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfb2JqZWN0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X29iamVjdC5jDQo+IEBAIC01MDksNiArNTA5LDggQEAgc3RhdGljIGludCBhbWRn
cHVfYm9fZG9fY3JlYXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgIAlpZiAodW5s
aWtlbHkociAhPSAwKSkNCj4gICAJCXJldHVybiByOw0KPiAgIA0KPiArCWJvLT5nZW1fYmFzZS5y
ZXN2ID0gYm8tPnRiby5yZXN2Ow0KPiArDQo+ICAgCWlmICghYW1kZ3B1X2dtY192cmFtX2Z1bGxf
dmlzaWJsZSgmYWRldi0+Z21jKSAmJg0KPiAgIAkgICAgYm8tPnRiby5tZW0ubWVtX3R5cGUgPT0g
VFRNX1BMX1ZSQU0gJiYNCj4gICAJICAgIGJvLT50Ym8ubWVtLnN0YXJ0IDwgYWRldi0+Z21jLnZp
c2libGVfdnJhbV9zaXplID4+IFBBR0VfU0hJRlQpDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
