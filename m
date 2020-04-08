Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3061C1A1D67
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 10:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91EC86E9C4;
	Wed,  8 Apr 2020 08:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B886E9B4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 08:27:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A1508AE72;
 Wed,  8 Apr 2020 08:26:58 +0000 (UTC)
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
Subject: [PATCH v2 09/10] drm/vboxvideo: Set up fbdev after registering device;
 remove error checks
Date: Wed,  8 Apr 2020 10:26:40 +0200
Message-Id: <20200408082641.590-10-tzimmermann@suse.de>
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
aXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS92Ym94dmlk
ZW8vdmJveF9kcnYuYwppbmRleCBkNjg1ZWMxOTdmYTA1Li4yODIzNDhlMDcxZmUzIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3Zib3h2aWRlby92Ym94X2Rydi5jCkBAIC04MiwxNCArODIsMTIgQEAgc3RhdGljIGlu
dCB2Ym94X3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0IHBjaV9k
ZXZpY2VfaWQgKmVudCkKIAlpZiAocmV0KQogCQlnb3RvIGVycl9tb2RlX2Zpbmk7CiAKLQlyZXQg
PSBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cCgmdmJveC0+ZGRldiwgMzIpOwotCWlmIChyZXQpCi0J
CWdvdG8gZXJyX2lycV9maW5pOwotCiAJcmV0ID0gZHJtX2Rldl9yZWdpc3RlcigmdmJveC0+ZGRl
diwgMCk7CiAJaWYgKHJldCkKIAkJZ290byBlcnJfaXJxX2Zpbmk7CiAKKwlkcm1fZmJkZXZfZ2Vu
ZXJpY19zZXR1cCgmdmJveC0+ZGRldiwgMzIpOworCiAJcmV0dXJuIDA7CiAKIGVycl9pcnFfZmlu
aToKLS0gCjIuMjYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
