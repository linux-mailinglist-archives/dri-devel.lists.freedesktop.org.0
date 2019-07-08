Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C082562610
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 18:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C29D89FE3;
	Mon,  8 Jul 2019 16:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D136A89FDE;
 Mon,  8 Jul 2019 16:21:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 09:21:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="155909406"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 08 Jul 2019 09:21:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Jul 2019 19:21:19 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 07/14] drm/i915: Polish possible_clones setup
Date: Mon,  8 Jul 2019 19:20:41 +0300
Message-Id: <20190708162048.4286-8-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJl
cGxhY2UgdGhlIGhhbmQgcm9sbGVkIHN0dWZmIHdpdGggZHJtX2VuY29kZXJfbWFzaygpIHdoZW4g
cG9wdWxhdGluZwpwb3NzaWJsZV9jbG9uZXMsIGFuZCByZW5hbWUgdGhlIGZ1bmN0aW9uIHRvCmlu
dGVsX2VuY29kZXJfcG9zc2libGVfY2xvbmVzKCkgdG8gbWFrZSBpdCBjbGVhciB3aGF0IGl0J3Mg
dXNlZCBmb3IuCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFA
bGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGlzcGxheS5jIHwgMTMgKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGlzcGxheS5jCmluZGV4IGYwOWVkYTc1NzExYS4uNTAzYzIwYTNhNDljIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYwpAQCAtMTUxOTcsMjEgKzE1
MTk3LDE4IEBAIGludCBpbnRlbF9nZXRfcGlwZV9mcm9tX2NydGNfaWRfaW9jdGwoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCBp
bnRlbF9lbmNvZGVyX2Nsb25lcyhzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlcikKK3N0YXRp
YyB1MzIgaW50ZWxfZW5jb2Rlcl9wb3NzaWJsZV9jbG9uZXMoc3RydWN0IGludGVsX2VuY29kZXIg
KmVuY29kZXIpCiB7CiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGVuY29kZXItPmJhc2UuZGV2
OwogCXN0cnVjdCBpbnRlbF9lbmNvZGVyICpzb3VyY2VfZW5jb2RlcjsKLQlpbnQgaW5kZXhfbWFz
ayA9IDA7Ci0JaW50IGVudHJ5ID0gMDsKKwl1MzIgcG9zc2libGVfY2xvbmVzID0gMDsKIAogCWZv
cl9lYWNoX2ludGVsX2VuY29kZXIoZGV2LCBzb3VyY2VfZW5jb2RlcikgewogCQlpZiAoZW5jb2Rl
cnNfY2xvbmVhYmxlKGVuY29kZXIsIHNvdXJjZV9lbmNvZGVyKSkKLQkJCWluZGV4X21hc2sgfD0g
KDEgPDwgZW50cnkpOwotCi0JCWVudHJ5Kys7CisJCQlwb3NzaWJsZV9jbG9uZXMgfD0gZHJtX2Vu
Y29kZXJfbWFzaygmc291cmNlX2VuY29kZXItPmJhc2UpOwogCX0KIAotCXJldHVybiBpbmRleF9t
YXNrOworCXJldHVybiBwb3NzaWJsZV9jbG9uZXM7CiB9CiAKIHN0YXRpYyBib29sIGlsa19oYXNf
ZWRwX2Eoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KQpAQCAtMTU1MDUsNyArMTU1
MDIsNyBAQCBzdGF0aWMgdm9pZCBpbnRlbF9zZXR1cF9vdXRwdXRzKHN0cnVjdCBkcm1faTkxNV9w
cml2YXRlICpkZXZfcHJpdikKIAlmb3JfZWFjaF9pbnRlbF9lbmNvZGVyKCZkZXZfcHJpdi0+ZHJt
LCBlbmNvZGVyKSB7CiAJCWVuY29kZXItPmJhc2UucG9zc2libGVfY3J0Y3MgPSBlbmNvZGVyLT5j
cnRjX21hc2s7CiAJCWVuY29kZXItPmJhc2UucG9zc2libGVfY2xvbmVzID0KLQkJCWludGVsX2Vu
Y29kZXJfY2xvbmVzKGVuY29kZXIpOworCQkJaW50ZWxfZW5jb2Rlcl9wb3NzaWJsZV9jbG9uZXMo
ZW5jb2Rlcik7CiAJfQogCiAJaW50ZWxfaW5pdF9wY2hfcmVmY2xrKGRldl9wcml2KTsKLS0gCjIu
MjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
