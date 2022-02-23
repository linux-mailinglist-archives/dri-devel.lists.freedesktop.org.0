Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 804904C0B26
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 05:35:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBD210E7B5;
	Wed, 23 Feb 2022 04:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B24410E7B5;
 Wed, 23 Feb 2022 04:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645590926; x=1677126926;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K8f0KkdRtOx4LaaQFhLQ8LxYkcyKp7/CcCwQC4xHgc4=;
 b=dPHQRExqUpeN8OYmycrVMchihNsXhXQpNaiJ3ygmlven+ecuupf3sbI7
 F5lOVLqc6whs2OJl2N5p/JKq0ltecEkobQWmBFqHZ5Z9JQ5m7/JqPsZL3
 9J6NQ2DCpgIzCd6twg7yRsb62WlNfM/c7MsrQ3MPTubcwvkDYOHYkfLBo
 BDFliS0srysrnfFVGb4z7AKR8ag9Y2W5BZErauyCtoetEXqcLmH1E+I5i
 zrBdumm7pYCz+vI/lAMADUFJSGmkCnELgQahZugIFyDkzzUvZDx1taj5U
 stVuW7CtUoee8ARibxaSZUbKi5wiMPOb1vd5lrzHjqBkI9pNSjfIQN3tq Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="251619055"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="251619055"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 20:35:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="780608153"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga005.fm.intel.com with ESMTP; 22 Feb 2022 20:35:25 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 20:35:24 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 20:35:24 -0800
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2308.020;
 Tue, 22 Feb 2022 20:35:24 -0800
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 1/3] drm/mm: Ensure that the entry is not NULL before
 extracting rb_node
Thread-Topic: [PATCH v2 1/3] drm/mm: Ensure that the entry is not NULL before
 extracting rb_node
Thread-Index: AQHYI9VMExFJl786wU2zrhC9c+UoXayX+nyAgACOyLCABfVlgIACCxsQ
Date: Wed, 23 Feb 2022 04:35:24 +0000
Message-ID: <a4fd740802ec4ab98bf8480f069e5ebf@intel.com>
References: <20220217075014.922605-1-vivek.kasireddy@intel.com>
 <20220217075014.922605-2-vivek.kasireddy@intel.com>
 <a37a0c45-615e-e731-e124-7db18bc06e1f@linux.intel.com>
 <20f0acb8260a4f18aeadbcc73847e06f@intel.com>
 <242fada2-dc13-c272-787a-3a0cd4efd52b@linux.intel.com>
In-Reply-To: <242fada2-dc13-c272-787a-3a0cd4efd52b@linux.intel.com>
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

