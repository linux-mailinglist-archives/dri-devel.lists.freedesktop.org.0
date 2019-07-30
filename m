Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C11D7BA3F
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F758935C;
	Wed, 31 Jul 2019 07:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140044.outbound.protection.outlook.com [40.107.14.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D0E6E4C5;
 Tue, 30 Jul 2019 12:32:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbmvjhBRzTFVkny1Frjd0si1jvRJYzXi3kkSt7QCGbiRqNy831pRHPEA4GZquR77JWJ7qaMgSqM5Yn00dT0OyG9XerTn1JAK8Rj1ub1M5uudsfrtmJQl3yDLqq/fMZajcSm6rqs/uEhSsKK5KD7St9K1RD7PazgUXYKal6SegKrZHHRTok+479FCSV02QYf6X+ptzhi0ydyIow2KRVthi7+pkBBinwXG7UezMuZOwF1nAbrOxmwosOy54fgTvwbyJDWy6C6hLO/czyelW0gjPfOecFot9NyNzo4Yr6gTjFtzeySFvQFg6wd5ojoViMhuMXwJdEEYsUvNGY8PDfsupQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFQB2S6xecD2wMGU1nLejn6fYEEMo3CNtrkz2XQC/vU=;
 b=oCUkNidF8RodlBQy2tuty+1R0ZSRUI7w2F2qTn9p+rl497t/G6XbwlYq+5lgcQlwvmTiwbziXoZ00m5fU22Ildb9goPiD/VryI+ucDtUxMNbO0hLt6gLxbJEGco+srav2A71uMk0VvMem4Z7Y7JRuNhB8S7h6/EV9+Kq9bBMry2RAlqqqXl1Yl8u+CyZVSdjXbvupb9Y7Zo9R6tfl7hK2XaqeUcIrGHMRP4dyF+beBT6JKNs+Y8ss7NIs3mytmrsJheFfHFAdPLqkKVCDXnsPyoZB+cDTcOS9slj3tsXlpavNKku3SrTHwi806Y1uRsYo/Rz143NvrckUE3fU0FnQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1SPR01MB0364.eurprd05.prod.outlook.com (20.178.120.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 12:32:25 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 12:32:24 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: turn the hmm migrate_vma upside down
Thread-Topic: turn the hmm migrate_vma upside down
Thread-Index: AQHVRhn28oqImcObYUq1zSBrPKZAdqbjGXIA
Date: Tue, 30 Jul 2019 12:32:24 +0000
Message-ID: <20190730123218.GA24038@mellanox.com>
References: <20190729142843.22320-1-hch@lst.de>
In-Reply-To: <20190729142843.22320-1-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0033.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::46)
 To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c18f707b-6880-4b17-a36c-08d714e9f9bd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1SPR01MB0364; 
x-ms-traffictypediagnostic: VI1SPR01MB0364:
x-microsoft-antispam-prvs: <VI1SPR01MB03645AFA980727C42C0389D2CFDC0@VI1SPR01MB0364.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(189003)(199004)(7736002)(102836004)(3846002)(6116002)(305945005)(54906003)(4326008)(2906002)(6436002)(229853002)(26005)(71190400001)(316002)(256004)(6916009)(71200400001)(14454004)(6246003)(11346002)(386003)(25786009)(2616005)(446003)(76176011)(7416002)(36756003)(52116002)(6486002)(186003)(478600001)(53936002)(6512007)(66476007)(81166006)(81156014)(66946007)(8676002)(1076003)(8936002)(66556008)(66066001)(6506007)(476003)(486006)(5660300002)(4744005)(33656002)(66446008)(99286004)(64756008)(86362001)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1SPR01MB0364;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: msbywfwkvnpnsvMndsoiuFCLEUQHJ+XtoRCAMwEqU0NJ7StslpBWur8p/UBIozFDR4WcUXWot7YOtTKTQpPuFAHZ2MNsUPuBx1llsDUl+viBOY7+g8Z5jdno6/6uXm1l8Xyf84OfUq2UF4pXDIM5WI0GFGOk2SuJttUnGAAc8MiocpNl1tfAmkVapc9/RE3QULgIwpXlBo4PC/53akjoH7LmKvbPDXX0taZZrP7cN+PC2pf4htGu/Nit0Y5uVZbyvnbqd8Hk5SF3rk9SumSeybRmg7ok8NopimmSf+8TBfsRhZiJJUCZiemFD8FPw8Z4fVJJjCMa+fk7T08K/q5pKU/ko51lMNfi65+sxFYyC8jHl7nXpb1tuSAVBrWbcIBbAFmfrJ8T8MiH1qm7P09YNv6WhLEdGyQxZRhqRhrzK6M=
Content-ID: <FE2AEDB2FC12424C805E7D754CCE4C1A@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c18f707b-6880-4b17-a36c-08d714e9f9bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 12:32:24.8223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1SPR01MB0364
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFQB2S6xecD2wMGU1nLejn6fYEEMo3CNtrkz2XQC/vU=;
 b=U4ULND1ISlyXvfnH6NSyG9KQxcq/imViTjbbwhAoeCxDdBpKTwt3p3jUXogNOeeq8nfsPzst00/yfbBhWgxWVKfgd1gksM+suP8ypPHilyo09S/Jmqoyd6Hl1GGEQV6COlChJP7h/k+T9CJ6asyavcPgWlPXlu/G294/TSKCzD8=
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
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bharata B Rao <bharata@linux.ibm.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDU6Mjg6MzRQTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6DQo+IEhpIErDqXLDtG1lLCBCZW4gYW5kIEphc29uLA0KPiANCj4gYmVsb3cgaXMg
YSBzZXJpZXMgYWdhaW5zdCB0aGUgaG1tIHRyZWUgd2hpY2ggc3RhcnRzIHJldmFtcGluZyB0aGUN
Cj4gbWlncmF0ZV92bWEgZnVuY3Rpb25hbGl0eS4gIFRoZSBwcmltZSBpZGVhIGlzIHRvIGV4cG9y
dCB0aHJlZSBzbGlnaHRseQ0KPiBsb3dlciBsZXZlbCBmdW5jdGlvbnMgYW5kIHRodXMgYXZvaWQg
dGhlIG5lZWQgZm9yIG1pZ3JhdGVfdm1hX29wcw0KPiBjYWxsYmFja3MuDQoNCkkgZG9uJ3QgZmVl
bCBJIGNhbiBjb250cmlidXRlIGEgd29ydGh3aGlsZSByZXZpZXcgZm9yIHRoaXMgcGFydCBvZiB0
aGUNCmNvZGUgcmlnaHQgbm93Lg0KDQpEb2VzIHRoaXMgb25seSBpbXBhY3QgaG1tIHVzZXJzLCBv
ciBkb2VzIG1pZ3JhdGUuYyBoYXZlIGEgYnJvYWRlcg0KdXNhZ2U/DQoNCldobyBkbyB3ZSBuZWVk
IG9uIHJldmlldyB0byBwcm9ncmVzcyBvbiB0aGlzPw0KDQpUaGFua3MsDQpKYXNvbg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
