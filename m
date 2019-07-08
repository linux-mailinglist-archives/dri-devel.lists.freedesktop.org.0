Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B40F161B4A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58DA89B0B;
	Mon,  8 Jul 2019 07:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140078.outbound.protection.outlook.com [40.107.14.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85F089B0B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 07:32:42 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4685.eurprd08.prod.outlook.com (10.255.115.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Mon, 8 Jul 2019 07:32:33 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1%3]) with mapi id 15.20.2032.019; Mon, 8 Jul 2019
 07:32:33 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>,
 nd
 <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar Zhang (Arm Technology
 China)" <Oscar.Zhang@arm.com>, "Tiannan Zhu (Arm Technology China)"
 <Tiannan.Zhu@arm.com>, "Jonathan Chai (Arm Technology China)"
 <Jonathan.Chai@arm.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Julien Yin (Arm Technology China)"
 <Julien.Yin@arm.com>, "Channing Chen (Arm Technology China)"
 <Channing.Chen@arm.com>, "Yiqi Kang (Arm Technology China)"
 <Yiqi.Kang@arm.com>, "thomas Sun (Arm Technology China)"
 <thomas.Sun@arm.com>, "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Subject: Re: [PATCH 2/2] drm/komeda: Computing layer_split and image_enhancer
 internally
Thread-Topic: [PATCH 2/2] drm/komeda: Computing layer_split and image_enhancer
 internally
Thread-Index: AQHVMycKXWrZUM5S4k2zCR4X2FJ5Y6a78zwAgARlCgA=
Date: Mon, 8 Jul 2019 07:32:33 +0000
Message-ID: <20190708073226.GA5492@jamwan02-TSP300>
References: <20190705114427.17456-1-james.qian.wang@arm.com>
 <20190705122546.GO15868@phenom.ffwll.local>
In-Reply-To: <20190705122546.GO15868@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0051.apcprd03.prod.outlook.com
 (2603:1096:203:52::15) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5f2b3aa-51e4-4838-d1d7-08d7037670f4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4685; 
x-ms-traffictypediagnostic: VE1PR08MB4685:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <VE1PR08MB4685C021B04509A140BCC0A3B3F60@VE1PR08MB4685.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(136003)(39850400004)(396003)(346002)(366004)(199004)(189003)(40434004)(26005)(186003)(2906002)(81156014)(386003)(102836004)(55236004)(76176011)(99286004)(6506007)(52116002)(33716001)(71190400001)(81166006)(71200400001)(8936002)(587094005)(11346002)(446003)(486006)(2501003)(8676002)(476003)(14454004)(7736002)(66066001)(256004)(14444005)(5024004)(966005)(68736007)(305945005)(64756008)(66476007)(6116002)(478600001)(3846002)(6246003)(25786009)(33656002)(6636002)(53936002)(53386004)(58126008)(66446008)(316002)(110136005)(229853002)(9686003)(6512007)(6306002)(6486002)(6436002)(1076003)(5660300002)(66556008)(2201001)(73956011)(66946007)(86362001)(921003)(1121003)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4685;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1lbmfB+GoTDxqEDkDkiaaQJ6MvWq4BEfcHBELuKDhJ3CTA4rclrWNy8DMMBIE8vSIPftOcScjQU/W6RcssjfyEw2lqcT1IyJ1dAcKVKIgCF4GaqOTa0cSxxR+RYbLuhSxl/topCW7hUpd/M7CjRFIzsofRDVfncGQV893oVogrRj8NouFTcjY4ZhZp0PfIGGwCJTJVARNQ95jSO0s2xO9utQZ0xMt/1Pu6TuZDenAx8QoB2lZtXPfaLEad24hDKdwhtTHzLhmIw4jjkaVrSrZ77QCWUgy6wB9bPdLo6kn7rTiEo84Ca3LGvFwqAo3xDSOZkjwWTj3Lf0RpXWGf9Rae0WoVjK7+2iu0SUFkhHDdUL9SdeFRpSuXhybWQ+Fytm34Er5jD899IHzi5ClZZpIabyuljm+KucZgvSD7P0UQU=
Content-ID: <4A72B491A69BC0409FB0A782BA84A9D2@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f2b3aa-51e4-4838-d1d7-08d7037670f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 07:32:33.5299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4685
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZ6SKalZUucCFu3QGq2CFzjYwVi9cw7ndAPFkZTcQkA=;
 b=bSr8QV2d5PuDlojCxzP5iPtM2KJuT145WM6yRavEbDyy5z78kVH+BX7LOWnzn/uMyuCzBFmvUDcd0aWYuFKaGxdFd7j4Mxr0Tk/ooK0/lIv7rt/c9Hfa1QLqG3tNyAv+rtfIHYBq6A74R9k+FcxA3iERvzNMQ7cpGTQ2gSzOEIE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
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

