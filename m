Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6381413526
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 16:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDAC6E99A;
	Tue, 21 Sep 2021 14:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43B06E998
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 14:17:02 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id w17so31548722wrv.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 07:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Js1K5O/bNEjXe8kobmaNxax8coFwgIMmis+r8avEafc=;
 b=wNlTWwfdMgL+/ylxZ9+GQUZbwWU8v5m72MXlTBdX6DIG03NVg/fsnP0DocO33Vt50I
 hlA3ntQKTYxABDKfAjkrR/XYw+77xkw8jRic6Pt8ZdJYmkdmj9SBDwmA+B4M3VbnqCLo
 ASTW3nmrRMpzT5K4WP3MjT4GtD66Oi3FM7B1hXFoiRHl3UGOEtXT41YBCBJD/EpVBGab
 JZMxW5+i8B+I2KyZruR3pSysUSW0p6Gc6PAjDMDgcmFUmLkBMkjbTSQrNNjTeL3WQPrs
 uOACguwsuS0qbqVutntyIRz8X6eNF+uT9mNBlML8oT4DMJx81X9WYd2B59tOVxWi6Qmi
 0UTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Js1K5O/bNEjXe8kobmaNxax8coFwgIMmis+r8avEafc=;
 b=m45EioA+9RRGvF6w0yMJe/StQ7xZhzlZi/TJwewO6wKmiIZvpCMojMJsbI+EVtF4LQ
 9qBrnJeWYi7DALQ1xhkLbq4cuEj4EwWgiM3GOMgbfFuq3V+UDPArNdtWJpZ4t2IGaEb2
 yOb4TPoMHLhcZj2+yI53BWJZvv+9ANxr2nn6L40fhDFIwyzKTB9vKe8FgKTfM5OoFmTX
 88xL9C/m4S5+8E3Wa6lWZceE7owQXjgUeHG2soYj0fwL1QZS0DG7OKnm8nHu1AV8T2bC
 ai9wCK2iP8r+DyUvnVrFcjr0WJIpC59bSyF6TWK7Ynt3YWWub6lEOqeEw80Exz1qU4Dr
 4aHg==
X-Gm-Message-State: AOAM531yqGMcSSyKePpo9Rnd3JujkYOu3KnDOhj0CnfQvPPxN3TivtTV
 IRCR/ldVrFPsbAZKNAXcZLKQXw==
X-Google-Smtp-Source: ABdhPJzv0W9BhSoIim/x4wr1AuULg7u0E6ARAAUsGFhOKYt4VkU5X780hOtba4+fps0rWQLSb6RjGw==
X-Received: by 2002:a05:6000:1b90:: with SMTP id
 r16mr10232620wru.250.1632233820973; 
 Tue, 21 Sep 2021 07:17:00 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:19bb:c937:2c91:f02])
 by smtp.gmail.com with ESMTPSA id
 c15sm20573379wrc.83.2021.09.21.07.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 07:16:59 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: tomba@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/3] drm/omap: add crtc background property
Date: Tue, 21 Sep 2021 16:16:52 +0200
Message-Id: <20210921141654.66550-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921141654.66550-1-narmstrong@baylibre.com>
References: <20210921141654.66550-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4593; i=narmstrong@baylibre.com;
 h=from:subject; bh=EdsQJ0MRrbKhSXtJcPpTqnttAQ84nGQ4XAMIRS/VhJk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhSeilyJ8PsDwh7F+2xbVl1/LK/IdMB9Dub0IR64al
 0Nq/tWqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYUnopQAKCRB33NvayMhJ0Zi9D/
 9vImwyRyS/rfIlkiLXFO6pvUPMPBvcT5QZcebxJMTvDkF+9EBjf0wBcNsRv4cfICbgcxPVg5BVvy/h
 85DTRrv2132wB9wdf6ziZ1F6BPpSbFS2OuxeAJFtzL9bALdCyu6/Q4Bu0/40WRx1FYp/BiYc8zvhGu
 ZY07EV3P8zGhRHSmmg22cvt9xvLgZBYZ+K1WJpc6ggLQ+LBG/75EURiVnLGxk8iF4+bI7gOpmT15c/
 7TJ/QbIe3wPKrRPb6ucwobW22CRDJea3TcV0fV7V3tWjvdl5Tv9sYKfhNW6zJ/sbJm6CeuFiwQQ1Xm
 /WaeLSuDf70c+bq8PdCdCZrh7YOfKgBQtmqe6mzJzT5ZtWc/UWRCc3RLhQcGrMsshC/PbbDPhTLxBP
 h0/k4giBNGkGpoeV3ABBZluCvJw+rSf9DEn3xEzsqnGSTaNV6vxANRfzg8+Rd8iS+HITb8qajQXazH
 ctVc3JiKjH3JxSeXBD7qnuqJ5scbHu6hu7jcHGvPDRYMTwih5XgIS9/GFGbOUWI5hCgGG3IZ/0aTBY
 5Tl+FSkSxHhyrJMweLiGQ+24UXCuDYC16ilZg9NAc791eUVnyr4jHUKwKxKdChuD54+OB0X7FFST6L
 uulybBd2fzGXkjapLKlY4x/RJlCCYwQWzcJT1aiLZWcZrx/8FnZsqw0GLvGQ==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomi Valkeinen <tomi.valkeinen@ti.com>

