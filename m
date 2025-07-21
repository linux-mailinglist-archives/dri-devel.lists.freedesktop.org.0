Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A80C3B0C5DE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 16:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA9B10E031;
	Mon, 21 Jul 2025 14:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bZVn9xd1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8EB10E031
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 14:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753107032; x=1784643032;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5DOBpaAcvTn33uKU20KtqmP4eSVJJ3zgsAwq6gJFkuk=;
 b=bZVn9xd1d27HQ+yoLCK8h1lD+P1qLyWbM4q8oiUC2CyjEpBVmeEv3tE8
 Z3glBXwBzzY1h70dXw/tM6/kID6ViOmVCT90QhBSnrZh22R4skZZauB0j
 i86W8hsxq3Eok10z4S7LXSwoR6V157uipBfbllvhza8SAhvl+qsCYeOxE
 ASIzJfS67LQp2Hl8A0x5V+PEf3EF8/DFyEkKN2mQYJSziGsgSXD9Xc/Gy
 NozliYGL7IYMag7WCbkYCHoFDdaY5gMnnN2DwRM1GwVSG4VCefjqf9S1W
 KWdreUMWicV/QpkR+wWrGMoZgJ2iLDK8q28w6SrX038omjASip7dHsoxl A==;
X-CSE-ConnectionGUID: ia4BAmc9Qp+tDs6nx6DsFA==
X-CSE-MsgGUID: Q5O5IT7NQIOMnqIF1i36+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="42942742"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="42942742"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 07:10:31 -0700
X-CSE-ConnectionGUID: g135ToA4T66MCpuEaHYnow==
X-CSE-MsgGUID: 5kDbQjl/TJe3jxHQFQKQMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="158181346"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.244.33])
 ([10.245.244.33])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 07:10:30 -0700
Message-ID: <70af5644eaf561617aaf6ade2d83fe1f1afa7ffa.camel@linux.intel.com>
Subject: Re: [bug report] drm/ttm, drm_xe, Implement
 ttm_lru_walk_for_evict() using the guarded LRU iteration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Date: Mon, 21 Jul 2025 16:10:15 +0200
