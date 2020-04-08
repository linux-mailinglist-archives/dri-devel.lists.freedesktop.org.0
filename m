Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806361A1D62
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 10:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF056E9B8;
	Wed,  8 Apr 2020 08:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86D36E9B4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 08:26:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4B7D7AE6D;
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
Subject: [PATCH v2 07/10] drm/tilcdc: Set up fbdev after fully registering
 device
Date: Wed,  8 Apr 2020 10:26:38 +0200
Message-Id: <20200408082641.590-8-tzimmermann@suse.de>
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

R2VuZXJpYyBmYmRldiBzdXBwb3J0IGlzIGEgRFJNIGNsaWVudC4gU2V0IGl0IHVwIGFmdGVyIGZ1
bGx5IHJlZ2lzdGVyaW5nCnRoZSBuZXcgRFJNIGRldmljZS4KClNpZ25lZC1vZmYtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpBY2tlZC1ieTogSnlyaSBTYXJoYSA8
anNhcmhhQHRpLmNvbT4KUmV2aWV3ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25u
ZXMub3JnPgpBY2tlZC1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfZHJ2LmMgfCAzICstLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS90aWxjZGMvdGlsY2RjX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxj
ZGNfZHJ2LmMKaW5kZXggNzhjMTg3N2QxM2E4My4uYTVlOWVlNGM3ZmJmNCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3RpbGNkYy90aWxjZGNfZHJ2LmMKQEAgLTM5MCwxMCArMzkwLDkgQEAgc3RhdGljIGludCB0aWxj
ZGNfaW5pdChzdHJ1Y3QgZHJtX2RyaXZlciAqZGRydiwgc3RydWN0IGRldmljZSAqZGV2KQogCXJl
dCA9IGRybV9kZXZfcmVnaXN0ZXIoZGRldiwgMCk7CiAJaWYgKHJldCkKIAkJZ290byBpbml0X2Zh
aWxlZDsKKwlwcml2LT5pc19yZWdpc3RlcmVkID0gdHJ1ZTsKIAogCWRybV9mYmRldl9nZW5lcmlj
X3NldHVwKGRkZXYsIGJwcCk7Ci0KLQlwcml2LT5pc19yZWdpc3RlcmVkID0gdHJ1ZTsKIAlyZXR1
cm4gMDsKIAogaW5pdF9mYWlsZWQ6Ci0tIAoyLjI2LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
