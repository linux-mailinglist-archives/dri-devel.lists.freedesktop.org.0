Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D196722EC16
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 14:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4029689C9A;
	Mon, 27 Jul 2020 12:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 50BB689C9A;
 Mon, 27 Jul 2020 12:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 3F39D2A6045;
 Mon, 27 Jul 2020 14:27:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id VKEqNT_Z5kPt; Mon, 27 Jul 2020 14:27:04 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id A0A002A6042;
 Mon, 27 Jul 2020 14:27:03 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1k02Dn-000hMZ-Ea; Mon, 27 Jul 2020 14:27:02 +0200
Subject: Re: [PATCH v5 1/5] drm/i915: Add enable/disable flip done and flip
 done handler
To: Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, intel-gfx@lists.freedesktop.org
References: <20200720113117.16131-1-karthik.b.s@intel.com>
 <20200720113117.16131-2-karthik.b.s@intel.com>
 <d67715965a3de220137db377953da700944e89e6.camel@intel.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <f00f637e-639e-5d12-83bd-274ad0a23abe@daenzer.net>
Date: Mon, 27 Jul 2020 14:27:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d67715965a3de220137db377953da700944e89e6.camel@intel.com>
Content-Language: en-CA
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com,
 nicholas.kazlauskas@amd.com, dri-devel@lists.freedesktop.org,
 daniel.vetter@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNy0yNSAxOjI2IGEubS4sIFBhdWxvIFphbm9uaSB3cm90ZToKPiBFbSBzZWcsIDIw
MjAtMDctMjAgw6BzIDE3OjAxICswNTMwLCBLYXJ0aGlrIEIgUyBlc2NyZXZldToKPj4KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmMgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9pOTE1X2lycS5jCj4+IGluZGV4IDFmYTY3NzAwZDhmNC4uOTU5NTNiMzkzOTQxIDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2lycS5jCj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmMKPj4gQEAgLTY5NywxNCArNjk3LDI0IEBAIHUz
MiBpOTE1X2dldF92YmxhbmtfY291bnRlcihzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4+ICAJcmV0
dXJuICgoKGhpZ2gxIDw8IDgpIHwgbG93KSArIChwaXhlbCA+PSB2Ymxfc3RhcnQpKSAmIDB4ZmZm
ZmZmOwo+PiAgfQo+PiAgCj4+ICtzdGF0aWMgdTMyIGc0eF9nZXRfZmxpcF9jb3VudGVyKHN0cnVj
dCBkcm1fY3J0YyAqY3J0YykKPj4gK3sKPj4gKwlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2
X3ByaXYgPSB0b19pOTE1KGNydGMtPmRldik7Cj4+ICsJZW51bSBwaXBlIHBpcGUgPSB0b19pbnRl
bF9jcnRjKGNydGMpLT5waXBlOwo+PiArCj4+ICsJcmV0dXJuIEk5MTVfUkVBRChQSVBFX0ZMSVBD
T1VOVF9HNFgocGlwZSkpOwo+PiArfQo+PiArCj4+ICB1MzIgZzR4X2dldF92YmxhbmtfY291bnRl
cihzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4+ICB7Cj4+ICAJc3RydWN0IGRybV9pOTE1X3ByaXZh
dGUgKmRldl9wcml2ID0gdG9faTkxNShjcnRjLT5kZXYpOwo+PiAgCWVudW0gcGlwZSBwaXBlID0g
dG9faW50ZWxfY3J0YyhjcnRjKS0+cGlwZTsKPj4gIAo+PiArCWlmIChjcnRjLT5zdGF0ZS0+YXN5
bmNfZmxpcCkKPj4gKwkJcmV0dXJuIGc0eF9nZXRfZmxpcF9jb3VudGVyKGNydGMpOwo+PiArCj4+
ICAJcmV0dXJuIEk5MTVfUkVBRChQSVBFX0ZSTUNPVU5UX0c0WChwaXBlKSk7Cj4gCj4gSSBkb24n
dCB1bmRlcnN0YW5kIHRoZSBpbnRlbnRpb24gYmVoaW5kIHRoaXMsIGNhbiB5b3UgcGxlYXNlIGNs
YXJpZnk/Cj4gVGhpcyBnb2VzIGJhY2sgdG8gbXkgcmVwbHkgb2YgdGhlIGNvdmVyIGxldHRlci4g
SXQgc2VlbXMgdGhhdCBoZXJlCj4gd2UncmUgZ29pbmcgdG8gYWx0ZXJuYXRlIGJldHdlZW4gdHdv
IGRpZmZlcmVudCBjb3VudGVycyBpbiBvdXIgdmJsYW5rCj4gY291bnQuIFNvIGlmIHVzZXIgc3Bh
Y2UgYWx0ZXJuYXRlcyBiZXR3ZWVuIHNvbWV0aW1lcyB1c2luZyBhc3luYyBmbGlwcwo+IGFuZCBz
b21ldGltZXMgdXNpbmcgbm9ybWFsIGZsaXAgaXQncyBnb2luZyB0byBnZXQgc29tZSB2ZXJ5IHdl
aXJkCj4gZGVsdGFzLCBpc24ndCBpdD8gQXQgbGVhc3QgdGhpcyBpcyB3aGF0IEkgcmVtZW1iZXIg
ZnJvbSB3aGVuIEkgcGxheWVkCj4gd2l0aCB0aGVzZSByZWdpc3RlcnM6IEZMSVBDT1VOVCBkcmlm
dHMgYXdheSBmcm9tIEZSTUNPVU5UIHdoZW4gd2Ugc3RhcnQKPiB1c2luZyBhc3luYyBmbGlwcy4K
ClRoaXMgZGVmaW5pdGVseSBsb29rcyB3cm9uZy4gVGhlIGNvdW50ZXIgdmFsdWUgcmV0dXJuZWQg
YnkgdGhlCmdldF92YmxhbmtfY291bnRlciBob29rIGlzIHN1cHBvc2VkIHRvIGluY3JlbWVudCB3
aGVuIGEgdmVydGljYWwgYmxhbmsKcGVyaW9kIG9jY3VyczsgcGFnZSBmbGlwcyBhcmUgbm90IHN1
cHBvc2VkIHRvIGFmZmVjdCB0aGlzIGluIGFueSB3YXkuCgoKLS0gCkVhcnRobGluZyBNaWNoZWwg
RMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20K
TGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2Eg
YW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
