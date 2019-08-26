Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899E09DEC8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 09:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C87898EA;
	Tue, 27 Aug 2019 07:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130074.outbound.protection.outlook.com [40.107.13.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAD289DC7;
 Mon, 26 Aug 2019 18:09:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5dIh3Fl+mOCroP3/RVqLquYBThvKEO3WLt2LpTjqDmXj0RglPTFSlReduzVnGgCxh78w3k4qCyVo2nKRtjIMBnMbLSzTI1z6drldObKdgXdAfufOmRCS0TnvsYVhI3PSk8sE/kEalEUKkPHLeCJEms0QupnXPl8QEGAWTdIFEuMwu8vvw3q8RjDq4l50dDTQ0mSqFfI2Djv0q8WWWYpVQv9/dAj8fhr3k683IjdlyCW9sUOCa/dHJgxOGes9BJjO9GiMm7EuISLq/Nyt/mAIBWpRjD8P4Sqb7NsN18FrySIonR3GPG/b6D+v4VTxZBeazFS/dvIz6JwsKTjv2OXLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGRChx0m+eJzl7dhyV88O00JmWNdWjyEK7YCMGleaCY=;
 b=i4uFUHHZnqy20vQNh6jzlKfudxNobLjkTAQqXaYqr7YY1GWTbZHeGCHpNw726M4p9lOTGJNMlULVA30BY+rCdyej6WGbaVZcLKsqJ+UJksddYUvSMoU7ClWQO9g8Vs2e7P2Izpm4+sjcGI3wQMGjyNpd/iczhSF7PHfmCN1r72TWqJ0bbQdR7rJWzN0zgBt/2VYDKxVRBXRdbfImF4QeUwhN/wbfoFVmZOdR6mNITDlHcwuIOBP1pUdwD7JK5ZyfmLNEMLormF4+EvRpUKivUIKw/mFutghdvzIqodJoUgRRvsfw65vcfx9u0POSLwLYeNtNl6CRhqPkBBNGwMqwtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6269.eurprd05.prod.outlook.com (20.177.49.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 18:09:42 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7%6]) with mapi id 15.20.2199.020; Mon, 26 Aug 2019
 18:09:42 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 1/2] mm/hmm: hmm_range_fault() NULL pointer bug
Thread-Topic: [PATCH 1/2] mm/hmm: hmm_range_fault() NULL pointer bug
Thread-Index: AQHVWgCoFJcsFk0T0kqUlq3r7T9NpacK5SEAgALXogCAAAITgA==
Date: Mon, 26 Aug 2019 18:09:42 +0000
Message-ID: <20190826180937.GI27031@mellanox.com>
References: <20190823221753.2514-1-rcampbell@nvidia.com>
 <20190823221753.2514-2-rcampbell@nvidia.com> <20190824223754.GA21891@lst.de>
 <e2ecc1a7-0d2f-5957-e6cb-b3c86c085d80@nvidia.com>
