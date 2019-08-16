Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2110891176
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB0A6EAD6;
	Sat, 17 Aug 2019 15:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130041.outbound.protection.outlook.com [40.107.13.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552606EA9C;
 Fri, 16 Aug 2019 00:43:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4ZnDIFqVa32ZRCo6FyOtKqmtHJdpZ+wio23ioQgokDEsYjQlskS4R/GXtZHb2IyRBhsBP6lNpnPijUyonXdRlKvg/JwGKEw9SZ038V+J/xQc2DCy67THP2CDxlYkT7cTyHbD8f+Ohyiyid4W68AvSarYsYsX6r1yfZuy4OdfOqy6GvEri2duAkx4wTpjkAFVWf0qD79dtEUIQp1SNM2ZVHUkcys4KHkybAGj0wYyuKj2TmTnjMcNOc03IOIKdgyEIuJY+K7KgxTmje943hXouiUAjHcGB9wcKtb+D1kVTdVb1QNpeqw8mpZAbkOLyY5GCgNK2NxtaUTYiNJCgFrUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+fFWNtn3fh9ETaY63oLhYA/T5giLbLqJ/XZiEiqCu4=;
 b=Slklgyq5I3kJrEM3DSFiAlfv5zOCxysUVzBSDldV5MONflIjHo5nzvTRE2UjxqxrU7sJQO1w+RmCoIJKeV/WbCdJgnlCdLMjEJrB4XALHolHYt5hCOUgchRRJq8HaRCe7BfeHpdjZlNQpK3l8Y2d40J7nv2C1CUoYU0xnL8C9BTovwPnI1YR7wflCirPK0yujKI/qk9OKc55S20o8GuJJ54YQ6gHi66W5zF0tGRWjXfENsVgJmlPgEw8OM+s/riOunbHTG7RDkFaEP5lC22E5HiVFLdFzzMk1VAjAen94UBWrJkQTC+zIhaeRUP0GTif/1iLgnnqEwbbHYZboSKN3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB3279.eurprd05.prod.outlook.com (10.170.238.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Fri, 16 Aug 2019 00:43:08 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7%6]) with mapi id 15.20.2178.016; Fri, 16 Aug 2019
 00:43:08 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
Thread-Topic: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
Thread-Index: AQHVTHDc5B4IgstYQk6yBJaVfn8xGqbv9wIAgAARNACAAMySgIAJE76AgABlPQCAAGF5AIAAFowAgAHIzYCAABojAIAAAd6AgAAIBgCAAAXLAIAAAlcAgAAC0YCAAECugA==
Date: Fri, 16 Aug 2019 00:43:07 +0000
Message-ID: <20190816004303.GC9929@mellanox.com>
References: <20190814073854.GA27249@lst.de>
 <20190814132746.GE13756@mellanox.com>
 <CAPcyv4g8usp8prJ+1bMtyV1xuedp5FKErBp-N8+KzR=rJ-v0QQ@mail.gmail.com>
 <20190815180325.GA4920@redhat.com>
 <CAPcyv4g4hzcEA=TPYVTiqpbtOoS30ahogRUttCvQAvXQbQjfnw@mail.gmail.com>
 <20190815194339.GC9253@redhat.com>
 <CAPcyv4jid8_=-8hBpn_Qm=c4S8BapL9B9RGT7e9uu303yH=Yqw@mail.gmail.com>
 <20190815203306.GB25517@redhat.com> <20190815204128.GI22970@mellanox.com>
 <20190815205132.GC25517@redhat.com>
