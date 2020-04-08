Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E2F1A1D5F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 10:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3E46E9B2;
	Wed,  8 Apr 2020 08:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548DE6E9B0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 08:26:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A2752AE4E;
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
Subject: [PATCH v2 03/10] drm/kirin: Set up fbdev after fully registering
 device
Date: Wed,  8 Apr 2020 10:26:34 +0200
Message-Id: <20200408082641.590-4-tzimmermann@suse.de>
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
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpSZXZpZXdlZC1ieTogTm9yYWxmIFRy
w7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+CkFja2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4
ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmlu
X2RybV9kcnYuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmlu
L2tpcmluX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5f
ZHJtX2Rydi5jCmluZGV4IGQzMTQ1YWU4NzdkNzQuLjk4MTg1OGNjOGQyYjUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5jCkBAIC0yNzcsOCAr
Mjc3LDYgQEAgc3RhdGljIGludCBraXJpbl9kcm1fYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJ
aWYgKHJldCkKIAkJZ290byBlcnJfa21zX2NsZWFudXA7CiAKLQlkcm1fZmJkZXZfZ2VuZXJpY19z
ZXR1cChkcm1fZGV2LCAzMik7Ci0KIAkvKiBjb25uZWN0b3JzIHNob3VsZCBiZSByZWdpc3RlcmVk
IGFmdGVyIGRybSBkZXZpY2UgcmVnaXN0ZXIgKi8KIAlpZiAoZHJpdmVyX2RhdGEtPnJlZ2lzdGVy
X2Nvbm5lY3RzKSB7CiAJCXJldCA9IGtpcmluX2RybV9jb25uZWN0b3JzX3JlZ2lzdGVyKGRybV9k
ZXYpOwpAQCAtMjg2LDYgKzI4NCw4IEBAIHN0YXRpYyBpbnQga2lyaW5fZHJtX2JpbmQoc3RydWN0
IGRldmljZSAqZGV2KQogCQkJZ290byBlcnJfZHJtX2Rldl91bnJlZ2lzdGVyOwogCX0KIAorCWRy
bV9mYmRldl9nZW5lcmljX3NldHVwKGRybV9kZXYsIDMyKTsKKwogCXJldHVybiAwOwogCiBlcnJf
ZHJtX2Rldl91bnJlZ2lzdGVyOgotLSAKMi4yNi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
