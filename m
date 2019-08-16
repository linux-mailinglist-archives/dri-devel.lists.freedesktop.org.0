Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAB79117F
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF076EAFC;
	Sat, 17 Aug 2019 15:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130040.outbound.protection.outlook.com [40.107.13.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F272B6E2EC;
 Fri, 16 Aug 2019 00:41:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5p5CyHIUzCSSrJeO5uAsNtQcuzopr5mlYvO7SaFWLvj6XNGZKgKTGE48KfCEa2N4D4o7mR9bOrSURSTzT1KqB/O6QGXOmAbCDOjDRTw6l8IFa10o+RpoRaACg1sLe8BCXVATQR9w1/ZrXvjgyJj5RbliEgffVwzmfyLN9sHjygqHlKDClDuD9V2v5LjTXz6EvnOHwR547dLVoQoyh/c4wmZBdP1an7Rv1vX4/CY7GvEXL4atH7EIINkcthLlMwKqlHcFYiilLBdmLzsqF/oiHz/mKIstTRlxZG1ar1hgjPCkTuYwt9tLwZViN6efTPZKAwrhzjGNk5Q9+EFEJ8YIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DCteYehywwepGi3ED0xAnMez/BPDSTPzccywWA4yww=;
 b=AvYD0vXWJKfOs4T6CeuPKuKH7ZV0RwheCUdDIS3L/FfBFOj40xPRRwzekasiJV7w3WcoptO9PuWaRvCeaP0aBVbPeDDLzHhOOkyf6yBg7x1J9Ia64bf5EoUAYaxnzMDq5WEKPSZVJD1UHnpQrqJzin8dv89KT34eGkqbh9LK49gE0eV0LOakUs+pAiA1NruXLOwVRzWwtRY6PMhF3y6jSWVOnIpq7HtFc5gZPWZjMlvRShvUPC3UsU4roPLB33QADoQ9JBr4ZztQdQ3m4AVhzHDwi3UhTXG7IzXx2W2cYf7q1b8U1h38IcaOt0m13vBphM1nbF8m/sCXKYO2MUunEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB3279.eurprd05.prod.outlook.com (10.170.238.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Fri, 16 Aug 2019 00:40:59 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7%6]) with mapi id 15.20.2178.016; Fri, 16 Aug 2019
 00:40:59 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
Thread-Topic: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
Thread-Index: AQHVTHDc5B4IgstYQk6yBJaVfn8xGqbv9wIAgAARNACAAMySgIAJE76AgABlPQCAAGF5AIAAFowAgAHIzYCAABojAIAAAd6AgAAIBgCAAAXLAIAAAlcAgAABmgCAAEFKgA==
Date: Fri, 16 Aug 2019 00:40:59 +0000
Message-ID: <20190816004053.GB9929@mellanox.com>
References: <20190814073854.GA27249@lst.de>
 <20190814132746.GE13756@mellanox.com>
 <CAPcyv4g8usp8prJ+1bMtyV1xuedp5FKErBp-N8+KzR=rJ-v0QQ@mail.gmail.com>
 <20190815180325.GA4920@redhat.com>
 <CAPcyv4g4hzcEA=TPYVTiqpbtOoS30ahogRUttCvQAvXQbQjfnw@mail.gmail.com>
 <20190815194339.GC9253@redhat.com>
 <CAPcyv4jid8_=-8hBpn_Qm=c4S8BapL9B9RGT7e9uu303yH=Yqw@mail.gmail.com>
 <20190815203306.GB25517@redhat.com> <20190815204128.GI22970@mellanox.com>
 <CAPcyv4j_Mxbw+T+yXTMdkrMoS_uxg+TXXgTM_EPBJ8XfXKxytA@mail.gmail.com>
