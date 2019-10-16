Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 710E1D89A6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 09:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B737D6E8EC;
	Wed, 16 Oct 2019 07:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50078.outbound.protection.outlook.com [40.107.5.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423946E8C7;
 Wed, 16 Oct 2019 06:35:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHjZja0kK75zVZJXN0obWJYCHFfg6D5jLTweSxqpoQN2RY4SsUkZ/YqbSf8vtDdlw7mbwmLPQG+VeuQhUR+GBSLx3+OO9O7MCpAPO4GpLc5h1ESC4SoXh9fla34jeujyKulYj/+RpiZi797ZWFkg9gYc6sEgOJ2fs/1x2W2+sK+QOmqv4nWJ2fX0reHHFBk54mvIknWHerkkVh9q3soHYt9ZFTOuy2hHcOoPex1vgG9fOPr7yS3whwi/VTjWTjvJbAgO9bk4lrjkNnvLU2xjZVJ7f/WLlqaOYFg+YW2303oUJ/tyGXfSVV9oaORx3MbEQUfBPckZPrtwaKN8A0Lm+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYW+YYY0n9I0d4d+DBl+KzHO2JXYaXPLNzGanMnC4f0=;
 b=NSpSIslOBLCDAOB2Fl9LBVQHunHXX5857/2aJTlBYdzUw5Z409gAR1F+9G/nVG3SElIdiJe8/daFgR72ZilpMVaFQZrKhVj2ycMBoOxx+a4VBcE40oZGnXWah1HHKeub8ku/RbFsD8AXa+mC7od3zEbfQnS4KD2gExsrOhuAojcAm/B6ai3Pfb337pMZzt0QYENOMLMHs7yaShGw7uLknj2jPG0lSX1yBQS5YiHruWuWW1+xmKB98GYRtt/2XOZ/dlChaJb9SWLHleCA5dAQQraaWX9LiIn/Jj7CvPfxRo8QTeaE5jDu4WXRGbdrCxSODp9AvCzvYdAshYscGYT2TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
Received: from AM6PR03MB5958.eurprd03.prod.outlook.com (10.255.122.93) by
 AM6PR03MB5313.eurprd03.prod.outlook.com (10.255.98.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Wed, 16 Oct 2019 06:35:15 +0000
Received: from AM6PR03MB5958.eurprd03.prod.outlook.com
 ([fe80::21:60d7:a2a6:12f0]) by AM6PR03MB5958.eurprd03.prod.outlook.com
 ([fe80::21:60d7:a2a6:12f0%5]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 06:35:15 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>, John
 Hubbard <jhubbard@nvidia.com>, Ralph Campbell <rcampbell@nvidia.com>, Jerome
 Glisse <jglisse@redhat.com>
Subject: Re: [PATCH hmm 08/15] xen/gntdev: Use select for DMA_SHARED_BUFFER
Thread-Topic: [PATCH hmm 08/15] xen/gntdev: Use select for DMA_SHARED_BUFFER
Thread-Index: AQHVg4SsfIDuaxZr3kiqa77y9Sk4sqdcuS2AgAAXhQA=
Date: Wed, 16 Oct 2019 06:35:15 +0000
Message-ID: <91329d7d-9db5-057e-59d2-887254083da0@epam.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <20191015181242.8343-9-jgg@ziepe.ca>
 <6f60f558-20db-1749-044d-a46697258c39@suse.com>
In-Reply-To: <6f60f558-20db-1749-044d-a46697258c39@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66b699a0-3a97-4a2b-82d0-08d752030150
x-ms-traffictypediagnostic: AM6PR03MB5313:
x-microsoft-antispam-prvs: <AM6PR03MB5313F90F1EEB5E6DEBD51754E7920@AM6PR03MB5313.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(199004)(189003)(6506007)(66946007)(71190400001)(7416002)(26005)(91956017)(64756008)(66556008)(55236004)(86362001)(71200400001)(229853002)(6436002)(66446008)(14454004)(53546011)(305945005)(31686004)(7736002)(36756003)(66066001)(76116006)(76176011)(99286004)(6486002)(102836004)(66476007)(6246003)(4326008)(316002)(25786009)(256004)(8676002)(8936002)(31696002)(186003)(110136005)(2906002)(4744005)(54906003)(81166006)(80792005)(478600001)(2501003)(446003)(5660300002)(486006)(476003)(11346002)(6116002)(3846002)(2616005)(6512007)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB5313;
 H:AM6PR03MB5958.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3t1DxRhWg8tp6PiI8rK8LhBReeNhGsp2iS0UCL+6eOgqGLdwyDNBFk0iGLbvP+aeW1AiAV0Pg5p3ZHEwNsonxwUJDv6LGl+rGZkqyIQ6tkHnBRKpNbwFgTi0DSUQYMwVnfqIDEYKl0/i+XSuwSlm8EUhjjhYdkazhnH/kzsw8U+kz8Ij6B9S/ks3f8+5hrxKefquu8wrv1uQclXPmIvw8fnkGPGQmg1Z3VeIdEhx57XCL/b1me5bdNXoc/B/Cg4uFosZw0SF69bKjiRQL60+Ky/YgTd4s1tkynePuuJH4dFatGJVLnUHgWj4VXWRDR5PFpZmn/3uCXYOtSjk4X6ZYYwuz0/p2qtgd+JxL06GbiilCsbt+nZ+hRfqIOFGkJOSjf2XP6pBeEGaLHsCx9XNyw2MIGrPrUkylE93jTWnOdY=
x-ms-exchange-transport-forked: True
Content-ID: <0DCA343868ACE14DBA74BEE632E7932A@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b699a0-3a97-4a2b-82d0-08d752030150
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 06:35:15.6187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ep16Y0l+Y6mbwoA38ndtRwMPJkKUWVvkY8J2LB3y5JANKR7ATjFgM87ClAow1tZxjJ9dD2JcNAAT44VPEt9ItAh2IEAlL37A8sX/nUwyOh2vmgEmxIlnhj9umWgCthgE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5313
X-Mailman-Approved-At: Wed, 16 Oct 2019 07:33:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYW+YYY0n9I0d4d+DBl+KzHO2JXYaXPLNzGanMnC4f0=;
 b=RSWGAmc1BNzAGoAL3ebLlN1UsGkitAoaRvv6p1R2hwoOgMVK0i9ozmEyRJdqhIeu9kWSUkXq0z8Vr9zj26mv0AnMEJ827V+JQlaJ4baIW7j1L28itzK/JTpqNlP30wiLgaarJm/IZ7JXsUt5dExoDLF1sczhj9iBBsj1BlPbR7k=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oleksandr_Andrushchenko@epam.com; 
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
 Stefano Stabellini <sstabellini@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMTYvMTkgODoxMSBBTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4gT24gMTUuMTAuMTkg
MjA6MTIsIEphc29uIEd1bnRob3JwZSB3cm90ZToNCj4+IEZyb206IEphc29uIEd1bnRob3JwZSA8
amdnQG1lbGxhbm94LmNvbT4NCj4+DQo+PiBETUFfU0hBUkVEX0JVRkZFUiBjYW4gbm90IGJlIGVu
YWJsZWQgYnkgdGhlIHVzZXIgKGl0IHJlcHJlc2VudHMgYSANCj4+IGxpYnJhcnkNCj4+IHNldCBp
biB0aGUga2VybmVsKS4gVGhlIGtjb25maWcgY29udmVudGlvbiBpcyB0byB1c2Ugc2VsZWN0IGZv
ciBzdWNoDQo+PiBzeW1ib2xzIHNvIHRoZXkgYXJlIHR1cm5lZCBvbiBpbXBsaWNpdGx5IHdoZW4g
dGhlIHVzZXIgZW5hYmxlcyBhIGtjb25maWcNCj4+IHRoYXQgbmVlZHMgdGhlbS4NCj4+DQo+PiBP
dGhlcndpc2UgdGhlIFhFTl9HTlRERVZfRE1BQlVGIGtjb25maWcgaXMgb3Zlcmx5IGRpZmZpY3Vs
dCB0byBlbmFibGUuDQo+Pg0KPj4gRml4ZXM6IDkzMmQ2NTYyMTc5ZSAoInhlbi9nbnRkZXY6IEFk
ZCBpbml0aWFsIHN1cHBvcnQgZm9yIGRtYS1idWYgVUFQSSIpDQo+PiBDYzogT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4gQ2M6IEJv
cmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+DQo+PiBDYzogeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+PiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPg0KPj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4NCj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4N
Cj4NCj4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4NClJl
dmlld2VkLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVu
a29AZXBhbS5jb20+DQo+DQo+IEp1ZXJnZW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
