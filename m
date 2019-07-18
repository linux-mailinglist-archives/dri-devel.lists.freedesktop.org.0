Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAB56CED3
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 15:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4162C6E3C1;
	Thu, 18 Jul 2019 13:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740058.outbound.protection.outlook.com [40.107.74.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84676E3C6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 13:24:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpCU+oWSwa3GRvzyVV14TeOsBarmnrtODuev6hUTC1P5rOAb2wONLenBv4Bu+DSWVCvCNjzcCey1Nxi4HVp2pefUoO8BDrHfFyHbuzOnOmw5eITrbHotfqlFJmGPhlqctdhe8AfJwq8Opk8mk2x0hiOrciUvtvOFttYJ2Guk2QKfEsuRs+4ZDPQx+7S2ahUqOj7rcyu9StnavrLlbfEQr9JUif+po7gnYFK8rQ8F75CWA8Rv6qf5AhWnZ8U+hKv5URNwfGqF4XjtZTPNc2B4mpMqMsBCyKijiTwePqlsjBmTz8/+2gw492E8dCTvbLTf41w+Fn50PTQLSpXMWja4YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1A6vROEe1EFe7pmdBJKWSNMZ95/cvbSsJsIK+qh3hRg=;
 b=PAWoxLX05SYYHtJgeXhMc54Mef29H1UG/4SrkhUZFuTaA59A88JIqzuCaBh01AaY5M9vCKdvlOazN+zzHcbSOHm7HdvEjPurlRpXHcIc4OVYp0+eUbtvKE/F1Tl2awgjBKMjy5DodbJV8UVGMwUWnC0YJPJ4eek11+Z3Te4tMmeUzP3cxuk9dkZC1k8OmU+zdg5tVdg8gSw1PBf2XIhj9fr/JO9FXp5Tau+EvqfDvT8kC8JdjRGzK12+LtHe985avMvkioGncRhwooQbHWSDQ61iOSATcDlTpck+8aKfYnGNqQPt90ye3DaErwjZKDREkIpZUfOOiaQYpHhL9DKqeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3262.namprd12.prod.outlook.com (20.179.82.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Thu, 18 Jul 2019 13:24:34 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4%6]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 13:24:34 +0000
From: Chunming Zhou <zhoucm1@amd.com>
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/syncobj: return meaningful value to user space
Thread-Topic: [PATCH] drm/syncobj: return meaningful value to user space
Thread-Index: AQHVPVnoqE0gPkoYWUCt/IPkTJivbabQOm8AgAAdSYCAAAH9AIAAAUUAgAACcoA=
Date: Thu, 18 Jul 2019 13:24:34 +0000
Message-ID: <f16a7452-965a-9934-3a74-3a7e7b42c1cf@amd.com>
References: <20190718111339.25126-1-david1.zhou@amd.com>
 <156344872806.23055.12897857019960560550@skylake-alporthouse-com>
 <8343b732-2e4b-31f0-9e68-18171977a606@amd.com>
 <156345544398.24728.3877059803253335858@skylake-alporthouse-com>
 <e38b9278-21d7-d4d5-0362-0c63b9f4a6aa@amd.com>
In-Reply-To: <e38b9278-21d7-d4d5-0362-0c63b9f4a6aa@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0094.apcprd03.prod.outlook.com
 (2603:1096:203:72::34) To MN2PR12MB2910.namprd12.prod.outlook.com
 (2603:10b6:208:af::27)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6121b820-90b4-415a-6a54-08d70b83465a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3262; 
x-ms-traffictypediagnostic: MN2PR12MB3262:
x-microsoft-antispam-prvs: <MN2PR12MB32621F8E59C4DCE5AA0D1493B4C80@MN2PR12MB3262.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(199004)(189003)(6512007)(36756003)(316002)(3846002)(2906002)(5660300002)(6246003)(6116002)(66066001)(486006)(305945005)(446003)(53936002)(4744005)(11346002)(229853002)(99286004)(6436002)(6486002)(110136005)(66476007)(71200400001)(71190400001)(66446008)(64756008)(66946007)(66556008)(8676002)(31696002)(68736007)(52116002)(76176011)(186003)(8936002)(26005)(31686004)(256004)(102836004)(81156014)(7736002)(2501003)(476003)(81166006)(14454004)(2616005)(386003)(25786009)(6506007)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3262;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Q+jVY9ZRhebtnwyLFWNVvYaiQodvBWYWQ3DIIt3O1J2ed4Deh94+7pBTkO9GtVdRZnnbrleBEAdIz4B+ML20gDrpP4bzHz35K3qQqtGENWPvqrlcOBnRX1EzwI9umXRvY8Q4EKsSCNs04SXx1FpukZt5gWyWQ3PPJ+/vqrHk6tjoCI6iwShzKPIm5l52k8PnxASyxGkIh2PX7Zy5mHEN7JH5RM/0gF2MLA4HujpZV61ppLttJ82JmYhAJjaAcolIXpBriEEwcHVz4kpjE+gt92qqHTGKsPmrurnY7nDqj+5ps2a1Lpuurp83A+GEH9csg2DfRhIBg/dcRgPM6O4hndOr+MoJgGVUuYCSHr5m+GxijKZaig8mz/jGvlnYoXRNsdf1H2LXvC0zeSkjG9PgPeLpVFzTgp3QtGdgVxXYFEg=
Content-ID: <625A4ABD62AA1343831DE3B50ACF26B8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6121b820-90b4-415a-6a54-08d70b83465a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 13:24:34.7355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhoucm1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3262
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1A6vROEe1EFe7pmdBJKWSNMZ95/cvbSsJsIK+qh3hRg=;
 b=VrRoSEoRcCop3f6p++BaDlfjjm1CFlx6r2nIOnDTs8k//EFgKbrJZcHYLEeCfVVTe9Okbvu6quV63AO9MSG7VtmalL/hzq0LnjEiNRPgkS6RN0yONjDRIwz/OZS8fENAWTJ0/F/vchAr1CuJTDWX7XH28sJmm2+XWpAOv5cQ8Xw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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

DQrlnKggMjAxOS83LzE4IDIxOjE1LCBaaG91LCBEYXZpZChDaHVuTWluZykg5YaZ6YGTOg0KPiDl
nKggMjAxOS83LzE4IDIxOjEwLCBDaHJpcyBXaWxzb24g5YaZ6YGTOg0KPj4gUXVvdGluZyBDaHVu
bWluZyBaaG91ICgyMDE5LTA3LTE4IDE0OjA0OjA5KQ0KPj4+IOWcqCAyMDE5LzcvMTggMTk6MTgs
IENocmlzIFdpbHNvbiDlhpnpgZM6DQo+Pj4+IFF1b3RpbmcgQ2h1bm1pbmcgWmhvdSAoMjAxOS0w
Ny0xOCAxMjoxMzozOSkNCj4+Pj4+IGlmIFdBSVRfRk9SX1NVQk1JVCBpc24ndCBzZXQgYW5kIGlu
IHRoZSBtZWFud2hpbGUgbm8gdW5kZXJseWluZyBmZW5jZSBvbiBzeW5jb2JqLA0KPj4+Pj4gdGhl
biByZXR1cm4gbm9uLWJsb2NrIGVycm9yIGNvZGUgdG8gdXNlciBzYXBjZS4NCj4+Pj4gQmxvY2sg
ZGV2aWNlIHJlcXVpcmVkPw0KPj4+IFllcywgaWYgV0FJVF9GT1JfU1VCTUlUIGlzIHNldCwgdGhl
biB0aGF0IHdpbGwgYmxvY2sgZGV2aWNlLg0KPj4gTm8sIHRoZSBlcnJvciBtZXNzYWdlIGlzIHRo
YXQgaXQgcmVxdWlyZXMgYSAiYmxvY2sgZGV2aWNlIiwgbm90IHRoYXQgaXQNCj4+IHdpbGwgYmxv
Y2sgdGhlIGRldmljZSwgd2hpY2ggaXMgRVdPVUxEQkxPQ0suDQoNCkFoLCBJIHRoaW5rIEkgZG9u
J3Qgd2FudCBFV09VTERCTE9DSywgd2hpY2ggd2lsbCB0cnkgYWdhaW4gYW5kIGFnYWluIA0KaW9j
dGwsIHRoYXQgaXMgbm90IG15IG1vdml0YXRpb24uDQoNCkkganVzdCBuZWVkIGEgbWVhbmluZ2Z1
bCB2YWx1ZSB0byBpZGVudGlmeSB0aGUgdW5kZXJseWluZyBmZW5jZSBpc24ndCANCnJlYWR5IG9u
IHN5bmNvYmouDQoNCkJlY2F1c2UgaXQgaXMgaW4gJ2Vsc2UnIGNhc2UsIEVOT1RCTEsgaXMgY29y
cmVjdCB0byBzYXkgaGVyZSBuZWVkIGJsb2NrIA0KYnV0IFdBSVRfRk9SX1NVQk1JVCBpc24ndCBz
ZXQuDQoNCg0KLURhdmlkDQoNCj4gT0ssIEkgZ290IHlvdXIgbWVhbi4NCj4NCj4gQW55IG90aGVy
IHBvc3NpbGUgdmFsdWUgc3VnZ2VzdHRlZD8NCj4NCj4gLURhdmlkDQo+DQo+PiAtQ2hyaXMNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
