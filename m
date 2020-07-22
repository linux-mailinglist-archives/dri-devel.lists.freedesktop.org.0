Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F35C229853
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 14:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5552588AA0;
	Wed, 22 Jul 2020 12:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 79CDD892F0;
 Wed, 22 Jul 2020 12:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 461DC2A6042;
 Wed, 22 Jul 2020 14:38:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id rv523GJNm0Vp; Wed, 22 Jul 2020 14:38:14 +0200 (CEST)
Received: from kaveri (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 115042A6016;
 Wed, 22 Jul 2020 14:38:13 +0200 (CEST)
Received: from daenzer by kaveri with local (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1jyE0j-0031aS-A2; Wed, 22 Jul 2020 14:38:13 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: Leo Li <sunpeng.li@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Subject: [PATCH] drm/amdgpu/dc: Simplify drm_crtc_state::active checks
Date: Wed, 22 Jul 2020 14:38:13 +0200
Message-Id: <20200722123813.721041-1-michel@daenzer.net>
X-Mailer: git-send-email 2.28.0.rc0
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWljaGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+Cgpkcm1fYXRvbWljX2Ny
dGNfY2hlY2sgZW5mb3JjZXMgdGhhdCA6OmFjdGl2ZSBjYW4gb25seSBiZSB0cnVlIGlmCjo6ZW5h
YmxlIGlzIGFzIHdlbGwuCgpTaWduZWQtb2ZmLWJ5OiBNaWNoZWwgRMOkbnplciA8bWRhZW56ZXJA
cmVkaGF0LmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMgICAgfCAxNiArKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCAzMTJjNTQzYjI1OGYuLmRhYmVmMzA3YTc0
ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jCkBAIC0zNDE1LDIxICszNDE1LDEyIEBAIHN0YXRpYyBib29sIG1vZGVzZXRfcmVxdWly
ZWQoc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlLAogCQkJICAgICBzdHJ1Y3QgZGNf
c3RyZWFtX3N0YXRlICpuZXdfc3RyZWFtLAogCQkJICAgICBzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRl
ICpvbGRfc3RyZWFtKQogewotCWlmICghZHJtX2F0b21pY19jcnRjX25lZWRzX21vZGVzZXQoY3J0
Y19zdGF0ZSkpCi0JCXJldHVybiBmYWxzZTsKLQotCWlmICghY3J0Y19zdGF0ZS0+ZW5hYmxlKQot
CQlyZXR1cm4gZmFsc2U7Ci0KLQlyZXR1cm4gY3J0Y19zdGF0ZS0+YWN0aXZlOworCXJldHVybiBj
cnRjX3N0YXRlLT5hY3RpdmUgJiYgZHJtX2F0b21pY19jcnRjX25lZWRzX21vZGVzZXQoY3J0Y19z
dGF0ZSk7CiB9CiAKIHN0YXRpYyBib29sIG1vZGVyZXNldF9yZXF1aXJlZChzdHJ1Y3QgZHJtX2Ny
dGNfc3RhdGUgKmNydGNfc3RhdGUpCiB7Ci0JaWYgKCFkcm1fYXRvbWljX2NydGNfbmVlZHNfbW9k
ZXNldChjcnRjX3N0YXRlKSkKLQkJcmV0dXJuIGZhbHNlOwotCi0JcmV0dXJuICFjcnRjX3N0YXRl
LT5lbmFibGUgfHwgIWNydGNfc3RhdGUtPmFjdGl2ZTsKKwlyZXR1cm4gIWNydGNfc3RhdGUtPmFj
dGl2ZSAmJiBkcm1fYXRvbWljX2NydGNfbmVlZHNfbW9kZXNldChjcnRjX3N0YXRlKTsKIH0KIAog
c3RhdGljIHZvaWQgYW1kZ3B1X2RtX2VuY29kZXJfZGVzdHJveShzdHJ1Y3QgZHJtX2VuY29kZXIg
KmVuY29kZXIpCkBAIC04MTA4LDggKzgwOTksNyBAQCBzdGF0aWMgaW50IGRtX3VwZGF0ZV9jcnRj
X3N0YXRlKHN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5hZ2VyICpkbSwKIAkgKiBXZSB3YW50IHRv
IGRvIGRjIHN0cmVhbSB1cGRhdGVzIHRoYXQgZG8gbm90IHJlcXVpcmUgYQogCSAqIGZ1bGwgbW9k
ZXNldCBiZWxvdy4KIAkgKi8KLQlpZiAoIShlbmFibGUgJiYgYWNvbm5lY3RvciAmJiBuZXdfY3J0
Y19zdGF0ZS0+ZW5hYmxlICYmCi0JICAgICAgbmV3X2NydGNfc3RhdGUtPmFjdGl2ZSkpCisJaWYg
KCEoZW5hYmxlICYmIGFjb25uZWN0b3IgJiYgbmV3X2NydGNfc3RhdGUtPmFjdGl2ZSkpCiAJCXJl
dHVybiAwOwogCS8qCiAJICogR2l2ZW4gYWJvdmUgY29uZGl0aW9ucywgdGhlIGRjIHN0YXRlIGNh
bm5vdCBiZSBOVUxMIGJlY2F1c2U6Ci0tIAoyLjI4LjAucmMwCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
