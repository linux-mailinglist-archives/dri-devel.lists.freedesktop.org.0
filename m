Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C4EF6CAB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 03:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17886E819;
	Mon, 11 Nov 2019 02:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400100.outbound.protection.outlook.com [40.107.140.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F1E6F971
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 12:13:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+NUd0xwk/qeLYGLX98r7HHG9XieoHqG1I/bSccunVyPl9fq7fGTOvoXW74FNvaR7KLcCA9pjnviJCsSA0LNROpDAqDw1Mwy6lYRNMsIZBi/doU41fKQ0Qj8pRT+AsRLMtAiiUxJkzTQH+upqAyUM+etTWF71Wv11kphDBDrH5wc+lvFYqmnU6JPj9XdnaJ1370G4Wof96hBI+23rI8UHnH9+iQ16mLloXlnsz7H/KatN45mlqBCHZy67yCI9O1+wujPDZswOH1Gp3Nz79rFDEXG1RIJDiY/Eb+Ms6nefAd2TIvSSppd/MRLourey8I0TuLjrdiyfMNO2kfdxUUmsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yn0OhmUTiyWlTNGR7Ad3vhBuRXQSBmEDq8cXlFIeUQk=;
 b=dzWuGbRQr7v7Xrq3ZIGryacKJQVxkO/QOEUU1pjQSFR4PPCWOKnViV3Bc9QF28RqghOzjQh1+9YhQus9cmxJYngE3utKcBcj6Tsg4mInDTcfxqDQuLdHYHmkjlMer2mag8wQKqHoqY3YDtbLt3ZHEh++WlXytUKWkH8CbyC9tdUQyO3vzGJehv5uXBz4St9IM3sF6tY5ecnI+n4s55DyhGdlDdYHx6ErQXRpRyctsceWzKb0lvINwpwe9ToB+z6DlCbJmkcDEaey3sGZJSnzsv6wvnRUz0mE2X+M9d7RDBwC+lK0opcceHogaWIt/YZv+FnANCUwK+CrQFP7jgbN+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1675.jpnprd01.prod.outlook.com (52.133.163.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Fri, 8 Nov 2019 12:13:21 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::18df:cd2b:3b80:f287]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::18df:cd2b:3b80:f287%7]) with mapi id 15.20.2430.023; Fri, 8 Nov 2019
 12:13:21 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH 1/4] drm/bridge: Repurpose lvds-encoder.c
Thread-Topic: [PATCH 1/4] drm/bridge: Repurpose lvds-encoder.c
Thread-Index: AQHVjygQz2Y+psEDEE+CHimQYeCp+qd6w0qAgAAWDsCABjPkAIAALmwA
Date: Fri, 8 Nov 2019 12:13:20 +0000
Message-ID: <TY1PR01MB1770177F163134D477EFE9E0C07B0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1572443014-17335-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1572443014-17335-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <870bea7e-5e5d-c0ba-2f5d-ebd0fd493c7e@baylibre.com>
 <TY1PR01MB1770C9189BE24444BECCDC28C07F0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdXr00yvtdOkZ9JW2EZwWmT_hBiomvnU_sbCE9MyBKs8uA@mail.gmail.com>
