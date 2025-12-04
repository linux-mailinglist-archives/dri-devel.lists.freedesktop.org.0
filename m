Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 958F4CA382B
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 12:58:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A806010E94F;
	Thu,  4 Dec 2025 11:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HSpWkxEz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D7A10E93E;
 Thu,  4 Dec 2025 11:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764849496; x=1796385496;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5uK2KXVr3DWr8mYIOCBlGCt2rYs8uQECOWNjayp03W0=;
 b=HSpWkxEzATa4+AI+ECvDkrNGP1rqCjCCnGXKS2F9/QGCbk2n+PkvhqfT
 x456285xKUO33jV3eFrTaWGcKeepjhMlAtv0XYt4TZKUXnwpoVCdCK1iC
 7Q/d5j4M4ZlgwkIrbU2OlJvQrB+8wFwMUBebE16R5DZvH8jX9WsDAe1EF
 J3wvn2GMlLWy4osxXIrA/ofkeHBG2MoQZvd6YoDjsLwsKldYyOlBeQ9aw
 8ixLuEfnS7eD+I7PZQSqZLA/2VIs1FlIwNbcJsyVnCYD0LVTqj275NS6A
 3nxF4Q9ULsqGXgR+3UpIU8BeKoiTLN7GaInC1s+ox+ITBJV+b5HiUK83p A==;
X-CSE-ConnectionGUID: BI/FZx2+QUCkA9VF3UcZFA==
X-CSE-MsgGUID: EiABIu3MQLOtMZMvSGbEtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="69461238"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="69461238"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 03:58:15 -0800
X-CSE-ConnectionGUID: DDZC4bIYQp+trjGu7cHAQg==
X-CSE-MsgGUID: DAiXZrWSRBaeEJtqCdCg1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="194248441"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.245.167])
 ([10.245.245.167])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 03:58:12 -0800
Message-ID: <6041d6599faf58c4f0d1d2bdbaa93227f787fbe5.camel@linux.intel.com>
Subject: Re: [PATCH] xe: fix drm_gpusvm_init() arguments
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthew
 Auld <matthew.auld@intel.com>,  Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Lucas De Marchi
 <demarchi@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Himal Prasad Ghimiray	
 <himal.prasad.ghimiray@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, 	intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 	linux-kernel@vger.kernel.org
Date: Thu, 04 Dec 2025 12:58:08 +0100
In-Reply-To: <20251204094704.1030933-1-arnd@kernel.org>
References: <20251204094704.1030933-1-arnd@kernel.org>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

