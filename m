Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DCA3F0973
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 18:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB7E6E868;
	Wed, 18 Aug 2021 16:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B11C6E869;
 Wed, 18 Aug 2021 16:44:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="216405735"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="216405735"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 09:44:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="511300784"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 18 Aug 2021 09:44:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 18 Aug 2021 09:44:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 18 Aug 2021 09:44:44 -0700
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2242.010;
 Wed, 18 Aug 2021 09:44:44 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "drawat@vmware.com" <drawat@vmware.com>, "Vetter, Daniel"
 <daniel.vetter@intel.com>, "robdclark@gmail.com" <robdclark@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Mun,
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/damage_helper: Fix handling of cursor
 dirty buffers
Thread-Topic: [Intel-gfx] [PATCH] drm/damage_helper: Fix handling of cursor
 dirty buffers
Thread-Index: AQHXk76RTugs2zf9hEmcsOiXYad+hKt5e9OAgAB0GoA=
Date: Wed, 18 Aug 2021 16:44:44 +0000
Message-ID: <33375174e318c2772c0d5053ad6d7fd10bef8c49.camel@intel.com>
References: <20210817232604.160029-1-jose.souza@intel.com>
 <YRzYv6lj5k3KOrPC@phenom.ffwll.local>
In-Reply-To: <YRzYv6lj5k3KOrPC@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A1423858BB57D4E89E24B9ADF80A147@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIxLTA4LTE4IGF0IDExOjU0ICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0K
PiBPbiBUdWUsIEF1ZyAxNywgMjAyMSBhdCAwNDoyNjowNFBNIC0wNzAwLCBKb3PDqSBSb2JlcnRv
IGRlIFNvdXphIHdyb3RlOg0KPiA+IEN1cnNvcnMgZG9uJ3QgaGF2ZSBhIGZyYW1lYnVmZmVyIHNv
IHRoZSBmYiBjb21wYXJpc3NvbiB3YXMgYWx3YXlzDQo+ID4gZmFpbGluZyBhbmQgYXRvbWljIHN0
YXRlIHdhcyBiZWluZyBjb21taXR0ZWQgd2l0aG91dCBhbnkgcGxhbmUgc3RhdGUuDQo+ID4gDQo+
ID4gU28gaGVyZSBjaGVja2luZyBpZiBvYmplY3RzIG1hdGNoIHdoZW4gY2hlY2tpbmcgY3Vyc29y
cy4NCj4gDQo+IFRoaXMgbG9va3MgZXh0cmVtZWx5IGJhY2t3YXJkcyAuLi4gd2hhdCBleGFjdGx5
IGlzIHRoaXMgZml4aW5nPyBJZiB0aGlzDQo+IGlzbid0IGJhc2VkIG9uIGEgcmVhbCB3b3JsZCBj
b21wb3NpdG9yIHVzYWdlIGJ1dCBzb21lIGlndCwgdGhlbiBJJ2Qgc2F5DQo+IHRoZSBpZ3QgaGVy
ZSBpcyB2ZXJ5IHdyb25nLg0KDQpZZXMgaXQgaXMgSUdULg0KV3JpdGluZyB0byBjdXJzb3IgYnVm
ZmVyIGN1cnJlbnQgaW4gdGhlIHNjcmVlbiBhbmQgY2FsbGluZyBkcm1Nb2RlRGlydHlGQigpIGNh
dXNlcyBhIGVtcHR5IGF0b21pYyBjb21taXQgYnkgZHJtX2F0b21pY19oZWxwZXJfZGlydHlmYigp
Lg0KDQoNCj4gLURhbmllbA0KPiANCj4gPiBGaXhlczogYjlmYzVlMDFkMWNlICgiZHJtOiBBZGQg
aGVscGVyIHRvIGltcGxlbWVudCBsZWdhY3kgZGlydHlmYiIpDQo+ID4gQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPg0KPiA+IENjOiBSb2IgQ2xhcmsgPHJvYmRjbGFy
a0BnbWFpbC5jb20+DQo+ID4gQ2M6IERlZXBhayBSYXdhdCA8ZHJhd2F0QHZtd2FyZS5jb20+DQo+
ID4gQ2M6IEd3YW4tZ3llb25nIE11biA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNvbT4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNv
bT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMgfCA4
ICsrKysrKystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kYW1hZ2Vf
aGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RhbWFnZV9oZWxwZXIuYw0KPiA+IGluZGV4
IDhlZWZmMGM3YmRkNDcuLjU5NTE4N2Q5N2MxMzEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RhbWFnZV9oZWxwZXIuYw0KPiA+IEBAIC0xNTcsMTIgKzE1NywxOCBAQCBpbnQgZHJtX2F0b21p
Y19oZWxwZXJfZGlydHlmYihzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwNCj4gPiAgcmV0cnk6
DQo+ID4gIAlkcm1fZm9yX2VhY2hfcGxhbmUocGxhbmUsIGZiLT5kZXYpIHsNCj4gPiAgCQlzdHJ1
Y3QgZHJtX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZTsNCj4gPiArCQlib29sIG1hdGNoOw0KPiA+
ICANCj4gPiAgCQlyZXQgPSBkcm1fbW9kZXNldF9sb2NrKCZwbGFuZS0+bXV0ZXgsIHN0YXRlLT5h
Y3F1aXJlX2N0eCk7DQo+ID4gIAkJaWYgKHJldCkNCj4gPiAgCQkJZ290byBvdXQ7DQo+ID4gIA0K
PiA+IC0JCWlmIChwbGFuZS0+c3RhdGUtPmZiICE9IGZiKSB7DQo+ID4gKwkJbWF0Y2ggPSBwbGFu
ZS0+c3RhdGUtPmZiID09IGZiOw0KPiA+ICsJCS8qIENoZWNrIGlmIG9ianMgbWF0Y2ggdG8gaGFu
ZGxlIGRpcnR5IGJ1ZmZlcnMgb2YgY3Vyc29ycyAqLw0KPiA+ICsJCWlmIChwbGFuZS0+dHlwZSA9
PSBEUk1fUExBTkVfVFlQRV9DVVJTT1IgJiYgcGxhbmUtPnN0YXRlLT5mYikNCj4gPiArCQkJbWF0
Y2ggfD0gZmItPm9ialswXSA9PSBwbGFuZS0+c3RhdGUtPmZiLT5vYmpbMF07DQo+ID4gKw0KPiA+
ICsJCWlmICghbWF0Y2gpIHsNCj4gPiAgCQkJZHJtX21vZGVzZXRfdW5sb2NrKCZwbGFuZS0+bXV0
ZXgpOw0KPiA+ICAJCQljb250aW51ZTsNCj4gPiAgCQl9DQo+ID4gLS0gDQo+ID4gMi4zMi4wDQo+
ID4gDQo+IA0KDQo=
