Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E43895DE84
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 09:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FB36E0E0;
	Wed,  3 Jul 2019 07:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60054.outbound.protection.outlook.com [40.107.6.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FB46E09E;
 Tue,  2 Jul 2019 22:59:19 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6016.eurprd05.prod.outlook.com (20.178.127.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 22:59:16 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 22:59:16 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC] mm/hmm: pass mmu_notifier_range to
 sync_cpu_device_pagetables
Thread-Topic: [RFC] mm/hmm: pass mmu_notifier_range to
 sync_cpu_device_pagetables
Thread-Index: AQHVHY87cnj6rYaF00uB6DOqwK5J5aa35HaAgAAxJwCAAALKgA==
Date: Tue, 2 Jul 2019 22:59:16 +0000
Message-ID: <20190702225911.GA11833@mellanox.com>
References: <20190608001452.7922-1-rcampbell@nvidia.com>
 <20190702195317.GT31718@mellanox.com> <20190702224912.GA24043@lst.de>
In-Reply-To: <20190702224912.GA24043@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:208:c0::44) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57ec13c7-bc4b-47da-4719-08d6ff40e85e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6016; 
x-ms-traffictypediagnostic: VI1PR05MB6016:
x-microsoft-antispam-prvs: <VI1PR05MB601689AD153B34CC5B7C4B6ECFF80@VI1PR05MB6016.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(199004)(189003)(53936002)(102836004)(6512007)(6486002)(8676002)(76176011)(1076003)(99286004)(229853002)(6916009)(3846002)(6436002)(66476007)(52116002)(71190400001)(6246003)(8936002)(186003)(305945005)(6116002)(81156014)(81166006)(54906003)(26005)(386003)(71200400001)(316002)(14454004)(4326008)(6506007)(25786009)(446003)(476003)(7736002)(256004)(66066001)(7416002)(11346002)(36756003)(64756008)(66556008)(2616005)(86362001)(478600001)(4744005)(5660300002)(2906002)(68736007)(66946007)(66446008)(73956011)(486006)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6016;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: u5/HLB79NxZclFWXBUKTF4jOZlEqnhnnMDrMYxfhGbOltKcB4c403SDzQlF5ld9Lyn5NipC2rohko6DbRJt+LP998EA7Mf4CnYzIha6RflauOW4/FR9toJXtvkuX2/NtaAVB9VTNctSSm0tgClZS1msIkQUcjXSTncgJQj4feuWZX79f6YFWYU3IlAN9W0/doChmVt4LvVv2pKefZ7iv+WL08LckM+zN2rY/8SSV3+6SOarO2kpLhr2DgIarnXa5PBpGR5bKw1ghKIn6SaKwWRuVnceqqwmfFLt0tSDcGk0hnzNg6cfk5LsSfFT7CroOErx4eDBgN1UEQEJymrc/uEQdwu6ayrrQQDCI43CSVTTfBK1Cq4hXMdsqYpCZiKxs7ZxhlSrem3L9OwaSvB6fwn6mFATihYOGVNXzcgZ71os=
Content-ID: <C21602A5B8952E41ACC1E76FEF5C90F2@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ec13c7-bc4b-47da-4719-08d6ff40e85e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 22:59:16.4254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6016
X-Mailman-Approved-At: Wed, 03 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJtGx4PkCuRACTU0P1T4Qum92TEAZ9p57W6xppYw/7w=;
 b=gSzqYBaruYiU0Ht5pEVesU0DK3QcMfRsA/MnZRv03tzUFZrUvmh6ZXITLU0c/GQk+erbzTkCUV/xLAT7Sie0kXz89X1vmC/o26yrslY33H+oOJ+qQa9igt+5OTJyRTdA1bBA/YwRktEigR8QwOdMlZR9Bq/8XfJovoiP6MT+cwo=
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMTI6NDk6MTJBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVHVlLCBKdWwgMDIsIDIwMTkgYXQgMDc6NTM6MjNQTSArMDAwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gPiBJJ20gc2VuZGluZyB0aGlzIG91dCBub3cgc2luY2Ug
d2UgYXJlIHVwZGF0aW5nIG1hbnkgb2YgdGhlIEhNTSBBUElzCj4gPiA+IGFuZCBJIHRoaW5rIGl0
IHdpbGwgYmUgdXNlZnVsLgo+ID4gCj4gPiBUaGlzIG1ha2Ugc28gbXVjaCBzZW5zZSwgSSdkIGxp
a2UgdG8gYXBwbHkgdGhpcyBpbiBobW0uZ2l0LCBpcyB0aGVyZQo+ID4gYW55IG9iamVjdGlvbj8K
PiAKPiBBcyB0aGlzIGNyZWF0ZXMgYSBzb21ld2hhdCBoYWlyeSBjb25mbGljdCBmb3IgYW1kZ3B1
LCB3b3VsZG4ndCBpdCBiZQo+IGEgYmV0dGVyIGlkZWEgdG8gd2FpdCBhIGJpdCBhbmQgYXBwbHkg
aXQgZmlyc3QgdGhpbmcgZm9yIG5leHQgbWVyZ2UKPiB3aW5kb3c/CgpNeSB0aGlua2luZyBpcyB0
aGF0IEFNRCBHUFUgYWxyZWFkeSBoYXMgYSBtb25zdGVyIGNvbmZsaWN0IGZyb20gdGhpczoKCiBp
bnQgaG1tX3JhbmdlX3JlZ2lzdGVyKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAotICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAorICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IsCiAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBzdGFydCwKICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGVuZCwK
ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBwYWdlX3NoaWZ0KTsKClNvLCBkZXBlbmRp
bmcgb24gaG93IHRoYXQgaXMgcmVzb2x2ZWQgd2UgbWlnaHQgd2FudCB0byBkbyBib3RoIEFQSQpj
aGFuZ2VzIGF0IG9uY2UuCgpPciB3ZSBtYXkgaGF2ZSB0byByZXZlcnQgdGhlIGFib3ZlIGNoYW5n
ZSBhdCB0aGlzIGxhdGUgZGF0ZS4KCldhaXRpbmcgZm9yIEFNREdQVSB0ZWFtIHRvIGRpc2N1c3Mg
d2hhdCBwcm9jZXNzIHRoZXkgd2FudCB0byB1c2UuCgpKYXNvbgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
