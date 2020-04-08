Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB931A1D5E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 10:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F996E9B0;
	Wed,  8 Apr 2020 08:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064E26E9B2
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 08:26:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 441D2ABD1;
 Wed,  8 Apr 2020 08:26:54 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: noralf@tronnes.org, daniel@ffwll.ch, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 xinliang.liu@linaro.org, zourongrong@gmail.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul@crapouillou.net, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, jsarha@ti.com, tomi.valkeinen@ti.com,
 sean@poorly.run, hdegoede@redhat.com, kraxel@redhat.com,
 emil.velikov@collabora.com, sam@ravnborg.org, yc_chen@aspeedtech.com,
 tiantao6@hisilicon.com
Subject: [PATCH v2 01/10] drm/ast: Set up fbdev after registering device;
 remove error checks
Date: Wed,  8 Apr 2020 10:26:32 +0200
Message-Id: <20200408082641.590-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200408082641.590-1-tzimmermann@suse.de>
References: <20200408082641.590-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R2VuZXJpYyBmYmRldiBzdXBwb3J0IGlzIGEgRFJNIGNsaWVudC4gU2V0IGl0IHVwIGFmdGVyIHJl
Z2lzdGVyaW5nCnRoZSBuZXcgRFJNIGRldmljZS4gUmVtb3ZlIHRoZSBlcnJvciBjaGVja3MgYXMg
dGhlIGRyaXZlcidzIHByb2JlCmZ1bmN0aW9uIHNob3VsZCBub3QgZGVwZW5kIG9uIGEgRFJNIGNs
aWVudCdzIHN0YXRlLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+ClJldmlld2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVz
Lm9yZz4KQWNrZWQtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jICB8IDMgKysrCiBkcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tYWluLmMgfCA1IC0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jCmluZGV4IDMwYWE3M2E1ZDliNzIuLmI3
YmEyMmRkZGNhZDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jCkBAIC0zMiw2ICszMiw3IEBACiAKICNp
bmNsdWRlIDxkcm0vZHJtX2NydGNfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4K
KyNpbmNsdWRlIDxkcm0vZHJtX2ZiX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZ2VtX3Zy
YW1faGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4KIApAQCAtMTEx
LDYgKzExMiw4IEBAIHN0YXRpYyBpbnQgYXN0X3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRl
diwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkKIAlpZiAocmV0KQogCQlnb3RvIGVy
cl9hc3RfZHJpdmVyX3VubG9hZDsKIAorCWRybV9mYmRldl9nZW5lcmljX3NldHVwKGRldiwgMzIp
OworCiAJcmV0dXJuIDA7CiAKIGVycl9hc3RfZHJpdmVyX3VubG9hZDoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21h
aW4uYwppbmRleCAxOGEwYTRjZTAwZjZlLi5lNTM5OGUzZGFiZTcwIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3Rf
bWFpbi5jCkBAIC0zMCw3ICszMCw2IEBACiAKICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxw
ZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2NydGNfaGVscGVyLmg+Ci0jaW5jbHVkZSA8ZHJtL2Ry
bV9mYl9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2dlbS5oPgogI2luY2x1ZGUgPGRybS9k
cm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZ2VtX3ZyYW1f
aGVscGVyLmg+CkBAIC01MTIsMTAgKzUxMSw2IEBAIGludCBhc3RfZHJpdmVyX2xvYWQoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgbG9uZyBmbGFncykKIAogCWRybV9tb2RlX2NvbmZp
Z19yZXNldChkZXYpOwogCi0JcmV0ID0gZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoZGV2LCAzMik7
Ci0JaWYgKHJldCkKLQkJZ290byBvdXRfZnJlZTsKLQogCXJldHVybiAwOwogb3V0X2ZyZWU6CiAJ
a2ZyZWUoYXN0KTsKLS0gCjIuMjYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
