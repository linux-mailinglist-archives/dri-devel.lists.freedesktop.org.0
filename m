Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F713B4848
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 19:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D046EE21;
	Fri, 25 Jun 2021 17:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E841D6EE21;
 Fri, 25 Jun 2021 17:38:12 +0000 (UTC)
IronPort-SDR: UYL9mXAH5KB54Clko31sLQFsqnG9Olny8ax9Ov3EESKY67XdnJpE+44e36FygoSZl8IMGJtiaO
 b7psNGtY8BLQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10026"; a="293349000"
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="293349000"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 10:38:11 -0700
IronPort-SDR: mpkPRmetRiArrqAIaM9UAwkxiWPRoMg16ReBneeUqCWN4Q1CoBpVdwsZsefzchnACzPpssEWtE
 yOZVQsF3+bAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="488270956"
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139])
 by orsmga001.jf.intel.com with ESMTP; 25 Jun 2021 10:38:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 25 Jun 2021 18:38:08 +0100
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.008;
 Fri, 25 Jun 2021 10:38:07 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 4/4] drm/i915/gem: Migrate to system at dma-buf map time
Thread-Topic: [PATCH 4/4] drm/i915/gem: Migrate to system at dma-buf map time
Thread-Index: AQHXaSc1dzuN1f3cQESNhHfcl61w5ask2PrggACFU4D//5sZkA==
Date: Fri, 25 Jun 2021 17:38:07 +0000
Message-ID: <5e9a46340f254928be6264e4e61eeab8@intel.com>
References: <20210624183110.22582-1-thomas.hellstrom@linux.intel.com>
 <20210624183110.22582-5-thomas.hellstrom@linux.intel.com>
 <5304ae661abb43a0816a485db9d3bbb5@intel.com>
 <cd90ba70-15f8-af0a-8810-2ee7939622a2@linux.intel.com>
