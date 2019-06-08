Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023F53A59E
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F97892F8;
	Sun,  9 Jun 2019 12:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3F2891B3;
 Sat,  8 Jun 2019 11:50:22 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4640.eurprd05.prod.outlook.com (20.176.3.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Sat, 8 Jun 2019 11:50:16 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1%6]) with mapi id 15.20.1965.017; Sat, 8 Jun 2019
 11:50:16 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [RFC] mm/hmm: pass mmu_notifier_range to
 sync_cpu_device_pagetables
Thread-Topic: [RFC] mm/hmm: pass mmu_notifier_range to
 sync_cpu_device_pagetables
Thread-Index: AQHVHY87cnj6rYaF00uB6DOqwK5J5aaRpYiA
Date: Sat, 8 Jun 2019 11:50:16 +0000
Message-ID: <20190608115011.GB14873@mellanox.com>
References: <20190608001452.7922-1-rcampbell@nvidia.com>
In-Reply-To: <20190608001452.7922-1-rcampbell@nvidia.com>
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
x-ms-office365-filtering-correlation-id: edc48025-f763-4577-de12-08d6ec07794d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB4640; 
x-ms-traffictypediagnostic: VI1PR05MB4640:
x-microsoft-antispam-prvs: <VI1PR05MB4640E6E5C556BD7AC7C67023CF110@VI1PR05MB4640.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0062BDD52C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(346002)(396003)(136003)(39850400004)(189003)(199004)(54906003)(8936002)(14444005)(256004)(4326008)(81166006)(33656002)(81156014)(8676002)(66476007)(66556008)(64756008)(66446008)(66946007)(14454004)(53936002)(478600001)(73956011)(68736007)(71190400001)(71200400001)(305945005)(1076003)(5660300002)(7736002)(6246003)(6916009)(6486002)(26005)(102836004)(86362001)(6506007)(486006)(386003)(6436002)(476003)(66066001)(2906002)(76176011)(6116002)(316002)(36756003)(446003)(3846002)(2616005)(186003)(99286004)(25786009)(6512007)(11346002)(52116002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4640;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +VwPesywDgHRN0jdIeuczqBIXBOd/OVuRFCqrqEpoCSMFT+51CERrYGw/Z9+8904LsVFQ8qZXMju0Ks+gcnYjDu6YtXebt8hfL44RSKkP/BZvaFUxq2E2EhHz5pVmYjk4SSGNhBEXw+cJJa6N9C9hLYmlgTsPN7outySzS3RvouRPaB1H3XhV5Z6ssO3Cqx+ips+EVtP+ha86ldjHbpVojFMWlelATanBNEN40qPWivu34aCYmgHNbH141IlOciv5Z78ek6HIABubWiNN618yhnb5rbcK4BtT+KXak7+l6ogfjLCWWoVanrU8UHa6n9sG0XLqN/R0ZdYIULjZv55qJ7ShLucOn73fqSb0ZqBJr8ZCB2c4ZHbHp+whIDa7TTolGX0CJ0UjZIqmf138994PeTmJOUR8hYzB08wkmvSJSk=
Content-ID: <FFF05C274A0A8E44B62AD3BAF4C55A80@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edc48025-f763-4577-de12-08d6ec07794d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2019 11:50:16.6934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4640
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FIZowsz6D/XhCq6y6QUaZfZqiox1Wi8qIhgTH/IWz8=;
 b=qo1Xa4SbtqdIDnb8uGBzY0sK3lMcd8McYgqlAZyQLVmp3wEaURKAxgatSJ3ScriFrwwV1WxLdUaoHMN8BJ/NaHGi+VTTWxrfW99yyNc6H0zh94KTVnqo9cvQ4Jp6JK8vNc3OIskl5hx5cFrz/Kd0zwZ0qfW33j1bo2fNvByFL4o=
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

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDU6MTQ6NTJQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gSE1NIGRlZmluZXMgaXRzIG93biBzdHJ1Y3QgaG1tX3VwZGF0ZSB3aGljaCBpcyBw
YXNzZWQgdG8gdGhlCj4gc3luY19jcHVfZGV2aWNlX3BhZ2V0YWJsZXMoKSBjYWxsYmFjayBmdW5j
dGlvbi4gVGhpcyBpcwo+IHN1ZmZpY2llbnQgd2hlbiB0aGUgb25seSBhY3Rpb24gaXMgdG8gaW52
YWxpZGF0ZS4gSG93ZXZlciwKPiBhIGRldmljZSBtYXkgd2FudCB0byBrbm93IHRoZSByZWFzb24g
Zm9yIHRoZSBpbnZhbGlkYXRpb24gYW5kCj4gYmUgYWJsZSB0byBzZWUgdGhlIG5ldyBwZXJtaXNz
aW9ucyBvbiBhIHJhbmdlLCB1cGRhdGUgZGV2aWNlIGFjY2Vzcwo+IHJpZ2h0cyBvciByYW5nZSBz
dGF0aXN0aWNzLiBTaW5jZSBzeW5jX2NwdV9kZXZpY2VfcGFnZXRhYmxlcygpCj4gY2FuIGJlIGNh
bGxlZCBmcm9tIHRyeV90b191bm1hcCgpLCB0aGUgbW1hcF9zZW0gbWF5IG5vdCBiZSBoZWxkCj4g
YW5kIGZpbmRfdm1hKCkgaXMgbm90IHNhZmUgdG8gYmUgY2FsbGVkLgo+IFBhc3MgdGhlIHN0cnVj
dCBtbXVfbm90aWZpZXJfcmFuZ2UgdG8gc3luY19jcHVfZGV2aWNlX3BhZ2V0YWJsZXMoKQo+IHRv
IGFsbG93IHRoZSBmdWxsIGludmFsaWRhdGlvbiBpbmZvcm1hdGlvbiB0byBiZSB1c2VkLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KPiAt
LS0KPiAKPiBJJ20gc2VuZGluZyB0aGlzIG91dCBub3cgc2luY2Ugd2UgYXJlIHVwZGF0aW5nIG1h
bnkgb2YgdGhlIEhNTSBBUElzCj4gYW5kIEkgdGhpbmsgaXQgd2lsbCBiZSB1c2VmdWwuCgpJIGFn
cmVlIHdpdGggQ0ggdGhhdCBzdHJ1Y3QgaG1tX3VwZGF0ZSBzZWVtcyBwYXJ0aWN1bGFybHkgcG9p
bnRsZXNzCmFuZCB3ZSByZWFsbHkgc2hvdWxkIGp1c3QgdXNlIG1tdV9ub3RpZmllcl9yYW5nZSBk
aXJlY3RseS4KCldlIG5lZWQgdG8gZmluZCBvdXQgZnJvbSB0aGUgRFJNIGZvbGtzIGlmIHdlIGNh
biBtZXJnZSB0aGlzIGtpbmQgb2YKc3R1ZmYgdGhyb3VnaCBobW0uZ2l0IGFuZCB0aGVuIHJlc29s
dmUgYW55IGNvbmZsaWN0cyB0aGF0IG1pZ2h0IGFyaXNlCmluIERSTSB0cmVlIG9yIGluIG5vdXZl
YXUgdHJlZT8KCkJ1dCBJIHdvdWxkIGxpa2UgdG8gc2VlIHRoaXMgcGF0Y2ggZ28gaW4gdGhpcyBj
eWNsZSwgdGhhbmtzCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
