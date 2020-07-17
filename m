Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ADB22379D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 11:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A7E16ED69;
	Fri, 17 Jul 2020 09:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0366ED65
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 09:04:40 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f7so10214686wrw.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 02:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+DeOJQxjFT12jCutejz7twUg3E8aYgkxeIDAHQ0KwEQ=;
 b=BCeqxk4ME8LC+0JqccmW8mZ7uAIaFVfYT4zQAT6LYTWY+L5SCjcW51zHxczAx3Snwj
 DV8hkFWZurij0XUBSZCzPEZc+33L2XONRXJRJ3fS/3DTv+2BJNOD+7Dboee1fB/ZZRNi
 qZdeoZpM+Vf8LHrvn20FllUWRSKyfrllsbg5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+DeOJQxjFT12jCutejz7twUg3E8aYgkxeIDAHQ0KwEQ=;
 b=hWPcwOPdGNFbifXT604nr6T6Mv5brsvBb6A82RQZQKt9SbbnbdaOVze7R48Ae07trx
 ItE0oBDfAp8rZh76drujUTkau+jxeYo7CRCwtm8fsQHRvvlr6bMiY5BUBPG6sthpgLaH
 ZYKxsOUIgbdNzQk+N/VQlwSCuRcShARqpBPJWS+lWuI/O2O48nzvwjuCvIHnCAXkKpad
 kg0bDP/Q6rDQrvei5tmfBVx4ECIVB8ySw9p8+BZmKSv+FLXm1BnUDXKorLtCcX8uu0D0
 RXMb4AC0/JlDlfoZVJOYDX0BdMJ3J3Pqj4lSkGJRwLI08HnqHebkqOEcT6iY608Vr9Te
 zQxQ==
X-Gm-Message-State: AOAM533RQWMVunlyJ+jQlyq0yT5b3VM7bkmbLLfuIseBp0IYBAOpBWnL
 XNtFC/gvJHPhHAP5klW7x/MTItUWHtA=
X-Google-Smtp-Source: ABdhPJwiLK6S9Vscc2AmHoDgxO04KruoZblLzXBPPo0kzURYWFvcjBSPDs2XZM8bVToSTNcJR3Ke5g==
X-Received: by 2002:adf:f784:: with SMTP id q4mr9204468wrp.397.1594976679269; 
 Fri, 17 Jul 2020 02:04:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l67sm14520833wml.13.2020.07.17.02.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 02:04:38 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 04/18] drm/arc: Stop using drm_device->dev_private
Date: Fri, 17 Jul 2020 11:04:16 +0200
Message-Id: <20200717090430.1146256-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
References: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
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
 Alexey Brodkin <abrodkin@synopsys.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Upcasting using a container_of macro is more typesafe, faster and
easier for the compiler to optimize.

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
index be7c29cec318..ba796a216244 100644
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
