Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D4459A90F
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 01:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27AE10E9B6;
	Fri, 19 Aug 2022 23:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4388410E213
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 23:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660950669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zE4vp0voY9uQjkQjmHJf9kE7FYAP7kTVaTS+8HIh/tE=;
 b=JfhSU1AcRnSWC7+tC92yOY1zFYIwd54RSsN40s1CiGzN0bs3DrbsUdD1RHqpGsUNOgG8R4
 NW6BQ67wLA4CRe1RUcA+Ycv4JQ+LGyG5stgRXRL9WmPBcJq4LLOsOb57+AY0MMhP+LU2qZ
 VZVxZW2YGLBHNtHgv4Tq3GD/rd8VsR4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-354-KvO_LYn1NqyZxdqWs17BEA-1; Fri, 19 Aug 2022 19:11:08 -0400
X-MC-Unique: KvO_LYn1NqyZxdqWs17BEA-1
Received: by mail-ej1-f72.google.com with SMTP id
 g18-20020a1709065d1200b0073082300e1fso1942381ejt.12
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 16:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=zE4vp0voY9uQjkQjmHJf9kE7FYAP7kTVaTS+8HIh/tE=;
 b=yMXiye6DZltP9/6TdHf8v57OjuFrjOljnmaoyb7gDD5K7urGw9MxOtY27bw0k5phoZ
 GkWfVDqjddXVgSYg4SHkEUz/WgQc+WnkyZbcW9ndfOYvO4LCGMPs0OwiKspQC7nncxyP
 ciqxcT0JZ3XvIRXCtybsHpjZLK3UiI+GIPEzkYaC8QXgfspyOG53JLBYbQSHC4laLVQM
 Tk8qEqVcej1z49QSmkhZIHAULF2NiOXowZzbY5MVWnDBEhLeubgFYvnVVd9P36g/N1a+
 fDNQ0Bhef17TDROeAYbvY2GD8SpH7Vndg2IVjFMYLvi4DqU/rfdPuJE3TzCEBrPjqrco
 8SaQ==
X-Gm-Message-State: ACgBeo028pNlc7TlKaAu0PwNYdtpTFmymnrteei+hxzs1lrmuft9a0dr
 nkMYhQ9BGUf9ks9JBJ6w6g2JynWvdJDlO99EZG75vlIW1b7NL0nGu2WYHcWMiZYo/+OGGjxkzmh
 mb6VkiwICiZSnXaZjuHtiF8Y1vx/N
X-Received: by 2002:a05:6402:4407:b0:43f:68b8:3358 with SMTP id
 y7-20020a056402440700b0043f68b83358mr7653910eda.215.1660950667174; 
 Fri, 19 Aug 2022 16:11:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7XXSBauExpDyHCPOh+rGZm4yhkBfQtEDjqIJnq8eNLc63PAUAH+xTLtF7VgUFav7SSgkv9Xg==
X-Received: by 2002:a05:6402:4407:b0:43f:68b8:3358 with SMTP id
 y7-20020a056402440700b0043f68b83358mr7653895eda.215.1660950667040; 
 Fri, 19 Aug 2022 16:11:07 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a1709060a1400b007303fe58eb2sm2844636ejf.154.2022.08.19.16.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 16:11:06 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next 2/7] drm/arm/hdlcd: replace drm->dev_private
 with drm_to_hdlcd_priv()
Date: Sat, 20 Aug 2022 01:10:53 +0200
Message-Id: <20220819231058.647658-3-dakr@redhat.com>
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

