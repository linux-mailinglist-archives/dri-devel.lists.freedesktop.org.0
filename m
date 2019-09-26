Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D27E1BF5A2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 17:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900D06ED75;
	Thu, 26 Sep 2019 15:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710058.outbound.protection.outlook.com [40.107.71.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D516ED75
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 15:14:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUpJXEXV2052xc8wIhPM65Ir8yXx+ORAJEbXBsik42EhsstZ9B88NlyG7xSoU4QLqAHdaoEDJB5BJgbaDaG2COcjJ5k5AhEqZcBEIadwLdAOvFS8Dd8ePyDeahKvzVt5vqWwtzpo9ppUQvNg6aUONKuM19ZZWg1qp8XxH4Xf12LEszp5teHCsYmK3nd9yMxYzy5T3VxADVwau9RSH4opGH/b+bE/6sxMGrJzYiku6GLXF5ACKH2dw//++LQd3515xoyOsz7bfdrNuR+POYwFyERSxU412PJdP5UTIGirD8hziblAJHSOnb8eVil5f9jOt2YOHXvu0OxIDDq0InQbcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsTDcFjbyyKQOnChChLOuEY9jJdiVbzR2suUZdsnMr0=;
 b=HYRX++btv06SQNYUk/zWVnVouDXG4Lzm+dNls6Y1ZM9jIWtoE3bEhkXDKmKHwyMkAvMJW7Xpj3M9WtTjaQwXobi3DmY3KftciBCX7rprNWwqR1wxleGUWVTVXqKa28hXhCBjxcSJAxTbZ3DdJpMTMl2IIjhPwrAfBIThMjSxtB2L0H2uzibKs5/U4EbLboWNfY1P80HiGbX0izNVv8FLLfDpa+D8u652C/dghxS4F82TBL/VgLd4vO2wWGShw4Pa60Eicf4rsXhCECB3m61NuIOdblkd7XwDCndm6F0Zw7eyFLLY+xiYO9HaJAQNYcf+VoxLBDLGI0o2ShRev+WRgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR12MB1446.namprd12.prod.outlook.com (10.172.72.19) by
 CY4PR12MB1733.namprd12.prod.outlook.com (10.175.60.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Thu, 26 Sep 2019 15:14:35 +0000
Received: from CY4PR12MB1446.namprd12.prod.outlook.com
 ([fe80::1dbd:eba0:5fcf:c9f3]) by CY4PR12MB1446.namprd12.prod.outlook.com
 ([fe80::1dbd:eba0:5fcf:c9f3%6]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 15:14:35 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Steven Price <steven.price@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH v4] drm: Don't free jobs in wait_event_interruptible()
Thread-Topic: [PATCH v4] drm: Don't free jobs in wait_event_interruptible()
Thread-Index: AQHVdHUKP1r0Rq5tqEO46l3IKyYg76c+EUmA
Date: Thu, 26 Sep 2019 15:14:35 +0000
Message-ID: <b457a269-4aa9-7e3b-283e-b4920455e396@amd.com>
References: <20190926141630.14258-1-steven.price@arm.com>
In-Reply-To: <20190926141630.14258-1-steven.price@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::19) To CY4PR12MB1446.namprd12.prod.outlook.com
 (2603:10b6:910:10::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 653635db-6330-448c-4430-08d742943d68
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR12MB1733:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB1733F2569B2411D4779B89F0EA860@CY4PR12MB1733.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:172;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(199004)(189003)(76176011)(14444005)(66066001)(86362001)(71190400001)(71200400001)(316002)(256004)(4326008)(2906002)(3846002)(110136005)(54906003)(31686004)(14454004)(66946007)(6116002)(305945005)(486006)(64756008)(66446008)(66556008)(66476007)(31696002)(6636002)(11346002)(6246003)(81156014)(81166006)(8676002)(478600001)(446003)(6506007)(386003)(53546011)(7736002)(6436002)(2616005)(6512007)(476003)(25786009)(26005)(5660300002)(6486002)(229853002)(186003)(102836004)(8936002)(36756003)(52116002)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1733;
 H:CY4PR12MB1446.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /EyxP8K3V0RR+NPW0nv96RfFBLH4CGhKb4HoqPMN2JryJzk+x1/Yj81yb8dWGx3uorQhhfR7hg/tBGtKMT9PguGcA5GPkFknaci2OYs0XjRBLztXVvN2TDGmQs96v7BQmK67IcjPSAp9QjVdrcqehG96UZmHws0htXZIL6bUPNNHT1ddrUIhSKI8C3Zeek3JtnC3bn3MeJUN9srRrJYM5SwnPH3KHuYAnyr6yeEKuluLpaiS2LP2g48JC939ugkm95GmK0Wc3crMIi5Z8aROVWlpMim95MY+OFeT5vLA3VE4JESWgPOuA2qkP3qg774l9f02aYnubyw2jSIDZGa5UEFyc5mzWnDpwe/ZcAQPEYZ08fIbcwqlS1QoAbuNJYWw8U69WfJPHHcgWMSZRIagwbzRZ8GYq16DQ4zaTn034A0=
Content-ID: <E66AE4CC3CF8F244B38E2DABB3E419E1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 653635db-6330-448c-4430-08d742943d68
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 15:14:35.1549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fU8Xetu4JfeEHgBmvMm5UCQUbi2G/Ou0ucA3FV7VUbQsjZ8NlAgHP+0keiBK3L38mFMQLthCyG53cX1FncBBSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1733
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsTDcFjbyyKQOnChChLOuEY9jJdiVbzR2suUZdsnMr0=;
 b=Ebww8Xw0KPQuh+N+onpOu2TxRcuMjcxKjwOBXYrsVyux+rC+9iyPP+Ke1jjc2dxzD6zFFMK0aBlGJnsJsFfotPil/ysc+7U8n0CGXUesyQrOaUiR+ogWnbQ/S/BtGhT2+K3eOyiEsTgNO8dkNNuZXtelfrP7Lh8Nw93Q5poe6NI=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Nayan Deshmukh <nayan26deshmukh@gmail.com>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiA5LzI2LzE5IDEwOjE2IEFNLCBTdGV2ZW4gUHJpY2Ugd3JvdGU6DQo+IGRybV9zY2hlZF9j
bGVhbnVwX2pvYnMoKSBhdHRlbXB0cyB0byBmcmVlIGZpbmlzaGVkIGpvYnMsIGhvd2V2ZXIgYmVj
YXVzZQ0KPiBpdCBpcyBjYWxsZWQgYXMgdGhlIGNvbmRpdGlvbiBvZiB3YWl0X2V2ZW50X2ludGVy
cnVwdGlibGUoKSBpdCBtdXN0IG5vdA0KPiBzbGVlcC4gVW5mb3J0dWFudGx5IHNvbWUgZnJlZSBj
YWxsYmFja3MgKG5vdGlibHkgZm9yIFBhbmZyb3N0KSBkbyBzbGVlcC4NCj4NCj4gSW5zdGVhZCBs
ZXQncyByZW5hbWUgZHJtX3NjaGVkX2NsZWFudXBfam9icygpIHRvDQo+IGRybV9zY2hlZF9nZXRf
Y2xlYW51cF9qb2IoKSBhbmQgc2ltcGx5IHJldHVybiBhIGpvYiBmb3IgcHJvY2Vzc2luZyBpZg0K
PiB0aGVyZSBpcyBvbmUuIFRoZSBjYWxsZXIgY2FuIHRoZW4gY2FsbCB0aGUgZnJlZV9qb2IoKSBj
YWxsYmFjayBvdXRzaWRlDQo+IHRoZSB3YWl0X2V2ZW50X2ludGVycnVwdGlibGUoKSB3aGVyZSBz
bGVlcGluZyBpcyBwb3NzaWJsZSBiZWZvcmUNCj4gcmUtY2hlY2tpbmcgYW5kIHJldHVybmluZyB0
byBzbGVlcCBpZiBuZWNlc3NhcnkuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFN0ZXZlbiBQcmljZSA8
c3RldmVuLnByaWNlQGFybS5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGZyb20gdjM6DQo+ICAgKiBk
cm1fc2NoZWRfbWFpbigpIHJlLWFybXMgdGhlIHRpbWVvdXQgZm9yIHRoZSBuZXh0IGpvYiBhZnRl
ciBjYWxsaW5nDQo+ICAgICBmcmVlX2pvYigpDQo+DQo+ICAgZHJpdmVycy9ncHUvZHJtL3NjaGVk
dWxlci9zY2hlZF9tYWluLmMgfCA0NSArKysrKysrKysrKysrKystLS0tLS0tLS0tLQ0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkNCj4NCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4gaW5kZXggOWEwZWU3NGQ4MmRjLi4x
NDg0Njg0NDdiYTkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2No
ZWRfbWFpbi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5j
DQo+IEBAIC02MjIsNDMgKzYyMiw0MSBAQCBzdGF0aWMgdm9pZCBkcm1fc2NoZWRfcHJvY2Vzc19q
b2Ioc3RydWN0IGRtYV9mZW5jZSAqZiwgc3RydWN0IGRtYV9mZW5jZV9jYiAqY2IpDQo+ICAgfQ0K
PiAgIA0KPiAgIC8qKg0KPiAtICogZHJtX3NjaGVkX2NsZWFudXBfam9icyAtIGRlc3Ryb3kgZmlu
aXNoZWQgam9icw0KPiArICogZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYiAtIGZldGNoIHRoZSBu
ZXh0IGZpbmlzaGVkIGpvYiB0byBiZSBkZXN0cm95ZWQNCj4gICAgKg0KPiAgICAqIEBzY2hlZDog
c2NoZWR1bGVyIGluc3RhbmNlDQo+ICAgICoNCj4gLSAqIFJlbW92ZSBhbGwgZmluaXNoZWQgam9i
cyBmcm9tIHRoZSBtaXJyb3IgbGlzdCBhbmQgZGVzdHJveSB0aGVtLg0KPiArICogUmV0dXJucyB0
aGUgbmV4dCBmaW5pc2hlZCBqb2IgZnJvbSB0aGUgbWlycm9yIGxpc3QgKGlmIHRoZXJlIGlzIG9u
ZSkNCj4gKyAqIHJlYWR5IGZvciBpdCB0byBiZSBkZXN0cm95ZWQuDQo+ICAgICovDQo+IC1zdGF0
aWMgdm9pZCBkcm1fc2NoZWRfY2xlYW51cF9qb2JzKHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAq
c2NoZWQpDQo+ICtzdGF0aWMgc3RydWN0IGRybV9zY2hlZF9qb2IgKg0KPiArZHJtX3NjaGVkX2dl
dF9jbGVhbnVwX2pvYihzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQ0KPiAgIHsNCj4g
KwlzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9iID0gTlVMTDsNCj4gICAJdW5zaWduZWQgbG9uZyBm
bGFnczsNCj4gICANCj4gICAJLyogRG9uJ3QgZGVzdHJveSBqb2JzIHdoaWxlIHRoZSB0aW1lb3V0
IHdvcmtlciBpcyBydW5uaW5nICovDQo+ICAgCWlmIChzY2hlZC0+dGltZW91dCAhPSBNQVhfU0NI
RURVTEVfVElNRU9VVCAmJg0KPiAgIAkgICAgIWNhbmNlbF9kZWxheWVkX3dvcmsoJnNjaGVkLT53
b3JrX3RkcikpDQo+IC0JCXJldHVybjsNCj4gLQ0KPiArCQlyZXR1cm4gTlVMTDsNCj4gICANCj4g
LQl3aGlsZSAoIWxpc3RfZW1wdHkoJnNjaGVkLT5yaW5nX21pcnJvcl9saXN0KSkgew0KPiAtCQlz
dHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9iOw0KPiArCXNwaW5fbG9ja19pcnFzYXZlKCZzY2hlZC0+
am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPiAgIA0KPiAtCQlqb2IgPSBsaXN0X2ZpcnN0X2VudHJ5
KCZzY2hlZC0+cmluZ19taXJyb3JfbGlzdCwNCj4gKwlqb2IgPSBsaXN0X2ZpcnN0X2VudHJ5X29y
X251bGwoJnNjaGVkLT5yaW5nX21pcnJvcl9saXN0LA0KPiAgIAkJCQkgICAgICAgc3RydWN0IGRy
bV9zY2hlZF9qb2IsIG5vZGUpOw0KPiAtCQlpZiAoIWRtYV9mZW5jZV9pc19zaWduYWxlZCgmam9i
LT5zX2ZlbmNlLT5maW5pc2hlZCkpDQo+IC0JCQlicmVhazsNCj4gICANCj4gLQkJc3Bpbl9sb2Nr
X2lycXNhdmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7DQo+ICsJaWYgKGpvYiAmJiBk
bWFfZmVuY2VfaXNfc2lnbmFsZWQoJmpvYi0+c19mZW5jZS0+ZmluaXNoZWQpKSB7DQo+ICAgCQkv
KiByZW1vdmUgam9iIGZyb20gcmluZ19taXJyb3JfbGlzdCAqLw0KPiAgIAkJbGlzdF9kZWxfaW5p
dCgmam9iLT5ub2RlKTsNCj4gLQkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmc2NoZWQtPmpvYl9s
aXN0X2xvY2ssIGZsYWdzKTsNCj4gLQ0KPiAtCQlzY2hlZC0+b3BzLT5mcmVlX2pvYihqb2IpOw0K
PiArCX0gZWxzZSB7DQo+ICsJCWpvYiA9IE5VTEw7DQo+ICsJCS8qIHF1ZXVlIHRpbWVvdXQgZm9y
IG5leHQgam9iICovDQo+ICsJCWRybV9zY2hlZF9zdGFydF90aW1lb3V0KHNjaGVkKTsNCj4gICAJ
fQ0KPiAgIA0KPiAtCS8qIHF1ZXVlIHRpbWVvdXQgZm9yIG5leHQgam9iICovDQo+IC0Jc3Bpbl9s
b2NrX2lycXNhdmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7DQo+IC0JZHJtX3NjaGVk
X3N0YXJ0X3RpbWVvdXQoc2NoZWQpOw0KPiAgIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZzY2hl
ZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPiAgIA0KPiArCXJldHVybiBqb2I7DQo+ICAgfQ0K
PiAgIA0KPiAgIC8qKg0KPiBAQCAtNjk4LDEyICs2OTYsMjEgQEAgc3RhdGljIGludCBkcm1fc2No
ZWRfbWFpbih2b2lkICpwYXJhbSkNCj4gICAJCXN0cnVjdCBkcm1fc2NoZWRfZmVuY2UgKnNfZmVu
Y2U7DQo+ICAgCQlzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iOw0KPiAgIAkJc3RydWN0
IGRtYV9mZW5jZSAqZmVuY2U7DQo+ICsJCXN0cnVjdCBkcm1fc2NoZWRfam9iICpjbGVhbnVwX2pv
YiA9IE5VTEw7DQo+ICAgDQo+ICAgCQl3YWl0X2V2ZW50X2ludGVycnVwdGlibGUoc2NoZWQtPndh
a2VfdXBfd29ya2VyLA0KPiAtCQkJCQkgKGRybV9zY2hlZF9jbGVhbnVwX2pvYnMoc2NoZWQpLA0K
PiArCQkJCQkgKGNsZWFudXBfam9iID0gZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYihzY2hlZCkp
IHx8DQo+ICAgCQkJCQkgKCFkcm1fc2NoZWRfYmxvY2tlZChzY2hlZCkgJiYNCj4gICAJCQkJCSAg
KGVudGl0eSA9IGRybV9zY2hlZF9zZWxlY3RfZW50aXR5KHNjaGVkKSkpIHx8DQo+IC0JCQkJCSBr
dGhyZWFkX3Nob3VsZF9zdG9wKCkpKTsNCj4gKwkJCQkJIGt0aHJlYWRfc2hvdWxkX3N0b3AoKSk7
DQo+ICsNCj4gKwkJd2hpbGUgKGNsZWFudXBfam9iKSB7DQo+ICsJCQlzY2hlZC0+b3BzLT5mcmVl
X2pvYihjbGVhbnVwX2pvYik7DQo+ICsJCQkvKiBxdWV1ZSB0aW1lb3V0IGZvciBuZXh0IGpvYiAq
Lw0KPiArCQkJZHJtX3NjaGVkX3N0YXJ0X3RpbWVvdXQoc2NoZWQpOw0KPiArDQo+ICsJCQljbGVh
bnVwX2pvYiA9IGRybV9zY2hlZF9nZXRfY2xlYW51cF9qb2Ioc2NoZWQpOw0KPiArCQl9DQoNCg0K
V2h5IGRybV9zY2hlZF9zdGFydF90aW1lb3V0IGlzIGNhbGxlZCBib3RoIGhlcmUgYW5kIGluc2lk
ZSANCmRybV9zY2hlZF9nZXRfY2xlYW51cF9qb2IgPyBBbmQgYWxzbyB3aHkgY2FsbCBpdCBtdWx0
aXBsZSB0aW1lcyBpbiB0aGUgDQpsb29wIGluc3RlYWQgb2Ygb25seSBvbmNlIGFmdGVyIHRoZSBs
b29wIGlzIGRvbmXCoCA/DQoNCkFuZHJleQ0KDQoNCj4gICANCj4gICAJCWlmICghZW50aXR5KQ0K
PiAgIAkJCWNvbnRpbnVlOw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
