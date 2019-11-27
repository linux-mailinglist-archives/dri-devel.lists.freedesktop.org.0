Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D93710A79E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 01:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71686E1D2;
	Wed, 27 Nov 2019 00:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690045.outbound.protection.outlook.com [40.107.69.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFDB6E1D2;
 Wed, 27 Nov 2019 00:41:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X97/7dWFjw2S/q6zyQ0UFD1uoKXaDJH32YdoJetrJMlJYFiV7ELZ5cWYO+CaDiKu0aWpCz9+0YucQVwy8lmVZuVdxxZHyk3V5AX+VijRyAeEBcIRPmujO7ugYH04fGgcS4vwvQI9785KqTY3if/0KujL45QjLcW1jjJ86mXfOkgkAWdMnbsrv2rNQBWtvV6miStlQ+oLeG3ZuO1Z8H9PBHHInFOKLIKcm5h6a19IIx1iZT2wJu9gM7wEwA4muRcTAZmg5Wpr9nrQk2WVn0QjSYfR6oRhShdC6NDvn0pSIjAXYUTu83o85ND91Wsansrf1LjefmWDJnZnx2rz03cXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTYf1qZgFN6B5RKDdWcaJ9tFMZ+6rYvlZnfbafGdZzU=;
 b=lvJq4siSBa+PgXWy6GQhtLD22OjdUXL1dC+ovkbLYyTAHVEExmHIUhsStDh5qoM1SI0LMebVliWjHOj84PEWUkOxevWQgCRKmqcY7ZkPYXkQ8y42VZMKxuZLuAvCPuLJAbo24Mmev0+qW1UdEtivgI8U8r5H5KfR5geucV92IPSqKGYoIIde7qgFTobztYxhS+KYHHeP5F4zeBUYVP0XpzZ7nUA3Ibb+4mPV+ExCgX1ICArgQqZurvWSsAQAdRQI8bltWrvhhyEF2Nk7ZyBhaa0lr2zzsSSG7ptEvee9BjrcVlTWrwAsj0x58C+Pu999d0+xcpwhY8ENMDJoZcVJqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB3136.namprd12.prod.outlook.com (20.178.244.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.22; Wed, 27 Nov 2019 00:41:14 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::49e3:7f2c:931c:36e7]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::49e3:7f2c:931c:36e7%7]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 00:41:14 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: RE: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
Thread-Topic: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
Thread-Index: AQHVo9IhnWBRQA7TSUuQ4gUMKSHN+6edlxiAgACX24A=
Date: Wed, 27 Nov 2019 00:41:14 +0000
Message-ID: <MN2PR12MB2975CA8858F21FDF325C33FE8F440@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
 <b8b716a7-e235-38b2-ea6d-0a21881fa64e@amd.com>
