Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C6DB596A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 03:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81E46EDB2;
	Wed, 18 Sep 2019 01:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799666EDB2;
 Wed, 18 Sep 2019 01:45:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Sep 2019 18:45:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,518,1559545200"; d="scan'208";a="177566427"
Received: from unknown (HELO chromeserver.iind.intel.com) ([10.223.246.82])
 by orsmga007.jf.intel.com with ESMTP; 17 Sep 2019 18:45:41 -0700
From: srinivasan.s@intel.com
To: intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 manasi.d.navare@intel.com, ville.syrjala@linux.intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/dp: Fix DP MST error after unplugging TypeC cable
Date: Wed, 18 Sep 2019 07:09:43 +0530
Message-Id: <1568770783-169735-1-git-send-email-srinivasan.s@intel.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Srinivasan S <srinivasan.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU3Jpbml2YXNhbiBTIDxzcmluaXZhc2FuLnNAaW50ZWwuY29tPgoKVGhpcyBwYXRjaCBh
dm9pZHMgRFAgTVNUIHBheWxvYWQgZXJyb3IgbWVzc2FnZSBpbiBkbWVzZywgYXMgaXQgaXMgdHJ5
aW5nCnRvIHJlYWQgdGhlIHBheWxvYWQgZnJvbSB0aGUgZGlzY29ubmVjdGVkIERQIE1TVCBkZXZp
Y2UuIEFmdGVyIHRoZSB1bnBsdWcKdGhlIGNvbm5lY3RvciBzdGF0dXMgaXMgZGlzY29ubmVjdGVk
IGFuZCB3ZSBzaG91bGQgbm90IGJlIGxvb2tpbmcgZm9yIHRoZQpwYXlsb2FkIGFuZCBoZW5jZSBy
ZW1vdmUgdGhlIGVycm9yIGFuZCB0aHJvdyB0aGUgd2FybmluZy4KClRoaXMgZGV0YWlscyBjYW4g
YmUgZm91bmQgaW46Cmh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lk
PTExMTYzMgoKU2lnbmVkLW9mZi1ieTogU3Jpbml2YXNhbiBTIDxzcmluaXZhc2FuLnNAaW50ZWwu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMgfCA3
ICsrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5j
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYwppbmRleCBlZWVi
M2Y5MzNhYTQuLjViMjI3OGZkZjY3NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kcF9tc3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2RwX21zdC5jCkBAIC0yMTUsNyArMjE1LDEyIEBAIHN0YXRpYyB2b2lkIGludGVsX21z
dF9kaXNhYmxlX2RwKHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNvZGVyLAogCiAJcmV0ID0gZHJt
X2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQxKCZpbnRlbF9kcC0+bXN0X21ncik7CiAJaWYgKHJldCkg
ewotCQlEUk1fRVJST1IoImZhaWxlZCB0byB1cGRhdGUgcGF5bG9hZCAlZFxuIiwgcmV0KTsKKwkJ
aWYgKCFjb25uZWN0b3IgfHwKKwkJICAgIGNvbm5lY3Rvci0+YmFzZS5zdGF0dXMgIT0gY29ubmVj
dG9yX3N0YXR1c19jb25uZWN0ZWQpIHsKKwkJCURSTV9XQVJOKCJEUCBNU1QgZGlzY29ubmVjdFxu
Iik7CisJCX0gZWxzZSB7CisJCQlEUk1fRVJST1IoImZhaWxlZCB0byB1cGRhdGUgcGF5bG9hZCAl
ZFxuIiwgcmV0KTsKKwkJfQogCX0KIAlpZiAob2xkX2NydGNfc3RhdGUtPmhhc19hdWRpbykKIAkJ
aW50ZWxfYXVkaW9fY29kZWNfZGlzYWJsZShlbmNvZGVyLAotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
