Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEBCC42E7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 23:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F7686E443;
	Tue,  1 Oct 2019 21:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730043.outbound.protection.outlook.com [40.107.73.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2C76E0A6;
 Tue,  1 Oct 2019 21:46:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mr+1uGa6iEmVyQN+uli7nXvK4RaxPbtF7bpPZo1Zi2DEE2QpZekzjTzvDY/759h9PScO8OTx/Rw+J7oQGe5sHv6QevItXhdNy4vFl0F9n0abadZcbrUHzko2BBh9wQAXORd1MFCOYWD+HuwZYmPbgGN0GpoTsB3DJi22hGznHXCsyQX0zO0jy1bim7LvrkSSXsU1vIPFJf34TRROjv8qNhSqTlQu856ihrxaVAuAR7tji4icpU+FyCVMi80p+dlg5Hbpanp5C6QCvFU/rSPV9LDDa5s+Jz33c0ZkKQSTQOCGwlyv8eW2Y/qf+8vrngLzjug98Ufi5Ne7c6mNw6cruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjMRicUdyrLleIH+8oTNMP1q6VQJnNWPq2tJou1gvIs=;
 b=nzf7u3STjHORxjfp8duO+mJnebXawCz7N3a0722Rr8Pk/hltDhHn4nJ6ugEwVLiHGo4SEfKukHADnKzQFpLl+Csh5RNB9r5s59MhGth4imsO00sT3R9W0XDdsaNv8eLINkZrXspbMW3tOPYFFop07DpPZCzczZCR9KhKw7ZPTtrDTslhCu9ojckWmnFvDH4F4NY8s/bnmORmsfgBzH7c5ztF+zPjH5ytiHJiZ3klIsbKGJnXdiBW5nbJ8ip92Ah+Wa015pZSv4LbS0XdF8InOptebAmY/j2wJr50iPREcGIiPawrx2oN6zUhJR9WKHRYvNb5n1dPMCaeAyEx1J9p9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2456.namprd12.prod.outlook.com (52.132.141.37) by
 DM5PR12MB1564.namprd12.prod.outlook.com (10.172.39.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:46:26 +0000
Received: from DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::3449:def:4457:5b72]) by DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::3449:def:4457:5b72%3]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:46:26 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/amdgpu: fix structurally dead code vcn_v2_5_hw_init
Thread-Topic: [PATCH] drm/amdgpu: fix structurally dead code vcn_v2_5_hw_init
Thread-Index: AQHVeHwU+1a8umxE5EyQDrqeTbYcDKdGTaMAgAAD4ACAAADbAA==
Date: Tue, 1 Oct 2019 21:46:26 +0000
Message-ID: <dc76a52b-09a2-7ab9-b53e-52500f4f8669@amd.com>
References: <20191001171635.GA17306@embeddedor>
 <192815d9-5ecb-09a7-4624-5fd36126890d@amd.com>
 <823b10a3-fe0e-2e8c-02c3-534944dbe6d2@embeddedor.com>
In-Reply-To: <823b10a3-fe0e-2e8c-02c3-534944dbe6d2@embeddedor.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTXPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::17) To DM5PR12MB2456.namprd12.prod.outlook.com
 (2603:10b6:4:b4::37)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 687ec132-4d8a-4f2e-05a6-08d746b8cf3c
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1564:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1564DB11D00F02748A426462E59D0@DM5PR12MB1564.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(199004)(189003)(476003)(305945005)(6486002)(486006)(186003)(81166006)(8936002)(8676002)(81156014)(7736002)(2906002)(65806001)(229853002)(26005)(66066001)(25786009)(14454004)(3846002)(65956001)(6436002)(478600001)(6116002)(66556008)(66446008)(6246003)(99286004)(386003)(53546011)(31696002)(6512007)(76176011)(66946007)(58126008)(64756008)(4326008)(71190400001)(110136005)(5660300002)(102836004)(11346002)(52116002)(71200400001)(54906003)(66476007)(36756003)(6506007)(316002)(31686004)(256004)(86362001)(2616005)(446003)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1564;
 H:DM5PR12MB2456.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /6KY2wcxSUKqD2jrxKgv1I3gf7WjmhTG2OwxZmAKY6NGo2KGCuZ2JeAook0okxrzZEMm6s3y8Xv/PzIiPUGiZZT0XfH08vH0z8X8mTLy3KszqBhOGEQxdPIUqrsiycE+8L6vzNcPpyUHsiTCOoyJZmLu9XbEQE9mZ0CZC96hLEr9v3g+Sts9n6mJ/50qDQWKnPrnIDawEKlyky/6Ay6+lP+PPyl4mBYqnca59pUa/jMgwaWhv9mlN9EkO5NgI5CSlp0pnIlD+hdJyFdcWck5wEhJDDNK5UwPrQKxkweuNc2rZcQ4S6W1y7tQKGcPsnnUqPWRU2GcX+EslhJgbXSiI5DTwO1jBVFWjn0mAsNzZtBsFhO9x2Ryz4Jvi2JCnHsYOADc/4M5WfbYM7sEaJoNIF182t2MUfu9PugFWlVnPrE=
