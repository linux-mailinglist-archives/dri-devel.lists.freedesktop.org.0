Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DC225C6A
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 05:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E0D89740;
	Wed, 22 May 2019 03:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820078.outbound.protection.outlook.com [40.107.82.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA34989740;
 Wed, 22 May 2019 03:57:45 +0000 (UTC)
Received: from BN6PR12MB1300.namprd12.prod.outlook.com
 (fe80::d06b:365d:a891:d6ea%9) by BN6PR12MB1300.namprd12.prod.outlook.com
 (fe80::d06b:365d:a891:d6ea%9) with TransportReplication id Version 15.20
 (Build 1900.17); Wed, 22 May 2019 03:57:41 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1307.namprd12.prod.outlook.com (10.168.239.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Tue, 21 May 2019 14:15:18 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1900.020; Tue, 21 May 2019
 14:15:18 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v2] drm/scheduler: Fix job cleanup without timeout handler
Thread-Topic: [PATCH v2] drm/scheduler: Fix job cleanup without timeout handler
Thread-Index: AQHVD2ItlY2oL1M+kUSIDiIRcAcD2KZ1I28AgAB8cACAAACPAA==
Date: Tue, 21 May 2019 14:15:17 +0000
Message-ID: <a96aa444-25d1-3040-1e4f-01802159ff85@amd.com>
References: <20190520231649.24595-1-nunes.erico@gmail.com>
 <cff4f34a-c604-b662-c250-15c426062601@amd.com>
 <CADnq5_NzJbcqe5vs52AXus0V9Cm1nxX6NGey1FUMi__mb6QCzg@mail.gmail.com>
In-Reply-To: <CADnq5_NzJbcqe5vs52AXus0V9Cm1nxX6NGey1FUMi__mb6QCzg@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM4PR05CA0001.eurprd05.prod.outlook.com (2603:10a6:205::14)
 To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 246e829b-991e-467a-d946-08d6ddf6c031
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1307; 
x-ms-traffictypediagnostic: BN6PR12MB1300:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1300656E3D1F66E6AB46F06183000@BN6PR12MB1300.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(376002)(39860400002)(396003)(136003)(51914003)(189003)(199004)(386003)(6506007)(14444005)(256004)(31696002)(52116002)(4326008)(76176011)(86362001)(2906002)(486006)(46003)(316002)(14454004)(31686004)(6916009)(53546011)(64126003)(99286004)(65806001)(102836004)(65826007)(966005)(71200400001)(71190400001)(72206003)(6116002)(65956001)(186003)(478600001)(229853002)(25786009)(6486002)(6306002)(6436002)(6512007)(66574012)(81156014)(81166006)(36756003)(8676002)(8936002)(5660300002)(58126008)(54906003)(68736007)(305945005)(6246003)(73956011)(7736002)(7416002)(446003)(66476007)(2616005)(66946007)(53936002)(476003)(1411001)(11346002)(64756008)(66556008)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1300;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1Kus192uhPgPi/9NhJ3+reG52kvEXaaomMHOdT7reVT2z+PXTBzX1jlL0XsKxJlqi5v1PvRCKeWA9IP2S+7mNKjjiRF/jKNOqhdQLWqPJ3SdO+Et4L9oowvn75dAg8ttsllJBh1aHsvpjlgDe7vSd0EVH5Owy1BH+TUmGH6HmzkeFEMkZ2ouFwgzzOUY4OWSsNgpATs1cXG2itiYxFrAm2Q5B6tLCepTvLrTkYMGMrVic9iF9jw/020+5WdYioBnFwDgt0bgsl6RnE6B67HJUK6DpQS/+vUEofSuQ9fbIJYZvmJggLuQkE3gHfpuX8ImHMo9mIz+T4vQhWEDuawetlPylbrvL/G/Tmb8ChqWhCgayVC1B2OUOLMncOLZsXZtCmx1llAuu36BSJQMuQst2Ya7mkcrd9ZuQ8V5xC6fAZ0=
Content-ID: <18E31E542C986345AAF64922E1ACA8CF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 246e829b-991e-467a-d946-08d6ddf6c031
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 14:15:17.9923 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1300
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIYNZeiOmsgSoa86Be0nHfQ8h4hk8TfZ3R7elgr50tU=;
 b=AR7h65DDNsn6WOUoxwNPhXdaK0ZmYUqOS28bHLaPGdmUcbQgM2wP5qhm8h0ECJ632n0NidG6w5dirr0HrxfF90SkdPMZkfnqVwVyepGfx7o1SjqTsayo594P2ib68iqST2Yoo/GpGZlt4CBzQViowmnneu+30VU1uB0Vf+JDHsQ=
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
Cc: "lima@lists.freedesktop.org" <lima@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Sharat Masetty <smasetty@codeaurora.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Nayan Deshmukh <nayan26deshmukh@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDUuMTkgdW0gMTY6MTMgc2NocmllYiBBbGV4IERldWNoZXI6DQo+IFtDQVVUSU9OOiBF
eHRlcm5hbCBFbWFpbF0NCj4NCj4gT24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMjo0OCBBTSBLb2Vu
aWcsIENocmlzdGlhbg0KPiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPiB3cm90ZToNCj4+IEFt
IDIxLjA1LjE5IHVtIDAxOjE2IHNjaHJpZWIgRXJpY28gTnVuZXM6DQo+Pj4gW0NBVVRJT046IEV4
dGVybmFsIEVtYWlsXQ0KPj4+DQo+Pj4gQWZ0ZXIgIjU5MTgwNDVjNGVkNCBkcm0vc2NoZWR1bGVy
OiByZXdvcmsgam9iIGRlc3RydWN0aW9uIiwgam9icyBhcmUNCj4+PiBvbmx5IGRlbGV0ZWQgd2hl
biB0aGUgdGltZW91dCBoYW5kbGVyIGlzIGFibGUgdG8gYmUgY2FuY2VsbGVkDQo+Pj4gc3VjY2Vz
c2Z1bGx5Lg0KPj4+DQo+Pj4gSW4gY2FzZSBubyB0aW1lb3V0IGhhbmRsZXIgaXMgcnVubmluZyAo
dGltZW91dCA9PSBNQVhfU0NIRURVTEVfVElNRU9VVCksDQo+Pj4gam9iIGNsZWFudXAgd291bGQg
YmUgc2tpcHBlZCB3aGljaCBtYXkgcmVzdWx0IGluIG1lbW9yeSBsZWFrcy4NCj4+Pg0KPj4+IEFk
ZCB0aGUgaGFuZGxpbmcgZm9yIHRoZSAodGltZW91dCA9PSBNQVhfU0NIRURVTEVfVElNRU9VVCkg
Y2FzZSBpbg0KPj4+IGRybV9zY2hlZF9jbGVhbnVwX2pvYnMuDQo+Pj4NCj4+PiBTaWduZWQtb2Zm
LWJ5OiBFcmljbyBOdW5lcyA8bnVuZXMuZXJpY29AZ21haWwuY29tPg0KPj4+IENjOiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+PiBSZXZpZXdlZC1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPj4NCj4+IEdvaW5nIHRv
IHBpY2sgdGhhdCB1cCBsYXRlciB0b2RheSBpbnRvIG91ciBpbnRlcm5hbCBicmFuY2guDQo+IFBs
ZWFzZSBhcHBseSBpdCB0byBkcm0tbWlzYy1uZXh0LiAgdGhhdCBpcyB3aGVyZSB0aGUgb3RoZXIg
Z3B1DQo+IHNjaGVkdWxlciBjaGFuZ2VzIGFyZS4gIFRoZXkgYXJlIG5vdCBpbiA1LjIuDQoNCkFo
ISBOb3cgdGhhdCBtYWtlcyBzZW5zZSBhZ2FpbiwgdGhhbmtzIGZvciB0aGUgcmVtaW5kZXIuDQoN
CkNocmlzdGlhbi4NCg0KPg0KPiBBbGV4DQo+DQo+PiBUaGFua3MgZm9yIHRoZSBoZWxwLA0KPj4g
Q2hyaXN0aWFuLg0KPj4NCj4+PiAtLS0NCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVy
L3NjaGVkX21haW4uYyB8IDMgKystDQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hl
ZF9tYWluLmMNCj4+PiBpbmRleCBmOGYwZTFjMTkwMDIuLjEwZDFkMzdlNjQ0YSAxMDA2NDQNCj4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+Pj4gQEAgLTYzMCw3ICs2
MzAsOCBAQCBzdGF0aWMgdm9pZCBkcm1fc2NoZWRfY2xlYW51cF9qb2JzKHN0cnVjdCBkcm1fZ3B1
X3NjaGVkdWxlciAqc2NoZWQpDQo+Pj4gICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+
Pj4NCj4+PiAgICAgICAgICAgLyogRG9uJ3QgZGVzdHJveSBqb2JzIHdoaWxlIHRoZSB0aW1lb3V0
IHdvcmtlciBpcyBydW5uaW5nICovDQo+Pj4gLSAgICAgICBpZiAoIWNhbmNlbF9kZWxheWVkX3dv
cmsoJnNjaGVkLT53b3JrX3RkcikpDQo+Pj4gKyAgICAgICBpZiAoc2NoZWQtPnRpbWVvdXQgIT0g
TUFYX1NDSEVEVUxFX1RJTUVPVVQgJiYNCj4+PiArICAgICAgICAgICAhY2FuY2VsX2RlbGF5ZWRf
d29yaygmc2NoZWQtPndvcmtfdGRyKSkNCj4+PiAgICAgICAgICAgICAgICAgICByZXR1cm47DQo+
Pj4NCj4+Pg0KPj4+IC0tDQo+Pj4gMi4yMC4xDQo+Pj4NCj4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
