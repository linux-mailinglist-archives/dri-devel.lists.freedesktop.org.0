Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFFFE508D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 17:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9A36EAD0;
	Fri, 25 Oct 2019 15:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700075.outbound.protection.outlook.com [40.107.70.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DDA6EAD0;
 Fri, 25 Oct 2019 15:55:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEr8phdGyOM2GzZZVuiVoR0acEVrNegp4ZHIy2/nANjYezad/sbuhvwaqqgEuAs6vJPzVxYqMcjlzCdjJL1R6XEe0n2063IOMWFiY3c2fclTIPVxMmJ0R20/fMapu6InefWsth7/4ltuIrrFdfrXRFc6QRTGUKfoxtisCtakbu+lIipFrs6QcRBD6QtgJtHyfHXLGWkCeNZ+hHC4xpKWDsh2/e1qZNS8mlXWxtlgWER+zk938yapSsMCpxEXnA+DW/V1X8LKEpNIq8MrRBvPa8Vn2zozS6E6H4cMcNzQ0ulv0PyCOsQ1O6r4r6agm7yoQxOk1sBIvIYHZpxfMEocgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VnuLNcUvL7znE3tuvcfU9tP6NCgDHNMWoV0yQFglCU=;
 b=PH/8ErgnPU5nnsUzd60VbcSbTH9VQNkAGtm9/cw0dTLvd32nO6BFeSgyOJQv3yL7VSF5auR7rOIFPb1r0Fq0viyKW1Gl28naLxTRuV6zUG+2hIerFZ8YIXkzYofTu4XmhKaFg+0LdMuLPQMgj/4u6DPAfphOfbyWBGg8jfxK6RTvxMzjU8VUeKLrDsLoU6ers7j/FMj9Xr6tPPhP9o/WUM9fa2XfnRm3ohL3TjBbPTK0Rr+CEEJisv5gUu62pJpC3+EOtEgSRL44Ws0PWWywLH5D0KgigqnMzmtSxX65uxK6mgU7vHPuSUtletuIqrA8KGM4wNZXiQR+EbDjmKwddA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1699.namprd12.prod.outlook.com (10.175.97.148) by
 BN6PR12MB1490.namprd12.prod.outlook.com (10.172.23.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Fri, 25 Oct 2019 15:55:04 +0000
Received: from BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::bde7:9044:dcdb:4b67]) by BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::bde7:9044:dcdb:4b67%7]) with mapi id 15.20.2347.029; Fri, 25 Oct 2019
 15:55:04 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/sched: Set error to s_fence if HW job submission
 failed.
Thread-Topic: [PATCH 1/2] drm/sched: Set error to s_fence if HW job submission
 failed.
Thread-Index: AQHViqVHSP5ADE+zREm+JapbWXlE4qdrC4uAgABoEgCAABAyAA==
Date: Fri, 25 Oct 2019 15:55:04 +0000
Message-ID: <d6754afb-706b-64b7-758e-c19f67db7625@amd.com>
References: <1571947050-26276-1-git-send-email-andrey.grodzovsky@amd.com>
 <dbc0cddf-e1e1-fa36-df26-b784aea6dc12@gmail.com>
 <1638959e-08ef-3a24-babc-5cbddcae0575@amd.com>
