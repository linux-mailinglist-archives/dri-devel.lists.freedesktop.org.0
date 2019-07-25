Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB9274F64
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 15:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552306E762;
	Thu, 25 Jul 2019 13:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536676E75F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 13:27:52 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id e3so50245570edr.10
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 06:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MBKx6cyaWgWK2WLms53NILAn5q7ckrpw79tN0L1qShw=;
 b=CCWYR8Xm1lCC2Kl3lMaIVzEFTbrExd2Qinyt/VLhgoEXGvdUqEOuITksO6G48LWzuZ
 nfTePMH/y0Wkom3OgAa7IwJ73RXoJHKL3wa4o/kA+z7dcIW3En+HaUFn4I6YjSLR9UZ/
 hb4cEoraRcbNSv9g9gtYwz6LVv7rCm/SQ2YEJ3DcaqCUan+WX5WHFrasZ8Ic2jBxxNPZ
 dzC621UlQBkoz81HzdcBI7w6o6ct1PzLgMh8fkI665ZZkXvbxEyep3F7XeRHyHnyFn4e
 Y6NsHPMK0MRtv/Qy2hKjTUR9YPt4Zndb0K7EaQBYd0h33gTCr+JFmz+fU+XBJlq5faPZ
 V68w==
X-Gm-Message-State: APjAAAXEJBE45DhEwoUc5XuT6TCU8Zh/W54Z6CYfieDugqu5hIkaigmq
 mbYdh/QT2oDTK2tTDI3iZqHCVNlEkXc=
X-Google-Smtp-Source: APXvYqzH1zDuSvmSxcC8X+BJdKSHF9nndVPqQn4YrsCETSU36KAispexEvCHQGm2KV6NB2kdjSxSMw==
X-Received: by 2002:a50:8bfa:: with SMTP id n55mr78749586edn.9.1564061270648; 
 Thu, 25 Jul 2019 06:27:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id l1sm13091167edr.17.2019.07.25.06.27.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 06:27:50 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/prime: Ditch gem_prime_res_obj hook
