Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4532D82334
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 18:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0096C6E507;
	Mon,  5 Aug 2019 16:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60058.outbound.protection.outlook.com [40.107.6.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D186E507
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 16:54:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ocv617mF4PzX87i6b+4e2dWeibvb+atUZarieNm73yOD4DNO9mSd2Rsx9IWfOukpOWfQB4eM9UvAH0KMyCVB7AunQbuKTtHMo6eUMW37csvus6qjx6p8pi0UWDgvXTGIr4lWXh9hnjVVgN9hzS7prDw1mo6JGDEZnkPmLHjjKHLinA8P5MEgCCexF5pPUCcO4FaRUllg3vEL+/6nVDeZLlzjQBlfVvfxq61C+b9n8TWvd1zNwxPeJ5siw+dWbqITe8VOTNe9PF7m5et67Pj8aHQEGGhSw5sdG3kGQpAqusOamLg07lE4w15StryJ7B362zOTts0dXzD1okYRB1Cc+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlktXrh+/Q1j9FjaqTiaUsPU2Wxglsi/48GC+rVk4/g=;
 b=aRw2pWZ3HuRufJufM3wENTBt8u9VTtLpCVSKvq+KPBzx4svWqM7HsAYTPAGljWouyIkGZrgzPmfANUAkAq0u+CXRqGttaoKcvkmMx+UlzYI6A/en8rxo8gE37J5/8U5n+Pxfduhw76mbCeLKl5HCyaNHB+Mi0h4JtunqxlYoNJk+1alG7a+0nQEZ1o/limcJ49GXHN+sV5WKSyESUHIpt2Uc64mH3OP2ZAIiQqKf32PMvh72dAeCphHU8MKdX6SkHSNIcP+XhZKeFpLzstU297w3jyuG1PsvpKlRJ6fWcsp6zvT/+K5ye6JJmnhR0vbbn5itywLFlYiWGgm3B3iVxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com (20.178.13.156) by
 VI1PR08MB3519.eurprd08.prod.outlook.com (20.177.61.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Mon, 5 Aug 2019 16:54:15 +0000
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::6d04:e478:d795:5d80]) by VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::6d04:e478:d795:5d80%4]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 16:54:15 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, Liviu Dudau <Liviu.Dudau@arm.com>, "james
 qian wang (Arm Technology China)" <james.qian.wang@arm.com>, "Lowry Li (Arm
 Technology China)" <Lowry.Li@arm.com>, nd <nd@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/crc-debugfs: Add notes about CRC<->commit interactions
Thread-Topic: [PATCH] drm/crc-debugfs: Add notes about CRC<->commit
 interactions
Thread-Index: AQHVS6AfVKCWuj8pSkiiGLREL8ZNOqbsvTSAgAAIXgA=
Date: Mon, 5 Aug 2019 16:54:15 +0000
Message-ID: <20190805165414.nzlru7iiqiaepuuu@DESKTOP-E1NTVVP.localdomain>
References: <20190802140910.GN7444@phenom.ffwll.local>
 <20190805151143.12317-1-brian.starkey@arm.com>
 <20190805162417.GS7444@phenom.ffwll.local>
