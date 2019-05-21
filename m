Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9AD2485E
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 08:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2BF8913E;
	Tue, 21 May 2019 06:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam01on0631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe41::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36BF8913D;
 Tue, 21 May 2019 06:47:59 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1627.namprd12.prod.outlook.com (10.172.40.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Tue, 21 May 2019 06:47:57 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1900.020; Tue, 21 May 2019
 06:47:57 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Erico Nunes <nunes.erico@gmail.com>, Qiang Yu <yuq825@gmail.com>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Nayan Deshmukh
 <nayan26deshmukh@gmail.com>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, Eric Anholt <eric@anholt.net>, Sharat Masetty
 <smasetty@codeaurora.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "lima@lists.freedesktop.org"
 <lima@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/scheduler: Fix job cleanup without timeout handler
Thread-Topic: [PATCH v2] drm/scheduler: Fix job cleanup without timeout handler
Thread-Index: AQHVD2ItlY2oL1M+kUSIDiIRcAcD2KZ1I28A
Date: Tue, 21 May 2019 06:47:56 +0000
Message-ID: <cff4f34a-c604-b662-c250-15c426062601@amd.com>
References: <20190520231649.24595-1-nunes.erico@gmail.com>
In-Reply-To: <20190520231649.24595-1-nunes.erico@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM3PR07CA0140.eurprd07.prod.outlook.com
 (2603:10a6:207:8::26) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f876d24e-fe6e-49cd-daab-08d6ddb84195
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1627; 
x-ms-traffictypediagnostic: DM5PR12MB1627:
x-microsoft-antispam-prvs: <DM5PR12MB1627C6DE0E5F55F911A07BA783070@DM5PR12MB1627.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(136003)(39860400002)(376002)(346002)(51914003)(199004)(189003)(7736002)(99286004)(110136005)(66574012)(58126008)(8936002)(6436002)(6246003)(186003)(229853002)(486006)(71200400001)(71190400001)(53936002)(305945005)(81166006)(102836004)(5660300002)(8676002)(31686004)(65956001)(386003)(6506007)(76176011)(81156014)(64126003)(2906002)(52116002)(2501003)(65806001)(65826007)(316002)(66446008)(64756008)(66946007)(86362001)(66556008)(66476007)(6512007)(73956011)(46003)(14454004)(478600001)(11346002)(6486002)(36756003)(72206003)(68736007)(31696002)(25786009)(6116002)(446003)(14444005)(256004)(476003)(2201001)(2616005)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1627;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: G8P/zk8Z/WQO7u6pJXPioApjcOt9hRk3n0F2IPk6PilmlK46VRo6teeW/cf0LlzEgj1OuZE7wuljcshCtca0cHHLuDEr5c4JXwceH91X6tiSivl4uMQPuKVmTV9hVJw60Lo7k53V7syUbBXi8fSJzHcwDN+hCQiv6kmxreFu+rW4v3VOo8Dg0u3ZHkMKPUNS5WJuk+SBRX/5Ixzlb1mXL1C+tucKKbfDa9a1M7FtQtjraWPPjCeJ59/URyPzNXuQPfLsUUa9zVx4Qq0eX9G75qN2+opXMdIhv7Jc5aDimZ2gahkXLbBDoMLU6edtVqeDikI75syYBUYRK+naMiz3Xj0CEAX1dgnCpSv7faNbm9B3blZFxQ9PKfggy8wD8aSQ8Y7Bm9rMv9Yh1Or6f/9TtMTgbbLVkMmoyX77qX87+C8=
Content-ID: <D36D0CFDCA3F064480FB6774D08D9FE0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f876d24e-fe6e-49cd-daab-08d6ddb84195
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 06:47:56.8298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1627
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I80RcV0pfzAhGmgYLQ5P95R3NRb6FF5odrAjoO3ED+o=;
 b=q39q2MbGS3AqMnuuM5OGRO+sjUNTyzOU4hHnBjbD7eQe8uObLX7Rqdz9KsUve8+MIKOoolYeK/+2Wd2oCLUzux3wxGg183mHNjO1gPdtwgb1vDG4eImYR60iwGoRTvD/qalpxdkbuILIcAMKtrnGpj5Gg1iNCwHA9iNsW6jgIiA=
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

QW0gMjEuMDUuMTkgdW0gMDE6MTYgc2NocmllYiBFcmljbyBOdW5lczoNCj4gW0NBVVRJT046IEV4
dGVybmFsIEVtYWlsXQ0KPg0KPiBBZnRlciAiNTkxODA0NWM0ZWQ0IGRybS9zY2hlZHVsZXI6IHJl
d29yayBqb2IgZGVzdHJ1Y3Rpb24iLCBqb2JzIGFyZQ0KPiBvbmx5IGRlbGV0ZWQgd2hlbiB0aGUg
dGltZW91dCBoYW5kbGVyIGlzIGFibGUgdG8gYmUgY2FuY2VsbGVkDQo+IHN1Y2Nlc3NmdWxseS4N
Cj4NCj4gSW4gY2FzZSBubyB0aW1lb3V0IGhhbmRsZXIgaXMgcnVubmluZyAodGltZW91dCA9PSBN
QVhfU0NIRURVTEVfVElNRU9VVCksDQo+IGpvYiBjbGVhbnVwIHdvdWxkIGJlIHNraXBwZWQgd2hp
Y2ggbWF5IHJlc3VsdCBpbiBtZW1vcnkgbGVha3MuDQo+DQo+IEFkZCB0aGUgaGFuZGxpbmcgZm9y
IHRoZSAodGltZW91dCA9PSBNQVhfU0NIRURVTEVfVElNRU9VVCkgY2FzZSBpbg0KPiBkcm1fc2No
ZWRfY2xlYW51cF9qb2JzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBFcmljbyBOdW5lcyA8bnVuZXMu
ZXJpY29AZ21haWwuY29tPg0KPiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPg0KDQpHb2luZyB0byBwaWNrIHRoYXQgdXAgbGF0ZXIgdG9kYXkgaW50byBv
dXIgaW50ZXJuYWwgYnJhbmNoLg0KDQpUaGFua3MgZm9yIHRoZSBoZWxwLA0KQ2hyaXN0aWFuLg0K
DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIHwgMyAr
Ky0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyBi
L2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+IGluZGV4IGY4ZjBlMWMx
OTAwMi4uMTBkMWQzN2U2NDRhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1
bGVyL3NjaGVkX21haW4uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVk
X21haW4uYw0KPiBAQCAtNjMwLDcgKzYzMCw4IEBAIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9jbGVh
bnVwX2pvYnMoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCkNCj4gICAgICAgICAgdW5z
aWduZWQgbG9uZyBmbGFnczsNCj4NCj4gICAgICAgICAgLyogRG9uJ3QgZGVzdHJveSBqb2JzIHdo
aWxlIHRoZSB0aW1lb3V0IHdvcmtlciBpcyBydW5uaW5nICovDQo+IC0gICAgICAgaWYgKCFjYW5j
ZWxfZGVsYXllZF93b3JrKCZzY2hlZC0+d29ya190ZHIpKQ0KPiArICAgICAgIGlmIChzY2hlZC0+
dGltZW91dCAhPSBNQVhfU0NIRURVTEVfVElNRU9VVCAmJg0KPiArICAgICAgICAgICAhY2FuY2Vs
X2RlbGF5ZWRfd29yaygmc2NoZWQtPndvcmtfdGRyKSkNCj4gICAgICAgICAgICAgICAgICByZXR1
cm47DQo+DQo+DQo+IC0tDQo+IDIuMjAuMQ0KPg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
