Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1E846A9F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E6F89736;
	Fri, 14 Jun 2019 20:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964D68955D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:51 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k8so5227900eds.7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c8nP1OQ6G0Sp5ISO73o32Z9psXparAm2zG0NoUdyIz0=;
 b=h33qU0UZuBto/de6smMmcbyeg6pFwBVovFJcbDtEbug4nhoed5/aKXhgeaioqsj5rW
 4EKlbbr5xXrC+GQZehizKtxC1N8iXW1NzWk6qbl0OFNWBOU/m1w3r/8ri9mIbe+O+kJg
 B5I/eIGkCQZSGA+blFjrmXH8bGKcWziLBL42QcZcQuGPAEPC+lqf+mCCSwmhPfCTdpru
 K4hhwn0cpsLPYqzK5m7E0Fbi5BcTawflU0og8a8oNSxgNy8SLzSnQExB3aE/mQll6CnK
 CcS+bA5Iq9k727X5QndRLBA9gQozR6/ml1xcgNdLYpkuaNMR3ZPufZnzd7hrimj85oxW
 FN6A==
X-Gm-Message-State: APjAAAWZVxCxH5ycNV7dzbbukJxkbug45Lini42h4q3SGr9DRaYBXAob
 ZN9x/lCzMME2aTU7hN0neU11u9614aQ=
X-Google-Smtp-Source: APXvYqxaCuu6YBvxt8pmSExnLQ9FvSQBIly5lGJU5l2qIMpC4dbZysCYJXANqCYQHES1MLm9W0bQdA==
X-Received: by 2002:a50:b13b:: with SMTP id k56mr62378046edd.192.1560544609250; 
 Fri, 14 Jun 2019 13:36:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:48 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 23/59] drm/nouveau: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:39 +0200
Message-Id: <20190614203615.12639-24-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c8nP1OQ6G0Sp5ISO73o32Z9psXparAm2zG0NoUdyIz0=;
 b=IiMLowykDV2ETz+pZWVNtOho4ohoeWUj+nZPCKYSm0e5KT8tMQVHB1jWsiAfkUV9sr
 MI7fRZly5uwElzrMleYtgv5RSaZrzW9JFoEs7Kur7tIcnDyTjo4aJBkbcGCCroZOsvEX
 2N2/VD5l/TKGIci5oRk9ZdOX6ugOnVjvROaU0=
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
Cc: nouveau@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBCZW4gU2tlZ2dz
IDxic2tlZ2dzQHJlZGhhdC5jb20+CkNjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwot
LS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMgfCAyIC0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2RybS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0u
YwppbmRleCA4Y2IxNzRmOTU0NDguLjQzNzdiODM2MjY1ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2RybS5jCkBAIC0xMTMwLDggKzExMzAsNiBAQCBkcml2ZXJfc3R1YiA9IHsKIAog
CS5wcmltZV9oYW5kbGVfdG9fZmQgPSBkcm1fZ2VtX3ByaW1lX2hhbmRsZV90b19mZCwKIAkucHJp
bWVfZmRfdG9faGFuZGxlID0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUsCi0JLmdlbV9wcmlt
ZV9leHBvcnQgPSBkcm1fZ2VtX3ByaW1lX2V4cG9ydCwKLQkuZ2VtX3ByaW1lX2ltcG9ydCA9IGRy
bV9nZW1fcHJpbWVfaW1wb3J0LAogCS5nZW1fcHJpbWVfcGluID0gbm91dmVhdV9nZW1fcHJpbWVf
cGluLAogCS5nZW1fcHJpbWVfcmVzX29iaiA9IG5vdXZlYXVfZ2VtX3ByaW1lX3Jlc19vYmosCiAJ
LmdlbV9wcmltZV91bnBpbiA9IG5vdXZlYXVfZ2VtX3ByaW1lX3VucGluLAotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
