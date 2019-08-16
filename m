Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B989116F
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2486EA21;
	Sat, 17 Aug 2019 15:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70083.outbound.protection.outlook.com [40.107.7.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818196E362;
 Fri, 16 Aug 2019 17:12:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUm5k2T6G7ABit7aXHA8OvHTGVe+8lk+OHdA+Mbd2vak4i8r23YCsc8g+tudJhlLvTrdHG3D92smCGmwsE2/Ul7nk/FxpDY1walMmemKiw+BzS4/vpnWwIYa40joopmeHGePnLE2zi2kc6WEnAPBXbgdgcZiGKQVTSJeR3izl5M06loxVjWsXAXoTU1VASGK0qSN4UygKfyfBK53XOJqUsV0zUM7wcY/8owdEujcb+m3U9XOKEt9kiu117x6q8eg5YqkF6eZfSITEH4mJm1YsnZaLNzWPSHBR0e3h4A2RPG+a4tw9yLE8Jt9WoqJ4rVqQG/nnwAU5WGN7zQ1IQKfVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dQ3ke8uff1NAjFFAPHyYOpvImMQUrO5vor3sThz4Cw=;
 b=HuGn/H2yec9o3yeCA5+NdVgrd9ZF5qAgOBpe+fF4pt095JSLocq/+Z0uLmGuAwS/hV3OyGoFQrhwhQXT5C7fz9ks2gOxZNd167bNtMp92F6YsQRDilGKqQytRRjmwg9tXj4+mP7Evz58MQeQ7ACQq7m0zHvvoMKa48DecUfCsSksbkNInsesCmO/r1nkJ5xDUjoamP1vB/ae6mYQzicF4+8/VnDMO5H0cm5Q9KQ/c0Ixma3SlsIuS5jHPnaqMDuqUYWKziXt0t62NNFhQwolPn9Kar8ihA7JpqtuDmZ/I0qnVBE47N6LhYMX0w4HMSeVe8pusQTqWeoy+zLn4bgCaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4399.eurprd05.prod.outlook.com (52.133.13.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Fri, 16 Aug 2019 17:12:57 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7%6]) with mapi id 15.20.2178.016; Fri, 16 Aug 2019
 17:12:57 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: turn hmm migrate_vma upside down v3
Thread-Topic: turn hmm migrate_vma upside down v3
Thread-Index: AQHVUnY3o2YuKC2GgEGP76ylqL0JqKb+Br6A
Date: Fri, 16 Aug 2019 17:12:57 +0000
Message-ID: <20190816171251.GL5412@mellanox.com>
References: <20190814075928.23766-1-hch@lst.de>
In-Reply-To: <20190814075928.23766-1-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQBPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::34) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab3d94b3-69f2-42ca-d103-08d7226cfb95
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB4399; 
x-ms-traffictypediagnostic: VI1PR05MB4399:
x-microsoft-antispam-prvs: <VI1PR05MB4399832B0B252C78852C8000CFAF0@VI1PR05MB4399.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(189003)(199004)(6512007)(186003)(53936002)(1076003)(305945005)(316002)(7736002)(76176011)(52116002)(66446008)(2906002)(6116002)(8936002)(26005)(2616005)(6246003)(102836004)(229853002)(86362001)(71190400001)(81156014)(81166006)(36756003)(3846002)(8676002)(99286004)(25786009)(66066001)(256004)(4326008)(14454004)(6916009)(6506007)(71200400001)(54906003)(446003)(478600001)(386003)(4744005)(6486002)(6436002)(476003)(66946007)(11346002)(7416002)(66476007)(66556008)(64756008)(486006)(33656002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4399;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Q3ogh7wkYXZo5Of84+w58jdXDAe0A19cTkHVIN1tUaS3j0Q/X7Uunm2Fmmz0If/N+rHowxlDYIT+jQKgMAEgXeA2kMsdJzaRwVgWiDK3Q0Ju7aX9r8ec/fQUbkwVsHJhRtv0d/NICRDYFPXQ4KPcz1pEfsxQrpQtbyRKxMiEmUY9QPxqZ/BK22eNYVySOCEMy6HhpLUKc4nZTBQRKGjK8NaJq+lXhbJt8fpk6mgQaes1MdpNo4X5fAO0nJFAJHO+8smpb+i9Ch4kkqNCrHkv3BCuajd/kHL3br/e4M30O5+/2QnEPJ3uvrikLkZG14pZ8DJAceNwwmxWTFSmnUxzkeJmkFcBlI+C7fyOBPWmXQ5DkMKGQDM5aJLJbPzreKSCAweMeRWJQZSg+utYrrYZ3EgSLBqZ2JjcRX7TKwfArR8=
x-ms-exchange-transport-forked: True
Content-ID: <1964F1888B3B054D9FCFE8BDD7D5370B@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3d94b3-69f2-42ca-d103-08d7226cfb95
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 17:12:57.0935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bLd5sukRTConBMZ5oo5kNEzb5BlHBt4PBWj8/HVxLeD/vlCIRwuOKNr7PvlaVqloBpK2MsNgu2qx9TMBIvPCwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4399
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dQ3ke8uff1NAjFFAPHyYOpvImMQUrO5vor3sThz4Cw=;
 b=sZWCpxXGtRwVOdzsESuAKFNlZtIbvLE2t7BmRp0/gZhXkCCrozH29l5JHhAuaReFPdT9dir2mQ/ASDb8tGdPs+rSl3/tAgRRRaMDgOq2sOuc0MRfTyZ4T5+wgXIc6ugl5J/BqYy/PNnauXsQuGFC1vvxjohrYoK/q/xHvGx/Iog=
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
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bharata B Rao <bharata@linux.ibm.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDk6NTk6MThBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6DQo+IEhpIErDqXLDtG1lLCBCZW4gYW5kIEphc29uLA0KPiANCj4gYmVsb3cgaXMg
YSBzZXJpZXMgYWdhaW5zdCB0aGUgaG1tIHRyZWUgd2hpY2ggc3RhcnRzIHJldmFtcGluZyB0aGUN
Cj4gbWlncmF0ZV92bWEgZnVuY3Rpb25hbGl0eS4gIFRoZSBwcmltZSBpZGVhIGlzIHRvIGV4cG9y
dCB0aHJlZSBzbGlnaHRseQ0KPiBsb3dlciBsZXZlbCBmdW5jdGlvbnMgYW5kIHRodXMgYXZvaWQg
dGhlIG5lZWQgZm9yIG1pZ3JhdGVfdm1hX29wcw0KPiBjYWxsYmFja3MuDQo+IA0KPiBEaWZmc3Rh
dDoNCj4gDQo+ICAgICA3IGZpbGVzIGNoYW5nZWQsIDI4MiBpbnNlcnRpb25zKCspLCA2MTQgZGVs
ZXRpb25zKC0pDQoNCllheSwgYW5vdGhlciBiaWcgd2FjayBvZiBjb2RlIGdvbmUNCiANCkFwcGxp
ZWQgdG8gaG1tLmdpdA0KDQpUaGFua3MsDQpKYXNvbg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