T24gVGh1LCAyMDI1LTEyLTA0IGF0IDEwOjQ2ICswMTAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+
IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gCj4gVGhlIFhlIGRyaXZlciBm
YWlscyB0byBidWlsZCB3aGVuIENPTkZJR19EUk1fWEVfR1BVU1ZNIGlzIGRpc2FibGVkCj4gYnV0
IENPTkZJR19EUk1fR1BVU1ZNIGlzIHR1cm5lZCBvbiwgamR1ZSB0byB0aGUgY2xhc2ggb2YgdHdv
IGNvbW1pdHM6CgpzL2pkdWUvZHVlLwoKPiAKPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3ZtX21hZHZpc2UuYzo4Ogo+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9z
dm0uaDogSW4gZnVuY3Rpb24gJ3hlX3N2bV9pbml0JzoKPiBpbmNsdWRlL2xpbnV4L3N0ZGRlZi5o
Ojg6MTQ6IGVycm9yOiBwYXNzaW5nIGFyZ3VtZW50IDUgb2YKPiAnZHJtX2dwdXN2bV9pbml0JyBt
YWtlcyBpbnRlZ2VyIGZyb20gcG9pbnRlciB3aXRob3V0IGEgY2FzdCBbLVdpbnQtCj4gY29udmVy
c2lvbl0KPiBkcml2ZXJzL2dwdS9kcm0veGUveGVfc3ZtLmg6MjE3OjM4OiBub3RlOiBpbiBleHBh
bnNpb24gb2YgbWFjcm8KPiAnTlVMTCcKPiDCoCAyMTcgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5VTEwsIE5VTEwsIDAsIDAs
IDAsIE5VTEwsCj4gTlVMTCwgMCk7Cj4gwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+
fgo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm9fdHlwZXMu
aDoxMSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcm9tIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9iby5oOjExLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZy
b20gZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX21hZHZpc2UuYzoxMToKPiBpbmNsdWRlL2RybS9k
cm1fZ3B1c3ZtLmg6MjU0OjM1OiBub3RlOiBleHBlY3RlZCAnbG9uZyB1bnNpZ25lZCBpbnQnCj4g
YnV0IGFyZ3VtZW50IGlzIG9mIHR5cGUgJ3ZvaWQgKicKPiDCoCAyNTQgfMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBtbV9zdGFydCwgdW5zaWdu
ZWQgbG9uZwo+IG1tX3JhbmdlLAo+IMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfn5+fn5+fn5+fn5+fn5efn5+fn5+fgo+IEluIGZpbGUgaW5jbHVk
ZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm1fbWFkdmlzZS5jOjE0Ogo+IGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9zdm0uaDoyMTY6MTY6IGVycm9yOiB0b28gbWFueSBhcmd1bWVudHMgdG8K
PiBmdW5jdGlvbiAnZHJtX2dwdXN2bV9pbml0JzsgZXhwZWN0ZWQgMTAsIGhhdmUgMTEKPiDCoCAy
MTYgfMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRybV9ncHVzdm1faW5pdCgmdm0tPnN2bS5ncHVz
dm0sICJYZSBTVk0KPiAoc2ltcGxlKSIsICZ2bS0+eGUtPmRybSwKPiDCoMKgwqDCoMKgIHzCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+fn5+Cj4gwqAgMjE3IHzCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBOVUxMLCBOVUxMLCAwLCAwLCAwLCBOVUxMLAo+IE5VTEwsIDApOwo+IMKgwqDCoMKgwqAKPiB8
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfgo+IGluY2x1ZGUvZHJtL2RybV9ncHVzdm0uaDoyNTE6NTogbm90ZTog
ZGVjbGFyZWQgaGVyZQo+IAo+IEFkYXB0IHRoZSBjYWxsZXIgdG8gdGhlIG5ldyBhcmd1bWVudCBs
aXN0IGJ5IHJlbW92aW5nIHRoZSBleHRyYW5lb3VzCj4gTlVMTCBhcmd1bWVudC4KPiAKPiBGaXhl
czogOWU5Nzg3NDE0ODgyICgiZHJtL3hlL3VzZXJwdHI6IHJlcGxhY2UgeGVfaG1tIHdpdGggZ3B1
c3ZtIikKPiBGaXhlczogMTBhYTVjODA2MDMwICgiZHJtL2dwdXN2bSwgZHJtL3hlOiBGaXggdXNl
cnB0ciB0byBub3QgYWxsb3cKPiBkZXZpY2UgcHJpdmF0ZSBwYWdlcyIpCj4gU2lnbmVkLW9mZi1i
eTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KClRoYW5rcywKClJldmlld2VkLWJ5OiBU
aG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+CgpJJ2xs
IHdhaXQgZm9yIENJIGJlZm9yZSBjb21taXRpbmcuIApGb3IgdGhlIGFib3ZlIHR5cG8sIERvIHlv
dSB3YW50IHRvIHJlc3VibWl0IG9yIHNob3VsZCBJIGZpeCB1cCB3aGVuCmNvbW1pdHRpbmc/CgpU
aGFua3MsClRob21hcwoKCgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N2bS5oIHwg
MiArLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdm0uaAo+IGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3N2bS5oCj4gaW5kZXggMDk1NWQyYWM4ZDc0Li5mYTc1N2RkMDc5NTQgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N2bS5oCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3N2bS5oCj4gQEAgLTIxNCw3ICsyMTQsNyBAQCBpbnQgeGVfc3ZtX2luaXQo
c3RydWN0IHhlX3ZtICp2bSkKPiDCoHsKPiDCoCNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fR1BV
U1ZNKQo+IMKgCXJldHVybiBkcm1fZ3B1c3ZtX2luaXQoJnZtLT5zdm0uZ3B1c3ZtLCAiWGUgU1ZN
IChzaW1wbGUpIiwKPiAmdm0tPnhlLT5kcm0sCj4gLQkJCcKgwqDCoMKgwqDCoCBOVUxMLCBOVUxM
LCAwLCAwLCAwLCBOVUxMLCBOVUxMLCAwKTsKPiArCQkJwqDCoMKgwqDCoMKgIE5VTEwsIDAsIDAs
IDAsIE5VTEwsIE5VTEwsIDApOwo+IMKgI2Vsc2UKPiDCoAlyZXR1cm4gMDsKPiDCoCNlbmRpZgoK


