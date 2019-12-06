Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40F511525F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 15:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385596E07D;
	Fri,  6 Dec 2019 14:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80AE6E07D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 14:16:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UA6xjD4UcCTt+CwnywC3pglPDD1VuzWXthAhB2MdoLfwNVkvAfRta8xXgnE+OPDU4nhsJqm6Uh6YUOGDG8iORpWpZOzUvZY1lyB0+Li+pcyZfK8U2kPSeOrTry1z9gBWou7z7gkJ7xzVnXubnQS2Hw6jwGSFc5JUKnSidujNOZgvProiX6CrteLE8jz0X7iQR+h4pi78b8sTQUrhSWV9TuaDHYgv/IL2kNQJlQkZuxyt5Xtt2fDX8GAKkAnvL8a8FZ+8q5TVC8RZbuYlZQmafr6o0qWw5DX2hDwJcncG+Pp0Wdo/Ky0Z7MNuNb1riQGs87eNyX8FHKSnw6IPLKDKfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XlgyWpifDYgef7G1rkOHYR2e28iiXM5HXblScXBIhk=;
 b=MECwoSmB38/mrDWRqAv1rW6JWbOdptlJxQ0JbyM3dLYo5cc09WGpyDRr2j1fMyekrt8NUl0brVCKe0S09T0HqYbYzEWcYX4gXeX6BrD1iMnG6dU4nfeJD16LBlN/iU+/B5KGzCYyRq4tLx5Bg+dXEmUZH375rBxhEXKtEzrRb4wBjKEhL+UiQrM7MAXvqzXE0v9XeJaO/geDy3+HvMfletLLNegr4RgY3iA3tems2poEHrwUHm+yoiet8F6F3nbbUbRNyoO9ILm2Rf7s64/XXSxAjInmUDYMTfBFpo/8bpZvVNzayTD/5tb4yHSxz1Hf91HDE+9EjkH88nj5giPwdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6334.namprd05.prod.outlook.com (20.178.249.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.6; Fri, 6 Dec 2019 14:16:11 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::611e:6a6b:9109:5aa8]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::611e:6a6b:9109:5aa8%7]) with mapi id 15.20.2516.003; Fri, 6 Dec 2019
 14:16:11 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: "mhocko@kernel.org" <mhocko@kernel.org>, "thomas_os@shipmail.org"
 <thomas_os@shipmail.org>
Subject: Re: [PATCH v3 2/2] mm, drm/ttm: Fix vm page protection handling
Thread-Topic: [PATCH v3 2/2] mm, drm/ttm: Fix vm page protection handling
Thread-Index: AQHVrA6f2/W6HP9nIkCwMUjaCAk1D6es6F2AgAA+8AA=
Date: Fri, 6 Dec 2019 14:16:10 +0000
Message-ID: <10c4835486275e87334058bc2f406609c55271eb.camel@vmware.com>
References: <20191206082426.2958-1-thomas_os@shipmail.org>
 <20191206082426.2958-3-thomas_os@shipmail.org>
 <20191206103055.GO28317@dhcp22.suse.cz>