SGkgVHZydGtvLA0KDQo+IA0KPiBPbiAxOC8wMi8yMDIyIDAzOjQ3LCBLYXNpcmVkZHksIFZpdmVr
IHdyb3RlOg0KPiA+IEhpIFR2cnRrbywNCj4gPg0KPiA+Pg0KPiA+PiBPbiAxNy8wMi8yMDIyIDA3
OjUwLCBWaXZlayBLYXNpcmVkZHkgd3JvdGU6DQo+ID4+PiBXaGlsZSBsb29raW5nIGZvciBuZXh0
IGhvbGVzIHN1aXRhYmxlIGZvciBhbiBhbGxvY2F0aW9uLCBhbHRob3VnaCwNCj4gPj4+IGl0IGlz
IGhpZ2hseSB1bmxpa2VseSwgbWFrZSBzdXJlIHRoYXQgdGhlIERFQ0xBUkVfTkVYVF9IT0xFX0FE
RFINCj4gPj4+IG1hY3JvIGlzIHVzaW5nIGEgdmFsaWQgbm9kZSBiZWZvcmUgaXQgZXh0cmFjdHMg
dGhlIHJiX25vZGUgZnJvbSBpdC4NCj4gPj4NCj4gPj4gV2FzIHRoZSBuZWVkIGZvciB0aGlzIGp1
c3QgYSBjb25zZXF1ZW5jZSBvZiBpbnN1ZmZpY2llbnQgbG9ja2luZyBpbiB0aGUNCj4gPj4gaTkx
NSBwYXRjaD8NCj4gPiBbS2FzaXJlZGR5LCBWaXZla10gUGFydGx5LCB5ZXM7IGJ1dCBJIGZpZ3Vy
ZWQgc2luY2Ugd2UgYXJlIGFueXdheSBkb2luZw0KPiA+IGlmICghZW50cnkgfHwgLi4pLCBpdCBt
YWtlcyBzZW5zZSB0byBkZXJlZmVyZW5jZSBlbnRyeSBhbmQgZXh0cmFjdCB0aGUgcmJfbm9kZQ0K
PiA+IGFmdGVyIHRoaXMgY2hlY2suDQo+IA0KPiBVbmxlc3MgSSBhbSBibGluZCBJIGRvbid0IHNl
ZSB0aGF0IGl0IG1ha2VzIGEgZGlmZmVyZW5jZS4NCj4gIiZlbnRyeS0+cmJfaG9sZV9hZGRyIiBp
cyB0YWtpbmcgYW4gYWRkcmVzcyBvZiwgd2hpY2ggd29ya3MgImZpbmUiIGlzDQpbS2FzaXJlZGR5
LCBWaXZla10gQWgsIGRpZG4ndCByZWFsaXplIGl0IHdhcyB0aGUgc2FtZSB0aGluZyBhcyBvZmZz
ZXRvZigpLiANCg0KPiBlbnRyeSBpcyBOVUxMLiBBbmQgZG9lcyBub3QgZ2V0IHBhc3QgdGhlICFl
bnRyeSBjaGVjayBmb3IgdGhlIGFjdHVhbA0KPiBkZS1yZWZlcmVuY2UgdmlhIFJCX0VNUFRZX05P
REUuIFdpdGggeW91ciBwYXRjaCB5b3UgbW92ZSB0aGF0IGFmdGVyIHRoZQ0KPiAhZW50cnkgY2hl
Y2sgYnV0IHN0aWxsIGhhdmUgaXQgaW4gdGhlIFJCX0VNUFRZX05PREUgbWFjcm8uIEFnYWluLCB1
bmxlc3MNCj4gSSBhbSBibGluZCwgSSB0aGluayBqdXN0IGRyb3AgdGhpcyBwYXRjaC4NCltLYXNp
cmVkZHksIFZpdmVrXSBTdXJlOyBkbyB5b3Ugd2FudCBtZSB0byBzZW5kIGFub3RoZXIgdmVyc2lv
biB3aXRoIHRoaXMNCnBhdGNoIGRyb3BwZWQ/IE9yLCB3b3VsZCB5b3UgYmUgYWJsZSB0byBqdXN0
IG1lcmdlIHRoZSBvdGhlciB0d28gZnJvbSB0aGUNCmxhdGVzdCB2ZXJzaW9uIG9mIHRoaXMgc2Vy
aWVzPw0KDQpUaGFua3MsDQpWaXZlaw0KDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gVHZydGtvDQo+
IA0KPiANCj4gPiBUaGFua3MsDQo+ID4gVml2ZWsNCj4gPg0KPiA+Pg0KPiA+PiBSZWdhcmRzLA0K
PiA+Pg0KPiA+PiBUdnJ0a28NCj4gPj4NCj4gPj4+DQo+ID4+PiBDYzogVHZydGtvIFVyc3VsaW4g
PHR2cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNvbT4NCj4gPj4+IENjOiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBWaXZl
ayBLYXNpcmVkZHkgPHZpdmVrLmthc2lyZWRkeUBpbnRlbC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+
ICAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW0uYyB8IDUgKysrLS0NCj4gPj4+ICAgIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4+Pg0KPiA+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
bW0uYw0KPiA+Pj4gaW5kZXggODI1N2Y5ZDRmNjE5Li40OTlkODg3NGU0ZWQgMTAwNjQ0DQo+ID4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21tLmMNCj4gPj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fbW0uYw0KPiA+Pj4gQEAgLTM4OSwxMSArMzg5LDEyIEBAIGZpcnN0X2hvbGUoc3Ry
dWN0IGRybV9tbSAqbW0sDQo+ID4+PiAgICAjZGVmaW5lIERFQ0xBUkVfTkVYVF9IT0xFX0FERFIo
bmFtZSwgZmlyc3QsIGxhc3QpCQkJXA0KPiA+Pj4gICAgc3RhdGljIHN0cnVjdCBkcm1fbW1fbm9k
ZSAqbmFtZShzdHJ1Y3QgZHJtX21tX25vZGUgKmVudHJ5LCB1NjQgc2l6ZSkJXA0KPiA+Pj4gICAg
ewkJCQkJCQkJCVwNCj4gPj4+IC0Jc3RydWN0IHJiX25vZGUgKnBhcmVudCwgKm5vZGUgPSAmZW50
cnktPnJiX2hvbGVfYWRkcjsJCVwNCj4gPj4+ICsJc3RydWN0IHJiX25vZGUgKnBhcmVudCwgKm5v
ZGU7CQkJCQlcDQo+ID4+PiAgICAJCQkJCQkJCQlcDQo+ID4+PiAtCWlmICghZW50cnkgfHwgUkJf
RU1QVFlfTk9ERShub2RlKSkJCQkJXA0KPiA+Pj4gKwlpZiAoIWVudHJ5IHx8IFJCX0VNUFRZX05P
REUoJmVudHJ5LT5yYl9ob2xlX2FkZHIpKQkJXA0KPiA+Pj4gICAgCQlyZXR1cm4gTlVMTDsJCQkJ
CQlcDQo+ID4+PiAgICAJCQkJCQkJCQlcDQo+ID4+PiArCW5vZGUgPSAmZW50cnktPnJiX2hvbGVf
YWRkcjsJCQkJCVwNCj4gPj4+ICAgIAlpZiAodXNhYmxlX2hvbGVfYWRkcihub2RlLT5maXJzdCwg
c2l6ZSkpIHsJCQlcDQo+ID4+PiAgICAJCW5vZGUgPSBub2RlLT5maXJzdDsJCQkJCVwNCj4gPj4+
ICAgIAkJd2hpbGUgKHVzYWJsZV9ob2xlX2FkZHIobm9kZS0+bGFzdCwgc2l6ZSkpCQlcDQo=