In-Reply-To: <b8b716a7-e235-38b2-ea6d-0a21881fa64e@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2019-11-27T00:41:12Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=78c0a9f3-10d3-46c5-88f1-0000d774a655;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2019-11-27T00:41:12Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: df637cf0-8524-4411-bd1d-0000bf983d51
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
x-originating-ip: [165.204.53.123]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ab3ca182-9d4d-49ae-a158-08d772d281f6
x-ms-traffictypediagnostic: MN2PR12MB3136:|MN2PR12MB3136:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB31366F5C70DD699672719CF18F440@MN2PR12MB3136.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(189003)(199004)(13464003)(11346002)(55016002)(186003)(6862004)(256004)(8936002)(54906003)(6636002)(86362001)(14454004)(6436002)(14444005)(8676002)(305945005)(2906002)(81156014)(66574012)(25786009)(478600001)(4326008)(7736002)(9686003)(74316002)(76176011)(6246003)(52536014)(7696005)(99286004)(316002)(33656002)(6116002)(3846002)(5660300002)(81166006)(66946007)(66476007)(66446008)(76116006)(102836004)(66556008)(26005)(66066001)(71200400001)(71190400001)(64756008)(446003)(6506007)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3136;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U/5bbaBnMsxQZoprUAvzlKbp1eNok0P0JL4ttcUz1WEMSFxoBAr9xu9vKdBfrW5bX+YJt3Izp8/fu2ERMZxTtFnN09tqg/naCDTAcR+DGiXOpVLBmz7kP88b7/DhVLtHvDgUFuR/uIEkhJ8TT6R5JYLENcNklSTvnXH7pRHIhUxrmE76g7cwhmt31MBs8CZpWwk99QY6KBBQJSIVOtaaazNglrM5khVmoG6QhBwIUyUaoy2DQktcuye/KzK5faUuCXNE/g+Ftg0R/dC5g3j4Mwmh+kRU4TYFW90I3tM/WSs7UTkaeTJ5iFnTjZaxOG5HsjgqD+J1BZojZcl1rwpkL+GAhC0iKTGKhr2xgZhmfCUyKWISYwnvlabl89qIPTQj+sPnBEF9YRM1Hr2+Z9L6fY1ao/VdnidTXP2pIljeUoF7W3ezQYpmbp+vKmSRwpbk
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3ca182-9d4d-49ae-a158-08d772d281f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 00:41:14.3498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OjaD0cExgOGOunulDKq7zujhuTh04Vz9CnMDR2LTTUR+kTrQpDD614bxpLVS8ywq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3136
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTYf1qZgFN6B5RKDdWcaJ9tFMZ+6rYvlZnfbafGdZzU=;
 b=aZmTRJn8nqWVAkOpXkjjbViHXCCNy/b6whuBvpOqD6bzwkBzH78BTCK5fmepTjJ2m04NLY7QyuuseblmEuhDt49gHx05YYeKjFTOaz409hTbnGusGyWRn6YaFoPBt1ix38i8lq9mPB9WHtM35ohzj3cnvzLgxzXtQ0zlxn8sudw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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