In-Reply-To: <20190805162417.GS7444@phenom.ffwll.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP265CA0034.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::22) To VI1PR08MB3696.eurprd08.prod.outlook.com
 (2603:10a6:803:b6::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc573d91-c092-4bbb-e48f-08d719c58c8b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3519; 
x-ms-traffictypediagnostic: VI1PR08MB3519:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR08MB35190CD7E2DF2A42B54DEB1CF0DA0@VI1PR08MB3519.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(40434004)(189003)(199004)(68736007)(53936002)(66476007)(102836004)(76176011)(6506007)(2501003)(110136005)(587094005)(316002)(386003)(305945005)(186003)(66946007)(66556008)(6306002)(64756008)(52116002)(486006)(11346002)(256004)(99286004)(66066001)(14444005)(5024004)(9686003)(7736002)(14454004)(6486002)(8676002)(8936002)(229853002)(476003)(25786009)(446003)(58126008)(26005)(478600001)(2906002)(3846002)(81166006)(81156014)(53386004)(44832011)(6512007)(71200400001)(1076003)(86362001)(6116002)(5660300002)(71190400001)(966005)(6246003)(6436002)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3519;
 H:VI1PR08MB3696.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VZOnsHbp8iUcf34PXVOqMJlfk3sLCiAh0mBTZuBWd2baf8K72PLp+q2/tmoxjcpoQYiqBtzG3ZgO3BV3c6fEvTu/DCfjVI351L3q9GNFmlnvhyssghgSfMHpGefZEz1v+kt0G7K5HrGR1ql4SrFZJLAzL2f0I+poAV0fDyewliPW6uJcA0FIdTUwhh1i9KUQ7J8EGE03OiStqdX4GfRG/WKx5xUuWIicDHlS35KBafMTsbilNpbpqxqQ/FtwLWj5UaticIBHGtXJ94KWqpUEfwVYESIeN6zEucwYO3kMlv0bs2JWwAs47HMR3awDsgBlqrKv+qk50orx/FAy2N8RpOM6iG20FCo8Hkr8OULeeOiVWm46hYDg7aFEMzyEe7+ZftbTpwn+0RUv7JJm9mk5vto17MeYvS4/ikxCBa7TVuk=
Content-ID: <3B10D13FB2D00D4A8F777D7F42D4B14F@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc573d91-c092-4bbb-e48f-08d719c58c8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 16:54:15.5613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Brian.Starkey@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3519
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlktXrh+/Q1j9FjaqTiaUsPU2Wxglsi/48GC+rVk4/g=;
 b=FRxVabZYdf3hOWTbtPn5N4R3X9en9Cwbaf0Dfr2hu8lOt1NJwYYm5vwL87uTWDBEOPKWk9XdbxRu28co7BiovEcZVAiESQrJ1J/n0TcaGZ2NWRDJ6NvOI2c/dYvwnVkdoQLi8kT/4HunjMvCKnvLXd0NLfyfjxxY6CYxzbP/VgI=
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

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDY6MjQ6MTdQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBNb24sIEF1ZyAwNSwgMjAxOSBhdCAwNDoxMTo0M1BNICswMTAwLCBCcmlhbiBT
dGFya2V5IHdyb3RlOgo+ID4gQ1JDIGdlbmVyYXRpb24gY2FuIGJlIGltcGFjdGVkIGJ5IGNvbW1p
dHMgY29taW5nIGZyb20gdXNlcnNwYWNlLCBhbmQKPiA+IGVuYWJsaW5nIENSQyBnZW5lcmF0aW9u
IG1heSBpdHNlbGYgdHJpZ2dlciBhIGNvbW1pdC4gQWRkIG5vdGVzIGFib3V0Cj4gPiB0aGlzIHRv
IHRoZSBrZXJuZWxkb2MuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQnJpYW4gU3RhcmtleSA8YnJp
YW4uc3RhcmtleUBhcm0uY29tPgo+ID4gLS0tCj4gPgo+ID4gSSBtaWdodCBoYXZlIGdvdCB0aGUg
d3JvbmcgZW5kIG9mIHRoZSBzdGljaywgYnV0IHRoaXMgaXMgd2hhdCBJCj4gPiB1bmRlcnN0b29k
IGZyb20gd2hhdCB5b3Ugc2FpZC4KPiA+Cj4gPiBDaGVlcnMsCj4gPiAtQnJpYW4KPiA+Cj4gPiAg
ZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jIHwgMTUgKysrKysrKysrKystLS0tCj4g
PiAgaW5jbHVkZS9kcm0vZHJtX2NydGMuaCAgICAgICAgICAgIHwgIDMgKysrCj4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RlYnVnZnNfY3JjLmMKPiA+IGluZGV4IDdjYTQ4NmQ3NTBlOS4uMWRmZjk1NmJjYzc0
IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKPiA+IEBAIC02NSwxMCArNjUs
MTcgQEAKPiA+ICAgKiBpdCBzdWJtaXRzLiBJbiB0aGlzIGdlbmVyYWwgY2FzZSwgdGhlIG1heGlt
dW0gdXNlcnNwYWNlIGNhbiBkbyBpcyB0byBjb21wYXJlCj4gPiAgICogdGhlIHJlcG9ydGVkIENS
Q3Mgb2YgZnJhbWVzIHRoYXQgc2hvdWxkIGhhdmUgdGhlIHNhbWUgY29udGVudHMuCj4gPiAgICoK
PiA+IC0gKiBPbiB0aGUgZHJpdmVyIHNpZGUgdGhlIGltcGxlbWVudGF0aW9uIGVmZm9ydCBpcyBt
aW5pbWFsLCBkcml2ZXJzIG9ubHkgbmVlZCB0bwo+ID4gLSAqIGltcGxlbWVudCAmZHJtX2NydGNf
ZnVuY3Muc2V0X2NyY19zb3VyY2UuIFRoZSBkZWJ1Z2ZzIGZpbGVzIGFyZSBhdXRvbWF0aWNhbGx5
Cj4gPiAtICogc2V0IHVwIGlmIHRoYXQgdmZ1bmMgaXMgc2V0LiBDUkMgc2FtcGxlcyBuZWVkIHRv
IGJlIGNhcHR1cmVkIGluIHRoZSBkcml2ZXIgYnkKPiA+IC0gKiBjYWxsaW5nIGRybV9jcnRjX2Fk
ZF9jcmNfZW50cnkoKS4KPiA+ICsgKiBPbiB0aGUgZHJpdmVyIHNpZGUgdGhlIGltcGxlbWVudGF0
aW9uIGVmZm9ydCBpcyBtaW5pbWFsLCBkcml2ZXJzIG9ubHkgbmVlZAo+ID4gKyAqIHRvIGltcGxl
bWVudCAmZHJtX2NydGNfZnVuY3Muc2V0X2NyY19zb3VyY2UuIFRoZSBkZWJ1Z2ZzIGZpbGVzIGFy
ZQo+ID4gKyAqIGF1dG9tYXRpY2FsbHkgc2V0IHVwIGlmIHRoYXQgdmZ1bmMgaXMgc2V0LiBDUkMg
c2FtcGxlcyBuZWVkIHRvIGJlIGNhcHR1cmVkCj4gPiArICogaW4gdGhlIGRyaXZlciBieSBjYWxs
aW5nIGRybV9jcnRjX2FkZF9jcmNfZW50cnkoKS4gRGVwZW5kaW5nIG9uIHRoZSBkcml2ZXIKPiA+
ICsgKiBhbmQgSFcgcmVxdWlyZW1lbnRzLCAmZHJtX2NydGNfZnVuY3Muc2V0X2NyY19zb3VyY2Ug
bWF5IHJlc3VsdCBpbiBhIGNvbW1pdAo+ID4gKyAqIChldmVuIGEgZnVsbCBtb2Rlc2V0KS4KPiA+
ICsgKgo+ID4gKyAqIEl0J3MgYWxzbyBwb3NzaWJsZSB0aGF0IGEgIm5vcm1hbCIgY29tbWl0IHZp
YSBEUk1fSU9DVExfTU9ERV9BVE9NSUMgb3IgdGhlCj4gPiArICogbGVnYWN5IHBhdGhzIG1heSBp
bnRlcmZlcmUgd2l0aCBDUkMgZ2VuZXJhdGlvbi4gU28sIGluIHRoZSBnZW5lcmFsIGNhc2UsCj4g
PiArICogdXNlcnNwYWNlIGNhbid0IHJlbHkgb24gdGhlIHZhbHVlcyBpbiBjcnRjLU4vY3JjL2Rh
dGEgYmVpbmcgdmFsaWQKPiA+ICsgKiBhY3Jvc3MgYSBjb21taXQuCj4KPiBJdCdzIG5vdCBqdXN0
IHRoZSB2YWx1ZXMsIGJ1dCB0aGUgZ2VuZXJhdGlvbiBpdHNlbGYgbWlnaHQgZ2V0IGRpc2FibGVk
Cj4gKGUuZy4gb24gaTkxNSBpZiB5b3Ugc2VsZWN0ICJhdXRvIiBvbiBzb21lIGNoaXBzIHlvdSBn
ZXQgdGhlIERQIHBvcnQKPiBzYW1wbGluZyBwb2ludCwgYnV0IGZvciBIRE1JIG1vZGUgeW91IGdl
dCBhIGRpZmZlcmVudCBzYW1wbGluZyBwbG9pbnQsIGFuZAo+IGlmIHlvdSBnZXQgdGhlIHdyb25n
IG9uZSB0aGVyZSB3b24ndCBiZSBhbnkgY3JjIGZvciB5b3UpLiBBbHNvIGl0J3Mgbm90Cj4ganVz
dCBhbnkgYXRvbWljIGNvbW1pdCwgb25seSB0aGUgb25lcyB3aXRoIEFMTE9XX01PREVTRVQuCgpJ
cyB0aGUgbWVhbmluZyBvZiBBTExPV19NT0RFU0VUIGFjdHVhbGx5IGRlZmluZWQgc29tZXdoZXJl
IHRoZW4/IEkKdGhvdWdodCBpdCB3YXMgYnJvYWRseSBzcGVha2luZyAiYW55dGhpbmcgdGhhdCB3
b3VsZCBjYXVzZSBhIGZsaWNrZXIKb24gdGhlIG91dHB1dCIgLSBidXQgdGhhdCBuZWVkbid0IGJl
IHRoZSBzYW1lIHNldCBvZiB0aGluZ3MgdGhhdCBicmVhawpDUkMgZ2VuZXJhdGlvbi4KCj4KPiBN
YXliZSBzb21ldGhpbmcgbGlrZSB0aGUgYmVsb3cgdGV4dDoKPgo+ICJQbGVhc2Ugbm90ZSB0aGF0
IGFuIGF0b21pYyBtb2Rlc2V0IGNvbW1pdCB3aXRoIHRoZQo+IERSTV9NT0RFX0FUT01JQ19BTExP
V19NT0RFU0VULCBvciBhIGNhbGwgdG8gdGhlIGxlZ2FjeSBTRVRDUlRSIGlvY3RsCj4gKHdoaWNo
IGFtb3VudHMgdG8gdGhlIHNhbWUpLCBjYW4gZGVzdHJ5IHRoZSBDUkMgc2V0dXAgZHVlIHRvIGhh
cmR3YXJlCj4gcmVxdWlyZW1lbnRzLiBUaGlzIHJlc3VsdHMgaW4gaW5jb25zaXN0ZW50IENSQyB2
YWx1ZXMgb3Igbm90IGV2ZW4gYW55IENSQwo+IHZhbHVlcyBnZW5lcmF0ZWQuIEdlbmVyaWMgdXNl
cnNwYWNlIHRoZXJlZm9yZSBuZWVkcyB0byByZS1zZXR1cCB0aGUgQ1JDCj4gYWZ0ZXIgZWFjaCBz
dWNoIG1vZGVzZXQuIgo+Cj4gPgo+ID4gIHN0YXRpYyBpbnQgY3JjX2NvbnRyb2xfc2hvdyhzdHJ1
Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0v
ZHJtX2NydGMuaCBiL2luY2x1ZGUvZHJtL2RybV9jcnRjLmgKPiA+IGluZGV4IDEyOGQ4YjIxMDYy
MS4uMGY3ZWEwOTRhOTAwIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2NydGMuaAo+
ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2NydGMuaAo+ID4gQEAgLTc1Niw2ICs3NTYsOCBAQCBz
dHJ1Y3QgZHJtX2NydGNfZnVuY3Mgewo+ID4gICAqIHByb3ZpZGVkIGZyb20gdGhlIGNvbmZpZ3Vy
ZWQgc291cmNlLiBEcml2ZXJzIG11c3QgYWNjZXB0IGFuICJhdXRvIgo+ID4gICAqIHNvdXJjZSBu
YW1lIHRoYXQgd2lsbCBzZWxlY3QgYSBkZWZhdWx0IHNvdXJjZSBmb3IgdGhpcyBDUlRDLgo+ID4g
ICAqCj4gPiArICogVGhpcyBtYXkgdHJpZ2dlciBhIGNvbW1pdCBpZiBuZWNlc3NhcnksIHRvIGVu
YWJsZSBDUkMgZ2VuZXJhdGlvbi4KPgo+IEknZCBjbGFyaWZ5IHRoaXMgYXMgImF0b21pYyBtb2Rl
c2V0IGNvbW1pdCIganVzdCB0byBiZSBzdXJlLgoKQWNrLgoKVGhhbmtzLAotQnJpYW4KCj4KPiBX
aXRoIHRoZXNlIHR3byBjb21tZW50cyBhZGRyZXNzZWQgc29tZWhvdzoKPgo+IFJldmlld2VkLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+Cj4KPiA+ICsgKgo+ID4g
ICAqIE5vdGUgdGhhdCAiYXV0byIgY2FuIGRlcGVuZCB1cG9uIHRoZSBjdXJyZW50IG1vZGVzZXQg
Y29uZmlndXJhdGlvbiwKPiA+ICAgKiBlLmcuIGl0IGNvdWxkIHBpY2sgYW4gZW5jb2RlciBvciBv
dXRwdXQgc3BlY2lmaWMgQ1JDIHNhbXBsaW5nIHBvaW50Lgo+ID4gICAqCj4gPiBAQCAtNzY3LDYg
Kzc2OSw3IEBAIHN0cnVjdCBkcm1fY3J0Y19mdW5jcyB7Cj4gPiAgICogMCBvbiBzdWNjZXNzIG9y
IGEgbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWlsdXJlLgo+ID4gICAqLwo+ID4gIGludCAoKnNl
dF9jcmNfc291cmNlKShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIGNvbnN0IGNoYXIgKnNvdXJjZSk7
Cj4gPiArCj4gPiAgLyoqCj4gPiAgICogQHZlcmlmeV9jcmNfc291cmNlOgo+ID4gICAqCj4gPiAt
LQo+ID4gMi4xNy4xCj4gPgo+Cj4gLS0KPiBEYW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5l
ZXIsIEludGVsIENvcnBvcmF0aW9uCj4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKSU1QT1JUQU5UIE5P
VElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUg
Y29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0
aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRl
bHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwg
dXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24g
aW4gYW55IG1lZGl1bS4gVGhhbmsgeW91LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
