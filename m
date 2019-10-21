Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F2BDF7F9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 00:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8396E2AF;
	Mon, 21 Oct 2019 22:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20085.outbound.protection.outlook.com [40.107.2.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201436E197;
 Mon, 21 Oct 2019 16:58:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyqTDdJ5asdWm6rJcxDsCbJXWyrXfcAJkMwPQmRIbKiAop2WkdR38yJy2TTDw8v18ZtAixXaLR2D5+e0kK7zyXSMGMboVqU6ohl2s87o4+MHBgAXEE6KqFQvqYXZa7Ua8mGA8eVJpIkOURxX2RPfScGzgVgk993BLFAo70wnj1ESY0v7k/UGqaej+k37lZqoXTdYqF8mSPT8G0q/alfwixTNh4UQKBzzFc3O3ht9hChQvhD8dMtaoqWWhuxeF/cfkCf1kSgYB2FKHjyMFezuJ/kFEcIpGwRoiW5vVBmp+UPmMrHuDRIuvlCn37C//Rfz7ieKQrkPeXR5q72z9kl2ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFlN5t3UGozcMevuLdzlZwjri0Hmv1gvskUCJgPfxEQ=;
 b=JCUElLHM9QD7lYtjSVhEEYN5k/C4TVMtjJbu1Ke6f+DA4oX6nC75LuE2z5p1dzW9fFVPkBI6C/p5x3e0ORViFXrIZfqM4ZrqeMyYUlzTBQyYVpdgWQ3NxOT6virUPoVAhQUonHmctxc7n1TlXFhS9tEeFgg2l986DXGmGOP1KP3jWJYgsG1/A64L+YhTVRi/xJqoyrBpNe9bwLZBkqSBFZaIXhXTXCo+oZ5KNPS2ny/WPpesipn4l2VbiRzPW8f/fk2RSXgN0OY6uu1QqL7ba19ZHe0WMei6VdEbfrKqA9ys3N06xz/IUOC9L5a2D4lU3mmBrOTAdSxbmA6i3NSfcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4751.eurprd05.prod.outlook.com (20.176.5.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Mon, 21 Oct 2019 16:58:31 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0%7]) with mapi id 15.20.2347.029; Mon, 21 Oct 2019
 16:58:31 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Dennis Dalessandro <dennis.dalessandro@intel.com>
