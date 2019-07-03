Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FF35F375
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC2D6E277;
	Thu,  4 Jul 2019 07:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07A16E15F;
 Wed,  3 Jul 2019 15:11:55 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6351.eurprd05.prod.outlook.com (20.179.25.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 15:08:41 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 15:08:41 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [RFC] mm/hmm: pass mmu_notifier_range to
 sync_cpu_device_pagetables
Thread-Topic: [RFC] mm/hmm: pass mmu_notifier_range to
 sync_cpu_device_pagetables
Thread-Index: AQHVHY87cnj6rYaF00uB6DOqwK5J5aa35HaAgAAxJwCAAALKgIAAOioAgADUsAA=
Date: Wed, 3 Jul 2019 15:08:41 +0000
Message-ID: <20190703150836.GM18688@mellanox.com>
References: <20190608001452.7922-1-rcampbell@nvidia.com>
 <20190702195317.GT31718@mellanox.com> <20190702224912.GA24043@lst.de>
 <20190702225911.GA11833@mellanox.com>
 <1dc82dc8-3e6f-1d6f-b14d-41ae3c1b2709@amd.com>
In-Reply-To: <1dc82dc8-3e6f-1d6f-b14d-41ae3c1b2709@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::43) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5b764d1-dc0d-4af0-1bf8-08d6ffc85584
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6351; 
x-ms-traffictypediagnostic: VI1PR05MB6351:
x-microsoft-antispam-prvs: <VI1PR05MB635194713022BC0BC06D7F16CFFB0@VI1PR05MB6351.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(189003)(199004)(386003)(6506007)(25786009)(7416002)(53546011)(316002)(8936002)(26005)(68736007)(76176011)(102836004)(486006)(476003)(2616005)(186003)(5660300002)(14454004)(66476007)(2906002)(4326008)(11346002)(6116002)(3846002)(54906003)(99286004)(52116002)(36756003)(33656002)(7736002)(66446008)(1076003)(8676002)(14444005)(6246003)(64756008)(256004)(86362001)(305945005)(478600001)(53936002)(66946007)(81166006)(71200400001)(66556008)(73956011)(6512007)(6486002)(71190400001)(229853002)(6436002)(81156014)(446003)(6916009)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6351;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: td0S6w4mHfCpfIiwq60twZyFZcsKDyypieDB8FahsjvXOncVtvZwm1IzVFYnIeWYVhnUUAhoGNboHpppDK4NYN5sWo4WY0k/RfzbuXciuXnTm8teFPegBZQJfPq+aA0UM74aKEgAKeaYbx1/PlikKwR5rgu+ZikULKOirR2H5ibffF0p2vSXVQS8TcqW8WkduqizhaS7qXX7A7WAlhuyWd/yHocH7Fj1OEXkuiriDidvL48WjKUejgR4i6pgsmZ6jfTWrQRiKg4rQmb3Lx8vp8pq/bspE06qzMZRGUC2uioevyKu4VPCpryhTmGFrbNzaZ2Me/Si1l4i8Mww5JqYxD7VH/9jCuUR0cFU3MjxKccrFIXn/pmb5o67h3BY3dcId0vINr7DiRUk9a6bhCj9xECu4ASFEntY23RP+eLFvZE=
Content-ID: <5850BAD4694CCA479493175E5B4779A2@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b764d1-dc0d-4af0-1bf8-08d6ffc85584
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 15:08:41.6325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6351
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4A4a5FfKWFEl4y6HvDegBvo5QJ9gJlXgx2xduCl6h5Y=;
 b=kY+5iWQbbxLWKp0tqgTmPpt5tRxyIus3ZsKPmVmcLnNrHuDGgMxv59SizeIQiBH0IMeZnOsv/DMoILISYgrqKUs5+ckpiveRZvQjG10Esz6Usy5KLwc+ji4a7aTaWiLSsClhhx0Jeza5fSBi6Q7x+98dp/cSTYBF5fUh7F3LDdI=
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, David Airlie <airlied@linux.ie>,
 John Hubbard <jhubbard@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDI6Mjc6MjJBTSArMDAwMCwgS3VlaGxpbmcsIEZlbGl4
