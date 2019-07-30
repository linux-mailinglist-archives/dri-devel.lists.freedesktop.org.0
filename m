Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CE57BA5D
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6346E68E;
	Wed, 31 Jul 2019 07:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70089.outbound.protection.outlook.com [40.107.7.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D835894DE;
 Tue, 30 Jul 2019 12:33:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=duZqtWSBY97V/rluhGAmN//dTbA+13SADWRK91Io7QHY/ofM9u4mHxxXAtWdHSrkFNndFpBnBPjuX4gv2yIped/axaqZtS9TjnH0E6vtniCfoq/jolTri6QGh6NNSdSC6BGlmKrjPkCXXL0aCPaGkmrQVD74Zouf0ojYXzED1zyXmIiV1iCdr8fKIgG2Xil9m8gU5wQltRZYxtG/xH25WKtfXDE3+Af3JuMt6bGa7Gw1lJf0cOKyMBNCi/7Xgqr66E3463Fu/fmIB3AXY/LchoxfCqFL4Ba9AeRAZHFlM/BgcY7nP5wIMJlJrwwv2xHKwgZMKEJ78qWTwJclV/GAWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJBqIk0uULmDKfoRtscS14x8TCOltxwjYuCzhuHiI4g=;
 b=gXxdBu2nWchZxziBgDkLJEyfrLgGyDCX09t3HTOYicf2nIyiUVJ4z/6GD9102yWwzu/Ll5OMRd6BSZZCHNFMMahD0h0PmoTer+rMSl24SNpuwsKuqiM7IgVw2XMbjVVfYGNZ+8h7CdaTH8c4n87IP8EAa8jRJgHx0GvwHePyncsdkHm5yNbMKYHztFpTswXUsXlvYVZhGPfuWi3cV8d6cdxpABMR7iUESI8YavARq958TDg1807dPHCLF89osOnVsYIg9dBTkblRMhMa1v8+o+3MACPb7u2lKDvjxxLck3fh2mC7IpTxDg6x6djg2/4HnIIAM0uwkZpP+Rr5h1OB8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5568.eurprd05.prod.outlook.com (20.177.202.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Tue, 30 Jul 2019 12:33:13 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 12:33:13 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/13] amdgpu: don't initialize range->list in
 amdgpu_hmm_init_range
Thread-Topic: [PATCH 02/13] amdgpu: don't initialize range->list in
 amdgpu_hmm_init_range
Thread-Index: AQHVRpr2/Xz4jNPu6k2DNRcwdQGPdqbjGKwA
Date: Tue, 30 Jul 2019 12:33:12 +0000
Message-ID: <20190730123308.GC24038@mellanox.com>
References: <20190730055203.28467-1-hch@lst.de>
 <20190730055203.28467-3-hch@lst.de>
In-Reply-To: <20190730055203.28467-3-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40)
 To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 030d7e3e-a479-4767-61b9-08d714ea1671
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5568; 
x-ms-traffictypediagnostic: VI1PR05MB5568:
x-microsoft-antispam-prvs: <VI1PR05MB5568E3AC8C0E36649BB76B91CFDC0@VI1PR05MB5568.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(199004)(189003)(446003)(11346002)(53936002)(486006)(5660300002)(2616005)(476003)(14444005)(256004)(4744005)(6246003)(26005)(6436002)(6512007)(66946007)(6486002)(102836004)(305945005)(66476007)(68736007)(66446008)(64756008)(66556008)(33656002)(8936002)(186003)(1076003)(66066001)(71200400001)(7736002)(81156014)(81166006)(8676002)(229853002)(7416002)(99286004)(2906002)(6916009)(6116002)(54906003)(316002)(36756003)(3846002)(86362001)(478600001)(76176011)(6506007)(386003)(52116002)(14454004)(4326008)(25786009)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5568;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: igJ5d+sAtfWgcZPbFsVrEGUPsD09Bd7BkfoQ48FP7/adNthai8eA3lAChgCflxSwnW0Jt41B456uo/4Al0S11kKYNWcpeHjygIX0jTJpycSsbzFnamNI7EXV2SowJlY/1SQhOJzNxzzkXUBDrb6Kk1Mb5a9Rh0VbEb/9bflnMMms40fPrgIxBEGZ7d2xO9Za/2QPKM3mxRt/x29xrb5ov3H4vJWDncg6kYWwEsmYSq0dl2qPR8d4GTYgyQ1YkVgz18KnnNPiStw0RUT4AAipzrRrMi0OAqeMKJOWnGHbi30hIYyqA9IqFMqI6oxV7xz5wJxx5IO9CJ3cZIvlmGMlwFtqukwwjnJjtKHOROYMxRHzo0uXwv4blAzYzMLlc2UiI4rR1+UJNCr3FTZ56DvjWnHJy+CbvfDCTVzVPqFieic=
Content-ID: <4857B6B6FF775241B37B5E5B4EA4984B@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 030d7e3e-a479-4767-61b9-08d714ea1671
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 12:33:12.9565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5568
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJBqIk0uULmDKfoRtscS14x8TCOltxwjYuCzhuHiI4g=;
 b=CD7DDxipYMn+6S2T94cLuSDRmuuBt5DamfzHeseDG7MZYE8eeZ9b6pGmLbIXqkZH5cNj0Abc6KlcFNBKRZTB9yiEIcOMZk3uoLxlVWOQ7D8sqcD5ykWPI1niJrw3RDKCsEY8+v+lNTHhDArEN042v8A+RypPfpCGEwf8E7p1O+s=
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

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDg6NTE6NTJBTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhlIGxpc3QgaXMgdXNlZCB0byBhZGQgdGhlIHJhbmdlIHRvIGFub3RoZXIg
bGlzdCBhcyBhbiBlbnRyeSBpbiB0aGUKPiBjb3JlIGhtbSBjb2RlLCBzbyB0aGVyZSBpcyBubyBu
ZWVkIHRvIGluaXRpYWxpemUgaXQgaW4gYSBkcml2ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9tbi5jIHwgMSAtCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0p
CgpSZXZpZXdlZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKSmFzb24K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
