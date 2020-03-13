Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B49FB184C4F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 17:21:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269116EC13;
	Fri, 13 Mar 2020 16:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EEC6EC14;
 Fri, 13 Mar 2020 16:21:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Mar 2020 09:21:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,549,1574150400"; d="scan'208";a="290065879"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 13 Mar 2020 09:21:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Mar 2020 18:21:11 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/9] drm/edid: Move validate_displayid()
 drm_find_displayid_extension()
Date: Fri, 13 Mar 2020 18:20:50 +0200
Message-Id: <20200313162054.16009-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200313162054.16009-1-ville.syrjala@linux.intel.com>
References: <20200313162054.16009-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
c3RlYWQgb2YgZXZlcnlvbmUgaGF2aW5nIHRvIGNhbGwgdmFsaWRhdGVfZGlzcGxheWlkKCkgbGV0
J3MganVzdApoYXZlIGRybV9maW5kX2Rpc3BsYXlpZF9leHRlbnNpb24oKSBkbyBpdCBmb3IgdGhl
bS4KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCAxOSArKysrKy0tLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZWRpZC5jCmluZGV4IDE4YzU1ZjNiMjBkZS4uZGJkMmU4NDc0YzJhIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2VkaWQuYwpAQCAtMzIxNiw2ICszMjE2LDcgQEAgc3RhdGljIHU4ICpkcm1fZmluZF9kaXNwbGF5
aWRfZXh0ZW5zaW9uKGNvbnN0IHN0cnVjdCBlZGlkICplZGlkLAogCQkJCQlpbnQgKmxlbmd0aCwg
aW50ICppZHgpCiB7CiAJdTggKmRpc3BsYXlpZCA9IGRybV9maW5kX2VkaWRfZXh0ZW5zaW9uKGVk
aWQsIERJU1BMQVlJRF9FWFQpOworCWludCByZXQ7CiAKIAlpZiAoIWRpc3BsYXlpZCkKIAkJcmV0
dXJuIE5VTEw7CkBAIC0zMjIzLDEyICszMjI0LDE1IEBAIHN0YXRpYyB1OCAqZHJtX2ZpbmRfZGlz
cGxheWlkX2V4dGVuc2lvbihjb25zdCBzdHJ1Y3QgZWRpZCAqZWRpZCwKIAkqbGVuZ3RoID0gRURJ
RF9MRU5HVEg7CiAJKmlkeCA9IDE7CiAKKwlyZXQgPSB2YWxpZGF0ZV9kaXNwbGF5aWQoZGlzcGxh
eWlkLCAqbGVuZ3RoLCAqaWR4KTsKKwlpZiAocmV0KQorCQlyZXR1cm4gTlVMTDsKKwogCXJldHVy
biBkaXNwbGF5aWQ7CiB9CiAKIHN0YXRpYyB1OCAqZHJtX2ZpbmRfY2VhX2V4dGVuc2lvbihjb25z
dCBzdHJ1Y3QgZWRpZCAqZWRpZCkKIHsKLQlpbnQgcmV0OwogCWludCBsZW5ndGgsIGlkeDsKIAlz
dHJ1Y3QgZGlzcGxheWlkX2Jsb2NrICpibG9jazsKIAl1OCAqY2VhOwpAQCAtMzI0NCwxMCArMzI0
OCw2IEBAIHN0YXRpYyB1OCAqZHJtX2ZpbmRfY2VhX2V4dGVuc2lvbihjb25zdCBzdHJ1Y3QgZWRp
ZCAqZWRpZCkKIAlpZiAoIWRpc3BsYXlpZCkKIAkJcmV0dXJuIE5VTEw7CiAKLQlyZXQgPSB2YWxp
ZGF0ZV9kaXNwbGF5aWQoZGlzcGxheWlkLCBsZW5ndGgsIGlkeCk7Ci0JaWYgKHJldCkKLQkJcmV0
dXJuIE5VTEw7Ci0KIAlpZHggKz0gc2l6ZW9mKHN0cnVjdCBkaXNwbGF5aWRfaGRyKTsKIAlmb3Jf
ZWFjaF9kaXNwbGF5aWRfZGIoZGlzcGxheWlkLCBibG9jaywgaWR4LCBsZW5ndGgpIHsKIAkJaWYg
KGJsb2NrLT50YWcgPT0gREFUQV9CTE9DS19DVEEpIHsKQEAgLTUxODksNyArNTE4OSw2IEBAIHN0
YXRpYyBpbnQgYWRkX2Rpc3BsYXlpZF9kZXRhaWxlZF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yLAogCQkJCQlzdHJ1Y3QgZWRpZCAqZWRpZCkKIHsKIAl1OCAqZGlzcGxheWlk
OwotCWludCByZXQ7CiAJaW50IGxlbmd0aCwgaWR4OwogCXN0cnVjdCBkaXNwbGF5aWRfYmxvY2sg
KmJsb2NrOwogCWludCBudW1fbW9kZXMgPSAwOwpAQCAtNTE5OCwxMCArNTE5Nyw2IEBAIHN0YXRp
YyBpbnQgYWRkX2Rpc3BsYXlpZF9kZXRhaWxlZF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubmVjdG9yLAogCWlmICghZGlzcGxheWlkKQogCQlyZXR1cm4gMDsKIAotCXJldCA9IHZhbGlk
YXRlX2Rpc3BsYXlpZChkaXNwbGF5aWQsIGxlbmd0aCwgaWR4KTsKLQlpZiAocmV0KQotCQlyZXR1
cm4gMDsKLQogCWlkeCArPSBzaXplb2Yoc3RydWN0IGRpc3BsYXlpZF9oZHIpOwogCWZvcl9lYWNo
X2Rpc3BsYXlpZF9kYihkaXNwbGF5aWQsIGJsb2NrLCBpZHgsIGxlbmd0aCkgewogCQlzd2l0Y2gg
KGJsb2NrLT50YWcpIHsKQEAgLTU4NDksMTAgKzU4NDQsNiBAQCBzdGF0aWMgaW50IGRybV9wYXJz
ZV9kaXNwbGF5X2lkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCiAJc3RydWN0IGRp
c3BsYXlpZF9ibG9jayAqYmxvY2s7CiAJaW50IHJldDsKIAotCXJldCA9IHZhbGlkYXRlX2Rpc3Bs
YXlpZChkaXNwbGF5aWQsIGxlbmd0aCwgaWR4KTsKLQlpZiAocmV0KQotCQlyZXR1cm4gcmV0Owot
CiAJaWR4ICs9IHNpemVvZihzdHJ1Y3QgZGlzcGxheWlkX2hkcik7CiAJZm9yX2VhY2hfZGlzcGxh
eWlkX2RiKGRpc3BsYXlpZCwgYmxvY2ssIGlkeCwgbGVuZ3RoKSB7CiAJCURSTV9ERUJVR19LTVMo
ImJsb2NrIGlkIDB4JXgsIHJldiAlZCwgbGVuICVkXG4iLAotLSAKMi4yNC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
