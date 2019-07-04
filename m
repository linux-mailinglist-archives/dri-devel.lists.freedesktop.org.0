Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998C15F3B5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD806E2BA;
	Thu,  4 Jul 2019 07:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70051.outbound.protection.outlook.com [40.107.7.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D82B6E243
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 02:00:26 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5390.eurprd05.prod.outlook.com (20.177.63.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 02:00:19 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2032.019; Thu, 4 Jul 2019
 02:00:19 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Thread-Topic: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Thread-Index: AQHVMUJXWs8sf5cAOUS0d/4NvIH/Saa473yAgABzhwCAAAGdAIAABmoAgAAbwICAAC8hAA==
Date: Thu, 4 Jul 2019 02:00:19 +0000
Message-ID: <20190704020014.GA32502@mellanox.com>
References: <20190703015442.11974-1-Felix.Kuehling@amd.com>
 <20190703141001.GH18688@mellanox.com>
 <a9764210-9401-471b-96a7-b93606008d07@amd.com>
 <CADnq5_M0GREGG73wiu3eb=E+G2iTRmjXELh7m69BRJfVNEiHtw@mail.gmail.com>
 <20190704073214.266a9c33@canb.auug.org.au>
 <CAPM=9tx+w5ujeaFQ1koqsqV5cTw8M8B=Ws_-wB1Z_Jy-msFtAQ@mail.gmail.com>
In-Reply-To: <CAPM=9tx+w5ujeaFQ1koqsqV5cTw8M8B=Ws_-wB1Z_Jy-msFtAQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR01CA0013.prod.exchangelabs.com (2603:10b6:208:71::26)
 To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88633ecd-415f-49be-9256-08d700235db4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5390; 
x-ms-traffictypediagnostic: VI1PR05MB5390:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR05MB5390DB7709DB09D561CAA4A1CFFA0@VI1PR05MB5390.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(199004)(189003)(966005)(53936002)(86362001)(256004)(71190400001)(68736007)(6306002)(478600001)(6916009)(8676002)(99286004)(5660300002)(25786009)(4326008)(7416002)(14454004)(6512007)(71200400001)(2906002)(81156014)(81166006)(2616005)(1411001)(8936002)(6506007)(316002)(1076003)(6246003)(66946007)(7736002)(6486002)(66446008)(54906003)(229853002)(66556008)(64756008)(26005)(76176011)(66476007)(73956011)(6436002)(11346002)(476003)(66066001)(446003)(33656002)(386003)(36756003)(3846002)(486006)(305945005)(52116002)(6116002)(102836004)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5390;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rKELJ694naT5gGDd4kqK5UDxIRL9SdMf7WLMDnUrujLbRaZnRyLZdyVfyYg1vPx8Yy0DJfX8f7wY+1BwTXJx9i+s9CiqrRlOcNDdRLk6Jbfd6AEDKyXV6Tt0amSSM3rvM+Aj3CvENpy/+F2jQ4uOYWUV8HlH1xwccb5PZpEnAkCIY6wRZz3G77WUF9zjoi6iqzGlngZ8mTWrPoMp0yLstiK0R2fx/FZMYUlbvUhkdoq15DQWg1hPyKebad2faC7LlwjT1ZMe9Re35Q3T8pBeOE+UNqCtA4wcWYRoySr8hW+ZY3Q9CY3ec5jcNOfY86cA8KpVF3UDf/vcyI/plhAeWgpjpNahACEC+29xp6R5JzyjQPRpcBUjEpRmPovPcg+Vd9Iq1vbPzYgvAjpa52v84aRXqIZP1HL7dzqDKliRRBU=
Content-ID: <67836C539BDF9F479C5FD35E4F835B2D@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88633ecd-415f-49be-9256-08d700235db4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 02:00:19.6612 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5390
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ME3mN3r/laVGQduCC0GREWkfow/AT6OjaPvOkxvI2NY=;
 b=N8aEUaSAr9LfwFi/rRWg5qp4oGlvAHg6o8+y111tSsjtuL36/2TgjxPqMV2txpRvmOJ5VBcsDBQ4e5rHwNOgMNRBzvsnhVpjIV8Box9hSTf/dMANb8qLS6LIwH6SB/9aODrduIBEeN7Qdwu0uKvgczqrnq1P/iWnswTu+cJ3lGE=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Yang,
 Philip" <Philip.Yang@amd.com>, Dave Airlie <airlied@linux.ie>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMDQsIDIwMTkgYXQgMDk6MTE6MzNBTSArMTAwMCwgRGF2ZSBBaXJsaWUgd3Jv
dGU6Cj4gT24gVGh1LCA0IEp1bCAyMDE5IGF0IDA3OjMyLCBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJA
Y2FuYi5hdXVnLm9yZy5hdT4gd3JvdGU6Cj4gPgo+ID4gSGkgQWxleCwKPiA+Cj4gPiBPbiBXZWQs
IDMgSnVsIDIwMTkgMTc6MDk6MTYgLTA0MDAgQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFp
bC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBHbyBhaGVhZCBhbmQgcmVzcGluIHlvdXIgcGF0Y2gg
YXMgcGVyIHRoZSBzdWdnZXN0aW9uIGFib3ZlLiAgdGhlbiBJCj4gPiA+IGNhbiBhcHBseSBpdCBJ
IGNhbiBlaXRoZXIgbWVyZ2UgaG1tIGludG8gYW1kJ3MgZHJtLW5leHQgb3Igd2UgY2FuIGp1c3QK
PiA+ID4gcHJvdmlkZSB0aGUgY29uZmxpY3QgZml4IHBhdGNoIHdoaWNoZXZlciBpcyBlYXNpZXIu
ICBXaGljaCBobW0gYnJhbmNoCj4gPiA+IGlzIGZvciA1LjM/Cj4gPiA+IGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3JkbWEvcmRtYS5naXQvP2g9aG1tCj4g
Pgo+ID4gUGxlYXNlIGRvIG5vdCBtZXJnZSB0aGUgaG1tIHRyZWUgaW50byB5b3VycyAtIGVzcGVj
aWFsbHkgaWYgdGhlCj4gPiBjb25mbGljdCBjb21lcyBkb3duIHRvIGp1c3QgYSBmZXcgbGluZXMu
ICBMaW51cyBoYXMgYWRkcmVzc2VkIHRoaXMgaW4KPiA+IHRoZSBwYXN0LiAgVGhlcmUgaXMgYSBw
b3NzaWJpbGl0eSB0aGF0IGhlIG1heSB0YWtlIHNvbWUgb2JqZWN0aW9uIHRvCj4gPiB0aGUgaG1t
IHRyZWUgKGZvciBleGFtcGxlKSBhbmQgdGhlbiB5b3VyIHRyZWUgKGFuZCBjb25zZXF1ZW50bHkg
dGhlIGRybQo+ID4gdHJlZSkgd291bGQgYWxzbyBub3QgYmUgbWVyZ2VhYmxlLgo+ID4KPiAKPiBJ
J20gZmluZSB3aXRoIG1lcmdpbmcgdGhlIGhtbSB0cmVlIGlmIEphc29uIGhhcyBhIHN0YWJsZSBu
b24tcmViYXNpbmcKPiBiYXNlLiBJJ2QgcmF0aGVyIG1lcmdlIGludG8gZHJtIHRyZWUgYW5kIHRo
ZW4gaGF2ZSBhbWQgYmFja21lcmdlIGlmIGl0Cj4gd2UgYXJlIGRvaW5nIGl0LgoKWWVzLCBpdCBp
cyBhIHN0YWJsZSBub24tcmViYXNpbmcgdHJlZSBmb3IgdGhpcyBwdXJwb3NlLgoKPiBCdXQgaWYg
d2UgY2FuIGp1c3QgcmVkdWNlIHRoZSBjb25mbGljdHMgdG8gYSBzbWFsbCBhbW91bnQgaXQncyBl
YXNpZXIKPiBmb3IgZXZlcnlvbmUgdG8ganVzdCBkbyB0aGF0LgoKWWVzLCBJIGNvbmN1ciB3aXRo
IFN0ZXBoZW4uIGhtbS5naXQgaXMgc2V0dXAgc28gd2UgY2FuIG1lcmdlIGl0IGFjcm9zcwp0cmVl
cyBhcyBhIGZlYXR1cmUgYnJhbmNoIGlmIHdlIG5lZWQgdG8gLSBidXQgbWVyZ2luZyB0byBhdm9p
ZCBhCnRyaXZpYWwgY29uZmxpY3QgaXMgc29tZXRoaW5nIExpbnVzIGhhcyBmcm93bmVkIG9uIGlu
IHRoZSBwYXN0LgoKSWYgd2UgY2FuIGdldCB0aGUgcmVzb2x1dGlvbiBkb3duIHRvIG9uZSBsaW5l
IHRoZW4gSSB3b3VsZCBmb3J3YXJkIGl0CnRvIExpbnVzLiBTaW5jZSBpdCBpcyBhIGJ1aWxkIGJy
ZWFrIG9ubHkgaXQgc2hvdWxkIGJlIGhpZ2hsaWdodGVkIGluCnRoZSBEUk0gUFIuCgpGb3IgUkRN
QSB3ZSBvZnRlbiBoYXZlIGNvbmZsaWN0cyBhbmQgSSB1c3VhbGx5IHNlbmQgTGludXMgYSAybmQg
dGFnCihpZSBmb3ItbGludXMtbWVyZ2VkKSB3aXRoIHRoZSBjb25mbGljdHMgYWxsIHJlc29sdmVk
IHNvIGhlIGNhbgpjb21wYXJlIGhpcyBhbmQgbXkgcmVzb2x1dGlvbiBhcyBhIHNhbml0eSBjaGVj
ay4gTGludXMgd3JvdGUgYSBuaWNlCmVtYWlsIG9uIHRoaXMgdG9waWMuLgoKSmFzb24KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
