Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1135F3A5C1
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFBD8931E;
	Sun,  9 Jun 2019 12:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A57890E9;
 Sat,  8 Jun 2019 11:41:43 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5007.eurprd05.prod.outlook.com (20.177.52.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Sat, 8 Jun 2019 11:41:39 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1%6]) with mapi id 15.20.1965.017; Sat, 8 Jun 2019
 11:41:39 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [RFC] mm/hmm: pass mmu_notifier_range to
 sync_cpu_device_pagetables
Thread-Topic: [RFC] mm/hmm: pass mmu_notifier_range to
 sync_cpu_device_pagetables
Thread-Index: AQHVHY87cnj6rYaF00uB6DOqwK5J5aaReNEAgAAqToA=
Date: Sat, 8 Jun 2019 11:41:39 +0000
Message-ID: <20190608114133.GA14873@mellanox.com>
References: <20190608001452.7922-1-rcampbell@nvidia.com>
 <20190608091008.GC32185@infradead.org>
In-Reply-To: <20190608091008.GC32185@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::38) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d05033d-46b3-43bb-b701-08d6ec064493
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5007; 
x-ms-traffictypediagnostic: VI1PR05MB5007:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR05MB5007B0248BAF930F089C6908CF110@VI1PR05MB5007.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0062BDD52C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39850400004)(396003)(376002)(366004)(136003)(189003)(199004)(53936002)(66946007)(316002)(66476007)(66556008)(26005)(64756008)(73956011)(6246003)(4326008)(186003)(2906002)(81166006)(25786009)(66066001)(8676002)(66446008)(81156014)(54906003)(86362001)(229853002)(8936002)(14454004)(1076003)(478600001)(966005)(6116002)(7416002)(3846002)(102836004)(6916009)(476003)(76176011)(6512007)(99286004)(14444005)(5660300002)(6486002)(68736007)(256004)(6306002)(52116002)(386003)(6506007)(71200400001)(71190400001)(33656002)(486006)(7736002)(305945005)(446003)(6436002)(2616005)(36756003)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5007;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oo6gBf4xnKbnuLgjj+3gOZyAmqrCSoudzh6QQhuIXOxJwXWerg0BwM3MLb/FmZYDen+hzwRsqXde1gz4fbbE9MW5380nn2C8DdViZojxawz4Qs8tSrHS3VW+PGvkJTVaEEONDTOpuFk9g0mo1L7bQkFeDoIeHRQAn3UZ0q2MbKGOGdKF5SvsSGkUZMCav8dOCInP11RZ4x8vitV8NHglioRn4obmW+sy8Ld2EkNHVSLf1VafoSEUdnLfF5l5b5FVg3eZkXFZnKQNd/b5923jHl8DsAqp9fCZPu7Tg5TyoJcFlxiGH/efr/HKr1BEgoRVQHXcT5c3FpSTL7g2whImTeICvXhibJ8ErhDkV/XFDIkXGhaj9GGr7onZNYFuvp5E4DG7d5BKOL2DdiC/FFJ67XyHKWENSAjyCXKKNHQboiA=
Content-ID: <EECCBA142F666248ACACC3016329ACD8@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d05033d-46b3-43bb-b701-08d6ec064493
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2019 11:41:39.2878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5007
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dm5t7RwyC8mbdoq110urMkfCMJmGmRbbuzagndSbNrE=;
 b=kAuQwdJx1jmLjEj4PWsyTzdyj3xbNHpqiYq8uVn1CwPaInYlsDlDgcvLGEwEZRbNZwmu41CzRD1PfVE4QNeUN0S0O27Bu8ChRWZpGt8rl1V+NGmb0cyGRSx4+c31pooCcjxJRQMWiK49ruQDQvmDxu/8pp7KGU05D5gPyiUwaMk=
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

