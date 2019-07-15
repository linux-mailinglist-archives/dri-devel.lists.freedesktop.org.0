Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F606881C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 13:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FA489994;
	Mon, 15 Jul 2019 11:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A527789991
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 11:24:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jul 2019 04:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,493,1557212400"; d="scan'208";a="161054922"
Received: from ovasilev-desk1.fi.intel.com ([10.237.72.57])
 by orsmga008.jf.intel.com with ESMTP; 15 Jul 2019 04:24:16 -0700
From: Oleg Vasilev <oleg.vasilev@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/6] drm: always determine branch device with
 drm_dp_is_branch()
Date: Mon, 15 Jul 2019 14:23:30 +0300
Message-Id: <20190715112408.20114-3-oleg.vasilev@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715112408.20114-1-oleg.vasilev@intel.com>
References: <20190701080022.9415-1-oleg.vasilev@intel.com>
 <20190715112408.20114-1-oleg.vasilev@intel.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGhlbHBlciBzaG91bGQgYWx3YXlzIGJlIHVzZWQuCgpTaWduZWQtb2ZmLWJ5OiBPbGVnIFZh
c2lsZXYgPG9sZWcudmFzaWxldkBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9oZWxwZXIuYyAgICAgICAgIHwgMyArLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZHAuYyB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCmluZGV4IDBiOTk0ZDA4M2E4OS4uNjdm
N2YzZTE5OTdiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKQEAgLTU5Niw4ICs1OTYsNyBAQCB2
b2lkIGRybV9kcF9kb3duc3RyZWFtX2RlYnVnKHN0cnVjdCBzZXFfZmlsZSAqbSwKIAlpbnQgbGVu
OwogCXVpbnQ4X3QgcmV2WzJdOwogCWludCB0eXBlID0gcG9ydF9jYXBbMF0gJiBEUF9EU19QT1JU
X1RZUEVfTUFTSzsKLQlib29sIGJyYW5jaF9kZXZpY2UgPSBkcGNkW0RQX0RPV05TVFJFQU1QT1JU
X1BSRVNFTlRdICYKLQkJCSAgICAgRFBfRFdOX1NUUk1fUE9SVF9QUkVTRU5UOworCWJvb2wgYnJh
bmNoX2RldmljZSA9IGRybV9kcF9pc19icmFuY2goZHBjZCk7CiAKIAlzZXFfcHJpbnRmKG0sICJc
dERQIGJyYW5jaCBkZXZpY2UgcHJlc2VudDogJXNcbiIsCiAJCSAgIGJyYW5jaF9kZXZpY2UgPyAi
eWVzIiA6ICJubyIpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kcC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCmluZGV4
IGE5ZGIxNmRlMjk5OS4uYjhmOGY0MGI0ZjNkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcC5jCkBAIC0yOTE2LDcgKzI5MTYsNyBAQCBzdGF0aWMgYm9vbCBkb3duc3RyZWFt
X2hwZF9uZWVkc19kMChzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKQogCSAqIEZJWE1FIHNob3Vs
ZCByZWFsbHkgY2hlY2sgYWxsIGRvd25zdHJlYW0gcG9ydHMuLi4KIAkgKi8KIAlyZXR1cm4gaW50
ZWxfZHAtPmRwY2RbRFBfRFBDRF9SRVZdID09IDB4MTEgJiYKLQkJaW50ZWxfZHAtPmRwY2RbRFBf
RE9XTlNUUkVBTVBPUlRfUFJFU0VOVF0gJiBEUF9EV05fU1RSTV9QT1JUX1BSRVNFTlQgJiYKKwkJ
ZHJtX2RwX2lzX2JyYW5jaChpbnRlbF9kcC0+ZHBjZCkgJiYKIAkJaW50ZWxfZHAtPmRvd25zdHJl
YW1fcG9ydHNbMF0gJiBEUF9EU19QT1JUX0hQRDsKIH0KIAotLSAKMi4yMi4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
