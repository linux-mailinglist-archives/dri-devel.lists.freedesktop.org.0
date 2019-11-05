Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E55A3F011A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 16:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FD56EAA9;
	Tue,  5 Nov 2019 15:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770081.outbound.protection.outlook.com [40.107.77.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5128F6E049;
 Tue,  5 Nov 2019 15:20:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mziQiFmp1QK/KkvlpOCl3DrX559ppjHbcH8ukyQJO1WMpJeBF03mqFY/cFayEO+lQmhuBh7YbjV6IGb6MU8Kj3L9HjeDkMvVsJ2EKKE0QkDtfUhoXlyP/CNAIeEA4FehzHNG+uOQl/Okp4g15BuKBZDMUdTurCIk4qKtomkNRFsyfeJOwNrMvyf3kkoKfXw/6xZ4kwJL2q3MtrzYEpr8xYd8Ib146ej0dIbOePMjbAJYFcyVAwvsNuqEPL2Yt9w96AMFErmVlhsstKgBwjAQD04iRxwxGSlfZV7lauAVBnEPa0TyClTJwo2+WWOMp+0wvw9DObbLt2/AfcgAP0Wm+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCmZiTn0acP0O6Qya4ufV1BVEd4KVy/vx8BWrJGd0K0=;
 b=axtNGbvXeGvVGasK3yjhJkHyUNHMq2f7pe7ItVq16wr+pBxL3NXWt4Up8ZSCrY88lK5UTFQmdrnWG3SksFS9fLlw7Y7nfAp/Ge+TxKBV6s6YJ+2AJYWxyVOf0wRasaa4UZDbsPckCdtUrH7CDX7EUPGGrx9Z6H8KJItI0r50Yo39VdE7sn8EzyGUBrchXdum2WqNgZwhPNMRjvMrGs41Rky5xgI6yOhCresvWehowZc7diZB0IIMcUli9at6750qhPr8mGiyEPGWb7rYjPnb0JaeNs4jSj/Vz18v6BfAmvcbHEDaoB9XX5R/OffwX0ZQvs3XAPE0iUf7+Ch43+MFig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1516.namprd12.prod.outlook.com (10.172.34.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Tue, 5 Nov 2019 15:20:30 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933%7]) with mapi id 15.20.2408.024; Tue, 5 Nov 2019
 15:20:30 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify
Thread-Topic: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify
Thread-Index: AQHVk+APDdEHArcE+E6S7bNhcuKLWKd8sVYA
Date: Tue, 5 Nov 2019 15:20:30 +0000
Message-ID: <7d430beb-7f88-ca51-b3d6-9b7c95954234@amd.com>
References: <20191029104049.9011-1-christian.koenig@amd.com>
 <20191029104049.9011-6-christian.koenig@amd.com>
 <20191105105252.GE10326@phenom.ffwll.local>
 <0c506743-1def-2c49-886a-4fa125b33151@gmail.com>
 <CAKMK7uEimcoB2vojTHDxQ1p2GaK7kBJQ3hWFzYoMtmDJYabwfA@mail.gmail.com>
