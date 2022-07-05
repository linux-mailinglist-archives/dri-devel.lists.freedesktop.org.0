Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7A4566998
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7131D1123F2;
	Tue,  5 Jul 2022 11:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774E310E021;
 Tue,  5 Jul 2022 08:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657010472; x=1688546472;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=k/PvjGj1vez4RbCyJrMtmTB3BwPmamHO4vIR+jarKsc=;
 b=D/aDYHuFYcU43LCL9m5NM+OKjKTlmwvhLerZBUtbO0E8bZzDRPVa2YJs
 92RaAJ0udgYNzUEYWwAwWDbRCOwIsAAwknpCw8+MXvEP99UvAxd0byU7s
 l/BCRJ5Ark0j84TNiKq22OTlkPMzpS0t344pbj4IUiztV83aFu81pkJbA
 gHj9M+edLVoeJHUV7jsVPlfjPLEoss4dtFBdcUSgskASLQAykrpaagDfs
 Nxd5FKFS4J8ygmzWZi+hcBYMXqbsfpCckyiQy3YT71K68PDOI5+jeT+hk
 5EbeDXJSBQFpN3N9JcivOJWx2XtpUf45GjeeR/p5cTMQXs9l9l6t3LE9Q A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="263716362"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; d="scan'208";a="263716362"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 01:41:12 -0700
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; d="scan'208";a="619730888"
Received: from sfhansen-mobl4.ger.corp.intel.com (HELO [10.249.254.61])
 ([10.249.254.61])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 01:41:04 -0700
