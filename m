Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B4B4562A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646DA898C2;
	Fri, 14 Jun 2019 07:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60082.outbound.protection.outlook.com [40.107.6.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B483A892A9;
 Fri, 14 Jun 2019 00:24:08 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4320.eurprd05.prod.outlook.com (52.133.12.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Fri, 14 Jun 2019 00:24:05 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1%6]) with mapi id 15.20.1987.012; Fri, 14 Jun 2019
 00:24:05 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH] drm/nouveau/dmem: missing mutex_lock in error path
Thread-Topic: [PATCH] drm/nouveau/dmem: missing mutex_lock in error path
Thread-Index: AQHVIkXN8eYXmKvfbEike7oriK2vlaaaSl+A
Date: Fri, 14 Jun 2019 00:24:04 +0000
Message-ID: <20190614002359.GI22062@mellanox.com>
References: <20190614001121.23950-1-rcampbell@nvidia.com>
In-Reply-To: <20190614001121.23950-1-rcampbell@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::36) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bb8361b-ff68-4286-7658-08d6f05e9b95
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB4320; 
x-ms-traffictypediagnostic: VI1PR05MB4320:
x-microsoft-antispam-prvs: <VI1PR05MB4320DD8E3FB7FDC1A1C21F98CFEE0@VI1PR05MB4320.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(396003)(376002)(366004)(39860400002)(199004)(189003)(6506007)(386003)(68736007)(305945005)(54906003)(8936002)(86362001)(81166006)(81156014)(25786009)(8676002)(2906002)(102836004)(7736002)(26005)(186003)(4326008)(3846002)(6116002)(486006)(478600001)(6246003)(6916009)(446003)(11346002)(53936002)(1076003)(76176011)(476003)(2616005)(6436002)(6512007)(52116002)(99286004)(14454004)(64756008)(66556008)(66446008)(66476007)(5660300002)(316002)(73956011)(6486002)(66946007)(71190400001)(71200400001)(33656002)(4744005)(66066001)(229853002)(36756003)(256004)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4320;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OH4rhpR5cFF4RnjFeJHTsT/RtqndUbX2mQZUNK2YZeLkTeXw2JdfEoDUDFNkchTzWJxAbjI8Ihv2SjWcNQ0+xjahfkTPm3W3JL2UlSE1+7dRxv5r12z7wySspEoqd3dyLlF33mZI8D1a4hOJ0D7iZ12wvQdEe1va21K8F53LxuNzKWFnx13TOOKvCDhMibYwlRWtNOA593YlS91DjVPjKjCsM4Lyagvz2vRjndxjSTG6K4F/Fz2qe38uDpVaFfTkoqLXQTopAUV2Snyqe3VbZlPTHDkuX6Mt0+X5/9BAjrqKC3Cuoorc65sGvTZ0dH6PGyy6z+MzHW5VTwZocCRE7jDgFdqvY880t071cAhndTqUxdunJ+XKXTcgY89wrGOmy1UCmLBBRwaefWHgNF1bxjIYfZzKiASkzYLVGh4vydM=
Content-ID: <563E69CBF7DBDB4381F3D484B873273B@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb8361b-ff68-4286-7658-08d6f05e9b95
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 00:24:04.9798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4320
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAImgzXnowv6qDhqtjF71NCMmyzHuhDMrZiDcAdDS44=;
 b=a/oW8uBQB1y3cJMNZOZdFMpTw65gCxejE6t7g+GQEdfiSVYl1g8e8O5bHmyvzR8MZ92W7Mmg4v5Oc4coEY3Q4BrvBplxJWJ6MjIbCpx6OaxRXpxCgRflLiNiy0z8dnm0tP+93f3cg0vF5uKtJHuApzN0nnJsFquSZRVE0sdmPAM=
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
Cc: David Airlie <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDU6MTE6MjFQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gSW4gbm91dmVhdV9kbWVtX3BhZ2VzX2FsbG9jKCksIHRoZSBkcm0tPmRtZW0tPm11
dGV4IGlzIHVubG9ja2VkIGJlZm9yZQo+IGNhbGxpbmcgbm91dmVhdV9kbWVtX2NodW5rX2FsbG9j
KCkuCj4gUmVhY3F1aXJlIHRoZSBsb2NrIGJlZm9yZSBjb250aW51aW5nIHRvIHRoZSBuZXh0IHBh
Z2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEu
Y29tPgo+IC0tLQo+IAo+IEkgZm91bmQgdGhpcyB3aGlsZSB0ZXN0aW5nIEphc29uIEd1bnRob3Jw
ZSdzIGhtbSB0cmVlIGJ1dCB0aGlzIGlzCj4gaW5kZXBlbmRhbnQgb2YgdGhvc2UgY2hhbmdlcy4g
SSBndWVzcyBpdCBjb3VsZCBnbyB0aHJvdWdoCj4gRGF2aWQgQWlybGllJ3MgdHJlZSBmb3Igbm91
dmVhdSBvciBKYXNvbidzIHRyZWUuCgpUaGlzIHNlZW1zIGxpa2UgYSBiYWQgZW5vdWdoIGJ1ZyB0
byBzZW5kIGl0IGludG8gLXJjPwoKSXQgcHJvYmFibHkgc2hvdWxkIGdvIHRocm91Z2ggdGhlIG5v
cm1hbCBub3V2ZWF1IGNoYW5uZWxzLCB0aGFua3MKCkphc29uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
