Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8477C1509C5
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 16:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD966EC5D;
	Mon,  3 Feb 2020 15:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADC46EC5D;
 Mon,  3 Feb 2020 15:27:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 07:14:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="310747580"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 03 Feb 2020 07:14:11 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 Feb 2020 17:14:10 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/26] drm/i915: Reworkd DFP max bpc handling
Date: Mon,  3 Feb 2020 17:13:26 +0200
Message-Id: <20200203151343.14378-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200203151343.14378-1-ville.syrjala@linux.intel.com>
References: <20200203151343.14378-1-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClN0
YXNoIHRoZSBkb3duc3RyZWFtIGZhY2luZyBwb3J0IG1heCBicGMgYXdheSBkdXJpbmcKaW50ZWxf
ZHBfc2V0X2VkaWQoKS4gV2UnbGwgc29vbiBuZWVkIHRoZSBFRElEIGluIHRoZXJlIHNvCndlIGNh
bid0IGZpZ3VyZSB0aGlzIG91dCBzbyBlYXNpbHkgZHVyaW5nIC5jb21wdXRlX2NvbmZpZygpIGFu
eW1vcmUuCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPgotLS0KIC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlw
ZXMuaCAgICB8ICA1ICsrKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rw
LmMgICAgICAgfCAyMSArKysrKysrKysrKysrLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIwIGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaAppbmRleCA1Nzc0MjQwYzA5OTYuLmRiYTBi
YjI0NWE0MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
aXNwbGF5X3R5cGVzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
aXNwbGF5X3R5cGVzLmgKQEAgLTEzMDQsNiArMTMwNCwxMSBAQCBzdHJ1Y3QgaW50ZWxfZHAgewog
CiAJLyogRGlzcGxheSBzdHJlYW0gY29tcHJlc3Npb24gdGVzdGluZyAqLwogCWJvb2wgZm9yY2Vf
ZHNjX2VuOworCisJLyogRG93bnN0cmVhbSBmYWNpbmcgcG9ydCBjYXBzICovCisJc3RydWN0IHsK
KwkJdTggbWF4X2JwYzsKKwl9IGRmcDsKIH07CiAKIGVudW0gbHNwY29uX3ZlbmRvciB7CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKaW5kZXggMTc4NmU2ZThmZmUzLi41ZmFi
N2FiOTc4MTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKQEAgLTE5
MTQsMTMgKzE5MTQsMTIgQEAgc3RhdGljIGludCBpbnRlbF9kcF9jb21wdXRlX2JwcChzdHJ1Y3Qg
aW50ZWxfZHAgKmludGVsX2RwLAogewogCXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJp
diA9IGRwX3RvX2k5MTUoaW50ZWxfZHApOwogCXN0cnVjdCBpbnRlbF9jb25uZWN0b3IgKmludGVs
X2Nvbm5lY3RvciA9IGludGVsX2RwLT5hdHRhY2hlZF9jb25uZWN0b3I7Ci0JaW50IGJwcCwgYnBj
OworCWludCBicHA7CiAKIAlicHAgPSBwaXBlX2NvbmZpZy0+cGlwZV9icHA7Ci0JYnBjID0gZHJt
X2RwX2Rvd25zdHJlYW1fbWF4X2JwYyhpbnRlbF9kcC0+ZHBjZCwgaW50ZWxfZHAtPmRvd25zdHJl
YW1fcG9ydHMpOwogCi0JaWYgKGJwYyA+IDApCi0JCWJwcCA9IG1pbihicHAsIDMqYnBjKTsKKwlp
ZiAoaW50ZWxfZHAtPmRmcC5tYXhfYnBjKQorCQlicHAgPSBtaW4oYnBwLCAzICogaW50ZWxfZHAt
PmRmcC5tYXhfYnBjKTsKIAogCWlmIChpbnRlbF9kcF9pc19lZHAoaW50ZWxfZHApKSB7CiAJCS8q
IEdldCBicHAgZnJvbSB2YnQgb25seSBmb3IgcGFuZWxzIHRoYXQgZG9udCBoYXZlIGJwcCBpbiBl
ZGlkICovCkBAIC01NjU3LDEyICs1NjU2LDIwIEBAIGludGVsX2RwX2dldF9lZGlkKHN0cnVjdCBp
bnRlbF9kcCAqaW50ZWxfZHApCiBzdGF0aWMgdm9pZAogaW50ZWxfZHBfc2V0X2VkaWQoc3RydWN0
IGludGVsX2RwICppbnRlbF9kcCkKIHsKLQlzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yICppbnRlbF9j
b25uZWN0b3IgPSBpbnRlbF9kcC0+YXR0YWNoZWRfY29ubmVjdG9yOworCXN0cnVjdCBpbnRlbF9j
b25uZWN0b3IgKmNvbm5lY3RvciA9IGludGVsX2RwLT5hdHRhY2hlZF9jb25uZWN0b3I7CiAJc3Ry
dWN0IGVkaWQgKmVkaWQ7CiAKIAlpbnRlbF9kcF91bnNldF9lZGlkKGludGVsX2RwKTsKIAllZGlk
ID0gaW50ZWxfZHBfZ2V0X2VkaWQoaW50ZWxfZHApOwotCWludGVsX2Nvbm5lY3Rvci0+ZGV0ZWN0
X2VkaWQgPSBlZGlkOworCWNvbm5lY3Rvci0+ZGV0ZWN0X2VkaWQgPSBlZGlkOworCisJaW50ZWxf
ZHAtPmRmcC5tYXhfYnBjID0KKwkJZHJtX2RwX2Rvd25zdHJlYW1fbWF4X2JwYyhpbnRlbF9kcC0+
ZHBjZCwKKwkJCQkJICBpbnRlbF9kcC0+ZG93bnN0cmVhbV9wb3J0cyk7CisKKwlEUk1fREVCVUdf
S01TKCJbQ09OTkVDVE9SOiVkOiVzXSBERlAgbWF4IGJwYyAlZFxuIiwKKwkJICAgICAgY29ubmVj
dG9yLT5iYXNlLmJhc2UuaWQsIGNvbm5lY3Rvci0+YmFzZS5uYW1lLAorCQkgICAgICBpbnRlbF9k
cC0+ZGZwLm1heF9icGMpOwogCiAJaWYgKGVkaWQgJiYgZWRpZC0+aW5wdXQgJiBEUk1fRURJRF9J
TlBVVF9ESUdJVEFMKSB7CiAJCWludGVsX2RwLT5oYXNfaGRtaV9zaW5rID0gZHJtX2RldGVjdF9o
ZG1pX21vbml0b3IoZWRpZCk7CkBAIC01NjgzLDYgKzU2OTAsOCBAQCBpbnRlbF9kcF91bnNldF9l
ZGlkKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApCiAKIAlpbnRlbF9kcC0+aGFzX2hkbWlfc2lu
ayA9IGZhbHNlOwogCWludGVsX2RwLT5oYXNfYXVkaW8gPSBmYWxzZTsKKworCWludGVsX2RwLT5k
ZnAubWF4X2JwYyA9IDA7CiB9CiAKIHN0YXRpYyBpbnQKLS0gCjIuMjQuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
