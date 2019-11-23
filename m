Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F051089CE
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D53B89FBC;
	Mon, 25 Nov 2019 08:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130074.outbound.protection.outlook.com [40.107.13.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A19B6E0A1;
 Sat, 23 Nov 2019 23:59:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7oQcPJn5RbV4pUbtUQj+tGyOsCKD/SQRlBPQ2xY3Hk5AZrq0J2Q0joudp6IzSVxJ77mteJxujv5FaLkL0dRXgnN5tuwwZD62pNkgT31/VNIGDaWVf+NxK7H7Er9S6VxZSDGEDddX1c0DyPPRu+HMzRBmzsH8+YPEmr6en5SmnlXGmb6GNxtjwv+yHk4d7tPQQSwytJMnIZ7XheKVgcY3U3IGQqTV8QugQ5AbpA8lIqU+NiPQD6fYv+9xjUb7jDX/x2Zg6OA9CdbUePSYSJbbxfBCpUs+VnaZXgtQqaFFOVzmiEWimL4VyEqMW/LdAHKQQXEUSI/Xe2Ksnd/gvRCJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tG3BhuXFbBVHuHg1OVkBKM/r08cR0g51GqrmJqL1T8=;
 b=ncbjzA+4x8miC/WeldSkz5S18V2a1ek38bTJeOGYR4DzWlmxKyGygyz5VnkUPpdntAAVlkz4N5t+1A5RGHqDhEIkj3J7LgphJ2BndRz+55eS5ffPt7iktPJOSrX7KsV9zuw4xMwD+IOGPhH5eWFgJKqMtluvGtlYDwKh5ytOvS4qMZg4Dnz6FPupjySTkv7eNlNJxRBCXVJPs2uLPyofeCL6tTgrYr2pM1fnXrJEwqnuO4Uaf40DDPjnimJ47u9wi9x6+cI55a4yjmGkMJIf2K8KqTEnxAWkYU7j1RLTeg7KIw2QdYNGbDO34lizJAEcHp88F+3jVgYdRLvcoEVA+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4301.eurprd05.prod.outlook.com (52.133.12.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Sat, 23 Nov 2019 23:59:53 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2474.022; Sat, 23 Nov 2019
 23:59:53 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v3 02/14] mm/mmu_notifier: add an interval tree notifier
Thread-Topic: [PATCH v3 02/14] mm/mmu_notifier: add an interval tree notifier
Thread-Index: AQHVmZb2YQDWU76vNEuRDpxoc3xJraeJIg8AgAAugwCADq1FAIABgyiA
Date: Sat, 23 Nov 2019 23:59:53 +0000
Message-ID: <20191123235949.GE7481@mellanox.com>
References: <20191112202231.3856-1-jgg@ziepe.ca>
 <20191112202231.3856-3-jgg@ziepe.ca> <20191113135952.GB20531@infradead.org>
 <20191113164620.GG21728@mellanox.com>
 <cc5d4d76-df30-af7f-931c-eed8a7ada122@nvidia.com>
In-Reply-To: <cc5d4d76-df30-af7f-931c-eed8a7ada122@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR20CA0019.namprd20.prod.outlook.com
 (2603:10b6:208:e8::32) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0d427873-2349-4579-4bbc-08d770713b93
x-ms-traffictypediagnostic: VI1PR05MB4301:
x-microsoft-antispam-prvs: <VI1PR05MB43013C8B673CDD00B8A79DC4CF480@VI1PR05MB4301.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0230B09AC4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(346002)(39850400004)(136003)(199004)(189003)(51444003)(81156014)(8676002)(81166006)(1076003)(8936002)(66066001)(5660300002)(66446008)(64756008)(66556008)(66476007)(66946007)(7736002)(305945005)(7416002)(99286004)(2906002)(316002)(54906003)(6116002)(3846002)(256004)(14444005)(76176011)(102836004)(386003)(52116002)(6246003)(6512007)(71190400001)(71200400001)(11346002)(6916009)(229853002)(2616005)(6436002)(6486002)(446003)(86362001)(25786009)(33656002)(478600001)(36756003)(14454004)(186003)(26005)(6506007)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4301;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?UFx/oesvBWwS5HyfQ0rALDckqPKV6/aZ7bbvgWJwk9JpjdmK1Z0i/n2+v9?=
 =?iso-8859-1?Q?Md9K+cFmtJ3o4DX5qxQAufq5bFC2ferav4VOC5vpZ1i6t9dz82EZWU0g7M?=
 =?iso-8859-1?Q?pgQFxkGPsSQBJyvbtOEZYYi3zzZCoP5cDhf3SOexWuxGtIkAuPSu6GcATO?=
 =?iso-8859-1?Q?BgY8po5PwNPuTE6ktNqT/R4aZ7YZTGRmOeYha3qjsCYmsorjb5iPrF1es2?=
 =?iso-8859-1?Q?i5Q3qoRhZC6L9B2a6cdJJD3W5cfeahgyY8tmtZDJJd9sIpmyk749godmIz?=
 =?iso-8859-1?Q?+fZ9pZnjifofs5mhKFUEH4O/6XOcwi3sY1URaCwkFR7Ls5RziUN0mie2Ey?=
 =?iso-8859-1?Q?yGWd2wAWYWcgPD4HZ2y57oTL664rJXlgfOMt5wKyz6VR2gDdmzMAmwO5Ms?=
 =?iso-8859-1?Q?YQukDfxG+s7Kh9ivTaP5ymbiy5CaW6qQI4nMTpDNtOZZHaNFcTVwNLuIOK?=
 =?iso-8859-1?Q?16Kh85J2+ynfD4n0V3q6Mf4JIvP1ggQfadWZHZo0LCUGIzls2DrY1CdyI5?=
 =?iso-8859-1?Q?HaVpyLl76pS15YnI5BQUk/EK0ZE3DffSG+jRuQGH0nyFzLjezcMd8khnyn?=
 =?iso-8859-1?Q?4SWyWLSy/rBLgf85bmMT6+aXlBzfwLdCb+2Dtk27+1Kh0lqgSxDzkqpetJ?=
 =?iso-8859-1?Q?CnxfJxGXCr1fc4adFmh5o+y9ZnsgXaS+C8a0SpyGRlvKmhws8mDaCNduU+?=
 =?iso-8859-1?Q?Xrbsln0cWA3kUkRqQzZemvhMlX4CsmFH97jQtximYcLxv98hB59BR0MB/L?=
 =?iso-8859-1?Q?LfyNWhPUxEEn/dfs4r0f36OpTOnv27oP95vGy8xhbUDjsDE20Cy+A45QbR?=
 =?iso-8859-1?Q?GfioK6lA5eGdylulPwiucuirIC4obyuelfW+gxiMU9NTOwgP43gKRi7JOM?=
 =?iso-8859-1?Q?iElXcU1xjj4Bd4DbZINFe7QNjvTdz9f+Mvp8nFo4BrTWPqm1lkIJNFx4PN?=
 =?iso-8859-1?Q?Oe5eye8g/nb4/sWMlfm3xu0iuKK5O4Y3iPL5/ZbmPE0aBDQjfbIpDx7/Fa?=
 =?iso-8859-1?Q?4arwr88ffXuDmtJg6FuQda7Cm8cncvx58gMTcgh8BXDcIdKL0JHZtBhd0d?=
 =?iso-8859-1?Q?D/088FffPVqRrVI0K6xzUnivUIiZwUg4N7LXA1Ex4UO1pguvWlXDv3ZT5w?=
 =?iso-8859-1?Q?OYtX2S5ssGfnIxf6bKmKiOzT/6rdm9s4Y3xTEzsljz2FYlEfLPEiiQeLsc?=
 =?iso-8859-1?Q?38hDhQNaLUp13akk8wmtuhRM5XrNIcQwBErVK6f9oH7lfo8eQBtTLCpDKp?=
 =?iso-8859-1?Q?C6OqBV4yQ0e9Ci4v405XxNQQTUBUXnF8mWLqaDWH+tYDEA/7Hkup1NtrL6?=
 =?iso-8859-1?Q?q36sAsGXX4Urxm2ZmWvpnidvZaRs0M8+z//jyBOsqnvNrftV/uoKD5xUNU?=
 =?iso-8859-1?Q?ogWynO80J/HlH/2f9oj8mUbaJePf0VM8wSQiBXHq7x+T6h6RXokIpj+aB6?=
 =?iso-8859-1?Q?MTtmfWx6OJoI4gvpvBakYhbzIjNjBMjEYlsIw+5zBXK8nrGtKgsSmdxXb6?=
 =?iso-8859-1?Q?6F4VnLpzv9MbITPdnvxqZIpokbC17cGxh2BZ7bKkqyqkYfXIjMX4kOvMrb?=
 =?iso-8859-1?Q?jmec8+WI8SXg6VB4TieUSPawtTcix/8LNDurMCnPVabPmotMtS8jvocupn?=
 =?iso-8859-1?Q?y0mm1w34m+RmYVkz9ly0EhaKBwdGgf7L8MABa/hk25w92ErzncA2pRGiUB?=
 =?iso-8859-1?Q?vU72GVakKAcwzh18kz9lwPcopdJCSbYvgVXgwezwRCQ6thGBw4Im5qkSff?=
 =?iso-8859-1?Q?ESbWrQGJ0NkOvDE0NzBKLTyIvmvxQSGw2Rou6r5ralz2L2gs6705Kp1b8F?=
 =?iso-8859-1?Q?6LehXcLdL1lzKwrE+I8vNE8E3gesDN+FazZ/lVmXA2EGfRsuxous?=
x-ms-exchange-transport-forked: True
Content-ID: <2C9272320C17A343A8D1A92DF2D430C9@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d427873-2349-4579-4bbc-08d770713b93
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2019 23:59:53.1827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ovgwfZZMnPehXbjnYToo4y34Rpy8X9ROzO7tay0hpWAJqf+jzjyXjP4vWiJZTILD+UgpjVVPIGY+lHRHCQwv7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4301
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:07:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tG3BhuXFbBVHuHg1OVkBKM/r08cR0g51GqrmJqL1T8=;
 b=V4giAi9MigqtefKCtIJTk3rgr2stKiFHpU8DYQJ9xenlyX52ApYZtj7SOuqYvSHGQ+X3d0NjNuuKWpJytFCG3WaETxC7QOTgDo/f9Qp9uqiq5eFQjw491Bg505bp5GNZCpsUNBSLJXVsFaGeAqUTJkIAeUVIyMSs1gip8JViuo4=
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
 Philip Yang <Philip.Yang@amd.com>, John Hubbard <jhubbard@nvidia.com>,
 Jerome Glisse <jglisse@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMDQ6NTQ6MDhQTSAtMDgwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cgo+IEFjdHVhbGx5LCBJIHRoaW5rIHlvdSBjYW4gcmVtb3ZlIHRoZSAibmVlZF93YWtl
IiB2YXJpYWJsZSBzaW5jZSBpdCBpcwo+IHVuY29uZGl0aW9uYWxseSBzZXQgdG8gInRydWUiLgoK
T2gsIHllcywgdGhhbmsgeW91LiBBbiBlYXJsaWVyIHJldmlzaW9uIGhhZCBhIGRpZmZlcmVudCBj
b250cm9sIGZsb3cKIAo+IEFsc28sIHRoZSBjb21tZW50IGluX19tbXVfaW50ZXJ2YWxfbm90aWZp
ZXJfaW5zZXJ0KCkgc2F5cwo+ICJtbmktPm1yX2ludmFsaWRhdGVfc2VxIiBhbmQgSSB0aGluayB0
aGF0IHNob3VsZCBiZQo+ICJtbmktPmludmFsaWRhdGVfc2VxIi4KCkdvdCBpdC4KCkkgc3F1YXNo
ZWQgdGhpcyBpbjoKCmRpZmYgLS1naXQgYS9tbS9tbXVfbm90aWZpZXIuYyBiL21tL21tdV9ub3Rp
Zmllci5jCmluZGV4IGIzYTA2NGIzYjMxODA3Li4zMGFiYmZkYzI1YmU1NSAxMDA2NDQKLS0tIGEv
bW0vbW11X25vdGlmaWVyLmMKKysrIGIvbW0vbW11X25vdGlmaWVyLmMKQEAgLTEyOSw3ICsxMjks
NiBAQCBzdGF0aWMgdm9pZCBtbl9pdHJlZV9pbnZfZW5kKHN0cnVjdCBtbXVfbm90aWZpZXJfbW0g
Km1tbl9tbSkKIHsKIAlzdHJ1Y3QgbW11X2ludGVydmFsX25vdGlmaWVyICptbmk7CiAJc3RydWN0
IGhsaXN0X25vZGUgKm5leHQ7Ci0JYm9vbCBuZWVkX3dha2UgPSBmYWxzZTsKIAogCXNwaW5fbG9j
aygmbW1uX21tLT5sb2NrKTsKIAlpZiAoLS1tbW5fbW0tPmFjdGl2ZV9pbnZhbGlkYXRlX3Jhbmdl
cyB8fApAQCAtMTQwLDcgKzEzOSw2IEBAIHN0YXRpYyB2b2lkIG1uX2l0cmVlX2ludl9lbmQoc3Ry
dWN0IG1tdV9ub3RpZmllcl9tbSAqbW1uX21tKQogCiAJLyogTWFrZSBpbnZhbGlkYXRlX3NlcSBl
dmVuICovCiAJbW1uX21tLT5pbnZhbGlkYXRlX3NlcSsrOwotCW5lZWRfd2FrZSA9IHRydWU7CiAK
IAkvKgogCSAqIFRoZSBpbnZfZW5kIGluY29ycG9yYXRlcyBhIGRlZmVycmVkIG1lY2hhbmlzbSBs
aWtlIHJ0bmxfdW5sb2NrKCkuCkBAIC0xNjAsOCArMTU4LDcgQEAgc3RhdGljIHZvaWQgbW5faXRy
ZWVfaW52X2VuZChzdHJ1Y3QgbW11X25vdGlmaWVyX21tICptbW5fbW0pCiAJfQogCXNwaW5fdW5s
b2NrKCZtbW5fbW0tPmxvY2spOwogCi0JaWYgKG5lZWRfd2FrZSkKLQkJd2FrZV91cF9hbGwoJm1t
bl9tbS0+d3EpOworCXdha2VfdXBfYWxsKCZtbW5fbW0tPndxKTsKIH0KIAogLyoqCkBAIC04ODQs
NyArODgxLDcgQEAgc3RhdGljIGludCBfX21tdV9pbnRlcnZhbF9ub3RpZmllcl9pbnNlcnQoCiAJ
ICogcG9zc2liaWxpdHkgZm9yIGxpdmUgbG9jaywgaW5zdGVhZCBkZWZlciB0aGUgYWRkIHRvCiAJ
ICogbW5faXRyZWVfaW52X2VuZCgpIHNvIHRoaXMgYWxnb3JpdGhtIGlzIGRldGVybWluaXN0aWMu
CiAJICoKLQkgKiBJbiBhbGwgY2FzZXMgdGhlIHZhbHVlIGZvciB0aGUgbW5pLT5tcl9pbnZhbGlk
YXRlX3NlcSBzaG91bGQgYmUKKwkgKiBJbiBhbGwgY2FzZXMgdGhlIHZhbHVlIGZvciB0aGUgbW5p
LT5pbnZhbGlkYXRlX3NlcSBzaG91bGQgYmUKIAkgKiBvZGQsIHNlZSBtbXVfaW50ZXJ2YWxfcmVh
ZF9iZWdpbigpCiAJICovCiAJc3Bpbl9sb2NrKCZtbW5fbW0tPmxvY2spOwoKSmFzb24KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
