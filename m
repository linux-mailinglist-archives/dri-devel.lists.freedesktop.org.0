Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7B4B4A62
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 11:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B989F6EB8F;
	Tue, 17 Sep 2019 09:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B4E6EB8D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 09:24:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 48CCC8553A;
 Tue, 17 Sep 2019 09:24:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECE661001B08;
 Tue, 17 Sep 2019 09:24:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3B2CF9CAA; Tue, 17 Sep 2019 11:24:06 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 09/11] drm/vram: switch vram helper to
 &drm_gem_object_funcs.mmap()
Date: Tue, 17 Sep 2019 11:24:02 +0200
Message-Id: <20190917092404.9982-10-kraxel@redhat.com>
In-Reply-To: <20190917092404.9982-1-kraxel@redhat.com>
References: <20190917092404.9982-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Tue, 17 Sep 2019 09:24:12 +0000 (UTC)
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2lyZSB1cCB0aGUgbmV3IGRybV9nZW1fdHRtX21tYXAoKSBoZWxwZXIgZnVuY3Rpb24sCnVzZSBn
ZW5lcmljIGRybV9nZW1fbW1hcCBmb3IgJmZvcHMubW1hcCBhbmQKZGVsZXRlIGRlYWQgZHJtX3Zy
YW1fbW1fZmlsZV9vcGVyYXRpb25zX21tYXAoKS4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1h
bm4gPGtyYXhlbEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5o
ICAgICB8ICA5ICstLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMg
fCAzNCArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCA0MSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
Z2VtX3ZyYW1faGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmgKaW5k
ZXggOWFhZWY0ZjhjMzI3Li45ZDU1MjY2NTAyOTEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2Ry
bV9nZW1fdnJhbV9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVy
LmgKQEAgLTE4MCwxMyArMTgwLDYgQEAgc3RydWN0IGRybV92cmFtX21tICpkcm1fdnJhbV9oZWxw
ZXJfYWxsb2NfbW0oCiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdWludDY0X3QgdnJhbV9iYXNl
LCBzaXplX3QgdnJhbV9zaXplKTsKIHZvaWQgZHJtX3ZyYW1faGVscGVyX3JlbGVhc2VfbW0oc3Ry
dWN0IGRybV9kZXZpY2UgKmRldik7CiAKLS8qCi0gKiBIZWxwZXJzIGZvciAmc3RydWN0IGZpbGVf
b3BlcmF0aW9ucwotICovCi0KLWludCBkcm1fdnJhbV9tbV9maWxlX29wZXJhdGlvbnNfbW1hcCgK
LQlzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOwotCiAvKioK
ICAqIGRlZmluZSBEUk1fVlJBTV9NTV9GSUxFX09QRVJBVElPTlMgLSBkZWZhdWx0IGNhbGxiYWNr
IGZ1bmN0aW9ucyBmb3IgXAogCSZzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zCkBAIC0yMDAsNyArMTkz
LDcgQEAgaW50IGRybV92cmFtX21tX2ZpbGVfb3BlcmF0aW9uc19tbWFwKAogCS5wb2xsCQk9IGRy
bV9wb2xsLCBcCiAJLnVubG9ja2VkX2lvY3RsID0gZHJtX2lvY3RsLCBcCiAJLmNvbXBhdF9pb2N0
bAk9IGRybV9jb21wYXRfaW9jdGwsIFwKLQkubW1hcAkJPSBkcm1fdnJhbV9tbV9maWxlX29wZXJh
dGlvbnNfbW1hcCwgXAorCS5tbWFwCQk9IGRybV9nZW1fbW1hcCwgXAogCS5vcGVuCQk9IGRybV9v
cGVuLCBcCiAJLnJlbGVhc2UJPSBkcm1fcmVsZWFzZSBcCiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92
cmFtX2hlbHBlci5jCmluZGV4IDdiZWU4MGM2YjZlOC4uZTEwMGI5N2VhNmUzIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKQEAgLTY4MSw2ICs2ODEsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzIGRybV9nZW1fdnJhbV9vYmplY3RfZnVuY3Mg
PSB7CiAJLnVucGluCT0gZHJtX2dlbV92cmFtX29iamVjdF91bnBpbiwKIAkudm1hcAk9IGRybV9n
ZW1fdnJhbV9vYmplY3Rfdm1hcCwKIAkudnVubWFwCT0gZHJtX2dlbV92cmFtX29iamVjdF92dW5t
YXAsCisJLm1tYXAgICA9IGRybV9nZW1fdHRtX21tYXAsCiAJLnByaW50X2luZm8gPSBkcm1fZ2Vt
X3R0bV9wcmludF9pbmZvLAogfTsKIApAQCAtOTE1LDEyICs5MTYsNiBAQCBzdGF0aWMgdm9pZCBk
cm1fdnJhbV9tbV9jbGVhbnVwKHN0cnVjdCBkcm1fdnJhbV9tbSAqdm1tKQogCXR0bV9ib19kZXZp
Y2VfcmVsZWFzZSgmdm1tLT5iZGV2KTsKIH0KIAotc3RhdGljIGludCBkcm1fdnJhbV9tbV9tbWFw
KHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKLQkJCSAgICBz
dHJ1Y3QgZHJtX3ZyYW1fbW0gKnZtbSkKLXsKLQlyZXR1cm4gdHRtX2JvX21tYXAoZmlscCwgdm1h
LCAmdm1tLT5iZGV2KTsKLX0KLQogLyoKICAqIEhlbHBlcnMgZm9yIGludGVncmF0aW9uIHdpdGgg
c3RydWN0IGRybV9kZXZpY2UKICAqLwpAQCAtOTc2LDMwICs5NzEsMyBAQCB2b2lkIGRybV92cmFt
X2hlbHBlcl9yZWxlYXNlX21tKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJZGV2LT52cmFtX21t
ID0gTlVMTDsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX3ZyYW1faGVscGVyX3JlbGVhc2VfbW0pOwot
Ci0vKgotICogSGVscGVycyBmb3IgJnN0cnVjdCBmaWxlX29wZXJhdGlvbnMKLSAqLwotCi0vKioK
LSAqIGRybV92cmFtX21tX2ZpbGVfb3BlcmF0aW9uc19tbWFwKCkgLSBcCi0JSW1wbGVtZW50cyAm
c3RydWN0IGZpbGVfb3BlcmF0aW9ucy5tbWFwKCkKLSAqIEBmaWxwOgl0aGUgbWFwcGluZydzIGZp
bGUgc3RydWN0dXJlCi0gKiBAdm1hOgl0aGUgbWFwcGluZydzIG1lbW9yeSBhcmVhCi0gKgotICog
UmV0dXJuczoKLSAqIDAgb24gc3VjY2Vzcywgb3IKLSAqIGEgbmVnYXRpdmUgZXJyb3IgY29kZSBv
dGhlcndpc2UuCi0gKi8KLWludCBkcm1fdnJhbV9tbV9maWxlX29wZXJhdGlvbnNfbW1hcCgKLQlz
dHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCi17Ci0Jc3RydWN0
IGRybV9maWxlICpmaWxlX3ByaXYgPSBmaWxwLT5wcml2YXRlX2RhdGE7Ci0Jc3RydWN0IGRybV9k
ZXZpY2UgKmRldiA9IGZpbGVfcHJpdi0+bWlub3ItPmRldjsKLQotCWlmIChXQVJOX09OQ0UoIWRl
di0+dnJhbV9tbSwgIlZSQU0gTU0gbm90IGluaXRpYWxpemVkIikpCi0JCXJldHVybiAtRUlOVkFM
OwotCi0JcmV0dXJuIGRybV92cmFtX21tX21tYXAoZmlscCwgdm1hLCBkZXYtPnZyYW1fbW0pOwot
fQotRVhQT1JUX1NZTUJPTChkcm1fdnJhbV9tbV9maWxlX29wZXJhdGlvbnNfbW1hcCk7Ci0tIAoy
LjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
