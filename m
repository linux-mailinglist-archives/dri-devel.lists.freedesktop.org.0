Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22517455C1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83643895B5;
	Fri, 14 Jun 2019 07:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe02::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C7C891B9;
 Thu, 13 Jun 2019 20:04:06 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4381.eurprd05.prod.outlook.com (52.133.13.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Thu, 13 Jun 2019 20:04:03 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1%6]) with mapi id 15.20.1987.012; Thu, 13 Jun 2019
 20:04:03 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 22/22] mm: don't select MIGRATE_VMA_HELPER from HMM_MIRROR
Thread-Topic: [PATCH 22/22] mm: don't select MIGRATE_VMA_HELPER from HMM_MIRROR
Thread-Index: AQHVIcyc3r2YZSS3CUapXwnP1XJouKaaAquA
Date: Thu, 13 Jun 2019 20:04:03 +0000
Message-ID: <20190613200357.GC22062@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-23-hch@lst.de>
In-Reply-To: <20190613094326.24093-23-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQXPR01CA0086.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::15) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a348214a-681a-493b-a591-08d6f03a4842
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB4381; 
x-ms-traffictypediagnostic: VI1PR05MB4381:
x-microsoft-antispam-prvs: <VI1PR05MB43813927D62479F9D88EF8ABCFEF0@VI1PR05MB4381.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:765;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(39860400002)(376002)(136003)(396003)(199004)(189003)(446003)(476003)(14454004)(8936002)(6512007)(186003)(2616005)(11346002)(7736002)(3846002)(386003)(6116002)(76176011)(6506007)(316002)(7416002)(8676002)(4744005)(256004)(66946007)(66476007)(25786009)(73956011)(478600001)(14444005)(4326008)(64756008)(66446008)(66556008)(305945005)(486006)(66066001)(81166006)(36756003)(81156014)(68736007)(53936002)(52116002)(71190400001)(26005)(71200400001)(6246003)(2906002)(6486002)(99286004)(86362001)(229853002)(6916009)(33656002)(54906003)(5660300002)(1076003)(102836004)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4381;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wHlkn2ZfV9rDati83SasESQC5vPO5aAUc6haeZsc3mf5YMTqR0rvPOwQ/jmHjydNylEIBAbQSsIpA4xlWwWWmXVcbjuSbBG89xPpjgnzFAY9/pNQ0MevcNaLFvKVwmaofHBRX3U80+m+n/XNiTHFh4Dkr1Y8xUBqXH3Bm7kLAGqZNIa80R9+gfK1I/ojwlmseAk+31Z3tJJsHWoHjogYiG/BUrdnA2YRRv//z4Yoth+w2fzdP6j9E9OO8whiiJCjw7AHM2LJhRP1YU7SSXS5ASCcA0Aa7Ja/kHzVKJHzFIDfaLy7RBoiCbsIbgGKzVoRMwiljvO9aMLS2+LOzhiT2/5Ldlmi0pcEr629xNZ/eEkITnDNP+wcG4JcSreBI0wnIMLHZJIO86ajMA/D9QjQnb+9FjlgsHFbbVB1Rjgz34U=
Content-ID: <DC6C94E2B8591541A7B0CC844A612312@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a348214a-681a-493b-a591-08d6f03a4842
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 20:04:03.4038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4381
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnyCRHhq6our3JahOP7YUJnCatYmzhQnh3SEMqGi3dI=;
 b=tDnFxoEoVdJBSN3ifgsVF1zVBJV+F7fIQFERH6l2SFzpul7cbtTkMS4MxC6YxRlST4jOSZUB3kCC8MnSqhwbNgP97LvBIHKqZn3DwjpIUiqGNULbal9I3/wQPE+1k7Qa4APNV7lQY7PyLFlmnfI34vV38Sl/Z5PjU8dXF8PeMCk=
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
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6NDM6MjVBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhlIG1pZ3JhdGVfdm1hIGhlbHBlciBpcyBvbmx5IHVzZWQgYnkgbm92ZWF1
IHRvIG1pZ3JhdGUgZGV2aWNlIHByaXZhdGUKPiBwYWdlcyBhcm91bmQuICBPdGhlciBITU1fTUlS
Uk9SIHVzZXJzIGxpa2UgYW1kZ3B1IG9yIGluZmluaWJhbmQgZG9uJ3QKPiBuZWVkIGl0Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9LY29uZmlnIHwgMSArCj4gIG1tL0tjb25maWcgICAgICAg
ICAgICAgICAgICAgICAgfCAxIC0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKWWVzLCB0aGUgdGhpbmcgdGhhdCBjYWxscyBtaWdyYXRlX3ZtYSgpIHNo
b3VsZCBiZSB0aGUgdGhpbmcgdGhhdCBoYXMKdGhlIGtjb25maWcgc3R1ZmYuCgpSZXZpZXdlZC1i
eTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKSmFzb24KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
