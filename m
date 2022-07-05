Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7310D566994
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65401124B4;
	Tue,  5 Jul 2022 11:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D4410E04C;
 Tue,  5 Jul 2022 08:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657011445; x=1688547445;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YkXKZZQIfXjLCVk+Jbj14+q1RxGHVKk+WEmwUDQUwkM=;
 b=EG5kiCQfIKBeAhfL9Jpo/qiPV3F5dgikAEsePWB99LDYcJ9l2lb3/v90
 Dd0s349jcIdlWAPftbcbmErGLE/i3bmpqzzlcmbQGYuXKiVjAQ7NU5dtB
 CW+1nSNAR3pdSV5ScnvvedjCGTFZPZwXFFNqmuHT+0ue+mdHo6xbbg63d
 ba2yjpwG74fFNCD3G6dQctbTDwRTIfY3+N8csLpRdEf6/fVS1di/yr3wC
 rBRdcgXULL+HxudgkgnbvMXQUIyUARYm2Agzyes7YaxbonjnhdDeUb2mx
 YI9YVGLVkh/NyC4XMby57UYLiUlA118AD7eAu67gdJx6V97HLPBpNxOKN Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="266322849"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; d="scan'208";a="266322849"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 01:57:24 -0700
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; d="scan'208";a="839045769"
Received: from sfhansen-mobl4.ger.corp.intel.com (HELO [10.249.254.61])
 ([10.249.254.61])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 01:57:20 -0700
