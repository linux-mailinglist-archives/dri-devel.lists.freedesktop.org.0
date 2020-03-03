Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B178B17789F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 15:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8A489F8B;
	Tue,  3 Mar 2020 14:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7524189F8B;
 Tue,  3 Mar 2020 14:18:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Mar 2020 06:18:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; d="scan'208";a="440572462"
Received: from swatish2-mobl1.gar.corp.intel.com (HELO [10.66.115.214])
 ([10.66.115.214])
 by fmsmga006.fm.intel.com with ESMTP; 03 Mar 2020 06:18:39 -0800
Subject: Re: [PATCH 02/12] drm/i915: Polish CHV .load_luts() a bit
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20191107151725.10507-1-ville.syrjala@linux.intel.com>
 <20191107151725.10507-3-ville.syrjala@linux.intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Organization: Intel
Message-ID: <47e35997-28b0-f21d-e1f8-fbcd3fab7eb5@intel.com>
Date: Tue, 3 Mar 2020 19:48:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20191107151725.10507-3-ville.syrjala@linux.intel.com>
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmlsbGUsCkNhbiB5b3UgcGxlYXNlIHJlYmFzZSB0aGUgc2VyaWVzPyBUaGVyZSBhcmUgaW50
ZWxfZGVfd3JpdGUoKQpjaGFuZ2VzIGluIGV4aXN0aW5nIGNvZGUuCgpPbiAwNy1Ob3YtMTkgODo0
NyBQTSwgVmlsbGUgU3lyamFsYSB3cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IAo+IEl0IGlya3MgbWUgdG8gdXNlIGNydGNfc3Rh
dGVfaXNfbGVnYWN5X2dhbW1hKCkgaW5zaWRlIHRoZSBndXRzCj4gb2YgdGhlIENIViBjb2xvciBt
YW5hZ2VtZW50IGNvZGUuIExldCdzIGdldCByaWQgb2YgaXQgYW5kIGluc3RlYWQKPiBqdXN0IGNv
bnN1bHQgY2dtX21vZGUgdG8gZmlndXJlIG91dCBpZiB3ZSB3YW50IHRvIGVuYWJsZSB0aGUgcGlw
ZQo+IGdhbW1hIG9yIHRoZSBDR00gZ2FtbWEuCj4gCj4gQWxzbyBDSFYgZGlzcGxheSBlbmdpbmUg
aXMgYmFzZWQgb24gaTk2NS9nNHggc28gd2Ugc2hvdWxkIGZhbGwgYmFjawo+IHRvIHRoZSBpOTY1
IHBhdGggd2hlbiB0aGUgQ0dNIGdhbW1hIGlzIG5vdCB1c2VkLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4g
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMgfCAxMSArKysrLS0t
LS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xv
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jCj4gaW5kZXgg
Mzk4MGU4YjUwYzI4Li5kOGVlOTBiNzc3NGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9jb2xvci5jCj4gQEAgLTk5NiwxNiArOTk2LDEzIEBAIHN0YXRpYyB2b2lk
IGNodl9sb2FkX2x1dHMoY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUp
Cj4gICAKPiAgIAljaGVycnl2aWV3X2xvYWRfY3NjX21hdHJpeChjcnRjX3N0YXRlKTsKPiAgIAo+
IC0JaWYgKGNydGNfc3RhdGVfaXNfbGVnYWN5X2dhbW1hKGNydGNfc3RhdGUpKSB7Cj4gLQkJaTl4
eF9sb2FkX2x1dHMoY3J0Y19zdGF0ZSk7Cj4gLQkJcmV0dXJuOwo+IC0JfQo+IC0KPiAtCWlmIChk
ZWdhbW1hX2x1dCkKPiArCWlmIChjcnRjX3N0YXRlLT5jZ21fbW9kZSAmIENHTV9QSVBFX01PREVf
REVHQU1NQSkKPiAgIAkJY2h2X2xvYWRfY2dtX2RlZ2FtbWEoY3J0YywgZGVnYW1tYV9sdXQpOwo+
ICAgCj4gLQlpZiAoZ2FtbWFfbHV0KQo+ICsJaWYgKGNydGNfc3RhdGUtPmNnbV9tb2RlICYgQ0dN
X1BJUEVfTU9ERV9HQU1NQSkKPiAgIAkJY2h2X2xvYWRfY2dtX2dhbW1hKGNydGMsIGdhbW1hX2x1
dCk7Cj4gKwllbHNlCj4gKwkJaTk2NV9sb2FkX2x1dHMoY3J0Y19zdGF0ZSk7Cj4gICB9Cj4gICAK
PiAgIHZvaWQgaW50ZWxfY29sb3JfbG9hZF9sdXRzKGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0
YXRlICpjcnRjX3N0YXRlKQo+IApSZXZpZXdlZC1ieTogU3dhdGkgU2hhcm1hIDxzd2F0aTIuc2hh
cm1hQGludGVsLmNvbT4KCi0tIAp+U3dhdGkgU2hhcm1hCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
