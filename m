Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF38F1A1D66
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 10:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249C56E9CD;
	Wed,  8 Apr 2020 08:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBF26E9B2
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 08:26:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EEB55AE52;
 Wed,  8 Apr 2020 08:26:55 +0000 (UTC)
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
Subject: [PATCH v2 05/10] drm/mediatek: Remove error check from fbdev setup
Date: Wed,  8 Apr 2020 10:26:36 +0200
Message-Id: <20200408082641.590-6-tzimmermann@suse.de>
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
IGZ1bmN0aW9uCndpbGwgcHJpbnQgYSB3YXJuaW5nLgoKdjI6CgkqIGZpeCBzdWJqZWN0IGxpbmUK
ClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpS
ZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+CkFja2VkLWJ5
OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kcnYuYyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2
LmMKaW5kZXggMmVhYTkwODBkMjUwNS4uY2U1NzAyODNiNTVmNyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZHJ2LmMKQEAgLTM0Nyw5ICszNDcsNyBAQCBzdGF0aWMgaW50IG10a19k
cm1fYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJaWYgKHJldCA8IDApCiAJCWdvdG8gZXJyX2Rl
aW5pdDsKIAotCXJldCA9IGRybV9mYmRldl9nZW5lcmljX3NldHVwKGRybSwgMzIpOwotCWlmIChy
ZXQpCi0JCURSTV9FUlJPUigiRmFpbGVkIHRvIGluaXRpYWxpemUgZmJkZXY6ICVkXG4iLCByZXQp
OworCWRybV9mYmRldl9nZW5lcmljX3NldHVwKGRybSwgMzIpOwogCiAJcmV0dXJuIDA7CiAKLS0g
CjIuMjYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
