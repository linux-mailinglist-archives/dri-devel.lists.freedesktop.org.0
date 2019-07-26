Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3619276BE5
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 16:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703C66ED97;
	Fri, 26 Jul 2019 14:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00082.outbound.protection.outlook.com [40.107.0.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A5B6ED94
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 14:44:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOLvlAD0ETpXy6YM+REkMgSz/INz5lbkz4x/B/bqTeVYZm02Pgg+Iz/UYFw4xC8hIYIAPUSq/3lnaAWZJv3FFQy84esyZ7OL5RVJ0o3R04Grm06tGorH/ilP5qUnsEWe/vLQ4pcIOe9V1bDqVAQa4fcRyXyoOnMcb2jZZkM0p+agaeGTz8vNVhPjJ9gnjTz0FyGssJYWh8z3A61AjAQbGYyH79V7eLdNGzvaOXW6MXSpgpcrdCL/ZO2GPgfjwW1Gpikvfkg02HxmG61ONhDtfbLCKe3E5gcqGQOtt7/Gn1SRPp7bbjCw5hArQ9jSQoQ/ekO5l3llPFHuEkDhsl3wtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZM2MtZbFBkhaAysQmO2cHFKeTB76YhUEauzP6usF4g=;
 b=K4r1BYrZOYD2XuyLfBt1P6dnj1LJ2rLlWvlY0j355j67kgms0ui49M9C0aocinPgZuoJszfBigzZAnBb3QTZtqggwfJXRRrVmNSbMxLRvIQGaQLYB7ChUeNV8sWxFlaYs+ygCmsbViIA6oBlQzY/XGQl50WbpaXlh4VjR4szM07tYjKtqNt0Gc3jaGVYbANFhTPZe1qIQewHf5M97cWTjaShOC5jXR/4HVJQ2nRX6gYfLdLNGGf1TwEn0+fibHiN+Z0BtL69/GyTSl/yM8jHEPXS0CR31tRrxOCyQDVNGV7SCuGAsCOn/Qs0Tl2bwqKkFwVa6usEAOSIXNka09F95w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com (20.178.13.156) by
 VI1PR08MB3725.eurprd08.prod.outlook.com (20.178.14.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Fri, 26 Jul 2019 14:44:31 +0000
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::6d04:e478:d795:5d80]) by VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::6d04:e478:d795:5d80%4]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 14:44:31 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>, Liviu Dudau
 <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology China)"
 <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Ayan Halder
 <Ayan.Halder@arm.com>, "Jonathan Chai (Arm Technology China)"
 <Jonathan.Chai@arm.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Julien Yin (Arm Technology China)"
 <Julien.Yin@arm.com>, nd <nd@arm.com>
Subject: Re: [PATCH] drm/komeda: Skips the invalid writeback job
Thread-Topic: [PATCH] drm/komeda: Skips the invalid writeback job
Thread-Index: AQHVQ4nw7K9FV7USuUuF4ik2yHSO+qbc9HAAgAAFvAA=
Date: Fri, 26 Jul 2019 14:44:30 +0000
Message-ID: <20190726144428.tfwoaniidijchblt@DESKTOP-E1NTVVP.localdomain>
References: <1564128758-23553-1-git-send-email-lowry.li@arm.com>
 <20190726142356.GI15868@phenom.ffwll.local>
