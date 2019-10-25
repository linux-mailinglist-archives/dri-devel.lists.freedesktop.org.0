Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCA9E50A6
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 17:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422A16EAD8;
	Fri, 25 Oct 2019 15:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740077.outbound.protection.outlook.com [40.107.74.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B866EAD8;
 Fri, 25 Oct 2019 15:58:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnYTEKhuZi4jKZctzsEMUMs8XtEXyyZwh8Ba1j2HxB259+H5+g2k+ZN9RAouSgSXHUnor9QqVyFgWYUS9Ox+/Lu371RsWI1flVkdZPLZovMugQhhkWJKTToCnGOL9OwqMOGaadN4qd1Klq2HXiqWI8JNyPHtL+/4/8T6TyE1SaCt4eXtgRvKHJ+4+kEIQ0Y/KhnE9D8DNfxJZv5H6fCgsTHPie4vcMz99MENIxwGTLrzKulpVXsYNqw9KwlNrKMhOoMpvjiRL+BOUTNIDCPyLvc8SEf9cULMay44HZCDYYJq/21KMoHseaONc6//4/XVuBjote7IV23kvffhuXpjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNO3D1tqCeJGkrjlvgBNkz16WHLc6Ud8OqXHjfECmc0=;
 b=Kl5JeaHytXKTJkVj5IUipKBh7KwCWlyKFWbSiEh2ou4l+rZEWJRseYSHBvHvFtDZIR2dJQlaktoBVef74lvEEBalk9AMHDrhCuwk6fsFIzyIhFyJ9G0V/DQx6fvDhOITqdtXJY7v+a3ilin1qPEILQ9hK/4RWDB/kJOx3fEZ2PECNYyDI56wC36+c7QxjfPEr0ow7aNAp9+/r8vefXSR7xFSvcVLxVFw6m3q9fFD1SCJfeGRsYuWb4r4rYkyGhhB9WvsgGayE9Riq1sYTnE4QH0qnwPe7AyjrQXc+sWYWteX1auUTv3QV63OO9C3k7NyL81qmTEEfQvTMEZ38HdIrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1699.namprd12.prod.outlook.com (10.175.97.148) by
 BN6PR12MB1778.namprd12.prod.outlook.com (10.175.101.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.23; Fri, 25 Oct 2019 15:58:53 +0000
Received: from BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::bde7:9044:dcdb:4b67]) by BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::bde7:9044:dcdb:4b67%7]) with mapi id 15.20.2347.029; Fri, 25 Oct 2019
 15:58:53 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/sched: Set error to s_fence if HW job submission
 failed.
Thread-Topic: [PATCH 1/2] drm/sched: Set error to s_fence if HW job submission
 failed.
Thread-Index: AQHViqVHSP5ADE+zREm+JapbWXlE4qdrC4uAgABoEgCAABAyAIAAAEmAgAAAyIA=
Date: Fri, 25 Oct 2019 15:58:53 +0000
Message-ID: <89eb612a-5b30-c7dc-7f6b-b97e07dcdb7c@amd.com>
References: <1571947050-26276-1-git-send-email-andrey.grodzovsky@amd.com>
 <dbc0cddf-e1e1-fa36-df26-b784aea6dc12@gmail.com>
 <1638959e-08ef-3a24-babc-5cbddcae0575@amd.com>
 <d6754afb-706b-64b7-758e-c19f67db7625@amd.com>
 <5e9adae4-f4d4-cfd2-f3ee-6f78332ef19c@amd.com>
