Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A84681AE2
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 15:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1BD89FA5;
	Mon,  5 Aug 2019 13:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150054.outbound.protection.outlook.com [40.107.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE4989FA5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 13:10:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwjbsxT4C+p5VWQXP5q+w7fCUYlnWUSM8gbxNTvLzkKg73QMQWX8qa8lG0vc9nqJGJ2SphJ1U7MuEIhwB/+0quEkPCj+hhUyLGbypgWTiqhRwfCa2Y4Fd6J6tJZ6PTG/OQH0BK8lh/A/RTqsXtCDEQ5t2+XuHmjqzcVQnCB/ET7r0EYKJlFbFlQ5sL3wToxPP5loTl2ePQrY7+YANNE3WiUeHiKjOPOH7W876Qn2991Ygk/q9JL0NEI9PkNueNl6jevUX6QI3zkRq9Y94IKlDzRcXLaRA8ISYD58tsm3ZA1j2EU5BSjPkldvSMvjFfz73CShSv2+7a/v3LABXbHxAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCE9ySg0JEb1faX3GeVzHASlQlfnkWBqgZHYEiZe474=;
 b=gy2BrgKtz2ZJlcpE0tTcK6BolsC2PUq/b8HTc4nrkcOf3DSZLgPXwQ22sXyb+y8cQLb0rnNjKRH7TFTO2Dc+FoV+Tbz5U4ps7YxiS2p1OdDFgkQqwk0dNkSy+HTKcfDhJMCzrCG8Hd40wZOogBQ28739AO29lWIomjFNFFmxigg7KY89m4vFAmMqi+zOyzzID+bZ6lG0/b9YYygG/r5XjL8sjLCrR5VZ73T60wS8oAIr89FkFmcAmysMz5VwTxHvx9JKapBv8UlQiZql0JtY8m50N6X1TUaJ40v6as5Mv44vDNHWskHhdGUJj2qLLl82P2EpH3+7U60nTMKOocFG4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com (20.178.13.156) by
 VI1PR08MB5360.eurprd08.prod.outlook.com (52.133.244.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Mon, 5 Aug 2019 13:10:17 +0000
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::6d04:e478:d795:5d80]) by VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::6d04:e478:d795:5d80%4]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 13:10:17 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Thread-Topic: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Thread-Index: AQHVR4/KbU4UCRFzvkaBT5qon3yv66bsjx6A
Date: Mon, 5 Aug 2019 13:10:17 +0000
Message-ID: <20190805131014.u2kei5tvbkcf7aeo@DESKTOP-E1NTVVP.localdomain>
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
 <1564571048-15029-3-git-send-email-lowry.li@arm.com>