In-Reply-To: <20190726142356.GI15868@phenom.ffwll.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.51]
x-clientproxiedby: LO2P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::17) To VI1PR08MB3696.eurprd08.prod.outlook.com
 (2603:10a6:803:b6::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba656020-a4f5-47ac-8058-08d711d7c442
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3725; 
x-ms-traffictypediagnostic: VI1PR08MB3725:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <VI1PR08MB3725AA26134A81CCB958A566F0C00@VI1PR08MB3725.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(40434004)(189003)(199004)(5660300002)(587094005)(229853002)(66066001)(68736007)(1076003)(476003)(26005)(2906002)(6116002)(9686003)(6306002)(5024004)(256004)(76176011)(53936002)(86362001)(14444005)(6636002)(3846002)(478600001)(14454004)(8936002)(44832011)(6506007)(11346002)(25786009)(6486002)(446003)(386003)(8676002)(966005)(53386004)(7736002)(66556008)(66476007)(64756008)(81156014)(81166006)(66446008)(186003)(486006)(66946007)(6436002)(71190400001)(71200400001)(316002)(2201001)(6246003)(2501003)(110136005)(3716004)(99286004)(52116002)(58126008)(305945005)(102836004)(6512007)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3725;
 H:VI1PR08MB3696.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2xyYifqKZQrA6PZ1mrbQzyBCnxfWm8DUClfZWdD06kZeoFW4OIDv1Pw6jzaC16EyJ0Pbw/RjvnC4QAD4IfzYBCQPgub2oXiU9Shfcsr1M39a7al0MntQvTxjdV3RFKNFAU7V/tP/fhyhoMb4DirVMG79X2P7pX/qfYETiGNnl1lYb+sJ72iNQ4tGUcdcsbauHtnFpRfP+m+Mh229Ml/KbqhPpHwfOjsy5Edl66Qjkcm3BxWmIoPL3alHXMYO+D7Snh8EGxLn6k2A/GhGAHvmXzk1okDbsB504QMmpXbEVmX5ow4ZjIJ5ulyC/UDqWdK+l4yFv4uvwi++ImGBWNLQy9nYymivNpJVN9uozqTp16YPD+JvKX4QxCYCRpqXOOqIxLjyO3RdvO7RWi+9cpuQkRldFQxGLAbD+8PkIS8RHuU=
Content-ID: <5471A259FEDA3A498B8E46BC98059A51@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba656020-a4f5-47ac-8058-08d711d7c442
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 14:44:30.8575 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Brian.Starkey@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3725
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZM2MtZbFBkhaAysQmO2cHFKeTB76YhUEauzP6usF4g=;
 b=LsyTizCZve8hWjctPJgTrCY8J4t2GGS9uTL2QXDycyEVHQLUStbCngXMS1vgr/mfPlKhMp/yM+Zc7s7iEfoGZbGtJNfrJFl46KCxv7+udEvmr5k7RbXY4vapULfpAgz9+1pYaMs/NIi4fWjKzXawMsUeRykCYKQjUy1Q+LYWKe8=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDQ6MjM6NTZQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIEp1bCAyNiwgMjAxOSBhdCAwODoxMzowMEFNICswMDAwLCBMb3dyeSBM
aSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gQ3VycmVudCBEUk0tQ09SRSBhY2Nl
cHRzIHRoZSB3cml0ZWJhY2tfam9iIHdpdGggYSBlbXB0eSBmYiwgYnV0IHRoYXQKPiA+IGlzIGFu
IGludmFsaWQgam9iIGZvciBIVywgc28gbmVlZCB0byBza2lwIGl0IHdoZW4gY29tbWl0IGl0IHRv
IEhXLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGlu
YSkgPGxvd3J5LmxpQGFybS5jb20+Cj4KPiBIbSwgdGhpcyBzb3VuZHMgYSBiaXQgbGlrZSBhbiBv
dmVyc2lnaHQgaW4gY29yZSB3cml0ZWJhY2sgY29kZT8gTm90IHN1cmUKPiBob3cgdGhpcyBjYW4g
ZXZlbiBoYXBwZW4sIHNldHRpbmcgdXAgYSB3cml0ZWJhY2sgam9iIHdpdGhvdXQgYW4gZmIgc291
bmRzCj4gYSBiaXQgbGlrZSBhIGJ1ZyB0byBtZSBhdCBsZWFzdCAuLi4KPgo+IElmIHdlIGRvbid0
IGhhdmUgYSBnb29kIHJlYXNvbiBmb3Igd2h5IG90aGVyIGh3IG5lZWRzIHRvIGFjY2VwdCB0aGlz
LCB0aGVuCj4gaW1vIHRoaXMgbmVlZHMgdG8gYmUgcmVqZWN0ZWQgaW4gc2hhcmVkIGNvZGUuIEZv
ciBjb25zaXN0ZW50IGJlaGF2aW91cgo+IGFjcm9zcyBhbGwgd3JpdGViYWNrIHN1cHBvcnRpbmcg
ZHJpdmVycy4KPiAtRGFuaWVsCgpJIHRoaW5rIGl0J3Mgb25seSB0aGlzIHdheSB0byBzaW1wbGlm
eSB0aGUgZHJtX3dyaXRlYmFja19zZXRfZmIoKQppbXBsZW1lbnRhdGlvbiBpbiB0aGUgY2FzZSB3
aGVyZSB0aGUgcHJvcGVydHkgaXMgc2V0IG1vcmUgdGhhbiBvbmNlIGluCnRoZSBzYW1lIGNvbW1p
dCAodG8gc29tZXRoaW5nIHZhbGlkLCBhbmQgdGhlbiAwKS4KClRoZSBjb3JlIGNvdWxkIGluZGVl
ZCBoYW5kbGUgaXQgLSBkcm1fd3JpdGViYWNrX3NldF9mYigpIHdvdWxkIGNoZWNrCmZiLiBJZiBp
dCdzIE5VTEwgYW5kIHRoZXJlJ3Mgbm8gd3JpdGViYWNrIGpvYiwgdGhlbiBpdCBjYW4ganVzdCBl
YXJseQpyZXR1cm4uIElmIGl0J3MgTlVMTCBhbmQgdGhlcmUncyBhbHJlYWR5IGEgd3JpdGViYWNr
IGpvYiB0aGVuIGl0CnNob3VsZCBkcm9wIHRoZSByZWZlcmVuY2Ugb24gdGhlIGV4aXN0aW5nIGZi
IGFuZCBmcmVlIHRoYXQgam9iLgoKQ291bGQgbGVhZCB0byB0aGUgam9iIGdldHRpbmcgYWxsb2Mv
ZnJlZWQgbXVsdGlwbGUgdGltZXMgaWYgdXNlcnNwYWNlCmlzIGluc2FuZSwgYnV0IG1laC4KCi1C
cmlhbgoKPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfY3J0Yy5jICAgICAgICAgfCAyICstCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMgfCA5ICsrKysrKysrLQo+ID4gIDIgZmls
ZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKPiA+IGlu
ZGV4IDJmZWQxZjYuLjM3MmU5OWEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+ID4gQEAgLTI2NSw3ICsyNjUsNyBAQCB2
b2lkIGtvbWVkYV9jcnRjX2hhbmRsZV9ldmVudChzdHJ1Y3Qga29tZWRhX2NydGMgKmtjcnRjLAo+
ID4gIGtvbWVkYV9waXBlbGluZV91cGRhdGUoc2xhdmUsIG9sZC0+c3RhdGUpOwo+ID4KPiA+ICBj
b25uX3N0ID0gd2JfY29ubiA/IHdiX2Nvbm4tPmJhc2UuYmFzZS5zdGF0ZSA6IE5VTEw7Cj4gPiAt
aWYgKGNvbm5fc3QgJiYgY29ubl9zdC0+d3JpdGViYWNrX2pvYikKPiA+ICtpZiAoY29ubl9zdCAm
JiBjb25uX3N0LT53cml0ZWJhY2tfam9iICYmIGNvbm5fc3QtPndyaXRlYmFja19qb2ItPmZiKQo+
ID4gIGRybV93cml0ZWJhY2tfcXVldWVfam9iKCZ3Yl9jb25uLT5iYXNlLCBjb25uX3N0KTsKPiA+
Cj4gPiAgLyogc3RlcCAyOiBub3RpZnkgdGhlIEhXIHRvIGtpY2tvZmYgdGhlIHVwZGF0ZSAqLwo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X3diX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfd2JfY29ubmVjdG9yLmMKPiA+IGluZGV4IDk3ODc3NDUuLjhlMmVmNjMgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0
b3IuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
d2JfY29ubmVjdG9yLmMKPiA+IEBAIC01Miw5ICs1MiwxNiBAQAo+ID4gIHN0cnVjdCBrb21lZGFf
ZGF0YV9mbG93X2NmZyBkZmxvdzsKPiA+ICBpbnQgZXJyOwo+ID4KPiA+IC1pZiAoIXdyaXRlYmFj
a19qb2IgfHwgIXdyaXRlYmFja19qb2ItPmZiKQo+ID4gK2lmICghd3JpdGViYWNrX2pvYikKPiA+
ICByZXR1cm4gMDsKPiA+Cj4gPiAraWYgKCF3cml0ZWJhY2tfam9iLT5mYikgewo+ID4gK2lmICh3
cml0ZWJhY2tfam9iLT5vdXRfZmVuY2UpCj4gPiArRFJNX0RFQlVHX0FUT01JQygiT3V0IGZlbmNl
IHJlcXVpcmVkIG9uIGEgaW52YWxpZCB3cml0ZWJhY2sgam9iLlxuIik7Cj4gPiArCj4gPiArcmV0
dXJuIHdyaXRlYmFja19qb2ItPm91dF9mZW5jZSA/IC1FSU5WQUwgOiAwOwo+ID4gK30KPiA+ICsK
PiA+ICBpZiAoIWNydGNfc3QtPmFjdGl2ZSkgewo+ID4gIERSTV9ERUJVR19BVE9NSUMoIkNhbm5v
dCB3cml0ZSB0aGUgY29tcG9zaXRpb24gcmVzdWx0IG91dCBvbiBhIGluYWN0aXZlIENSVEMuXG4i
KTsKPiA+ICByZXR1cm4gLUVJTlZBTDsKPiA+IC0tCj4gPiAxLjkuMQo+ID4KPiA+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+Cj4gLS0K
PiBEYW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4g
aHR0cDovL2Jsb2cuZmZ3bGwuY2gKSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRo
aXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxz
byBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBw
bGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0
aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwg
b3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
