Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C18A9BF428
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 15:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B8E6ED28;
	Thu, 26 Sep 2019 13:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740083.outbound.protection.outlook.com [40.107.74.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8442F6ED28
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 13:37:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ln67hk3PibIWbpXsRXe+VYEgO9p5VvWYGJPmZXH9jZR4Lz+vF04rXUVj3gS8xp7u7zmUhNEiF8DEBlOBytA5vflQisgUduwYJ35/4wLnehQB8n8BjjwLvz0DyI+5egs9GLp6eyCqQH5Sb/+gWxaOvXftlrOEPptnz0/jhVzW0vbfkv6SDX2axRLVzR8ADTOB3wvRYcQAAUcQkKnK1WRlcux/1KTbz/PLtxNQGkIdvIYn8ttYAJ4svtQyXAaNGLr2HHjsccP+uy/I/0DKoZhUJvtEsx6bslofL2MUCRS7i6ggZYHedwcMlmpi8EgZheKhZIsZqB8bdPLDuNZRfPmCGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqctEsClMy0AEyNx+mTcGT5Vp36svtU96BOKwHbOiXw=;
 b=LtJRbgYwHidis7hz/YNjgxuNUdnKR3hkkxz1y/jh8fL88BHinmb04hwmDGSJ2t/7nei21I3lLX1gZlOnMEmCR39nWDO4l/XFi0evdzWPAs9w+57lLuxpem1lWbpRBRlxWQHEWUph3sS5eDGhTBj1vUPpTtXEiD95rIjoY/i3UcsiqvpZw3oueFQZ/j7pg1g/U5a7EXqMCXNqAGtI3tcrt22xaiKa0rFqz4C7rmAWGwjNZ+j0aCid90rFp9BGzTu18xQYgsNIKMQ5FnBKdi3I0TJPYWrQBlSoY6n9zEBpErKauWMJ+64HX0oeRQPHKOzxGq0fpmKMnOKMi0JmDRp0dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1787.namprd12.prod.outlook.com (10.175.91.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.21; Thu, 26 Sep 2019 13:37:16 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 13:37:16 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Steven Price <steven.price@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v3] drm: Don't free jobs in wait_event_interruptible()
Thread-Topic: [PATCH v3] drm: Don't free jobs in wait_event_interruptible()
Thread-Index: AQHVdGZb7Jcw/WL2Zku74nIXb8BDWqc99i8A
Date: Thu, 26 Sep 2019 13:37:15 +0000
Message-ID: <73f058bb-8ba8-611b-e3a0-f6282445179c@amd.com>
References: <20190926123134.4947-1-steven.price@arm.com>
In-Reply-To: <20190926123134.4947-1-steven.price@arm.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: MR2P264CA0128.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::20) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3fe2b73e-d5ef-4721-f18d-08d74286a4f1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1787; 
x-ms-traffictypediagnostic: DM5PR12MB1787:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB178735F05E8054F382D9C68B83860@DM5PR12MB1787.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:409;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(199004)(189003)(6506007)(6436002)(71200400001)(46003)(6486002)(186003)(6246003)(6512007)(71190400001)(2906002)(102836004)(31696002)(86362001)(305945005)(36756003)(7736002)(476003)(11346002)(446003)(4326008)(31686004)(58126008)(256004)(110136005)(229853002)(54906003)(14444005)(14454004)(5660300002)(316002)(66446008)(66556008)(25786009)(66476007)(64756008)(65806001)(2616005)(486006)(6116002)(478600001)(66946007)(81156014)(81166006)(8676002)(99286004)(8936002)(65956001)(76176011)(52116002)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1787;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TN+7yypbpGhv6okl2rW978y01TXRmWEm94AzWjEdaX/PQ27b4aNWgIHKCqdp395nMatZl1Lv6oFeZbx3evR7edDTo5DOVvcT4zRXdEE7HqKtbVeg5rhx8Y/Orh/HM4vTtt7FvTRmqjL+oj1/q0Bqa4ot2SP21FB8GaS7R2aH8qQC6jWzgUo91bqL6liboOmhHPQ+NGdV8aGTgHLSIROGlBrGn2rDJ/e8vckHSN2/MXpsD2zhJnzben4zBAMKXnFeQa7QZgQWILtGH3AtwnHKiykNxjoxes76qTg+z7lmJMwUVGWXA0lQkLEWSZeMDJO1Uma8Kzr7Mgfog81njgHixM+Shhs2aJ89tQP1hdmWZ5XmHVQYI87UkVECsYdVzPiQwdWk/+6VGIS/Vi42ukRlqw/VBN1zuYybzgiFVtRPrsg=
Content-ID: <E46642AAE3E81B4695D4A3273EB40770@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe2b73e-d5ef-4721-f18d-08d74286a4f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 13:37:15.8493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uR2uZkwL9bmhffnwnzlnC/0Z15lWPKd9aDYhN1SGkq95Box5i/1nEn2clvhGFEmd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1787
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqctEsClMy0AEyNx+mTcGT5Vp36svtU96BOKwHbOiXw=;
 b=kZYF7Xkm+sAydJbe/R4vQ/eS+M+evVSoqJlaDhgRl7uA9woZRGc+0MEz1kln8XjPQA9MGYmLnX4sivrFxwZcsMuZesekKnYIxtQ1a7FBSyLMgN8JA1L99YwffT1CYC1IFQ9AmZs0HKDfsVNBBjCUQhxICam91zvVOddzc7FNv94=
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

