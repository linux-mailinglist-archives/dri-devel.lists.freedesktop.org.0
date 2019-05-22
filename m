Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D72E2652B
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 15:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C643989A94;
	Wed, 22 May 2019 13:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700070.outbound.protection.outlook.com [40.107.70.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FE289A86
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 13:53:29 +0000 (UTC)
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1456.namprd12.prod.outlook.com (10.172.55.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Wed, 22 May 2019 13:53:24 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::202b:98f2:9925:5d47]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::202b:98f2:9925:5d47%2]) with mapi id 15.20.1922.017; Wed, 22 May 2019
 13:53:24 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [bug report] drm/scheduler: rework job destruction
Thread-Topic: [bug report] drm/scheduler: rework job destruction
Thread-Index: AQHVEJ9Tt4E77WffzU273m5yvInCCqZ3KjCA
Date: Wed, 22 May 2019 13:53:24 +0000
Message-ID: <db826965-04fd-780e-36ec-d561bbc87d57@amd.com>
References: <20190522130724.GA31989@mwanda>
In-Reply-To: <20190522130724.GA31989@mwanda>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::38) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 666a2281-7875-4b1d-a10c-08d6debcdba6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1456; 
x-ms-traffictypediagnostic: MWHPR12MB1456:
x-microsoft-antispam-prvs: <MWHPR12MB1456FFF640744B3B4910FCEBEA000@MWHPR12MB1456.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(39860400002)(346002)(396003)(366004)(199004)(189003)(186003)(26005)(7736002)(305945005)(2906002)(6512007)(99286004)(6636002)(6116002)(31686004)(3846002)(25786009)(5660300002)(76176011)(446003)(11346002)(2616005)(6486002)(476003)(110136005)(6436002)(486006)(4326008)(316002)(52116002)(68736007)(53546011)(6506007)(386003)(53936002)(229853002)(102836004)(256004)(14444005)(66446008)(31696002)(66556008)(66946007)(8936002)(73956011)(64756008)(66476007)(86362001)(72206003)(478600001)(66066001)(81166006)(81156014)(66574012)(71200400001)(71190400001)(36756003)(14454004)(6246003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1456;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dXZ2PbwOjnDb9YYxWJl5lQRvtoNyynkPcVV8D99npYW5VLdtHI4sQ4EoYqKSFWtreRhE901bi2KGw5CXqM6BSFqgiZrTGlFZ45fppBfPOIQhm0KQtFe8tvzL6hxI2CzgAzJewTbHLVCjPSwNONaFWdR2NU3+CTRuZglJXxu2KJFyOE0cbRGLW0Kue1F3RGauVqMvwO9AXAtMqjm5EZELoaLFHjd3x2fGXtvWEbV+rDPK11+SfPFBzdCAn1nYRiIhIbnrDoBHS0hvIm66zVXp7NYe0CnLD5R/id/nQ5+jGy7HvjzpgP9iKENTSS8FjnIfu6cd1L1E6VEnGxcnGkMX56C2LtaDjon0/0xUcz81IuEz6e4Np8LHyJCBw6h9Xq0ZonY45j0PBpFc28itZPGgFrzdE+fb5/py4i6TRv+X5vQ=
Content-ID: <88F1C72F93F632478B8DF8DC121887F8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 666a2281-7875-4b1d-a10c-08d6debcdba6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 13:53:24.5216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1456
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKAeDKsDIEqUWq2xIAFvakxqCJ1HUFdMLoYB5zDqyn0=;
 b=Xt0PqY89oEgBOXbT3VGt4ug1onYsGFA61EQC6jL6nv5nPRC2Zky7dGifOX39WhK9BXzc38d11yVJ6DfkUq0irfYBqP3bKWK7oXZa9HUOC8R4fPxqMA71uVCu5MS8KSFotzfDW/Es/CIHDYvCW/MGSFNiWmp7B19oFAbxiPXeMDo=
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciBsZXR0aW5nIGtub3csIEkgd2lsbCBzZW5kIGEgZml4IHNvb24uDQoNCkFuZHJl
eQ0KDQpPbiA1LzIyLzE5IDk6MDcgQU0sIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+IFtDQVVUSU9O
OiBFeHRlcm5hbCBFbWFpbF0NCj4NCj4gSGVsbG8gQ2hyaXN0aWFuIEvDtm5pZywNCj4NCj4gVGhl
IHBhdGNoIDU5MTgwNDVjNGVkNDogImRybS9zY2hlZHVsZXI6IHJld29yayBqb2IgZGVzdHJ1Y3Rp
b24iIGZyb20NCj4gQXByIDE4LCAyMDE5LCBsZWFkcyB0byB0aGUgZm9sbG93aW5nIHN0YXRpYyBj
aGVja2VyIHdhcm5pbmc6DQo+DQo+ICAgICAgICAgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIv
c2NoZWRfbWFpbi5jOjI5NyBkcm1fc2NoZWRfam9iX3RpbWVkb3V0KCkNCj4gICAgICAgICAgZXJy
b3I6IHBvdGVudGlhbCBOVUxMIGRlcmVmZXJlbmNlICdqb2InLg0KPg0KPiBkcml2ZXJzL2dwdS9k
cm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPiAgICAgMjc5ICBzdGF0aWMgdm9pZCBkcm1fc2No
ZWRfam9iX3RpbWVkb3V0KHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykNCj4gICAgIDI4MCAgew0K
PiAgICAgMjgxICAgICAgICAgIHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQ7DQo+ICAg
ICAyODIgICAgICAgICAgc3RydWN0IGRybV9zY2hlZF9qb2IgKmpvYjsNCj4gICAgIDI4MyAgICAg
ICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiAgICAgMjg0DQo+ICAgICAyODUgICAgICAgICAg
c2NoZWQgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyLCB3b3Jr
X3Rkci53b3JrKTsNCj4gICAgIDI4NiAgICAgICAgICBqb2IgPSBsaXN0X2ZpcnN0X2VudHJ5X29y
X251bGwoJnNjaGVkLT5yaW5nX21pcnJvcl9saXN0LA0KPiAgICAgMjg3ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiwgbm9kZSk7DQo+
ICAgICAyODgNCj4gICAgIDI4OSAgICAgICAgICBpZiAoam9iKQ0KPiAgICAgICAgICAgICAgICAg
ICAgICBeXl4NCj4gV2UgYXNzdW1lIHRoYXQgam9iIGNhbiBiZSBOVUxMLg0KPg0KPiAgICAgMjkw
ICAgICAgICAgICAgICAgICAgam9iLT5zY2hlZC0+b3BzLT50aW1lZG91dF9qb2Ioam9iKTsNCj4g
ICAgIDI5MQ0KPiAgICAgMjkyICAgICAgICAgIC8qDQo+ICAgICAyOTMgICAgICAgICAgICogR3Vp
bHR5IGpvYiBkaWQgY29tcGxldGUgYW5kIGhlbmNlIG5lZWRzIHRvIGJlIG1hbnVhbGx5IHJlbW92
ZWQNCj4gICAgIDI5NCAgICAgICAgICAgKiBTZWUgZHJtX3NjaGVkX3N0b3AgZG9jLg0KPiAgICAg
Mjk1ICAgICAgICAgICAqLw0KPiAgICAgMjk2ICAgICAgICAgIGlmIChzY2hlZC0+ZnJlZV9ndWls
dHkpIHsNCj4NCj4gT3JpZ2luYWxseSAobGFzdCB3ZWVrKSB0aGlzIGNoZWNrIHdhcyAiaWYgKGxp
c3RfZW1wdHkoJmpvYi0+bm9kZSkpIg0KPiB3aGljaCBpcyBvYnZpb3VzbHkgcHJvYmxlbWF0aWMg
aWYgam9iIGlzIE5VTEwuICBJdCdzIG5vdCBjbGVhciB0byBtZQ0KPiB0aGF0IHRoaXMgbmV3IGNo
ZWNrIGVuc3VyZXMgdGhhdCBqb2IgaXMgbm9uLU5VTEwgZWl0aGVyLg0KPg0KPiAgICAgMjk3ICAg
ICAgICAgICAgICAgICAgam9iLT5zY2hlZC0+b3BzLT5mcmVlX2pvYihqb2IpOw0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgXl5eXl4NCj4gRGVyZWZlcmVuY2UuDQo+DQo+ICAgICAyOTggICAg
ICAgICAgICAgICAgICBzY2hlZC0+ZnJlZV9ndWlsdHkgPSBmYWxzZTsNCj4gICAgIDI5OSAgICAg
ICAgICB9DQo+ICAgICAzMDANCj4gICAgIDMwMSAgICAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgm
c2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4gICAgIDMwMiAgICAgICAgICBkcm1fc2No
ZWRfc3RhcnRfdGltZW91dChzY2hlZCk7DQo+ICAgICAzMDMgICAgICAgICAgc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4gICAgIDMwNCAgfQ0K
Pg0KPiByZWdhcmRzLA0KPiBkYW4gY2FycGVudGVyDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