In-Reply-To: <5e9adae4-f4d4-cfd2-f3ee-6f78332ef19c@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM4PR0101CA0053.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::21) To BN6PR12MB1699.namprd12.prod.outlook.com
 (2603:10b6:404:ff::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9edb116c-0b63-4c48-42ad-08d759643bf5
x-ms-traffictypediagnostic: BN6PR12MB1778:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1778C7E2EDB6513F79CAACBE83650@BN6PR12MB1778.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(199004)(189003)(2501003)(66446008)(66556008)(64756008)(66476007)(6436002)(6486002)(66946007)(6512007)(4326008)(6246003)(31696002)(186003)(446003)(46003)(2201001)(25786009)(450100002)(6116002)(11346002)(478600001)(316002)(229853002)(58126008)(31686004)(14454004)(7736002)(305945005)(110136005)(6506007)(2906002)(386003)(476003)(486006)(256004)(71190400001)(5660300002)(71200400001)(99286004)(52116002)(53546011)(2616005)(36756003)(76176011)(81166006)(81156014)(102836004)(8676002)(8936002)(65806001)(65956001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1778;
 H:BN6PR12MB1699.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 26zz3u2XwB5TMZeZKPa0Ec/c+3yZ946MofEt33xsCx7OqkbTYGu1lU4JnElFtgiLaNE0OJ//LcGxUoc+9LIspVvIEPtnI5CxfT/JEw8x6ymYSYjjlRghVeu/GwcjYltwixV+Fk8xwk8uPImV3TKRglkdO8NDOdI7J+hufnvFiMcILPjcnDXRKWQ3R/A3WJTiGChi4mJd+P+KI4srfmpkY6/FjXwismySP/Xvby+yeMo4BUQKbdRwjOkms3byxsbSEviiP3QUKuqEaPN46oogpT8MVHMS1B4A5t+p5QDaxTE7LwSIDIF8FhaoPZI5NAJHxyiBbA62GBNpSOa+CB8RQWXdF1eKlSCz3dqUBrDqcr6ZPbrkFMJltbzqScIDQ1WH4PBaPsGUxmgop2sMtRkgTXMeoHjtd4dzKqPmQI8uto/5LJoZMGD+B91dyIm6JRoh
Content-ID: <F4D06F26264ACD468EA9F25563C924AF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9edb116c-0b63-4c48-42ad-08d759643bf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 15:58:53.7143 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3isWS0BnATfAPLVQGBa9m0i2lE6B6IwzTILufhS4ji7ZBURd0AkjNghpMpHJcPwJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1778
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNO3D1tqCeJGkrjlvgBNkz16WHLc6Ud8OqXHjfECmc0=;
 b=TVxh4dNHQ2jz12q4ywAVXl0G5gXg0BkKvzn8NNmrQSfv/h6+Dn3cSfI9j0tXSMJ8FIhpLNNb0Az55HF8rkZREUKY+MolD2DxoL6R6UiA2VqF3VPl1/mJ1pHhdEOwmStareQIJB3QAc9ONHkw1z5fkG7GbsZGltR9aT12uy6INsM=
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

QW0gMjUuMTAuMTkgdW0gMTc6NTYgc2NocmllYiBHcm9kem92c2t5LCBBbmRyZXk6DQo+IE9uIDEw
LzI1LzE5IDExOjU1IEFNLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToNCj4+IEFtIDI1LjEwLjE5
IHVtIDE2OjU3IHNjaHJpZWIgR3JvZHpvdnNreSwgQW5kcmV5Og0KPj4+IE9uIDEwLzI1LzE5IDQ6
NDQgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+Pj4+IEFtIDI0LjEwLjE5IHVtIDIxOjU3
IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6DQo+Pj4+PiBQcm9ibGVtOg0KPj4+Pj4gV2hlbiBy
dW5fam9iIGZhaWxzIGFuZCBIVyBmZW5jZSByZXR1cm5lZCBpcyBOVUxMIHdlIHN0aWxsIHNpZ25h
bA0KPj4+Pj4gdGhlIHNfZmVuY2UgdG8gYXZvaWQgaGFuZ3MgYnV0IHRoZSB1c2VyIGhhcyBubyB3
YXkgb2Yga25vd2luZyBpZg0KPj4+Pj4gdGhlIGFjdHVhbCBIVyBqb2Igd2FzIHJhbiBhbmQgZmlu
aXNoZWQuDQo+Pj4+Pg0KPj4+Pj4gRml4Og0KPj4+Pj4gQWxsb3cgLnJ1bl9qb2IgaW1wbGVtZW50
YXRpb25zIHRvIHJldHVybiBFUlJfUFRSIGluIHRoZSBmZW5jZSBwb2ludGVyDQo+Pj4+PiByZXR1
cm5lZCBhbmQgdGhlbiBzZXQgdGhpcyBlcnJvciBmb3Igc19mZW5jZS0+ZmluaXNoZWQgZmVuY2Ug
c28gd2hvZXZlcg0KPj4+Pj4gd2FpdCBvbiB0aGlzIGZlbmNlIGNhbiBpbnNwZWN0IHRoZSBzaWdu
YWxlZCBmZW5jZSBmb3IgYW4gZXJyb3IuDQo+Pj4+Pg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+DQo+Pj4+PiAtLS0NCj4+
Pj4+ICAgIMKgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIHwgMTkgKysr
KysrKysrKysrKysrKy0tLQ0KPj4+Pj4gICAgwqAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pj4+Pg0KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9z
Y2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+Pj4+PiBpbmRleCA5YTBlZTc0Li5mMzliOTdlIDEwMDY0
NA0KPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4+
Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+Pj4+PiBA
QCAtNDc5LDYgKzQ3OSw3IEBAIHZvaWQgZHJtX3NjaGVkX3Jlc3VibWl0X2pvYnMoc3RydWN0DQo+
Pj4+PiBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpDQo+Pj4+PiAgICDCoMKgwqDCoMKgIHN0cnVj
dCBkcm1fc2NoZWRfam9iICpzX2pvYiwgKnRtcDsNCj4+Pj4+ICAgIMKgwqDCoMKgwqAgdWludDY0
X3QgZ3VpbHR5X2NvbnRleHQ7DQo+Pj4+PiAgICDCoMKgwqDCoMKgIGJvb2wgZm91bmRfZ3VpbHR5
ID0gZmFsc2U7DQo+Pj4+PiArwqDCoMKgIHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlOw0KPj4+Pj4g
ICAgwqAgwqDCoMKgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoc19qb2IsIHRtcCwNCj4+
Pj4+ICZzY2hlZC0+cmluZ19taXJyb3JfbGlzdCwgbm9kZSkgew0KPj4+Pj4gICAgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBkcm1fc2NoZWRfZmVuY2UgKnNfZmVuY2UgPSBzX2pvYi0+c19mZW5j
ZTsNCj4+Pj4+IEBAIC00OTIsNyArNDkzLDE2IEBAIHZvaWQgZHJtX3NjaGVkX3Jlc3VibWl0X2pv
YnMoc3RydWN0DQo+Pj4+PiBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpDQo+Pj4+PiAgICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfZmVuY2Vfc2V0X2Vycm9yKCZzX2ZlbmNlLT5maW5p
c2hlZCwgLUVDQU5DRUxFRCk7DQo+Pj4+PiAgICDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2Zl
bmNlX3B1dChzX2pvYi0+c19mZW5jZS0+cGFyZW50KTsNCj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBz
X2pvYi0+c19mZW5jZS0+cGFyZW50ID0gc2NoZWQtPm9wcy0+cnVuX2pvYihzX2pvYik7DQo+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgZmVuY2UgPSBzY2hlZC0+b3BzLT5ydW5fam9iKHNfam9iKTsNCj4+
Pj4+ICsNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoSVNfRVJSX09SX05VTEwoZmVuY2UpKSB7
DQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzX2pvYi0+c19mZW5jZS0+cGFyZW50ID0g
TlVMTDsNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9zZXRfZXJyb3Io
JnNfZmVuY2UtPmZpbmlzaGVkLCBQVFJfRVJSKGZlbmNlKSk7DQo+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgfSBlbHNlIHsNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNfam9iLT5zX2ZlbmNl
LT5wYXJlbnQgPSBmZW5jZTsNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+Pj4+PiArDQo+Pj4+
PiArDQo+Pj4+IE1heWJlIHRpbWUgZm9yIGEgZHJtX3NjaGVkX3J1bl9qb2IoKSBmdW5jdGlvbiB3
aGljaCBkb2VzIHRoYXQNCj4+Pj4gaGFuZGxpbmc/IEFuZCB3aHkgZG9uJ3Qgd2UgbmVlZCB0byBp
bnN0YWxsIHRoZSBjYWxsYmFjayBoZXJlPw0KPj4+IFdoYXQgY29kZSBkbyB5b3Ugd2FudCB0byBw
dXQgaW4gZHJtX3NjaGVkX3J1bl9qb2IgPw0KPj4+DQo+Pj4gV2UgcmVpbnN0YWxsIHRoZSBjYWxs
YmFjayBsYXRlciBpbiBkcm1fc2NoZWRfc3RhcnQsDQo+Pj4gZHJtX3NjaGVkX3Jlc3VibWl0X2pv
YnMgaXMgY29uZGl0aW9uYWwgb24gd2hldGhlciB0aGUgZ3VpbHR5IGZlbmNlIGRpZA0KPj4+IHNp
Z25hbCBieSB0aGlzIHRpbWUgb3Igbm90IGFuZCBzbyB0aGUgc3BsaXQgb2YgdGhlIGxvZ2ljIGlu
dG8NCj4+PiBkcm1fc2NoZWRfc3RhcnQgYW5kIGRybV9zY2hlZF9yZXN1Ym1pdF9qb2JzLg0KPj4g
QWgsIHllcyBvZiBjb3Vyc2UuIEluIHRoaXMgY2FzZSB0aGUgcGF0Y2ggaXMgUmV2aWV3ZWQtYnk6
IENocmlzdGlhbg0KPj4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Lg0KPj4NCj4+
IFJlZ2FyZHMsDQo+PiBDaHJpc3RpYW4uDQo+DQo+IFRoYW5rcywgdGhlcmUgaXMgYWxzbyAyLzIg
cGF0Y2ggZm9yIGFtZGdwdSwgcGxlYXNlIHRha2UgYSBsb29rLg0KDQpTZWVuIHRoYXQsIGZlZWwg
ZnJlZSB0byBhZGQgbXkgcmIgYXMgd2VsbC4NCg0KQ2hyaXN0aWFuLg0KDQo+DQo+IEFuZHJleQ0K
Pg0KPg0KPj4+IEFuZHJleQ0KPj4+DQo+Pj4NCj4+Pj4gQXBhcnQgZnJvbSB0aGF0IGxvb2tzIGdv
b2QgdG8gbWUsDQo+Pj4+IENocmlzdGlhbi4NCj4+Pj4NCj4+Pj4+ICAgIMKgwqDCoMKgwqAgfQ0K
Pj4+Pj4gICAgwqAgfQ0KPj4+Pj4gICAgwqAgRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfcmVzdWJt
aXRfam9icyk7DQo+Pj4+PiBAQCAtNzIwLDcgKzczMCw3IEBAIHN0YXRpYyBpbnQgZHJtX3NjaGVk
X21haW4odm9pZCAqcGFyYW0pDQo+Pj4+PiAgICDCoMKgwqDCoMKgwqDCoMKgwqAgZmVuY2UgPSBz
Y2hlZC0+b3BzLT5ydW5fam9iKHNjaGVkX2pvYik7DQo+Pj4+PiAgICDCoMKgwqDCoMKgwqDCoMKg
wqAgZHJtX3NjaGVkX2ZlbmNlX3NjaGVkdWxlZChzX2ZlbmNlKTsNCj4+Pj4+ICAgIMKgIC3CoMKg
wqDCoMKgwqDCoCBpZiAoZmVuY2UpIHsNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIUlTX0VS
Ul9PUl9OVUxMKGZlbmNlKSkgew0KPj4+Pj4gICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c19mZW5jZS0+cGFyZW50ID0gZG1hX2ZlbmNlX2dldChmZW5jZSk7DQo+Pj4+PiAgICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByID0gZG1hX2ZlbmNlX2FkZF9jYWxsYmFjayhmZW5jZSwgJnNj
aGVkX2pvYi0+Y2IsDQo+Pj4+PiAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1fc2NoZWRfcHJvY2Vzc19qb2IpOw0KPj4+Pj4gQEAg
LTczMCw4ICs3NDAsMTEgQEAgc3RhdGljIGludCBkcm1fc2NoZWRfbWFpbih2b2lkICpwYXJhbSkN
Cj4+Pj4+ICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX0VSUk9SKCJm
ZW5jZSBhZGQgY2FsbGJhY2sgZmFpbGVkICglZClcbiIsDQo+Pj4+PiAgICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHIpOw0KPj4+Pj4gICAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3B1dChmZW5jZSk7DQo+Pj4+PiAtwqDCoMKgwqDC
oMKgwqAgfSBlbHNlDQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsNCj4+Pj4+ICsNCj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9zZXRfZXJyb3IoJnNfZmVuY2Ut
PmZpbmlzaGVkLCBQVFJfRVJSKGZlbmNlKSk7DQo+Pj4+PiAgICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBkcm1fc2NoZWRfcHJvY2Vzc19qb2IoTlVMTCwgJnNjaGVkX2pvYi0+Y2IpOw0KPj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIH0NCj4+Pj4+ICAgIMKgIMKgwqDCoMKgwqDCoMKgwqDCoCB3YWtl
X3VwKCZzY2hlZC0+am9iX3NjaGVkdWxlZCk7DQo+Pj4+PiAgICDCoMKgwqDCoMKgIH0NCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
