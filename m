Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F548E6F5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878446E919;
	Thu, 15 Aug 2019 08:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130071.outbound.protection.outlook.com [40.107.13.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923DE6E5D8;
 Wed, 14 Aug 2019 13:27:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0dhX0lPYPL82ZsdcaXS7JDcikD9zKYnnxrRdomTvS6hIdmWyd0AAligDJxWX2BacpOWdKWn8a/KgTVSdeJC38wi15eTfH0N9v00nk2FDLI1772jpB483qdORm6jjoLYUAvSEFUR8VC7rYoIH7K41j42JwldzeKUdOcTKBZfB2+Eisvpo+xqQQshzWJipxd2DtO//sdBsRtMiMjw10q59xsNHFsa7YCsVQGtNAkYWogRyLkKKt66fXkRkX9cKNVer0zajNDVho8+HqbIkF4xsEpPXnRliuSn+/cgUirK5H3If3LikoqWer/xJ96SrHR7tWbilmjctejvIbWkK8k/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXtUnfBm/RmYoAdAhMp7g7aP3a+4ZFnCVZuMBoG+XJA=;
 b=faW9BtYTMouOQOLJ0ZOzoc2bXUx/NPgHX+Bwgx5sXGA0dABPzMA46LModighAG4WNJU5CN8CdPo5RFoSfVwVkKNLy4Ak34cAtIkxE24Mc006excaj2d/ydRrA+yGs7vetWdVprykgtyrVpY/yAAzdQJvix+TAKcs08XsxuNghnYQPkmG0DuSadeE/3bCtS46GHtl5bOmjsBIJETJ6NTSrqx24acSKihkkC+Z27Fuu3CKwf31ZVS1lvk2PZNy8I81dkvIw7PUvAQxcgo+jzwtPelg/hcspcTyK2GEy1NVjOIDrB194Z54Kbet/zrvZN8ANv2Fv0Q2TjTYvHduhHLXXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4543.eurprd05.prod.outlook.com (20.176.3.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Wed, 14 Aug 2019 13:27:51 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7%6]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 13:27:51 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
Thread-Topic: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
Thread-Index: AQHVTHDc5B4IgstYQk6yBJaVfn8xGqbv9wIAgAARNACAAMySgIAJE76AgABlPQCAAGF5AA==
Date: Wed, 14 Aug 2019 13:27:50 +0000
Message-ID: <20190814132746.GE13756@mellanox.com>
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-5-hch@lst.de> <20190807174548.GJ1571@mellanox.com>
 <CAPcyv4hPCuHBLhSJgZZEh0CbuuJNPLFDA3f-79FX5uVOO0yubA@mail.gmail.com>
 <20190808065933.GA29382@lst.de>
 <CAPcyv4hMUzw8vyXFRPe2pdwef0npbMm9tx9wiZ9MWkHGhH1V6w@mail.gmail.com>
 <20190814073854.GA27249@lst.de>
In-Reply-To: <20190814073854.GA27249@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: QB1PR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::38) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4cc061f5-56ad-4773-7c58-08d720bb3481
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB4543; 
x-ms-traffictypediagnostic: VI1PR05MB4543:
x-microsoft-antispam-prvs: <VI1PR05MB4543101E2F4E883967CA67AACFAD0@VI1PR05MB4543.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(39860400002)(136003)(346002)(189003)(199004)(6116002)(33656002)(7416002)(86362001)(11346002)(6916009)(2616005)(5660300002)(8676002)(476003)(14454004)(6246003)(7736002)(25786009)(54906003)(1076003)(26005)(102836004)(3846002)(66066001)(316002)(186003)(8936002)(305945005)(81166006)(2906002)(478600001)(52116002)(6512007)(76176011)(99286004)(71190400001)(6436002)(229853002)(71200400001)(256004)(446003)(66446008)(66556008)(386003)(6486002)(6506007)(66476007)(64756008)(486006)(36756003)(4326008)(81156014)(66946007)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4543;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Vs9ITQhDo95Y04P7vJSqSGZG48VlfvfPENlCo1dwgbyOptbvw1pd2E1mK3POI+WEgDsqmUBS4RMZInyDX3g62MvJ16dEjM+owZnp17xkqnaVeKjELYMDp0KjC7FTz+1/xPuOF5qdDQiRHBBkcTBvl3bPKQGJHWkOGSICXO3U41R+fsyeueZt4AF/iVe9KGEh0B1WnyYvp3NNJGE1Jc4rFHAUK0uexqgFjSt/RtrBRXiaTfDoNZ2i3mR2GxGhND+T7rH/3P+RptLFNJtizlvJ+NzM+nRyKAaL5ii04o9jSIu+QNPEKqd6F+Qe6O1wSgaWM6Sz/eAeeLMvhLnh+gfKuTU8jVQ775LxRCSTRTxrWXGDXvu0o5tzQI2BKBW7YP6DtNfNJrMs8A2j+PCaBvHcUN7bDO1EAdnJAKQaypE2Zps=
x-ms-exchange-transport-forked: True
Content-ID: <EF42566A523CE142A2EFF155B9958285@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc061f5-56ad-4773-7c58-08d720bb3481
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 13:27:50.9468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IMnZjJw4rXdPNRe7707GHxiF1SFEJxFKOQBVTYGk2VFuwM9F8tUpkMTyYxiO1iPafyZWUOCAlqhQrz4SzCWVzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4543
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXtUnfBm/RmYoAdAhMp7g7aP3a+4ZFnCVZuMBoG+XJA=;
 b=REGzqX535jrPExQjR5xop/jXEm/IxuOijqgwwc6zKwXToowceUci3aqLFuamW3LKc5fuXmgXx7d4HKFSCMjRshfW1mIexxsZmXS/+/RHMyqI0LSrzEuhcVTONQSyBo4gt1cH9naEiTOXcyN4tF9J+rNFx7ieP/xDF5aZOIxvUU0=
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
 Ben Skeggs <bskeggs@redhat.com>, Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDk6Mzg6NTRBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDY6MzY6MzNQTSAtMDcwMCwgRGFu
