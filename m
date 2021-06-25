Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 927653B4887
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 19:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F526EE35;
	Fri, 25 Jun 2021 17:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DF46EE35;
 Fri, 25 Jun 2021 17:57:25 +0000 (UTC)
IronPort-SDR: 5n/QmXN8muALUqhKa2HfBeVJS9Xko1W+VRzQVUpx4fc/CUIY1BExv6Essz3bKxXEtkc3tE+9Mw
 wZ/37asBukkw==
X-IronPort-AV: E=McAfee;i="6200,9189,10026"; a="204710508"
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="204710508"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 10:57:24 -0700
IronPort-SDR: qEha1oXclJS5d/Dn0nFNdLzBGz6OGmGUpbbmFLRockpP6pOO4G/RcHWGQgIQXorteSf9vPIMi4
 C7zAyeFPK2LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="491637860"
Received: from irsmsx604.ger.corp.intel.com ([163.33.146.137])
 by fmsmga002.fm.intel.com with ESMTP; 25 Jun 2021 10:57:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 IRSMSX604.ger.corp.intel.com (163.33.146.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 25 Jun 2021 18:57:22 +0100
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.008;
 Fri, 25 Jun 2021 10:57:20 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 4/4] drm/i915/gem: Migrate to system at dma-buf map time
Thread-Topic: [PATCH 4/4] drm/i915/gem: Migrate to system at dma-buf map time
Thread-Index: AQHXaSc1dzuN1f3cQESNhHfcl61w5ask2PrggACFU4D//5sZkIAAf14A//+K6tA=
Date: Fri, 25 Jun 2021 17:57:20 +0000
Message-ID: <6ca4bd4f3fde427ea8e2b0de61bbde65@intel.com>
References: <20210624183110.22582-1-thomas.hellstrom@linux.intel.com>
 <20210624183110.22582-5-thomas.hellstrom@linux.intel.com>
 <5304ae661abb43a0816a485db9d3bbb5@intel.com>
 <cd90ba70-15f8-af0a-8810-2ee7939622a2@linux.intel.com>
 <5e9a46340f254928be6264e4e61eeab8@intel.com>
 <8cffb2f2-4401-2cdf-1ab3-98cc2d879b00@linux.intel.com>
