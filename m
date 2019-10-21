Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C29FDF7F8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 00:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F24B6E2A9;
	Mon, 21 Oct 2019 22:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40072.outbound.protection.outlook.com [40.107.4.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F5C8982A;
 Mon, 21 Oct 2019 19:24:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfJ6wjHu7g425Q21cDn+cGxHfT5EuFjueq7gKzD7F2fzaDcW9DuvTl9TtZvE+xKYSwijELzbWzhqHP0dVeMlKzKDfN6hSEaoXthWiAE5MaETddI37Ybj8/EaL/b39O9s9UTM6hQFbE9xdvuHYrQdFhZ4Nx9SZ25NfdiTLLIgNv0JRLootQeRRoUcKVUUGQaknrVpN7xvajt9gFa7zUIoiMErau9TkfgXqQrjmjhcu377+AdyDD0D3Bi+uG5A+fSM/Rp44H7OB2pnREDhI21A9UZrmH+o0hGGcdSG6kuD4NrHe7g1yfA0sM0GAtwoZCTSNnERH7f0hdyV0fCCraF8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dhDTpAku16PKEX8QPygpkn/ME6Oi9YMZPMT/TaQauo=;
 b=GxnqFpLcoEONx91iTtrMK8N5/ltULyD8qscPxeMNv7+zc93YUoCAHzpKiFJZzkdCLxOx+AcJ/4YJQXAryhsqNJJC4yPY0a1uFYE82qJrjOLnC/YpkWYPK6K9SfTyHVpYON54dy/al+1qlTD9U2uYlFXZ9ModD8UDVGdFOlS8bOBH2ZqAh4HzGmUVLnvJrsEduR1R+gxdlJgoqbb+zWMQHzi0NzIrsCyzBwu5G57Zrw+WhRuPHltmjYWWv9GLA8ryYvbMvs+gQxDadzCIlezU+UfmaByRgPJGj4B2ihXFlThZxXYVe37wVBr4jFzfI5CoZ0R2ixZ4A5wAEK/gRallkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com (52.135.129.16) by
 DB7PR05MB5659.eurprd05.prod.outlook.com (20.178.104.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Mon, 21 Oct 2019 19:24:54 +0000
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::18c2:3d9e:4f04:4043]) by DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::18c2:3d9e:4f04:4043%3]) with mapi id 15.20.2347.028; Mon, 21 Oct 2019
 19:24:54 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [PATCH hmm 02/15] mm/mmu_notifier: add an interval tree notifier
Thread-Topic: [PATCH hmm 02/15] mm/mmu_notifier: add an interval tree notifier
Thread-Index: AQHVg4SuHCkuEaFxsk60wlfA7oiQWadldFEAgAAGi4CAAATrgIAAA5cA
Date: Mon, 21 Oct 2019 19:24:53 +0000
Message-ID: <20191021192448.GK6285@mellanox.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <20191015181242.8343-3-jgg@ziepe.ca> <20191021183056.GA3177@redhat.com>
 <20191021185421.GG6285@mellanox.com> <20191021191157.GA5208@redhat.com>
