Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 142EF11444B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 17:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B616E895;
	Thu,  5 Dec 2019 16:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C5A6E895
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 16:01:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 853E4AD98;
 Thu,  5 Dec 2019 16:01:44 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, noralf@tronnes.org,
 rong.a.chen@intel.com, ying.huang@intel.com, ville.syrjala@linux.intel.com,
 sam@ravnborg.org, emil.velikov@collabora.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v3 1/4] drm/mgag200: Create fbdev console after registering
 device
Date: Thu,  5 Dec 2019 17:01:39 +0100
Message-Id: <20191205160142.3588-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191205160142.3588-1-tzimmermann@suse.de>
References: <20191205160142.3588-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R2VuZXJpYyBmYmRldiBjb25zb2xlIGVtdWxhdGlvbiBpcyBhIERSTSBjbGllbnQuIEZvciBjb25z
aXN0ZW5jeSB3aXRoCm90aGVyIGNsaWVudHMsIGl0IHNob3VsZCBiZSBjcmVhdGVkIGFmdGVyIHJl
Z2lzdGVyaW5nIHRoZSBEUk0gZGV2aWNlLgpIZW5jZSBtb3ZlIHRoZSBmYmRldiBjb2RlIHRvIHRo
ZSBhcHByb3ByaWF0ZSBwbGFjZS4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBf
ZHJ2LmMgIHwgNiArKysrKysKIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFpbi5j
IHwgNCAtLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jIGIv
ZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYwppbmRleCAzMGIzYjgyN2FkZjgu
LjhlNjQxYjI5ZWIwMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIw
MF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jCkBAIC03
NCw4ICs3NCwxNCBAQCBzdGF0aWMgaW50IG1nYV9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBk
ZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICplbnQpCiAJaWYgKHJldCkKIAkJZ290byBl
cnJfbWdhZzIwMF9kcml2ZXJfdW5sb2FkOwogCisJcmV0ID0gZHJtX2ZiZGV2X2dlbmVyaWNfc2V0
dXAoZGV2LCAwKTsKKwlpZiAocmV0KQorCQlnb3RvIGVycl9tZ2FnMjAwX2RyaXZlcl91bnJlZ2lz
dGVyOworCiAJcmV0dXJuIDA7CiAKK2Vycl9tZ2FnMjAwX2RyaXZlcl91bnJlZ2lzdGVyOgorCWRy
bV9kZXZfdW5yZWdpc3RlcihkZXYpOwogZXJyX21nYWcyMDBfZHJpdmVyX3VubG9hZDoKIAltZ2Fn
MjAwX2RyaXZlcl91bmxvYWQoZGV2KTsKIGVycl9kcm1fZGV2X3B1dDoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL21n
YWcyMDAvbWdhZzIwMF9tYWluLmMKaW5kZXggZTI3OGI2YTU0N2JkLi5iNjgwY2Y0N2NiYjkgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFpbi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFpbi5jCkBAIC0xODEsMTAgKzE4MSw2IEBA
IGludCBtZ2FnMjAwX2RyaXZlcl9sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVk
IGxvbmcgZmxhZ3MpCiAJCWRldl93YXJuKCZkZXYtPnBkZXYtPmRldiwKIAkJCSJDb3VsZCBub3Qg
aW5pdGlhbGl6ZSBjdXJzb3JzLiBOb3QgZG9pbmcgaGFyZHdhcmUgY3Vyc29ycy5cbiIpOwogCi0J
ciA9IGRybV9mYmRldl9nZW5lcmljX3NldHVwKG1kZXYtPmRldiwgMCk7Ci0JaWYgKHIpCi0JCWdv
dG8gZXJyX21vZGVzZXQ7Ci0KIAlyZXR1cm4gMDsKIAogZXJyX21vZGVzZXQ6Ci0tIAoyLjIzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
