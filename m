Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 615A97BA6A
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DDD6E6A4;
	Wed, 31 Jul 2019 07:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150044.outbound.protection.outlook.com [40.107.15.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88416E4E1;
 Tue, 30 Jul 2019 12:55:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RnKo7LYrKDZ71MuqMXvk6l1xyYiPKBod/kJ+4AdTkgXuos50numeugypZ4UU4SWo7C3zZGDLTEboOPPWuC1LG2GhTA1D67tIVf9TotFR7AqM3RhXYNdII0+AKUE53CDWu6/J05NGQIMpQGKL2506KA/D8H5MRNq2kXt7AW4mkGfq5Fo6ADAsyrUlpwQpR79uF7bK+K0HmSV4++Zc2O+nfzWNBaVbUJkLCWN/nVu3GLLHwbygclAmWfRavRXUPhFcyXIH4zox6ZmSqjn9QVgaGMbYTwGA7Zigdj07Amu7KRk1jzb/hbbw7ESy2r5gTgQ7sHkeLBo7tR6oYNSss4IN4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idycEckcr4oa7t42lFd2XxOLcI8deGKjkgpKUBigHj0=;
 b=Sk0oQlKLzA1ZIQq0Ib38IiL4e/iLmkd4i19SJ0NbxBSoAFeu+yC5vWIHkyx217RmFKR0LhIjpfMKUY0ttwNTU8v1n0zPQVbBphaqjNOyJK9+MPIDr8tNu27WN3xALz7gYGZm4DXJvjJn8LFYOZjgeDjot+IhfKuWR0xP3eXxjcpI1QtAHn9CjIb2xzvjItsO0lGX+6AFNCCaO+KwmpTKDa/JvBx7Gp6YOMeGrKsK8j4L6ac2AgXAQz0aHqdc0v5TrG69IMTh6WwoaOfgnaWrD8RicBariwBPe4LdYSiEL+ttDq11ccabVQt2IIrH+gPaw2RzwG4Le2LKX290koQGhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5024.eurprd05.prod.outlook.com (20.177.52.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 12:55:17 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 12:55:17 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 07/13] mm: remove the page_shift member from struct
 hmm_range
Thread-Topic: [PATCH 07/13] mm: remove the page_shift member from struct
 hmm_range
Thread-Index: AQHVRpr/I9wxeKeChkuG0OEJhB2jNabjHtYA
Date: Tue, 30 Jul 2019 12:55:17 +0000
Message-ID: <20190730125512.GF24038@mellanox.com>
References: <20190730055203.28467-1-hch@lst.de>
 <20190730055203.28467-8-hch@lst.de>
In-Reply-To: <20190730055203.28467-8-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::16)
 To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4bc70a7-fe8e-45cc-c196-08d714ed2be5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5024; 
