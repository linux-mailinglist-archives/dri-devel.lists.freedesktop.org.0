Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5704B1DB2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 14:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4660A6F39A;
	Fri, 13 Sep 2019 12:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E580F6F394
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 12:29:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7BCAB30842AF;
 Fri, 13 Sep 2019 12:29:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F30E60C44;
 Fri, 13 Sep 2019 12:29:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 78E0031F3D; Fri, 13 Sep 2019 14:29:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] drm/ttm: add drm_gem_ttm_mmap()
Date: Fri, 13 Sep 2019 14:29:05 +0200
Message-Id: <20190913122908.784-6-kraxel@redhat.com>
In-Reply-To: <20190913122908.784-1-kraxel@redhat.com>
References: <20190913122908.784-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 13 Sep 2019 12:29:16 +0000 (UTC)
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

QWRkIGhlbHBlciBmdW5jdGlvbiB0byBtbWFwIHR0bSBibydzIHVzaW5nICZkcm1fZ2VtX29iamVj
dF9mdW5jcy5tbWFwKCkuCgpOb3RlIHRoYXQgd2l0aCB0aGlzIGNvZGUgcGF0aCBhY2Nlc3MgdmVy
aWZpY2F0aW9uIGlzIGRvbmUgYnkKZHJtX2dlbV9tbWFwKCkgKHdoaWNoIGNhbGxzIGRybV92bWFf
bm9kZV9pc19hbGxvd2VkKCgpKS4KVGhlICZ0dG1fYm9fZHJpdmVyLnZlcmlmeV9hY2Nlc3MoKSBj
YWxsYmFjayBpcyBpcyBub3QgdXNlZC4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGty
YXhlbEByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5oICAg
ICB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmMgfCAxOSArKysr
KysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2Ry
bV9nZW1fdHRtX2hlbHBlci5oCmluZGV4IDYyNjhmODljNWE0OC4uMTE4Y2VmNzZmODRmIDEwMDY0
NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2Ry
bS9kcm1fZ2VtX3R0bV9oZWxwZXIuaApAQCAtMTUsNSArMTUsNyBAQAogCiB2b2lkIGRybV9nZW1f
dHRtX3ByaW50X2luZm8oc3RydWN0IGRybV9wcmludGVyICpwLCB1bnNpZ25lZCBpbnQgaW5kZW50
LAogCQkJICAgIGNvbnN0IHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtKTsKK2ludCBkcm1fZ2Vt
X3R0bV9tbWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtLAorCQkgICAgIHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hKTsKIAogI2VuZGlmCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbV90dG1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV90dG1faGVscGVy
LmMKaW5kZXggOWE0YmFmY2YyMGRmLi4zNGNlNmNmNzhiMzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dl
bV90dG1faGVscGVyLmMKQEAgLTUyLDUgKzUyLDI0IEBAIHZvaWQgZHJtX2dlbV90dG1fcHJpbnRf
aW5mbyhzdHJ1Y3QgZHJtX3ByaW50ZXIgKnAsIHVuc2lnbmVkIGludCBpbmRlbnQsCiB9CiBFWFBP
UlRfU1lNQk9MKGRybV9nZW1fdHRtX3ByaW50X2luZm8pOwogCisvKioKKyAqIGRybV9nZW1fdHRt
X21tYXAoKSAtIG1tYXAgJnR0bV9idWZmZXJfb2JqZWN0CisgKiBAZ2VtOiBHRU0gb2JqZWN0Lgor
ICogQHZtYTogdm0gYXJlYS4KKyAqCisgKiBUaGlzIGZ1bmN0aW9uIGNhbiBiZSB1c2VkIGFzICZk
cm1fZ2VtX29iamVjdF9mdW5jcy5tbWFwCisgKiBjYWxsYmFjay4KKyAqLworaW50IGRybV9nZW1f
dHRtX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW0sCisJCSAgICAgc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEpCit7CisJc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyA9IGRybV9n
ZW1fdHRtX29mX2dlbShnZW0pOworCisJdHRtX2JvX2dldChibyk7CisJdHRtX2JvX21tYXBfdm1h
X3NldHVwKGJvLCB2bWEpOworCXJldHVybiAwOworfQorRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3R0
bV9tbWFwKTsKKwogTU9EVUxFX0RFU0NSSVBUSU9OKCJEUk0gZ2VtIHR0bSBoZWxwZXJzIik7CiBN
T0RVTEVfTElDRU5TRSgiR1BMIik7Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