In-Reply-To: <1564571048-15029-3-git-send-email-lowry.li@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::33) To VI1PR08MB3696.eurprd08.prod.outlook.com
 (2603:10a6:803:b6::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e39071b-d675-4174-09da-08d719a642a0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB5360; 
x-ms-traffictypediagnostic: VI1PR08MB5360:
x-microsoft-antispam-prvs: <VI1PR08MB53607FB3023F6B6F01AD85C9F0DA0@VI1PR08MB5360.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(189003)(199004)(102836004)(25786009)(4326008)(76176011)(6506007)(386003)(7416002)(53936002)(2906002)(6636002)(478600001)(3846002)(6116002)(6246003)(44832011)(1076003)(86362001)(446003)(6436002)(229853002)(256004)(11346002)(486006)(6862004)(316002)(6512007)(9686003)(58126008)(54906003)(14444005)(476003)(14454004)(6486002)(66946007)(5660300002)(71200400001)(71190400001)(68736007)(64756008)(66446008)(66476007)(66556008)(305945005)(8936002)(81166006)(81156014)(99286004)(8676002)(7736002)(66066001)(52116002)(26005)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5360;
 H:VI1PR08MB3696.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9qOBNaHn3scpbwUYXVz9M5T5ZINDlik9ZPhIOlX6I82R368LEMIAtIYov76xK9FlCrGXa2S0H+yuTR+UznaB8exemr73cDys8l5BWFeNrHwrlJoWKvKnF1UT83cyILHv1790cNjWj6Yo2Q+3wgC9XcjD+Gfnd2KHSgQ4ginRxMSgo6YFNAWMxnHkKsJW2wpprw3UYjkvfQmYxWUG403FOC0edDc5eXfyiQn53/kdGsoqWZFehZpPwQKT9A8TAx4jUXPaNSxuFSDOKgour+MfZB6TZrle+D4jcxie/QFwKpzshyXOl0PuSJwb12uLSKkcqrehzV1TFeWslrJD9K6oAIEp1Cw6VV115+lMZgYq1y4ICif74aIsC8TX1eIpM7SM8dHdkiZo719hvsg8L7Au5R4MJMxzw7R6CoSwj+P3H8U=
Content-ID: <AF3F22A2EB691C4CAE958A80FAC283BF@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e39071b-d675-4174-09da-08d719a642a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 13:10:17.3412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Brian.Starkey@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5360
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCE9ySg0JEb1faX3GeVzHASlQlfnkWBqgZHYEiZe474=;
 b=khVS0YE0SwDYdp0sjWkqBCnEo61Zf33777fAjpDMVOaLDe+o7m9gIB62UEz7kiFg890JMqEoBQ1P0KEz3QwncXwnQXPrcvrhWmia7LyAv0x5nvsE4QNr/kJc7sBy3NsuVrqgFbF7qXa4uhPTx4k8Ezu2nQWK7Gh5z9htVGSw2rc=
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
 nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Ayan Halder <Ayan.Halder@arm.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTG93cnksCgpCYXNlZCBvbiBEYW5pZWwncyBpbnB1dCwgdGhpcyBwYXRjaCBsb29rcyBmaW5l
OgoKUmV2aWV3ZWQtYnk6IEJyaWFuIFN0YXJrZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4KCkkg
dGhpbmsgdGhlcmUncyBzb21lIG9wcG9ydHVuaXR5IGZvciBpbXByb3ZlbWVudCBhcm91bmQKcHJl
cGFyZV9zaWduYWxpbmcvY29tcGxldGVfc2lnbmFsaW5nLCBidXQgdGhhdCBjYW4gYmUgdHJlYXRl
ZCBhcwpzZXBhcmF0ZSBmcm9tIGZpeGluZyB0aGlzIGJ1Zy4KClRoYW5rcywKLUJyaWFuCgpPbiBX
ZWQsIEp1bCAzMSwgMjAxOSBhdCAxMTowNDo0NUFNICswMDAwLCBMb3dyeSBMaSAoQXJtIFRlY2hu
b2xvZ3kgQ2hpbmEpIHdyb3RlOgo+IER1cmluZyBpdCBzaWduYWxzIHRoZSBjb21wbGV0aW9uIG9m
IGEgd3JpdGViYWNrIGpvYiwgYWZ0ZXIgcmVsZWFzaW5nCj4gdGhlIG91dF9mZW5jZSwgd2UnZCBj
bGVhciB0aGUgcG9pbnRlci4KPiAKPiBDaGVjayBpZiBmZW5jZSBsZWZ0IG92ZXIgaW4gZHJtX3dy
aXRlYmFja19jbGVhbnVwX2pvYigpLCByZWxlYXNlIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IExv
d3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5LmxpQGFybS5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMgfCAyMyArKysrKysrKysrKysrKystLS0t
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV93cml0ZWJhY2suYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMKPiBpbmRleCBmZjEzOGI2Li40M2Q5ZTNiIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX3dyaXRlYmFjay5jCj4gQEAgLTMyNCw2ICszMjQsOSBAQCB2b2lkIGRybV93
cml0ZWJhY2tfY2xlYW51cF9qb2Ioc3RydWN0IGRybV93cml0ZWJhY2tfam9iICpqb2IpCj4gIAlp
ZiAoam9iLT5mYikKPiAgCQlkcm1fZnJhbWVidWZmZXJfcHV0KGpvYi0+ZmIpOwo+ICAKPiArCWlm
IChqb2ItPm91dF9mZW5jZSkKPiArCQlkbWFfZmVuY2VfcHV0KGpvYi0+b3V0X2ZlbmNlKTsKPiAr
Cj4gIAlrZnJlZShqb2IpOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woZHJtX3dyaXRlYmFja19jbGVh
bnVwX2pvYik7Cj4gQEAgLTM2NiwyNSArMzY5LDI5IEBAIHN0YXRpYyB2b2lkIGNsZWFudXBfd29y
ayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4gIHsKPiAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7
Cj4gIAlzdHJ1Y3QgZHJtX3dyaXRlYmFja19qb2IgKmpvYjsKPiArCXN0cnVjdCBkbWFfZmVuY2Ug
Km91dF9mZW5jZTsKPiAgCj4gIAlzcGluX2xvY2tfaXJxc2F2ZSgmd2JfY29ubmVjdG9yLT5qb2Jf
bG9jaywgZmxhZ3MpOwo+ICAJam9iID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZ3Yl9jb25u
ZWN0b3ItPmpvYl9xdWV1ZSwKPiAgCQkJCSAgICAgICBzdHJ1Y3QgZHJtX3dyaXRlYmFja19qb2Is
Cj4gIAkJCQkgICAgICAgbGlzdF9lbnRyeSk7Cj4gLQlpZiAoam9iKSB7Cj4gKwlpZiAoam9iKQo+
ICAJCWxpc3RfZGVsKCZqb2ItPmxpc3RfZW50cnkpOwo+IC0JCWlmIChqb2ItPm91dF9mZW5jZSkg
ewo+IC0JCQlpZiAoc3RhdHVzKQo+IC0JCQkJZG1hX2ZlbmNlX3NldF9lcnJvcihqb2ItPm91dF9m
ZW5jZSwgc3RhdHVzKTsKPiAtCQkJZG1hX2ZlbmNlX3NpZ25hbChqb2ItPm91dF9mZW5jZSk7Cj4g
LQkJCWRtYV9mZW5jZV9wdXQoam9iLT5vdXRfZmVuY2UpOwo+IC0JCX0KPiAtCX0KPiArCj4gIAlz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZ3Yl9jb25uZWN0b3ItPmpvYl9sb2NrLCBmbGFncyk7Cj4g
IAo+ICAJaWYgKFdBUk5fT04oIWpvYikpCj4gIAkJcmV0dXJuOwo+ICAKPiArCW91dF9mZW5jZSA9
IGpvYi0+b3V0X2ZlbmNlOwo+ICsJaWYgKG91dF9mZW5jZSkgewo+ICsJCWlmIChzdGF0dXMpCj4g
KwkJCWRtYV9mZW5jZV9zZXRfZXJyb3Iob3V0X2ZlbmNlLCBzdGF0dXMpOwo+ICsJCWRtYV9mZW5j
ZV9zaWduYWwob3V0X2ZlbmNlKTsKPiArCQlkbWFfZmVuY2VfcHV0KG91dF9mZW5jZSk7Cj4gKwkJ
am9iLT5vdXRfZmVuY2UgPSBOVUxMOwo+ICsJfQo+ICsKPiAgCUlOSVRfV09SSygmam9iLT5jbGVh
bnVwX3dvcmssIGNsZWFudXBfd29yayk7Cj4gIAlxdWV1ZV93b3JrKHN5c3RlbV9sb25nX3dxLCAm
am9iLT5jbGVhbnVwX3dvcmspOwo+ICB9Cj4gLS0gCj4gMS45LjEKPiAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
