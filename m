Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE95BE34E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 19:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2906EC04;
	Wed, 25 Sep 2019 17:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810058.outbound.protection.outlook.com [40.107.81.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EE46EC03;
 Wed, 25 Sep 2019 17:22:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6de/PQteI1g9W18OSAFUQZBbcduH7q43gXqWDRBwLOJhPVHET3/iC1n8JssBjQ5ouW7uMQQ0Z6P7jSB0M7b7eoyL0XF0i+TCvEMp2rb0R0Es75cCjP58e0ryTogh9ZdePUNf6yk5HdSrjtJNR3NM/14KPR98gDy2WyhOOKef3PQ/wDYlO2qXL/PjWS/dNRGYCWNpjDimWeL/YYR6Knio8ZSnihJ4SHLC5FJi8B7GrqRJ02/5xBVqOIu7DmEABhfffig+h7J9kilJbs6ztrj8aSbSvSuUUFYAresBBbloetC47XNjKkwjcqbJW9EKn5zqo3q+OLJiEK2yJZO8scKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6UcDMpGzzZJflzPJdJQ18SkOwzHPuN5gZLhe/sosZI=;
 b=klN9GQ4KQZ+XQ0tq8EXOO3DxTBGa5yvdnH14WnrbrsnQZYSKRAFpUtye4lgHZOJ7yp/0HhXjCdhuWBE+pyYxHqYGy7OJRhCJdWoXdFyh6yxrqNya/uVpQEfYn3OWIkylHd1emIb4ZFL/gWnFgqLcy8clfQjxGAgy0QzHf04WHIKNsPInBXVhUboysqn85g4EQgds2aWJf5ghPV3DwmNNray10NQqhiMvhbIInLlrS7rSxkYZDPef/ZRgOEU+UNgrtvK3TUZvD1Q5zwombijsS5LZcAir9y2jXVikF9an9RWcUHqaG1GH2vxhLlLaLGXBIy5acdZdvDqi2xvQq1qZ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB4152.namprd12.prod.outlook.com (20.180.6.72) by
 CH2PR12MB3671.namprd12.prod.outlook.com (52.132.244.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 17:22:30 +0000
Received: from CH2PR12MB4152.namprd12.prod.outlook.com
 ([fe80::a426:f52a:fb94:e138]) by CH2PR12MB4152.namprd12.prod.outlook.com
 ([fe80::a426:f52a:fb94:e138%2]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 17:22:29 +0000
From: "Tuikov, Luben" <Luben.Tuikov@amd.com>
To: "Huang, Ray" <Ray.Huang@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: Re: [PATCH v3 10/11] drm/amdgpu: job is secure iff CS is secure (v4)
Thread-Topic: [PATCH v3 10/11] drm/amdgpu: job is secure iff CS is secure (v4)
Thread-Index: AQHVc67eAOP3HjJHn0i9QUAnxAtta6c8eLkAgAAA+ECAACqMgA==
Date: Wed, 25 Sep 2019 17:22:29 +0000
Message-ID: <5e934e53-8970-fd97-dc0f-3fd20a367de4@amd.com>
References: <1569422279-6609-1-git-send-email-ray.huang@amd.com>
 <e04af4ef-aa3b-534b-8c5b-e6ee11f677a5@amd.com>
 <MN2PR12MB3309B9F92121C846639C87ECEC870@MN2PR12MB3309.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3309B9F92121C846639C87ECEC870@MN2PR12MB3309.namprd12.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::31) To CH2PR12MB4152.namprd12.prod.outlook.com
 (2603:10b6:610:a7::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [108.162.138.91]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22fc01ca-b015-4e6e-6ad6-08d741dcf14c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CH2PR12MB3671; 
x-ms-traffictypediagnostic: CH2PR12MB3671:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB3671912ED8831E820C09855F99870@CH2PR12MB3671.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(13464003)(189003)(199004)(4326008)(11346002)(8936002)(256004)(2906002)(7736002)(36756003)(2616005)(2201001)(6246003)(110136005)(86362001)(476003)(52116002)(81156014)(55236004)(81166006)(26005)(53546011)(99286004)(6512007)(229853002)(6506007)(31696002)(6436002)(316002)(446003)(102836004)(6486002)(76176011)(305945005)(31686004)(386003)(66066001)(450100002)(71200400001)(3846002)(6116002)(2501003)(186003)(71190400001)(478600001)(5660300002)(8676002)(66556008)(64756008)(66446008)(14454004)(486006)(25786009)(66476007)(66946007)(6636002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3671;
 H:CH2PR12MB4152.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xm3TZFNjkIipI/1JNVi//yJ904mlEGwttWYH9gK0OtF9XZ1xoIKWw86hCm72H/doeMtuB6mKfBgc00Z+FrE9Fqi8QqAL08qUkCMHG843cFNsHmFg93qWSHIkL2vTKlnRFIzjPT8ZIvXgro43c6gUWNFfbZCVivl5TzwNOXOnbArpDuRhJBSxsHbHjTGb/uLBelbYP6GHodDg0AF8lowoEbCDHQdQ7Wn8Sx387qKAAUVypuGXtyhFBfmLLuCwpoEfnbqZjNUz+O1mYD4X6+I2cn5SYsGkX1irwM7hPob8aqPKF+a/hx7VNHgWE/bImyg5t4MPTu6DGk0sm/Rf2w28HZh7pKhWgVPhj8tLuKTBuaGPa3R3gSs0QJOKRWPAQj9GTcxgfrlI5Zp+GpkX5DIrdvvP2x5CniqC2G+GfY/OY0Q=
Content-ID: <F2C7A3E6B3661045ADE02FDFBE934EB2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22fc01ca-b015-4e6e-6ad6-08d741dcf14c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 17:22:29.5083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j1zEnxcxYWZaLcJ5B7MnCc62ht9mLLaAH6iwfpmW+HHUKpPdoKxrwtl5op1Coh/L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3671
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6UcDMpGzzZJflzPJdJQ18SkOwzHPuN5gZLhe/sosZI=;
 b=l0dEkyEEWKtE3P7tBA8iX8mBJKrKXQ/9EEcy6SrhnhXXoGivezE3NDw59Yg5x2mBEvOftXKdRuhYX7WhrhvYeJNnJNJ9cj288nPWCOPyZ2KoejH8lrmzfgd1BH9+mEwTnDOMdupWooVV2JmW/pPIiY0JjhW14MEaAzNSjkW8zp0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luben.Tuikov@amd.com; 
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
Cc: "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0yNSAxMDo1NCwgSHVhbmcsIFJheSB3cm90ZToNCj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+PiBGcm9tOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5p
Z0BhbWQuY29tPg0KPj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMjUsIDIwMTkgMTA6NDcg
UE0NCj4+IFRvOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOyBkcmktDQo+PiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IERl
dWNoZXIsIEFsZXhhbmRlcg0KPj4gPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+DQo+PiBDYzog
VHVpa292LCBMdWJlbiA8THViZW4uVHVpa292QGFtZC5jb20+OyBMaXUsIEFhcm9uDQo+PiA8QWFy
b24uTGl1QGFtZC5jb20+DQo+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEwLzExXSBkcm0vYW1k
Z3B1OiBqb2IgaXMgc2VjdXJlIGlmZiBDUyBpcyBzZWN1cmUgKHY0KQ0KPj4NCj4+IEFtIDI1LjA5
LjE5IHVtIDE2OjM4IHNjaHJpZWIgSHVhbmcsIFJheToNCj4+PiBNYXJrIGEgam9iIGFzIHNlY3Vy
ZSwgaWYgYW5kIG9ubHkgaWYgdGhlIGNvbW1hbmQgc3VibWlzc2lvbiBmbGFnIGhhcw0KPj4+IHRo
ZSBzZWN1cmUgZmxhZyBzZXQuDQo+Pj4NCj4+PiB2MjogZml4IHRoZSBudWxsIGpvYiBwb2ludGVy
IHdoaWxlIGluIHZtaWQgMCBzdWJtaXNzaW9uLg0KPj4+IHYzOiBDb250ZXh0IC0tPiBDb21tYW5k
IHN1Ym1pc3Npb24uDQo+Pj4gdjQ6IGZpbGxpbmcgY3MgcGFyc2VyIHdpdGggY3MtPmluLmZsYWdz
DQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPg0K
Pj4+IENvLWRldmVsb3BlZC1ieTogTHViZW4gVHVpa292IDxsdWJlbi50dWlrb3ZAYW1kLmNvbT4N
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQuY29tPg0K
Pj4+IFJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
DQo+Pj4gLS0tDQo+Pj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCAgICAg
fCAgMyArKysNCj4+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jICB8
IDExICsrKysrKysrKystDQo+Pj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
aWIuYyAgfCAgNCArKy0tDQo+Pj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
am9iLmggfCAgMiArKw0KPj4+ICAgNCBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdS5oDQo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUu
aA0KPj4+IGluZGV4IDY5N2U4ZTUuLmZkNjA2OTUgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHUuaA0KPj4+IEBAIC00ODUsNiArNDg1LDkgQEAgc3RydWN0IGFtZGdwdV9j
c19wYXJzZXIgew0KPj4+ICAgCXVpbnQ2NF90CQkJYnl0ZXNfbW92ZWQ7DQo+Pj4gICAJdWludDY0
X3QJCQlieXRlc19tb3ZlZF92aXM7DQo+Pj4NCj4+PiArCS8qIHNlY3VyZSBjcyAqLw0KPj4+ICsJ
Ym9vbAkJCQlpc19zZWN1cmU7DQo+Pj4gKw0KPj4+ICAgCS8qIHVzZXIgZmVuY2UgKi8NCj4+PiAg
IAlzdHJ1Y3QgYW1kZ3B1X2JvX2xpc3RfZW50cnkJdWZfZW50cnk7DQo+Pj4NCj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMNCj4+PiBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jDQo+Pj4gaW5kZXggNTFmM2RiMC4uOTAz
OGRjMSAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Y3MuYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jDQo+
Pj4gQEAgLTEzMyw2ICsxMzMsMTQgQEAgc3RhdGljIGludCBhbWRncHVfY3NfcGFyc2VyX2luaXQo
c3RydWN0DQo+PiBhbWRncHVfY3NfcGFyc2VyICpwLCB1bmlvbiBkcm1fYW1kZ3B1X2NzDQo+Pj4g
ICAJCWdvdG8gZnJlZV9jaHVuazsNCj4+PiAgIAl9DQo+Pj4NCj4+PiArCS8qKg0KDQpOQUsgdG8g
ZG91YmxlLXN0YXJzIGZsYWctcG9sZSB0b3AgaGVyZS0tdGhpcyBpcyBOT1QgYSBmdW5jdGlvbiBj
b21tZW50Lg0KU2luY2UgeW91IGRvIGhhdmUgYW4gZW1wdHkgbGluZSBpbW1lZGlhdGVseSBCRUZP
UkUgdGhpcyBjb21tZW50LA0KdGhlbiB5b3UgZG8gbm90IG5lZWQgdGhlIGZsYWctcG9sZSB0b3Ag
Ii8qIiB0byBhZGQgeWV0IGFub3RoZXINCnNlbWktZW1wdHkgbGluZS4gSnVzdCBzdGFydCB5b3Vy
IGNvbW1lbnQgbm9ybWFsbHk6DQoNCi8qIFRoZSBjb21tYW5kIHN1Ym1pc3Npb24gLi4uDQogKg0K
Li4uDQogKi8NCnAtPmlzX3NlY3VyZSA9IC4uLg0KDQpSZWdhcmRzLA0KTHViZW4NCg0KPj4+ICsJ
ICogVGhlIGNvbW1hbmQgc3VibWlzc2lvbiAoY3MpIGlzIGEgdW5pb24sIHNvIGFuIGFzc2lnbm1l
bnQgdG8NCj4+PiArCSAqICdvdXQnIGlzIGRlc3RydWN0aXZlIHRvIHRoZSBjcyAoYXQgbGVhc3Qg
dGhlIGZpcnN0IDgNCj4+PiArCSAqIGJ5dGVzKS4gRm9yIHRoaXMgcmVhc29uLCBpbnF1aXJlIGFi
b3V0IHRoZSBmbGFncyBiZWZvcmUgdGhlDQo+Pj4gKwkgKiBhc3NpZ25tZW50IHRvICdvdXQnLg0K
Pj4+ICsJICovDQo+Pj4gKwlwLT5pc19zZWN1cmUgPSBjcy0+aW4uZmxhZ3MgJiBBTURHUFVfQ1Nf
RkxBR1NfU0VDVVJFOw0KPj4+ICsNCj4+PiAgIAkvKiBnZXQgY2h1bmtzICovDQo+Pj4gICAJY2h1
bmtfYXJyYXlfdXNlciA9IHU2NF90b191c2VyX3B0cihjcy0+aW4uY2h1bmtzKTsNCj4+PiAgIAlp
ZiAoY29weV9mcm9tX3VzZXIoY2h1bmtfYXJyYXksIGNodW5rX2FycmF5X3VzZXIsIEBAIC0xMjUy
LDgNCj4+PiArMTI2MCw5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX3N1Ym1pdChzdHJ1Y3QgYW1k
Z3B1X2NzX3BhcnNlciAqcCwNCj4+PiAgIAkJcC0+Y3R4LT5wcmVhbWJsZV9wcmVzZW50ZWQgPSB0
cnVlOw0KPj4+ICAgCX0NCj4+Pg0KPj4+IC0JY3MtPm91dC5oYW5kbGUgPSBzZXE7DQo+Pj4gKwlq
b2ItPnNlY3VyZSA9IHAtPmlzX3NlY3VyZTsNCj4+PiAgIAlqb2ItPnVmX3NlcXVlbmNlID0gc2Vx
Ow0KPj4+ICsJY3MtPm91dC5oYW5kbGUgPSBzZXE7DQo+Pg0KPj4gQXQgbGVhc3QgaXQgaXMgbm8g
bG9uZ2VyIGFjY2Vzc2luZyBjcy0+aW4sIGJ1dCB0aGF0IHN0aWxsIGxvb2tzIGxpa2UgdGhlIHdy
b25nIHBsYWNlDQo+PiB0byBpbml0aWFsaXplIHRoZSBqb2IuDQo+Pg0KPj4gV2h5IGNhbid0IHdl
IGZpbGwgdGhhdCBpbiBkaXJlY3RseSBhZnRlciBhbWRncHVfam9iX2FsbG9jKCkgPw0KPiANCj4g
VGhlcmUgaXMgbm90IGlucHV0IG1lbWJlciB0aGF0IGlzIHNlY3VyZSByZWxhdGVkIGluIGFtZGdw
dV9qb2JfYWxsb2MoKSBleGNlcHQgYWRkIGFuIG9uZToNCj4gIA0KPiBhbWRncHVfam9iX2FsbG9j
KGFkZXYsIG51bV9pYnMsIGpvYiwgdm0sIHNlY3VyZSkNCj4gDQo+IEl0IGxvb2tzIHRvbyBtdWNo
LCBpc24ndCBpdD8NCj4gDQo+IFRoYW5rcywNCj4gUmF5DQo+IA0KPj4NCj4+IFJlZ2FyZHMsDQo+
PiBDaHJpc3RpYW4uDQo+Pg0KPj4+DQo+Pj4gICAJYW1kZ3B1X2pvYl9mcmVlX3Jlc291cmNlcyhq
b2IpOw0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9pYi5jDQo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYw0K
Pj4+IGluZGV4IGUxZGMyMjkuLmNiOWI2NTAgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfaWIuYw0KPj4+IEBAIC0yMTAsNyArMjEwLDcgQEAgaW50IGFtZGdwdV9p
Yl9zY2hlZHVsZShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsDQo+PiB1bnNpZ25lZCBudW1faWJz
LA0KPj4+ICAgCWlmIChqb2IgJiYgcmluZy0+ZnVuY3MtPmVtaXRfY250eGNudGwpIHsNCj4+PiAg
IAkJc3RhdHVzIHw9IGpvYi0+cHJlYW1ibGVfc3RhdHVzOw0KPj4+ICAgCQlzdGF0dXMgfD0gam9i
LT5wcmVlbXB0aW9uX3N0YXR1czsNCj4+PiAtCQlhbWRncHVfcmluZ19lbWl0X2NudHhjbnRsKHJp
bmcsIHN0YXR1cywgZmFsc2UpOw0KPj4+ICsJCWFtZGdwdV9yaW5nX2VtaXRfY250eGNudGwocmlu
Zywgc3RhdHVzLCBqb2ItPnNlY3VyZSk7DQo+Pj4gICAJfQ0KPj4+DQo+Pj4gICAJZm9yIChpID0g
MDsgaSA8IG51bV9pYnM7ICsraSkgew0KPj4+IEBAIC0yMjksNyArMjI5LDcgQEAgaW50IGFtZGdw
dV9pYl9zY2hlZHVsZShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsDQo+PiB1bnNpZ25lZCBudW1f
aWJzLA0KPj4+ICAgCX0NCj4+Pg0KPj4+ICAgCWlmIChyaW5nLT5mdW5jcy0+ZW1pdF90bXopDQo+
Pj4gLQkJYW1kZ3B1X3JpbmdfZW1pdF90bXoocmluZywgZmFsc2UsIGZhbHNlKTsNCj4+PiArCQlh
bWRncHVfcmluZ19lbWl0X3RteihyaW5nLCBmYWxzZSwgam9iID8gam9iLT5zZWN1cmUgOiBmYWxz
ZSk7DQo+Pj4NCj4+PiAgICNpZmRlZiBDT05GSUdfWDg2XzY0DQo+Pj4gICAJaWYgKCEoYWRldi0+
ZmxhZ3MgJiBBTURfSVNfQVBVKSkNCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2pvYi5oDQo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfam9iLmgNCj4+PiBpbmRleCBkYzdlZTkzLi5hYTBlMzc1IDEwMDY0NA0KPj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuaA0KPj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuaA0KPj4+IEBAIC02Myw2ICs2Myw4IEBA
IHN0cnVjdCBhbWRncHVfam9iIHsNCj4+PiAgIAl1aW50NjRfdAkJdWZfYWRkcjsNCj4+PiAgIAl1
aW50NjRfdAkJdWZfc2VxdWVuY2U7DQo+Pj4NCj4+PiArCS8qIHRoZSBqb2IgaXMgZHVlIHRvIGEg
c2VjdXJlIGNvbW1hbmQgc3VibWlzc2lvbiAqLw0KPj4+ICsJYm9vbAkJCXNlY3VyZTsNCj4+PiAg
IH07DQo+Pj4NCj4+PiAgIGludCBhbWRncHVfam9iX2FsbG9jKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LCB1bnNpZ25lZCBudW1faWJzLA0KPiANCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
