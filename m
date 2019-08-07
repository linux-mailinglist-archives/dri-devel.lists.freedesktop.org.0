Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F84584C5F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 15:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9D56E6CA;
	Wed,  7 Aug 2019 13:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680089.outbound.protection.outlook.com [40.107.68.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4136C6E6C8;
 Wed,  7 Aug 2019 13:05:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2yQJl41WPgKzHHqXFWnwS7ecbfpRvXTLQ1E6UfPJ8hGqC4VkX8fW61u//is3wElyeDZOWv6Aloe7soia14CLcER9DnbeqBbQhoDny8XLIKIAX0GUsAcrIoo7ZMjnKs4cMAdN+JKZZKGP6z5/mbb0N+wYojSHYIHtQ0OZmNfcUdDrtvxVjWN1UfukNzt/I2hKAn8iqbjKKe9y8b9uLZrReOH0dmEghcn65McCfWARr62mnU9als5t2JxYOp+HJK4ekJCp7GZYib4ndUbweIjtcbiK49fxXy02xO+mhS6P1O+vjgDvbhh9jteLlbR2PYZtgiCbCS0bYWRGTDPKtwXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cp0Bru47XChuLan5ikXyOSoGgnZ5NiLpdnw0tkk/mqo=;
 b=jvCIxcng8WcYp0j85hTzkqM4TwiCUnUVf1JyxzUGTe00E/KGWZdDFRqZvITWM92ANCihODzsjebjIsPkHGJMVhR/ZaBEMpmh39C+tOTGB54PQjhKyPk9CDJaDn8Pc/n3cy7ZHEXNwpiqUv7CzcpAmR7gLr9e/P9JluyIycBB1uGT2hDMjV3x3beTFiw+vfU4aIvfVVW4zJnXdKJGQRw0Hzpxgk0kz6QXlpp5j6w3rHilDu3pVx0lvMwpTZH3+YwjXcp3Iac2/3v5TlEpJMj5TaoRIbs4+pBgyUNw7UfzNBnLjJ7WieueKyes3MpERMeIDlwIq+vQo0j2mG2UIkW1RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1947.namprd12.prod.outlook.com (10.175.90.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Wed, 7 Aug 2019 13:05:08 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 13:05:08 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH 8/8] dma-buf: nuke reservation_object seq number
Thread-Topic: [PATCH 8/8] dma-buf: nuke reservation_object seq number
Thread-Index: AQHVTRpb91t5ZYLRKE+wmaRlvaEGJqbvpz0A
Date: Wed, 7 Aug 2019 13:05:08 +0000
Message-ID: <be4c4454-4672-65d5-073b-b399aa43338c@amd.com>
References: <20190806150134.104222-1-christian.koenig@amd.com>
 <20190806150134.104222-8-christian.koenig@amd.com>
 <156512144622.6198.5051468008483309313@skylake-alporthouse-com>
 <7fc516cd-bbd7-1829-1851-7d7deadb0468@gmail.com>
 <156518035127.6198.2346142882693144294@skylake-alporthouse-com>
In-Reply-To: <156518035127.6198.2346142882693144294@skylake-alporthouse-com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0201.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::21) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 041fdf07-df54-41c7-c680-08d71b37df3f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1947; 
x-ms-traffictypediagnostic: DM5PR12MB1947:
x-microsoft-antispam-prvs: <DM5PR12MB1947070A1A05DC1CC4B639EC83D40@DM5PR12MB1947.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(199004)(189003)(64126003)(6116002)(229853002)(2906002)(110136005)(6436002)(446003)(11346002)(76176011)(99286004)(8676002)(31696002)(81156014)(86362001)(14444005)(316002)(65826007)(8936002)(486006)(6486002)(81166006)(2501003)(186003)(52116002)(476003)(2616005)(71200400001)(71190400001)(256004)(65806001)(46003)(58126008)(65956001)(386003)(6506007)(102836004)(6512007)(66446008)(478600001)(64756008)(66556008)(14454004)(2201001)(66946007)(31686004)(7736002)(66574012)(5660300002)(36756003)(68736007)(25786009)(53936002)(6246003)(305945005)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1947;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LvCrtsOKCvLMjTlAMRStdM3p/q9ZlrPtUfz/BKGhbJeMz/zrSYVABWE5nPG62Dwtm6hDTM0Mn2Ee8L3x933t0CJXGhxyDT61K5wY03yjgiF66x9Iz4m0JPjH+Nw78DHbma9b8SwXAViHNS/hfdBJD4VUdoeOUKAIGEQGFCRNLbK30DqXLpds0zQGsm6oKpGOCJHXr9cu+QJgkP2frBgwPUeNdPuGBroYn7Tvi9F1jUJayES+G+QAY4GboGOelIqC2xeJdaEBvIoQHX4PXCy8HV38SkJhVl3IBBBidLA82goosCjsP364a/3fyy9B3dHh73bjEhyw3UBYSgDOLKORiDuGBJ/miMEwPNXIkICdFKyXadbutoGjMKgxhDOxEkVB+2b0yawQnHqnDsHMD+NOuG8KUzWPVLqoXXomXmhJ4vE=
Content-ID: <027B7DBD9EA9C94B929ACDAA9A8C861F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 041fdf07-df54-41c7-c680-08d71b37df3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 13:05:08.0823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1947
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cp0Bru47XChuLan5ikXyOSoGgnZ5NiLpdnw0tkk/mqo=;
 b=dLpWtskCa5ec4vqDbJaNa33FO8x+bndwsP24Hg3cTjM4QcCIP0q7qlSDeFelIRCRJKjxJvg8/DlvYPTdfPIfIiVhsKGMTxZrqdaMRGux0iaeKKbtP03dwsPcWxzbFeylQzz3+iFvfQ3II6A+C8P6lt8PT6x5QbiNk1G1qkJyeC0=
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

