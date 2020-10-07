Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 804B92862FB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 18:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571ED6E94A;
	Wed,  7 Oct 2020 16:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A2A6E93C;
 Wed,  7 Oct 2020 16:01:38 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 26EE4206E5;
 Wed,  7 Oct 2020 16:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602086498;
 bh=Ci5si85NH59q4Nd51m/tvgULjrVXrm3GhsTTOHSXt9o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dr8ZvKeFKU2W8ExkhPUCvGIlh35v3FSxvvSZ1Y31kOFMhvMQP0HT+u32E0VCvZsJx
 4WPYtkKulZOo+XCAuXKpNXY3AtCshYHYTrtnanN+US3Cday4znFq+JIdmhLYO5zcI0
 FQe+zZ1kD3LAiVajwdLXxeG2YcdKQUDPZSBsoA8E=
Date: Wed, 7 Oct 2020 11:07:38 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 08/14] drm/amd/pm: Replace one-element array with
 flexible-array in struct phm_cac_leakage_table
Message-ID: <0e4dcb96d01f93e3a9288cf8f84548410d0ceee6.1602020074.git.gustavoars@kernel.org>
References: <cover.1602020074.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1602020074.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, amd-gfx@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgaXMgYSByZWd1bGFyIG5lZWQgaW4gdGhlIGtlcm5lbCB0byBwcm92aWRlIGEgd2F5IHRv
IGRlY2xhcmUgaGF2aW5nCmEgZHluYW1pY2FsbHkgc2l6ZWQgc2V0IG9mIHRyYWlsaW5nIGVsZW1l
bnRzIGluIGEgc3RydWN0dXJlLiBLZXJuZWwgY29kZQpzaG91bGQgYWx3YXlzIHVzZSDigJxmbGV4
aWJsZSBhcnJheSBtZW1iZXJz4oCdWzFdIGZvciB0aGVzZSBjYXNlcy4gVGhlIG9sZGVyCnN0eWxl
IG9mIG9uZS1lbGVtZW50IG9yIHplcm8tbGVuZ3RoIGFycmF5cyBzaG91bGQgbm8gbG9uZ2VyIGJl
IHVzZWRbMl0uCgpSZWZhY3RvciB0aGUgY29kZSBhY2NvcmRpbmcgdG8gdGhlIHVzZSBvZiBhIGZs
ZXhpYmxlLWFycmF5IG1lbWJlciBpbgpzdHJ1Y3QgcGhtX2NhY19sZWFrYWdlX3RhYmxlLCBpbnN0
ZWFkIG9mIGEgb25lLWVsZW1lbnQgYXJyYXksCmFuZCB1c2UgdGhlIHN0cnVjdF9zaXplKCkgaGVs
cGVyIHRvIGNhbGN1bGF0ZSB0aGUgc2l6ZSBmb3IgdGhlIGFsbG9jYXRpb24uCgpBbHNvLCBzYXZl
IHNvbWUgaGVhcCBzcGFjZSBhcyB0aGUgb3JpZ2luYWwgY29kZSBpcyBtdWx0aXBseWluZwp0YWJs
ZS0+dWNOdW1FbnRyaWVzIGJ5IHNpemVvZihzdHJ1Y3QgcGhtX2NhY19sZWFrYWdlX3RhYmxlKSB3
aGVuIGl0CnNob3VsZCBoYXZlIGJlZW4gbXVsdGlwbGllZCBpdCBieSBzaXplb2Yoc3RydWN0IHBo
bV9jYWNfbGVha2FnZV9yZWNvcmQpCmluc3RlYWQuCgpbMV0gaHR0cHM6Ly9lbi53aWtpcGVkaWEu
b3JnL3dpa2kvRmxleGlibGVfYXJyYXlfbWVtYmVyClsyXSBodHRwczovL3d3dy5rZXJuZWwub3Jn
L2RvYy9odG1sL3Y1LjktcmMxL3Byb2Nlc3MvZGVwcmVjYXRlZC5odG1sI3plcm8tbGVuZ3RoLWFu
ZC1vbmUtZWxlbWVudC1hcnJheXMKCkJ1aWxkLXRlc3RlZC1ieToga2VybmVsIHRlc3Qgcm9ib3Qg
PGxrcEBpbnRlbC5jb20+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvNWY3YzVk
MzguaVQlMkZRVGpOKzY1OVhVRG81JTI1bGtwQGludGVsLmNvbS8KU2lnbmVkLW9mZi1ieTogR3Vz
dGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvcG0vaW5jL2h3bWdyLmggICAgICAgICAgICAgICAgICB8ICAyICstCiAuLi4vZHJt
L2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvcHJvY2Vzc3BwdGFibGVzLmMgICAgfCAxMyArKysrKy0t
LS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9od21nci5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wbS9pbmMvaHdtZ3IuaAppbmRleCBiOGUzMzMyNWZhYzYuLjdlMGM5NDhh
NzA5NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvaHdtZ3IuaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9od21nci5oCkBAIC0zOTMsNyArMzkzLDcgQEAg
dW5pb24gcGhtX2NhY19sZWFrYWdlX3JlY29yZCB7CiAKIHN0cnVjdCBwaG1fY2FjX2xlYWthZ2Vf
dGFibGUgewogCXVpbnQzMl90IGNvdW50OwotCXVuaW9uIHBobV9jYWNfbGVha2FnZV9yZWNvcmQg
ZW50cmllc1sxXTsKKwl1bmlvbiBwaG1fY2FjX2xlYWthZ2VfcmVjb3JkIGVudHJpZXNbXTsKIH07
CiAKIHN0cnVjdCBwaG1fc2FtdV9jbG9ja192b2x0YWdlX2RlcGVuZGVuY3lfcmVjb3JkIHsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3Nw
cHRhYmxlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvcHJvY2Vz
c3BwdGFibGVzLmMKaW5kZXggNzcxOWY1MmU2ZDUyLi5lMDU5ODAyZDFlMjUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NwcHRhYmxlcy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NwcHRh
Ymxlcy5jCkBAIC0xMzg0LDE3ICsxMzg0LDE0IEBAIHN0YXRpYyBpbnQgZ2V0X2NhY19sZWFrYWdl
X3RhYmxlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCiAJCQkJY29uc3QgQVRPTV9QUExJQl9DQUNf
TGVha2FnZV9UYWJsZSAqdGFibGUpCiB7CiAJc3RydWN0IHBobV9jYWNfbGVha2FnZV90YWJsZSAg
KmNhY19sZWFrYWdlX3RhYmxlOwotCXVuc2lnbmVkIGxvbmcgICAgICAgICAgICB0YWJsZV9zaXpl
LCBpOworCXVuc2lnbmVkIGxvbmcgaTsKIAotCWlmIChod21nciA9PSBOVUxMIHx8IHRhYmxlID09
IE5VTEwgfHwgcHRhYmxlID09IE5VTEwpCisJaWYgKCFod21nciB8fCAhdGFibGUgfHwgIXB0YWJs
ZSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLQl0YWJsZV9zaXplID0gc2l6ZW9mKFVMT05HKSArCi0J
CShzaXplb2Yoc3RydWN0IHBobV9jYWNfbGVha2FnZV90YWJsZSkgKiB0YWJsZS0+dWNOdW1FbnRy
aWVzKTsKLQotCWNhY19sZWFrYWdlX3RhYmxlID0ga3phbGxvYyh0YWJsZV9zaXplLCBHRlBfS0VS
TkVMKTsKLQotCWlmIChjYWNfbGVha2FnZV90YWJsZSA9PSBOVUxMKQorCWNhY19sZWFrYWdlX3Rh
YmxlID0ga3phbGxvYyhzdHJ1Y3Rfc2l6ZShjYWNfbGVha2FnZV90YWJsZSwgZW50cmllcywgdGFi
bGUtPnVjTnVtRW50cmllcyksCisJCQkJICAgIEdGUF9LRVJORUwpOworCWlmICghY2FjX2xlYWth
Z2VfdGFibGUpCiAJCXJldHVybiAtRU5PTUVNOwogCiAJY2FjX2xlYWthZ2VfdGFibGUtPmNvdW50
ID0gKFVMT05HKXRhYmxlLT51Y051bUVudHJpZXM7Ci0tIAoyLjI3LjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
