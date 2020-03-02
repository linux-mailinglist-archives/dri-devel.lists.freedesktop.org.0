Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 492F2176710
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF036E891;
	Mon,  2 Mar 2020 22:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8D86E891
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:27:03 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z11so1828551wro.9
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qGoGSbTNkZFx5tgvwlztmnRpHWHN6b2LbTM3vMG5+84=;
 b=OHB1yhJJQyPF9RAQLH9w/VcFkrWvYh2TZ1Trln+UpTqesvCShoqQC8+YnquSV6Wgft
 PygiY2PCq3B3nwWU6ZGFDOpYB38tNACZk/HHJdOu+xR/3QPR1gPnYYbmYnBLkWBNpwWF
 MUZG3+80XPk2rB43z7JJaV1bDhcmzbxKLuQKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qGoGSbTNkZFx5tgvwlztmnRpHWHN6b2LbTM3vMG5+84=;
 b=L0oL+1DH+VN5pcdWeDl8Wfmm0ntWMeKh3ya1XmarKoO5LhDVngTuvulYOlohCUzq6M
 zTFXMpvYyvOi7qUU0wx2rSqqFCa3sWTHRFhkX6GrgVI7lqSaR8QiPSGW4V7TYfq2AL5y
 iRabkQ/L45HdymrL+7QIIH07BxV0z9oR2uM9wSrKF0FO3ghXWQ21qe3/e/3PP/CWsNS7
 SeEvoRTrzDXBGps6w2Yzt01jBimTKVtwT+HrP4NV0gzjUAME2AQd4ZDRyWq2qEGco9DT
 lGxRGofokC7HdtzjfFhz9hoL8xmBOQcEB0t2A0qQZPEc/5Nr/6KnXq9ME0diPNSuiXt+
 4agA==
X-Gm-Message-State: ANhLgQ2QLhxoO5pRKlHzu2DW891EyXSQMhr1bTpl9bpEWa5H90gqXtsH
 gdgkfErqptQs5O/l4upehzHrBVV9hVI=
X-Google-Smtp-Source: ADFU+vsqOzAhs7HgIODTU4McCOgUs//E8Qeu4Bq2P4bSyyWOHs2d233jK+jilxH9Rkb2bX/aasSjdA==
X-Received: by 2002:a5d:5609:: with SMTP id l9mr1554664wrv.48.1583188021723;
 Mon, 02 Mar 2020 14:27:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:27:01 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 16/51] drm/ingenic: Use drmm_add_final_kfree
Date: Mon,  2 Mar 2020 23:25:56 +0100
Message-Id: <20200302222631.3861340-17-daniel.vetter@ffwll.ch>
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With this we can drop the final kfree from the release function.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 9dfe7cb530e1..e2c832eb4e9a 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -23,6 +23,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_irq.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_plane.h>
@@ -490,11 +491,8 @@ static irqreturn_t ingenic_drm_irq_handler(int irq, void *arg)
 
 static void ingenic_drm_release(struct drm_device *drm)
 {
-	struct ingenic_drm *priv = drm_device_get_priv(drm);
-
 	drm_mode_config_cleanup(drm);
 	drm_dev_fini(drm);
-	kfree(priv);
 }
 
 static int ingenic_drm_enable_vblank(struct drm_crtc *crtc)
@@ -639,6 +637,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 		kfree(priv);
 		return ret;
 	}
+	drmm_add_final_kfree(drm, priv);
 
 	drm_mode_config_init(drm);
 	drm->mode_config.min_width = 0;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
