Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 800DD5F387
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3916E297;
	Thu,  4 Jul 2019 07:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30087.outbound.protection.outlook.com [40.107.3.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9026E235
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 02:01:17 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5390.eurprd05.prod.outlook.com (20.177.63.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 02:01:15 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2032.019; Thu, 4 Jul 2019
 02:01:15 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Thread-Topic: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Thread-Index: AQHVMUJXWs8sf5cAOUS0d/4NvIH/Saa473yAgABzhwCAAAGdAIAAUY2A
Date: Thu, 4 Jul 2019 02:01:14 +0000
Message-ID: <20190704020109.GB32502@mellanox.com>
References: <20190703015442.11974-1-Felix.Kuehling@amd.com>
 <20190703141001.GH18688@mellanox.com>
 <a9764210-9401-471b-96a7-b93606008d07@amd.com>
 <CADnq5_M0GREGG73wiu3eb=E+G2iTRmjXELh7m69BRJfVNEiHtw@mail.gmail.com>
In-Reply-To: <CADnq5_M0GREGG73wiu3eb=E+G2iTRmjXELh7m69BRJfVNEiHtw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQXPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::47) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 447cb622-f93d-45ea-7154-08d700237eca
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5390; 
x-ms-traffictypediagnostic: VI1PR05MB5390:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR05MB5390DD0AF422A253812DCB4BCFFA0@VI1PR05MB5390.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(199004)(189003)(966005)(53936002)(86362001)(256004)(71190400001)(68736007)(6306002)(478600001)(6916009)(8676002)(99286004)(5660300002)(25786009)(4326008)(14454004)(6512007)(71200400001)(2906002)(81156014)(81166006)(14444005)(2616005)(1411001)(8936002)(6506007)(316002)(1076003)(6246003)(66946007)(7736002)(6486002)(66446008)(54906003)(53546011)(229853002)(66556008)(64756008)(26005)(76176011)(66476007)(73956011)(6436002)(11346002)(476003)(66066001)(446003)(33656002)(386003)(36756003)(3846002)(486006)(305945005)(52116002)(6116002)(102836004)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5390;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zA7Cm54Tj+HFs7usxkeRLZ/ZLlyx5Mfu3zGOb2C9ORYKhrJ2rWO4dy6spq+b+l1nFD5vgOeZTrPyaVWdFKLRp2xjf+z4UyUUs8IogdOdbK8kWC+LjC6sZ3c16WmsSstu8pJMQCPnUjiuhOUNeNjK8gIr9YiSVzMI/YCtEQRAWqQwKNL7fEfvitl51EgY3nO1vvr6c6yVfU+vQT6OPGALCgHyneL7w/SB+mXtu9p1OCFNLn0dmIGFusERM8l2Q4sol+fmUHablgcYI5yJxrj3CtXUcWo2gvEajtd3/Jpsec7RwpzYRlPZraxXxHdKQKQWdJx5/c/fdzPwG2g8gmma+RtnwwzwvuJsXxf+5Ysyka0hedYTLwGckLWYo+rQevRBA5vpu4GYXqwRlB1YYoth2pYtzetHRhDij628nuEPzig=
Content-ID: <783845738F0FFF45A9FA38B1C43749D6@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 447cb622-f93d-45ea-7154-08d700237eca
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 02:01:14.9475 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5390
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDOKUcnSBzVhEWWGoxyNSaiwC3cSjRI+ryccklVbwVA=;
 b=GvToemLtmEl5ObY9GAGcxPwGsXk3LWEfPSsERXuCD+t1APFzhCxw84bjpmvFoAHDRiYBnSFEuInB1xW3jh5t5sVmxe40fKpPn1KRFTLPV8Ei+6jnWftcB94Vf+D5XV0ejwndb1ALVi4oaN/eE/NuAGi4Bb9lhzzGkKQpyK1gC1E=
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

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDU6MDk6MTZQTSAtMDQwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+IE9uIFdlZCwgSnVsIDMsIDIwMTkgYXQgNTowMyBQTSBLdWVobGluZywgRmVsaXggPEZl
bGl4Lkt1ZWhsaW5nQGFtZC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIDIwMTktMDctMDMgMTA6MTAg
YS5tLiwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+ID4gPiBPbiBXZWQsIEp1bCAwMywgMjAxOSBh
dCAwMTo1NTowOEFNICswMDAwLCBLdWVobGluZywgRmVsaXggd3JvdGU6Cj4gPiA+PiBGcm9tOiBQ
aGlsaXAgWWFuZyA8UGhpbGlwLllhbmdAYW1kLmNvbT4KPiA+ID4+Cj4gPiA+PiBJbiBvcmRlciB0
byBwYXNzIG1pcnJvciBpbnN0ZWFkIG9mIG1tIHRvIGhtbV9yYW5nZV9yZWdpc3Rlciwgd2UgbmVl
ZAo+ID4gPj4gcGFzcyBibyBpbnN0ZWFkIG9mIHR0bSB0byBhbWRncHVfdHRtX3R0X2dldF91c2Vy
X3BhZ2VzIGJlY2F1c2UgbWlycm9yCj4gPiA+PiBpcyBwYXJ0IG9mIGFtZGdwdV9tbiBzdHJ1Y3R1
cmUsIHdoaWNoIGlzIGFjY2Vzc2libGUgZnJvbSBiby4KPiA+ID4+Cj4gPiA+PiBTaWduZWQtb2Zm
LWJ5OiBQaGlsaXAgWWFuZyA8UGhpbGlwLllhbmdAYW1kLmNvbT4KPiA+ID4+IFJldmlld2VkLWJ5
OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPiA+ID4+IFNpZ25lZC1v
ZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgo+ID4gPj4gQ0M6
IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pgo+ID4gPj4gQ0M6IEphc29u
IEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiA+ID4+IENDOiBEYXZlIEFpcmxpZSA8YWly
bGllZEBsaW51eC5pZT4KPiA+ID4+IENDOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Cj4gPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAxIC0KPiA+ID4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2FtZGtmZF9ncHV2bS5jIHwgIDUgKystLS0KPiA+ID4+ICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2NzLmMgICAgICAgICAgIHwgIDIgKy0KPiA+ID4+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jICAgICAgICAgIHwgIDMgKy0tCj4gPiA+PiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5jICAgICAgICAgICB8ICA4ICsr
KysrKysrCj4gPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5oICAg
ICAgICAgICB8ICA1ICsrKysrCj4gPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYyAgICAgICAgICB8IDEyICsrKysrKysrKystLQo+ID4gPj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmggICAgICAgICAgfCAgNSArKystLQo+ID4gPj4g
ICA4IGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+ID4g
PiBUaGlzIGlzIHRvbyBiaWcgdG8gdXNlIGFzIGEgY29uZmxpY3QgcmVzb2x1dGlvbiwgd2hhdCB5
b3UgY291bGQgZG8gaXMKPiA+ID4gYXBwbHkgdGhlIG1ham9yaXR5IG9mIHRoZSBwYXRjaCBvbiB0
b3Agb2YgeW91ciB0cmVlIGFzLWlzIChpZSBrZWVwCj4gPiA+IHVzaW5nIHRoZSBvbGQgaG1tX3Jh
bmdlX3JlZ2lzdGVyKSwgdGhlbiB0aGUgY29uZmxpY3QgcmVzb2x1dGlvbiBmb3IKPiA+ID4gdGhl
IHVwZGF0ZWQgQU1EIEdQVSB0cmVlIGNhbiBiZSBhIHNpbXBsZSBvbmUgbGluZSBjaGFuZ2U6Cj4g
PiA+Cj4gPiA+ICAgLSAgIGhtbV9yYW5nZV9yZWdpc3RlcihyYW5nZSwgbW0sIHN0YXJ0LAo+ID4g
PiAgICsgICBobW1fcmFuZ2VfcmVnaXN0ZXIocmFuZ2UsIG1pcnJvciwgc3RhcnQsCj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdGFydCArIHR0bS0+bnVtX3BhZ2VzICogUEFHRV9TSVpF
LCBQQUdFX1NISUZUKTsKPiA+ID4KPiA+ID4gV2hpY2ggaXMgdHJpdmlhbCBmb3IgZXZlcm9uZSB0
byBkZWFsIHdpdGgsIGFuZCBzb2x2ZXMgdGhlIHByb2JsZW0uCj4gPgo+ID4gR29vZCBpZGVhLgo+
ID4KPiA+Cj4gPiA+Cj4gPiA+IFRoaXMgaXMgcHJvYmFibHkgYSBtdWNoIGJldHRlciBvcHRpb24g
dGhhbiByZWJhc2luZyB0aGUgQU1EIGdwdSB0cmVlLgo+ID4KPiA+IEkgdGhpbmsgQWxleCBpcyBw
bGFubmluZyB0byBtZXJnZSBobW0uZ2l0IGludG8gYW4gdXBkYXRlZCBkcm0tbmV4dCBhbmQKPiA+
IHRoZW4gcmViYXNlIGFtZC1zdGFnaW5nLWRybS1uZXh0IG9uIHRvcCBvZiB0aGF0LiBSZWJhc2lu
ZyBvdXIKPiA+IGFtZC1zdGFnaW5nLWRybS1uZXh0IGlzIHNvbWV0aGluZyB3ZSBkbyBldmVyeSBt
b250aCBvciB0d28gYW55d2F5Lgo+ID4KPiAKPiBHbyBhaGVhZCBhbmQgcmVzcGluIHlvdXIgcGF0
Y2ggYXMgcGVyIHRoZSBzdWdnZXN0aW9uIGFib3ZlLiAgdGhlbiBJCj4gY2FuIGFwcGx5IGl0IEkg
Y2FuIGVpdGhlciBtZXJnZSBobW0gaW50byBhbWQncyBkcm0tbmV4dCBvciB3ZSBjYW4ganVzdAo+
IHByb3ZpZGUgdGhlIGNvbmZsaWN0IGZpeCBwYXRjaCB3aGljaGV2ZXIgaXMgZWFzaWVyLiAgV2hp
Y2ggaG1tIGJyYW5jaAo+IGlzIGZvciA1LjM/Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvcmRtYS9yZG1hLmdpdC8/aD1obW0KClllcywgYW55dGhpbmcg
Zm9yIDUuMiBzaG91bGQgZ28gdG8gQW5kcmV3LgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
