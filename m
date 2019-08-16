Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B25579115C
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55E26EA3F;
	Sat, 17 Aug 2019 15:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40075.outbound.protection.outlook.com [40.107.4.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBB96E33B;
 Fri, 16 Aug 2019 12:30:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVbY7LfEyIJdNeTxiVNpjg8soOzSULsiAsikfD2l9OvWPAPsJ+0oVzFJS1cftDW2qA/mpSDSNxpgvjOOijtLml+HPTH31EfZ4mc8iw13JdEenpQuEBTtjTCZlOTV4sv9him9yJrDj+SYStL+0jf9Ys1StooogyeNzy09GmpA1pcEIL6A8+3YJskgae7cIXqsBytpp0zYwXRWvUCvwb24KWu1el/beKF+uCCO1BmSQihKSVXYmIhf2q1dyh4QEQGb3saUz/JEBPOmkgDGAZrhYO8bz9XP3i0syB1b7kshOuBmtjNJnCi00pO5QBHVaGde/4Xx32KJqIRhSg3lmB05bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOGQZa/y6vCI+3l18H11F+wGAQN87ScMAfVMnpsg3nY=;
 b=CjsaRoVKF6Tz9MC3LDWUHGJMPgbQVHINFVqPvlNkWW4nytdQR+CAJVNX0fNuHZs6eUj2VMAGtDbe6dz+quCOdGf4Uj+wGh47FD25Jz7coR125O2c85OBbdBhHPqHCor+KU2ZB7X97kYmg3XWwIJavs6Ewne9o1duASuQJIveHhVDw5+Sutituh0HDzllKJW9Kn3f6aPReZ4iRzaluXqIQJ72aOoeVsLqONOsr68Up7DhPBu+uVk/oZSYCGmQJSH0jbJoDVquyd0uZKWjy+Sao2vOCoFYgjYKGcsvh9LDuyyImOHTKVDQkCt0iPqsbuM66rpGBBMdZ0HKW13HA3nETQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5566.eurprd05.prod.outlook.com (20.177.202.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Fri, 16 Aug 2019 12:30:41 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7%6]) with mapi id 15.20.2178.016; Fri, 16 Aug 2019
 12:30:41 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
Thread-Topic: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
Thread-Index: AQHVTHDc5B4IgstYQk6yBJaVfn8xGqbv9wIAgAARNACAAMySgIAJE76AgABlPQCAAGF5AIAAFowAgAHIzYCAABojAIAAAd6AgAAIBgCAAAXLAIAAAlcAgAAC0YCAAECugIAAQ4sAgACCJQA=
Date: Fri, 16 Aug 2019 12:30:41 +0000
Message-ID: <20190816123036.GD5412@mellanox.com>
References: <CAPcyv4g8usp8prJ+1bMtyV1xuedp5FKErBp-N8+KzR=rJ-v0QQ@mail.gmail.com>
 <20190815180325.GA4920@redhat.com>
 <CAPcyv4g4hzcEA=TPYVTiqpbtOoS30ahogRUttCvQAvXQbQjfnw@mail.gmail.com>
 <20190815194339.GC9253@redhat.com>
 <CAPcyv4jid8_=-8hBpn_Qm=c4S8BapL9B9RGT7e9uu303yH=Yqw@mail.gmail.com>
 <20190815203306.GB25517@redhat.com> <20190815204128.GI22970@mellanox.com>
 <20190815205132.GC25517@redhat.com> <20190816004303.GC9929@mellanox.com>
 <20190816044448.GB4093@lst.de>
