Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD920FE5D6
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 20:42:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B4D6E7C6;
	Fri, 15 Nov 2019 19:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5076E7B5;
 Fri, 15 Nov 2019 19:42:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 11:42:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,309,1569308400"; d="scan'208";a="236185158"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 15 Nov 2019 11:42:12 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Nov 2019 21:42:11 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] drm: Allocate the page flip event earlier
Date: Fri, 15 Nov 2019 21:41:59 +0200
Message-Id: <20191115194204.22244-3-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkNh
bid0IHNlZSB3aHkgd2UgbmVlZCB0byBkZWxheSB0aGUgcGFnZSBmbGlwIGV2ZW50IGFsbG9jYXRp
b24gdW50aWwgdGhlCmxhc3QgbW9tZW50LiBNb3ZlIGl0IGVhcmxpZXIgdG8gc2ltcGxpZnkgZXJy
b3IgaGFuZGxpbmcuCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYyB8IDQ1
ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
MyBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMKaW5kZXggMTRh
MjkyZDc4MTdkLi4zODg3OGRhNWI3MDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
cGxhbmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMKQEAgLTExMTYsNiArMTEx
NiwyNiBAQCBpbnQgZHJtX21vZGVfcGFnZV9mbGlwX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsCiAJCWdvdG8gcHV0X3ZibGFuazsKIAl9CiAKKwlpZiAocGFnZV9mbGlwLT5mbGFncyAmIERS
TV9NT0RFX1BBR0VfRkxJUF9FVkVOVCkgeworCQllID0ga3phbGxvYyhzaXplb2YoKmUpLCBHRlBf
S0VSTkVMKTsKKwkJaWYgKCFlKSB7CisJCQlyZXQgPSAtRU5PTUVNOworCQkJZ290byBwdXRfZmI7
CisJCX0KKworCQllLT5ldmVudC5iYXNlLnR5cGUgPSBEUk1fRVZFTlRfRkxJUF9DT01QTEVURTsK
KwkJZS0+ZXZlbnQuYmFzZS5sZW5ndGggPSBzaXplb2YoZS0+ZXZlbnQpOworCQllLT5ldmVudC52
YmwudXNlcl9kYXRhID0gcGFnZV9mbGlwLT51c2VyX2RhdGE7CisJCWUtPmV2ZW50LnZibC5jcnRj
X2lkID0gY3J0Yy0+YmFzZS5pZDsKKworCQlyZXQgPSBkcm1fZXZlbnRfcmVzZXJ2ZV9pbml0KGRl
diwgZmlsZV9wcml2LCAmZS0+YmFzZSwgJmUtPmV2ZW50LmJhc2UpOworCQlpZiAocmV0KSB7CisJ
CQlrZnJlZShlKTsKKwkJCWUgPSBOVUxMOworCQkJZ290byBwdXRfZmI7CisJCX0KKwl9CisKIAlk
cm1fbW9kZXNldF9hY3F1aXJlX2luaXQoJmN0eCwgRFJNX01PREVTRVRfQUNRVUlSRV9JTlRFUlJV
UFRJQkxFKTsKIHJldHJ5OgogCXJldCA9IGRybV9tb2Rlc2V0X2xvY2soJmNydGMtPm11dGV4LCAm
Y3R4KTsKQEAgLTExNjAsMjYgKzExODAsNiBAQCBpbnQgZHJtX21vZGVfcGFnZV9mbGlwX2lvY3Rs
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCWdvdG8gb3V0OwogCX0KIAotCWlmIChwYWdlX2Zs
aXAtPmZsYWdzICYgRFJNX01PREVfUEFHRV9GTElQX0VWRU5UKSB7Ci0JCWUgPSBremFsbG9jKHNp
emVvZiAqZSwgR0ZQX0tFUk5FTCk7Ci0JCWlmICghZSkgewotCQkJcmV0ID0gLUVOT01FTTsKLQkJ
CWdvdG8gb3V0OwotCQl9Ci0KLQkJZS0+ZXZlbnQuYmFzZS50eXBlID0gRFJNX0VWRU5UX0ZMSVBf
Q09NUExFVEU7Ci0JCWUtPmV2ZW50LmJhc2UubGVuZ3RoID0gc2l6ZW9mKGUtPmV2ZW50KTsKLQkJ
ZS0+ZXZlbnQudmJsLnVzZXJfZGF0YSA9IHBhZ2VfZmxpcC0+dXNlcl9kYXRhOwotCQllLT5ldmVu
dC52YmwuY3J0Y19pZCA9IGNydGMtPmJhc2UuaWQ7Ci0KLQkJcmV0ID0gZHJtX2V2ZW50X3Jlc2Vy
dmVfaW5pdChkZXYsIGZpbGVfcHJpdiwgJmUtPmJhc2UsICZlLT5ldmVudC5iYXNlKTsKLQkJaWYg
KHJldCkgewotCQkJa2ZyZWUoZSk7Ci0JCQllID0gTlVMTDsKLQkJCWdvdG8gb3V0OwotCQl9Ci0J
fQotCiAJcGxhbmUtPm9sZF9mYiA9IHBsYW5lLT5mYjsKIAlpZiAoY3J0Yy0+ZnVuY3MtPnBhZ2Vf
ZmxpcF90YXJnZXQpCiAJCXJldCA9IGNydGMtPmZ1bmNzLT5wYWdlX2ZsaXBfdGFyZ2V0KGNydGMs
IGZiLCBlLApAQCAtMTE5MCw4ICsxMTkwLDYgQEAgaW50IGRybV9tb2RlX3BhZ2VfZmxpcF9pb2N0
bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQlyZXQgPSBjcnRjLT5mdW5jcy0+cGFnZV9mbGlw
KGNydGMsIGZiLCBlLCBwYWdlX2ZsaXAtPmZsYWdzLAogCQkJCQkgICAgICZjdHgpOwogCWlmIChy
ZXQpIHsKLQkJaWYgKHBhZ2VfZmxpcC0+ZmxhZ3MgJiBEUk1fTU9ERV9QQUdFX0ZMSVBfRVZFTlQp
Ci0JCQlkcm1fZXZlbnRfY2FuY2VsX2ZyZWUoZGV2LCAmZS0+YmFzZSk7CiAJCS8qIEtlZXAgdGhl
IG9sZCBmYiwgZG9uJ3QgdW5yZWYgaXQuICovCiAJCXBsYW5lLT5vbGRfZmIgPSBOVUxMOwogCX0g
ZWxzZSB7CkBAIC0xMjE1LDYgKzEyMTMsOSBAQCBpbnQgZHJtX21vZGVfcGFnZV9mbGlwX2lvY3Rs
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJZHJtX21vZGVzZXRfZHJvcF9sb2NrcygmY3R4KTsK
IAlkcm1fbW9kZXNldF9hY3F1aXJlX2ZpbmkoJmN0eCk7CiAKKwlpZiAocmV0ICYmIGUpCisJCWRy
bV9ldmVudF9jYW5jZWxfZnJlZShkZXYsICZlLT5iYXNlKTsKK3B1dF9mYjoKIAlkcm1fZnJhbWVi
dWZmZXJfcHV0KGZiKTsKIHB1dF92Ymxhbms6CiAJaWYgKHJldCAmJiBjcnRjLT5mdW5jcy0+cGFn
ZV9mbGlwX3RhcmdldCkKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
