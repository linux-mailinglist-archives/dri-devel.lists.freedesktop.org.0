Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF211688E1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6006F56F;
	Fri, 21 Feb 2020 21:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AEF6F528
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:04:17 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q9so3152879wmj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 13:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZMfA9aWw1LYmrFFdoc2a+Paav2KuYGb9y2DZvr6Ld/Y=;
 b=g3UdLycTZRD8eeM5HSVKb7Alhdfbqm49HlpEfjUk6LOpVS1Ffp4p2RIj0PubzXi5P9
 6Wa+z1O7LOV5f3HFlmXwR+XbEeyZL1Vvig0eb37FFNGX4zIivB+wIeswU18TurO5bJso
 TQE+68ROrlv9WG/cfwVlkqTNEaKuqfoGINntU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZMfA9aWw1LYmrFFdoc2a+Paav2KuYGb9y2DZvr6Ld/Y=;
 b=NLYoKMQZ3gUU08lpDNERMw7nCZXCTptBs1c5chL6M21mVZqnaPLlrbmcF2Bno6eug4
 YzUr8UFZJ6DWU/uQk6oBgySEFtb7FjlnzBNJWxt3x+99fNHDAHTQ/lWWbZZxiCx4RMkP
 ivzlmxJ1I1+BMjFg4HbWyVWSLFZZ9xkbVlwKO1YNRwW6DSVPnxlLHg3h+FlGFoIsjkwM
 zxtXiUnWGHAPNgFPAQskvtjnEeXbu03TikOw14XbFUnIFw5WoaDqkYknaWmQgKVIYtwa
 Cx91DHdTUb48sArYbDqxGoeiYf/1fpTLbf2eIckD7OMqj2yerB8fuvOFx49B/9PSeGUx
 xqvQ==
X-Gm-Message-State: APjAAAUVUPw+K6TNE4cWgA+TGtZiEDPYcCOiaGYy7UVym49VnY966L1J
 ZMttmFeV7RTt4LJdxIE7LvCFd4hXod0=
X-Google-Smtp-Source: APXvYqzmUOd6nPukL54uGIe88r3O8OEPKDecAxQQve/5H3z4OSQr84J5cLIUUx7ml4UnPRNvKdgTuw==
X-Received: by 2002:a1c:e388:: with SMTP id a130mr5608079wmh.176.1582319056102; 
 Fri, 21 Feb 2020 13:04:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 13:04:15 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 36/51] drm/rcar-du: Drop explicit drm_mode_config_cleanup call
Date: Fri, 21 Feb 2020 22:03:04 +0100
Message-Id: <20200221210319.2245170-37-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's right above the drm_dev_put().

This is made possible by a preceeding patch which added a drmm_
cleanup action to drm_mode_config_init(), hence all we need to do to
ensure that drm_mode_config_cleanup() is run on final drm_device
cleanup is check the new error code for _init().

Aside: Another driver with a bit much devm_kzalloc, which should
probably use drmm_kzalloc instead ...

v2: Explain why this cleanup is possible (Laurent).

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 1 -
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 654e2dd08146..3e67cf70f040 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -530,7 +530,6 @@ static int rcar_du_remove(struct platform_device *pdev)
 	drm_dev_unregister(ddev);
 
 	drm_kms_helper_poll_fini(ddev);
-	drm_mode_config_cleanup(ddev);
 
 	drm_dev_put(ddev);
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index fcfd916227d1..dcdc1580b511 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -712,7 +712,9 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	unsigned int i;
 	int ret;
 
-	drm_mode_config_init(dev);
+	ret = drm_mode_config_init(dev);
+	if (ret)
+		return ret;
 
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
