Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0471EDF7FD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 00:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9CE6E2B6;
	Mon, 21 Oct 2019 22:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20085.outbound.protection.outlook.com [40.107.2.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2B56E1E0;
 Mon, 21 Oct 2019 19:06:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6hJs01S/6cr1FMXF3VGzvgufocf7zgkuk3a8Cs/X0FRYWou69zoTCEMnkFiG27yhwjs6bCVM2L8B7XSQ3IqaR9MtUmL0nFWnA1xuGU7kdRbFYylYc4lyvZ3ekO8ofzL5SnutjCFjQB+qTDP/FkyprfqJ8+O1cBqk8Vtloz4eR67xAwF8MSJirt5bmGqjtoKBZquHiVCypqHr+0JEqrufJOgpShhS2tsU+45nV8lgdjiDYnz2x+X5/VvOb4dqBhFuXo88SwAtXb65r8KE8Eeaw6qB1620NLl175ZefH9OP2xbEIi0dhovwePdfq0ly7RAk2zt79fFgyeXi5ZuSCjHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKJd2NpinY3P8m2AwGEy7BmBOIvD5pXIr4+oty5xgzM=;
 b=MG4yKM/LzdqTrC8gKZM+GwPOKPWmyMKjlFP36yJSJWRjLnzti0naKZdWOTN7gN6Th9gZ5lOHCUNgnwviUJJ+loLzwcLFJ5PscO9KVvO+u/ejKD6cc5COPIC6NZ8ALf0Ufg93//kscqIGYXUA7G3tTXl3Y7GddQv3oJsFfUkg+bdQjUJ7eddpw+SsVyMoDnR+niGySsoqxdLQdlXiH0ZH2wxoH7nWrU5wAXgwpyH6jQ+WAjul0uZkO+A8Nyr0b16xiaQZEesuRMeFcMNsw2fWQ8Bg3u6V8NPLSQC1cZIta7T8pIVvK7jigDw+J2ZiL7OrYirdo3mFoSVvRbAGDeV34Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4718.eurprd05.prod.outlook.com (20.176.1.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Mon, 21 Oct 2019 19:06:00 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0%7]) with mapi id 15.20.2347.029; Mon, 21 Oct 2019
 19:06:00 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Topic: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Index: AQHVg4Sqa7CCxCToXEeTrrYAqVQVhqdldwqAgAAHDgA=
Date: Mon, 21 Oct 2019 19:06:00 +0000
Message-ID: <20191021190556.GI6285@mellanox.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <20191021184041.GF3177@redhat.com>
In-Reply-To: <20191021184041.GF3177@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN8PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:408:d4::12) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d02704bc-4334-4fc6-067d-08d75659b5e5
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR05MB4718:
x-microsoft-antispam-prvs: <VI1PR05MB4718C871FA1CE457B206E8BDCF690@VI1PR05MB4718.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(199004)(189003)(3846002)(86362001)(316002)(66946007)(7416002)(305945005)(7736002)(8676002)(81156014)(14444005)(256004)(66476007)(66556008)(64756008)(66446008)(52116002)(71200400001)(76176011)(54906003)(99286004)(71190400001)(8936002)(81166006)(6116002)(6506007)(33656002)(478600001)(14454004)(386003)(26005)(229853002)(25786009)(4326008)(6436002)(446003)(1076003)(486006)(66066001)(102836004)(6486002)(2906002)(2616005)(36756003)(5660300002)(11346002)(186003)(476003)(6246003)(6916009)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4718;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 848yyiXVONH54Kkcr/4H3YrpXwbjxGarmHogfgIcRQyB9BAQyL7b+LUAsaaea5JJvZPTv0v6cSokHczFqydmW89SFTJ/iloqnLVJxTI44EETpoDxOpU+6OC2xJs/QAjKBFCGhgliz7GPvv1BppF+Dm3WusPMLcrSBGYxi8FHneGfmspxl57uY8ASH6KQKmgWUZPt5xzjPCER2xjRC+yrD/93jx/CIZ5FbrIAk+T8nDefNjD7Sy60MVruS2drvVfFqWraEsOJNtsBFxlrXkqEnxxuqWKISD3+A9YJi0m21Z/4tRvlaf3On1oogNXTExUik2EVINDTMF5mv5BufV9hFLU1slrhuNpbtcSt3gFRj6mt1y6mOC1XOoAnCg0tgu7VetlBfr+guYRuxA+D8e3OKrdaPcOk/T7xC0cCl0yBef72nowZBpL9TbpTMdzSzTUp
x-ms-exchange-transport-forked: True
Content-ID: <46700DBA60BB8A43AC732C3FBB27EA05@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d02704bc-4334-4fc6-067d-08d75659b5e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 19:06:00.1077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rQFA9nq6A4mLS2977RGY5r/lxIuJD5QCXkx4gDd0HbxIJbyD3HQ9PBGfGhJgZVWmCs427iJB/wWK1+1M3uZ8yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4718
X-Mailman-Approved-At: Mon, 21 Oct 2019 22:23:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKJd2NpinY3P8m2AwGEy7BmBOIvD5pXIr4+oty5xgzM=;
 b=CG4YGrSZGij6J6KVBkGlb9HhJoeTiDjONhgS8039+aME1VgmVwyHfgNeatPc+W5PDHS63brsg5hYASEOzuhfDqWc9QQ4mr4v8ipXPTXp75zZMKCxrrIFfr46WQ04lWj0vi/E/OGEVSnY2KgBpsQQE9E+aSw9ElLyMc0bOrLtadw=
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
 Ralph Campbell <rcampbell@nvidia.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDI6NDA6NDFQTSAtMDQwMCwgSmVyb21lIEdsaXNzZSB3
