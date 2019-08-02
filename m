Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC867F4B2
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 12:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5646EDA2;
	Fri,  2 Aug 2019 10:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe02::622])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B387A6EDA2
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 10:09:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0YlbT18IbJp2nkACM2Jxb/qlalw0tB615VmdvqkybhJ196efr4h4cYhY/iY3mlnIx/8+x+zkTn+zuWMNfmE8jAjKmo9Q7/sBwytKsW8VhrGfy/IjdXDhwnFWh9W1miTOQdnBGOhm0wJiCles9A12L9xBq0oRCLWErfhFJYJhgQ1vpdfIHHVivoItsG98Hf9/JdAK4A4pSjXlSuYOKMxN6gxQhTNzluiyxYXPOxblyVlAulcJGymzncxNmGKEN8m+8x50dwYYW665qqB3fbBpo3fCg5V7OoawUckh0rE33DJv0RzKJKHNZwcnzhA/pRZMdgNVrVTc/BAkRooLkYvDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfKosLdMx5qpOHeIyZTSGcOGGMo+sglvrcTBxRRYjZw=;
 b=VKCR8Hw3U6GYXAkCGHbfeRIRx6aeMZol97XrCgW3k4hk+ww0hr6a8Y//bnIgsHFIpffgudwGfSU29xnLU2ojRYTD548MDE8i9ikv3HyUYc26f1MOJageRSt2pYa5on9UPZngoi0wYPAkqGBk3JeSJX8/GU9NlpGLGfBfPJ3FhzbYvQf7lhu5xUbZTwfF4U7ZkcNBNdBdfoZoJxR263x35S2DuN8BjlA5JRHuo9PpEnX0WQBH6WTBKyYuIiYQ8GK41hq/fZxwNSuCkLWKvegXTBeMsJofS3Aa4Is/BwgqlkyW/NiOarmw97uRHkdKvzkdVGfoLnEKqPTVCaI7Xe4nCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com (20.178.13.156) by
 VI1PR08MB2686.eurprd08.prod.outlook.com (10.175.245.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Fri, 2 Aug 2019 10:09:05 +0000
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::6d04:e478:d795:5d80]) by VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::6d04:e478:d795:5d80%4]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 10:09:05 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Thread-Topic: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Thread-Index: AQHVR4/KbU4UCRFzvkaBT5qon3yv66bktjIAgAEg7ACAAcNIAIAABACAgAAAcICAAAaqAA==
Date: Fri, 2 Aug 2019 10:09:05 +0000
Message-ID: <20190802100904.blnusnieti3pxgxu@DESKTOP-E1NTVVP.localdomain>
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
 <1564571048-15029-3-git-send-email-lowry.li@arm.com>
 <20190731132002.dut5mdsqgh7b75iv@DESKTOP-E1NTVVP.localdomain>
 <20190802092920.4la5cwrltv2m6dke@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uEZaFEcs90+U3vzgH69+95BD58Dt=J=gT6=n6oah5Nbyg@mail.gmail.com>
 <CAKMK7uH38rxyTyuYRGJ6NBejyUxQ6Qvr1CdjH2kpXiq+3-=t8Q@mail.gmail.com>
