Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 365B691165
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29AE96EA14;
	Sat, 17 Aug 2019 15:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150072.outbound.protection.outlook.com [40.107.15.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62DA6EA51;
 Thu, 15 Aug 2019 19:22:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEMVp3IIsC/6+RlDi6BW1b7S/KaSDST+fT/09/JqlDCNGOOqCuaRu8TJLriY1KPSZvwHnupvuH8LnqmHCApl14yLf/CLayEqjojJfK+d6mIGAn7TWquxbtRFy0E5CGWgrkDNlKFKxr9tY4Dcd1kULiwN/1BW00yPp22B1ecUZLYjn15dG4FI3hCIQe6Maw6s9iToiE3bonZH5fVpKbq2W6OR90tqGaIFCBaRylGEJF/N1wKeZOxiB0uejAeqJpU5vsx5WXP+uVt7hF+uedgRdyujCtf38VbPikU/7pc0C9/c+TdCp1s69/kUiib6KAI9l6TGCAe8wxdWYOyxJC50nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+Nsz8JNQsDfD+B9cwVgtusZSzpn1jdQQMMPk9A1PfE=;
 b=BIlnRDgl0Vusv3dNMyk2Vw9FsM6qqX2p9SLuxjY2W7TbR/SE3Nwrsfgoou6+MroWAuNde4aC7nuYk1PiZS2MUAoPJleut0s6Ez0SO/9mFg1XNZKQzC6LnD5fVRlLvc6Dv47MkcHJotb4cJepsfeZ+ynCJrBgG2gAmCXre0lbSvnYTYFvmbo7Ilyf0JCUUKomFGTRIJqjmv70DHIsHcVU7yeXZDcOTfSEAt2kNxkz4GV0fAnP4G/3eEduP7LbnycyEn7Zn6YFZKa5/T3EwdRzCp++Bw5n+lgzi08tCXGW+7zXj6nejbVosz6zmQoPbyCCAKuMNkvpmCiCr3gxzbnTJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6207.eurprd05.prod.outlook.com (20.178.123.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.23; Thu, 15 Aug 2019 19:22:03 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7%6]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 19:22:02 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
Thread-Topic: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
Thread-Index: AQHVTHDc5B4IgstYQk6yBJaVfn8xGqbv9wIAgAARNACAAMySgIAJE76AgABlPQCAAGF5AIAAFowAgAHIzYCAABXxgA==
Date: Thu, 15 Aug 2019 19:22:02 +0000
Message-ID: <20190815192157.GB22970@mellanox.com>
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-5-hch@lst.de> <20190807174548.GJ1571@mellanox.com>
 <CAPcyv4hPCuHBLhSJgZZEh0CbuuJNPLFDA3f-79FX5uVOO0yubA@mail.gmail.com>
 <20190808065933.GA29382@lst.de>
 <CAPcyv4hMUzw8vyXFRPe2pdwef0npbMm9tx9wiZ9MWkHGhH1V6w@mail.gmail.com>
 <20190814073854.GA27249@lst.de> <20190814132746.GE13756@mellanox.com>
 <CAPcyv4g8usp8prJ+1bMtyV1xuedp5FKErBp-N8+KzR=rJ-v0QQ@mail.gmail.com>
 <20190815180325.GA4920@redhat.com>
In-Reply-To: <20190815180325.GA4920@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQBPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::48) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8e868ce-1e09-4fe7-c19f-08d721b5da06
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6207; 
x-ms-traffictypediagnostic: VI1PR05MB6207:
x-microsoft-antispam-prvs: <VI1PR05MB62073BCAE334CC1F11F8D415CFAC0@VI1PR05MB6207.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(189003)(199004)(66066001)(25786009)(6246003)(8676002)(14454004)(478600001)(6916009)(7736002)(76176011)(81166006)(102836004)(386003)(186003)(26005)(53546011)(6506007)(71200400001)(256004)(305945005)(52116002)(8936002)(71190400001)(64756008)(66446008)(5660300002)(99286004)(66946007)(446003)(486006)(476003)(2616005)(66476007)(316002)(81156014)(66556008)(54906003)(11346002)(2906002)(33656002)(53936002)(86362001)(1076003)(6116002)(7416002)(4326008)(6512007)(6436002)(6486002)(229853002)(36756003)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6207;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SvLJ8MxOIqnPXh5qm0c3ngH3VI+0afAR4OX2IzZmLgTZd6sx8zPtyffMvRGo6FEFrYLx7iEcja8FIYDlOwDF+qIyWavv7QWQi9ioqw14T7+ftmpo59w+ZbNxx4WclurmTcCVgQrQ80JUZvSB9KUBj/ka7vKvIhFD4g4hPKbPx2urMgUWafmstjr36Tbw9Y87opcmjdyFTwgN+Kg9pT2YmtJela/1FI/Gy0YWbl43sDgiVR1GJQDs/JKt+W6rnkp5v99+7y4wOq4ujJZ7o75SfnzlgoOd1W5sxL8H22K6fFkNbZaHcQSZmgsGbJuOnnhOra0dmm7uNvN5Vu++DOoLP8HXswJ3R/Sadhh3NtUYM2vyuQaSeZ0nLEbceAhlfM4219VhdBHHZXpbv9JRyBK399dR9z7bgqkdmzWfE36wCao=
x-ms-exchange-transport-forked: True
Content-ID: <45C50639B74BC0449B53AC8E6F4A6DDB@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e868ce-1e09-4fe7-c19f-08d721b5da06
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 19:22:02.9196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2vFTB0+yKuq5On5J5G9lbqd9I2G6xXxCbN/18vAq7tme5oNNCFMxgV8VNc2bYgLIod3sA7R5ZR0XiZlpqMy0Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6207
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+Nsz8JNQsDfD+B9cwVgtusZSzpn1jdQQMMPk9A1PfE=;
 b=CKnq2pWfwkJWkxrvw7vLKijTlbzNmf2PVV+ALVhA736j4aYd+Vfo3z5l2o3NWQ1vFShmzG5p3YeIPT37d27NLHlGpVNhZx/2Dz9ZBxwAaig/vTwLbHV2nPWeuBwMnjToIybbXPE651rU2/0K5t45823U5xIkKXdE1O+9PAEIXgA=
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDI6MDM6MjVQTSAtMDQwMCwgSmVyb21lIEdsaXNzZSB3
cm90ZToKPiBPbiBXZWQsIEF1ZyAxNCwgMjAxOSBhdCAwNzo0ODoyOEFNIC0wNzAwLCBEYW4gV2ls
bGlhbXMgd3JvdGU6Cj4gPiBPbiBXZWQsIEF1ZyAxNCwgMjAxOSBhdCA2OjI4IEFNIEphc29uIEd1
bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFdlZCwgQXVn
IDE0LCAyMDE5IGF0IDA5OjM4OjU0QU0gKzAyMDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+
ID4gPiA+IE9uIFR1ZSwgQXVnIDEzLCAyMDE5IGF0IDA2OjM2OjMzUE0gLTA3MDAsIERhbiBXaWxs
aWFtcyB3cm90ZToKPiA+ID4gPiA+IFNlY3Rpb24gYWxpZ25tZW50IGNvbnN0cmFpbnRzIHNvbWV3
aGF0IHNhdmUgdXMgaGVyZS4gVGhlIG9ubHkgZXhhbXBsZQo+ID4gPiA+ID4gSSBjYW4gdGhpbmsg
b2YgYSBQTUQgbm90IGNvbnRhaW5pbmcgYSB1bmlmb3JtIHBnbWFwIGFzc29jaWF0aW9uIGZvcgo+
ID4gPiA+ID4gZWFjaCBwdGUgaXMgdGhlIGNhc2Ugd2hlbiB0aGUgcGdtYXAgb3ZlcmxhcHMgbm9y
bWFsIGRyYW0sIGkuZS4gc2hhcmVzCj4gPiA+ID4gPiB0aGUgc2FtZSAnc3RydWN0IG1lbW9yeV9z
ZWN0aW9uJyBmb3IgYSBnaXZlbiBzcGFuLiBPdGhlcndpc2UsIGRpc3RpbmN0Cj4gPiA+ID4gPiBw
Z21hcHMgYXJyYW5nZSB0byBtYW5hZ2UgdGhlaXIgb3duIGV4Y2x1c2l2ZSBzZWN0aW9ucyAoYW5k
IG5vdwo+ID4gPiA+ID4gc3Vic2VjdGlvbnMgYXMgb2YgdjUuMykuIE90aGVyd2lzZSB0aGUgaW1w
bGVtZW50YXRpb24gY291bGQgbm90Cj4gPiA+ID4gPiBndWFyYW50ZWUgZGlmZmVyZW50IG1hcHBp
bmcgbGlmZXRpbWVzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoYXQgc2FpZCwgdGhpcyBzZWVtcyB0
byB3YW50IGEgYmV0dGVyIG1lY2hhbmlzbSB0byBkZXRlcm1pbmUgInBmbiBpcwo+ID4gPiA+ID4g
Wk9ORV9ERVZJQ0UiLgo+ID4gPiA+Cj4gPiA+ID4gU28gSSBndWVzcyB0aGlzIHBhdGNoIGlzIGZp
bmUgZm9yIG5vdywgYW5kIG9uY2UgeW91IHByb3ZpZGUgYSBiZXR0ZXIKPiA+ID4gPiBtZWNoYW5p
c20gd2UgY2FuIHN3aXRjaCBvdmVyIHRvIGl0Pwo+ID4gPgo+ID4gPiBXaGF0IGFib3V0IHRoZSB2
ZXJzaW9uIEkgc2VudCB0byBqdXN0IGdldCByaWQgb2YgYWxsIHRoZSBzdHJhbmdlCj4gPiA+IHB1
dF9kZXZfcGFnZW1hcHMgd2hpbGUgc2Nhbm5pbmc/IE9kZHMgYXJlIGdvb2Qgd2Ugd2lsbCB3b3Jr
IHdpdGggb25seQo+ID4gPiBhIHNpbmdsZSBwYWdlbWFwLCBzbyBpdCBtYWtlcyBzb21lIHNlbnNl
IHRvIGNhY2hlIGl0IG9uY2Ugd2UgZmluZCBpdD8KPiA+IAo+ID4gWWVzLCBpZiB0aGUgc2NhbiBp
cyBvdmVyIGEgc2luZ2xlIHBtZCB0aGVuIGNhY2hpbmcgaXQgbWFrZXMgc2Vuc2UuCj4gCj4gUXVp
dGUgZnJhbmtseSBhbiBlYXNpZXIgYW4gYmV0dGVyIHNvbHV0aW9uIGlzIHRvIHJlbW92ZSB0aGUg
cGFnZW1hcAo+IGxvb2t1cCBhcyBITU0gdXNlciBhYmlkZSBieSBtbXUgbm90aWZpZXIgaXQgbWVh
bnMgd2Ugd2lsbCBub3QgbWFrZQo+IHVzZSBvciBkZXJlZmVyZW5jZSB0aGUgc3RydWN0IHBhZ2Ug
c28gdGhhdCB3ZSBhcmUgc2FmZSBmcm9tIGFueQo+IHJhY2luZyBob3R1bnBsdWcgb2YgZGF4IG1l
bW9yeSAoYXMgbG9uZyBhcyBkZXZpY2UgZHJpdmVyIHVzaW5nIGhtbQo+IGRvIG5vdCBoYXZlIGEg
YnVnKS4KClllcywgSSBhbHNvIHdvdWxkIHByZWZlciB0byBkcm9wIHRoZSBjb25mdXNpbmcgY2hl
Y2tzIGVudGlyZWx5IC0KQ2hyaXN0b3BoIGNhbiB5b3UgcmVzZW5kIHRoaXMgcGF0Y2g/CgpUaGFu
a3MsCkphc29uIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
