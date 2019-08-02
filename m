Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7275E7F07C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 11:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9B36ED87;
	Fri,  2 Aug 2019 09:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16A8891A0
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 09:29:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YS6r6BWwUcszxXiIWOjaPMhxFqKeo3fd+eeBLc47CYT9x9KB/MOJb2Mx1DQACbbWs5yC4iWkRJkQQWICnrSv7et6Y+7iVXYpeb2tqHJJmkYLdy4evU6COunoUqsD6StvYo5zrREoAj/fuIBQIWphopMK/sXv37pD/AYJAgHh+Ui6rsTxdqGTv4xezvWYelvjbKy4pxJcwAiwWc2QLRh0mXSNr34rMBKmPKGTyEBcgxA8kWCsMb43pyhGHFv/72ZEvjszEYtj3wsFfa6Oo0vSBxr/zVSjtVXBrYNzJO3/UdDHSkPGFpmtiaRCE/6BlYqj76JxFXA/DfC9NDCz4OV8Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=029QuZdo9+2wuHXmdlY9dpD9TMu6h/RXod+Koc+16VE=;
 b=CU0GYQgRR7ubQuMCUY1gqtdCokLdrcBqgXlH8hkg82qqeAAR7G44fdUfjJFcY/lPfcEhvHttiFwY4Q14izhE1amNkiNXO/SbATprMZq1yNM/2oCsEH62wPe9ClKWhz9zcdemfv204HeA3Ypn0r6XeEBpsjeGavwr0fZ0QN0HzcMGlZ5G7vj7Lh77mcvHydfOj6RCq4A2MFWBhjNaaSCQyPL38UGqJZnFhzoTgf6I5UbSVMK0rCchlaUDd9kDI+8GwBIfpFXLsVg1M9kV9eW8NZZ0Uhi9YDgPerTyYOguRuHp7pmemRQ/lXkqNh3WwnPdnkb9xreJJ6Lttqb06B80KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com (20.178.13.156) by
 VI1PR08MB2800.eurprd08.prod.outlook.com (10.170.236.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Fri, 2 Aug 2019 09:29:20 +0000
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::6d04:e478:d795:5d80]) by VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::6d04:e478:d795:5d80%4]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 09:29:20 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Thread-Topic: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Thread-Index: AQHVR4/KbU4UCRFzvkaBT5qon3yv66bktjIAgAEg7ACAAcNIAA==
Date: Fri, 2 Aug 2019 09:29:20 +0000
Message-ID: <20190802092920.4la5cwrltv2m6dke@DESKTOP-E1NTVVP.localdomain>
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
 <1564571048-15029-3-git-send-email-lowry.li@arm.com>
 <20190731132002.dut5mdsqgh7b75iv@DESKTOP-E1NTVVP.localdomain>
 <20190801063351.GB17887@lowry.li@arm.com>
