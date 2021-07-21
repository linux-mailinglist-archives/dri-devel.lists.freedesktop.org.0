Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD623D15A8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 19:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC2D6E98A;
	Wed, 21 Jul 2021 17:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1533C6EA20
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 17:55:47 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id h9so1375203qvs.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 10:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EoDFhw4Yf6mVRdX8jKrsmhhWKMjigC0f9LN3iXc51/c=;
 b=cg7kAhAaynCph+VXjbRGMYkIG2dR1MaRPWuhPEKB64q493qSEp8cdveMLRq1Q0sCxI
 KpokDyQKkSkzRYK8QbYGv3uBHQ08Ws8KwgmZHxOh0sFmQ5uXo+weKN29q3Fg8ksuTkEW
 PedUNhtL31a55MK4Bv/34fMWYnmGfTXK1i1j5eKM+Hcat4N9U+ZmbvFX+UQY9H5RJg2z
 Ts2fsRgQmC5590a4NId2xdFAfSolJQK1zU38uazXRq0ZmGjrkPl/DKscXUY1YdXyxm9z
 inqGU4bJbLcQfy9RLGaFYuFoQVBwCxZBGLxp+tg3Za0yHS0GKOHUAeK7sl4gz8x7HYFL
 JhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EoDFhw4Yf6mVRdX8jKrsmhhWKMjigC0f9LN3iXc51/c=;
 b=hYGx3rzAglUsdClY7w//JoAFFmA6nCtZ0ktqh/wNE8qQch6ABZAuG+IQJV+hU9j1rY
 K6zZEJjGBHPOY+tx+uRdFd+Vu6wdPr0jl7/MBKXlnay0mFfuGX5hO90WkbjYqXN9m9xh
 74q/x/7NLj+VsBnfsRErLldYnSoL5DwrTLu2fPmBIDZTp50IiMqIKhRxv1SreO8XP7Bd
 CUoB88oJdIuwKottHq/4ppz9SdRHlhly3xMJarnS82yHIRSodl1StBKcurC6XIdCLAdr
 o76yfzdoD+Zj4iJ+/JwRSvjmKMbts3zwiTMjBSf9SCll8eUN9P289zYITK3/cT76DhRk
 FSOQ==
X-Gm-Message-State: AOAM532jYRR1Zf7fTv5Q86M4Ldso3kXKT9D9Ou+wSDSjVT1w/60eiwI4
 qFTzzkgE0PE6GcFykkzgYDklaFYbvv/Jrw==
X-Google-Smtp-Source: ABdhPJyj8FrqECd0pXbY6TjpkVUf88cbq/zCgT6gW/7hA77lt/WAWvkFBE37PqNFPML9rJEZ4npT4Q==
X-Received: by 2002:ad4:4bae:: with SMTP id i14mr37288441qvw.24.1626890146181; 
 Wed, 21 Jul 2021 10:55:46 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id w26sm8803374qki.6.2021.07.21.10.55.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Jul 2021 10:55:45 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch
Subject: [RESEND PATCH v6 03/14] drm/i915/utils: Replace dev_printk with drm
 helpers
Date: Wed, 21 Jul 2021 13:55:10 -0400
Message-Id: <20210721175526.22020-4-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210721175526.22020-1-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: intel-gfx@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Use drm logging helpers to add support for the upcoming tracefs
implementation.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-4-sean@poorly.run #v5

Changes in v5:
-Added to the set
Changes in v6:
-None
---
 drivers/gpu/drm/i915/i915_utils.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_utils.c b/drivers/gpu/drm/i915/i915_utils.c
index f9e780dee9de..d858c92c6997 100644
--- a/drivers/gpu/drm/i915/i915_utils.c
+++ b/drivers/gpu/drm/i915/i915_utils.c
@@ -30,10 +30,9 @@ __i915_printk(struct drm_i915_private *dev_priv, const char *level,
 	vaf.va = &args;
 
 	if (is_error)
-		dev_printk(level, kdev, "%pV", &vaf);
+		drm_dev_printk(kdev, level, "%pV", &vaf);
 	else
-		dev_printk(level, kdev, "[" DRM_NAME ":%ps] %pV",
-			   __builtin_return_address(0), &vaf);
+		drm_err(&dev_priv->drm, "%pV", &vaf);
 
 	va_end(args);
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