In-Reply-To: <CAPcyv4j_Mxbw+T+yXTMdkrMoS_uxg+TXXgTM_EPBJ8XfXKxytA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: QB1PR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::38) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48ab5d75-3260-47fe-b49d-08d721e2687c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB3279; 
x-ms-traffictypediagnostic: VI1PR05MB3279:
x-microsoft-antispam-prvs: <VI1PR05MB32794213CD975963896AA3DACFAF0@VI1PR05MB3279.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39850400004)(366004)(396003)(189003)(199004)(66446008)(486006)(99286004)(2616005)(53936002)(25786009)(186003)(446003)(14444005)(4326008)(26005)(66066001)(8936002)(8676002)(81166006)(476003)(2906002)(102836004)(64756008)(66556008)(3846002)(478600001)(14454004)(11346002)(229853002)(81156014)(66476007)(76176011)(6506007)(6116002)(66946007)(53546011)(6246003)(386003)(52116002)(5660300002)(36756003)(305945005)(256004)(7416002)(54906003)(316002)(6486002)(71200400001)(6512007)(33656002)(71190400001)(1076003)(7736002)(6916009)(86362001)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3279;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jfEAVKwFz/MvuL5Yv2GDjifxERHWFDe6gBLNd+J25D5NpBSauEkNA8yNv4+MZirIFoblvGPuYn4Tj5CKr/9wH56+TsRiDCS++jbNgzdHuf357I27fFnBrQlui1i+ZiNhrFE4fvNtJT1NlRR8F/yWkowfXOCFSzblkkTvM6JMD0r92xWAB6RjDAX1tBeu4wsqDwFeQ6pSE79u156F8mt73M2y94dnmaHCgTqAu4z3DPfek136evzwu71yvJ1KKqFhRX3OkSEjponHiIRCFySkio5z/xhWjCYnmSXpt+3DR3awLSLc4nDT5DvKK4x73NoWr4bajLE6hGukcf7Yp7WpuJNVgwO5FD/eq7ea2lkCE5Lc2EO4CCW/KQWJ7TS0YYGrH1HgKCSifuF6PdAx3+Ag3rKwnvT/f5y7T5iB0E9KB8c=
x-ms-exchange-transport-forked: True
Content-ID: <3D79975E0C234F4AAD41952D46D8C404@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ab5d75-3260-47fe-b49d-08d721e2687c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 00:40:59.7212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hUbQDpyF0WzOBvhLO6eBjmGh091kuoW/E+52nuO+owpipVj1DklJhY16uuhLK4mHl/TqiQWO6ZuwNFRShD370A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3279
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DCteYehywwepGi3ED0xAnMez/BPDSTPzccywWA4yww=;
 b=FhCr1UIV3ufrdsOmXQHr4EkLsItfBSUflgC7s3Kfy/I74C6KhwTGF3qfnc+n/idaSUS4kqmjHgf4+JLBzBHgNvHNTNxyiJyeF2iz3MB1jsMRK9hKwC311p3QfGRHyH5+VpRQa/S9UknfO5KkPZZMy91RENGDuLiZKFLkYu0KqXc=
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDE6NDc6MTJQTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDE6NDEgUE0gSmFzb24gR3VudGhvcnBlIDxq
Z2dAbWVsbGFub3guY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAw
NDozMzowNlBNIC0wNDAwLCBKZXJvbWUgR2xpc3NlIHdyb3RlOgo+ID4KPiA+ID4gU28gbm9yIEhN
TSBub3IgZHJpdmVyIHNob3VsZCBkZXJlZmVyZW5jZSB0aGUgc3RydWN0IHBhZ2UgKGkgZG8gbm90
Cj4gPiA+IHRoaW5rIGFueSBpb21tdSBkcml2ZXIgd291bGQgZWl0aGVyKSwKPiA+Cj4gPiBFciwg
dGhleSBkbyB0ZWNobmljYWxseSBkZXJlZiB0aGUgc3RydWN0IHBhZ2U6Cj4gPgo+ID4gbm91dmVh
dV9kbWVtX2NvbnZlcnRfcGZuKHN0cnVjdCBub3V2ZWF1X2RybSAqZHJtLAo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQo+ID4gICAgICAgICAgICAg
ICAgIHN0cnVjdCBwYWdlICpwYWdlOwo+ID4gICAgICAgICAgICAgICAgIHBhZ2UgPSBobW1fcGZu
X3RvX3BhZ2UocmFuZ2UsIHJhbmdlLT5wZm5zW2ldKTsKPiA+ICAgICAgICAgICAgICAgICBpZiAo
IW5vdXZlYXVfZG1lbV9wYWdlKGRybSwgcGFnZSkpIHsKPiA+Cj4gPgo+ID4gbm91dmVhdV9kbWVt
X3BhZ2Uoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sIHN0cnVjdCBwYWdlICpwYWdlKQo+ID4gewo+
ID4gICAgICAgICByZXR1cm4gaXNfZGV2aWNlX3ByaXZhdGVfcGFnZShwYWdlKSAmJiBkcm0tPmRt
ZW0gPT0gcGFnZV90b19kbWVtKHBhZ2UpCj4gPgo+ID4KPiA+IFdoaWNoIGRvZXMgdG91Y2ggJ3Bh
Z2UtPnBnbWFwJwo+ID4KPiA+IElzIHRoaXMgT0sgd2l0aG91dCBoYXZpbmcgYSBnZXRfZGV2X3Bh
Z2VtYXAoKSA/Cj4gPgo+ID4gTm90aW5nIHRoYXQgdGhlIGNvbGxpc2lvbi1yZXRyeSBzY2hlbWUg
ZG9lc24ndCBwcm90ZWN0IGFueXRoaW5nIGhlcmUKPiA+IGFzIHdlIGNhbiBoYXZlIGEgY29uY3Vy
cmVudCBpbnZhbGlkYXRpb24gd2hpbGUgZG9pbmcgdGhlIGFib3ZlIGRlcmVmLgo+IAo+IEFzIGxv
bmcgdGFrZV9kcml2ZXJfcGFnZV90YWJsZV9sb2NrKCkgaW4gSmVyb21lJ3MgZmxvdyBjYW4gcmVw
bGFjZQo+IHBlcmNwdV9yZWZfdHJ5Z2V0X2xpdmUoKSBvbiB0aGUgcGFnZW1hcCByZWZlcmVuY2Uu
IEl0IHNlZW1zCj4gbm91dmVhdV9kbWVtX2NvbnZlcnRfcGZuKCkgaGFwcGVucyBhZnRlcjoKPgo+
ICAgICAgICAgICAgICAgICAgICAgICAgIG11dGV4X2xvY2soJnN2bW0tPm11dGV4KTsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICBpZiAoIW5vdXZlYXVfcmFuZ2VfZG9uZSgmcmFuZ2UpKSB7Cj4g
Cj4gLi4uc28gSSB3b3VsZCBleHBlY3QgdGhhdCB0byBiZSBmdW5jdGlvbmFsbHkgZXF1aXZhbGVu
dCB0byB2YWxpZGF0aW5nCj4gdGhlIHJlZmVyZW5jZSBjb3VudC4KClllcywgT0ssIHRoYXQgbWFr
ZXMgc2Vuc2UsIEkgd2FzIG1vc3RseSBzdXJwcmlzZWQgYnkgdGhlIHN0YXRlbWVudCB0aGUKZHJp
dmVyIGRvZXNuJ3QgdG91Y2ggdGhlIHN0cnVjdCBwYWdlLi4gCgpJIHN1cHBvc2UgImRvZXNuJ3Qg
dG91Y2ggdGhlIHN0cnVjdCBwYWdlIG91dCBvZiB0aGUgZHJpdmVyIGxvY2siIGlzCnRoZSBjYXNl
LgoKSG93ZXZlciwgdGhpcyBtZWFucyB3ZSBjYW5ub3QgZG8gYW55IHByb2Nlc3Npbmcgb2YgWk9O
RV9ERVZJQ0UgcGFnZXMKb3V0c2lkZSB0aGUgZHJpdmVyIGxvY2ssIHNvIGVnLCBkb2luZyBhbnkg
RE1BIG1hcCB0aGF0IG1pZ2h0IHJlbHkgb24KTUVNT1JZX0RFVklDRV9QQ0lfUDJQRE1BIGhhcyB0
byBiZSBkb25lIGluIHRoZSBkcml2ZXIgbG9jaywgd2hpY2ggaXMKYSBiaXQgdW5mb3J0dW5hdGUu
CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
