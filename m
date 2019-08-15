Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A1091172
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A8F6EA45;
	Sat, 17 Aug 2019 15:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10043.outbound.protection.outlook.com [40.107.1.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339446EA66;
 Thu, 15 Aug 2019 19:46:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AejlJQM/OKLo2+k9TEkPp1nwsFoCCBMUqabBrzobO/QgkF4UIemLMS5WECx4sEdhgaSfcfmDQ+/SQhbLZ4r59pUeJCc3lAeCZQ6vuki57qRbUoF1+PWn+a0seJnkj99cpZumNVSok4Kjv+UiCWnmgc+1aAnLe/OhUZJAAP+tf+wRK/mM5BmjtiHzRh+O4Ix3G7WrPBWJDotqMfjVraeXlnTweT0BpFKfQpITo9fkWgDElkZGVQZBGsSs1tVxRmp+fHXlzR7Pag9Wk+Z24qQw5+86y8k36KHggTX6MSD9wyd920v3i5j/id8EnaYLOnneF0YQjwBAR+Gq5/qrfIOk2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0BTBF8kBiLrHFHJkVGaHXIMzhmWMU/iNoD1oXuo9IM=;
 b=a4g93HA7YNi34/bB4mruBaU4piOs7lnki1BwSA/APcFccMD19aOE9Sm2VLWqWJTVM0lpof2gLxiW2pw6HA/LZrTRsVdpyoeetpsa7C0WArGdUZwQR7ikuYt/z0XCx/747M1//XgjrLw/9TnMGAgh1jSyrRbKX3Ls1Nt2c42/hgvmK8hBqr7UpVgHOkUgqL+KytTXfPk9dXIY1O3QrKgEheIq/9ehx687zVu56ly0WldAhaRJiYRYwT1xj+H4t9j0L5VWXPqy4eQ0maartBDvYwe6uFwT3r0eT5uDQae8t2Cctkn6Amj73GwGiepIYsbH2Z2ygmBvgIv1euplWTH4Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5168.eurprd05.prod.outlook.com (20.178.10.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Thu, 15 Aug 2019 19:46:26 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7%6]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 19:46:26 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: "christian.koenig@amd.com" <christian.koenig@amd.com>
Subject: Re: [PATCH v3 hmm 08/11] drm/radeon: use mmu_notifier_get/put for
 struct radeon_mn
Thread-Topic: [PATCH v3 hmm 08/11] drm/radeon: use mmu_notifier_get/put for
 struct radeon_mn
Thread-Index: AQHVTKz1YDgPM7GGLU27kR5zKXuwhab77XGAgAC9boA=
Date: Thu, 15 Aug 2019 19:46:26 +0000
Message-ID: <20190815194621.GF22970@mellanox.com>
References: <20190806231548.25242-1-jgg@ziepe.ca>
 <20190806231548.25242-9-jgg@ziepe.ca>
 <2baff2e5-b923-c39b-98e5-b3e7f77bd6d3@gmail.com>
In-Reply-To: <2baff2e5-b923-c39b-98e5-b3e7f77bd6d3@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQBPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::34) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28c89de1-b5a2-4a9a-c12d-08d721b9428c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5168; 
x-ms-traffictypediagnostic: VI1PR05MB5168:
x-microsoft-antispam-prvs: <VI1PR05MB51681C1EF442D179C3BE8696CFAC0@VI1PR05MB5168.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(199004)(189003)(6506007)(305945005)(2351001)(11346002)(36756003)(186003)(2616005)(102836004)(7416002)(66476007)(14454004)(64756008)(66556008)(26005)(486006)(446003)(66446008)(76176011)(476003)(66946007)(386003)(5660300002)(52116002)(7736002)(4326008)(316002)(256004)(66066001)(71200400001)(2906002)(33656002)(54906003)(81166006)(8676002)(1076003)(6512007)(25786009)(81156014)(71190400001)(6486002)(3846002)(6116002)(66574012)(99286004)(53936002)(478600001)(5640700003)(229853002)(86362001)(6916009)(8936002)(6246003)(6436002)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5168;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fILogM5ET6wCipH9DgoM3HqNITLwlrxJI2cgDafFx5J9icOy7soEV1u/6g/yFdRMglGjJikP8+X19/UX2lPTWyn+kxdMSMeD9cwhCSRrEAf6IuXOSlStS2IlrXHAEwvuJsqLp5ge8B5d+0MmE+0r7yT0ZiU82tFXz5lbVuFw7DmiCVKKmmmlj8UQgiI24v1LSAU09TWm7MpD2LTXmaTWVRHr6ZSmxFsNjbM+HHP6Iwlry4K9Dk/WDEXiUSWcqKuutbYNNOGSsNMra+0+54JMj4OwFocKLSrhWQBRu44Ap37S7KztIlp0xPX49c+2Uhcjz4N37WYO2tBC/Gj0RNFzoMvtiHin7s6yAiSuwO9tVerzA2tGBUDCS1Y3LvB0BPJSMPfVYE119C2WMnrvNyrimbmyChHdxlSOiMvOrFTpN5k=
x-ms-exchange-transport-forked: True
Content-ID: <2697329F3A1E3A4682A1061BFB978A84@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c89de1-b5a2-4a9a-c12d-08d721b9428c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 19:46:26.7080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wr44nuzrOFqyQ8CDBnIZBpKKVc1F/faVzxn1IB0CV8N2pnaiWwXawzoXNPWFVXppCL/XneYKDHgeBk/kLVkTpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5168
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0BTBF8kBiLrHFHJkVGaHXIMzhmWMU/iNoD1oXuo9IM=;
 b=NOCyQ0RJptuOlGmC66pGD1CZi5Sr530aX0F//3KLxm8rlhs/T8hWJXKdOwFXsqgg4U5DpcEpUq2cMksGRMqM689bq0J8wZKL+T+7aLbxir19IBnoxXB+lxgu3kB0tHl1YZb/1IY3Cy3az7xAZzldEgmQy3FJGB62PmZoDQA6yQU=
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
 Ralph Campbell <rcampbell@nvidia.com>, Dimitri Sivanich <sivanich@sgi.com>,
 Gavin Shan <shangw@linux.vnet.ibm.com>, Andrea Righi <andrea@betterlinux.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTA6Mjg6MjFBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToNCj4gQW0gMDcuMDguMTkgdW0gMDE6MTUgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6
