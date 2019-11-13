Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A886FC127
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BCF6E2E1;
	Thu, 14 Nov 2019 08:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00076.outbound.protection.outlook.com [40.107.0.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F9F6EDA8;
 Wed, 13 Nov 2019 16:46:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuJF2uvmN2yaL2t/MMpryfHz60uTA8upKzuaipHG8RbgMaWw+Gtlrv18/ToPDpVQQgI4M+KhFDZo7a9+fs+kLRJlVUy8CUVWFf07Jztael147XMDA6z/E0MtItAVvwhhm3sU3mychIO1mStAr7By5eWrLmMXpYvYRZPR/vuIJVpf50LM/zSV4lZmLkTFhFCVekrqVwRbKq+651wBR8jrF9qUlg2c02q36e6o9Mv0VkKCA9tfmoMs2x3Ad/pODLiGryedfqtFAanCbF1GwERdYDBERcLmZJN7GJnSYjVGVmxvbhKtiRXzHR9YKQH15seRg/obiuQJ1rrT2zYVQWf/lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbnENZcVRebv/iFmPDxhhM2imQ94Y3I4TeLpbYNHeII=;
 b=beWKSZ4zAAubURVsbWfaGBNBT7wHp1KylNJv2A1muv67tJd8TuJCj6omMc8Ld1ZxAksm5lefla7g2qeDZyKGPE/TDcCIHIW5YXBpyKZf8nIp6A9bYw5jkBDClOOv5z9nJyL+fl4i76r1drQcUsQqfIBPPO6JeRHEn+qnH3QTy+m/1XywgxzXuO8on532fk3zZ3GxPnky8NZWETmgyEsLMP5RucD/EQFeFI8hlPltqcAezDv0XPyrC/OpV0qC2Sb/thseiWKg6gGG4JlOdzZ32zxJhGpQTvdp9YpaFNXJlFenYVMZDiQ9D3kSvibFCELsSUV7RQC7XQ6PuSw7zYs0SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4624.eurprd05.prod.outlook.com (20.176.7.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.23; Wed, 13 Nov 2019 16:46:25 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2430.027; Wed, 13 Nov 2019
 16:46:25 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 02/14] mm/mmu_notifier: add an interval tree notifier
Thread-Topic: [PATCH v3 02/14] mm/mmu_notifier: add an interval tree notifier
Thread-Index: AQHVmZb2YQDWU76vNEuRDpxoc3xJraeJIg8AgAAugwA=
Date: Wed, 13 Nov 2019 16:46:24 +0000
Message-ID: <20191113164620.GG21728@mellanox.com>
References: <20191112202231.3856-1-jgg@ziepe.ca>
 <20191112202231.3856-3-jgg@ziepe.ca> <20191113135952.GB20531@infradead.org>
In-Reply-To: <20191113135952.GB20531@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR1101CA0010.namprd11.prod.outlook.com
 (2603:10b6:405:4a::20) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 41a0e8c0-89bb-43c2-e281-08d76859054d
x-ms-traffictypediagnostic: VI1PR05MB4624:
x-microsoft-antispam-prvs: <VI1PR05MB462449384838F815B46902A2CF760@VI1PR05MB4624.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0220D4B98D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(189003)(199004)(446003)(11346002)(2616005)(476003)(66066001)(386003)(486006)(186003)(102836004)(52116002)(33656002)(26005)(6506007)(76176011)(6512007)(66476007)(66556008)(64756008)(66446008)(81156014)(81166006)(4326008)(71190400001)(6246003)(71200400001)(8936002)(66946007)(6116002)(14444005)(3846002)(256004)(2906002)(229853002)(6436002)(6486002)(8676002)(25786009)(6916009)(7736002)(1076003)(305945005)(5660300002)(7416002)(478600001)(54906003)(316002)(99286004)(36756003)(14454004)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4624;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rrpWD1R1BMlPUpSs+o9RwczVXIunSTF9I87HA2n6H0asbRnvCtGbH7kTNXevBRN5UXRJ85ed/CoUa/GkxIDmlsNhT8/BFwQT8jYOx1pKML7KkJ7QLjQv8YTSlg00PMtLDr30fBD+oXvZjM0yrB+WvYQnHyXNBQcL/kJoAlyara7/H4vXFEKsVAXZtI15ikeFnPSewk+Z3WCo7pOn6moAVerZX4dVpwCQsoqH+XXDYsRjNDfKm3nQaePLJhy7J1oAQwStWOSnrPOLFKa+YPaprzqrw2ScXhi6mURMYWS83Aqx2M4+lmXNY+iNO0ScH9di3IQFHPpHUe8+jPdL1yL0x3TnbIHPatYMCA4yG1OoLtfYl6SDqE/hwA7/SwskvoBnVJogZ1R2ehmz+lRkP8CQ0lqlWf0cb5RUJpxws9Xmwxdt3a5Wuv7JEyhIcVEORD5E
x-ms-exchange-transport-forked: True
Content-ID: <677ADF67690D0A479A50627A2BA23A42@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a0e8c0-89bb-43c2-e281-08d76859054d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2019 16:46:25.0220 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ba94nU8rdIiqv94wJYo3wuHzhbwYz4DidvxEUagXnQ7vuBLqWh3vACBpecSu/wnrY8ZWsrUyClgrItanutUhSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4624
X-Mailman-Approved-At: Thu, 14 Nov 2019 08:07:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbnENZcVRebv/iFmPDxhhM2imQ94Y3I4TeLpbYNHeII=;
 b=UFSPn3nd+XeIYwNtlI6SmptfxCR5JdXzaLc4wM0qUj++bzoPOZPpLu1Avejfnm8mvboDwjPhHlzCYMNIf7TzmzLzx8jioy3KYKl7I8NB8q9t5jWbJDArEO6zG/GAoxAnKpAvtq/07Eh/HMH3cE+XwBNHFTn4SylCNrswWagvx1Q=
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Philip Yang <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Jerome Glisse <jglisse@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMDU6NTk6NTJBTSAtMDgwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gPiAraW50IG1tdV9pbnRlcnZhbF9ub3RpZmllcl9pbnNlcnQoc3RydWN0IG1t
dV9pbnRlcnZhbF9ub3RpZmllciAqbW5pLAo+ID4gKwkJCQkgICAgICBzdHJ1Y3QgbW1fc3RydWN0
ICptbSwgdW5zaWduZWQgbG9uZyBzdGFydCwKPiA+ICsJCQkJICAgICAgdW5zaWduZWQgbG9uZyBs
ZW5ndGgsCj4gPiArCQkJCSAgICAgIGNvbnN0IHN0cnVjdCBtbXVfaW50ZXJ2YWxfbm90aWZpZXJf
b3BzICpvcHMpOwo+ID4gK2ludCBtbXVfaW50ZXJ2YWxfbm90aWZpZXJfaW5zZXJ0X2xvY2tlZCgK
PiA+ICsJc3RydWN0IG1tdV9pbnRlcnZhbF9ub3RpZmllciAqbW5pLCBzdHJ1Y3QgbW1fc3RydWN0
ICptbSwKPiA+ICsJdW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBsZW5ndGgsCj4g
PiArCWNvbnN0IHN0cnVjdCBtbXVfaW50ZXJ2YWxfbm90aWZpZXJfb3BzICpvcHMpOwo+IAo+IFZl
cnkgaW5jb25zaXN0ZW50IGluZGVudGF0aW9uIGJldHdlZW4gdGhlc2UgdHdvIHJlbGF0ZWQgZnVu
Y3Rpb25zLgoKY2xhbmctZm9ybWF0Li4gVGhlIGtlcm5lbCBjb25maWcgaXMgc2V0IHRvIHByZWZl
ciBhIGxpbmUgdXAgdW5kZXIgdGhlCiggaWYgYWxsIHRoZSBhcmd1bWVudHMgd2lsbCBmaXQgd2l0
aGluIHRoZSA4MCBjb2xzIG90aGVyd2lzZSBpdCBkb2VzIGEKMSB0YWIgY29udGludWF0aW9uIGlu
ZGVudC4KCj4gPiArCS8qCj4gPiArCSAqIFRoZSBpbnZfZW5kIGluY29ycG9yYXRlcyBhIGRlZmVy
cmVkIG1lY2hhbmlzbSBsaWtlCj4gPiArCSAqIHJ0bmxfdW5sb2NrKCkuIEFkZHMgYW5kIHJlbW92
ZXMgYXJlIHF1ZXVlZCB1bnRpbCB0aGUgZmluYWwgaW52X2VuZAo+ID4gKwkgKiBoYXBwZW5zIHRo
ZW4gdGhleSBhcmUgcHJvZ3Jlc3NlZC4gVGhpcyBhcnJhbmdlbWVudCBmb3IgdHJlZSB1cGRhdGVz
Cj4gPiArCSAqIGlzIHVzZWQgdG8gYXZvaWQgdXNpbmcgYSBibG9ja2luZyBsb2NrIGR1cmluZwo+
ID4gKwkgKiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0Lgo+IAo+IE5pdHBpY2s6ICBUaGF0IGNvbW1l
bnQgY2FuIGJlIGNvbmRlbnNlZCBpbnRvIG9uZSBsZXNzIGxpbmU6CgpUaGUgcnRubF91bmxvY2sg
Y2FuIG1vdmUgdXAgYSBsaW5lIHRvby4gTXkgZWRpdG9yIGlzIGZhaWxpbmcgbWUgb24KdGhpcy4K
Cj4gPiArCS8qCj4gPiArCSAqIFRPRE86IFNpbmNlIHdlIGFscmVhZHkgaGF2ZSBhIHNwaW5sb2Nr
IGFib3ZlLCB0aGlzIHdvdWxkIGJlIGZhc3Rlcgo+ID4gKwkgKiBhcyB3YWtlX3VwX3EKPiA+ICsJ
ICovCj4gPiArCWlmIChuZWVkX3dha2UpCj4gPiArCQl3YWtlX3VwX2FsbCgmbW1uX21tLT53cSk7
Cj4gCj4gU28gd2h5IGlzIHRoaXMgaW1wb3J0YW50IGVub3VnaCBmb3IgYSBUT0RPIGNvbW1lbnQs
IGJ1dCBub3QgaW1wb3J0YW50Cj4gZW5vdWdoIHRvIGRvIHJpZ2h0IGF3YXk/CgpMZXRzIGRyb3Ag
dGhlIGNvbW1lbnQsIEknbSBub3RvIHN1cmUgd2FrZV91cF9xIGlzIGV2ZW4gYSBmdW5jdGlvbiB0
aGlzCmxheWVyIHNob3VsZCBiZSBjYWxsaW5nLgogCj4gPiArCSAqIHJlbGVhc2Ugc2VtYW50aWNz
IG9uIHRoZSBpbml0aWFsaXphdGlvbiBvZiB0aGUgbW11X25vdGlmaWVyX21tJ3MKPiA+ICsgICAg
ICAgICAqIGNvbnRlbnRzIGFyZSBwcm92aWRlZCBmb3IgdW5sb2NrZWQgcmVhZGVycy4gIGFjcXVp
cmUgY2FuIG9ubHkgYmUKPiA+ICsgICAgICAgICAqIHVzZWQgd2hpbGUgaG9sZGluZyB0aGUgbW1n
cmFiIG9yIG1tZ2V0LCBhbmQgaXMgc2FmZSBiZWNhdXNlIG9uY2UKPiA+ICsgICAgICAgICAqIGNy
ZWF0ZWQgdGhlIG1tdV9ub3RpZmlmZXJfbW0gaXMgbm90IGZyZWVkIHVudGlsIHRoZSBtbSBpcwo+
ID4gKyAgICAgICAgICogZGVzdHJveWVkLiAgQXMgYWJvdmUsIHVzZXJzIGhvbGRpbmcgdGhlIG1t
YXBfc2VtIG9yIG9uZSBvZiB0aGUKPiA+ICsgICAgICAgICAqIG1tX3Rha2VfYWxsX2xvY2tzKCkg
ZG8gbm90IG5lZWQgdG8gdXNlIGFjcXVpcmUgc2VtYW50aWNzLgo+ID4gIAkgKi8KPiAKPiBTb21l
IHNwYWNlcyBpbnN0ZWFkIG9mIHRhYnMgaGVyZS4KCkdvdCBpdAoKPiA+ICtzdGF0aWMgaW50IF9f
bW11X2ludGVydmFsX25vdGlmaWVyX2luc2VydCgKPiA+ICsJc3RydWN0IG1tdV9pbnRlcnZhbF9u
b3RpZmllciAqbW5pLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiA+ICsJc3RydWN0IG1tdV9ub3Rp
Zmllcl9tbSAqbW1uX21tLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ID4gKwl1bnNpZ25lZCBsb25n
IGxlbmd0aCwgY29uc3Qgc3RydWN0IG1tdV9pbnRlcnZhbF9ub3RpZmllcl9vcHMgKm9wcykKPiAK
PiBPZGQgaW5kZW50YXRpb24gLSB3ZSB1c3VhbGwgZG8gdHdvIHRhYnMgKG15IHByZWZlcmVuY2Up
IG9yIGFsaWduIGFmdGVyCj4gdGhlIG9wZW5pbmcgYnJhY2UuCgpUaGlzIGlzIG9uZSB0YWIuIEkg
ZG9uJ3QgdGhpbmsgb25lIHRhYiBpcyBvZGQsIGl0IHNlZW1zIHByZXR0eSBwb3B1bGFyCmV2ZW4g
anVzdCBpbiBtbS8uCgpCdXQgdHdvIHRhYnMgaXMgY29uc2lkZXJlZCB1c3VhbD8gSSBkaWRuJ3Qg
ZXZlbiBrbm93IHRoYXQuCgo+ID4gKyAqIFRoaXMgZnVuY3Rpb24gbXVzdCBiZSBwYWlyZWQgd2l0
aCBtbXVfaW50ZXJ2YWxfbm90aWZpZXJfaW5zZXJ0KCkuIEl0IGNhbm5vdCBiZQo+IAo+IGxpbmUg
PiA4MCBjaGFycy4KCmdvdCBpdCwgd2FzIG1pc3NlZCBkdXJpbmcgdGhlIHJlbmFtZQoKPiBPdGhl
cndpc2UgdGhpcyBsb29rcyBnb29kIGFuZCB2ZXJ5IHNpbWlsYXIgdG8gd2hhdCBJIHJldmlld2Vk
IGVhcmxpZXI6Cj4gCj4gUmV2aWV3ZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRl
PgoKVGhhbmtzIGEgYnVuY2gsIHlvdXIgY29tbWVudHMgaGF2ZSBiZWVuIHZlcnkgaGVscGZ1bCBv
biB0aGlzIHNlcmllcyEKCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
