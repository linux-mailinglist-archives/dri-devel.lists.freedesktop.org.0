Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3A91726A8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA036ED26;
	Thu, 27 Feb 2020 18:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8F76ECF0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:16:14 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v4so4615311wrs.8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jT8UWtmCEe7v58pjwlPCLN4e+N26kni/TNK34oplFDI=;
 b=j1urywz28vACwh8HeXCI0pWn82lWe/B/YSJs06vF1xxUNVwLwrWhvEcZUCt+X61S5B
 B4EFdH6XlxywuP9aOi6Byn4Bmz1vczC+Gp9d7e5XmInWuFB2es3F+OYp1ZA68V5cLlLG
 1rgm/RSRSw/Vw7nRvs2pGGUg/ufCKGhRrtrz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jT8UWtmCEe7v58pjwlPCLN4e+N26kni/TNK34oplFDI=;
 b=H+D8OvWQ/HhkPqV+Stw0g3P1cAqPOeD2/vILSV+mgk6R5ZI1iaSZIAtsjF2ClDea84
 j4ia6BEUoxEMyzBDz+IJ0/C01M0vbtGcMZs3mKYxxsg6eoP/iM/H/U4tZx3wZOdFeJIl
 EUSk/Nfs9Z60N527xwzl8kQwezN1ry53ybsBnWF2s+CAwwf7niK3ZLgZPvm0hxCr38S5
 mPscYI4QyrzNxZeMImX7NGAVZobyBSvhqsnXFeq+0Lipji5KdNRxVfx2DDb2iD8oPEfI
 6pVrc8Wfela8Vj5OM4ijWjkXLTfkz5QuFWHBSUEa6YacP2vNOkzbuY6NzlJbKKY+uYfY
 NZSw==
X-Gm-Message-State: APjAAAVWTrKL1yWSEWQXWc4o9u4zCbm5qMPBi9nwSmUWQr1esyVEFo1L
 pvAaQXw4zAtShnYS6XVyYFQF0mB6NYY=
X-Google-Smtp-Source: APXvYqwp8W10k7C5K+ykKuRFLORaJou4Cd5K/QJEEhZlzQs0FVvABfEDei7QmchEa6j8YPIsywTXaQ==
X-Received: by 2002:adf:fc08:: with SMTP id i8mr153646wrr.104.1582827372723;
 Thu, 27 Feb 2020 10:16:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:16:12 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 34/51] drm/meson: Drop explicit drm_mode_config_cleanup call
Date: Thu, 27 Feb 2020 19:15:05 +0100
Message-Id: <20200227181522.2711142-35-daniel.vetter@ffwll.ch>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 m.felsch@pengutronix.de, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kevin Hilman <khilman@baylibre.com>, Daniel Vetter <daniel.vetter@intel.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's right above the drm_dev_put().

This is made possible by a preceeding patch which added a drmm_
cleanup action to drm_mode_config_init(), hence all we need to do to
ensure that drm_mode_config_cleanup() is run on final drm_device
cleanup is check the new error code for _init().

Aside: This driver gets its devm_ stuff all wrong wrt drm_device and
anything hanging off that. Not the only one unfortunately.

v2: Explain why this cleanup is possible (Laurent).

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/meson/meson_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index b5f5eb7b4bb9..ae94d14ab7bc 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -284,7 +284,9 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	/* Remove early framebuffers (ie. simplefb) */
 	meson_remove_framebuffers();
 
-	drm_mode_config_init(drm);
+	ret = drm_mode_config_init(drm);
+	if (ret)
+		goto free_drm;
 	drm->mode_config.max_width = 3840;
 	drm->mode_config.max_height = 2160;
 	drm->mode_config.funcs = &meson_mode_config_funcs;
@@ -379,7 +381,6 @@ static void meson_drv_unbind(struct device *dev)
 	drm_dev_unregister(drm);
 	drm_irq_uninstall(drm);
 	drm_kms_helper_poll_fini(drm);
-	drm_mode_config_cleanup(drm);
 	drm_dev_put(drm);
 }
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
