Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B45DEB1DB3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 14:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9029C6F39D;
	Fri, 13 Sep 2019 12:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A286F394
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 12:29:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0177C308218D;
 Fri, 13 Sep 2019 12:29:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 738B36013A;
 Fri, 13 Sep 2019 12:29:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9998231F62; Fri, 13 Sep 2019 14:29:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/8] drm/vram: switch vram helper to
 &drm_gem_object_funcs.mmap()
Date: Fri, 13 Sep 2019 14:29:06 +0200
Message-Id: <20190913122908.784-7-kraxel@redhat.com>
In-Reply-To: <20190913122908.784-1-kraxel@redhat.com>
References: <20190913122908.784-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 13 Sep 2019 12:29:14 +0000 (UTC)
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
bm4gPGtyYXhlbEByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxw
ZXIuaCAgICAgfCAgOSArLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBl
ci5jIHwgMzQgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgNDEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0v
ZHJtX2dlbV92cmFtX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5o
CmluZGV4IDlhYWVmNGY4YzMyNy4uOWQ1NTI2NjUwMjkxIDEwMDY0NAotLS0gYS9pbmNsdWRlL2Ry
bS9kcm1fZ2VtX3ZyYW1faGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hl
bHBlci5oCkBAIC0xODAsMTMgKzE4MCw2IEBAIHN0cnVjdCBkcm1fdnJhbV9tbSAqZHJtX3ZyYW1f
aGVscGVyX2FsbG9jX21tKAogCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVpbnQ2NF90IHZyYW1f
YmFzZSwgc2l6ZV90IHZyYW1fc2l6ZSk7CiB2b2lkIGRybV92cmFtX2hlbHBlcl9yZWxlYXNlX21t
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOwogCi0vKgotICogSGVscGVycyBmb3IgJnN0cnVjdCBm
aWxlX29wZXJhdGlvbnMKLSAqLwotCi1pbnQgZHJtX3ZyYW1fbW1fZmlsZV9vcGVyYXRpb25zX21t
YXAoCi0Jc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKLQog
LyoqCiAgKiBkZWZpbmUgRFJNX1ZSQU1fTU1fRklMRV9PUEVSQVRJT05TIC0gZGVmYXVsdCBjYWxs
YmFjayBmdW5jdGlvbnMgZm9yIFwKIAkmc3RydWN0IGZpbGVfb3BlcmF0aW9ucwpAQCAtMjAwLDcg
KzE5Myw3IEBAIGludCBkcm1fdnJhbV9tbV9maWxlX29wZXJhdGlvbnNfbW1hcCgKIAkucG9sbAkJ
PSBkcm1fcG9sbCwgXAogCS51bmxvY2tlZF9pb2N0bCA9IGRybV9pb2N0bCwgXAogCS5jb21wYXRf
aW9jdGwJPSBkcm1fY29tcGF0X2lvY3RsLCBcCi0JLm1tYXAJCT0gZHJtX3ZyYW1fbW1fZmlsZV9v
cGVyYXRpb25zX21tYXAsIFwKKwkubW1hcAkJPSBkcm1fZ2VtX21tYXAsIFwKIAkub3BlbgkJPSBk
cm1fb3BlbiwgXAogCS5yZWxlYXNlCT0gZHJtX3JlbGVhc2UgXAogCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW1fdnJhbV9oZWxwZXIuYwppbmRleCA3YmVlODBjNmI2ZTguLmUxMDBiOTdlYTZlMyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCkBAIC02ODEsNiArNjgxLDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcyBkcm1fZ2VtX3ZyYW1fb2JqZWN0X2Z1
bmNzID0gewogCS51bnBpbgk9IGRybV9nZW1fdnJhbV9vYmplY3RfdW5waW4sCiAJLnZtYXAJPSBk
cm1fZ2VtX3ZyYW1fb2JqZWN0X3ZtYXAsCiAJLnZ1bm1hcAk9IGRybV9nZW1fdnJhbV9vYmplY3Rf
dnVubWFwLAorCS5tbWFwICAgPSBkcm1fZ2VtX3R0bV9tbWFwLAogCS5wcmludF9pbmZvID0gZHJt
X2dlbV90dG1fcHJpbnRfaW5mbywKIH07CiAKQEAgLTkxNSwxMiArOTE2LDYgQEAgc3RhdGljIHZv
aWQgZHJtX3ZyYW1fbW1fY2xlYW51cChzdHJ1Y3QgZHJtX3ZyYW1fbW0gKnZtbSkKIAl0dG1fYm9f
ZGV2aWNlX3JlbGVhc2UoJnZtbS0+YmRldik7CiB9CiAKLXN0YXRpYyBpbnQgZHJtX3ZyYW1fbW1f
bW1hcChzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCi0JCQkg
ICAgc3RydWN0IGRybV92cmFtX21tICp2bW0pCi17Ci0JcmV0dXJuIHR0bV9ib19tbWFwKGZpbHAs
IHZtYSwgJnZtbS0+YmRldik7Ci19Ci0KIC8qCiAgKiBIZWxwZXJzIGZvciBpbnRlZ3JhdGlvbiB3
aXRoIHN0cnVjdCBkcm1fZGV2aWNlCiAgKi8KQEAgLTk3NiwzMCArOTcxLDMgQEAgdm9pZCBkcm1f
dnJhbV9oZWxwZXJfcmVsZWFzZV9tbShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCWRldi0+dnJh
bV9tbSA9IE5VTEw7CiB9CiBFWFBPUlRfU1lNQk9MKGRybV92cmFtX2hlbHBlcl9yZWxlYXNlX21t
KTsKLQotLyoKLSAqIEhlbHBlcnMgZm9yICZzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zCi0gKi8KLQot
LyoqCi0gKiBkcm1fdnJhbV9tbV9maWxlX29wZXJhdGlvbnNfbW1hcCgpIC0gXAotCUltcGxlbWVu
dHMgJnN0cnVjdCBmaWxlX29wZXJhdGlvbnMubW1hcCgpCi0gKiBAZmlscDoJdGhlIG1hcHBpbmcn
cyBmaWxlIHN0cnVjdHVyZQotICogQHZtYToJdGhlIG1hcHBpbmcncyBtZW1vcnkgYXJlYQotICoK
LSAqIFJldHVybnM6Ci0gKiAwIG9uIHN1Y2Nlc3MsIG9yCi0gKiBhIG5lZ2F0aXZlIGVycm9yIGNv
ZGUgb3RoZXJ3aXNlLgotICovCi1pbnQgZHJtX3ZyYW1fbW1fZmlsZV9vcGVyYXRpb25zX21tYXAo
Ci0Jc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQotewotCXN0
cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2ID0gZmlscC0+cHJpdmF0ZV9kYXRhOwotCXN0cnVjdCBk
cm1fZGV2aWNlICpkZXYgPSBmaWxlX3ByaXYtPm1pbm9yLT5kZXY7Ci0KLQlpZiAoV0FSTl9PTkNF
KCFkZXYtPnZyYW1fbW0sICJWUkFNIE1NIG5vdCBpbml0aWFsaXplZCIpKQotCQlyZXR1cm4gLUVJ
TlZBTDsKLQotCXJldHVybiBkcm1fdnJhbV9tbV9tbWFwKGZpbHAsIHZtYSwgZGV2LT52cmFtX21t
KTsKLX0KLUVYUE9SVF9TWU1CT0woZHJtX3ZyYW1fbW1fZmlsZV9vcGVyYXRpb25zX21tYXApOwot
LSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
