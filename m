Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2878F1C8D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 18:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705086EE13;
	Wed,  6 Nov 2019 17:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8BF6EE13
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 17:36:25 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id b2so11202780ybr.8
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 09:36:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n++rl+tiHebhntlpDQiHQau0iOXTMmNNEPp6vboRBkg=;
 b=qsegFMJmtCJOzPx1DQB9NNacObJWQb5/9tLNHaI5kKSxOGEvff/GjDRtNjjqN5F3dW
 OxNO9lJLS4v9YoRUG7uhJg2lEZ5syp9mr7mVPFj3XfjzXFu40FaL+ITSrR1MBsNlTQjJ
 DQO1kHqeqbrRtrNVmwQeUmrldd5lPtbbKR8E+t6/gJG4VGUmrBZo94QH7J3h7yW8I1sp
 HhwxzE5CIKYAjhoq7UVQ4XBl95JKAvcfmiluopf7kaw7XJwJb9Vg0Jyg4nJ6NL15LuCV
 YeVViaou9QsfvJj1c9NwFXAzxudpRouNpWHsGTh/Le3393cpDRsdMDdINjAZ5OnCsExb
 hknA==
X-Gm-Message-State: APjAAAWK8IMKVf41ewUaF95R2NkNIi1ciZawccsiGh635rH6X2ZNjFCf
 Fo5zHlxVuqJnV8YufTkFiUYAGhQF9kI=
X-Google-Smtp-Source: APXvYqy/VEJtrJNe532+vwigdt+Br3OXxBIfQgSD+aM72JCz7xif9vwMw5iDB0sMBhbq+ageRNuOaQ==
X-Received: by 2002:a5b:c52:: with SMTP id d18mr3089843ybr.98.1573061783872;
 Wed, 06 Nov 2019 09:36:23 -0800 (PST)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id l1sm1361814ywh.9.2019.11.06.09.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 09:36:23 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mst: Fix up u64 division
Date: Wed,  6 Nov 2019 12:36:15 -0500
Message-Id: <20191106173622.15573-1-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n++rl+tiHebhntlpDQiHQau0iOXTMmNNEPp6vboRBkg=;
 b=AjHNvLzfyiOe4XqufjOoYjN3oY/xtNd3ZdjoBPwmpHWieBkr2kOxdR1iEbsmcrGZpS
 KGzSBLu3WJGnPXPzIjbYbrODhtIjYILJu14q9jscBn9VMiQEIaccJLcilu7ZfyHmP+8v
 jKRSWo3D27KH49Mhxrija4aGc/OIXhtOZn7H0M4zjZ4KyC2kZ/e/QfzuO2jk3/DdAwFs
 UoLFu19rPa4heXaKlmsL2A8zMdb0DAHkxgLgOa6/w6K6JdHWyzI+KxWqw7ICfhtrszKw
 BSnqSo7GtaRz5DbLfLFOClQV67YARsTTKeF2fNRKDzid7UXTADTzMXemHDbqhh9W+m5d
 psaA==
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@chromium.org>,
 Juston Li <juston.li@intel.com>, Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpVc2UgZG9fZGl2IHRvIGRp
dmlkZSByZW1fbnNlYyBpbnN0ZWFkIG9mIC8uCgpGaXhlczogMTJhMjgwYzcyODY4ICgiZHJtL2Rw
X21zdDogQWRkIHRvcG9sb2d5IHJlZiBoaXN0b3J5IHRyYWNraW5nIGZvciBkZWJ1Z2dpbmciKQpD
YzogSnVzdG9uIExpIDxqdXN0b24ubGlAaW50ZWwuY29tPgpDYzogSW1yZSBEZWFrIDxpbXJlLmRl
YWtAaW50ZWwuY29tPgpDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxod2VudGxhbkBhbWQuY29tPgpDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29y
bHkucnVuPgpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KQ2M6IE1hYXJ0ZW4gTGFu
a2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUgUmlw
YXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hy
b21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKaW5kZXggMTFhZGM0YjZjY2ZlLi5kMmRh
NWYxMTNmMTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwpAQCAtMTUxMiwx
MCArMTUxMiwxMCBAQCBfX2R1bXBfdG9wb2xvZ3lfcmVmX2hpc3Rvcnkoc3RydWN0IGRybV9kcF9t
c3RfdG9wb2xvZ3lfcmVmX2hpc3RvcnkgKmhpc3RvcnksCiAJCW5yX2VudHJpZXMgPSBzdGFja19k
ZXBvdF9mZXRjaChlbnRyeS0+YmFja3RyYWNlLCAmZW50cmllcyk7CiAJCXN0YWNrX3RyYWNlX3Nu
cHJpbnQoYnVmLCBQQUdFX1NJWkUsIGVudHJpZXMsIG5yX2VudHJpZXMsIDQpOwogCi0JCWRybV9w
cmludGYoJnAsICIgICVkICVzcyAobGFzdCBhdCAlNWxsdS4lMDZsbHUpOlxuJXMiLAorCQlkcm1f
cHJpbnRmKCZwLCAiICAlZCAlc3MgKGxhc3QgYXQgJTVsbHUuJTA2dSk6XG4lcyIsCiAJCQkgICBl
bnRyeS0+Y291bnQsCiAJCQkgICB0b3BvbG9neV9yZWZfdHlwZV90b19zdHIoZW50cnktPnR5cGUp
LAotCQkJICAgdHNfbnNlYywgcmVtX25zZWMgLyAxMDAwLCBidWYpOworCQkJICAgdHNfbnNlYywg
ZG9fZGl2KHJlbV9uc2VjLCAxMDAwKSwgYnVmKTsKIAl9CiAKIAkvKiBOb3cgZnJlZSB0aGUgaGlz
dG9yeSwgc2luY2UgdGhpcyBpcyB0aGUgb25seSB0aW1lIHdlIGV4cG9zZSBpdCAqLwotLSAKU2Vh
biBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