In-Reply-To: <cd90ba70-15f8-af0a-8810-2ee7939622a2@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.0.76
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogVGhvbWFzIEhlbGxzdHLDtm0gPHRo
b21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPlNlbnQ6IEZyaWRheSwgSnVuZSAyNSwg
MjAyMSAxMjoxOCBQTQ0KPlRvOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVs
LmNvbT47IGludGVsLQ0KPmdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj5DYzogQXVsZCwgTWF0dGhldyA8bWF0dGhldy5hdWxkQGludGVs
LmNvbT4NCj5TdWJqZWN0OiBSZTogW1BBVENIIDQvNF0gZHJtL2k5MTUvZ2VtOiBNaWdyYXRlIHRv
IHN5c3RlbSBhdCBkbWEtYnVmIG1hcA0KPnRpbWUNCj4NCj5IaSwgTWljaGFlbCwNCj4NCj50aGFu
a3MgZm9yIGxvb2tpbmcgYXQgdGhpcy4NCj4NCj5PbiA2LzI1LzIxIDY6MDIgUE0sIFJ1aGwsIE1p
Y2hhZWwgSiB3cm90ZToNCj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+IEZyb206
IGRyaS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBC
ZWhhbGYgT2YNCj4+PiBUaG9tYXMgSGVsbHN0csO2bQ0KPj4+IFNlbnQ6IFRodXJzZGF5LCBKdW5l
IDI0LCAyMDIxIDI6MzEgUE0NCj4+PiBUbzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4+IENjOiBUaG9tYXMgSGVsbHN0
csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+OyBBdWxkLA0KPk1hdHRoZXcN
Cj4+PiA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4+PiBTdWJqZWN0OiBbUEFUQ0ggNC80XSBk
cm0vaTkxNS9nZW06IE1pZ3JhdGUgdG8gc3lzdGVtIGF0IGRtYS1idWYgbWFwDQo+dGltZQ0KPj4+
DQo+Pj4gVW50aWwgd2Ugc3VwcG9ydCBwMnAgZG1hIG9yIGFzIGEgY29tcGxlbWVudCB0byB0aGF0
LCBtaWdyYXRlIGRhdGENCj4+PiB0byBzeXN0ZW0gbWVtb3J5IGF0IGRtYS1idWYgbWFwIHRpbWUg
aWYgcG9zc2libGUuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8
dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+Pj4gLS0tDQo+Pj4gZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1Zi5jIHwgOSArKysrKysrKy0NCj4+PiAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4NCj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1Zi5jDQo+Pj4g
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZG1hYnVmLmMNCj4+PiBpbmRleCA2
MTZjM2EyZjFiYWYuLmE1MmY4ODViYzA5YSAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9nZW0vaTkxNV9nZW1fZG1hYnVmLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9nZW0vaTkxNV9nZW1fZG1hYnVmLmMNCj4+PiBAQCAtMjUsNyArMjUsMTQgQEAgc3RhdGlj
IHN0cnVjdCBzZ190YWJsZQ0KPippOTE1X2dlbV9tYXBfZG1hX2J1ZihzdHJ1Y3QNCj4+PiBkbWFf
YnVmX2F0dGFjaG1lbnQgKmF0dGFjaG1lDQo+Pj4gCXN0cnVjdCBzY2F0dGVybGlzdCAqc3JjLCAq
ZHN0Ow0KPj4+IAlpbnQgcmV0LCBpOw0KPj4+DQo+Pj4gLQlyZXQgPSBpOTE1X2dlbV9vYmplY3Rf
cGluX3BhZ2VzX3VubG9ja2VkKG9iaik7DQo+Pj4gKwlyZXQgPSBpOTE1X2dlbV9vYmplY3RfbG9j
a19pbnRlcnJ1cHRpYmxlKG9iaiwgTlVMTCk7DQo+PiBIbW0sIEkgYmVsaWV2ZSBpbiBtb3N0IGNh
c2VzIHRoYXQgdGhlIGNhbGxlciBzaG91bGQgYmUgaG9sZGluZyB0aGUNCj4+IGxvY2sgKG9iamVj
dCBkbWEtcmVzdikgb24gdGhpcyBvYmplY3QgYWxyZWFkeS4NCj4NCj5ZZXMsIEkgYWdyZWUsIElu
IHBhcnRpY3VsYXIgZm9yIG90aGVyIGluc3RhbmNlcyBvZiBvdXIgb3duIGRyaXZlcizCoCBhdA0K
PmxlYXN0IHNpbmNlIHRoZSBkbWFfcmVzdiBpbnRyb2R1Y3Rpb24uDQo+DQo+QnV0IEkgYWxzbyB0
aGluayB0aGF0J3MgYSBwcmUtZXhpc3RpbmcgYnVnLCBzaW5jZQ0KPmk5MTVfZ2VtX29iamVjdF9w
aW5fcGFnZXNfdW5sb2NrZWQoKSB3aWxsIGFsc28gdGFrZSB0aGUgbG9jay4NCg0KT3VjaCB5ZXMu
ICBNaXNzZWQgdGhhdC4NCg0KPkkgVGhpbmsgd2UgbmVlZCB0byBpbml0aWFsbHkgbWFrZSB0aGUg
ZXhwb3J0ZXIgZHluYW1pYy1jYXBhYmxlIHRvDQo+cmVzb2x2ZSB0aGlzLCBhbmQgZHJvcCB0aGUg
bG9ja2luZyBoZXJlIGNvbXBsZXRlbHksIGFzIGRtYS1idWYgZG9jcyBzYXlzDQo+dGhhdCB3ZSdy
ZSB0aGVuIGd1YXJhbnRlZWQgdG8gZ2V0IGNhbGxlZCB3aXRoIHRoZSBvYmplY3QgbG9jayBoZWxk
Lg0KPg0KPkkgZmlndXJlIGlmIHdlIG1ha2UgdGhlIGV4cG9ydGVyIGR5bmFtaWMsIHdlIG5lZWQg
dG8gbWlncmF0ZSBhbHJlYWR5IGF0DQo+ZG1hX2J1Zl9waW4gdGltZSBzbyB3ZSBkb24ndCBwaW4g
dGhlIG9iamVjdCBpbiB0aGUgd3JvbmcgbG9jYXRpb24uDQoNClRoZSBleHBvcnRlciBhcyBkeW5h
bWljICAob3BzLT5waW4gaXMgYXZhaWxhYmxlKSBpcyBvcHRpb25hbCwgYnV0IGltcG9ydGVyDQpk
eW5hbWljIChvcHMtPm1vdmVfbm90aWZ5KSBpcyByZXF1aXJlZC4NCg0KV2l0aCB0aGF0IGluIG1p
bmQsIGl0IHdvdWxkIHNlZW0gdGhhdCB0aGVyZSBhcmUgdGhyZWUgcG9zc2libGUgY29tYmluYXRp
b25zDQpmb3IgdGhlIG1pZ3JhdGUgdG8gYmUgYXR0ZW1wdGVkOg0KDQoxKSBpbiB0aGUgb3BzLT5w
aW4gZnVuY3Rpb24gKGV4cG9ydF9keW5hbWljICE9IGltcG9ydF9keW5hbWljLCBkdXJpbmcgYXR0
YWNoKQ0KMikgaW4gdGhlIG9wcy0+cGluIGZ1bmN0aW9uIChleHBvcnRfZHluYW1pYyBhbmQgIUNP
TkZJR19ETUFCVUZfTU9WRV9OT1RJRlkpIGR1cmluZyBtYXBwaW5nDQozKSBhbmQgcG9zc2libHkg
aW4gb3BzLT5tYXBfZG1hX2J1ZiAoZXhvcnRfZHluYW1pYyBpYW5kIENPTkZJR19ETUFCVUZfTU9W
RV9OT1RJRlkpDQoNClNpbmNlIG9uZSBwb3NzaWJpbGl0eSBoYXMgdG8gYmUgaW4gdGhlIG1hcHBp
bmcgZnVuY3Rpb24sIGl0IHNlZW1zIHRoYXQgaWYgd2UNCmNhbiBmaWd1cmUgb3V0IHRoZSBsb2Nr
aW5nLCB0aGF0IHRoZSBtaWdyYXRlIHNob3VsZCBwcm9iYWJseSBiZSBhdmFpbGFibGUgaGVyZS4N
Cg0KTWlrZQ0KDQoNCj4vVGhvbWFzDQo+DQo+DQo+Pg0KPj4gSSBrbm93IGZvciB0aGUgZHluYW1p
YyB2ZXJzaW9uIG9mIGRtYS1idWYsIHRoZXJlIGlzIGEgY2hlY2sgdG8gbWFrZQ0KPj4gc3VyZSB0
aGF0IHRoZSBsb2NrIGlzIGhlbGQgd2hlbiBjYWxsZWQuDQo+Pg0KPj4gSSB0aGluayB5b3Ugd2ls
bCBydW4gaW50byBzb21lIGlzc3VlcyBpZiB5b3UgdHJ5IHRvIGdldCBpdCBoZXJlIGFzIHdlbGwu
DQo+Pg0KPj4gTWlrZQ0KPj4NCj4+PiArCWlmIChyZXQpDQo+Pj4gKwkJcmV0dXJuIEVSUl9QVFIo
cmV0KTsNCj4+PiArDQo+Pj4gKwlyZXQgPSBpOTE1X2dlbV9vYmplY3RfbWlncmF0ZShvYmosIE5V
TEwsIElOVEVMX1JFR0lPTl9TTUVNKTsNCj4+PiArCWlmICghcmV0KQ0KPj4+ICsJCXJldCA9IGk5
MTVfZ2VtX29iamVjdF9waW5fcGFnZXMob2JqKTsNCj4+PiArCWk5MTVfZ2VtX29iamVjdF91bmxv
Y2sob2JqKTsNCj4+PiAJaWYgKHJldCkNCj4+PiAJCWdvdG8gZXJyOw0KPj4+DQo+Pj4gLS0NCj4+
PiAyLjMxLjENCg==
