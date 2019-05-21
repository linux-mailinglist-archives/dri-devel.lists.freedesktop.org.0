Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9DE24D9D
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 13:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1599E892FD;
	Tue, 21 May 2019 11:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32A8892FB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 11:08:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 81946AF5F;
 Tue, 21 May 2019 11:08:36 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
 christian.koenig@amd.com, ray.huang@amd.com, sam@ravnborg.org
Subject: [PATCH 3/3] drm: Assert that BO is locked in drm_gem_vram_{pin,
 unpin}_locked()
Date: Tue, 21 May 2019 13:08:31 +0200
Message-Id: <20190521110831.20200-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521110831.20200-1-tzimmermann@suse.de>
References: <20190521110831.20200-1-tzimmermann@suse.de>
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

V2UgbWF5IG5vdCBjYWxsIGRybV9nZW1fdnJhbV97cGluLHVucGlufV9sb2NrZWQoKSB3aXRoIGFu
IHVubG9ja2VkCkJPLiBOb3cgdGVzdCBmb3IgdGhpcy4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtX3ZyYW1faGVscGVyLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYwppbmRleCBhZWZiMGMzNjE0ODYu
LjczODBhMDZhNTgyYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9o
ZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCkBAIC0y
ODQsNiArMjg0LDggQEAgaW50IGRybV9nZW1fdnJhbV9waW5fbG9ja2VkKHN0cnVjdCBkcm1fZ2Vt
X3ZyYW1fb2JqZWN0ICpnYm8sCiAJaW50IGksIHJldDsKIAlzdHJ1Y3QgdHRtX29wZXJhdGlvbl9j
dHggY3R4ID0geyBmYWxzZSwgZmFsc2UgfTsKIAorCWxvY2tkZXBfYXNzZXJ0X2hlbGQoJmdiby0+
Ym8ucmVzdi0+bG9jay5iYXNlKTsKKwogCWlmIChnYm8tPnBpbl9jb3VudCkgewogCQkrK2diby0+
cGluX2NvdW50OwogCQlyZXR1cm4gMDsKQEAgLTM2MSw2ICszNjMsOCBAQCBpbnQgZHJtX2dlbV92
cmFtX3VucGluX2xvY2tlZChzdHJ1Y3QgZHJtX2dlbV92cmFtX29iamVjdCAqZ2JvKQogCWludCBp
LCByZXQ7CiAJc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4IGN0eCA9IHsgZmFsc2UsIGZhbHNlIH07
CiAKKwlsb2NrZGVwX2Fzc2VydF9oZWxkKCZnYm8tPmJvLnJlc3YtPmxvY2suYmFzZSk7CisKIAlp
ZiAoV0FSTl9PTl9PTkNFKCFnYm8tPnBpbl9jb3VudCkpCiAJCXJldHVybiAwOwogCi0tIAoyLjIx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
