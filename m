Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C7D91185
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDC96EA9B;
	Sat, 17 Aug 2019 15:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150047.outbound.protection.outlook.com [40.107.15.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CCF8915F;
 Fri, 16 Aug 2019 12:24:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idY1cyXaUHBt1HWm5F512v9X+MSs7CDkVZwMy93Ftnm+UXINrGS/jHsKvzBBYqMpKKoq/A06i5RSxZXhJZi3y934iyIbDQov6M0YunnmHDwy6nEEw9IYqHgVdtq0AFxXn8vHa+e9F06Jr2xA8fxjsnVgXT5zTfN8hyt6ORXXr7MPh7Irl6+7Fq+3oJtNjIxf5Ylt78YrcZIDIPq1kYjxatG43KwTAoXNw6wResGyo0/eL5m/pmTFA6z9re3pMwPwtrv062pmxlhA3F2auLP+oZklGISbjej4zhSvU1u/Z9jXbeUvgf5BjwGNxyDqCZUybQtHM3rRpYzom9shsyx8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJYIOE5xJym+70NFJ7KIu6ayqkfMtXmLpVUuEXah5/w=;
 b=VG08dlcKcXO/Qi42XyZ0xpALa4cGJuV5y8CnM2akeQN75jUiF9+AGpR5xcRYv95+8RXtJYJZj7AYhxGhKeJ/gCW6uMLx2fpF7KcuhvSReh7Kwh0LMEVyHk7ohfEl5JpKmxhlvusv8G7PJ+EmxoZiBxP+qNzINEfFPtXebTVHzLeykImelFIhm988dBl918+ZHw7d3yHRwIIN4Vc+IZQcmaRfpYP7H75LuykmzHj08kO0j65OIw1/DQGJwLNRPJqxao3eTiO+Us7uztTVUZu+Jo91OYm/bxu9ljhi3sqQbfo6bg130ena+2iE65zP3/PWTe9c5gzLqswtp2CXBh+Rtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5616.eurprd05.prod.outlook.com (20.177.203.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 16 Aug 2019 12:24:25 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7%6]) with mapi id 15.20.2178.016; Fri, 16 Aug 2019
 12:24:25 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
Thread-Topic: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
Thread-Index: AQHVTHDc5B4IgstYQk6yBJaVfn8xGqbv9wIAgAARNACAAMySgIAJE76AgABlPQCAAGF5AIAAFowAgAHIzYCAABojAIAAAd6AgAAIBgCAAAXLAIAAAlcAgAABmgCAAEFKgIAANiwAgACOWAA=
Date: Fri, 16 Aug 2019 12:24:25 +0000
Message-ID: <20190816122414.GC5412@mellanox.com>
References: <CAPcyv4g8usp8prJ+1bMtyV1xuedp5FKErBp-N8+KzR=rJ-v0QQ@mail.gmail.com>
 <20190815180325.GA4920@redhat.com>
 <CAPcyv4g4hzcEA=TPYVTiqpbtOoS30ahogRUttCvQAvXQbQjfnw@mail.gmail.com>
 <20190815194339.GC9253@redhat.com>
 <CAPcyv4jid8_=-8hBpn_Qm=c4S8BapL9B9RGT7e9uu303yH=Yqw@mail.gmail.com>
 <20190815203306.GB25517@redhat.com> <20190815204128.GI22970@mellanox.com>
 <CAPcyv4j_Mxbw+T+yXTMdkrMoS_uxg+TXXgTM_EPBJ8XfXKxytA@mail.gmail.com>
 <20190816004053.GB9929@mellanox.com>
 <CAPcyv4gMPVmY59aQAT64jQf9qXrACKOuV=DfVs4sNySCXJhkdA@mail.gmail.com>
