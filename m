Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCA182C88
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6B489B55;
	Tue,  6 Aug 2019 07:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410128.outbound.protection.outlook.com [40.107.141.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCCD6E3B7
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 09:06:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=od8ygbaVeJCEk/k1HIYRFWCSCPSgiusPZQjyQ0KPJhcWhuvf5EOt94oDvuLmU4NWYiEyPqGpdQkoZbUUPd1Qb/6ghFk7IdCmFxuTQMjfabvB4AB0O6lQB6p3VfRe51pLuJE+v8viQsM6R4hkwQROt9dhrjp5Dimuu7LdxpjBAPxWDYxmc4xUoDiHRGkfnceChdkyxHyU4lgYudiWDSh8p+dH4thdsO5PeGD1gNoqTABDEoAYZcvE5cRKlOooNf0QjM6mdWtYSHq2qzgeK94iVa7hR611CU1ZVbSXDARK4d7m6Ko03arIYBUslCmdCfvzlyrDqSq4li3sFB7LDR8Ktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VpWoLLqwEbBAhNQ63++FLb/1W0DwFaE1b58Ag31HAPw=;
 b=LutHU9MRclBAT9Q4ae26/5GGYj0hw7yjK3zfxdlBZupJ/DnlXXVugePS2ig9Sv0cHdCyblareldPUXW7u1rae57M0OtJnLM+pq5Yfs7GjYT22Xj2a2H2fzkRIli/iw9hfFUqL9pzSlgWFjxbjbeqYKbSvEWieJhK1fbocBbR8nQyrqI1PneHQYUWq6JsVgById/8PaGpD+KgArkkUFchFbtYtqjgoPoEsGyCc4Zgzv13f9Nyl9T7Z/p/zTViv/SkLGljo6/i4R20CHBaZC46fg+HeOhakL8h1uPsn3VhjF8pts8uKakux8nUsL363WErnN0IUEJu5KpoWrnBVVza3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bp.renesas.com;dmarc=pass action=none
 header.from=bp.renesas.com;dkim=pass header.d=bp.renesas.com;arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1577.jpnprd01.prod.outlook.com (52.133.162.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 09:06:38 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2136.010; Mon, 5 Aug 2019
 09:06:38 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH/RFC 06/12] drm: rcar-du: lvds: Do not look at ports for
 identifying bridges
Thread-Topic: [PATCH/RFC 06/12] drm: rcar-du: lvds: Do not look at ports for
 identifying bridges
Thread-Index: AQHVSQTNmQ0Ry72VukycgK2vr1/Ab6bngNyAgATG5lA=
Date: Mon, 5 Aug 2019 09:06:38 +0000
Message-ID: <TY1PR01MB1770B8EED1043B50ED7AEA12C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802080821.GG5008@pendragon.ideasonboard.com>
In-Reply-To: <20190802080821.GG5008@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0dae5527-5fd9-4bdd-1948-08d719843987
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:TY1PR01MB1577; 
x-ms-traffictypediagnostic: TY1PR01MB1577:
x-microsoft-antispam-prvs: <TY1PR01MB1577DAA6B04CA8FBC469CB04C0DA0@TY1PR01MB1577.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(189003)(199004)(76116006)(66556008)(64756008)(66446008)(26005)(25786009)(66476007)(6116002)(3846002)(33656002)(71190400001)(71200400001)(107886003)(54906003)(186003)(66946007)(6246003)(68736007)(305945005)(74316002)(7696005)(478600001)(316002)(7736002)(8936002)(81156014)(99286004)(81166006)(53546011)(76176011)(102836004)(256004)(2906002)(66066001)(14454004)(5660300002)(6506007)(8676002)(52536014)(53936002)(229853002)(476003)(55016002)(44832011)(6436002)(6916009)(11346002)(486006)(7416002)(86362001)(4326008)(446003)(9686003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1577;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HWGHjVRJR65aQo9MaGyCHnF3bhBtXnQlq1nXiiD5suxLHM+XZWmDU2PGMjcoi9o5rYgZwH9bCJ9Vw7078EGiyyCFbaRdwNCfgjTCNqVtDtOEDOVE6MUDjpxHY2pquVYdfGEM1ooWhkbUn1T7EO+mbQ8Dp39OlGWLD/6y/LzYhvrHrSMhKp1TDonVE26dzEIwspNrF/RnCV6uP/56Hh6QS/AK/fdQkBBf1YEFaI1Sb4kUI+9X1yHAvD4BEfrCIqlApYWn1138dOi8n9q5u3Q4JITzLzqi2VbOZNvzsRT4Bz0NiIXOm5oxG9+rAYNC5DNElZSLl96PAs05cOrkUQAOwPxHrXnKQvDHjtzrgenbnEbwytzB5FIM71UmFJ3CdUsgCaptP0WiGBhu6yGaB09iSky24IR8iCXV/Fxad4qOsJ0=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dae5527-5fd9-4bdd-1948-08d719843987
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:06:38.6807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1577
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VpWoLLqwEbBAhNQ63++FLb/1W0DwFaE1b58Ag31HAPw=;
 b=RyNxKVrOExGiR228TC6Ipe20ubm7aDyKp54cseM9F/6qmdgXMYZ5BA+npmEKptnZSp3xhFl2hoAffm+lUHGo0ASRpeRyYmUAqMI9mZar0qV7y8Q9foeF+ShcFilUUPhW6UQBQrgm6rtxmVEB35RGZYBF+yzPgtfXNbp3wzx3kzc=
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
dDogMDIgQXVndXN0IDIwMTkgMDk6MDgNCj4gU3ViamVjdDogUmU6IFtQQVRDSC9SRkMgMDYvMTJd
IGRybTogcmNhci1kdTogbHZkczogRG8gbm90IGxvb2sgYXQgcG9ydHMgZm9yIGlkZW50aWZ5aW5n
IGJyaWRnZXMNCj4gDQo+IEhpIEZhYnJpemlvLA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0
Y2guDQo+IA0KPiBPbiBGcmksIEF1ZyAwMiwgMjAxOSBhdCAwODozNDowM0FNICswMTAwLCBGYWJy
aXppbyBDYXN0cm8gd3JvdGU6DQo+ID4gV2UgbWF5IGJlIGNvbm5lY3RlZCB0byBhIGR1YWwgTFZE
UyBkaXNwbGF5LCB0aGVyZWZvcmUgY2hlY2tpbmcNCj4gPiBpZiBub2RlICE9IHJlbW90ZV9pbnB1
dCBmb3IgaWRlbnRpZnlpbmcgYnJpZGdlcyBpcyBub3QgZ29pbmcgdG8NCj4gPiB3b3JrIGFueW1v
cmUuDQo+ID4gV2UgY291bGQgdHJ5IHRvIG1hdGNoIHRoZSBwb3J0cyBvbiB0aGUgcmVtb3RlIGVu
ZCB0byB0aGUgTFZEUw0KPiA+IGVuY29kZXJzLCBob3dldmVyIHRoZSBjb21wYW5pb24gTFZEUyBl
bmNvZGVyIGluc3RhbmNlIGRvZXNuJ3QNCj4gPiBob2xkIGEgcmVmZXJlbmNlIHRvIHRoZSBwcmlt
YXJ5IExWRFMgZW5jb2RlciBpbnN0YW5jZS4NCj4gPiBXZSBrbm93IHdlIGNvdWxkIGJlIGNvbm5l
Y3RlZCB0byBlaXRoZXIgYSBicmlkZ2UsIG9yIGEgcGFuZWwsDQo+ID4gdGhlcmVmb3JlIGxvb2sg
dGhyb3VnaCB0aGUgcmVnaXN0ZXJlZCBicmlkZ2VzIGFuZCBwYW5lbHMsIHVudGlsDQo+ID4gd2Ug
aGF2ZSBhIG1hdGNoLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxm
YWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1
L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jIHwgMjkgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0p
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRz
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYw0KPiA+IGluZGV4IGMzMDZm
YWIuLjJkNTRhZTUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNh
cl9sdmRzLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYw0K
PiA+IEBAIC03MTEsMTAgKzcxMSw3IEBAIHN0YXRpYyBpbnQgcmNhcl9sdmRzX3BhcnNlX2R0X2Nv
bXBhbmlvbihzdHJ1Y3QgcmNhcl9sdmRzICpsdmRzKQ0KPiA+ICBzdGF0aWMgaW50IHJjYXJfbHZk
c19wYXJzZV9kdChzdHJ1Y3QgcmNhcl9sdmRzICpsdmRzKQ0KPiA+ICB7DQo+ID4gIAlzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKmxvY2FsX291dHB1dCA9IE5VTEw7DQo+ID4gLQlzdHJ1Y3QgZGV2aWNlX25v
ZGUgKnJlbW90ZV9pbnB1dCA9IE5VTEw7DQo+ID4gIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKnJlbW90
ZSA9IE5VTEw7DQo+ID4gLQlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGU7DQo+ID4gLQlib29sIGlz
X2JyaWRnZSA9IGZhbHNlOw0KPiA+ICAJaW50IHJldCA9IDA7DQo+ID4NCj4gPiAgCWxvY2FsX291
dHB1dCA9IG9mX2dyYXBoX2dldF9lbmRwb2ludF9ieV9yZWdzKGx2ZHMtPmRldi0+b2Zfbm9kZSwg
MSwgMCk7DQo+ID4gQEAgLTc0MiwyNyArNzM5LDggQEAgc3RhdGljIGludCByY2FyX2x2ZHNfcGFy
c2VfZHQoc3RydWN0IHJjYXJfbHZkcyAqbHZkcykNCj4gPiAgCQlnb3RvIGRvbmU7DQo+ID4gIAl9
DQo+ID4NCj4gPiAtCXJlbW90ZV9pbnB1dCA9IG9mX2dyYXBoX2dldF9yZW1vdGVfZW5kcG9pbnQo
bG9jYWxfb3V0cHV0KTsNCj4gPiAtDQo+ID4gLQlmb3JfZWFjaF9lbmRwb2ludF9vZl9ub2RlKHJl
bW90ZSwgbm9kZSkgew0KPiA+IC0JCWlmIChub2RlICE9IHJlbW90ZV9pbnB1dCkgew0KPiA+IC0J
CQkvKg0KPiA+IC0JCQkgKiBXZSd2ZSBmb3VuZCBvbmUgZW5kcG9pbnQgb3RoZXIgdGhhbiB0aGUg
aW5wdXQsIHRoaXMNCj4gPiAtCQkJICogbXVzdCBiZSBhIGJyaWRnZS4NCj4gPiAtCQkJICovDQo+
ID4gLQkJCWlzX2JyaWRnZSA9IHRydWU7DQo+ID4gLQkJCW9mX25vZGVfcHV0KG5vZGUpOw0KPiA+
IC0JCQlicmVhazsNCj4gPiAtCQl9DQo+ID4gLQl9DQo+ID4gLQ0KPiA+IC0JaWYgKGlzX2JyaWRn
ZSkgew0KPiA+IC0JCWx2ZHMtPm5leHRfYnJpZGdlID0gb2ZfZHJtX2ZpbmRfYnJpZGdlKHJlbW90
ZSk7DQo+ID4gLQkJaWYgKCFsdmRzLT5uZXh0X2JyaWRnZSkgew0KPiA+IC0JCQlyZXQgPSAtRVBS
T0JFX0RFRkVSOw0KPiA+IC0JCQlnb3RvIGRvbmU7DQo+ID4gLQkJfQ0KPiA+IC0NCj4gPiArCWx2
ZHMtPm5leHRfYnJpZGdlID0gb2ZfZHJtX2ZpbmRfYnJpZGdlKHJlbW90ZSk7DQo+IA0KPiBIb3cg
YWJvdXQgdXNpbmcgZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKCkgPw0KDQpJdCBzb3VuZHMg
bGlrZSBkcm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2UgaXMgZXhhY3RseSB3aGF0IHdlIG5lZWQg
aGVyZSwgSSdsbCBnaXZlIGl0IGEgdHJ5LA0KdGhhbmsgeW91IGZvciB0aGUgcG9pbnRlciENCg0K
VGhhbmtzLA0KRmFiDQoNCj4gDQo+ID4gKwlpZiAobHZkcy0+bmV4dF9icmlkZ2UpIHsNCj4gPiAg
CQlpZiAobHZkcy0+aW5mby0+cXVpcmtzICYgUkNBUl9MVkRTX1FVSVJLX0RVQUxfTElOSykNCj4g
PiAgCQkJbHZkcy0+ZHVhbF9saW5rID0gbHZkcy0+bmV4dF9icmlkZ2UtPnRpbWluZ3MNCj4gPiAg
CQkJCQk/IGx2ZHMtPm5leHRfYnJpZGdlLT50aW1pbmdzLT5kdWFsX2xpbmsNCj4gPiBAQCAtNzcw
LDcgKzc0OCw3IEBAIHN0YXRpYyBpbnQgcmNhcl9sdmRzX3BhcnNlX2R0KHN0cnVjdCByY2FyX2x2
ZHMgKmx2ZHMpDQo+ID4gIAl9IGVsc2Ugew0KPiA+ICAJCWx2ZHMtPnBhbmVsID0gb2ZfZHJtX2Zp
bmRfcGFuZWwocmVtb3RlKTsNCj4gPiAgCQlpZiAoSVNfRVJSKGx2ZHMtPnBhbmVsKSkgew0KPiA+
IC0JCQlyZXQgPSBQVFJfRVJSKGx2ZHMtPnBhbmVsKTsNCj4gPiArCQkJcmV0ID0gLUVQUk9CRV9E
RUZFUjsNCj4gPiAgCQkJZ290byBkb25lOw0KPiA+ICAJCX0NCj4gPiAgCX0NCj4gPiBAQCAtNzg0
LDcgKzc2Miw2IEBAIHN0YXRpYyBpbnQgcmNhcl9sdmRzX3BhcnNlX2R0KHN0cnVjdCByY2FyX2x2
ZHMgKmx2ZHMpDQo+ID4NCj4gPiAgZG9uZToNCj4gPiAgCW9mX25vZGVfcHV0KGxvY2FsX291dHB1
dCk7DQo+ID4gLQlvZl9ub2RlX3B1dChyZW1vdGVfaW5wdXQpOw0KPiA+ICAJb2Zfbm9kZV9wdXQo
cmVtb3RlKTsNCj4gPg0KPiA+ICAJc3dpdGNoIChyZXQpIHsNCj4gDQo+IC0tDQo+IFJlZ2FyZHMs
DQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
