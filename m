Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4AC1621A
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 12:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9237F6E794;
	Tue,  7 May 2019 10:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690070.outbound.protection.outlook.com [40.107.69.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245016E215;
 Tue,  7 May 2019 10:46:32 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1947.namprd12.prod.outlook.com (10.175.90.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Tue, 7 May 2019 10:46:30 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba%10]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 10:46:30 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, "Liang, Prike"
 <Prike.Liang@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/display: use ttm_eu_reserve_buffers instead
 of amdgpu_bo_reserve
Thread-Topic: [PATCH 2/2] drm/amd/display: use ttm_eu_reserve_buffers instead
 of amdgpu_bo_reserve
Thread-Index: AQHVBLhz3zjHd3HwTU2yhYBroDIv2KZfeskA
Date: Tue, 7 May 2019 10:46:30 +0000
Message-ID: <4fdfd239-b066-ee6c-741d-280efe63abb1@amd.com>
References: <20190507093642.7859-1-david1.zhou@amd.com>
 <20190507093642.7859-2-david1.zhou@amd.com>
In-Reply-To: <20190507093642.7859-2-david1.zhou@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR0102CA0069.eurprd01.prod.exchangelabs.com
 (2603:10a6:208::46) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1026b48-0bef-481c-36a9-08d6d2d9438e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1947; 
x-ms-traffictypediagnostic: DM5PR12MB1947:
x-microsoft-antispam-prvs: <DM5PR12MB1947FE120FBAC557A1F9B97C83310@DM5PR12MB1947.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(136003)(346002)(376002)(39860400002)(189003)(199004)(476003)(2616005)(73956011)(76176011)(31696002)(64756008)(66946007)(46003)(14444005)(6506007)(66476007)(11346002)(256004)(86362001)(65826007)(58126008)(316002)(66446008)(2906002)(305945005)(7736002)(110136005)(99286004)(6436002)(186003)(64126003)(68736007)(6246003)(72206003)(102836004)(2201001)(66556008)(486006)(52116002)(478600001)(65956001)(36756003)(65806001)(31686004)(6512007)(71190400001)(53936002)(386003)(446003)(71200400001)(66574012)(8936002)(5660300002)(14454004)(6116002)(81166006)(81156014)(450100002)(8676002)(2501003)(6486002)(25786009)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1947;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: N9sYV0a6ePDLUsBV2AEkro07FnvHbLmK5QQI/tqyli66bRl2qtTvMJ6QcKAi9zOQIYk0W75Mn67PGB8ltsTQ/ESgX6vYrZb1r1Qsfj/DUkHNKKKgj/qsW8FqdY/iBiJukPZaLB3i1pbpjFTtcHnrj3umksXLnJy9dpSrY8pmCexXW2T5LJrGbXO2DanzQuKdqVL27HMtL7adO2cB3taF8fc3r41imHh/RWdnZxdMxCdkkdwQMbE83UG6HKmDoXw0TUyFUKb4zh/AvZZTo4+/7nMeca4LAwVb51vmbgCUgVITEVFE7ecN0AHdJju61pVGMkFASwnjx0NxishLNtO98xr2VWvOItZpx9wRO864Br5LhdGJiGDmQ/e8CFvkVakYR9Uec7FX2BrxbjJFA9wsPCT0AAwmvfyKU5B9yQut6RI=
Content-ID: <63A77BCD8067D64BB93794728C8B5653@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1026b48-0bef-481c-36a9-08d6d2d9438e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 10:46:30.7147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1947
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omwofKDDzHUsWIFjlxh5sNbqYcxulfZBzs15LxTgJuA=;
 b=ihzTEFXpGHY6WHSrnuIvLbO6VN587IP/P64V6YywN7Y7DbRnLxDQlelb2LUKvc5MBBNgJhHNASJ/q7LVrWqVM0Gh2SouUQ59KSNwuWoLUojlEZanOMJo4DJZ+sgptcc71F/LJDnm705mGvlYCvmcDYjyPkoUpw7BFWz2HDi1st8=
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

QW0gMDcuMDUuMTkgdW0gMTE6MzYgc2NocmllYiBDaHVubWluZyBaaG91Og0KPiBhZGQgdGlja2V0
IGZvciBkaXNwbGF5IGJvLCBzbyB0aGF0IGl0IGNhbiBwcmVlbXB0IGJ1c3kgYm8uDQo+DQo+IENo
YW5nZS1JZDogSTlmMDMxY2RjYzgyNjdkZTAwZTgxOWFlMzAzYmFhMGE1MmRmOGViYjkNCj4gU2ln
bmVkLW9mZi1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4NCj4gLS0tDQo+
ICAgLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMjIgKysr
KysrKysrKysrKystLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gaW5kZXggYWMyMmY3MzUxYTQyLi44NjMzZDUyZTNmYmUg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYw0KPiBAQCAtNDE3Niw2ICs0MTc2LDkgQEAgc3RhdGljIGludCBkbV9wbGFuZV9o
ZWxwZXJfcHJlcGFyZV9mYihzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4gICAJc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXY7DQo+ICAgCXN0cnVjdCBhbWRncHVfYm8gKnJibzsNCj4gICAJc3Ry
dWN0IGRtX3BsYW5lX3N0YXRlICpkbV9wbGFuZV9zdGF0ZV9uZXcsICpkbV9wbGFuZV9zdGF0ZV9v
bGQ7DQo+ICsJc3RydWN0IGxpc3RfaGVhZCBsaXN0LCBkdXBsaWNhdGVzOw0KPiArCXN0cnVjdCB0
dG1fdmFsaWRhdGVfYnVmZmVyIHR2Ow0KPiArCXN0cnVjdCB3d19hY3F1aXJlX2N0eCB0aWNrZXQ7
DQo+ICAgCXVpbnQ2NF90IHRpbGluZ19mbGFnczsNCj4gICAJdWludDMyX3QgZG9tYWluOw0KPiAg
IAlpbnQgcjsNCj4gQEAgLTQxOTIsOSArNDE5NSwxOCBAQCBzdGF0aWMgaW50IGRtX3BsYW5lX2hl
bHBlcl9wcmVwYXJlX2ZiKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPiAgIAlvYmogPSBuZXdf
c3RhdGUtPmZiLT5vYmpbMF07DQo+ICAgCXJibyA9IGdlbV90b19hbWRncHVfYm8ob2JqKTsNCj4g
ICAJYWRldiA9IGFtZGdwdV90dG1fYWRldihyYm8tPnRiby5iZGV2KTsNCj4gLQlyID0gYW1kZ3B1
X2JvX3Jlc2VydmUocmJvLCBmYWxzZSk7DQo+IC0JaWYgKHVubGlrZWx5KHIgIT0gMCkpDQo+ICsJ
SU5JVF9MSVNUX0hFQUQoJmxpc3QpOw0KPiArCUlOSVRfTElTVF9IRUFEKCZkdXBsaWNhdGVzKTsN
Cj4gKw0KPiArCXR2LmJvID0gJnJiby0+dGJvOw0KPiArCXR2Lm51bV9zaGFyZWQgPSAxOw0KPiAr
CWxpc3RfYWRkKCZ0di5oZWFkLCAmbGlzdCk7DQo+ICsNCj4gKwlyID0gdHRtX2V1X3Jlc2VydmVf
YnVmZmVycygmdGlja2V0LCAmbGlzdCwgZmFsc2UsICZkdXBsaWNhdGVzKTsNCg0KZHVwbGljYXRl
cyBhcmUgc3VwZXJmbHVvdXMgYW5kIGNhbiBiZSBOVUxMIGluIHRoaXMgY2FzZS4NCg0KQXBhcnQg
ZnJvbSB0aGF0IHRoZSBwYXRjaCBpcyBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyANCjxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQoNCj4gKwlp
ZiAocikgew0KPiArCQlkZXZfZXJyKGFkZXYtPmRldiwgImZhaWwgdG8gcmVzZXJ2ZSBibyAoJWQp
XG4iLCByKTsNCj4gICAJCXJldHVybiByOw0KPiArCX0NCj4gICANCj4gICAJaWYgKHBsYW5lLT50
eXBlICE9IERSTV9QTEFORV9UWVBFX0NVUlNPUikNCj4gICAJCWRvbWFpbiA9IGFtZGdwdV9kaXNw
bGF5X3N1cHBvcnRlZF9kb21haW5zKGFkZXYpOw0KPiBAQCAtNDIwNSwyMSArNDIxNywyMSBAQCBz
dGF0aWMgaW50IGRtX3BsYW5lX2hlbHBlcl9wcmVwYXJlX2ZiKHN0cnVjdCBkcm1fcGxhbmUgKnBs
YW5lLA0KPiAgIAlpZiAodW5saWtlbHkociAhPSAwKSkgew0KPiAgIAkJaWYgKHIgIT0gLUVSRVNU
QVJUU1lTKQ0KPiAgIAkJCURSTV9FUlJPUigiRmFpbGVkIHRvIHBpbiBmcmFtZWJ1ZmZlciB3aXRo
IGVycm9yICVkXG4iLCByKTsNCj4gLQkJYW1kZ3B1X2JvX3VucmVzZXJ2ZShyYm8pOw0KPiArCQl0
dG1fZXVfYmFja29mZl9yZXNlcnZhdGlvbigmdGlja2V0LCAmbGlzdCk7DQo+ICAgCQlyZXR1cm4g
cjsNCj4gICAJfQ0KPiAgIA0KPiAgIAlyID0gYW1kZ3B1X3R0bV9hbGxvY19nYXJ0KCZyYm8tPnRi
byk7DQo+ICAgCWlmICh1bmxpa2VseShyICE9IDApKSB7DQo+ICAgCQlhbWRncHVfYm9fdW5waW4o
cmJvKTsNCj4gLQkJYW1kZ3B1X2JvX3VucmVzZXJ2ZShyYm8pOw0KPiArCQl0dG1fZXVfYmFja29m
Zl9yZXNlcnZhdGlvbigmdGlja2V0LCAmbGlzdCk7DQo+ICAgCQlEUk1fRVJST1IoIiVwIGJpbmQg
ZmFpbGVkXG4iLCByYm8pOw0KPiAgIAkJcmV0dXJuIHI7DQo+ICAgCX0NCj4gICANCj4gICAJYW1k
Z3B1X2JvX2dldF90aWxpbmdfZmxhZ3MocmJvLCAmdGlsaW5nX2ZsYWdzKTsNCj4gICANCj4gLQlh
bWRncHVfYm9fdW5yZXNlcnZlKHJibyk7DQo+ICsJdHRtX2V1X2JhY2tvZmZfcmVzZXJ2YXRpb24o
JnRpY2tldCwgJmxpc3QpOw0KPiAgIA0KPiAgIAlhZmItPmFkZHJlc3MgPSBhbWRncHVfYm9fZ3B1
X29mZnNldChyYm8pOw0KPiAgIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
