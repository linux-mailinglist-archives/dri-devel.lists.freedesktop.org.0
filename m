Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0CC110289
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:39:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3256E9F4;
	Tue,  3 Dec 2019 16:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCE06E9F4;
 Tue,  3 Dec 2019 16:39:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 08:39:20 -0800
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; d="scan'208";a="201058445"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 08:39:18 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v3 03/12] video: fbdev: nvidia: modify the static fb_ops
 directly
Date: Tue,  3 Dec 2019 18:38:45 +0200
Message-Id: <9639e2305fd4d03311bf909b8914277b221ca582.1575390740.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575390740.git.jani.nikula@intel.com>
References: <cover.1575390740.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXZvaWQgbW9kaWZ5aW5nIHRoZSBmYl9vcHMgdmlhIGluZm8tPmZib3BzIHRvIGxldCB1cyBtYWtl
IHRoZSBwb2ludGVyCmNvbnN0IGluIHRoZSBmdXR1cmUuCgpDYzogbGludXgtZmJkZXZAdmdlci5r
ZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5j
b20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9udmlkaWEvbnZpZGlhLmMgfCAyMCArKysrKysr
KysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDkgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9udmlkaWEvbnZpZGlhLmMg
Yi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L252aWRpYS9udmlkaWEuYwppbmRleCBmYmVlZWQ1YWZlMzUu
LmM1ODNjMDE4MzA0ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9udmlkaWEvbnZp
ZGlhLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9udmlkaWEvbnZpZGlhLmMKQEAgLTYwNyw2
ICs2MDcsOCBAQCBzdGF0aWMgaW50IG52aWRpYWZiX2N1cnNvcihzdHJ1Y3QgZmJfaW5mbyAqaW5m
bywgc3RydWN0IGZiX2N1cnNvciAqY3Vyc29yKQogCXJldHVybiAwOwogfQogCitzdGF0aWMgc3Ry
dWN0IGZiX29wcyBudmlkaWFfZmJfb3BzOworCiBzdGF0aWMgaW50IG52aWRpYWZiX3NldF9wYXIo
c3RydWN0IGZiX2luZm8gKmluZm8pCiB7CiAJc3RydWN0IG52aWRpYV9wYXIgKnBhciA9IGluZm8t
PnBhcjsKQEAgLTY2MCwxOSArNjYyLDE5IEBAIHN0YXRpYyBpbnQgbnZpZGlhZmJfc2V0X3Bhcihz
dHJ1Y3QgZmJfaW5mbyAqaW5mbykKIAlpbmZvLT5maXgubGluZV9sZW5ndGggPSAoaW5mby0+dmFy
LnhyZXNfdmlydHVhbCAqCiAJCQkJIGluZm8tPnZhci5iaXRzX3Blcl9waXhlbCkgPj4gMzsKIAlp
ZiAoaW5mby0+dmFyLmFjY2VsX2ZsYWdzKSB7Ci0JCWluZm8tPmZib3BzLT5mYl9pbWFnZWJsaXQg
PSBudmlkaWFmYl9pbWFnZWJsaXQ7Ci0JCWluZm8tPmZib3BzLT5mYl9maWxscmVjdCA9IG52aWRp
YWZiX2ZpbGxyZWN0OwotCQlpbmZvLT5mYm9wcy0+ZmJfY29weWFyZWEgPSBudmlkaWFmYl9jb3B5
YXJlYTsKLQkJaW5mby0+ZmJvcHMtPmZiX3N5bmMgPSBudmlkaWFmYl9zeW5jOworCQludmlkaWFf
ZmJfb3BzLmZiX2ltYWdlYmxpdCA9IG52aWRpYWZiX2ltYWdlYmxpdDsKKwkJbnZpZGlhX2ZiX29w
cy5mYl9maWxscmVjdCA9IG52aWRpYWZiX2ZpbGxyZWN0OworCQludmlkaWFfZmJfb3BzLmZiX2Nv
cHlhcmVhID0gbnZpZGlhZmJfY29weWFyZWE7CisJCW52aWRpYV9mYl9vcHMuZmJfc3luYyA9IG52
aWRpYWZiX3N5bmM7CiAJCWluZm8tPnBpeG1hcC5zY2FuX2FsaWduID0gNDsKIAkJaW5mby0+Zmxh
Z3MgJj0gfkZCSU5GT19IV0FDQ0VMX0RJU0FCTEVEOwogCQlpbmZvLT5mbGFncyB8PSBGQklORk9f
UkVBRFNfRkFTVDsKIAkJTlZSZXNldEdyYXBoaWNzKGluZm8pOwogCX0gZWxzZSB7Ci0JCWluZm8t
PmZib3BzLT5mYl9pbWFnZWJsaXQgPSBjZmJfaW1hZ2VibGl0OwotCQlpbmZvLT5mYm9wcy0+ZmJf
ZmlsbHJlY3QgPSBjZmJfZmlsbHJlY3Q7Ci0JCWluZm8tPmZib3BzLT5mYl9jb3B5YXJlYSA9IGNm
Yl9jb3B5YXJlYTsKLQkJaW5mby0+ZmJvcHMtPmZiX3N5bmMgPSBOVUxMOworCQludmlkaWFfZmJf
b3BzLmZiX2ltYWdlYmxpdCA9IGNmYl9pbWFnZWJsaXQ7CisJCW52aWRpYV9mYl9vcHMuZmJfZmls
bHJlY3QgPSBjZmJfZmlsbHJlY3Q7CisJCW52aWRpYV9mYl9vcHMuZmJfY29weWFyZWEgPSBjZmJf
Y29weWFyZWE7CisJCW52aWRpYV9mYl9vcHMuZmJfc3luYyA9IE5VTEw7CiAJCWluZm8tPnBpeG1h
cC5zY2FuX2FsaWduID0gMTsKIAkJaW5mby0+ZmxhZ3MgfD0gRkJJTkZPX0hXQUNDRUxfRElTQUJM
RUQ7CiAJCWluZm8tPmZsYWdzICY9IH5GQklORk9fUkVBRFNfRkFTVDsKQEAgLTExNjUsNyArMTE2
Nyw3IEBAIHN0YXRpYyBpbnQgbnZpZGlhX3NldF9mYmluZm8oc3RydWN0IGZiX2luZm8gKmluZm8p
CiAJaW5mby0+cGl4bWFwLmZsYWdzID0gRkJfUElYTUFQX1NZU1RFTTsKIAogCWlmICghaHdjdXIp
Ci0JICAgIGluZm8tPmZib3BzLT5mYl9jdXJzb3IgPSBOVUxMOworCSAgICBudmlkaWFfZmJfb3Bz
LmZiX2N1cnNvciA9IE5VTEw7CiAKIAlpbmZvLT52YXIuYWNjZWxfZmxhZ3MgPSAoIW5vYWNjZWwp
OwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
