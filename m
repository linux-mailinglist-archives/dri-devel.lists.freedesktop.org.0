Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 670B0BF461
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 15:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309E86ED34;
	Thu, 26 Sep 2019 13:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::61f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73686ED29
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 13:50:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiQ7bBEwLy357zWjvsn5jaYgELqJO02vUYE0Tdr8iEZZNo3sCgpi0CGbjnbL7jBmGBBZRu9KCamva2wd6Dp/oB4becjRx5lCNldk+CSH3CmY5sLVUbNtjCVq+0FzBl44L+cfp0Nr/hhPNvdPKBW246aZko30bF6G7tio/mRrhb4oY2d82Ww3SYgd9pZKWbsD6rLi92G4ulpL4nBnNtamw7clSTXMN+RXnBup/9rUUsUsJkkc9xmQWEiP86x3CClSalxhusExzL97herGOZx7dGP3wtbnYqz0XVzrMVyEEzShrLahMQbVl77ChyyhLCkBDU5kj4x6I19youGEhOzIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXTuUYDDcGyBNd3jNuD3S25peGHGdQZkIL7e2IR3qMc=;
 b=A54HKhJsQPSjwrmElYaDUvoIGtMdsrChykhOJT0KbYXI7eyafH7MAT9xkEx0OEszJjDSWn8Jhw+ezwKcSxhlXTvTTTkeG1kkUNfnlkndlWQVqsaSZFv9g6iopu16uayGqKtDK8Jt4KhzBIlpzHtoRfWzG78r0AB671alFPGg0MyTSltQwggiMQ8NN5KKM/ph3jkE+gQHvz0BuWpFdnT74NCwTNcX2c42KmcvBQ614il5IhkeGAhwma3lrrYX0cIhZC8EjBt51nai5lGKpZzUaOPQeKR9b7GDEOaIHuJWouV8p1KUuo4hIrFqkRtBWVwLdJlP43/R1NmtoZv1vtiUuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2568.namprd12.prod.outlook.com (52.132.141.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Thu, 26 Sep 2019 13:50:30 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 13:50:30 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Steven Price <steven.price@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v3] drm: Don't free jobs in wait_event_interruptible()
Thread-Topic: [PATCH v3] drm: Don't free jobs in wait_event_interruptible()
Thread-Index: AQHVdGZb7Jcw/WL2Zku74nIXb8BDWqc99i8AgAABv4CAAAHygA==
Date: Thu, 26 Sep 2019 13:50:29 +0000
Message-ID: <d9b23ef8-f784-0bce-c34a-fa02002db1ea@amd.com>
References: <20190926123134.4947-1-steven.price@arm.com>
 <73f058bb-8ba8-611b-e3a0-f6282445179c@amd.com>
 <f045e1d6-5263-58c2-ce28-2cd215067bdb@arm.com>
