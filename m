Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4529DF3156
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 15:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CEB6F6B5;
	Thu,  7 Nov 2019 14:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEDC6F6B5;
 Thu,  7 Nov 2019 14:24:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 06:24:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; d="scan'208";a="192833579"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 07 Nov 2019 06:24:32 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Nov 2019 16:24:31 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/5] drm/i915: Introduce intel_plane_state_reset()
Date: Thu,  7 Nov 2019 16:24:17 +0200
Message-Id: <20191107142417.11107-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107142417.11107-1-ville.syrjala@linux.intel.com>
References: <20191107142417.11107-1-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkZv
ciB0aGUgc2FrZSBvZiBzeW1tZXRyeSB3aXRoIHRoZSBjcnRjIHN0dWZmIGxldCdzIGFkZAphIGhl
bHBlciB0byByZXNldCB0aGUgcGxhbmUgc3RhdGUgdG8gc2FuZSBkZWZhdWx0IHZhbHVlcy4KRm9y
IHRoZSBtb21lbnQgdGhpcyBvbmx5IGdldHMgY2FsbGVyIGZyb20gdGhlIHBsYW5lIGluaXQuCgpT
aWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljX3BsYW5l
LmMgfCAxNSArKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfYXRvbWljX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2F0b21pY19wbGFuZS5jCmluZGV4IDQyYjNiMzQ0OWQyZS4uOTQyOWI4ZTE3MjcwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2F0b21pY19wbGFuZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljX3BsYW5lLmMK
QEAgLTQxLDYgKzQxLDE2IEBACiAjaW5jbHVkZSAiaW50ZWxfcG0uaCIKICNpbmNsdWRlICJpbnRl
bF9zcHJpdGUuaCIKIAorc3RhdGljIHZvaWQgaW50ZWxfcGxhbmVfc3RhdGVfcmVzZXQoc3RydWN0
IGludGVsX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZSwKKwkJCQkgICAgc3RydWN0IGludGVsX3Bs
YW5lICpwbGFuZSkKK3sKKwltZW1zZXQocGxhbmVfc3RhdGUsIDAsIHNpemVvZigqcGxhbmVfc3Rh
dGUpKTsKKworCV9fZHJtX2F0b21pY19oZWxwZXJfcGxhbmVfc3RhdGVfcmVzZXQoJnBsYW5lX3N0
YXRlLT51YXBpLCAmcGxhbmUtPmJhc2UpOworCisJcGxhbmVfc3RhdGUtPnNjYWxlcl9pZCA9IC0x
OworfQorCiBzdHJ1Y3QgaW50ZWxfcGxhbmUgKmludGVsX3BsYW5lX2FsbG9jKHZvaWQpCiB7CiAJ
c3RydWN0IGludGVsX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZTsKQEAgLTU2LDggKzY2LDkgQEAg
c3RydWN0IGludGVsX3BsYW5lICppbnRlbF9wbGFuZV9hbGxvYyh2b2lkKQogCQlyZXR1cm4gRVJS
X1BUUigtRU5PTUVNKTsKIAl9CiAKLQlfX2RybV9hdG9taWNfaGVscGVyX3BsYW5lX3Jlc2V0KCZw
bGFuZS0+YmFzZSwgJnBsYW5lX3N0YXRlLT51YXBpKTsKLQlwbGFuZV9zdGF0ZS0+c2NhbGVyX2lk
ID0gLTE7CisJaW50ZWxfcGxhbmVfc3RhdGVfcmVzZXQocGxhbmVfc3RhdGUsIHBsYW5lKTsKKwor
CXBsYW5lLT5iYXNlLnN0YXRlID0gJnBsYW5lX3N0YXRlLT51YXBpOwogCiAJcmV0dXJuIHBsYW5l
OwogfQotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
