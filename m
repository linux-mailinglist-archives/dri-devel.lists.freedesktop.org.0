Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF456DF7FE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 00:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038C66E2B8;
	Mon, 21 Oct 2019 22:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130078.outbound.protection.outlook.com [40.107.13.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD046E221;
 Mon, 21 Oct 2019 19:12:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h06LGNT9sxkxR8EYajM/vurYHZTkaGDV4Jhdt7WbN/AmasgxQoGu1cGelLx3HgS/U6gN8xYh7rtoXhozSoZmJIGHnX8MhboP3GuA8Dw3NpgEXqeyVYGppFMZq+aLmln0nginfw4r3E8F5sBnzWTcgBllPwBAvKV28fQbKO5JNaqFi7eXFk6lwd9+Ufk5yrOgobODxH4W2gJXDFSCyJbakRTOxUn3WPa8mZMasMs/LpicwmiiK4Ebg9CM6nQLvCIA/mRRwSPpo7hBCTswn3zpuQ5VMy0sWzPlxQkxrWKBvw+dx06qnDCYTMkiLCgsxaV7ltYN1uKrPE8xjxPJLKmhUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fTLsgbvO3jKnQB8EQfU7dorG5dIAD4HEDgB6UX61y4=;
 b=mG+olQeI9D+PtGirNdNwOV0hNNe3Dv/TKENCrD4QjQ0QKLcW0UZuXdixOWCwUx+46KSfZKTpqa1tUpW4Lexg4a2l9Ly6YpBaGiZuEQXkTepxHh11s0xqkWQ4pfVX7llmGjjSlWsEMpCsSrOUSPDM5C44P+AFLxKR53OaiTByw8PGQtxJGrBlOp7i0vyzVFDfqpgGIy9+A2YNbJklhYnAhdpPDjRcTKOO/GTUrSJWLyUOi6p1hvqaIHyMB77BydHSOS/nOOk1FvxDJirk/huSvJBn0/kjxIaqOaq7mZzKycGjLwLjSPwyrDu2dvWXlCd+uwArB69etEUdBN8/B9le4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4718.eurprd05.prod.outlook.com (20.176.1.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Mon, 21 Oct 2019 19:12:23 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0%7]) with mapi id 15.20.2347.029; Mon, 21 Oct 2019
 19:12:23 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH hmm 08/15] xen/gntdev: Use select for DMA_SHARED_BUFFER
Thread-Topic: [PATCH hmm 08/15] xen/gntdev: Use select for DMA_SHARED_BUFFER
Thread-Index: AQHVg4SlqgIWJTGEnUWY/9OWOhnZ6adcuS2AgAAXhoCACK8ugA==
Date: Mon, 21 Oct 2019 19:12:23 +0000
Message-ID: <20191021191219.GJ6285@mellanox.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <20191015181242.8343-9-jgg@ziepe.ca>
 <6f60f558-20db-1749-044d-a46697258c39@suse.com>
 <91329d7d-9db5-057e-59d2-887254083da0@epam.com>
