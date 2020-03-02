Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B7517672F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A3C6E8AD;
	Mon,  2 Mar 2020 22:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFEC6E8AE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:27:20 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r17so1856814wrj.7
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ywFZ0A6ScAr0BYRwvoLwro/yhKbyU186rgvc4GABU2U=;
 b=iH4z48loEgq1P7F4fx7veTTO3I8IXdhLDBak0AekkVjDVxvts6NMz9qPdscnDYRwtZ
 zAE9M9Hqh1socLq2E6ctKbJt2q8+GJkHfkwggZGYBfS4efds4GPbYkZGwR5QU7M4w+be
 L/7V7P9U9NDVYuzKUzgRmGCTSAfX2x4VkT1sU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ywFZ0A6ScAr0BYRwvoLwro/yhKbyU186rgvc4GABU2U=;
 b=uQhS3vVltjimhu8Nq9qd1L+hISQuwbaXVSYk4ALwfuBXoMwSrDZWCSH2cg18ypE+vO
 ljyub9XRIoP7BTCxImXFp6M+W7YNcir9Dj7L77ZkvOkKl5dJj+oMzEDKxaAgqFl4RBe0
 VdQf8MLDuSxgu4o2U0cQnlH3MPwTV2gegLGnSredZHalzVb1zQXx0rMHm6leEiakpXX6
 FdNyAw+BOhRcl0sMOTIrzse1Fp0zWYlz1QKlEWxiC7x2PtDdJudXIyk7nah2oHuiSJde
 TgSnZf21PYNHOKooZOoUXhtcqPy9JIUu1RGCd7qQa/OUeniC5a4JEodKvbnA9Gg+MdWc
 gGBw==
X-Gm-Message-State: ANhLgQ2wNy0gvspyaVRd4iiEexFPEa1ZsNxt4OBVzjsDuBka/Bkl9Wli
 z4QOP6Zpyg/0OfRsvIS4gLLKSfpEpoM=
X-Google-Smtp-Source: ADFU+vtHx6duGGHy76Up8ztpZ3A7muNDhZ+V71vAcILPWPYnNEEGfoQvLeXd3FKL5oKMFDxRCxkjxg==
X-Received: by 2002:adf:fc10:: with SMTP id i16mr1583321wrr.331.1583188039145; 
 Mon, 02 Mar 2020 14:27:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:27:18 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 31/51] drm/ingenic: Drop explicit drm_mode_config_cleanup call
Date: Mon,  2 Mar 2020 23:26:11 +0100
Message-Id: <20200302222631.3861340-32-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allows us to drop the drm_driver.release callback.

This is made possible by a preceeding patch which added a drmm_
cleanup action to drm_mode_config_init(), hence all we need to do to
ensure that drm_mode_config_cleanup() is run on final drm_device
cleanup is check the new error code for _init().

v2: Explain why this cleanup is possible (Laurent).

v3: Use drmm_mode_config_init() for more clarity (Sam, Thomas)

Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Paul Cercueil <paul@crapouillou.net> (v2)
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 192aaa4421a3..a9bc6623b488 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -489,11 +489,6 @@ static irqreturn_t ingenic_drm_irq_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static void ingenic_drm_release(struct drm_device *drm)
-{
-	drm_mode_config_cleanup(drm);
-}
-
 static int ingenic_drm_enable_vblank(struct drm_crtc *crtc)
 {
 	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
@@ -537,7 +532,6 @@ static struct drm_driver ingenic_drm_driver_data = {
 	.gem_prime_mmap		= drm_gem_cma_prime_mmap,
 
 	.irq_handler		= ingenic_drm_irq_handler,
-	.release		= ingenic_drm_release,
 };
 
 static const struct drm_plane_funcs ingenic_drm_primary_plane_funcs = {
@@ -638,7 +632,10 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 	}
 	drmm_add_final_kfree(drm, priv);
 
-	drm_mode_config_init(drm);
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
 	drm->mode_config.min_width = 0;
 	drm->mode_config.min_height = 0;
 	drm->mode_config.max_width = soc_info->max_width;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
