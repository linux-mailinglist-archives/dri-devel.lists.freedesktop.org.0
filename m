Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4517E4FAC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 16:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814AC6EA75;
	Fri, 25 Oct 2019 14:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750070.outbound.protection.outlook.com [40.107.75.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031656EA75;
 Fri, 25 Oct 2019 14:57:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgPVz3IYicMX/5/hvyoB/stsYXHSjE9i7XkcO9gYCkmNlZx5EGTcMmYReFa53kFzqFwXlA0m/1bkCMOVookXsd8GW7z+UoEVjRJvgvx8RtBvvSeljmNQ6z7FDIJx/R3FbM1d9d/aBYODItHIUpB8HmOgH6bMSL6AzIF2CQcGUw7je/ronNvLZrM1qvJZ0wSDNRZoLheeo7vzJvGXI56cx3+74gxf+PeJTt6b0YbBexVd56Ml67GAy1U7uRBXIlIQ9W6zLn6a7/Tz4Cc02wOCHYLYvJtSE9/Ln+LMVDLHRUetKzhbLPIt296USKypQo1MqvcGW91aoujfiBAW7OscoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyNW5uBvYmHXSJUTgH9ZZzjmilekcL5q59eecrUvda8=;
 b=k7LuC15gLRoGEwLw97kLLfRz9ILP6hEqjlmP1chCk5iO0ILjQB5MnziZ8Lt7K6OeReBLU4HGIzkHRyFZVGNeCl2IoaE/fxJDDXUPM9CT1o47hZ0GtyaASscK53xhfqtguLZ+Q5GVSArTYgTpgVA+lRk+rYISOEITc6FIT41M0ZMPJJDLrB67f1R3tAKRo25mlHL4d0reRPQLzH7zfA9jGE0tkpa+dcHXHM83KX0IgdNL9/BIf1pjXXrG6qx+Cm2m5WwlKzgvxbdcw7Ply7BoaUBmQfhSpYzFH4Rq9rk59UekBr8jFegKRBAXG02JFuH+3ozwX7Kky0ZYZnaLNy40rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1600.namprd12.prod.outlook.com (10.172.55.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Fri, 25 Oct 2019 14:57:03 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::3963:88a3:88f1:4a1d]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::3963:88a3:88f1:4a1d%4]) with mapi id 15.20.2387.023; Fri, 25 Oct 2019
 14:57:03 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/sched: Set error to s_fence if HW job submission
 failed.
Thread-Topic: [PATCH 1/2] drm/sched: Set error to s_fence if HW job submission
 failed.
Thread-Index: AQHViqVHSP5ADE+zREm+JapbWXlE4qdrC4uAgABoEgA=
Date: Fri, 25 Oct 2019 14:57:03 +0000
Message-ID: <1638959e-08ef-3a24-babc-5cbddcae0575@amd.com>
References: <1571947050-26276-1-git-send-email-andrey.grodzovsky@amd.com>
 <dbc0cddf-e1e1-fa36-df26-b784aea6dc12@gmail.com>