QW0gMDcuMDguMTkgdW0gMTQ6MTkgc2NocmllYiBDaHJpcyBXaWxzb246DQo+IFF1b3RpbmcgQ2hy
aXN0aWFuIEvDtm5pZyAoMjAxOS0wOC0wNyAxMzowODozOCkNCj4+IEFtIDA2LjA4LjE5IHVtIDIx
OjU3IHNjaHJpZWIgQ2hyaXMgV2lsc29uOg0KPj4+IElmIHdlIGFkZCB0byBzaGFyZWQtbGlzdCBk
dXJpbmcgdGhlIHJlYWQsIC4uLiBIbW0sIGFjdHVhbGx5IHdlIHNob3VsZA0KPj4+IHJldHVybiBu
dW1fbGlzdCwgaS5lLg0KPj4+DQo+Pj4gZG8gew0KPj4+ICAgICAgICAqbGlzdCA9IHJjdV9kZXJl
ZmVyZW5jZShvYmotPmZlbmNlKTsNCj4+PiAgICAgICAgbnVtX2xpc3QgPSAqbGlzdCA/ICgqbGlz
dCktPmNvdW50IDogMDsNCj4+PiAgICAgICAgc21wX3JtYigpOw0KPj4+IH0gd2hpbGUgKC4uLikN
Cj4+Pg0KPj4+IHJldHVybiBudW1fbGlzdC4NCj4+Pg0KPj4+IGFzIHRoZSByZWxhdGlvbnNoaXAg
YmV0d2VlbiB0aGUgY291bnQgYW5kIHRoZSBmZW5jZSBlbnRyaWVzIGlzIGFsc28NCj4+PiBkZXRl
cm1pbmVkIGJ5IHRoZSBtYiBpbiBhZGRfc2hhcmVkX2ZlbmNlLg0KPj4gSSd2ZSByZWFkIHRoYXQg
bXVsdGlwbGUgdGltZXMgbm93LCBidXQgY2FuJ3QgZm9sbG93LiBXaHkgc2hvdWxkIHdlIGRvIHRo
aXM/DQo+Pg0KPj4gVGhlIG9ubHkgaW1wb3J0YW50IHRoaW5nIGlzIHRoYXQgdGhlIHJlYWRlcnMg
c2VlIHRoZSBuZXcgZmVuY2UgYmVmb3JlDQo+PiB0aGUgaW5jcmVtZW50IG9mIHRoZSBudW1iZXIg
b2YgZmVuY2VzLg0KPiBFeGFjdGx5LiBXZSBvcmRlciB0aGUgc3RvcmUgc28gdGhhdCB0aGUgZmVu
Y2UgaXMgaW4gdGhlIGxpc3QgYmVmb3JlIHdlDQo+IHVwZGF0ZSB0aGUgY291bnQgKHNvIHRoYXQg
d2UgZG9uJ3QgcmVhZCBnYXJiYWdlIGJlY2F1c2UgdGhlIGZlbmNlIGlzbid0DQo+IHRoZXJlIHll
dCkuDQo+DQo+IEJ1dCB3ZSBkb24ndCBoYXZlIHRoZSBlcXVpdmFsZW50IGhlcmUgZm9yIHRoZSBy
ZWFkIG9uY2UgdGhlIHJtYiBpcw0KPiByZW1vdmVkIGZyb20gdGhlIHNlcWNvdW50X3JlYWRfYmVn
aW4vZW5kIGxvb3BpbmcuIFdlIG5lZWQgdG8gc2VlIHRoZQ0KPiB1cGRhdGUgaW4gdGhlIHNhbWUg
b3JkZXIgYXMgd2FzIHN0b3JlZCwgYW5kIG9ubHkgdXNlIHRoZSBjb2hlcmVudA0KPiBwb3J0aW9u
IG9mIHRoZSBsaXN0Lg0KDQpPayB0aGF0IG1ha2VzIHNlbnNlLiBHb2luZyB0byBmaXggdXAgdGhl
IGNvZGUgcmVnYXJkaW5nIHRvIHRoYXQuDQoNCkNocmlzdGlhbi4NCg0KPiAtQ2hyaXMNCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
