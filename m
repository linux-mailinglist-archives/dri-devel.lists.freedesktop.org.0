Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F0F5F1843
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 03:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C85B10EDF8;
	Sat,  1 Oct 2022 01:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE6810EDF8
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 01:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664587160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yZIl1OKGrL3KJyd7ruXlclzCfjtYvrZNcDLCxG8/BBY=;
 b=EDLPTQmodbfAArFjc5sAGLdBgzo8XWfKeK+NKs3ti6I8GovllBtTvzvlzME+697KweWd27
 fdEkPHyOYiWHxZAtZFbFDDOiYZ6PDlCF3usfF+VQzsey0v25j8ANlFGLyZ57Y/NvrKUytS
 pG+MI09D9uVbt1P8Brmy3oU8cjrpL/0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-28-lJ-379TOP064DW9AwC3Kyw-1; Fri, 30 Sep 2022 21:19:17 -0400
X-MC-Unique: lJ-379TOP064DW9AwC3Kyw-1
Received: by mail-ed1-f72.google.com with SMTP id
 r11-20020a05640251cb00b004516feb8c09so4633680edd.10
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 18:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=yZIl1OKGrL3KJyd7ruXlclzCfjtYvrZNcDLCxG8/BBY=;
 b=p+aDQBpNHX+DfR9VbpslClMsd7UvF9coP9Ms2F4CUDqDSd6YqkOI/edxYvsumAPLx0
 GTyEKIwQ1QzYqMSh9etP8g1GWdCkFy3HHq2QM70TPZnCj6LjvnPN957NoxeUG3+IWgqs
 CvCmYiUu9nGbPV+Kr6EcopCf8+Zmg6YGuQQGLL3JAsV6eB8fTRSHFq84iJNJTmBjX4D/
 i+c/PvFe8Fu5agi1DM9r2qrYgtCitSjn/ZU/516LGA1Sl3GiEsu5EqnuUiBFbp6DiFdV
 cuaePULTY3avFyybWvQKrnC+lxMgLjdRH/tFSAISCBg2qUmWupyrbSF5RhfUsbPJgOg9
 6wWw==
X-Gm-Message-State: ACrzQf2AH6V/VCU+m0y0mQm93MvRxGVSARoNcKrftNiW1qqdH9dZueeK
 4yTGYjCz1vcl+9Rt58yNLBFXs1Szuuo2d1daiLZglj4hIU/5c2Ef90VY1GZzabhdNgPgK/E48eS
 sPpm+kSgYOUcelBjdCPnAh/IscKV5
X-Received: by 2002:a17:907:a044:b0:770:da0d:171d with SMTP id
 gz4-20020a170907a04400b00770da0d171dmr7828110ejc.742.1664587156484; 
 Fri, 30 Sep 2022 18:19:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4eBxmC9x/tkFzxVy0Ywf9ks7MiJUJ5b/u5kQtcjdJwQnAOGv3FCHcSaFJN6022V7sq0e0VMg==
X-Received: by 2002:a17:907:a044:b0:770:da0d:171d with SMTP id
 gz4-20020a170907a04400b00770da0d171dmr7828106ejc.742.1664587156315; 
 Fri, 30 Sep 2022 18:19:16 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a170906a10e00b0077e6be40e4asm1914914ejy.175.2022.09.30.18.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 18:19:16 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v3 2/7] drm/arm/hdlcd: replace drm->dev_private
 with drm_to_hdlcd_priv()
Date: Sat,  1 Oct 2022 03:19:00 +0200
Message-Id: <20221001011905.433408-3-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001011905.433408-1-dakr@redhat.com>
References: <20221001011905.433408-1-dakr@redhat.com>
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
2.37.3

