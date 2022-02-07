Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DED4AC19A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 15:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C285B10F823;
	Mon,  7 Feb 2022 14:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91AF10E637;
 Mon,  7 Feb 2022 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644245263; x=1675781263;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kgPwBR+/spGQXe9uh88XxmDQVJnI4ZPxUPENi9XUOJQ=;
 b=cWgCFY7ihdqOzE2K+4/YN1EYAblfz5RmOQw4Eq8u016ufXJQD8GbU0dM
 3/DOE+BeRe6/MJ7H5CxaP++l+WBf9ymKfQOTTl0CLlesBuUbw/AJiS2xS
 9faVj0qAO5+1wfs0s4yOSnrjsg4DywlLe2qbobNiTypqDiSipK+0+zHq2
 ABQcvi8lbc05xPAJqav9a1Q+54MmDAVnns89adCbHFvS+MF5xyyUVR5X/
 dEc7/c1WK027uVvLBqroMa73yxd17/ZLC9nqzQypvfKI9Mw5/5iMoGNla
 vCO7ivDVKYVRrFrHn66Uuf+B39AD8qh0ESOKf2vb6MHUop+ygM5iqVb/L A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="247564182"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="247564182"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 06:47:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="677776733"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2022 06:47:43 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 7 Feb 2022 06:47:42 -0800