T24gU2F0LCBKdW4gMDgsIDIwMTkgYXQgMDI6MTA6MDhBTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDU6MTQ6NTJQTSAtMDcwMCwgUmFs
cGggQ2FtcGJlbGwgd3JvdGU6Cj4gPiBITU0gZGVmaW5lcyBpdHMgb3duIHN0cnVjdCBobW1fdXBk
YXRlIHdoaWNoIGlzIHBhc3NlZCB0byB0aGUKPiA+IHN5bmNfY3B1X2RldmljZV9wYWdldGFibGVz
KCkgY2FsbGJhY2sgZnVuY3Rpb24uIFRoaXMgaXMKPiA+IHN1ZmZpY2llbnQgd2hlbiB0aGUgb25s
eSBhY3Rpb24gaXMgdG8gaW52YWxpZGF0ZS4gSG93ZXZlciwKPiA+IGEgZGV2aWNlIG1heSB3YW50
IHRvIGtub3cgdGhlIHJlYXNvbiBmb3IgdGhlIGludmFsaWRhdGlvbiBhbmQKPiA+IGJlIGFibGUg
dG8gc2VlIHRoZSBuZXcgcGVybWlzc2lvbnMgb24gYSByYW5nZSwgdXBkYXRlIGRldmljZSBhY2Nl
c3MKPiA+IHJpZ2h0cyBvciByYW5nZSBzdGF0aXN0aWNzLiBTaW5jZSBzeW5jX2NwdV9kZXZpY2Vf
cGFnZXRhYmxlcygpCj4gPiBjYW4gYmUgY2FsbGVkIGZyb20gdHJ5X3RvX3VubWFwKCksIHRoZSBt
bWFwX3NlbSBtYXkgbm90IGJlIGhlbGQKPiA+IGFuZCBmaW5kX3ZtYSgpIGlzIG5vdCBzYWZlIHRv
IGJlIGNhbGxlZC4KPiA+IFBhc3MgdGhlIHN0cnVjdCBtbXVfbm90aWZpZXJfcmFuZ2UgdG8gc3lu
Y19jcHVfZGV2aWNlX3BhZ2V0YWJsZXMoKQo+ID4gdG8gYWxsb3cgdGhlIGZ1bGwgaW52YWxpZGF0
aW9uIGluZm9ybWF0aW9uIHRvIGJlIHVzZWQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFJhbHBo
IENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KPiA+IAo+ID4gSSdtIHNlbmRpbmcgdGhp
cyBvdXQgbm93IHNpbmNlIHdlIGFyZSB1cGRhdGluZyBtYW55IG9mIHRoZSBITU0gQVBJcwo+ID4g
YW5kIEkgdGhpbmsgaXQgd2lsbCBiZSB1c2VmdWwuCj4gCj4gVGhpcyBpcyB0aGUgcmlnaHQgdGhp
bmcgdG8gZG8uICBCdXQgdGhlIHJlYWxseSByaWdodCB0aGluZyBpcyB0byBqdXN0Cj4ga2lsbCB0
aGUgaG1tX21pcnJvciBBUEkgZW50aXJlbHkgYW5kIG1vdmUgdG8gbW11X25vdGlmaWVycy4gIEF0
IGxlYXN0Cj4gZm9yIG5vdmVhdSB0aGlzIGFscmVhZHkgaXMgd2F5IHNpbXBsZXIsIGFsdGhvdWdo
IHJpZ2h0IG5vdyBpdCBkZWZlYXRzCj4gSmFzb25zIHBhdGNoIHRvIGF2b2lkIGFsbG9jYXRpbmcg
dGhlIHN0cnVjdCBobW0gaW4gdGhlIGZhdWx0IHBhdGguCj4gQnV0IGFzIHNhaWQgYmVmb3JlIHRo
YXQgY2FuIGJlIGF2b2lkZWQgYnkganVzdCBraWxsaW5nIHN0cnVjdCBobW0sCj4gd2hpY2ggZm9y
IG1hbnkgcmVhc29ucyBpcyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8gYW55d2F5Lgo+IAo+IEkndmUg
Z290IGEgc2VyaWVzIGhlcmUsIHdoaWNoIGlzIGEgYml0IGJyb2tlbiAoZXBlY2lhbGx5IHRoZSBs
YXN0Cj4gcGF0Y2ggY2FuJ3Qgd29yayBhcy1pcyksIGJ1dCBzaG91bGQgZXhwbGFpbiB3aGVyZSBJ
J20gdHJ5aW5nIHRvIGhlYWQ6Cj4gCj4gaHR0cDovL2dpdC5pbmZyYWRlYWQub3JnL3VzZXJzL2hj
aC9taXNjLmdpdC9zaG9ydGxvZy9yZWZzL2hlYWRzL2htbS1taXJyb3Itc2ltcGxpZmljYXRpb24K
CkF0IGxlYXN0IHRoZSBjdXJyZW50IGhtbSBhcHByb2FjaCBkb2VzIHJlbHkgb24gdGhlIGNvbGxp
c2lvbiByZXRyeQpsb2NraW5nIHNjaGVtZSBpbiBzdHJ1Y3QgaG1tL3N0cnVjdCBobW1fcmFuZ2Ug
Zm9yIHRoZSBwYWdlZmF1bHQgc2lkZQp0byB3b3JrIHJpZ2h0LgoKU28sIGJlZm9yZSB3ZSBjYW4g
YXBwbHkgcGF0Y2ggb25lIGluIHRoaXMgc2VyaWVzIHdlIG5lZWQgdG8gZml4CmhtbV92bWFfZmF1
bHQoKSBhbmQgYWxsIGl0cyB2YXJpZW50cy4gT3RoZXJ3aXNlIHRoZSBkcml2ZXIgd2lsbCBiZQpi
cm9rZW4uCgpJJ20gaG9waW5nIHRvIGZpcnN0IGRlZmluZSB3aGF0IHRoaXMgbG9ja2luZyBzaG91
bGQgYmUgKHNlZSBvdGhlcgplbWFpbHMgdG8gUmFscGgpIHRoZW4sIGlkZWFsbHksIHNlZSBpZiB3
ZSBjYW4gZXh0ZW5kIG1tdSBub3RpZmllcnMgdG8KZ2V0IGl0IGRpcmVjdGx5IHdpdGhvdXRoIGht
bSBzdHVmZi4KClRoZW4gd2UgYXBwbHkgeW91ciBwYXRjaCBvbmUgYW5kIHRoZSBobW0gb3BzIHdy
YXBwZXIgZGllcy4KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
