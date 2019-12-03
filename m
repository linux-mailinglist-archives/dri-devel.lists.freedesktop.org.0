Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 906D6110281
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27ED6E85A;
	Tue,  3 Dec 2019 16:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650B36E85A;
 Tue,  3 Dec 2019 16:39:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 08:39:09 -0800
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; d="scan'208";a="201058407"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 08:39:07 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v3 01/12] video: fbdev: atyfb: modify the static fb_ops
 directly
Date: Tue,  3 Dec 2019 18:38:43 +0200
Message-Id: <7dfbf1d47203157f5eb9a6f447f0095765d0b5e6.1575390740.git.jani.nikula@intel.com>
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
b20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5ZmIuaCAgICAgICAgIHwgMiArLQog
ZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5ZmJfYmFzZS5jICAgIHwgNiArKystLS0KIGRyaXZl
cnMvdmlkZW8vZmJkZXYvYXR5L21hY2g2NF9jdXJzb3IuYyB8IDQgKystLQogMyBmaWxlcyBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aWRlby9mYmRldi9hdHkvYXR5ZmIuaCBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L2F0eWZi
LmgKaW5kZXggZTVhMzQ3YzU4MTgwLi5hNzgzM2JjOTgyMjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
dmlkZW8vZmJkZXYvYXR5L2F0eWZiLmgKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5
ZmIuaApAQCAtMzQxLDcgKzM0MSw3IEBAIGV4dGVybiBjb25zdCB1OCBhdHlfcG9zdGRpdmlkZXJz
WzhdOwogICAgICAqICBIYXJkd2FyZSBjdXJzb3Igc3VwcG9ydAogICAgICAqLwogCi1leHRlcm4g
aW50IGF0eV9pbml0X2N1cnNvcihzdHJ1Y3QgZmJfaW5mbyAqaW5mbyk7CitleHRlcm4gaW50IGF0
eV9pbml0X2N1cnNvcihzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgc3RydWN0IGZiX29wcyAqYXR5ZmJf
b3BzKTsKIAogICAgIC8qCiAgICAgICogIEhhcmR3YXJlIGFjY2VsZXJhdGlvbgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5ZmJfYmFzZS5jIGIvZHJpdmVycy92aWRlby9m
YmRldi9hdHkvYXR5ZmJfYmFzZS5jCmluZGV4IDZkZGE1ZDg4NWEwMy4uYmViYzA4NTA1ZDk0IDEw
MDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9hdHlmYl9iYXNlLmMKKysrIGIvZHJp
dmVycy92aWRlby9mYmRldi9hdHkvYXR5ZmJfYmFzZS5jCkBAIC0xMzE2LDEwICsxMzE2LDEwIEBA
IHN0YXRpYyBpbnQgYXR5ZmJfc2V0X3BhcihzdHJ1Y3QgZmJfaW5mbyAqaW5mbykKIAlwYXItPmFj
Y2VsX2ZsYWdzID0gdmFyLT5hY2NlbF9mbGFnczsgLyogaGFjayAqLwogCiAJaWYgKHZhci0+YWNj
ZWxfZmxhZ3MpIHsKLQkJaW5mby0+ZmJvcHMtPmZiX3N5bmMgPSBhdHlmYl9zeW5jOworCQlhdHlm
Yl9vcHMuZmJfc3luYyA9IGF0eWZiX3N5bmM7CiAJCWluZm8tPmZsYWdzICY9IH5GQklORk9fSFdB
Q0NFTF9ESVNBQkxFRDsKIAl9IGVsc2UgewotCQlpbmZvLT5mYm9wcy0+ZmJfc3luYyA9IE5VTEw7
CisJCWF0eWZiX29wcy5mYl9zeW5jID0gTlVMTDsKIAkJaW5mby0+ZmxhZ3MgfD0gRkJJTkZPX0hX
QUNDRUxfRElTQUJMRUQ7CiAJfQogCkBAIC0yNzAyLDcgKzI3MDIsNyBAQCBzdGF0aWMgaW50IGF0
eV9pbml0KHN0cnVjdCBmYl9pbmZvICppbmZvKQogCiAjaWZkZWYgQ09ORklHX0ZCX0FUWV9DVAog
CWlmICghbm9hY2NlbCAmJiBNNjRfSEFTKElOVEVHUkFURUQpKQotCQlhdHlfaW5pdF9jdXJzb3Io
aW5mbyk7CisJCWF0eV9pbml0X2N1cnNvcihpbmZvLCAmYXR5ZmJfb3BzKTsKICNlbmRpZiAvKiBD
T05GSUdfRkJfQVRZX0NUICovCiAJaW5mby0+dmFyID0gdmFyOwogCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9tYWNoNjRfY3Vyc29yLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L2F0eS9tYWNoNjRfY3Vyc29yLmMKaW5kZXggNGNkZTI1ZWFiOGU4Li5iMDZmYTZlNDJlNmUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L21hY2g2NF9jdXJzb3IuYworKysgYi9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9tYWNoNjRfY3Vyc29yLmMKQEAgLTE5NCw3ICsxOTQsNyBA
QCBzdGF0aWMgaW50IGF0eWZiX2N1cnNvcihzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgc3RydWN0IGZi
X2N1cnNvciAqY3Vyc29yKQogCXJldHVybiAwOwogfQogCi1pbnQgYXR5X2luaXRfY3Vyc29yKHN0
cnVjdCBmYl9pbmZvICppbmZvKQoraW50IGF0eV9pbml0X2N1cnNvcihzdHJ1Y3QgZmJfaW5mbyAq
aW5mbywgc3RydWN0IGZiX29wcyAqYXR5ZmJfb3BzKQogewogCXVuc2lnbmVkIGxvbmcgYWRkcjsK
IApAQCAtMjE5LDcgKzIxOSw3IEBAIGludCBhdHlfaW5pdF9jdXJzb3Ioc3RydWN0IGZiX2luZm8g
KmluZm8pCiAJaW5mby0+c3ByaXRlLmJ1Zl9hbGlnbiA9IDE2OyAJLyogYW5kIDY0IGxpbmVzIHRh
bGwuICovCiAJaW5mby0+c3ByaXRlLmZsYWdzID0gRkJfUElYTUFQX0lPOwogCi0JaW5mby0+ZmJv
cHMtPmZiX2N1cnNvciA9IGF0eWZiX2N1cnNvcjsKKwlhdHlmYl9vcHMtPmZiX2N1cnNvciA9IGF0
eWZiX2N1cnNvcjsKIAogCXJldHVybiAwOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
