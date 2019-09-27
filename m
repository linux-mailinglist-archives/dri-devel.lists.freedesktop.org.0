Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D14C015E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 10:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D11F6EE54;
	Fri, 27 Sep 2019 08:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A916EE54
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 08:41:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A3D21ACAA;
 Fri, 27 Sep 2019 08:41:44 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] drm/fb-helper: Synchronize dirty worker with vblank
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190912064230.27972-1-tzimmermann@suse.de>
 <20190912064230.27972-2-tzimmermann@suse.de>
 <20190917130612.GT3958@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <d34d3ce5-a608-3f66-ced3-6bd566ac47a0@suse.de>
Date: Fri, 27 Sep 2019 10:41:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190917130612.GT3958@phenom.ffwll.local>
Content-Language: en-US
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
Cc: feng.tang@intel.com, rong.a.chen@intel.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, ying.huang@intel.com, airlied@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCkFtIDE3LjA5LjE5IHVtIDE1OjA2IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPiBPbiBUaHUs
IFNlcCAxMiwgMjAxOSBhdCAwODo0MjoyOEFNICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToKPj4gQmVmb3JlIHVwZGF0aW5nIHRoZSBkaXNwbGF5IGZyb20gdGhlIGNvbnNvbGUncyBzaGFk
b3cgYnVmZmVyLCB0aGUgZGlydHkKPj4gd29ya2VyIG5vdyB3YWl0cyBmb3IgdmJsYW5rLiBUaGlz
IGFsbG93cyBzZXZlcmFsIHNjcmVlbiB1cGRhdGVzIHRvIHBpbGUKPj4gdXAgYW5kIGFjdHMgYXMg
YSByYXRlIGxpbWl0ZXIuCj4+Cj4+IHYyOgo+PiAJKiBkb24ndCBob2xkIGhlbHBlci0+bG9jayB3
aGlsZSB3YWl0aW5nIGZvciB2YmxhbmsKPj4KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZmJfaGVscGVyLmMgfCAxMCArKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGlu
c2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVs
cGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCj4+IGluZGV4IGE3YmE1YjQ5
MDJkNi4uZDBjYjFmYTRmOTA5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zi
X2hlbHBlci5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMKPj4gQEAg
LTQwMiw4ICs0MDIsMTggQEAgc3RhdGljIHZvaWQgZHJtX2ZiX2hlbHBlcl9kaXJ0eV93b3JrKHN0
cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPj4gICAJCQkJCQkgICAgZGlydHlfd29yayk7Cj4+ICAg
CXN0cnVjdCBkcm1fY2xpcF9yZWN0ICpjbGlwID0gJmhlbHBlci0+ZGlydHlfY2xpcDsKPj4gICAJ
c3RydWN0IGRybV9jbGlwX3JlY3QgY2xpcF9jb3B5Owo+PiArCXN0cnVjdCBkcm1fY3J0YyAqY3J0
YzsKPj4gICAJdW5zaWduZWQgbG9uZyBmbGFnczsKPj4gICAJdm9pZCAqdmFkZHI7Cj4+ICsJaW50
IHJldDsKPj4gKwo+PiArCS8qIHJhdGUtbGltaXQgdXBkYXRlIGZyZXF1ZW5jeSAqLwo+PiArCWNy
dGMgPSBoZWxwZXItPmNsaWVudC5tb2Rlc2V0c1swXS5jcnRjOwo+PiArCXJldCA9IGRybV9jcnRj
X3ZibGFua19nZXQoY3J0Yyk7Cj4+ICsJaWYgKCFyZXQpIHsKPj4gKwkJZHJtX2NydGNfd2FpdF9v
bmVfdmJsYW5rKGNydGMpOwo+IAo+IFdpdGhvdXQgdGhlIGxvY2tpbmcgKHNwZWNpZmljYWxseSwg
cHJldmVudGluZyBvdGhlciBtYXN0ZXJzKSB0aGlzIGNhbiBnbwo+IGJvb20gc2luY2UgaXQgYWdh
aW4gY2FsbHMgZHJtX3ZibGFua19nZXQuIElmIHNvbWVvbmUgdHVybmVkIG9mIHRoZSBkaXNwbGF5
Cj4gbWVhbndoaWxlIHRoYXQgd2lsbCBmYWlsLCBhbmQgcmVzdWx0IGluIGFuIHVuc2lnaHRseSBX
QVJOIGJhY2t0cmFjZS4KPiAKPiBJIHRoaW5rIHdlIG5lZWQgYSBfX2RybV9jcnRjX3dhaXRfb25l
X3ZibGFuayhjcnRjKTsgd2hpY2ggcmVxdWlyZXMgdGhhdAo+IGNhbGxlcnMgaG9sZCBhIGZ1bGwg
dmJsYW5rIHJlZmVyZW5jZSBhbHJlYWR5LiBUaGUgb3RoZXIgaXNzdWUgaXMgdGhhdCB3ZQo+IG1p
Z2h0IHJhY2Ugd2l0aCB0aGUgZGlzYWJsaW5nIGFuZCBoaXQgdGhlIHRpbWVvdXQsIHdoaWNoIGFn
YWluIGdpdmVzIHVzIGFuCj4gdW5zaWdodGx5IFdBUk5JTkcgYmFja3RyYWNlLiBCb3RoIGNhbiBo
YXBwZW4gd2l0aG91dCBsb2NrcyAodGhhdCdzIHdoeSB0aGUKPiBpb2N0bCBwYXRoIG5lZWRzIHRo
ZW0pLCBidXQgd2UgbmVlZCB0byBhdm9pZC4KCkhlcmUncyBhIHN0YXR1cyB1cGRhdGU6IEkndmUg
YmVlbiB3b3JraW5nIG9uIHRoaXMgcGF0Y2ggZm9yIGEgd2hpbGUsIGJ1dCAKdGhlIHdvcmtlciBz
dGlsbCBjYW5ub3Qgd2FpdCByZWxpYWJsZSBmb3IgdmJsYW5rcy4gV2hlbiB0aGUgd29ya2VyIHJ1
bnMsIAp0aGUgZGlzcGxheSBjb3VsZCBiZSBvZmYgYW5kIGhlbmNlIG5vIHZibGFuayBldmVudHMg
b2NjdXIuIFRoYXQncyAKZXNwZWNpYWxseSBhIHByb2JsZW0gZHVyaW5nIGJvb3QuIFRoZSB3b3Jr
ZXIgd2FybnMgYWJvdXQgbWlzc2VkIHZibGFua3MgCmJlY2F1c2UgdGhlIGNvbnNvbGUncyB2aWRl
byBtb2RlIGlzIHN0aWxsIGJlaW5nIHByb2dyYW1tZWQuCgpCZXN0IHJlZ2FyZHMKVGhvbWFzCgo+
IC1EYW5pZWwKPj4gKwkJZHJtX2NydGNfdmJsYW5rX3B1dChjcnRjKTsKPj4gKwl9Cj4+ICAgCj4+
ICAgCXNwaW5fbG9ja19pcnFzYXZlKCZoZWxwZXItPmRpcnR5X2xvY2ssIGZsYWdzKTsKPj4gICAJ
Y2xpcF9jb3B5ID0gKmNsaXA7Cj4+IC0tIAo+PiAyLjIzLjAKPj4KPiAKCi0tIApUaG9tYXMgWmlt
bWVybWFubgpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyClNVU0UgTGludXggR21iSCwgTWF4ZmVs
ZHN0cmFzc2UgNSwgOTA0MDkgTnVlcm5iZXJnLCBHZXJtYW55CkdGOiBGZWxpeCBJbWVuZMO2cmZm
ZXIsIE1hcnkgSGlnZ2lucywgU3JpIFJhc2lhaApIUkIgMjEyODQgKEFHIE7DvHJuYmVyZykKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
