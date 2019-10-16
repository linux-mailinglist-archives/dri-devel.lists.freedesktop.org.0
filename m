Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 699AFD9009
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 13:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456386E94B;
	Wed, 16 Oct 2019 11:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A79D6E947
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 11:52:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B15E810CC207;
 Wed, 16 Oct 2019 11:52:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A991601AC;
 Wed, 16 Oct 2019 11:52:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 35E0431EA0; Wed, 16 Oct 2019 13:52:05 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 09/11] drm/vram: switch vram helper to
 &drm_gem_object_funcs.mmap()
Date: Wed, 16 Oct 2019 13:52:01 +0200
Message-Id: <20191016115203.20095-10-kraxel@redhat.com>
In-Reply-To: <20191016115203.20095-1-kraxel@redhat.com>
References: <20191016115203.20095-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Wed, 16 Oct 2019 11:52:11 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
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
ZXggMzU0YTljZDM1OGEzLi41ZTQ4ZmRhYzRhMWQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2Ry
bV9nZW1fdnJhbV9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVy
LmgKQEAgLTE4NCwxMyArMTg0LDYgQEAgc3RydWN0IGRybV92cmFtX21tICpkcm1fdnJhbV9oZWxw
ZXJfYWxsb2NfbW0oCiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdWludDY0X3QgdnJhbV9iYXNl
LCBzaXplX3QgdnJhbV9zaXplKTsKIHZvaWQgZHJtX3ZyYW1faGVscGVyX3JlbGVhc2VfbW0oc3Ry
dWN0IGRybV9kZXZpY2UgKmRldik7CiAKLS8qCi0gKiBIZWxwZXJzIGZvciAmc3RydWN0IGZpbGVf
b3BlcmF0aW9ucwotICovCi0KLWludCBkcm1fdnJhbV9tbV9maWxlX29wZXJhdGlvbnNfbW1hcCgK
LQlzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOwotCiAvKioK
ICAqIGRlZmluZSBEUk1fVlJBTV9NTV9GSUxFX09QRVJBVElPTlMgLSBkZWZhdWx0IGNhbGxiYWNr
IGZ1bmN0aW9ucyBmb3IgXAogCSZzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zCkBAIC0yMDQsNyArMTk3
LDcgQEAgaW50IGRybV92cmFtX21tX2ZpbGVfb3BlcmF0aW9uc19tbWFwKAogCS5wb2xsCQk9IGRy
bV9wb2xsLCBcCiAJLnVubG9ja2VkX2lvY3RsID0gZHJtX2lvY3RsLCBcCiAJLmNvbXBhdF9pb2N0
bAk9IGRybV9jb21wYXRfaW9jdGwsIFwKLQkubW1hcAkJPSBkcm1fdnJhbV9tbV9maWxlX29wZXJh
dGlvbnNfbW1hcCwgXAorCS5tbWFwCQk9IGRybV9nZW1fbW1hcCwgXAogCS5vcGVuCQk9IGRybV9v
cGVuLCBcCiAJLnJlbGVhc2UJPSBkcm1fcmVsZWFzZSBcCiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92
cmFtX2hlbHBlci5jCmluZGV4IGRjNzk0Mjk4MWY0YS4uZWM4NjhiZjc1MzMzIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKQEAgLTczNyw2ICs3MzcsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzIGRybV9nZW1fdnJhbV9vYmplY3RfZnVuY3Mg
PSB7CiAJLnVucGluCT0gZHJtX2dlbV92cmFtX29iamVjdF91bnBpbiwKIAkudm1hcAk9IGRybV9n
ZW1fdnJhbV9vYmplY3Rfdm1hcCwKIAkudnVubWFwCT0gZHJtX2dlbV92cmFtX29iamVjdF92dW5t
YXAsCisJLm1tYXAgICA9IGRybV9nZW1fdHRtX21tYXAsCiAJLnByaW50X2luZm8gPSBkcm1fZ2Vt
X3R0bV9wcmludF9pbmZvLAogfTsKIApAQCAtOTcxLDEyICs5NzIsNiBAQCBzdGF0aWMgdm9pZCBk
cm1fdnJhbV9tbV9jbGVhbnVwKHN0cnVjdCBkcm1fdnJhbV9tbSAqdm1tKQogCXR0bV9ib19kZXZp
Y2VfcmVsZWFzZSgmdm1tLT5iZGV2KTsKIH0KIAotc3RhdGljIGludCBkcm1fdnJhbV9tbV9tbWFw
KHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKLQkJCSAgICBz
dHJ1Y3QgZHJtX3ZyYW1fbW0gKnZtbSkKLXsKLQlyZXR1cm4gdHRtX2JvX21tYXAoZmlscCwgdm1h
LCAmdm1tLT5iZGV2KTsKLX0KLQogLyoKICAqIEhlbHBlcnMgZm9yIGludGVncmF0aW9uIHdpdGgg
c3RydWN0IGRybV9kZXZpY2UKICAqLwpAQCAtMTAzMiwzMCArMTAyNywzIEBAIHZvaWQgZHJtX3Zy
YW1faGVscGVyX3JlbGVhc2VfbW0oc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAlkZXYtPnZyYW1f
bW0gPSBOVUxMOwogfQogRVhQT1JUX1NZTUJPTChkcm1fdnJhbV9oZWxwZXJfcmVsZWFzZV9tbSk7
Ci0KLS8qCi0gKiBIZWxwZXJzIGZvciAmc3RydWN0IGZpbGVfb3BlcmF0aW9ucwotICovCi0KLS8q
KgotICogZHJtX3ZyYW1fbW1fZmlsZV9vcGVyYXRpb25zX21tYXAoKSAtIFwKLQlJbXBsZW1lbnRz
ICZzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zLm1tYXAoKQotICogQGZpbHA6CXRoZSBtYXBwaW5nJ3Mg
ZmlsZSBzdHJ1Y3R1cmUKLSAqIEB2bWE6CXRoZSBtYXBwaW5nJ3MgbWVtb3J5IGFyZWEKLSAqCi0g
KiBSZXR1cm5zOgotICogMCBvbiBzdWNjZXNzLCBvcgotICogYSBuZWdhdGl2ZSBlcnJvciBjb2Rl
IG90aGVyd2lzZS4KLSAqLwotaW50IGRybV92cmFtX21tX2ZpbGVfb3BlcmF0aW9uc19tbWFwKAot
CXN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKLXsKLQlzdHJ1
Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiA9IGZpbHAtPnByaXZhdGVfZGF0YTsKLQlzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2ID0gZmlsZV9wcml2LT5taW5vci0+ZGV2OwotCi0JaWYgKFdBUk5fT05DRSgh
ZGV2LT52cmFtX21tLCAiVlJBTSBNTSBub3QgaW5pdGlhbGl6ZWQiKSkKLQkJcmV0dXJuIC1FSU5W
QUw7Ci0KLQlyZXR1cm4gZHJtX3ZyYW1fbW1fbW1hcChmaWxwLCB2bWEsIGRldi0+dnJhbV9tbSk7
Ci19Ci1FWFBPUlRfU1lNQk9MKGRybV92cmFtX21tX2ZpbGVfb3BlcmF0aW9uc19tbWFwKTsKLS0g
CjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