Using drm_device->dev_private is deprecated. Since we've switched to
devm_drm_dev_alloc(), struct drm_device is now embedded in struct
hdlcd_drm_private, hence we can use container_of() to get the struct
drm_device instance instead.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/arm/hdlcd_crtc.c |  4 ++--
 drivers/gpu/drm/arm/hdlcd_drv.c  | 10 ++++------
 drivers/gpu/drm/arm/hdlcd_drv.h  |  1 +
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index 7030339fa232..4a8959d0b2a6 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -275,7 +275,7 @@ static void hdlcd_plane_atomic_update(struct drm_plane *plane,
 	dest_h = drm_rect_height(&new_plane_state->dst);
 	scanout_start = drm_fb_dma_get_gem_addr(fb, new_plane_state, 0);
 
-	hdlcd = plane->dev->dev_private;
+	hdlcd = drm_to_hdlcd_priv(plane->dev);
 	hdlcd_write(hdlcd, HDLCD_REG_FB_LINE_LENGTH, fb->pitches[0]);
 	hdlcd_write(hdlcd, HDLCD_REG_FB_LINE_PITCH, fb->pitches[0]);
 	hdlcd_write(hdlcd, HDLCD_REG_FB_LINE_COUNT, dest_h - 1);
@@ -325,7 +325,7 @@ static struct drm_plane *hdlcd_plane_init(struct drm_device *drm)
 
 int hdlcd_setup_crtc(struct drm_device *drm)
 {
-	struct hdlcd_drm_private *hdlcd = drm->dev_private;
+	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
 	struct drm_plane *primary;
 	int ret;
 
diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 463381d11cff..120c87934a91 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -98,7 +98,7 @@ static void hdlcd_irq_uninstall(struct hdlcd_drm_private *hdlcd)
 
 static int hdlcd_load(struct drm_device *drm, unsigned long flags)
 {
-	struct hdlcd_drm_private *hdlcd = drm->dev_private;
+	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	struct resource *res;
 	u32 version;
@@ -190,7 +190,7 @@ static int hdlcd_show_underrun_count(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
 	struct drm_device *drm = node->minor->dev;
-	struct hdlcd_drm_private *hdlcd = drm->dev_private;
+	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
 
 	seq_printf(m, "underrun : %d\n", atomic_read(&hdlcd->buffer_underrun_count));
 	seq_printf(m, "dma_end  : %d\n", atomic_read(&hdlcd->dma_end_count));
@@ -203,7 +203,7 @@ static int hdlcd_show_pxlclock(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
 	struct drm_device *drm = node->minor->dev;
-	struct hdlcd_drm_private *hdlcd = drm->dev_private;
+	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
 	unsigned long clkrate = clk_get_rate(hdlcd->clk);
 	unsigned long mode_clock = hdlcd->crtc.mode.crtc_clock * 1000;
 
@@ -253,7 +253,6 @@ static int hdlcd_drm_bind(struct device *dev)
 
 	drm = &hdlcd->base;
 
-	drm->dev_private = hdlcd;
 	dev_set_drvdata(dev, drm);
 
 	hdlcd_setup_mode_config(drm);
@@ -324,7 +323,7 @@ static int hdlcd_drm_bind(struct device *dev)
 static void hdlcd_drm_unbind(struct device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(dev);
-	struct hdlcd_drm_private *hdlcd = drm->dev_private;
+	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
 
 	drm_dev_unregister(drm);
 	drm_kms_helper_poll_fini(drm);
@@ -339,7 +338,6 @@ static void hdlcd_drm_unbind(struct device *dev)
 		pm_runtime_disable(dev);
 	of_reserved_mem_device_release(dev);
 	drm_mode_config_cleanup(drm);
-	drm->dev_private = NULL;
 	dev_set_drvdata(dev, NULL);
 }
 
diff --git a/drivers/gpu/drm/arm/hdlcd_drv.h b/drivers/gpu/drm/arm/hdlcd_drv.h
index 3892b36767ac..f1c1da2ac2db 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.h
+++ b/drivers/gpu/drm/arm/hdlcd_drv.h
@@ -21,6 +21,7 @@ struct hdlcd_drm_private {
 #endif
 };
 
+#define drm_to_hdlcd_priv(x)	container_of(x, struct hdlcd_drm_private, base)
 #define crtc_to_hdlcd_priv(x)	container_of(x, struct hdlcd_drm_private, crtc)
 
 static inline void hdlcd_write(struct hdlcd_drm_private *hdlcd,
-- 
2.37.2

