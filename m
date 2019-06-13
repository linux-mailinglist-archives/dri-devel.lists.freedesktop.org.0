Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E93455C9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D62896EC;
	Fri, 14 Jun 2019 07:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61EF896E7;
 Thu, 13 Jun 2019 19:34:34 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4703.eurprd05.prod.outlook.com (20.176.4.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Thu, 13 Jun 2019 19:34:31 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1%6]) with mapi id 15.20.1987.012; Thu, 13 Jun 2019
 19:34:31 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 09/22] memremap: lift the devmap_enable manipulation into
 devm_memremap_pages
Thread-Topic: [PATCH 09/22] memremap: lift the devmap_enable manipulation into
 devm_memremap_pages
Thread-Index: AQHVIcyGh+LZVhNi2EuUux9FsS41VqaZ+m2A
Date: Thu, 13 Jun 2019 19:34:31 +0000
Message-ID: <20190613193427.GU22062@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-10-hch@lst.de>
In-Reply-To: <20190613094326.24093-10-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR02CA0046.namprd02.prod.outlook.com
 (2603:10b6:207:3d::23) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2344bec2-d78c-4486-b0bc-08d6f0362814
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB4703; 
x-ms-traffictypediagnostic: VI1PR05MB4703:
x-microsoft-antispam-prvs: <VI1PR05MB4703615FBFE57552FC7A5F3ECFEF0@VI1PR05MB4703.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(136003)(366004)(376002)(346002)(39860400002)(396003)(189003)(199004)(43544003)(25786009)(71190400001)(2616005)(316002)(256004)(446003)(71200400001)(68736007)(476003)(11346002)(26005)(99286004)(76176011)(386003)(229853002)(52116002)(66066001)(6116002)(53936002)(3846002)(66946007)(2906002)(6916009)(6506007)(102836004)(6246003)(6436002)(54906003)(66446008)(66556008)(486006)(64756008)(66476007)(14454004)(6486002)(478600001)(73956011)(86362001)(81166006)(305945005)(81156014)(7736002)(8936002)(186003)(5660300002)(7416002)(1076003)(36756003)(4326008)(4744005)(6512007)(8676002)(33656002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4703;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2nSk9n4j3C4hJek/u+dZ6x7dV3tjTsGkUY3UXBXRkHKaWJqXhdg8ZS34cQZL7GwgyF5/MSzAJhv2aUAjjtk8CRvLzUVGNduiTuQkZy3Kv+MZPwfJIT90IFGBZ/ZsH3qZoh/CPWzTLkRl4wuE3WtmH20XC331wtkLzLWek4XEe0R+LNOkx+Hp/SCi2uxUbb7ts65BsfUxQNVpaOPGaYiTXZ2cklEw1b8NCzBt7dR1vWFs9sxDlNJ47eMYM+Bo+bdfGOd5g+9egoEaH5hhoSSUEnB25YzaoPWpks/1OJjOwTG1qouPEkgHuHQomu5+xxWhDy/fHuXrTHWkWiYva0Hxy3ILfkB1RQoRgbijiJvrA35MkyYBW3WSRajPXlSEBpJNXi4TzI+dMNkmRB5ftUjxHXdrJM09OJwhUKDw/JKjuRo=
Content-ID: <2494E1C39D43164DA0596E93A4038E37@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2344bec2-d78c-4486-b0bc-08d6f0362814
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 19:34:31.3397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4703
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHKRMNw9g2ihF+kxFu2QxbCGLLD+Dv1zpejuy8kLLZA=;
 b=iUpnm6J9uAc2yjehlZggxWFZYnKjETahRTv9czZSJmRWPzW0c51V9hOVdRyMTHee9htECLtgsjxbSbXXTMK9Qo8zztfp4DzvDNdvYkG9j5XEA3xndXD0rPc3xF4w+ErYDv17IJNFO1S+2JDvJIZa+4wCOKDxz2p2P1kLyObkgUk=
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

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6NDM6MTJBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gSnVzdCBjaGVjayBpZiB0aGVyZSBpcyBhIC0+cGFnZV9mcmVlIG9wZXJhdGlv
biBzZXQgYW5kIHRha2UgY2FyZSBvZiB0aGUKPiBzdGF0aWMga2V5IGVuYWJsZSwgYXMgd2VsbCBh
cyB0aGUgcHV0IHVzaW5nIGRldmljZSBtYW5hZ2VkIHJlc291cmNlcy4KPiBkaWZmIC0tZ2l0IGEv
bW0vaG1tLmMgYi9tbS9obW0uYwo+IGluZGV4IGM3NmExYjVkZWZkYS4uNmRjNzY5ZmViMmUxIDEw
MDY0NAo+ICsrKyBiL21tL2htbS5jCj4gQEAgLTEzNzgsOCArMTM3OCw2IEBAIHN0cnVjdCBobW1f
ZGV2bWVtICpobW1fZGV2bWVtX2FkZChjb25zdCBzdHJ1Y3QgaG1tX2Rldm1lbV9vcHMgKm9wcywK
PiAgCXZvaWQgKnJlc3VsdDsKPiAgCWludCByZXQ7Cj4gIAo+IC0JZGV2X3BhZ2VtYXBfZ2V0X29w
cygpOwo+IC0KCldoZXJlIHdhcyB0aGUgbWF0Y2hpbmcgZGV2X3BhZ2VtYXBfcHV0X29wcygpIGZv
ciB0aGlzIGhtbSBjYXNlPyBUaGlzCmlzIGEgYnVnIGZpeCB0b28/CgpUaGUgbm91dmVhdSBkcml2
ZXIgaXMgdGhlIG9ubHkgb25lIHRvIGFjdHVhbGx5IGNhbGwgdGhpcyBobW0gZnVuY3Rpb24KYW5k
IGl0IGRvZXMgaXQgYXMgcGFydCBvZiBhIHByb2JlIGZ1bmN0aW9uLiAKClNlZW1zIHJlYXNvbmFi
bGUsIGhvd2V2ZXIsIGluIHRoZSB1bmxpa2VseSBldmVudCB0aGF0IGl0IGZhaWxzIHRvIGluaXQK
J2RtZW0nIHRoZSBkcml2ZXIgd2lsbCByZXRhaW4gYSBkZXZfcGFnZW1hcF9nZXRfb3BzIHVudGls
IGl0IHVubG9hZHMuClRoaXMgaW1iYWxhbmNlIGRvZXNuJ3Qgc2VlbSB3b3J0aCB3b3JyeWluZyBh
Ym91dC4KClJldmlld2VkLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KCkphc29u
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