Received: from bgsmsx606.gar.corp.intel.com (10.67.234.8) by
 BGSMSX604.gar.corp.intel.com (10.67.234.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 7 Feb 2022 20:17:40 +0530
Received: from bgsmsx606.gar.corp.intel.com ([10.67.234.8]) by
 BGSMSX606.gar.corp.intel.com ([10.67.234.8]) with mapi id 15.01.2308.020;
 Mon, 7 Feb 2022 20:17:40 +0530
From: "C, Ramalingam" <ramalingam.c@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Subject: Re: [RFC 0/2] drm/i915/ttm: Evict and store of compressed object
Thread-Topic: [RFC 0/2] drm/i915/ttm: Evict and store of compressed object
Thread-Index: AQHYHAZXrpG0oCxnkEmRIDTm0RBZo6yHmy6AgACA+ID//6/5gIAAXs+A
Date: Mon, 7 Feb 2022 14:47:40 +0000
Message-ID: <ad3d326ab82248c7baa3b2726d063250@intel.com>
References: <20220207093743.14467-1-ramalingam.c@intel.com>
 <1a195c03-d2a9-d35e-7b62-a8b70a5c21b3@amd.com>
 <20220207135335.GA15175@intel.com>
 <aa92b781-b1cf-04ea-7073-d53651d72579@amd.com>
In-Reply-To: <aa92b781-b1cf-04ea-7073-d53651d72579@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
x-ms-exchange-imapappendstamp: BGSMSX606.gar.corp.intel.com (15.01.2308.020)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [10.223.10.1]
Content-Type: text/plain; charset="utf-8"
Content-ID: <36FA6B35E58C1B4D9ABDBE71C6103081@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, "Hellstrom,
 Thomas" <thomas.hellstrom@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMi0wMi0wNyBhdCAxNTozNzowOSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToN
Cj4gQW0gMDcuMDIuMjIgdW0gMTQ6NTMgc2NocmllYiBSYW1hbGluZ2FtIEM6DQo+ID4gT24gMjAy
Mi0wMi0wNyBhdCAxMjo0MTo1OSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4gPiA+
IEFtIDA3LjAyLjIyIHVtIDEwOjM3IHNjaHJpZWIgUmFtYWxpbmdhbSBDOg0KPiA+ID4gPiBPbiBm
bGF0LWNjcyBjYXBhYmxlIHBsYXRmb3JtIHdlIG5lZWQgdG8gZXZpY3QgYW5kIHJlc29yZSB0aGUg
Y2NzIGRhdGENCj4gPiA+ID4gYWxvbmcgd2l0aCB0aGUgY29ycmVzcG9uZGluZyBtYWluIG1lbW9y
eS4NCj4gPiA+ID4gDQo+ID4gPiA+IFRoaXMgY2NzIGRhdGEgY2FuIG9ubHkgYmUgYWNjZXNzIHRo
cm91Z2ggQkxUIGVuZ2luZSB0aHJvdWdoIGEgc3BlY2lhbA0KPiA+ID4gPiBjbWQgKCApDQo+ID4g
PiA+IA0KPiA+ID4gPiBUbyBzdXBwb3J0IGFib3ZlIHJlcXVpcmVtZW50IG9mIGZsYXQtY2NzIGVu
YWJsZWQgaTkxNSBwbGF0Zm9ybXMgdGhpcw0KPiA+ID4gPiBzZXJpZXMgYWRkcyBuZXcgcGFyYW0g
Y2FsbGVkIGNjc19wYWdlc19uZWVkZWQgdG8gdGhlIHR0bV90dF9pbml0KCksDQo+ID4gPiA+IHRv
IGluY3JlYXNlIHRoZSB0dG1fdHQtPm51bV9wYWdlcyBvZiBzeXN0ZW0gbWVtb3J5IHdoZW4gdGhl
IG9iaiBoYXMgdGhlDQo+ID4gPiA+IGxtZW0gcGxhY2VtZW50IHBvc3NpYmlsaXR5Lg0KPiA+ID4g
V2VsbCBxdWVzdGlvbiBpcyB3aHkgaXNuJ3QgdGhlIGJ1ZmZlciBvYmplY3QgYWxsb2NhdGVkIHdp
dGggdGhlIGV4dHJhIHNwYWNlDQo+ID4gPiBpbiB0aGUgZmlyc3QgcGxhY2U/DQo+ID4gSGkgQ2hy
aXN0aWFuLA0KPiA+IA0KPiA+IE9uIFhlLUhQIGFuZCBsYXRlciBkZXZpY2VzLCB3ZSB1c2UgZGVk
aWNhdGVkIGNvbXByZXNzaW9uIGNvbnRyb2wgc3RhdGUgKENDUykNCj4gPiBzdG9yZWQgaW4gbG9j
YWwgbWVtb3J5IGZvciBlYWNoIHN1cmZhY2UsIHRvIHN1cHBvcnQgdGhlIDNEIGFuZCBtZWRpYQ0K
PiA+IGNvbXByZXNzaW9uIGZvcm1hdHMuDQo+ID4gDQo+ID4gVGhlIG1lbW9yeSByZXF1aXJlZCBm
b3IgdGhlIENDUyBvZiB0aGUgZW50aXJlIGxvY2FsIG1lbW9yeSBpcyAxLzI1NiBvZiB0aGUNCj4g
PiBsb2NhbCBtZW1vcnkgc2l6ZS4gU28gYmVmb3JlIHRoZSBrZXJuZWwgYm9vdCwgdGhlIHJlcXVp
cmVkIG1lbW9yeSBpcyByZXNlcnZlZA0KPiA+IGZvciB0aGUgQ0NTIGRhdGEgYW5kIGEgc2VjdXJl
IHJlZ2lzdGVyIHdpbGwgYmUgcHJvZ3JhbW1lZCB3aXRoIHRoZSBDQ1MgYmFzZQ0KPiA+IGFkZHJl
c3MNCj4gPiANCj4gPiBTbyB3aGVuIHdlIGFsbG9jYXRlIGEgb2JqZWN0IGluIGxvY2FsIG1lbW9y
eSB3ZSBkb250IG5lZWQgdG8gZXhwbGljaXRseQ0KPiA+IGFsbG9jYXRlIHRoZSBzcGFjZSBmb3Ig
Y2NzIGRhdGEuIEJ1dCB3aGVuIHdlIGV2aWN0IHRoZSBvYmogaW50byB0aGUgc21lbQ0KPiA+ICAg
dG8gaG9sZCB0aGUgY29tcHJlc3Npb24gcmVsYXRlZCBkYXRhIGFsb25nIHdpdGggdGhlIG9iaiB3
ZSBuZWVkIHNtZW0NCj4gPiAgIHNwYWNlIG9mIG9ial9zaXplICsgKG9ial9zaXplLzI1NikuDQo+
ID4gDQo+ID4gICBIZW5jZSB3aGVuIHdlIGNyZWF0ZSBzbWVtIGZvciBhbiBvYmogd2l0aCBsbWVt
IHBsYWNlbWVudCBwb3NzaWJpbGl0eSB3ZQ0KPiA+ICAgY3JlYXRlIHdpdGggdGhlIGV4dHJhIHNw
YWNlLg0KPiANCj4gRXhhY3RseSB0aGF0J3Mgd2hhdCBJJ3ZlIGJlZW4gbWlzc2luZyBpbiB0aGUg
Y292ZXIgbGV0dGVyIGFuZC9vciBjb21taXQNCj4gbWVzc2FnZXMsIGNvbW1lbnRzIGV0Yy4uDQo+
IA0KPiBPdmVyIGFsbCBzb3VuZHMgbGlrZSBhIHZhbGlkIGV4cGxhbmF0aW9uIHRvIG1lLCBqdXN0
IG9uZSBjb21tZW50IG9uIHRoZQ0KPiBjb2RlL25hbWluZzoNCj4gDQo+ID4gICBpbnQgdHRtX3R0
X2luaXQoc3RydWN0IHR0bV90dCAqdHRtLCBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLA0K
PiA+IC0JCXVpbnQzMl90IHBhZ2VfZmxhZ3MsIGVudW0gdHRtX2NhY2hpbmcgY2FjaGluZykNCj4g
PiArCQl1aW50MzJfdCBwYWdlX2ZsYWdzLCBlbnVtIHR0bV9jYWNoaW5nIGNhY2hpbmcsDQo+ID4g
KwkJdW5zaWduZWQgbG9uZyBjY3NfcGFnZXMpDQo+IA0KPiBQbGVhc2UgZG9uJ3QgdHJ5IHRvIGxl
YWsgYW55IGk5MTUgc3BlY2lmaWMgc3R1ZmYgaW50byBjb21tb24gVFRNIGNvZGUuDQo+IA0KPiBG
b3IgZXhhbXBsZSB1c2UgdGhlIHdvcmRpbmcgZXh0cmFfcGFnZXMgaW5zdGVhZCBvZiBjY3NfcGFn
ZXMgaGVyZS4NCj4gDQo+IEFwYXJ0IGZyb20gdGhhdCBsb29rcyBnb29kIHRvIG1lLA0KDQpUaGFu
ayB5b3UuIEkgd2lsbCBhZGRyZXNzIHRoZSBjb21tZW50cyBvbiBuYW1pbmcuDQoNClJhbQ0KPiBD
aHJpc3RpYW4uDQo+IA0KPiA+IA0KPiA+ICAgUmFtLg0KPiA+ID4gUmVnYXJkcywNCj4gPiA+IENo
cmlzdGlhbi4NCj4gPiA+IA0KPiA+ID4gPiBUaGlzIHdpbGwgYmUgb24gdG9wIG9mIHRoZSBmbGF0
LWNjcyBlbmFibGluZyBzZXJpZXMNCj4gPiA+ID4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJv
dGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZyUyRnNlcmllcyUyRjk1Njg2JTJGJmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3RpYW4u
a29lbmlnJTQwYW1kLmNvbSU3Q2U1NGJiNzU3NmEzMzRhNzZjYWIwMDhkOWVhNDEzOGU1JTdDM2Rk
ODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzc5ODM4ODExNTI1Mjcy
NyU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJs
dU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJmFtcDtzZGF0YT1WOXdR
WnZiMEp3dHBsSUJTWVlYR3pyZyUyQkVNdm40aGZrc2N6aVBGRHZaRFklM0QmYW1wO3Jlc2VydmVk
PTANCj4gPiA+ID4gDQo+ID4gPiA+IEZvciBtb3JlIGFib3V0IGZsYXQtY2NzIGZlYXR1cmUgcGxl
YXNlIGhhdmUgYSBsb29rIGF0DQo+ID4gPiA+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3Rl
Y3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnBhdGNod29yay5mcmVlZGVza3Rv
cC5vcmclMkZwYXRjaCUyRjQ3MTc3NyUyRiUzRnNlcmllcyUzRDk1Njg2JTI2cmV2JTNENSZhbXA7
ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0NlNTRiYjc1NzZhMzM0
YTc2Y2FiMDA4ZDllYTQxMzhlNSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdD
MCU3QzAlN0M2Mzc3OTgzODgxMTUyNTI3MjclN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lq
b2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4w
JTNEJTdDMzAwMCZhbXA7c2RhdGE9YVlqb1RLTWJadmklMkZucjdoa1NINFNZR3haSXY4RGoyMTBk
TnJCblVOcFF3JTNEJmFtcDtyZXNlcnZlZD0wDQo+ID4gPiA+IA0KPiA+ID4gPiBUZXN0aW5nIG9m
IHRoZSBzZXJpZXMgaXMgV0lQIGFuZCBsb29raW5nIGZvcndhcmQgZm9yIHRoZSBlYXJseSByZXZp
ZXcgb24NCj4gPiA+ID4gdGhlIGFtZW5kbWVudCB0byB0dG1fdHRfaW5pdCBhbmQgdGhlIGFwcHJv
YWNoLg0KPiA+ID4gPiANCj4gPiA+ID4gUmFtYWxpbmdhbSBDICgyKToNCj4gPiA+ID4gICAgIGRy
bS9pOTE1L3R0bTogQWRkIGV4dHJhIHBhZ2VzIGZvciBoYW5kbGluZyBjY3MgZGF0YQ0KPiA+ID4g
PiAgICAgZHJtL2k5MTUvbWlncmF0ZTogRXZpY3QgYW5kIHJlc3RvcmUgdGhlIGNjcyBkYXRhDQo+
ID4gPiA+IA0KPiA+ID4gPiAgICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5j
ICAgICAgfCAgIDIgKy0NCj4gPiA+ID4gICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVf
Z2VtX3R0bS5jICAgIHwgIDIzICstDQo+ID4gPiA+ICAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0
L2ludGVsX21pZ3JhdGUuYyAgICB8IDI4MyArKysrKysrKysrKy0tLS0tLS0tLS0NCj4gPiA+ID4g
ICAgZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMgICAgICAgICAgICAgIHwgICAyICstDQo+
ID4gPiA+ICAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2FncF9iYWNrZW5kLmMgICAgICB8ICAg
MiArLQ0KPiA+ID4gPiAgICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jICAgICAgICAgICAg
ICAgfCAgMTIgKy0NCj4gPiA+ID4gICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRt
X2J1ZmZlci5jIHwgICAyICstDQo+ID4gPiA+ICAgIGluY2x1ZGUvZHJtL3R0bS90dG1fdHQuaCAg
ICAgICAgICAgICAgICAgICB8ICAgNCArLQ0KPiA+ID4gPiAgICA4IGZpbGVzIGNoYW5nZWQsIDE5
MSBpbnNlcnRpb25zKCspLCAxMzkgZGVsZXRpb25zKC0pDQo+ID4gPiA+IA0KPiANCg==