In-Reply-To: <20190816044448.GB4093@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQXPR01CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::19) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bd5ef0b-5722-4093-39be-08d722458d03
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5566; 
x-ms-traffictypediagnostic: VI1PR05MB5566:
x-microsoft-antispam-prvs: <VI1PR05MB5566068077F360917124F224CFAF0@VI1PR05MB5566.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(189003)(199004)(2616005)(102836004)(8936002)(53936002)(305945005)(14454004)(81166006)(476003)(256004)(81156014)(14444005)(446003)(11346002)(3846002)(54906003)(86362001)(6116002)(486006)(4326008)(71190400001)(7736002)(6512007)(316002)(6246003)(6486002)(8676002)(99286004)(33656002)(66476007)(6436002)(66946007)(64756008)(71200400001)(229853002)(66446008)(66556008)(25786009)(1076003)(6916009)(52116002)(2906002)(66066001)(7416002)(5660300002)(6506007)(386003)(186003)(26005)(76176011)(478600001)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5566;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cbtMLOKDHkHplr6hhrcZtSKlLmDw2akKVeqDRfj5uRjQzXoig2As00fytb5enTFhX6Yor0HdVC5wWEf/xvz+2PeKnFWUI86NvQd/nIldKd+KvZQG20/oX8Xx3L+QTX1fLSUJwkZ8sz9pZQrs7bj9t9B2T9sF2StUegHZV7lor5IRYr+JyLbUJbUsR+RUX01lszcr5XxGN/ap/HyvAAobJsurcn2YF3LkoVymgpQZiFPxC/4qkkw/QHpoQokG1RUpPMp/An8DV2or1XspigrHqgoh76c+YnLeaC7LTpyxEg/tgMHkcL+O/jFlWTSVZ9MR9CtEpM3bqrIOXJtWL4KZaAYxS5F87a34M5foGo3/ed3Ql/DpkwxylVQMorR6a6aKeCXC5ktQCam8uCHPnFlv7vj3qQfoPiwwxdLgmgdfiT4=
x-ms-exchange-transport-forked: True
Content-ID: <33BCB3B7F7923B46ACF944F8B7CA2B32@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd5ef0b-5722-4093-39be-08d722458d03
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 12:30:41.4268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V9JmvKbt/kiXAfkWhaUpDGrDmw4f2snpJK6AOcCsuJYW96hp+dl/L+IFDSr26v1DhPdnRx+tWPtbIbbsl39fKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5566
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOGQZa/y6vCI+3l18H11F+wGAQN87ScMAfVMnpsg3nY=;
 b=O3bneAOeqve822q6KQopRBAWXIgXfNrmGaioNsKSR37L+suIVuhdDthAlZZ1p+CZB/c6gaK725QSZkgAONJA7EOLUw6/0SuiDRwuDs9Z1Ag0LpYEQhV1+tIQveTx/onjPKfZfwtUZzH3IchxAvVcDOSfr6eOXzLqLSSaLjAbwxw=
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
 Ben Skeggs <bskeggs@redhat.com>, Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDY6NDQ6NDhBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMTI6NDM6MDdBTSArMDAwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDQ6NTE6MzNQ
