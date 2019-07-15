Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BA268821
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 13:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6990F8999A;
	Mon, 15 Jul 2019 11:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB228997A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 11:24:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jul 2019 04:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,493,1557212400"; d="scan'208";a="161054919"
Received: from ovasilev-desk1.fi.intel.com ([10.237.72.57])
 by orsmga008.jf.intel.com with ESMTP; 15 Jul 2019 04:24:15 -0700
From: Oleg Vasilev <oleg.vasilev@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/6] drm: move DP_MAX_DOWNSTREAM_PORTS from i915 to drm core
Date: Mon, 15 Jul 2019 14:23:29 +0300
Message-Id: <20190715112408.20114-2-oleg.vasilev@intel.com>
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

RFBfTUFYX0RPV05TVFJFQU1fUE9SVFM9MHgxMCBpcyBhIHZlbmRvci1pbmRlcGVuZGVudCBjb25z
dGFudC4KClNpZ25lZC1vZmYtYnk6IE9sZWcgVmFzaWxldiA8b2xlZy52YXNpbGV2QGludGVsLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kcnYuaCB8IDIgLS0KIGluY2x1ZGUv
ZHJtL2RybV9kcF9oZWxwZXIuaCAgICAgIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaW50ZWxfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kcnYuaAppbmRleCA3
NzBmOWY2YWFkODQuLmYxMTBjNWU3OTYxMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaW50ZWxfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZHJ2LmgKQEAg
LTEwODMsOCArMTA4Myw2IEBAIHN0cnVjdCBpbnRlbF9oZG1pIHsKIH07CiAKIHN0cnVjdCBpbnRl
bF9kcF9tc3RfZW5jb2RlcjsKLSNkZWZpbmUgRFBfTUFYX0RPV05TVFJFQU1fUE9SVFMJCTB4MTAK
LQogLyoKICAqIGVudW0gbGlua19tX25fc2V0OgogICoJV2hlbiBwbGF0Zm9ybSBwcm92aWRlcyB0
d28gc2V0IG9mIE1fTiByZWdpc3RlcnMgZm9yIGRwLCB3ZSBjYW4KZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAppbmRl
eCAzOTc4OTZiNWIyMWEuLmUwYzE1N2NkZTk4NiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJt
X2RwX2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaApAQCAtMzQ5LDYg
KzM0OSw4IEBACiAjIGRlZmluZSBEUF9EU18xMkJQQwkJICAgICAgICAgICAgMgogIyBkZWZpbmUg
RFBfRFNfMTZCUEMJCSAgICAgICAgICAgIDMKIAorI2RlZmluZSBEUF9NQVhfRE9XTlNUUkVBTV9Q
T1JUUwkJICAgIDB4MTAKKwogLyogRFAgRm9yd2FyZCBlcnJvciBDb3JyZWN0aW9uIFJlZ2lzdGVy
cyAqLwogI2RlZmluZSBEUF9GRUNfQ0FQQUJJTElUWQkJICAgIDB4MDkwICAgIC8qIDEuNCAqLwog
IyBkZWZpbmUgRFBfRkVDX0NBUEFCTEUJCQkgICAgKDEgPDwgMCkKLS0gCjIuMjIuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