In-Reply-To: <f045e1d6-5263-58c2-ce28-2cd215067bdb@arm.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR01CA0144.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::49) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d60bb3a6-5bad-4102-f98e-08d742887e4d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB2568:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB25680BF12CA23A480D770C0C83860@DM5PR12MB2568.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(189003)(199004)(99286004)(54906003)(66446008)(64756008)(66946007)(316002)(66476007)(66556008)(6246003)(6512007)(8676002)(6436002)(5660300002)(81156014)(256004)(6486002)(14444005)(36756003)(81166006)(6306002)(65956001)(4326008)(305945005)(71190400001)(46003)(476003)(2616005)(71200400001)(486006)(229853002)(7736002)(25786009)(8936002)(65806001)(186003)(52116002)(966005)(446003)(86362001)(11346002)(478600001)(53546011)(58126008)(102836004)(386003)(6506007)(6116002)(14454004)(2906002)(110136005)(31686004)(31696002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2568;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1pNJXQe8cnG2bOx892/LzGwvy0gXu9QLFSg9ffN16Bjrz0k4KK0AhvcZmdR5CGWi/sUraw6hICMgDLki4NUTqP2Xqel8dP37QeUahYS5dB8nIhM20ycGQ5xxuC+NXZ5PgbYRYKu11XobmMlxiADz/bSsVmNXe53NP1VSfWTNjWeZTLPAshb1DvQESMGVpQ9I743uoYuUHRxx00AaIQ9Y7iWMT6aylTIIoNzFiYU703u9I4qOUFndN/vRHa18gd9i1dkqtd55rdTqpNVJRxl1igDObRzGE/UGYV/rwvShTtvnxIVUY9vpYk/gGHfXjAY5O7OxZJfuO4uWpvSQtb91tOYsL78Sogk9UvgtNgg2NefrWNG0fnJj73o9L4uIY8hUFyaUpMKFJG4Ru/pZ75XFD8CvqBd0PN54QtrLXwjyfW5mk1dAKwWkm3wRk4svoHJE5PCejHited7VfzmWVfIViA==
Content-ID: <2DB134F39A315C4C9E6EEB44F70173CC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d60bb3a6-5bad-4102-f98e-08d742887e4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 13:50:29.9808 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u3+rJW3OMjAFrsTsdjLQBRcWBZqHnsJ8NgeDu+/OO/+V3UnFAB2TuRJmRcHYeycR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2568
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXTuUYDDcGyBNd3jNuD3S25peGHGdQZkIL7e2IR3qMc=;
 b=UizFeb4rwDlS1/KxYF34KPEnDdkYR2SN9twqAO3WR+R5b682jkkMtAGdAMUQgloyV5HOP3ztFgdEnG2rzNt2sS4LH0dHEEivSvyhVTIj8DTAnn2lCVqfYSPKP4Dile3Hcp+IHnjqMo2BltiD3Z80Asv2HyhLY+g9ml/ZIHZRAN0=
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
Cc: Nayan Deshmukh <nayan26deshmukh@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjYuMDkuMTkgdW0gMTU6NDMgc2NocmllYiBTdGV2ZW4gUHJpY2U6DQo+IE9uIDI2LzA5LzIw
MTkgMTQ6MzcsIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPj4gQW0gMjYuMDkuMTkgdW0gMTQ6
MzEgc2NocmllYiBTdGV2ZW4gUHJpY2U6DQo+Pj4gZHJtX3NjaGVkX2NsZWFudXBfam9icygpIGF0
dGVtcHRzIHRvIGZyZWUgZmluaXNoZWQgam9icywgaG93ZXZlciBiZWNhdXNlDQo+Pj4gaXQgaXMg
Y2FsbGVkIGFzIHRoZSBjb25kaXRpb24gb2Ygd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKCkgaXQg
bXVzdCBub3QNCj4+PiBzbGVlcC4gVW5mb3J0dWFudGx5IHNvbWUgZnJlZSBjYWxsYmFja3MgKG5v
dGlibHkgZm9yIFBhbmZyb3N0KSBkbyBzbGVlcC4NCj4+Pg0KPj4+IEluc3RlYWQgbGV0J3MgcmVu
YW1lIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMoKSB0bw0KPj4+IGRybV9zY2hlZF9nZXRfY2xlYW51
cF9qb2IoKSBhbmQgc2ltcGx5IHJldHVybiBhIGpvYiBmb3IgcHJvY2Vzc2luZyBpZg0KPj4+IHRo
ZXJlIGlzIG9uZS4gVGhlIGNhbGxlciBjYW4gdGhlbiBjYWxsIHRoZSBmcmVlX2pvYigpIGNhbGxi
YWNrIG91dHNpZGUNCj4+PiB0aGUgd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKCkgd2hlcmUgc2xl
ZXBpbmcgaXMgcG9zc2libGUgYmVmb3JlDQo+Pj4gcmUtY2hlY2tpbmcgYW5kIHJldHVybmluZyB0
byBzbGVlcCBpZiBuZWNlc3NhcnkuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBTdGV2ZW4gUHJp
Y2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPg0KPj4+IC0tLQ0KPj4+DQo+Pj4gQ2hhbmdlcyBmcm9t
IHYyOg0KPj4+ICAgICogQWN0dWFsbHkgbW92ZSBsaXN0X2ZpcnN0X2VudHJ5X29yX251bGwoKSB3
aXRoaW4gdGhlIGxvY2sNCj4+Pg0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2No
ZWRfbWFpbi5jIHwgNDIgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0NCj4+PiAgICAxIGZpbGUg
Y2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgYi9kcml2ZXJz
L2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPj4+IGluZGV4IDlhMGVlNzRkODJkYy4u
ZTRiZDc5MmYyYjI5IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIv
c2NoZWRfbWFpbi5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9t
YWluLmMNCj4+PiBAQCAtNjIyLDQzICs2MjIsNDEgQEAgc3RhdGljIHZvaWQgZHJtX3NjaGVkX3By
b2Nlc3Nfam9iKHN0cnVjdCBkbWFfZmVuY2UgKmYsIHN0cnVjdCBkbWFfZmVuY2VfY2IgKmNiKQ0K
Pj4+ICAgIH0NCj4+PiAgICANCj4+PiAgICAvKioNCj4+PiAtICogZHJtX3NjaGVkX2NsZWFudXBf
am9icyAtIGRlc3Ryb3kgZmluaXNoZWQgam9icw0KPj4+ICsgKiBkcm1fc2NoZWRfZ2V0X2NsZWFu
dXBfam9iIC0gZmV0Y2ggdGhlIG5leHQgZmluaXNoZWQgam9iIHRvIGJlIGRlc3Ryb3llZA0KPj4+
ICAgICAqDQo+Pj4gICAgICogQHNjaGVkOiBzY2hlZHVsZXIgaW5zdGFuY2UNCj4+PiAgICAgKg0K
Pj4+IC0gKiBSZW1vdmUgYWxsIGZpbmlzaGVkIGpvYnMgZnJvbSB0aGUgbWlycm9yIGxpc3QgYW5k
IGRlc3Ryb3kgdGhlbS4NCj4+PiArICogUmV0dXJucyB0aGUgbmV4dCBmaW5pc2hlZCBqb2IgZnJv
bSB0aGUgbWlycm9yIGxpc3QgKGlmIHRoZXJlIGlzIG9uZSkNCj4+PiArICogcmVhZHkgZm9yIGl0
IHRvIGJlIGRlc3Ryb3llZC4NCj4+PiAgICAgKi8NCj4+PiAtc3RhdGljIHZvaWQgZHJtX3NjaGVk
X2NsZWFudXBfam9icyhzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQ0KPj4+ICtzdGF0
aWMgc3RydWN0IGRybV9zY2hlZF9qb2IgKg0KPj4+ICtkcm1fc2NoZWRfZ2V0X2NsZWFudXBfam9i
KHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpDQo+Pj4gICAgew0KPj4+ICsJc3RydWN0
IGRybV9zY2hlZF9qb2IgKmpvYiA9IE5VTEw7DQo+Pj4gICAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7
DQo+Pj4gICAgDQo+Pj4gICAgCS8qIERvbid0IGRlc3Ryb3kgam9icyB3aGlsZSB0aGUgdGltZW91
dCB3b3JrZXIgaXMgcnVubmluZyAqLw0KPj4+ICAgIAlpZiAoc2NoZWQtPnRpbWVvdXQgIT0gTUFY
X1NDSEVEVUxFX1RJTUVPVVQgJiYNCj4+PiAgICAJICAgICFjYW5jZWxfZGVsYXllZF93b3JrKCZz
Y2hlZC0+d29ya190ZHIpKQ0KPj4+IC0JCXJldHVybjsNCj4+PiAtDQo+Pj4gKwkJcmV0dXJuIE5V
TEw7DQo+Pj4gICAgDQo+Pj4gLQl3aGlsZSAoIWxpc3RfZW1wdHkoJnNjaGVkLT5yaW5nX21pcnJv
cl9saXN0KSkgew0KPj4+IC0JCXN0cnVjdCBkcm1fc2NoZWRfam9iICpqb2I7DQo+Pj4gKwlzcGlu
X2xvY2tfaXJxc2F2ZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4+PiAgICANCj4+
PiAtCQlqb2IgPSBsaXN0X2ZpcnN0X2VudHJ5KCZzY2hlZC0+cmluZ19taXJyb3JfbGlzdCwNCj4+
PiArCWpvYiA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmc2NoZWQtPnJpbmdfbWlycm9yX2xp
c3QsDQo+Pj4gICAgCQkJCSAgICAgICBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiwgbm9kZSk7DQo+Pj4g
LQkJaWYgKCFkbWFfZmVuY2VfaXNfc2lnbmFsZWQoJmpvYi0+c19mZW5jZS0+ZmluaXNoZWQpKQ0K
Pj4+IC0JCQlicmVhazsNCj4+PiAgICANCj4+PiAtCQlzcGluX2xvY2tfaXJxc2F2ZSgmc2NoZWQt
PmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4+PiArCWlmIChqb2IgJiYgZG1hX2ZlbmNlX2lzX3Np
Z25hbGVkKCZqb2ItPnNfZmVuY2UtPmZpbmlzaGVkKSkgew0KPj4+ICAgIAkJLyogcmVtb3ZlIGpv
YiBmcm9tIHJpbmdfbWlycm9yX2xpc3QgKi8NCj4+PiAgICAJCWxpc3RfZGVsX2luaXQoJmpvYi0+
bm9kZSk7DQo+Pj4gLQkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmc2NoZWQtPmpvYl9saXN0X2xv
Y2ssIGZsYWdzKTsNCj4+PiAtDQo+Pj4gLQkJc2NoZWQtPm9wcy0+ZnJlZV9qb2Ioam9iKTsNCj4+
PiArCX0gZWxzZSB7DQo+Pj4gKwkJam9iID0gTlVMTDsNCj4+PiArCQkvKiBxdWV1ZSB0aW1lb3V0
IGZvciBuZXh0IGpvYiAqLw0KPj4+ICsJCWRybV9zY2hlZF9zdGFydF90aW1lb3V0KHNjaGVkKTsN
Cj4+IFNvcnJ5IEkndmUgb25seSBzZWVuIHRoaXMgcmlnaHQgbm93OiBUaGlzIHdvbid0IHdvcmsu
DQo+Pg0KPj4gU2VlIHlvdSBhbHdheXMgbmVlZCB0byBzdGFydCB0aGUgdGltZW91dCwgb3IgY2Fu
Y2VsX2RlbGF5ZWRfd29yaygpIHdpbGwNCj4+IGFib3J0IHRoZSB3aG9sZSB0aGluZyBhZnRlciBy
ZXR1cm5pbmcgdGhlIGZpcnN0IGpvYi4NCj4gR29vZCBzcG90IQ0KPg0KPiBNeSBsb2dpYyB3YXMg
dGhhdCBkcm1fc2NoZWRfbWFpbigpIHdvdWxkIGNhbGwgYWdhaW4gYW5kIHRoYXQgd291bGQNCj4g
cmUtYXJtIHRoZSB0aW1lb3V0IGFmdGVyIHRoZSBqb2IgaGFzIGJlZW4gY29tcGxldGVkLg0KPg0K
PiBCdXQgbG9va2luZyBhdCB0aGlzIG1vcmUgY2xvc2VseSBJIHNlZSB0aGF0IGlzbid0IGFjdHVh
bGx5IGdvaW5nIHRvIHdvcmsNCj4gcmVsaWFibHkgLSBpZiB0aGUgd29yayBoYXMgYmVlbiBjYW5j
ZWxsZWQgdGhlIGZpcnN0IHRpbWUgdGhlbg0KPiBjYW5jZWxfZGVsYXllZF93b3JrKCkgd2lsbCBy
ZXR1cm4gZmFsc2UgY2F1c2luZyBhbiBlYXJseSBvdXQgYW5kIHRoZQ0KPiB0aW1lb3V0IGlzbid0
IHJlLWFybWVkLg0KPg0KPiBJcyBpdCBhcyBzaW1wbGUgYXMgbW92aW5nIGRybV9zY2hlZF9zdGFy
dF90aW1lb3V0KCkgb3V0IG9mIHRoZSBlbHNlIGNhc2UNCj4gYW5kIHVuY29uZGl0aW9uYWxseSBy
ZS1hcm1pbmcgdGhlIHRpbWVvdXQ/IEknbSB3b3JyaWVkIGFib3V0IHJhY2VzIHdpdGgNCj4gdGhl
IGpvYiB0aGF0IGlzIGJlaW5nIHJldHVybmVkLCBhbHRob3VnaCBpdCBoYXMgYWxyZWFkeSBiZWVu
IHJlbW92ZWQNCj4gZnJvbSByaW5nX21pcnJvcl9saXN0IHNvIHBlcmhhcHMgaXQncyBzYWZlIHRv
IGRvPw0KPg0KPiBBbHRlcm5hdGl2ZWx5IHRoZSBjYWxsZXIgY291bGQgbWFudWFsbHkgcmUtYXJt
IHRoZSB0aW1lb3V0IGFmdGVyDQo+IGhhbmRsaW5nIHRoZSBqb2IgZnJlZS4NCg0KSSBkb24ndCBz
ZWUgYW55dGhpbmcgdGhhdCBjb3VsZCBnbyB3cm9uZyBpbW1lZGlhdGVseSwgYnV0IHRoYXQgaXMg
DQpwcm9iYWJseSB0aGUgY2xlYW5lciBhcHByb2FjaC4NCg0KU28gcGxlYXNlIGRvIHRoaXMgYW5k
IHNpbmNlIHdlIGFyZSBub3cgZG9pbmcgbW9yZSB0aGFuIGp1c3QgcmVtb3ZpbmcgdGhlIA0Kam9i
LCBwbGVhc2Uga2VlcCB0aGF0IGluIGEgc2VwYXJhdGUgZnVuY3Rpb24uDQoNClJlZ2FyZHMsDQpD
aHJpc3RpYW4uDQoNCj4NCj4gU3RldmUNCj4NCj4+IENocmlzdGlhbi4NCj4+DQo+Pj4gICAgCX0N
Cj4+PiAgICANCj4+PiAtCS8qIHF1ZXVlIHRpbWVvdXQgZm9yIG5leHQgam9iICovDQo+Pj4gLQlz
cGluX2xvY2tfaXJxc2F2ZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4+PiAtCWRy
bV9zY2hlZF9zdGFydF90aW1lb3V0KHNjaGVkKTsNCj4+PiAgICAJc3Bpbl91bmxvY2tfaXJxcmVz
dG9yZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4+PiAgICANCj4+PiArCXJldHVy
biBqb2I7DQo+Pj4gICAgfQ0KPj4+ICAgIA0KPj4+ICAgIC8qKg0KPj4+IEBAIC02OTgsMTIgKzY5
NiwxOCBAQCBzdGF0aWMgaW50IGRybV9zY2hlZF9tYWluKHZvaWQgKnBhcmFtKQ0KPj4+ICAgIAkJ
c3RydWN0IGRybV9zY2hlZF9mZW5jZSAqc19mZW5jZTsNCj4+PiAgICAJCXN0cnVjdCBkcm1fc2No
ZWRfam9iICpzY2hlZF9qb2I7DQo+Pj4gICAgCQlzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZTsNCj4+
PiArCQlzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqY2xlYW51cF9qb2IgPSBOVUxMOw0KPj4+ICAgIA0K
Pj4+ICAgIAkJd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKHNjaGVkLT53YWtlX3VwX3dvcmtlciwN
Cj4+PiAtCQkJCQkgKGRybV9zY2hlZF9jbGVhbnVwX2pvYnMoc2NoZWQpLA0KPj4+ICsJCQkJCSAo
Y2xlYW51cF9qb2IgPSBkcm1fc2NoZWRfZ2V0X2NsZWFudXBfam9iKHNjaGVkKSkgfHwNCj4+PiAg
ICAJCQkJCSAoIWRybV9zY2hlZF9ibG9ja2VkKHNjaGVkKSAmJg0KPj4+ICAgIAkJCQkJICAoZW50
aXR5ID0gZHJtX3NjaGVkX3NlbGVjdF9lbnRpdHkoc2NoZWQpKSkgfHwNCj4+PiAtCQkJCQkga3Ro
cmVhZF9zaG91bGRfc3RvcCgpKSk7DQo+Pj4gKwkJCQkJIGt0aHJlYWRfc2hvdWxkX3N0b3AoKSk7
DQo+Pj4gKw0KPj4+ICsJCXdoaWxlIChjbGVhbnVwX2pvYikgew0KPj4+ICsJCQlzY2hlZC0+b3Bz
LT5mcmVlX2pvYihjbGVhbnVwX2pvYik7DQo+Pj4gKwkJCWNsZWFudXBfam9iID0gZHJtX3NjaGVk
X2dldF9jbGVhbnVwX2pvYihzY2hlZCk7DQo+Pj4gKwkJfQ0KPj4+ICAgIA0KPj4+ICAgIAkJaWYg
KCFlbnRpdHkpDQo+Pj4gICAgCQkJY29udGludWU7DQo+PiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdA0KPj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCj4+DQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
