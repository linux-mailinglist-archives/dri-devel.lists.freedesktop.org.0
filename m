Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E53246D05D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 16:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8FC6E3EB;
	Thu, 18 Jul 2019 14:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C1D6E3F4;
 Thu, 18 Jul 2019 14:51:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 07:51:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,278,1559545200"; d="scan'208";a="179268602"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 18 Jul 2019 07:51:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 18 Jul 2019 17:51:02 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 03/12] drm/i915: Fix AVI infoframe quantization range for
 YCbCr output
Date: Thu, 18 Jul 2019 17:50:44 +0300
Message-Id: <20190718145053.25808-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190718145053.25808-1-ville.syrjala@linux.intel.com>
References: <20190718145053.25808-1-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldl
J3JlIGNvbmZpZ3VyaW5nIHRoZSBBVkkgaW5mb2ZyYW1lIHF1YW50aXphdGlvbiByYW5nZSBiaXRz
IGFzIGlmCndlJ3JlIGFsd2F5cyB0cmFuc21pdHRpbmcgUkdCIHBpeGVscy4gTGV0J3MgZml4IHRo
aXMgc28gdGhhdCB3ZQpjb3JyZWN0bHkgaW5kaWNhdGUgbGltaXRlZCByYW5nZSBZQ0MgcXVhbnRp
emF0aW9uIHJhbmdlIHdoZW4KdHJhbnNtaXR0aW5nIFlDYkNyIGluc3RlYWQuCgpTaWduZWQtb2Zm
LWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jIHwgMTUgKysrKysrKysr
Ky0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jCmluZGV4IDliZjI4ZGUx
MDQwMS4uYjgxMDBjZjIxZGQwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2hkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2hkbWkuYwpAQCAtNzI0LDExICs3MjQsMTYgQEAgaW50ZWxfaGRtaV9jb21wdXRlX2F2aV9pbmZv
ZnJhbWUoc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIsCiAKIAlkcm1faGRtaV9hdmlfaW5m
b2ZyYW1lX2NvbG9yc3BhY2UoZnJhbWUsIGNvbm5fc3RhdGUpOwogCi0JZHJtX2hkbWlfYXZpX2lu
Zm9mcmFtZV9xdWFudF9yYW5nZShmcmFtZSwgY29ubmVjdG9yLAotCQkJCQkgICBhZGp1c3RlZF9t
b2RlLAotCQkJCQkgICBjcnRjX3N0YXRlLT5saW1pdGVkX2NvbG9yX3JhbmdlID8KLQkJCQkJICAg
SERNSV9RVUFOVElaQVRJT05fUkFOR0VfTElNSVRFRCA6Ci0JCQkJCSAgIEhETUlfUVVBTlRJWkFU
SU9OX1JBTkdFX0ZVTEwpOworCWlmIChjcnRjX3N0YXRlLT5vdXRwdXRfZm9ybWF0ID09IElOVEVM
X09VVFBVVF9GT1JNQVRfUkdCKSB7CisJCWRybV9oZG1pX2F2aV9pbmZvZnJhbWVfcXVhbnRfcmFu
Z2UoZnJhbWUsIGNvbm5lY3RvciwKKwkJCQkJCSAgIGFkanVzdGVkX21vZGUsCisJCQkJCQkgICBj
cnRjX3N0YXRlLT5saW1pdGVkX2NvbG9yX3JhbmdlID8KKwkJCQkJCSAgIEhETUlfUVVBTlRJWkFU
SU9OX1JBTkdFX0xJTUlURUQgOgorCQkJCQkJICAgSERNSV9RVUFOVElaQVRJT05fUkFOR0VfRlVM
TCk7CisJfSBlbHNlIHsKKwkJZnJhbWUtPnF1YW50aXphdGlvbl9yYW5nZSA9IEhETUlfUVVBTlRJ
WkFUSU9OX1JBTkdFX0RFRkFVTFQ7CisJCWZyYW1lLT55Y2NfcXVhbnRpemF0aW9uX3JhbmdlID0g
SERNSV9ZQ0NfUVVBTlRJWkFUSU9OX1JBTkdFX0xJTUlURUQ7CisJfQogCiAJZHJtX2hkbWlfYXZp
X2luZm9mcmFtZV9jb250ZW50X3R5cGUoZnJhbWUsIGNvbm5fc3RhdGUpOwogCi0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
