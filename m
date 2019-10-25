Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FC7E5096
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 17:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328EC6EAD5;
	Fri, 25 Oct 2019 15:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690058.outbound.protection.outlook.com [40.107.69.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24076EAD3;
 Fri, 25 Oct 2019 15:56:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gscPbvuKXO67nJiW0Ou2Hui3W17nNDMNMhUz+ddU5aqNMBstgU/ykQbOafwS4rI5+XBs8jfZcHw7i3LzoAYIYnE7VzJz10Hhzm0aYgoLIfk71JIjbB5sswqxq4eESSTqk9NW98pSHMbD9slYHHhFHfjzOAtfCYAO/sSiDTf6jrfHi2pDbAaF6wrsKsUFWM2XLwFcuApE+coSn8+hQa8YYTafWcMNHUSL4oMlNtNjWAsocVS1oNnYwMB+aXrsC1jXaSeSWrv7BfQ9bmk27qToG4Tg/0O9gbpBjwpunqVEroEYfwUD7+TD2MtYcI6mxupSpm9p/ep5tj3iGk5cw+HLWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GwYKb0PZ8MA137Mbe9khzI8XfS/8ZgQRb5FgIChfwo=;
 b=KvuZm+hi8xQToqN4TG5JGBZ5OyZUAMsRDXchH+4KrL5O/YDJ8QrDPvc/fVZY7S3WIH7pjpTZy3+zDHjwP6HV6xNMv1Nf3yFA0/vL1kU4/OyjByIZERQyxPWePy3d3SeGyYsEW0cRYsNBlPZRp1HETZcAKZCVOKY2agL5JglCESpiTNThtZf5mP7noBm54vjN2UqP/KgFc0scneIVPN/uQzFGyV2+13ygq0efP36CrEYbTcQg3xGoA3OiQEcTx3qlnEeQjM6EJwkQLqO9dFN0N22Ck74IFxHN4ajQ163mMnTSSFn1ECd/JJdFIwDuUUzZZSR1YPEM2OfLhMN3vaeULQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1744.namprd12.prod.outlook.com (10.175.54.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.23; Fri, 25 Oct 2019 15:56:02 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::3963:88a3:88f1:4a1d]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::3963:88a3:88f1:4a1d%4]) with mapi id 15.20.2387.023; Fri, 25 Oct 2019
 15:56:02 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/sched: Set error to s_fence if HW job submission
 failed.
Thread-Topic: [PATCH 1/2] drm/sched: Set error to s_fence if HW job submission
 failed.
Thread-Index: AQHViqVHSP5ADE+zREm+JapbWXlE4qdrC4uAgABoEgCAABAyAIAAAEmA
Date: Fri, 25 Oct 2019 15:56:02 +0000
Message-ID: <5e9adae4-f4d4-cfd2-f3ee-6f78332ef19c@amd.com>
References: <1571947050-26276-1-git-send-email-andrey.grodzovsky@amd.com>
 <dbc0cddf-e1e1-fa36-df26-b784aea6dc12@gmail.com>
 <1638959e-08ef-3a24-babc-5cbddcae0575@amd.com>
 <d6754afb-706b-64b7-758e-c19f67db7625@amd.com>
