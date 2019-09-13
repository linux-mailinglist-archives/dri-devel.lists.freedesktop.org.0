Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBC2B1CA1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 13:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F18E6EF37;
	Fri, 13 Sep 2019 11:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3898A6EF35;
 Fri, 13 Sep 2019 11:52:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 04:52:43 -0700
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="176262299"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 04:52:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/9] drm/nouveau: use drm_debug_enabled() to check for debug
 categories
Date: Fri, 13 Sep 2019 14:51:44 +0300
Message-Id: <a6743172d086e81aa82e19c1eacb6c689166ba06.1568375189.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1568375189.git.jani.nikula@intel.com>
References: <cover.1568375189.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsb3cgYmV0dGVyIGFic3RyYWN0aW9uIG9mIHRoZSBkcm1fZGVidWcgZ2xvYmFsIHZhcmlhYmxl
IGluIHRoZQpmdXR1cmUuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KCkNjOiBCZW4gU2tlZ2dzIDxi
c2tlZ2dzQHJlZGhhdC5jb20+CkNjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuaCB8IDQgKystLQogZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9kcnYuaCAgIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmggYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNw
bnY1MC9kaXNwLmgKaW5kZXggN2M0MWIwNTk5ZDFhLi5jMGE3OTUzMWIwODcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmgKQEAgLTc4LDE0ICs3OCwxNCBAQCB2b2lkIGV2
b19raWNrKHUzMiAqLCBzdHJ1Y3QgbnY1MF9kbWFjICopOwogCiAjZGVmaW5lIGV2b19tdGhkKHAs
IG0sIHMpIGRvIHsJCQkJCQlcCiAJY29uc3QgdTMyIF9tID0gKG0pLCBfcyA9IChzKTsJCQkJCVwK
LQlpZiAoZHJtX2RlYnVnICYgRFJNX1VUX0tNUykJCQkJCVwKKwlpZiAoZHJtX2RlYnVnX2VuYWJs
ZWQoRFJNX1VUX0tNUykpCQkJCVwKIAkJcHJfZXJyKCIlMDR4ICVkICVzXG4iLCBfbSwgX3MsIF9f
ZnVuY19fKTsJCVwKIAkqKChwKSsrKSA9ICgoX3MgPDwgMTgpIHwgX20pOwkJCQkJXAogfSB3aGls
ZSgwKQogCiAjZGVmaW5lIGV2b19kYXRhKHAsIGQpIGRvIHsJCQkJCQlcCiAJY29uc3QgdTMyIF9k
ID0gKGQpOwkJCQkJCVwKLQlpZiAoZHJtX2RlYnVnICYgRFJNX1VUX0tNUykJCQkJCVwKKwlpZiAo
ZHJtX2RlYnVnX2VuYWJsZWQoRFJNX1VUX0tNUykpCQkJCVwKIAkJcHJfZXJyKCJcdCUwOHhcbiIs
IF9kKTsJCQkJCVwKIAkqKChwKSsrKSA9IF9kOwkJCQkJCQlcCiB9IHdoaWxlKDApCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rydi5oIGIvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9kcnYuaAppbmRleCA3MGYzNGNhY2M1NTIuLjE2MjgzZDFlNTFh
YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcnYuaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rydi5oCkBAIC0yNDgsMTEgKzI0OCwx
MSBAQCB2b2lkIG5vdXZlYXVfZHJtX2RldmljZV9yZW1vdmUoc3RydWN0IGRybV9kZXZpY2UgKmRl
dik7CiAjZGVmaW5lIE5WX0lORk8oZHJtLGYsYS4uLikgTlZfUFJJTlRLKGluZm8sICYoZHJtKS0+
Y2xpZW50LCBmLCAjI2EpCiAKICNkZWZpbmUgTlZfREVCVUcoZHJtLGYsYS4uLikgZG8geyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCi0JaWYgKHVubGlrZWx5
KGRybV9kZWJ1ZyAmIERSTV9VVF9EUklWRVIpKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCisJaWYgKHVubGlrZWx5KGRybV9kZWJ1Z19lbmFibGVkKERSTV9VVF9EUklWRVIpKSkgICAg
ICAgICAgICAgICAgICAgICAgICBcCiAJCU5WX1BSSU5USyhpbmZvLCAmKGRybSktPmNsaWVudCwg
ZiwgIyNhKTsgICAgICAgICAgICAgICAgICAgICAgIFwKIH0gd2hpbGUoMCkKICNkZWZpbmUgTlZf
QVRPTUlDKGRybSxmLGEuLi4pIGRvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCi0JaWYgKHVubGlrZWx5KGRybV9kZWJ1ZyAmIERSTV9VVF9BVE9NSUMpKSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisJaWYgKHVubGlrZWx5KGRybV9kZWJ1Z19l
bmFibGVkKERSTV9VVF9BVE9NSUMpKSkgICAgICAgICAgICAgICAgICAgICAgICBcCiAJCU5WX1BS
SU5USyhpbmZvLCAmKGRybSktPmNsaWVudCwgZiwgIyNhKTsgICAgICAgICAgICAgICAgICAgICAg
IFwKIH0gd2hpbGUoMCkKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