QW0gMjYuMDkuMTkgdW0gMTQ6MzEgc2NocmllYiBTdGV2ZW4gUHJpY2U6DQo+IGRybV9zY2hlZF9j
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
c3RldmVuLnByaWNlQGFybS5jb20+DQo+IC0tLQ0KPg0KPiBDaGFuZ2VzIGZyb20gdjI6DQo+ICAg
KiBBY3R1YWxseSBtb3ZlIGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgpIHdpdGhpbiB0aGUgbG9j
aw0KPg0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIHwgNDIgKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9u
cygrKSwgMTkgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
c2NoZWR1bGVyL3NjaGVkX21haW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRf
bWFpbi5jDQo+IGluZGV4IDlhMGVlNzRkODJkYy4uZTRiZDc5MmYyYjI5IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPiBAQCAtNjIyLDQzICs2MjIsNDEgQEAg
c3RhdGljIHZvaWQgZHJtX3NjaGVkX3Byb2Nlc3Nfam9iKHN0cnVjdCBkbWFfZmVuY2UgKmYsIHN0
cnVjdCBkbWFfZmVuY2VfY2IgKmNiKQ0KPiAgIH0NCj4gICANCj4gICAvKioNCj4gLSAqIGRybV9z
Y2hlZF9jbGVhbnVwX2pvYnMgLSBkZXN0cm95IGZpbmlzaGVkIGpvYnMNCj4gKyAqIGRybV9zY2hl
ZF9nZXRfY2xlYW51cF9qb2IgLSBmZXRjaCB0aGUgbmV4dCBmaW5pc2hlZCBqb2IgdG8gYmUgZGVz
dHJveWVkDQo+ICAgICoNCj4gICAgKiBAc2NoZWQ6IHNjaGVkdWxlciBpbnN0YW5jZQ0KPiAgICAq
DQo+IC0gKiBSZW1vdmUgYWxsIGZpbmlzaGVkIGpvYnMgZnJvbSB0aGUgbWlycm9yIGxpc3QgYW5k
IGRlc3Ryb3kgdGhlbS4NCj4gKyAqIFJldHVybnMgdGhlIG5leHQgZmluaXNoZWQgam9iIGZyb20g
dGhlIG1pcnJvciBsaXN0IChpZiB0aGVyZSBpcyBvbmUpDQo+ICsgKiByZWFkeSBmb3IgaXQgdG8g
YmUgZGVzdHJveWVkLg0KPiAgICAqLw0KPiAtc3RhdGljIHZvaWQgZHJtX3NjaGVkX2NsZWFudXBf
am9icyhzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQ0KPiArc3RhdGljIHN0cnVjdCBk
cm1fc2NoZWRfam9iICoNCj4gK2RybV9zY2hlZF9nZXRfY2xlYW51cF9qb2Ioc3RydWN0IGRybV9n
cHVfc2NoZWR1bGVyICpzY2hlZCkNCj4gICB7DQo+ICsJc3RydWN0IGRybV9zY2hlZF9qb2IgKmpv
YiA9IE5VTEw7DQo+ICAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICAgDQo+ICAgCS8qIERvbid0
IGRlc3Ryb3kgam9icyB3aGlsZSB0aGUgdGltZW91dCB3b3JrZXIgaXMgcnVubmluZyAqLw0KPiAg
IAlpZiAoc2NoZWQtPnRpbWVvdXQgIT0gTUFYX1NDSEVEVUxFX1RJTUVPVVQgJiYNCj4gICAJICAg
ICFjYW5jZWxfZGVsYXllZF93b3JrKCZzY2hlZC0+d29ya190ZHIpKQ0KPiAtCQlyZXR1cm47DQo+
IC0NCj4gKwkJcmV0dXJuIE5VTEw7DQo+ICAgDQo+IC0Jd2hpbGUgKCFsaXN0X2VtcHR5KCZzY2hl
ZC0+cmluZ19taXJyb3JfbGlzdCkpIHsNCj4gLQkJc3RydWN0IGRybV9zY2hlZF9qb2IgKmpvYjsN
Cj4gKwlzcGluX2xvY2tfaXJxc2F2ZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4g
ICANCj4gLQkJam9iID0gbGlzdF9maXJzdF9lbnRyeSgmc2NoZWQtPnJpbmdfbWlycm9yX2xpc3Qs
DQo+ICsJam9iID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZzY2hlZC0+cmluZ19taXJyb3Jf
bGlzdCwNCj4gICAJCQkJICAgICAgIHN0cnVjdCBkcm1fc2NoZWRfam9iLCBub2RlKTsNCj4gLQkJ
aWYgKCFkbWFfZmVuY2VfaXNfc2lnbmFsZWQoJmpvYi0+c19mZW5jZS0+ZmluaXNoZWQpKQ0KPiAt
CQkJYnJlYWs7DQo+ICAgDQo+IC0JCXNwaW5fbG9ja19pcnFzYXZlKCZzY2hlZC0+am9iX2xpc3Rf
bG9jaywgZmxhZ3MpOw0KPiArCWlmIChqb2IgJiYgZG1hX2ZlbmNlX2lzX3NpZ25hbGVkKCZqb2It
PnNfZmVuY2UtPmZpbmlzaGVkKSkgew0KPiAgIAkJLyogcmVtb3ZlIGpvYiBmcm9tIHJpbmdfbWly
cm9yX2xpc3QgKi8NCj4gICAJCWxpc3RfZGVsX2luaXQoJmpvYi0+bm9kZSk7DQo+IC0JCXNwaW5f
dW5sb2NrX2lycXJlc3RvcmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7DQo+IC0NCj4g
LQkJc2NoZWQtPm9wcy0+ZnJlZV9qb2Ioam9iKTsNCj4gKwl9IGVsc2Ugew0KPiArCQlqb2IgPSBO
VUxMOw0KPiArCQkvKiBxdWV1ZSB0aW1lb3V0IGZvciBuZXh0IGpvYiAqLw0KPiArCQlkcm1fc2No
ZWRfc3RhcnRfdGltZW91dChzY2hlZCk7DQoNClNvcnJ5IEkndmUgb25seSBzZWVuIHRoaXMgcmln
aHQgbm93OiBUaGlzIHdvbid0IHdvcmsuDQoNClNlZSB5b3UgYWx3YXlzIG5lZWQgdG8gc3RhcnQg
dGhlIHRpbWVvdXQsIG9yIGNhbmNlbF9kZWxheWVkX3dvcmsoKSB3aWxsIA0KYWJvcnQgdGhlIHdo
b2xlIHRoaW5nIGFmdGVyIHJldHVybmluZyB0aGUgZmlyc3Qgam9iLg0KDQpDaHJpc3RpYW4uDQoN
Cj4gICAJfQ0KPiAgIA0KPiAtCS8qIHF1ZXVlIHRpbWVvdXQgZm9yIG5leHQgam9iICovDQo+IC0J
c3Bpbl9sb2NrX2lycXNhdmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7DQo+IC0JZHJt
X3NjaGVkX3N0YXJ0X3RpbWVvdXQoc2NoZWQpOw0KPiAgIAlzcGluX3VubG9ja19pcnFyZXN0b3Jl
KCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPiAgIA0KPiArCXJldHVybiBqb2I7DQo+
ICAgfQ0KPiAgIA0KPiAgIC8qKg0KPiBAQCAtNjk4LDEyICs2OTYsMTggQEAgc3RhdGljIGludCBk
cm1fc2NoZWRfbWFpbih2b2lkICpwYXJhbSkNCj4gICAJCXN0cnVjdCBkcm1fc2NoZWRfZmVuY2Ug
KnNfZmVuY2U7DQo+ICAgCQlzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iOw0KPiAgIAkJ
c3RydWN0IGRtYV9mZW5jZSAqZmVuY2U7DQo+ICsJCXN0cnVjdCBkcm1fc2NoZWRfam9iICpjbGVh
bnVwX2pvYiA9IE5VTEw7DQo+ICAgDQo+ICAgCQl3YWl0X2V2ZW50X2ludGVycnVwdGlibGUoc2No
ZWQtPndha2VfdXBfd29ya2VyLA0KPiAtCQkJCQkgKGRybV9zY2hlZF9jbGVhbnVwX2pvYnMoc2No
ZWQpLA0KPiArCQkJCQkgKGNsZWFudXBfam9iID0gZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYihz
Y2hlZCkpIHx8DQo+ICAgCQkJCQkgKCFkcm1fc2NoZWRfYmxvY2tlZChzY2hlZCkgJiYNCj4gICAJ
CQkJCSAgKGVudGl0eSA9IGRybV9zY2hlZF9zZWxlY3RfZW50aXR5KHNjaGVkKSkpIHx8DQo+IC0J
CQkJCSBrdGhyZWFkX3Nob3VsZF9zdG9wKCkpKTsNCj4gKwkJCQkJIGt0aHJlYWRfc2hvdWxkX3N0
b3AoKSk7DQo+ICsNCj4gKwkJd2hpbGUgKGNsZWFudXBfam9iKSB7DQo+ICsJCQlzY2hlZC0+b3Bz
LT5mcmVlX2pvYihjbGVhbnVwX2pvYik7DQo+ICsJCQljbGVhbnVwX2pvYiA9IGRybV9zY2hlZF9n
ZXRfY2xlYW51cF9qb2Ioc2NoZWQpOw0KPiArCQl9DQo+ICAgDQo+ICAgCQlpZiAoIWVudGl0eSkN
Cj4gICAJCQljb250aW51ZTsNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