In-Reply-To: <1638959e-08ef-3a24-babc-5cbddcae0575@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR01CA0096.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::37) To BN6PR12MB1699.namprd12.prod.outlook.com
 (2603:10b6:404:ff::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4b2914b4-ced9-4b71-b8ad-08d75963b324
x-ms-traffictypediagnostic: BN6PR12MB1490:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB14909B074A191ED6919716CA83650@BN6PR12MB1490.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(199004)(189003)(65806001)(2616005)(476003)(486006)(446003)(450100002)(46003)(66476007)(66556008)(64756008)(86362001)(11346002)(2201001)(2501003)(66446008)(102836004)(58126008)(66946007)(110136005)(31696002)(4326008)(31686004)(52116002)(229853002)(316002)(6512007)(305945005)(99286004)(6436002)(76176011)(6246003)(6486002)(81156014)(81166006)(7736002)(8936002)(186003)(8676002)(386003)(6506007)(53546011)(14454004)(6116002)(36756003)(2906002)(478600001)(71190400001)(256004)(71200400001)(5660300002)(65956001)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1490;
 H:BN6PR12MB1699.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KzGR1+FNurTeNsiIHmIqM6w+0iszpMZ3UZNPlzU9aRuKjCc2IysmIVXftLajKxiDFKFqs0ZOyFNMihhEwUOBRe5HN5Ojx7mF/dN6+983K9ZfK0dTnOc/AviFVPVbBis4eLC+cBD39FLo6b0/t+oASbDPKNgLA//9enY4/FE537JRwqs/AtY97tXEt655pg2Q+qzmmRvFWoyMD99dvImYGgiWjZ9Ttd7IRLGP6/WvBxBhZassm0XZNKzSWHBTB/BbPq4QbucAFCazufU8o02PIkkcLhk7GPcwwhwLyUZ2UXF2Q5aQLwhggNFABk40ZgBeKa7PekXXMiYE4dh3iVYbzd0q95lPb9WwL8zy1CsVFpyzYBv4QqJhTxVmxPr86NNukJPKh3Qzf5u5zSalT4AhgpAzRiEkDmpa/fdcljNwLK7bgcY8nyMT8B6wmjwsblUk
Content-ID: <988A021DDA36F14599CAC760E4AA853E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2914b4-ced9-4b71-b8ad-08d75963b324
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 15:55:04.0811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J3SiyOBYtY/+EBOePNHlgBpjiBJHS2nUcKwYG46vHva6sez/tdKXigoie3Bo9R99
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1490
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VnuLNcUvL7znE3tuvcfU9tP6NCgDHNMWoV0yQFglCU=;
 b=sIGwkJgyPmq7iSXNb87B3wcuTlMGf33cmrY0mr8tmIYw2BaXsoA5m0kNRC5Z/ZvBpPnl0AV0rp6cUQT3K2sHNLBvq2Ob3DZpP21MAG5LsWfiRHIZv8bl/2dM/XCUDyp0ukxOub0kVf6sIfP9Z/TyHS/c7JmZ8td+97pltT+3qGw=
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
Cc: "S, Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMTAuMTkgdW0gMTY6NTcgc2NocmllYiBHcm9kem92c2t5LCBBbmRyZXk6DQo+IE9uIDEw
LzI1LzE5IDQ6NDQgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+PiBBbSAyNC4xMC4xOSB1
bSAyMTo1NyBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Og0KPj4+IFByb2JsZW06DQo+Pj4gV2hl
biBydW5fam9iIGZhaWxzIGFuZCBIVyBmZW5jZSByZXR1cm5lZCBpcyBOVUxMIHdlIHN0aWxsIHNp
Z25hbA0KPj4+IHRoZSBzX2ZlbmNlIHRvIGF2b2lkIGhhbmdzIGJ1dCB0aGUgdXNlciBoYXMgbm8g
d2F5IG9mIGtub3dpbmcgaWYNCj4+PiB0aGUgYWN0dWFsIEhXIGpvYiB3YXMgcmFuIGFuZCBmaW5p
c2hlZC4NCj4+Pg0KPj4+IEZpeDoNCj4+PiBBbGxvdyAucnVuX2pvYiBpbXBsZW1lbnRhdGlvbnMg
dG8gcmV0dXJuIEVSUl9QVFIgaW4gdGhlIGZlbmNlIHBvaW50ZXINCj4+PiByZXR1cm5lZCBhbmQg
dGhlbiBzZXQgdGhpcyBlcnJvciBmb3Igc19mZW5jZS0+ZmluaXNoZWQgZmVuY2Ugc28gd2hvZXZl
cg0KPj4+IHdhaXQgb24gdGhpcyBmZW5jZSBjYW4gaW5zcGVjdCB0aGUgc2lnbmFsZWQgZmVuY2Ug
Zm9yIGFuIGVycm9yLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kg
PGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+DQo+Pj4gLS0tDQo+Pj4gIMKgIGRyaXZlcnMvZ3B1
L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIHwgMTkgKysrKysrKysrKysrKysrKy0tLQ0KPj4+
ICDCoCAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+
Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4u
Yw0KPj4+IGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4+PiBpbmRl
eCA5YTBlZTc0Li5mMzliOTdlIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hl
ZHVsZXIvc2NoZWRfbWFpbi5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9z
Y2hlZF9tYWluLmMNCj4+PiBAQCAtNDc5LDYgKzQ3OSw3IEBAIHZvaWQgZHJtX3NjaGVkX3Jlc3Vi
bWl0X2pvYnMoc3RydWN0DQo+Pj4gZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQ0KPj4+ICDCoMKg
wqDCoMKgIHN0cnVjdCBkcm1fc2NoZWRfam9iICpzX2pvYiwgKnRtcDsNCj4+PiAgwqDCoMKgwqDC
oCB1aW50NjRfdCBndWlsdHlfY29udGV4dDsNCj4+PiAgwqDCoMKgwqDCoCBib29sIGZvdW5kX2d1
aWx0eSA9IGZhbHNlOw0KPj4+ICvCoMKgwqAgc3RydWN0IGRtYV9mZW5jZSAqZmVuY2U7DQo+Pj4g
IMKgIMKgwqDCoMKgwqAgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHNfam9iLCB0bXAsDQo+Pj4g
JnNjaGVkLT5yaW5nX21pcnJvcl9saXN0LCBub2RlKSB7DQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgZHJtX3NjaGVkX2ZlbmNlICpzX2ZlbmNlID0gc19qb2ItPnNfZmVuY2U7DQo+Pj4g
QEAgLTQ5Miw3ICs0OTMsMTYgQEAgdm9pZCBkcm1fc2NoZWRfcmVzdWJtaXRfam9icyhzdHJ1Y3QN
Cj4+PiBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpDQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGRtYV9mZW5jZV9zZXRfZXJyb3IoJnNfZmVuY2UtPmZpbmlzaGVkLCAtRUNBTkNFTEVE
KTsNCj4+PiAgwqAgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9wdXQoc19qb2ItPnNfZmVu
Y2UtPnBhcmVudCk7DQo+Pj4gLcKgwqDCoMKgwqDCoMKgIHNfam9iLT5zX2ZlbmNlLT5wYXJlbnQg
PSBzY2hlZC0+b3BzLT5ydW5fam9iKHNfam9iKTsNCj4+PiArwqDCoMKgwqDCoMKgwqAgZmVuY2Ug
PSBzY2hlZC0+b3BzLT5ydW5fam9iKHNfam9iKTsNCj4+PiArDQo+Pj4gK8KgwqDCoMKgwqDCoMKg
IGlmIChJU19FUlJfT1JfTlVMTChmZW5jZSkpIHsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzX2pvYi0+c19mZW5jZS0+cGFyZW50ID0gTlVMTDsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBkbWFfZmVuY2Vfc2V0X2Vycm9yKCZzX2ZlbmNlLT5maW5pc2hlZCwgUFRSX0VSUihmZW5j
ZSkpOw0KPj4+ICvCoMKgwqDCoMKgwqDCoCB9IGVsc2Ugew0KPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHNfam9iLT5zX2ZlbmNlLT5wYXJlbnQgPSBmZW5jZTsNCj4+PiArwqDCoMKgwqDCoMKg
wqAgfQ0KPj4+ICsNCj4+PiArDQo+PiBNYXliZSB0aW1lIGZvciBhIGRybV9zY2hlZF9ydW5fam9i
KCkgZnVuY3Rpb24gd2hpY2ggZG9lcyB0aGF0DQo+PiBoYW5kbGluZz8gQW5kIHdoeSBkb24ndCB3
ZSBuZWVkIHRvIGluc3RhbGwgdGhlIGNhbGxiYWNrIGhlcmU/DQo+DQo+IFdoYXQgY29kZSBkbyB5
b3Ugd2FudCB0byBwdXQgaW4gZHJtX3NjaGVkX3J1bl9qb2IgPw0KPg0KPiBXZSByZWluc3RhbGwg
dGhlIGNhbGxiYWNrIGxhdGVyIGluIGRybV9zY2hlZF9zdGFydCwNCj4gZHJtX3NjaGVkX3Jlc3Vi
bWl0X2pvYnMgaXMgY29uZGl0aW9uYWwgb24gd2hldGhlciB0aGUgZ3VpbHR5IGZlbmNlIGRpZA0K
PiBzaWduYWwgYnkgdGhpcyB0aW1lIG9yIG5vdCBhbmQgc28gdGhlIHNwbGl0IG9mIHRoZSBsb2dp
YyBpbnRvDQo+IGRybV9zY2hlZF9zdGFydCBhbmQgZHJtX3NjaGVkX3Jlc3VibWl0X2pvYnMuDQoN
CkFoLCB5ZXMgb2YgY291cnNlLiBJbiB0aGlzIGNhc2UgdGhlIHBhdGNoIGlzIFJldmlld2VkLWJ5
OiBDaHJpc3RpYW4gDQpLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4uDQoNClJlZ2Fy
ZHMsDQpDaHJpc3RpYW4uDQoNCj4NCj4gQW5kcmV5DQo+DQo+DQo+PiBBcGFydCBmcm9tIHRoYXQg
bG9va3MgZ29vZCB0byBtZSwNCj4+IENocmlzdGlhbi4NCj4+DQo+Pj4gIMKgwqDCoMKgwqAgfQ0K
Pj4+ICDCoCB9DQo+Pj4gIMKgIEVYUE9SVF9TWU1CT0woZHJtX3NjaGVkX3Jlc3VibWl0X2pvYnMp
Ow0KPj4+IEBAIC03MjAsNyArNzMwLDcgQEAgc3RhdGljIGludCBkcm1fc2NoZWRfbWFpbih2b2lk
ICpwYXJhbSkNCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGZlbmNlID0gc2NoZWQtPm9wcy0+cnVu
X2pvYihzY2hlZF9qb2IpOw0KPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgZHJtX3NjaGVkX2ZlbmNl
X3NjaGVkdWxlZChzX2ZlbmNlKTsNCj4+PiAgwqAgLcKgwqDCoMKgwqDCoMKgIGlmIChmZW5jZSkg
ew0KPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIUlTX0VSUl9PUl9OVUxMKGZlbmNlKSkgew0KPj4+
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzX2ZlbmNlLT5wYXJlbnQgPSBkbWFfZmVuY2Vf
Z2V0KGZlbmNlKTsNCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgciA9IGRtYV9mZW5j
ZV9hZGRfY2FsbGJhY2soZmVuY2UsICZzY2hlZF9qb2ItPmNiLA0KPj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1fc2NoZWRfcHJv
Y2Vzc19qb2IpOw0KPj4+IEBAIC03MzAsOCArNzQwLDExIEBAIHN0YXRpYyBpbnQgZHJtX3NjaGVk
X21haW4odm9pZCAqcGFyYW0pDQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgRFJNX0VSUk9SKCJmZW5jZSBhZGQgY2FsbGJhY2sgZmFpbGVkICglZClcbiIsDQo+Pj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcik7DQo+Pj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9wdXQoZmVuY2UpOw0KPj4+IC3CoMKg
wqDCoMKgwqDCoCB9IGVsc2UNCj4+PiArwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsNCj4+PiArDQo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3NldF9lcnJvcigmc19mZW5jZS0+
ZmluaXNoZWQsIFBUUl9FUlIoZmVuY2UpKTsNCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZHJtX3NjaGVkX3Byb2Nlc3Nfam9iKE5VTEwsICZzY2hlZF9qb2ItPmNiKTsNCj4+PiArwqDC
oMKgwqDCoMKgwqAgfQ0KPj4+ICDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgd2FrZV91cCgmc2NoZWQt
PmpvYl9zY2hlZHVsZWQpOw0KPj4+ICDCoMKgwqDCoMKgIH0NCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
