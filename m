Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF251455AD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CB7894E3;
	Fri, 14 Jun 2019 07:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50045.outbound.protection.outlook.com [40.107.5.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8526898EE;
 Thu, 13 Jun 2019 19:05:11 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4928.eurprd05.prod.outlook.com (20.177.51.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Thu, 13 Jun 2019 19:05:09 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1%6]) with mapi id 15.20.1987.012; Thu, 13 Jun 2019
 19:05:08 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/22] mm: don't clear ->mapping in hmm_devmem_free
Thread-Topic: [PATCH 04/22] mm: don't clear ->mapping in hmm_devmem_free
Thread-Index: AQHVIcx9tYJr+8Mn7kqAMQYMKR1ZDqaZ8jSA
Date: Thu, 13 Jun 2019 19:05:07 +0000
Message-ID: <20190613190501.GQ22062@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-5-hch@lst.de>
In-Reply-To: <20190613094326.24093-5-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::34) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bbf803f6-efcc-4d94-d47b-08d6f0320cfc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB4928; 
x-ms-traffictypediagnostic: VI1PR05MB4928:
x-microsoft-antispam-prvs: <VI1PR05MB4928F4B1BDE805C1E9FF8777CFEF0@VI1PR05MB4928.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(346002)(376002)(396003)(366004)(189003)(199004)(7736002)(81156014)(36756003)(14444005)(476003)(2616005)(6486002)(6436002)(256004)(486006)(33656002)(446003)(99286004)(54906003)(11346002)(305945005)(66446008)(66066001)(6246003)(26005)(66476007)(8676002)(229853002)(73956011)(6916009)(66556008)(7416002)(186003)(53936002)(81166006)(316002)(66946007)(64756008)(6512007)(3846002)(102836004)(5660300002)(8936002)(1076003)(76176011)(14454004)(386003)(52116002)(6506007)(4326008)(71200400001)(71190400001)(478600001)(86362001)(2906002)(25786009)(6116002)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4928;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6FABMmmx3sbXSt/4QuBhcr7/YtvHD9s/olWKQHhWI0mA8kSlXMrWKF0QZilfQlXKDGbNvyqHgaxtSNIRDHWheLvlaQg7ETFB5Cjnsj3e6AzZTE/LzV1r/NXF4RPFKajt7Lf0Zt3MLCVPMv6Py9/mIUvHGARY4lqJVy9Ty8iRrJAEPZH0ZBM9D1K5rtlvMnz+WJYUeaF4YLccPfAELIPq0IFDLQouavshf+v9LfjaFE4GF5kD2gQSIkznPLEr5clvmds52YnLYX7mLmyaXddlqJBiuppL2rqQ4yHc0l15YlH27wU+91x31a2e5aTrSJ20Jta1x+D2p7zY9S4bBcgIW15iFdf19CgvOtpiNVk+iUV7/GLUbJt6PuRULdtVYopy1ZL0GfFk9W9ORII8qhp1t7aYrw6saeClZmC8MzyF26Q=
Content-ID: <7BF6B23DFB21B24C9129FD14A4ED8C15@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf803f6-efcc-4d94-d47b-08d6f0320cfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 19:05:07.9878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4928
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5H89jYFJH+O3gOi+KgnHMurO79Cv4aZ07rELsB946Xc=;
 b=YWGmvPnBhCruH1hC4ENOlDT/9NFEkEL0a4q9Qa4NpxuZS5nl20d1v1o2AyB8KY0mRuUpO8MBZVt3w70ES3mNbWfW9rSrolUHDrlUOb11mpH1sv6dZFgWg/bmYjRlTeKxzVQizkp6CPOcq2N0Zz+3+5aKzaCjOTaUlVQ+9iGoHDk=
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

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6NDM6MDdBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gLT5tYXBwaW5nIGlzbid0IGV2ZW4gdXNlZCBieSBITU0gdXNlcnMsIGFuZCB0
aGUgZmllbGQgYXQgdGhlIHNhbWUgb2Zmc2V0Cj4gaW4gdGhlIHpvbmVfZGV2aWNlIHBhcnQgb2Yg
dGhlIHVuaW9uIGlzIGRlY2xhcmVkIGFzIHBhZC4gIChXaGljaCBidHcgaXMKPiByYXRoZXIgY29u
ZnVzaW5nLCBhcyBEQVggdXNlcyAtPnBnbWFwIGFuZCAtPm1hcHBpbmcgZnJvbSB0d28gZGlmZmVy
ZW50Cj4gc2lkZXMgb2YgdGhlIHVuaW9uLCBidXQgREFYIGRvZXNuJ3QgdXNlIGhtbV9kZXZtZW1f
ZnJlZSkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
Cj4gLS0tCj4gIG1tL2htbS5jIHwgMiAtLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMo
LSkKCkh1cm0sIGlzIGhtbSBmb2xsb3dpbmcgdGhpcyBjb21tZW50IGZyb20gbW1fdHlwZXMuaD8K
CiAqIElmIHlvdSBhbGxvY2F0ZSB0aGUgcGFnZSB1c2luZyBhbGxvY19wYWdlcygpLCB5b3UgY2Fu
IHVzZSBzb21lIG9mIHRoZQogKiBzcGFjZSBpbiBzdHJ1Y3QgcGFnZSBmb3IgeW91ciBvd24gcHVy
cG9zZXMuICBUaGUgZml2ZSB3b3JkcyBpbiB0aGUgbWFpbgogKiB1bmlvbiBhcmUgYXZhaWxhYmxl
LCBleGNlcHQgZm9yIGJpdCAwIG9mIHRoZSBmaXJzdCB3b3JkIHdoaWNoIG11c3QgYmUKICoga2Vw
dCBjbGVhci4gIE1hbnkgdXNlcnMgdXNlIHRoaXMgd29yZCB0byBzdG9yZSBhIHBvaW50ZXIgdG8g
YW4gb2JqZWN0CiAqIHdoaWNoIGlzIGd1YXJhbnRlZWQgdG8gYmUgYWxpZ25lZC4gIElmIHlvdSB1
c2UgdGhlIHNhbWUgc3RvcmFnZSBhcwogKiBwYWdlLT5tYXBwaW5nLCB5b3UgbXVzdCByZXN0b3Jl
IGl0IHRvIE5VTEwgYmVmb3JlIGZyZWVpbmcgdGhlIHBhZ2UuCgpNYXliZSB0aGUgYXNzdW1wdGlv
biB3YXMgdGhhdCBhIGRyaXZlciBpcyB1c2luZyAtPm1hcHBpbmcgPwoKSG93ZXZlciwgbm91dmVh
dSBpcyB0aGUgb25seSBkcml2ZXIgdGhhdCB1c2VzIHRoaXMgcGF0aCwgYW5kIGl0IG5ldmVyCnRv
dWNoZXMgcGFnZS0+bWFwcGluZyBlaXRoZXIgKG5vciBpbiAtbmV4dCkuCgpJdCBsb29rcyBsaWtl
IGlmIGEgZHJpdmVyIHdlcmUgdG8gc3RhcnQgdXNpbmcgbWFwcGluZyB0aGVuIHRoZSBkcml2ZXIK
c2hvdWxkIGJlIHJlc3BvbnNpYmxlIHRvIHNldCBpdCBiYWNrIHRvIE5VTEwgYmVmb3JlIGJlaW5n
IGRvbmUgd2l0aAp0aGUgcGFnZS4KClJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0Bt
ZWxsYW5veC5jb20+CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
