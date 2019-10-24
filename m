Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99682E2F6E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 12:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B786E237;
	Thu, 24 Oct 2019 10:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820051.outbound.protection.outlook.com [40.107.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E40B6E231;
 Thu, 24 Oct 2019 10:52:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8O+Te/6CLOMGjmoE/CuOBHJvk5RY/BITW7ZY62qSIogvyLJV9UfeRhiBg+mkVkqK4+TFSrd7jRcbuZTivxBa4sraErsCyCoWg9cLm3bStyUTpSH3M3I0fQjmey22EZVSH2OYQE5LmYcmB5cPgiffEEFI1GwCq8SzEFX9UC7P7cS9e6DG6fmIscNdi7jLzlMvoyOCndoqszEzlCxJPOwXGYu5YRxhcw540i5DB6A8VSFd8LhuZdI9QdoRAoVVksNts/wT1Y4ZjzUtUIAm+mRfZb/yHpzyMSvsGdzDIJsT0FN9LqRqrwp3SBkiadA4QuPAbqzjnU9icbZiRIN3z4c3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZ6Zg11bsP+LWmdosm9rRpLRHxTbRwSRh/OxJ8/vMVo=;
 b=FlMBbb1ueLwGkC5aPK1k68VFF5Rgp1ty9oSMI3+KNLPdyun/7Cpg5pV6kQZVWdr6G6dvqUN82tyajIk6+m+aRlUBoUyOQMqCRt179Tq1flHO0pQaiOfEZsTmIHqjdgmd8KUJTm78xGq0yKjYell4enk16Cquvz6/QY2qtI7Dfb5CX2oafon7uYN1WYBLUvOCDXEq/y0uqJtaxQEF5eOcvc4o8TLTFr79YNVRZ9WolNrm+9mRVl+ukxFkH/TeAAhfiZyYUyKjcHakTmsSa056g/r7tOmcTiOeo0TwKZkiQZT7uU44PYBj/ue/4Np9nLdOIjUzzY7PQZlNI9ZT06oItw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1406.namprd12.prod.outlook.com (10.169.207.13) by
 MWHPR12MB1840.namprd12.prod.outlook.com (10.175.56.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Thu, 24 Oct 2019 10:51:55 +0000
Received: from MWHPR12MB1406.namprd12.prod.outlook.com
 ([fe80::3c7f:e5d7:435e:96b9]) by MWHPR12MB1406.namprd12.prod.outlook.com
 ([fe80::3c7f:e5d7:435e:96b9%12]) with mapi id 15.20.2387.021; Thu, 24 Oct
 2019 10:51:55 +0000
From: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Huang, Ray"
 <Ray.Huang@amd.com>
Subject: Re: [PATCH] drm/ttm: use the parent resv for ghost objects v2
Thread-Topic: [PATCH] drm/ttm: use the parent resv for ghost objects v2
Thread-Index: AQHVhathvDdR8eBKZ0igFT3vsaDhKqdpn4SAgAAHNgA=
Date: Thu, 24 Oct 2019 10:51:55 +0000
Message-ID: <006ab5ab-fa42-b206-1a40-3f0744689443@amd.com>
References: <20191018115831.14951-1-christian.koenig@amd.com>
 <01bf3c2a-e178-6083-01a8-bb06aaef10bf@gmail.com>
In-Reply-To: <01bf3c2a-e178-6083-01a8-bb06aaef10bf@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR0401CA0005.apcprd04.prod.outlook.com
 (2603:1096:202:2::15) To MWHPR12MB1406.namprd12.prod.outlook.com
 (2603:10b6:300:14::13)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 17dd64d1-b556-41d0-3194-08d758702f5b
x-ms-traffictypediagnostic: MWHPR12MB1840:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1840B3F59CBF003457EEBF43B46A0@MWHPR12MB1840.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0200DDA8BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(189003)(199004)(3846002)(2906002)(305945005)(66946007)(64756008)(66446008)(66556008)(7736002)(31696002)(6486002)(31686004)(5660300002)(2501003)(6116002)(66476007)(110136005)(478600001)(6246003)(186003)(99286004)(6436002)(8936002)(6636002)(6512007)(229853002)(2616005)(86362001)(11346002)(81156014)(8676002)(52116002)(81166006)(446003)(476003)(76176011)(486006)(2201001)(256004)(14454004)(25786009)(66574012)(26005)(386003)(6506007)(316002)(102836004)(71190400001)(71200400001)(66066001)(36756003)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1840;
 H:MWHPR12MB1406.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z+CGtaiC93zKdl1+vtx67mn4/KpOCQ+p/vBdKiqOurg0eTmnKo162DyWh39dkxdCTzXJxDMAkFl4lfhe5znfxMPiyrbgW67Zpo81GhtHYAIKxuHMdJHLvUQ4AUteB7QAO8zBWjYwzUn7t8V0QQlZXloT7UVd5cvEvz29Jh2v/ER5SABohYBx7ivA5UxN9anz1wbYKN7S1B3NsiYrVgiJMertaTKvCrve7G7F3VmaTpiNIuIzJa1gQYV2aolBkTsbjYtamAtUB0F2HT+8qnjRNd7Un8xYFjxpkRirzyP0USS0DB76W22yeTWlLR862YYf5WYsWtOSfUxtuCyXdXFxxJw8+9p0IWIt3aeMIgJas2TYSiWBCU93IeKqZts3o3KQ1m4ZWJcoHlRnogt+eWfs1JJewn5HVXjCK9EUjxltjd98CVuLRfX51AWOlMtvF4aZ
Content-ID: <61ACA9463373104B948626A4054B8F26@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17dd64d1-b556-41d0-3194-08d758702f5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2019 10:51:55.3170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qbh1qtuR+kcPIVFs4kt0Z0Mfn9sYvy/V1+bYir96MhEOGCLMUwB+d9g6UbrduBZk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1840
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZ6Zg11bsP+LWmdosm9rRpLRHxTbRwSRh/OxJ8/vMVo=;
 b=w+7DyI6ansDwyZoNr9ICdVBTZDgnHTyKGZSXMCPSfBuzt3WSPknuFhs7U5oP0b0gyS7F38OPSSyFR7QAZQ8kIzaxbHhH8jITclgzaYKqsNZ0Oz4PXyDRBvTQ/QlGWAPh+LKPCS9mpI/7t96IwvpSja5UmwfQpKPop1ZmMipFjpE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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

DQpPbiAyMDE5LzEwLzI0IOS4i+WNiDY6MjUsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+IFBp
bmc/DQo+DQo+IEFtIDE4LjEwLjE5IHVtIDEzOjU4IHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoN
Cj4+IFRoaXMgd2F5IHRoZSBUVE0gaXMgZGVzdHJveWVkIHdpdGggdGhlIGNvcnJlY3QgZG1hX3Jl
c3Ygb2JqZWN0DQo+PiBsb2NrZWQgYW5kIHdlIGNhbiBldmVuIHBpcGVsaW5lIGltcG9ydGVkIEJP
IGV2aWN0aW9ucy4NCj4+DQo+PiB2MjogTGltaXQgdGhpcyB0byBvbmx5IGNhc2VzIHdoZW4gdGhl
IHBhcmVudCBvYmplY3QgdXNlcyBhIHNlcGFyYXRlDQo+PiDCoMKgwqDCoCByZXNlcnZhdGlvbiBv
YmplY3QgYXMgd2VsbC4gVGhpcyBmaXhlcyBhbm90aGVyIE9PTSBwcm9ibGVtLg0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4N
Cj4+IC0tLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jIHwgMTYgKysr
KysrKysrLS0tLS0tLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNyBk
ZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym9fdXRpbC5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMNCj4+IGlu
ZGV4IGUwMzBjMjdmNTNjZi4uNDVlNDQwZjgwYjdiIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9ib191dGlsLmMNCj4+IEBAIC01MTIsNyArNTEyLDkgQEAgc3RhdGljIGludCB0dG1fYnVmZmVy
X29iamVjdF90cmFuc2ZlcihzdHJ1Y3QgDQo+PiB0dG1fYnVmZmVyX29iamVjdCAqYm8sDQo+PiDC
oMKgwqDCoMKgIGtyZWZfaW5pdCgmZmJvLT5iYXNlLmtyZWYpOw0KPj4gwqDCoMKgwqDCoCBmYm8t
PmJhc2UuZGVzdHJveSA9ICZ0dG1fdHJhbnNmZXJlZF9kZXN0cm95Ow0KPj4gwqDCoMKgwqDCoCBm
Ym8tPmJhc2UuYWNjX3NpemUgPSAwOw0KPj4gLcKgwqDCoCBmYm8tPmJhc2UuYmFzZS5yZXN2ID0g
JmZiby0+YmFzZS5iYXNlLl9yZXN2Ow0KPj4gK8KgwqDCoCBpZiAoYm8tPmJhc2UucmVzdiA9PSAm
Ym8tPmJhc2UuX3Jlc3YpDQo+PiArwqDCoMKgwqDCoMKgwqAgZmJvLT5iYXNlLmJhc2UucmVzdiA9
ICZmYm8tPmJhc2UuYmFzZS5fcmVzdjsNCj4+ICsNCj4+IMKgwqDCoMKgwqAgZG1hX3Jlc3ZfaW5p
dChmYm8tPmJhc2UuYmFzZS5yZXN2KTsNCg0KRG9lc24ndCB0aGlzIGxlYWQgdG8gaXNzdWUgaWYg
eW91IGZvcmNlIHRvIGluaXQgcGFyZW50IHJlc3Y/IE90aGVyd2lzZSANCmhvdyB0byBkZWFsIHdp
dGggaWYgcGFyZW50LT5yZXN2IGlzIGxvY2tpbmc/DQoNCg0KPj4gwqDCoMKgwqDCoCByZXQgPSBk
bWFfcmVzdl90cnlsb2NrKGZiby0+YmFzZS5iYXNlLnJlc3YpOw0KPj4gwqDCoMKgwqDCoCBXQVJO
X09OKCFyZXQpOw0KPj4gQEAgLTcxMSw3ICs3MTMsNyBAQCBpbnQgdHRtX2JvX21vdmVfYWNjZWxf
Y2xlYW51cChzdHJ1Y3QgDQo+PiB0dG1fYnVmZmVyX29iamVjdCAqYm8sDQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKHJldCkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBy
ZXQ7DQo+PiDCoCAtwqDCoMKgwqDCoMKgwqAgZG1hX3Jlc3ZfYWRkX2V4Y2xfZmVuY2UoZ2hvc3Rf
b2JqLT5iYXNlLnJlc3YsIGZlbmNlKTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBkbWFfcmVzdl9hZGRf
ZXhjbF9mZW5jZSgmZ2hvc3Rfb2JqLT5iYXNlLl9yZXN2LCBmZW5jZSk7DQo+PiDCoCDCoMKgwqDC
oMKgwqDCoMKgwqAgLyoqDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIElmIHdlJ3JlIG5vdCBt
b3ZpbmcgdG8gZml4ZWQgbWVtb3J5LCB0aGUgVFRNIG9iamVjdA0KPj4gQEAgLTcyNCw3ICs3MjYs
NyBAQCBpbnQgdHRtX2JvX21vdmVfYWNjZWxfY2xlYW51cChzdHJ1Y3QgDQo+PiB0dG1fYnVmZmVy
X29iamVjdCAqYm8sDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZQ0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgYm8tPnR0bSA9IE5VTEw7DQo+PiDCoCAtwqDCoMKgwqDCoMKgwqAgdHRt
X2JvX3VucmVzZXJ2ZShnaG9zdF9vYmopOw0KPj4gK8KgwqDCoMKgwqDCoMKgIGRtYV9yZXN2X3Vu
bG9jaygmZ2hvc3Rfb2JqLT5iYXNlLl9yZXN2KTsNCg0KZmJvLT5iYXNlLmJhc2UucmVzdj8NCg0K
LURhdmlkDQoNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB0dG1fYm9fcHV0KGdob3N0X29iaik7DQo+
PiDCoMKgwqDCoMKgIH0NCj4+IMKgIEBAIC03NjcsNyArNzY5LDcgQEAgaW50IHR0bV9ib19waXBl
bGluZV9tb3ZlKHN0cnVjdCANCj4+IHR0bV9idWZmZXJfb2JqZWN0ICpibywNCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAocmV0KQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IHJldDsNCj4+IMKgIC3CoMKgwqDCoMKgwqDCoCBkbWFfcmVzdl9hZGRfZXhjbF9mZW5jZShnaG9z
dF9vYmotPmJhc2UucmVzdiwgZmVuY2UpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIGRtYV9yZXN2X2Fk
ZF9leGNsX2ZlbmNlKCZnaG9zdF9vYmotPmJhc2UuX3Jlc3YsIGZlbmNlKTsNCj4+IMKgIMKgwqDC
oMKgwqDCoMKgwqDCoCAvKioNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgICogSWYgd2UncmUgbm90
IG1vdmluZyB0byBmaXhlZCBtZW1vcnksIHRoZSBUVE0gb2JqZWN0DQo+PiBAQCAtNzgwLDcgKzc4
Miw3IEBAIGludCB0dG1fYm9fcGlwZWxpbmVfbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
DQo+PiAqYm8sDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZQ0KPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgYm8tPnR0bSA9IE5VTEw7DQo+PiDCoCAtwqDCoMKgwqDCoMKgwqAgdHRtX2Jv
X3VucmVzZXJ2ZShnaG9zdF9vYmopOw0KPj4gK8KgwqDCoMKgwqDCoMKgIGRtYV9yZXN2X3VubG9j
aygmZ2hvc3Rfb2JqLT5iYXNlLl9yZXN2KTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB0dG1fYm9f
cHV0KGdob3N0X29iaik7DQo+PiDCoCDCoMKgwqDCoMKgIH0gZWxzZSBpZiAoZnJvbS0+ZmxhZ3Mg
JiBUVE1fTUVNVFlQRV9GTEFHX0ZJWEVEKSB7DQo+PiBAQCAtODM2LDcgKzgzOCw3IEBAIGludCB0
dG1fYm9fcGlwZWxpbmVfZ3V0dGluZyhzdHJ1Y3QgDQo+PiB0dG1fYnVmZmVyX29iamVjdCAqYm8p
DQo+PiDCoMKgwqDCoMKgIGlmIChyZXQpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJl
dDsNCj4+IMKgIC3CoMKgwqAgcmV0ID0gZG1hX3Jlc3ZfY29weV9mZW5jZXMoZ2hvc3QtPmJhc2Uu
cmVzdiwgYm8tPmJhc2UucmVzdik7DQo+PiArwqDCoMKgIHJldCA9IGRtYV9yZXN2X2NvcHlfZmVu
Y2VzKCZnaG9zdC0+YmFzZS5fcmVzdiwgYm8tPmJhc2UucmVzdik7DQo+PiDCoMKgwqDCoMKgIC8q
IExhc3QgcmVzb3J0LCB3YWl0IGZvciB0aGUgQk8gdG8gYmUgaWRsZSB3aGVuIHdlIGFyZSBPT00g
Ki8NCj4+IMKgwqDCoMKgwqAgaWYgKHJldCkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB0dG1fYm9f
d2FpdChibywgZmFsc2UsIGZhbHNlKTsNCj4+IEBAIC04NDUsNyArODQ3LDcgQEAgaW50IHR0bV9i
b19waXBlbGluZV9ndXR0aW5nKHN0cnVjdCANCj4+IHR0bV9idWZmZXJfb2JqZWN0ICpibykNCj4+
IMKgwqDCoMKgwqAgYm8tPm1lbS5tZW1fdHlwZSA9IFRUTV9QTF9TWVNURU07DQo+PiDCoMKgwqDC
oMKgIGJvLT50dG0gPSBOVUxMOw0KPj4gwqAgLcKgwqDCoCB0dG1fYm9fdW5yZXNlcnZlKGdob3N0
KTsNCj4+ICvCoMKgwqAgZG1hX3Jlc3ZfdW5sb2NrKCZnaG9zdC0+YmFzZS5fcmVzdik7DQo+PiDC
oMKgwqDCoMKgIHR0bV9ib19wdXQoZ2hvc3QpOw0KPj4gwqAgwqDCoMKgwqDCoCByZXR1cm4gMDsN
Cj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