Cc: "steven.price@arm.com" <steven.price@arm.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQpS
ZXZpZXdlZC1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPg0KDQo+LS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBHcm9kem92c2t5LCBBbmRyZXkgPEFuZHJleS5Hcm9k
em92c2t5QGFtZC5jb20+DQo+U2VudDogVHVlc2RheSwgTm92ZW1iZXIgMjYsIDIwMTkgNzozNyBB
TQ0KPkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgS29lbmlnLA0KPkNocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQu
Y29tPjsgRGVuZywgRW1pbHkNCj48RW1pbHkuRGVuZ0BhbWQuY29tPjsgc3RldmVuLnByaWNlQGFy
bS5jb20NCj5TdWJqZWN0OiBSZTogW1BBVENIIHY0XSBkcm0vc2NoZWR1bGVyOiBBdm9pZCBhY2Nl
c3NpbmcgZnJlZWQgYmFkIGpvYi4NCj4NCj5QaW5nDQo+DQo+QW5kcmV5DQo+DQo+T24gMTEvMjUv
MTkgMzo1MSBQTSwgQW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6DQo+PiBQcm9ibGVtOg0KPj4gRHVl
IHRvIGEgcmFjZSBiZXR3ZWVuIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMgaW4gc2NoZWQgdGhyZWFk
IGFuZA0KPj4gZHJtX3NjaGVkX2pvYl90aW1lZG91dCBpbiB0aW1lb3V0IHdvcmsgdGhlcmUgaXMg
YSBwb3NzaWJsaXR5IHRoYXQgYmFkDQo+PiBqb2Igd2FzIGFscmVhZHkgZnJlZWQgd2hpbGUgc3Rp
bGwgYmVpbmcgYWNjZXNzZWQgZnJvbSB0aGUgdGltZW91dA0KPj4gdGhyZWFkLg0KPj4NCj4+IEZp
eDoNCj4+IEluc3RlYWQgb2YganVzdCBwZWVraW5nIGF0IHRoZSBiYWQgam9iIGluIHRoZSBtaXJy
b3IgbGlzdCByZW1vdmUgaXQNCj4+IGZyb20gdGhlIGxpc3QgdW5kZXIgbG9jayBhbmQgdGhlbiBw
dXQgaXQgYmFjayBsYXRlciB3aGVuIHdlIGFyZQ0KPj4gZ2FyYW50ZWVkIG5vIHJhY2Ugd2l0aCBt
YWluIHNjaGVkIHRocmVhZCBpcyBwb3NzaWJsZSB3aGljaCBpcyBhZnRlcg0KPj4gdGhlIHRocmVh
ZCBpcyBwYXJrZWQuDQo+Pg0KPj4gdjI6IExvY2sgYXJvdW5kIHByb2Nlc3NpbmcgcmluZ19taXJy
b3JfbGlzdCBpbiBkcm1fc2NoZWRfY2xlYW51cF9qb2JzLg0KPj4NCj4+IHYzOiBSZWJhc2Ugb24g
dG9wIG9mIGRybS1taXNjLW5leHQuIHYyIGlzIG5vdCBuZWVkZWQgYW55bW9yZSBhcw0KPj4gZHJt
X3NjaGVkX2dldF9jbGVhbnVwX2pvYiBhbHJlYWR5IGhhcyBhIGxvY2sgdGhlcmUuDQo+Pg0KPj4g
djQ6IEZpeCBjb21tZW50cyB0byByZWxmZWN0IGxhdGVzdCBjb2RlIGluIGRybS1taXNjLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBh
bWQuY29tPg0KPj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4NCj4+IFRlc3RlZC1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29t
Pg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIHwg
MjcNCj4rKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDI3
IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVk
dWxlci9zY2hlZF9tYWluLmMNCj4+IGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9t
YWluLmMNCj4+IGluZGV4IDY3NzQ5NTUuLjFiZjljNDAgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4+IEBAIC0yODQsMTAgKzI4NCwyMSBAQCBzdGF0aWMg
dm9pZCBkcm1fc2NoZWRfam9iX3RpbWVkb3V0KHN0cnVjdA0KPndvcmtfc3RydWN0ICp3b3JrKQ0K
Pj4gICAJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4+DQo+PiAgIAlzY2hlZCA9IGNvbnRhaW5lcl9v
Zih3b3JrLCBzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIsDQo+PiB3b3JrX3Rkci53b3JrKTsNCj4+
ICsNCj4+ICsJLyogUHJvdGVjdHMgYWdhaW5zdCBjb25jdXJyZW50IGRlbGV0aW9uIGluDQo+ZHJt
X3NjaGVkX2dldF9jbGVhbnVwX2pvYiAqLw0KPj4gKwlzcGluX2xvY2tfaXJxc2F2ZSgmc2NoZWQt
PmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4+ICAgCWpvYiA9IGxpc3RfZmlyc3RfZW50cnlfb3Jf
bnVsbCgmc2NoZWQtPnJpbmdfbWlycm9yX2xpc3QsDQo+PiAgIAkJCQkgICAgICAgc3RydWN0IGRy
bV9zY2hlZF9qb2IsIG5vZGUpOw0KPj4NCj4+ICAgCWlmIChqb2IpIHsNCj4+ICsJCS8qDQo+PiAr
CQkgKiBSZW1vdmUgdGhlIGJhZCBqb2Igc28gaXQgY2Fubm90IGJlIGZyZWVkIGJ5IGNvbmN1cnJl
bnQNCj4+ICsJCSAqIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMuIEl0IHdpbGwgYmUgcmVpbnNlcnRl
ZCBiYWNrIGFmdGVyDQo+c2NoZWQtPnRocmVhZA0KPj4gKwkJICogaXMgcGFya2VkIGF0IHdoaWNo
IHBvaW50IGl0J3Mgc2FmZS4NCj4+ICsJCSAqLw0KPj4gKwkJbGlzdF9kZWxfaW5pdCgmam9iLT5u
b2RlKTsNCj4+ICsJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnNjaGVkLT5qb2JfbGlzdF9sb2Nr
LCBmbGFncyk7DQo+PiArDQo+PiAgIAkJam9iLT5zY2hlZC0+b3BzLT50aW1lZG91dF9qb2Ioam9i
KTsNCj4+DQo+PiAgIAkJLyoNCj4+IEBAIC0yOTgsNiArMzA5LDggQEAgc3RhdGljIHZvaWQgZHJt
X3NjaGVkX2pvYl90aW1lZG91dChzdHJ1Y3QNCj53b3JrX3N0cnVjdCAqd29yaykNCj4+ICAgCQkJ
am9iLT5zY2hlZC0+b3BzLT5mcmVlX2pvYihqb2IpOw0KPj4gICAJCQlzY2hlZC0+ZnJlZV9ndWls
dHkgPSBmYWxzZTsNCj4+ICAgCQl9DQo+PiArCX0gZWxzZSB7DQo+PiArCQlzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPj4gICAJfQ0KPj4NCj4+
ICAgCXNwaW5fbG9ja19pcnFzYXZlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOyBAQCAt
MzcwLDYgKzM4MywyMA0KPj4gQEAgdm9pZCBkcm1fc2NoZWRfc3RvcChzdHJ1Y3QgZHJtX2dwdV9z
Y2hlZHVsZXIgKnNjaGVkLCBzdHJ1Y3QNCj5kcm1fc2NoZWRfam9iICpiYWQpDQo+PiAgIAlrdGhy
ZWFkX3Bhcmsoc2NoZWQtPnRocmVhZCk7DQo+Pg0KPj4gICAJLyoNCj4+ICsJICogUmVpbnNlcnQg
YmFjayB0aGUgYmFkIGpvYiBoZXJlIC0gbm93IGl0J3Mgc2FmZSBhcw0KPj4gKwkgKiBkcm1fc2No
ZWRfZ2V0X2NsZWFudXBfam9iIGNhbm5vdCByYWNlIGFnYWluc3QgdXMgYW5kIHJlbGVhc2UgdGhl
DQo+PiArCSAqIGJhZCBqb2IgYXQgdGhpcyBwb2ludCAtIHdlIHBhcmtlZCAod2FpdGVkIGZvcikg
YW55IGluIHByb2dyZXNzDQo+PiArCSAqIChlYXJsaWVyKSBjbGVhbnVwcyBhbmQgZHJtX3NjaGVk
X2dldF9jbGVhbnVwX2pvYiB3aWxsIG5vdCBiZQ0KPmNhbGxlZA0KPj4gKwkgKiBub3cgdW50aWwg
dGhlIHNjaGVkdWxlciB0aHJlYWQgaXMgdW5wYXJrZWQuDQo+PiArCSAqLw0KPj4gKwlpZiAoYmFk
ICYmIGJhZC0+c2NoZWQgPT0gc2NoZWQpDQo+PiArCQkvKg0KPj4gKwkJICogQWRkIGF0IHRoZSBo
ZWFkIG9mIHRoZSBxdWV1ZSB0byByZWZsZWN0IGl0IHdhcyB0aGUgZWFybGllc3QNCj4+ICsJCSAq
IGpvYiBleHRyYWN0ZWQuDQo+PiArCQkgKi8NCj4+ICsJCWxpc3RfYWRkKCZiYWQtPm5vZGUsICZz
Y2hlZC0+cmluZ19taXJyb3JfbGlzdCk7DQo+PiArDQo+PiArCS8qDQo+PiAgIAkgKiBJdGVyYXRl
IHRoZSBqb2IgbGlzdCBmcm9tIGxhdGVyIHRvICBlYXJsaWVyIG9uZSBhbmQgZWl0aGVyIGRlYWN0
aXZlDQo+PiAgIAkgKiB0aGVpciBIVyBjYWxsYmFja3Mgb3IgcmVtb3ZlIHRoZW0gZnJvbSBtaXJy
b3IgbGlzdCBpZiB0aGV5IGFscmVhZHkNCj4+ICAgCSAqIHNpZ25hbGVkLg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