In-Reply-To: <CAPcyv4gMPVmY59aQAT64jQf9qXrACKOuV=DfVs4sNySCXJhkdA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::20) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3c6da16-b7de-485f-133b-08d72244acd8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5616; 
x-ms-traffictypediagnostic: VI1PR05MB5616:
x-microsoft-antispam-prvs: <VI1PR05MB5616D7ED42010F9241692F0ECFAF0@VI1PR05MB5616.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(189003)(199004)(2616005)(86362001)(6512007)(7736002)(6506007)(386003)(305945005)(2906002)(229853002)(66066001)(14454004)(71190400001)(71200400001)(66446008)(6436002)(5660300002)(66476007)(66556008)(64756008)(6486002)(66946007)(1076003)(36756003)(4744005)(25786009)(186003)(4326008)(26005)(6246003)(316002)(6916009)(7416002)(102836004)(53936002)(6116002)(52116002)(54906003)(3846002)(33656002)(81156014)(478600001)(81166006)(76176011)(256004)(476003)(8676002)(14444005)(11346002)(8936002)(99286004)(446003)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5616;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aZkmehug+5+JEN4NslXVQoRL/lddKLVuZ56xnkoNM3mlRRM1iDYg8giyqCQ+rqsv3+JshkTMAS3W9U5LeI0HRqKsl1S43Zr3qE/O8ZBVVejOdMMq/D3Fu7xar2O05Yd1rredEABw5axv05P68WM9dv4EMVs7jJTKAe75+OuQ3yM+9MdtMXLOxrWnVry1XlsQZK/kmixAE7cq8G8XEkeHvtrHxSowtp7jwHb5bzLjoCcZTXZZjY67/P8Z74kO5Eo8LDfrECJeDuSh/RMnHNAEI1SkSuUUx+oRLLawpH9cUmYYJ91CfY+SriVH1DF7yMLtxf/WW/h6JKE2U/rpBCnAZ0Gg1V/xfW6MKCaqjHbeJZ/Fh9nbRdaknFcai1YxdKW0bzIGXnhfU9lp4+qaaE6DUb1fRfiEh6HP5HnadKjK//A=
x-ms-exchange-transport-forked: True
Content-ID: <43A39A5E1EC938439754F1B9A3ACBE6E@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c6da16-b7de-485f-133b-08d72244acd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 12:24:25.0995 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YUpYwR+jJSKkQAfrI6Lp3gtkUg6E4Ru4V3xRN9XHkNq4GC0s2myrtBg/xfBZTdyh6DDEyWa6d1rPzxxK5bG/5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5616
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJYIOE5xJym+70NFJ7KIu6ayqkfMtXmLpVUuEXah5/w=;
 b=nCS9yH6R06H9jKAK563o7ttlvecERk82fYLTPybQtdSlsj6+xe9ltE5PDwDHt39aje1zcudua4MNiEGrcJcQrSf1dTu7m8frYyQ5ir57kAFrnPE2Du06emvb7UGwh71U9MeIoE00h9WyFmlTg0Tpi3mZepahPXn56h2rlza8fxQ=
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDg6NTQ6NDZQTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgoKPiA+IEhvd2V2ZXIsIHRoaXMgbWVhbnMgd2UgY2Fubm90IGRvIGFueSBwcm9jZXNzaW5n
IG9mIFpPTkVfREVWSUNFIHBhZ2VzCj4gPiBvdXRzaWRlIHRoZSBkcml2ZXIgbG9jaywgc28gZWcs
IGRvaW5nIGFueSBETUEgbWFwIHRoYXQgbWlnaHQgcmVseSBvbgo+ID4gTUVNT1JZX0RFVklDRV9Q
Q0lfUDJQRE1BIGhhcyB0byBiZSBkb25lIGluIHRoZSBkcml2ZXIgbG9jaywgd2hpY2ggaXMKPiA+
IGEgYml0IHVuZm9ydHVuYXRlLgo+IAo+IFdvdWxkbid0IFAyUERNQSB1c2UgcGFnZSBwaW5zPyBO
b3QgbmVlZGluZyB0byBob2xkIGEgbG9jayBvdmVyCj4gWk9ORV9ERVZJQ0UgcGFnZSBvcGVyYXRp
b25zIHdhcyBvbmUgb2YgdGhlIG1vdGl2YXRpb25zIGZvciBwbHVtYmluZwo+IGdldF9kZXZfcGFn
ZW1hcCgpIHdpdGggYSBwZXJjcHUtcmVmLgoKaG1tX3JhbmdlX2ZhdWx0KCkgZG9lc24ndCB1c2Ug
cGFnZSBwaW5zIGF0IGFsbCwgc28gaWYgYSBaT05FX0RFVklDRQpwYWdlIGNvbWVzIG91dCBvZiBp
dCB0aGVuIGl0IG5lZWRzIHRvIHVzZSBhbm90aGVyIGxvY2tpbmcgcGF0dGVybi4KCklmIEkgZm9s
bG93IGl0IGFsbCByaWdodDoKCldlIGNhbiBkbyBhIGdldF9kZXZfcGFnZW1hcCBpbnNpZGUgdGhl
IHBhZ2Vfd2FsayBhbmQgdG91Y2ggdGhlIHBnbWFwLApvciB3ZSBjYW4gZG8gdGhlICdkZXZpY2Ug
bXV0ZXggJiYgcmV0cnknIHBhdHRlcm4gYW5kIHRvdWNoIHRoZSBwZ21hcAppbiB0aGUgZHJpdmVy
LCB1bmRlciB0aGF0IGxvY2suCgpIb3dldmVyIGluIGFsbCBjYXNlcyB0aGUgY3VycmVudCBnZXRf
ZGV2X3BhZ2VtYXAoKSdzIGluIHRoZSBwYWdlIHdhbGsKYXJlIG5vdCBuZWNlc3NhcnksIGFuZCB3
ZSBjYW4gZGVsZXRlIHRoZW0uCgo/CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
