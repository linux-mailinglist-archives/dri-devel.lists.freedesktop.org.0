Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4425AD658
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD6610EA49;
	Mon,  5 Sep 2022 15:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BE010EA39
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662391666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLZfq6WypLg+PIKaSCfWFhdUOS8zDvxPUxnHNhKzURQ=;
 b=KTibtTdDMh0k3O5I6BDVWjcnhoMMZUDgQRnmlbHzxfCAn/oWdPHlDcPEUincSvJblTak8C
 GSiiEnMLXYLcIDp51dPfY4+FsvIZhjzXLrBBDHgRjhCvRpKNLER00ywJl+hKXSH6jUMLbj
 umtCByAr2oZwcwgzYm9rTCSGQBEumdo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-6IWnVbP5O-qiipUXP1CZSg-1; Mon, 05 Sep 2022 11:27:45 -0400
X-MC-Unique: 6IWnVbP5O-qiipUXP1CZSg-1
Received: by mail-ed1-f69.google.com with SMTP id
 r11-20020a05640251cb00b004484ec7e3a4so5960863edd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 08:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=dLZfq6WypLg+PIKaSCfWFhdUOS8zDvxPUxnHNhKzURQ=;
 b=zOjKAMtFlANKVVqAxEV3WYSWIkrpNAuTXjl6SmV0FRSUNtR7rpGnvuKYKlpP1ZWzyt
 5t6T7rE4CFMzrtElddofm5Rf6b4F4QB54XekEENYRgUW2/CjDgdIK5KUXZckNKbEvv7J
 lPap71iZWoQD5OvqMAYhmX293ZaraouwXhe9V+tHZiJ6Hl4hauaLliwC+H6whxTCTDBP
 gSvQATCmrigdOjZ/EoR9WsxCACHqtWSX46nH9OYREWT/jWMWdU4TTOLBz1GbLn8J/mRl
 x9WT0TpPjvwYoBaRP3oAxzeDHKgjApUQFIYCj2HgjxpLVfaavnU4qI4scGTkdA8lNvSe
 h5fQ==
X-Gm-Message-State: ACgBeo1Th7mXyjHz+N3KkOTamWNd5Cjy05M/bH74KJfsryXjtZh1zJHC
 Y3lOwX4PAKfVJSu5C9mvRGhPWiDgQkL/7iiThq8NpBmmbb8C6F71dey24/DEqBx7r3Nm2kBVDQ1
 eINRkrccGShfj/HUkLcnUin5VZFjf
X-Received: by 2002:a17:907:c14:b0:741:6823:11c with SMTP id
 ga20-20020a1709070c1400b007416823011cmr27662849ejc.295.1662391663858; 
 Mon, 05 Sep 2022 08:27:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7dwJv7NiLCGz84YQfyCvg+ySl/SBl/OUwxr1LnrBoTmR9wUNpbaUemop0pEzd67X8DZyHo7A==
X-Received: by 2002:a17:907:c14:b0:741:6823:11c with SMTP id
 ga20-20020a1709070c1400b007416823011cmr27662833ejc.295.1662391663684; 
 Mon, 05 Sep 2022 08:27:43 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 t19-20020a1709067c1300b00730b61d8a5esm5206061ejo.61.2022.09.05.08.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 08:27:43 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH RESEND drm-misc-next 6/7] drm/arm/hdlcd: crtc: protect device
 resources after removal
Date: Mon,  5 Sep 2022 17:27:18 +0200
Message-Id: <20220905152719.128539-7-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905152719.128539-1-dakr@redhat.com>
References: <20220905152719.128539-1-dakr@redhat.com>
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

