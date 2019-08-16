Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 072719116D
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB066EA86;
	Sat, 17 Aug 2019 15:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00063.outbound.protection.outlook.com [40.107.0.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27EF89B84;
 Fri, 16 Aug 2019 00:54:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRUiByGAjt+W4rbq/316E9SLLwvP3+pyJNIA9QYS7OeF0aCQOWiEM/VK12C/KXaURtZ4MURolXryqWDYRTr26JH11W07up0Ujs7xC1ykT8tqMo3amvSgWjNGt4Nf1Zbd9RtwOmZEOag88erZCtdsIwXWuR8J2NacPF3jUcpcHOQJq/vC2y3j8LFSzUa1cJc/3Cy8A5KzBaQrc9LCEKZhDfDRDnicCb31KJkKodGvzVTqlG6f4Pl3M9sqZzQhhh5YfH7J5NfUcZO6D7UH/FCPn5hfhTSLj7y4BU2VCYqIRe2Nbm0mmd9XXFm5MuCPK3ir3ZD0tb1+jsxQUwxhwdkFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwY8MbS2ae9WtsE6Q9UxT79gjFegHeEny7UCSsvSYuI=;
 b=cJIxQVLAl152MhG2qgfSYTB81iKh82n642Ol33b9z7yKJLAAxSIRo1d9IfMA3mhDMyiafqOsZ7LTf/WINPhCdGdKSolxDojVx08PuHJIwO8YxpLkUlECUEhvhs2X2deztAK2D2Pz9PxT2vDQYmEInK1O5xmGzL8DG46XyKa5jn15nHSH6Bzx/nIY9zHcrFaAba2fVU86p4dplh7l1+0Je941TcuD8d/ql1Yln48RoKtNohsuLYsIFLl1IuUpkV0OSlZewS1SNCorxFAHpqCkl/ALCupeU8eMId2wXsYknSsRdFuyj6e/m0DRKhjgQd6pl5rbTpbLqcqybsy6UocfIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6479.eurprd05.prod.outlook.com (20.179.27.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Fri, 16 Aug 2019 00:54:34 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7%6]) with mapi id 15.20.2178.016; Fri, 16 Aug 2019
 00:54:34 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: "Yang, Philip" <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH] mm/hmm: hmm_range_fault handle pages swapped out