In-Reply-To: <91329d7d-9db5-057e-59d2-887254083da0@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR10CA0033.namprd10.prod.outlook.com
 (2603:10b6:208:120::46) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ec60703-e1c6-45c8-1c8a-08d7565a9a4c
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR05MB4718:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR05MB471835E42FDACA420662D37ACF690@VI1PR05MB4718.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(199004)(189003)(3846002)(86362001)(316002)(66946007)(7416002)(305945005)(7736002)(8676002)(81156014)(256004)(66476007)(66556008)(64756008)(66446008)(52116002)(71200400001)(76176011)(54906003)(99286004)(71190400001)(8936002)(81166006)(6116002)(6506007)(33656002)(478600001)(14454004)(386003)(966005)(53546011)(26005)(229853002)(25786009)(4326008)(6436002)(446003)(1076003)(486006)(66066001)(102836004)(6486002)(2906002)(2616005)(36756003)(5660300002)(11346002)(186003)(476003)(6246003)(6306002)(6916009)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4718;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g4ausQGRHXY9fH7yb8Thrc2Y95CFMVFdv7CoYgV9HWqYKgQ/7rmW9I5OYvTKM1hmt9/TTR+RyVSqU4PKQzhzfN0WOoTcv4VuYVPwYgmm/NoDnda0qOe+byOXwOUZ++bZO23pdYMIka77UIRt02urMfJgO/60lTVP+Dz5pZLTWEfLdE7xq2fvjIZ5nOZAWdPEhdlpH0njfzosAMxMmZNt7c2J3tFPnxiYEpHwhpUBegNfQTX1PAe8MKpqskJ35iPBNrqNCjh7D9nv4twXXx8QbOYSAnrFmJkPh5SxYk0hRLYWBfD6/Vft3cQYq89NkrxwDhDkrHeoNXYJRBCMBhuTluH0IgXC/ibgPpCzPDrZT7RLmKwq2LBLJAQqOlP//4WhEpBI1lIHDAhK57+FY7DNmgai1ZSE5efZDCSgRALBwNYVQT8Wdfq/vuwCXF8chgIVsWyo3sNne+WNmF+vwKsB9WKNKKk1bpEup6LqakTtdFM=
x-ms-exchange-transport-forked: True
Content-ID: <8BF592EA6461D548874DB6BE9FEE8E38@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec60703-e1c6-45c8-1c8a-08d7565a9a4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 19:12:23.3208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tU+L6I+Wz0eK9v9BNR+9bz7Z02bge5VZ641k0CG1bD32N/F5e6KyugGae73KMZsjHtrrrSBTeDk+5FP/09VfiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4718
X-Mailman-Approved-At: Mon, 21 Oct 2019 22:23:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fTLsgbvO3jKnQB8EQfU7dorG5dIAD4HEDgB6UX61y4=;
 b=J2Qkue3m0fXLy8OTb/5YDQVX0F7485Vp5/AA3hl5n2DvMeO+E/ZJO/olSXBiqjBLAjubVVO25ebMeWs8pX/0OPFi6EJOadDRnuChLbxI4wSx2ecu4nYwhsKoQW4uphzDsaGAWVaiB4f+twLW5NfI5WhGH5f9H7948q7QESryLO0=
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Andrea Arcangeli <aarcange@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMDY6MzU6MTVBTSArMDAwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6DQo+IE9uIDEwLzE2LzE5IDg6MTEgQU0sIErDvHJnZW4gR3Jvw58gd3Jv
dGU6DQo+ID4gT24gMTUuMTAuMTkgMjA6MTIsIEphc29uIEd1bnRob3JwZSB3cm90ZToNCj4gPj4g
RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPg0KPiA+Pg0KPiA+PiBETUFf
U0hBUkVEX0JVRkZFUiBjYW4gbm90IGJlIGVuYWJsZWQgYnkgdGhlIHVzZXIgKGl0IHJlcHJlc2Vu
dHMgYSANCj4gPj4gbGlicmFyeQ0KPiA+PiBzZXQgaW4gdGhlIGtlcm5lbCkuIFRoZSBrY29uZmln
IGNvbnZlbnRpb24gaXMgdG8gdXNlIHNlbGVjdCBmb3Igc3VjaA0KPiA+PiBzeW1ib2xzIHNvIHRo
ZXkgYXJlIHR1cm5lZCBvbiBpbXBsaWNpdGx5IHdoZW4gdGhlIHVzZXIgZW5hYmxlcyBhIGtjb25m
aWcNCj4gPj4gdGhhdCBuZWVkcyB0aGVtLg0KPiA+Pg0KPiA+PiBPdGhlcndpc2UgdGhlIFhFTl9H
TlRERVZfRE1BQlVGIGtjb25maWcgaXMgb3Zlcmx5IGRpZmZpY3VsdCB0byBlbmFibGUuDQo+ID4+
DQo+ID4+IEZpeGVzOiA5MzJkNjU2MjE3OWUgKCJ4ZW4vZ250ZGV2OiBBZGQgaW5pdGlhbCBzdXBw
b3J0IGZvciBkbWEtYnVmIFVBUEkiKQ0KPiA+PiBDYzogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
PG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPiA+PiBDYzogQm9yaXMgT3N0cm92
c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4NCj4gPj4gQ2M6IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZw0KPiA+PiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
Pg0KPiA+PiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0K
PiA+PiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+DQo+
ID4NCj4gPiBSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiA+
DQo+IFJldmlld2VkLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1
c2hjaGVua29AZXBhbS5jb20+DQoNClRoYW5rcyBPbGVrc2FuZHIgYW5kIEp1ZXJnZW4sIGNhbiB5
b3UgYWxzbyBnaXZlIG1lIHNvbWUgYWR2aWNlIG9uIGhvdw0KdG8gcHJvZ3Jlc3MgdGhlIG1vcmUg
Y29tcGxleCBwYXRjaDoNCg0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTE5
MTM2OS8NCg0KSXMgdGhpcyBnbnRkZXYgc3R1ZmYgc3RpbGwgaW4tdXNlPyBJIHN0cnVnZ2xlZCBh
IGJpdCB0byB1bmRlcnN0YW5kDQp3aGF0IGl0IGlzIGRvaW5nLCBidXQgSSB0aGluayBJIG1hZGUg
YSByZWFzb25hYmxlIGd1ZXNzPw0KDQpKYXNvbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
