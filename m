Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F538D2C98
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 16:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9494C6EB5C;
	Thu, 10 Oct 2019 14:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810055.outbound.protection.outlook.com [40.107.81.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A796E358;
 Thu, 10 Oct 2019 14:33:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFqa0cHQkLlRlTo0m30EAmG0HftoBbG0njw0exGN4A1T94LJTHg9c6UOleX3LcRcYlaHxGzo+bLyQgpzKPUTCyrB1VFiZUsLm3JypjvmCxSxnVjZFftHziILaCu0SGA9MZdGIgzdMOR3fRfSyJUZZ5oHb/4YyOqd20Xqq/YzLQ32bzGdBcDrRipBPE6zRxOSAyTR+nUvpnm9MeA9drqPxW8w/4MLXFmnqUamA1ZauVHN68Em7Q3rKzml8fkTkcUCGqcQSakxEL2yid3OyRjPC4xX90KYzFnrknvhtXKwDYb8RIUca+Q8HPwcpcsxRecv/eKXvS1yP6mZO2fCbfItJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5QtG4JpbPcwiqZGW0/a8yc0fnBOu2s5PkSIVBqjfPc=;
 b=ADUypH9v8ZbTv1JhKrUNHqiScA0+tT6lxp0h3Mt0j0VzW+mSAqNk0SXJlmDQxKb0/eZWD/cLGIbYcztZk5O8ll5GyKPLa7V4/0QNhohGJMZUBZrBBtj20UFERO6TrDGkwfbgshfHtPGag46B45MBlOHQFV7yxn59tdncHYrmnShldTVy3U4ucRN80J6UEQj9C/6DOF/Cr8djPZy8gnjjaSukAs0etSh6BQrJy7fQh5+SSTgnVo/BK9LOnxX8ESMha1lVptf6LDxTlAs4kgjm3wpBL4/0DcUK35yY7WllkDbSkMILnckZ1h1DyCcitJbH0cd9FZNN5QuRpN2AwYcI2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1865.namprd12.prod.outlook.com (10.175.87.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 10 Oct 2019 14:33:21 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2327.026; Thu, 10 Oct
 2019 14:33:21 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Qiang Yu <yuq825@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] dma-buf/resv: fix exclusive fence get
Thread-Topic: [PATCH] dma-buf/resv: fix exclusive fence get
Thread-Index: AQHVcRpRudsfv3x2/0ig8l9P5ZHZ2qc3nSaAgAAJNICAHGVFgIAAAXgA
Date: Thu, 10 Oct 2019 14:33:20 +0000
Message-ID: <6c4d61f9-9956-8af9-3298-d328bdb4700e@amd.com>
References: <20190922074900.853-1-yuq825@gmail.com>
 <156915463935.21369.4938801884938429332@skylake-alporthouse-com>
 <156915661567.21369.17366014102480171128@skylake-alporthouse-com>
 <CAKGbVbv11BLiv3Mgn2o5PnOKn1H6+mY1ZsXVetpcqSsE98Dd9Q@mail.gmail.com>
In-Reply-To: <CAKGbVbv11BLiv3Mgn2o5PnOKn1H6+mY1ZsXVetpcqSsE98Dd9Q@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM3PR05CA0135.eurprd05.prod.outlook.com
 (2603:10a6:207:3::13) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5c3dc35-83da-497d-a373-08d74d8ecc59
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1865:
x-microsoft-antispam-prvs: <DM5PR12MB1865A4AF10E2318BB4FD627883940@DM5PR12MB1865.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(199004)(189003)(51914003)(66476007)(64756008)(6512007)(476003)(102836004)(6116002)(66446008)(66556008)(2616005)(31696002)(486006)(66946007)(52116002)(186003)(86362001)(446003)(256004)(14454004)(7736002)(14444005)(6486002)(5660300002)(6246003)(71200400001)(71190400001)(66574012)(305945005)(229853002)(478600001)(6436002)(54906003)(25786009)(53546011)(386003)(58126008)(316002)(31686004)(46003)(110136005)(11346002)(36756003)(65956001)(65806001)(81166006)(8676002)(6506007)(81156014)(2906002)(4326008)(76176011)(8936002)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1865;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2T05839+yeYW6mAqolqkXE4t68PVOni3PRxXeBbZED2ydlleAdDyXKBuHoP2V7K16C4M56Xt0zTbjwiO+da+KSRUSc5yAX6uOLgzh4XDyH+PBMCJLlK2qNyWKUB9VLQct95pVz5Ox9Mr8B4/J+ouYcfxoYplFzTVNr1mEed+zbsk/8ZK1W+/rLX9oIE9QDHyMfDHkN5CU6JmmWmxtgzf8pHwe7Ci1XOeH1Zi6WEJ0a4SvZgst/ICWlk/NuzPWyVDBlJnO/tdjyQzvqbL0E/iWJvkjR1JHc7TWiy5mibtMyBu0UbUIDv5T7VCk4XwFlH3TZ3pxX8wEkpsI4lCe+vKEg0zLnMKT42pa7Abo8Rv5pNFlIa0+A8tLslcgfa3QKym0Cu3cZ6fVhtC617LzFto/vb4VVPYzLbGHeb91UZ7ZeA=
x-ms-exchange-transport-forked: True
Content-ID: <4B04F2DAA6BC504DBBAA2F5F28C6CC7D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c3dc35-83da-497d-a373-08d74d8ecc59
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 14:33:20.9783 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zZIcocIBYS52w1r4EbPODRUetBOlB4szsdiSarG1ZXy2fqYnVMdf1O4jGHL48be3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1865
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5QtG4JpbPcwiqZGW0/a8yc0fnBOu2s5PkSIVBqjfPc=;
 b=4ObIetleS1Vc7yzjM5yoK9/LT3qneAjo+8Gr2pQOnLGZ7jonWG5aowLbDhAMsdqoFfjAhOp/0araB68vpZVM+1DLDb3gyfm7QrHsFFvwXSRYMA1kO0l//RwG8UFTl4KZWxUYjQ+ZHko7WB6lEJ5cC7xx9oso/wKBfU+qojI5SeU=
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "lima@lists.freedesktop.org" <lima@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUWlhbmcsDQoNCm9oLCBnb29kIHBvaW50LiBZZXMgaXQgY2VydGFpbmx5IHNob3VsZC4NCg0K
TG9va3MgbGlrZSBJIGFjY2lkZW50YWxseSBwdXNoZWQgaXQgdG8gdGhlIHdyb25nIGJyYW5jaC4N
Cg0KVGhhbmtzLA0KQ2hyaXN0aWFuLg0KDQpBbSAxMC4xMC4xOSB1bSAxNjoyNyBzY2hyaWViIFFp
YW5nIFl1Og0KPiBIaSBDaHJpcywNCj4NCj4gVGhpcyBmaXggaGFzIGJlZW4gcHVzaGVkIHRvIGRy
bS1taXNjLW5leHQgZm9yIGEgd2hpbGUuIEJ1dCBMaW51eA0KPiA1LjQtcmMga2VybmVscyBzdGls
bCBkb2VzIG5vdCBoYXZlIHRoaXMgZml4Lg0KPiBTaG91bGQgaXQgYmUgYWxzbyBwdXNoZWQgdG8g
ZHJtLW1pc2MtZml4ZXM/DQo+DQo+IFRoYW5rcywNCj4gUWlhbmcNCj4NCj4NCj4gT24gU3VuLCBT
ZXAgMjIsIDIwMTkgYXQgODo1MCBQTSBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4gd3JvdGU6DQo+PiBRdW90aW5nIENocmlzIFdpbHNvbiAoMjAxOS0wOS0yMiAxMzoxNzox
OSkNCj4+PiBRdW90aW5nIFFpYW5nIFl1ICgyMDE5LTA5LTIyIDA4OjQ5OjAwKQ0KPj4+PiBUaGlz
IGNhdXNlcyBrZXJuZWwgY3Jhc2ggd2hlbiB0ZXN0aW5nIGxpbWEgZHJpdmVyLg0KPj4+Pg0KPj4+
PiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPj4+PiBG
aXhlczogYjhjMDM2ZGZjNjZmICgiZG1hLWJ1Zjogc2ltcGxpZnkgcmVzZXJ2YXRpb25fb2JqZWN0
X2dldF9mZW5jZXNfcmN1IGEgYml0IikNCj4+Pj4gU2lnbmVkLW9mZi1ieTogUWlhbmcgWXUgPHl1
cTgyNUBnbWFpbC5jb20+DQo+Pj4+IC0tLQ0KPj4+PiAgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVz
di5jIHwgMiArLQ0KPj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2
LmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYw0KPj4+PiBpbmRleCA0MmE4ZjNmMTE2ODEu
LjcwOTAwMjUxNTU1MCAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2
LmMNCj4+Pj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMNCj4+Pj4gQEAgLTQ3MSw3
ICs0NzEsNyBAQCBpbnQgZG1hX3Jlc3ZfZ2V0X2ZlbmNlc19yY3Uoc3RydWN0IGRtYV9yZXN2ICpv
YmosDQo+Pj4+ICAgICAgICAgIGlmIChwZmVuY2VfZXhjbCkNCj4+Pj4gICAgICAgICAgICAgICAg
ICAqcGZlbmNlX2V4Y2wgPSBmZW5jZV9leGNsOw0KPj4+PiAgICAgICAgICBlbHNlIGlmIChmZW5j
ZV9leGNsKQ0KPj4+PiAtICAgICAgICAgICAgICAgc2hhcmVkWysrc2hhcmVkX2NvdW50XSA9IGZl
bmNlX2V4Y2w7DQo+Pj4+ICsgICAgICAgICAgICAgICBzaGFyZWRbc2hhcmVkX2NvdW50KytdID0g
ZmVuY2VfZXhjbDsNCj4+PiBPb3BzLg0KPj4+DQo+Pj4gUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPg0KPj4gQXBwbGllZCwgdGhhbmtzIGZvciB0aGUg
Zml4Lg0KPj4gLUNocmlzDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