In-Reply-To: <20191021191157.GA5208@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR02CA0049.namprd02.prod.outlook.com
 (2603:10b6:207:3d::26) To DB7PR05MB4138.eurprd05.prod.outlook.com
 (2603:10a6:5:23::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04351a75-d219-4bc1-7c39-08d7565c5966
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DB7PR05MB5659:
x-microsoft-antispam-prvs: <DB7PR05MB5659D6A6BC04F255885F9274CF690@DB7PR05MB5659.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(199004)(189003)(81166006)(3846002)(6116002)(6436002)(5660300002)(52116002)(229853002)(6246003)(256004)(14444005)(1076003)(6916009)(6486002)(99286004)(4326008)(86362001)(25786009)(6512007)(8676002)(8936002)(81156014)(7416002)(2616005)(7736002)(36756003)(305945005)(66066001)(54906003)(11346002)(386003)(71190400001)(316002)(71200400001)(14454004)(66946007)(66476007)(66556008)(64756008)(66446008)(33656002)(486006)(476003)(102836004)(26005)(2906002)(76176011)(478600001)(446003)(186003)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR05MB5659;
 H:DB7PR05MB4138.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uaW6dNXYv7f3Ty85RklRU7AQ9DISFCeTPUPObjm/eHP0KgJ9Wnx5A1Xir48dKXFwUS1rpcUMnUwf7IbAW0h1veKC7PvTf6TKFk1NUB+ctqzyQyqiviARQYhK73CGvjNnLrPb9OM8bzAfLvZ30osqKLlBvKNrjYWEqV5+rsU/Yd9saZkad70JWmq5m2CPkABL5/UJqqYd29y/m2GYOtvYuxc9xIryL4aDrvBvKr2tTtm8kNxUgSl8UGuaqzVwP3hoJxNaOrVGH/96MxQ9fEekO/YyglfwERt14UDx0iXFzPr6WrBnMiQszjNKFhvVYSBcGASexBAauvJeTGinow6SsqYmg8JzNtt7zspSXc5Qj7hbrZqXcPT8hv3b34HWa8JucVcjUJrvy0wUVc9r7kM4pdtdXhYDYVTtsjQCSvb2eNeqnGQ5dSelX/9AOadV3jGB
x-ms-exchange-transport-forked: True
Content-ID: <0EDBBF2131C9044CB11AA3ED64A52B60@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04351a75-d219-4bc1-7c39-08d7565c5966
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 19:24:54.0488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sb3rhz5F375UQWwYODHTQPl9MFhe8HNVlx/hkgyRSMie0HtCOIpI0qlukbcHGu3V4ud7QdBEoTn05ZSsKuuFrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR05MB5659
X-Mailman-Approved-At: Mon, 21 Oct 2019 22:23:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dhDTpAku16PKEX8QPygpkn/ME6Oi9YMZPMT/TaQauo=;
 b=gOHsp8Bw9gJpeplQWvLjcTwn11zwNNxnNNrfnnbbHmcDUbenZoid3kK0nyaCfucFf4Y6JvwOjOvi9QqnAP1bx4vEKuKnWJzoChKTWibUJUiot8VHF+pt3pp9c18E4uGZeqgJFEbWryKpSRZTN+7cJ5qFyxmTwShZVa3tjaOFuR8=
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
 Michal Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDM6MTE6NTdQTSAtMDQwMCwgSmVyb21lIEdsaXNzZSB3
cm90ZToKPiA+IFNpbmNlIHRoYXQgcmVhZGVyIGlzIG5vdCBsb2NrZWQgd2UgbmVlZCByZWxlYXNl
IHNlbWFudGljcyBoZXJlIHRvCj4gPiBlbnN1cmUgdGhlIHVubG9ja2VkIHJlYWRlciBzZWVzIGEg
ZnVsbHkgaW5pdGluYWxpemVkIG1tdV9ub3RpZmllcl9tbQo+ID4gc3RydWN0dXJlIHdoZW4gaXQg
b2JzZXJ2ZXMgdGhlIHBvaW50ZXIuCj4gCj4gSSB0aG91Z2h0IHRoZSBtbV90YWtlX2FsbF9sb2Nr
cygpIHdvdWxkIGhhdmUgaGFkIGEgYmFycmllciBhbmQgdGh1cwo+IHRoYXQgeW91IGNvdWxkIG5v
dCBzZWUgbW11X25vdGlmaWVyIHN0cnVjdCBwYXJ0aWFseSBpbml0aWFsaXplZC4gCgpOb3Qgc3Vy
ZSwgdXN1YWxseSBhIGxvY2sgYWNxdWlyZSBkb2Vzbid0IGhhdmUgYSBzdG9yZSBiYXJyaWVyPwoK
RXZlbiBpZiBpdCBkaWQsIHdlIHdvdWxkIHN0aWxsIG5lZWQgc29tZSBwYWlyaW5nIHJlYWQgYmFy
cmllci4uCgo+IGhhdmluZyB0aGUgYWNxdWlyZS9yZWxlYXNlIGFzIHNhZmV0eSBuZXQgZG9lcyBu
b3QgaHVydC4gTWF5YmUgYWRkIGEKPiBjb21tZW50IGFib3V0IHRoZSBzdHJ1Y3QgaW5pdGlhbGl6
YXRpb24gbmVlZGluZyB0byBiZSB2aXNpYmxlIGJlZm9yZQo+IHBvaW50ZXIgaXMgc2V0LgoKSXMg
dGhpcyBjbGVhcj8KCiAgICAgICAgICogcmVsZWFzZSBzZW1hbnRpY3Mgb24gdGhlIGluaXRpYWxp
emF0aW9uIG9mIHRoZQogICAgICAgICAqIG1tdV9ub3RpZmllcl9tbSdzIGNvbnRlbnRzIGFyZSBw
cm92aWRlZCBmb3IgdW5sb2NrZWQgcmVhZGVycy4KCSAqIGFjcXVpcmUgY2FuIG9ubHkgYmUgdXNl
ZCB3aGlsZSBob2xkaW5nIHRoZQogICAgICAgICAqIG1tZ3JhYiBvciBtbWdldCwgYW5kIGlzIHNh
ZmUgYmVjYXVzZSBvbmNlIGNyZWF0ZWQgdGhlCiAgICAgICAgICogbW11X25vdGlmaWZlcl9tbSBp
cyBub3QgZnJlZWQgdW50aWwgdGhlIG1tIGlzIGRlc3Ryb3llZC4KICAgICAgICAgKiBVc2VycyBo
b2xkaW5nIHRoZSBtbWFwX3NlbSBvciBvbmUgb2YgdGhlCgkgKiBtbV90YWtlX2FsbF9sb2Nrcygp
IGRvIG5vdCBuZWVkIHRvIHVzZSBhY3F1aXJlIHNlbWFudGljcy4KCkl0IGFsc28gaGVscHMgZXhw
bGFpbiB3aHkgdGhlcmUgaXMgbm8gbG9ja2luZyBhcm91bmQgdGhlIG90aGVyCnJlYWRlcnMsIHdo
aWNoIGhhcyBwdXp6bGVkIG1lIGluIHRoZSBwYXN0IGF0IGxlYXN0LgoKSmFzb24KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
