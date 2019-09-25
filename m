Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34195BE627
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 22:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34F76F8A0;
	Wed, 25 Sep 2019 20:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9810A6F905
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 20:09:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hn5djgXCBCsjao9c4ZmdUJ44q3YKzsWnY8yNasIXOLh54tiszabggJT0sBq1Y7p1WzisS+NJ216kWcukSsL3sh+y+j1rPVcWTf9nvckYLlYPsc8V159q//uMb3snDIBO/5ebSTG6ST9X6ks6A1pZQXvSBl53KcuDZYwiqHjZvbm5h2yfjbekdCbjHXtk4gqF+w18buaPkHPRlX2x27UYivPgsyicWUykZRCVuAJbrsZ5CEaTS9BJERE/wBdvyD8ugE5ocJDfXjizhowziZYro5Y26ZEZtNBiGya+pnmVDRcsnk/pz/dvbr8+q0LwyqShndUbuYiFHHSMKzhFhko5JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYmJaw8xVT23ir3A4Qorg6Q3JOkAuqMaTqyUXGO/kPY=;
 b=RwFknmbfYrM9zI9zlY+uIt9eNcV0PTmKva5+goPTdyzFR7NMgFF2yMqnCDMfJZWbYv5J/a/uX2+KGds8ErXBdaY+tV+M4wTrRBmEfj1n3LSTFo0vomkffOYKk9PRjNdNCpC95JftBMZQPLzuQVBj6RaIvttsRU2Bu4n3ySlE2phQ8hf7nq6L+mDg17JajiReyHoVEE1Dj89YAhLSVGhJZsPHX/9DaZb7pEDPn36CUUTH/VnWUSp1bLm9MJqSpj+MXRPBdEGbMFVF4LKDpAun074O1agoAhrLxIOKF85Gn5BkhZe/H3ML3Lt7AMhweyhzdgWcNQNvC5XjtJdzidQ6RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1950.namprd12.prod.outlook.com (10.175.54.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 20:09:43 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0%11]) with mapi id 15.20.2284.023; Wed, 25 Sep
 2019 20:09:43 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Steven Price <steven.price@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm: Don't free jobs in wait_event_interruptible()
Thread-Topic: [PATCH] drm: Don't free jobs in wait_event_interruptible()
Thread-Index: AQHVc7PzYTddskm3okCDHaLelWCdUqc8STCAgABEL4D//77WgIAAhrYA
Date: Wed, 25 Sep 2019 20:09:43 +0000
Message-ID: <e160d9ec-5ae3-9003-b38c-3027bce736f4@amd.com>
References: <20190925151404.23222-1-steven.price@arm.com>
 <cc0b260c-059d-7f55-288e-c48f30eb84e3@amd.com>
 <078332cf-ef58-5f76-5c49-8034435f7bea@arm.com>
 <da04cf92-f4c7-e896-5070-4d2a9be273aa@amd.com>