In-Reply-To: <d6754afb-706b-64b7-758e-c19f67db7625@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::15) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b9b74b3b-9ae7-496a-1543-08d75963d598
x-ms-traffictypediagnostic: MWHPR12MB1744:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB17443489EF90457C6286D1F9EA650@MWHPR12MB1744.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(199004)(189003)(316002)(81166006)(476003)(11346002)(6436002)(25786009)(256004)(305945005)(2501003)(31696002)(6512007)(7736002)(6246003)(66946007)(6486002)(8676002)(66476007)(86362001)(81156014)(4326008)(229853002)(478600001)(450100002)(66066001)(76176011)(52116002)(36756003)(8936002)(110136005)(6116002)(3846002)(2906002)(14454004)(186003)(31686004)(71200400001)(71190400001)(5660300002)(386003)(2616005)(6506007)(446003)(64756008)(66446008)(2201001)(53546011)(99286004)(102836004)(26005)(66556008)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1744;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vgZQ6dHm0/VxfzZEQReeULZPlVHxMaWWlni8Xrcb2cE1bimV4ZgFImCq6edahWGR7TTvQjS0xiCavN+dbY7VZ5kQnOaJUAV8KFdQsu4JvwMYq0OH80y+aM+WOuXCXrstHZzVGZTuza+rpRDgtiWDYfpwDPaTHA3L6Y53MsGgRM5ZJbMwvy/eFYEh0USV2tqKB4sjyw3QPug3HtemaNiK9JPGGdbZPONb+yX/0JiA/0cU9NfiaL0/dEN41Xtzz0X2hus8+OsZYFMUH2M/4PgzcRINi+wJmHbaTMf0fVXvkTnNlyiNdq8ZwYS4I43Cn1DW4SDFA8BWbUGnwdJ8d3YKTBZ6rRvEz2HcTAzf5av7dmtAu8kXLB/mLLUoFIoDkM3DxnwXS3hnYtqrJ9In6CjKz0jJsI+lI0YgkD+LsV77gXccMpnlqeGTYAOoY4djJX4W
Content-ID: <3307B0A201830646AE309E1835A28ABB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b74b3b-9ae7-496a-1543-08d75963d598
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 15:56:02.0740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: auiZ6RSXfH6EbAT6/ct8mNyo2k1Qs8lFgv2+P2nc7zHVLxyLxJMr4RtoX5d3iL0hQxQcuzisBbvRBx22DlE3+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1744
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GwYKb0PZ8MA137Mbe9khzI8XfS/8ZgQRb5FgIChfwo=;
 b=2IGtECQ2CY1czjY4tGtDCmxNcwroMaWJVqMzL1/5WejAPDVT6AtyRF8fYrU7oMa6DlrszPKVDm7SiXHu6bEI01xDYUDefCrOCrRXJK3bmvbgi4BsCMQm9ItZCoxa4dRfOnF1nO6rFIdRSsclHKZNvSut8/CMQxR5wKPA3/9pcfk=
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

