Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BE164E49
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 00:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93357895E1;
	Wed, 10 Jul 2019 22:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720056.outbound.protection.outlook.com [40.107.72.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9A1895E1;
 Wed, 10 Jul 2019 22:02:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNJJ9aTTKELjqAQnNMQlx5pvUxXaMvDCLkv8b4aJZXjn8oPdf8CsY5ZXyn6HAWCCOSIhcUF6QRU2a+Zp39XWIuXxGsU2Gybs502yIHd2axHUgGrwsiaW0W2otHHFb+35lpOkI0KF7piZjoxE1CLlHhK1ULu2TALAmjpJYr88JcvpckgYyjRX1Yx9BrdjwndT66miem/ebwwK92A7X3io3izawYq+WUa9r5OniBQYnQqXk9n0PQU5I53ViT4RXXwx19TWuc34yJZnG7ikkuyairda+LynNmO3S0rJK97so93zurDW3DlF/1/MgcpluYB4zWL0A0R+rQNoqrandVbGFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBHmhrblQNr3lnIWp8pZfP5ZgVc0PFGpeLJokbTbJBA=;
 b=HdGfH9AInV/u0mv6RwoSHFvxQb0lTR2ZxFbh0PM9ON7OIxJm2LFUoxV+SzOwWeRB1vSWRU6fLT+jtZ7+D2UF0Wu5O9sahTvbFBNe4+YQbEcVIwTOBCKHrRhtZ3YanELsBaQ83NM4XmeqjnHCkDgbNYO6LZGp6akHDmoKjLfWWQ9UaAouHwaKTRq5khjBr7QVEUP9cM81Q3D6pxQB1z0dOTMXfc7xNQckyON04HXu4z7uqSyTZsVkJTDqT5tkeFBoweeaQ2rVMH1JQnG3wF+H2+pNospgle8S0evorABKz6d9BVDIpNZMcPTwgYnGDejeL5Kqm0oVmZHGRjwbdsRJUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3226.namprd12.prod.outlook.com (20.179.105.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Wed, 10 Jul 2019 22:02:57 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 22:02:57 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, Maling
 list - DRI developers <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] drm/ttm: Add release_notify callback to ttm_bo_driver
Thread-Topic: [PATCH 3/5] drm/ttm: Add release_notify callback to ttm_bo_driver
Thread-Index: AQHVNtPTVZf+21bL/UqfFVpJWy9RNqbEaMyA
Date: Wed, 10 Jul 2019 22:02:57 +0000
Message-ID: <d07c012c-cb26-6833-ad9f-984c88cdad41@amd.com>
References: <20190710035848.26966-1-Felix.Kuehling@amd.com>
 <20190710035848.26966-3-Felix.Kuehling@amd.com>
In-Reply-To: <20190710035848.26966-3-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YTOPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::42) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0f1a32d-0628-4c61-2e51-08d705825d91
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3226; 
x-ms-traffictypediagnostic: DM6PR12MB3226:
x-microsoft-antispam-prvs: <DM6PR12MB3226F57A17CFDEE86CAC4F9592F00@DM6PR12MB3226.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(189003)(199004)(6486002)(256004)(14444005)(6246003)(52116002)(64126003)(58126008)(53546011)(6506007)(386003)(6436002)(110136005)(68736007)(36756003)(8936002)(86362001)(102836004)(76176011)(316002)(31696002)(25786009)(478600001)(6512007)(2906002)(65826007)(26005)(11346002)(65806001)(66446008)(64756008)(66556008)(229853002)(66066001)(65956001)(14454004)(71200400001)(71190400001)(31686004)(486006)(66476007)(450100002)(7736002)(305945005)(476003)(2616005)(6116002)(2501003)(3846002)(53936002)(81166006)(81156014)(186003)(8676002)(5660300002)(66946007)(446003)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3226;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: h5pgs14a26Q2w0Xf/uW43NELuvywfddTGzySwE9BFhHov8XhzDcc8jECdVu13rGUJ0aZWsVqvvBn++AD2KJps0RETvKudkEI6UaOVqpzDXWGcgZLiFZwWZ7k4Cm8PvVHjhdnYP3QZLMJ//Re5nhwfjcCy09wlzCH5JaSPOQbdkOvHt4+LUSZZLFgpO+u/2hevLh/U5Mjoa/bOHmxch4oO8rfqJR7uUgn5jBg5R36eA2ROlvO1fTDDrlz8yAIalXd8qjKnqB0/XjFNKnomiNhudoG8LXd2YPUCdnW/FYQHxVS62HPdG7DgQ87lmfwT1HohR4BU0/4GrBEa92A5jJ/wVsazEE4T+Ojs3QkVnEliUkBUsgT7VDuZHyBjYdhsO1MQYQ4s/iu7/EW6P3D9bcCCDMAh7XOR/o/ghWSnKd3FNs=
Content-ID: <ADFE76FC5675E14EB5EF7BD6BD61F37A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f1a32d-0628-4c61-2e51-08d705825d91
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 22:02:57.2596 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3226
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBHmhrblQNr3lnIWp8pZfP5ZgVc0PFGpeLJokbTbJBA=;
 b=pNBPssP6191CFmtlnMJvHJ90e9K3NMVeq24CTqohcK9JmVG/44U2ViegsmIdaq7pv98y8eV3AMSXqZbp2hFv5ThoYglUfB2G5n/6eHya5nhzNuPRfqU0POe611kNNKgOtKs1Ykxm3yIfVeGMiEVgznuLomzxp534nh3MDiLpcm4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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

