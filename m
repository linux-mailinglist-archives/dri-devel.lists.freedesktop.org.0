Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EE64A5DA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 17:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5987A6E184;
	Tue, 18 Jun 2019 15:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE506E184
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 15:50:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 9D6FE263B50
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/imx: correct order of crtc disable
Date: Tue, 18 Jun 2019 16:50:03 +0100
Message-Id: <20190618155003.18499-1-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.18.0
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
Cc: Robert Beckett <bob.beckett@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90aWZ5IGRybSBjb3JlIGJlZm9yZSBzZW5kaW5nIHBlbmRpbmcgZXZlbnRzIGR1cmluZyBjcnRj
IGRpc2FibGUuClRoaXMgZml4ZXMgdGhlIGZpcnN0IGV2ZW50IGFmdGVyIGRpc2FibGUgaGF2aW5n
IGFuIG9sZCBzdGFsZSB0aW1lc3RhbXAKYnkgaGF2aW5nIGRybV9jcnRjX3ZibGFua19vZmYgdXBk
YXRlIHRoZSB0aW1lc3RhbXAgdG8gbm93LgoKVGhpcyB3YXMgc2VlbiB3aGlsZSBkZWJ1Z2dpbmcg
d2VzdG9uIGxvZyBtZXNzYWdlOgpXYXJuaW5nOiBjb21wdXRlZCByZXBhaW50IGRlbGF5IGlzIGlu
c2FuZTogLTgyMTIgbXNlYwoKU2lnbmVkLW9mZi1ieTogUm9iZXJ0IEJlY2tldHQgPGJvYi5iZWNr
ZXR0QGNvbGxhYm9yYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1jcnRjLmMg
fCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLWNydGMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9pbXgvaXB1djMtY3J0Yy5jCmluZGV4IDljYzFkNjc4Njc0Zi4uYzQzNmEyOGQ1
MGU0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLWNydGMuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLWNydGMuYwpAQCAtOTEsMTQgKzkxLDE0IEBAIHN0YXRp
YyB2b2lkIGlwdV9jcnRjX2F0b21pY19kaXNhYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAlp
cHVfZGNfZGlzYWJsZShpcHUpOwogCWlwdV9wcmdfZGlzYWJsZShpcHUpOwogCisJZHJtX2NydGNf
dmJsYW5rX29mZihjcnRjKTsKKwogCXNwaW5fbG9ja19pcnEoJmNydGMtPmRldi0+ZXZlbnRfbG9j
ayk7Ci0JaWYgKGNydGMtPnN0YXRlLT5ldmVudCkgeworCWlmIChjcnRjLT5zdGF0ZS0+ZXZlbnQg
JiYgIWNydGMtPnN0YXRlLT5hY3RpdmUpIHsKIAkJZHJtX2NydGNfc2VuZF92YmxhbmtfZXZlbnQo
Y3J0YywgY3J0Yy0+c3RhdGUtPmV2ZW50KTsKIAkJY3J0Yy0+c3RhdGUtPmV2ZW50ID0gTlVMTDsK
IAl9CiAJc3Bpbl91bmxvY2tfaXJxKCZjcnRjLT5kZXYtPmV2ZW50X2xvY2spOwotCi0JZHJtX2Ny
dGNfdmJsYW5rX29mZihjcnRjKTsKIH0KIAogc3RhdGljIHZvaWQgaW14X2RybV9jcnRjX3Jlc2V0
KHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKLS0gCjIuMTguMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