In-Reply-To: <8cffb2f2-4401-2cdf-1ab3-98cc2d879b00@linux.intel.com>
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
MjAyMSAxOjUyIFBNDQo+VG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwu
Y29tPjsgaW50ZWwtDQo+Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KPkNjOiBBdWxkLCBNYXR0aGV3IDxtYXR0aGV3LmF1bGRAaW50ZWwu
Y29tPg0KPlN1YmplY3Q6IFJlOiBbUEFUQ0ggNC80XSBkcm0vaTkxNS9nZW06IE1pZ3JhdGUgdG8g
c3lzdGVtIGF0IGRtYS1idWYgbWFwDQo+dGltZQ0KPg0KPg0KPk9uIDYvMjUvMjEgNzozOCBQTSwg
UnVobCwgTWljaGFlbCBKIHdyb3RlOg0KPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
Pj4gRnJvbTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwu
Y29tPg0KPj4+IFNlbnQ6IEZyaWRheSwgSnVuZSAyNSwgMjAyMSAxMjoxOCBQTQ0KPj4+IFRvOiBS
dWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT47IGludGVsLQ0KPj4+IGdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4+PiBDYzogQXVsZCwgTWF0dGhldyA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4+PiBTdWJq
ZWN0OiBSZTogW1BBVENIIDQvNF0gZHJtL2k5MTUvZ2VtOiBNaWdyYXRlIHRvIHN5c3RlbSBhdCBk
bWEtYnVmDQo+bWFwDQo+Pj4gdGltZQ0KPj4+DQo+Pj4gSGksIE1pY2hhZWwsDQo+Pj4NCj4+PiB0
aGFua3MgZm9yIGxvb2tpbmcgYXQgdGhpcy4NCj4+Pg0KPj4+IE9uIDYvMjUvMjEgNjowMiBQTSwg
UnVobCwgTWljaGFlbCBKIHdyb3RlOg0KPj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4+Pj4+IEZyb206IGRyaS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnPiBPbiBCZWhhbGYNCj5PZg0KPj4+Pj4gVGhvbWFzIEhlbGxzdHLDtm0NCj4+Pj4+IFNl
bnQ6IFRodXJzZGF5LCBKdW5lIDI0LCAyMDIxIDI6MzEgUE0NCj4+Pj4+IFRvOiBpbnRlbC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
Pj4+PiBDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwu
Y29tPjsgQXVsZCwNCj4+PiBNYXR0aGV3DQo+Pj4+PiA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4N
Cj4+Pj4+IFN1YmplY3Q6IFtQQVRDSCA0LzRdIGRybS9pOTE1L2dlbTogTWlncmF0ZSB0byBzeXN0
ZW0gYXQgZG1hLWJ1ZiBtYXANCj4+PiB0aW1lDQo+Pj4+PiBVbnRpbCB3ZSBzdXBwb3J0IHAycCBk
bWEgb3IgYXMgYSBjb21wbGVtZW50IHRvIHRoYXQsIG1pZ3JhdGUgZGF0YQ0KPj4+Pj4gdG8gc3lz
dGVtIG1lbW9yeSBhdCBkbWEtYnVmIG1hcCB0aW1lIGlmIHBvc3NpYmxlLg0KPj4+Pj4NCj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4
LmludGVsLmNvbT4NCj4+Pj4+IC0tLQ0KPj4+Pj4gZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5
MTVfZ2VtX2RtYWJ1Zi5jIHwgOSArKysrKysrKy0NCj4+Pj4+IDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+Pj4+DQo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1Zi5jDQo+Pj4+PiBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9kbWFidWYuYw0KPj4+Pj4gaW5kZXggNjE2YzNhMmYx
YmFmLi5hNTJmODg1YmMwOWEgMTAwNjQ0DQo+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9nZW0vaTkxNV9nZW1fZG1hYnVmLmMNCj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2dlbS9pOTE1X2dlbV9kbWFidWYuYw0KPj4+Pj4gQEAgLTI1LDcgKzI1LDE0IEBAIHN0YXRpYyBz
dHJ1Y3Qgc2dfdGFibGUNCj4+PiAqaTkxNV9nZW1fbWFwX2RtYV9idWYoc3RydWN0DQo+Pj4+PiBk
bWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaG1lDQo+Pj4+PiAJc3RydWN0IHNjYXR0ZXJsaXN0ICpz
cmMsICpkc3Q7DQo+Pj4+PiAJaW50IHJldCwgaTsNCj4+Pj4+DQo+Pj4+PiAtCXJldCA9IGk5MTVf
Z2VtX29iamVjdF9waW5fcGFnZXNfdW5sb2NrZWQob2JqKTsNCj4+Pj4+ICsJcmV0ID0gaTkxNV9n
ZW1fb2JqZWN0X2xvY2tfaW50ZXJydXB0aWJsZShvYmosIE5VTEwpOw0KPj4+PiBIbW0sIEkgYmVs
aWV2ZSBpbiBtb3N0IGNhc2VzIHRoYXQgdGhlIGNhbGxlciBzaG91bGQgYmUgaG9sZGluZyB0aGUN
Cj4+Pj4gbG9jayAob2JqZWN0IGRtYS1yZXN2KSBvbiB0aGlzIG9iamVjdCBhbHJlYWR5Lg0KPj4+
IFllcywgSSBhZ3JlZSwgSW4gcGFydGljdWxhciBmb3Igb3RoZXIgaW5zdGFuY2VzIG9mIG91ciBv
d24gZHJpdmVyLMKgIGF0DQo+Pj4gbGVhc3Qgc2luY2UgdGhlIGRtYV9yZXN2IGludHJvZHVjdGlv
bi4NCj4+Pg0KPj4+IEJ1dCBJIGFsc28gdGhpbmsgdGhhdCdzIGEgcHJlLWV4aXN0aW5nIGJ1Zywg
c2luY2UNCj4+PiBpOTE1X2dlbV9vYmplY3RfcGluX3BhZ2VzX3VubG9ja2VkKCkgd2lsbCBhbHNv
IHRha2UgdGhlIGxvY2suDQo+PiBPdWNoIHllcy4gIE1pc3NlZCB0aGF0Lg0KPj4NCj4+PiBJIFRo
aW5rIHdlIG5lZWQgdG8gaW5pdGlhbGx5IG1ha2UgdGhlIGV4cG9ydGVyIGR5bmFtaWMtY2FwYWJs
ZSB0bw0KPj4+IHJlc29sdmUgdGhpcywgYW5kIGRyb3AgdGhlIGxvY2tpbmcgaGVyZSBjb21wbGV0
ZWx5LCBhcyBkbWEtYnVmIGRvY3Mgc2F5cw0KPj4+IHRoYXQgd2UncmUgdGhlbiBndWFyYW50ZWVk
IHRvIGdldCBjYWxsZWQgd2l0aCB0aGUgb2JqZWN0IGxvY2sgaGVsZC4NCj4+Pg0KPj4+IEkgZmln
dXJlIGlmIHdlIG1ha2UgdGhlIGV4cG9ydGVyIGR5bmFtaWMsIHdlIG5lZWQgdG8gbWlncmF0ZSBh
bHJlYWR5IGF0DQo+Pj4gZG1hX2J1Zl9waW4gdGltZSBzbyB3ZSBkb24ndCBwaW4gdGhlIG9iamVj
dCBpbiB0aGUgd3JvbmcgbG9jYXRpb24uDQo+PiBUaGUgZXhwb3J0ZXIgYXMgZHluYW1pYyAgKG9w
cy0+cGluIGlzIGF2YWlsYWJsZSkgaXMgb3B0aW9uYWwsIGJ1dCBpbXBvcnRlcg0KPj4gZHluYW1p
YyAob3BzLT5tb3ZlX25vdGlmeSkgaXMgcmVxdWlyZWQuDQo+Pg0KPj4gV2l0aCB0aGF0IGluIG1p
bmQsIGl0IHdvdWxkIHNlZW0gdGhhdCB0aGVyZSBhcmUgdGhyZWUgcG9zc2libGUgY29tYmluYXRp
b25zDQo+PiBmb3IgdGhlIG1pZ3JhdGUgdG8gYmUgYXR0ZW1wdGVkOg0KPj4NCj4+IDEpIGluIHRo
ZSBvcHMtPnBpbiBmdW5jdGlvbiAoZXhwb3J0X2R5bmFtaWMgIT0gaW1wb3J0X2R5bmFtaWMsIGR1
cmluZw0KPmF0dGFjaCkNCj4+IDIpIGluIHRoZSBvcHMtPnBpbiBmdW5jdGlvbiAoZXhwb3J0X2R5
bmFtaWMgYW5kDQo+IUNPTkZJR19ETUFCVUZfTU9WRV9OT1RJRlkpIGR1cmluZyBtYXBwaW5nDQo+
PiAzKSBhbmQgcG9zc2libHkgaW4gb3BzLT5tYXBfZG1hX2J1ZiAoZXhvcnRfZHluYW1pYyBpYW5k
DQo+Q09ORklHX0RNQUJVRl9NT1ZFX05PVElGWSkNCj4+DQo+PiBTaW5jZSBvbmUgcG9zc2liaWxp
dHkgaGFzIHRvIGJlIGluIHRoZSBtYXBwaW5nIGZ1bmN0aW9uLCBpdCBzZWVtcyB0aGF0IGlmIHdl
DQo+PiBjYW4gZmlndXJlIG91dCB0aGUgbG9ja2luZywgdGhhdCB0aGUgbWlncmF0ZSBzaG91bGQg
cHJvYmFibHkgYmUgYXZhaWxhYmxlDQo+aGVyZS4NCj4+DQo+PiBNaWtlDQo+DQo+U28gcGVyaGFw
cyBqdXN0IHRvIGluaXRpYWxseSBmaXggdGhlIGJ1Zywgd2UgY291bGQganVzdCBpbXBsZW1lbnQg
Tk9QDQo+cGluKCkgYW5kIHVucGluKCkgY2FsbGJhY2tzIGFuZCBkcm9wIHRoZSBsb2NraW5nIGlu
IG1hcF9hdHRhY2goKSBhbmQNCj5yZXBsYWNlIGl0IHdpdGggYW4gYXNzZXJ0X29iamVjdF9oZWxk
KCk7DQoNClRoYXQgaXMgdGhlIHN0aWNreSBwYXJ0IG9mIHRoZSBtb3ZlIG5vdGlmeSBBUEkuDQoN
CklmIHlvdSBkbyB0aGUgYXR0YWNoX2R5bmFtaWMgeW91IGhhdmUgdG8gaGF2ZSBhbiBvcHMgd2l0
aCBtb3ZlX25vdGlmeS4NCg0KKGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjEz
LXJjNy9zb3VyY2UvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyNMNzMwKQ0KDQpJZiB5b3UgZG9u
J3QgaGF2ZSB0aGF0LCBpLmUuIGp1c3QgdGhlIHBpbiBpbnRlcmZhY2UsIHRoZSBhdHRhY2ggd2ls
bCBiZQ0KcmVqZWN0ZWQsIGFuZCB5b3Ugd2lsbCBub3QgZ2V0IHRoZSBjYWxsYmFja3MuDQoNClNv
IEkgdGhpbmsgdGhhdCB0aGUgb25seSB0aGluZyB3ZSBjYW4gZG8gZm9yIG5vdyBpcyB0byBkb3Ag
dGhlIGxvY2tpbmcgYW5kIGFkZCB0aGUgDQoNCmFzc2VydF9vYmplY3RfaGVsZCgpOw0KDQpNDQoN
Cj4vVGhvbWFzDQo+DQoNCg==
