Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 663B4BDFC5
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 16:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FF289208;
	Wed, 25 Sep 2019 14:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A85891F9;
 Wed, 25 Sep 2019 14:14:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 07:14:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; d="scan'208";a="183269748"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 25 Sep 2019 07:14:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 25 Sep 2019 17:14:48 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/dp/mst: Replace the fixed point thing with straight
 calculation
Date: Wed, 25 Sep 2019 17:14:42 +0300
Message-Id: <20190925141442.23236-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925141442.23236-1-ville.syrjala@linux.intel.com>
References: <20190925141442.23236-1-ville.syrjala@linux.intel.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkdl
dCByaWQgb2YgdGhlIGRybV9maXhwX2Zyb21fZnJhY3Rpb24oKSB1c2FnZSBhbmQganVzdCBkbyB0
aGUKc3RyYWlnaHRmb3J3YXJkIGNhbGN1bGF0aW9uIGRpcmVjdGx5LgoKQ2M6IEx5dWRlIFBhdWwg
PGx5dWRlQHJlZGhhdC5jb20+CkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1k
LmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMTggKystLS0tLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwppbmRleCBkNDY0NGEzYzEzMjQu
LmY4OTlhNDQzMjMxMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCkBAIC0z
Miw3ICszMiw2IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+CiAjaW5jbHVk
ZSA8ZHJtL2RybV9kcF9tc3RfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KLSNp
bmNsdWRlIDxkcm0vZHJtX2ZpeGVkLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPgogI2lu
Y2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+CiAKQEAgLTM4NDAsMTMgKzM4MzksNiBAQCBF
WFBPUlRfU1lNQk9MKGRybV9kcF9jaGVja19hY3Rfc3RhdHVzKTsKICAqLwogaW50IGRybV9kcF9j
YWxjX3Bibl9tb2RlKGludCBjbG9jaywgaW50IGJwcCkKIHsKLQl1NjQga2JwczsKLQlzNjQgcGVh
a19rYnBzOwotCXUzMiBudW1lcmF0b3I7Ci0JdTMyIGRlbm9taW5hdG9yOwotCi0Ja2JwcyA9IGNs
b2NrICogYnBwOwotCiAJLyoKIAkgKiBtYXJnaW4gNTMwMHBwbSArIDMwMHBwbSB+IDAuNiUgYXMg
cGVyIHNwZWMsIGZhY3RvciBpcyAxLjAwNgogCSAqIFRoZSB1bml0IG9mIDU0LzY0TWJ5dGVzL3Nl
YyBpcyBhbiBhcmJpdHJhcnkgdW5pdCBjaG9zZW4gYmFzZWQgb24KQEAgLTM4NTcsMTQgKzM4NDks
OCBAQCBpbnQgZHJtX2RwX2NhbGNfcGJuX21vZGUoaW50IGNsb2NrLCBpbnQgYnBwKQogCSAqIHBl
YWtfa2JwcyAqPSAoNjQvNTQpCiAJICogcGVha19rYnBzICo9IDggICAgY29udmVydCB0byBieXRl
cwogCSAqLwotCi0JbnVtZXJhdG9yID0gNjQgKiAxMDA2OwotCWRlbm9taW5hdG9yID0gNTQgKiA4
ICogMTAwMCAqIDEwMDA7Ci0KLQlrYnBzICo9IG51bWVyYXRvcjsKLQlwZWFrX2ticHMgPSBkcm1f
Zml4cF9mcm9tX2ZyYWN0aW9uKGticHMsIGRlbm9taW5hdG9yKTsKLQotCXJldHVybiBkcm1fZml4
cDJpbnRfY2VpbChwZWFrX2ticHMpOworCXJldHVybiBESVZfUk9VTkRfVVBfVUxMKG11bF91MzJf
dTMyKGNsb2NrICogYnBwLCA2NCAqIDEwMDYpLAorCQkJCTggKiA1NCAqIDEwMDAgKiAxMDAwKTsK
IH0KIEVYUE9SVF9TWU1CT0woZHJtX2RwX2NhbGNfcGJuX21vZGUpOwogCi0tIAoyLjIxLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
