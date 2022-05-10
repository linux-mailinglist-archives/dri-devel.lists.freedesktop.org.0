Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D21F8522464
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 20:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9844710E9FC;
	Tue, 10 May 2022 18:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6FE10E9FC;
 Tue, 10 May 2022 18:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652208839; x=1683744839;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=u4qnxfJgDlKnvLSsJ/Qe2dzQcEirZPKBnlQ1pBORF5U=;
 b=YSdHdgzALTrm9OWexz/ORx1UQ1Gv1Pp9Ka7ORKaGMqmXYhGC2jqvHkwa
 CYcHv13uicJUBtwpsy2McKYG9nO72hIhR77WwzQPFgIn4SSbao1r5o5ot
 qjiAiTY4vUbPEFglxN+q+5abjIT1bbKRgRf6a4rrL0sODblf4QJExSfbp
 xpEIFDVxAqvu9YtkimJ54RHp1xW2mAqmK5zd/ng4wATffJBcfuWx6RS/g
 FGS71i5+5VIzpTrTbTTGN8XpVrKMcdivEd1atc1yE0WkYU5x8Ord4rqEB
 j4DIbgoFEt4YHm9rN7nOrOcE257+IoJUObP1fVcHj2aQWQc5n7LUIouOT Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="251522123"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="251522123"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 11:53:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="571498594"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga007.fm.intel.com with ESMTP; 10 May 2022 11:53:58 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 11:53:58 -0700
Received: from fmsmsx612.amr.corp.intel.com ([10.18.126.92]) by
 fmsmsx612.amr.corp.intel.com ([10.18.126.92]) with mapi id 15.01.2308.027;
 Tue, 10 May 2022 11:53:58 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: Re: [PATCH v3 3/3] drm/i915: Ensure damage clip area is within pipe
 area
Thread-Topic: [PATCH v3 3/3] drm/i915: Ensure damage clip area is within pipe
 area
Thread-Index: AQHYZJx4RzFzAV6N2UqWg708oTyWKq0Y6rkA
Date: Tue, 10 May 2022 18:53:58 +0000
Message-ID: <1aa921f215b9d1c80d63b631b65d822b8cb23e22.camel@intel.com>
References: <20220510183313.1046628-1-jouni.hogander@intel.com>
 <20220510183313.1046628-4-jouni.hogander@intel.com>
In-Reply-To: <20220510183313.1046628-4-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <66194F29A451D84FB5D0789F2E4FA73D@intel.com>
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
Cc: "markpearson@lenovo.com" <markpearson@lenovo.com>, "Kahola,
 Mika" <mika.kahola@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIyLTA1LTEwIGF0IDIxOjMzICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
