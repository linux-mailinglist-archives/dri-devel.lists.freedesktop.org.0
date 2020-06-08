Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBFC1F212F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 23:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704A56E99A;
	Mon,  8 Jun 2020 21:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31816E59B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 21:05:37 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id z1so15959716qtn.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 14:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EzthTjcENHrX3tITbBxwAqNbU6Xj4UipKRWTfNqnL+o=;
 b=bgc6BHvCUoJE1qdmgXsto7Z68feJbJp13cEXK0earcTUj+yjG6mWNGFv4eWC9f5rme
 gh6CIZHNFRuEC4BkJn1gYZRp9ltYcFiJxWyNqUDe44dZTFWcUtwXrXSWd7RG0VFken1R
 ahHX3yMVwTYYAr2lMlVbnaAeUvT8WBeTDpdOuBac1dEHikZCklphUDS4Iqz/4hvY3QYh
 BRrw+IYABTPGnY+s/JN6+qIexxlNPJWD8CC1k6YTRXH+6y9v+h2ytgTcZ1g6+oX1ne9O
 0Z06Od9CauPVYFn+m2kA6SyDitLDb6VPpPj+c6/HemAanMCSn2n/EG0T62D6H6cV4qos
 DQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EzthTjcENHrX3tITbBxwAqNbU6Xj4UipKRWTfNqnL+o=;
 b=Pmug9SZ6fjXgh5+p80XfenczVac6A4SwoPaB5jMd8VTO32lQk86won1JAN/Dg98yca
 +ouCaH2hhxRb/Pu8Mi0vo1JKNhYpj95GXC6Y8+ri3UKYCORme3sx4PxeScYHPPKLkC9h
 pULhhIPR0WW93/lIU/gHBW2ZOepeST47MHpIesbJSHIJjPi6zEMLfkg/hWptVMmX9XVz
 AHq4z1uzASWB+8mwerchk4SOrxAHXa3U+Ei6ph7NJPuA1QkDvOG3BiYDSxRX25FxY1J6
 E+Gcgjrqjx2dZ1NVXnTkckvXhJkG5FtiUrt+3bQLYh3jihyh4wQ6Ywu7mgpibGZUyB/b
 Yi2g==
X-Gm-Message-State: AOAM5319dPlozUtNK78EOIdtHMwBmIjcGkXASC/dBr82Jg0/8GFiMFEr
 OeWu+wu29SiS8LasEcXuBcPM29oVkJo=
X-Google-Smtp-Source: ABdhPJz7OFpjGtNLCnywlgTFICvYLryTMF7ZufFlXArk5WTY8GEQ6QiPri1R0M/FCn4jm9pwFeQ1nw==
X-Received: by 2002:aed:30cf:: with SMTP id 73mr7419561qtf.81.1591650335170;
 Mon, 08 Jun 2020 14:05:35 -0700 (PDT)
Received: from localhost (mobile-166-173-249-24.mycingular.net.
 [166.173.249.24])
 by smtp.gmail.com with ESMTPSA id h202sm1934074qke.69.2020.06.08.14.05.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Jun 2020 14:05:34 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 03/13] drm/i915/utils: Replace dev_printk with drm helpers
Date: Mon,  8 Jun 2020 17:04:53 -0400
Message-Id: <20200608210505.48519-4-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608210505.48519-1-sean@poorly.run>
References: <20200608210505.48519-1-sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 tzimmermann@suse.de, Rodrigo Vivi <rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Use drm logging helpers to add support for the upcoming tracefs
implementation.

Signed-off-by: Sean Paul <seanpaul@chromium.org>

Changes in v5:
-Added to the set
---
 drivers/gpu/drm/i915/i915_utils.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_utils.c b/drivers/gpu/drm/i915/i915_utils.c
index f42a9e9a0b4f..99499c0885cf 100644
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
