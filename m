Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3D78E862
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 11:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322206E965;
	Thu, 15 Aug 2019 09:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770040.outbound.protection.outlook.com [40.107.77.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA4F6E964;
 Thu, 15 Aug 2019 09:36:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INwMHvkEaLyoL9T4piRF1FEKTkjYxQqcNRXsvfqoha5QpmeQm7jw8SIG4WWt6j5IEDAqRO+DjNb20BVwh7mFdlpe5cqnbIDv/qsc7ODv3yt0mVpv1tfE6sM+V3EPvrOXrvxmRM99fc6Ea6AJ0XEUFT0QJyWbGkuE3gO3nLrl4uek9yVmhrvqwftmklDxklsnfra5ns7YvoUA3YOQb0vUtndFgu5XqHoqtl77hEVXeuaD3JIBMWmIJG72qieGPLpsy+7tl6XHlv6ilRqguYHTjlJ6ZvuVFmtHttF4nOkNHbsSmEqjiRzh8L8JnI78YaBU+jB4P1sW6EyrImrtwm3ohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxRBDLF9zc8JNeQgfypWeIzPKz+lFBVEhpbPLk9rqZ0=;
 b=BwU1XgHiLHKpnW4EGBE6q68mwxJ6jQcosE2GTJT3iJgrJmmZ5iUOJ19jxscVVlPj/SThiDtIF6VKoKQYsn+/uw5w6tAl1o1aEw8r+zvdEmI1YS8QwHoWgs8BLe6sMkzjn648ZVpaShSdCOSM5c+QtuccGXRXQFoaPSp7QqXX/EjfrLPrbxAW378+JlTZlecIbMEOFzxGepisVVwHhuBasSeIDVrMXVvUYz2rLPkvdm1xLukq8+00yhNjdVGuXeQCNIpJLN9z/RHASYs6XU9QDiVmhDLTUAGjCqQfVHHjPnz33ETzYxREpe8EdtFVUBYkHuLL7Nn93eq9iSxyhYYt8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.23; Thu, 15 Aug 2019 09:36:16 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 09:36:15 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] dma-buf: Restore seqlock around dma_resv updates
Thread-Topic: [PATCH] dma-buf: Restore seqlock around dma_resv updates
Thread-Index: AQHVUs3Z+oiu5la2tk2cvKtjr6tsvKb7EkAAgADh3wA=
Date: Thu, 15 Aug 2019 09:36:15 +0000
Message-ID: <fd58623d-23ef-e107-895b-4ee36c044cc6@amd.com>
References: <20190814182401.25009-1-chris@chris-wilson.co.uk>
 <156580720475.2301.10315695252933421468@skylake-alporthouse-com>
 <20190814200742.GX7444@phenom.ffwll.local>
In-Reply-To: <20190814200742.GX7444@phenom.ffwll.local>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2PR09CA0024.eurprd09.prod.outlook.com
 (2603:10a6:101:16::36) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee28c77f-7d1b-4f68-666d-08d7216404b3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1418; 
x-ms-traffictypediagnostic: DM5PR12MB1418:
x-microsoft-antispam-prvs: <DM5PR12MB1418D35E197EA56EFF3B1EA983AC0@DM5PR12MB1418.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(189003)(199004)(446003)(8676002)(476003)(81166006)(71190400001)(6116002)(81156014)(99286004)(65806001)(31686004)(2906002)(186003)(71200400001)(65826007)(6436002)(2616005)(229853002)(5660300002)(486006)(11346002)(36756003)(14444005)(6486002)(256004)(46003)(64126003)(7736002)(305945005)(64756008)(58126008)(14454004)(65956001)(6246003)(66476007)(25786009)(66556008)(66946007)(6512007)(4326008)(53936002)(52116002)(86362001)(110136005)(316002)(66446008)(76176011)(102836004)(8936002)(6506007)(386003)(478600001)(31696002)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1418;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VFuNjxH2eRE4RGdAj/adRR3aYxwEj6kEbv4DLMPG7PPAVBXGuwEYzkrYhoX/+hdUvgkfCPZFF0UYyqNDEr5yVfIGDeWOzxM7Dt5m/eNC+etIwk7gPfZzFLSA+vGE0Ip2XNV4iJkTidBdz/XLJ1XYj3U9rs/QgDF1GVrFCod+iPcXs3n59rgAVRwpdUmRNP7d2C3HZZp9/7xu+I/ZsD9zOkzAcLB+cK+AQYsblwaUAYEvfo8z9Bjyh9t9WdL73bMBODFs7zy/pMfCSct05CQX5ZMBE0p06KYvdFYlLZnD2RM7OihCnRtY0llqozJZC0rgIzcjHUqMs5slLw853jYxpwJfXuNY1jOBUidxMdpOBgUSWeFVm0eEisWM3SALehqLp7tgb6gBSjxMwhHC9z/A02LONskGT/VYgSBElnGF2xI=
x-ms-exchange-transport-forked: True
Content-ID: <5947BA05B24277498B6A35399472090D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee28c77f-7d1b-4f68-666d-08d7216404b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 09:36:15.8695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nts6aUsAzOo8EjMFC9Z9eTLA5H45d4lnPH7khWWc5Bx4aZh6KR5P7lzmR0BpKB76
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1418
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxRBDLF9zc8JNeQgfypWeIzPKz+lFBVEhpbPLk9rqZ0=;
 b=rRECjNmg6bizf4vjCfgBjXmTWO+jplZj+J0XyJ6gv3+4hukM7VfvJOB9lvHaxn12c/CitMTq0FopVcaE1D6bxlOvtbd3Emvhm5ZTFsr9LUAnj2JU3UhXC8gJ6COeA4B/U09kS5yifshymaH161fPW2ERHfEm+4x3+UXow/mWw9M=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTQuMDguMTkgdW0gMjI6MDcgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBXZWQsIEF1
