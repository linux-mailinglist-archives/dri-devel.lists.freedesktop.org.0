Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D021688E9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:05:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C336F56C;
	Fri, 21 Feb 2020 21:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57A96F53E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:04:10 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c84so3309531wme.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 13:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lR2wxhEMO1iAwv/lDViPlGyIqGuT/3YAbqqQkhbFVx4=;
 b=SZWxi7MUcTSHimEAOGAwKrWJQwh3t4tMYGyioxQogk/yeJid5aGXTUwogsRJW2I83D
 QsWvElZyzgB4qkUSUUDUyQVjJ8l+5vc7K/rH0tiz6hjPlxJmp5q2tYYTqEGHwCA3T8QB
 v3QyFZvZSMYUZUHmSoh0xl7wUhPDmHHHiKF34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lR2wxhEMO1iAwv/lDViPlGyIqGuT/3YAbqqQkhbFVx4=;
 b=G9VfbuGI9ucrdXvKNvc5HU7N4bLuVdQSIm2o95jmeGQ8EtK8e2kuRMuxbihigWTIeV
 JrZ6VarwxRxul5+XgPC79DVig3ksOCKV7Brp1u16t7z3mrn1V0+ebd1nSETFtgsqTT1b
 XFHWMyzpgtsrgr/bYH+UVg/bA7D7MiWFCoLeHMOkkfalx5cDrL7D8q2/s0AHuYCav9DA
 JxMxJD2iiukrY8hNma3erm+SIb6ULqj9kT/jOcRzPd3zDW0RhHK0llc3H0RP0TlchbNU
 hBVrQwddEvT+Vgy//lzvFIUoU5S7c/mal8hFpBlIhPFwJMpnxZH2wWPe7UkpJPtmbCZ6
 H8jQ==
X-Gm-Message-State: APjAAAXbyVbTEgoaCRbMzIZWMpo6ChCyr01URzSt4F8guoa4I2iDKZ+6
 aCvse+AqM1gAhxyMLpnwpT+PtbOqrV4=
X-Google-Smtp-Source: APXvYqwk/xDS+fVVmlFGAqvh/znVHgSn/w+ADTca839zhuNxeVbAIsRbQXHU81cKPdDNy3yWQG+TMA==
X-Received: by 2002:a1c:dc85:: with SMTP id t127mr6147626wmg.16.1582319049038; 
 Fri, 21 Feb 2020 13:04:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 13:04:08 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 31/51] drm/ingenic: Drop explicit drm_mode_config_cleanup call
Date: Fri, 21 Feb 2020 22:02:59 +0100
Message-Id: <20200221210319.2245170-32-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
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
index 06c195af714e..587369f6c0d7 100644
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
