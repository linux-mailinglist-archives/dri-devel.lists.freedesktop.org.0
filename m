Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5947BEC52
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 09:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A37B6ED31;
	Thu, 26 Sep 2019 07:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730089.outbound.protection.outlook.com [40.107.73.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D312D6ED31
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 07:07:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ch5pw2Eb8MMtbaiIl56LDpphp1sS8aFlaiRmuuIPKMJsDEiPCoSDGi+SfEg8l79SQ6wRNt/KEB1XgBbM3H/qagjcgxnT8CL7UP35OdBxtCR0b52jn5/q5SguOGi/9ipUl2eOfbkeGy2rNsls5aJvVrVlQksU4pRfaYgEVY5eANWQO8HkOima2arLZf8cYxxgmS9kWAEs/jpcWSYzauUD1qf5HNL8B08dinwKu5NC6TDBbio+owjXhgrOnjmhvDHYtGCtQZ1al1gsiEPd6basKUez126FriyTLJiPTU/mKeTb5w/ZV8xBYiAV4npnXHbStArhMuVxanbKOChWWjsjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmj59PFiiDxy9bHGLBdE43tdGPwA3igJXQcioFOhZVA=;
 b=FAxzh36P99nunrMg4RhweoeIzo0bf+7sP+7YGyYghdfv16BxWxnC+gVbJnSnNfhutm2jezDfn2TOBfvzcIseURFlXDvziszJ1B6XT7Uob0eZJAAjE8C7lXFPiAfuRPz6OyCqS6bpxVcCZqQpXT0Vse5vbDza1ZH5p9X4p8l+wiixV3nj1IWbQCu6o84+R/3Tg1n6M1/joDroQtBZ8HrfNapfloQwREXDCqTSvN9nRdDHs4JTwpGXHthnhqKeCx1GAIa0a+tmokqHi4M6+CUQKlJ9g2XQWWphU4yML4mi1ZLUlcnc6rd692HsYF+NWrWGwyiHAcCh6t3bcn7WHQCwQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1337.namprd12.prod.outlook.com (10.168.234.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Thu, 26 Sep 2019 07:07:34 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 07:07:34 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Steven Price <steven.price@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>
Subject: Re: [PATCH] drm: Don't free jobs in wait_event_interruptible()
Thread-Topic: [PATCH] drm: Don't free jobs in wait_event_interruptible()
Thread-Index: AQHVc7PzyGiUqz4Sx0azjxLt3Sgtwqc9irIA
Date: Thu, 26 Sep 2019 07:07:34 +0000
Message-ID: <321e99c1-4ce8-e6e1-83c8-2df1c78acce3@amd.com>
References: <20190925151404.23222-1-steven.price@arm.com>
In-Reply-To: <20190925151404.23222-1-steven.price@arm.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: LO2P265CA0216.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::36) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79ae5512-8d5f-4815-befe-08d742503459
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1337:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB133736FD11F8A6C7809B0FC483860@DM5PR12MB1337.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:275;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(189003)(199004)(305945005)(99286004)(7736002)(52116002)(6512007)(36756003)(86362001)(102836004)(31696002)(229853002)(256004)(14444005)(5660300002)(486006)(2906002)(446003)(476003)(110136005)(58126008)(54906003)(31686004)(76176011)(46003)(478600001)(25786009)(8936002)(11346002)(65956001)(316002)(65806001)(64756008)(66946007)(66476007)(6506007)(66556008)(386003)(66446008)(14454004)(6436002)(6486002)(81166006)(6116002)(71190400001)(8676002)(186003)(71200400001)(6246003)(4326008)(2616005)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1337;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7NoKRoRNG2zjhp+8bpzseLywKBPNIxHHTv2BbSnlnmVUvYy8ExXoZJCgAokAJYcV28J6XROKutdhc29p34LGM4OfXbIw4zVs5BiSHwgJA1x92AefBsjCA9ibJy2G7IPY3rnxv0AAQ20fbEC0WM48BVOvCrZYd2W5L+n4+KbKeg9wDM3/1sR/ZotATCUNA+CP15ikRWseGCT+Qu9mVv+ou4AcM4noGZcZuw8k6yBQAum1ogDZmK0qZZW/6vjh0qcUITsvK/TdJA8gb/kWL4sJT+4zjSjf5nGsRu/lj2KIHLh2Malxl/UKc5RtV9gLdbC2pdttAp3ULfZDgRG8I5gvbMrfV802UVUl9wInhw9+hKers8yfX5Ukul8d4UhD0MwdXeS4QFfj2Hj5FSEfI8dyOf/o2U4N4u+40nJJWmVPVvY=
Content-ID: <57CF2915B633BD4283232F772FAABF64@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ae5512-8d5f-4815-befe-08d742503459
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 07:07:34.5185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4/Nb1uJ1rU5LnhiCyAT3hOmMiND/4JYfDZqQxdE1UfnXSv+p2aFoAeK18CrzrEmZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1337
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmj59PFiiDxy9bHGLBdE43tdGPwA3igJXQcioFOhZVA=;
 b=PZOTohFeJNKLLqVpm5N/x2pNfG+H8Slkbk10qzJsCMGRuAJpeynw6Sn3iIqTebE8QoaEXEvtyG4rkJWXEvdf9xeD4lOE0QivaBPYISeJbe80shnJC0keEZxc05PDLQp4tFX0snqj0cyhWkAzmMdBsf9gSIA/56+Zv89eOICquuA=
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
Cc: Sharat Masetty <smasetty@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Nayan Deshmukh <nayan26deshmukh@gmail.com>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDkuMTkgdW0gMTc6MTQgc2NocmllYiBTdGV2ZW4gUHJpY2U6DQo+IGRybV9zY2hlZF9j
bGVhbnVwX2pvYnMoKSBhdHRlbXB0cyB0byBmcmVlIGZpbmlzaGVkIGpvYnMsIGhvd2V2ZXIgYmVj
YXVzZQ0KPiBpdCBpcyBjYWxsZWQgYXMgdGhlIGNvbmRpdGlvbiBvZiB3YWl0X2V2ZW50X2ludGVy
cnVwdGlibGUoKSBpdCBtdXN0IG5vdA0KPiBzbGVlcC4gVW5mb3J0dW5hdGVseSBzb21lIGZyZWUg
Y2FsbGJhY2tzIChub3RhYmx5IGZvciBQYW5mcm9zdCkgZG8gc2xlZXAuDQo+DQo+IEluc3RlYWQg
bGV0J3MgcmVuYW1lIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMoKSB0bw0KPiBkcm1fc2NoZWRfZ2V0
X2NsZWFudXBfam9iKCkgYW5kIHNpbXBseSByZXR1cm4gYSBqb2IgZm9yIHByb2Nlc3NpbmcgaWYN
Cj4gdGhlcmUgaXMgb25lLiBUaGUgY2FsbGVyIGNhbiB0aGVuIGNhbGwgdGhlIGZyZWVfam9iKCkg
Y2FsbGJhY2sgb3V0c2lkZQ0KPiB0aGUgd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKCkgd2hlcmUg
c2xlZXBpbmcgaXMgcG9zc2libGUgYmVmb3JlDQo+IHJlLWNoZWNraW5nIGFuZCByZXR1cm5pbmcg
dG8gc2xlZXAgaWYgbmVjZXNzYXJ5Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBTdGV2ZW4gUHJpY2Ug
PHN0ZXZlbi5wcmljZUBhcm0uY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1
bGVyL3NjaGVkX21haW4uYyB8IDQ0ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgYi9kcml2ZXJz
L2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPiBpbmRleCA5YTBlZTc0ZDgyZGMuLjBl
ZDRhYWE0ZTZkMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hl
ZF9tYWluLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMN
Cj4gQEAgLTYyMiw0MyArNjIyLDQxIEBAIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9wcm9jZXNzX2pv
YihzdHJ1Y3QgZG1hX2ZlbmNlICpmLCBzdHJ1Y3QgZG1hX2ZlbmNlX2NiICpjYikNCj4gICB9DQo+
ICAgDQo+ICAgLyoqDQo+IC0gKiBkcm1fc2NoZWRfY2xlYW51cF9qb2JzIC0gZGVzdHJveSBmaW5p
c2hlZCBqb2JzDQo+ICsgKiBkcm1fc2NoZWRfZ2V0X2NsZWFudXBfam9iIC0gZmV0Y2ggdGhlIG5l
eHQgZmluaXNoZWQgam9iIHRvIGJlIGRlc3Ryb3llZA0KPiAgICAqDQo+ICAgICogQHNjaGVkOiBz
Y2hlZHVsZXIgaW5zdGFuY2UNCj4gICAgKg0KPiAtICogUmVtb3ZlIGFsbCBmaW5pc2hlZCBqb2Jz
IGZyb20gdGhlIG1pcnJvciBsaXN0IGFuZCBkZXN0cm95IHRoZW0uDQo+ICsgKiBSZXR1cm5zIHRo
ZSBuZXh0IGZpbmlzaGVkIGpvYiBmcm9tIHRoZSBtaXJyb3IgbGlzdCAoaWYgdGhlcmUgaXMgb25l
KQ0KPiArICogcmVhZHkgZm9yIGl0IHRvIGJlIGRlc3Ryb3llZC4NCj4gICAgKi8NCj4gLXN0YXRp
YyB2b2lkIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpz
Y2hlZCkNCj4gK3N0YXRpYyBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqDQo+ICtkcm1fc2NoZWRfZ2V0
X2NsZWFudXBfam9iKHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpDQo+ICAgew0KPiAr
CXN0cnVjdCBkcm1fc2NoZWRfam9iICpqb2IgPSBOVUxMOw0KPiAgIAl1bnNpZ25lZCBsb25nIGZs
YWdzOw0KPiAgIA0KPiAgIAkvKiBEb24ndCBkZXN0cm95IGpvYnMgd2hpbGUgdGhlIHRpbWVvdXQg
d29ya2VyIGlzIHJ1bm5pbmcgKi8NCj4gICAJaWYgKHNjaGVkLT50aW1lb3V0ICE9IE1BWF9TQ0hF
RFVMRV9USU1FT1VUICYmDQo+ICAgCSAgICAhY2FuY2VsX2RlbGF5ZWRfd29yaygmc2NoZWQtPndv
cmtfdGRyKSkNCj4gLQkJcmV0dXJuOw0KPiAtDQo+IC0NCj4gLQl3aGlsZSAoIWxpc3RfZW1wdHko
JnNjaGVkLT5yaW5nX21pcnJvcl9saXN0KSkgew0KPiAtCQlzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAq
am9iOw0KPiArCQlyZXR1cm4gTlVMTDsNCj4gICANCj4gLQkJam9iID0gbGlzdF9maXJzdF9lbnRy
eSgmc2NoZWQtPnJpbmdfbWlycm9yX2xpc3QsDQo+ICsJam9iID0gbGlzdF9maXJzdF9lbnRyeV9v
cl9udWxsKCZzY2hlZC0+cmluZ19taXJyb3JfbGlzdCwNCj4gICAJCQkJICAgICAgIHN0cnVjdCBk
cm1fc2NoZWRfam9iLCBub2RlKTsNCg0KVGhpcyBpcyBwcm9iYWJseSBiZXR0ZXIgZG9uZSBhZnRl
ciB0YWtpbmcgdGhlIGxvY2ssIGFwYXJ0IGZyb20gdGhhdCANCmxvb2tzIGdvb2QgdG8gbWUuDQoN
CkNocmlzdGlhbi4NCg0KPiAtCQlpZiAoIWRtYV9mZW5jZV9pc19zaWduYWxlZCgmam9iLT5zX2Zl
bmNlLT5maW5pc2hlZCkpDQo+IC0JCQlicmVhazsNCj4gICANCj4gLQkJc3Bpbl9sb2NrX2lycXNh
dmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7DQo+ICsJc3Bpbl9sb2NrX2lycXNhdmUo
JnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7DQo+ICsNCj4gKwlpZiAoam9iICYmIGRtYV9m
ZW5jZV9pc19zaWduYWxlZCgmam9iLT5zX2ZlbmNlLT5maW5pc2hlZCkpIHsNCj4gICAJCS8qIHJl
bW92ZSBqb2IgZnJvbSByaW5nX21pcnJvcl9saXN0ICovDQo+ICAgCQlsaXN0X2RlbF9pbml0KCZq
b2ItPm5vZGUpOw0KPiAtCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZzY2hlZC0+am9iX2xpc3Rf
bG9jaywgZmxhZ3MpOw0KPiAtDQo+IC0JCXNjaGVkLT5vcHMtPmZyZWVfam9iKGpvYik7DQo+ICsJ
fSBlbHNlIHsNCj4gKwkJam9iID0gTlVMTDsNCj4gKwkJLyogcXVldWUgdGltZW91dCBmb3IgbmV4
dCBqb2IgKi8NCj4gKwkJZHJtX3NjaGVkX3N0YXJ0X3RpbWVvdXQoc2NoZWQpOw0KPiAgIAl9DQo+
ICAgDQo+IC0JLyogcXVldWUgdGltZW91dCBmb3IgbmV4dCBqb2IgKi8NCj4gLQlzcGluX2xvY2tf
aXJxc2F2ZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4gLQlkcm1fc2NoZWRfc3Rh
cnRfdGltZW91dChzY2hlZCk7DQo+ICAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnNjaGVkLT5q
b2JfbGlzdF9sb2NrLCBmbGFncyk7DQo+ICAgDQo+ICsJcmV0dXJuIGpvYjsNCj4gICB9DQo+ICAg
DQo+ICAgLyoqDQo+IEBAIC02OTgsMTIgKzY5NiwxOCBAQCBzdGF0aWMgaW50IGRybV9zY2hlZF9t
YWluKHZvaWQgKnBhcmFtKQ0KPiAgIAkJc3RydWN0IGRybV9zY2hlZF9mZW5jZSAqc19mZW5jZTsN
Cj4gICAJCXN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2I7DQo+ICAgCQlzdHJ1Y3QgZG1h
X2ZlbmNlICpmZW5jZTsNCj4gKwkJc3RydWN0IGRybV9zY2hlZF9qb2IgKmNsZWFudXBfam9iID0g
TlVMTDsNCj4gICANCj4gICAJCXdhaXRfZXZlbnRfaW50ZXJydXB0aWJsZShzY2hlZC0+d2FrZV91
cF93b3JrZXIsDQo+IC0JCQkJCSAoZHJtX3NjaGVkX2NsZWFudXBfam9icyhzY2hlZCksDQo+ICsJ
CQkJCSAoY2xlYW51cF9qb2IgPSBkcm1fc2NoZWRfZ2V0X2NsZWFudXBfam9iKHNjaGVkKSkgfHwN
Cj4gICAJCQkJCSAoIWRybV9zY2hlZF9ibG9ja2VkKHNjaGVkKSAmJg0KPiAgIAkJCQkJICAoZW50
aXR5ID0gZHJtX3NjaGVkX3NlbGVjdF9lbnRpdHkoc2NoZWQpKSkgfHwNCj4gLQkJCQkJIGt0aHJl
YWRfc2hvdWxkX3N0b3AoKSkpOw0KPiArCQkJCQkga3RocmVhZF9zaG91bGRfc3RvcCgpKTsNCj4g
Kw0KPiArCQl3aGlsZSAoY2xlYW51cF9qb2IpIHsNCj4gKwkJCXNjaGVkLT5vcHMtPmZyZWVfam9i
KGNsZWFudXBfam9iKTsNCj4gKwkJCWNsZWFudXBfam9iID0gZHJtX3NjaGVkX2dldF9jbGVhbnVw
X2pvYihzY2hlZCk7DQo+ICsJCX0NCj4gICANCj4gICAJCWlmICghZW50aXR5KQ0KPiAgIAkJCWNv
bnRpbnVlOw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
