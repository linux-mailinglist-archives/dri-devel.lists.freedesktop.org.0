Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A14D885F8
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 00:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465D26EF1E;
	Fri,  9 Aug 2019 22:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC5B6EF12;
 Fri,  9 Aug 2019 22:27:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 15:27:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,366,1559545200"; d="scan'208";a="176927066"
Received: from jmath3-mobl1.ger.corp.intel.com (HELO
 mwahaha-bdw.ger.corp.intel.com) ([10.252.5.86])
 by fmsmga007.fm.intel.com with ESMTP; 09 Aug 2019 15:27:17 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 23/37] drm/i915: do not map aperture if it is not available.
Date: Fri,  9 Aug 2019 23:26:29 +0100
Message-Id: <20190809222643.23142-24-matthew.auld@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVs
LmNvbT4KClNraXAgYm90aCBzZXR1cCBhbmQgY2xlYW51cCBvZiB0aGUgYXBlcnR1cmUgbWFwcGlu
ZyBpZiB0aGUgSFcgZG9lc24ndApoYXZlIGFuIGFwZXJ0dXJlIGJhci4KClNpZ25lZC1vZmYtYnk6
IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+
CkNjOiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2k5MTUvaTkxNV9nZW1fZ3R0LmMgfCAzNiArKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2d0dC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9nZW1fZ3R0LmMKaW5kZXggNWJjZjcxYjE4ZTVmLi5kZDI4YzU0
NTI3ZTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2d0dC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2d0dC5jCkBAIC0yNzk1LDggKzI3OTUs
MTAgQEAgc3RhdGljIHZvaWQgZ2d0dF9jbGVhbnVwX2h3KHN0cnVjdCBpOTE1X2dndHQgKmdndHQp
CiAKIAltdXRleF91bmxvY2soJmk5MTUtPmRybS5zdHJ1Y3RfbXV0ZXgpOwogCi0JYXJjaF9waHlz
X3djX2RlbChnZ3R0LT5tdHJyKTsKLQlpb19tYXBwaW5nX2ZpbmkoJmdndHQtPmlvbWFwKTsKKwlp
ZiAoSEFTX01BUFBBQkxFX0FQRVJUVVJFKGk5MTUpKSB7CisJCWFyY2hfcGh5c193Y19kZWwoZ2d0
dC0+bXRycik7CisJCWlvX21hcHBpbmdfZmluaSgmZ2d0dC0+aW9tYXApOworCX0KIH0KIAogLyoq
CkBAIC0yOTkyLDEwICsyOTk0LDEzIEBAIHN0YXRpYyBpbnQgZ2VuOF9nbWNoX3Byb2JlKHN0cnVj
dCBpOTE1X2dndHQgKmdndHQpCiAJaW50IGVycjsKIAogCS8qIFRPRE86IFdlJ3JlIG5vdCBhd2Fy
ZSBvZiBtYXBwYWJsZSBjb25zdHJhaW50cyBvbiBnZW44IHlldCAqLwotCWdndHQtPmdtYWRyID0K
LQkJKHN0cnVjdCByZXNvdXJjZSkgREVGSU5FX1JFU19NRU0ocGNpX3Jlc291cmNlX3N0YXJ0KHBk
ZXYsIDIpLAotCQkJCQkJIHBjaV9yZXNvdXJjZV9sZW4ocGRldiwgMikpOwotCWdndHQtPm1hcHBh
YmxlX2VuZCA9IHJlc291cmNlX3NpemUoJmdndHQtPmdtYWRyKTsKKwkvKiBGSVhNRTogV2UgcHJv
YmFibHkgbmVlZCB0byBhZGQgZG8gZGV2aWNlX2luZm8gb3IgcnVudGltZV9pbmZvICovCisJaWYg
KCFIQVNfTE1FTShkZXZfcHJpdikpIHsKKwkJZ2d0dC0+Z21hZHIgPQorCQkJKHN0cnVjdCByZXNv
dXJjZSkgREVGSU5FX1JFU19NRU0ocGNpX3Jlc291cmNlX3N0YXJ0KHBkZXYsIDIpLAorCQkJCQkJ
CSBwY2lfcmVzb3VyY2VfbGVuKHBkZXYsIDIpKTsKKwkJZ2d0dC0+bWFwcGFibGVfZW5kID0gcmVz
b3VyY2Vfc2l6ZSgmZ2d0dC0+Z21hZHIpOworCX0KIAogCWVyciA9IHBjaV9zZXRfZG1hX21hc2so
cGRldiwgRE1BX0JJVF9NQVNLKDM5KSk7CiAJaWYgKCFlcnIpCkBAIC0zMjIwLDE1ICszMjI1LDE4
IEBAIHN0YXRpYyBpbnQgZ2d0dF9pbml0X2h3KHN0cnVjdCBpOTE1X2dndHQgKmdndHQpCiAJaWYg
KCFIQVNfTExDKGk5MTUpICYmICFIQVNfUFBHVFQoaTkxNSkpCiAJCWdndHQtPnZtLm1tLmNvbG9y
X2FkanVzdCA9IGk5MTVfZ3R0X2NvbG9yX2FkanVzdDsKIAotCWlmICghaW9fbWFwcGluZ19pbml0
X3djKCZnZ3R0LT5pb21hcCwKLQkJCQlnZ3R0LT5nbWFkci5zdGFydCwKLQkJCQlnZ3R0LT5tYXBw
YWJsZV9lbmQpKSB7Ci0JCWdndHQtPnZtLmNsZWFudXAoJmdndHQtPnZtKTsKLQkJcmV0ID0gLUVJ
TzsKLQkJZ290byBvdXQ7Ci0JfQorCWlmIChIQVNfTUFQUEFCTEVfQVBFUlRVUkUoaTkxNSkpIHsK
KwkJaWYgKCFpb19tYXBwaW5nX2luaXRfd2MoJmdndHQtPmlvbWFwLAorCQkJCQlnZ3R0LT5nbWFk
ci5zdGFydCwKKwkJCQkJZ2d0dC0+bWFwcGFibGVfZW5kKSkgeworCQkJZ2d0dC0+dm0uY2xlYW51
cCgmZ2d0dC0+dm0pOworCQkJcmV0ID0gLUVJTzsKKwkJCWdvdG8gb3V0OworCQl9CiAKLQlnZ3R0
LT5tdHJyID0gYXJjaF9waHlzX3djX2FkZChnZ3R0LT5nbWFkci5zdGFydCwgZ2d0dC0+bWFwcGFi
bGVfZW5kKTsKKwkJZ2d0dC0+bXRyciA9IGFyY2hfcGh5c193Y19hZGQoZ2d0dC0+Z21hZHIuc3Rh
cnQsCisJCQkJCSAgICAgIGdndHQtPm1hcHBhYmxlX2VuZCk7CisJfQogCiAJaTkxNV9nZ3R0X2lu
aXRfZmVuY2VzKGdndHQpOwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