In-Reply-To: <20191206103055.GO28317@dhcp22.suse.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9279fd4b-cb89-46fb-f795-08d77a56d849
x-ms-traffictypediagnostic: MN2PR05MB6334:|MN2PR05MB6334:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB63348FCF85E91CC1D9C143E4A15F0@MN2PR05MB6334.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0243E5FD68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(199004)(189003)(64756008)(76116006)(99286004)(107886003)(71200400001)(66946007)(66556008)(4326008)(26005)(86362001)(118296001)(66476007)(71190400001)(66446008)(7416002)(305945005)(316002)(81156014)(2906002)(81166006)(54906003)(91956017)(102836004)(186003)(6506007)(110136005)(6486002)(76176011)(8936002)(229853002)(5660300002)(8676002)(36756003)(66574012)(478600001)(6512007)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6334;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O8oBu8Gxsk2wzYSfBOci42C81GJiHiJUYl99EcF/jVEVz4RMXYC0y6sWPYbTnE6aIKo7rOxFzKV76WqsTi/qZ/JbSgIVH5wsZWs31sFzyAfWxpjGJz7lhe8Lkm/GpZNDL7/GuWs4wgwE3fZRKqwrwSRmrmzfNqBs+cKmbos1JsD5UqkFEJNVlMYudPp4v3JTQemjS6p+bF7xB/H1SmFP9kL4Icx7EeRQH1SuYM3omkVO6OuoODSyNP+JzJiaZ93bQJKKASoIuz2lQ+N7NZOTyVh2Q5S41MpocaMc1hd9Mi3VKHbKuPbthyzNWCvFy62R7O3aypL3b0kpdhsobELjZ06EexOuMH6kYv0yuvaDElvK9cA6d7rgIvt8sStDp3TyQESMRjvF25XJnb5Th+gFbEQHaCnpcjUaX6avESI5xkDBnAqBVtZvMX8nFsqIM/SY
Content-ID: <B73A1EED70AC1C40AE53773DE07C2F0E@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9279fd4b-cb89-46fb-f795-08d77a56d849
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2019 14:16:10.9427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aL3LtW99Gh/P55CcSP2jfVuJX917IjJkUm3So5QcKib5MxmYLD/5dqQ99jn+d96PFqbIYm2UXmFWFxBejdWiuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6334
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XlgyWpifDYgef7G1rkOHYR2e28iiXM5HXblScXBIhk=;
 b=EpmpyI3Zj6+rsQCAitYr1miK5WIpVSOPVqAArQmpxHpIUuj3AIeep9pb676GgU7lG8PwKBUnU9DaMshltXiIxMNVemlgv6ip/2iCoPy3/x5llXqFPC+zQQUKg0LzBJShcxf3OmE21Mpv4TvdZyXCoHi0X4xsuDSGeO6LwCNcZyo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
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
Cc: "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 Pv-drivers <Pv-drivers@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "willy@infradead.org" <willy@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWljaGFsLA0KDQpPbiBGcmksIDIwMTktMTItMDYgYXQgMTE6MzAgKzAxMDAsIE1pY2hhbCBI
b2NrbyB3cm90ZToNCj4gT24gRnJpIDA2LTEyLTE5IDA5OjI0OjI2LCBUaG9tYXMgSGVsbHN0csO2
bSAoVk13YXJlKSB3cm90ZToNCj4gWy4uLl0NCj4gPiBAQCAtMjgzLDExICsyODIsMjYgQEAgdm1f
ZmF1bHRfdCB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQoc3RydWN0DQo+ID4gdm1fZmF1bHQgKnZt
ZiwNCj4gPiAgCQkJcGZuID0gcGFnZV90b19wZm4ocGFnZSk7DQo+ID4gIAkJfQ0KPiA+ICANCj4g
PiArCQkvKg0KPiA+ICsJCSAqIE5vdGUgdGhhdCB0aGUgdmFsdWUgb2YgQHByb3QgYXQgdGhpcyBw
b2ludCBtYXkNCj4gPiBkaWZmZXIgZnJvbQ0KPiA+ICsJCSAqIHRoZSB2YWx1ZSBvZiBAdm1hLT52
bV9wYWdlX3Byb3QgaW4gdGhlIGNhY2hpbmctIGFuZA0KPiA+ICsJCSAqIGVuY3J5cHRpb24gYml0
cy4gVGhpcyBpcyBiZWNhdXNlIHRoZSBleGFjdCBsb2NhdGlvbg0KPiA+IG9mIHRoZQ0KPiA+ICsJ
CSAqIGRhdGEgbWF5IG5vdCBiZSBrbm93biBhdCBtbWFwKCkgdGltZSBhbmQgbWF5IGFsc28NCj4g
PiBjaGFuZ2UNCj4gPiArCQkgKiBhdCBhcmJpdHJhcnkgdGltZXMgd2hpbGUgdGhlIGRhdGEgaXMg
bW1hcCdlZC4NCj4gPiArCQkgKiBUaGlzIGlzIG9rIGFzIGxvbmcgYXMgQHZtYS0+dm1fcGFnZV9w
cm90IGlzIG5vdCB1c2VkDQo+ID4gYnkNCj4gPiArCQkgKiB0aGUgY29yZSB2bSB0byBzZXQgY2Fj
aGluZy0gYW5kIGVuY3J5cHRpb24gYml0cy4NCj4gPiArCQkgKiBUaGlzIGlzIGVuc3VyZWQgYnkg
Y29yZSB2bSB1c2luZyBwdGVfbW9kaWZ5KCkgdG8NCj4gPiBtb2RpZnkNCj4gPiArCQkgKiBwYWdl
IHRhYmxlIGVudHJ5IHByb3RlY3Rpb24gYml0cyAodGhhdCBmdW5jdGlvbg0KPiA+IHByZXNlcnZl
cw0KPiA+ICsJCSAqIG9sZCBjYWNoaW5nLSBhbmQgZW5jcnlwdGlvbiBiaXRzKSwgYW5kIHRoZSBA
ZmF1bHQNCj4gPiArCQkgKiBjYWxsYmFjayBiZWluZyB0aGUgb25seSBmdW5jdGlvbiB0aGF0IGNy
ZWF0ZXMgbmV3DQo+ID4gKwkJICogcGFnZSB0YWJsZSBlbnRyaWVzLg0KPiA+ICsJCSAqLw0KPiAN
Cj4gV2hpbGUgdGhpcyBpcyBhIHZlcnkgdmFsdWFibGUgcGllY2Ugb2YgaW5mb3JtYXRpb24gSSBi
ZWxpZXZlIHdlIG5lZWQNCj4gdG8NCj4gZG9jdW1lbnQgdGhpcyBpbiB0aGUgZ2VuZXJpYyBjb2Rl
IHdoZXJlIGV2ZXJ5Ym9keSB3aWxsIGZpbmQgaXQuDQo+IHZtZl9pbnNlcnRfbWl4ZWRfcHJvdCBz
b3VuZHMgbGlrZSBhIGdvb2QgcGxhY2UgdG8gbWUuIFNvIGJlaW5nDQo+IGV4cGxpY2l0DQo+IGFi
b3V0IFZNX01JWEVETUFQLiBBbHNvIGEgcmVmZXJlbmNlIGZyb20gdm1fcGFnZV9wcm90IHRvIHRo
aXMNCj4gZnVuY3Rpb24NCj4gd291bGQgYmUgcmVhbGx5IGhlbHBlZnVsLg0KPiANCj4gVGhhbmtz
IQ0KPiANCg0KSnVzdCB0byBtYWtlIHN1cmUgSSB1bmRlcnN0YW5kIGNvcnJlY3RseS4gWW91J2Qg
cHJlZmVyIHRoaXMgKG9yDQpzaW1pbGFyKSB0ZXh0IHRvIGJlIHByZXNlbnQgYXQgdGhlIHZtZl9p
bnNlcnRfbWl4ZWRfcHJvdCgpIGFuZA0Kdm1mX2luc2VydF9wZm5fcHJvdCgpIGRlZmluaXRpb25z
IGZvciBNSVhFRE1BUCBhbmQgUEZOTUFQIHJlc3BlY3RpdmVseSwNCmFuZCBhIHBvaW50ZXIgZnJv
bSB2bV9wYWdlX3Byb3QgdG8gdGhhdCB0ZXh0LiBJcyB0aGF0IGNvcnJlY3Q/DQoNClRoYW5rcywN
ClRob21hcw0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
