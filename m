Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B1582C94
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFDA89C09;
	Tue,  6 Aug 2019 07:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400117.outbound.protection.outlook.com [40.107.140.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6A16E3A6
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 09:12:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfDmsr/iPpgFLySqMayGLheCEh2ZGiYKV/ETW9dS53njEiJpEBPEbZW+YGUv9LlImjJ2fb8U9AohoXRIE7Gu9GtWtjCrKvbYoPsivWluNOlW+gJvCnOyMGePDCPPcdieAzp7BA7hlrWkz/5CpVjsz786SVn5V4pZJHwdJC3O8AU7vtdEEG8DK8/Qc9xGZRS2PtZDA4439CI+113GOUWEAD+rXtKyRJGIl0NylShf/Ca6usL5FC76KiXEFFsgo3HeyHieJWSdymCh2A6SS4o/oVWtrz5xNAA/p/sFQzP+hHTudWE1dWUMj+Q1tmaSmKqSL9rhaaXW/02ms9C+ztt23w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXMY/cyLRDAt63X6DluSEbn9RshI9znYximznJ0jP04=;
 b=CkAteQGOGv5b60sVviZAXoh/VCggodjAqv2scaalMyR76fVwHvaK2GMG5hlNmcgf5YsTOOnqZpcfYSaFO1kfyMgYeDZ/8JtAxwtcJsugJIXWib249oWIdP6/stYoFnGq6ORJHXSnKsy3VVLlKuPTQRpEDEbNjfz0RKmFJwunvKyyTBEskjm8rq14SKlmSntceKgMTyKQ+6vjEg7Yjybgg3L6nS4tV050988hSZYatSqaLplX0j8avC/P8yOLD9I5v9o123BJJj7LzLUXKHyktSy9uyl5g1LILMkM4Z/QuA2pkCBnJFaBEgnQGEE6Ugvmv2NXD8mUtLuVfuSsWNS0dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bp.renesas.com;dmarc=pass action=none
 header.from=bp.renesas.com;dkim=pass header.d=bp.renesas.com;arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1817.jpnprd01.prod.outlook.com (52.133.162.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Mon, 5 Aug 2019 09:12:34 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2136.010; Mon, 5 Aug 2019
 09:12:34 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH/RFC 07/12] drm: rcar-du: lvds: Add support for dual link
 panels
Thread-Topic: [PATCH/RFC 07/12] drm: rcar-du: lvds: Add support for dual link
 panels
Thread-Index: AQHVSQTQGxO+ExbJj06XbPWiwlaDqKbnhDUAgATD9OA=
Date: Mon, 5 Aug 2019 09:12:34 +0000
Message-ID: <TY1PR01MB1770CA2012398B421E609D54C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-8-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802082020.GH5008@pendragon.ideasonboard.com>
In-Reply-To: <20190802082020.GH5008@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1464ca88-4e1d-4fba-3bf7-08d719850dd2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TY1PR01MB1817; 
x-ms-traffictypediagnostic: TY1PR01MB1817:
x-microsoft-antispam-prvs: <TY1PR01MB1817677B30D47B35225B09F8C0DA0@TY1PR01MB1817.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(189003)(199004)(102836004)(14454004)(256004)(66066001)(71190400001)(6506007)(99286004)(76176011)(53546011)(81166006)(52536014)(81156014)(68736007)(71200400001)(7416002)(66946007)(6116002)(305945005)(478600001)(7736002)(6436002)(64756008)(66556008)(66476007)(66446008)(86362001)(26005)(186003)(44832011)(486006)(74316002)(53936002)(3846002)(229853002)(6916009)(446003)(11346002)(33656002)(316002)(25786009)(4326008)(2906002)(5660300002)(9686003)(8936002)(8676002)(76116006)(55016002)(476003)(54906003)(6246003)(7696005)(107886003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1817;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1vZNtMAsqVxHFWfB1zjo/DBGtSgmEYdajb3ZA8YC5B27+u2m2V3bmnrSscUT0lfE0fXRPEfXcYhHqfz2ch3nYfTpvywN4F6ccMCl3fSavypMD9BtgAakhtCRajZ3iNpUlImbz57kRGW/OUDyCZzZzOm1Fcco8h6qHTQyZGdQzK0BBXav55j67BEG7R2LYW+rpDGhVC3bRJ5WzvtjvJtG3r59lyG2VyEDGLSmCU5Yrtbc+pq7K+MOkXXp51T0DPGcjn0B0kYWm6ApVO11gqgK5zp78RqgMr90ZtzTEsfs0j1s2/WwGYf7US8FFxBYYPrHgvM4DlgZfXtY45eLmt05O974rMvzYFAc/B291ZSfYxzAcp7GF9TCrfgmrYtj03sk8pFVSgAn9GSweBIld3IhryEo+1hTPRswlGSObf0frGM=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1464ca88-4e1d-4fba-3bf7-08d719850dd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:12:34.7622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1817
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXMY/cyLRDAt63X6DluSEbn9RshI9znYximznJ0jP04=;
 b=pcpRNzN6GCip/1w5+laW02earGuqnGrr8u5xM88aT8cf7rglQqpwNaH7Xia3B0yqGvQfy6BCBjxPCd4wPB6QyAewrePT2Ejk+7IcJQ0v7gczX7RA39wWSsG5PCCP7UMGY6WfWtbIjnYXRjk2wnQZmkAWGrkG9e4Wp+dDz8Q1aLk=
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
dDogMDIgQXVndXN0IDIwMTkgMDk6MjANCj4gU3ViamVjdDogUmU6IFtQQVRDSC9SRkMgMDcvMTJd
IGRybTogcmNhci1kdTogbHZkczogQWRkIHN1cHBvcnQgZm9yIGR1YWwgbGluayBwYW5lbHMNCj4g
DQo+IEhpIEZhYnJpemlvLA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBP
biBGcmksIEF1ZyAwMiwgMjAxOSBhdCAwODozNDowNEFNICswMTAwLCBGYWJyaXppbyBDYXN0cm8g
d3JvdGU6DQo+ID4gSWYgdGhlIGRpc3BsYXkgY29tZXMgd2l0aCB0d28gcG9ydHMsIGFzc3VtZSBp
dCBzdXBwb3J0cyBkdWFsDQo+ID4gbGluay4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJp
emlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYyB8IDMgKysrDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3Jj
YXJfbHZkcy5jDQo+ID4gaW5kZXggMmQ1NGFlNS4uOTdjNTFjMiAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jDQo+ID4gQEAgLTc1MSw2ICs3NTEsOSBAQCBzdGF0aWMg
aW50IHJjYXJfbHZkc19wYXJzZV9kdChzdHJ1Y3QgcmNhcl9sdmRzICpsdmRzKQ0KPiA+ICAJCQly
ZXQgPSAtRVBST0JFX0RFRkVSOw0KPiA+ICAJCQlnb3RvIGRvbmU7DQo+ID4gIAkJfQ0KPiA+ICsJ
CWlmIChsdmRzLT5pbmZvLT5xdWlya3MgJiBSQ0FSX0xWRFNfUVVJUktfRFVBTF9MSU5LKQ0KPiA+
ICsJCQlsdmRzLT5kdWFsX2xpbmsgPSBvZl9ncmFwaF9nZXRfZW5kcG9pbnRfY291bnQocmVtb3Rl
KQ0KPiA+ICsJCQkJCT09IDI7DQo+IA0KPiBUaGlzIGlzIGEgYml0IG9mIGEgaGFjaywgYXMgSSB0
aGluayB0aGUgaW5mb3JtYXRpb24gc2hvdWxkIGJlIHF1ZXJpZWQNCj4gZnJvbSB0aGUgcGFuZWws
IGxpa2Ugd2UgZG8gZm9yIGJyaWRnZXMuIEknZCBzYXkgd2UgY2FuIGxpdmUgd2l0aCB0aGlzDQo+
IGZvciBub3csIGJ1dCBhcyB0aGUgZGF0YSBzd2FwIGZsYWcgc2hvdWxkIGNvbWUgZnJvbSB0aGUg
cGFuZWwgYXMgd2VsbCwNCj4gd2Ugd2lsbCBuZWVkIGluZnJhc3RydWN0dXJlIGZvciB0aGF0LCBh
bmQgd2UgY2FuIGFzIHdlbGwgdGhyb3VnaCB0aGUNCj4gZHVhbCBsaW5rIGZsYWcgdGhlcmUgYXQg
dGhlIHNhbWUgdGltZS4NCg0KSSB0b3RhbGx5IGFncmVlLCB0aGlzIGlzIGEgbmFzdHkgaGFjaywg
bXkgc2VyaWVzIGlzIG1pc3NpbmcgdGhlIGluZnJhc3RydWN0dXJlDQpmb3IgZGVzY3JpYmluZyB0
aGlzIGluZm9ybWF0aW9uDQoNCj4gDQo+IEkgdGhpbmsgd2Ugc2hvdWxkIHVzZSB0aGUgZHJtX2Jy
aWRnZV90aW1pbmdzIHN0cnVjdHVyZSBmb3IgdGhpcyBwdXJwb3NlLA0KPiBhcyBpdCB3b3VsZCBt
YWtlIGxpZmUgbW9yZSBkaWZmaWN1bHQgZm9yIHVzZXJzIG9mIGRybV9icmlkZ2UgYW5kDQo+IGRy
bV9wYW5lbCB0byBoYXZlIHR3byBkaWZmZXJlbnQgc3RydWN0dXJlcyAoZXNwZWNpYWxseSB3aGVu
IHdyYXBwaW5nIGENCj4gZHJtX3BhbmVsIHdpdGggZHJtX3BhbmVsX2JyaWRnZV9hZGQoKSkuIFRo
ZSBzdHJ1Y3R1cmUgY291bGQgYmUgcmVuYW1lZA0KPiBpZiBkZXNpcmVkLg0KDQpJIGFtIG5vdCB0
b28gc3VyZSB1c2luZyBkcm1fYnJpZGdlX3RpbWluZ3MgZm9yIHBhbmVscyB3b3VsZCBtYWtlIGV2
ZXJ5Ym9keQ0KaGFwcHk/IElzIHRoZXJlIGFueSBhbHRlcm5hdGl2ZT8gUGVyaGFwcyB0aGlzIGNh
bGxzIGZvciBhIG5ldyBzdHJ1Y3Qgd2UgY291bGQNCmVtYmVkIGluIGJvdGggZHJtX2JyaWRnZV90
aW1pbmdzIGFuZCBzb21lIGRybV9wYW5lbF88d2hhdGV2ZXI+IGRhdGENCnN0cnVjdHVyZT8NCg0K
VGhhbmtzLA0KRmFiDQogDQo+IA0KPiA+ICAJfQ0KPiA+DQo+ID4gIAlpZiAobHZkcy0+ZHVhbF9s
aW5rKSB7DQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