In-Reply-To: <CAMuHMdXr00yvtdOkZ9JW2EZwWmT_hBiomvnU_sbCE9MyBKs8uA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2909aa0e-5b4b-4b9e-b77f-08d764450be2
x-ms-traffictypediagnostic: TY1PR01MB1675:|TY1PR01MB1675:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB167574E13252EBC2988F09D1C07B0@TY1PR01MB1675.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(199004)(189003)(11346002)(66476007)(66556008)(64756008)(7696005)(26005)(99286004)(76116006)(66946007)(6506007)(5660300002)(3846002)(7736002)(305945005)(6246003)(186003)(102836004)(316002)(53546011)(66446008)(478600001)(71200400001)(6116002)(25786009)(71190400001)(14444005)(55016002)(256004)(6436002)(8676002)(74316002)(52536014)(229853002)(76176011)(446003)(86362001)(66066001)(476003)(44832011)(81166006)(8936002)(6916009)(486006)(14454004)(9686003)(54906003)(2906002)(81156014)(7416002)(4326008)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1675;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iXJ20JnrRnTR9vq1D5XmZItGRlqQXfpiQw3vGEdvQc9TIGM5lfHv1mlXIs6xjo1PYoeM9/l4v2SQxCYK0+rPqpvieaEIX95H0oCcJN6TtIwMyjPXnhz+C4bbZj2STeaFZlHX5jD80GLbInbI1d79CkPxWDcPYesw4SBDdHbw9aDJmkXXuYrosauLUI874ml7vyCEAqQ0nDB+02VPtlq60zHRjUDLEvB84x56aPDLj3ai1LEkJVS7qiFC2FQ5vWm+/1EEHm7NZ3Ch48s7xc9oCApqHjh5cGY+oeG25Zu/XDxrgp2PnmuoJBr5niU1Pe+ifcP/zaKSwH1feNnXy3VwgyAy4P8jPG8Is3KL01PjNIXamlkmy8PrMmBklhmUas09VpXF6pBTpdsLhuH22j/FsJu49nsr9B2zRCPEt/CYNHbvngQRIj7qtLTXk2mQzwaO
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2909aa0e-5b4b-4b9e-b77f-08d764450be2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 12:13:20.9945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kE2puSfHYuMj2HE87rp5pHiJ/5+AWRAwD+jOjf+OwO2gRJSGjmx8Bx/R/j4wQI5qkW64FVp/xgMoSsyq6lCFdueRdMVHoR9Z5e4+BkPr390=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1675
X-Mailman-Approved-At: Mon, 11 Nov 2019 02:29:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yn0OhmUTiyWlTNGR7Ad3vhBuRXQSBmEDq8cXlFIeUQk=;
 b=fySMvovRqIqlsTOqtB3lCA6kQ9L886LWbeA6KrFjnnOuO6e7egQRI2scsfpwnrgRe9Vdlc/nQwzuZIjuINSLXSzjM+wXVOc7locYGYicPTYK1c6IJ64NlwKvRWcZxHFY47vtQYWqAlfYpUkZSmpdRwRFVzl8od/glZ3RJ0ppElQ=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Simon Horman <horms@verge.net.au>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAwOCBOb3ZlbWJl