DQo+ID4gRnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPg0KPiA+IA0KPiA+
IHJhZGVvbiBpcyB1c2luZyBhIGRldmljZSBnbG9iYWwgaGFzaCB0YWJsZSB0byB0cmFjayB3aGF0
IG1tdV9ub3RpZmllcnMNCj4gPiBoYXZlIGJlZW4gcmVnaXN0ZXJlZCBvbiBzdHJ1Y3QgbW0uIFRo
aXMgaXMgYmV0dGVyIHNlcnZlZCB3aXRoIHRoZSBuZXcNCj4gPiBnZXQvcHV0IHNjaGVtZSBpbnN0
ZWFkLg0KPiA+IA0KPiA+IHJhZGVvbiBoYXMgYSBidWcgd2hlcmUgaXQgd2FzIG5vdCBibG9ja2lu
ZyBub3RpZmllciByZWxlYXNlKCkgdW50aWwgYWxsDQo+ID4gdGhlIEJPJ3MgaGFkIGJlZW4gaW52
YWxpZGF0ZWQuIFRoaXMgY291bGQgcmVzdWx0IGluIGEgdXNlIGFmdGVyIGZyZWUgb2YNCj4gPiBw
YWdlcyB0aGUgQk9zLiBUaGlzIGlzIHRpZWQgaW50byBhIHNlY29uZCBidWcgd2hlcmUgcmFkZW9u
IGxlZnQgdGhlDQo+ID4gbm90aWZpZXJzIHJ1bm5pbmcgZW5kbGVzc2x5IGV2ZW4gb25jZSB0aGUg
aW50ZXJ2YWwgdHJlZSBiZWNhbWUNCj4gPiBlbXB0eS4gVGhpcyBjb3VsZCByZXN1bHQgaW4gYSB1
c2UgYWZ0ZXIgZnJlZSB3aXRoIG1vZHVsZSB1bmxvYWQuDQo+ID4gDQo+ID4gQm90aCBhcmUgZml4
ZWQgYnkgY2hhbmdpbmcgdGhlIGxpZmV0aW1lIG1vZGVsLCB0aGUgQk9zIGV4aXN0IGluIHRoZQ0K
PiA+IGludGVydmFsIHRyZWUgd2l0aCB0aGVpciBuYXR1cmFsIGxpZmV0aW1lcyBpbmRlcGVuZGVu
dCBvZiB0aGUgbW1fc3RydWN0DQo+ID4gbGlmZXRpbWUgdXNpbmcgdGhlIGdldC9wdXQgc2NoZW1l
LiBUaGUgcmVsZWFzZSBydW5zIHN5bmNocm9ub3VzbHkgYW5kIGp1c3QNCj4gPiBkb2VzIGludmFs
aWRhdGVfc3RhcnQgYWNyb3NzIHRoZSBlbnRpcmUgaW50ZXJ2YWwgdHJlZSB0byBjcmVhdGUgdGhl
DQo+ID4gcmVxdWlyZWQgRE1BIGZlbmNlLg0KPiA+IA0KPiA+IEFkZGl0aW9ucyB0byB0aGUgaW50
ZXJ2YWwgdHJlZSBhZnRlciByZWxlYXNlIGFyZSBhbHJlYWR5IGltcG9zc2libGUgYXMNCj4gPiBv
bmx5IGN1cnJlbnQtPm1tIGlzIHVzZWQgZHVyaW5nIHRoZSBhZGQuDQo+ID4gDQo+ID4gU2lnbmVk
LW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPg0KPiANCj4gQWNrZWQt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCg0KVGhhbmtz
IQ0KDQo+IEJ1dCBJJ20gd29uZGVyaW5nIGlmIHdlIHNob3VsZG4ndCBjb21wbGV0ZWx5IGRyb3Ag
cmFkZW9uIHVzZXJwdHIgc3VwcG9ydC4NCj4gSXQncyBqdXN0IHRvIGJ1Z2d5LA0KDQpJIHdvdWxk
IG5vdCBvYmplY3QgOikNCg0KSmFzb24NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
