Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADA482CAC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF116E151;
	Tue,  6 Aug 2019 07:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400118.outbound.protection.outlook.com [40.107.140.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF02D6E3B5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 09:13:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReU4e2y8Po0mN31SbRFK9/uZmAQzD6z+rMDxmSnswd34uN0R0/VcYOQn/PhsKTB+ZGJ7OxFE4Dcn04eXah3BB8iK3osCsdAMmh9r1dP1urU2NTKpgLoGoKK1s1kjD/IN52kdI2U5JJfqEUbYyI9+zvyT82R9KAnl2UmfTiRXXQUSHuPtF0IIvbcHxxTaK8OyFO05FAa8UvCcQuoU/g7/9WDJ+tWLRtnnNmYTEj0XZP128wFp08GNYhUbGOfCn+jglDkea//VSiC/2ZpX+YUTlaWtbWeH8/4s1CHndStmrnnFKOceBLxolyqaaOfHdGis5aZuRrJwC5sLmhA30wYyNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHcCGHcyoQggT8KTDMvMlJQSNtcC3WEDUnlrtYiZZhI=;
 b=H8lQA7pGVqH0Cu5bv+1D0C40LICXvEK68zDtLnAYFzuglQN63rL+fmnjMb6/IpUtbhN8AvBwJRg08hhcfPGWHVg9oopV/LmZMfIzu+uepzNqhuHRiae/nJhTq9RokuSEWGTqUd4Qc5wFPxIpnboWqW9l5+7kJcFswMqlGnthxqS03YdFyk7TNMZS9PIigJ5mtgnP3WimMq+ZUDlATAFL/56SpTgBkklSS9+vnFIwIw/qX6lnbm0HNNZt1jRiKgTKGVFZCyI4yYjkvbpRuyo5K6h2KZbT7msEwePCzO8hz+Dn65jGLAMScZPt8C/5XtHa0ROSLjOUt48+s7B2kOi0VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bp.renesas.com;dmarc=pass action=none
 header.from=bp.renesas.com;dkim=pass header.d=bp.renesas.com;arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1817.jpnprd01.prod.outlook.com (52.133.162.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Mon, 5 Aug 2019 09:13:37 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2136.010; Mon, 5 Aug 2019
 09:13:37 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH/RFC 08/12] drm: rcar-du: lvds: Fix bridge_to_rcar_lvds
Thread-Topic: [PATCH/RFC 08/12] drm: rcar-du: lvds: Fix bridge_to_rcar_lvds
Thread-Index: AQHVSQTSrbTIKPXXuEe1pDPVJr2EH6bnhLeAgATFG6A=
Date: Mon, 5 Aug 2019 09:13:37 +0000
Message-ID: <TY1PR01MB1770195BDEBCFF107F0B1E03C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-9-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802082209.GI5008@pendragon.ideasonboard.com>
In-Reply-To: <20190802082209.GI5008@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5daabcb1-8383-4ec4-07e5-08d71985333e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TY1PR01MB1817; 
x-ms-traffictypediagnostic: TY1PR01MB1817:
x-microsoft-antispam-prvs: <TY1PR01MB181727CB49DD5BBD62BB06F3C0DA0@TY1PR01MB1817.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(189003)(199004)(102836004)(14454004)(256004)(66066001)(71190400001)(6506007)(99286004)(76176011)(53546011)(81166006)(52536014)(81156014)(68736007)(71200400001)(7416002)(66946007)(6116002)(305945005)(478600001)(7736002)(6436002)(64756008)(66556008)(66476007)(66446008)(86362001)(26005)(186003)(44832011)(486006)(74316002)(53936002)(3846002)(229853002)(6916009)(446003)(11346002)(33656002)(316002)(25786009)(4326008)(2906002)(5660300002)(9686003)(8936002)(8676002)(76116006)(55016002)(476003)(54906003)(6246003)(7696005)(107886003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1817;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ss8tHes4H673f0UhK8eWDRwWH/YBYUIxWLCVJkpD6vn6MmDV64wa5b5VSNiYSBl7hsojrJceL/HE43Rvmm/zoj8DnYP9qRVXJsv5LZ1RuE8mmGoFqQ8IijX+zQSstD0w3D8gPTl06TqpMHzPY08ROBkXkEgW7EJ2cPuAii3p5152WcoNKCeYovoF9WXYqHPrNsHr5RqZsqjMkx0MC4VSTCJUR5OIH3vD0TrUhueiFt/YQkSfXupc5BVQbbefMu8bp/LhncdjggxIzqaLWhICpdvOyYXdCnD7gp9OWlEpJbFzs/cO4uvQlN+OPqbxNfv75+G6MgaV7lM45ZTLpXx3yFiiyV6EJpDxxaCuKS4yXg1JST1NE3rHGQgNI5oqsL5eZLifImp11rmVA4HZFhMpOjtXMHDv89bcXbLjhgqr8SM=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5daabcb1-8383-4ec4-07e5-08d71985333e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:13:37.6013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1817
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHcCGHcyoQggT8KTDMvMlJQSNtcC3WEDUnlrtYiZZhI=;
 b=ovtMuhKiZJleA7B53f2kJLflf16lbu+IRfLGV0xFTL0jjfE+KqxKTqlrfTDhDTX3X+d7FUQlawJDHkTILvFEjYvoZW5aybW+MyaPIcmi3Rxt0mBoJOu2GlX2pRhTRLoyln1eWn8/QHssZPI6aeS8NEZBt/P0lE3OLK6Nq31h3eU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2Vu
dDogMDIgQXVndXN0IDIwMTkgMDk6MjINCj4gU3ViamVjdDogUmU6IFtQQVRDSC9SRkMgMDgvMTJd
IGRybTogcmNhci1kdTogbHZkczogRml4IGJyaWRnZV90b19yY2FyX2x2ZHMNCj4gDQo+IEhpIEZh
YnJpemlvLA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBGcmksIEF1
ZyAwMiwgMjAxOSBhdCAwODozNDowNUFNICswMTAwLCBGYWJyaXppbyBDYXN0cm8gd3JvdGU6DQo+
ID4gVXNpbmcgbmFtZSAiYnJpZGdlIiBmb3IgbWFjcm8gYnJpZGdlX3RvX3JjYXJfbHZkcyBhcmd1
bWVudCBkb2Vzbid0DQo+ID4gd29yayB3aGVuIHRoZSBwb2ludGVyIG5hbWUgdXNlZCBieSB0aGUg
Y2FsbGVyIGlzIG5vdCAiYnJpZGdlIi4NCj4gPiBSZW5hbWUgdGhlIGFyZ3VtZW50IHRvICJicmlk
Z2VfcHRyIiB0byBhbGxvdyBmb3IgYW55IHBvaW50ZXINCj4gPiBuYW1lLg0KPiA+DQo+ID4gRml4
ZXM6IGM2YTI3ZmE0MWZhYiAoImRybTogcmNhci1kdTogQ29udmVydCBMVkRTIGVuY29kZXIgY29k
ZSB0byBicmlkZ2UgZHJpdmVyIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8g
PGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9n
cHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgfCA0ICsrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yY2Fy
LWR1L3JjYXJfbHZkcy5jDQo+ID4gaW5kZXggOTdjNTFjMi4uZWRkNjNmNSAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYw0KPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jDQo+ID4gQEAgLTcyLDggKzcyLDggQEAgc3Ry
dWN0IHJjYXJfbHZkcyB7DQo+ID4gIAlib29sIHN0cmlwZV9zd2FwX2RhdGE7DQo+ID4gIH07DQo+
ID4NCj4gPiAtI2RlZmluZSBicmlkZ2VfdG9fcmNhcl9sdmRzKGJyaWRnZSkgXA0KPiA+IC0JY29u
dGFpbmVyX29mKGJyaWRnZSwgc3RydWN0IHJjYXJfbHZkcywgYnJpZGdlKQ0KPiA+ICsjZGVmaW5l
IGJyaWRnZV90b19yY2FyX2x2ZHMoYnJpZGdlX3B0cikgXA0KPiA+ICsJY29udGFpbmVyX29mKGJy
aWRnZV9wdHIsIHN0cnVjdCByY2FyX2x2ZHMsIGJyaWRnZSkNCj4gDQo+IEhvdyBhYm91dCBqdXN0
ICdiJyBpbnN0ZWFkIG9mICdicmlkZ2VfcHRyJyA/IElmIHRoYXQncyBmaW5lIHdpdGggeW91DQo+
IEknbGwgdGFrZSB0aGUgbW9kaWZpZWQgcGF0Y2ggaW4gbXkgdHJlZSwgbm8gbmVlZCB0byByZXN1
Ym1pdC4NCg0KVGhhdCdzIGZpbmUgYnkgbWUsIHRoYW5rIHlvdXIgZml4aW5nLg0KDQpUaGFua3Ms
DQpGYWINCg0KPiANCj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGlu
Y2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gDQo+ID4NCj4gPiAgI2RlZmluZSBjb25uZWN0b3Jf
dG9fcmNhcl9sdmRzKGNvbm5lY3RvcikgXA0KPiA+ICAJY29udGFpbmVyX29mKGNvbm5lY3Rvciwg
c3RydWN0IHJjYXJfbHZkcywgY29ubmVjdG9yKQ0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+
IExhdXJlbnQgUGluY2hhcnQNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
