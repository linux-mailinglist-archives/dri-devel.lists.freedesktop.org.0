Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CEC3AB798
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 17:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC416E0BF;
	Thu, 17 Jun 2021 15:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9976E0BF;
 Thu, 17 Jun 2021 15:35:51 +0000 (UTC)
IronPort-SDR: ZLLsAr8we8rSkR7rOAAd3/qBtD+8fS86YgWl+EDw96LIzvSts8Zz5cC6rjLAkI6ODUYH96NAcf
 yPiqbuoytoPg==
X-IronPort-AV: E=McAfee;i="6200,9189,10018"; a="227910473"
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; d="scan'208";a="227910473"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2021 08:35:50 -0700
IronPort-SDR: kqdqHaP6X5LcTcb89h9pLbK6WE/JFWYZGKPScktxA9cRIVKYvU3rKFbYPldi7jg+g91c3HPWWX
 5IxN31Euj9Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; d="scan'208";a="421909288"
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138])
 by orsmga002.jf.intel.com with ESMTP; 17 Jun 2021 08:35:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 IRSMSX605.ger.corp.intel.com (163.33.146.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 17 Jun 2021 16:35:45 +0100
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2242.008;
 Thu, 17 Jun 2021 08:35:43 -0700
From: "Tang, CQ" <cq.tang@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH] drm/i915: Perform execbuffer object locking
 as a separate step
Thread-Topic: [Intel-gfx] [PATCH] drm/i915: Perform execbuffer object locking
 as a separate step
Thread-Index: AQHXYdqrrAmM/SZHmkmWMHOe/40txqsYWF7Q
Date: Thu, 17 Jun 2021 15:35:43 +0000
Message-ID: <128cb1b951714fdb9d5721667d6d6d90@intel.com>
References: <20210615113600.30660-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210615113600.30660-1-thomas.hellstrom@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="utf-8"
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBUaG9t
YXMgSGVsbHN0csO2bQ0KPiBTZW50OiBUdWVzZGF5LCBKdW5lIDE1LCAyMDIxIDQ6MzYgQU0NCj4g
VG86IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxp
bnV4LmludGVsLmNvbT47IEF1bGQsIE1hdHRoZXcNCj4gPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+
DQo+IFN1YmplY3Q6IFtJbnRlbC1nZnhdIFtQQVRDSF0gZHJtL2k5MTU6IFBlcmZvcm0gZXhlY2J1
ZmZlciBvYmplY3QgbG9ja2luZyBhcyBhDQo+IHNlcGFyYXRlIHN0ZXANCj4gDQo+IFRvIGhlbHAg
YXZvaWQgZXZpY3RpbmcgYWxyZWFkeSByZXNpZGVudCBidWZmZXJzIGZyb20gdGhlIGJhdGNoIHdl
J3JlDQo+IHByb2Nlc3NpbmcsIHBlcmZvcm0gbG9ja2luZyBhcyBhIHNlcGFyYXRlIHN0ZXAuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBs
aW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgLi4uL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1f
ZXhlY2J1ZmZlci5jICAgIHwgMjUgKysrKysrKysrKysrKysrKy0tDQo+IC0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLmMNCj4gYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5jDQo+IGluZGV4IDIw
MWZlZDE5ZDEyMC4uMzk0ZWI0MGM5NWI1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLmMNCj4gQEAgLTkyMiwyMSArOTIyLDM4IEBAIHN0
YXRpYyBpbnQgZWJfbG9va3VwX3ZtYXMoc3RydWN0IGk5MTVfZXhlY2J1ZmZlcg0KPiAqZWIpDQo+
ICAJcmV0dXJuIGVycjsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgaW50IGViX3ZhbGlkYXRlX3ZtYXMo
c3RydWN0IGk5MTVfZXhlY2J1ZmZlciAqZWIpDQo+ICtzdGF0aWMgaW50IGViX2xvY2tfdm1hcyhz
dHJ1Y3QgaTkxNV9leGVjYnVmZmVyICplYikNCj4gIHsNCj4gIAl1bnNpZ25lZCBpbnQgaTsNCj4g
IAlpbnQgZXJyOw0KPiANCj4gLQlJTklUX0xJU1RfSEVBRCgmZWItPnVuYm91bmQpOw0KPiAtDQo+
ICAJZm9yIChpID0gMDsgaSA8IGViLT5idWZmZXJfY291bnQ7IGkrKykgew0KPiAtCQlzdHJ1Y3Qg
ZHJtX2k5MTVfZ2VtX2V4ZWNfb2JqZWN0MiAqZW50cnkgPSAmZWItPmV4ZWNbaV07DQo+ICAJCXN0
cnVjdCBlYl92bWEgKmV2ID0gJmViLT52bWFbaV07DQo+ICAJCXN0cnVjdCBpOTE1X3ZtYSAqdm1h
ID0gZXYtPnZtYTsNCj4gDQo+ICAJCWVyciA9IGk5MTVfZ2VtX29iamVjdF9sb2NrKHZtYS0+b2Jq
LCAmZWItPnd3KTsNCj4gIAkJaWYgKGVycikNCj4gIAkJCXJldHVybiBlcnI7DQo+ICsJfQ0KPiAr
DQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgZWJfdmFsaWRhdGVfdm1h
cyhzdHJ1Y3QgaTkxNV9leGVjYnVmZmVyICplYikgew0KPiArCXVuc2lnbmVkIGludCBpOw0KPiAr
CWludCBlcnI7DQo+ICsNCj4gKwlJTklUX0xJU1RfSEVBRCgmZWItPnVuYm91bmQpOw0KPiArDQo+
ICsJZXJyID0gZWJfbG9ja192bWFzKGViKTsNCj4gKwlpZiAoZXJyKQ0KPiArCQlyZXR1cm4gZXJy
Ow0KPiArDQo+ICsJZm9yIChpID0gMDsgaSA8IGViLT5idWZmZXJfY291bnQ7IGkrKykgew0KPiAr
CQlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX2V4ZWNfb2JqZWN0MiAqZW50cnkgPSAmZWItPmV4ZWNbaV07
DQo+ICsJCXN0cnVjdCBlYl92bWEgKmV2ID0gJmViLT52bWFbaV07DQo+ICsJCXN0cnVjdCBpOTE1
X3ZtYSAqdm1hID0gZXYtPnZtYTsNCj4gDQo+ICAJCWVyciA9IGViX3Bpbl92bWEoZWIsIGVudHJ5
LCBldik7DQo+ICAJCWlmIChlcnIgPT0gLUVERUFETEspDQoNClRob21hcywganVzdCBjaGVja2Vk
IGViX3Bpbl92bWEoKSwgaXQgY2FsbHMgaTkxNV92bWFfcGluX3d3KCksIGlmIHRoZSBvYmplY3Qg
aXMgYWxyZWFkeSBsb2NrZWQsIHVuZGVyIHdoYXQgY29uZGl0aW9uIHRoZXNlIGNhbGxzIHN0aWxs
IHJldHVybiAtRURFQURMSz8NCg0KLS1DUQ0KDQo+IC0tDQo+IDIuMzEuMQ0KPiANCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gSW50ZWwtZ2Z4IG1h
aWxpbmcgbGlzdA0KPiBJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4DQo=
