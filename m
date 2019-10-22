Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A2BE13C2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17146E9B4;
	Wed, 23 Oct 2019 08:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F9C6E83F;
 Tue, 22 Oct 2019 15:01:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mm85OUkDNj+EIYO1+SM3f3L4mMG3Qtzj6ScTZulXgMOURy8Mf8g4e25IIckHjySU0jY/u2zQ6JjNb2UgqYfjoyKYZSSca0LyNPyNi1oxAk3WqL44s9yKSjJYqFricP/B3mYSekTlO3tySYl6tD5abXFjxeZVGFlyhERVmlB/IIgkW4Cw0J2ZDvQiYDhyn/L3NVDbcbM4qjvow0U2Pb+tYFm99hv6hKcyGzAFL3Pntv33Y21ip6nbgqPpBEllb84JrNCWzOiIf4XkJh5fuSoVFdbbJxId8KlB92DBudZj12GKoVlHu2mzVDf4ZlcS/MHkZw1oTtoWSVy39ueL7BFMiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gA/GX8228kJgvWv7+hujYpprLyjBUIYS4AnDJs1IXe8=;
 b=f35c1tyAjeOSjfy/Urj2rAXIM/8BruRIvOZkuW1Os5yLHDSXi0ddA88n33eGwMS7ZZ8W4CoDCfx4wgFhy3zo2srmb8Uc2goAU/Gp4i9yrKtZETC9Nnjcj3W7A5aaKaCShS3Cj/aAFFxV2rAzZYQ39tWWIFfBMgsmj9KA2TZOTupGcRU4SKbh7wZFIROMCEpAwAwfZOWAaXiPX6vfXlgyvwqn6CwT4fJmCWQHnugIotUJVZ04pwPXX7u1wnmyy1L2e7id4janSc2EqXjCbSPrw9veWLzYaDg5bTQnHh9SBKUpjaw4Y9K1nCfrZum64CjMD0UIC3IFA93LoKcPR1uYcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB3232.eurprd05.prod.outlook.com (10.170.238.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 22 Oct 2019 15:01:13 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0%7]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 15:01:13 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Andrea Arcangeli
 <aarcange@redhat.com>, "Yang, Philip" <Philip.Yang@amd.com>, Ralph Campbell
 <rcampbell@nvidia.com>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Jerome Glisse <jglisse@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Subject: Re: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Topic: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Index: AQHVg4Sqa7CCxCToXEeTrrYAqVQVhqdc+JgAgAB3OACAARovgIAAficAgAAF3YCAAdJKAIACvAUAgAGLqgCAAAilAIAADDUAgAEY24CAAHZYgA==
Date: Tue, 22 Oct 2019 15:01:13 +0000
Message-ID: <20191022150109.GF22766@mellanox.com>
References: <20191016160444.GB3430@mellanox.com>
 <2df298e2-ee91-ef40-5da9-2bc1af3a17be@gmail.com>
 <2046e0b4-ba05-0683-5804-e9bbf903658d@amd.com>
 <d6bcbd2a-2519-8945-eaf5-4f4e738c7fa9@amd.com>
 <20191018203608.GA5670@mellanox.com>
 <f7e34d8f-f3b0-b86d-7388-1f791674a4a9@amd.com>
 <20191021135744.GA25164@mellanox.com>
 <e07092c3-8ccd-9814-835c-6c462017aff8@amd.com>
 <20191021151221.GC25164@mellanox.com>
 <20191022075735.GV11828@phenom.ffwll.local>
In-Reply-To: <20191022075735.GV11828@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN8PR15CA0008.namprd15.prod.outlook.com
 (2603:10b6:408:c0::21) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6eba0954-182b-48f3-dfd0-08d75700ae30
