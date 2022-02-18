Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4878E4BB060
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 04:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D80D10EBF4;
	Fri, 18 Feb 2022 03:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1A910EBF4;
 Fri, 18 Feb 2022 03:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645156051; x=1676692051;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6EFo9TRcPzyNHTJUYz5NXVP4srB1iUlbwBFjy8zvZnk=;
 b=Ddo6AO42fb1WZ+sOoZ/6JXwHIv6Os3iYZbDlqgQ2p2V0SjWA5J8WZF94
 0XGA8DcZdvOfvE8Nw+RsYfiibrEeKdVi6cs5Qy7+SXy7Esv8fxdNQaCl8
 fzkEClZhPebl+/PSHiBIDC30dw34nnSoFaNyWHgiasKnr9bslAgmxE8/B
 V1aHIxarbImAm00KSCvVAZOwkPdNJzPDenKXHr+rsdP76zPSFUKTXRyV/
 tgeHU/5ogFpsojsudWAt39xliZSGgCgjqA5sPZkW2aomB97ZpSIgM8XT0
 4BENVBapoKp8aVUbdHlvuPengElT5m2/dPuXHdluObndlTBe11U48++oC A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="314309225"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="314309225"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 19:47:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="590061062"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 17 Feb 2022 19:47:30 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 17 Feb 2022 19:47:29 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 17 Feb 2022 19:47:29 -0800
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2308.020;
 Thu, 17 Feb 2022 19:47:29 -0800
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 1/3] drm/mm: Ensure that the entry is not NULL before
 extracting rb_node
Thread-Topic: [PATCH v2 1/3] drm/mm: Ensure that the entry is not NULL before
 extracting rb_node
Thread-Index: AQHYI9VMExFJl786wU2zrhC9c+UoXayX+nyAgACOyLA=
Date: Fri, 18 Feb 2022 03:47:29 +0000
Message-ID: <20f0acb8260a4f18aeadbcc73847e06f@intel.com>
References: <20220217075014.922605-1-vivek.kasireddy@intel.com>
 <20220217075014.922605-2-vivek.kasireddy@intel.com>
 <a37a0c45-615e-e731-e124-7db18bc06e1f@linux.intel.com>
In-Reply-To: <a37a0c45-615e-e731-e124-7db18bc06e1f@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
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
Cc: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVHZydGtvLA0KDQo+IA0KPiBPbiAxNy8wMi8yMDIyIDA3OjUwLCBWaXZlayBLYXNpcmVkZHkg
d3JvdGU6DQo+ID4gV2hpbGUgbG9va2luZyBmb3IgbmV4dCBob2xlcyBzdWl0YWJsZSBmb3IgYW4g
YWxsb2NhdGlvbiwgYWx0aG91Z2gsDQo+ID4gaXQgaXMgaGlnaGx5IHVubGlrZWx5LCBtYWtlIHN1
cmUgdGhhdCB0aGUgREVDTEFSRV9ORVhUX0hPTEVfQUREUg0KPiA+IG1hY3JvIGlzIHVzaW5nIGEg
dmFsaWQgbm9kZSBiZWZvcmUgaXQgZXh0cmFjdHMgdGhlIHJiX25vZGUgZnJvbSBpdC4NCj4gDQo+
IFdhcyB0aGUgbmVlZCBmb3IgdGhpcyBqdXN0IGEgY29uc2VxdWVuY2Ugb2YgaW5zdWZmaWNpZW50
IGxvY2tpbmcgaW4gdGhlDQo+IGk5MTUgcGF0Y2g/DQpbS2FzaXJlZGR5LCBWaXZla10gUGFydGx5
LCB5ZXM7IGJ1dCBJIGZpZ3VyZWQgc2luY2Ugd2UgYXJlIGFueXdheSBkb2luZw0KaWYgKCFlbnRy
eSB8fCAuLiksIGl0IG1ha2VzIHNlbnNlIHRvIGRlcmVmZXJlbmNlIGVudHJ5IGFuZCBleHRyYWN0
IHRoZSByYl9ub2RlDQphZnRlciB0aGlzIGNoZWNrLg0KDQpUaGFua3MsDQpWaXZlaw0KDQo+IA0K
PiBSZWdhcmRzLA0KPiANCj4gVHZydGtvDQo+IA0KPiA+DQo+ID4gQ2M6IFR2cnRrbyBVcnN1bGlu
IDx0dnJ0a28udXJzdWxpbkBsaW51eC5pbnRlbC5jb20+DQo+ID4gQ2M6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBWaXZlayBL
YXNpcmVkZHkgPHZpdmVrLmthc2lyZWRkeUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2
ZXJzL2dwdS9kcm0vZHJtX21tLmMgfCA1ICsrKy0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fbW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW0uYw0KPiA+IGluZGV4
IDgyNTdmOWQ0ZjYxOS4uNDk5ZDg4NzRlNGVkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fbW0uYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW0uYw0KPiA+IEBA
IC0zODksMTEgKzM4OSwxMiBAQCBmaXJzdF9ob2xlKHN0cnVjdCBkcm1fbW0gKm1tLA0KPiA+ICAg
I2RlZmluZSBERUNMQVJFX05FWFRfSE9MRV9BRERSKG5hbWUsIGZpcnN0LCBsYXN0KQkJCVwNCj4g
PiAgIHN0YXRpYyBzdHJ1Y3QgZHJtX21tX25vZGUgKm5hbWUoc3RydWN0IGRybV9tbV9ub2RlICpl
bnRyeSwgdTY0IHNpemUpCVwNCj4gPiAgIHsJCQkJCQkJCQlcDQo+ID4gLQlzdHJ1Y3QgcmJfbm9k
ZSAqcGFyZW50LCAqbm9kZSA9ICZlbnRyeS0+cmJfaG9sZV9hZGRyOwkJXA0KPiA+ICsJc3RydWN0
IHJiX25vZGUgKnBhcmVudCwgKm5vZGU7CQkJCQlcDQo+ID4gICAJCQkJCQkJCQlcDQo+ID4gLQlp
ZiAoIWVudHJ5IHx8IFJCX0VNUFRZX05PREUobm9kZSkpCQkJCVwNCj4gPiArCWlmICghZW50cnkg
fHwgUkJfRU1QVFlfTk9ERSgmZW50cnktPnJiX2hvbGVfYWRkcikpCQlcDQo+ID4gICAJCXJldHVy
biBOVUxMOwkJCQkJCVwNCj4gPiAgIAkJCQkJCQkJCVwNCj4gPiArCW5vZGUgPSAmZW50cnktPnJi
X2hvbGVfYWRkcjsJCQkJCVwNCj4gPiAgIAlpZiAodXNhYmxlX2hvbGVfYWRkcihub2RlLT5maXJz
dCwgc2l6ZSkpIHsJCQlcDQo+ID4gICAJCW5vZGUgPSBub2RlLT5maXJzdDsJCQkJCVwNCj4gPiAg
IAkJd2hpbGUgKHVzYWJsZV9ob2xlX2FkZHIobm9kZS0+bGFzdCwgc2l6ZSkpCQlcDQo=
