Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BA46E334
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 11:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EC26E5D4;
	Fri, 19 Jul 2019 09:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750075.outbound.protection.outlook.com [40.107.75.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4775B6E5D4;
 Fri, 19 Jul 2019 09:14:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1p+4enESC+U1QfnovXk2TjKForAubE4f1l1i/dXPhp52IZchxmaGA26niMcltC1KpJzCyNtPo0Xi/1ajc7czwFLcdV8g0i10qvQV6iFrbmRekwm676dNa8x5iHYWx//lZQGde+qc+QkcBko5HG45JK+PgrGUPXemcnHYYVy6yUICRajmJ1gjNCe3YmJm5u6Lqwki5JW5bgbmgkAjsOWefGOAzzakRynAm57fO7NP7e2hnDIznypyNUG5iEQK4lf+KVQAcofJwhqvwYR+zOJc+fsAZeolxdf5bxIM870cNG7KVTAlZamMtZSMPIbjGfmI2iQAf8blYghGkO4g/LsDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jO52ZA0RvWJkAHpxIJtWyZ5A+S+/JaJgQKjul4DiSY=;
 b=g6NOvhQHtUdTkMMYHteaZuYJg8E2humX1ww4WCvQ5erS14P5f5u4bBHzq8zrt0Albz7f9mSp3bn8u1ED9pndDdh0zIebn13dm/EYWrv+MSCusd0+VwAaFZzFyr4bjpoUyW352UmuWz43Cu7NaUz+u4uUQoFwec4bLtp2Z5UQWOOrdko9R4Dy/AtZ78tH7z5H1wWme5oxePriaSHnbgFqfZnkyE2fNlia+yRkwf4vyXlVLzkfQWRTNrOiTvb92nDudr/8koAoz0piWiBl30QePG5AHgWkBURaw+mFCPDPvc6uEOnCNJPH5gfqzL2Nc16IDDqWNV/3Zd3qkGZ4nDl4ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1577.namprd12.prod.outlook.com (10.172.39.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 09:14:05 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2094.011; Fri, 19 Jul
 2019 09:14:05 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/6] dma-buf: add dynamic DMA-buf handling v13
Thread-Topic: [PATCH 1/6] dma-buf: add dynamic DMA-buf handling v13
Thread-Index: AQHVPhATRhK3fufdkUGFBmd2Z3oLpabRqHcA
Date: Fri, 19 Jul 2019 09:14:05 +0000
Message-ID: <4704d3c5-894d-6ac1-4afb-06c275700bac@amd.com>
References: <20190626122310.1498-1-christian.koenig@amd.com>
 <20190626122933.GK12905@phenom.ffwll.local>
 <ef70981d-3d52-b339-b3f5-190635969621@gmail.com>
 <20190719085757.GD15868@phenom.ffwll.local>
In-Reply-To: <20190719085757.GD15868@phenom.ffwll.local>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0106.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::22) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a34f015b-9067-4498-29d5-08d70c2972ca
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1577; 
x-ms-traffictypediagnostic: DM5PR12MB1577:
x-microsoft-antispam-prvs: <DM5PR12MB1577593DF0569547FD90BD9183CB0@DM5PR12MB1577.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(189003)(199004)(2906002)(2616005)(446003)(476003)(81156014)(256004)(486006)(7736002)(478600001)(305945005)(11346002)(68736007)(64756008)(66556008)(66476007)(66946007)(66446008)(6436002)(65956001)(31696002)(81166006)(5660300002)(46003)(53936002)(99286004)(36756003)(186003)(8936002)(6512007)(6486002)(86362001)(65806001)(58126008)(6116002)(14454004)(229853002)(6246003)(54906003)(25786009)(64126003)(316002)(8676002)(71200400001)(65826007)(71190400001)(386003)(102836004)(6506007)(76176011)(4326008)(6916009)(31686004)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1577;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +U3GHCr3IPR9Cf+Z/yZeCmk2TuxGIo0/1l+Wm5sUqipu/GLsc50tiMqgUoe8PjNENLF+x/1j6mW4UfXmBI8IIjHPI6/8z5xtlqaIVo9St6rZgMsMc/xer/BFx0Z/lOyhNniGDsPMnc5gEslNk3N+Ytnshtcb8p5l6WqSso6R2UjJLjUy8rEt6C5iWTmO5QtVskB9d+so6LmSp41G0HXrssNqcIFAR++JxeN8EP36Gc4jwxT2Bg32g1QHM2tv8YjCMFGwJ8F9ZaPRDRqbS6rFXsyyFLjJj1MtQZX2m84AxctTHh4fYpwZTNGVYoDxWNnC/Q9SF1s2M0Sj/8WRkiskAw3LBD/9Q3txBM+v7s4mJmyy9aomlK4C5Jklke6EYmA4GIIxG4jsORm9jjiAJjFsXO25e9lj9LZRaMSbXuVGGkM=
Content-ID: <9A2C147D4230B44E8B6E2856535F6B05@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a34f015b-9067-4498-29d5-08d70c2972ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 09:14:05.7800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1577
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jO52ZA0RvWJkAHpxIJtWyZ5A+S+/JaJgQKjul4DiSY=;
 b=LZj3LWY9U4E3b8OlIhBV+yutU621oNgGe3g2uAwMZk4ILj+RlvIBbq+6L6jg2s389J+FrEieX+ohNrYIpRQF0RlUSp812nZQijQIy5rYcAbQ7wT9kR0BKhlQULOQMA0fRXYeWu4+s0oe8v0mSaeQ6xgVq7PiuVNWibNLpsCYTz0=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTkuMDcuMTkgdW0gMTA6NTcgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBUdWUsIEp1
