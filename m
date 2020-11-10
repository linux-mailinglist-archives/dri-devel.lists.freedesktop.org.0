Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5512AD1F5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 10:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024A889654;
	Tue, 10 Nov 2020 09:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A312389654
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 09:01:24 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by xavier.telenet-ops.be with bizsmtp
 id qZ1M2300X4C55Sk01Z1Moc; Tue, 10 Nov 2020 10:01:22 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1kcPWj-0016f1-HT; Tue, 10 Nov 2020 10:01:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1kcPWi-00BBu9-N3; Tue, 10 Nov 2020 10:01:20 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/fb_helper: Use min_t() to handle size_t and unsigned long
Date: Tue, 10 Nov 2020 10:01:19 +0100
Message-Id: <20201110090119.2667326-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gYXJtMzI6CgogICAgZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYzogSW4gZnVuY3Rp
b24g4oCYZmJfcmVhZF9zY3JlZW5fYmFzZeKAmToKICAgIGluY2x1ZGUvbGludXgvbWlubWF4Lmg6
MTg6Mjg6IHdhcm5pbmc6IGNvbXBhcmlzb24gb2YgZGlzdGluY3QgcG9pbnRlciB0eXBlcyBsYWNr
cyBhIGNhc3QKICAgIC4uLgogICAgZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYzoyMDQx
OjIyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYbWlu4oCZCiAgICAgMjA0MSB8ICBz
aXplX3QgYWxsb2Nfc2l6ZSA9IG1pbihjb3VudCwgUEFHRV9TSVpFKTsKCSAgfCAgICAgICAgICAg
ICAgICAgICAgICBefn4KICAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmM6IEluIGZ1
bmN0aW9uIOKAmGZiX3dyaXRlX3NjcmVlbl9iYXNl4oCZOgogICAgaW5jbHVkZS9saW51eC9taW5t
YXguaDoxODoyODogd2FybmluZzogY29tcGFyaXNvbiBvZiBkaXN0aW5jdCBwb2ludGVyIHR5cGVz
IGxhY2tzIGEgY2FzdAogICAgLi4uCiAgICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5j
OjIxMTU6MjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhtaW7igJkKICAgICAyMTE1
IHwgIHNpemVfdCBhbGxvY19zaXplID0gbWluKGNvdW50LCBQQUdFX1NJWkUpOwoJICB8ICAgICAg
ICAgICAgICAgICAgICAgIF5+fgoKSW5kZWVkLCBvbiAzMi1iaXQgc2l6ZV90IGlzICJ1bnNpZ25l
ZCBpbnQiLCBub3QgInVuc2lnbmVkIGxvbmciLgoKRml4ZXM6IDIyMmVjNDVmNGM2OWRmYTggKCJk
cm0vZmJfaGVscGVyOiBTdXBwb3J0IGZyYW1lYnVmZmVycyBpbiBJL08gbWVtb3J5IikKU2lnbmVk
LW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KLS0t
CkludGVyZXN0aW5nbHksIHRoZSBjb21taXQgbG9nIGNsYWltcyB2NyBjaGFuZ2VkOgoKICAgIHVz
ZSBtaW5fdChzaXplX3QsKSAoa2VybmVsIHRlc3Qgcm9ib3QpCi0tLQogZHJpdmVycy9ncHUvZHJt
L2RybV9mYl9oZWxwZXIuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hl
bHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwppbmRleCAwMWJhMWRhMjg1
MTE2MzczLi4yNWVkZjY3MDg2N2M2Zjc5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZiX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMKQEAgLTIw
MzgsNyArMjAzOCw3IEBAIHN0YXRpYyBzc2l6ZV90IGZiX3JlYWRfc2NyZWVuX2Jhc2Uoc3RydWN0
IGZiX2luZm8gKmluZm8sIGNoYXIgX191c2VyICpidWYsIHNpemVfCiAJCQkJICAgbG9mZl90IHBv
cykKIHsKIAljb25zdCBjaGFyIF9faW9tZW0gKnNyYyA9IGluZm8tPnNjcmVlbl9iYXNlICsgcG9z
OwotCXNpemVfdCBhbGxvY19zaXplID0gbWluKGNvdW50LCBQQUdFX1NJWkUpOworCXNpemVfdCBh
bGxvY19zaXplID0gbWluX3Qoc2l6ZV90LCBjb3VudCwgUEFHRV9TSVpFKTsKIAlzc2l6ZV90IHJl
dCA9IDA7CiAJaW50IGVyciA9IDA7CiAJY2hhciAqdG1wOwpAQCAtMjExMiw3ICsyMTEyLDcgQEAg
c3RhdGljIHNzaXplX3QgZmJfd3JpdGVfc2NyZWVuX2Jhc2Uoc3RydWN0IGZiX2luZm8gKmluZm8s
IGNvbnN0IGNoYXIgX191c2VyICpidWYKIAkJCQkgICAgbG9mZl90IHBvcykKIHsKIAljaGFyIF9f
aW9tZW0gKmRzdCA9IGluZm8tPnNjcmVlbl9iYXNlICsgcG9zOwotCXNpemVfdCBhbGxvY19zaXpl
ID0gbWluKGNvdW50LCBQQUdFX1NJWkUpOworCXNpemVfdCBhbGxvY19zaXplID0gbWluX3Qoc2l6
ZV90LCBjb3VudCwgUEFHRV9TSVpFKTsKIAlzc2l6ZV90IHJldCA9IDA7CiAJaW50IGVyciA9IDA7
CiAJdTggKnRtcDsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
