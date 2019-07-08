Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB5362613
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 18:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C7889FF9;
	Mon,  8 Jul 2019 16:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248EA89FED;
 Mon,  8 Jul 2019 16:21:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 09:21:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="165500249"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 08 Jul 2019 09:21:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Jul 2019 19:21:22 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 08/14] drm/i915: Populate possible_crtcs correctly
Date: Mon,  8 Jul 2019 19:20:42 +0300
Message-Id: <20190708162048.4286-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190708162048.4286-1-ville.syrjala@linux.intel.com>
References: <20190708162048.4286-1-ville.syrjala@linux.intel.com>
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkRv
bid0IGFkdmVydGl6ZSBub24tZXhpc2l0aW5nIGNydGNzIGluIHRoZSBlbmNvZGVyIHBvc3NpYmxl
X2NydGNzCmJpdG1hc2suCgpSZXZpZXdlZC1ieTogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFr
YXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgfCAxNyArKysrKysrKysrKysrKysrLQogMSBmaWxlIGNo
YW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCmluZGV4IDUwM2MyMGEzYTQ5Yy4uOTNmZGQx
Y2JkMzQzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXku
YwpAQCAtMTUyMTEsNiArMTUyMTEsMjAgQEAgc3RhdGljIHUzMiBpbnRlbF9lbmNvZGVyX3Bvc3Np
YmxlX2Nsb25lcyhzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlcikKIAlyZXR1cm4gcG9zc2li
bGVfY2xvbmVzOwogfQogCitzdGF0aWMgdTMyIGludGVsX2VuY29kZXJfcG9zc2libGVfY3J0Y3Mo
c3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIpCit7CisJc3RydWN0IGRybV9kZXZpY2UgKmRl
diA9IGVuY29kZXItPmJhc2UuZGV2OworCXN0cnVjdCBpbnRlbF9jcnRjICpjcnRjOworCXUzMiBw
b3NzaWJsZV9jcnRjcyA9IDA7CisKKwlmb3JfZWFjaF9pbnRlbF9jcnRjKGRldiwgY3J0Yykgewor
CQlpZiAoZW5jb2Rlci0+Y3J0Y19tYXNrICYgQklUKGNydGMtPnBpcGUpKQorCQkJcG9zc2libGVf
Y3J0Y3MgfD0gZHJtX2NydGNfbWFzaygmY3J0Yy0+YmFzZSk7CisJfQorCisJcmV0dXJuIHBvc3Np
YmxlX2NydGNzOworfQorCiBzdGF0aWMgYm9vbCBpbGtfaGFzX2VkcF9hKHN0cnVjdCBkcm1faTkx
NV9wcml2YXRlICpkZXZfcHJpdikKIHsKIAlpZiAoIUlTX01PQklMRShkZXZfcHJpdikpCkBAIC0x
NTUwMCw3ICsxNTUxNCw4IEBAIHN0YXRpYyB2b2lkIGludGVsX3NldHVwX291dHB1dHMoc3RydWN0
IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KQogCWludGVsX3Bzcl9pbml0KGRldl9wcml2KTsK
IAogCWZvcl9lYWNoX2ludGVsX2VuY29kZXIoJmRldl9wcml2LT5kcm0sIGVuY29kZXIpIHsKLQkJ
ZW5jb2Rlci0+YmFzZS5wb3NzaWJsZV9jcnRjcyA9IGVuY29kZXItPmNydGNfbWFzazsKKwkJZW5j
b2Rlci0+YmFzZS5wb3NzaWJsZV9jcnRjcyA9CisJCQlpbnRlbF9lbmNvZGVyX3Bvc3NpYmxlX2Ny
dGNzKGVuY29kZXIpOwogCQllbmNvZGVyLT5iYXNlLnBvc3NpYmxlX2Nsb25lcyA9CiAJCQlpbnRl
bF9lbmNvZGVyX3Bvc3NpYmxlX2Nsb25lcyhlbmNvZGVyKTsKIAl9Ci0tIAoyLjIxLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