DQpPbiAxMC8yNS8xOSAxMTo1NSBBTSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6DQo+IEFtIDI1
LjEwLjE5IHVtIDE2OjU3IHNjaHJpZWIgR3JvZHpvdnNreSwgQW5kcmV5Og0KPj4gT24gMTAvMjUv
MTkgNDo0NCBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4+PiBBbSAyNC4xMC4xOSB1bSAy
MTo1NyBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Og0KPj4+PiBQcm9ibGVtOg0KPj4+PiBXaGVu
IHJ1bl9qb2IgZmFpbHMgYW5kIEhXIGZlbmNlIHJldHVybmVkIGlzIE5VTEwgd2Ugc3RpbGwgc2ln
bmFsDQo+Pj4+IHRoZSBzX2ZlbmNlIHRvIGF2b2lkIGhhbmdzIGJ1dCB0aGUgdXNlciBoYXMgbm8g
d2F5IG9mIGtub3dpbmcgaWYNCj4+Pj4gdGhlIGFjdHVhbCBIVyBqb2Igd2FzIHJhbiBhbmQgZmlu
aXNoZWQuDQo+Pj4+DQo+Pj4+IEZpeDoNCj4+Pj4gQWxsb3cgLnJ1bl9qb2IgaW1wbGVtZW50YXRp
b25zIHRvIHJldHVybiBFUlJfUFRSIGluIHRoZSBmZW5jZSBwb2ludGVyDQo+Pj4+IHJldHVybmVk
IGFuZCB0aGVuIHNldCB0aGlzIGVycm9yIGZvciBzX2ZlbmNlLT5maW5pc2hlZCBmZW5jZSBzbyB3
aG9ldmVyDQo+Pj4+IHdhaXQgb24gdGhpcyBmZW5jZSBjYW4gaW5zcGVjdCB0aGUgc2lnbmFsZWQg
ZmVuY2UgZm9yIGFuIGVycm9yLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3Jv
ZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+ICAgwqAg
ZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCAxOSArKysrKysrKysrKysr
KysrLS0tDQo+Pj4+ICAgwqAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1
bGVyL3NjaGVkX21haW4uYw0KPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRf
bWFpbi5jDQo+Pj4+IGluZGV4IDlhMGVlNzQuLmYzOWI5N2UgMTAwNjQ0DQo+Pj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+Pj4+IEBAIC00NzksNiArNDc5LDcgQEAg
dm9pZCBkcm1fc2NoZWRfcmVzdWJtaXRfam9icyhzdHJ1Y3QNCj4+Pj4gZHJtX2dwdV9zY2hlZHVs
ZXIgKnNjaGVkKQ0KPj4+PiAgIMKgwqDCoMKgwqAgc3RydWN0IGRybV9zY2hlZF9qb2IgKnNfam9i
LCAqdG1wOw0KPj4+PiAgIMKgwqDCoMKgwqAgdWludDY0X3QgZ3VpbHR5X2NvbnRleHQ7DQo+Pj4+
ICAgwqDCoMKgwqDCoCBib29sIGZvdW5kX2d1aWx0eSA9IGZhbHNlOw0KPj4+PiArwqDCoMKgIHN0
cnVjdCBkbWFfZmVuY2UgKmZlbmNlOw0KPj4+PiAgIMKgIMKgwqDCoMKgwqAgbGlzdF9mb3JfZWFj
aF9lbnRyeV9zYWZlKHNfam9iLCB0bXAsDQo+Pj4+ICZzY2hlZC0+cmluZ19taXJyb3JfbGlzdCwg
bm9kZSkgew0KPj4+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3NjaGVkX2ZlbmNl
ICpzX2ZlbmNlID0gc19qb2ItPnNfZmVuY2U7DQo+Pj4+IEBAIC00OTIsNyArNDkzLDE2IEBAIHZv
aWQgZHJtX3NjaGVkX3Jlc3VibWl0X2pvYnMoc3RydWN0DQo+Pj4+IGRybV9ncHVfc2NoZWR1bGVy
ICpzY2hlZCkNCj4+Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfZmVuY2Vfc2V0
X2Vycm9yKCZzX2ZlbmNlLT5maW5pc2hlZCwgLUVDQU5DRUxFRCk7DQo+Pj4+ICAgwqAgwqDCoMKg
wqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9wdXQoc19qb2ItPnNfZmVuY2UtPnBhcmVudCk7DQo+Pj4+
IC3CoMKgwqDCoMKgwqDCoCBzX2pvYi0+c19mZW5jZS0+cGFyZW50ID0gc2NoZWQtPm9wcy0+cnVu
X2pvYihzX2pvYik7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBmZW5jZSA9IHNjaGVkLT5vcHMtPnJ1
bl9qb2Ioc19qb2IpOw0KPj4+PiArDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoSVNfRVJSX09S
X05VTEwoZmVuY2UpKSB7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNfam9iLT5zX2Zl
bmNlLT5wYXJlbnQgPSBOVUxMOw0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfZmVu
Y2Vfc2V0X2Vycm9yKCZzX2ZlbmNlLT5maW5pc2hlZCwgUFRSX0VSUihmZW5jZSkpOw0KPj4+PiAr
wqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc19q
b2ItPnNfZmVuY2UtPnBhcmVudCA9IGZlbmNlOw0KPj4+PiArwqDCoMKgwqDCoMKgwqAgfQ0KPj4+
PiArDQo+Pj4+ICsNCj4+PiBNYXliZSB0aW1lIGZvciBhIGRybV9zY2hlZF9ydW5fam9iKCkgZnVu
Y3Rpb24gd2hpY2ggZG9lcyB0aGF0DQo+Pj4gaGFuZGxpbmc/IEFuZCB3aHkgZG9uJ3Qgd2UgbmVl
ZCB0byBpbnN0YWxsIHRoZSBjYWxsYmFjayBoZXJlPw0KPj4gV2hhdCBjb2RlIGRvIHlvdSB3YW50
IHRvIHB1dCBpbiBkcm1fc2NoZWRfcnVuX2pvYiA/DQo+Pg0KPj4gV2UgcmVpbnN0YWxsIHRoZSBj
YWxsYmFjayBsYXRlciBpbiBkcm1fc2NoZWRfc3RhcnQsDQo+PiBkcm1fc2NoZWRfcmVzdWJtaXRf
am9icyBpcyBjb25kaXRpb25hbCBvbiB3aGV0aGVyIHRoZSBndWlsdHkgZmVuY2UgZGlkDQo+PiBz
aWduYWwgYnkgdGhpcyB0aW1lIG9yIG5vdCBhbmQgc28gdGhlIHNwbGl0IG9mIHRoZSBsb2dpYyBp
bnRvDQo+PiBkcm1fc2NoZWRfc3RhcnQgYW5kIGRybV9zY2hlZF9yZXN1Ym1pdF9qb2JzLg0KPiBB
aCwgeWVzIG9mIGNvdXJzZS4gSW4gdGhpcyBjYXNlIHRoZSBwYXRjaCBpcyBSZXZpZXdlZC1ieTog
Q2hyaXN0aWFuDQo+IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPi4NCj4NCj4gUmVn
YXJkcywNCj4gQ2hyaXN0aWFuLg0KDQoNClRoYW5rcywgdGhlcmUgaXMgYWxzbyAyLzIgcGF0Y2gg
Zm9yIGFtZGdwdSwgcGxlYXNlIHRha2UgYSBsb29rLg0KDQpBbmRyZXkNCg0KDQo+DQo+PiBBbmRy
ZXkNCj4+DQo+Pg0KPj4+IEFwYXJ0IGZyb20gdGhhdCBsb29rcyBnb29kIHRvIG1lLA0KPj4+IENo
cmlzdGlhbi4NCj4+Pg0KPj4+PiAgIMKgwqDCoMKgwqAgfQ0KPj4+PiAgIMKgIH0NCj4+Pj4gICDC
oCBFWFBPUlRfU1lNQk9MKGRybV9zY2hlZF9yZXN1Ym1pdF9qb2JzKTsNCj4+Pj4gQEAgLTcyMCw3
ICs3MzAsNyBAQCBzdGF0aWMgaW50IGRybV9zY2hlZF9tYWluKHZvaWQgKnBhcmFtKQ0KPj4+PiAg
IMKgwqDCoMKgwqDCoMKgwqDCoCBmZW5jZSA9IHNjaGVkLT5vcHMtPnJ1bl9qb2Ioc2NoZWRfam9i
KTsNCj4+Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqAgZHJtX3NjaGVkX2ZlbmNlX3NjaGVkdWxlZChz
X2ZlbmNlKTsNCj4+Pj4gICDCoCAtwqDCoMKgwqDCoMKgwqAgaWYgKGZlbmNlKSB7DQo+Pj4+ICvC
oMKgwqDCoMKgwqDCoCBpZiAoIUlTX0VSUl9PUl9OVUxMKGZlbmNlKSkgew0KPj4+PiAgIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNfZmVuY2UtPnBhcmVudCA9IGRtYV9mZW5jZV9nZXQoZmVu
Y2UpOw0KPj4+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHIgPSBkbWFfZmVuY2VfYWRk
X2NhbGxiYWNrKGZlbmNlLCAmc2NoZWRfam9iLT5jYiwNCj4+Pj4gICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1fc2NoZWRfcHJvY2Vz
c19qb2IpOw0KPj4+PiBAQCAtNzMwLDggKzc0MCwxMSBAQCBzdGF0aWMgaW50IGRybV9zY2hlZF9t
YWluKHZvaWQgKnBhcmFtKQ0KPj4+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgRFJNX0VSUk9SKCJmZW5jZSBhZGQgY2FsbGJhY2sgZmFpbGVkICglZClcbiIsDQo+Pj4+ICAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByKTsNCj4+Pj4g
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfZmVuY2VfcHV0KGZlbmNlKTsNCj4+Pj4g
LcKgwqDCoMKgwqDCoMKgIH0gZWxzZQ0KPj4+PiArwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsNCj4+
Pj4gKw0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfZmVuY2Vfc2V0X2Vycm9yKCZz
X2ZlbmNlLT5maW5pc2hlZCwgUFRSX0VSUihmZW5jZSkpOw0KPj4+PiAgIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGRybV9zY2hlZF9wcm9jZXNzX2pvYihOVUxMLCAmc2NoZWRfam9iLT5jYik7
DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+Pj4+ICAgwqAgwqDCoMKgwqDCoMKgwqDCoMKgIHdh
a2VfdXAoJnNjaGVkLT5qb2Jfc2NoZWR1bGVkKTsNCj4+Pj4gICDCoMKgwqDCoMKgIH0NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
