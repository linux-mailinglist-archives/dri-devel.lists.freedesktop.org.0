Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 608A490818
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 21:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B5E6E98A;
	Fri, 16 Aug 2019 19:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790089.outbound.protection.outlook.com [40.107.79.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74C26E98A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 19:10:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/qprxtk4kdT6+bhABus+0twFPNOfsdJuX/VzyBeLwE46Kb0FcOROCDeNWlhgU9Z7okvtVKLxLAjjdN9Lk7PC6a79Nw4XXajmiDqnhKIj/f8t9sON0DOR44/mTdTWzjCtBnuRhCtShTg+BBG8XfS2bzyRKgfKYTjmuvNjWK9C9vK62eVJOS7UAXnbYxX7wxWgMv58lq9LmiDfksosdou7kf1mJIrUDEQ1+jSao8R8ao7Mv7T3TA44cOmK4UWEdyNqcOqZQni4woXmdvZFfMCIvU6OBULgJwNKClcmWhmOBGQQrbQZJm3eAooCgRrG4wfDB4EPoaqbDAHgh4a44vkzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YD5lKnpLW+0b9j5khrDnhYUh7rWO18E387xNvxBd1U=;
 b=MlCYkgXhMGOaCvKlozlm7tmNCTj4peQGPTnoaNYtPg32CLOTGhLiNrOopLG9ULSZfeSs7jxuMBI0/5Gil6svoLA93kUaD6cqmpTLXn8J6RDPKOhNAr2ncioT6zlUZhjBwLGWCav0AaDRjqAm0G/5NKGGNpJMmf1QhPLQ2hDadTdWhVKI7P2o9zLnEoAyI7zHalsLw6i9aOqWi5IWvGdV7GXNSNGBq2H5YKtGl5G1hFlrP+bzagfLMqcre2yU/v1CiTLHOOhmcoIGMEFi8g0gzRaSk13xz3HSmH0KMS/E/BCzAnh8Tzok+r3ah9/zpLA/tbA5TBEfRqGnjLX5VRDCSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1785.namprd12.prod.outlook.com (10.175.87.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Fri, 16 Aug 2019 19:10:20 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 19:10:20 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Brian Welty <brian.welty@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: Refactor ttm_bo_pipeline_move
Thread-Topic: [PATCH] drm/ttm: Refactor ttm_bo_pipeline_move
Thread-Index: AQHVVGSWzJz0lb2MS0yrzlR+WEee3ab+I6yA
Date: Fri, 16 Aug 2019 19:10:19 +0000
Message-ID: <02b4b437-b954-63ef-bc7d-080a0af261bf@amd.com>
References: <20190816185916.30184-1-brian.welty@intel.com>
In-Reply-To: <20190816185916.30184-1-brian.welty@intel.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::15) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be508f5b-bf98-4904-4851-08d7227d616d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1785; 
x-ms-traffictypediagnostic: DM5PR12MB1785:
x-microsoft-antispam-prvs: <DM5PR12MB17855F04EE4D55F7ACA8F3AF83AF0@DM5PR12MB1785.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(199004)(189003)(8936002)(2501003)(71200400001)(316002)(81166006)(6116002)(6512007)(31686004)(65806001)(8676002)(5660300002)(71190400001)(65826007)(99286004)(110136005)(86362001)(6436002)(478600001)(2906002)(65956001)(229853002)(25786009)(81156014)(6486002)(53936002)(66946007)(14454004)(6246003)(76176011)(102836004)(11346002)(305945005)(446003)(66446008)(66556008)(2616005)(31696002)(7736002)(486006)(476003)(64756008)(58126008)(52116002)(256004)(66476007)(6506007)(64126003)(36756003)(386003)(46003)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1785;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KaGy6PlAVo1k8LNfWISDrWuqM4zYVKplfVIScp3nAA59tkSl7+v4j0cMfYQNlokA22soIg2AYRlrA2mrE+UTUNxEXl/KlL6WhuDDbcJPq8YRTaXc4vQDFAv4crCKPIpgv0cFgXvBXhUPRdv+98VP0l32SO/Oe/3MAT9x5cpiiBBKP7BaM6S8TaCZfudxRT9lKhiNVYsOso2cNYPXuR4dKPlogZohNGSHOMCoSOQvEJEFG4uqAELNHCYVsSabXZIdRD1jv++HgbeXzvN8L4oUZF6r7xJ/yUcAH7gGjadomnd/+Uxg0uZjy9S6FGOPChc71yw34sqN7ddX2+ejyvnGaQPGLI92ZAqHyrYIhQ7ioQLJgsTMGt952pXvvZ+PNRVGs+tzM1WJyX1Xe/qVz0mU9w8B9q7qgX8cJoSk5FM8jyI=
x-ms-exchange-transport-forked: True
Content-ID: <59DC1F458465524CBD4ADF56407AEF5B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be508f5b-bf98-4904-4851-08d7227d616d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 19:10:19.8901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: obVthHBZNDeDjz6m1WJKGGJpQ8wYPun4Z3p0RsO9cWvCu3ghTXvDmkv2d+ol+UKs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1785
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YD5lKnpLW+0b9j5khrDnhYUh7rWO18E387xNvxBd1U=;
 b=am0eksGhPmUZDrgEE6vu908BYuiWwZkEf+/GEhxtC3XK8Gf14c+6II3liCSAUh5kww044iZVnYQd+56jEZ5xwNgcFre/3VaG51xr4+Qtqvs6JDHnhmqB+Q64anU+4DiqsrSBRWiZvgzGJzGJg95ENORCNNBCX+exoj0l6GSKkLY=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMDguMTkgdW0gMjA6NTkgc2NocmllYiBCcmlhbiBXZWx0eToNCj4gdHRtX2JvX3BpcGVs
aW5lX21vdmUgbmVlZGxlc3NseSBkdXBsaWNhdGVzIGNvZGUuIFJlZmFjdG9yIHRoaXMgdG8NCj4g
aW5zdGVhZCBjYWxsIHR0bV9ib19tb3ZlX2FjY2VsX2NsZWFudXAuDQo+DQo+IFNpZ25lZC1vZmYt
Ynk6IEJyaWFuIFdlbHR5IDxicmlhbi53ZWx0eUBpbnRlbC5jb20+DQoNCkF0IGxlYXN0IG9mIGhh
bmQgdGhhdCBsb29rcyB2YWxpZCB0byBtZSwgUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcg
DQo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiBmb3Igbm93Lg0KDQpSZWdhcmRzLA0KQ2hyaXN0
aWFuLg0KDQo+DQo+IC0tLQ0KPiBCdWlsZHMgYnV0IG90aGVyd2lzZSBjdXJyZW50bHkgdW50ZXN0
ZWQuDQo+IENhbWUgYWNyb3NzIHRoaXMgZHVwbGljYXRpb24gYW5kIHRob3VnaHQgd291bGQgc2Vl
IGlmIG90aGVycyBjYXJlZA0KPiB0byBzZWUgaXQgY2xlYW5lZCB1cCB0aGlzIHdheSBvciBub3Qu
DQo+DQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jIHwgNjQgKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDU5IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm9fdXRpbC5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jDQo+IGlu
ZGV4IGZlODFjNTY1ZTdlZi4uMDg2YmEyYzJmNjBiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9ib191dGlsLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym9fdXRpbC5jDQo+IEBAIC03NDYsNDkgKzc0NiwxMCBAQCBpbnQgdHRtX2JvX3BpcGVsaW5lX21v
dmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywNCj4gICB7DQo+ICAgCXN0cnVjdCB0dG1f
Ym9fZGV2aWNlICpiZGV2ID0gYm8tPmJkZXY7DQo+ICAgCXN0cnVjdCB0dG1fbWVtX3JlZyAqb2xk
X21lbSA9ICZiby0+bWVtOw0KPiAtDQo+ICAgCXN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAq
ZnJvbSA9ICZiZGV2LT5tYW5bb2xkX21lbS0+bWVtX3R5cGVdOw0KPiAtCXN0cnVjdCB0dG1fbWVt
X3R5cGVfbWFuYWdlciAqdG8gPSAmYmRldi0+bWFuW25ld19tZW0tPm1lbV90eXBlXTsNCj4gLQ0K
PiAtCWludCByZXQ7DQo+IC0NCj4gLQlkbWFfcmVzdl9hZGRfZXhjbF9mZW5jZShiby0+YmFzZS5y
ZXN2LCBmZW5jZSk7DQo+IC0NCj4gLQlpZiAoIWV2aWN0KSB7DQo+IC0JCXN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqZ2hvc3Rfb2JqOw0KPiAtDQo+IC0JCS8qKg0KPiAtCQkgKiBUaGlzIHNob3Vs
ZCBoZWxwIHBpcGVsaW5lIG9yZGluYXJ5IGJ1ZmZlciBtb3Zlcy4NCj4gLQkJICoNCj4gLQkJICog
SGFuZyBvbGQgYnVmZmVyIG1lbW9yeSBvbiBhIG5ldyBidWZmZXIgb2JqZWN0LA0KPiAtCQkgKiBh
bmQgbGVhdmUgaXQgdG8gYmUgcmVsZWFzZWQgd2hlbiB0aGUgR1BVDQo+IC0JCSAqIG9wZXJhdGlv
biBoYXMgY29tcGxldGVkLg0KPiAtCQkgKi8NCj4gLQ0KPiAtCQlkbWFfZmVuY2VfcHV0KGJvLT5t
b3ZpbmcpOw0KPiAtCQliby0+bW92aW5nID0gZG1hX2ZlbmNlX2dldChmZW5jZSk7DQo+ICAgDQo+
IC0JCXJldCA9IHR0bV9idWZmZXJfb2JqZWN0X3RyYW5zZmVyKGJvLCAmZ2hvc3Rfb2JqKTsNCj4g
LQkJaWYgKHJldCkNCj4gLQkJCXJldHVybiByZXQ7DQo+IC0NCj4gLQkJZG1hX3Jlc3ZfYWRkX2V4
Y2xfZmVuY2UoZ2hvc3Rfb2JqLT5iYXNlLnJlc3YsIGZlbmNlKTsNCj4gLQ0KPiAtCQkvKioNCj4g
LQkJICogSWYgd2UncmUgbm90IG1vdmluZyB0byBmaXhlZCBtZW1vcnksIHRoZSBUVE0gb2JqZWN0
DQo+IC0JCSAqIG5lZWRzIHRvIHN0YXkgYWxpdmUuIE90aGVyd2hpc2UgaGFuZyBpdCBvbiB0aGUg
Z2hvc3QNCj4gLQkJICogYm8gdG8gYmUgdW5ib3VuZCBhbmQgZGVzdHJveWVkLg0KPiAtCQkgKi8N
Cj4gLQ0KPiAtCQlpZiAoISh0by0+ZmxhZ3MgJiBUVE1fTUVNVFlQRV9GTEFHX0ZJWEVEKSkNCj4g
LQkJCWdob3N0X29iai0+dHRtID0gTlVMTDsNCj4gLQkJZWxzZQ0KPiAtCQkJYm8tPnR0bSA9IE5V
TEw7DQo+IC0NCj4gLQkJdHRtX2JvX3VucmVzZXJ2ZShnaG9zdF9vYmopOw0KPiAtCQl0dG1fYm9f
cHV0KGdob3N0X29iaik7DQo+IC0NCj4gLQl9IGVsc2UgaWYgKGZyb20tPmZsYWdzICYgVFRNX01F
TVRZUEVfRkxBR19GSVhFRCkgew0KPiArCWlmIChldmljdCAmJiBmcm9tLT5mbGFncyAmIFRUTV9N
RU1UWVBFX0ZMQUdfRklYRUQpIHsNCj4gKwkJZG1hX3Jlc3ZfYWRkX2V4Y2xfZmVuY2UoYm8tPmJh
c2UucmVzdiwgZmVuY2UpOw0KPiAgIA0KPiAgIAkJLyoqDQo+ICAgCQkgKiBCTyBkb2Vzbid0IGhh
dmUgYSBUVE0gd2UgbmVlZCB0byBiaW5kL3VuYmluZC4gSnVzdCByZW1lbWJlcg0KPiBAQCAtODA3
LDI3ICs3NjgsMTIgQEAgaW50IHR0bV9ib19waXBlbGluZV9tb3ZlKHN0cnVjdCB0dG1fYnVmZmVy
X29iamVjdCAqYm8sDQo+ICAgCQlkbWFfZmVuY2VfcHV0KGJvLT5tb3ZpbmcpOw0KPiAgIAkJYm8t
Pm1vdmluZyA9IGRtYV9mZW5jZV9nZXQoZmVuY2UpOw0KPiAgIA0KPiArCQkqb2xkX21lbSA9ICpu
ZXdfbWVtOw0KPiArCQluZXdfbWVtLT5tbV9ub2RlID0gTlVMTDsNCj4gICAJfSBlbHNlIHsNCj4g
LQkJLyoqDQo+IC0JCSAqIExhc3QgcmVzb3J0LCB3YWl0IGZvciB0aGUgbW92ZSB0byBiZSBjb21w
bGV0ZWQuDQo+IC0JCSAqDQo+IC0JCSAqIFNob3VsZCBuZXZlciBoYXBwZW4gaW4gcHJhdGljZS4N
Cj4gLQkJICovDQo+IC0NCj4gLQkJcmV0ID0gdHRtX2JvX3dhaXQoYm8sIGZhbHNlLCBmYWxzZSk7
DQo+IC0JCWlmIChyZXQpDQo+IC0JCQlyZXR1cm4gcmV0Ow0KPiAtDQo+IC0JCWlmICh0by0+Zmxh
Z3MgJiBUVE1fTUVNVFlQRV9GTEFHX0ZJWEVEKSB7DQo+IC0JCQl0dG1fdHRfZGVzdHJveShiby0+
dHRtKTsNCj4gLQkJCWJvLT50dG0gPSBOVUxMOw0KPiAtCQl9DQo+IC0JCXR0bV9ib19mcmVlX29s
ZF9ub2RlKGJvKTsNCj4gKwkJcmV0dXJuIHR0bV9ib19tb3ZlX2FjY2VsX2NsZWFudXAoYm8sIGZl
bmNlLCBldmljdCwgbmV3X21lbSk7DQo+ICAgCX0NCj4gICANCj4gLQkqb2xkX21lbSA9ICpuZXdf
bWVtOw0KPiAtCW5ld19tZW0tPm1tX25vZGUgPSBOVUxMOw0KPiAtDQo+ICAgCXJldHVybiAwOw0K
PiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MKHR0bV9ib19waXBlbGluZV9tb3ZlKTsNCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