Thread-Topic: [PATCH] mm/hmm: hmm_range_fault handle pages swapped out
Thread-Index: AQHVU6tqPJgEXxIoEkOKYOi6xfC1Fab88vqA
Date: Fri, 16 Aug 2019 00:54:34 +0000
Message-ID: <20190816005429.GD9929@mellanox.com>
References: <20190815205227.7949-1-Philip.Yang@amd.com>
In-Reply-To: <20190815205227.7949-1-Philip.Yang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQBPR0101CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::18) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dea49aa3-3fb5-4a34-ccf0-08d721e44de0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6479; 
x-ms-traffictypediagnostic: VI1PR05MB6479:
x-microsoft-antispam-prvs: <VI1PR05MB6479B893C951BF5616E25917CFAF0@VI1PR05MB6479.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(346002)(396003)(39850400004)(189003)(199004)(446003)(6512007)(64756008)(8936002)(8676002)(6506007)(478600001)(66556008)(76176011)(66446008)(54906003)(102836004)(305945005)(81156014)(53936002)(6116002)(7736002)(81166006)(2906002)(66476007)(3846002)(14454004)(4326008)(25786009)(256004)(6246003)(110136005)(66946007)(86362001)(386003)(52116002)(99286004)(14444005)(229853002)(33656002)(486006)(11346002)(316002)(36756003)(186003)(4744005)(6436002)(2616005)(66066001)(1076003)(71190400001)(5660300002)(26005)(71200400001)(476003)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6479;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CsmS3afi4x7IW3WXyP4l6K5lqN/aSqWhGjmmZb0hqKSyDJSR35A2Ljh+yUsUIefbjqtm4mu1YeuqVmqyuFTohQ+GowRJmfS5dqVRPV6NNW59VgzA04ul95SBbvVvqnvbDsq3RBupsADPMfWFJVbdpQTSvLwTj+4uf/YUe16Y5WKqOCq/KrK0YMJzCdmS8Ik4NeYCMr7qyMQQhfyhU7/jM5L5y54zWijRYc0e9l+t1QwVHJP/qIdRYxRSU4L8S/PuPMgAII5BI5Md4w5LiDphgQBzSRY7hZQEuZnxYxwrMJ42BCwd5v5jVwfA+9GarMgsiMyoIr32TOyhCyoNfuQGbjWqZk1Gw/Vvl2vpWf46cBj+yY4P71o5O37YxrvWNdBAGDFDvQcL5aFNFqWFbz0iF0W6FaNEDSXmISQz0g0aFsI=
x-ms-exchange-transport-forked: True
Content-ID: <156BFA0EFAA85449B09AE3B7C3825D33@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dea49aa3-3fb5-4a34-ccf0-08d721e44de0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 00:54:34.0651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QeReuAKldV6xUrDt/HB8x1EC4510QD5bDcoJdPz3JOb8IxVWTquESjcMukcMlF0CpD0goXAcjm29a7sVL9Gn8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6479
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwY8MbS2ae9WtsE6Q9UxT79gjFegHeEny7UCSsvSYuI=;
 b=HDOVeC3OLES1L5VCf4d5tw9DaLdSFSsehDC6K3NeRd7xtQb5qtbXUf0/LCw2fYX9tgCp91Um4XDxzFmCDncuSARMAWgmZnlux1R/+NaYSTnv6tASAqQzgK6i2tfCY0yDZIDlAKZhZNxI4gACPv+QElS5Viex57occpOIjC+a/z4=
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
Cc: "alex.deucher@amd.com" <alex.deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDg6NTI6NTZQTSArMDAwMCwgWWFuZywgUGhpbGlwIHdy
b3RlOgo+IGhtbV9yYW5nZV9mYXVsdCBtYXkgcmV0dXJuIE5VTEwgcGFnZXMgYmVjYXVzZSBzb21l
IG9mIHBmbnMgYXJlIGVxdWFsIHRvCj4gSE1NX1BGTl9OT05FLiBUaGlzIGhhcHBlbnMgcmFuZG9t
bHkgdW5kZXIgbWVtb3J5IHByZXNzdXJlLiBUaGUgcmVhc29uIGlzCj4gZm9yIHN3YXBwZWQgb3V0
IHBhZ2UgcHRlIHBhdGgsIGhtbV92bWFfaGFuZGxlX3B0ZSBkb2Vzbid0IHVwZGF0ZSBmYXVsdAo+
IHZhcmlhYmxlIGZyb20gY3B1X2ZsYWdzLCBzbyBpdCBmYWlsZWQgdG8gY2FsbCBobW1fdmFtX2Rv
X2ZhdWx0IHRvIHN3YXAKPiB0aGUgcGFnZSBpbi4KPgo+IFRoZSBmaXggaXMgdG8gY2FsbCBobW1f
cHRlX25lZWRfZmF1bHQgdG8gdXBkYXRlIGZhdWx0IHZhcmlhYmxlLgoKPiBDaGFuZ2UtSWQ6IEky
ZTg2MTE0ODU1NjNkMTFkOTM4ODgxYzE4Yjc5MzVmYTFlN2M5MWVlCgpJJ2xsIGZpeCBpdCBmb3Ig
eW91IGJ1dCBwbGVhc2UgYmUgY2FyZWZ1bCBub3QgdG8gc2VuZCBDaGFuZ2UtaWQncyB0bwp0aGUg
cHVibGljIGxpc3RzLgoKQWxzbyB3aGF0IGlzIHRoZSBGaXhlcyBsaW5lIGZvciB0aGlzPwoKPiBT
aWduZWQtb2ZmLWJ5OiBQaGlsaXAgWWFuZyA8UGhpbGlwLllhbmdAYW1kLmNvbT4KPiAgbW0vaG1t
LmMgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpSYWxwaCBoYXMg
YWxzbyBiZWVuIGxvb2tpbmcgYXQgdGhpcyBhcmVhIGFsc28gc28gSSdsbCBnaXZlIGhpbSBhIGJp
dAp0byBjaGltZSBpbiwgb3RoZXJ3aXNlIHdpdGggSmVyb21lJ3MgcmV2aWV3IHRoaXMgbG9va3Mg
T0sgdG8gZ28gdG8KbGludXgtbmV4dAoKVGhhbmtzLApKYXNvbgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
