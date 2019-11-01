Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B442ECBB0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 23:49:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEA86F88F;
	Fri,  1 Nov 2019 22:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140072.outbound.protection.outlook.com [40.107.14.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BD76E314;
 Fri,  1 Nov 2019 19:51:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldRQgE1Rj7/zZaUqx7Vnh1bdZUlsajSRmfBrrZfdb9ufwcBY5lmjgglWbVMczagp71+yIzgs+5JaCQk4+SYSGOz14LKgAc3Rm2bJjVxRfpNpv5HzWr9nuoXtLWYjA9x3sERuT1b8KvXs4dGuc/w3UjokFtbNUd+3gz9jnqeDKQY35VLtVJxIW+9Jk/tpTpC2B31//ibANRhrUDaS7qtHnM8k7rDIOwVsKbe1pS6qBSaShm+D2wHbrjztsB75i8ucq8SC0IzOiI8rG17DBjoj7H4eGkpg+JOHx3ztbSSlfpIewGW3l4gWBWXKL+TEux1CiGvpbsuuXxeqwM6movRemw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWwZ2XtdGwxXjxwE/hReH72BscduCJm9z5Bp/6u1AC4=;
 b=V+IDmekWZuGV6Z12P6wVY14yTl1Gaq4d8xC4pWWUCquw62SOv9HqPAV8MrejbAxGwLgwvvUqA5XTSUwz6P/23Om7e+gN9PtrErcuvHQ/bOKmQKUZAF2Iovbfav4EhvlyOKRYqBOW+t0yTuAcidsJiFzz/E+mUKIXIa79mK9PcHCcLRf6W8oqVPK1vFepKcCqpbBrFv5D+BhyyXzOmAHGsMrdseayVM86PixYoWq5b93jWooUHfWYRGBSnTgwR88sEJNO6w5JtHjix42cUHU+MQ80jqy6GaiDGDV+P93FLCbN+7zgwllYCQGEZCB2J0s9KyT2TOXHShl5Sy/ODmM4OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5344.eurprd05.prod.outlook.com (20.178.9.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Fri, 1 Nov 2019 19:51:29 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2387.028; Fri, 1 Nov 2019
 19:51:29 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: "Yang, Philip" <Philip.Yang@amd.com>
Subject: Re: [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier instead of
 hmm_mirror
Thread-Topic: [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier instead of
 hmm_mirror
Thread-Index: AQHVjcvOUfhzqykxXkO0v7SQaQq3BKdyANqAgAAA3wCABGiEgIAAB7AAgAANJwCAABzBgIAAIl8AgAABrwA=
Date: Fri, 1 Nov 2019 19:51:28 +0000
Message-ID: <20191101195124.GU22766@mellanox.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-15-jgg@ziepe.ca>
 <a456ebd0-28cf-997b-31ff-72d9077a9b8e@amd.com>
 <20191029192544.GU22766@mellanox.com>
 <30b2f569-bf7a-5166-c98d-4a4a13d1351f@amd.com>
 <20191101151222.GN22766@mellanox.com>
 <8280fb65-a897-3d71-79f9-9f80d9e474e9@amd.com>
 <20191101174221.GO22766@mellanox.com>
 <fc6ded68-287b-5257-db79-42c92458a5f6@amd.com>
In-Reply-To: <fc6ded68-287b-5257-db79-42c92458a5f6@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR04CA0061.namprd04.prod.outlook.com
 (2603:10b6:404:8d::11) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7740aa31-e9ec-453e-9df3-08d75f04e2d6
x-ms-traffictypediagnostic: VI1PR05MB5344:
x-microsoft-antispam-prvs: <VI1PR05MB5344BB097F988E2B0F6A57CCCF620@VI1PR05MB5344.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(199004)(189003)(66446008)(26005)(6506007)(386003)(86362001)(5660300002)(102836004)(6916009)(305945005)(7736002)(33656002)(7416002)(76176011)(256004)(14444005)(8676002)(8936002)(186003)(52116002)(6246003)(71190400001)(71200400001)(478600001)(6486002)(81166006)(6436002)(476003)(2906002)(3846002)(1076003)(6512007)(229853002)(4326008)(99286004)(2616005)(316002)(11346002)(446003)(486006)(81156014)(25786009)(14454004)(66946007)(36756003)(66066001)(64756008)(66556008)(66476007)(6116002)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5344;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8RmT0V5+Y1HAT/pf6TwQxTEp9gNNOs+vvYElioIeoFPaAsjhiaiSZ1q2xrCiekrR4ORSWaZIvPKFVhbSwNL/7X9NJUHMUZuVhCrdViV2+xSh6WEAX9yY1zugETdwbhX7fB/tLGld1nxc3pkXGRr0LX1vFyGoyH4KzzKBRjQJ8D0hG7yXh9VGlv75f8c45cQ49vQVW+/reaKoKrpaYLInKJjlTnVT/UoZxP4QXTkl4q//yRoy3SE1NrzzgPx4Z3nH4lYgTFGkpZwETM9rfPmYbtuUyQVvxMd7ONhOs19wWyAeyb3VGUT2uiX5xK6OZTQRFzvtwqcvZgdUb6yb8hNRdXqs5jvUqzgLP2GiqZ3dmbHtYf740A/nxk0Z2PHWRw08D9xFQAtDMNMaDqOI08uAcQtK9SZXWd3Vr1XJKwtGx9hT2LLOYVVjEm4OLbv5ax/9
x-ms-exchange-transport-forked: True
Content-ID: <B1E7655020E6F545A1E395E5B3C9D53A@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7740aa31-e9ec-453e-9df3-08d75f04e2d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 19:51:28.8956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TjnuhY3W6vKxH0pIRCJPt/XwqCfIMhgkz3RZDP780BC7bF53kz9EzyedPbTy25pzVTbXB7nx0opsI84jgV+Ttw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5344
X-Mailman-Approved-At: Fri, 01 Nov 2019 22:49:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWwZ2XtdGwxXjxwE/hReH72BscduCJm9z5Bp/6u1AC4=;
 b=bzmokrAlB30iM3x6QNOwClemyS4qipxNgLnNfKg8+jfeim9tPQ8/tVdHb11XhtBjc9s6qD9zwiSP+KqMbeIMmhAWhNspCyPYW+WKdqetRfeyen7Mz9fIykgCv2nW9sJYADvuMNhln8YlAq0ecJBZn+zIWvjpvv9rrObzoWYAjfo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Jerome Glisse <jglisse@redhat.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMDEsIDIwMTkgYXQgMDc6NDU6MjJQTSArMDAwMCwgWWFuZywgUGhpbGlwIHdy
b3RlOgoKPiA+IFRoaXMgbXVzdCBiZSBkb25lIGluc2lkZSB0aGUgbm90aWZpZXJfbG9jaywgYWZ0
ZXIgY2hlY2tpbmcKPiA+IG1tdV9yYW5nZV9yZWFkX3JldHJ5KCksIGFsbCBoYW5kbGluZyBvZiB0
aGUgc3RydWN0IHBhZ2UgbXVzdCBiZQo+ID4gc3RydWN0dXJlZCBsaWtlIHRoYXQuCj4gPiAKPiBC
ZWxvdyBjaGFuZ2Ugd2lsbCBmaXggdGhpcywgdGhlbiBkcml2ZXIgd2lsbCBjYWxsIG1tdV9yYW5n
ZV9yZWFkX3JldHJ5IAo+IHNlY29uZCB0aW1lIHVzaW5nIHNhbWUgcmFuZ2UtPm5vdGlmaWVyX3Nl
cSB0byBjaGVjayBpZiByYW5nZSBpcyAKPiBpbnZhbGlkYXRlZCBpbnNpZGUgYW1kZ3B1X2NzX3N1
Ym1pdCwgdGhpcyBsb29rcyBvayBmb3IgbWUuCgpMZXRzIGRlZmVyIHRoaXMgdG8gc29tZSBwYXRj
aCB0cnlpbmcgdG8gZml4IGl0LCBJIGZpbmQgaXQgaGFyZCB0bwpmb2xsb3cuLgoKPiBAQCAtODY4
LDYgKzg2OSwxMyBAQCBpbnQgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgYW1k
Z3B1X2JvIAo+ICpibywgc3RydWN0IHBhZ2UgKipwYWdlcykKPiAgICAgICAgICAgICAgICAgIGdv
dG8gb3V0X2ZyZWVfcGZuczsKPiAgICAgICAgICB9Cj4gCj4gKyAgICAgICBtdXRleF9sb2NrKCZh
ZGV2LT5ub3RpZmllcl9sb2NrKTsKPiArCj4gKyAgICAgICBpZiAobW11X3JhbmdlX3JlYWRfcmV0
cnkoJmJvLT5ub3RpZmllciwgcmFuZ2UtPm5vdGlmaWVyX3NlcSkpIHsKPiArICAgICAgICAgICAg
ICAgbXV0ZXhfdW5sb2NrKCZhZGV2LT5ub3RpZmllcl9sb2NrKTsKPiArICAgICAgICAgICAgICAg
Z290byByZXRyeTsKPiArICAgICAgIH0KPiArCj4gICAgICAgICAgZm9yIChpID0gMDsgaSA8IHR0
bS0+bnVtX3BhZ2VzOyBpKyspIHsKPiAgICAgICAgICAgICAgICAgIHBhZ2VzW2ldID0gaG1tX2Rl
dmljZV9lbnRyeV90b19wYWdlKHJhbmdlLCByYW5nZS0+cGZuc1tpXSk7Cj4gICAgICAgICAgICAg
ICAgICBpZiAodW5saWtlbHkoIXBhZ2VzW2ldKSkgewo+IEBAIC04NzUsMTAgKzg4MywxMiBAQCBp
bnQgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2JvIAo+ICpibywg
c3RydWN0IHBhZ2UgKipwYWdlcykKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGks
IHJhbmdlLT5wZm5zW2ldKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgciA9IC1FTk9NRU07
Cj4gCj4gKyAgICAgICAgICAgICAgICAgICAgICAgbXV0ZXhfdW5sb2NrKCZhZGV2LT5ub3RpZmll
cl9sb2NrKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXRfZnJlZV9wZm5zOwo+
ICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgIH0KCldlbGwsIG1heWJlPyAKClRoZSBxdWVz
dGlvbiBub3cgaXMgd2hhdCBoYXBwZW5zIHRvICdwYWdlcycgPyBXaXRoIHRoaXMgYXJyYW5nbWVu
dCB0aGUKZHJpdmVyIGNhbm5vdCB0b3VjaCAncGFnZXMnIHdpdGhvdXQgYWxzbyBhZ2FpbiBnb2lu
ZyB1bmRlciB0aGUgbG9jawphbmQgY2hlY2tpbmcgcmV0cnkuIAoKSWYgaXQgZG9lc24ndCB0b3Vj
aCBpdCwgdGhlbiBsZXRzIGp1c3QgbW92ZSB0aGlzIGRldmljZV9lbnRyeV90b19wYWdlCnRvIGEg
bW9yZSBhcHByb3ByaWF0ZSBwbGFjZT8KCkknZCBwcmVmZXIgaXQgaWYgdGhlIGRyaXZlciBjb3Vs
ZCBiZSBzdHJ1Y3R1cmVkIGluIHRoZSBub3JtYWwgd2F5LAp3aXRoIGEgY2xlYXIgbG9ja2VkIHJl
Z2lvbiB3aGVyZSB0aGUgcGFnZSBsaXN0IGlzIGhhbmRsZWQuLgoKSmFzb24KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