x-ms-traffictypediagnostic: VI1PR05MB3232:
x-microsoft-antispam-prvs: <VI1PR05MB3232EB9BE7E6F210BA678F51CF680@VI1PR05MB3232.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(189003)(199004)(99286004)(256004)(2616005)(110136005)(7416002)(86362001)(14454004)(476003)(8936002)(36756003)(52116002)(305945005)(14444005)(478600001)(2501003)(76176011)(7736002)(11346002)(446003)(3846002)(102836004)(386003)(6506007)(6116002)(186003)(81166006)(229853002)(1076003)(6486002)(8676002)(6512007)(33656002)(25786009)(66946007)(316002)(2201001)(66476007)(66446008)(64756008)(66556008)(71200400001)(71190400001)(6246003)(486006)(66066001)(26005)(2906002)(5660300002)(81156014)(6436002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3232;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6UIcX35492dkSb5Qs7UCCOOF7qT8N4gw2PsUdg+cRDwDbwrrDk5xHeFDmvPiaPKTmcxLqrmKCFubNJ5PgUxgCunZ5EZyXh6X43oSvLKFJ+4etUX5dFfw+LgcQqXqGAL4faflQmSMBJM2B5D6ZJoShGOErgebZ0xOcXNuA25RYSEausLjIHeoHWo+qgwp6fGZMrA2B5Ax40krcJ8MHzct2/ZdtAsk7lbqR7vvJWdKykKIakT2CyyGFs602uXBBBopowy/rWO5c81+shJPFZMqhoFiOH9EiHECjilXtOHMf0gI/+7bDlv5nAX3ztGrrMGZDG5Re3M5m1Y/iMt40L+9oe0FZKWUGihhYZZC+vLRgGXfHANwxvlhyGo1HZaAC/tJS30vPsI8qIFFL8uleKH8gM4nOynwDR8fNFHV4OE77Bs=
x-ms-exchange-transport-forked: True
Content-ID: <B4FF14CACF6CD7439A8D2A6BCF779D62@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eba0954-182b-48f3-dfd0-08d75700ae30
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 15:01:13.2568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: awV1s2V3uIzuO1TcgScktyRmOIaNKyEQtk3FWunu6TrcHCgkol2gwamtZts1FFT1vXch753M5F/mL/upPMSztw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3232
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gA/GX8228kJgvWv7+hujYpprLyjBUIYS4AnDJs1IXe8=;
 b=GCZ+CEdRJoUiqqIefzbhgHxWGgXlqN0Mu7Ip4E1EvRiUiHN17S9vj8E0FrsLLZPJWks+2TGA0TiKp02lWFWj0Rx9R9qmIoLETs8CqYWQfP8N9E79LMoSJHJcH+02pU63ijtXJXLwSCF3fcgx7SmfPT3Gg91/5vbwsq1LvbUSNr0=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMDk6NTc6MzVBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKCj4gPiBUaGUgdW51c3VhbCBiaXQgaW4gYWxsIG9mIHRoaXMgaXMgdXNpbmcgYSBsb2Nr
J3MgY3JpdGljYWwgcmVnaW9uIHRvCj4gPiAncHJvdGVjdCcgZGF0YSBmb3IgcmVhZCwgYnV0IHVw
ZGF0aW5nIHRoYXQgc2FtZSBkYXRhIGJlZm9yZSB0aGUgbG9jaydzCj4gPiBjcml0aWNhbCBzZWNp
b24uIGllIHJlbHlpbmcgb24gdGhlIHVubG9jayBiYXJyaWVyIHRvICdyZWxlYXNlJyBwcm9ncmFt
Cj4gPiBvcmRlcmVkIHN0b3JlcyBkb25lIGJlZm9yZSB0aGUgbG9jaydzIG93biBjcml0aWNhbCBy
ZWdpb24sIGFuZCB0aGUKPiA+IGxvY2sgc2lkZSBiYXJyaWVyIHRvICdhY3F1aXJlJyB0aG9zZSBz
dG9yZXMuCj4gCj4gSSB0aGluayB0aGlzIHVudXN1YWwgdXNlIG9mIGxvY2tzIGFzIGJhcnJpZXJz
IGZvciBvdGhlciB1bmxvY2tlZCBhY2Nlc3Nlcwo+IGRlc2VydmVzIGNvbW1lbnRzIGV2ZW4gbW9y
ZSB0aGFuIGp1c3Qgbm9ybWFsIGJhcnJpZXJzLiBDYW4geW91IHBscyBhZGQKPiB0aGVtPyBJIHRo
aW5rIHRoZSBkZXNpZ24gc2VlZW1zIHNvdW5kIC4uLgo+IAo+IEFsc28gdGhlIGNvbW1lbnQgb24g
dGhlIGRyaXZlcidzIGxvY2sgaG9wZWZ1bGx5IHByZXZlbnRzIGRyaXZlcgo+IG1haW50YWluZXJz
IGZyb20gbW92aW5nIHRoZSBkcml2ZXJfbG9jayBhcm91bmQgaW4gYSB3YXkgdGhhdCB3b3VsZCB2
ZXJ5Cj4gc3VidGxlIGJyZWFrIHRoZSBzY2hlbWUsIHNvIEkgdGhpbmsgaGF2aW5nIHRoZSBhY3F1
aXJlIGJhcnJpZXIgY29tbWVudGVkCj4gaW4gZWFjaCBwbGFjZSB3b3VsZCBiZSByZWFsbHkgZ29v
ZC4KClRoZXJlIGlzIGFscmVhZHkgYSBsb3Qgb2YgZG9jdW1lbnRhdGlvbiwgSSB0aGluayBpdCB3
b3VsZCBiZSBoZWxwZnVsCmlmIHlvdSBjb3VsZCBzdWdnZXN0IHNvbWUgc3BlY2lmaWMgcGxhY2Vz
IHdoZXJlIHlvdSB0aGluayBhbiBhZGRpdGlvbgp3b3VsZCBoZWxwPyBJIHRoaW5rIHRoZSBwZXJz
cGVjdGl2ZSBvZiBzb21lb25lIGxlc3MgZmFtaWxpYXIgd2l0aCB0aGlzCmRlc2lnbiB3b3VsZCBy
ZWFsbHkgaW1wcm92ZSB0aGUgZG9jdW1lbnRhdGlvbgoKSSd2ZSBiZWVuIHRlbXB0ZWQgdG8gZm9y
Y2UgdGhlIGRyaXZlciB0byBzdG9yZSB0aGUgc2VxIG51bWJlciBkaXJlY3RseQp1bmRlciB0aGUg
ZHJpdmVyIGxvY2sgLSB0aGlzIG1ha2VzIHRoZSBzY2hlbWUgbXVjaCBjbGVhcmVyLCBpZQpzb21l
dGhpbmcgbGlrZSB0aGlzOgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfc3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCmluZGV4
IDcxMmM5OTkxODU1MWJjLi43MzhmYTY3MGRjZmIxOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X3N2bS5jCkBAIC00ODgsNyArNDg4LDggQEAgc3RydWN0IHN2bV9ub3RpZmllciB7CiB9
OwogCiBzdGF0aWMgYm9vbCBub3V2ZWF1X3N2bV9yYW5nZV9pbnZhbGlkYXRlKHN0cnVjdCBtbXVf
cmFuZ2Vfbm90aWZpZXIgKm1ybiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX3JhbmdlICpyYW5nZSkKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX3Jh
bmdlICpyYW5nZSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIHNlcSkKIHsKICAgICAgICBzdHJ1Y3Qgc3ZtX25vdGlmaWVyICpzbiA9CiAgICAg
ICAgICAgICAgICBjb250YWluZXJfb2YobXJuLCBzdHJ1Y3Qgc3ZtX25vdGlmaWVyLCBub3RpZmll
cik7CkBAIC01MDQsNiArNTA1LDcgQEAgc3RhdGljIGJvb2wgbm91dmVhdV9zdm1fcmFuZ2VfaW52
YWxpZGF0ZShzdHJ1Y3QgbW11X3JhbmdlX25vdGlmaWVyICptcm4sCiAgICAgICAgICAgICAgICBt
dXRleF9sb2NrKCZzbi0+c3ZtbS0+bXV0ZXgpOwogICAgICAgIGVsc2UgaWYgKCFtdXRleF90cnls
b2NrKCZzbi0+c3ZtbS0+bXV0ZXgpKQogICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOworICAg
ICAgIG1tdV9yYW5nZV9ub3RpZmllcl91cGRhdGVfc2VxKG1ybiwgc2VxKTsKICAgICAgICBtdXRl
eF91bmxvY2soJnNuLT5zdm1tLT5tdXRleCk7CiAgICAgICAgcmV0dXJuIHRydWU7CiB9CgoKQXQg
dGhlIGNvc3Qgb2YgbWFraW5nIHRoZSBkcml2ZXIgYSBiaXQgbW9yZSBjb21wbGV4LCB3aGF0IGRv
IHlvdQp0aGluaz8KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