ciAyMDE5IDA5OjIxDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS80XSBkcm0vYnJpZGdlOiBSZXB1
cnBvc2UgbHZkcy1lbmNvZGVyLmMNCj4gDQo+IEhpIEZhYnJpemlvLA0KPiANCj4gT24gTW9uLCBO
b3YgNCwgMjAxOSBhdCAxMTo0MiBBTSBGYWJyaXppbyBDYXN0cm8NCj4gPGZhYnJpemlvLmNhc3Ry
b0BicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBGcm9tOiBOZWlsIEFybXN0cm9uZyA8bmFy
bXN0cm9uZ0BiYXlsaWJyZS5jb20+DQo+ID4gPiBTZW50OiAwNCBOb3ZlbWJlciAyMDE5IDA5OjE4
DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNF0gZHJtL2JyaWRnZTogUmVwdXJwb3NlIGx2
ZHMtZW5jb2Rlci5jDQo+ID4gPg0KPiA+ID4gT24gMzAvMTAvMjAxOSAxNDo0MywgRmFicml6aW8g
Q2FzdHJvIHdyb3RlOg0KPiA+ID4gPiBsdmRzLWVuY29kZXIuYyBpbXBsZW1lbnRhdGlvbiBpcyBh
bHNvIHN1aXRhYmxlIGZvciBMVkRTIGRlY29kZXJzLA0KPiA+ID4gPiBub3QganVzdCBMVkRTIGVu
Y29kZXJzLg0KPiA+ID4gPiBJbnN0ZWFkIG9mIGNyZWF0aW5nIGEgbmV3IGRyaXZlciBmb3IgYWRk
cmVzc2luZyBzdXBwb3J0IGZvcg0KPiA+ID4gPiB0cmFuc3BhcmVudCBMVkRTIGRlY29kZXJzLCBy
ZXB1cnBvc2UgbHZkcy1lbmNvZGVyLmMgZm9yIHRoZSBncmVhdGVyDQo+ID4gPiA+IGdvb2QuDQo+
ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8u
Y2FzdHJvQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvS2NvbmZpZyAgICAgICAgfCAgIDggKy0NCj4gPiA+ID4gIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvTWFrZWZpbGUgICAgICAgfCAgIDIgKy0NCj4gPiA+ID4gIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jICAgfCAxNjkgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKw0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWVuY29kZXIu
YyB8IDE1NSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gPiA+ICA0IGZpbGVz
IGNoYW5nZWQsIDE3NCBpbnNlcnRpb25zKCspLCAxNjAgZGVsZXRpb25zKC0pDQo+ID4gPiA+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWNvZGVjLmMNCj4g
PiA+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtZW5j
b2Rlci5jDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcNCj4gPiA+ID4gaW5k
ZXggMzQzNjI5Ny4uOWU3NWNhNGUgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvS2NvbmZpZw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tj
b25maWcNCj4gPiA+ID4gQEAgLTQ1LDE0ICs0NSwxNCBAQCBjb25maWcgRFJNX0RVTUJfVkdBX0RB
Qw0KPiA+ID4gPiAgICAgICBTdXBwb3J0IGZvciBub24tcHJvZ3JhbW1hYmxlIFJHQiB0byBWR0Eg
REFDIGJyaWRnZXMsIHN1Y2ggYXMgQURJDQo+ID4gPiA+ICAgICAgIEFEVjcxMjMsIFRJIFRIUzgx
MzQgYW5kIFRIUzgxMzUgb3IgcGFzc2l2ZSByZXNpc3RvciBsYWRkZXIgREFDcy4NCj4gPiA+ID4N
Cj4gPiA+ID4gLWNvbmZpZyBEUk1fTFZEU19FTkNPREVSDQo+ID4gPiA+IC0gICB0cmlzdGF0ZSAi
VHJhbnNwYXJlbnQgcGFyYWxsZWwgdG8gTFZEUyBlbmNvZGVyIHN1cHBvcnQiDQo+ID4gPiA+ICtj
b25maWcgRFJNX0xWRFNfQ09ERUMNCj4gPiA+DQo+ID4gPg0KPiA+ID4gSSdtIG5vdCBDQ2VkIG9u
IG90aGVyIHBhdGNoZXMsIGJ1dCBJJ20gcHJldHR5IHN1cmUgeW91IHNob3VsZCBmaXggb3RoZXIN
Cj4gPiA+IEtjb25maWcgYW5kIGRlZmNvbmZpZ3Mgc2VsZWN0aW5nIHRoaXMgY29uZmlnIGluIHRo
aXMgcGF0Y2ggdG8gYXZvaWQgYnJlYWtpbmcgYmlzZWN0Lg0KPiA+DQo+ID4gTXkgdW5kZXJzdGFu
ZGluZyBpcyB0aGF0IG5vIGRlZmNvbmZpZyBhbmQgbm8gb3RoZXIgb3B0aW9uIHJlZmVyIGRpcmVj
dGx5IHRvIERSTV9MVkRTX0VOQ09ERVIsIGRvIHlvdSBtaW5kIGJlaW5nIGEgbGl0dGxlIGJpdA0K
PiBtb3JlIHNwZWNpZmljIGhlcmU/DQo+IA0KPiBTaWRlbm90ZTogaXQgbG9va3MgbGlrZSBDT05G
SUdfRFJNX0xWRFNfRU5DT0RFUiBzaG91bGQgaGF2ZSBiZWVuIGVuYWJsZWQNCj4gaW4gc2htb2Jp
bGVfZGVmY29uZmlnIHNpbmNlIGNvbW1pdHMgMzgxZGRmZTQ3ODg3MTU4OCAoImRybTogcmNhci1k
dToNCj4gSGFyZGNvZGUgZW5jb2RlcnMgdHlwZXMgdG8gRFJNX01PREVfRU5DT0RFUl9OT05FIikg
YW5kIDcxNjBkNTdiNmY4MTE4NWMNCj4gKCJkcm06IGJyaWRnZTogbHZkcy1lbmNvZGVyOiBBZGQg
dGhpbmUsdGhjNjNsdmRtODNkIGNvbXBhdGlibGUgc3RyaW5nIiksDQo+IHRvIHN1cHBvcnQgdGhp
bmUsdGhjNjNsdmRtODNkIGluIGFyY2gvYXJtL2Jvb3QvZHRzL3I4YTc3NzktbWFyemVuLmR0cz8N
Cg0KSW50ZXJlc3RpbmcsIHdlbGwgdGhlIGRlZmNvbmZpZyBwYXRjaCBmcm9tIHRoaXMgc2VyaWVz
IHNob3VsZCBoZWxwIHRoZW4uDQoNClRoYW5rcywNCkZhYg0KDQo+IA0KPiBHcntvZXRqZSxlZXRp
bmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBH
ZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0t
IGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdp
dGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4g
SSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29t
ZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