In-Reply-To: <20190801063351.GB17887@lowry.li@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.53]
x-clientproxiedby: LO2P265CA0178.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::22) To VI1PR08MB3696.eurprd08.prod.outlook.com
 (2603:10a6:803:b6::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcc2e860-33b3-4fd5-21ca-08d7172be5e9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB2800; 
x-ms-traffictypediagnostic: VI1PR08MB2800:
x-microsoft-antispam-prvs: <VI1PR08MB2800A64803969E084E61472BF0D90@VI1PR08MB2800.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(199004)(189003)(99286004)(2906002)(6506007)(102836004)(478600001)(6636002)(6436002)(25786009)(52116002)(256004)(6486002)(386003)(316002)(66556008)(66446008)(64756008)(6116002)(76176011)(3846002)(54906003)(66946007)(5660300002)(58126008)(66476007)(71200400001)(26005)(186003)(4326008)(71190400001)(8676002)(14454004)(6862004)(86362001)(68736007)(1076003)(229853002)(81156014)(6246003)(81166006)(486006)(66066001)(11346002)(446003)(44832011)(9686003)(7416002)(7736002)(6512007)(53936002)(305945005)(476003)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2800;
 H:VI1PR08MB3696.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NPgHMYoiFzRFBVrqIqEu7uL4YaYbPsKkejqFSFA1SauGUuvIMSdOKYE04OiBkB0KChC4wsPE+J8vWj4KMTrTMPAIbm9EGv7nIK9Xelsqqn7bYmOjdJAWUKD0cRfVlcl7IwmSNbtTlPKRtNZxoUQXyPOLnl1+Ibh0mpWL5nsHYufixEPcytuzeLVpC+Wcbr3oeuO4PAcmYfs7V/ttNEDwHhFu6EUBueCdw4+Q1XXrfsnIz/GNxbSfTSy5wYMNHIPEiVluR45NQcs40UbohqIfZ6CvDXDez6obrxK6ixwtAF5ugP8SYVNJeqsGMbVoT1MqdUxgMprUXzCJIvrD4dP4B1k6RW4nOfzQ2vTTJXMqK54sXiLGG544mAPs5q8sA1p0HMU0hNuz3opA5CcEXgRfTqnHUq//+kuDsRpdcO6qEWA=
Content-ID: <D8157115E9F5EA4BB665A922E9F1FA7E@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc2e860-33b3-4fd5-21ca-08d7172be5e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 09:29:20.7196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Brian.Starkey@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2800
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=029QuZdo9+2wuHXmdlY9dpD9TMu6h/RXod+Koc+16VE=;
 b=8TeV4jnRNyjsDPfuzyePpq0a8E0gwykK0A5JuJprVEFY5qSwXw1l93+nn7oH5F2LIMPwWVZhqUgYKwW1ZO53BDcEVk/cberDxZfmlInVYQR8SqA7JcXd134wvi7Nknu5nPlTASOWxN8bnVUDlAQ9XYcJYUWMkd77qkVkRaJ0h7U=
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

SGkgTG93cnksCgpPbiBUaHUsIEF1ZyAwMSwgMjAxOSBhdCAwNjozNDowOEFNICswMDAwLCBMb3dy
eSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+IEhpIEJyaWFuLAo+IAo+IE9uIFdl
ZCwgSnVsIDMxLCAyMDE5IGF0IDA5OjIwOjA0UE0gKzA4MDAsIEJyaWFuIFN0YXJrZXkgd3JvdGU6
Cj4gPiBIaSBMb3dyeSwKPiA+IAo+ID4gVGhhbmtzIGZvciB0aGlzIGNsZWFudXAuCj4gPiAKPiA+
IE9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDExOjA0OjQ1QU0gKzAwMDAsIExvd3J5IExpIChBcm0g
VGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gPiA+IER1cmluZyBpdCBzaWduYWxzIHRoZSBjb21w
bGV0aW9uIG9mIGEgd3JpdGViYWNrIGpvYiwgYWZ0ZXIgcmVsZWFzaW5nCj4gPiA+IHRoZSBvdXRf
ZmVuY2UsIHdlJ2QgY2xlYXIgdGhlIHBvaW50ZXIuCj4gPiA+IAo+ID4gPiBDaGVjayBpZiBmZW5j
ZSBsZWZ0IG92ZXIgaW4gZHJtX3dyaXRlYmFja19jbGVhbnVwX2pvYigpLCByZWxlYXNlIGl0Lgo+
ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5h
KSA8bG93cnkubGlAYXJtLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJt
X3dyaXRlYmFjay5jIHwgMjMgKysrKysrKysrKysrKysrLS0tLS0tLS0KPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX3dyaXRlYmFjay5jCj4gPiA+IGluZGV4IGZmMTM4YjYuLjQzZDllM2IgMTAwNjQ0Cj4g
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMKPiA+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV93cml0ZWJhY2suYwo+ID4gPiBAQCAtMzI0LDYgKzMyNCw5IEBAIHZv
aWQgZHJtX3dyaXRlYmFja19jbGVhbnVwX2pvYihzdHJ1Y3QgZHJtX3dyaXRlYmFja19qb2IgKmpv
YikKPiA+ID4gIAlpZiAoam9iLT5mYikKPiA+ID4gIAkJZHJtX2ZyYW1lYnVmZmVyX3B1dChqb2It
PmZiKTsKPiA+ID4gIAo+ID4gPiArCWlmIChqb2ItPm91dF9mZW5jZSkKPiA+IAo+ID4gSSdtIHRo
aW5raW5nIGl0IG1pZ2h0IGJlIGEgZ29vZCBpZGVhIHRvIHNpZ25hbCB0aGUgZmVuY2Ugd2l0aCBh
biBlcnJvcgo+ID4gaGVyZSwgaWYgaXQncyBub3QgYWxyZWFkeSBzaWduYWxlZC4gT3RoZXJ3aXNl
LCBpZiB0aGVyZSdzIHNvbWVvbmUKPiA+IHdhaXRpbmcgKHdoaWNoIHRoZXJlIHNob3VsZG4ndCBi
ZSksIHRoZXkncmUgZ29pbmcgdG8gYmUgd2FpdGluZyBhIHZlcnkKPiA+IGxvbmcgdGltZSA6LSkK
PiA+IAo+ID4gVGhhbmtzLAo+ID4gLUJyaWFuCj4gPiAKPiBIZXJlIGl0IGhhcHBlbmVkIGF0IGF0
b21pY19jaGVjayBmYWlsZWQgYW5kIHRlc3Qgb25seSBjb21taXQuIEZvciBib3RoCj4gY2FzZXMs
IHRoZSBjb21taXQgaGFzIGJlZW4gZHJvcHBlZCBhbmQgaXQncyBvbmx5IGEgY2xlYW4gdXAuIFNv
IGhlcmUgYmV0dGVyCj4gbm90IGJlIHRyZWF0ZWQgYXMgYW4gZXJyb3IgY2FzZTopCgpJZiBhbnlv
bmUgZWxzZSBoYXMgYSByZWZlcmVuY2Ugb24gdGhlIGZlbmNlLCB0aGVuIElNTyBpdCBhYnNvbHV0
ZWx5IGlzCmFuIGVycm9yIHRvIHJlYWNoIHRoaXMgcG9pbnQgd2l0aG91dCB0aGUgZmVuY2UgYmVp
bmcgc2lnbmFsZWQgLQpiZWNhdXNlIGl0IG1lYW5zIHRoYXQgdGhlIGZlbmNlIHdpbGwgbmV2ZXIg
YmUgc2lnbmFsZWQuCgpJIGRvbid0IHRoaW5rIHRoZSBBUEkgZ2l2ZXMgeW91IGEgd2F5IHRvIGNo
ZWNrIGlmIHRoaXMgaXMgdGhlIGxhc3QKcmVmZXJlbmNlLCBzbyBpdCdzIHNhZmVzdCB0byBqdXN0
IG1ha2Ugc3VyZSB0aGUgZmVuY2UgaXMgc2lnbmFsbGVkCmJlZm9yZSBkcm9wcGluZyB0aGUgcmVm
ZXJlbmNlLgoKSXQganVzdCBmZWVscyB3cm9uZyB0byBtZSB0byBoYXZlIHRoZSBwb3NzaWJpbGl0
eSBvZiBhIGRhbmdsaW5nIGZlbmNlCndoaWNoIGlzIG5ldmVyIGdvaW5nIHRvIGdldCBzaWduYWxs
ZWQ7IGFuZCBpdCdzIGFuIGVhc3kgZGVmZW5zaXZlIHN0ZXAKdG8gbWFrZSBzdXJlIGl0IGNhbiBu
ZXZlciBoYXBwZW4uCgpJIGtub3cgaXQgX3Nob3VsZG4ndF8gaGFwcGVuLCBidXQgd2Ugb2Z0ZW4g
cHV0IGluIGhhbmRsaW5nIGZvciBjYXNlcwp3aGljaCBzaG91bGRuJ3QgaGFwcGVuLCBiZWNhdXNl
IHRoZXkgZnJlcXVlbnRseSBkbyBoYXBwZW4gOi0pCgo+IAo+IFNpbmNlIGZvciB1c2Vyc3BhY2Us
IGl0IHNob3VsZCBoYXZlIGJlZW4gZmFpbGVkIG9yIGEgdGVzdCBvbmx5IGNhc2UsIHNvCj4gd3Jp
dGViYWNlIGZlbmNlIHNob3VsZCBub3QgYmUgc2lnbmFsZWQuCgpJdCdzIG5vdCBvbmx5IHVzZXJz
cGFjZSB0aGF0IGNhbiB3YWl0IG9uIGZlbmNlcyAoYW5kIGluIGZhY3QgdGhpcwpmZW5jZSB3aWxs
IG5ldmVyIGV2ZW4gcmVhY2ggdXNlcnNwYWNlIGlmIHRoZSBjb21taXQgZmFpbHMpLCB0aGUgZHJp
dmVyCm1heSBoYXZlIHRha2VuIGEgY29weSB0byB1c2UgZm9yICJzb21ldGhpbmciLgoKQ2hlZXJz
LAotQnJpYW4KCj4gCj4gQmVzdCByZWdhcmRzLAo+IExvd3J5Cj4gPiA+ICsJCWRtYV9mZW5jZV9w
dXQoam9iLT5vdXRfZmVuY2UpOwo+ID4gPiArCj4gPiA+ICAJa2ZyZWUoam9iKTsKPiA+ID4gIH0K
PiAKPiAtLSAKPiBSZWdhcmRzLAo+IExvd3J5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