ZyAxNCwgMjAxOSBhdCAwNzoyNjo0NFBNICswMTAwLCBDaHJpcyBXaWxzb24gd3JvdGU6DQo+PiBR
dW90aW5nIENocmlzIFdpbHNvbiAoMjAxOS0wOC0xNCAxOToyNDowMSkNCj4+PiBUaGlzIHJldmVy
dHMNCj4+PiA2N2M5N2ZiNzlhN2YgKCJkbWEtYnVmOiBhZGQgcmVzZXJ2YXRpb25fb2JqZWN0X2Zl
bmNlcyBoZWxwZXIiKQ0KPj4+IGRkN2E3ZDFmZjJmMSAoImRybS9pOTE1OiB1c2UgbmV3IHJlc2Vy
dmF0aW9uX29iamVjdF9mZW5jZXMgaGVscGVyIikNCj4+PiAwZTFkODA4M2JkZGIgKCJkbWEtYnVm
OiBmdXJ0aGVyIHJlbGF4IHJlc2VydmF0aW9uX29iamVjdF9hZGRfc2hhcmVkX2ZlbmNlIikNCj4+
PiA1ZDM0NGY1OGRhNzYgKCJkbWEtYnVmOiBudWtlIHJlc2VydmF0aW9uX29iamVjdCBzZXEgbnVt
YmVyIikNCj4gT2ggSSBkaWRuJ3QgcmVhbGl6ZSB0aGV5IGxhbmRlZCBhbHJlYWR5Lg0KPg0KPj4+
IFRoZSBzY2VuYXJpbyB0aGF0IGRlZmVhdHMgc2ltcGx5IGdyYWJiaW5nIGEgc2V0IG9mIHNoYXJl
ZC9leGNsdXNpdmUNCj4+PiBmZW5jZXMgYW5kIHVzaW5nIHRoZW0gYmxpc3NmdWxseSB1bmRlciBS
Q1UgaXMgdGhhdCBhbnkgb2YgdGhvc2UgZmVuY2VzDQo+Pj4gbWF5IGJlIHJlYWxsb2NhdGVkIGJ5
IGEgU0xBQl9UWVBFU0FGRV9CWV9SQ1UgZmVuY2Ugc2xhYiBjYWNoZS4gSW4gdGhpcw0KPj4+IHNj
ZW5hcmlvLCB3aGlsZSBrZWVwaW5nIHRoZSByY3VfcmVhZF9sb2NrIHdlIG5lZWQgdG8gZXN0YWJs
aXNoIHRoYXQgbm8NCj4+PiBmZW5jZSB3YXMgY2hhbmdlZCBpbiB0aGUgZG1hX3Jlc3YgYWZ0ZXIg
YSByZWFkIChvciBmdWxsKSBtZW1vcnkgYmFycmllci4NCj4gU28gaWYgSSdtIHJlYWRpbmcgY29y
cmVjdGx5IHdoYXQgQ2hyaXMgaXMgc2F5aW5nIGhlcmUgSSBndWVzcyBteSBoYWxmDQo+IGNvbW1l
bnQgaW4gdGhhdCBvdGhlciB0aHJlYWQgcG9pbnRlZCBhdCBhIHJlYWwgb3ZlcnNpZ2h0LiBTaW5j
ZSBJIHN0aWxsDQo+IGhhdmVuJ3QgY2hlY2tlZCBhbmQgaXQncyB0b28gbGF0ZSBmb3IgcmVhbCBy
ZXZpZXcgbm90IG1vcmUgZm9yIG5vdy4NCg0KWWVhaCwgdGhlIHJvb3Qgb2YgdGhlIHByb2JsZW0g
aXMgdGhhdCBJIGRpZG4ndCByZWFsaXplZCB0aGF0IGZlbmNlcyANCmNvdWxkIGJlIHJldXNlZCB3
aGlsZSBpbiB0aGUgUkNVIGdyYWNlIHBlcmlvZC4NCg0KTmVlZCB0byBnbyBhIHN0ZXAgYmFjayBh
bmQgdHJ5IHRvIGNvbWUgdXAgd2l0aCBhIGNvbXBsZXRlIG5ldyBhcHByb2FjaCANCmZvciBzeW5j
aHJvbml6YXRpb24uDQoNCj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNo
cmlzLXdpbHNvbi5jby51az4NCj4+PiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+DQo+PiBJIHNhaWQgSSBuZWVkZWQgdG8gZ28gbGllIGRvd24sIHRoYXQgcHJvdmVz
IGl0Lg0KPiBZZWFoIEkgZ3Vlc3Mgd2UgbmVlZCB0byB3YWl0IGZvciBDaHJpc3RpYW4gdG8gd2Fr
ZSB1cCBhbiBoYXZlIGEgd29ya2luZw0KPiBicmFpbi4NCg0KV2VsbCBpbiB0aGF0IGNhc2UgeW91
IHdpbGwgbmVlZCB0byB3YWl0IGZvciBhIGZldyBtb3JlIHllYXJzIGZvciBteSBraWRzIA0KdG8g
ZW50ZXIgc2Nob29sIGFnZSA6KQ0KDQpDaGVlcnMsDQpDaHJpc3RpYW4uDQoNCj4gLURhbmllbA0K
Pg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
