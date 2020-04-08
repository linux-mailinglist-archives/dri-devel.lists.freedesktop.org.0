Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C73F11A1D65
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 10:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910E66E9C3;
	Wed,  8 Apr 2020 08:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D1D6E9B4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 08:27:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 01BFAAE6F;
 Wed,  8 Apr 2020 08:26:57 +0000 (UTC)
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
Subject: [PATCH v2 08/10] drm/udl: Remove error check from fbdev setup
Date: Wed,  8 Apr 2020 10:26:39 +0200
Message-Id: <20200408082641.590-9-tzimmermann@suse.de>
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

UmVtb3ZlIHRoZSBlcnJvciBjaGVjayBmcm9tIHRoZSBmYmRldiBzZXR1cCBmdW5jdGlvbi4gVGhl
IGRyaXZlcidzCnByb2JlIGZ1bmN0aW9uIHNob3VsZCBub3QgZGVwZW5kIG9uIGEgRFJNIGNsaWVu
dCdzIHN0YXRlLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+ClJldmlld2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9y
Zz4KQWNrZWQtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jIHwgNiArLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dWRsL3VkbF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jCmluZGV4IDFjZTJk
ODY1YzM2ZGMuLjljYzZkMDc1Y2I0MDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwv
dWRsX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jCkBAIC05NywxNCAr
OTcsMTAgQEAgc3RhdGljIGludCB1ZGxfdXNiX3Byb2JlKHN0cnVjdCB1c2JfaW50ZXJmYWNlICpp
bnRlcmZhY2UsCiAKIAlEUk1fSU5GTygiSW5pdGlhbGl6ZWQgdWRsIG9uIG1pbm9yICVkXG4iLCB1
ZGwtPmRybS5wcmltYXJ5LT5pbmRleCk7CiAKLQlyID0gZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAo
JnVkbC0+ZHJtLCAwKTsKLQlpZiAocikKLQkJZ290byBlcnJfZHJtX2Rldl91bnJlZ2lzdGVyOwor
CWRybV9mYmRldl9nZW5lcmljX3NldHVwKCZ1ZGwtPmRybSwgMCk7CiAKIAlyZXR1cm4gMDsKIAot
ZXJyX2RybV9kZXZfdW5yZWdpc3RlcjoKLQlkcm1fZGV2X3VucmVnaXN0ZXIoJnVkbC0+ZHJtKTsK
IGVycl9mcmVlOgogCWRybV9kZXZfcHV0KCZ1ZGwtPmRybSk7CiAJcmV0dXJuIHI7Ci0tIAoyLjI2
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
