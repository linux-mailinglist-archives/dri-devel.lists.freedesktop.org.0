Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B90425AC42
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 15:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA976E0D0;
	Wed,  2 Sep 2020 13:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044956E0D0;
 Wed,  2 Sep 2020 13:47:25 +0000 (UTC)
IronPort-SDR: jRw0wUoWcGjAMBzsFbfzCSSU3eH0FvG5cKkD34l+tr8nIEfgFE1Eou3MBDsRm+AnSMi4W+LLST
 LDetqDW2aTgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="154888999"
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="154888999"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 06:47:18 -0700
IronPort-SDR: 61LkKI970L0G3dBLbQelgx377UbX6S0akhvg/wfLWiwnLz1bnXodQ4up0b1SWGsBWb7sQwvY9Q
 4Of63o9VGYZA==
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="477644672"
Received: from kbs1-mobl1.gar.corp.intel.com (HELO [10.215.142.42])
 ([10.215.142.42])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 06:47:15 -0700
Subject: Re: [PATCH v6 4/7] drm/i915: Do not call drm_crtc_arm_vblank_event in
 async flips
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20200807093551.10673-1-karthik.b.s@intel.com>
 <20200807093551.10673-5-karthik.b.s@intel.com>
 <20200901112346.GI6112@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <95cc77c0-4870-fe50-4e51-6f855278f046@intel.com>
