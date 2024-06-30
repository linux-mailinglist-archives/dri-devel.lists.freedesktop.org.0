Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E148291D032
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 08:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E0010E02E;
	Sun, 30 Jun 2024 06:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="DhCX2WWK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33B510E02E
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2024 06:53:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1719730374; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=eU4klpRyAxmW0vXJdPVVPkWSQQj9VfQf5v1q9nBAJAw4Gc883S1CO6jXy06LHCB4Vq5sx6xT7MKI8dsArBtx4EkvBcKEejvsMM11N1qsBdLDJlskyfrmF9VSywVIzwN2dIH7jMhtcZMxuAzDELl7UJND9DKzKxtG+OD64NRGSQM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1719730374;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=GlvmRLhSLQMxqqnJLWA67YWA13Mc0uaKIfKavL5U0Hs=; 
 b=FJi2p88Pp6IFGhtZmmi2Tyia/6lUbBC/NxONV/SonbnP9pLsj+yTnVpyzrPJ8evXCpq6HlirS9ebybajTmtR6GkYfgwAtiROmwPLXNY+TLKGa+zSOkeZVATVeVcPZHD1WkCT7iXQRdgvT8osMrvR0BhOkFFHq34rRbLmlLAwjzo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719730374; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=GlvmRLhSLQMxqqnJLWA67YWA13Mc0uaKIfKavL5U0Hs=;
 b=DhCX2WWKwy0PllVfQ9k31kQX1VRgSsunOcybHw9lPNNnAaM15Gmlfa9Kf3BE4EX+
 HdmjS9pj4gT6VcgChs0V+ndmzDC9K9cUVNq1NeeFqt9CCnvMfMi7yag/HaXLxAqFdna
 OewydSyy2L+DWrWojSNP63hOSixgTZbqmCw+H9ADdJWHVHJoEZVtworqU5abt0OTYS4
 QUU8pSn4XTMw9+S+qvSzYBy+MIuz2xtZBwqfDl4qNOVM+WGS3WXAeQB7UQfTnxF58sR
 0x+PRLvwHRyqahKkllsUQSUMmXYW/bqN21XniaQQls68fuEQ+TcjS/jIr9aqJh8OhTz
 LDv28dFf5w==
Received: by mx.zohomail.com with SMTPS id 1719730372425888.1304650498818;
 Sat, 29 Jun 2024 23:52:52 -0700 (PDT)
Message-ID: <d721003aca5b023feee8ab63a4ac29944f5b4549.camel@icenowy.me>
Subject: Re: [RFC PATCH 2/2] drm/ttm: downgrade cached to write_combined
 when snooping not available
From: Icenowy Zheng <uwu@icenowy.me>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Christian Koenig
 <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Sun, 30 Jun 2024 14:52:47 +0800
In-Reply-To: <a143a2c3-c6f0-4537-acc6-94f229f14639@app.fastmail.com>
References: <20240629052247.2653363-1-uwu@icenowy.me>
 <20240629052247.2653363-3-uwu@icenowy.me>
 <a143a2c3-c6f0-4537-acc6-94f229f14639@app.fastmail.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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

