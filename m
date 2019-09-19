Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 629B1B82A3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 22:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116DC6FB59;
	Thu, 19 Sep 2019 20:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700073.outbound.protection.outlook.com [40.107.70.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D76D6FB59;
 Thu, 19 Sep 2019 20:38:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A70wp4Jm1S3BBWIa5WMHno+Dc7KuD497TyOMo/g1OU0pmW6lvjQiF0bd/msubIbLJLmAa258ucfqjUOeFCfRqdiC1GuVPPQMynjAUL0TjxAzte9KpUP0rpMG8XnL8GmELrfeIaIbD5qW3wRi8oMMVMWwNMWHEV6vO66Ase4tMtx2fUmDtFoEcYrtlJZZTJmUBe0lERY67RoFETkTBov7I6Yn3kdSIkhpBfZF/JS5eqwn1RpiJDkNViOVkVkeoOtNm2ENR755tJTx5trZcDI7BlMBAUhzw49ctwdBtROzcUZXoD7wCFKyw+FuXCy6e95gajbPb9I1OdmsFouVG8mXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5q4sEsma4jUXgl9k8GFPltdRXR6zOyqmHPDK+cqGTnI=;
 b=Pdhgotr5b6SMEtOkVdVjtNIgekROmFaRJja9eX8s63HLZXVg2mSZBhuuX3V+3KpwReSwD8hFP9h0gBB/9QsLUDFnQn2w0tnhOLIpI14K/2ah9hms/RVNxtQ+Vl5gf8UYp6SxJZj48Lk7YJXHhbu51fi9qxXJAxHHY2K6IWUI3v/GGrgVymeUebWBtpDWtaXg6Aypcl9rg8gxdJ7PFOGIHrAT0spUNrzSzCpNxuEZQV5DNXi6VmLXoP5+UInY4npTxEMK3mAUya+ebIWpDnYKnOr067Wqa4tJriBQpGTomusc4deIyNfGifH3h0v82w25p28Ein7mjK64mGWnAnYKZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3099.namprd12.prod.outlook.com (20.178.30.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Thu, 19 Sep 2019 20:38:37 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 20:38:36 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Allen Pais <allen.pais@oracle.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: fix a potential NULL pointer dereference
Thread-Topic: [PATCH] drm/amdkfd: fix a potential NULL pointer dereference
Thread-Index: AQHVbklJQb5FSYNxgUiE401HDmRgQ6czd9eA
Date: Thu, 19 Sep 2019 20:38:36 +0000
Message-ID: <62826857-8364-262f-cbf8-17b15dbe0b09@amd.com>
References: <1568824231-4007-1-git-send-email-allen.pais@oracle.com>
In-Reply-To: <1568824231-4007-1-git-send-email-allen.pais@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTBPR01CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::23) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: debf31fe-35c8-4be4-4c3b-08d73d4158b7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3099; 
x-ms-traffictypediagnostic: DM6PR12MB3099:
x-microsoft-antispam-prvs: <DM6PR12MB30990B3E3794AB802D262E1192890@DM6PR12MB3099.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(189003)(199004)(6512007)(4326008)(229853002)(6246003)(71200400001)(3846002)(6116002)(31696002)(86362001)(25786009)(71190400001)(256004)(14444005)(305945005)(7736002)(65806001)(2906002)(6486002)(2501003)(6436002)(66066001)(478600001)(65956001)(64756008)(31686004)(81166006)(81156014)(8936002)(14454004)(99286004)(5660300002)(52116002)(6506007)(386003)(53546011)(66556008)(186003)(26005)(102836004)(316002)(76176011)(11346002)(446003)(476003)(2616005)(66946007)(486006)(36756003)(8676002)(66476007)(54906003)(58126008)(110136005)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3099;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fpsJPEYf07uHl6gd7HYQmByPm9I0UdGjEoybmJr8hPWXt/RSHaqOUuqQGNL+i0iWmQnOz/RQPzzQtD37qM2JcmYrTV1mRaoc7SlmF9srHtrifgLd23xQOGwgToGQOlmhN/F8qtVDWANiJVrsOElv6AVD0KgTcUs0HYBq3h1qWemfr1gLKngICZbaA/u3bZkFnZPdJRIRpn9lrA5mDeN0wyHoC22DUS12HXcD/g30URqxeIbYPTopfE0kZBWUVI5K7fIbg3G+DkrmnqwmYmmjN/kjP6+jkjUrR17vC0BgloDubFCALxOGo8nTlQ538VGpnFoTliBfx7N2fXXNhLyZ00JsizbI+L66q4pK7t/62ZiAynFgRxoDZyDtvfxTEXpdSaIJrIgvK6EC5/kBb4xIpJxf64fMixwMQCrZpkIaTTg=
x-ms-exchange-transport-forked: True
Content-ID: <762A7A9288353343907D787C56AD1497@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: debf31fe-35c8-4be4-4c3b-08d73d4158b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 20:38:36.8049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dzFFIrGOpAU7GY4iIDTHtH2RlZ2b2/ksArC9CmtmW6QQTrk5UmxiAFG6uhSBBTPdZyK8MGcNq58YL2BUatbNyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3099
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5q4sEsma4jUXgl9k8GFPltdRXR6zOyqmHPDK+cqGTnI=;
 b=AF19MTC2s6dCTWUkbQ26esE3jsEXowDa6t3pyZCjvtOSDhyB5zzNAEp7hGz0cygTYBR89Rg3wepDVnOln1ZQatF5lb0lSNvgg2oSdTIzpIFEN5dAFX8th/O/T9N3upa2u0pUCujD8EUGZHod8Pg0/5JvnWAO7MlWoYWADFznyc8=
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0xOCAxMjozMCBwLm0uLCBBbGxlbiBQYWlzIHdyb3RlOg0KPiBhbGxvY193b3Jr
cXVldWUgaXMgbm90IGNoZWNrZWQgZm9yIGVycm9ycyBhbmQgYXMgYSByZXN1bHQsDQo+IGEgcG90
ZW50aWFsIE5VTEwgZGVyZWZlcmVuY2UgY291bGQgb2NjdXIuDQo+DQo+IFNpZ25lZC1vZmYtYnk6
IEFsbGVuIFBhaXMgPGFsbGVuLnBhaXNAb3JhY2xlLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2ludGVycnVwdC5jIHwgNSArKysrKw0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9pbnRlcnJ1cHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9pbnRlcnJ1cHQuYw0KPiBpbmRleCBjNTZhYzQ3Li5jYWE4MmE4IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50ZXJydXB0LmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2ludGVycnVwdC5jDQo+IEBAIC02Miw2ICs2Miwx
MSBAQCBpbnQga2ZkX2ludGVycnVwdF9pbml0KHN0cnVjdCBrZmRfZGV2ICprZmQpDQo+ICAgCX0N
Cj4gICANCj4gICAJa2ZkLT5paF93cSA9IGFsbG9jX3dvcmtxdWV1ZSgiS0ZEIElIIiwgV1FfSElH
SFBSSSwgMSk7DQo+ICsJaWYgKHVubGlrZWx5KCFrZmQtPmloX3dxKSkgew0KPiArCQlmaWZvX2Zy
ZWUoJmtmZC0+aWhfZmlmbyk7DQoNClRoaXMgZG9lcyBub3QgY29tcGlsZS4gSSB0aGluayB0aGlz
IHNob3VsZCBiZSBrZmlmb19mcmVlLg0KDQo+ICsJCWRldl9lcnIoa2ZkX2NoYXJkZXYoKSwgIkZh
aWxlZCB0byBhbGxvY2F0ZSBLRkQgSUggd29ya3F1ZXVlXG4iKTsNCj4gKwkJcmV0dXJuIGtmZC0+
aWhfd3E7DQoNClRoaXMgdGhyb3dzIGEgY29tcGlsZXIgd2FybmluZyAicmV0dXJuIG1ha2VzIGlu
dGVnZXIgZnJvbSBwb2ludGVyIA0Kd2l0aG91dCBhIGNhc3QiLiBXaGF0J3Mgd29yc2UsIGtmZC0+
aWhfd3EgaXMgTlVMTCBoZXJlIGFuZCANCmtmZF9pbnRlcnJ1cHRfaW5pdCByZXR1cm5zIDAgdG8g
bWVhbiBzdWNjZXNzLCBzbyByZXR1cm5pbmcgYSBOVUxMIA0KcG9pbnRlciBpcyBkZWZpbml0ZWx5
IG5vdCB3aGF0IHlvdSB3YW50IGhlcmUuIFRoaXMgZnVuY3Rpb24gc2hvdWxkIA0KcmV0dXJuIGEg
bmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWlsdXJlLiBJIHByb3Bvc2UgLUVOT01FTS4NCg0KSSdt
IGdvaW5nIHRvIGFwcGx5IHlvdXIgcGF0Y2ggd2l0aCB0aG9zZSBmaXhlcy4NCg0KUmVnYXJkcywN
CiDCoCBGZWxpeA0KDQoNCj4gKwl9DQo+ICAgCXNwaW5fbG9ja19pbml0KCZrZmQtPmludGVycnVw
dF9sb2NrKTsNCj4gICANCj4gICAJSU5JVF9XT1JLKCZrZmQtPmludGVycnVwdF93b3JrLCBpbnRl
cnJ1cHRfd3EpOw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