Date: Thu, 25 Jul 2019 15:26:55 +0200
Message-Id: <20190725132655.11951-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190725132655.11951-1-daniel.vetter@ffwll.ch>
References: <20190725132655.11951-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MBKx6cyaWgWK2WLms53NILAn5q7ckrpw79tN0L1qShw=;
 b=U0t2hIay5HP/cAHAyrZpr6gxpjZOs/3Gm0w+HMqxxEIEIepZvwyGmn/Nx6+PcGhd64
 o4zKA0npVMsHJzGKzi003eSF1vUrEpEcw9g3EqkVS1bz855XBn33wWDIgW2oqQ5zloWz
 FSTBirn2b9sbce8/kIowu+oy/xzLuuNlFG2vs=
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maxime Ripard <maxime.ripard@bootlin.com>, kraxel@redhat.com,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXZlcnlvbmUgaXMganVzdCB1c2luZyBnZW1fb2JqZWN0LT5yZXN2IG5vdy4KCkFja2VkLWJ5OiBH
ZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhl
bEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29s
bGFib3JhLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBp
bnRlbC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5s
YW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFy
ZEBib290bGluLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgotLS0KIERvY3Vt
ZW50YXRpb24vZ3B1L3RvZG8ucnN0ICB8ICA5IC0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2Ry
bV9wcmltZS5jIHwgIDMgLS0tCiBpbmNsdWRlL2RybS9kcm1fZHJ2LmggICAgICAgfCAxMiAtLS0t
LS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMjQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdApp
bmRleCA2ODhiNGFkYmJmNjIuLjhlOWU5NzYwZGJmNSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlv
bi9ncHUvdG9kby5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKQEAgLTE5Niwx
NSArMTk2LDYgQEAgTWlnaHQgYmUgZ29vZCB0byBhbHNvIGhhdmUgc29tZSBpZ3QgdGVzdGNhc2Vz
IGZvciB0aGlzLgogCiBDb250YWN0OiBEYW5pZWwgVmV0dGVyLCBOb3JhbGYgVHJvbm5lcwogCi1S
ZW1vdmUgdGhlIC0+Z2VtX3ByaW1lX3Jlc19vYmogY2FsbGJhY2sKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0KLVRoZSAtPmdlbV9wcmltZV9yZXNfb2JqIGNh
bGxiYWNrIGNhbiBiZSByZW1vdmVkIGZyb20gZHJpdmVycyBieSB1c2luZyB0aGUKLXJlc2VydmF0
aW9uX29iamVjdCBpbiB0aGUgZHJtX2dlbV9vYmplY3QuIEl0IG1heSBhbHNvIGJlIHBvc3NpYmxl
IHRvIHVzZSB0aGUKLWdlbmVyaWMgZHJtX2dlbV9yZXNlcnZhdGlvbl9vYmplY3Rfd2FpdCBoZWxw
ZXIgZm9yIHdhaXRpbmcgZm9yIGEgYm8uCi0KLUNvbnRhY3Q6IERhbmllbCBWZXR0ZXIKLQogaWRy
X2luaXRfYmFzZSgpCiAtLS0tLS0tLS0tLS0tLS0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9wcmltZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jCmluZGV4IGVjYTQ4
NDEwNmNjMi4uMGEyMzE2ZTBlODEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3By
aW1lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jCkBAIC04MzYsOSArODM2LDYg
QEAgc3RydWN0IGRtYV9idWYgKmRybV9nZW1fcHJpbWVfZXhwb3J0KHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqb2JqLAogCQkucmVzdiA9IG9iai0+cmVzdiwKIAl9OwogCi0JaWYgKGRldi0+ZHJpdmVy
LT5nZW1fcHJpbWVfcmVzX29iaikKLQkJZXhwX2luZm8ucmVzdiA9IGRldi0+ZHJpdmVyLT5nZW1f
cHJpbWVfcmVzX29iaihvYmopOwotCiAJcmV0dXJuIGRybV9nZW1fZG1hYnVmX2V4cG9ydChkZXYs
ICZleHBfaW5mbyk7CiB9CiBFWFBPUlRfU1lNQk9MKGRybV9nZW1fcHJpbWVfZXhwb3J0KTsKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcnYuaCBiL2luY2x1ZGUvZHJtL2RybV9kcnYuaApp
bmRleCA5OTI3ZjRmODk0ZWYuLjM4MGUxMzRjNTQxNSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0v
ZHJtX2Rydi5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9kcnYuaApAQCAtNjE4LDE4ICs2MTgsNiBA
QCBzdHJ1Y3QgZHJtX2RyaXZlciB7CiAJICovCiAJc3RydWN0IHNnX3RhYmxlICooKmdlbV9wcmlt
ZV9nZXRfc2dfdGFibGUpKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKTsKIAotCS8qKgotCSAq
IEBnZW1fcHJpbWVfcmVzX29iajoKLQkgKgotCSAqIE9wdGlvbmFsIGhvb2sgdG8gbG9vayB1cCB0
aGUgJnJlc2VydmF0aW9uX29iamVjdCBmb3IgYW4gYnVmZmVyIHdoZW4KLQkgKiBleHBvcnRpbmcg
aXQuCi0JICoKLQkgKiBGSVhNRTogVGhpcyBob29rIGlzIGRlcHJlY2F0ZWQuIFVzZXJzIG9mIHRo
aXMgaG9vayBzaG91bGQgYmUgcmVwbGFjZWQKLQkgKiBieSBzZXR0aW5nICZkcm1fZ2VtX29iamVj
dC5yZXN2IGluc3RlYWQuCi0JICovCi0Jc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqICgqZ2Vt
X3ByaW1lX3Jlc19vYmopKAotCQkJCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKTsKLQogCS8q
KgogCSAqIEBnZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlOgogCSAqCi0tIAoyLjIyLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
