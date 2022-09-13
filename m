Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38F45B7CF0
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 00:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DE910E59E;
	Tue, 13 Sep 2022 22:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24E410E57F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 22:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663107335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F/Lhqp1JWUkXQ2yb049nFnR3BgXC5vF+mPmJxxil2YI=;
 b=K7PVLBxq3Myk+68DWBjTwIxAYmKAlD1Kh6DFg+z7ke16GoqV5Q9U5z7KkF4P/xl/hbFe0t
 S5b5rZO+i5CYLyo8anUOvqMcBKdkpQGdh4xqSdS0psBytNRxS9u1vPRU4a9I02fs1jFmaL
 a1OzKoo02Swg7qxuuXnbz0z5D9y0PdQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-457-2KLvydK4POS10LiKfjyp5A-1; Tue, 13 Sep 2022 18:15:18 -0400
X-MC-Unique: 2KLvydK4POS10LiKfjyp5A-1
Received: by mail-ed1-f69.google.com with SMTP id
 i17-20020a05640242d100b0044f18a5379aso9509633edc.21
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 15:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=F/Lhqp1JWUkXQ2yb049nFnR3BgXC5vF+mPmJxxil2YI=;
 b=BKlP1/8+2IF2fsh3nR5ZFJ3OyfywEhvlgJRjHqIBicdFGc67+bHl/1oBDe34w8V/H9
 r9IGR4Q0FNM4rBPHIoCACH9UfgvCUKz8CvHiqSYQviFmRGzNk06kR9GI/VW3eYg4QQ+6
 SVjEvWK4y55yAlmlZ35gU6HWKQ1UanSdBNhFJnKXgYm5bLMHxi0wsNZGN3ota2uv86wq
 5n7o8Rw1umjCTdSX2mWMF8xJEaXrir3Fu0fJFVb9aR/F+58XceMXwfewL8KmmG/iapeU
 KnfL9yHxLq29AZF+pBA/m5HIbGPGMbc5Vfz7ntjY9jFFX2zYnTgThfQdynfo+3e0GRse
 0iIg==
X-Gm-Message-State: ACgBeo2YS+mifDiXyJEPR5cbIP76rZzGNxP69F8tsIt47RriRHMVLQuS
 KRHv0bCEK+8s5V6R6fPjIv3ojtuLtqJuMYcLlZWmNSBr0blmMgvBA9PvQgUriKL6oXCP152PtvI
 WgeH6WcylkMJeLXlQjBu0RUYa5zz6
X-Received: by 2002:a05:6402:3550:b0:451:473a:5ca3 with SMTP id
 f16-20020a056402355000b00451473a5ca3mr15479847edd.48.1663107317636; 
 Tue, 13 Sep 2022 15:15:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4C20Kieg3SMyoOJCdNFKmKL8ZSD+8UnDiEYDq5h6qGIBOnsvUg5zBURejSehEmhbPcYVQiWA==
X-Received: by 2002:a05:6402:3550:b0:451:473a:5ca3 with SMTP id
 f16-20020a056402355000b00451473a5ca3mr15479839edd.48.1663107317503; 
 Tue, 13 Sep 2022 15:15:17 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a1709060acd00b0077d371a8f29sm4121008ejf.204.2022.09.13.15.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 15:15:17 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v2 5/6] drm/arm/hdlcd: crtc: protect device
 resources after removal
Date: Wed, 14 Sep 2022 00:14:55 +0200
Message-Id: <20220913221456.147937-6-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913221456.147937-1-dakr@redhat.com>
References: <20220913221456.147937-1-dakr@redhat.com>
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
 drivers/gpu/drm/arm/hdlcd_crtc.c | 52 ++++++++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index 1de0f7b23766..694adddc9f7c 100644
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
@@ -39,28 +40,49 @@
 static void hdlcd_crtc_cleanup(struct drm_crtc *crtc)
 {
 	struct hdlcd_drm_private *hdlcd = crtc_to_hdlcd_priv(crtc);
+	int idx;
+
+	drm_crtc_cleanup(crtc);
+
+	if (!drm_dev_enter(crtc->dev, &idx))
+		return;
 
 	/* stop the controller on cleanup */
 	hdlcd_write(hdlcd, HDLCD_REG_COMMAND, 0);
-	drm_crtc_cleanup(crtc);
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
+
+	if (!drm_dev_enter(crtc->dev, &idx))
+		return;
 
+	mask = hdlcd_read(hdlcd, HDLCD_REG_INT_MASK);
 	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, mask & ~HDLCD_INTERRUPT_VSYNC);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_crtc_funcs hdlcd_crtc_funcs = {
@@ -171,21 +193,33 @@ static void hdlcd_crtc_atomic_enable(struct drm_crtc *crtc,
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
@@ -193,6 +227,10 @@ static enum drm_mode_status hdlcd_crtc_mode_valid(struct drm_crtc *crtc,
 {
 	struct hdlcd_drm_private *hdlcd = crtc_to_hdlcd_priv(crtc);
 	long rate, clk_rate = mode->clock * 1000;
+	int idx;
+
+	if (!drm_dev_enter(crtc->dev, &idx))
+		return MODE_NOCLOCK;
 
 	rate = clk_round_rate(hdlcd->clk, clk_rate);
 	/* 0.1% seems a close enough tolerance for the TDA19988 on Juno */
@@ -201,6 +239,8 @@ static enum drm_mode_status hdlcd_crtc_mode_valid(struct drm_crtc *crtc,
 		return MODE_NOCLOCK;
 	}
 
+	drm_dev_exit(idx);
+
 	return MODE_OK;
 }
 
@@ -268,6 +308,10 @@ static void hdlcd_plane_atomic_update(struct drm_plane *plane,
 	struct hdlcd_drm_private *hdlcd;
 	u32 dest_h;
 	dma_addr_t scanout_start;
+	int idx;
+
+	if (!drm_dev_enter(plane->dev, &idx))
+		return;
 
 	if (!fb)
 		return;
@@ -280,6 +324,8 @@ static void hdlcd_plane_atomic_update(struct drm_plane *plane,
 	hdlcd_write(hdlcd, HDLCD_REG_FB_LINE_PITCH, fb->pitches[0]);
 	hdlcd_write(hdlcd, HDLCD_REG_FB_LINE_COUNT, dest_h - 1);
 	hdlcd_write(hdlcd, HDLCD_REG_FB_BASE, scanout_start);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_plane_helper_funcs hdlcd_plane_helper_funcs = {
-- 
2.37.3

