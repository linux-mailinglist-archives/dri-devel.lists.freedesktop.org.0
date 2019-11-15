Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0748FE5DA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 20:42:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E456E7D3;
	Fri, 15 Nov 2019 19:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3446E7D3;
 Fri, 15 Nov 2019 19:42:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 11:42:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,309,1569308400"; d="scan'208";a="195486622"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 15 Nov 2019 11:42:18 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Nov 2019 21:42:17 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] drm: Simplify the setplane old_fb handling further
Date: Fri, 15 Nov 2019 21:42:01 +0200
Message-Id: <20191115194204.22244-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115194204.22244-1-ville.syrjala@linux.intel.com>
References: <20191115194204.22244-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCklu
c3RlYWQgb2YgZG9pbmcgdGhlIHRoaW5ncyBpbiBhIGNvbnZvbHV0ZWQgd2F5IHdpdGggdGhlIGZh
aWx1cmUgYW5kCnN1Y2Nlc3MgcGF0aHMgbWl4ZWQgdXAgbGV0J3MganVzdCBjbGVhciBvbGRfZmIg
d2hlbiB3ZSBlbmNvdW50ZXIgYW4KZXJyb3IgYW5kIGJhaWwgb3V0IGltbWVkaWF0ZWx5LiBXZSBh
bHJlYWR5IGRpZCB0aGlzIGZvciB0aGUgcGFnZWZsaXAKcGF0aC4KClNpZ25lZC1vZmYtYnk6IFZp
bGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2RybV9wbGFuZS5jIHwgMjQgKysrKysrKysrKysrKy0tLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFu
ZS5jCmluZGV4IDYwNTI0NzVhMjBhNS4uZWYwY2MzM2I0M2NlIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX3BsYW5lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jCkBA
IC02ODgsMTIgKzY4OCwxMyBAQCBzdGF0aWMgaW50IF9fc2V0cGxhbmVfaW50ZXJuYWwoc3RydWN0
IGRybV9wbGFuZSAqcGxhbmUsCiAJaWYgKCFmYikgewogCQlwbGFuZS0+b2xkX2ZiID0gcGxhbmUt
PmZiOwogCQlyZXQgPSBwbGFuZS0+ZnVuY3MtPmRpc2FibGVfcGxhbmUocGxhbmUsIGN0eCk7Ci0J
CWlmICghcmV0KSB7Ci0JCQlwbGFuZS0+Y3J0YyA9IE5VTEw7Ci0JCQlwbGFuZS0+ZmIgPSBOVUxM
OwotCQl9IGVsc2UgeworCQlpZiAocmV0KSB7CiAJCQlwbGFuZS0+b2xkX2ZiID0gTlVMTDsKKwkJ
CXJldHVybiByZXQ7CiAJCX0KKworCQlwbGFuZS0+Y3J0YyA9IE5VTEw7CisJCXBsYW5lLT5mYiA9
IE5VTEw7CiAJCWdvdG8gb3V0OwogCX0KIApAQCAtNzAxLDI2ICs3MDIsMjcgQEAgc3RhdGljIGlu
dCBfX3NldHBsYW5lX2ludGVybmFsKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAogCQkJICAgICAg
IGNydGNfeCwgY3J0Y195LCBjcnRjX3csIGNydGNfaCwKIAkJCSAgICAgICBzcmNfeCwgc3JjX3ks
IHNyY193LCBzcmNfaCk7CiAJaWYgKHJldCkKLQkJZ290byBvdXQ7CisJCXJldHVybiByZXQ7CiAK
IAlwbGFuZS0+b2xkX2ZiID0gcGxhbmUtPmZiOwogCXJldCA9IHBsYW5lLT5mdW5jcy0+dXBkYXRl
X3BsYW5lKHBsYW5lLCBjcnRjLCBmYiwKIAkJCQkJIGNydGNfeCwgY3J0Y195LCBjcnRjX3csIGNy
dGNfaCwKIAkJCQkJIHNyY194LCBzcmNfeSwgc3JjX3csIHNyY19oLCBjdHgpOwotCWlmICghcmV0
KSB7Ci0JCXBsYW5lLT5jcnRjID0gY3J0YzsKLQkJcGxhbmUtPmZiID0gZmI7Ci0JCWRybV9mcmFt
ZWJ1ZmZlcl9nZXQocGxhbmUtPmZiKTsKLQl9IGVsc2UgeworCWlmIChyZXQpIHsKIAkJcGxhbmUt
Pm9sZF9mYiA9IE5VTEw7CisJCXJldHVybiByZXQ7CiAJfQogCisJcGxhbmUtPmNydGMgPSBjcnRj
OworCXBsYW5lLT5mYiA9IGZiOworCWRybV9mcmFtZWJ1ZmZlcl9nZXQocGxhbmUtPmZiKTsKKwog
b3V0OgogCWlmIChwbGFuZS0+b2xkX2ZiKQogCQlkcm1fZnJhbWVidWZmZXJfcHV0KHBsYW5lLT5v
bGRfZmIpOwogCXBsYW5lLT5vbGRfZmIgPSBOVUxMOwogCi0JcmV0dXJuIHJldDsKKwlyZXR1cm4g
MDsKIH0KIAogc3RhdGljIGludCBfX3NldHBsYW5lX2F0b21pYyhzdHJ1Y3QgZHJtX3BsYW5lICpw
bGFuZSwKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