bCAxNiwgMjAxOSBhdCAwNDoyMTo1M1BNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0K
Pj4gQW0gMjYuMDYuMTkgdW0gMTQ6Mjkgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPj4+IE9uIFdl
ZCwgSnVuIDI2LCAyMDE5IGF0IDAyOjIzOjA1UE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3Jv
dGU6DQo+Pj4gW1NOSVBdDQo+Pj4gQWxzbyBJIGxvb2tlZCBhdCBDSSByZXN1bHRzIGFuZCBzdHVm
ZiwgSSBndWVzcyB5b3UgaW5kZWVkIGRpZG4ndCBicmVhayB0aGUNCj4+PiB3b3JsZCBiZWNhdXNl
IENocmlzIFdpbHNvbiBoYXMgZmF1Z2h0IGJhY2sgc3RydWN0X211dGV4IGZhciBlbm91Z2ggYnkg
bm93Lg0KPj4+DQo+Pj4gT3RoZXIgaXNzdWUgaXMgdGhhdCBzaW5jZSAyIHdlZWtzIG9yIHNvIG91
ciBDSSBzdGFydGVkIGZpbHRlcmluZyBhbGwNCj4+PiBsb2NrZGVwIHNwbGF0cywgc28geW91IG5l
ZWQgdG8gZGlnIGludG8gcmVzdWx0cyB5b3Vyc2VsZi4NCj4+Pg0KPj4+IGJ0dyBvbiB0aGF0LCBJ
IHRoaW5rIGluIHRoZSBlbmQgdGhlIHJlc2VydmF0aW9uX29iaiBsb2NraW5nIHdpbGwgYXQgYmVz
dA0KPj4+IGJlIGNvbnNpc3RlbnQgYmV0d2VlbiBhbWRncHUgYW5kIGk5MTU6IEkganVzdCByZW1l
bWJlcmVkIHRoYXQgYWxsIG90aGVyDQo+Pj4gdHRtIGRyaXZlcnMgaGF2ZSB0aGUgbW1hcF9zZW0g
dnMgcmVzdl9vYmogbG9ja2luZyB0aGUgd3Jvbmcgd2F5IHJvdW5kLCBhbmQNCj4+PiB0aGUgdHJ5
bG9jayBpbiB0dG1fYm9fZmF1bHQuIFNvIHRoYXQgcGFydCBhbG9uZSBpcyBob3BlbGVzcywgYnV0
IEkgZ3Vlc3MNCj4+PiBzaW5jZSByYWRlb24ua28gaXMgYWJhbmRvbndhcmUgbm8gb25lIHdpbGwg
ZXZlciBmaXggdGhhdC4NCj4+Pg0KPj4+IFNvIEkgdGhpbmsgaW4gdGhlIGVuZCBpdCBib2lscyBk
b3duIHRvIHdoZXRoZXIgdGhhdCdzIGdvb2QgZW5vdWdoIHRvIGxhbmQNCj4+PiBpdCwgb3Igbm90
Lg0KPj4gV2VsbCBjYW4geW91IGdpdmUgbWUgYW4gcmIgdGhlbj8gSSBtZWFuIGF0IHNvbWUgcG9p
bnQgSSBoYXZlIHRvIHB1c2ggaXQgdG8NCj4+IGRybS1taXNjLW5leHQuDQo+IFdlbGwgbXkgbWFp
bCBoZXJlIHByZWNlZWRlZCB0aGUgZW50aXJlIGFtZGtmZCBldmljdGlvbl9mZW5jZSBkaXNjdXNz
aW9uLg0KPiBXaXRoIHRoYXQgSSdtIG5vdCBzdXJlIGFueW1vcmUsIHNpbmNlIHdlIGRvbid0IHJl
YWxseSBuZWVkIHR3byBhcHByb2FjaGVzDQo+IG9mIHRoZSBzYW1lIHRoaW5nLiBBbmQgaWYgdGhl
IHBsYW4gaXMgdG8gbW92ZSBhbWRrZmQgb3ZlciBmcm9tIHRoZQ0KPiBldmljdGlvbl9mZW5jZSB0
cmljayB0byB1c2luZyB0aGUgaW52YWxpZGF0ZSBjYWxsYmFjayBoZXJlLCB0aGVuIEkgdGhpbmsN
Cj4gd2UgbWlnaHQgbmVlZCBzb21lIGNsYXJpZmljYXRpb25zIG9uIHdoYXQgZXhhY3RseSB0aGF0
IG1lYW5zLg0KDQpNaG0sIEkgdGhvdWdodCB0aGF0IHRoaXMgd2FzIG9ydGhvZ29uYWwuIEkgbWVh
biB0aGUgaW52YWxpZGF0aW9uIA0KY2FsbGJhY2sgZm9yIGEgYnVmZmVyIGFyZSBpbmRlcGVuZGVu
dCBmcm9tIGhvdyB0aGUgZHJpdmVyIGlzIGdvaW5nIHRvIA0KdXNlIGl0IGluIHRoZSBlbmQuDQoN
Ck9yIGRvIHlvdSBtZWFuIHRoYXQgd2UgY291bGQgdXNlIGZlbmNlcyBhbmQgc2F2ZSB1cyBmcm9t
IGFkZGluZyBqdXN0IA0KYW5vdGhlciBtZWNoYW5pc20gZm9yIHRoZSBzYW1lIHNpZ25hbGluZyB0
aGluZz8NCg0KVGhhdCBjb3VsZCBvZiBjb3Vyc2Ugd29yaywgYnV0IEkgaGFkIHRoZSBpbXByZXNz
aW9uIHRoYXQgeW91IGFyZSBub3QgDQp2ZXJ5IGluIGZhdm9yIG9mIHRoYXQuDQoNCkNocmlzdGlh
bi4NCg0KPiAtRGFuaWVsDQo+DQo+PiBDaHJpc3RpYW4uDQo+Pg0KPj4NCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