W2FkZGluZyBkcmktZGV2ZWxdDQoNCk9uIDIwMTktMDctMDkgMTE6NTkgcC5tLiwgS3VlaGxpbmcs
IEZlbGl4IHdyb3RlOg0KPiBUaGlzIG5vdGlmaWVzIHRoZSBkcml2ZXIgdGhhdCBhIEJPIGlzIGFi
b3V0IHRvIGJlIHJlbGVhc2VkLg0KPg0KPiBSZWxlYXNpbmcgYSBCTyBhbHNvIGludm9rZXMgdGhl
IG1vdmVfbm90aWZ5IGNhbGxiYWNrIGZyb20NCj4gdHRtX2JvX2NsZWFudXBfbWVtdHlwZV91c2Us
IGJ1dCB0aGF0IGhhcHBlbnMgdG9vIGxhdGUgZm9yIGFueXRoaW5nDQo+IHRoYXQgd291bGQgYWRk
IGZlbmNlcyB0byB0aGUgQk8gYW5kIHJlcXVpcmUgYSBkZWxheWVkIGRlbGV0ZS4NCj4NCj4gU2ln
bmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQo+IC0t
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgICAgfCAgMyArKysNCj4gICBpbmNs
dWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oIHwgMTAgKysrKysrKysrKw0KPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMNCj4gaW5kZXgg
NThjNDAzZWRhMDRlLi4yMDcwZThhNTdlZDggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPiBA
QCAtNjcxLDYgKzY3MSw5IEBAIHN0YXRpYyB2b2lkIHR0bV9ib19yZWxlYXNlKHN0cnVjdCBrcmVm
ICprcmVmKQ0KPiAgIAlzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiA9IGJvLT5iZGV2Ow0KPiAg
IAlzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiA9ICZiZGV2LT5tYW5bYm8tPm1lbS5t
ZW1fdHlwZV07DQo+ICAgDQo+ICsJaWYgKGJvLT5iZGV2LT5kcml2ZXItPnJlbGVhc2Vfbm90aWZ5
KQ0KPiArCQliby0+YmRldi0+ZHJpdmVyLT5yZWxlYXNlX25vdGlmeShibyk7DQo+ICsNCj4gICAJ
ZHJtX3ZtYV9vZmZzZXRfcmVtb3ZlKCZiZGV2LT52bWFfbWFuYWdlciwgJmJvLT52bWFfbm9kZSk7
DQo+ICAgCXR0bV9tZW1faW9fbG9jayhtYW4sIGZhbHNlKTsNCj4gICAJdHRtX21lbV9pb19mcmVl
X3ZtKGJvKTsNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgg
Yi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oDQo+IGluZGV4IGM5YjhiYTQ5MmYyNC4u
ZDY5MTIxYzQzZTU4IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZl
ci5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgNCj4gQEAgLTM5MCw2
ICszOTAsMTYgQEAgc3RydWN0IHR0bV9ib19kcml2ZXIgew0KPiAgIAkgKiBub3RpZnkgZHJpdmVy
IHRoYXQgYSBCTyB3YXMgZGVsZXRlZCBmcm9tIExSVS4NCj4gICAJICovDQo+ICAgCXZvaWQgKCpk
ZWxfZnJvbV9scnVfbm90aWZ5KShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKTsNCj4gKw0K
PiArCS8qKg0KPiArCSAqIE5vdGlmeSB0aGUgZHJpdmVyIHRoYXQgd2UncmUgYWJvdXQgdG8gcmVs
ZWFzZSBhIEJPDQo+ICsJICoNCj4gKwkgKiBAYm86IEJPIHRoYXQgaXMgYWJvdXQgdG8gYmUgcmVs
ZWFzZWQNCj4gKwkgKg0KPiArCSAqIEdpdmVzIHRoZSBkcml2ZXIgYSBjaGFuY2UgdG8gZG8gYW55
IGNsZWFudXAsIGluY2x1ZGluZw0KPiArCSAqIGFkZGluZyBmZW5jZXMgdGhhdCBtYXkgZm9yY2Ug
YSBkZWxheWVkIGRlbGV0ZQ0KPiArCSAqLw0KPiArCXZvaWQgKCpyZWxlYXNlX25vdGlmeSkoc3Ry
dWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyk7DQo+ICAgfTsNCj4gICANCj4gICAvKioNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