In-Reply-To: <dbc0cddf-e1e1-fa36-df26-b784aea6dc12@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::29) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8ea79232-622c-47e5-baa0-08d7595b983d
x-ms-traffictypediagnostic: MWHPR12MB1600:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1600290A3E90838EAEEBAFADEA650@MWHPR12MB1600.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(199004)(189003)(71200400001)(11346002)(305945005)(71190400001)(7736002)(8676002)(6436002)(5660300002)(81156014)(81166006)(229853002)(316002)(6512007)(8936002)(2201001)(31686004)(86362001)(478600001)(31696002)(256004)(66946007)(64756008)(66556008)(66476007)(186003)(4326008)(36756003)(102836004)(110136005)(99286004)(66446008)(450100002)(25786009)(53546011)(6506007)(6486002)(26005)(386003)(476003)(2501003)(2906002)(446003)(2616005)(486006)(14454004)(6116002)(52116002)(6246003)(66066001)(3846002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1600;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hJar8rLjcVk92ybkPs6NbywTmbtRFmcOMIWizrUhUlbeBk80FbWM6nsYA+yze/kW02YRSRrNZmAQfFSnkR7Whk+IodLl2dizaaELtSAZl+tacKa63WbLgk6HHtyiEcYL04OHlNz+3bw/Al1VJ6ZGaHJRakQaIPqWOSxaV85DjBO/uShNSoN8JiYQwSVlWrCm6JqcPYr/SpwOoJMvIGA7siLHEN8S8onAf2dMyOY6SIKsC76BnmlxBtBEFLXWUwCywGUbdQAsB27uGAiG3q1j5fJnB4HxYHjAnzSIjnVMY25JGeKXgySzkv5mVPQKzT8b55bylNr56RZ2aD27VX73ho1lTXifz9n/+vrwSzXnace9ZNcXSuKOxNqw2TUSSwSU9cWqDfGbl/umbUMQ6gHafUPpbLZ8eBdPsBYYXtSZueVSfdVFFwlTSu9T8Ily4OHX
Content-ID: <E5D153621804494DB07CC77EEFE2DE11@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea79232-622c-47e5-baa0-08d7595b983d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 14:57:03.0561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RtR0idT2GnZTKj9W32rqXusedWp00/YtZJhyzuYgTkR05Ics8SSYp9q5Sj+TJElgOpBDNXdUP1vSOr1fbwP++A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1600
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyNW5uBvYmHXSJUTgH9ZZzjmilekcL5q59eecrUvda8=;
 b=0XRsPLtNf/6l8pAA0fCYokm1+GWCn47D1YlVKETHdxrVcr+n1i4CSI1HYHZaNRScazmVHItx53UnaexG2s/HBS2m0zheASQZRsqnpBj+va5NdPmuofFsmD1en5pfki1fiuCNhHJ7h64WpqeL7clwt+CmcDqPP8bl61gbqaMsvag=
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
Cc: "S, Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiAxMC8yNS8xOSA0OjQ0IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPiBBbSAyNC4x
MC4xOSB1bSAyMTo1NyBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Og0KPj4gUHJvYmxlbToNCj4+
IFdoZW4gcnVuX2pvYiBmYWlscyBhbmQgSFcgZmVuY2UgcmV0dXJuZWQgaXMgTlVMTCB3ZSBzdGls
bCBzaWduYWwNCj4+IHRoZSBzX2ZlbmNlIHRvIGF2b2lkIGhhbmdzIGJ1dCB0aGUgdXNlciBoYXMg
bm8gd2F5IG9mIGtub3dpbmcgaWYNCj4+IHRoZSBhY3R1YWwgSFcgam9iIHdhcyByYW4gYW5kIGZp
bmlzaGVkLg0KPj4NCj4+IEZpeDoNCj4+IEFsbG93IC5ydW5fam9iIGltcGxlbWVudGF0aW9ucyB0
byByZXR1cm4gRVJSX1BUUiBpbiB0aGUgZmVuY2UgcG9pbnRlcg0KPj4gcmV0dXJuZWQgYW5kIHRo
ZW4gc2V0IHRoaXMgZXJyb3IgZm9yIHNfZmVuY2UtPmZpbmlzaGVkIGZlbmNlIHNvIHdob2V2ZXIN
Cj4+IHdhaXQgb24gdGhpcyBmZW5jZSBjYW4gaW5zcGVjdCB0aGUgc2lnbmFsZWQgZmVuY2UgZm9y
IGFuIGVycm9yLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRy
ZXkuZ3JvZHpvdnNreUBhbWQuY29tPg0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vc2No
ZWR1bGVyL3NjaGVkX21haW4uYyB8IDE5ICsrKysrKysrKysrKysrKystLS0NCj4+IMKgIDEgZmls
ZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyANCj4+IGIvZHJp
dmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4+IGluZGV4IDlhMGVlNzQuLmYz
OWI5N2UgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21h
aW4uYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4+
IEBAIC00NzksNiArNDc5LDcgQEAgdm9pZCBkcm1fc2NoZWRfcmVzdWJtaXRfam9icyhzdHJ1Y3Qg
DQo+PiBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpDQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBkcm1f
c2NoZWRfam9iICpzX2pvYiwgKnRtcDsNCj4+IMKgwqDCoMKgwqAgdWludDY0X3QgZ3VpbHR5X2Nv
bnRleHQ7DQo+PiDCoMKgwqDCoMKgIGJvb2wgZm91bmRfZ3VpbHR5ID0gZmFsc2U7DQo+PiArwqDC
oMKgIHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlOw0KPj4gwqAgwqDCoMKgwqDCoCBsaXN0X2Zvcl9l
YWNoX2VudHJ5X3NhZmUoc19qb2IsIHRtcCwgDQo+PiAmc2NoZWQtPnJpbmdfbWlycm9yX2xpc3Qs
IG5vZGUpIHsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3NjaGVkX2ZlbmNlICpz
X2ZlbmNlID0gc19qb2ItPnNfZmVuY2U7DQo+PiBAQCAtNDkyLDcgKzQ5MywxNiBAQCB2b2lkIGRy
bV9zY2hlZF9yZXN1Ym1pdF9qb2JzKHN0cnVjdCANCj4+IGRybV9ncHVfc2NoZWR1bGVyICpzY2hl
ZCkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9zZXRfZXJyb3IoJnNf
ZmVuY2UtPmZpbmlzaGVkLCAtRUNBTkNFTEVEKTsNCj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBk
bWFfZmVuY2VfcHV0KHNfam9iLT5zX2ZlbmNlLT5wYXJlbnQpOw0KPj4gLcKgwqDCoMKgwqDCoMKg
IHNfam9iLT5zX2ZlbmNlLT5wYXJlbnQgPSBzY2hlZC0+b3BzLT5ydW5fam9iKHNfam9iKTsNCj4+
ICvCoMKgwqDCoMKgwqDCoCBmZW5jZSA9IHNjaGVkLT5vcHMtPnJ1bl9qb2Ioc19qb2IpOw0KPj4g
Kw0KPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChJU19FUlJfT1JfTlVMTChmZW5jZSkpIHsNCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNfam9iLT5zX2ZlbmNlLT5wYXJlbnQgPSBOVUxMOw0KPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3NldF9lcnJvcigmc19mZW5jZS0+Zmlu
aXNoZWQsIFBUUl9FUlIoZmVuY2UpKTsNCj4+ICvCoMKgwqDCoMKgwqDCoCB9IGVsc2Ugew0KPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc19qb2ItPnNfZmVuY2UtPnBhcmVudCA9IGZlbmNlOw0K
Pj4gK8KgwqDCoMKgwqDCoMKgIH0NCj4+ICsNCj4+ICsNCj4NCj4gTWF5YmUgdGltZSBmb3IgYSBk
cm1fc2NoZWRfcnVuX2pvYigpIGZ1bmN0aW9uIHdoaWNoIGRvZXMgdGhhdCANCj4gaGFuZGxpbmc/
IEFuZCB3aHkgZG9uJ3Qgd2UgbmVlZCB0byBpbnN0YWxsIHRoZSBjYWxsYmFjayBoZXJlPw0KDQoN
CldoYXQgY29kZSBkbyB5b3Ugd2FudCB0byBwdXQgaW4gZHJtX3NjaGVkX3J1bl9qb2IgPw0KDQpX
ZSByZWluc3RhbGwgdGhlIGNhbGxiYWNrIGxhdGVyIGluIGRybV9zY2hlZF9zdGFydCwgDQpkcm1f
c2NoZWRfcmVzdWJtaXRfam9icyBpcyBjb25kaXRpb25hbCBvbiB3aGV0aGVyIHRoZSBndWlsdHkg
ZmVuY2UgZGlkIA0Kc2lnbmFsIGJ5IHRoaXMgdGltZSBvciBub3QgYW5kIHNvIHRoZSBzcGxpdCBv
ZiB0aGUgbG9naWMgaW50byANCmRybV9zY2hlZF9zdGFydCBhbmQgZHJtX3NjaGVkX3Jlc3VibWl0
X2pvYnMuDQoNCkFuZHJleQ0KDQoNCj4NCj4gQXBhcnQgZnJvbSB0aGF0IGxvb2tzIGdvb2QgdG8g
bWUsDQo+IENocmlzdGlhbi4NCj4NCj4+IMKgwqDCoMKgwqAgfQ0KPj4gwqAgfQ0KPj4gwqAgRVhQ
T1JUX1NZTUJPTChkcm1fc2NoZWRfcmVzdWJtaXRfam9icyk7DQo+PiBAQCAtNzIwLDcgKzczMCw3
IEBAIHN0YXRpYyBpbnQgZHJtX3NjaGVkX21haW4odm9pZCAqcGFyYW0pDQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgZmVuY2UgPSBzY2hlZC0+b3BzLT5ydW5fam9iKHNjaGVkX2pvYik7DQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgZHJtX3NjaGVkX2ZlbmNlX3NjaGVkdWxlZChzX2ZlbmNlKTsNCj4+IMKg
IC3CoMKgwqDCoMKgwqDCoCBpZiAoZmVuY2UpIHsNCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIUlT
X0VSUl9PUl9OVUxMKGZlbmNlKSkgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc19m
ZW5jZS0+cGFyZW50ID0gZG1hX2ZlbmNlX2dldChmZW5jZSk7DQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByID0gZG1hX2ZlbmNlX2FkZF9jYWxsYmFjayhmZW5jZSwgJnNjaGVkX2pvYi0+
Y2IsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBkcm1fc2NoZWRfcHJvY2Vzc19qb2IpOw0KPj4gQEAgLTczMCw4ICs3NDAsMTEgQEAg
c3RhdGljIGludCBkcm1fc2NoZWRfbWFpbih2b2lkICpwYXJhbSkNCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX0VSUk9SKCJmZW5jZSBhZGQgY2FsbGJhY2sgZmFpbGVk
ICglZClcbiIsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHIpOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3B1dChmZW5j
ZSk7DQo+PiAtwqDCoMKgwqDCoMKgwqAgfSBlbHNlDQo+PiArwqDCoMKgwqDCoMKgwqAgfSBlbHNl
IHsNCj4+ICsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9zZXRfZXJyb3Io
JnNfZmVuY2UtPmZpbmlzaGVkLCBQVFJfRVJSKGZlbmNlKSk7DQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBkcm1fc2NoZWRfcHJvY2Vzc19qb2IoTlVMTCwgJnNjaGVkX2pvYi0+Y2IpOw0K
Pj4gK8KgwqDCoMKgwqDCoMKgIH0NCj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCB3YWtlX3VwKCZz
Y2hlZC0+am9iX3NjaGVkdWxlZCk7DQo+PiDCoMKgwqDCoMKgIH0NCj4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
