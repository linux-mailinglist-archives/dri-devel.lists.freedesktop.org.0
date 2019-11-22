Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B221089B0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A863D891BF;
	Mon, 25 Nov 2019 08:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10052.outbound.protection.outlook.com [40.107.1.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26006F560;
 Fri, 22 Nov 2019 20:14:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYl1ePWzo2OEgy7r/OXXVT6N9XGnrAhpZE0jJBFGB/SaAyqhcCBQMn2AjESfHYSDssXgUKLUA3/Bggupd2yWGRzRMvXhcX8ed8i9j8oKn4z1+rZ4QQRfbalyfcifuR/mfoCjvNLLgsQJgu0o5u25I3wl+YB53e6M+hLgnSo9d5nvkpPAANCp/JpirUto6bLpoMmjAuNeLdnAk4xbl1HQoM8MRt8jRd+viob/DglVaGYUllkgnSRgyPKz1mKSxQ+fhhfivH+kaxgVnOJW/fowPCQ9cSdckDV8gnQtgs0aAZBfsNkknrFzk2Hk07+kStzQ4IBfVRwVCDjkz/Q5vu16dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjRQszz9L+PMiEpvYqTsrjr7MQWTcOfJ+X5NK7/xSu0=;
 b=b+9LcHBPOGboiOSxF0QOvpUsTnwDYqOyJwJWV/Fei7AhGZbCV+83o+/B6rs+UWOt1kcUZmlODpeGKnPx8BwkhxEO9uEjZtwZ99+awzARQ63jRT5XxsbwZB77EasY+peGYLWRQY52ArDamf5lt+yLmxp/EO0IQ8xqnb5qKQFsKgd68vlE5P8HZGnJOrAtI14hwWEFsnMTbRgdIdnQ6VprGczfhUFXN69qQSBGv7PreDh93rAYrlf1JlsoEsO0BdFGzGO1Fhz0Aa48DCSGJxE2QEXejQmzIwkv2BqKM5Z6w/JN0Ur4z0H2t//2utol/1l5+fiX39kkImA5pK2xVyYMYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5598.eurprd05.prod.outlook.com (20.177.201.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Fri, 22 Nov 2019 20:14:52 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2474.021; Fri, 22 Nov 2019
 20:14:52 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [RFC 06/13] drm/i915/svm: Page table mirroring support
Thread-Topic: [RFC 06/13] drm/i915/svm: Page table mirroring support
Thread-Index: AQHVoXE1nHeIhGdFGEK5U7Uybd2W9aeXoBcA
Date: Fri, 22 Nov 2019 20:14:51 +0000
Message-ID: <20191122201448.GY7481@mellanox.com>
References: <20191122195452.14346-1-niranjana.vishwanathapura@intel.com>
 <20191122195452.14346-7-niranjana.vishwanathapura@intel.com>
 <20191122200116.GA14488@nvishwa1-DESK.sc.intel.com>
In-Reply-To: <20191122200116.GA14488@nvishwa1-DESK.sc.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN8PR04CA0066.namprd04.prod.outlook.com
 (2603:10b6:408:d4::40) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7db7da36-9206-44e3-e410-08d76f88a1d8
x-ms-traffictypediagnostic: VI1PR05MB5598:
x-microsoft-antispam-prvs: <VI1PR05MB5598991586A308C51921CB54CF490@VI1PR05MB5598.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 02296943FF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(199004)(189003)(54906003)(7416002)(229853002)(6246003)(7736002)(4326008)(305945005)(6512007)(256004)(6116002)(14444005)(66946007)(6436002)(6486002)(3846002)(25786009)(86362001)(66446008)(66556008)(71200400001)(71190400001)(186003)(102836004)(6916009)(36756003)(1076003)(8936002)(66476007)(478600001)(26005)(81166006)(81156014)(14454004)(2616005)(11346002)(446003)(386003)(316002)(76176011)(52116002)(66066001)(5660300002)(8676002)(99286004)(64756008)(33656002)(6506007)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5598;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KAjf4uOpN4CCy3lGVRY2z8ijaDBXelujkMIbWLh640hC816hT2g4sxLW7ZnGd0ZFkWOxPjPx1jTWiqiikTMPBuhBUav/UJtZbRlrw7DlzJklso/W8g5OsxCjGTZcUTgAgZoA08zFexGqTBMycBDGOGE1Udz5h0tA3mh7AeaaMbfcpYU5TXSlFgO9py8Z140PmJ+ogmjuBvFUO0UwmKrx2kMC9uSKlqeWvR3LX805yqxVXkQsWnAM6o9H9lLa2VA6cwikxoWu8Qro/f2Tk+hcB2LXXtnrzsGjQus7VGeZtK7r+reIXOM4oQOFn8ifRvrzhndher48oManbOg676VrTslc+x5SUzROd9jRcOWHMp4paYQAxzVSOcQPWLnaTyseCXkdUitjONrPVjTrUKgoqJ4IbkIfdfLlJBehnhxaywhnFEJxjfzpD3lQONq5j/Ge
x-ms-exchange-transport-forked: True
Content-ID: <F0C7EF585B07AD4993D49088F57ACD64@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db7da36-9206-44e3-e410-08d76f88a1d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2019 20:14:52.0004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7g/xfZ7H+PIhI9zDFTbKjcoZfi+pYtuFIHLCDGjQ/kNttz2WyLg+1mrtSrf6pM/jDqldOcrSEMKwEO8shHXlhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5598
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:07:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjRQszz9L+PMiEpvYqTsrjr7MQWTcOfJ+X5NK7/xSu0=;
 b=jYCjwU7KDlYj7JpWbGMF0j2NMS0BVAfy2FP9BkWRdWpCvw/b0uEq6rL8FbLe6pIatdx9yRmFTseo9ulBisa/SVGkAmBDXVEpOBxUdaXVvrSgYytYHeTjb2SYvozcXbPCY0tlbjbOBUTc6xfIoBXpPn4BnrsVkUlBHocKz0WV60g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "sanjay.k.kumar@intel.com" <sanjay.k.kumar@intel.com>,
 "sudeep.dutt@intel.com" <sudeep.dutt@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "jon.bloomfield@intel.com" <jon.bloomfield@intel.com>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTI6MDE6MTdQTSAtMDgwMCwgTmlyYW5qYW4gVmlzaHdh
bmF0aGFwdXJhIHdyb3RlOgo+IE9uIEZyaSwgTm92IDIyLCAyMDE5IGF0IDExOjU0OjQ1QU0gLTA4
MDAsIE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEgd3JvdGU6Cj4gPiBVc2UgSE1NIHBhZ2UgdGFi
bGUgbWlycm9yaW5nIHN1cHBvcnQgdG8gYnVpbGQgZGV2aWNlIHBhZ2UgdGFibGUuCj4gPiBJbXBs
ZW1lbnQgdGhlIGJpbmQgaW9jdGwgYW5kIGJpbmQgdGhlIHByb2Nlc3MgYWRkcmVzcyByYW5nZSBp
biB0aGUKPiA+IHNwZWNpZmllZCBjb250ZXh0J3MgcHBndHQuCj4gPiBIYW5kbGUgaW52YWxpZGF0
aW9uIG5vdGlmaWNhdGlvbnMgYnkgdW5iaW5kaW5nIHRoZSBhZGRyZXNzIHJhbmdlLgo+ID4gCj4g
PiBDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPgo+
ID4gQ2M6IEpvbiBCbG9vbWZpZWxkIDxqb24uYmxvb21maWVsZEBpbnRlbC5jb20+Cj4gPiBDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gPiBDYzogU3VkZWVwIER1
dHQgPHN1ZGVlcC5kdXR0QGludGVsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IE5pcmFuamFuYSBW
aXNod2FuYXRoYXB1cmEgPG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPgo+ID4g
K2ludCBpOTE1X3N2bV9iaW5kX21tKHN0cnVjdCBpOTE1X2FkZHJlc3Nfc3BhY2UgKnZtKQo+ID4g
K3sKPiA+ICsJc3RydWN0IGk5MTVfc3ZtICpzdm07Cj4gPiArCXN0cnVjdCBtbV9zdHJ1Y3QgKm1t
Owo+ID4gKwlpbnQgcmV0ID0gMDsKPiA+ICsKPiA+ICsJbW0gPSBnZXRfdGFza19tbShjdXJyZW50
KTsKPiA+ICsJZG93bl93cml0ZSgmbW0tPm1tYXBfc2VtKTsKPiA+ICsJbXV0ZXhfbG9jaygmdm0t
PnN2bV9tdXRleCk7Cj4gPiArCWlmICh2bS0+c3ZtKQo+ID4gKwkJZ290byBiaW5kX291dDsKPiA+
ICsKPiA+ICsJc3ZtID0ga3phbGxvYyhzaXplb2YoKnN2bSksIEdGUF9LRVJORUwpOwo+ID4gKwlp
ZiAoIXN2bSkgewo+ID4gKwkJcmV0ID0gLUVOT01FTTsKPiA+ICsJCWdvdG8gYmluZF9vdXQ7Cj4g
PiArCX0KPiA+ICsJc3ZtLT5taXJyb3Iub3BzID0gJmk5MTVfbWlycm9yX29wczsKPiA+ICsJbXV0
ZXhfaW5pdCgmc3ZtLT5tdXRleCk7Cj4gPiArCWtyZWZfaW5pdCgmc3ZtLT5yZWYpOwo+ID4gKwlz
dm0tPm1tID0gbW07Cj4gPiArCXN2bS0+dm0gPSB2bTsKPiA+ICsKPiA+ICsJcmV0ID0gaG1tX21p
cnJvcl9yZWdpc3Rlcigmc3ZtLT5taXJyb3IsIG1tKTsKPiAKPiBJIHNhdyB0aGF0IHRoZXNlIEFQ
SXMgaGF2ZSBiZWVuIHJlbW92ZWQuCj4gSSB3aWxsIHVwZGF0ZSBvbmNlIGl0IGdldHMgaW5jbHVk
ZWQgaW4ga2VybmVsIHJlbGVhc2UuCgpJIHdvdWxkIGxpa2UgdG8gc2VlIGFsbCB0aGUgbW11IG5v
dGlmaWVyIHVzZSBpbiBpOTE2IHVwZGF0ZWQgdG8gdXNlCnRoZSBuZXcgQVBJcyA6KQoKUGxlYXNl
IGNjIG1lIHdoZW4geW91IHBvc3QgcGF0Y2hlcyB1c2luZyB0aGUgbmV3IEFQSXMsIEknZCBsaWtl
IHRvIHNlZQpob3cgdGhleSBhcmUgYmVpbmcgdXNlZC4KClJlZ2FyZHMsCkphc29uCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
