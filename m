Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D47E10D40A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 11:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78ECF6E8B7;
	Fri, 29 Nov 2019 10:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7435E6E8B7;
 Fri, 29 Nov 2019 10:30:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 02:30:31 -0800
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; d="scan'208";a="212249328"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 02:30:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v2 05/14] video: fbdev: vesafb: modify the static fb_ops
 directly
Date: Fri, 29 Nov 2019 12:29:35 +0200
Message-Id: <9e34c1d9a81690cbd75af7969fc4baf60a64b13f.1575022735.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575022735.git.jani.nikula@intel.com>
References: <cover.1575022735.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXZvaWQgbW9kaWZ5aW5nIHRoZSBmYl9vcHMgdmlhIGluZm8tPmZib3BzIHRvIGxldCB1cyBtYWtl
IHRoZSBwb2ludGVyCmNvbnN0IGluIHRoZSBmdXR1cmUuCgpDYzogbGludXgtZmJkZXZAdmdlci5r
ZXJuZWwub3JnClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xs
LmNoPgpTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgot
LS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvdmVzYWZiLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L3Zlc2FmYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi92ZXNhZmIuYwppbmRl
eCBkOWMwOGY2YzIxNTUuLmExZmUyNGVhODY5YiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9m
YmRldi92ZXNhZmIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3Zlc2FmYi5jCkBAIC00NDcs
MTUgKzQ0NywxNSBAQCBzdGF0aWMgaW50IHZlc2FmYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpkZXYpCiAJICAgICAgIHZlc2FmYl9maXguc21lbV9zdGFydCwgaW5mby0+c2NyZWVuX2Jh
c2UsCiAJICAgICAgIHNpemVfcmVtYXAvMTAyNCwgc2l6ZV90b3RhbC8xMDI0KTsKIAorCWlmICgh
eXBhbikKKwkJdmVzYWZiX29wcy5mYl9wYW5fZGlzcGxheSA9IE5VTEw7CisKIAlpbmZvLT5mYm9w
cyA9ICZ2ZXNhZmJfb3BzOwogCWluZm8tPnZhciA9IHZlc2FmYl9kZWZpbmVkOwogCWluZm8tPmZp
eCA9IHZlc2FmYl9maXg7CiAJaW5mby0+ZmxhZ3MgPSBGQklORk9fRkxBR19ERUZBVUxUIHwgRkJJ
TkZPX01JU0NfRklSTVdBUkUgfAogCQkoeXBhbiA/IEZCSU5GT19IV0FDQ0VMX1lQQU4gOiAwKTsK
IAotCWlmICgheXBhbikKLQkJaW5mby0+ZmJvcHMtPmZiX3Bhbl9kaXNwbGF5ID0gTlVMTDsKLQog
CWlmIChmYl9hbGxvY19jbWFwKCZpbmZvLT5jbWFwLCAyNTYsIDApIDwgMCkgewogCQllcnIgPSAt
RU5PTUVNOwogCQlnb3RvIGVycjsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
