Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7DF177105
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6C86E9E3;
	Tue,  3 Mar 2020 08:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0714.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::714])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79056E4BB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:54:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3exYr4pjxG3P+3HLcRPFPfkO+DYUiZTdu8hV3vqVs/W9ghflkYSsGs2kcKZeqYOEtGnQIUxm7m1ew0quJRl/g6Mr2pFFzJjQBVNulcjrFP8PtOvNOrZwyfMhjYNNf7QrGZ0QCguBCWw1tcTdpkayg2KHSDo6nZSiJ7+ogLr+KvpbL+TnLrS9P6uLxCJZQelKMcayddxKPdfngD/WpePhKPeMxxNZKr2jN8eNHjqo9Lu3gCKfUswgvlF7ZuG20ZxxnKJQpJ5njhabVO7/eFvpZzr5mVSYZ/QdDQkR5Rg3FwM4X/1cf3bkwln8AYyl/Iao/99jMx0RhfCh2C1dYgamw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RN6HgC+D8Gs4PtL7+tTTbA59yxze5Y627++0nET5VbQ=;
 b=E4Ejr7VmU9XO8F1go4HXN/uOS0jRVnyGpZNLjnO6hwnrvy5OFVSsfBzF7e7L2+vQB69zc4l/2a1aLlrAJLhioT+zXqXdpRVDMaIvsBK5KZhmmDgrjPKsBILhHH8isoY2ji2a9XZKncSg6WgyhRkVf7P/p56TCKeSbe3c8YD30YfXAGcjVTYqXyQRroE2CF02b+s/FdwxHyAgtjiIxi01TSFtErbOxTA42Ggc7e1GTwWQtnLOG44UZjLZ1h+Ys5xVxX469+EGzHB7VAz7gquXx3rGOwUwKTYQK7EssjQwq6PEPmuuqZJJk4QPpD0gn9feOBYT7+39ncgRopaVMgH+bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RN6HgC+D8Gs4PtL7+tTTbA59yxze5Y627++0nET5VbQ=;
 b=L4XUtk0VxVYqe7rOln648f2wQ0sjbjvk9EK0nOH9DUbOIPhO1dN6g+7CmNM6+votywPdA5fgRulW0KX95GoEKPwbW/cFpFZTapY6PXAgy4cVGHBJscadyJbnP9Y/wAanJoV+SbZO87Jc7jxyOXaz6K0yYcyYc6yZxAdPYWIZaOk=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3404.eurprd02.prod.outlook.com (52.134.68.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14; Mon, 2 Mar 2020 22:53:56 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::d7c:583:b9cb:7592]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::d7c:583:b9cb:7592%7]) with mapi id 15.20.2772.019; Mon, 2 Mar 2020
 22:53:56 +0000
Received: from [192.168.13.3] (213.112.137.122) by
 HE1PR05CA0257.eurprd05.prod.outlook.com (2603:10a6:3:fb::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18 via Frontend Transport; Mon, 2 Mar 2020 22:53:55 +0000
From: Peter Rosin <peda@axentia.se>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 28/33] drm/panel-simple: Fix dotclock for Sharp LQ150X1LG11
Thread-Topic: [PATCH 28/33] drm/panel-simple: Fix dotclock for Sharp
 LQ150X1LG11