In-Reply-To: <CAKMK7uH38rxyTyuYRGJ6NBejyUxQ6Qvr1CdjH2kpXiq+3-=t8Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.53]
x-clientproxiedby: LO2P265CA0146.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::14) To VI1PR08MB3696.eurprd08.prod.outlook.com
 (2603:10a6:803:b6::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6da21692-af07-486a-4bad-08d717317321
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB2686; 
x-ms-traffictypediagnostic: VI1PR08MB2686:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR08MB26863001680C7DB582EEF61AF0D90@VI1PR08MB2686.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(199004)(189003)(6116002)(3846002)(99286004)(52116002)(2906002)(58126008)(54906003)(8936002)(9686003)(6512007)(76176011)(6306002)(5660300002)(81166006)(81156014)(6436002)(14454004)(6486002)(476003)(11346002)(446003)(386003)(6506007)(102836004)(53546011)(186003)(26005)(8676002)(486006)(25786009)(44832011)(6916009)(305945005)(7736002)(478600001)(68736007)(316002)(966005)(6246003)(229853002)(53936002)(7416002)(66066001)(4326008)(66556008)(66476007)(66446008)(64756008)(1076003)(86362001)(71200400001)(71190400001)(256004)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2686;
 H:VI1PR08MB3696.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sBXVTxvWron+tZFQAcT4526jwEA1q3vEdIXztGikzw8GxxtyTIM0j22+hTWPmW85IpA1AijIUxCP39FMHEX4nb/gd+PdIch4p4csfYONL2qHjAqd7uZ3H4oyjFbczw3lqzeDR0OMqLfLUufeW/0+xouBCm/nidUUVgfG4BX996AZof75BsdfEEfnacgtxulrzWVsK7n3z8a3reXZHpsHyscDrmy/yec1tRtrGLw07L5ZzW+1/gk3yV9NXcdHqfCBbCV7Ehk59EVbWZydJPet6Ji82JJZB84hHwd8J6DSmt/hnn+XuqWB3JkIp8VTpv2+wuN32k5CEMRsTcs9S9w1RFIZ+AC59MKkduIX/w6wdQKhCkQilY6DFKfokshclkskGRUhRa67E5wdluBU1/GeuWJEvqzf4XeLn7YzhSK+llo=
Content-ID: <2FD57427F759F04AB39001C9E7B0864E@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da21692-af07-486a-4bad-08d717317321
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 10:09:05.0711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Brian.Starkey@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2686
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfKosLdMx5qpOHeIyZTSGcOGGMo+sglvrcTBxRRYjZw=;
 b=lIEOsrgEvcK8oUgtj+3JH1kQGiOH/jJXQi4MlKOf5LmUfcFp4s8Zx8dN7v4yws2CJeR5rVgXqCLpTdU1SkOro4AuMEtDFKf4VP3GbHguJ/wUJcIUKOZDbquH/a5FGo+v2lUmeFnMVrZ7uOBtHyS50wFWnquK7H/K8CDIK2ccdvI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKT24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMTE6NDU6MTNBTSArMDIwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiBPbiBGcmksIEF1ZyAyLCAyMDE5IGF0IDExOjQzIEFNIERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBBdWcgMiwg
MjAxOSBhdCAxMToyOSBBTSBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFya2V5QGFybS5jb20+IHdy
b3RlOgo+ID4gPgo+ID4gPiBIaSBMb3dyeSwKPiA+ID4KPiA+ID4gT24gVGh1LCBBdWcgMDEsIDIw
MTkgYXQgMDY6MzQ6MDhBTSArMDAwMCwgTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3
cm90ZToKPiA+ID4gPiBIaSBCcmlhbiwKPiA+ID4gPgo+ID4gPiA+IE9uIFdlZCwgSnVsIDMxLCAy
MDE5IGF0IDA5OjIwOjA0UE0gKzA4MDAsIEJyaWFuIFN0YXJrZXkgd3JvdGU6Cj4gPiA+ID4gPiBI
aSBMb3dyeSwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGFua3MgZm9yIHRoaXMgY2xlYW51cC4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiBPbiBXZWQsIEp1bCAzMSwgMjAxOSBhdCAxMTowNDo0NUFNICswMDAw
LCBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiA+ID4gPiBEdXJp
bmcgaXQgc2lnbmFscyB0aGUgY29tcGxldGlvbiBvZiBhIHdyaXRlYmFjayBqb2IsIGFmdGVyIHJl
bGVhc2luZwo+ID4gPiA+ID4gPiB0aGUgb3V0X2ZlbmNlLCB3ZSdkIGNsZWFyIHRoZSBwb2ludGVy
Lgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBDaGVjayBpZiBmZW5jZSBsZWZ0IG92ZXIgaW4gZHJt
X3dyaXRlYmFja19jbGVhbnVwX2pvYigpLCByZWxlYXNlIGl0Lgo+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxsb3dy
eS5saUBhcm0uY29tPgo+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fd3JpdGViYWNrLmMgfCAyMyArKysrKysrKysrKysrKystLS0tLS0tLQo+ID4gPiA+ID4g
PiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3dyaXRl
YmFjay5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV93cml0ZWJhY2suYwo+ID4gPiA+ID4gPiBpbmRl
eCBmZjEzOGI2Li40M2Q5ZTNiIDEwMDY0NAo+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX3dyaXRlYmFjay5jCj4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
d3JpdGViYWNrLmMKPiA+ID4gPiA+ID4gQEAgLTMyNCw2ICszMjQsOSBAQCB2b2lkIGRybV93cml0
ZWJhY2tfY2xlYW51cF9qb2Ioc3RydWN0IGRybV93cml0ZWJhY2tfam9iICpqb2IpCj4gPiA+ID4g
PiA+ICAgaWYgKGpvYi0+ZmIpCj4gPiA+ID4gPiA+ICAgICAgICAgICBkcm1fZnJhbWVidWZmZXJf
cHV0KGpvYi0+ZmIpOwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiArIGlmIChqb2ItPm91dF9mZW5j
ZSkKPiA+ID4gPiA+Cj4gPiA+ID4gPiBJJ20gdGhpbmtpbmcgaXQgbWlnaHQgYmUgYSBnb29kIGlk
ZWEgdG8gc2lnbmFsIHRoZSBmZW5jZSB3aXRoIGFuIGVycm9yCj4gPiA+ID4gPiBoZXJlLCBpZiBp
dCdzIG5vdCBhbHJlYWR5IHNpZ25hbGVkLiBPdGhlcndpc2UsIGlmIHRoZXJlJ3Mgc29tZW9uZQo+
ID4gPiA+ID4gd2FpdGluZyAod2hpY2ggdGhlcmUgc2hvdWxkbid0IGJlKSwgdGhleSdyZSBnb2lu
ZyB0byBiZSB3YWl0aW5nIGEgdmVyeQo+ID4gPiA+ID4gbG9uZyB0aW1lIDotKQo+ID4gPiA+ID4K
PiA+ID4gPiA+IFRoYW5rcywKPiA+ID4gPiA+IC1Ccmlhbgo+ID4gPiA+ID4KPiA+ID4gPiBIZXJl
IGl0IGhhcHBlbmVkIGF0IGF0b21pY19jaGVjayBmYWlsZWQgYW5kIHRlc3Qgb25seSBjb21taXQu
IEZvciBib3RoCj4gPiA+ID4gY2FzZXMsIHRoZSBjb21taXQgaGFzIGJlZW4gZHJvcHBlZCBhbmQg
aXQncyBvbmx5IGEgY2xlYW4gdXAuIFNvIGhlcmUgYmV0dGVyCj4gPiA+ID4gbm90IGJlIHRyZWF0
ZWQgYXMgYW4gZXJyb3IgY2FzZTopCj4gPiA+Cj4gPiA+IElmIGFueW9uZSBlbHNlIGhhcyBhIHJl
ZmVyZW5jZSBvbiB0aGUgZmVuY2UsIHRoZW4gSU1PIGl0IGFic29sdXRlbHkgaXMKPiA+ID4gYW4g
ZXJyb3IgdG8gcmVhY2ggdGhpcyBwb2ludCB3aXRob3V0IHRoZSBmZW5jZSBiZWluZyBzaWduYWxl
ZCAtCj4gPiA+IGJlY2F1c2UgaXQgbWVhbnMgdGhhdCB0aGUgZmVuY2Ugd2lsbCBuZXZlciBiZSBz
aWduYWxlZC4KPiA+ID4KPiA+ID4gSSBkb24ndCB0aGluayB0aGUgQVBJIGdpdmVzIHlvdSBhIHdh
eSB0byBjaGVjayBpZiB0aGlzIGlzIHRoZSBsYXN0Cj4gPiA+IHJlZmVyZW5jZSwgc28gaXQncyBz
YWZlc3QgdG8ganVzdCBtYWtlIHN1cmUgdGhlIGZlbmNlIGlzIHNpZ25hbGxlZAo+ID4gPiBiZWZv
cmUgZHJvcHBpbmcgdGhlIHJlZmVyZW5jZS4KPiA+ID4KPiA+ID4gSXQganVzdCBmZWVscyB3cm9u
ZyB0byBtZSB0byBoYXZlIHRoZSBwb3NzaWJpbGl0eSBvZiBhIGRhbmdsaW5nIGZlbmNlCj4gPiA+
IHdoaWNoIGlzIG5ldmVyIGdvaW5nIHRvIGdldCBzaWduYWxsZWQ7IGFuZCBpdCdzIGFuIGVhc3kg
ZGVmZW5zaXZlIHN0ZXAKPiA+ID4gdG8gbWFrZSBzdXJlIGl0IGNhbiBuZXZlciBoYXBwZW4uCj4g
PiA+Cj4gPiA+IEkga25vdyBpdCBfc2hvdWxkbid0XyBoYXBwZW4sIGJ1dCB3ZSBvZnRlbiBwdXQg
aW4gaGFuZGxpbmcgZm9yIGNhc2VzCj4gPiA+IHdoaWNoIHNob3VsZG4ndCBoYXBwZW4sIGJlY2F1
c2UgdGhleSBmcmVxdWVudGx5IGRvIGhhcHBlbiA6LSkKPiA+Cj4gPiBXZSdyZSBub3QgYXMgcGFy
YW5vaWQgd2l0aCB0aGUgdmJsYW5rIGZlbmNlcyBlaXRoZXIsIHNvIG5vdCBzdXJlIHdoeQo+ID4g
d2UgbmVlZCB0byBiZSB0aGlzIHBhcmFub2lkIHdpdGggd3JpdGViYWNrIGZlbmNlcy4gSWYgeW91
ciBkcml2ZXIKPiA+IGdyYWJzIGFueXRoaW5nIGZyb20gdGhlIGF0b21pYyBzdGF0ZSBpbiAtPmF0
b21pY19jaGVjayBpdCdzIGJ1Z2d5Cj4gPiBhbnl3YXkuCj4gPgo+ID4gSWYgeW91IHdhbnQgdG8g
Zml4IHRoaXMgcHJvcGVybHkgSSB0aGluayB3ZSBuZWVkIHRvIG1vdmUgdGhlIGNhbGwgdG8KPiA+
IHByZXBhcmVfc2lnbmFsbGluZygpIGluIGJldHdlZW4gYXRvbWljX2NoZWNrIGFuZCBhdG9taWNf
Y29tbWl0LiBUaGVuIEkKPiA+IHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIGFsc28gZm9yY2UtY29t
cGxldGUgdGhlIGZlbmNlIG9uIGVycm9yIC4uLgoKV2VsbCwgZmFpciBlbm91Z2guIEknbSBzdHJ1
Z2dsaW5nIHdpdGggInRoYXQncyB0b28gcGFyYW5vaWQiIHZzICJmaXgKaXQgcHJvcGVybHkiIHRo
b3VnaD8gSXMgaXQgYSAicHJvYmxlbSIgd29ydGggZml4aW5nIG9yIG5vdD8KCkl0IHNlZW1zIG5h
dHVyYWwgdG8gbWUgdG8gZG8gdGhlIGZlbmNlIGNsZWFudXAgaW4gdGhlIGNsZWFudXAgZnVuY3Rp
b24KZm9yIHRoZSBvYmplY3Qgd2hpY2ggb3ducyB0aGUgZmVuY2UuCgo+ID4KPiA+ID4gPiBTaW5j
ZSBmb3IgdXNlcnNwYWNlLCBpdCBzaG91bGQgaGF2ZSBiZWVuIGZhaWxlZCBvciBhIHRlc3Qgb25s
eSBjYXNlLCBzbwo+ID4gPiA+IHdyaXRlYmFjZSBmZW5jZSBzaG91bGQgbm90IGJlIHNpZ25hbGVk
Lgo+ID4gPgo+ID4gPiBJdCdzIG5vdCBvbmx5IHVzZXJzcGFjZSB0aGF0IGNhbiB3YWl0IG9uIGZl
bmNlcyAoYW5kIGluIGZhY3QgdGhpcwo+ID4gPiBmZW5jZSB3aWxsIG5ldmVyIGV2ZW4gcmVhY2gg
dXNlcnNwYWNlIGlmIHRoZSBjb21taXQgZmFpbHMpLCB0aGUgZHJpdmVyCj4gPiA+IG1heSBoYXZl
IHRha2VuIGEgY29weSB0byB1c2UgZm9yICJzb21ldGhpbmciLgo+IAo+IEkgZm9yZ290IHRvIGFk
ZDogeW91IGNhbiBjaGVjayB0aGlzIGJ5IGxvb2tpbmcgYXQgdGhlIGZlbmNlIHJlZmVyZW5jZQo+
IGNvdW50LiBBIFdBUk5fT04gaWYgdGhhdCdzIG1vcmUgdGhhbiAxIG9uIGNsZWFudXAgKGJ1dCBh
bHNvIGZvciB0aGUKPiBvdXQgZmVuY2VzKSBjb3VsZCBiZSBhIG5pY2UgYWRkaXRpb24uCgpEbyB3
ZSByZWFsbHkgd2FudCB0byBiZSBsb29raW5nIGF0IHRoZSBmZW5jZSBpbnRlcm5hbHMgZGlyZWN0
bHkgbGlrZQp0aGF0PwoKQ2hlZXJzLAotQnJpYW4KCj4gLURhbmllbAo+IC0tIAo+IERhbmllbCBW
ZXR0ZXIKPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiArNDEgKDApIDc5
IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
