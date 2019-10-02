Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B10C903B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 19:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4E76E0C9;
	Wed,  2 Oct 2019 17:51:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720074.outbound.protection.outlook.com [40.107.72.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEA76E0C9;
 Wed,  2 Oct 2019 17:51:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgiqVCjVjHwHulS32tzSM6qmNVUNpAUVpjKcr7yp0GgxuUeA1J8R89kwdp0OajS3iy9CoJ6Y12VqjKycKDmXbx3sQideH8HJkC+tef8kEb5/5eHc2ekQl6jmsi2EBlQu3bmmwIBCPDTuC1zxMr163/E+GcBL4y3IfvoiSTee69F08Mvc0bohT8uWcG8xuC1GW9OmBFbuROM4ghFm8o+gF97WKjB6IcMGv0okK3emuqy9cWFo2VurM0Y6jh97WOrcD/4fNJI31ytEx3MnzrTchT20SAkjW9MTGkZmobP2Mmw3cZ3/vqe00MqF0KA8mMVKN7PiWqjnxBN8bxe/ktRgXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPIfT3eLgbMzEC0mz+gOd60hlBWYbHiRadSQtO7Sa1E=;
 b=bqG+ilXbXahDGRvhvIDpaDLg0mM68X2FCZihd8Og1tFP0+3JdkyCrSUfyK2wU0h5TZHNYmIYjunIu8PqIPqR/XccZQaUDQCLukwm+plLyFhP8pc13XHbcLGN5kVwcYhPBJ07w7P8HNO5ZwqP68SE60am+LCkvZGRDqPIYErpTcGbcJSO2nbgbE8r5uN4NL4F5LTeGjshTWLyBgF5xuc6IhaNoc6N34DPy07JFZGvX9m5POrdqqDOqzb4wBf5l5EerE2nBk/tAUlb/65oJ5MGkqAzDTcVahttGCUcphK4cSUDyx+c8o5LVY4J+BR7Oo4nXH6RmVmN6Db5pyyzCfDGcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3328.namprd12.prod.outlook.com (20.178.240.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 17:51:10 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 17:51:10 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/radeon: finally fix the racy VMA setup
Thread-Topic: [PATCH 2/2] drm/radeon: finally fix the racy VMA setup
Thread-Index: AQHVdS/zvSdr82PvekiJKeA90CMzmadHqX8A
Date: Wed, 2 Oct 2019 17:51:10 +0000
Message-ID: <MN2PR12MB3309E949E7AA5B1239B9C8B9EC9C0@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190927123425.17513-1-christian.koenig@amd.com>
 <20190927123425.17513-2-christian.koenig@amd.com>
In-Reply-To: <20190927123425.17513-2-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [201.175.203.163]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a9b36ca-98cf-4184-b5bd-08d747611c41
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3328:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3328B5A929B63B8F661C2AA4EC9C0@MN2PR12MB3328.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(13464003)(199004)(189003)(3846002)(486006)(26005)(66574012)(476003)(5660300002)(102836004)(2201001)(6116002)(11346002)(76176011)(446003)(186003)(99286004)(14444005)(256004)(76116006)(25786009)(52536014)(14454004)(7696005)(53546011)(6506007)(478600001)(966005)(66446008)(86362001)(2906002)(64756008)(66556008)(66476007)(110136005)(7736002)(74316002)(305945005)(33656002)(66946007)(9686003)(229853002)(55016002)(6306002)(316002)(6436002)(71200400001)(8936002)(71190400001)(8676002)(81156014)(6246003)(81166006)(2501003)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3328;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SbEcjE/o7LAAByl4UIIUUfOFPMJSA2BAFRObiZnQWWPwyMXA8TSGScENyGagmXT62jJpNJAOak5NDTsHDW8V8SJRgfkeFCSUz2iSqOROjKsTFTkDPU+LOd7x5lIPlllaMLEVhJNFnhtvw8VvuSaxnV+VOIKRHNT7WIK2aPbS8gfPa93J/bs2ra+hI8X2HXA3p/yaO8I6CwqZ/+QoB+bxekLYxUkxtndpZdl/KS8VBKFIt2U8y4FfpiEYAXFdwm5o70TU3+nSUJWMIZaG3S6pBg8AwClNKTzexq6hcpkZ8amsRvw9xl30J+h7XlA9PsCiTkr0rZDY6M4LfX/yvu9fVLB8NbTAfsHnnvZS92mpefFEcPIoAs2lqpoRLB9rnLXfLKwJ4/RZJOr+h+ADHGxEWebEsnHzImWGmmC39ccFfeHsiqVGQ+XV4fY+oan3qBEzvehOTX15/FT/2n1BptpKbA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9b36ca-98cf-4184-b5bd-08d747611c41
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 17:51:10.5953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s6KscA53MyyZxZthmrJCbOL1l84EhJYc1sqTaasYvk4xWr+ce23+CNNYbmwnZ/GI/Q9hDYwwnwr5TN619HagHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3328
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPIfT3eLgbMzEC0mz+gOd60hlBWYbHiRadSQtO7Sa1E=;
 b=aqPOQCgqE0lMVBoBL5uGOA7nwQf4/W024cJdzbJ0JyfEt1Thwi7g7P2gLxO2mn3dO+Dtogp6huVaLqcfQdv3QJ27+a3P5hbvnRhBTyEAYTXRMiW4ld7Zw76md7z6jwXpzVlvSI5siosrXg/9n+gOv6y0FK3qFKiuu1ahk7phanw=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQ2hyaXN0aWFuIEvDtm5pZw0KU2VudDogRnJpZGF5
LCBTZXB0ZW1iZXIgMjcsIDIwMTkgODozNCBBTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBbUEFUQ0gg
Mi8yXSBkcm0vcmFkZW9uOiBmaW5hbGx5IGZpeCB0aGUgcmFjeSBWTUEgc2V0dXANCg0KRmluYWxs
eSBjbGVhbiB1cCB0aGUgVk1BIHNldHVwIGZvciByYWRlb24gbm93IHRoYXQgVFRNIGV4cG9ydHMg
dGhlIG5lY2Vzc2FyeSBmdW5jdGlvbnMuDQoNCk5vdCBmdW5jdGlvbmFsIGNoYW5nZSwgYnV0IG9u
bHkgY29tcGlsZSB0ZXN0ZWQuDQoNClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX3R0bS5jIHwgMjkgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0NCiAxIGZpbGUgY2hh
bmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX3R0bS5jDQppbmRleCBhMDVlMTA3MjRkNDYuLmYzZWYzMDRhNjdlZSAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jDQorKysgYi9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYw0KQEAgLTg4MCw5ICs4ODAsNiBAQCB2b2lkIHJh
ZGVvbl90dG1fc2V0X2FjdGl2ZV92cmFtX3NpemUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYs
IHU2NCBzaXplKQ0KIAltYW4tPnNpemUgPSBzaXplID4+IFBBR0VfU0hJRlQ7DQogfQ0KIA0KLXN0
YXRpYyBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3QgcmFkZW9uX3R0bV92bV9vcHM7IC1zdGF0
aWMgY29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0ICp0dG1fdm1fb3BzID0gTlVMTDsN
Ci0NCiBzdGF0aWMgdm1fZmF1bHRfdCByYWRlb25fdHRtX2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAq
dm1mKSAgew0KIAlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvOw0KQEAgLTg5MCwzNCArODg3
LDM2IEBAIHN0YXRpYyB2bV9mYXVsdF90IHJhZGVvbl90dG1fZmF1bHQoc3RydWN0IHZtX2ZhdWx0
ICp2bWYpDQogCXZtX2ZhdWx0X3QgcmV0Ow0KIA0KIAlibyA9IChzdHJ1Y3QgdHRtX2J1ZmZlcl9v
YmplY3QgKil2bWYtPnZtYS0+dm1fcHJpdmF0ZV9kYXRhOw0KLQlpZiAoYm8gPT0gTlVMTCkgew0K
KwlpZiAoYm8gPT0gTlVMTCkNCiAJCXJldHVybiBWTV9GQVVMVF9OT1BBR0U7DQotCX0NCisNCiAJ
cmRldiA9IHJhZGVvbl9nZXRfcmRldihiby0+YmRldik7DQogCWRvd25fcmVhZCgmcmRldi0+cG0u
bWNsa19sb2NrKTsNCi0JcmV0ID0gdHRtX3ZtX29wcy0+ZmF1bHQodm1mKTsNCisJcmV0ID0gdHRt
X2JvX3ZtX2ZhdWx0KHZtZik7DQogCXVwX3JlYWQoJnJkZXYtPnBtLm1jbGtfbG9jayk7DQogCXJl
dHVybiByZXQ7DQogfQ0KIA0KK3N0YXRpYyBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3QgcmFk
ZW9uX3R0bV92bV9vcHMgPSB7DQorCS5mYXVsdCA9IHJhZGVvbl90dG1fZmF1bHQsDQorCS5vcGVu
ID0gdHRtX2JvX3ZtX29wZW4sDQorCS5jbG9zZSA9IHR0bV9ib192bV9jbG9zZSwNCisJLmFjY2Vz
cyA9IHR0bV9ib192bV9hY2Nlc3MNCit9Ow0KKw0KIGludCByYWRlb25fbW1hcChzdHJ1Y3QgZmls
ZSAqZmlscCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpICB7DQogCWludCByOw0KIAlzdHJ1
Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiA9IGZpbHAtPnByaXZhdGVfZGF0YTsNCiAJc3RydWN0IHJh
ZGVvbl9kZXZpY2UgKnJkZXYgPSBmaWxlX3ByaXYtPm1pbm9yLT5kZXYtPmRldl9wcml2YXRlOw0K
IA0KLQlpZiAocmRldiA9PSBOVUxMKSB7DQorCWlmIChyZGV2ID09IE5VTEwpDQogCQlyZXR1cm4g
LUVJTlZBTDsNCi0JfQ0KKw0KIAlyID0gdHRtX2JvX21tYXAoZmlscCwgdm1hLCAmcmRldi0+bW1h
bi5iZGV2KTsNCi0JaWYgKHVubGlrZWx5KHIgIT0gMCkpIHsNCisJaWYgKHVubGlrZWx5KHIgIT0g
MCkpDQogCQlyZXR1cm4gcjsNCi0JfQ0KLQlpZiAodW5saWtlbHkodHRtX3ZtX29wcyA9PSBOVUxM
KSkgew0KLQkJdHRtX3ZtX29wcyA9IHZtYS0+dm1fb3BzOw0KLQkJcmFkZW9uX3R0bV92bV9vcHMg
PSAqdHRtX3ZtX29wczsNCi0JCXJhZGVvbl90dG1fdm1fb3BzLmZhdWx0ID0gJnJhZGVvbl90dG1f
ZmF1bHQ7DQotCX0NCisNCiAJdm1hLT52bV9vcHMgPSAmcmFkZW9uX3R0bV92bV9vcHM7DQogCXJl
dHVybiAwOw0KIH0NCi0tDQoyLjE0LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
