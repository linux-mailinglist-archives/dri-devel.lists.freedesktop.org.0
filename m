Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF2360260
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632A96E42D;
	Fri,  5 Jul 2019 08:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10058.outbound.protection.outlook.com [40.107.1.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977AC6E391;
 Thu,  4 Jul 2019 16:45:39 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5567.eurprd05.prod.outlook.com (20.177.202.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 16:42:41 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2032.019; Thu, 4 Jul 2019
 16:42:41 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: hmm_range_fault related fixes and legacy API removal v2
Thread-Topic: hmm_range_fault related fixes and legacy API removal v2
Thread-Index: AQHVMer7t/tGwC82LkyVSWCA9HbG9qa6qyIA
Date: Thu, 4 Jul 2019 16:42:41 +0000
Message-ID: <20190704164236.GP3401@mellanox.com>
References: <20190703220214.28319-1-hch@lst.de>
In-Reply-To: <20190703220214.28319-1-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:208:160::27) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d777add8-1034-4a02-2894-08d7009ea152
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5567; 
x-ms-traffictypediagnostic: VI1PR05MB5567:
x-microsoft-antispam-prvs: <VI1PR05MB5567FDCECF3917DF8168379ACFFA0@VI1PR05MB5567.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(189003)(199004)(66556008)(54906003)(66946007)(64756008)(66476007)(26005)(36756003)(33656002)(386003)(14454004)(6506007)(102836004)(66066001)(66446008)(5660300002)(3846002)(86362001)(305945005)(186003)(6116002)(4744005)(6512007)(8936002)(7736002)(256004)(4326008)(478600001)(66574012)(73956011)(6436002)(81156014)(71190400001)(1076003)(8676002)(6486002)(99286004)(25786009)(53936002)(52116002)(6246003)(486006)(71200400001)(316002)(476003)(2616005)(229853002)(76176011)(68736007)(81166006)(2906002)(446003)(11346002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5567;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qfd6DQ3O9lVmXBhzL6fZ+XuCwJs9t9/P5U344ddNKLuPom7Rmm68yw1qMQBHEIrkHXqXQzm1fevCer2xP0wcMMXo+9/Ewpfhgm1Ptht9YIbRs8Av5yUnb8+T2lprvJDFxhhGdYn+V2g5sSYXyntD589feGEfajxJ2j47A8mjQ+DEwzvYvAKZaoY0wxG0ogxuL2V9tBdSjmriI3S+fKmRlPqhdFYfGx9YGfCvmBevPGHukIjvQQxe1ZbFjeZfZRVNdqIm48GyiVpnnZJ2UijtzmLJOZKMFp6tmO+fcOzxctP3DzGxrIsAoVULMyD0f5IZbvgotwrId4dWM5VEMK8N4+LWGggNvwLEegiD5te5D4WPzffEGf2DFak04gumVAT0SLzOQyPEoB3otcyDsFblfS49Ol+UzQapWUxTQcpuRj8=
Content-ID: <6E2A6AFC2F28DA408E71977260C54358@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d777add8-1034-4a02-2894-08d7009ea152
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 16:42:41.2830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5567
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:41:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgsSYVqWAN7zpRQYvB8rkaDe+yXFBCGV3KXoYay916E=;
 b=HopT+E6PwjgEz4sSI6VfRou/qjWczQYExeWvDdTfR3K+YFM7bRYHh2lSkC9QB107D3jYzaK8cCllupyYuIEyPT0RbxLxX3eB+2AjPiB8npdxginhRh0A3CMcMd74IdijBtMwY82ygNYdANkAOCWSn1QSAHUk+JHMV0UjxzXsirA=
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDM6MDI6MDhQTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6DQo+IEhpIErDqXLDtG1lLCBCZW4gYW5kIEphc29uLA0KPiANCj4gYmVsb3cgaXMg
YSBzZXJpZXMgYWdhaW5zdCB0aGUgaG1tIHRyZWUgd2hpY2ggZml4ZXMgdXAgdGhlIG1tYXBfc2Vt
DQo+IGxvY2tpbmcgaW4gbm91dmVhdSBhbmQgd2hpbGUgYXQgaXQgYWxzbyByZW1vdmVzIGxlZnRv
dmVyIGxlZ2FjeSBITU0gQVBJcw0KPiBvbmx5IHVzZWQgYnkgbm91dmVhdS4NCj4gDQo+IENoYW5n
ZXMgc2luY2UgdjE6DQo+ICAtIGRvbid0IHJldHVybiB0aGUgdmFsaWQgc3RhdGUgZnJvbSBobW1f
cmFuZ2VfdW5yZWdpc3Rlcg0KPiAgLSBhZGRpdGlvbmFsIG5vdXZlYXUgY2xlYW51cHMNCg0KUmFs
cGgsIHNpbmNlIG1vc3Qgb2YgdGhpcyBpcyBub3V2ZWF1IGNvdWxkIHlvdSBjb250cmlidXRlIGEN
ClRlc3RlZC1ieT8gVGhhbmtzDQoNCkphc29uDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