Add DRM properties for crtc background color property. Background
color is shown on areas where there are no planes.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/omapdrm/omap_crtc.c | 22 +++++++++++++++++++++-
 drivers/gpu/drm/omapdrm/omap_drv.c  |  7 +++++++
 drivers/gpu/drm/omapdrm/omap_drv.h  |  3 +++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 06a719c104f4..4ba2d3e51b2b 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -24,6 +24,8 @@ struct omap_crtc_state {
 	unsigned int rotation;
 	unsigned int zpos;
 	bool manually_updated;
+
+	u32 default_color;
 };
 
 #define to_omap_crtc(x) container_of(x, struct omap_crtc, base)
@@ -395,13 +397,14 @@ static void omap_crtc_cpr_coefs_from_ctm(const struct drm_color_ctm *ctm,
 
 static void omap_crtc_write_crtc_properties(struct drm_crtc *crtc)
 {
+	const struct omap_crtc_state *omap_state = to_omap_crtc_state(crtc->state);
 	struct omap_drm_private *priv = crtc->dev->dev_private;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
 	struct omap_overlay_manager_info info;
 
 	memset(&info, 0, sizeof(info));
 
-	info.default_color = 0x000000;
+	info.default_color = omap_state->default_color;
 	info.trans_enabled = false;
 	info.partial_alpha_enabled = false;
 
@@ -668,6 +671,7 @@ static int omap_crtc_atomic_set_property(struct drm_crtc *crtc,
 {
 	struct omap_drm_private *priv = crtc->dev->dev_private;
 	struct drm_plane_state *plane_state;
+	struct omap_crtc_state *omap_state = to_omap_crtc_state(state);
 
 	/*
 	 * Delegate property set to the primary plane. Get the plane state and
@@ -683,6 +687,8 @@ static int omap_crtc_atomic_set_property(struct drm_crtc *crtc,
 		plane_state->rotation = val;
 	else if (property == priv->zorder_prop)
 		plane_state->zpos = val;
+	else if (property == priv->background_color_prop)
+		omap_state->default_color = val;
 	else
 		return -EINVAL;
 
@@ -701,6 +707,8 @@ static int omap_crtc_atomic_get_property(struct drm_crtc *crtc,
 		*val = omap_state->rotation;
 	else if (property == priv->zorder_prop)
 		*val = omap_state->zpos;
+	else if (property == priv->background_color_prop)
+		*val = omap_state->default_color;
 	else
 		return -EINVAL;
 
@@ -741,6 +749,8 @@ omap_crtc_duplicate_state(struct drm_crtc *crtc)
 	state->rotation = current_state->rotation;
 	state->manually_updated = current_state->manually_updated;
 
+	state->default_color = current_state->default_color;
+
 	return &state->base;
 }
 
@@ -778,6 +788,15 @@ static const char *channel_names[] = {
 	[OMAP_DSS_CHANNEL_LCD3] = "lcd3",
 };
 
+static void omap_crtc_install_properties(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_mode_object *obj = &crtc->base;
+	struct omap_drm_private *priv = dev->dev_private;
+
+	drm_object_attach_property(obj, priv->background_color_prop, 0);
+}
+
 /* initialize crtc */
 struct drm_crtc *omap_crtc_init(struct drm_device *dev,
 				struct omap_drm_pipeline *pipe,
@@ -843,6 +862,7 @@ struct drm_crtc *omap_crtc_init(struct drm_device *dev,
 		drm_mode_crtc_set_gamma_size(crtc, gamma_lut_size);
 	}
 
+	omap_crtc_install_properties(crtc);
 	omap_plane_install_properties(crtc->primary, &crtc->base);
 
 	return crtc;
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index f86e20578143..48ebd1689601 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -200,6 +200,13 @@ static int omap_modeset_init_properties(struct drm_device *dev)
 	if (!priv->zorder_prop)
 		return -ENOMEM;
 
+	/* crtc properties */
+
+	priv->background_color_prop =
+		drm_property_create_range(dev, 0, "background", 0, 0xffffff);
+	if (!priv->background_color_prop)
+		return -ENOMEM;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
index 591d4c273f02..ed69ae78ae89 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.h
+++ b/drivers/gpu/drm/omapdrm/omap_drv.h
@@ -73,6 +73,9 @@ struct omap_drm_private {
 	/* properties: */
 	struct drm_property *zorder_prop;
 
+	/* crtc properties */
+	struct drm_property *background_color_prop;
+
 	/* irq handling: */
 	spinlock_t wait_lock;		/* protects the wait_list */
 	struct list_head wait_list;	/* list of omap_irq_wait */
-- 
2.25.1