DQo+IEN1cnJlbnQgdXBkYXRlIGFyZWEgY2FsY3VsYXRpb24gaXMgbm90IGhhbmRsaW5nIHNpdHVh
dGlvbiB3aGVyZQ0KPiBlLmcuIGN1cnNvciBwbGFuZSBpcyBmdWxseSBvciBwYXJ0aWFsbHkgb3V0
c2lkZSBwaXBlIGFyZWEuDQo+IA0KPiBGaXggdGhpcyBieSBjaGVja2luZyBkYW1hZ2UgYXJlYSBh
Z2FpbnN0IHBpcGVfc3JjIGFyZWEgdXNpbmcNCj4gZHJtX3JlY3RfaW50ZXJzZWN0Lg0KPiANCj4g
djI6IFNldCB4MSBhbmQgeDIgaW4gZGFtYWdlZF9hcmVhIGluaXRpYWxpemF0aW9uDQo+IHYzOiBN
b3ZlIGRybV9yZWN0X2ludGVyc2VjdCBpbnRvIGNsaXBfYXJlYV91cGRhdGUNCj4gDQo+IENsb3Nl
czogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pbnRlbC8tL2lzc3Vlcy81NDQw
DQo+IENjOiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4g
Q2M6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+DQo+IENjOiBNYXJrIFBlYXJz
b24gPG1hcmtwZWFyc29uQGxlbm92by5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEpvdW5pIEjDtmdh
bmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMgfCAyNCArKysrKysrKysrKysrKysrKy0tLS0tLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+IGluZGV4IDM1NjFj
MjE4Y2ZiMS4uZjRiNGMxYzgzZDJiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfcHNyLmMNCj4gQEAgLTE2MTgsOCArMTYxOCwxMiBAQCBzdGF0aWMgdm9pZCBwc3Iy
X21hbl90cmtfY3RsX2NhbGMoc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUsDQo+
ICB9DQo+ICANCj4gIHN0YXRpYyB2b2lkIGNsaXBfYXJlYV91cGRhdGUoc3RydWN0IGRybV9yZWN0
ICpvdmVybGFwX2RhbWFnZV9hcmVhLA0KPiAtCQkJICAgICBzdHJ1Y3QgZHJtX3JlY3QgKmRhbWFn
ZV9hcmVhKQ0KPiArCQkJICAgICBzdHJ1Y3QgZHJtX3JlY3QgKmRhbWFnZV9hcmVhLA0KPiArCQkJ
ICAgICBzdHJ1Y3QgZHJtX3JlY3QgKmRyYXdfYXJlYSkNCg0Kcy9kcmF3X2FyZWEvcGlwZV9zcmM/
DQoNCj4gIHsNCj4gKwlpZiAoIWRybV9yZWN0X2ludGVyc2VjdChkYW1hZ2VfYXJlYSwgZHJhd19h
cmVhKSkNCj4gKwkJcmV0dXJuOw0KPiArDQo+ICAJaWYgKG92ZXJsYXBfZGFtYWdlX2FyZWEtPnkx
ID09IC0xKSB7DQo+ICAJCW92ZXJsYXBfZGFtYWdlX2FyZWEtPnkxID0gZGFtYWdlX2FyZWEtPnkx
Ow0KPiAgCQlvdmVybGFwX2RhbWFnZV9hcmVhLT55MiA9IGRhbWFnZV9hcmVhLT55MjsNCj4gQEAg
LTE3MDksNyArMTcxMyw4IEBAIGludCBpbnRlbF9wc3IyX3NlbF9mZXRjaF91cGRhdGUoc3RydWN0
IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+ICAJICovDQo+ICAJZm9yX2VhY2hfb2xkbmV3
X2ludGVsX3BsYW5lX2luX3N0YXRlKHN0YXRlLCBwbGFuZSwgb2xkX3BsYW5lX3N0YXRlLA0KPiAg
CQkJCQkgICAgIG5ld19wbGFuZV9zdGF0ZSwgaSkgew0KPiAtCQlzdHJ1Y3QgZHJtX3JlY3Qgc3Jj
LCBkYW1hZ2VkX2FyZWEgPSB7IC55MSA9IC0xIH07DQo+ICsJCXN0cnVjdCBkcm1fcmVjdCBzcmMs
IGRhbWFnZWRfYXJlYSA9IHsgLngxID0gMCwgLnkxID0gLTEsDQo+ICsJCQkJCQkgICAgICAueDIg
PSBJTlRfTUFYIH07DQo+ICAJCXN0cnVjdCBkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2VfaXRlciBp
dGVyOw0KPiAgCQlzdHJ1Y3QgZHJtX3JlY3QgY2xpcDsNCj4gIA0KPiBAQCAtMTczNiwyMCArMTc0
MSwyMyBAQCBpbnQgaW50ZWxfcHNyMl9zZWxfZmV0Y2hfdXBkYXRlKHN0cnVjdCBpbnRlbF9hdG9t
aWNfc3RhdGUgKnN0YXRlLA0KPiAgCQkJaWYgKG9sZF9wbGFuZV9zdGF0ZS0+dWFwaS52aXNpYmxl
KSB7DQo+ICAJCQkJZGFtYWdlZF9hcmVhLnkxID0gb2xkX3BsYW5lX3N0YXRlLT51YXBpLmRzdC55
MTsNCj4gIAkJCQlkYW1hZ2VkX2FyZWEueTIgPSBvbGRfcGxhbmVfc3RhdGUtPnVhcGkuZHN0Lnky
Ow0KPiAtCQkJCWNsaXBfYXJlYV91cGRhdGUoJnBpcGVfY2xpcCwgJmRhbWFnZWRfYXJlYSk7DQo+
ICsJCQkJY2xpcF9hcmVhX3VwZGF0ZSgmcGlwZV9jbGlwLCAmZGFtYWdlZF9hcmVhLA0KPiArCQkJ
CQkJICZjcnRjX3N0YXRlLT5waXBlX3NyYyk7DQo+ICAJCQl9DQo+ICANCj4gIAkJCWlmIChuZXdf
cGxhbmVfc3RhdGUtPnVhcGkudmlzaWJsZSkgew0KPiAgCQkJCWRhbWFnZWRfYXJlYS55MSA9IG5l
d19wbGFuZV9zdGF0ZS0+dWFwaS5kc3QueTE7DQo+ICAJCQkJZGFtYWdlZF9hcmVhLnkyID0gbmV3
X3BsYW5lX3N0YXRlLT51YXBpLmRzdC55MjsNCj4gLQkJCQljbGlwX2FyZWFfdXBkYXRlKCZwaXBl
X2NsaXAsICZkYW1hZ2VkX2FyZWEpOw0KPiArCQkJCWNsaXBfYXJlYV91cGRhdGUoJnBpcGVfY2xp
cCwgJmRhbWFnZWRfYXJlYSwNCj4gKwkJCQkJCSAmY3J0Y19zdGF0ZS0+cGlwZV9zcmMpOw0KPiAg
CQkJfQ0KPiAgCQkJY29udGludWU7DQo+ICAJCX0gZWxzZSBpZiAobmV3X3BsYW5lX3N0YXRlLT51
YXBpLmFscGhhICE9IG9sZF9wbGFuZV9zdGF0ZS0+dWFwaS5hbHBoYSkgew0KPiAgCQkJLyogSWYg
YWxwaGEgY2hhbmdlZCBtYXJrIHRoZSB3aG9sZSBwbGFuZSBhcmVhIGFzIGRhbWFnZWQgKi8NCj4g
IAkJCWRhbWFnZWRfYXJlYS55MSA9IG5ld19wbGFuZV9zdGF0ZS0+dWFwaS5kc3QueTE7DQo+ICAJ
CQlkYW1hZ2VkX2FyZWEueTIgPSBuZXdfcGxhbmVfc3RhdGUtPnVhcGkuZHN0LnkyOw0KPiAtCQkJ
Y2xpcF9hcmVhX3VwZGF0ZSgmcGlwZV9jbGlwLCAmZGFtYWdlZF9hcmVhKTsNCj4gKwkJCWNsaXBf
YXJlYV91cGRhdGUoJnBpcGVfY2xpcCwgJmRhbWFnZWRfYXJlYSwNCj4gKwkJCQkJICZjcnRjX3N0
YXRlLT5waXBlX3NyYyk7DQo+ICAJCQljb250aW51ZTsNCj4gIAkJfQ0KPiAgDQo+IEBAIC0xNzYw
LDcgKzE3NjgsOCBAQCBpbnQgaW50ZWxfcHNyMl9zZWxfZmV0Y2hfdXBkYXRlKHN0cnVjdCBpbnRl
bF9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiAgCQkJCQkJICAgJm5ld19wbGFuZV9zdGF0ZS0+dWFw
aSk7DQo+ICAJCWRybV9hdG9taWNfZm9yX2VhY2hfcGxhbmVfZGFtYWdlKCZpdGVyLCAmY2xpcCkg
ew0KPiAgCQkJaWYgKGRybV9yZWN0X2ludGVyc2VjdCgmY2xpcCwgJnNyYykpDQo+IC0JCQkJY2xp
cF9hcmVhX3VwZGF0ZSgmZGFtYWdlZF9hcmVhLCAmY2xpcCk7DQo+ICsJCQkJY2xpcF9hcmVhX3Vw
ZGF0ZSgmZGFtYWdlZF9hcmVhLCAmY2xpcCwNCj4gKwkJCQkJCSAmY3J0Y19zdGF0ZS0+cGlwZV9z
cmMpOw0KPiAgCQl9DQo+ICANCj4gIAkJaWYgKGRhbWFnZWRfYXJlYS55MSA9PSAtMSkNCj4gQEAg
LTE3NjgsNyArMTc3Nyw4IEBAIGludCBpbnRlbF9wc3IyX3NlbF9mZXRjaF91cGRhdGUoc3RydWN0
IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+ICANCj4gIAkJZGFtYWdlZF9hcmVhLnkxICs9
IG5ld19wbGFuZV9zdGF0ZS0+dWFwaS5kc3QueTEgLSBzcmMueTE7DQo+ICAJCWRhbWFnZWRfYXJl
YS55MiArPSBuZXdfcGxhbmVfc3RhdGUtPnVhcGkuZHN0LnkxIC0gc3JjLnkxOw0KPiAtCQljbGlw
X2FyZWFfdXBkYXRlKCZwaXBlX2NsaXAsICZkYW1hZ2VkX2FyZWEpOw0KPiArDQo+ICsJCWNsaXBf
YXJlYV91cGRhdGUoJnBpcGVfY2xpcCwgJmRhbWFnZWRfYXJlYSwgJmNydGNfc3RhdGUtPnBpcGVf
c3JjKTsNCg0Kd2hpdGUgc3BhY2UgXg0KDQp3aXRoIHRob3NlIG5pdHM6DQpSZXZpZXdlZC1ieTog
Sm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gIAl9DQo+
ICANCj4gIAkvKg0KDQo=
