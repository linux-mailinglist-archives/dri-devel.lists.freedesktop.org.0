Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 097E6E33D3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 15:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26B96E3F5;
	Thu, 24 Oct 2019 13:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810082.outbound.protection.outlook.com [40.107.81.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61836E3F5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 13:19:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBe1DfOFp0yLp38SmVNIkzsORb/kqC7N9EF8dv8o/WLknWxmNu918luH6sLl8viIZ1CsOOuwVYGZHh22zYBV87V22D+2OfWVQSNwBcWawnxNmVCpZz5TBCrCtqv4d5vLqx+kYBumkIgsSVfdaIUE2yz4kwJBnXQTAmCp6zB3RerPl2T57Fv4VLjepoikNInPW1w5a5r8IkVOGogN9bG+RXXCA4JE6jVkKR8iGgie+Cj1Zh09ZJmY7q1PAFuyL7IzzOGvmj6uu7aGlzlJjIPjeU1I5VDrCrNoM5DdLkZv0NPYSKnc0E4WA0wl5ZbZtDgitQxPx7LzZLwlWk9zO9VQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nO1qE5SQOp5WW2lFsGdDhU85DDT7bSTXVTZxIdf15Aw=;
 b=Xs0+l36y1LYWgtHf1iB58ybboZXxU5VbbBNT3vTHb4ysm9TnD8Ph6vVIftWZmMNOODIWC/t0ja7lOP3eaLU2LDslDKDUGrqCSEMo+gs7pdEu9ZMp7YcxEl4l6dpmNREkgVKiL9E5g169u/3BIjAxSgyZvf9jd86/q05WXID+6uRtOX5V8EMd5SlfTlkXcHxhLO2DiCLbAPubWdGFZIfDYUfjODk7crUuyfB71A6ggeyn9zkwhToVN9/UZA4Oi//VpSFvsHe81HuqXwRZiCYi5lkh1rJJM1cfqt83QsVnfRufNkFcLrx8oGYtXQDzFxtGF+aLYG8+nrjSeQWIl/62yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1406.namprd12.prod.outlook.com (10.169.207.13) by
 MWHPR12MB1824.namprd12.prod.outlook.com (10.175.55.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.23; Thu, 24 Oct 2019 13:19:25 +0000
Received: from MWHPR12MB1406.namprd12.prod.outlook.com
 ([fe80::3c7f:e5d7:435e:96b9]) by MWHPR12MB1406.namprd12.prod.outlook.com
 ([fe80::3c7f:e5d7:435e:96b9%12]) with mapi id 15.20.2387.021; Thu, 24 Oct
 2019 13:19:25 +0000
From: Chunming Zhou <zhoucm1@amd.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/syncobj: extend syncobj query ability v3
Thread-Topic: [PATCH] drm/syncobj: extend syncobj query ability v3
Thread-Index: AQHVRtcNUs07r5tgiUqd+Ak68kvZFKbjJKwAgAABCwCAhguJgIABHE8A
Date: Thu, 24 Oct 2019 13:19:25 +0000
Message-ID: <be07272e-6cd1-e933-ba07-5a4bc28da40f@amd.com>
References: <20190730130208.30977-1-david1.zhou@amd.com>
 <cfd2ad24-9210-0ba6-bc36-7cc44ac92112@amd.com>
 <78e2e61f-6faa-94e2-8583-faa6313eb423@amd.com>
 <CAMavQK+QEixyOYcv20aO0R9xAokJjz_9G_8SkE=H==wFSFVDPQ@mail.gmail.com>
In-Reply-To: <CAMavQK+QEixyOYcv20aO0R9xAokJjz_9G_8SkE=H==wFSFVDPQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR0302CA0015.apcprd03.prod.outlook.com
 (2603:1096:202::25) To MWHPR12MB1406.namprd12.prod.outlook.com
 (2603:10b6:300:14::13)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 600b0c01-6698-4dbc-e4fc-08d75884ca24
x-ms-traffictypediagnostic: MWHPR12MB1824:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB18240F77627956CFB7F95CD2B46A0@MWHPR12MB1824.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0200DDA8BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(199004)(189003)(8936002)(6116002)(3846002)(14454004)(2906002)(36756003)(52116002)(76176011)(66556008)(99286004)(2616005)(66446008)(386003)(6506007)(53546011)(66476007)(6436002)(11346002)(446003)(486006)(102836004)(26005)(71200400001)(71190400001)(186003)(31686004)(64756008)(5660300002)(6306002)(6512007)(256004)(305945005)(31696002)(6246003)(7736002)(8676002)(81156014)(316002)(476003)(66946007)(81166006)(966005)(25786009)(4326008)(229853002)(478600001)(66066001)(6486002)(54906003)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1824;
 H:MWHPR12MB1406.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +SB/F2rpVGcyp6B7TMx5PHnhwvprFj6zRH17SVqaQntFEIvttOrHdzfNuNAuaglPUXwL7Ai6G8AdphxsKqNS0OfyYsfS8jjsXKw3FxSt2h83H8z/6HY93WgwKp068SlHLj828RMVuPOefTZlU+GCMGmb5c8KhRKi6BwbN8esc9/BmMo0PGvVte2v8wddxFu3S8kpnRRIR8pl/xsgE3AnifOoELMUeMaenmKP6BnWmq6FJyyZOa+y+p2zvKrn5vZ4S/A8jH3ivG+TTAZneqcsnn3hjIwdi837cree7/aEm3117HBUBOW8s2RmZ5pXvCtdYutk0d8LoVU5r7j9pwbxhrYZ1OmwnbH+7DElshl6fToK/G6Bkq6047ZKgbjN1jxF+g/70ZkYGZff3QQuMGI2qG9+7X/D+fKlVEwGumcBy7bZsxVbM9LjwmA0WnU2Rcna0R+XoPZZB3mb6pKHNKwek1xdm6doGwjCqBuZlRo/Vg4=
Content-ID: <2E8CB72D8169F04E859032F280D3F775@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 600b0c01-6698-4dbc-e4fc-08d75884ca24
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2019 13:19:25.0785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ELaHcIaMni7T3tnBZcjBXbbrEIJnX2STe7VXtTnbRlgZaRlILjYjTccIcPHnYcY/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1824
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nO1qE5SQOp5WW2lFsGdDhU85DDT7bSTXVTZxIdf15Aw=;
 b=JTiNU2LMA/M0SbCYm4P4qw4vDeg4h6e7+pMq3gBEt3OL9RR7CkD9vy6BTe1qwQXVzmpNgETSpnzYnm32RsGNoWsC3o0oLCTiVytjreiFV9OL4qnbx8g5UH9SWjq8JLoExw9/ixwzmj9btlXukoDG4KjN1dJLzUODfNp91wRoyIM=
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQrlnKggMjAxOS8xMC8yNCA0OjIxLCBTZWFuIFBhdWwg5YaZ6YGTOg0KPiBPbiBUdWUsIEp1bCAz
MCwgMjAxOSBhdCA5OjIyIEFNIENodW5taW5nIFpob3UgPHpob3VjbTFAYW1kLmNvbT4gd3JvdGU6
DQo+Pg0KPj4g5ZyoIDIwMTkvNy8zMCAyMToxNywgS29lbmlnLCBDaHJpc3RpYW4g5YaZ6YGTOg0K
Pj4+IEFtIDMwLjA3LjE5IHVtIDE1OjAyIHNjaHJpZWIgQ2h1bm1pbmcgWmhvdToNCj4+Pj4gdXNl
ciBzcGFjZSBuZWVkcyBhIGZsZXhpYWJsZSBxdWVyeSBhYmlsaXR5Lg0KPj4+PiBTbyB0aGF0IHVt
ZCBjYW4gZ2V0IGxhc3Qgc2lnbmFsZWQgb3Igc3VibWl0dGVkIHBvaW50Lg0KPj4+PiB2MjoNCj4+
Pj4gYWRkIHNhbml0aXplciBjaGVja2luZy4NCj4+Pj4gdjM6DQo+Pj4+IHJlYmFzZQ0KPj4+Pg0K
Pj4+PiBDaGFuZ2UtSWQ6IEk2NTEyYjQzMDUyNGViYWJlNzE1ZTYwMmEyYmY1YWJiMGE3ZTc4MGVh
DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IENodW5taW5nIFpob3UgPGRhdmlkMS56aG91QGFtZC5jb20+
DQo+Pj4+IENjOiBMaW9uZWwgTGFuZHdlcmxpbiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5j
b20+DQo+Pj4+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+
DQo+Pj4+IFJldmlld2VkLWJ5OiBMaW9uZWwgTGFuZHdlcmxpbiA8bGlvbmVsLmcubGFuZHdlcmxp
bkBpbnRlbC5jb20+DQo+Pj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPg0KPj4+DQo+Pj4gTGlvbmVsIGlzIHRoZSBJbnRlbCBjb2RlIHVzaW5n
IHRoaXMgYWxyZWFkeSBwdWJsaWM/IE9yIERhdmlkIGFueSBjaGFuY2UNCj4+PiB0aGF0IHdlIGNh
biBnZXQgYSBwdWJsaWMgYW1kdmxrIHJlbGVhc2UgdXNpbmcgdGhpcz8NCj4+IEluIGxhdGVzdCBw
dWJsaWMgYW1kdmxrLCBXZSBzaG91bGQgYmUgYWJsZSB0byBzZWUgaG93IHRpbWVsaW5lIHN5bmNv
YmoNCj4+IGlzIHVzZWQgaW4gaXQuDQo+Pg0KPiBJIGNvdWxkbid0IGZpbmQgdGhpcyBhbnl3aGVy
ZSwgY291bGQgeW91IHBsZWFzZSBwcm92aWRlIGEgbGluaz8NCg0KaHR0cHM6Ly9naXRodWIuY29t
L0dQVU9wZW4tRHJpdmVycy94Z2wvYmxvYi9kZXYvaWNkL2FwaS92a19zZW1hcGhvcmUuY3BwDQoN
CllvdSBjYW4gY2hlY2sgdGhlIHNvdXJjZSBoZXJlLg0KDQoNCkNoZWVycywNCg0KLURhdmlkDQoN
Cj4NCj4gU2Vhbg0KPg0KPj4gLURhdmlkDQo+Pg0KPj4+IENocmlzdGlhbi4NCj4+Pg0KPj4+PiAt
LS0NCj4+Pj4gICAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIHwgMzcgKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0NCj4+Pj4gICAgIGluY2x1ZGUvdWFwaS9kcm0vZHJt
LmggICAgICAgIHwgIDMgKystDQo+Pj4+ICAgICAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlv
bnMoKyksIDE2IGRlbGV0aW9ucygtKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9zeW5jb2JqLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYw0KPj4+
PiBpbmRleCBjZWNmZjJlNDQ3YjEuLmQ0NDMyZjE1MTNhYyAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMNCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9zeW5jb2JqLmMNCj4+Pj4gQEAgLTExOTcsNyArMTE5Nyw3IEBAIGRybV9zeW5jb2JqX3RpbWVs
aW5lX3NpZ25hbF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLA0KPj4+
PiAgICAgICBpZiAoIWRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfU1lOQ09CSl9U
SU1FTElORSkpDQo+Pj4+ICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPj4+Pg0K
Pj4+PiAtICAgIGlmIChhcmdzLT5wYWQgIT0gMCkNCj4+Pj4gKyAgICBpZiAoYXJncy0+ZmxhZ3Mg
IT0gMCkNCj4+Pj4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+Pj4NCj4+Pj4gICAg
ICAgaWYgKGFyZ3MtPmNvdW50X2hhbmRsZXMgPT0gMCkNCj4+Pj4gQEAgLTEyNjgsNyArMTI2OCw3
IEBAIGludCBkcm1fc3luY29ial9xdWVyeV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2
b2lkICpkYXRhLA0KPj4+PiAgICAgICBpZiAoIWRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBE
UklWRVJfU1lOQ09CSl9USU1FTElORSkpDQo+Pj4+ICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BO
T1RTVVBQOw0KPj4+Pg0KPj4+PiAtICAgIGlmIChhcmdzLT5wYWQgIT0gMCkNCj4+Pj4gKyAgICBp
ZiAoYXJncy0+ZmxhZ3MgJiB+RFJNX1NZTkNPQkpfUVVFUllfRkxBR1NfTEFTVF9TVUJNSVRURUQp
DQo+Pj4+ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4+DQo+Pj4+ICAgICAgIGlm
IChhcmdzLT5jb3VudF9oYW5kbGVzID09IDApDQo+Pj4+IEBAIC0xMjg5LDI1ICsxMjg5LDMyIEBA
IGludCBkcm1fc3luY29ial9xdWVyeV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lk
ICpkYXRhLA0KPj4+PiAgICAgICAgICAgICAgIGZlbmNlID0gZHJtX3N5bmNvYmpfZmVuY2VfZ2V0
KHN5bmNvYmpzW2ldKTsNCj4+Pj4gICAgICAgICAgICAgICBjaGFpbiA9IHRvX2RtYV9mZW5jZV9j
aGFpbihmZW5jZSk7DQo+Pj4+ICAgICAgICAgICAgICAgaWYgKGNoYWluKSB7DQo+Pj4+IC0gICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBkbWFfZmVuY2UgKml0ZXIsICpsYXN0X3NpZ25hbGVkID0g
TlVMTDsNCj4+Pj4gLQ0KPj4+PiAtICAgICAgICAgICAgICAgICAgICBkbWFfZmVuY2VfY2hhaW5f
Zm9yX2VhY2goaXRlciwgZmVuY2UpIHsNCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBpZiAoaXRlci0+Y29udGV4dCAhPSBmZW5jZS0+Y29udGV4dCkgew0KPj4+PiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZG1hX2ZlbmNlX3B1dChpdGVyKTsNCj4+Pj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIEl0IGlzIG1vc3QgbGlrZWx5IHRo
YXQgdGltZWxpbmUgaGFzDQo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKiB1bm9yZGVyIHBvaW50cy4gKi8NCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJyZWFrOw0KPj4+PiArICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZG1hX2Zl
bmNlICppdGVyLCAqbGFzdF9zaWduYWxlZCA9DQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZG1hX2ZlbmNlX2dldChmZW5jZSk7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgaWYgKGFyZ3MtPmZsYWdzICYNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgIERS
TV9TWU5DT0JKX1FVRVJZX0ZMQUdTX0xBU1RfU1VCTUlUVEVEKSB7DQo+Pj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcG9pbnQgPSBmZW5jZS0+c2Vxbm87DQo+Pj4+ICsgICAgICAgICAg
ICAgICAgICAgIH0gZWxzZSB7DQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgZG1h
X2ZlbmNlX2NoYWluX2Zvcl9lYWNoKGl0ZXIsIGZlbmNlKSB7DQo+Pj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpZiAoaXRlci0+Y29udGV4dCAhPSBmZW5jZS0+Y29udGV4
dCkgew0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBk
bWFfZmVuY2VfcHV0KGl0ZXIpOw0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAvKiBJdCBpcyBtb3N0IGxpa2VseSB0aGF0IHRpbWVsaW5lIGhhcw0KPj4+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIHVub3JkZXIg
cG9pbnRzLiAqLw0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBicmVhazsNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0N
Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRtYV9mZW5jZV9wdXQo
bGFzdF9zaWduYWxlZCk7DQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBsYXN0X3NpZ25hbGVkID0gZG1hX2ZlbmNlX2dldChpdGVyKTsNCj4+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfQ0KPj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRt
YV9mZW5jZV9wdXQobGFzdF9zaWduYWxlZCk7DQo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbGFzdF9zaWduYWxlZCA9IGRtYV9mZW5jZV9nZXQoaXRlcik7DQo+Pj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcG9pbnQgPSBkbWFfZmVuY2VfaXNfc2lnbmFsZWQobGFzdF9z
aWduYWxlZCkgPw0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGFz
dF9zaWduYWxlZC0+c2Vxbm8gOg0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdG9fZG1hX2ZlbmNlX2NoYWluKGxhc3Rfc2lnbmFsZWQpLT5wcmV2X3NlcW5vOw0KPj4+
PiAgICAgICAgICAgICAgICAgICAgICAgfQ0KPj4+PiAtICAgICAgICAgICAgICAgICAgICBwb2lu
dCA9IGRtYV9mZW5jZV9pc19zaWduYWxlZChsYXN0X3NpZ25hbGVkKSA/DQo+Pj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbGFzdF9zaWduYWxlZC0+c2Vxbm8gOg0KPj4+PiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHRvX2RtYV9mZW5jZV9jaGFpbihsYXN0X3NpZ25hbGVkKS0+
cHJldl9zZXFubzsNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgIGRtYV9mZW5jZV9wdXQobGFz
dF9zaWduYWxlZCk7DQo+Pj4+ICAgICAgICAgICAgICAgfSBlbHNlIHsNCj4+Pj4gICAgICAgICAg
ICAgICAgICAgICAgIHBvaW50ID0gMDsNCj4+Pj4gICAgICAgICAgICAgICB9DQo+Pj4+ICsgICAg
ICAgICAgICBkbWFfZmVuY2VfcHV0KGZlbmNlKTsNCj4+Pj4gICAgICAgICAgICAgICByZXQgPSBj
b3B5X3RvX3VzZXIoJnBvaW50c1tpXSwgJnBvaW50LCBzaXplb2YodWludDY0X3QpKTsNCj4+Pj4g
ICAgICAgICAgICAgICByZXQgPSByZXQgPyAtRUZBVUxUIDogMDsNCj4+Pj4gICAgICAgICAgICAg
ICBpZiAocmV0KQ0KPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm0uaCBiL2lu
Y2x1ZGUvdWFwaS9kcm0vZHJtLmgNCj4+Pj4gaW5kZXggNjYxZDczZjlhOTE5Li5mZDk4N2NlMjRk
OWYgMTAwNjQ0DQo+Pj4+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtLmgNCj4+Pj4gKysrIGIv
aW5jbHVkZS91YXBpL2RybS9kcm0uaA0KPj4+PiBAQCAtNzc3LDExICs3NzcsMTIgQEAgc3RydWN0
IGRybV9zeW5jb2JqX2FycmF5IHsNCj4+Pj4gICAgICAgX191MzIgcGFkOw0KPj4+PiAgICAgfTsN
Cj4+Pj4NCj4+Pj4gKyNkZWZpbmUgRFJNX1NZTkNPQkpfUVVFUllfRkxBR1NfTEFTVF9TVUJNSVRU
RUQgKDEgPDwgMCkgLyogbGFzdCBhdmFpbGFibGUgcG9pbnQgb24gdGltZWxpbmUgc3luY29iaiAq
Lw0KPj4+PiAgICAgc3RydWN0IGRybV9zeW5jb2JqX3RpbWVsaW5lX2FycmF5IHsNCj4+Pj4gICAg
ICAgX191NjQgaGFuZGxlczsNCj4+Pj4gICAgICAgX191NjQgcG9pbnRzOw0KPj4+PiAgICAgICBf
X3UzMiBjb3VudF9oYW5kbGVzOw0KPj4+PiAtICAgIF9fdTMyIHBhZDsNCj4+Pj4gKyAgICBfX3Uz
MiBmbGFnczsNCj4+Pj4gICAgIH07DQo+Pj4+DQo+Pj4+DQo+PiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdA0K
Pj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