Content-ID: <1FC97F3F91534145A5FB569298E79834@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 687ec132-4d8a-4f2e-05a6-08d746b8cf3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:46:26.2327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BzT9F6K/FCrAXSt2Gs9FkVWfOnoy1KShzmMMMvRIhAv4KzwUBau3urXOjn7X+5Cf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1564
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjMRicUdyrLleIH+8oTNMP1q6VQJnNWPq2tJou1gvIs=;
 b=ZXYSzQFlvZDIqzNvU/cadFdu55qBiCzNBYNib/mrkoGjD91iYqv3P9/QPz+xeF04kO+BueXmRllxrfMwT4UX5hivqIz27bowFHKVTYYclizk54gSjXz8jub8sSgsadFcNlqcoTfNkBwzjtDOu43WoKdGo/WCuNxwUzRIBzqNuuI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Leo.Liu@amd.com; 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiAyMDE5LTEwLTAxIDU6NDMgcC5tLiwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToNCj4g
SGksDQo+DQo+IE9uIDEwLzEvMTkgMTY6MjksIExpdSwgTGVvIHdyb3RlOg0KPj4gT24gMjAxOS0x
MC0wMSAxOjE2IHAubS4sIEd1c3Rhdm8gQS4gUi4gU2lsdmEgd3JvdGU6DQo+Pj4gTm90aWNlIHRo
YXQgdGhlcmUgaXMgYSAqY29udGludWUqIHN0YXRlbWVudCBpbiB0aGUgbWlkZGxlIG9mIHRoZQ0K
Pj4+IGZvciBsb29wIGFuZCB0aGF0IHByZXZlbnRzIHRoZSBjb2RlIGJlbG93IGZyb20gZXZlciBi
ZWluZyByZWFjaGVkOg0KPj4+DQo+Pj4gCXIgPSBhbWRncHVfcmluZ190ZXN0X3JpbmcocmluZyk7
DQo+Pj4gCWlmIChyKSB7DQo+Pj4gCQlyaW5nLT5zY2hlZC5yZWFkeSA9IGZhbHNlOw0KPj4+IAkJ
Z290byBkb25lOw0KPj4+IAl9DQo+Pj4NCj4+PiBGaXggdGhpcyBieSByZW1vdmluZyB0aGUgY29u
dGludWUgc3RhdGVtZW50IGFuZCB1cGRhdGluZyByaW5nLT5zY2hlZC5yZWFkeQ0KPj4+IHRvIHRy
dWUgYmVmb3JlIGNhbGxpbmcgYW1kZ3B1X3JpbmdfdGVzdF9yaW5nKHJpbmcpLg0KPj4+DQo+Pj4g
Tm90aWNlIHRoYXQgdGhpcyBmaXggaXMgYmFzZWQgb24NCj4+PiBjb21taXQgMWI2MWRlNDVkZmFm
ICgiZHJtL2FtZGdwdTogYWRkIGluaXRpYWwgVkNOMi4wIHN1cHBvcnQgKHYyKSIpDQo+Pj4NCj4+
PiBBZGRyZXNzZXMtQ292ZXJpdHktSUQgMTQ4NTYwOCAoIlN0cnVjdHVyYWxseSBkZWFkIGNvZGUi
KQ0KPj4+IEZpeGVzOiAyOGMxN2Q3MjA3MmIgKCJkcm0vYW1kZ3B1OiBhZGQgVkNOMi41IGJhc2lj
IHN1cHBvcnRzIikNCj4+PiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0
YXZvQGVtYmVkZGVkb3IuY29tPg0KPj4+IC0tLQ0KPj4+DQo+Pj4gQW55IGZlZWRiYWNrIGlzIGdy
ZWF0bHkgYXBwcmVjaWF0ZWQuDQo+Pj4NCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS92Y25fdjJfNS5jIHwgNSArKystLQ0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zj
bl92Ml81LmMNCj4+PiBpbmRleCAzOTVjMjI1OWY5NzkuLjQ3YjBkY2Q1OWUxMyAxMDA2NDQNCj4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jDQo+Pj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYw0KPj4+IEBAIC0yNTgsNiArMjU4
LDcgQEAgc3RhdGljIGludCB2Y25fdjJfNV9od19pbml0KHZvaWQgKmhhbmRsZSkNCj4+PiAgICAJ
CWFkZXYtPm5iaW9fZnVuY3MtPnZjbl9kb29yYmVsbF9yYW5nZShhZGV2LCByaW5nLT51c2VfZG9v
cmJlbGwsDQo+Pj4gICAgCQkJCQkJICAgICByaW5nLT5kb29yYmVsbF9pbmRleCwgaik7DQo+Pj4g
ICAgDQo+Pj4gKwkJcmluZy0+c2NoZWQucmVhZHkgPSB0cnVlOw0KPj4gVGhpcyBpcyByZWR1bmRh
bnQuIGFsbCB0aGUgc2NoZWQtPnJlYWR5IGlzIGluaXRpYWxpemVkIGFzIHRydWUsIHBsZWFzZQ0K
Pj4gcmVmZXIgdG8gZHJtX3NjaGVkX2luaXQoKQ0KPj4NCj4gSSBzZWUuLi4gc28gaW4gdGhlIGZv
bGxvd2luZyBjb21taXQgMWI2MWRlNDVkZmFmICgiZHJtL2FtZGdwdTogYWRkIGluaXRpYWwgVkNO
Mi4wIHN1cHBvcnQgKHYyKSIpDQo+IHRoYXQgbGluZSBpcyBhbHNvIHJlZHVuZGFudD8NCg0KWWVz
Lg0KDQoNCj4+PiAgICAJCXIgPSBhbWRncHVfcmluZ190ZXN0X3JpbmcocmluZyk7DQo+Pj4gICAg
CQlpZiAocikgew0KPj4+ICAgIAkJCXJpbmctPnNjaGVkLnJlYWR5ID0gZmFsc2U7DQo+Pj4gQEAg
LTI2Niw4ICsyNjcsNyBAQCBzdGF0aWMgaW50IHZjbl92Ml81X2h3X2luaXQodm9pZCAqaGFuZGxl
KQ0KPj4+ICAgIA0KPj4+ICAgIAkJZm9yIChpID0gMDsgaSA8IGFkZXYtPnZjbi5udW1fZW5jX3Jp
bmdzOyArK2kpIHsNCj4+PiAgICAJCQlyaW5nID0gJmFkZXYtPnZjbi5pbnN0W2pdLnJpbmdfZW5j
W2ldOw0KPj4+IC0JCQlyaW5nLT5zY2hlZC5yZWFkeSA9IGZhbHNlOw0KPj4+IC0JCQljb250aW51
ZTsNCj4+PiArCQkJcmluZy0+c2NoZWQucmVhZHkgPSB0cnVlOw0KPj4gQmVjYXVzZSB0aGUgVkNO
IDIuNSBGVyBzdGlsbCBoYXMgaXNzdWUgZm9yIGVuY29kZSwgc28gd2UgaGF2ZSBpdA0KPj4gZGlz
YWJsZWQgaGVyZS4NCj4+DQo+IE9LLiBTbywgbWF5YmUgd2UgY2FuIGFkZCBhIGNvbW1lbnQgcG9p
bnRpbmcgdGhhdCBvdXQ/DQoNClRoYXQgY291bGQgYmUgYmV0dGVyLg0KDQpUaGFua3MsDQpMZW8N
Cg0KDQo+DQo+IFRoYW5rcw0KPiAtLQ0KPiBHdXN0YXZvDQo+DQo+Pj4gICAgCQkJciA9IGFtZGdw
dV9yaW5nX3Rlc3RfcmluZyhyaW5nKTsNCj4+PiAgICAJCQlpZiAocikgew0KPj4+ICAgIAkJCQly
aW5nLT5zY2hlZC5yZWFkeSA9IGZhbHNlOw0KPj4+IEBAIC0yNzYsNiArMjc2LDcgQEAgc3RhdGlj
IGludCB2Y25fdjJfNV9od19pbml0KHZvaWQgKmhhbmRsZSkNCj4+PiAgICAJCX0NCj4+PiAgICAN
Cj4+PiAgICAJCXJpbmcgPSAmYWRldi0+dmNuLmluc3Rbal0ucmluZ19qcGVnOw0KPj4+ICsJCXJp
bmctPnNjaGVkLnJlYWR5ID0gdHJ1ZTsNCj4+PiAgICAJCXIgPSBhbWRncHVfcmluZ190ZXN0X3Jp
bmcocmluZyk7DQo+Pj4gICAgCQlpZiAocikgew0KPj4+ICAgIAkJCXJpbmctPnNjaGVkLnJlYWR5
ID0gZmFsc2U7DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