T24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMDI6MjU6NDZQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIEp1bCAwNSwgMjAxOSBhdCAxMTo0NDo0NUFNICswMDAwLCBqYW1lcyBx
aWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiA+IEZvciBsYXllcl9zcGxp
dDoKPiA+IEVuYWJsZSBpdCBpZiB0aGUgc2NhbGluZyBleGNlZWQgdGhlIGFjY2VwdCByYW5nZSBv
ZiBzY2FsZXIuCj4gPgo+ID4gRm9yIGltYWdlX2VuaGFuY2VyOgo+ID4gRW5hYmxlIGl0IGlmIHRo
ZSBzY2FsaW5nIGlzIGEgMngrIHNjYWxpbmcKPgo+IEltbyBzaG91bGQgYmUgdHdvIHBhdGNoZXMu
IEFzaWRlIGZyb20gdGhhdCAoYW5kIHdpdGggMCBrbm93bGVkZ2UgYWJvdXQgdGhlCj4gaHcsIGp1
c3QgbG9va2luZyBhdCB0aGlzIGZyb20gYSBrbXMvYXRvbWljIHVhcGkgcG92KToKPgo+IEFja2Vk
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKSGkgRGFuaWVsOgpJ
IHNwbGl0IHRoaXMgY2hhbmdlIHRvIHR3byBwYXRjaGVzLCBwbGVhc2UgaWdub3JlIHRoaXMgb25l
LCBhbmQgcGxlYXNlCmhlbHAgdG8gcmV2aWV3IHRoZSBiZWxvdyBzcGFyYXRlZCBvbmVzOgotIGh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjMzNDAvIGZvciBsYXllcl9z
cGxpdAotIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjMzNDEvIGZv
ciBpbWFnZSBlbmhhbmNlcgoKVGhhbmtzCkphbWVzCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogamFt
ZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0u
Y29tPgo+ID4gLS0tCj4gPiAgLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9w
aXBlbGluZS5oICB8ICAzICsrLQo+ID4gIC4uLi9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3Bp
cGVsaW5lX3N0YXRlLmMgICAgfCAxNSArKysrKysrKysrKysrKy0KPiA+ICBkcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jIHwgIDggKy0tLS0tLS0KPiA+ICAu
Li4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMgIHwgMTAgKy0t
LS0tLS0tLQo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRp
b25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX3BpcGVsaW5lLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9waXBlbGluZS5oCj4gPiBpbmRleCBmYzFiODYxMzM4NWUuLmE5MGJjYmIzY2Iy
MyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX3BpcGVsaW5lLmgKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX3BpcGVsaW5lLmgKPiA+IEBAIC01MzcsNyArNTM3LDggQEAgdm9pZCBrb21lZGFf
cGlwZWxpbmVfZGlzYWJsZShzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpwaXBlLAo+ID4gIHZvaWQg
a29tZWRhX3BpcGVsaW5lX3VwZGF0ZShzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpwaXBlLAo+ID4g
ICAgICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqb2xkX3N0YXRlKTsKPiA+Cj4gPiAtdm9pZCBr
b21lZGFfY29tcGxldGVfZGF0YV9mbG93X2NmZyhzdHJ1Y3Qga29tZWRhX2RhdGFfZmxvd19jZmcg
KmRmbG93LAo+ID4gK3ZvaWQga29tZWRhX2NvbXBsZXRlX2RhdGFfZmxvd19jZmcoc3RydWN0IGtv
bWVkYV9sYXllciAqbGF5ZXIsCj4gPiArICAgc3RydWN0IGtvbWVkYV9kYXRhX2Zsb3dfY2ZnICpk
ZmxvdywKPiA+ICAgICBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYik7Cj4gPgo+ID4gICNlbmRp
ZiAvKiBfS09NRURBX1BJUEVMSU5FX0hfKi8KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYwo+ID4gaW5k
ZXggMmI0MTVlZjJiN2QzLi43MDk4NzBiZGFhNGYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0
ZS5jCj4gPiBAQCAtNzg0LDkgKzc4NCwxMSBAQCBrb21lZGFfdGltaW5nX2N0cmxyX3ZhbGlkYXRl
KHN0cnVjdCBrb21lZGFfdGltaW5nX2N0cmxyICpjdHJsciwKPiA+ICByZXR1cm4gMDsKPiA+ICB9
Cj4gPgo+ID4gLXZvaWQga29tZWRhX2NvbXBsZXRlX2RhdGFfZmxvd19jZmcoc3RydWN0IGtvbWVk
YV9kYXRhX2Zsb3dfY2ZnICpkZmxvdywKPiA+ICt2b2lkIGtvbWVkYV9jb21wbGV0ZV9kYXRhX2Zs
b3dfY2ZnKHN0cnVjdCBrb21lZGFfbGF5ZXIgKmxheWVyLAo+ID4gKyAgIHN0cnVjdCBrb21lZGFf
ZGF0YV9mbG93X2NmZyAqZGZsb3csCj4gPiAgICAgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIp
Cj4gPiAgewo+ID4gK3N0cnVjdCBrb21lZGFfc2NhbGVyICpzY2FsZXIgPSBsYXllci0+YmFzZS5w
aXBlbGluZS0+c2NhbGVyc1swXTsKPiA+ICB1MzIgdyA9IGRmbG93LT5pbl93Owo+ID4gIHUzMiBo
ID0gZGZsb3ctPmluX2g7Cj4gPgo+ID4gQEAgLTgwMyw2ICs4MDUsMTcgQEAgdm9pZCBrb21lZGFf
Y29tcGxldGVfZGF0YV9mbG93X2NmZyhzdHJ1Y3Qga29tZWRhX2RhdGFfZmxvd19jZmcgKmRmbG93
LAo+ID4KPiA+ICBkZmxvdy0+ZW5fc2NhbGluZyA9ICh3ICE9IGRmbG93LT5vdXRfdykgfHwgKGgg
IT0gZGZsb3ctPm91dF9oKTsKPiA+ICBkZmxvdy0+aXNfeXV2ID0gZmItPmZvcm1hdC0+aXNfeXV2
Owo+ID4gKwo+ID4gKy8qIHRyeSB0byBlbmFibGUgaW1hZ2UgZW5oYW5jZXIgaWYgaXQgaXMgYSAy
eCsgdXBzY2FsaW5nICovCj4gPiArZGZsb3ctPmVuX2ltZ19lbmhhbmNlbWVudCA9IGRmbG93LT5v
dXRfdyA+PSAyICogdyB8fAo+ID4gKyAgICBkZmxvdy0+b3V0X2ggPj0gMiAqIGg7Cj4gPiArCj4g
PiArLyogdHJ5IHRvIGVuYWJsZSBzcGxpdCBpZiBzY2FsaW5nIGV4Y2VlZCB0aGUgc2NhbGVyJ3Mg
YWNjZXB0YWJsZQo+ID4gKyAqIGlucHV0L291dHB1dCByYW5nZS4KPiA+ICsgKi8KPiA+ICtpZiAo
ZGZsb3ctPmVuX3NjYWxpbmcgJiYgc2NhbGVyKQo+ID4gK2RmbG93LT5lbl9zcGxpdCA9ICFpbl9y
YW5nZSgmc2NhbGVyLT5oc2l6ZSwgZGZsb3ctPmluX3cpIHx8Cj4gPiArICAhaW5fcmFuZ2UoJnNj
YWxlci0+aHNpemUsIGRmbG93LT5vdXRfdyk7Cj4gPiAgfQo+ID4KPiA+ICBzdGF0aWMgYm9vbCBt
ZXJnZXJfaXNfYXZhaWxhYmxlKHN0cnVjdCBrb21lZGFfcGlwZWxpbmUgKnBpcGUsCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMKPiA+
IGluZGV4IDViYjg1NTNjYzExNy4uYzA5NWFmMTU0MjE2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYwo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYwo+ID4gQEAgLTE4
LDcgKzE4LDYgQEAga29tZWRhX3BsYW5lX2luaXRfZGF0YV9mbG93KHN0cnVjdCBkcm1fcGxhbmVf
c3RhdGUgKnN0LAo+ID4gICAgICBzdHJ1Y3Qga29tZWRhX2RhdGFfZmxvd19jZmcgKmRmbG93KQo+
ID4gIHsKPiA+ICBzdHJ1Y3Qga29tZWRhX3BsYW5lICprcGxhbmUgPSB0b19rcGxhbmUoc3QtPnBs
YW5lKTsKPiA+IC1zdHJ1Y3Qga29tZWRhX3BsYW5lX3N0YXRlICprcGxhbmVfc3QgPSB0b19rcGxh
bmVfc3Qoc3QpOwo+ID4gIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gc3QtPmZiOwo+ID4g
IGNvbnN0IHN0cnVjdCBrb21lZGFfZm9ybWF0X2NhcHMgKmNhcHMgPSB0b19rZmIoZmIpLT5mb3Jt
YXRfY2FwczsKPiA+ICBzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpwaXBlID0ga3BsYW5lLT5sYXll
ci0+YmFzZS5waXBlbGluZTsKPiA+IEBAIC01NywxMCArNTYsNyBAQCBrb21lZGFfcGxhbmVfaW5p
dF9kYXRhX2Zsb3coc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3QsCj4gPiAgcmV0dXJuIC1FSU5W
QUw7Cj4gPiAgfQo+ID4KPiA+IC1kZmxvdy0+ZW5faW1nX2VuaGFuY2VtZW50ID0gISFrcGxhbmVf
c3QtPmltZ19lbmhhbmNlbWVudDsKPiA+IC1kZmxvdy0+ZW5fc3BsaXQgPSAhIWtwbGFuZV9zdC0+
bGF5ZXJfc3BsaXQ7Cj4gPiAtCj4gPiAta29tZWRhX2NvbXBsZXRlX2RhdGFfZmxvd19jZmcoZGZs
b3csIGZiKTsKPiA+ICtrb21lZGFfY29tcGxldGVfZGF0YV9mbG93X2NmZyhrcGxhbmUtPmxheWVy
LCBkZmxvdywgZmIpOwo+ID4KPiA+ICByZXR1cm4gMDsKPiA+ICB9Cj4gPiBAQCAtMTc1LDggKzE3
MSw2IEBAIGtvbWVkYV9wbGFuZV9hdG9taWNfZHVwbGljYXRlX3N0YXRlKHN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lKQo+ID4KPiA+ICBvbGQgPSB0b19rcGxhbmVfc3QocGxhbmUtPnN0YXRlKTsKPiA+
Cj4gPiAtbmV3LT5pbWdfZW5oYW5jZW1lbnQgPSBvbGQtPmltZ19lbmhhbmNlbWVudDsKPiA+IC0K
PiA+ICByZXR1cm4gJm5ldy0+YmFzZTsKPiA+ICB9Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMKPiA+
IGluZGV4IGJiOGE2MWY2ZTlhNC4uNjE3ZTFmN2I4NDcyIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMKPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rv
ci5jCj4gPiBAQCAtMTMsNyArMTMsNiBAQCBrb21lZGFfd2JfaW5pdF9kYXRhX2Zsb3coc3RydWN0
IGtvbWVkYV9sYXllciAqd2JfbGF5ZXIsCj4gPiAgIHN0cnVjdCBrb21lZGFfY3J0Y19zdGF0ZSAq
a2NydGNfc3QsCj4gPiAgIHN0cnVjdCBrb21lZGFfZGF0YV9mbG93X2NmZyAqZGZsb3cpCj4gPiAg
ewo+ID4gLXN0cnVjdCBrb21lZGFfc2NhbGVyICpzY2FsZXIgPSB3Yl9sYXllci0+YmFzZS5waXBl
bGluZS0+c2NhbGVyc1swXTsKPiA+ICBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9IGNvbm5f
c3QtPndyaXRlYmFja19qb2ItPmZiOwo+ID4KPiA+ICBtZW1zZXQoZGZsb3csIDAsIHNpemVvZigq
ZGZsb3cpKTsKPiA+IEBAIC0yOCwxNCArMjcsNyBAQCBrb21lZGFfd2JfaW5pdF9kYXRhX2Zsb3co
c3RydWN0IGtvbWVkYV9sYXllciAqd2JfbGF5ZXIsCj4gPiAgZGZsb3ctPnBpeGVsX2JsZW5kX21v
ZGUgPSBEUk1fTU9ERV9CTEVORF9QSVhFTF9OT05FOwo+ID4gIGRmbG93LT5yb3QgPSBEUk1fTU9E
RV9ST1RBVEVfMDsKPiA+Cj4gPiAta29tZWRhX2NvbXBsZXRlX2RhdGFfZmxvd19jZmcoZGZsb3cs
IGZiKTsKPiA+IC0KPiA+IC0vKiBpZiBzY2FsaW5nIGV4Y2VlZCB0aGUgYWNjZXB0YWJsZSBzY2Fs
ZXIgaW5wdXQvb3V0cHV0IHJhbmdlLCB0cnkgdG8KPiA+IC0gKiBlbmFibGUgc3BsaXQuCj4gPiAt
ICovCj4gPiAtaWYgKGRmbG93LT5lbl9zY2FsaW5nICYmIHNjYWxlcikKPiA+IC1kZmxvdy0+ZW5f
c3BsaXQgPSAhaW5fcmFuZ2UoJnNjYWxlci0+aHNpemUsIGRmbG93LT5pbl93KSB8fAo+ID4gLSAg
IWluX3JhbmdlKCZzY2FsZXItPmhzaXplLCBkZmxvdy0+b3V0X3cpOwo+ID4gK2tvbWVkYV9jb21w
bGV0ZV9kYXRhX2Zsb3dfY2ZnKHdiX2xheWVyLCBkZmxvdywgZmIpOwo+ID4KPiA+ICByZXR1cm4g
MDsKPiA+ICB9Cj4gPiAtLQo+ID4gMi4yMC4xCj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4KPiAtLQo+IERhbmllbCBWZXR0
ZXIKPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiBodHRwOi8vYmxvZy5m
ZndsbC5jaApJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQg
YW55IGF0dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVn
ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkg
dGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0
byBhbnkgb3RoZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBvciBj
b3B5IHRoZSBpbmZvcm1hdGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
