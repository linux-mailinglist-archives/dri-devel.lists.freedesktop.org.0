Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50279E4F9
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 16:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B01589258;
	Mon, 29 Apr 2019 14:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08ABF89258
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 14:43:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1D825AF96;
 Mon, 29 Apr 2019 14:43:48 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
 christian.koenig@amd.com, ray.huang@amd.com, Jerry.Zhang@amd.com,
 hdegoede@redhat.com, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com
Subject: [PATCH v3 06/19] drm: Add default instance for VRAM MM callback
 functions
Date: Mon, 29 Apr 2019 16:43:28 +0200
Message-Id: <20190429144341.12615-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190429144341.12615-1-tzimmermann@suse.de>
References: <20190429144341.12615-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VlJBTSBNTSBpcyBtb3N0IGxpa2VseSBiZSB1c2VkIHdpdGggR0VNIFZSQU0uIFRoZSBsYXR0ZXIg
bm93IHByb3ZpZGVzIHRoZQpyZXF1aXJlZCBpbnN0YW5jZSBvZiBzdHJ1Y3QgZHJtX3ZyYW1fbW1f
ZnVuY3MgZm9yIGRyaXZlcnMgdG8gdXNlLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJh
bV9oZWxwZXIuYyB8IDE0ICsrKysrKysrKysrKysrCiBpbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1f
aGVscGVyLmggICAgIHwgIDMgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYwppbmRleCBlNWEwZGNmOTdiYTguLjM3
OTc5ZmIzMDYyYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxw
ZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCkBAIC0yLDYg
KzIsNyBAQAogCiAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaD4KICNpbmNsdWRl
IDxkcm0vZHJtX21vZGUuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX3ZyYW1fbW1faGVscGVyLmg+CiAj
aW5jbHVkZSA8ZHJtL3R0bS90dG1fcGFnZV9hbGxvYy5oPgogCiAvKioKQEAgLTUyMSw2ICs1MjIs
MTkgQEAgaW50IGRybV9nZW1fdnJhbV9ib19kcml2ZXJfdmVyaWZ5X2FjY2VzcyhzdHJ1Y3QgdHRt
X2J1ZmZlcl9vYmplY3QgKmJvLAogfQogRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3ZyYW1fYm9fZHJp
dmVyX3ZlcmlmeV9hY2Nlc3MpOwogCisvKioKKyAqIGRybV9nZW1fdnJhbV9tbV9mdW5jcyAtIEZ1
bmN0aW9ucyBmb3IgJnN0cnVjdCBkcm1fdnJhbV9tbQorICoKKyAqIE1vc3QgdXNlcnMgb2YgQHN0
cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0IHdpbGwgYWxzbyB1c2UKKyAqIEBzdHJ1Y3QgZHJtX3Zy
YW1fbW0uIFRoaXMgaW5zdGFuY2Ugb2YgJnN0cnVjdCBkcm1fdnJhbV9tbV9mdW5jcworICogY2Fu
IGJlIHVzZWQgdG8gY29ubmVjdCBib3RoLgorICovCitjb25zdCBzdHJ1Y3QgZHJtX3ZyYW1fbW1f
ZnVuY3MgZHJtX2dlbV92cmFtX21tX2Z1bmNzID0geworCS5ldmljdF9mbGFncyA9IGRybV9nZW1f
dnJhbV9ib19kcml2ZXJfZXZpY3RfZmxhZ3MsCisJLnZlcmlmeV9hY2Nlc3MgPSBkcm1fZ2VtX3Zy
YW1fYm9fZHJpdmVyX3ZlcmlmeV9hY2Nlc3MKK307CitFWFBPUlRfU1lNQk9MKGRybV9nZW1fdnJh
bV9tbV9mdW5jcyk7CisKIC8qCiAgKiBIZWxwZXJzIGZvciBzdHJ1Y3QgZHJtX2RyaXZlcgogICov
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggYi9pbmNsdWRl
L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmgKaW5kZXggMWViNDI5MTliOWZiLi4zZjI1MGY1OWVh
YTUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaAorKysgYi9p
bmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmgKQEAgLTksNiArOSw3IEBACiAjaW5jbHVk
ZSA8bGludXgva2VybmVsLmg+IC8qIGZvciBjb250YWluZXJfb2YoKSAqLwogCiBzdHJ1Y3QgZHJt
X21vZGVfY3JlYXRlX2R1bWI7CitzdHJ1Y3QgZHJtX3ZyYW1fbW1fZnVuY3M7CiBzdHJ1Y3QgZmls
cDsKIAogI2RlZmluZSBEUk1fR0VNX1ZSQU1fUExfRkxBR19WUkFNCVRUTV9QTF9GTEFHX1ZSQU0K
QEAgLTEwNyw2ICsxMDgsOCBAQCB2b2lkIGRybV9nZW1fdnJhbV9ib19kcml2ZXJfZXZpY3RfZmxh
Z3Moc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIGludCBkcm1fZ2VtX3ZyYW1fYm9fZHJp
dmVyX3ZlcmlmeV9hY2Nlc3Moc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAkJCQkJIHN0
cnVjdCBmaWxlICpmaWxwKTsKIAorZXh0ZXJuIGNvbnN0IHN0cnVjdCBkcm1fdnJhbV9tbV9mdW5j
cyBkcm1fZ2VtX3ZyYW1fbW1fZnVuY3M7CisKIC8qCiAgKiBIZWxwZXJzIGZvciBzdHJ1Y3QgZHJt
X2RyaXZlcgogICovCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
