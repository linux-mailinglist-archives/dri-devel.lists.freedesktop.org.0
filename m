Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BAB5DE7B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 09:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43A76E0E2;
	Wed,  3 Jul 2019 07:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70051.outbound.protection.outlook.com [40.107.7.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941BC89A8B;
 Tue,  2 Jul 2019 19:53:26 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB3407.eurprd05.prod.outlook.com (10.170.238.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 19:53:23 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 19:53:23 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Ralph Campbell <rcampbell@nvidia.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC] mm/hmm: pass mmu_notifier_range to
 sync_cpu_device_pagetables
Thread-Topic: [RFC] mm/hmm: pass mmu_notifier_range to
 sync_cpu_device_pagetables
Thread-Index: AQHVHY87cnj6rYaF00uB6DOqwK5J5aa35HaA
Date: Tue, 2 Jul 2019 19:53:23 +0000
Message-ID: <20190702195317.GT31718@mellanox.com>
References: <20190608001452.7922-1-rcampbell@nvidia.com>
In-Reply-To: <20190608001452.7922-1-rcampbell@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQBPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::21) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91a8010a-9074-49f6-5f3f-08d6ff26f0c7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB3407; 
x-ms-traffictypediagnostic: VI1PR05MB3407:
x-microsoft-antispam-prvs: <VI1PR05MB3407FA9099031BFAF148D2AACFF80@VI1PR05MB3407.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(199004)(189003)(5660300002)(64756008)(99286004)(186003)(4326008)(14444005)(6116002)(446003)(486006)(3846002)(11346002)(256004)(2616005)(476003)(66556008)(66446008)(66066001)(66946007)(86362001)(478600001)(73956011)(66476007)(25786009)(33656002)(81166006)(81156014)(8676002)(71200400001)(36756003)(316002)(8936002)(68736007)(1076003)(14454004)(76176011)(2906002)(6486002)(7416002)(4744005)(102836004)(6506007)(229853002)(386003)(6246003)(6512007)(6436002)(305945005)(7736002)(71190400001)(53936002)(26005)(54906003)(110136005)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3407;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zBxzoHUx6jbzlZVkFi+e9m2ovvrNdaF57cJAmrQAUvgjIc6VJWidnpqjL4pG/tkQmzUsCr7Mq9zVT7UzNR3O2N6Nv3Yf/MjW7a8oJzadNJSd4AUiEHBtZblxxiz5C/sRvynk8tL8tF1ZsHnezKa/o5OlHLwVbKgTMd7q39KsEwv4ydwePbs9Y8eKhKkFEy9N8YSK5zOzEYuQ3WPQwt90wpHla8W8GVTj49LdyWlW5e5GCY25ZluCcCc8SgyivlZOwZBnf8sVRvyEWcEgiEAgpf2EWgFtDcmcZFb9DTMRqowHqVXg6D5JHn9S7KkpJJC9YoL0SDrfVxhT4n8w3YnRqkOLzq4t90pVh07KsDZm0QPQV6v+/qm3NtjE3lcMLAsAm5TiWNJVSJXEL1Q/bsj04Xqw5jdAWprPdD2oBSedE+E=
Content-ID: <9EEF795A80FA1D4D8BB871FDEA45923F@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a8010a-9074-49f6-5f3f-08d6ff26f0c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 19:53:23.5960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3407
X-Mailman-Approved-At: Wed, 03 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ux79kayW2/oD3UIytvFEMfepSZQDjLhXcIU5Az4AZnY=;
 b=TzITFv+4DyhvRhIxaLQQBj41KHoDH5qvHNYfiLEhRPXbOsbprQQ4S62EFM+WOzO4Ty2BHdG2weYdRAMWeNzIdjud2VGBYREm2sDpStENTFwTmDcEJS8fTFsNf4Tgt7XVX1aKfj6z7thdXDGP/zqmlDm5A8gAIgPWFw3AVWI8+LM=
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
bnkgb2YgdGhlIEhNTSBBUElzCj4gYW5kIEkgdGhpbmsgaXQgd2lsbCBiZSB1c2VmdWwuCgpUaGlz
IG1ha2Ugc28gbXVjaCBzZW5zZSwgSSdkIGxpa2UgdG8gYXBwbHkgdGhpcyBpbiBobW0uZ2l0LCBp
cyB0aGVyZQphbnkgb2JqZWN0aW9uPwoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