Message-ID: <24b042a19d705c91103dd9e740cf36f5a58c99a9.camel@linux.intel.com>
Subject: Re: [RFC 09/10] drm/i915/vm_bind: Skip vma_lookup for persistent vmas
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date: Tue, 05 Jul 2022 10:57:17 +0200
In-Reply-To: <20220701225055.8204-10-niranjana.vishwanathapura@intel.com>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-10-niranjana.vishwanathapura@intel.com>
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
dXJhIHdyb3RlOgo+IHZtYV9sb29rdXAgaXMgdGllZCB0byBzZWdtZW50IG9mIHRoZSBvYmplY3Qg
aW5zdGVhZCBvZiBzZWN0aW9uCj4gb2YgVkEgc3BhY2UuIEhlbmNlLCBpdCBkbyBub3Qgc3VwcG9y
dCBhbGlhc2luZyAoaWUuLCBtdWx0aXBsZQo+IGJpbmRpbmdzIHRvIHRoZSBzYW1lIHNlY3Rpb24g
b2YgdGhlIG9iamVjdCkuCj4gU2tpcCB2bWFfbG9va3VwIGZvciBwZXJzaXN0ZW50IHZtYXMgYXMg
aXQgc3VwcG9ydHMgYWxpYXNpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogTmlyYW5qYW5hIFZpc2h3
YW5hdGhhcHVyYQo+IDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT4KPiAtLS0K
PiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdm1hLmMgfCAxOSArKysrKysrKysrKysrKy0t
LS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92bWEuYwo+IGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvaTkxNV92bWEuYwo+IGluZGV4IDZhZGIwMTM1NzliZS4uOWFhMzhi
NzcyYjViIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdm1hLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3ZtYS5jCj4gQEAgLTE5Nyw2ICsxOTcsMTAg
QEAgdm1hX2NyZWF0ZShzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqLAo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgX19zZXRfYml0KEk5MTVfVk1BX0dHVFRfQklULCBfX2k5
MTVfdm1hX2ZsYWdzKHZtYSkpOwo+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiArwqDCoMKgwqDC
oMKgwqBpZiAoIWk5MTVfdm1hX2lzX2dndHQodm1hKSAmJgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oCAodmlldyAmJiB2aWV3LT50eXBlID09IEk5MTVfR0dUVF9WSUVXX1BBUlRJQUwpKQo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIHNraXBfcmJfaW5zZXJ0Owo+ICsKClJhdGhl
ciB0aGFuIGd1ZXNzaW5nIHRoYXQgYSB2bWEgd2l0aCB0aGlzIHNpZ25hdHVyZSBpcyBhIHBlcnNp
c3RlbnQKdm1hLCB3aGljaCBpcyBjb25mdXNpbmcgdG8gdGhlIHJlYWRlciwgY291bGQgd2UgaGF2
ZSBhbiBhcmd1bWVudCBzYXlpbmcKd2Ugd2FudCB0byBjcmVhdGUgYSBwZXJzaXN0ZW50IHZtYT8K
Cj4gwqDCoMKgwqDCoMKgwqDCoHJiID0gTlVMTDsKPiDCoMKgwqDCoMKgwqDCoMKgcCA9ICZvYmot
PnZtYS50cmVlLnJiX25vZGU7Cj4gwqDCoMKgwqDCoMKgwqDCoHdoaWxlICgqcCkgewo+IEBAIC0y
MjEsNiArMjI1LDcgQEAgdm1hX2NyZWF0ZShzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2Jq
LAo+IMKgwqDCoMKgwqDCoMKgwqByYl9saW5rX25vZGUoJnZtYS0+b2JqX25vZGUsIHJiLCBwKTsK
PiDCoMKgwqDCoMKgwqDCoMKgcmJfaW5zZXJ0X2NvbG9yKCZ2bWEtPm9ial9ub2RlLCAmb2JqLT52
bWEudHJlZSk7Cj4gwqAKPiArc2tpcF9yYl9pbnNlcnQ6Cj4gwqDCoMKgwqDCoMKgwqDCoGlmIChp
OTE1X3ZtYV9pc19nZ3R0KHZtYSkpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAv
Kgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogV2UgcHV0IHRoZSBHR1RUIHZt
YSBhdCB0aGUgc3RhcnQgb2YgdGhlIHZtYS1saXN0LAo+IGZvbGxvd2VkCj4gQEAgLTI5MiwxMyAr
Mjk3LDE2IEBAIGk5MTVfdm1hX2luc3RhbmNlKHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0Cj4g
Km9iaiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpOTE1X2Fk
ZHJlc3Nfc3BhY2UgKnZtLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29u
c3Qgc3RydWN0IGk5MTVfZ2d0dF92aWV3ICp2aWV3KQo+IMKgewo+IC3CoMKgwqDCoMKgwqDCoHN0
cnVjdCBpOTE1X3ZtYSAqdm1hOwo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBpOTE1X3ZtYSAqdm1h
ID0gTlVMTDsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBHRU1fQlVHX09OKCFrcmVmX3JlYWQoJnZt
LT5yZWYpKTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoHNwaW5fbG9jaygmb2JqLT52bWEubG9jayk7
Cj4gLcKgwqDCoMKgwqDCoMKgdm1hID0gaTkxNV92bWFfbG9va3VwKG9iaiwgdm0sIHZpZXcpOwo+
IC3CoMKgwqDCoMKgwqDCoHNwaW5fdW5sb2NrKCZvYmotPnZtYS5sb2NrKTsKPiArwqDCoMKgwqDC
oMKgwqBpZiAoaTkxNV9pc19nZ3R0KHZtKSB8fCAhdmlldyB8fAo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoCB2aWV3LT50eXBlICE9IEk5MTVfR0dUVF9WSUVXX1BBUlRJQUwpIHsKClNhbWUgaGVyZT8K
Ci9UaG9tYXMKCgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGluX2xvY2soJm9i
ai0+dm1hLmxvY2spOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2bWEgPSBpOTE1
X3ZtYV9sb29rdXAob2JqLCB2bSwgdmlldyk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHNwaW5fdW5sb2NrKCZvYmotPnZtYS5sb2NrKTsKPiArwqDCoMKgwqDCoMKgwqB9Cj4gwqAK
PiDCoMKgwqDCoMKgwqDCoMKgLyogdm1hX2NyZWF0ZSgpIHdpbGwgcmVzb2x2ZSB0aGUgcmFjZSBp
ZiBhbm90aGVyIGNyZWF0ZXMgdGhlCj4gdm1hICovCj4gwqDCoMKgwqDCoMKgwqDCoGlmICh1bmxp
a2VseSghdm1hKSkKPiBAQCAtMTY3MCw3ICsxNjc4LDggQEAgc3RhdGljIHZvaWQgcmVsZWFzZV9y
ZWZlcmVuY2VzKHN0cnVjdCBpOTE1X3ZtYQo+ICp2bWEsIGJvb2wgdm1fZGRlc3Ryb3kpCj4gwqAK
PiDCoMKgwqDCoMKgwqDCoMKgc3Bpbl9sb2NrKCZvYmotPnZtYS5sb2NrKTsKPiDCoMKgwqDCoMKg
wqDCoMKgbGlzdF9kZWwoJnZtYS0+b2JqX2xpbmspOwo+IC3CoMKgwqDCoMKgwqDCoGlmICghUkJf
RU1QVFlfTk9ERSgmdm1hLT5vYmpfbm9kZSkpCj4gK8KgwqDCoMKgwqDCoMKgaWYgKCFpOTE1X3Zt
YV9pc19wZXJzaXN0ZW50KHZtYSkgJiYKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgIVJCX0VNUFRZ
X05PREUoJnZtYS0+b2JqX25vZGUpKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmJfZXJhc2UoJnZtYS0+b2JqX25vZGUsICZvYmotPnZtYS50cmVlKTsKPiDCoAo+IMKgwqDCoMKg
wqDCoMKgwqBzcGluX3VubG9jaygmb2JqLT52bWEubG9jayk7Cgo=

