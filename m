Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E10FA7BA40
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D4989BAC;
	Wed, 31 Jul 2019 07:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20076.outbound.protection.outlook.com [40.107.2.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6156E5F2;
 Tue, 30 Jul 2019 18:02:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bl1mA3uNlHUpUnbzapeKpVbJRP6c0LbopMs+4/LNg/cQaGnZSbsIuiVirs/W1AJ2DKVJ/UX0H/LgE5mwJ7JsLUwTKKtxAArBmtqHYcENZaZTTucFqqlVuhztZYwqSBEGw21s6CC4QDs+q9Q27eYQAB/ZkNYK1yC4BEZ1+NAi1hNkSmE5kbSojOBjSKBlC7cXP2mLAfQWjlyIm4iaaMhNxtkVOVdqm/dcFe02a8r6i3Qj8rM55AJECeaEpXJRNy5B/69VuQJGYF0bvA5phdUQhAg9IH9UJZ4FBlXwYLRcewjsv+DgseaPWikhAU12phRxvNyVwLlygNyNihW4JBXuQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86td7gtxGwZHmqL38iFkr/3U2gj63shWGOAF/jyySUo=;
 b=T+jE+pPAcfIcjapesIXfNnu7jS+DUNbdlFMACxxAJ3sJaIxbfUeK8iglM/Vd5a3JEsaEOfMzI9XQp8EnWs7i/zbgiwz/CdLA1b8ZlODiZt7ITiaKO4fgE8xgHtMkvxgL6zmYcEGyDPO/Jd3tN6qhALGOcol9hFxIMji6WorKTi09IgEEBDfih4bXY1cMqDi/3TkH8JY6ZRa73cLzi6b7mwIb51iVL3OH6AI9qh5Y6gX+vbwWWCZB5MUyrNQmgd8ttku/MOMGBFrckC+XIia3HRsXYI56f7jTEQ9N8Z1rH4MaxVvri5wwymZ1GeYXcVb7NijzyEtJJFvMnPRtZNO4Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5728.eurprd05.prod.outlook.com (20.178.121.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 18:02:39 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 18:02:39 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 10/13] mm: only define hmm_vma_walk_pud if needed
Thread-Topic: [PATCH 10/13] mm: only define hmm_vma_walk_pud if needed
Thread-Index: AQHVRpsEkWG1VeUz70SUodCacmdZDabjdLcA
Date: Tue, 30 Jul 2019 18:02:39 +0000
Message-ID: <20190730180234.GP24038@mellanox.com>
References: <20190730055203.28467-1-hch@lst.de>
 <20190730055203.28467-11-hch@lst.de>
In-Reply-To: <20190730055203.28467-11-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::30) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c04c5d1-e0c9-4289-414e-08d715181c0d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5728; 
x-ms-traffictypediagnostic: VI1PR05MB5728:
x-microsoft-antispam-prvs: <VI1PR05MB572854993F992D7C21936E12CFDC0@VI1PR05MB5728.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(199004)(189003)(6116002)(3846002)(68736007)(2616005)(71200400001)(71190400001)(2906002)(11346002)(14454004)(386003)(102836004)(26005)(446003)(486006)(256004)(305945005)(6506007)(5660300002)(476003)(52116002)(186003)(76176011)(7736002)(66066001)(86362001)(81156014)(6916009)(6486002)(6512007)(6436002)(25786009)(4326008)(36756003)(7416002)(4744005)(99286004)(66946007)(478600001)(1076003)(8676002)(81166006)(8936002)(316002)(54906003)(66476007)(33656002)(66446008)(66556008)(64756008)(6246003)(53936002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5728;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: s1DSES32VM7Ml8RL94F6VAbjnUtZT5rVsfLaIGzoWK6+LFQgWrmvb/qMjUyHKUY59AaiMIyaMZpxnhxk5CYTkmI5BVj+Q4w7YRi+siT0EUhxSxaC5Uc7IJstLEl7RjAcafewZkk0UgiP7xXxURjA+oRrEc7BK3AyTotV17AP4AXwttUEmSruM9TszVVISisNUtJWtxmViJvsH14CxISYTLI1SJ4ztl15/78tFNEuB1RkOCk04K3HPJjYAPbFqkGLYdaynmOyjJO6o8ENlcFG45ez+PBVUkMoMrIPnvrODFTMknSolk0xs/biDI6H9IoHa1/6LHr3Rd/xgzktZhhGUAJYyqWTv8S9Gi0mADk2q7uTCGQxE+y8dBu8gdrFZiaWgvVa/+LJph4OjE2uz+XRHlUKzh488NNb7qY2Xrc2SiI=
Content-ID: <8AED26FB1F585E4DA3EAA28F935E5D83@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c04c5d1-e0c9-4289-414e-08d715181c0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 18:02:39.2042 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5728
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86td7gtxGwZHmqL38iFkr/3U2gj63shWGOAF/jyySUo=;
 b=LfStJc7zP4j76ltGCmjEdfWi2RW1U8rIwq3mhldd6hSrXrx4fRo14rR6XcyJzsD1R68lWcsmTputV0Wa+BJefhuKCvMnm7ANnZ3rAJgAA2wpkNujmksGBQCWxHMZ8Gk9DMU6jgYqvAcXzeik2B8rPoCYkGtOAorYqlBskwLckao=
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

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDg6NTI6MDBBTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gV2Ugb25seSBuZWVkIHRoZSBzcGVjaWFsIHB1ZF9lbnRyeSB3YWxrZXIgaWYg
UFVELXNpemVkIGh1Z2VwYWdlcyBhbmQKPiBwdGUgbWFwcGluZ3MgYXJlIHN1cHBvcnRlZCwgZWxz
ZSB0aGUgY29tbW9uIHBhZ2V3YWxrIGNvZGUgd2lsbCB0YWtlCj4gY2FyZSBvZiB0aGUgaXRlcmF0
aW9uLiAgTm90IGltcGxlbWVudGluZyB0aGlzIGNhbGxiYWNrIHJlZHVjZWQgdGhlCj4gYW1vdW50
IG9mIGNvZGUgY29tcGlsZWQgZm9yIG5vbi14ODYgcGxhdGZvcm1zLCBhbmQgYWxzbyBmaXhlcyBj
b21waWxlCj4gZmFpbHVyZXMgd2l0aCBvdGhlciBhcmNoaXRlY3R1cmVzIHdoZW4gaGVscGVycyBs
aWtlIHB1ZF9wZm4gYXJlIG5vdAo+IGltcGxlbWVudGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICBtbS9obW0uYyB8IDI5ICsrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25z
KCspLCAxMyBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0Bt
ZWxsYW5veC5jb20+CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