Thread-Index: AQHV8NJLbcHjFGK67k+oSkQVyC4qRqg16T2A
Date: Mon, 2 Mar 2020 22:53:56 +0000
Message-ID: <c9f756da-ba54-bfd6-87e4-4e52e3e7cecd@axentia.se>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-29-ville.syrjala@linux.intel.com>
In-Reply-To: <20200302203452.17977-29-ville.syrjala@linux.intel.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
x-originating-ip: [213.112.137.122]
x-clientproxiedby: HE1PR05CA0257.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::33) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5cd56cb-7fc2-400f-0a78-08d7befc9670
x-ms-traffictypediagnostic: DB3PR0202MB3404:
x-microsoft-antispam-prvs: <DB3PR0202MB3404D4521ADF38472D24F075BCE70@DB3PR0202MB3404.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 033054F29A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(346002)(366004)(396003)(39830400003)(189003)(199004)(16526019)(4326008)(186003)(8676002)(31696002)(26005)(54906003)(110136005)(66946007)(66446008)(956004)(64756008)(66476007)(66556008)(31686004)(81156014)(53546011)(8936002)(52116002)(81166006)(2616005)(66574012)(6486002)(16576012)(316002)(71200400001)(5660300002)(86362001)(36756003)(2906002)(508600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3404;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +XVKW44ficL/WEwsEgTQH6N0Z6Je++2NFwQSXfVb4zxYszlfuAwa+kkNSBVULVhMLlO+qE4slXWWO8eGX/JHbIDTanc58tcPspx1lzLmPXfBW1jAg3iFzbC36mMCowpdexeOAkNbHqD17B59Rnhw0e3D6irH6gUm17iF4veIRFFcEohoRbwRH4KLmttBrV5mg2fXKoWFi+Ou6wdboMvQLdU/JMvqJT5M/vE5BefyyZLWqVVGs0y15WY5Rs0t2lZq+HU4AO8dgybE5KLpLzEssGWo3DY4ND0pdYMGVio10hOvnawpx5i2WTVY1Zat8NbO00NnlLJB0RqusXaewqQkndx9i4Z+BkVGAKzCkjJt7BTjh0Or/ql2D+vDd1jplAh2gBy1IFHa2U1q4rkBWYZwPOr4uUVfhzKMvYblV2r/ufj+Y+/7TuG4ucL7xyEHWiWM
x-ms-exchange-antispam-messagedata: OZ5MhNjGdX1cGUWvWGvQIua2ZUeMdyWgrPNQ6xCRoNeIPqY015xrsKd3zEaGX/T739SlPsHtu6c9ZS6Wd/TI9X/AFiOfuXcPmuLqBCLrKw7U0yjqjIZZworXPEP9uU3GPWbG6FkrIbXq3E+VKQsLYg==
x-ms-exchange-transport-forked: True
Content-ID: <B5DF996925A2D841BACFA6C460E116EE@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: b5cd56cb-7fc2-400f-0a78-08d7befc9670
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2020 22:53:56.3022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1/aTudUwMORzaHqrl+RAHQBSSEKUHZxhpFrA2MrJoLrqWy7SWvSKHSvYILRdgt53
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3404
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: =?utf-8?B?R3VzdGFmIExpbmRzdHLDtm0=?= <gl@axentia.se>,
 Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wMy0wMiAyMTozNCwgVmlsbGUgU3lyamFsYSB3cm90ZToNCj4gRnJvbTogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gDQo+IFRoZSBjdXJy
ZW50bHkgbGlzdGVkIGRvdGNsb2NrIGRpc2FncmVlcyB3aXRoIHRoZSBjdXJyZW50bHkNCj4gbGlz
dGVkIHZyZWZyZXNoIHJhdGUuIENoYW5nZSB0aGUgZG90Y2xvY2sgdG8gbWF0Y2ggdGhlIHZyZWZy
ZXNoLg0KPiANCj4gU29tZW9uZSB0ZWxsIG1lIHdoaWNoIChpZiBlaXRoZXIpIG9mIHRoZSBkb3Rj
bG9jayBvciB2cmVyZXNoIGlzDQo+IGNvcnJlY3Q/DQoNClRML0RSOyBJIGRvIG5vdCBjYXJlIGlm
IHlvdSBjaGFuZ2UgdGhlIHJlZnJlc2ggcmF0ZSBvciB0aGUgZG90Y2xvY2suDQoNClRoZSB3aG9s
ZSBlbnRyeSBmb3IgdGhhdCBwYW5lbCBpbiBzaW1wbGUtcGFuZWwgaXMgZHViaW91cy4gVGhlIHBh
bmVsDQppcyByZWFsbHkgYW4gTFZEUyBwYW5lbCAoY2FwYWJsZSBvZiBib3RoIFZFU0EvSmVpZGEg
UkdCODg4LCBzZWxlY3RhYmxlDQp3aXRoIHRoZSBTRUxMVkRTIHBpbikuICBXaXRoIEplaWRhIHlv
dSBjYW4sIGFzIHVzdWFsLCBvbWl0IHRoZSA0dGgNCmRhdGEgY2hhbm5lbCBhbmQgdXNlIHRoZSBw
YW5lbCB3aXRoIFJHQjY2Ni4gSW4gZWl0aGVyIGNhc2UsIHlvdSBuZWVkDQphbiBMVkRTIHNpZ25h
bCBhbmQgbm90aGluZyBlbHNlLi4uDQoNClRoZSBwYW5lbCBjYW4gYWxzbyByb3RhdGUgdGhlIHBp
Y3R1cmUgMTgwIGRlZ3JlZXMgdXNpbmcgdGhlIFJML1VEIHBpbi4NCg0KVGhlc2Ugb3B0aW9ucyBh
cmUgb2YgY291cnNlIG5vdCBleHByZXNzZWQgaW4gdGhlIHNpbXBsZSBwYW5lbCBkcml2ZXINCihh
bmQgd2UgaGF2ZSBhbHdheXMgdXNlZCBmaXhlZCBzaWduYWxzIGZvciB0aG9zZSBwaW5zIGluIG91
ciBkZXNpZ25zLA0KSUlSQykuIEFzIGZhciBhcyBJJ20gY29uY2VybmVkLCB0aGUgcGFuZWwgY2Fu
IGJlIHJlbW92ZWQgZnJvbQ0Kc2ltcGxlLXBhbmVsLiBPdXIgZGV2aWNlIHRyZWVzIGFyZSBub3dh
ZGF5cyBjb3JyZWN0bHkgZXhwcmVzc2luZyB0aGUNCmhhcmR3YXJlIHdpdGggYW4gTFZEUyBlbmNv
ZGVyIGJldHdlZW4gdGhlIFJHQiBvdXRwdXQgYW5kIHRoZSBwYW5lbA0KYW5kIHBvaW50cyB0byB0
aGUgcGFuZWwtbHZkcyBkcml2ZXIgZm9yIHRoZSBwYW5lbC4NCg0KVGhlIHJlYXNvbiB0aGF0IGl0
IGlzIGFzIGl0IGlzLCBpcyB0aGF0IHdlIG9idmlvdXNseSBkaWRuJ3QgdW5kZXJzdGFuZA0Kd2hh
dCB3ZSB3ZXJlIGRvaW5nIHdoZW4gd2UgYWRkZWQgdGhlIGVudHJ5LCBhbmQgdGhpcyBnYXJiYWdl
IHdhcyB3aGF0DQp3ZSBjYW1lIHVwIHdpdGggdGhhdCBwcm9kdWNlZCBhIHBpY3R1cmUuDQoNCklm
IHlvdSB3YW50IHRvIGtlZXAgdGhlIHBhbmVsIGluIHNpbXBsZS1wYW5lbCBkZXNwaXRlIGFsbCB0
aGlzLCB0aGUNCnRpbWluZyBjb25zdHJhaW50cyBhcmUgYXMgZm9sbG93czoNCg0KUGl4ZWwgY2xv
Y2sgICAgICAgICA1MC04MCBNSHosICAgICAgICA2NSBNSHogdHlwaWNhbA0KSG9yaXpvbnRhbCBw
ZXJpb2QgMTA5NC0xNzIwIGNsb2NrcywgMTM0NCB0eXBpY2FsDQogICAgICAgICAgICAgICAgICAx
Ni4wLTIzLjQgdXMgICAgICAyMC43IHVzDQpIb3Jpem9udGFsIGVuYWJsZSAgICAxMDI0IGNsb2Nr
cywgYWx3YXlzDQpWZXJ0aWNhbCBwZXJpb2QgICAgNzc2LTk5MCBsaW5lcywgICAgODA2IHR5cGlj
YWwNCiAgICAgICAgICAgICAgICAgIDEzLjMtMTguMCBtcyAgICAgIDE2LjcgbXMNClZlcnRpY2Fs
IGVuYWJsZSAgICAgICA3NjggbGluZXMsICBhbHdheXMNCg0KVXNpbmcgYSAibG9uZyIgKHRoZSBk
YXRhc2hlZXQgaXMgbm90IHZlcnkgc3BlY2lmaWMgb24gdGhpcyBpc3N1ZSkgdmVydGljYWwNCnBl
cmlvZCBtYXkgaW50cm9kdWNlIGRldGVyaW9yYXRpb24gb2YgZGlzcGxheSBxdWFsaXR5LCBmbGlj
a2VyIGV0Yy4NCg0KSSBkb24ndCB0aGluayB0aGUgZGl2aXNpb24gYmV0d2VlbiBmcm9udC1wb3Jj
aC9iYWNrLXBvcmNoIG1hdHRlcnMgbXVjaC4NCg0KVGhhdCBzYWlkLCBJIGhhdmUgbm8gaWRlYSB3
aGF0c29ldmVyIGlmIG90aGVycyBoYXZlIHN0YXJ0ZWQgdXNpbmcgdGhpcw0KcGFuZWwgZW50cnku
IE15IGd1ZXNzIGlzIHRoYXQgaXQgaGFzIHplcm8gdXNlcnMsIGJ1dCB3aG8gY2FuIHRlbGw/DQoN
CkNoZWVycywNClBldGVyDQoNCj4gQ2M6IEd1c3RhZiBMaW5kc3Ryw7ZtIDxnbEBheGVudGlhLnNl
Pg0KPiBDYzogUGV0ZXIgUm9zaW4gPHBlZGFAYXhlbnRpYS5zZT4NCj4gQ2M6IFRoaWVycnkgUmVk
aW5nIDx0cmVkaW5nQG52aWRpYS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzD
pCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNp
bXBsZS5jDQo+IGluZGV4IDc1MjZhZjJkNmQ5NS4uY2I1ODdkZThjNDllIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jDQo+IEBAIC0zMDI2LDcgKzMwMjYsNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2Mgc2hhcnBfbHExMjNwMWp4MzEgPSB7DQo+ICB9Ow0K
PiAgDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgc2hhcnBfbHExNTB4
MWxnMTFfbW9kZSA9IHsNCj4gLQkuY2xvY2sgPSA3MTEwMCwNCj4gKwkuY2xvY2sgPSA2NTcyMiwN
Cj4gIAkuaGRpc3BsYXkgPSAxMDI0LA0KPiAgCS5oc3luY19zdGFydCA9IDEwMjQgKyAxNjgsDQo+
ICAJLmhzeW5jX2VuZCA9IDEwMjQgKyAxNjggKyA2NCwNCj4gDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
