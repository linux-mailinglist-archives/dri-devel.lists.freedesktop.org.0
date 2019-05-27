Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9AF2B271
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 12:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6FE897E8;
	Mon, 27 May 2019 10:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790081.outbound.protection.outlook.com [40.107.79.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66871897DC;
 Mon, 27 May 2019 10:51:08 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1177.namprd12.prod.outlook.com (10.168.233.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Mon, 27 May 2019 10:51:06 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1922.021; Mon, 27 May 2019
 10:51:06 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Olsak, Marek"
 <Marek.Olsak@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, "Liang, 
 Prike" <Prike.Liang@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 10/10] drm/amdgpu: stop removing BOs from the LRU v3
Thread-Topic: [PATCH 10/10] drm/amdgpu: stop removing BOs from the LRU v3
Thread-Index: AQHVEJ5PVJOlljYSqkWgdeehlfe9hKZ3i/CAgADgjgCAAmMlAIAEA0OA
Date: Mon, 27 May 2019 10:51:06 +0000
Message-ID: <198d6abf-146d-c8f8-5602-37b95cd6b809@amd.com>
References: <20190522125947.4592-1-christian.koenig@amd.com>
 <20190522125947.4592-10-christian.koenig@amd.com>
 <48ac98a8-de22-3549-5d63-078a0effab72@amd.com>
 <eea6245e-616d-eb16-8521-2f21ce5d6d25@gmail.com>
 <776d29df-428f-ad98-8e38-4b191b602abb@amd.com>
In-Reply-To: <776d29df-428f-ad98-8e38-4b191b602abb@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM5PR0202CA0011.eurprd02.prod.outlook.com
 (2603:10a6:203:69::21) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bbeba04-fcf1-481e-ce6c-08d6e291384f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1177; 
x-ms-traffictypediagnostic: DM5PR12MB1177:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB117761D65D2ED3F24500C6E5831D0@DM5PR12MB1177.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0050CEFE70
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(2616005)(486006)(478600001)(72206003)(36756003)(8936002)(6436002)(46003)(6486002)(446003)(53936002)(14444005)(86362001)(81166006)(81156014)(476003)(71190400001)(2201001)(8676002)(52116002)(6246003)(71200400001)(2906002)(6116002)(76176011)(58126008)(31696002)(256004)(110136005)(25786009)(99286004)(966005)(14454004)(11346002)(186003)(66556008)(66476007)(66574012)(66446008)(64756008)(73956011)(65956001)(66946007)(65806001)(450100002)(316002)(64126003)(5660300002)(386003)(53546011)(305945005)(6506007)(7736002)(31686004)(102836004)(6512007)(229853002)(68736007)(6306002)(65826007)(2501003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1177;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lOC2MhsJ1xbNiU7q9B0E4jW16sKREJ1zSLZUbNClSz7AK6KC2LZdQPHsOIm5iHbtlIVPwFIVWkryTzQqLK7wa3MUUDKrO/aZB9jSRW3WUgpbqQ2Y8Cjvh9GMfGuAQuN24maR5MUU70up5fPCkjti1OjL4xmoMevjZ65O9rcYkQmbBnzZIRQa+J4/3q4r97LfKS30R32bntdP7F46sA7oDFyuRR0IessQLXu08Zq/DTY79wXKXUlZ6XI9XDonHElvuz1rUArfa2YZE8Xp4w0hoxpRZ3deGEgIft5xDLuy9DS1U6S2wo7U/GENGBULvuFHl1YI/XmfarPhyQJdRyfzOrYsKGR3UmjgUVkGjnqrNL8fhR2ZABLpDVdf+fWs76PJo6gzdEutK63qZnJ8hzwtiOKlQXuVIZE+43ltFl/3sG0=
Content-ID: <B9CEE9B171A45947942F93B6DBDEBDE1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbeba04-fcf1-481e-ce6c-08d6e291384f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2019 10:51:06.5936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1177
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6ec7BDxttcTPLrSYJGaaHV5lQ8vfv/xqcdZxJwbFbc=;
 b=yACh5pC9fVru5o4D/4gOZ1gu0go8kh86G5KavnB2C3qHYmHobaqgNY6xBfIDiReLvqjYlixhH30jL/q/jI4kWeidECgPF5KehqmyW9nVQrAEApnu9twWcpXxgeZBjdYClEVbcalscvqQj14zy7s90H0/uwzrWNG2ynbYoH6rzrU=
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

QW0gMjQuMDUuMTkgdW0gMjM6MzQgc2NocmllYiBLdWVobGluZywgRmVsaXg6DQo+IE9uIDIwMTkt
MDUtMjMgNTowNiBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPj4gW0NBVVRJT046IEV4
dGVybmFsIEVtYWlsXQ0KPj4NCj4+IExlYXZpbmcgQk9zIG9uIHRoZSBMUlUgaXMgaGFybWxlc3Mu
IFdlIGFsd2F5cyBkaWQgdGhpcyBmb3IgVk0gcGFnZSB0YWJsZQ0KPj4gYW5kIHBlciBWTSBCT3Mu
DQo+Pg0KPj4gVGhlIGtleSBwb2ludCBpcyB0aGF0IEJPcyB3aGljaCBjb3VsZG4ndCBiZSByZXNl
cnZlZCBjYW4ndCBiZSBldmljdGVkLg0KPj4gU28gd2hhdCBoYXBwZW5lZCBpcyB0aGF0IGFuIGFw
cGxpY2F0aW9uIHVzZWQgYmFzaWNhbGx5IGFsbCBvZiBWUkFNDQo+PiBkdXJpbmcgQ1MgYW5kIGJl
Y2F1c2Ugb2YgdGhpcyBYIHNlcnZlciBjb3VsZG4ndCBwaW4gYSBCTyBmb3Igc2Nhbm91dC4NCj4+
DQo+PiBOb3cgd2Uga2VlcCB0aGUgQk9zIG9uIHRoZSBMUlUgYW5kIG1vZGlmeSBUVE0gdG8gYmxv
Y2sgZm9yIHRoZSBDUyB0bw0KPj4gY29tcGxldGUsIHdoaWNoIGluIHR1cm4gYWxsb3dzIHRoZSBY
IHNlcnZlciB0byBwaW4gaXRzIEJPIGZvciBzY2Fub3V0Lg0KPg0KPiBPSywgbGV0IG1lIHJlcGhy
YXNlIHRoYXQgdG8gbWFrZSBzdXJlIEkgdW5kZXJzdGFuZCBpdCBjb3JyZWN0bHkuIEkgdGhpbmsN
Cj4gdGhlIHBvaW50IGlzIHRoYXQgZXZpY3Rpb24gY2FuZGlkYXRlcyBjb21lIGZyb20gYW4gTFJV
IGxpc3QsIHNvIGxlYXZpbmcNCj4gdGhpbmdzIG9uIHRoZSBMUlUgbWFrZXMgbW9yZSBCT3MgYXZh
aWxhYmxlIGZvciBldmljdGlvbiBhbmQgYXZvaWRzIE9PTQ0KPiBzaXR1YXRpb25zLiBUbyB0YWtl
IGFkdmFudGFnZSBvZiB0aGF0LCBwYXRjaCA2IGFkZHMgdGhlIGFiaWxpdHkgdG8gd2FpdA0KPiBm
b3IgcmVzZXJ2ZWQgQk9zIHdoZW4gdGhlcmUgaXMgbm90aGluZyBlYXNpZXIgdG8gZXZpY3QuDQo+
DQo+IFJPQ20gYXBwbGljYXRpb25zIGxpa2UgdG8gdXNlIGxvdHMgb2YgbWVtb3J5LiBTbyBpdCBw
cm9iYWJseSBtYWtlcyBzZW5zZQ0KPiBmb3IgdXMgdG8gc3RvcCByZW1vdmluZyBvdXIgQk9zIGZy
b20gdGhlIExSVSBhcyB3ZWxsIHdoaWxlIHdlDQo+IG1hc3MtdmFsaWRhdGUgb3VyIEJPcyBpbiBh
bWRncHVfYW1ka2ZkX2dwdXZtX3Jlc3RvcmVfcHJvY2Vzc19ib3MuDQoNCldlbGwgdGhhdCB3b3Vs
ZCBhbGxvdyBjb25jdXJyZW50IGNhbGxzIG9mIA0KYW1kZ3B1X2FtZGtmZF9ncHV2bV9yZXN0b3Jl
X3Byb2Nlc3NfYm9zKCkgdG8gd2FpdCBmb3IgZWFjaCBvdGhlci4NCg0KSWYgdGhhdCdzIHdoYXQg
eW91IHdhbnQgdGhlbiB5ZWFoIHRoYXQgY2VydGFpbmx5IG1ha2VzIHNlbnNlLg0KDQpSZWdhcmRz
LA0KQ2hyaXN0aWFuLg0KDQo+DQo+IFJlZ2FyZHMsDQo+ICAgwqAgRmVsaXgNCj4NCj4NCj4+IENo
cmlzdGlhbi4NCj4+DQo+PiBBbSAyMi4wNS4xOSB1bSAyMTo0MyBzY2hyaWViIEt1ZWhsaW5nLCBG
ZWxpeDoNCj4+PiBDYW4geW91IGV4cGxhaW4gaG93IHRoaXMgYXZvaWRzIE9PTSBzaXR1YXRpb25z
PyBXaGVuIGlzIGl0IHNhZmUgdG8gbGVhdmUNCj4+PiBhIHJlc2VydmVkIEJPIG9uIHRoZSBMUlUg
bGlzdD8gQ291bGQgd2UgZG8gdGhlIHNhbWUgdGhpbmcgaW4NCj4+PiBhbWRncHVfYW1ka2ZkX2dw
dXZtLmM/IEFuZCBpZiB3ZSBkaWQsIHdoYXQgd291bGQgYmUgdGhlIGV4cGVjdGVkIHNpZGUNCj4+
PiBlZmZlY3RzIG9yIGNvbnNlcXVlbmNlcz8NCj4+Pg0KPj4+IFRoYW5rcywNCj4+PiAgwqDCoMKg
IEZlbGl4DQo+Pj4NCj4+PiBPbiAyMDE5LTA1LTIyIDg6NTkgYS5tLiwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToNCj4+Pj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KPj4+Pg0KPj4+PiBUaGlz
IGF2b2lkcyBPT00gc2l0dWF0aW9ucyB3aGVuIHdlIGhhdmUgbG90cyBvZiB0aHJlYWRzDQo+Pj4+
IHN1Ym1pdHRpbmcgYXQgdGhlIHNhbWUgdGltZS4NCj4+Pj4NCj4+Pj4gdjM6IGFwcGx5IHRoaXMg
dG8gdGhlIHdob2xlIGRyaXZlciwgbm90IGp1c3QgQ1MNCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPj4+PiAtLS0N
Cj4+Pj4gIMKgwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmPCoMKgwqDC
oCB8IDIgKy0NCj4+Pj4gIMKgwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Nz
YS5jwqDCoMKgIHwgMiArLQ0KPj4+PiAgwqDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZ2VtLmPCoMKgwqAgfCA0ICsrLS0NCj4+Pj4gIMKgwqAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oIHwgMiArLQ0KPj4+PiAgwqDCoCA0IGZpbGVzIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jDQo+Pj4+IGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMNCj4+Pj4gaW5kZXggMjBmMjk1NWQyYTU1
Li4zZTJkYTI0Y2QxN2EgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9jcy5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9jcy5jDQo+Pj4+IEBAIC02NDgsNyArNjQ4LDcgQEAgc3RhdGljIGludCBhbWRncHVfY3Nf
cGFyc2VyX2JvcyhzdHJ1Y3QNCj4+Pj4gYW1kZ3B1X2NzX3BhcnNlciAqcCwNCj4+Pj4gIMKgwqDC
oMKgwqDCoMKgwqDCoCB9DQo+Pj4+DQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgciA9IHR0bV9l
dV9yZXNlcnZlX2J1ZmZlcnMoJnAtPnRpY2tldCwgJnAtPnZhbGlkYXRlZCwgdHJ1ZSwNCj4+Pj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAmZHVwbGljYXRlcywgdHJ1ZSk7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmR1cGxpY2F0
ZXMsIGZhbHNlKTsNCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAodW5saWtlbHkociAhPSAw
KSkgew0KPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAociAhPSAt
RVJFU1RBUlRTWVMpDQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBEUk1fRVJST1IoInR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMNCj4+Pj4gZmFp
bGVkLlxuIik7DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfY3NhLmMNCj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3Nh
LmMNCj4+Pj4gaW5kZXggMDZmODNjYWMwZDNhLi5mNjYwNjI4ZTZhZjkgMTAwNjQ0DQo+Pj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jc2EuYw0KPj4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3NhLmMNCj4+Pj4gQEAgLTc5LDcgKzc5
LDcgQEAgaW50IGFtZGdwdV9tYXBfc3RhdGljX2NzYShzdHJ1Y3QgYW1kZ3B1X2RldmljZQ0KPj4+
PiAqYWRldiwgc3RydWN0IGFtZGdwdV92bSAqdm0sDQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAg
bGlzdF9hZGQoJmNzYV90di5oZWFkLCAmbGlzdCk7DQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAg
YW1kZ3B1X3ZtX2dldF9wZF9ibyh2bSwgJmxpc3QsICZwZCk7DQo+Pj4+DQo+Pj4+IC3CoMKgwqDC
oMKgwqAgciA9IHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMoJnRpY2tldCwgJmxpc3QsIHRydWUsIE5V
TEwsIHRydWUpOw0KPj4+PiArwqDCoMKgwqDCoMKgIHIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJz
KCZ0aWNrZXQsICZsaXN0LCB0cnVlLCBOVUxMLCBmYWxzZSk7DQo+Pj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKHIpIHsNCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
RFJNX0VSUk9SKCJmYWlsZWQgdG8gcmVzZXJ2ZSBDU0EsUEQgQk9zOg0KPj4+PiBlcnI9JWRcbiIs
IHIpOw0KPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcjsN
Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0u
Yw0KPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYw0KPj4+PiBp
bmRleCBkNTEzYTVhZDAzZGQuLmVkMjVhNGUxNDQwNCAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYw0KPj4+PiBAQCAtMTcxLDcgKzE3MSw3IEBAIHZv
aWQgYW1kZ3B1X2dlbV9vYmplY3RfY2xvc2Uoc3RydWN0DQo+Pj4+IGRybV9nZW1fb2JqZWN0ICpv
YmosDQo+Pj4+DQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgYW1kZ3B1X3ZtX2dldF9wZF9ibyh2
bSwgJmxpc3QsICZ2bV9wZCk7DQo+Pj4+DQo+Pj4+IC3CoMKgwqDCoMKgwqAgciA9IHR0bV9ldV9y
ZXNlcnZlX2J1ZmZlcnMoJnRpY2tldCwgJmxpc3QsIGZhbHNlLA0KPj4+PiAmZHVwbGljYXRlcywg
dHJ1ZSk7DQo+Pj4+ICvCoMKgwqDCoMKgwqAgciA9IHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMoJnRp
Y2tldCwgJmxpc3QsIGZhbHNlLA0KPj4+PiAmZHVwbGljYXRlcywgZmFsc2UpOw0KPj4+PiAgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIChyKSB7DQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGRldl9lcnIoYWRldi0+ZGV2LCAibGVha2luZyBibyB2YSBiZWNhdXNlICINCj4+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJ3
ZSBmYWlsIHRvIHJlc2VydmUgYm8gKCVkKVxuIiwgcik7DQo+Pj4+IEBAIC02MDgsNyArNjA4LDcg
QEAgaW50IGFtZGdwdV9nZW1fdmFfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4+Pj4g
dm9pZCAqZGF0YSwNCj4+Pj4NCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBhbWRncHVfdm1fZ2V0
X3BkX2JvKCZmcHJpdi0+dm0sICZsaXN0LCAmdm1fcGQpOw0KPj4+Pg0KPj4+PiAtwqDCoMKgwqDC
oMKgIHIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZ0aWNrZXQsICZsaXN0LCB0cnVlLA0KPj4+
PiAmZHVwbGljYXRlcywgdHJ1ZSk7DQo+Pj4+ICvCoMKgwqDCoMKgwqAgciA9IHR0bV9ldV9yZXNl
cnZlX2J1ZmZlcnMoJnRpY2tldCwgJmxpc3QsIHRydWUsDQo+Pj4+ICZkdXBsaWNhdGVzLCBmYWxz
ZSk7DQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHIpDQo+Pj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyb3JfdW5yZWY7DQo+Pj4+DQo+Pj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgNCj4+Pj4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgNCj4+Pj4gaW5kZXgg
YzQzMGU4MjU5MDM4Li5kNjA1OTNjYzQzNmUgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaA0KPj4+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgNCj4+Pj4gQEAgLTE1NSw3ICsxNTUsNyBAQCBz
dGF0aWMgaW5saW5lIGludCBhbWRncHVfYm9fcmVzZXJ2ZShzdHJ1Y3QNCj4+Pj4gYW1kZ3B1X2Jv
ICpibywgYm9vbCBub19pbnRyKQ0KPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KGJvLT50Ym8uYmRldik7DQo+Pj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqAgaW50IHI7DQo+Pj4+DQo+Pj4+IC3CoMKgwqDCoMKgwqAgciA9IHR0
bV9ib19yZXNlcnZlKCZiby0+dGJvLCAhbm9faW50ciwgZmFsc2UsIE5VTEwpOw0KPj4+PiArwqDC
oMKgwqDCoMKgIHIgPSBfX3R0bV9ib19yZXNlcnZlKCZiby0+dGJvLCAhbm9faW50ciwgZmFsc2Us
IE5VTEwpOw0KPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICh1bmxpa2VseShyICE9IDApKSB7
DQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyICE9IC1FUkVT
VEFSVFNZUykNCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGRldl9lcnIoYWRldi0+ZGV2LCAiJXAgcmVzZXJ2ZSBmYWlsZWRcbiIsDQo+Pj4+
IGJvKTsNCj4+Pj4gLS0gDQo+Pj4+IDIuMTcuMQ0KPj4+Pg0KPj4+PiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4+PiBhbWQtZ2Z4IG1haWxpbmcgbGlz
dA0KPj4+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4+PiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