In-Reply-To: <1dcd1afb-1e5d-4624-ae3f-9f96ceab6134@sabinyo.mountain>
References: <1dcd1afb-1e5d-4624-ae3f-9f96ceab6134@sabinyo.mountain>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgpPbiBUdWUsIDIwMjUtMDctMDEgYXQgMTI6NDkgLTA1MDAsIERhbiBDYXJwZW50ZXIgd3Jv
dGU6Cj4gSGVsbG8gVGhvbWFzIEhlbGxzdHLDtm0sCj4gCj4gQ29tbWl0IGJiOGFhMjdlZmY2ZiAo
ImRybS90dG0sIGRybV94ZSwgSW1wbGVtZW50Cj4gdHRtX2xydV93YWxrX2Zvcl9ldmljdCgpIHVz
aW5nIHRoZSBndWFyZGVkIExSVSBpdGVyYXRpb24iKSBmcm9tIEp1bgo+IDIzLCAyMDI1IChsaW51
eC1uZXh0KSwgbGVhZHMgdG8gdGhlIGZvbGxvd2luZyBTbWF0Y2ggc3RhdGljIGNoZWNrZXIKPiB3
YXJuaW5nOgo+IAo+IAlkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmM6ODk5Cj4gdHRt
X2xydV93YWxrX2Zvcl9ldmljdCgpCj4gCXdhcm46ICdibycgaXNuJ3QgYW4gRVJSX1BUUgo+IAo+
IGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwo+IMKgwqAgODgzwqAgczY0IHR0bV9s
cnVfd2Fsa19mb3JfZXZpY3Qoc3RydWN0IHR0bV9scnVfd2FsayAqd2Fsaywgc3RydWN0Cj4gdHRt
X2RldmljZSAqYmRldiwKPiDCoMKgIDg4NMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFu
LAo+IHM2NCB0YXJnZXQpCj4gwqDCoCA4ODXCoCB7Cj4gwqDCoCA4ODbCoMKgwqDCoMKgwqDCoMKg
wqAgc3RydWN0IHR0bV9ib19scnVfY3Vyc29yIGN1cnNvcjsKPiDCoMKgIDg4N8KgwqDCoMKgwqDC
oMKgwqDCoCBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvOwo+IMKgwqAgODg4wqDCoMKgwqDC
oMKgwqDCoMKgIHM2NCBwcm9ncmVzcyA9IDA7Cj4gwqDCoCA4ODnCoMKgwqDCoMKgwqDCoMKgwqAg
czY0IGxyZXQ7Cj4gwqDCoCA4OTDCoCAKPiDCoMKgIDg5McKgwqDCoMKgwqDCoMKgwqDCoCB0dG1f
Ym9fbHJ1X2Zvcl9lYWNoX3Jlc2VydmVkX2d1YXJkZWQoJmN1cnNvciwgbWFuLAo+ICZ3YWxrLT5h
cmcsIGJvKSB7Cj4gwqDCoCA4OTLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxy
ZXQgPSB3YWxrLT5vcHMtPnByb2Nlc3NfYm8od2FsaywgYm8pOwo+IMKgwqAgODkzwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAobHJldCA9PSAtRUJVU1kgfHwgbHJldCA9PSAt
RUFMUkVBRFkpCj4gwqDCoCA4OTTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBscmV0ID0gMDsKPiDCoMKgIDg5NcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcHJvZ3Jlc3MgPSAobHJldCA8IDApID8gbHJldCA6IHByb2dyZXNzICsKPiBs
cmV0Owo+IMKgwqAgODk2wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocHJv
Z3Jlc3MgPCAwIHx8IHByb2dyZXNzID49IHRhcmdldCkKPiDCoMKgIDg5N8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+IMKgwqAgODk4wqDC
oMKgwqDCoMKgwqDCoMKgIH0KPiDCoMKgIDg5OcKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoSVNfRVJS
KGJvKSkKPiDCoMKgIDkwMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IFBUUl9FUlIoYm8pOwo+IAo+IFRoZSB0dG1fYm9fbHJ1X2Zvcl9lYWNoX3Jlc2VydmVkX2d1YXJk
ZWQoKSBtYWNybyBjaGVja3MgZm9yCj4gSVNfRVJSX09SX05VTEwoKQo+IGJ1dCBpdCBjYW4gb25s
eSBiZSBOVUxMLgoKVGhhdCdzIG5vdCBjb3JyZWN0LgoKPiDCoCBUaGVzZSB0aGluZ3MgYXJlIGEg
Yml0IGZydXN0cmF0aW5nIHRvIG1lIGJlY2F1c2UKPiB3aGVuIGEgZnVuY3Rpb24gcmV0dXJucyBi
b3RoIGVycm9yIHBvaW50ZXJzIGFuZCBOVUxMIHRoZW4gaWRlYWxseQo+IHRoZXJlIGlzIGEKPiBy
ZWFzb24gZm9yIHRoYXQgYW5kIGl0IHNob3VsZCBiZSBkb2N1bWVudGVkLsKgICJUaGlzIGZ1bmN0
aW9uIHJldHVybnMKPiBlcnJvcgo+IHBvaW50ZXJzIGlmIHRoZXJlIGlzIGFuIGVycm9yIChrbWFs
bG9jIGZhaWxlZCBldGMpIG9yIE5VTEwgaWYgdGhlCj4gb2JqZWN0IGlzCj4gbm90IGZvdW5kIi4K
ClRoZSBlcnJvciBwb2ludGVyIGlzIGRvY3VtZW50ZWQgdW5kZXIgdGhlCnR0bV9ib19scnVfZm9y
X2VhY2hfcmVzZXJ2ZWRfZ3VhcmRlZCgpIG1hY3JvLiBCdXQgaXQgaXMgdHJ1ZSB0aGF0IEkndmUK
Zm9yZ290dGVuIHRvIHVwZGF0ZSB0aGUgZG9jIGZvciB0dG1fYm9fbHJ1X2N1cnNvcl9maXJzdCgp
IGFuZAp0dG1fYm9fbHJ1X2N1cnNvcl9uZXh0KCkgdG8gcmVmbGVjdCB0aGF0IHRoZXkgbWF5IHJl
dHVybiBhbiBlcnJvcgpwb2ludGVyIG9yIE5VTEwuIEkgd2lsbCBwdXQgdG9nZXRoZXIgYSBwYXRj
aCBmb3IgdGhhdC4KCj4gCj4gaHR0cHM6Ly9zdGF0aWN0aGlua2luZy53b3JkcHJlc3MuY29tLzIw
MjIvMDgvMDEvbWl4aW5nLWVycm9yLXBvaW50ZXJzLWFuZC1udWxsLwo+IAo+IMKgwqAgOTAxwqAg
Cj4gwqDCoCA5MDLCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHByb2dyZXNzOwo+IAo+IEl0J3Mg
c3RyYW5nZSB0byBtZSB0aGF0IHdlIHJldHVybnMgcHJvZ3Jlc3MgdmFsdWVzIHdoaWNoIGFyZSBn
cmVhdGVyCj4gdGhhbiB0aGUKPiB0YXJnZXQgdmFsdWUuCgpUaGlzIGlzIGFsc28gZG9jdW1lbnRl
ZCBpbiB0aGUgdHRtX2xydV93YWxrX2Zvcl9ldmljdCgpIGtlcm5lbGRvYy4gSW4Kc2hvcnQgYSB0
eXBpY2FsIGludGVuZGVkIHVzZS1jYXNlIGlzIHRoYXQgd2UncmUgcmVxdWVzdGVkIHRvIGV2aWN0
CkB0YXJnZXQgcGFnZXMsIGJ1dCBzaW5jZSB3ZSBldmljdCBhIGJ1ZmZlciBvYmplY3QgYXQgYSB0
aW1lIChtdWx0aXBsZQpwYWdlcykgdGhlIHRvdGFsIG1heSBleGNlZWQgQHByb2dyZXNzLgoKSW4g
YW55IGNhc2UgaXQgbG9va3MgbGlrZSB0aGUgdHRtX2xydV93YWxrX2Zvcl9ldmljdCgpIGZ1bmN0
aW9uIG1heSBnbwphd2F5IHdpdGggdXBjb21pbmcgcGF0Y2hlcyBmcm9tIENocmlzdGlhbi4KClRo
YW5rcywKVGhvbWFzCiAKCj4gCj4gwqDCoCA5MDPCoCB9Cj4gCj4gcmVnYXJkcywKPiBkYW4gY2Fy
cGVudGVyCgo=

