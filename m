Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 209AB615EF
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 20:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316E289A9F;
	Sun,  7 Jul 2019 18:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5E889A9F
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 18:29:41 +0000 (UTC)
Received: from pendragon.nordic-sky.finnair.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 746ADCC;
 Sun,  7 Jul 2019 20:29:23 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 26/60] drm/omap: Detach from panels at remove time
Date: Sun,  7 Jul 2019 21:19:03 +0300
Message-Id: <20190707181937.6250-23-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562524180;
 bh=CabosUdAcnAQrBRxO29B9sRZRJx/0iW6IOkjgf8MdGE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PrHbtA2zWHlupqVTdl5yJ9/+8hJrOJwyQZmMbMfl7Cq2OMPzwIa0Mo+QiDtn03bJL
 +mg8BgvTC0iShUycQ/kqTW1pUV1keEKZARhapAd5NQQPCBC4aEKrpGfQ6olLjZzlaW
 kApHWrjNMMYrrrnDJda4zOSLbPwDFVKBCcO2Yjys=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG9tYXBkcm0gZHJpdmVyIGF0dGFjaGVzIHRvIHBhbmVscyB3aXRoIGRybV9wYW5lbF9hdHRh
Y2goKSBhdCBwcm9iZQp0aW1lIGJ1dCBuZXZlciBjYWxscyBkcm1fcGFuZWxfZGV0YWNoKCkuIEZp
eCBpdC4KClNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRA
aWRlYXNvbmJvYXJkLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Rydi5j
IHwgMjQgKysrKysrKysrKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9vbWFwX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kcnYuYwppbmRl
eCA4MzdkMGNkMjBkZDEuLjk3NTEyZDRjZjY2NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L29tYXBkcm0vb21hcF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Ry
di5jCkBAIC0zODcsNiArMzg3LDIzIEBAIHN0YXRpYyBpbnQgb21hcF9tb2Rlc2V0X2luaXQoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldikKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIHZvaWQgb21hcF9t
b2Rlc2V0X2Zpbmkoc3RydWN0IGRybV9kZXZpY2UgKmRkZXYpCit7CisJc3RydWN0IG9tYXBfZHJt
X3ByaXZhdGUgKnByaXYgPSBkZGV2LT5kZXZfcHJpdmF0ZTsKKwl1bnNpZ25lZCBpbnQgaTsKKwor
CW9tYXBfZHJtX2lycV91bmluc3RhbGwoZGRldik7CisKKwlmb3IgKGkgPSAwOyBpIDwgcHJpdi0+
bnVtX3BpcGVzOyBpKyspIHsKKwkJc3RydWN0IG9tYXBfZHJtX3BpcGVsaW5lICpwaXBlID0gJnBy
aXYtPnBpcGVzW2ldOworCisJCWlmIChwaXBlLT5vdXRwdXQtPnBhbmVsKQorCQkJZHJtX3BhbmVs
X2RldGFjaChwaXBlLT5vdXRwdXQtPnBhbmVsKTsKKwl9CisKKwlkcm1fbW9kZV9jb25maWdfY2xl
YW51cChkZGV2KTsKK30KKwogLyoKICAqIEVuYWJsZSB0aGUgSFBEIGluIGV4dGVybmFsIGNvbXBv
bmVudHMgaWYgc3VwcG9ydGVkCiAgKi8KQEAgLTYzNCw4ICs2NTEsNyBAQCBzdGF0aWMgaW50IG9t
YXBkcm1faW5pdChzdHJ1Y3Qgb21hcF9kcm1fcHJpdmF0ZSAqcHJpdiwgc3RydWN0IGRldmljZSAq
ZGV2KQogCiAJb21hcF9mYmRldl9maW5pKGRkZXYpOwogZXJyX2NsZWFudXBfbW9kZXNldDoKLQlk
cm1fbW9kZV9jb25maWdfY2xlYW51cChkZGV2KTsKLQlvbWFwX2RybV9pcnFfdW5pbnN0YWxsKGRk
ZXYpOworCW9tYXBfbW9kZXNldF9maW5pKGRkZXYpOwogZXJyX2dlbV9kZWluaXQ6CiAJb21hcF9n
ZW1fZGVpbml0KGRkZXYpOwogCWRlc3Ryb3lfd29ya3F1ZXVlKHByaXYtPndxKTsKQEAgLTY2MCw5
ICs2NzYsNyBAQCBzdGF0aWMgdm9pZCBvbWFwZHJtX2NsZWFudXAoc3RydWN0IG9tYXBfZHJtX3By
aXZhdGUgKnByaXYpCiAKIAlkcm1fYXRvbWljX2hlbHBlcl9zaHV0ZG93bihkZGV2KTsKIAotCWRy
bV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRkZXYpOwotCi0Jb21hcF9kcm1faXJxX3VuaW5zdGFsbChk
ZGV2KTsKKwlvbWFwX21vZGVzZXRfZmluaShkZGV2KTsKIAlvbWFwX2dlbV9kZWluaXQoZGRldik7
CiAKIAlkZXN0cm95X3dvcmtxdWV1ZShwcml2LT53cSk7Ci0tIApSZWdhcmRzLAoKTGF1cmVudCBQ
aW5jaGFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