IHdyb3RlOgo+IE9uIDIwMTktMDctMDIgNjo1OSBwLm0uLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6
Cj4gPiBPbiBXZWQsIEp1bCAwMywgMjAxOSBhdCAxMjo0OToxMkFNICswMjAwLCBDaHJpc3RvcGgg
SGVsbHdpZyB3cm90ZToKPiA+PiBPbiBUdWUsIEp1bCAwMiwgMjAxOSBhdCAwNzo1MzoyM1BNICsw
MDAwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gPj4+PiBJJ20gc2VuZGluZyB0aGlzIG91dCBu
b3cgc2luY2Ugd2UgYXJlIHVwZGF0aW5nIG1hbnkgb2YgdGhlIEhNTSBBUElzCj4gPj4+PiBhbmQg
SSB0aGluayBpdCB3aWxsIGJlIHVzZWZ1bC4KPiA+Pj4gVGhpcyBtYWtlIHNvIG11Y2ggc2Vuc2Us
IEknZCBsaWtlIHRvIGFwcGx5IHRoaXMgaW4gaG1tLmdpdCwgaXMgdGhlcmUKPiA+Pj4gYW55IG9i
amVjdGlvbj8KPiA+PiBBcyB0aGlzIGNyZWF0ZXMgYSBzb21ld2hhdCBoYWlyeSBjb25mbGljdCBm
b3IgYW1kZ3B1LCB3b3VsZG4ndCBpdCBiZQo+ID4+IGEgYmV0dGVyIGlkZWEgdG8gd2FpdCBhIGJp
dCBhbmQgYXBwbHkgaXQgZmlyc3QgdGhpbmcgZm9yIG5leHQgbWVyZ2UKPiA+PiB3aW5kb3c/Cj4g
PiBNeSB0aGlua2luZyBpcyB0aGF0IEFNRCBHUFUgYWxyZWFkeSBoYXMgYSBtb25zdGVyIGNvbmZs
aWN0IGZyb20gdGhpczoKPiA+Cj4gPiAgIGludCBobW1fcmFuZ2VfcmVnaXN0ZXIoc3RydWN0IGht
bV9yYW5nZSAqcmFuZ2UsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtbV9zdHJ1
Y3QgKm1tLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaG1tX21pcnJvciAqbWly
cm9yLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBzdGFydCwKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZW5kLAo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgcGFnZV9zaGlmdCk7Cj4gPgo+ID4gU28sIGRlcGVuZGlu
ZyBvbiBob3cgdGhhdCBpcyByZXNvbHZlZCB3ZSBtaWdodCB3YW50IHRvIGRvIGJvdGggQVBJCj4g
PiBjaGFuZ2VzIGF0IG9uY2UuCj4gCj4gSSBqdXN0IHNlbnQgb3V0IGEgZml4IGZvciB0aGUgaG1t
X21pcnJvciBBUEkgY2hhbmdlLgoKSSB0aGluayBpZiB5b3UgZm9sbG93IG15IHN1Z2dlc3Rpb24g
dG8gYXBwbHkgYSBwcmVwIHBhdGNoIHRvIEFNRCBHUFUKdG8gbWFrZSB0aGUgY29uZmxpY3QgcmVz
b2x1dGlvbiBzaW1wbGUsIHdlIHNob3VsZCBkZWZlciB0aGlzIHBhdGNoCnVudGlsIG5leHQga2Vy
bmVsIGZvciB0aGUgcmVhc29ucyBDSCBnYXZlLgoKPiA+IE9yIHdlIG1heSBoYXZlIHRvIHJldmVy
dCB0aGUgYWJvdmUgY2hhbmdlIGF0IHRoaXMgbGF0ZSBkYXRlLgo+ID4KPiA+IFdhaXRpbmcgZm9y
IEFNREdQVSB0ZWFtIHRvIGRpc2N1c3Mgd2hhdCBwcm9jZXNzIHRoZXkgd2FudCB0byB1c2UuCj4g
Cj4gWWVhaCwgSSdtIHdvbmRlcmluZyB3aGF0IHRoZSBwcm9jZXNzIGlzIG15c2VsZi4gV2l0aCBI
TU0gYW5kIGRyaXZlciAKPiBkZXZlbG9wbWVudCBoYXBwZW5pbmcgb24gZGlmZmVyZW50IGJyYW5j
aGVzIHRoZXNlIGtpbmRzIG9mIEFQSSBjaGFuZ2VzIAo+IGFyZSBwYWluZnVsLiBUaGVyZSBzZWVt
cyB0byBiZSBhIGJ1aWx0LWluIGFzc3VtcHRpb24gaW4gdGhlIGN1cnJlbnQgCj4gcHJvY2Vzcywg
dGhhdCBjb2RlIGZsb3dzIG1vc3RseSBpbiBvbmUgZGlyZWN0aW9uIGFtZC1zdGFnaW5nLWRybS1u
ZXh0IC0+IAo+IGRybS1uZXh0IC0+IGxpbnV4LW5leHQgLT4gbGludXguIFRoYXQgYXNzdW1wdGlv
biBpcyBicm9rZW4gd2l0aCBITU0gY29kZSAKPiBldm9sdmluZyByYXBpZGx5IGluIGJvdGggYW1k
Z3B1IGFuZCBtbS4KCkl0IGxvb2tzIHRvIG1lIGxpa2UgQU1EIEdQVSB1c2VzIGEgcHVsbCByZXF1
ZXN0IG1vZGVsLiBTbyBhIGdvYWwgYXMgYQp0cmVlIHJ1bm5lciBzaG91bGQgYmUgdG8gd29yayB3
aXRoIHRoZSBvdGhlciB0cmVlcyAoaWUgaG1tLmdpdCwgZXRjKQp0byBtaW5pbWl6ZSBjb25mbGlj
dHMgYmV0d2VlbiB0aGUgUFIgeW91IHdpbGwgc2VuZCBhbmQgdGhlIFBSIG90aGVyCnRyZWVzIHdp
bGwgc2VuZC4KCkRvIG5vdCBmb2N1cyBvbiBsaW51eC1uZXh0LCB0aGF0IGlzIGp1c3QgYW4gJ2Vh
cmx5IHdhcm5pbmcgc3lzdGVtJwp0aGF0IGNvbmZsaWN0cyBhcmUgb24gdGhlIGhvcml6b24sIHdl
IGtuZXcgYWJvdXQgdGhpcyBvbmUgOikgKHdlbGwsCm1vc3RseSwgSSB3YXMgc3VycHJpc2VkIGhv
dyBiaWcgaXQgd2FzLCBteSBiYWQpCgpTbyB3ZSBtdXN0IHN0YXkgaW4gY28tb3JkaW5hdGlvbiB3
aXRoIHBhdGNoZXMgaW4tZmxpZ2h0IG9uIHRoZSBsaXN0CmFuZCBtYWtlIHRoZSByaWdodCBkZWNp
c2lvbiwgZGVwZW5kaW5nIG9uIHRoZSBzaXR1YXRpb24uIENvbW11bmljYXRpb24KaGVyZSBpcyBr
ZXkgOikKCldlIGhhdmUgbG90cyBvZiBzdHJhdGVnaWVzIGF2YWlsYWJsZSB0byBkZWFsIHdpdGgg
dGhlc2Ugc2l0dWF0aW9ucy4KCj4gSWYgd2Ugd2FudCB0byBjb250aW51ZSBkZXZlbG9waW5nIEhN
TSBkcml2ZXIgY2hhbmdlcyBpbgo+IGFtZC1zdGFnaW5nLWRybS1uZXh0LCB3ZSdsbCBuZWVkIHRv
IHN5bmNocm9uaXplIHdpdGggaG1tLmdpdCBtb3JlIAo+IGZyZXF1ZW50bHksIGJvdGggd2F5cy4K
Ckl0IGNhbid0IHJlYWxseSBnbyBib3RoIHdheXMuIGhtbS5naXQgaGFzIHRvIGJlIG9ubHkgdGhl
IGhtbSB0b3BpYywKb3RoZXJ3aXNlIGl0IGRvZXNuJ3QgcmVhbGx5IHdvcmsuCgo+IEkgYmVsaWV2
ZSBwYXJ0IG9mIHRoZSBwcm9ibGVtIGlzLCB0aGF0IHRoZXJlIGlzIGEgZmFpcmx5IGxvbmcKPiBs
ZWFkLXRpbWUgZnJvbSBnZXR0aW5nIGNoYW5nZXMgZnJvbSBhbWQtc3RhZ2luZy1kcm0tbmV4dCBp
bnRvCj4gbGludXgtbmV4dCwgYXMgdGhleSBhcmUgaGVsZCBmb3Igb25lIHJlbGVhc2UgY3ljbGUg
aW4gZHJtLW5leHQuCj4gUHVzaGluZyBITU0tcmVsYXRlZCBjaGFuZ2VzIHRocm91Z2ggZHJtLWZp
eGVzIG1heSBvZmZlciBhIGtpbmQgb2YKPiBzaG9ydGN1dC4gUGhpbGlwIGFuZCBteSBsYXRlc3Qg
Zml4dXAgaXMganVzdCBieXBhc3NpbmcgZHJtLW5leHQKPiBjb21wbGV0ZWx5IGFuZCBnb2luZyBz
dHJhaWdodCBpbnRvIGxpbnV4LW5leHQsIHRob3VnaC4KCkknbSBub3Qgc28gZmFtaWxpYXIgd2l0
aCB0aGUgRFJNIHdvcmsgZmxvdyB0byBnaXZlIHlvdSBhZHZpY2Ugb24gdGhpcy4KCkphc29uCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