5ZyoIDIwMjQtMDYtMjnmmJ/mnJ/lha3nmoQgMjA6NTcgKzAxMDDvvIxKaWF4dW4gWWFuZ+WGmemB
k++8mgo+IAo+IAo+IOWcqDIwMjTlubQ25pyIMjnml6Xlha3mnIgg5LiK5Y2INjoyMu+8jEljZW5v
d3kgWmhlbmflhpnpgZPvvJoKPiBbLi4uXQo+ID4gQEAgLTMwMiw2ICszMDIsMTAgQEAgcGdwcm90
X3QgdHRtX2lvX3Byb3Qoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0Cj4gPiAqYm8sIAo+ID4gc3Ry
dWN0IHR0bV9yZXNvdXJjZSAqcmVzLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBjYWNoaW5nID0gcmVzLT5idXMuY2FjaGluZzsKPiA+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiAK
PiA+ICvCoMKgwqDCoMKgwqDCoC8qIERvd25ncmFkZSBjYWNoZWQgbWFwcGluZyBmb3Igbm9uLXNu
b29waW5nIGRldmljZXMgKi8KPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghYm8tPmJkZXYtPmRtYV9j
b2hlcmVudCAmJiBjYWNoaW5nID09IHR0bV9jYWNoZWQpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgY2FjaGluZyA9IHR0bV93cml0ZV9jb21iaW5lZDsKPiBIaSBJY2Vub3d5LAo+
IAo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEgWW91IHNhdmVkIG1hbnkgbm9uLWNvaCBQQ0llIGhv
c3QKPiBpbXBsZW1lbnRhdGlvbnMgYSBkYXkhLgo+IAo+IFVuZm9ydHVuYXRlbHkgSSBkb24ndCB0
aGluayB3ZSBjYW4gc2FmZWx5IHR0bV9jYWNoZWQgdG8KPiB0dG1fd3JpdGVfY29tbmluZWQsIHdl
J3ZlCj4gaGFkIGVub3VnaCBkcmFtYSB3aXRoIHdyaXRlIGNvbWJpbmUgYmVoYXZpb3VyIG9uIGFs
bCBkaWZmZXJlbnQKPiBwbGF0Zm9ybXMuCgpJIHRoaW5rIG9uIHRoZXNlIHBsYXRmb3JtcywgdHRt
X3dyaXRlX2NvbWJpbmVkIHNob3VsZCBiZSBwcmV2ZW50ZWQgdG8KYmUgbWFwcGVkIHRvIHBncHJv
dF93cml0ZWNvbWJpbmUgaW5zdGVhZCwgYnV0IGRvd25ncmFkZSB0dG1fY2FjaGVkIHRvCnR0bV93
cml0ZV9jb21iaW5lZCAoYW5kIHRoZW4gYmVpbmcgdHJlYXRlZCBzYW1lIGFzIHR0bV91bmNhY2hl
ZCkgaXMKYWNjZXB0YWJsZS4KCj4gCj4gU2VlIGRybV9hcmNoX2Nhbl93Y19tZW1vcnkgaW4gZHJt
X2NhY2hlLmguCj4gCj4gVGhhbmtzIAo+IAo+ID4gKwo+ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVy
biB0dG1fcHJvdF9mcm9tX2NhY2hpbmcoY2FjaGluZywgdG1wKTsKPiA+IMKgfQo+ID4gwqBFWFBP
UlRfU1lNQk9MKHR0bV9pb19wcm90KTsKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV90dC5jCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKPiA+IGluZGV4
IDdiMDBkZGYwY2U0OWYuLjMzMzVkZjQ1ZmJhNWUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV90dC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5j
Cj4gPiBAQCAtMTUyLDYgKzE1MiwxMCBAQCBzdGF0aWMgdm9pZCB0dG1fdHRfaW5pdF9maWVsZHMo
c3RydWN0IHR0bV90dAo+ID4gKnR0bSwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVtIHR0bV9jYWNoaW5nIGNhY2hpbmcs
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdW5zaWduZWQgbG9uZyBleHRyYV9wYWdlcykKPiA+IMKgewo+ID4gK8KgwqDCoMKg
wqDCoMKgLyogRG93bmdyYWRlIGNhY2hlZCBtYXBwaW5nIGZvciBub24tc25vb3BpbmcgZGV2aWNl
cyAqLwo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKCFiby0+YmRldi0+ZG1hX2NvaGVyZW50ICYmIGNh
Y2hpbmcgPT0gdHRtX2NhY2hlZCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBj
YWNoaW5nID0gdHRtX3dyaXRlX2NvbWJpbmVkOwo+ID4gKwo+ID4gwqDCoMKgwqDCoMKgwqDCoHR0
bS0+bnVtX3BhZ2VzID0gKFBBR0VfQUxJR04oYm8tPmJhc2Uuc2l6ZSkgPj4gUEFHRV9TSElGVCkK
PiA+ICsgZXh0cmFfcGFnZXM7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgdHRtLT5wYWdlX2ZsYWdzID0g
cGFnZV9mbGFnczsKPiA+IMKgwqDCoMKgwqDCoMKgwqB0dG0tPmRtYV9hZGRyZXNzID0gTlVMTDsK
PiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2NhY2hpbmcuaAo+ID4gYi9pbmNs
dWRlL2RybS90dG0vdHRtX2NhY2hpbmcuaAo+ID4gaW5kZXggYTE4ZjQzZTkzYWJhYi4uZjkyZDc5
MTFmNTBlNCAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fY2FjaGluZy5oCj4g
PiArKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2NhY2hpbmcuaAo+ID4gQEAgLTQ3LDcgKzQ3LDgg
QEAgZW51bSB0dG1fY2FjaGluZyB7Cj4gPiAKPiA+IMKgwqDCoMKgwqDCoMKgwqAvKioKPiA+IMKg
wqDCoMKgwqDCoMKgwqAgKiBAdHRtX2NhY2hlZDogRnVsbHkgY2FjaGVkIGxpa2Ugbm9ybWFsIHN5
c3RlbSBtZW1vcnksCj4gPiByZXF1aXJlcyB0aGF0Cj4gPiAtwqDCoMKgwqDCoMKgwqAgKiBkZXZp
Y2VzIHNub29wIHRoZSBDUFUgY2FjaGUgb24gYWNjZXNzZXMuCj4gPiArwqDCoMKgwqDCoMKgwqAg
KiBkZXZpY2VzIHNub29wIHRoZSBDUFUgY2FjaGUgb24gYWNjZXNzZXMuIERvd25ncmFkZWQgdG8K
PiA+ICvCoMKgwqDCoMKgwqDCoCAqIHR0bV93cml0ZV9jb21iaW5lZCB3aGVuIHRoZSBzbm9vcGlu
ZyBjYXBhaWJsaXR5IGlzCj4gPiBtaXNzaW5nLgo+ID4gwqDCoMKgwqDCoMKgwqDCoCAqLwo+ID4g
wqDCoMKgwqDCoMKgwqDCoHR0bV9jYWNoZWQKPiA+IMKgfTsKPiA+IC0tIAo+ID4gMi40NS4yCj4g
Cgo=

