Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C917293B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 09:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E006E48A;
	Wed, 24 Jul 2019 07:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690061.outbound.protection.outlook.com [40.107.69.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83A66E48A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 07:48:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3pRJ4no4vDCrMFy7k4Ssh9aV81i1fa62lNzT5i75vtLsmi2rqPfO0UFfniCtH7exxtkk2JeZpgQ/rsTPT+4XvBo6y0uawsqUKka5hzNc7UCZY6rgVlZOTO/UXPdzACFn4IbJcQPY00g8bDeH38F/wuB515WEV1HjfxrkMIeZdlA+f/V4JRDkGxpcJRb6SGW4y3oA00u+9/8819w8LykECfUPUeiVCu35dFONToWMXibG4WSX3ra6Nbb6xKSwfi6hiqfe1+XfkZtecfUXHA91nhgJqe9awpBsFNhArNaq+ctL7P6BCPCQbI2XuebLtroAK0fzIzcy5SjJEtnykgU/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BHG3SsliVI35Intfa8FTUDgHVWybAdYrvSrjgxyZzE=;
 b=iz64S0DrMKmH9WNwY5WMe36ulLw/9hsjntBVzGqVRmkFiG5P02qfvOAnIO4d5iAxr6KNpg0R4FKLOf9GPqpROhnIV+mi7T35Gaubb05J7VJDYwoH3o5AMeAyuktts/hc/b3ElD0YZbH/pWNiklMjaXYfRisfZZt2+wnPgmwbhOvDu5euXWom7o3flqnNAkduiaRDfTAgbL8m3K98yMMTldWzA8BnkOu7CYODUjVYls9iowGRzviImcuBjcgX5GEYLYkTIJXvijaq+raUgHUbdEmxLqL76fxN+Jemuj9f3KkmsuUAfixVhplb/yXPZBOlYQYuMynsls5Tyu1thJTdkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1689.namprd12.prod.outlook.com (10.172.33.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Wed, 24 Jul 2019 07:48:23 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2094.013; Wed, 24 Jul
 2019 07:48:23 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, Lionel Landwerlin
 <lionel.g.landwerlin@intel.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/syncobj: extend syncobj query ability v2
Thread-Topic: [PATCH] drm/syncobj: extend syncobj query ability v2
Thread-Index: AQHVQWIA158+x3pHOEq2aI/D46q9lKbYlJqAgAC7roCAABVEAA==
Date: Wed, 24 Jul 2019 07:48:23 +0000
Message-ID: <98e615e3-8936-6a21-543c-1605577436a0@amd.com>
References: <20190723142114.24688-1-david1.zhou@amd.com>
 <fe5bff32-b7b4-e388-61e7-950b0125d8fc@intel.com>
 <f2633335-6b0a-65b7-61c3-02cf7a14ac25@amd.com>
In-Reply-To: <f2633335-6b0a-65b7-61c3-02cf7a14ac25@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0118.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::34) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad50533a-a899-4076-08bc-08d7100b4dcf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1689; 
x-ms-traffictypediagnostic: DM5PR12MB1689:
x-microsoft-antispam-prvs: <DM5PR12MB16896EA1E3C78F27D1ED0F8D83C60@DM5PR12MB1689.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(199004)(189003)(66556008)(386003)(64756008)(66446008)(6506007)(66476007)(64126003)(6436002)(53936002)(31686004)(99286004)(71200400001)(6486002)(8936002)(53546011)(71190400001)(6512007)(86362001)(66946007)(2906002)(14454004)(5660300002)(7736002)(102836004)(2501003)(229853002)(76176011)(31696002)(6246003)(305945005)(36756003)(68736007)(25786009)(65956001)(316002)(476003)(58126008)(446003)(11346002)(478600001)(6116002)(110136005)(65826007)(52116002)(486006)(8676002)(65806001)(81156014)(81166006)(46003)(186003)(2616005)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1689;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LJA7n3/JWmdfuFfrbl4jNVlMCfknoFzaR2SiLB4fI0Hyu10mjM1vbfGnI3vdDqXs0kLzgQI2Ag7fFPWueQuvLhZO09+Ql2ywFwbJv6+CoGlyOv9lr5k9d1dzYMYLs+eT0uoBQOR7QQlXT/j6WOdLGiSdfV5HfaTyurGYnZHyxsEWUgfkp7K8vfTWrax1pZs9qR62guv/WHSyjZVTGkcvKNbBDX38SrOCwSyEpkSixBNlHLo8ZK9be2W6xW+kBb/DZfHiX3JOtNWJtTQCr91SSOuNH3oj9KPh6yA6ZC63MjQyFsMvDz43M4fuEOTOciO7vY5lm0rcG4yh66Sq1XIgPYHlcyGg85IMJPr2A2yXu9IHwR7McbmjUrL093CaLURgLFdb8oFoyIRzXwaUPrF07CtcOFFdpgXJ8XMV+v0bxTY=
Content-ID: <ECA1883215FDFB4787321F624A4E7BFA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad50533a-a899-4076-08bc-08d7100b4dcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 07:48:23.3974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1689
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BHG3SsliVI35Intfa8FTUDgHVWybAdYrvSrjgxyZzE=;
 b=y+ycpHK+1Se2mrLfSHl5zhvq5iY/ceiyGccArs4XHWO6lPJTo/bIRRuKYFU+p4F3lFrhfZ1doDOIs5oNvBPXK2nR4etkNTVWIxyCGhcNTsdM2jRvHUjXVjHcxvguTG91ftBi0LtATbzjKubNiE1Gz7qOLEwL5qaf6uEc61fnMMY=
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

QW0gMjQuMDcuMTkgdW0gMDg6MzIgc2NocmllYiB6aG91Y20xOg0KPg0KPg0KPiBPbiAyMDE55bm0
MDfmnIgyNOaXpSAwMzoyMCwgTGlvbmVsIExhbmR3ZXJsaW4gd3JvdGU6DQo+PiBPbiAyMy8wNy8y
MDE5IDE3OjIxLCBDaHVubWluZyBaaG91IHdyb3RlOg0KPj4+IHVzZXIgc3BhY2UgbmVlZHMgYSBm
bGV4aWFibGUgcXVlcnkgYWJpbGl0eS4NCj4+PiBTbyB0aGF0IHVtZCBjYW4gZ2V0IGxhc3Qgc2ln
bmFsZWQgb3Igc3VibWl0dGVkIHBvaW50Lg0KPj4+IHYyOg0KPj4+IGFkZCBzYW5pdGl6ZXIgY2hl
Y2tpbmcuDQo+Pj4NCj4+PiBDaGFuZ2UtSWQ6IEk2NTEyYjQzMDUyNGViYWJlNzE1ZTYwMmEyYmY1
YWJiMGE3ZTc4MGVhDQo+Pj4gU2lnbmVkLW9mZi1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpo
b3VAYW1kLmNvbT4NCj4+PiBDYzogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJs
aW5AaW50ZWwuY29tPg0KPj4+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxDaHJpc3RpYW4uS29lbmln
QGFtZC5jb20+DQo+Pg0KPj4gUmV2aWV3ZWQtYnk6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwu
Zy5sYW5kd2VybGluQGludGVsLmNvbT4NCj4NCj4gVGhhbmtzLg0KPiBXaGljaCBicmFuY2ggc2hv
dWxkIHRoaXMgcGF0Y2ggZ28gdG8/DQo+IElzIGl0IE9LIHRvIHB1c2ggdG8gYW1kLXN0YWdpbmct
ZHJtLW5leHQ/DQo+IE9yIHNob3VsZCBpdCBnbyB0byBkcm0tbWlzYz8NCj4gSWYgZHJtLW1pc2Ms
IEkgbmVlZCB5b3VyIGhlbHAgdG8gcHVzaCBpdCBzaW5jZSBJIGhhdmUgbm8gcGVybWlzc2lvbiB0
byANCj4gd3JpdGUuDQoNCmRybS1taXNjLW5leHQgaXMgcHJvYmFibHkgbW9yZSBhcHByb3ByaWF0
ZWQuDQoNCkknbSBnb2luZyB0byB0YWtlIG9mIHRoYXQsIGJ1dCBmaXJzdCBsZXQgbWUgcHVzaCBt
eSBmaXggbm93Lg0KDQpDaHJpc3RpYW4uDQoNCj4NCj4gLURhdmlkDQo+Pg0KPj4+IC0tLQ0KPj4+
IMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIHwgMzQgKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLQ0KPj4+IMKgIGluY2x1ZGUvdWFwaS9kcm0vZHJtLmjCoMKgwqDCoMKg
wqDCoCB8wqAgMyArKy0NCj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyks
IDE1IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fc3luY29iai5jIA0KPj4+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMNCj4+PiBp
bmRleCAzZDQwMDkwNTEwMGIuLjNmYzhmNjZhZGE2OCAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX3N5bmNvYmouYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lu
Y29iai5jDQo+Pj4gQEAgLTExOTcsNyArMTE5Nyw3IEBAIGRybV9zeW5jb2JqX3RpbWVsaW5lX3Np
Z25hbF9pb2N0bChzdHJ1Y3QgDQo+Pj4gZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLA0KPj4+
IMKgwqDCoMKgwqAgaWYgKCFkcm1fY29yZV9jaGVja19mZWF0dXJlKGRldiwgRFJJVkVSX1NZTkNP
QkpfVElNRUxJTkUpKQ0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVPUE5PVFNVUFA7
DQo+Pj4gwqAgLcKgwqDCoCBpZiAoYXJncy0+cGFkICE9IDApDQo+Pj4gK8KgwqDCoCBpZiAoYXJn
cy0+ZmxhZ3MgIT0gMCkNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7DQo+
Pj4gwqAgwqDCoMKgwqDCoCBpZiAoYXJncy0+Y291bnRfaGFuZGxlcyA9PSAwKQ0KPj4+IEBAIC0x
MjY4LDcgKzEyNjgsNyBAQCBpbnQgZHJtX3N5bmNvYmpfcXVlcnlfaW9jdGwoc3RydWN0IGRybV9k
ZXZpY2UgDQo+Pj4gKmRldiwgdm9pZCAqZGF0YSwNCj4+PiDCoMKgwqDCoMKgIGlmICghZHJtX2Nv
cmVfY2hlY2tfZmVhdHVyZShkZXYsIERSSVZFUl9TWU5DT0JKX1RJTUVMSU5FKSkNCj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPj4+IMKgIC3CoMKgwqAgaWYgKGFy
Z3MtPnBhZCAhPSAwKQ0KPj4+ICvCoMKgwqAgaWYgKGFyZ3MtPmZsYWdzICYgfkRSTV9TWU5DT0JK
X1FVRVJZX0ZMQUdTX0xBU1RfU1VCTUlUVEVEKQ0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gLUVJTlZBTDsNCj4+PiDCoCDCoMKgwqDCoMKgIGlmIChhcmdzLT5jb3VudF9oYW5kbGVzID09
IDApDQo+Pj4gQEAgLTEyOTEsMjMgKzEyOTEsMjkgQEAgaW50IGRybV9zeW5jb2JqX3F1ZXJ5X2lv
Y3RsKHN0cnVjdCANCj4+PiBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIChjaGFpbikgew0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCBkbWFfZmVuY2UgKml0ZXIsICpsYXN0X3NpZ25hbGVkID0gTlVMTDsNCj4+PiDCoCAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfZmVuY2VfY2hhaW5fZm9yX2VhY2goaXRlciwgZmVu
Y2UpIHsNCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghaXRlcikNCj4+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+Pj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfZmVuY2VfcHV0KGxhc3Rfc2lnbmFsZWQp
Ow0KPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFzdF9zaWduYWxlZCA9IGRt
YV9mZW5jZV9nZXQoaXRlcik7DQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoIXRvX2RtYV9mZW5jZV9jaGFpbihsYXN0X3NpZ25hbGVkKS0+cHJldl9zZXFubykNCj4+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogSXQgaXMgbW9zdCBsaWtl
bHkgdGhhdCB0aW1lbGluZSBoYXMNCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqIHVub3JkZXIgcG9pbnRzLiAqLw0KPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoYXJncy0+ZmxhZ3MgJg0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJN
X1NZTkNPQkpfUVVFUllfRkxBR1NfTEFTVF9TVUJNSVRURUQpIHsNCj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHBvaW50ID0gZmVuY2UtPnNlcW5vOw0KPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIH0gZWxzZSB7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBkbWFfZmVuY2VfY2hhaW5fZm9yX2VhY2goaXRlciwgZmVuY2UpIHsNCj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFpdGVyKQ0KPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfZmVuY2VfcHV0KGxhc3Rfc2lnbmFs
ZWQpOw0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsYXN0X3Np
Z25hbGVkID0gZG1hX2ZlbmNlX2dldChpdGVyKTsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgaWYgDQo+Pj4gKCF0b19kbWFfZmVuY2VfY2hhaW4obGFzdF9zaWdu
YWxlZCktPnByZXZfc2Vxbm8pDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLyogSXQgaXMgbW9zdCBsaWtlbHkgdGhhdCB0aW1lbGluZSBoYXMNCj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHVub3Jk
ZXIgcG9pbnRzLiAqLw0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGJyZWFrOw0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0K
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG9pbnQgPSBkbWFfZmVuY2VfaXNf
c2lnbmFsZWQobGFzdF9zaWduYWxlZCkgPw0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBsYXN0X3NpZ25hbGVkLT5zZXFubyA6DQo+Pj4gKyB0b19kbWFfZmVuY2Vf
Y2hhaW4obGFzdF9zaWduYWxlZCktPnByZXZfc2Vxbm87DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfQ0KPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBvaW50ID0gZG1hX2ZlbmNl
X2lzX3NpZ25hbGVkKGxhc3Rfc2lnbmFsZWQpID8NCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGxhc3Rfc2lnbmFsZWQtPnNlcW5vIDoNCj4+PiAtIHRvX2RtYV9mZW5jZV9jaGFp
bihsYXN0X3NpZ25hbGVkKS0+cHJldl9zZXFubzsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBkbWFfZmVuY2VfcHV0KGxhc3Rfc2lnbmFsZWQpOw0KPj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCB9IGVsc2Ugew0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBvaW50ID0gMDsNCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4+ICvCoMKgwqDCoMKgwqDCoCBkbWFfZmVuY2VfcHV0
KGZlbmNlKTsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gY29weV90b191c2VyKCZwb2lu
dHNbaV0sICZwb2ludCwgc2l6ZW9mKHVpbnQ2NF90KSk7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
IHJldCA9IHJldCA/IC1FRkFVTFQgOiAwOw0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0
KQ0KPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2RybS5oIGIvaW5jbHVkZS91YXBp
L2RybS9kcm0uaA0KPj4+IGluZGV4IDY2MWQ3M2Y5YTkxOS4uZmQ5ODdjZTI0ZDlmIDEwMDY0NA0K
Pj4+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtLmgNCj4+PiArKysgYi9pbmNsdWRlL3VhcGkv
ZHJtL2RybS5oDQo+Pj4gQEAgLTc3NywxMSArNzc3LDEyIEBAIHN0cnVjdCBkcm1fc3luY29ial9h
cnJheSB7DQo+Pj4gwqDCoMKgwqDCoCBfX3UzMiBwYWQ7DQo+Pj4gwqAgfTsNCj4+PiDCoCArI2Rl
ZmluZSBEUk1fU1lOQ09CSl9RVUVSWV9GTEFHU19MQVNUX1NVQk1JVFRFRCAoMSA8PCAwKSAvKiBs
YXN0IA0KPj4+IGF2YWlsYWJsZSBwb2ludCBvbiB0aW1lbGluZSBzeW5jb2JqICovDQo+Pj4gwqAg
c3RydWN0IGRybV9zeW5jb2JqX3RpbWVsaW5lX2FycmF5IHsNCj4+PiDCoMKgwqDCoMKgIF9fdTY0
IGhhbmRsZXM7DQo+Pj4gwqDCoMKgwqDCoCBfX3U2NCBwb2ludHM7DQo+Pj4gwqDCoMKgwqDCoCBf
X3UzMiBjb3VudF9oYW5kbGVzOw0KPj4+IC3CoMKgwqAgX191MzIgcGFkOw0KPj4+ICvCoMKgwqAg
X191MzIgZmxhZ3M7DQo+Pj4gwqAgfTsNCj4+DQo+Pg0KPg0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
