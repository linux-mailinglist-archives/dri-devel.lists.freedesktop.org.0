Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7F21A1D63
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 10:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB1E6E9BC;
	Wed,  8 Apr 2020 08:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C3D6E9B4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 08:26:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 97D17AE63;
 Wed,  8 Apr 2020 08:26:56 +0000 (UTC)
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
Subject: [PATCH v2 06/10] drm/mgag200: Set up fbdev after registering device;
 remove error checks
Date: Wed,  8 Apr 2020 10:26:37 +0200
Message-Id: <20200408082641.590-7-tzimmermann@suse.de>
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
aXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMgIHwgMiArKwogZHJpdmVycy9ncHUv
ZHJtL21nYWcyMDAvbWdhZzIwMF9tYWluLmMgfCA0IC0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAw
X2Rydi5jCmluZGV4IDdhNWJhZDJmNTdkNzAuLjMyOThiN2VmMThiMDMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L21nYWcyMDAvbWdhZzIwMF9kcnYuYwpAQCAtNzcsNiArNzcsOCBAQCBzdGF0aWMgaW50IG1nYV9w
Y2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lk
ICplbnQpCiAJaWYgKHJldCkKIAkJZ290byBlcnJfbWdhZzIwMF9kcml2ZXJfdW5sb2FkOwogCisJ
ZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoZGV2LCAwKTsKKwogCXJldHVybiAwOwogCiBlcnJfbWdh
ZzIwMF9kcml2ZXJfdW5sb2FkOgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAv
bWdhZzIwMF9tYWluLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21haW4uYwpp
bmRleCBlMjc4YjZhNTQ3YmRlLi5iNjgwY2Y0N2NiYjk0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21haW4uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIw
MC9tZ2FnMjAwX21haW4uYwpAQCAtMTgxLDEwICsxODEsNiBAQCBpbnQgbWdhZzIwMF9kcml2ZXJf
bG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBsb25nIGZsYWdzKQogCQlkZXZf
d2FybigmZGV2LT5wZGV2LT5kZXYsCiAJCQkiQ291bGQgbm90IGluaXRpYWxpemUgY3Vyc29ycy4g
Tm90IGRvaW5nIGhhcmR3YXJlIGN1cnNvcnMuXG4iKTsKIAotCXIgPSBkcm1fZmJkZXZfZ2VuZXJp
Y19zZXR1cChtZGV2LT5kZXYsIDApOwotCWlmIChyKQotCQlnb3RvIGVycl9tb2Rlc2V0OwotCiAJ
cmV0dXJuIDA7CiAKIGVycl9tb2Rlc2V0OgotLSAKMi4yNi4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
