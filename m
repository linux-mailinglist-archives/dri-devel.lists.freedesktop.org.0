Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 741DC85BD8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2786E7A3;
	Thu,  8 Aug 2019 07:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10072.outbound.protection.outlook.com [40.107.1.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0E76E749;
 Wed,  7 Aug 2019 17:18:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M38IFZTtLXhblLeUKSTOOyY+BzP5VWo2NxFpFzFwsSqL+5D1WSw3A42cJnXH5TiCRayVqKFZ/Bfc22qbGvGxoRHxL/6ToaI+ZJeNohrGahSVStM0Xm7+8MhermUY7N3a9g9IJwASLTMEEpfjx2cUrkuGPiqkoH1n8ubVfqjURQ3lvfOMI8jTiZb4ftvJ4zSCiXGJolt2MkOQmUvueKUHQZn56LyqVsIFD397xBtsYISJaPQhroaJcCgwGGP78QXI/RnxF43yCljkSpEy9cvyT4qWPMBWQyCIsLTa4c9RSy6gpyQGFhVmWxTyNoQXk+VJgCLqksZftFbNthMbkGdOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4huSkCeVNugOTHQQcM6pySCS6vXgZT5Dzc2lhNeyww=;
 b=l2mAxgVVWXYxtwncWCfB/L6SZSZ7k8JfjYlANp+YoptrbzgWe7lXBk3vOq2bo+2KV0UA1j+JEqdnP8DF6qcI3bfteRGLxIbA2P6aH6x8d9IlK7MtMyoLNcCAvih/CXKs2qLpP9H/sVa1Ek/3h5ML6Ga+hYPYG9JQMKI1CcRhDwWh8tLamShUlyMQyhNBt2cXTg2hWjB5mszT8w3g5jSwXGe6XY76nbwe7tIuUYrTGBEwyf+cbF6E80kVdvYgC+oYuJgQl2+OZhnXi/QYulSd5+btBX1tTn/C4Dprf8m9w5rL0wz2VtatfuLBVwh6OhotsqLhcH5WHT8I5Puv2qYWYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4671.eurprd05.prod.outlook.com (20.176.3.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.20; Wed, 7 Aug 2019 17:18:01 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 17:18:01 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 09/15] mm: don't abuse pte_index() in hmm_vma_handle_pmd
Thread-Topic: [PATCH 09/15] mm: don't abuse pte_index() in hmm_vma_handle_pmd
Thread-Index: AQHVTHDjVWJoFh6NnUauF/brrPZnVqbv7ziA
Date: Wed, 7 Aug 2019 17:18:01 +0000
Message-ID: <20190807171755.GI1571@mellanox.com>
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-10-hch@lst.de>
In-Reply-To: <20190806160554.14046-10-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::21) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c56f4fe-05c7-40ef-c6c0-08d71b5b333e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB4671; 
x-ms-traffictypediagnostic: VI1PR05MB4671:
x-microsoft-antispam-prvs: <VI1PR05MB4671C8FA48DC93F50C99C2F0CFD40@VI1PR05MB4671.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(199004)(189003)(6246003)(53936002)(33656002)(6436002)(6486002)(6512007)(6116002)(68736007)(54906003)(3846002)(2906002)(66066001)(316002)(36756003)(71190400001)(476003)(2616005)(11346002)(186003)(446003)(14444005)(26005)(102836004)(99286004)(66476007)(64756008)(7416002)(66556008)(71200400001)(256004)(305945005)(25786009)(5660300002)(6506007)(386003)(66446008)(8936002)(86362001)(52116002)(6916009)(14454004)(229853002)(8676002)(1076003)(4326008)(81166006)(478600001)(66946007)(4744005)(81156014)(7736002)(486006)(76176011)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4671;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Y5w2T4TwDEqVW/A/CS5dCgeAwrt8PXGrtm3uRFpMUQxqZmB+oFSvM857UGs06YXyJV1Opb+rNLObiLz2oz48V4ILUx67rdmHAh7jF9WQQzStmE67vdRyKeC91312yvdFPK7QrHPS85XneYw91kz3ArXf1ktjAmP89EfXUOBwPwZqXtC7Fdjq0yEOLfPNTWFGHNLdu75ZvrIXN7EBCXOGkhQu2YfcH8n2FwrK+CPdGvCNhQks2gVxXRrAS3cmhtCGwx08yK1pH2H10rwUWRzDCMPrm/Poynzo+p2AZ2rCAvNZNJ2NG+dOEr4V8O+SHkCh4/PhIg8HO6L5wlXFF9hi2FgYbN3CmNN3WBTa441cdg9OlCfmlA3XrqA+o/NyPwFbtLjRnPXzSBHRt8a9bBek4Qa+hk0mLXMyGBqeA2rLTOk=
Content-ID: <C7103DD7868C384CA830F3D0DA65CF22@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c56f4fe-05c7-40ef-c6c0-08d71b5b333e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 17:18:01.4239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4671
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4huSkCeVNugOTHQQcM6pySCS6vXgZT5Dzc2lhNeyww=;
 b=ig7/cLvzVZOMNO+zztVocw6DLqmOk29OTrf6rZ2X7ZKua0vsUnomtAQRo1svdHUv8s6uISaDHFY6LgbVHR9qvRnEBfoTMG6ejM7vHHuDzwlgxXs11O7tahRu6YxbjLTCLxpo+owGhyodk0CKMpYfvCrdMxraPNNXMyub0L++Bg0=
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDc6MDU6NDdQTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gcHRlX2luZGV4IGlzIGFuIGludGVybmFsIGFyY2ggaGVscGVyIGluIHZhcmlv
dXMgYXJjaGl0ZWN0dXJlcywKPiB3aXRob3V0IGNvbnNpc3RlbnQgc2VtYW50aWNzLiAgT3BlbiBj
b2RlIHRoYXQgY2FsY3VsYXRpb24gb2YgYSBQTUQKPiBpbmRleCBiYXNlZCBvbiB0aGUgdmlydHVh
bCBhZGRyZXNzIGluc3RlYWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcg
PGhjaEBsc3QuZGU+Cj4gLS0tCj4gIG1tL2htbS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKClRoZXJlIHN1cmUgYXJlIGEgbG90IG9mIGRp
ZmZlcmVudCB3YXlzIHRvIGV4cHJlc3MgdGhpcywgYnV0IHRoaXMgb25lCmxvb2tzIE9LIHRvIG1l
LCBhdCBsZWFzdCB0aGUgc3dpdGNoIGZyb20gdGhlIFBUUlNfUEVSX1BURSBleHByZXNzaW9uCmlu
IHRoZSB4ODYgaW1scGVtZW50YXRpb24gdG8gUE1EX01BU0sgbG9va3MgZXF1aXZhbGVudAogClJl
dmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+CgpKYXNvbgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