In-Reply-To: <CAKMK7uEimcoB2vojTHDxQ1p2GaK7kBJQ3hWFzYoMtmDJYabwfA@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR06CA0005.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::18) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4c965e62-5996-45d3-5778-08d76203b1db
x-ms-traffictypediagnostic: DM5PR12MB1516:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB15164B6A3B580E0F8611A354837E0@DM5PR12MB1516.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(189003)(199004)(51914003)(8936002)(76176011)(6916009)(102836004)(7736002)(478600001)(256004)(476003)(14454004)(66946007)(52116002)(71190400001)(6116002)(2616005)(66446008)(86362001)(66476007)(64756008)(5660300002)(229853002)(6436002)(5024004)(14444005)(2906002)(31696002)(53546011)(305945005)(6506007)(386003)(6486002)(71200400001)(36756003)(8676002)(25786009)(46003)(66556008)(966005)(54906003)(186003)(6306002)(99286004)(31686004)(4326008)(446003)(65806001)(65956001)(486006)(81156014)(81166006)(316002)(66574012)(6246003)(11346002)(6512007)(58126008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1516;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9P91iwqs9Gt1xrM3HJ3sgLfMi3SDOVLwq1l5WHKKGTvx7KVRbhTroJyEQ9CHfjh1kAvuT6fTv1b9o+4DnczR313ik8BDVm3KltiWNb5tnd4gZJu2ZeKk5vk22jWgjiT+qAJEDwFynuwQ1rMQ2nNNCxjjMFd3TCXjYulWEgyaM9O00AKG8FNJiJL2CsXrhvTXfw+9Z4gxNsR/sirieulEaDi2ZfH2beqqEYfnuG0NwPa4F/5Ki0E9UqtldRy/Vth0g+otPGkSdSa2NSalLmn0gL764R/sc5f+h/2zqds9VelJ2w6ilNXtEfbQCb8gP3zYqqvPl4vC75eZerzMW8d4rnnZycgfc0rqvLBKn7gfYbhnTwiSeBndldkhOIc4Ho7APYmVK6V5Dic8e6PfG1Nt9ZZcRIKAdtDQNU2y5bXTYBS2HCAM1zcaKvrDsIie79WRPcbLbL86gJWxf8nJ2yBH1gU2DrW/hf5H5llmLviWf8s=
x-ms-exchange-transport-forked: True
Content-ID: <CEE8DFF87F0A424DBB50D06AC0D7CDAC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c965e62-5996-45d3-5778-08d76203b1db
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2019 15:20:30.6499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dNWoHLOxZcxIRKldWimKPz3YZPCLOSLdhtn5ObuoCW2vy/RHBRfCtzSkVZH3IgG5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1516
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCmZiTn0acP0O6Qya4ufV1BVEd4KVy/vx8BWrJGd0K0=;
 b=T1p5bHbynEryY0xVa3/yQmFM+ms7fLczd6jEM5ipNGcIfNr/nndkLUwhkGBU5IEn324QHCei2ecACDYh4hhGh1nWqu8a2QwedWn0BQX8eYj3K9wvevFpLswB4hT9BE0jkuO3nbzy3PEA26qEJmnTLFzB1aQ3UEZx8rfhVg+7gzY=
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDUuMTEuMTkgdW0gMTQ6NTAgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBUdWUsIE5v
diA1LCAyMDE5IGF0IDI6MzkgUE0gQ2hyaXN0aWFuIEvDtm5pZw0KPiA8Y2tvZW5pZy5sZWljaHR6
dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOg0KPj4gQW0gMDUuMTEuMTkgdW0gMTE6NTIgc2Nocmll
YiBEYW5pZWwgVmV0dGVyOg0KPj4+IE9uIFR1ZSwgT2N0IDI5LCAyMDE5IGF0IDExOjQwOjQ5QU0g
KzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+Pj4+IEltcGxlbWVudCB0aGUgaW1wb3J0
ZXIgc2lkZSBvZiB1bnBpbm5lZCBETUEtYnVmIGhhbmRsaW5nLg0KPj4+Pg0KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+Pj4+
IC0tLQ0KPj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5j
IHwgMjggKysrKysrKysrKysrKysrKysrKystDQo+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9vYmplY3QuYyAgfCAgNiArKysrKw0KPj4+PiAgICAyIGZpbGVzIGNoYW5n
ZWQsIDMzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jDQo+Pj4+IGluZGV4IDM2MjljZmU1
M2FhZC4uYWYzOTU1M2M1MWFkIDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMNCj4+Pj4gQEAgLTQ1Niw3ICs0NTYsMzMgQEAgYW1kZ3B1
X2RtYV9idWZfY3JlYXRlX29iaihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZG1hX2J1
ZiAqZG1hX2J1ZikNCj4+Pj4gICAgICAgcmV0dXJuIEVSUl9QVFIocmV0KTsNCj4+Pj4gICAgfQ0K
Pj4+Pg0KPj4+PiArLyoqDQo+Pj4+ICsgKiBhbWRncHVfZG1hX2J1Zl9tb3ZlX25vdGlmeSAtICZh
dHRhY2gubW92ZV9ub3RpZnkgaW1wbGVtZW50YXRpb24NCj4+Pj4gKyAqDQo+Pj4+ICsgKiBAYXR0
YWNoOiB0aGUgRE1BLWJ1ZiBhdHRhY2htZW50DQo+Pj4+ICsgKg0KPj4+PiArICogSW52YWxpZGF0
ZSB0aGUgRE1BLWJ1ZiBhdHRhY2htZW50LCBtYWtpbmcgc3VyZSB0aGF0IHRoZSB3ZSByZS1jcmVh
dGUgdGhlDQo+Pj4+ICsgKiBtYXBwaW5nIGJlZm9yZSB0aGUgbmV4dCB1c2UuDQo+Pj4+ICsgKi8N
Cj4+Pj4gK3N0YXRpYyB2b2lkDQo+Pj4+ICthbWRncHVfZG1hX2J1Zl9tb3ZlX25vdGlmeShzdHJ1
Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gpDQo+Pj4+ICt7DQo+Pj4+ICsgICAgc3RydWN0
IHR0bV9vcGVyYXRpb25fY3R4IGN0eCA9IHsgZmFsc2UsIGZhbHNlIH07DQo+Pj4+ICsgICAgc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSBhdHRhY2gtPmltcG9ydGVyX3ByaXY7DQo+Pj4+ICsg
ICAgc3RydWN0IGFtZGdwdV9ibyAqYm8gPSBnZW1fdG9fYW1kZ3B1X2JvKG9iaik7DQo+Pj4+ICsg
ICAgc3RydWN0IHR0bV9wbGFjZW1lbnQgcGxhY2VtZW50ID0ge307DQo+Pj4+ICsgICAgaW50IHI7
DQo+Pj4+ICsNCj4+Pj4gKyAgICBpZiAoYm8tPnRiby5tZW0ubWVtX3R5cGUgPT0gVFRNX1BMX1NZ
U1RFTSkNCj4+Pj4gKyAgICAgICAgICAgIHJldHVybjsNCj4+Pj4gKw0KPj4+PiArICAgIHIgPSB0
dG1fYm9fdmFsaWRhdGUoJmJvLT50Ym8sICZwbGFjZW1lbnQsICZjdHgpOw0KPj4+PiArICAgIGlm
IChyKQ0KPj4+PiArICAgICAgICAgICAgRFJNX0VSUk9SKCJGYWlsZWQgdG8gaW52YWxpZGF0ZSBE
TUEtYnVmIGltcG9ydCAoJWQpKVxuIiwgcik7DQo+Pj4gV2hlcmUgZG8geW91IHVwZGF0ZSBwYWdl
dGFibGVzPw0KPj4+DQo+Pj4gVGhlIG9ubHkgdGhpbmcgSSd2ZSBmb3VuZCBpcyBpbiB0aGUgYW1k
Z3B1IENTIGNvZGUsIHdoaWNoIGlzIHdheSB0byBsYXRlDQo+Pj4gZm9yIHRoaXMgc3R1ZmYgaGVy
ZS4gUGx1cyBUVE0gZG9lc24ndCBoYW5kbGUgdmlydHVhbCBtZW1vcnkgYXQgYWxsIChhc2lkZQ0K
Pj4+IGZyb20gdGhlIGdhcnQgdHQpLCBzbyBjbGVhcmx5IHlvdSBuZWVkIHRvIGNhbGwgaW50byBh
bWRncHUgY29kZSBzb21ld2hlcmUNCj4+PiBmb3IgdGhpcy4gQnV0IEkgZGlkbid0IGZpbmQgaXQs
IG5laXRoZXIgaW4geW91ciAtPm1vdmVfbm90aWZ5IG5vciB0aGUNCj4+PiAtPm1vdmUgY2FsbGJh
Y2sgaW4gdHRtX2JvX2RyaXZlci4NCj4+Pg0KPj4+IEhvdyBkb2VzIHRoaXMgd29yaz8NCj4+IFBh
Z2UgdGFibGVzIGFyZSBub3QgdXBkYXRlZCB1bnRpbCB0aGUgbmV4dCBjb21tYW5kIHN1Ym1pc3Np
b24sIGUuZy4gaW4NCj4+IGFtZGdwdV9jcy5jDQo+Pg0KPj4gVGhpcyBpcyBzYXZlIHNpbmNlIGFs
bCBwcmV2aW91cyBjb21tYW5kIHN1Ym1pc3Npb25zIGFyZSBhZGRlZCB0byB0aGUNCj4+IGRtYV9y
ZXN2IG9iamVjdCBhcyBmZW5jZXMgYW5kIHRoZSBkbWFfYnVmIGNhbid0IGJlIG1vdmVkIGJlZm9y
ZSB0aG9zZQ0KPj4gYXJlIHNpZ25hbGVkLg0KPiBIbSwgSSB0aG91Z2h0IHlvdSBzdGlsbCBhbGxv
dyBleHBsaWNpdCBidWZmZXIgbGlzdHMgZm9yIGVhY2ggY3MgaW4NCj4gYW1kZ3B1PyBDb2RlIGxv
b2tzIGF0IGxlYXN0IGxpa2UgdGhhdCwgbm90IGV2ZXJ5dGhpbmcgZ29lcyB0aHJvdWdoIHRoZQ0K
PiBjb250ZXh0IHdvcmtpbmcgc2V0IHN0dWZmLg0KPg0KPiBIb3cgZG8geW91IHByZXZlbnQgdGhl
IHNlY3VyaXR5IGxlYWsgaWYgdXNlcnNwYWNlIHNpbXBseSBsaWVzIGFib3V0DQo+IG5vdCB1c2lu
ZyBhIGdpdmVuIGJ1ZmZlciBpbiBhIGJhdGNoLCBhbmQgdGhlbiBhYnVzaW5nIHRoYXQgdG8gcmVh
ZA0KPiB0aGF0IHZpcnR1YWwgYWRkcmVzcyByYW5nZSBhbnl3YXkgYW5kIHBlZWsgYXQgd2hhdGV2
ZXIgaXMgbm93IGdvaW5nIHRvDQo+IGJlIHRoZXJlIHdoZW4gYW4gZXZpY3Rpb24gaGFwcGVuZWQ/
DQoNCk9oLCB5ZWFoIHRoYXQgaXMgYSByZWFsbHkgZ29vZCBwb2ludC4gQW5kIG5vIHRoYXQgaXNu
J3QgaGFuZGxlZCANCmNvcnJlY3RseSBhdCBhbGwuDQoNCkkgd2FudGVkIHRvIHJld29yayB0aGF0
IGZvciBxdWl0ZSBzb21lIHRpbWUgbm93LCBidXQgYWx3YXlzIGdvdCBpbnRvIA0KaXNzdWVzIHdp
dGggVFRNLg0KDQpUaGFua3MgZm9yIHRoZSBub3RpY2UsIHNvIEkgbmVlZCB0byBwdXQgbXkgVFRN
IHJld29yayBiZWZvcmUgb2YgdGhpcy4gDQpDcmFwLCB0aGF0IGFkZHMgYSB3aG9sZSBidW5jaCBv
ZiBUT0RPcyB0byBteSBsaXN0Lg0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0KDQo+IC1EYW5pZWwN
Cj4NCj4+IENocmlzdGlhbi4NCj4+DQo+Pj4gLURhbmllbA0KPj4+DQo+Pj4+ICt9DQo+Pj4+ICsN
Cj4+Pj4gICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWFfYnVmX2F0dGFjaF9vcHMgYW1kZ3B1X2Rt
YV9idWZfYXR0YWNoX29wcyA9IHsNCj4+Pj4gKyAgICAubW92ZV9ub3RpZnkgPSBhbWRncHVfZG1h
X2J1Zl9tb3ZlX25vdGlmeQ0KPj4+PiAgICB9Ow0KPj4+Pg0KPj4+PiAgICAvKioNCj4+Pj4gQEAg
LTQ5Miw3ICs1MTgsNyBAQCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmFtZGdwdV9nZW1fcHJpbWVf
aW1wb3J0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+Pj4+ICAgICAgICAgICAgICAgcmV0dXJu
IG9iajsNCj4+Pj4NCj4+Pj4gICAgICAgYXR0YWNoID0gZG1hX2J1Zl9keW5hbWljX2F0dGFjaChk
bWFfYnVmLCBkZXYtPmRldiwNCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZhbWRncHVfZG1hX2J1Zl9hdHRhY2hfb3BzLCBOVUxMKTsNCj4+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICZhbWRncHVfZG1hX2J1Zl9hdHRhY2hfb3BzLCBvYmop
Ow0KPj4+PiAgICAgICBpZiAoSVNfRVJSKGF0dGFjaCkpIHsNCj4+Pj4gICAgICAgICAgICAgICBk
cm1fZ2VtX29iamVjdF9wdXQob2JqKTsNCj4+Pj4gICAgICAgICAgICAgICByZXR1cm4gRVJSX0NB
U1QoYXR0YWNoKTsNCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmpl
Y3QuYw0KPj4+PiBpbmRleCBhYzc3NmQyNjIwZWIuLmNmYTQ2MzQxYzlhNyAxMDA2NDQNCj4+Pj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jDQo+Pj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYw0KPj4+PiBAQCAt
ODYxLDYgKzg2MSw5IEBAIGludCBhbWRncHVfYm9fcGluX3Jlc3RyaWN0ZWQoc3RydWN0IGFtZGdw
dV9ibyAqYm8sIHUzMiBkb21haW4sDQo+Pj4+ICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+Pj4+
ICAgICAgIH0NCj4+Pj4NCj4+Pj4gKyAgICBpZiAoYm8tPnRiby5iYXNlLmltcG9ydF9hdHRhY2gp
DQo+Pj4+ICsgICAgICAgICAgICBkbWFfYnVmX3Bpbihiby0+dGJvLmJhc2UuaW1wb3J0X2F0dGFj
aCk7DQo+Pj4+ICsNCj4+Pj4gICAgICAgYm8tPmZsYWdzIHw9IEFNREdQVV9HRU1fQ1JFQVRFX1ZS
QU1fQ09OVElHVU9VUzsNCj4+Pj4gICAgICAgLyogZm9yY2UgdG8gcGluIGludG8gdmlzaWJsZSB2
aWRlbyByYW0gKi8NCj4+Pj4gICAgICAgaWYgKCEoYm8tPmZsYWdzICYgQU1ER1BVX0dFTV9DUkVB
VEVfTk9fQ1BVX0FDQ0VTUykpDQo+Pj4+IEBAIC05NDQsNiArOTQ3LDkgQEAgaW50IGFtZGdwdV9i
b191bnBpbihzdHJ1Y3QgYW1kZ3B1X2JvICpibykNCj4+Pj4NCj4+Pj4gICAgICAgYW1kZ3B1X2Jv
X3N1YnRyYWN0X3Bpbl9zaXplKGJvKTsNCj4+Pj4NCj4+Pj4gKyAgICBpZiAoYm8tPnRiby5iYXNl
LmltcG9ydF9hdHRhY2gpDQo+Pj4+ICsgICAgICAgICAgICBkbWFfYnVmX3VucGluKGJvLT50Ym8u
YmFzZS5pbXBvcnRfYXR0YWNoKTsNCj4+Pj4gKw0KPj4+PiAgICAgICBmb3IgKGkgPSAwOyBpIDwg
Ym8tPnBsYWNlbWVudC5udW1fcGxhY2VtZW50OyBpKyspIHsNCj4+Pj4gICAgICAgICAgICAgICBi
by0+cGxhY2VtZW50c1tpXS5scGZuID0gMDsNCj4+Pj4gICAgICAgICAgICAgICBiby0+cGxhY2Vt
ZW50c1tpXS5mbGFncyAmPSB+VFRNX1BMX0ZMQUdfTk9fRVZJQ1Q7DQo+Pj4+IC0tDQo+Pj4+IDIu
MTcuMQ0KPj4+Pg0KPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KPj4+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+Pj4+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCj4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
