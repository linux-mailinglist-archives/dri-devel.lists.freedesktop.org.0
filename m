Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A225E67F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 16:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999F86E14F;
	Wed,  3 Jul 2019 14:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730085.outbound.protection.outlook.com [40.107.73.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED13E6E14C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 14:23:32 +0000 (UTC)
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1422.namprd12.prod.outlook.com (10.169.205.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.16; Wed, 3 Jul 2019 14:23:30 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::2884:f3a3:2582:edf6]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::2884:f3a3:2582:edf6%9]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 14:23:30 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Lucas Stach <l.stach@pengutronix.de>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/scheduler: put killed job cleanup to worker
Thread-Topic: [PATCH] drm/scheduler: put killed job cleanup to worker
Thread-Index: AQHVMYoDUGBPoFod9UaqCvOwnPfn16a48q8A
Date: Wed, 3 Jul 2019 14:23:30 +0000
Message-ID: <e40563b4-3a0f-0370-4790-67328c6e5ad2@amd.com>
References: <20190703102802.17004-1-l.stach@pengutronix.de>
In-Reply-To: <20190703102802.17004-1-l.stach@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::48) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d58648e0-f320-41b6-1276-08d6ffc205a7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1422; 
x-ms-traffictypediagnostic: MWHPR12MB1422:
x-microsoft-antispam-prvs: <MWHPR12MB14223558A14887D9334CE900EAFB0@MWHPR12MB1422.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:597;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(189003)(199004)(386003)(68736007)(53546011)(36756003)(99286004)(6506007)(86362001)(31696002)(53936002)(52116002)(76176011)(486006)(71190400001)(71200400001)(5660300002)(2616005)(476003)(6246003)(25786009)(4326008)(8936002)(66476007)(478600001)(66446008)(66946007)(2906002)(73956011)(66556008)(8676002)(81156014)(64756008)(81166006)(446003)(6636002)(11346002)(6436002)(6486002)(14454004)(6512007)(54906003)(110136005)(3846002)(229853002)(6116002)(305945005)(31686004)(7736002)(66066001)(26005)(316002)(186003)(14444005)(102836004)(72206003)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1422;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9/UGlAftgmCAvw0VKxu3hhbgWDHjwWD6wejjQ+NAcSgtHCSsf+YwmPkfgxtsaDc+Zkwg8Rx/FU/aQ7cyfkCo3Oz76/pLy4P2gcEuDh5IWd4YbAMKcwrar5gDUT4NvVGopXaHvOjgAp7pO5JF9UwPLZx94ZGMoj65zHD0/CBnQ66R+TlLscy6IoNEIAVubJEQO2fH88hXZ8vBwOhKUDR+cT11z8Jt/9jICjtYvuLj+cKv2tTu9neg070FF8PzqeYAtXVxSZ0dPZWYzqvJ68eqhk7auTLltSEVkxkgQBbTUK8piUhGBbE+KwnCPVNNsmVLFknfFbBqg04oURuARg10ffuOdoA8wFqamRrcNb2M279ie306A1rs6wOK2ojzLyOute/EkXamdd3iuPWFQ8jjlsvsIgT4UpPCZiZ2YRKR5ms=
Content-ID: <89DC1C6FBAC6F04F939AD2829A645F9D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d58648e0-f320-41b6-1276-08d6ffc205a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 14:23:30.7441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agrodzov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1422
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gs94rhq3SQtQSIpikqU+aRnJiPvfeBxISaxQnrShlRk=;
 b=CwqqcxbR0lgMAjvY13/N45zjY9qpRuk5Cs5iZaAGuRmIrB2u3q+J1x+H/GmAPAglrPcLNEisAsmtsw4bEoK5nYAGtNA9OeijNkS0BqjEUfDP74QknQ2uT34bWLF7e/lPhYcTmYbEJl/03tv3zB2XBW/waK7MJ1Z3vPWl+GgwXLQ=
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
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiA3LzMvMTkgNjoyOCBBTSwgTHVjYXMgU3RhY2ggd3JvdGU6DQo+IGRybV9zY2hlZF9lbnRp
dHlfa2lsbF9qb2JzX2NiKCkgaXMgY2FsbGVkIHJpZ2h0IGZyb20gdGhlIGxhc3Qgc2NoZWR1bGVk
DQo+IGpvYiBmaW5pc2hlZCBmZW5jZSBzaWduYWxpbmcuIEFzIHRoaXMgbWlnaHQgaGFwcGVuIGZy
b20gSVJRIGNvbnRleHQgd2UNCj4gbm93IGVuZCB1cCBjYWxsaW5nIHRoZSBHUFUgZHJpdmVyIGZy
ZWVfam9iIGNhbGxiYWNrIGluIElSUSBjb250ZXh0LCB3aGlsZQ0KPiBhbGwgb3RoZXIgcGF0aHMg
Y2FsbCBpdCBmcm9tIG5vcm1hbCBwcm9jZXNzIGNvbnRleHQuDQo+DQo+IEV0bmF2aXYgaW4gcGFy
dGljdWxhciBjYWxscyBjb3JlIGtlcm5lbCBmdW5jdGlvbnMgdGhhdCBhcmUgb25seSB2YWxpZCB0
bw0KPiBiZSBjYWxsZWQgZnJvbSBwcm9jZXNzIGNvbnRleHQgd2hlbiBmcmVlaW5nIHRoZSBqb2Iu
IE90aGVyIGRyaXZlcnMgbWlnaHQNCj4gaGF2ZSBzaW1pbGFyIGlzc3VlcywgYnV0IEkgZGlkIG5v
dCB2YWxpZGF0ZSB0aGlzLiBGaXggdGhpcyBieSBwdW50aW5nDQo+IHRoZSBjbGVhbnVwIHdvcmsg
aW50byBhIHdvcmsgaXRlbSwgc28gdGhlIGRyaXZlciBleHBlY3RhdGlvbnMgYXJlIG1ldC4NCj4N
Cj4gU2lnbmVkLW9mZi1ieTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+DQo+
IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMgfCAyOCAr
KysrKysrKysrKysrKy0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9u
cygrKSwgMTEgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
c2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hl
ZF9lbnRpdHkuYw0KPiBpbmRleCAzNWRkYmVjMTM3NWEuLmJhNGViNjY3ODRiOSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jDQo+IEBAIC0yMDIsMjMgKzIw
MiwyMyBAQCBsb25nIGRybV9zY2hlZF9lbnRpdHlfZmx1c2goc3RydWN0IGRybV9zY2hlZF9lbnRp
dHkgKmVudGl0eSwgbG9uZyB0aW1lb3V0KQ0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MKGRybV9z
Y2hlZF9lbnRpdHlfZmx1c2gpOw0KPiAgIA0KPiAtLyoqDQo+IC0gKiBkcm1fc2NoZWRfZW50aXR5
X2tpbGxfam9icyAtIGhlbHBlciBmb3IgZHJtX3NjaGVkX2VudGl0eV9raWxsX2pvYnMNCj4gLSAq
DQo+IC0gKiBAZjogc2lnbmFsZWQgZmVuY2UNCj4gLSAqIEBjYjogb3VyIGNhbGxiYWNrIHN0cnVj
dHVyZQ0KPiAtICoNCj4gLSAqIFNpZ25hbCB0aGUgc2NoZWR1bGVyIGZpbmlzaGVkIGZlbmNlIHdo
ZW4gdGhlIGVudGl0eSBpbiBxdWVzdGlvbiBpcyBraWxsZWQuDQo+IC0gKi8NCj4gK3N0YXRpYyB2
b2lkIGRybV9zY2hlZF9lbnRpdHlfa2lsbF93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykN
Cj4gK3sNCj4gKwlzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9iID0gY29udGFpbmVyX29mKHdvcmss
IHN0cnVjdCBkcm1fc2NoZWRfam9iLA0KPiArCQkJCQkJIGZpbmlzaF93b3JrKTsNCj4gKw0KPiAr
CWRybV9zY2hlZF9mZW5jZV9maW5pc2hlZChqb2ItPnNfZmVuY2UpOw0KPiArCVdBUk5fT04oam9i
LT5zX2ZlbmNlLT5wYXJlbnQpOw0KPiArCWpvYi0+c2NoZWQtPm9wcy0+ZnJlZV9qb2Ioam9iKTsN
Cj4gK30NCj4gKw0KPiAgIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9lbnRpdHlfa2lsbF9qb2JzX2Ni
KHN0cnVjdCBkbWFfZmVuY2UgKmYsDQo+ICAgCQkJCQkgIHN0cnVjdCBkbWFfZmVuY2VfY2IgKmNi
KQ0KPiAgIHsNCj4gICAJc3RydWN0IGRybV9zY2hlZF9qb2IgKmpvYiA9IGNvbnRhaW5lcl9vZihj
Yiwgc3RydWN0IGRybV9zY2hlZF9qb2IsDQo+ICAgCQkJCQkJIGZpbmlzaF9jYik7DQo+ICAgDQo+
IC0JZHJtX3NjaGVkX2ZlbmNlX2ZpbmlzaGVkKGpvYi0+c19mZW5jZSk7DQo+IC0JV0FSTl9PTihq
b2ItPnNfZmVuY2UtPnBhcmVudCk7DQo+IC0Jam9iLT5zY2hlZC0+b3BzLT5mcmVlX2pvYihqb2Ip
Ow0KPiArCXNjaGVkdWxlX3dvcmsoJmpvYi0+ZmluaXNoX3dvcmspOw0KPiAgIH0NCj4gICANCj4g
ICAvKioNCj4gQEAgLTI0MCw2ICsyNDAsMTIgQEAgc3RhdGljIHZvaWQgZHJtX3NjaGVkX2VudGl0
eV9raWxsX2pvYnMoc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSkNCj4gICAJCWRybV9z
Y2hlZF9mZW5jZV9zY2hlZHVsZWQoc19mZW5jZSk7DQo+ICAgCQlkbWFfZmVuY2Vfc2V0X2Vycm9y
KCZzX2ZlbmNlLT5maW5pc2hlZCwgLUVTUkNIKTsNCj4gICANCj4gKwkJLyoNCj4gKwkJICogUmVw
bGFjZSByZWd1bGFyIGZpbmlzaCB3b3JrIGZ1bmN0aW9uIHdpdGggb25lIHRoYXQganVzdA0KPiAr
CQkgKiBraWxscyB0aGUgam9iLg0KPiArCQkgKi8NCj4gKwkJam9iLT5maW5pc2hfd29yay5mdW5j
ID0gZHJtX3NjaGVkX2VudGl0eV9raWxsX3dvcms7DQoNCg0KSSByZWNoZWNrZWQgdGhlIGxhdGVz
dCBjb2RlIGFuZCBmaW5pc2hfd29yayB3YXMgcmVtb3ZlZCBpbiBmZmFlM2U1IA0KJ2RybS9zY2hl
ZHVsZXI6IHJld29yayBqb2IgZGVzdHJ1Y3Rpb24nDQoNCkFuZHJleQ0KDQoNCj4gKw0KPiAgIAkJ
LyoNCj4gICAJCSAqIFdoZW4gcGlwZSBpcyBoYW5nZWQgYnkgb2xkZXIgZW50aXR5LCBuZXcgZW50
aXR5IG1pZ2h0DQo+ICAgCQkgKiBub3QgZXZlbiBoYXZlIGNoYW5jZSB0byBzdWJtaXQgaXQncyBm
aXJzdCBqb2IgdG8gSFcNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