IFdpbGxpYW1zIHdyb3RlOgo+ID4gU2VjdGlvbiBhbGlnbm1lbnQgY29uc3RyYWludHMgc29tZXdo
YXQgc2F2ZSB1cyBoZXJlLiBUaGUgb25seSBleGFtcGxlCj4gPiBJIGNhbiB0aGluayBvZiBhIFBN
RCBub3QgY29udGFpbmluZyBhIHVuaWZvcm0gcGdtYXAgYXNzb2NpYXRpb24gZm9yCj4gPiBlYWNo
IHB0ZSBpcyB0aGUgY2FzZSB3aGVuIHRoZSBwZ21hcCBvdmVybGFwcyBub3JtYWwgZHJhbSwgaS5l
LiBzaGFyZXMKPiA+IHRoZSBzYW1lICdzdHJ1Y3QgbWVtb3J5X3NlY3Rpb24nIGZvciBhIGdpdmVu
IHNwYW4uIE90aGVyd2lzZSwgZGlzdGluY3QKPiA+IHBnbWFwcyBhcnJhbmdlIHRvIG1hbmFnZSB0
aGVpciBvd24gZXhjbHVzaXZlIHNlY3Rpb25zIChhbmQgbm93Cj4gPiBzdWJzZWN0aW9ucyBhcyBv
ZiB2NS4zKS4gT3RoZXJ3aXNlIHRoZSBpbXBsZW1lbnRhdGlvbiBjb3VsZCBub3QKPiA+IGd1YXJh
bnRlZSBkaWZmZXJlbnQgbWFwcGluZyBsaWZldGltZXMuCj4gPiAKPiA+IFRoYXQgc2FpZCwgdGhp
cyBzZWVtcyB0byB3YW50IGEgYmV0dGVyIG1lY2hhbmlzbSB0byBkZXRlcm1pbmUgInBmbiBpcwo+
ID4gWk9ORV9ERVZJQ0UiLgo+IAo+IFNvIEkgZ3Vlc3MgdGhpcyBwYXRjaCBpcyBmaW5lIGZvciBu
b3csIGFuZCBvbmNlIHlvdSBwcm92aWRlIGEgYmV0dGVyCj4gbWVjaGFuaXNtIHdlIGNhbiBzd2l0
Y2ggb3ZlciB0byBpdD8KCldoYXQgYWJvdXQgdGhlIHZlcnNpb24gSSBzZW50IHRvIGp1c3QgZ2V0
IHJpZCBvZiBhbGwgdGhlIHN0cmFuZ2UKcHV0X2Rldl9wYWdlbWFwcyB3aGlsZSBzY2FubmluZz8g
T2RkcyBhcmUgZ29vZCB3ZSB3aWxsIHdvcmsgd2l0aCBvbmx5CmEgc2luZ2xlIHBhZ2VtYXAsIHNv
IGl0IG1ha2VzIHNvbWUgc2Vuc2UgdG8gY2FjaGUgaXQgb25jZSB3ZSBmaW5kIGl0PwoKZGlmZiAt
LWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKaW5kZXggOWE5MDg5MDJlNGNjMzguLjRlMzAxMjhj
MjNhNTA1IDEwMDY0NAotLS0gYS9tbS9obW0uYworKysgYi9tbS9obW0uYwpAQCAtNDk3LDEwICs0
OTcsNiBAQCBzdGF0aWMgaW50IGhtbV92bWFfaGFuZGxlX3BtZChzdHJ1Y3QgbW1fd2FsayAqd2Fs
aywKIAkJfQogCQlwZm5zW2ldID0gaG1tX2RldmljZV9lbnRyeV9mcm9tX3BmbihyYW5nZSwgcGZu
KSB8IGNwdV9mbGFnczsKIAl9Ci0JaWYgKGhtbV92bWFfd2Fsay0+cGdtYXApIHsKLQkJcHV0X2Rl
dl9wYWdlbWFwKGhtbV92bWFfd2Fsay0+cGdtYXApOwotCQlobW1fdm1hX3dhbGstPnBnbWFwID0g
TlVMTDsKLQl9CiAJaG1tX3ZtYV93YWxrLT5sYXN0ID0gZW5kOwogCXJldHVybiAwOwogI2Vsc2UK
QEAgLTYwNCwxMCArNjAwLDYgQEAgc3RhdGljIGludCBobW1fdm1hX2hhbmRsZV9wdGUoc3RydWN0
IG1tX3dhbGsgKndhbGssIHVuc2lnbmVkIGxvbmcgYWRkciwKIAlyZXR1cm4gMDsKIAogZmF1bHQ6
Ci0JaWYgKGhtbV92bWFfd2Fsay0+cGdtYXApIHsKLQkJcHV0X2Rldl9wYWdlbWFwKGhtbV92bWFf
d2Fsay0+cGdtYXApOwotCQlobW1fdm1hX3dhbGstPnBnbWFwID0gTlVMTDsKLQl9CiAJcHRlX3Vu
bWFwKHB0ZXApOwogCS8qIEZhdWx0IGFueSB2aXJ0dWFsIGFkZHJlc3Mgd2Ugd2VyZSBhc2tlZCB0
byBmYXVsdCAqLwogCXJldHVybiBobW1fdm1hX3dhbGtfaG9sZV8oYWRkciwgZW5kLCBmYXVsdCwg
d3JpdGVfZmF1bHQsIHdhbGspOwpAQCAtNjkwLDE2ICs2ODIsNiBAQCBzdGF0aWMgaW50IGhtbV92
bWFfd2Fsa19wbWQocG1kX3QgKnBtZHAsCiAJCQlyZXR1cm4gcjsKIAkJfQogCX0KLQlpZiAoaG1t
X3ZtYV93YWxrLT5wZ21hcCkgewotCQkvKgotCQkgKiBXZSBkbyBwdXRfZGV2X3BhZ2VtYXAoKSBo
ZXJlIGFuZCBub3QgaW4gaG1tX3ZtYV9oYW5kbGVfcHRlKCkKLQkJICogc28gdGhhdCB3ZSBjYW4g
bGV2ZXJhZ2UgZ2V0X2Rldl9wYWdlbWFwKCkgb3B0aW1pemF0aW9uIHdoaWNoCi0JCSAqIHdpbGwg
bm90IHJlLXRha2UgYSByZWZlcmVuY2Ugb24gYSBwZ21hcCBpZiB3ZSBhbHJlYWR5IGhhdmUKLQkJ
ICogb25lLgotCQkgKi8KLQkJcHV0X2Rldl9wYWdlbWFwKGhtbV92bWFfd2Fsay0+cGdtYXApOwot
CQlobW1fdm1hX3dhbGstPnBnbWFwID0gTlVMTDsKLQl9CiAJcHRlX3VubWFwKHB0ZXAgLSAxKTsK
IAogCWhtbV92bWFfd2Fsay0+bGFzdCA9IGFkZHI7CkBAIC03NTEsMTAgKzczMyw2IEBAIHN0YXRp
YyBpbnQgaG1tX3ZtYV93YWxrX3B1ZChwdWRfdCAqcHVkcCwKIAkJCXBmbnNbaV0gPSBobW1fZGV2
aWNlX2VudHJ5X2Zyb21fcGZuKHJhbmdlLCBwZm4pIHwKIAkJCQkgIGNwdV9mbGFnczsKIAkJfQot
CQlpZiAoaG1tX3ZtYV93YWxrLT5wZ21hcCkgewotCQkJcHV0X2Rldl9wYWdlbWFwKGhtbV92bWFf
d2Fsay0+cGdtYXApOwotCQkJaG1tX3ZtYV93YWxrLT5wZ21hcCA9IE5VTEw7Ci0JCX0KIAkJaG1t
X3ZtYV93YWxrLT5sYXN0ID0gZW5kOwogCQlyZXR1cm4gMDsKIAl9CkBAIC0xMDI2LDYgKzEwMDQs
MTQgQEAgbG9uZyBobW1fcmFuZ2VfZmF1bHQoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsIHVuc2ln
bmVkIGludCBmbGFncykKIAkJCS8qIEtlZXAgdHJ5aW5nIHdoaWxlIHRoZSByYW5nZSBpcyB2YWxp
ZC4gKi8KIAkJfSB3aGlsZSAocmV0ID09IC1FQlVTWSAmJiByYW5nZS0+dmFsaWQpOwogCisJCS8q
CisJCSAqIFdlIGRvIHB1dF9kZXZfcGFnZW1hcCgpIGhlcmUgc28gdGhhdCB3ZSBjYW4gbGV2ZXJh
Z2UKKwkJICogZ2V0X2Rldl9wYWdlbWFwKCkgb3B0aW1pemF0aW9uIHdoaWNoIHdpbGwgbm90IHJl
LXRha2UgYQorCQkgKiByZWZlcmVuY2Ugb24gYSBwZ21hcCBpZiB3ZSBhbHJlYWR5IGhhdmUgb25l
LgorCQkgKi8KKwkJaWYgKGhtbV92bWFfd2Fsay0+cGdtYXApCisJCQlwdXRfZGV2X3BhZ2VtYXAo
aG1tX3ZtYV93YWxrLT5wZ21hcCk7CisKIAkJaWYgKHJldCkgewogCQkJdW5zaWduZWQgbG9uZyBp
OwogCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
