Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4008D46AA4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C068973E;
	Fri, 14 Jun 2019 20:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC31895EE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:06 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m10so5242897edv.6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C7tdG/pv4rSl837azf57SurCjIHrXCJnzPDUpmkdCbw=;
 b=cBEcm+QiQxXet40nl3ZR/dLVwJnGthdP8rXGSMtrIRue1SVvNr4SDrtPrLdleyVQVV
 ygbyQqq3d/7oem85k+396ZuJPGs5VvNAH/cClcNpNib+YSv4lKrHD52ooNPWgpiqtNf+
 PFtzASxBzFX1NsmYZoG6tqSqrigZJ6T7O1p2hUtaoZUeNAge9G4dbdylQ2/Q6+iAY56R
 CNJd2tdiMIikT44lWe8o2u5vDiv1AMxaWeuX5XkKE0L1rwChM0Hww4j3e6Yt63KXbuNZ
 Uo7pGvb5POFzb9s00sZB0Gd73RcOTPCo+pZ/UimHAuE47k8eftE2nfkDgM2ug7zAWLvP
 2iDw==
X-Gm-Message-State: APjAAAW5I54zVN8HvSFeyGGAs+K18dWu+UjlaJC8K5+1gHPNZCi/AuPb
 6KdzijA+ls2SliBRD28Yz8itAXxIMbw=
X-Google-Smtp-Source: APXvYqxdBJGBhObKfHs8XgeedvC6LVDrZIrkvvb18utH6SUv7sDVxwFDK7vQcUdHKpR2Q3YKf6YL3w==
X-Received: by 2002:a50:aeaf:: with SMTP id
 e44mr105603760edd.239.1560544623591; 
 Fri, 14 Jun 2019 13:37:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:03 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 36/59] drm/vgem: Drop drm_gem_prime_export
Date: Fri, 14 Jun 2019 22:35:52 +0200
Message-Id: <20190614203615.12639-37-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C7tdG/pv4rSl837azf57SurCjIHrXCJnzPDUpmkdCbw=;
 b=J/qwZA91YWl7LBkB98/9l0q1VnnMpCP5inGvB2uI8eaonob5ucWS+7+MFU8lJLg3fe
 uzGhpqC/LY8wk9ef44qXRcNllrKgPBieMz89lfPgQPNv9qr1Z0FBT8iJj+5tvAOq1COL
 VaRUKTgNgTguYqBys5ih/+ovrvQw2qSoAoqLw=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3ZnZW0vdmdlbV9kcnYuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3ZnZW0vdmdlbV9kcnYuYwppbmRleCA2OGMzNDBjZmRlNTEuLmQ1YWI2ZTQ2YzI0
MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZnZW0vdmdlbV9kcnYuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jCkBAIC00NDUsNyArNDQ1LDYgQEAgc3RhdGljIHN0
cnVjdCBkcm1fZHJpdmVyIHZnZW1fZHJpdmVyID0gewogCS5nZW1fcHJpbWVfcGluID0gdmdlbV9w
cmltZV9waW4sCiAJLmdlbV9wcmltZV91bnBpbiA9IHZnZW1fcHJpbWVfdW5waW4sCiAJLmdlbV9w
cmltZV9pbXBvcnQgPSB2Z2VtX3ByaW1lX2ltcG9ydCwKLQkuZ2VtX3ByaW1lX2V4cG9ydCA9IGRy
bV9nZW1fcHJpbWVfZXhwb3J0LAogCS5nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlID0gdmdlbV9w
cmltZV9pbXBvcnRfc2dfdGFibGUsCiAJLmdlbV9wcmltZV9nZXRfc2dfdGFibGUgPSB2Z2VtX3By
aW1lX2dldF9zZ190YWJsZSwKIAkuZ2VtX3ByaW1lX3ZtYXAgPSB2Z2VtX3ByaW1lX3ZtYXAsCi0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
