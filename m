Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F6D45A94D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 17:53:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECD989E98;
	Tue, 23 Nov 2021 16:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0BA89E36;
 Tue, 23 Nov 2021 16:53:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="221939923"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; d="scan'208";a="221939923"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 08:53:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; d="scan'208";a="571119172"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 23 Nov 2021 08:53:16 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 23 Nov 2021 08:53:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 23 Nov 2021 08:53:15 -0800
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2242.012;
 Tue, 23 Nov 2021 08:53:15 -0800
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH 3/3] drm/i915/gt: Improve "race-to-idle" at low frequencies
Thread-Topic: [PATCH 3/3] drm/i915/gt: Improve "race-to-idle" at low
 frequencies
Thread-Index: AQHX4ErjAawfEDBvGU+7rscWy4C/pKwR2rwA
Date: Tue, 23 Nov 2021 16:53:14 +0000
Message-ID: <2eda9ab66fc4ed5c11e467a6e31d801043759ff0.camel@intel.com>
References: <20211117224955.28999-1-vinay.belgaumkar@intel.com>
 <20211117224955.28999-4-vinay.belgaumkar@intel.com>
 <YZvk8HDtluq0i5e5@intel.com>
 <54ceb734-7b9b-d655-b8b5-39c656f8022e@linux.intel.com>
In-Reply-To: <54ceb734-7b9b-d655-b8b5-39c656f8022e@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <47596126015DC54BB82E623068FDE569@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIxLTExLTIzIGF0IDA5OjE3ICswMDAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToN
Cj4gDQo+IE9uIDIyLzExLzIwMjEgMTg6NDQsIFJvZHJpZ28gVml2aSB3cm90ZToNCj4gPiBPbiBX
ZWQsIE5vdiAxNywgMjAyMSBhdCAwMjo0OTo1NVBNIC0wODAwLCBWaW5heSBCZWxnYXVta2FyIHdy
b3RlOg0KPiA+ID4gRnJvbTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+
DQo+ID4gPiANCj4gPiA+IFdoaWxlIHRoZSBwb3dlciBjb25zdW1wdGlvbiBpcyBwcm9wb3J0aW9u
YWwgdG8gdGhlIGZyZXF1ZW5jeSwNCj4gPiA+IHRoZXJlIGlzDQo+ID4gPiBhbHNvIGEgc3RhdGlj
IGRyYXcgZm9yIGFjdGl2ZSBnYXRlcy4gVGhlIGxvbmdlciB3ZSBhcmUgYWJsZSB0bw0KPiA+ID4g
cG93ZXJnYXRlDQo+ID4gPiAocmM2KSwgdGhlIGxvd2VyIHRoZSBzdGF0aWMgZHJhdy4gVGh1cyB0
aGVyZSBpcyBhIHN3ZWV0c3BvdCBpbg0KPiA+ID4gdGhlDQo+ID4gPiBmcmVxdWVuY3kvcG93ZXIg
Y3VydmUgd2hlcmUgd2UgcnVuIGF0IGhpZ2hlciBmcmVxdWVuY3kgaW4gb3JkZXINCj4gPiA+IHRv
IHNsZWVwDQo+ID4gPiBsb25nZXIsIGFrYSByYWNlLXRvLWlkbGUuIFRoaXMgaXMgbW9yZSBldmlk
ZW50IGF0IGxvd2VyDQo+ID4gPiBmcmVxdWVuY2llcywgc28NCj4gPiA+IGxldCdzIGxvb2sgdG8g
YnVtcCB0aGUgZnJlcXVlbmN5IGlmIHdlIHRoaW5rIHdlIHdpbGwgYmVuZWZpdCBieQ0KPiA+ID4g
c2xlZXBpbmcNCj4gPiA+IGxvbmdlciBhdCB0aGUgaGlnaGVyIGZyZXF1ZW5jeSBhbmQgc28gY29u
c2VydmluZyBwb3dlci4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29u
IDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+DQo+ID4gPiBDYzogVmluYXkgQmVsZ2F1bWthciA8
dmluYXkuYmVsZ2F1bWthckBpbnRlbC5jb20+DQo+ID4gPiBDYzogVHZydGtvIFVyc3VsaW4gPHR2
cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNvbT4NCj4gPiANCj4gPiBQbGVhc2UgbGV0J3Mgbm90
IGluY3JlYXNlIHRoZSBjb21wbGV4aXR5IGhlcmUsIHVubGVzcyB3ZSBoYXZlIGENCj4gPiB2ZXJ5
IGdvb2QNCj4gPiBhbmQgZG9jdW1lbnRlZCByZWFzb24uDQo+ID4gDQo+ID4gQmVmb3JlIHRyeWlu
ZyB0byBpbXBsZW1lbnQgYW55dGhpbmcgc21hcnQgbGlrZSB0aGlzIGluIHRoZSBkcml2ZXINCj4g
PiBJJ2QgbGlrZQ0KPiA+IHRvIHNlZSBkYXRhLCBwb3dlciBhbmQgcGVyZm9ybWFuY2UgcmVzdWx0
cyBpbiBkaWZmZXJlbnQgcGxhdGZvcm1zDQo+ID4gYW5kIHdpdGgNCj4gPiBkaWZmZXJlbnQgd29y
a2xvYWRzLg0KPiANCj4gV2hvIGhhcyBzdWNoIHRlc3Qgc3VpdGUgYW5kIHRlc3QgZmFybSB3aGlj
aCBpc24ndCBmb2N1c2VkIHRvDQo+IHdvcmtsb2FkcyANCj4gZnJvbSBhIHNpbmdsZSBjdXN0b21l
cj8gOygNCg0KT2theSwgbWF5YmUgd2UgZG9uJ3QgbmVlZCB0byBjb3ZlciB0aGUgd29ybGQgaGVy
ZS4gQnV0IHdpdGhvdXQgc2VlbiBhbnkNCmRhdGEgYXQgYWxsIGl0IGlzIGhhcmQgdG8gbWFrZSB0
aGlzIGNhbGwuDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBUdnJ0a28NCg0K