x-ms-traffictypediagnostic: VI1PR05MB5024:
x-microsoft-antispam-prvs: <VI1PR05MB50244A1B80DB3F5AEDC14A54CFDC0@VI1PR05MB5024.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(189003)(199004)(7416002)(478600001)(66946007)(6512007)(25786009)(6436002)(4326008)(36756003)(6916009)(6246003)(64756008)(66446008)(229853002)(81156014)(81166006)(8676002)(53936002)(8936002)(66476007)(66556008)(316002)(1076003)(6486002)(54906003)(33656002)(6506007)(102836004)(386003)(186003)(26005)(14454004)(446003)(305945005)(3846002)(52116002)(6116002)(68736007)(71200400001)(71190400001)(2616005)(2906002)(11346002)(76176011)(7736002)(99286004)(14444005)(486006)(256004)(476003)(66066001)(86362001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5024;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: seS7Jwz+4z32gUu+IFL61rNNu+NyGMH2Zs2Rf82smPQvpQy9H0CfZVaRqXr2MNgzZLbpq/INxATsAMro+lA6s8JjXpPAml31L1SEoBtlYsMF2hB0rurCA1Wuz1vuR9LNXV0fcdanov+QuCkhbWRE+KKVf2ZesEStQf9a30+mO7U60dImwGOKZgGK3l8ojvmVuMiNkfPTAzzips9kGS/xb17byj4kxFARlPPRKTKBZxeeKotyP4FZAzRdzK9eo2ahoclqaKRWatS0N60FENE9LENjgj8qHzrUXvuqN2uNKcRjmbm11ORk2bGCnV+vAqNx+XlfIjhroVYnOn7VhJrINfjkbDt0x/77qru4+FoynSAef7UYQp5oI/AAOeLuyyFaKzupYGwVOUqvm87oo50MdiGU0K/f5M7hdp0YmDndQ+s=
Content-ID: <B20876FFD0ED7E4A83072CECCE1E8BF0@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4bc70a7-fe8e-45cc-c196-08d714ed2be5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 12:55:17.4155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5024
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idycEckcr4oa7t42lFd2XxOLcI8deGKjkgpKUBigHj0=;
 b=NzmrYNyZQrwD0nVDLtn3wIwZLHyWy/U7WzosHfXNY1L/eskmnwY2Ok/Ak3ArYv/l1/pbX02PcrcLFXBArFKfRbT/H5Y0mh+6rrdSrqwY5zg/WT77gpJCqpYYmTCThgHPtDgEJ9wEI4S+K3Xau9JUJCMsTMvh+ir/48W9/aCKc8A=
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

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDg6NTE6NTdBTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gQWxsIHVzZXJzIHBhc3MgUEFHRV9TSVpFIGhlcmUsIGFuZCBpZiB3ZSB3YW50
ZWQgdG8gc3VwcG9ydCBzaW5nbGUKPiBlbnRyaWVzIGZvciBodWdlIHBhZ2VzIHdlIHNob3VsZCBy
ZWFsbHkganVzdCBhZGQgYSBITU1fRkFVTFRfSFVHRVBBR0UKPiBmbGFnIGluc3RlYWQgdGhhdCB1
c2VzIHRoZSBodWdlIHBhZ2Ugc2l6ZSBpbnN0ZWFkIG9mIGhhdmluZyB0aGUKPiBjYWxsZXIgY2Fs
Y3VsYXRlIHRoYXQgc2l6ZSBvbmNlLCBqdXN0IGZvciB0aGUgaG1tIGNvZGUgdG8gdmVyaWZ5IGl0
LgoKSSBzdXNwZWN0IHRoaXMgd2FzIGFkZGVkIGZvciB0aGUgT0RQIGNvbnZlcnNpb24gdGhhdCBk
b2VzIHVzZSBib3RoCnBhZ2Ugc2l6ZXMuIEkgdGhpbmsgdGhlIE9EUCBjb2RlIGZvciB0aGlzIGlz
IGtpbmQgb2YgYnJva2VuLCBidXQgSQpoYXZlbid0IGRlbHZlZCBpbnRvIHRoYXQuLgoKVGhlIGNo
YWxsZW5nZSBpcyB0aGF0IHRoZSBkcml2ZXIgbmVlZHMgdG8ga25vdyB3aGF0IHBhZ2Ugc2l6ZSB0
bwpjb25maWd1cmUgdGhlIGhhcmR3YXJlIGJlZm9yZSBpdCBkb2VzIGFueSByYW5nZSBzdHVmZi4K
ClRoZSBvdGhlciBjaGFsbGVuZ2UgaXMgdGhhdCB0aGUgSFcgaXMgY29uZmlndXJlZCB0byBkbyBv
bmx5IG9uZSBwYWdlCnNpemUsIGFuZCBpZiB0aGUgdW5kZXJseWluZyBDUFUgcGFnZSBzaWRlIGNo
YW5nZXMgaXQgZ29lcyBzb3V0aC4KCldoYXQgSSB3b3VsZCBwcmVmZXIgaXMgaWYgdGhlIGRyaXZl
ciBjb3VsZCBzb21laG93IGR5bmFtaWNhbGx5IGFkanVzdAp0aGUgdGhlIHBhZ2Ugc2l6ZSBhZnRl
ciBlYWNoIGRtYSBtYXAsIGJ1dCBJIGRvbid0IGtub3cgaWYgT0RQIEhXIGNhbgpkbyB0aGF0LgoK
U2luY2UgdGhpcyBpcyBhbGwgZHJpdmluZyB0b3dhcmQgbWFraW5nIE9EUCB1c2UgdGhpcyBtYXli
ZSB3ZSBzaG91bGQKa2VlcCB0aGlzIEFQST8gCgpJJ20gbm90IHN1cmUgSSBjYW4gbG9vc2UgdGhl
IGNyYXBweSBodWdlIHBhZ2Ugc3VwcG9ydCBpbiBPRFAuCgpKYXNvbgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
