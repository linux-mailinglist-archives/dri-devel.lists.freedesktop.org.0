Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA77AECBAF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 23:49:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9ABF6F88E;
	Fri,  1 Nov 2019 22:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130088.outbound.protection.outlook.com [40.107.13.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560F36E2D1;
 Fri,  1 Nov 2019 18:21:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkIlIG85b9ACWFy9reH0jRILGQNySHdqVQR64w/uzKYm5GTkz835FjgrwshRGgyzWxwcth4ipmQVBPWuK20ngr/wuRwmetgQEEvp0EtA06x62ZO+oUChlfAfvzwCdJR4HQS+0uzBmyligOF4srbHmkBfGN2cxTU+E5ocJRJ++TcbuaUlXhzagnsYJ5+ul08y845BF1R10DUhgpEpIFHuBMyM/9rVN/guw5xO4fuXTg9gemhCaSQQZaxKlZR1m57LMhYk+BcRp3s8l1fA8pBsOVg7RDZlGiJluzL2zyuKtm8VVUIbjbrjNo4zuyfHFJ4P/xfZ06tau2fvklClBEV1NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kF8vKQntyNYsBxGxQvVYyiW6RqO65RRaLmW947DAoGA=;
 b=AhHFdRgY7dikywn45HiI86lXdZsi8WgiR1KDQF4Mbn45zN6c0oDLLcunQndOpH7nGDjXM4OGYb4S/8phuQNQZmkFPG6quA0nbaItJ3zyoNRctekeje65rfs7WAyT6U/TJUGJWhD+LUdc3UWns7xwYJfHVAfaHzKj2EGoykuXl3kPewVFBLhrbqBJnXRbRflO0/hfRO+qV2qf4E85/GvQvkK8ZBYfFi+Ru/rH4q48Q6THQQhCu4trzuf8GYAIfZKC2PVAK+zVocCP83fdRY051vj2RAzHZRmcOb4QfKfdH76FT2cx6cd7s0h972A5q6GHVxj8z6nL/CO+A12zVivs7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5853.eurprd05.prod.outlook.com (20.178.125.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Fri, 1 Nov 2019 18:21:07 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2387.028; Fri, 1 Nov 2019
 18:21:07 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: "Yang, Philip" <Philip.Yang@amd.com>, Jerome Glisse <jglisse@redhat.com>
Subject: Re: [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier instead of
 hmm_mirror
Thread-Topic: [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier instead of
 hmm_mirror
Thread-Index: AQHVjcvOUfhzqykxXkO0v7SQaQq3BKdyANqAgAAA3wCABGiEgIAAPGcA
Date: Fri, 1 Nov 2019 18:21:06 +0000
Message-ID: <20191101182102.GQ22766@mellanox.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-15-jgg@ziepe.ca>
 <a456ebd0-28cf-997b-31ff-72d9077a9b8e@amd.com>
 <20191029192544.GU22766@mellanox.com>
 <30b2f569-bf7a-5166-c98d-4a4a13d1351f@amd.com>
In-Reply-To: <30b2f569-bf7a-5166-c98d-4a4a13d1351f@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR01CA0024.prod.exchangelabs.com (2603:10b6:208:10c::37)
 To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8dfa72ed-91de-48e5-aa0e-08d75ef8431a
x-ms-traffictypediagnostic: VI1PR05MB5853:
x-microsoft-antispam-prvs: <VI1PR05MB58532EE395A4046BBCE3BDC7CF620@VI1PR05MB5853.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(199004)(189003)(256004)(8936002)(66476007)(66556008)(2616005)(446003)(4326008)(11346002)(476003)(478600001)(316002)(66946007)(64756008)(6486002)(6436002)(186003)(6246003)(99286004)(86362001)(71190400001)(386003)(71200400001)(229853002)(8676002)(6512007)(26005)(66446008)(7416002)(486006)(6506007)(102836004)(6116002)(52116002)(7736002)(25786009)(1076003)(66066001)(305945005)(81166006)(81156014)(76176011)(36756003)(3846002)(2906002)(54906003)(5660300002)(110136005)(14444005)(33656002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5853;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jPwOgY/hIP0LtY+dQlOxGJl3acxXoYJXK3aUAWCEOJwTBzHvWDpgrCMcdpTAzYwVybyGdJTr7mTIociRf7m6lPf3t2AVJ9tPNyM2z5PTnvapgs6WbsPS4zN+gKbZYG+D/EG+H9hDXg5dxDXS0Ig3w2SSNt8yROmYsoI619ySLGqSQa05ZdmpU7dn16YgZWzEEK/slfIeZkwnUOjdKvgM0VMBvSh7lJ25XAhSjVrpomxLoQz1X/Uhjijq4He8WoXA+5gwnvpKuEECpVwHe1pSC2geDJXfhwd77KgGtapS6upiBN6+dBqBP3HvAbM2Smaa0L4glGO/lNMDWucXx4vc27TeUCWItRDSRB8tjohf52FiEVF2vFxEaNKSFDRIDyyg10BwWDVBbL1MG7LaXlvlbzzY1j7u61OOE3673t8XnxMTmQ0+uK1o0PiS5xt87T1P
x-ms-exchange-transport-forked: True
Content-ID: <BCECA9D0A65ADC4A904C52D0F1BF1A4A@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dfa72ed-91de-48e5-aa0e-08d75ef8431a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 18:21:06.9734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ve/HA1olu6L2MB6fAFm5q8Med2HekEUOECkay3snQNY9Hr/GEgTtXHcwvSKoNiwhuY8V1oE4/mJcE7HU85CBPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5853
X-Mailman-Approved-At: Fri, 01 Nov 2019 22:49:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kF8vKQntyNYsBxGxQvVYyiW6RqO65RRaLmW947DAoGA=;
 b=eM79Sa7oPnmD8fZFOSkpPk8Zu46YWMMzRCK8D6sQWhZvrLYsbFdW1MtX1KnxdDf/PctHmfXigqFkZsSAyQpEDvfeQQp3PHKsOhwPxM1gvdheQnFTF2rxiMnCFpBYEsumNR/sLQs+HsLBF/oZqawU0xUgtSCBVJa2kZrx8GkvLs8=
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
Cc: Juergen Gross <jgross@suse.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, Christoph Hellwig <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMDEsIDIwMTkgYXQgMDI6NDQ6NTFQTSArMDAwMCwgWWFuZywgUGhpbGlwIHdy
b3RlOgo+IEBAIC04NTQsMTIgKzg1MywyMCBAQCBpbnQgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9w
YWdlcyhzdHJ1Y3QgYW1kZ3B1X2JvICpibywgc3RydWN0IHBhZ2UgKipwYWdlcykKPiAgCQlyID0g
LUVQRVJNOwo+ICAJCWdvdG8gb3V0X3VubG9jazsKPiAgCX0KPiArCXVwX3JlYWQoJm1tLT5tbWFw
X3NlbSk7Cj4gKwl0aW1lb3V0ID0gamlmZmllcyArIG1zZWNzX3RvX2ppZmZpZXMoSE1NX1JBTkdF
X0RFRkFVTFRfVElNRU9VVCk7Cj4gKwo+ICtyZXRyeToKPiArCXJhbmdlLT5ub3RpZmllcl9zZXEg
PSBtbXVfcmFuZ2VfcmVhZF9iZWdpbigmYm8tPm5vdGlmaWVyKTsKPiAgCj4gKwlkb3duX3JlYWQo
Jm1tLT5tbWFwX3NlbSk7Cj4gIAlyID0gaG1tX3JhbmdlX2ZhdWx0KHJhbmdlLCAwKTsKPiAgCXVw
X3JlYWQoJm1tLT5tbWFwX3NlbSk7Cj4gLQo+IC0JaWYgKHVubGlrZWx5KHIgPCAwKSkKPiArCWlm
ICh1bmxpa2VseShyIDw9IDApKSB7Cj4gKwkJaWYgKChyID09IDAgfHwgciA9PSAtRUJVU1kpICYm
ICF0aW1lX2FmdGVyKGppZmZpZXMsIHRpbWVvdXQpKQo+ICsJCQlnb3RvIHJldHJ5Owo+ICAJCWdv
dG8gb3V0X2ZyZWVfcGZuczsKPiArCX0KCkkgd2FzIHJlZmxlY3Rpbmcgb24gd2h5IHRoaXMgc3Vk
ZGVudGx5IGJlY2FtZSBuZWNlc3NhcnksIGFuZCBJIHRoaW5rCndoYXQgbWlnaHQgYmUgaGFwcGVu
aW5nIGlzIHRoYXQgaG1tX3JhbmdlX2ZhdWx0KCkgaXMgdHJpZ2dpbmcKaW52YWxpZGF0aW9ucyBh
cyBpdCBydW5zIChpZSBpdCBpcyBmYXVsdGluZyBpbiBwYWdlcyBvciBzb21ldGhpbmcpIGFuZAp0
aGF0IGluIHR1cm4gY2F1c2VzIHRoZSBtcm4gdG8gbmVlZCByZXRyeS4KClRoZSBobW0gdmVyc2lv
biBvZiB0aGlzIGhhZCBhIGJ1ZyB3aGVyZSBhIGZ1bGwKaW52YWxpZGF0ZV9yYW5nZV9zdGFydC9l
bmQgcGFpciB3b3VsZCBub3QgdHJpZ2dlciByZXRyeSwgc28gdGhpcyB0aGlzCmRpZG4ndCBoYXBw
ZW4uCgpUaGlzIGlzIHVuZm9ydHVuYXRlIGFzIHRoZSByZXRyeSBpcyB1bm5lY2Vzc2FyeSwgYnV0
IGF0IHRoaXMgdGltZSBJCmNhbid0IHRoaW5rIG9mIGEgZ29vZCB3YXkgdG8gc2VwYXJhdGUgYW4g
aWdub3JhYmxlIHN5bmNocm9ub3VzCmludmFsaWRhdGlvbiBjYXVzZWQgYnkgaG1tX3JhbmdlX2Zh
dWx0IGZyb20gYW4gYXN5bmMgb25lIHRoYXQgY2Fubm90CmJlIGlnbm9yZWQuLgoKQSBiYXNpYyBm
aXggd291bGQgYmUgdG8gbm90IHVwZGF0ZSB0aGUgbXJxIHNlcSBpbiB0aGUgbm90aWZpZXIgaWYK
dGhlIGludmFsaWRhdGUgaXMgdHJpZ2dlcmVkIGJ5IGhtbV9yYW5nZV9mYXVsdCwgYnV0IHRoYXQg
c2VlbXMKZGlmZmljdWx0IHRvIGRldGVybWluZS4uCgpBbnkgdGhvdWdodHMgSmVyb21lPwoKSmFz
b24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