In-Reply-To: <da04cf92-f4c7-e896-5070-4d2a9be273aa@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::47) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27277877-dc82-48ce-d332-08d741f44dc7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR12MB1950; 
x-ms-traffictypediagnostic: MWHPR12MB1950:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1950C150335E32750A501B0CEA870@MWHPR12MB1950.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(199004)(189003)(316002)(14444005)(110136005)(256004)(486006)(446003)(2616005)(476003)(11346002)(6506007)(386003)(36756003)(25786009)(3846002)(6116002)(186003)(99286004)(102836004)(53546011)(478600001)(66476007)(52116002)(6636002)(2906002)(76176011)(14454004)(6246003)(71190400001)(71200400001)(6486002)(26005)(66556008)(64756008)(66446008)(66946007)(7736002)(305945005)(229853002)(54906003)(66066001)(8676002)(81156014)(81166006)(31696002)(6512007)(8936002)(6436002)(5660300002)(31686004)(4326008)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1950;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uvx3vp9HCqhYkG2ppZ9MA0ezr3tglZy3dk+qK+3wESmpBQAwRFK9nElSj6F6PPexiM4+huPZ8pyFJiyUYlDVIGThD5ovJAassoh2ygUJlCnm5sZNRAsGnefr87C8MEWMgqxDmSNcQOmCyV+jJ813YFZbhSveLNrfFhfWSc2zjYBl4o85BWZCLz2yJP233ZNcNafQwBRA58+RmVK/vPpZldEkwn2xBZ75Sr75khY98v0i5gCemAm3HkfBZKX5aiDmIQ+ER1rynACuZWiJFdj8jguLQeoqhNQMNwiHeRmaK7AruzkJJpbcVjV3g9n8BQbxrFJnFU29xuEOFdOdF+S0B1Pjc0zOfHuMExs4TjXhizZRjpEc6vJCTvlfH2PVsJD7C1JbHI217sqbFpQDgKD26v/yALVN3Hrttyk4Ehi8f/c=
Content-ID: <F0D30E2F252A254FB508C2681820F291@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27277877-dc82-48ce-d332-08d741f44dc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 20:09:43.1860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E3XsUOuhmi7a+9gQegcDAATfXxfTeQKj+pDrIhWVObOmiZmhzMPfvXC9g23AIl2raBVmAkvpk26YrgqixSjDug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1950
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYmJaw8xVT23ir3A4Qorg6Q3JOkAuqMaTqyUXGO/kPY=;
 b=V4tOxJ2n6XMQ1o+Jw7L1KhoUOUtqgDvgqZiW27PJRLB4RL1XZwxgZLx13YT3zsdwkiq6rQ9NcI9vwtbyNgvw8Jf+YwcTcjYn/kyKZsDPILAkBk0BusyfCYswZR51NU+gUPDSC3lvz4IATfSCZjnOjB8EspGHgUxdW3VarzxqjlU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Nayan Deshmukh <nayan26deshmukh@gmail.com>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiA5LzI1LzE5IDEyOjA3IFBNLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToNCj4gT24gOS8y
