Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB241E97DA
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 09:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC706ECB5;
	Wed, 30 Oct 2019 08:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60081.outbound.protection.outlook.com [40.107.6.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E93D6E81F;
 Tue, 29 Oct 2019 22:56:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8qZ4XTJrmCImvrLUmff0YOAi3J2zR8Dpk8650Yiun0PVgXB/1s0HmpWYM36jgnvn3uT/pr9q9IsqNy9MMOPo4I1C3BDjDeZ6fwwkpWoSTlA6zOsUGm0F1EjuhFJECBjmMIXJo7nxjQ1e9IcPBn6dlX7rRFuN4FRrZIMSymd7HCoQXuuTgOvKBhjgLXld9I04Fzui2wx0Y9U0z5GsJyyISmlptuF+9z+V0shqoa0zDXrseU5R4rbq4CpPE2D1/7Q5xyHmhcHIRGtA9Uw6XLg5DNr6klLEQrY4jVcTkPOgHpihwCHouOEDlyuZKCgvaD8jZvMHOU7nvrGM60fwgdXzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSNk3sWFkaId19ydTN+WcDhTOdN4QOImhr1C7nNhym0=;
 b=IdcRUADUboh5u2fUtpr244mzgXWLtWzp6/BAetimJzQT2Y8My/0i8ZQ0Zqwi/3Xs+NvUO6W9adno6wwxvQ4g03HTvxxygX1wTpAEa5+lh6xlSdKh9n8YFLv7YyisS0sGwVT3MFd2cZuRDn5z38zhJTuO27fItOjwtMy5SKd6WVddWvQJmJIGi/3iOjkD54Cv/cNj6iOP75gX3I2w44T4qC0U5ug+38HM2kSQznSl4Ez/hycBzsfNE8jkuFzTwLD3N/E2jvgBfgffHHTKwRJyXIJjGX1VCWjyaElbxN267qNHAq88N3MqwWGU11NDQMpkfXNH/ki8RBWOcOWjTWU+aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB6205.eurprd05.prod.outlook.com (20.178.123.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Tue, 29 Oct 2019 22:56:30 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2387.027; Tue, 29 Oct 2019
 22:56:29 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH v2 02/15] mm/mmu_notifier: add an interval tree notifier
Thread-Topic: [PATCH v2 02/15] mm/mmu_notifier: add an interval tree notifier
Thread-Index: AQHVjcvJYOye0EiwZkisYK74G5bmhqdyLieAgAAObYA=
Date: Tue, 29 Oct 2019 22:56:29 +0000
Message-ID: <20191029225623.GV22766@mellanox.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-3-jgg@ziepe.ca>
 <786ee79d-00a6-9147-f410-d8856da35511@amd.com>
In-Reply-To: <786ee79d-00a6-9147-f410-d8856da35511@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR01CA0001.prod.exchangelabs.com (2603:10b6:208:71::14)
 To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 45c12942-a2fc-4228-92e1-08d75cc33c42
x-ms-traffictypediagnostic: VI1PR05MB6205:
x-microsoft-antispam-prvs: <VI1PR05MB62058F61C8C413984BE3A081CF610@VI1PR05MB6205.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(199004)(189003)(71190400001)(316002)(6916009)(33656002)(7736002)(36756003)(305945005)(6436002)(7416002)(229853002)(6486002)(6246003)(478600001)(4326008)(6512007)(25786009)(6116002)(3846002)(66476007)(66556008)(66946007)(66446008)(66066001)(64756008)(71200400001)(186003)(26005)(4744005)(1076003)(5660300002)(6506007)(2906002)(86362001)(2616005)(8676002)(54906003)(102836004)(52116002)(76176011)(386003)(99286004)(14454004)(8936002)(486006)(11346002)(446003)(476003)(256004)(81166006)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6205;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lh2orI0kJEeyfgpwY1E6ptwTbkmI1Vjnqs1LG96d9SEbAFltL3UFCVKArZ7eQOJhLX0h1MQdvZI3Qwo1AmYNL4RqWOXJzY/W+XnsfarL7a3Ld/sTnnpyy937QyvGB3JglcYjUcv688xPuOSDTrqf4bAQg4EWQ5pdxyfnoA5Sk+JsbxaLBHStAJGTa2eE2cyQpCbWZNj6iZBihzUgxkCAOXQ44bcFazpFi5zE7OTLpqyo/+G3MP8KhkxV+27CJ/u1k81z2B99poGAGQ7V2ZGK48VtM26kv72vUF/thZr2nypTwWPkzDiVTU8/bL/9mHxQFxUy8AXgl0PdSRn905upHoXBSZiwCfPlVxiTbYq9KrLL67e/N7xWt1qGjeHPSmgY1Muk4I4wNFBf4lUwLsK0ejNqW2SNcAh8aDvRm0mwn/kEhGkU3l6jTMtNWm8VVFOP
x-ms-exchange-transport-forked: True
Content-ID: <0D908830E600514D9CA283269F446301@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c12942-a2fc-4228-92e1-08d75cc33c42
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 22:56:29.7157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z4aYdaT7RAAAmsgmq3y2doK/qlWzq9wJ+GS8jT3kaPqsHgvp56u9tu6WMgMc19uJJ8cvyxwTX73GTlvXoDZ38A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6205
X-Mailman-Approved-At: Wed, 30 Oct 2019 08:14:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSNk3sWFkaId19ydTN+WcDhTOdN4QOImhr1C7nNhym0=;
 b=KgSO1LevQsyp8y2RtjNTPntXbRCJilC1OW3VvtC7NtSueX/wGF4E6uLu1GOLsaSxzsZLWTzc/Gs4spBTwGpZcRxtokDqJfsJxiqRi5cNTDS9+EcaM1b8Tgz7NfVMjv+Xh2QugDvYZrp9g39BH2Tzmz7wsKILavc5O+cTM0uL5YM=
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
 Michal Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Jerome Glisse <jglisse@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMTA6MDQ6NDVQTSArMDAwMCwgS3VlaGxpbmcsIEZlbGl4
IHdyb3RlOgoKPiA+ICAgICogYmVjYXVzZSBtbS0+bW1fdXNlcnMgPiAwIGR1cmluZyBtbXVfbm90
aWZpZXJfcmVnaXN0ZXIgYW5kIGV4aXRfbW1hcAo+ID4gQEAgLTUyLDE3ICsyODYsMjQgQEAgc3Ry
dWN0IG1tdV9ub3RpZmllcl9tbSB7Cj4gPiAgICAqIGNhbid0IGdvIGF3YXkgZnJvbSB1bmRlciB1
cyBhcyBleGl0X21tYXAgaG9sZHMgYW4gbW1fY291bnQgcGluCj4gPiAgICAqIGl0c2VsZi4KPiA+
ICAgICovCj4gPiAtdm9pZCBfX21tdV9ub3RpZmllcl9yZWxlYXNlKHN0cnVjdCBtbV9zdHJ1Y3Qg
Km1tKQo+ID4gK3N0YXRpYyB2b2lkIG1uX2hsaXN0X3JlbGVhc2Uoc3RydWN0IG1tdV9ub3RpZmll
cl9tbSAqbW1uX21tLAo+ID4gKwkJCSAgICAgc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4gPiAgIHsK
PiA+ICAgCXN0cnVjdCBtbXVfbm90aWZpZXIgKm1uOwo+ID4gICAJaW50IGlkOwo+ID4gICAKPiA+
ICsJaWYgKG1tbl9tbS0+aGFzX2ludGVydmFsKQo+ID4gKwkJbW5faXRyZWVfcmVsZWFzZShtbW5f
bW0sIG1tKTsKPiA+ICsKPiA+ICsJaWYgKGhsaXN0X2VtcHR5KCZtbW5fbW0tPmxpc3QpKQo+ID4g
KwkJcmV0dXJuOwo+IAo+IFRoaXMgc2VlbXMgdG8gZHVwbGljYXRlIHRoZSBjb25kaXRpb25zIGlu
IF9fbW11X25vdGlmaWVyX3JlbGVhc2UuIFNlZSBteSAKPiBjb21tZW50cyBiZWxvdywgSSB0aGlu
ayBvbmUgb2YgdGhlbSBpcyB3cm9uZy4gSSBzdXNwZWN0IHRoaXMgb25lLCAKPiBiZWNhdXNlIF9f
bW11X25vdGlmaWVyX3JlbGVhc2UgZm9sbG93cyB0aGUgc2FtZSBwYXR0ZXJuIGFzIHRoZSBvdGhl
ciAKPiBub3RpZmllcnMuCgpZZXAsIHRoaXMgaXMgYSByZWJhc2luZyBlcnJvciBmcm9tIGEgZWFy
bGllciB2ZXJzaW9uLCB0aGUgYWJvdmUgdHdvCmxpbmVzIHNob3VsZCBiZSBkZWxldGVkLgoKSSB0
aGluayBpdCBpcyBoYXJtbGVzcyBzbyBpdCBzaG91bGQgbm90IGltcGFjdCBhbnkgdGVzdGluZy4K
ClRoYW5rcywKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
