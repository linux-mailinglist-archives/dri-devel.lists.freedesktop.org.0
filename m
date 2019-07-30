Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BBD7BA5E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31CF6E68F;
	Wed, 31 Jul 2019 07:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150089.outbound.protection.outlook.com [40.107.15.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDFA6E4C9;
 Tue, 30 Jul 2019 12:36:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jI5SRYAnYIijNuRmwtKcwNBZkTDnhieVRH34qMcZ4WzTdo7uUpXyMnuqnfI68UqSEyg+KZPCNP2z0TYFYNotnapVNhSpbN7iq2/D2GCXJutL0A0DDOI8dZsWyXVb0zAeQcAlOyca/sTgdW5NWkAdEVufCa6xa+b3tjliS0Z1btqZL2lGOW+U9B3LkYnRicQ+S80Q21FAMgKHUObOKakMlF5iTNZo4MKtRy3FLrmd6cwcynFRG/Ww2pJACJw0NayEdPeUybuZ+4fDSVMcr1fBu+d3Wk2JHMmZP+zqZFJ0B6EIp0u9zG9V9kGtiXRry2uLdtJm+fwKrkYlagHHP6Nq/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4TVTJA+gABdiNdlWD+jMmeLLVFPhepHDShRadvZNbo=;
 b=nUqBXkJuK6v7z+Hu5fwJcW8E60lrTQ/0sUegpfW9vJrGszv6eh8e6JYw5SXdDxYuApK7gzGlwqTPwuLHA0T+UF6xE6ebVpBLZHb/GIUOh7t2InSHvZd18OIDxfJU+99yrdRd2KtAt+qkRJkhyqVIky4Mlw1SM6wpcFQLG/Oe2d1BAQSZpJ2GHa7nVTUURnPkZQFtkEbQA02AMuDebI9y7kVU50LCHDiIP6LyPpcMGzimXhAwNBG3Pu5uVT7b5F3HGyCLwH9t9zpURAB9hvTQYRnv1nt7Z3QV6pyhoqE4Pb0lLsEwNF2GGR3dnpKuyAxMmqXi0/Qta61gb0Kmp1V+iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4285.eurprd05.prod.outlook.com (52.133.12.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 12:36:00 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 12:36:00 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/13] nouveau: pass struct nouveau_svmm to
 nouveau_range_fault
Thread-Topic: [PATCH 03/13] nouveau: pass struct nouveau_svmm to
 nouveau_range_fault
Thread-Index: AQHVRpr4kL6aKlcudUqEUBBy4/lXjabjGXIA
Date: Tue, 30 Jul 2019 12:35:59 +0000
Message-ID: <20190730123554.GD24038@mellanox.com>
References: <20190730055203.28467-1-hch@lst.de>
 <20190730055203.28467-4-hch@lst.de>
In-Reply-To: <20190730055203.28467-4-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::47) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bcaac139-dd9c-43d2-96c3-08d714ea79eb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB4285; 
x-ms-traffictypediagnostic: VI1PR05MB4285:
x-microsoft-antispam-prvs: <VI1PR05MB4285D71442379CCEE6F90061CFDC0@VI1PR05MB4285.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(199004)(189003)(4744005)(186003)(66066001)(36756003)(1076003)(7736002)(52116002)(446003)(26005)(66946007)(305945005)(6246003)(102836004)(6486002)(54906003)(486006)(386003)(6506007)(76176011)(11346002)(66446008)(66556008)(64756008)(316002)(99286004)(4326008)(476003)(256004)(53936002)(2616005)(229853002)(33656002)(6116002)(8676002)(3846002)(71200400001)(6916009)(81156014)(5660300002)(66476007)(68736007)(6436002)(478600001)(6512007)(8936002)(86362001)(25786009)(7416002)(14454004)(81166006)(71190400001)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4285;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Q2KmhPGNj5HjLnOX9wOLnVhYsnoFZFzOMElEIQGQqevpRB/pG6O+y7IcfQYAN21ZMM1bvNXKsQo8PV/7BTUZMJt75GrDG8o8Ix76UrZiqRtxfcBTUTC9wdIsymwHmQfjHQz2YYg/0Me+wMfmRsKmCWZY7EwoIKoQIjfrwRLxA9XsMA35yxIOrZPa4Ire9MSa0jhyvbRoVB9eiKJzIAx2YfGX8m+K1RbnbHxOS4qGjEibdrG8gguS7MAIx4WH/gaVEusQ9tU+5RgSCggbBO/n/6YhMTOdoXZwlEC4Pr9yeto17BbWFFYb+DGnalIpxQjsozwl02R1hiyFH5G8U7as7+mTEB3A8dGF0rDFeclmJRnY2OKQMEuyJVlHS94c4zbt3l/0sWFdSDEGWh7kPK3HaFzr0ab5k65cT7g4AElZrSc=
Content-ID: <673CF3972C47014CA0CAB676E69F0322@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcaac139-dd9c-43d2-96c3-08d714ea79eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 12:35:59.8778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4285
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4TVTJA+gABdiNdlWD+jMmeLLVFPhepHDShRadvZNbo=;
 b=cC9lMLgmA4esewA20G85rm4Y8IYUa7nrfI0s7JgmMJITmXpDAShtXEkBgfdEUgaBYJij/9Y27e/EG6Uo4FQM4wYAJouNjl62YsgvIc1qjnPH2yKu5VMsN08jcLcM52CxmVGoR1MGxZcSsQKyU2aPAhLwWI8kP8B7kIZ+myrcB2s=
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

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDg6NTE6NTNBTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhpcyBhdm9pZCBoYXZpbmcgdG8gYWJ1c2UgdGhlIHZtYSBmaWVsZCBpbiBz
dHJ1Y3QgaG1tX3JhbmdlIHRvIHVubG9jawo+IHRoZSBtbWFwX3NlbS4KCkkgdGhpbmsgdGhlIGNo
YW5nZSBpbnNpZGUgaG1tX3JhbmdlX2ZhdWx0IGdvdCBsb3N0IG9uIHJlYmFzZSwgaXQgaXMKbm93
IHVzaW5nOgoKICAgICAgICAgICAgICAgIHVwX3JlYWQoJnJhbmdlLT5obW0tPm1tLT5tbWFwX3Nl
bSk7CgpCdXQsIHllcywgbGV0cyBjaGFuZ2UgaXQgdG8gdXNlIHN2bW0tPm1tIGFuZCB0cnkgdG8g
a2VlcCBzdHJ1Y3QgaG1tCm9wYXF1ZSB0byBkcml2ZXJzCgpKYXNvbgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
