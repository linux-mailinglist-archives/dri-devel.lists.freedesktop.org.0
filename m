Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B996859A913
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 01:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236F410EE25;
	Fri, 19 Aug 2022 23:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B7C10E235
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 23:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660950681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLZfq6WypLg+PIKaSCfWFhdUOS8zDvxPUxnHNhKzURQ=;
 b=T/aEmMYx0Z02iP/p2oS3LA3F3/Yuzt+yoboJt4rC9G2uQaGTa+79lIJq9q93/FLc2cNLx8
 GwqKJXEjy1feU106e6s45jB8MUBfFML1rd+vxIbS6q+VUzaLWmAG13krpJ94DPyICidmF0
 HynJDmDlv5wFIwWqzFQI4GsEQ2svJgY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-399-_D_eFWOIN9ieN5PUylf7IA-1; Fri, 19 Aug 2022 19:11:18 -0400
X-MC-Unique: _D_eFWOIN9ieN5PUylf7IA-1
Received: by mail-ej1-f69.google.com with SMTP id
 hs4-20020a1709073e8400b0073d66965277so43006ejc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 16:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=dLZfq6WypLg+PIKaSCfWFhdUOS8zDvxPUxnHNhKzURQ=;
 b=EywC6yHt4GcjpkeiCHFr6e0EPhQjMD9cMazy1htgowK9OBBSl/qNlEkACpNa5QHCvK
 FG+mBdDCoshzINDosd/pi28OLr4dh2pW9pKbLTkx6M/X6GJNVpTL5eCXMcW8vPXbcsyK
 3BVJ5ksoVfk4d+QbUArWtSySjgh/aBNTDQNnbt8TeH7raD50ubiVPdVdgSkyqPwzendY
 K6CzjRXqNCiHP/7to572ISWGYwSLDQwSNkYjpjU/qHkepYmgXeNklw3FEnb+EDyUWM7U
 5U1qtx+xxA3aaV55mNAF8vJ42kUxFyaOZEp6zLJESKrHw6FDtLR9AeTanUdguZoojniU
 1Y/A==
X-Gm-Message-State: ACgBeo1edOaH1Vowc8vOCVwqUpFk2BIGEBFxLmZj5FKdpAbYQWQQjxGL
 Ylf6V+pqAauq636nirkfFi+OscdcUk5CUqymxhtS1iUMcgjqj62dTtxbKVAC8EfjMir92Zi8s+B
 kUph1qh1uK8kbDAQj/h4zyWQe9Usl
X-Received: by 2002:a05:6402:e86:b0:440:d1be:20c7 with SMTP id
 h6-20020a0564020e8600b00440d1be20c7mr7754763eda.349.1660950677278; 
 Fri, 19 Aug 2022 16:11:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7JSK2TMkoebbHT5LMUu2crmMcWGvQOKm5f0GW7UmQ4oCu69y9RiVIrSgGRUCD1OxOpCrbX3g==
X-Received: by 2002:a05:6402:e86:b0:440:d1be:20c7 with SMTP id
 h6-20020a0564020e8600b00440d1be20c7mr7754751eda.349.1660950677134; 
 Fri, 19 Aug 2022 16:11:17 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a17090694c500b00734bfab4d59sm2923078ejy.170.2022.08.19.16.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 16:11:16 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next 6/7] drm/arm/hdlcd: crtc: protect device
 resources after removal
Date: Sat, 20 Aug 2022 01:10:57 +0200
Message-Id: <20220819231058.647658-7-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819231058.647658-1-dakr@redhat.com>
References: <20220819231058.647658-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Hardware) resources which are bound to the driver and device lifecycle
must not be accessed after the device and driver are unbound.

However, the DRM device isn't freed as long as the last user didn't
close it, hence userspace can still call into the driver.

Therefore protect the critical sections which are accessing those
resources with drm_dev_enter() and drm_dev_exit().

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/arm/hdlcd_crtc.c | 49 ++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index 17d3ccf12245..bfc42d4a53c2 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -18,6 +18,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_framebuffer.h>
@@ -39,27 +40,47 @@
 static void hdlcd_crtc_cleanup(struct drm_crtc *crtc)
 {
 	struct hdlcd_drm_private *hdlcd = crtc_to_hdlcd_priv(crtc);
+	int idx;
+
+	if (!drm_dev_enter(crtc->dev, &idx))
+		return;
 
 	/* stop the controller on cleanup */
 	hdlcd_write(hdlcd, HDLCD_REG_COMMAND, 0);
+
+	drm_dev_exit(idx);
 }
 
 static int hdlcd_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct hdlcd_drm_private *hdlcd = crtc_to_hdlcd_priv(crtc);
