Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7967F391EE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 18:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DB689DC7;
	Fri,  7 Jun 2019 16:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DAF89DC7;
 Fri,  7 Jun 2019 16:26:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jun 2019 09:26:14 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 07 Jun 2019 09:26:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2019 19:26:11 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/fb-helper: Do not assume
 drm_mode_create_from_cmdline_mode() can't fail
Date: Fri,  7 Jun 2019 19:26:08 +0300
Message-Id: <20190607162611.23514-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCmRy
bV9tb2RlX2NyZWF0ZV9mcm9tX2NtZGxpbmVfbW9kZSgpIGNhbiByZXR1cm4gTlVMTCwgc28gdGhl
IGNhbGxlcgpzaG91bGQgY2hlY2sgZm9yIHRoYXQuCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJq
w6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZmJfaGVscGVyLmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hl
bHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwppbmRleCBiOWI3YzA2Y2Jj
NGYuLmJkZmExNGNkN2Y2ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxw
ZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCkBAIC0yMjA1LDcgKzIy
MDUsOSBAQCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqZHJtX3BpY2tfY21kbGluZV9tb2RlKHN0
cnVjdCBkcm1fZmJfaGVscGVyX2Nvbm5lY3RvciAqZgogY3JlYXRlX21vZGU6CiAJbW9kZSA9IGRy
bV9tb2RlX2NyZWF0ZV9mcm9tX2NtZGxpbmVfbW9kZShmYl9oZWxwZXJfY29ubi0+Y29ubmVjdG9y
LT5kZXYsCiAJCQkJCQkgY21kbGluZV9tb2RlKTsKLQlsaXN0X2FkZCgmbW9kZS0+aGVhZCwgJmZi
X2hlbHBlcl9jb25uLT5jb25uZWN0b3ItPm1vZGVzKTsKKwlpZiAobW9kZSkKKwkJbGlzdF9hZGQo
Jm1vZGUtPmhlYWQsICZmYl9oZWxwZXJfY29ubi0+Y29ubmVjdG9yLT5tb2Rlcyk7CisKIAlyZXR1
cm4gbW9kZTsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX3BpY2tfY21kbGluZV9tb2RlKTsKLS0gCjIu
MjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
