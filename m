Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E67B8637B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 15:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A657890BE;
	Thu,  8 Aug 2019 13:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17926E84C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 13:44:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1FC1E30DD076;
 Thu,  8 Aug 2019 13:44:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B46AF1001284;
 Thu,  8 Aug 2019 13:44:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 05EEE9D34; Thu,  8 Aug 2019 15:44:20 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 10/17] drm/vram: switch vram helper to
 drm_gem_object_funcs->mmap codepath
Date: Thu,  8 Aug 2019 15:44:10 +0200
Message-Id: <20190808134417.10610-11-kraxel@redhat.com>
In-Reply-To: <20190808134417.10610-1-kraxel@redhat.com>
References: <20190808134417.10610-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 08 Aug 2019 13:44:24 +0000 (UTC)
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
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, tzimmermann@suse.de,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Li4uIHVzaW5nIHRoZSBuZXcgZHJtX2dlbV90dG1fbW1hcCgpIGhlbHBlciBmdW5jdGlvbi4KClNp
Z25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgotLS0KIGluY2x1
ZGUvZHJtL2RybV92cmFtX21tX2hlbHBlci5oICAgICAgfCAgOSArLS0tLS0tLS0KIGRyaXZlcnMv
Z3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgfCAgNCArKystCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX3ZyYW1fbW1faGVscGVyLmMgIHwgMjcgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAz
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1f
dnJhbV9tbV9oZWxwZXIuaAppbmRleCAyYWFjZmIxY2NmYWUuLmZmMzI4YmRhYTYzOCAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0v
ZHJtX3ZyYW1fbW1faGVscGVyLmgKQEAgLTc3LDEzICs3Nyw2IEBAIHN0cnVjdCBkcm1fdnJhbV9t
bSAqZHJtX3ZyYW1faGVscGVyX2FsbG9jX21tKAogCWNvbnN0IHN0cnVjdCBkcm1fdnJhbV9tbV9m
dW5jcyAqZnVuY3MpOwogdm9pZCBkcm1fdnJhbV9oZWxwZXJfcmVsZWFzZV9tbShzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2KTsKIAotLyoKLSAqIEhlbHBlcnMgZm9yICZzdHJ1Y3QgZmlsZV9vcGVyYXRp
b25zCi0gKi8KLQotaW50IGRybV92cmFtX21tX2ZpbGVfb3BlcmF0aW9uc19tbWFwKAotCXN0cnVj
dCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7Ci0KIC8qKgogICogZGVm
aW5lIERSTV9WUkFNX01NX0ZJTEVfT1BFUkFUSU9OUyAtIGRlZmF1bHQgY2FsbGJhY2sgZnVuY3Rp
b25zIGZvciBcCiAJJnN0cnVjdCBmaWxlX29wZXJhdGlvbnMKQEAgLTk3LDcgKzkwLDcgQEAgaW50
IGRybV92cmFtX21tX2ZpbGVfb3BlcmF0aW9uc19tbWFwKAogCS5wb2xsCQk9IGRybV9wb2xsLCBc
CiAJLnVubG9ja2VkX2lvY3RsID0gZHJtX2lvY3RsLCBcCiAJLmNvbXBhdF9pb2N0bAk9IGRybV9j
b21wYXRfaW9jdGwsIFwKLQkubW1hcAkJPSBkcm1fdnJhbV9tbV9maWxlX29wZXJhdGlvbnNfbW1h
cCwgXAorCS5tbWFwCQk9IGRybV9nZW1fbW1hcCwgXAogCS5vcGVuCQk9IGRybV9vcGVuLCBcCiAJ
LnJlbGVhc2UJPSBkcm1fcmVsZWFzZSBcCiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtX3ZyYW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBl
ci5jCmluZGV4IGI3ODg2NTA1NTk5MC4uZWQxNjI1ZjZhMjk2IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtX3ZyYW1faGVscGVyLmMKQEAgLTEsNSArMSw2IEBACiAvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vci1sYXRlcgogCisjaW5jbHVkZSA8ZHJtL2RybV9nZW1fdHRtX2hlbHBl
ci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJt
L2RybV9kZXZpY2UuaD4KICNpbmNsdWRlIDxkcm0vZHJtX21vZGUuaD4KQEAgLTU4NSw1ICs1ODYs
NiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzIGRybV9nZW1fdnJh
bV9vYmplY3RfZnVuY3MgPSB7CiAJLnBpbgk9IGRybV9nZW1fdnJhbV9vYmplY3RfcGluLAogCS51
bnBpbgk9IGRybV9nZW1fdnJhbV9vYmplY3RfdW5waW4sCiAJLnZtYXAJPSBkcm1fZ2VtX3ZyYW1f
b2JqZWN0X3ZtYXAsCi0JLnZ1bm1hcAk9IGRybV9nZW1fdnJhbV9vYmplY3RfdnVubWFwCisJLnZ1
bm1hcAk9IGRybV9nZW1fdnJhbV9vYmplY3RfdnVubWFwLAorCS5tbWFwICAgPSBkcm1fZ2VtX3R0
bV9tbWFwLAogfTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdnJhbV9tbV9oZWxw
ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdnJhbV9tbV9oZWxwZXIuYwppbmRleCBhNjkzZjlj
ZTM1NmMuLjhmNmUyNmIzZGE2OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV92cmFt
X21tX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdnJhbV9tbV9oZWxwZXIuYwpA
QCAtMjY4LDMwICsyNjgsMyBAQCB2b2lkIGRybV92cmFtX2hlbHBlcl9yZWxlYXNlX21tKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYpCiAJZGV2LT52cmFtX21tID0gTlVMTDsKIH0KIEVYUE9SVF9TWU1C
T0woZHJtX3ZyYW1faGVscGVyX3JlbGVhc2VfbW0pOwotCi0vKgotICogSGVscGVycyBmb3IgJnN0
cnVjdCBmaWxlX29wZXJhdGlvbnMKLSAqLwotCi0vKioKLSAqIGRybV92cmFtX21tX2ZpbGVfb3Bl
cmF0aW9uc19tbWFwKCkgLSBcCi0JSW1wbGVtZW50cyAmc3RydWN0IGZpbGVfb3BlcmF0aW9ucy5t
bWFwKCkKLSAqIEBmaWxwOgl0aGUgbWFwcGluZydzIGZpbGUgc3RydWN0dXJlCi0gKiBAdm1hOgl0
aGUgbWFwcGluZydzIG1lbW9yeSBhcmVhCi0gKgotICogUmV0dXJuczoKLSAqIDAgb24gc3VjY2Vz
cywgb3IKLSAqIGEgbmVnYXRpdmUgZXJyb3IgY29kZSBvdGhlcndpc2UuCi0gKi8KLWludCBkcm1f
dnJhbV9tbV9maWxlX29wZXJhdGlvbnNfbW1hcCgKLQlzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEpCi17Ci0Jc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYgPSBm
aWxwLT5wcml2YXRlX2RhdGE7Ci0Jc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGZpbGVfcHJpdi0+
bWlub3ItPmRldjsKLQotCWlmIChXQVJOX09OQ0UoIWRldi0+dnJhbV9tbSwgIlZSQU0gTU0gbm90
IGluaXRpYWxpemVkIikpCi0JCXJldHVybiAtRUlOVkFMOwotCi0JcmV0dXJuIGRybV92cmFtX21t
X21tYXAoZmlscCwgdm1hLCBkZXYtPnZyYW1fbW0pOwotfQotRVhQT1JUX1NZTUJPTChkcm1fdnJh
bV9tbV9maWxlX29wZXJhdGlvbnNfbW1hcCk7Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