TSAtMDQwMCwgSmVyb21lIEdsaXNzZSB3cm90ZToKPiA+IAo+ID4gPiBzdHJ1Y3QgcGFnZS4gSW4g
dGhpcyBjYXNlIGFueSB3YXkgd2UgY2FuIHVwZGF0ZSB0aGUKPiA+ID4gbm91dmVhdV9kbWVtX3Bh
Z2UoKSB0byBjaGVjayB0aGF0IHBhZ2UgcGFnZS0+cGdtYXAgPT0gdGhlCj4gPiA+IGV4cGVjdGVk
IHBnbWFwLgo+ID4gCj4gPiBJIHdhcyBhbHNvIHdvbmRlcmluZyBpZiB0aGF0IGlzIGEgcHJvYmxl
bS4uIGp1c3QgYmxpbmRseSBkb2luZyBhCj4gPiBjb250YWluZXJfb2Ygb24gdGhlIHBhZ2UtPnBn
bWFwIGRvZXMgc2VlbSBsaWtlIGl0IGFzc3VtZXMgdGhhdCBvbmx5Cj4gPiB0aGlzIGRyaXZlciBp
cyB1c2luZyBERVZJQ0VfUFJJVkFURS4KPiA+IAo+ID4gSXQgc2VlbXMgbGlrZSBzb21ldGhpbmcg
bWlzc2luZyBpbiBobW1fcmFuZ2VfZmF1bHQsIGl0IHNob3VsZCBiZSB0b2xkCj4gPiB3aGF0IERF
VklDRV9QUklWQVRFIGlzIGFjY2VwdGFibGUgdG8gdHJpZ2dlciBITU1fUEZOX0RFVklDRV9QUklW
QVRFCj4gPiBhbmQgZmF1bHQgYWxsIG90aGVycz8KPiAKPiBUaGUgd2hvbGUgZGV2aWNlIHByaXZh
dGUgaGFuZGxpbmcgaW4gaG1tIGFuZCBtaWdyYXRlX3ZtYSBzZWVtcyBwcmV0dHkKPiBicm9rZW4g
YXMgZmFyIGFzIEkgY2FuIHRlbGwsIGFuZCBJIGhhdmUgc29tZSBXSVAgcGF0Y2hlcy4gIEJhc2lj
YWxseSB3ZQo+IHNob3VsZCBub3QgdG91Y2ggKG9yIHBvc3NpYmx5IGV2ZW50dWFsbHkgY2FsbCBt
aWdyYXRlIHRvIHJhbSBldmVudHVhbGx5Cj4gaW4gdGhlIGZ1dHVyZSkgZGV2aWNlIHByaXZhdGUg
cGFnZXMgbm90IG93bmVkIGJ5IHRoZSBjYWxsZXIsIHdoZXJlIEkKPiB0cnkgdG8gZGVmaW5lZCB0
aGUgY2FsbGVyIGJ5IHRoZSBkZXZfcGFnZW1hcF9vcHMgaW5zdGFuY2UuICAKCkkgdGhpbmsgaXQg
bmVlZHMgdG8gYmUgbW9yZSBlbGFib3JhdGUuCgpGb3IgaW5zdGFuY2UsIGEgc3lzdGVtIG1heSBo
YXZlIG11bHRpcGxlIERFVklDRV9QUklWQVRFIG1hcCdzIG93bmVkIGJ5CnRoZSBzYW1lIGRyaXZl
ciAtIGJ1dCBtdWx0aXBsZSBwaHlzaWNhbCBkZXZpY2VzIHVzaW5nIHRoYXQgZHJpdmVyLgoKRWFj
aCBwaHlzaWNhbCBkZXZpY2UncyBkcml2ZXIgc2hvdWxkIG9ubHkgZXZlciBnZXQgREVWSUNFX1BS
SVZBVEUKcGFnZXMgZm9yIGl0J3Mgb3duIG9uLWRldmljZSBtZW1vcnkuIE5ldmVyIGEgREVWSUNF
X1BSSVZBVEUgZm9yCmFub3RoZXIgZGV2aWNlJ3MgbWVtb3J5LgoKVGhlIGRldl9wYWdlbWFwX29w
cyB3b3VsZCBub3QgYmUgdW5pcXVlIGVub3VnaCwgcmlnaHQ/CgpQcm9iYWJseSBhbHNvIGNsdXN0
ZXJzIG9mIHNhbWUtZHJpdmVyIHN0cnVjdCBkZXZpY2UgY2FuIHNoYXJlIGEKREVWSUNFX1BSSVZB
VEUsIGF0IGxlYXN0IGhpZ2ggZW5kIEdQVSdzIG5vdyBoYXZlIHByaXZhdGUgbWVtb3J5CmNvaGVy
ZW5jeSBidXNzZXMgYmV0d2VlbiB0aGVpciBkZXZpY2VzLgoKU2luY2Ugd2Ugd2FudCB0byB0cmln
Z2VyIG1pZ3JhdGlvbiB0byBDUFUgb24gaW5jb21wYXRpYmxlCkRFVklDRV9QUklWQVRFIHBhZ2Vz
LCBpdCBzZWVtcyBiZXN0IHRvIHNvcnQgdGhpcyBvdXQgaW4gdGhlCmhtbV9yYW5nZV9mYXVsdD8K
Ck1heWJlIHNvbWUgc29ydCBvZiB1bmlxdWUgSUQgaW5zaWRlIHRoZSBwYWdlLT5wZ21hcCBhbmQg
cGFzc2VkIGFzCmlucHV0PwoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