-	unsigned int mask = hdlcd_read(hdlcd, HDLCD_REG_INT_MASK);
+	unsigned int mask;
+	int idx;
 
+	if (!drm_dev_enter(crtc->dev, &idx))
+		return -ENODEV;
+
+	mask = hdlcd_read(hdlcd, HDLCD_REG_INT_MASK);
 	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, mask | HDLCD_INTERRUPT_VSYNC);
 
+	drm_dev_exit(idx);
+
 	return 0;
 }
 
 static void hdlcd_crtc_disable_vblank(struct drm_crtc *crtc)
 {
 	struct hdlcd_drm_private *hdlcd = crtc_to_hdlcd_priv(crtc);
-	unsigned int mask = hdlcd_read(hdlcd, HDLCD_REG_INT_MASK);
+	unsigned int mask;
+	int idx;
 
+	if (!drm_dev_enter(crtc->dev, &idx))
+		return;
+
+	mask = hdlcd_read(hdlcd, HDLCD_REG_INT_MASK);
 	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, mask & ~HDLCD_INTERRUPT_VSYNC);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_crtc_funcs hdlcd_crtc_funcs = {
@@ -170,21 +191,33 @@ static void hdlcd_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
 	struct hdlcd_drm_private *hdlcd = crtc_to_hdlcd_priv(crtc);
+	int idx;
+
+	if (!drm_dev_enter(crtc->dev, &idx))
+		return;
 
 	clk_prepare_enable(hdlcd->clk);
 	hdlcd_crtc_mode_set_nofb(crtc);
 	hdlcd_write(hdlcd, HDLCD_REG_COMMAND, 1);
 	drm_crtc_vblank_on(crtc);
+
+	drm_dev_exit(idx);
 }
 
 static void hdlcd_crtc_atomic_disable(struct drm_crtc *crtc,
 				      struct drm_atomic_state *state)
 {
 	struct hdlcd_drm_private *hdlcd = crtc_to_hdlcd_priv(crtc);
+	int idx;
+
+	if (!drm_dev_enter(crtc->dev, &idx))
+		return;
 
 	drm_crtc_vblank_off(crtc);
 	hdlcd_write(hdlcd, HDLCD_REG_COMMAND, 0);
 	clk_disable_unprepare(hdlcd->clk);
+
+	drm_dev_exit(idx);
 }
 
 static enum drm_mode_status hdlcd_crtc_mode_valid(struct drm_crtc *crtc,
@@ -192,6 +225,10 @@ static enum drm_mode_status hdlcd_crtc_mode_valid(struct drm_crtc *crtc,
 {
 	struct hdlcd_drm_private *hdlcd = crtc_to_hdlcd_priv(crtc);
 	long rate, clk_rate = mode->clock * 1000;
+	int idx;
+
+	if (!drm_dev_enter(crtc->dev, &idx))
+		return MODE_NOCLOCK;
 
 	rate = clk_round_rate(hdlcd->clk, clk_rate);
 	/* 0.1% seems a close enough tolerance for the TDA19988 on Juno */
@@ -200,6 +237,8 @@ static enum drm_mode_status hdlcd_crtc_mode_valid(struct drm_crtc *crtc,
 		return MODE_NOCLOCK;
 	}
 
+	drm_dev_exit(idx);
+
 	return MODE_OK;
 }
 
@@ -267,6 +306,10 @@ static void hdlcd_plane_atomic_update(struct drm_plane *plane,
 	struct hdlcd_drm_private *hdlcd;
 	u32 dest_h;
 	dma_addr_t scanout_start;
+	int idx;
+
+	if (!drm_dev_enter(plane->dev, &idx))
+		return;
 
 	if (!fb)
 		return;
@@ -279,6 +322,8 @@ static void hdlcd_plane_atomic_update(struct drm_plane *plane,
 	hdlcd_write(hdlcd, HDLCD_REG_FB_LINE_PITCH, fb->pitches[0]);
 	hdlcd_write(hdlcd, HDLCD_REG_FB_LINE_COUNT, dest_h - 1);
 	hdlcd_write(hdlcd, HDLCD_REG_FB_BASE, scanout_start);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_plane_helper_funcs hdlcd_plane_helper_funcs = {
-- 
2.37.2