NS8xOSAxMjowMCBQTSwgU3RldmVuIFByaWNlIHdyb3RlOg0KPg0KPj4gT24gMjUvMDkvMjAxOSAx
Njo1NiwgR3JvZHpvdnNreSwgQW5kcmV5IHdyb3RlOg0KPj4+IE9uIDkvMjUvMTkgMTE6MTQgQU0s
IFN0ZXZlbiBQcmljZSB3cm90ZToNCj4+Pg0KPj4+PiBkcm1fc2NoZWRfY2xlYW51cF9qb2JzKCkg
YXR0ZW1wdHMgdG8gZnJlZSBmaW5pc2hlZCBqb2JzLCBob3dldmVyIA0KPj4+PiBiZWNhdXNlDQo+
Pj4+IGl0IGlzIGNhbGxlZCBhcyB0aGUgY29uZGl0aW9uIG9mIHdhaXRfZXZlbnRfaW50ZXJydXB0
aWJsZSgpIGl0IG11c3QgDQo+Pj4+IG5vdA0KPj4+PiBzbGVlcC4gVW5mb3J0dW5hdGVseSBzb21l
IGZyZWUgY2FsbGJhY2tzIChub3RhYmx5IGZvciBQYW5mcm9zdCkgZG8gDQo+Pj4+IHNsZWVwLg0K
Pj4+Pg0KPj4+PiBJbnN0ZWFkIGxldCdzIHJlbmFtZSBkcm1fc2NoZWRfY2xlYW51cF9qb2JzKCkg
dG8NCj4+Pj4gZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYigpIGFuZCBzaW1wbHkgcmV0dXJuIGEg
am9iIGZvciBwcm9jZXNzaW5nIGlmDQo+Pj4+IHRoZXJlIGlzIG9uZS4gVGhlIGNhbGxlciBjYW4g
dGhlbiBjYWxsIHRoZSBmcmVlX2pvYigpIGNhbGxiYWNrIG91dHNpZGUNCj4+Pj4gdGhlIHdhaXRf
ZXZlbnRfaW50ZXJydXB0aWJsZSgpIHdoZXJlIHNsZWVwaW5nIGlzIHBvc3NpYmxlIGJlZm9yZQ0K
Pj4+PiByZS1jaGVja2luZyBhbmQgcmV0dXJuaW5nIHRvIHNsZWVwIGlmIG5lY2Vzc2FyeS4NCj4+
Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNv
bT4NCj4+Pj4gLS0tDQo+Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9t
YWluLmMgfCA0NCANCj4+Pj4gKysrKysrKysrKysrKystLS0tLS0tLS0tLS0NCj4+Pj4gwqDCoCAx
IGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pDQo+Pj4+DQo+
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyAN
Cj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPj4+PiBpbmRl
eCA5YTBlZTc0ZDgyZGMuLjBlZDRhYWE0ZTZkMSAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4+Pj4gQEAgLTYyMiw0MyArNjIyLDQxIEBAIHN0YXRp
YyB2b2lkIGRybV9zY2hlZF9wcm9jZXNzX2pvYihzdHJ1Y3QgDQo+Pj4+IGRtYV9mZW5jZSAqZiwg
c3RydWN0IGRtYV9mZW5jZV9jYiAqY2IpDQo+Pj4+IMKgwqAgfQ0KPj4+PiDCoMKgIMKgwqAgLyoq
DQo+Pj4+IC0gKiBkcm1fc2NoZWRfY2xlYW51cF9qb2JzIC0gZGVzdHJveSBmaW5pc2hlZCBqb2Jz
DQo+Pj4+ICsgKiBkcm1fc2NoZWRfZ2V0X2NsZWFudXBfam9iIC0gZmV0Y2ggdGhlIG5leHQgZmlu
aXNoZWQgam9iIHRvIGJlIA0KPj4+PiBkZXN0cm95ZWQNCj4+Pj4gwqDCoMKgICoNCj4+Pj4gwqDC
oMKgICogQHNjaGVkOiBzY2hlZHVsZXIgaW5zdGFuY2UNCj4+Pj4gwqDCoMKgICoNCj4+Pj4gLSAq
IFJlbW92ZSBhbGwgZmluaXNoZWQgam9icyBmcm9tIHRoZSBtaXJyb3IgbGlzdCBhbmQgZGVzdHJv
eSB0aGVtLg0KPj4+PiArICogUmV0dXJucyB0aGUgbmV4dCBmaW5pc2hlZCBqb2IgZnJvbSB0aGUg
bWlycm9yIGxpc3QgKGlmIHRoZXJlIGlzIA0KPj4+PiBvbmUpDQo+Pj4+ICsgKiByZWFkeSBmb3Ig
aXQgdG8gYmUgZGVzdHJveWVkLg0KPj4+PiDCoMKgwqAgKi8NCj4+Pj4gLXN0YXRpYyB2b2lkIGRy
bV9zY2hlZF9jbGVhbnVwX2pvYnMoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCkNCj4+
Pj4gK3N0YXRpYyBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqDQo+Pj4+ICtkcm1fc2NoZWRfZ2V0X2Ns
ZWFudXBfam9iKHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpDQo+Pj4+IMKgwqAgew0K
Pj4+PiArwqDCoMKgIHN0cnVjdCBkcm1fc2NoZWRfam9iICpqb2IgPSBOVUxMOw0KPj4+PiDCoMKg
wqDCoMKgwqAgdW5zaWduZWQgbG9uZyBmbGFnczsNCj4+Pj4gwqDCoCDCoMKgwqDCoMKgwqAgLyog
RG9uJ3QgZGVzdHJveSBqb2JzIHdoaWxlIHRoZSB0aW1lb3V0IHdvcmtlciBpcyBydW5uaW5nICov
DQo+Pj4+IMKgwqDCoMKgwqDCoCBpZiAoc2NoZWQtPnRpbWVvdXQgIT0gTUFYX1NDSEVEVUxFX1RJ
TUVPVVQgJiYNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgIWNhbmNlbF9kZWxheWVkX3dvcmso
JnNjaGVkLT53b3JrX3RkcikpDQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm47DQo+Pj4+IC0N
Cj4+Pj4gLQ0KPj4+PiAtwqDCoMKgIHdoaWxlICghbGlzdF9lbXB0eSgmc2NoZWQtPnJpbmdfbWly
cm9yX2xpc3QpKSB7DQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAq
am9iOw0KPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIE5VTEw7DQo+Pj4+IMKgwqAgLcKgwqDC
oMKgwqDCoMKgIGpvYiA9IGxpc3RfZmlyc3RfZW50cnkoJnNjaGVkLT5yaW5nX21pcnJvcl9saXN0
LA0KPj4+PiArwqDCoMKgIGpvYiA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmc2NoZWQtPnJp
bmdfbWlycm9yX2xpc3QsDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fc2NoZWRfam9iLCBub2RlKTsNCj4+Pj4gLcKgwqDC
oMKgwqDCoMKgIGlmICghZG1hX2ZlbmNlX2lzX3NpZ25hbGVkKCZqb2ItPnNfZmVuY2UtPmZpbmlz
aGVkKSkNCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+Pj4+IMKgwqAgLcKg
wqDCoMKgwqDCoMKgIHNwaW5fbG9ja19pcnFzYXZlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxh
Z3MpOw0KPj4+PiArwqDCoMKgIHNwaW5fbG9ja19pcnFzYXZlKCZzY2hlZC0+am9iX2xpc3RfbG9j
aywgZmxhZ3MpOw0KPj4+PiArDQo+Pj4+ICvCoMKgwqAgaWYgKGpvYiAmJiBkbWFfZmVuY2VfaXNf
c2lnbmFsZWQoJmpvYi0+c19mZW5jZS0+ZmluaXNoZWQpKSB7DQo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC8qIHJlbW92ZSBqb2IgZnJvbSByaW5nX21pcnJvcl9saXN0ICovDQo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGxpc3RfZGVsX2luaXQoJmpvYi0+bm9kZSk7DQo+Pj4+IC0gc3Bpbl91
bmxvY2tfaXJxcmVzdG9yZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4+Pj4gLQ0K
Pj4+PiAtwqDCoMKgwqDCoMKgwqAgc2NoZWQtPm9wcy0+ZnJlZV9qb2Ioam9iKTsNCj4+Pj4gK8Kg
wqDCoCB9IGVsc2Ugew0KPj4+PiArwqDCoMKgwqDCoMKgwqAgam9iID0gTlVMTDsNCj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIC8qIHF1ZXVlIHRpbWVvdXQgZm9yIG5leHQgam9iICovDQo+Pj4+ICvCoMKg
wqDCoMKgwqDCoCBkcm1fc2NoZWRfc3RhcnRfdGltZW91dChzY2hlZCk7DQo+Pj4+IMKgwqDCoMKg
wqDCoCB9DQo+Pj4+IMKgwqAgLcKgwqDCoCAvKiBxdWV1ZSB0aW1lb3V0IGZvciBuZXh0IGpvYiAq
Lw0KPj4+PiAtwqDCoMKgIHNwaW5fbG9ja19pcnFzYXZlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywg
ZmxhZ3MpOw0KPj4+PiAtwqDCoMKgIGRybV9zY2hlZF9zdGFydF90aW1lb3V0KHNjaGVkKTsNCj4+
Pj4gwqDCoMKgwqDCoMKgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnNjaGVkLT5qb2JfbGlzdF9s
b2NrLCBmbGFncyk7DQo+Pj4+IMKgwqAgK8KgwqDCoCByZXR1cm4gam9iOw0KPj4+PiDCoMKgIH0N
Cj4+Pj4gwqDCoCDCoMKgIC8qKg0KPj4+PiBAQCAtNjk4LDEyICs2OTYsMTggQEAgc3RhdGljIGlu
dCBkcm1fc2NoZWRfbWFpbih2b2lkICpwYXJhbSkNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3RydWN0IGRybV9zY2hlZF9mZW5jZSAqc19mZW5jZTsNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pvYjsNCj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IGRtYV9mZW5jZSAqZmVuY2U7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1
Y3QgZHJtX3NjaGVkX2pvYiAqY2xlYW51cF9qb2IgPSBOVUxMOw0KPj4+PiB3YWl0X2V2ZW50X2lu
dGVycnVwdGlibGUoc2NoZWQtPndha2VfdXBfd29ya2VyLA0KPj4+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoZHJtX3NjaGVkX2NsZWFudXBfam9icyhzY2hlZCks
DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChjbGVhbnVw
X2pvYiA9IA0KPj4+PiBkcm1fc2NoZWRfZ2V0X2NsZWFudXBfam9iKHNjaGVkKSkgfHwNCj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoIWRybV9zY2hl
ZF9ibG9ja2VkKHNjaGVkKSAmJg0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKGVudGl0eSA9IGRybV9zY2hlZF9zZWxlY3RfZW50aXR5KHNjaGVk
KSkpIHx8DQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGt0
aHJlYWRfc2hvdWxkX3N0b3AoKSkpOw0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBrdGhyZWFkX3Nob3VsZF9zdG9wKCkpOw0KPj4+DQo+Pj4gQ2FuJ3Qgd2Ug
anVzdCBjYWxsIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMgcmlnaHQgaGVyZSwgcmVtb3ZlIGFsbCB0
aGUNCj4+PiBjb25kaXRpb25zIGluIHdhaXRfZXZlbnRfaW50ZXJydXB0aWJsZSAobWFrZSBpdCBh
bHdheXMgdHJ1ZSkgYW5kIGFmdGVyDQo+Pj4gZHJtX3NjaGVkX2NsZWFudXBfam9icyBpcyBjYWxs
ZWQgdGVzdCBmb3IgYWxsIHRob3NlIGNvbmRpdGlvbnMgYW5kDQo+Pj4gcmV0dXJuIHRvIHNsZWVw
IGlmIHRoZXkgZXZhbHVhdGUgdG8gZmFsc2UgPyBkcm1fc2NoZWRfY2xlYW51cF9qb2JzIGlzDQo+
Pj4gY2FsbGVkIHVuY29uZGl0aW9uYWxseSBpbnNpZGUgd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxl
IGFueXdheS4uLiANCj4+PiBUaGlzIGlzDQo+Pj4gbW9yZSBvZiBhIHF1ZXN0aW9uIHRvIENocmlz
dGlhbi4NCj4+IENocmlzdGlhbiBtYXkga25vdyBiZXR0ZXIgdGhhbiBtZSwgYnV0IEkgdGhpbmsg
dGhvc2UgY29uZGl0aW9ucyBuZWVkIHRvDQo+PiBiZSBpbiB3YWl0X2V2ZW50X2ludGVycnVwdGli
bGUoKSB0byBhdm9pZCByYWNlIGNvbmRpdGlvbnMuIElmIHdlIHNpbXBseQ0KPj4gcmVwbGFjZSBh
bGwgdGhlIGNvbmRpdGlvbnMgd2l0aCBhIGxpdGVyYWwgInRydWUiIHRoZW4NCj4+IHdhaXRfZXZl
bnRfaW50ZXJydXB0aWJsZSgpIHdpbGwgbmV2ZXIgYWN0dWFsbHkgc2xlZXAuDQo+Pg0KPj4gU3Rl
dmUNCj4NCj4gWWVzIHlvdSByaWdodCwgaXQgd29uJ3Qgd29yayBhcyBJIG1pc3NlZCB0aGF0IGNv
bmRpdGlvbiBpcyBldmFsdWF0ZWQgDQo+IGFzIGZpcnN0IHN0ZXAgaW4gd2FpdF9ldmVudF9pbnRl
cnJ1cHRpYmxlIGJlZm9yZSBpdCBzbGVlcHMuDQo+DQo+IEFuZHJleQ0KDQpBbm90aGVyIGlkZWHC
oCAtIHdoYXQgYWJvdXQgc3RpbGwganVzdCByZWxvY2F0aW5nIGRybV9zY2hlZF9jbGVhbnVwX2pv
YnMgDQp0byBhZnRlciB3YWl0X2V2ZW50X2ludGVycnVwdGlibGUgYW5kIGFsc28gY2FsbCBpdCBp
biBkcm1fc2NoZWRfZmluaSBzb8KgIA0KZm9yIHRoZSBjYXNlIHdoZW4gaXQgd2lsbCBub3QgYmUg
Y2FsbGVkIGZyb20gZHJtX3NjaGVkX21haW4gZHVlIHRvIA0KY29uZGl0aW9ucyBub3QgZXZhbHVh
dGluZyB0byB0cnVlwqAgaXQgZXZlbnR1YWxseSBiZSBjYWxsZWQgbGFzdCB0aW1lIA0KZnJvbSBk
cm1fc2NoZWRfZmluaS4gSSBtZWFuIC0gdGhlIHJlZmFjdG9yIGxvb2tzIG9rIHRvIG1lIGJ1dCB0
aGUgY29kZSANCmJlY29tZXPCoCBzb21ld2hhdCBjb25mdXNpbmcgdGhpcyB3YXkgdG8gZ3Jhc3Au
DQoNCkFuZHJleQ0KDQoNCj4NCj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
