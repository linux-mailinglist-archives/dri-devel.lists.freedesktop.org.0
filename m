Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 284A788603
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 00:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929B16EF0A;
	Fri,  9 Aug 2019 22:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DD76EF1D;
 Fri,  9 Aug 2019 22:27:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 15:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,366,1559545200"; d="scan'208";a="176927107"
Received: from jmath3-mobl1.ger.corp.intel.com (HELO
 mwahaha-bdw.ger.corp.intel.com) ([10.252.5.86])
 by fmsmga007.fm.intel.com with ESMTP; 09 Aug 2019 15:27:28 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 31/37] drm/i915/lmem: add helper to get CPU accessible
 offset
Date: Fri,  9 Aug 2019 23:26:37 +0100
Message-Id: <20190809222643.23142-32-matthew.auld@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809222643.23142-1-matthew.auld@intel.com>
References: <20190809222643.23142-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWJkaWVsIEphbnVsZ3VlIDxhYmRpZWwuamFudWxndWVAbGludXguaW50ZWwuY29tPgoK
TE1FTSBjYW4gYmUgYWNjZXNzZWQgYnkgdGhlIENQVSB0aHJvdWdoIGEgQkFSLiBUaGUgbWFwcGlu
ZyBpdHNlbGYgc2hvdWxkCmJlIDE6MS4KClNpZ25lZC1vZmYtYnk6IEFiZGllbCBKYW51bGd1ZSA8
YWJkaWVsLmphbnVsZ3VlQGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogTWF0dGhldyBB
dWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPgpDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMu
bGFodGluZW5AbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9p
OTE1X2dlbV9sbWVtLmMgfCAxNiArKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9nZW0vaTkxNV9nZW1fbG1lbS5oIHwgIDMgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1f
bG1lbS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2xtZW0uYwppbmRleCBm
MDAwNzhhYzMzMWUuLjhkMDI1MWFmNWRmYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ2VtL2k5MTVfZ2VtX2xtZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkx
NV9nZW1fbG1lbS5jCkBAIC0yMjUsNiArMjI1LDIyIEBAIHZvaWQgX19pb21lbSAqaTkxNV9nZW1f
b2JqZWN0X2xtZW1faW9fbWFwKHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmosCiAJcmV0
dXJuIGlvX21hcHBpbmdfbWFwX3djKCZvYmotPm1tLnJlZ2lvbi0+aW9tYXAsIG9mZnNldCwgc2l6
ZSk7CiB9CiAKK3Jlc291cmNlX3NpemVfdCBpOTE1X2dlbV9vYmplY3RfbG1lbV9pb19vZmZzZXQo
c3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaiwKKwkJCQkJICAgICAgIHVuc2lnbmVkIGxv
bmcgbikKK3sKKwlzdHJ1Y3QgaW50ZWxfbWVtb3J5X3JlZ2lvbiAqbWVtID0gb2JqLT5tbS5yZWdp
b247CisJZG1hX2FkZHJfdCBkYWRkcjsKKworCS8qCisJICogWFhYOiBJdCdzIG5vdCBhIGRtYSBh
ZGRyZXNzLCBtb3JlIGEgZGV2aWNlIGFkZHJlc3Mgb3IgcGh5c2ljYWwKKwkgKiBvZmZzZXQsIHNv
IHdlIGFyZSBjbGVhcmx5IGFidXNpbmcgdGhlIHNlbWFudGljcyBvZiB0aGUgc2dfdGFibGUKKwkg
KiBoZXJlLCBhbmQgZWxzZXdoZXJlIGxpa2UgaW4gdGhlIGd0dCBwYXRocy4KKwkgKi8KKwlkYWRk
ciA9IGk5MTVfZ2VtX29iamVjdF9nZXRfZG1hX2FkZHJlc3Mob2JqLCBuKTsKKworCXJldHVybiBt
ZW0tPmlvX3N0YXJ0ICsgZGFkZHI7Cit9CisKIGJvb2wgaTkxNV9nZW1fb2JqZWN0X2lzX2xtZW0o
c3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaikKIHsKIAlzdHJ1Y3QgaW50ZWxfbWVtb3J5
X3JlZ2lvbiAqcmVnaW9uID0gb2JqLT5tbS5yZWdpb247CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fbG1lbS5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L2k5MTVfZ2VtX2xtZW0uaAppbmRleCAzMWE2NDYyYmRiYjYuLjQzZTZlNzE1ZWVlZCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2xtZW0uaAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fbG1lbS5oCkBAIC0yMSw2ICsyMSw5IEBAIHZv
aWQgX19pb21lbSAqCiBpOTE1X2dlbV9vYmplY3RfbG1lbV9pb19tYXBfcGFnZV9hdG9taWMoc3Ry
dWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaiwKIAkJCQkJdW5zaWduZWQgbG9uZyBuKTsKIAor
cmVzb3VyY2Vfc2l6ZV90IGk5MTVfZ2VtX29iamVjdF9sbWVtX2lvX29mZnNldChzdHJ1Y3QgZHJt
X2k5MTVfZ2VtX29iamVjdCAqb2JqLAorCQkJCQkgICAgICAgdW5zaWduZWQgbG9uZyBuKTsKKwog
Ym9vbCBpOTE1X2dlbV9vYmplY3RfaXNfbG1lbShzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAq
b2JqKTsKIAogc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKgotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
