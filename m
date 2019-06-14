Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BEA46AB8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9C889829;
	Fri, 14 Jun 2019 20:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B207789612
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:10 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k21so5264388edq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9j32mcyEpGSYjvl0TWKlQ1MrsZN0SW8RTIBE3SWgCwg=;
 b=Nr/dPBaJ30TSoJ1cYckD329WqPxrU2PRe/+OjIbvd8B60ECbEs9NFrhxm4OvW2GwEU
 P+mJCOPUtkoETLuKT4bVDl6BLWw3oZBZ7njQVadH+PIvlPaq41mpwAHzU24CRIU+mlxz
 mcdsEEKVBfmaNr1uVYXEEIRtxUkMDCmfNRoDL9ZceG9j0mMo3K++boC7b3r6mUZC5ZIs
 3NCt82Vmrj4D92F//tnDw1ueYvf+6nVU9ACDVO32TsKBfwiaxqooaRvDJFPWOOdk6bhQ
 YRFJJ3idMeHaRR01x1c2hs/Dk7vEc1SuWVmMv8kakBg9HbUCIvvAZLHqmHDYBpYF761m
 N8FQ==
X-Gm-Message-State: APjAAAXwdnYtfO5phnQfWzgUt46+J+4SKizZwAan0tkqnfORR/FPNSte
 5nrORheEUopSPWRBxCYTeWNhpOSenTc=
X-Google-Smtp-Source: APXvYqyWVWx0mezBKncyxVhHLfdJwou9pLwypnm1P08ksIfRxVllvuFRbRdlA0O5d6M2CwyF/Pw8tA==
X-Received: by 2002:a17:906:4f87:: with SMTP id
 o7mr82456706eju.281.1560544627962; 
 Fri, 14 Jun 2019 13:37:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:07 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 40/59] drm/vram-helper: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:56 +0200
Message-Id: <20190614203615.12639-41-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9j32mcyEpGSYjvl0TWKlQ1MrsZN0SW8RTIBE3SWgCwg=;
 b=LDi2tvGBTZct1S5i1KHPWdaw//4K/P/RnL1dIBUm6tIUdvMT44OlsQFrKVajbRhK9K
 RneOYha8E9O9hzcXLmE50UR/hbEAKo3+TnOWydVOE8dXukaRWawZ0UQksp7J6Gm3lluX
 FP1/T2KsUv05UMSYPPE8eTZBhN4/INmc2fQ18=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBNYWFydGVuIExh
bmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJp
cGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29y
bHkucnVuPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+CkNjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBpbmNs
dWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVy
LmggYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmgKaW5kZXggOTU4MWVhMGE0Zjdl
Li4xYTBlYTE4ZTdhNzQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxw
ZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmgKQEAgLTE0Miw4ICsx
NDIsNiBAQCBpbnQgZHJtX2dlbV92cmFtX2RyaXZlcl9nZW1fcHJpbWVfbW1hcChzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKm9iaiwKIAkJCQkgICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEp
OwogCiAjZGVmaW5lIERSTV9HRU1fVlJBTV9EUklWRVJfUFJJTUUgXAotCS5nZW1fcHJpbWVfZXhw
b3J0ID0gZHJtX2dlbV9wcmltZV9leHBvcnQsIFwKLQkuZ2VtX3ByaW1lX2ltcG9ydCA9IGRybV9n
ZW1fcHJpbWVfaW1wb3J0LCBcCiAJLmdlbV9wcmltZV9waW4JICA9IGRybV9nZW1fdnJhbV9kcml2
ZXJfZ2VtX3ByaW1lX3BpbiwgXAogCS5nZW1fcHJpbWVfdW5waW4gID0gZHJtX2dlbV92cmFtX2Ry
aXZlcl9nZW1fcHJpbWVfdW5waW4sIFwKIAkuZ2VtX3ByaW1lX3ZtYXAJICA9IGRybV9nZW1fdnJh
bV9kcml2ZXJfZ2VtX3ByaW1lX3ZtYXAsIFwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
