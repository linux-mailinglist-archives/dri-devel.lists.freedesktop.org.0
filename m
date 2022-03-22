Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 596A64E3F54
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 14:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5392A10E5B9;
	Tue, 22 Mar 2022 13:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8CD10E5B9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 13:17:51 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso1685855wmz.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 06:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ed1GA0YMB/v8PN4p/2LJhZo1DqFtrsVWp924T2axfNg=;
 b=WxOXppmKDkDTY06kzQdEyCw7kxe+ONPAI0K5RfaYsT0bJppCgmWpzAAotT+VZ6kaEb
 /XlOSOCfj38cKwGv/li/nFeAw/K3Xp0CHxEGZQbg+VFtb0AR7LxhcTMjG16xWYMoyNUn
 N8mlP9NrId7dzzmEl/ZytX5IiAjPy06b9vl+guoDV/cTtE7o93LVqMUhGbx19O9wW/kp
 AqcN1M1SF1V5qNeUYlywRMKeaC0gl7sLxU50P/T2Dxte7EtjhfjFtXJ9eiFMLQ0DQoMB
 2eKniTFPpBIkAGk+sTu61+HODcE6fc8XxynAiynnw4n08KAYfJvK8co0/pHY0dAbUj8s
 G17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ed1GA0YMB/v8PN4p/2LJhZo1DqFtrsVWp924T2axfNg=;
 b=bCt5w0YPekHRk5NamaX7vbHMlT4lJQkXjSmFnD1aHi8CvbVW6cRS1Nfo/lpZCFbsa6
 YOhgtSLwIbWteE04oGIUOJpHre6j4LjAhx6Zxd9wVdCk0VSrY9nrYMgJj0CBQikjErxC
 fKu8uGC1H8qZDKa31jlfeGvI5MT8/elqkMtx4Wa/nKVjDFkksL61O2uoHE7tMcF7Gi+l
 ZAHydlROnzCcaEaARAeIjiEHAgZpsMeM8DxnOBOrw9HyjsLU+JxLBxITc+wJVQ3Nuyue
 +O/zbEB7FoQCuxvIvnLmzyMrdCWz7O6tQ0onQzJWN0OAoySnabMBotFxdTTvI5hkG0CT
 GrHA==
X-Gm-Message-State: AOAM531oyChw0wZfYA56vRh3rX0aDV4mmf+3JTsXM+Kl0zK3U7hbSPJb
 lfzu8r6YRgU5BjNS9yUj3ibjw3uUyg8=
X-Google-Smtp-Source: ABdhPJyYFNiJK8TnZ/X8yv79EI6lO4zyZJ9zl5Mk0TrDmO/i1JJN9cMiFW7eJ7UpwSBUa8dBXuE8rQ==
X-Received: by 2002:a7b:c347:0:b0:37e:68e6:d85c with SMTP id
 l7-20020a7bc347000000b0037e68e6d85cmr3889951wmj.176.1647955069196; 
 Tue, 22 Mar 2022 06:17:49 -0700 (PDT)
Received: from workstation.suse.de (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 l13-20020a05600002ad00b00203d64c5289sm17978437wry.112.2022.03.22.06.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 06:17:48 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/gma500: Free the correct connector allocation
Date: Tue, 22 Mar 2022 14:17:40 +0100
Message-Id: <20220322131742.11566-5-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>
References: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The allocation is made for the gma_connector object so we must use the
same address when free()ing the object.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_crt.c  | 3 ++-
 drivers/gpu/drm/gma500/cdv_intel_dp.c   | 3 ++-
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c | 3 ++-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 3 ++-
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 3 ++-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c | 4 +++-
 6 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_crt.c b/drivers/gpu/drm/gma500/cdv_intel_crt.c
index 1ae0fbbda0eb..6bcd18c63c31 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_crt.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_crt.c
@@ -191,11 +191,12 @@ static enum drm_connector_status cdv_intel_crt_detect(
 
 static void cdv_intel_crt_destroy(struct drm_connector *connector)
 {
+	struct gma_connector *gma_connector = to_gma_connector(connector);
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 
 	psb_intel_i2c_destroy(gma_encoder->ddc_bus);
 	drm_connector_cleanup(connector);
-	kfree(connector);
+	kfree(gma_connector);
 }
 
 static int cdv_intel_crt_get_modes(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 3fba9d4e785d..72b1b2fc3c27 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -1857,6 +1857,7 @@ cdv_intel_dp_set_property(struct drm_connector *connector,
 static void
 cdv_intel_dp_destroy(struct drm_connector *connector)
 {
+	struct gma_connector *gma_connector = to_gma_connector(connector);
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 	struct cdv_intel_dp *intel_dp = gma_encoder->dev_priv;
 
@@ -1867,7 +1868,7 @@ cdv_intel_dp_destroy(struct drm_connector *connector)
 	}
 	i2c_del_adapter(&intel_dp->adapter);
 	drm_connector_cleanup(connector);
-	kfree(connector);
+	kfree(gma_connector);
 }
 
 static const struct drm_encoder_helper_funcs cdv_intel_dp_helper_funcs = {
diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
index e0d4c49b3c92..8987e555e113 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
@@ -242,11 +242,12 @@ static enum drm_mode_status cdv_hdmi_mode_valid(struct drm_connector *connector,
 
 static void cdv_hdmi_destroy(struct drm_connector *connector)
 {
+	struct gma_connector *gma_connector = to_gma_connector(connector);
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 
 	psb_intel_i2c_destroy(gma_encoder->i2c_bus);
 	drm_connector_cleanup(connector);
-	kfree(connector);
+	kfree(gma_connector);
 }
 
 static const struct drm_encoder_helper_funcs cdv_hdmi_helper_funcs = {
diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 851a3cc4653e..98d9f5483a7c 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -326,11 +326,12 @@ static int cdv_intel_lvds_get_modes(struct drm_connector *connector)
  */
 static void cdv_intel_lvds_destroy(struct drm_connector *connector)
 {
+	struct gma_connector *gma_connector = to_gma_connector(connector);
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 
 	psb_intel_i2c_destroy(gma_encoder->i2c_bus);
 	drm_connector_cleanup(connector);
-	kfree(connector);
+	kfree(gma_connector);
 }
 
 static int cdv_intel_lvds_set_property(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index ec8f0b504ccc..cad00380b386 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -521,12 +521,13 @@ static int psb_intel_lvds_get_modes(struct drm_connector *connector)
  */
 void psb_intel_lvds_destroy(struct drm_connector *connector)
 {
+	struct gma_connector *gma_connector = to_gma_connector(connector);
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 	struct psb_intel_lvds_priv *lvds_priv = gma_encoder->dev_priv;
 
 	psb_intel_i2c_destroy(lvds_priv->ddc_bus);
 	drm_connector_cleanup(connector);
-	kfree(connector);
+	kfree(gma_connector);
 }
 
 int psb_intel_lvds_set_property(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index 5b72a759a182..a85aace25548 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -1542,8 +1542,10 @@ static int psb_intel_sdvo_get_modes(struct drm_connector *connector)
 
 static void psb_intel_sdvo_destroy(struct drm_connector *connector)
 {
+	struct gma_connector *gma_connector = to_gma_connector(connector);
+
 	drm_connector_cleanup(connector);
-	kfree(connector);
+	kfree(gma_connector);
 }
 
 static bool psb_intel_sdvo_detect_hdmi_audio(struct drm_connector *connector)
-- 
2.35.1

