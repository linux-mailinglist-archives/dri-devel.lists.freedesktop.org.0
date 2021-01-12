Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 584492F2A2F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FAA6E133;
	Tue, 12 Jan 2021 08:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426526E133
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:44:08 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id q75so1264862wme.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kqYpsT8tRXiU0h9tSugnl1w5GVBQE+BgN+gKdJbBbeg=;
 b=P1/rWC2L6RpOiEyNiKPaQw2AbjfoETAwDm0rF3sFUjIJk1uMZB60yVgt3X2KN3Y3+v
 BLGLuUxjPhrZTA9ZMzRiBxaOqd8A19ma/ccSv8thjNUvGgXiCEkWsfe+MgoLX2gPouzo
 rmvMapDOaBF3uEvSdIcHPQ+mCO2kNFwIVM0SY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kqYpsT8tRXiU0h9tSugnl1w5GVBQE+BgN+gKdJbBbeg=;
 b=MaC47BlyFPdpSCyCHqZzbxkJHHHqTyEy5jkVGCT4TauLGH5DqB+wPnJBAYjorJ7PGS
 ZgtRfmBWq3rbJ8a2dA3H7nhcPQKCBxaAkLSput3Yfp7O3qeHZVDUOFTYgtE8eR6SGyKr
 kt6P67ZKO+r6kKD1kEgXzDJMQMs3W5JQeSRvW7evrDB5Pj+KV2ntORhCSxIn+1ZYh9/e
 nKlWXBZ69O/ZgE7brT5SLYSpJhBy/tPVLI2kRW5m2KlyoT2bD65NpjZQTmmFArdpfQIX
 wDY98nIY/drhz6VmRks1MAguta54TNEkM8iKf+xt6uWkL5OUx2LDWkutROTcP6mzhp1J
 UQTg==
X-Gm-Message-State: AOAM530u8WQpapQwXFsCgv8d/gmrHHgj9b7EV/JIvwXtF9hVa/C0XsSm
 g7EicsAHuJn4vCg2sd9TVJvBOGuUUZTom4ca
X-Google-Smtp-Source: ABdhPJw0zPZ2Um5bvXkw/av2U1QHYenDdRT+UkF03oDG6Vh0af6/ZiD7BNG6UWg4XuqjgDAw1PrrCA==
X-Received: by 2002:a1c:4c0a:: with SMTP id z10mr2381518wmf.95.1610441046731; 
 Tue, 12 Jan 2021 00:44:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j15sm3707017wrr.85.2021.01.12.00.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:44:06 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/15] drm/arc: Stop using drm_device->dev_private
Date: Tue, 12 Jan 2021 09:43:45 +0100
Message-Id: <20210112084358.2771527-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
References: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, tiantao6@hisilicon.com,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Upcasting using a container_of macro is more typesafe, faster and
easier for the compiler to optimize.

Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu.h      | 2 ++
 drivers/gpu/drm/arc/arcpgu_crtc.c | 4 ++--
 drivers/gpu/drm/arc/arcpgu_drv.c  | 4 +---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
index cd9e932f501e..87821c91a00c 100644
--- a/drivers/gpu/drm/arc/arcpgu.h
+++ b/drivers/gpu/drm/arc/arcpgu.h
@@ -17,6 +17,8 @@ struct arcpgu_drm_private {
 	struct drm_plane	*plane;
 };
 
+#define dev_to_arcpgu(x) container_of(x, struct arcpgu_drm_private, drm)
+
 #define crtc_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_private, crtc)
 
 static inline void arc_pgu_write(struct arcpgu_drm_private *arcpgu,
diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index 042d7b54a6de..c32038b6366f 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -178,7 +178,7 @@ static const struct drm_plane_funcs arc_pgu_plane_funcs = {
 
 static struct drm_plane *arc_pgu_plane_init(struct drm_device *drm)
 {
-	struct arcpgu_drm_private *arcpgu = drm->dev_private;
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	struct drm_plane *plane = NULL;
 	int ret;
 
@@ -202,7 +202,7 @@ static struct drm_plane *arc_pgu_plane_init(struct drm_device *drm)
 
 int arc_pgu_setup_crtc(struct drm_device *drm)
 {
-	struct arcpgu_drm_private *arcpgu = drm->dev_private;
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	struct drm_plane *primary;
 	int ret;
 
diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index 68eb4a31c54b..c6a8deb56b0f 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -50,8 +50,6 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	struct resource *res;
 	int ret;
 
-	drm->dev_private = arcpgu;
-
 	arcpgu->clk = devm_clk_get(drm->dev, "pxlclk");
 	if (IS_ERR(arcpgu->clk))
 		return PTR_ERR(arcpgu->clk);
@@ -120,7 +118,7 @@ static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
 	struct drm_device *drm = node->minor->dev;
-	struct arcpgu_drm_private *arcpgu = drm->dev_private;
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	unsigned long clkrate = clk_get_rate(arcpgu->clk);
 	unsigned long mode_clock = arcpgu->crtc.mode.crtc_clock * 1000;
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