Date: Wed, 2 Sep 2020 19:17:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200901112346.GI6112@intel.com>
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 vandita.kulkarni@intel.com, uma.shankar@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA5LzEvMjAyMCA0OjUzIFBNLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gT24gRnJpLCBB
dWcgMDcsIDIwMjAgYXQgMDM6MDU6NDhQTSArMDUzMCwgS2FydGhpayBCIFMgd3JvdGU6Cj4+IFNp
bmNlIHRoZSBmbGlwIGRvbmUgZXZlbnQgd2lsbCBiZSBzZW50IGluIHRoZSBmbGlwX2RvbmVfaGFu
ZGxlciwKPj4gbm8gbmVlZCB0byBhZGQgdGhlIGV2ZW50IHRvIHRoZSBsaXN0IGFuZCBkZWxheSBp
dCBmb3IgbGF0ZXIuCj4+Cj4+IHYyOiAtTW92ZWQgdGhlIGFzeW5jIGNoZWNrIGFib3ZlIHZibGFu
a19nZXQgYXMgaXQKPj4gICAgICAgd2FzIGNhdXNpbmcgaXNzdWVzIGZvciBQU1IuCj4+Cj4+IHYz
OiAtTm8gbmVlZCB0byB3YWl0IGZvciB2YmxhbmsgdG8gcGFzcywgYXMgdGhpcyB3YWl0IHdhcyBj
YXVzaW5nIGEKPj4gICAgICAgMTZtcyBkZWxheSBvbmNlIGV2ZXJ5IGZldyBmbGlwcy4KPj4KPj4g
djQ6IC1SZWJhc2VkLgo+Pgo+PiB2NTogLVJlYmFzZWQuCj4+Cj4+IHY2OiAtUmViYXNlZC4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogS2FydGhpayBCIFMgPGthcnRoaWsuYi5zQGludGVsLmNvbT4KPj4g
U2lnbmVkLW9mZi1ieTogVmFuZGl0YSBLdWxrYXJuaSA8dmFuZGl0YS5rdWxrYXJuaUBpbnRlbC5j
b20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfc3ByaXRl
LmMgfCA4ICsrKysrKystCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9zcHJpdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfc3By
aXRlLmMKPj4gaW5kZXggYzI2Y2EwMjlmYzBhLi4yYjJkOTZjNTlkN2YgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfc3ByaXRlLmMKPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zcHJpdGUuYwo+PiBAQCAtOTMsNiArOTMs
OSBAQCB2b2lkIGludGVsX3BpcGVfdXBkYXRlX3N0YXJ0KGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRj
X3N0YXRlICpuZXdfY3J0Y19zdGF0ZSkKPj4gICAJREVGSU5FX1dBSVQod2FpdCk7Cj4+ICAgCXUz
MiBwc3Jfc3RhdHVzOwo+PiAgIAo+PiArCWlmIChuZXdfY3J0Y19zdGF0ZS0+dWFwaS5hc3luY19m
bGlwKQo+PiArCQlnb3RvIGlycV9kaXNhYmxlOwo+IAo+IFdlIHNob3VsZG4ndCByZWFsbHkgbmVl
ZCB0aGUgaXJxIGRpc2FibGUgYXQgYWxsIGlmIHdlIGRvbid0IGRvIHRoZQo+IHZibGFuayBldmFk
ZS4gQW5kIGlmIHdlIG9ubHkgd3JpdGUgY3RsK3N1cmYgdGhlbiBhdG9taWNpdHkgaXMgYWxyZWFk
eQo+IGd1YXJhbnRlZWQgYnkgdGhlIGh3Lgo+IAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgpTdXJl
LCB3aWxsIHJldHVybiBkaXJlY3RseSBhZnRlciB0aGlzIGNoZWNrLgoKVGhhbmtzLApLYXJ0aGlr
LkIuUwo+PiArCj4+ICAgCXZibGFua19zdGFydCA9IGFkanVzdGVkX21vZGUtPmNydGNfdmJsYW5r
X3N0YXJ0Owo+PiAgIAlpZiAoYWRqdXN0ZWRfbW9kZS0+ZmxhZ3MgJiBEUk1fTU9ERV9GTEFHX0lO
VEVSTEFDRSkKPj4gICAJCXZibGFua19zdGFydCA9IERJVl9ST1VORF9VUCh2Ymxhbmtfc3RhcnQs
IDIpOwo+PiBAQCAtMjA2LDcgKzIwOSw3IEBAIHZvaWQgaW50ZWxfcGlwZV91cGRhdGVfZW5kKHN0
cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpuZXdfY3J0Y19zdGF0ZSkKPj4gICAJICogV291bGQgYmUg
c2xpZ2h0bHkgbmljZSB0byBqdXN0IGdyYWIgdGhlIHZibGFuayBjb3VudCBhbmQgYXJtIHRoZQo+
PiAgIAkgKiBldmVudCBvdXRzaWRlIG9mIHRoZSBjcml0aWNhbCBzZWN0aW9uIC0gdGhlIHNwaW5s
b2NrIG1pZ2h0IHNwaW4gZm9yIGEKPj4gICAJICogd2hpbGUgLi4uICovCj4+IC0JaWYgKG5ld19j
cnRjX3N0YXRlLT51YXBpLmV2ZW50KSB7Cj4+ICsJaWYgKG5ld19jcnRjX3N0YXRlLT51YXBpLmV2
ZW50ICYmICFuZXdfY3J0Y19zdGF0ZS0+dWFwaS5hc3luY19mbGlwKSB7Cj4+ICAgCQlkcm1fV0FS
Tl9PTigmZGV2X3ByaXYtPmRybSwKPj4gICAJCQkgICAgZHJtX2NydGNfdmJsYW5rX2dldCgmY3J0
Yy0+YmFzZSkgIT0gMCk7Cj4+ICAgCj4+IEBAIC0yMjAsNiArMjIzLDkgQEAgdm9pZCBpbnRlbF9w
aXBlX3VwZGF0ZV9lbmQoc3RydWN0IGludGVsX2NydGNfc3RhdGUgKm5ld19jcnRjX3N0YXRlKQo+
PiAgIAo+PiAgIAlsb2NhbF9pcnFfZW5hYmxlKCk7Cj4+ICAgCj4+ICsJaWYgKG5ld19jcnRjX3N0
YXRlLT51YXBpLmFzeW5jX2ZsaXApCj4+ICsJCXJldHVybjsKPj4gKwo+PiAgIAlpZiAoaW50ZWxf
dmdwdV9hY3RpdmUoZGV2X3ByaXYpKQo+PiAgIAkJcmV0dXJuOwo+PiAgIAo+PiAtLSAKPj4gMi4y
Mi4wCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
