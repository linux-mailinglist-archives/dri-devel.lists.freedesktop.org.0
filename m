Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AFD172693
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174F76E96C;
	Thu, 27 Feb 2020 18:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E15D6E954
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:16:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id e8so4641149wrm.5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TlHdrbsyC/mfyP4++XXh5/25J/JwSBrSlwzglXnJP+c=;
 b=UPP9LgY8Vdna3R+aI0xK3I7QBZog2HmGkGAS9WMMpbFiRTYviK9imUvhrsT7E23/lD
 A78TTurA4/9PQzMg3DMcFmV+c0ReCFRpiLGolMUmdUaHVlci+xgL5tz6usQSHuFr42nZ
 WnPDoqFIQAU6gZHpDINmLBkxdoemk0AisFmhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TlHdrbsyC/mfyP4++XXh5/25J/JwSBrSlwzglXnJP+c=;
 b=mvcsH8iGkHxEYXfxdfw+Vc6ZFkWhHJ5ktBDsT3xlqhoIhpnvOssznBhmqYhIgBabAu
 43LHMUEWJsOLCE70WqCps77EKoAV/b1k4KHk3rNJDV7qBaAgTJflU3HLtyX530DXwzLy
 IidSlNP0s3hA42HbyxhPpVqHvKrOA7wk4PLPbtA96qNiCLlW78otKlgcysbXe0nINnqR
 7kgFqzlpLtXIu3xNph3qKQNSXlCJdk4UXHeKe7kuJlxG/taIeIYw6haS6nf2FVROzj49
 Vxm6Zq4jzSDncHDcgRXRYWo9809TCxB9z7D9AX4v1Y/UQdnjyt67atQ4H+ot+/wdxh0f
 VT9w==
X-Gm-Message-State: APjAAAXTjsHnQqmAlXag6XC4jx8E9s3Sl/U5TupBSq2Q3ENSrFlIZ+TY
 y/3u/RHbp3sBpAHAhrWbhm9d8ndHHOI=
X-Google-Smtp-Source: APXvYqwiM+wtJPIsYmQztMs7ranTz1gKaOvyicH2BASjWxNT7PRpKDYZIk2IkpQjdzm4h5wnvZi8IQ==
X-Received: by 2002:a5d:46c4:: with SMTP id g4mr149471wrs.154.1582827368891;
 Thu, 27 Feb 2020 10:16:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:16:08 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 31/51] drm/ingenic: Drop explicit drm_mode_config_cleanup call
Date: Thu, 27 Feb 2020 19:15:02 +0100
Message-Id: <20200227181522.2711142-32-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
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
 m.felsch@pengutronix.de, Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
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

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 192aaa4421a3..f5689521428e 100644
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
+	ret = drm_mode_config_init(drm);
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
