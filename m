Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D792F7BA50
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5536E68A;
	Wed, 31 Jul 2019 07:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30069.outbound.protection.outlook.com [40.107.3.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D924D6E5EE;
 Tue, 30 Jul 2019 17:50:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NsPQkWCgQA2A332qXYrkylLMXCuD2+29/O5ZmJgtMktkNxXU9bO1674b5pES+/3quJkdu/Z00z1Vd8e2r0SaOr1kHHMsoAbM7gf+XJx8NgiWqkifbxSXNuXPZ/JPIH2JSz7uuATT9gt12HQC4P6LHDxgR4GDCvvwoaHXsTcLdZSSkXjl8GiMpXauwEKuyo3/rRY41/ymfECZzZdEvj0AFQyYNEFhQaW9tHZF0SYDo0p6EOYzNrkSEB0YmURFZdyrzdPPtrIE3qktUaiZp2nZZMDPRyG0K+3PZhSyFMRaKxz7tC7Fw7T87B9tDBmbtcsmDSbdGbHQrT5/oyOIPBU2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZZP4+A/TZaxgN3zEx0MeeBZBIZ602To4vmuVwuqZvE=;
 b=oJc085LRKyrUemzH0vYba/WJm5frbPvqj1uFPalUHH5M3Ni4AWWo5dsU3rGfev2w9FkWdEAA0yvAwOMl8eXrgb8qHhQzW9AsA1n3sN829aR2iDxcRvInAiLZTvYKoYFqzZuCZA++6VfqUkLonmjsAm5BMyZYhsPVq7NFD8WnL6In46tPP95aD8CheShgINFa/LshABfA3WEhDCNsf0gfCOrp24FXcZyx5INRV/PwZP3L2ni/EhwCde/cu5YPgB+7XaRt6hc6OrEED9OhfOH0LFp25mxSQRFJQDJBPF7XljK07RVFCGJt7bZu8NVoJ2nPXrMiKNBUtfqSSe7viEgA2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6414.eurprd05.prod.outlook.com (20.179.27.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 17:50:16 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 17:50:16 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 07/13] mm: remove the page_shift member from struct
 hmm_range
Thread-Topic: [PATCH 07/13] mm: remove the page_shift member from struct
 hmm_range
Thread-Index: AQHVRpr/I9wxeKeChkuG0OEJhB2jNabjHtYAgAAFZQCAAE0GgA==
Date: Tue, 30 Jul 2019 17:50:16 +0000
Message-ID: <20190730175011.GL24038@mellanox.com>
References: <20190730055203.28467-1-hch@lst.de>
 <20190730055203.28467-8-hch@lst.de> <20190730125512.GF24038@mellanox.com>
 <20190730131430.GC4566@lst.de>
In-Reply-To: <20190730131430.GC4566@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQXPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::30) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c1699fe-0d84-4dfe-8b52-08d71516614c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6414; 
x-ms-traffictypediagnostic: VI1PR05MB6414:
x-microsoft-antispam-prvs: <VI1PR05MB64144959A16828D401397E56CFDC0@VI1PR05MB6414.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(51444003)(189003)(199004)(386003)(2906002)(66556008)(66446008)(64756008)(76176011)(478600001)(14444005)(486006)(1076003)(86362001)(66946007)(71190400001)(7416002)(446003)(305945005)(7736002)(68736007)(53936002)(66066001)(6512007)(2616005)(71200400001)(6506007)(11346002)(476003)(66476007)(5660300002)(81166006)(186003)(52116002)(6436002)(6246003)(256004)(8936002)(36756003)(6486002)(8676002)(3846002)(4326008)(102836004)(229853002)(25786009)(26005)(316002)(81156014)(6116002)(33656002)(54906003)(99286004)(6916009)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6414;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: e+zU7fci+K1WDyo6Q7hyPxNzVC3a1Cb9hpT7qlJ1qJpCXrFC3VtM51Y0I69imVKk4fgjJB7oQUPYCaj0oGkiNvhRo9DvuJT91Yc5aX05k8sag9F7jzPoWwJCu4aO+XyotRagRgrIj+GCkoPsRWbxMPy9BR5hnlEyQGY42NO5Lu8Wsx1f6H9EpaAoQ6IOF09vTR8qj0zQqjSnmXuTNDbw+M29Ntz/7pTbF8uGbPwqO2DryQ3HnmKU4l2bAA5VGNMywD5RGW1xAci5zwUE7GGoJUukn93HCclZX5bSi+scnsV1HHnw75KA2inlIHuzlJLyakPA8CIs/y/NkyO9hds9mcQAVQmybvchUOvzgE79XJk+bPWOWbqyRXn8cko7e/Oy+Hd6NmvTUJkcMq0pRxMEUJabfY7srFIgyaatgI1/QSQ=
Content-ID: <C2F97CE8AB885F42907BDBA1823FEA57@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1699fe-0d84-4dfe-8b52-08d71516614c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 17:50:16.4913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6414
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZZP4+A/TZaxgN3zEx0MeeBZBIZ602To4vmuVwuqZvE=;
 b=CdhlAQfu+RJBdJMFzZgnUUpI5bQZ6lWavR96DlWB6u3gs9gMAL1l69olau9vdC6JJPUZMAMsvXch9t1ry0zM+HqqJfT0+UMZwE7RZYe1LBRrRHRQmAaiOCMKx/cM3lBEpIllErpb1N30jV5tsrHq61hd5mDZw7DmmZniLq1i6KQ=
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDM6MTQ6MzBQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMTI6NTU6MTdQTSArMDAwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gSSBzdXNwZWN0IHRoaXMgd2FzIGFkZGVkIGZvciB0aGUg
T0RQIGNvbnZlcnNpb24gdGhhdCBkb2VzIHVzZSBib3RoCj4gPiBwYWdlIHNpemVzLiBJIHRoaW5r
IHRoZSBPRFAgY29kZSBmb3IgdGhpcyBpcyBraW5kIG9mIGJyb2tlbiwgYnV0IEkKPiA+IGhhdmVu
J3QgZGVsdmVkIGludG8gdGhhdC4uCj4gPiAKPiA+IFRoZSBjaGFsbGVuZ2UgaXMgdGhhdCB0aGUg
ZHJpdmVyIG5lZWRzIHRvIGtub3cgd2hhdCBwYWdlIHNpemUgdG8KPiA+IGNvbmZpZ3VyZSB0aGUg
aGFyZHdhcmUgYmVmb3JlIGl0IGRvZXMgYW55IHJhbmdlIHN0dWZmLgo+ID4gCj4gPiBUaGUgb3Ro
ZXIgY2hhbGxlbmdlIGlzIHRoYXQgdGhlIEhXIGlzIGNvbmZpZ3VyZWQgdG8gZG8gb25seSBvbmUg
cGFnZQo+ID4gc2l6ZSwgYW5kIGlmIHRoZSB1bmRlcmx5aW5nIENQVSBwYWdlIHNpZGUgY2hhbmdl
cyBpdCBnb2VzIHNvdXRoLgo+ID4gCj4gPiBXaGF0IEkgd291bGQgcHJlZmVyIGlzIGlmIHRoZSBk
cml2ZXIgY291bGQgc29tZWhvdyBkeW5hbWljYWxseSBhZGp1c3QKPiA+IHRoZSB0aGUgcGFnZSBz
aXplIGFmdGVyIGVhY2ggZG1hIG1hcCwgYnV0IEkgZG9uJ3Qga25vdyBpZiBPRFAgSFcgY2FuCj4g
PiBkbyB0aGF0Lgo+ID4gCj4gPiBTaW5jZSB0aGlzIGlzIGFsbCBkcml2aW5nIHRvd2FyZCBtYWtp
bmcgT0RQIHVzZSB0aGlzIG1heWJlIHdlIHNob3VsZAo+ID4ga2VlcCB0aGlzIEFQST8gCj4gPiAK
PiA+IEknbSBub3Qgc3VyZSBJIGNhbiBsb29zZSB0aGUgY3JhcHB5IGh1Z2UgcGFnZSBzdXBwb3J0
IGluIE9EUC4KPiAKPiBUaGUgcHJvYmxlbSBpcyB0aGF0IEkgc2VlIG5vIHdheSBob3cgdG8gdXNl
IHRoZSBjdXJyZW50IEFQSS4gIFRvIGtub3cKPiB0aGUgaHVnZSBwYWdlIHNpemUgeW91IG5lZWQg
dG8gaGF2ZSB0aGUgdm1hLCBhbmQgdGhlIGN1cnJlbnQgQVBJCj4gZG9lc24ndCByZXF1aXJlIGEg
dm1hIHRvIGJlIHBhc3NlZCBpbi4KClRoZSB3YXkgT0RQIHNlZW1zIHRvIHdvcmsgaXMgb25jZSBp
biBodWdldGxiIG1vZGUgdGhlIGRtYSBhZGRyZXNzZXMKbXVzdCBnaXZlIGh1Z2UgcGFnZXMgb3Ig
dGhlIHBhZ2UgZmF1bHQgd2lsbCBiZSBmYWlsZWQuIEkgdGhpbmsgdGhhdCBpcwphIHRlcnJpYmxl
IGRlc2lnbiwgYnV0IHRoaXMgaXMgaG93IHRoZSBkcml2ZXIgaXMgLi4KClNvLCBmcm9tIHRoaXMg
SE1NIHBlcnNwZWN0aXZlIGlmIHRoZSBjYWxsZXIgYXNrZWQgZm9yIGh1Z2UgcGFnZXMgdGhlbgp0
aGUgcmVzdWx0cyBoYXZlIHRvIGJlIGFsbCBodWdlIHBhZ2VzIG9yIGEgaGFyZCBmYWlsdXJlLgoK
SXQgaXMgbm90IG5lZ290aWF0ZWQgYXMgYW4gb3B0aW1pemF0aW9uIGxpa2UgeW91IGFyZSB0aGlu
a2luZy4KCltub3RlLCBJIGhhdmVuJ3QgeWV0IGNoZWNrZWQgY2FyZWZ1bGx5IGhvdyB0aGlzIHdv
cmtzIGluIE9EUCwgZXZlcnkKIHRpbWUgSSBsb29rIGF0IHBhcnRzIG9mIGl0IHRoZSB0aGluZyBz
ZWVtcyBjcmF6eV0KCj4gVGhhdCdzIHdoeSBJIHN1Z2dlc3RlZCBhbiBhcGkgd2hlcmUgd2UgcGFz
cyBpbiBhIGZsYWcgdGhhdCBodWdlIHBhZ2VzCj4gYXJlIG9rIGludG8gaG1tX3JhbmdlX2ZhdWx0
LCBhbmQgaXQgdGhlbiBjb3VsZCBwYXNzIHRoZSBzaGlmdCBvdXQsIGFuZAo+IGxpbWl0cyBpdHNl
bGYgdG8gYSBzaW5nbGUgdm1hICh3aGljaCBpdCBub3JtYWxseSBkb2Vzbid0LCB0aGF0IGlzIGFu
Cj4gYWRkaXRpb25hbCBjb21wbGljYXRpb24pLiAgQnV0IGFsbCB0aGlzIHNlZW1zIHJlYWxseSBh
d2t3YXJkIGluIHRlcm1zCj4gb2YgYW4gQVBJIHN0aWxsLiAgQUZBSUsgT0RQIGlzIG9ubHkgdXNl
ZCBieSBtbHg1LCBhbmQgbWx4NSB1bmxpa2Ugb3RoZXIKPiBJQiBIQ0FzIGNhbiB1c2Ugc2NhdHRl
cmxpc3Qgc3R5bGUgTVJzIHdpdGggdmFyaWFibGUgbGVuZ3RoIHBlciBlbnRyeSwKPiBzbyBldmVu
IGlmIHdlIHBhc3MgbXVsdGlwbGUgcGFnZXMgcGVyIGVudHJ5IGZyb20gaG1tIGl0IGNvdWxkIGNv
YWxlc2NlCj4gdGhlbS4gIAoKV2hlbiB0aGUgZHJpdmVyIHRha2VzIGZhdWx0cyBpdCBoYXMgdG8g
cmVwYWlyIHRoZSBNUiBtYXBwaW5nLCBhbmQKZml4aW5nIGEgcGFnZSBpbiB0aGUgbWlkZGxlIG9m
IGEgdmFyaWFibGUgbGVuZ3RoIFNHTCB3b3VsZCBiZSBwcmV0dHkKY29tcGxpY2F0ZWQuIEV2ZW4g
c28sIEkgZG9uJ3QgdGhpbmsgdGhlIFNHX0dBUHMgZmVhdHVyZSBhbmQgT0RQIGFyZQpjb21wYXRp
YmxlIC0gSSdtIHByZXR0eSBzdXJlIE9EUCBoYXMgdG8gYmUgcGFnZSBsaXN0cyBub3QgU0dMLi4K
Ckhvd2V2ZXIsIHdoYXQgT0RQIGNhbiBtYXliZSBkbyBpcyByZXByZXNlbnQgYSBmdWxsIG11bHRp
LWxldmVsIHBhZ2UKdGFibGUsIHNvIHdlIGNvdWxkIGhhdmUgMk0gZW50cmllcyB0aGF0IG1hcCB0
byBhIHNpbmdsZSBETUEgb3IgdG8KYW5vdGhlciBwYWdlIHRhYmxlIHcvIDRrIHBhZ2VzIChoYXZl
IHRvIGNoZWNrIG9uIHRoaXMpCgpCdXQgdGhlIGRyaXZlciBpc24ndCBzZXQgdXAgdG8gZG8gdGhh
dCByaWdodCBub3cuCgo+IFRoZSBiZXN0IEFQSSBmb3IgbWx4NCB3b3VsZCBvZiBjb3Vyc2UgYmUg
dG8gcGFzcyBhIGJpb3ZlYy1zdHlsZQo+IHZhcmlhYmxlIGxlbmd0aCBzdHJ1Y3R1cmUgdGhhdCBo
bW1fZmF1bHQgY291bGQgZmlsbCBvdXQsIGJ1dCB0aGF0IHdvdWxkCj4gYmUgYSBtYWpvciByZXN0
cnVjdHVyZS4KCkl0IHdvdWxkIHdvcmssIGJ1dCB0aGUgZHJpdmVyIGhhcyB0byBleHBhbmQgdGhh
dCBpbnRvIGEgcGFnZSBsaXN0CnJpZ2h0IGF3YXlob3cuCgpXZSBjYW4ndCBldmVuIGRtYSBtYXAg
dGhlIGJpb3ZlYyB3aXRoIHRvZGF5J3MgZG1hIEFQSSBhcyBpdCBuZWVkcyB0aGUKYWJpbGl0eSB0
byByZW1hcCBvbiBhIHBhZ2UgZ3JhbnVsYXJpdHkuCgpKYXNvbgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