In-Reply-To: <20190815205132.GC25517@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::17) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 106bd7bf-d98c-4516-588d-08d721e2b4f4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB3279; 
x-ms-traffictypediagnostic: VI1PR05MB3279:
x-microsoft-antispam-prvs: <VI1PR05MB32795D2B9DE58CE56782B8F6CFAF0@VI1PR05MB3279.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39850400004)(366004)(396003)(189003)(199004)(66446008)(486006)(99286004)(2616005)(53936002)(25786009)(186003)(446003)(14444005)(4326008)(26005)(66066001)(8936002)(8676002)(81166006)(476003)(2906002)(102836004)(64756008)(66556008)(3846002)(478600001)(14454004)(11346002)(229853002)(81156014)(66476007)(76176011)(6506007)(6116002)(66946007)(6246003)(386003)(52116002)(5660300002)(36756003)(4744005)(305945005)(256004)(7416002)(54906003)(316002)(6486002)(71200400001)(6512007)(33656002)(71190400001)(1076003)(7736002)(6916009)(86362001)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3279;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OvC8VzM8dF3CLVqHkn4dBVstZo8TtpmSrOkswOKvfj9a0WLRThrnxNl5Qkacpo6l1I5Ka1cTfAhuy9xVyJc+PzcX5cmv2b0+NHwpPXob/TpLXaU5DJPmwHaBsj2RIY6fKoKtjo7Fo5EudnY0EdMKAZSczA8GGOPzbUOpQFnTm2HdxKOo/VG57rxw1wwdAZ1hpeTqh2guOGXVrDypYG9gxjU0dxDgXSuyj7aeSDtnBSh38edJQJo9R90PiFDEQijCoJv1CAS1tuSLRobZtKPym+FryB6azqE1CUJEzd6ZhldRE53XhDcKSvN2cVSxia76qCNUVSqAsPPHTBaRC3tWgl4ey4x0RurXJydfnumXHc94tl/6SIHvq7vP6fMNh7l6+TmRvnxMTE5kBQW2tbWd8r+NBpXNlxmdgl0sTP6/QUQ=
x-ms-exchange-transport-forked: True
Content-ID: <1B3BBB0F1C80154FA9AB9F1D5250931A@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 106bd7bf-d98c-4516-588d-08d721e2b4f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 00:43:07.9721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DfwHXrCGyHOLLgzXg9/lhVI/zaC66jQfTzcfrsc6nG+hSL7Zg3SzXg2gAuSKlVASRuWkjY4cclT+21T2JpzUEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3279
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+fFWNtn3fh9ETaY63oLhYA/T5giLbLqJ/XZiEiqCu4=;
 b=jodWbgNsx2PUvjFc8wwpCsTnz5ILZzWpt1yigSDEzqvkhytQBu7a4AxixAhEGzmP6srsWpGQnIDGNPZPNqX8cbZ+KUqkYG0pdZlbMkEpMNhNtdiPOsHJBigxtN2SGR5ftHCnq0w2lxQ99kMccr34vtTmwbDR0SinqD9zQ4eMQtE=
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDQ6NTE6MzNQTSAtMDQwMCwgSmVyb21lIEdsaXNzZSB3
cm90ZToKCj4gc3RydWN0IHBhZ2UuIEluIHRoaXMgY2FzZSBhbnkgd2F5IHdlIGNhbiB1cGRhdGUg
dGhlCj4gbm91dmVhdV9kbWVtX3BhZ2UoKSB0byBjaGVjayB0aGF0IHBhZ2UgcGFnZS0+cGdtYXAg
PT0gdGhlCj4gZXhwZWN0ZWQgcGdtYXAuCgpJIHdhcyBhbHNvIHdvbmRlcmluZyBpZiB0aGF0IGlz
IGEgcHJvYmxlbS4uIGp1c3QgYmxpbmRseSBkb2luZyBhCmNvbnRhaW5lcl9vZiBvbiB0aGUgcGFn
ZS0+cGdtYXAgZG9lcyBzZWVtIGxpa2UgaXQgYXNzdW1lcyB0aGF0IG9ubHkKdGhpcyBkcml2ZXIg
aXMgdXNpbmcgREVWSUNFX1BSSVZBVEUuCgpJdCBzZWVtcyBsaWtlIHNvbWV0aGluZyBtaXNzaW5n
IGluIGhtbV9yYW5nZV9mYXVsdCwgaXQgc2hvdWxkIGJlIHRvbGQKd2hhdCBERVZJQ0VfUFJJVkFU
RSBpcyBhY2NlcHRhYmxlIHRvIHRyaWdnZXIgSE1NX1BGTl9ERVZJQ0VfUFJJVkFURQphbmQgZmF1
bHQgYWxsIG90aGVycz8KCkphc29uIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