Message-ID: <549c2e3253f847aabcc7366c9d5efa582e51f8e8.camel@linux.intel.com>
Subject: Re: [RFC 10/10] drm/i915/vm_bind: Fix vm->vm_bind_mutex and
 vm->mutex nesting
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date: Tue, 05 Jul 2022 10:40:56 +0200
In-Reply-To: <20220701225055.8204-11-niranjana.vishwanathapura@intel.com>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-11-niranjana.vishwanathapura@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 lionel.g.landwerlin@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIyLTA3LTAxIGF0IDE1OjUwIC0wNzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IFZNX0JJTkQgZnVuY3Rpb25hbGl0eSBtYWludGFpbiB0aGF0IHZtLT52bV9i
aW5kX211dGV4IHdpbGwgbmV2ZXIgYmUKPiB0YWtlbgo+IHdoaWxlIGhvbGRpbmcgdm0tPm11dGV4
Lgo+IEhvd2V2ZXIsIHdoaWxlIGNsb3NpbmcgJ3ZtJywgdm1hIGlzIGRlc3Ryb3llZCB3aGlsZSBo
b2xkaW5nIHZtLQo+ID5tdXRleC4KPiBCdXQgdm1hIHJlbGVhc2luZyBuZWVkcyB0byB0YWtlIHZt
LT52bV9iaW5kX211dGV4IGluIG9yZGVyIHRvIGRlbGV0ZQo+IHZtYQo+IGZyb20gdGhlIHZtX2Jp
bmRfbGlzdC4gVG8gYXZvaWQgdGhpcywgZGVzdHJveSB0aGUgdm1hIG91dHNpZGUgdm0tCj4gPm11
dGV4Cj4gd2hpbGUgY2xvc2luZyB0aGUgJ3ZtJy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOaXJhbmph
bmEgVmlzaHdhbmF0aGFwdXJhCgpGaXJzdCwgd2hlbiBpbnRyb2R1Y2luZyBhIG5ldyBmZWF0dXJl
IGxpa2UgdGhpcywgd2Ugc2hvdWxkIG5vdCBuZWVkIHRvCmVuZCB0aGUgc2VyaWVzIHdpdGggIkZp
eC4uIiBwYXRjaGVzIGxpa2UgdGhpcywgcmF0aGVyIHdoYXRldmVyIG5lZWRzIHRvCmJlIGZpeGVk
IHNob3VsZCBiZSBmaXhlZCB3aGVyZSB0aGUgY29kZSB3YXMgaW50cm9kdWNlZC4KClNlY29uZCwg
YW4gYW5hbG9neSB3aGl0aCBsaW51eCBrZXJuZWwgQ1BVIG1hcHBpbmcsIGNvdWxkIHdlIGluc3Rl
YWQKdGhpbmsgb2YgdGhlIHZtX2JpbmRfbG9jayBiZWluZyBzaW1pbGFyIHRvIHRoZSBtbWFwX2xv
Y2ssIGFuZCB0aGUKdm1fbXV0ZXggYmVpbmcgc2ltaWxhciB0byB0aGUgaV9tbWFwX2xvY2ssIHRo
ZSBmb3JtZXIgYmVpbmcgdXNlZCBmb3IgVkEKbWFuaXB1bGF0aW9uIGFuZCB0aGUgbGF0dGVyIHdo
ZW4gYXR0YWNoaW5nIC8gcmVtb3ZpbmcgdGhlIGJhY2tpbmcgc3RvcmUKZnJvbSB0aGUgVkE/CgpU
aGVuIHdlIHdvdWxkIG5vdCBuZWVkIHRvIHRha2UgdGhlIHZtX2JpbmRfbG9jayBmcm9tIHZtYSBk
ZXN0cnVjdGlvbgpzaW5jZSB0aGUgVkEgd291bGQgYWxyZWFkeSBoYXZlIGJlZW4gcmVjbGFpbWVk
IGF0IHRoYXQgcG9pbnQuIEZvciB2bQpkZXN0cnVjdGlvbiBoZXJlIHdlJ2QgbG9vcCBvdmVyIGFs
bCByZWxldmFudCB2bSBiaW5kIFZBcyB1bmRlciB0aGUKdm1fYmluZCBsb2NrIGFuZCBjYWxsIHZt
X3VuYmluZD8gV291bGQgdGhhdCB3b3JrPwoKL1Rob21hcwoKCj4gPG5pcmFuamFuYS52aXNod2Fu
YXRoYXB1cmFAaW50ZWwuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50
ZWxfZ3R0LmMgfCAyMyArKysrKysrKysrKysrKysrKystLS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQs
IDE4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0dC5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dC9pbnRlbF9ndHQuYwo+IGluZGV4IDRhYjNiZGE2NDRmZi4uNGY3MDdkMGViM2VmIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0dC5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3R0LmMKPiBAQCAtMTA5LDcgKzEwOSw4IEBAIGludCBt
YXBfcHRfZG1hX2xvY2tlZChzdHJ1Y3QgaTkxNV9hZGRyZXNzX3NwYWNlCj4gKnZtLCBzdHJ1Y3Qg
ZHJtX2k5MTVfZ2VtX29iamVjdAo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiDCoH0KPiDC
oAo+IC1zdGF0aWMgdm9pZCBjbGVhcl92bV9saXN0KHN0cnVjdCBsaXN0X2hlYWQgKmxpc3QpCj4g
K3N0YXRpYyB2b2lkIGNsZWFyX3ZtX2xpc3Qoc3RydWN0IGxpc3RfaGVhZCAqbGlzdCwKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBsaXN0
X2hlYWQgKmRlc3Ryb3lfbGlzdCkKPiDCoHsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGk5MTVf
dm1hICp2bWEsICp2bjsKPiDCoAo+IEBAIC0xMzgsOCArMTM5LDcgQEAgc3RhdGljIHZvaWQgY2xl
YXJfdm1fbGlzdChzdHJ1Y3QgbGlzdF9oZWFkICpsaXN0KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGk5MTVfdm1fcmVzdl9nZXQodm1hLT52bSk7Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdm1hLT52bV9k
ZGVzdHJveSA9IHRydWU7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9IGVsc2Ug
ewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaTkxNV92
bWFfZGVzdHJveV9sb2NrZWQodm1hKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGk5MTVfZ2VtX29iamVjdF9wdXQob2JqKTsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGxpc3RfbW92ZV90YWlsKCZ2bWEtPnZt
X2xpbmssIGRlc3Ryb3lfbGlzdCk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9
Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgfQo+IEBAIC0xNDcsMTYgKzE0NywyOSBAQCBzdGF0aWMg
dm9pZCBjbGVhcl92bV9saXN0KHN0cnVjdCBsaXN0X2hlYWQKPiAqbGlzdCkKPiDCoAo+IMKgc3Rh
dGljIHZvaWQgX19pOTE1X3ZtX2Nsb3NlKHN0cnVjdCBpOTE1X2FkZHJlc3Nfc3BhY2UgKnZtKQo+
IMKgewo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBpOTE1X3ZtYSAqdm1hLCAqdm47Cj4gK8KgwqDC
oMKgwqDCoMKgc3RydWN0IGxpc3RfaGVhZCBsaXN0Owo+ICsKPiArwqDCoMKgwqDCoMKgwqBJTklU
X0xJU1RfSEVBRCgmbGlzdCk7Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqBtdXRleF9sb2NrKCZ2bS0+
bXV0ZXgpOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgY2xlYXJfdm1fbGlzdCgmdm0tPmJvdW5kX2xp
c3QpOwo+IC3CoMKgwqDCoMKgwqDCoGNsZWFyX3ZtX2xpc3QoJnZtLT51bmJvdW5kX2xpc3QpOwo+
ICvCoMKgwqDCoMKgwqDCoGNsZWFyX3ZtX2xpc3QoJnZtLT5ib3VuZF9saXN0LCAmbGlzdCk7Cj4g
K8KgwqDCoMKgwqDCoMKgY2xlYXJfdm1fbGlzdCgmdm0tPnVuYm91bmRfbGlzdCwgJmxpc3QpOwo+
IMKgCj4gwqDCoMKgwqDCoMKgwqDCoC8qIENoZWNrIGZvciBtdXN0LWZpeCB1bmFudGljaXBhdGVk
IHNpZGUtZWZmZWN0cyAqLwo+IMKgwqDCoMKgwqDCoMKgwqBHRU1fQlVHX09OKCFsaXN0X2VtcHR5
KCZ2bS0+Ym91bmRfbGlzdCkpOwo+IMKgwqDCoMKgwqDCoMKgwqBHRU1fQlVHX09OKCFsaXN0X2Vt
cHR5KCZ2bS0+dW5ib3VuZF9saXN0KSk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgbXV0ZXhfdW5s
b2NrKCZ2bS0+bXV0ZXgpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqAvKiBEZXN0cm95IHZtYXMgb3V0
c2lkZSB2bS0+bXV0ZXggKi8KPiArwqDCoMKgwqDCoMKgwqBsaXN0X2Zvcl9lYWNoX2VudHJ5X3Nh
ZmUodm1hLCB2biwgJmxpc3QsIHZtX2xpbmspIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaiA9IHZtYS0+b2JqOwo+ICsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaTkxNV92bWFfZGVzdHJveSh2bWEpOwo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpOTE1X2dlbV9vYmplY3RfcHV0KG9iaik7Cj4g
K8KgwqDCoMKgwqDCoMKgfQo+IMKgfQo+IMKgCj4gwqAvKiBsb2NrIHRoZSB2bSBpbnRvIHRoZSBj
dXJyZW50IHd3LCBpZiB3ZSBsb2NrIG9uZSwgd2UgbG9jayBhbGwgKi8KCg==