cm90ZToKPiBPbiBUdWUsIE9jdCAxNSwgMjAxOSBhdCAwMzoxMjoyN1BNIC0wMzAwLCBKYXNvbiBH
dW50aG9ycGUgd3JvdGU6Cj4gPiBGcm9tOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5j
b20+Cj4gPiAKPiA+IDggb2YgdGhlIG1tdV9ub3RpZmllciB1c2luZyBkcml2ZXJzIChpOTE1X2dl
bSwgcmFkZW9uX21uLCB1bWVtX29kcCwgaGZpMSwKPiA+IHNjaWZfZG1hLCB2aG9zdCwgZ250ZGV2
LCBobW0pIGRyaXZlcnMgYXJlIHVzaW5nIGEgY29tbW9uIHBhdHRlcm4gd2hlcmUKPiA+IHRoZXkg
b25seSB1c2UgaW52YWxpZGF0ZV9yYW5nZV9zdGFydC9lbmQgYW5kIGltbWVkaWF0ZWx5IGNoZWNr
IHRoZQo+ID4gaW52YWxpZGF0aW5nIHJhbmdlIGFnYWluc3Qgc29tZSBkcml2ZXIgZGF0YSBzdHJ1
Y3R1cmUgdG8gdGVsbCBpZiB0aGUKPiA+IGRyaXZlciBpcyBpbnRlcmVzdGVkLiBIYWxmIG9mIHRo
ZW0gdXNlIGFuIGludGVydmFsX3RyZWUsIHRoZSBvdGhlcnMgYXJlCj4gPiBzaW1wbGUgbGluZWFy
IHNlYXJjaCBsaXN0cy4KPiA+IAo+ID4gT2YgdGhlIG9uZXMgSSBjaGVja2VkIHRoZXkgbGFyZ2Vs
eSBzZWVtIHRvIGhhdmUgdmFyaW91cyBraW5kcyBvZiByYWNlcywKPiA+IGJ1Z3MgYW5kIHBvb3Ig
aW1wbGVtZW50YXRpb24uIFRoaXMgaXMgYSByZXN1bHQgb2YgdGhlIGNvbXBsZXhpdHkgaW4gaG93
Cj4gPiB0aGUgbm90aWZpZXIgaW50ZXJhY3RzIHdpdGggZ2V0X3VzZXJfcGFnZXMoKS4gSXQgaXMg
ZXh0cmVtZWx5IGRpZmZpY3VsdCB0bwo+ID4gdXNlIGl0IGNvcnJlY3RseS4KPiA+IAo+ID4gQ29u
c29saWRhdGUgYWxsIG9mIHRoaXMgY29kZSB0b2dldGhlciBpbnRvIHRoZSBjb3JlIG1tdV9ub3Rp
ZmllciBhbmQKPiA+IHByb3ZpZGUgYSBsb2NraW5nIHNjaGVtZSBzaW1pbGFyIHRvIGhtbV9taXJy
b3IgdGhhdCBhbGxvd3MgdGhlIHVzZXIgdG8KPiA+IHNhZmVseSB1c2UgZ2V0X3VzZXJfcGFnZXMo
KSBhbmQgcmVsaWFibHkga25vdyBpZiB0aGUgcGFnZSBsaXN0IHN0aWxsCj4gPiBtYXRjaGVzIHRo
ZSBtbS4KPiA+IAo+ID4gVGhpcyBuZXcgYXJyYW5nbWVudCBwbGF5cyBuaWNlbHkgd2l0aCB0aGUg
IWJsb2NrYWJsZSBtb2RlIGZvcgo+ID4gT09NLiBTY2FubmluZyB0aGUgaW50ZXJ2YWwgdHJlZSBp
cyBkb25lIHN1Y2ggdGhhdCB0aGUgaW50ZXJzZWN0aW9uIHRlc3QKPiA+IHdpbGwgYWx3YXlzIHN1
Y2NlZWQsIGFuZCBzaW5jZSB0aGVyZSBpcyBubyBpbnZhbGlkYXRlX3JhbmdlX2VuZCBleHBvc2Vk
IHRvCj4gPiBkcml2ZXJzIHRoZSBzY2hlbWUgc2FmZWx5IGFsbG93cyBtdWx0aXBsZSBkcml2ZXJz
IHRvIGJlIHN1YnNjcmliZWQuCj4gPiAKPiA+IEZvdXIgcGxhY2VzIGFyZSBjb252ZXJ0ZWQgYXMg
YW4gZXhhbXBsZSBvZiBob3cgdGhlIG5ldyBBUEkgaXMgdXNlZC4KPiA+IEZvdXIgYXJlIGxlZnQg
Zm9yIGZ1dHVyZSBwYXRjaGVzOgo+ID4gIC0gaTkxNV9nZW0gaGFzIGNvbXBsZXggbG9ja2luZyBh
cm91bmQgZGVzdHJ1Y3Rpb24gb2YgYSByZWdpc3RyYXRpb24sCj4gPiAgICBuZWVkcyBtb3JlIHN0
dWR5Cj4gPiAgLSBoZmkxICgybmQgdXNlcikgbmVlZHMgYWNjZXNzIHRvIHRoZSByYnRyZWUKPiA+
ICAtIHNjaWZfZG1hIGhhcyBhIGNvbXBsaWNhdGVkIGxvZ2ljIGZsb3cKPiA+ICAtIHZob3N0J3Mg
bW11IG5vdGlmaWVycyBhcmUgYWxyZWFkeSBiZWluZyByZXdyaXR0ZW4KPiA+IAo+ID4gVGhpcyBp
cyBzdGlsbCBiZWluZyB0ZXN0ZWQsIGJ1dCBJIGZpZ3VyZWQgdG8gc2VuZCBpdCB0byBzdGFydCBn
ZXR0aW5nIGhlbHAKPiA+IGZyb20gdGhlIHhlbiwgYW1kIGFuZCBoZmkgZHJpdmVycyB3aGljaCBJ
IGNhbm5vdCB0ZXN0IGhlcmUuCj4gCj4gSXQgbWlnaHQgYmUgYSBnb29kIG9wb3J0dW5pdHkgdG8g
YWxzbyBzd2l0Y2ggdGhvc2UgdXNlcnMgdG8KPiBobW1fcmFuZ2VfZmF1bHQoKSBpbnN0ZWFkIG9m
IEdVUCBhcyBHVVAgaXMgcG9pbnRsZXNzIGZvciB0aG9zZQo+IHVzZXJzLiBJbiBmYWN0IHRoZSBH
VVAgaXMgYW4gaW1wZWRpbWVudCB0byBub3JtYWwgbW0gb3BlcmF0aW9ucy4KCkkgdGhpbmsgdmhv
c3QgY2FuIHVzZSBobW1fcmFuZ2VfZmF1bHQKCmhmaTEgZG9lcyBhY3R1YWxseSBuZWVkIHRvIGhh
dmUgdGhlIHBhZ2UgcGluLCBpdCBkb2Vzbid0IGZlbmNlIERNQQpkdXJpbmcgaW52YWxpZGF0ZS4K
Cmk5MTVfZ2VtIGZlZWxzIGFsb3QgbGlrZSBhbWRncHUsIHNvIHByb2JhYmx5IGl0IHdvdWxkIGJl
bmVmaXQKCk5vIGlkZWEgYWJvdXQgc2NpZl9kbWEKCj4gSSB3aWxsIHRlc3Qgb24gbm91dmVhdS4K
ClRoYW5rcywgaG9wZWZ1bGx5IGl0IHN0aWxsIHdvcmtzLCBJIHRoaW5rIFJhbHBoIHdhcyBhYmxl
IHRvIGRvIHNvbWUKYmFzaWMgY2hlY2tzLiBCdXQgaXQgaXMgYSBwcmV0dHkgY29tcGxpY2F0ZWQg
c2VyaWVzLCBJIHByb2JhYmx5IG1hZGUKc29tZSBtaXN0YWtlcy4KCkZXSVcsIEkga25vdyB0aGF0
IG5vdXZlYXUgZ2V0cyBhIGxvY2tkZXAgc3BsYXQgbm93IGZyb20gRGFuaWVsClZldHRlcidzIHJl
Y2VudCBjaGFuZ2VzLCBpdCB0cmllcyB0byBkbyBHRlBfS0VSRU5FTCBhbGxvY2F0aW9ucyB1bmRl
cgphIGxvY2sgYWxzbyBoZWxkIGJ5IHRoZSBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0IHBhdGguCgpU
aGFua3MgZm9yIGxvb2tpbmcgYXQgaXQhCgpSZWdhcmRzLApKYXNvbiAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