In-Reply-To: <e2ecc1a7-0d2f-5957-e6cb-b3c86c085d80@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::14) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.167.216.168]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a43b3676-6b61-4b08-c38d-08d72a509191
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR05MB6269; 
x-ms-traffictypediagnostic: VI1PR05MB6269:
x-microsoft-antispam-prvs: <VI1PR05MB626915FD045BAC4A7B16A0EACFA10@VI1PR05MB6269.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(189003)(199004)(386003)(54906003)(102836004)(66946007)(53546011)(6506007)(53936002)(6512007)(3846002)(52116002)(316002)(6116002)(66476007)(66556008)(64756008)(66446008)(71190400001)(256004)(14454004)(26005)(1076003)(66066001)(6436002)(36756003)(8676002)(25786009)(4326008)(305945005)(5660300002)(186003)(86362001)(7736002)(71200400001)(76176011)(33656002)(2906002)(6486002)(8936002)(6916009)(99286004)(486006)(476003)(478600001)(11346002)(2616005)(81156014)(229853002)(446003)(6246003)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6269;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xJx5kMvdEmdL4l/EBzz1xBnKWwCJiReAExlcCqgUJAGowwln5DyiNlB1cL4Qw3vRobHskkqQz1rPpnBWJLYSEfe/pGWwQUE0lypDfu9JoCa+umkBfHKaZbXLd1cKn6UfEYj8bc6yQapdfXad+IEC4j7/xVVU8H1M7QRS8wE4SYaMWJl5KeZGbXmiO5XdXpdvHY7iwOB9IYeX624tc9lA8qLDolI5KM4g9sa9AM6B4Jq2Zcr1mREic8FDMdIAR/zKqa7WhbUaET99PLwgzv2BFrw589cwg+F58MteOtUa/5PqNl4f/CRJEFHmWVkutW64QtE0fSCC1AkTkdMj7Ut/VONhtOhbVoil+g2FzFm8UDkmNUD4PRceBTowaNkGM8mM+3doPWXNKnY0hNyVUnIN55b6NEzJcy5FlTVLYFoWpvY=
x-ms-exchange-transport-forked: True
Content-ID: <13598A34FD89014892271F429ACE899D@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a43b3676-6b61-4b08-c38d-08d72a509191
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 18:09:42.5922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ms67caVPI1xL6QIPQ45f408XuFjZVGN4eZ4NOTmxeOOExwJwjOf8QSMGJGkPmcWZxQk+IWGtouBhXrhcvjIaMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6269
X-Mailman-Approved-At: Tue, 27 Aug 2019 07:29:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGRChx0m+eJzl7dhyV88O00JmWNdWjyEK7YCMGleaCY=;
 b=T7tkSC51J467IklLMNl+7HvJN9yBLFC6diuldOdNJ/CelHnOfe8RFlgiEsDgMqsUr+BG3G+cRa6QxpfCBMgJxL7CYn48zzjQXCHfItYdFOHORxaI0k76lt7AM5rpoOPoKjixOdOJzhN/LuYQNWCglayFfaosIG4xmL45ZysFBdc=
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMTE6MDI6MTJBTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gCj4gT24gOC8yNC8xOSAzOjM3IFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToK
PiA+IE9uIEZyaSwgQXVnIDIzLCAyMDE5IGF0IDAzOjE3OjUyUE0gLTA3MDAsIFJhbHBoIENhbXBi
ZWxsIHdyb3RlOgo+ID4gPiBBbHRob3VnaCBobW1fcmFuZ2VfZmF1bHQoKSBjYWxscyBmaW5kX3Zt
YSgpIHRvIG1ha2Ugc3VyZSB0aGF0IGEgdm1hIGV4aXN0cwo+ID4gPiBiZWZvcmUgY2FsbGluZyB3
YWxrX3BhZ2VfcmFuZ2UoKSwgaG1tX3ZtYV93YWxrX2hvbGUoKSBjYW4gc3RpbGwgYmUgY2FsbGVk
Cj4gPiA+IHdpdGggd2Fsay0+dm1hID09IE5VTEwgaWYgdGhlIHN0YXJ0IGFuZCBlbmQgYWRkcmVz
cyBhcmUgbm90IGNvbnRhaW5lZAo+ID4gPiB3aXRoaW4gdGhlIHZtYSByYW5nZS4KPiA+IAo+ID4g
U2hvdWxkIHdlIGNvbnZlcnQgdG8gd2Fsa192bWFfcmFuZ2UgaW5zdGVhZD8gIE9yIGtlZXAgd2Fs
a19wYWdlX3JhbmdlCj4gPiBidXQgZHJvcCBzZWFyY2hpbmcgdGhlIHZtYSBvdXJzZWx2ZXM/Cj4g
PiAKPiA+IEV4Y2VwdCBmb3IgdGhhdCB0aGUgcGF0Y2ggbG9va3MgZ29vZCB0byBtZToKPiA+IAo+
ID4gUmV2aWV3ZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+ID4gCj4gCj4g
SSB0aGluayBrZWVwaW5nIHRoZSBjYWxsIHRvIHdhbGtfcGFnZV9yYW5nZSgpIG1ha2VzIHNlbnNl
Lgo+IEphc29uIGlzIGhvcGluZyB0byBiZSBhYmxlIHRvIHNuYXBzaG90IGEgcmFuZ2Ugd2l0aCAm
IHdpdGhvdXQgdm1hcwo+IGFuZCBoYXZlIHRoZSBwZm5zW10gZmlsbGVkIHdpdGggZW1wdHkvdmFs
aWQgZW50cmllcyBhcyBhcHByb3ByaWF0ZS4KPiAKPiBJIHBsYW4gdG8gcmVwb3N0IG15IHBhdGNo
IGNoYW5naW5nIGhtbV9yYW5nZV9mYXVsdCgpIHRvIHVzZQo+IHdhbGsudGVzdF93YWxrIHdoaWNo
IHdpbGwgcmVtb3ZlIHRoZSBjYWxsIHRvIGZpbmRfdm1hKCkuCj4gSmFzb24gaGFkIHNvbWUgY29u
Y2VybnMgYWJvdXQgdGVzdGluZyBpdCBzbyB0aGF0J3Mgd2h5IEkgaGF2ZQo+IGJlZW4gd29ya2lu
ZyBvbiBzb21lIEhNTSBzZWxmIHRlc3RzIGJlZm9yZSByZXNlbmRpbmcgaXQuCgpJJ20gcmVhbGx5
IGV4Y2l0ZWQgdG8gc2VlIHRlc3RzIGZvciBobW1fcmFuZ2VfZmF1bHQoKSEKCkRpZCB5b3UgZmlu
ZCB0aGlzIGJ1ZyB3aXRoIHRoZSB0ZXN0cz8/CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