Subject: Re: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Topic: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Index: AQHVg4Sqa7CCxCToXEeTrrYAqVQVhqdlSPyAgAARfwA=
Date: Mon, 21 Oct 2019 16:58:31 +0000
Message-ID: <20191021165828.GA6285@mellanox.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <5fdbcda8-c6ec-70aa-3f89-147fe67152f2@intel.com>
In-Reply-To: <5fdbcda8-c6ec-70aa-3f89-147fe67152f2@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR17CA0033.namprd17.prod.outlook.com
 (2603:10b6:208:15e::46) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bafb636-c336-48c8-cbde-08d75647e702
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR05MB4751:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR05MB4751E3B605CD85B6453633F5CF690@VI1PR05MB4751.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(189003)(199004)(14454004)(11346002)(446003)(966005)(86362001)(33656002)(1076003)(25786009)(6916009)(81156014)(8936002)(8676002)(81166006)(478600001)(64756008)(66556008)(66446008)(66476007)(66946007)(486006)(66066001)(186003)(5660300002)(386003)(256004)(476003)(4744005)(2616005)(26005)(102836004)(53546011)(6506007)(71190400001)(76176011)(52116002)(99286004)(71200400001)(3846002)(7416002)(7736002)(305945005)(6116002)(6486002)(4326008)(6246003)(36756003)(229853002)(6306002)(6512007)(6436002)(2906002)(54906003)(316002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4751;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a2AscmFxZMvMh7umM9ml1xvkjD7/KAn9E+K4LuOt0mOmZV7uxAzKt91w/jzJOR0dJ7rjwcM1IvzQ+2rBTxOhYdsdHj20qeLHEtemH24Msiy463JaAOM8ejMmETPi5pk1Q9Sb8M+KpkluJN4bt6u1n/mIM/qd8+PC3reBSjcJeb7rBivYWz0FoojijxZyFPOUx310c3/q7oB6OqOtRctesumjSVEZkjOUhhfGKOODk7AsiQdWiFo3aXBEvwepkMIb2BEp2hurdTD/8iEOTvHonO//dqNZcTAQt9zjaAF0hg6zgj4w2bgd9Cj8q9Z+T1xAXbcJtXjOvwY3sUrARtTBS0cZ+j11d8xQir0NuGQrFi708TBNJU+CiuwvJM2g4nDmjk0F0pHG64k+oZ0gEhWs7QtiWupAlZJi4kgA4y/Efko6Un6BASLTFyq4YcGB+ah3/RiULbhPa3qcal8fD2GTZkcGN1NYssY6ipn+9VorzaQ=
x-ms-exchange-transport-forked: True
Content-ID: <0BEC4912CF056E498EEC73DAB37D8D9B@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bafb636-c336-48c8-cbde-08d75647e702
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 16:58:31.7439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JtObhpIvyLXiMbHmlOTySSdn0phGLZ2o8sFLlU55MoazkmQyEt5eZmfp2X5HMXx6AgMrCY1k54+ECnSUsQNjDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4751
X-Mailman-Approved-At: Mon, 21 Oct 2019 22:23:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFlN5t3UGozcMevuLdzlZwjri0Hmv1gvskUCJgPfxEQ=;
 b=f8qJYOxs3ZUAdo7qGx9rPBymNiej4qbXjfgCQkb573Ido4mogR/amppl9vBBt6NmKsFbD9gieTDZYtkWLIVdGYaUemOwCOeab3SyppkGkPdLpRp9y+zCvYP6UPGJ6VxTAObcQLPPoNRI9BgXnlsa17jkP88ZamNZYp9kup+1PEU=
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
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMTE6NTU6NTFBTSAtMDQwMCwgRGVubmlzIERhbGVzc2Fu
ZHJvIHdyb3RlOgo+IE9uIDEwLzE1LzIwMTkgMjoxMiBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3Rl
Ogo+ID4gVGhpcyBpcyBzdGlsbCBiZWluZyB0ZXN0ZWQsIGJ1dCBJIGZpZ3VyZWQgdG8gc2VuZCBp
dCB0byBzdGFydCBnZXR0aW5nIGhlbHAKPiA+IGZyb20gdGhlIHhlbiwgYW1kIGFuZCBoZmkgZHJp
dmVycyB3aGljaCBJIGNhbm5vdCB0ZXN0IGhlcmUuCj4gCj4gU29ycnkgZm9yIHRoZSBkZWxheSwg
SSBuZXZlciBzZWVuIHRoaXMuIFdhcyBub3Qgb24gQ2MgbGlzdCBhbmQgZGlkbid0Cj4gcmVnaXN0
ZXIgdG8gbWUgaXQgaW1wYWN0ZWQgaGZpLiBJJ2xsIHRha2UgYSBsb29rIGFuZCBydW4gaXQgdGhy
b3VnaCBzb21lCj4gaGZpMSB0ZXN0cy4KCkhtLCB5b3Ugd2VyZSBjYydkIG9uIHRoZSBoZmkxIHBh
dGNoIG9mIHRoZSBzZXJpZXM6CgpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEx
MTkxMzk1LwoKU28geW91IHNhdyB0aGF0LCByaWdodD8KCkJ1dCBpdCBzZWVtcyB0aGF0IGdpdCBz
ZW5kLWVtYWlsIGRpZG4ndCBwdWxsIGFsbCB0aGUgY2MncyB0b2dldGhlcj8KCkphc29uCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
