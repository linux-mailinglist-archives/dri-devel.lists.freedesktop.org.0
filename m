Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7F7245CF9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F6F6E425;
	Mon, 17 Aug 2020 07:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9461B6E261
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 21:56:34 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id b11so3812013lfe.10
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 14:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mD1tbRihw0/dSqZZEiPFcDugxOmEjVbt/2mN2YLwJu0=;
 b=gqNUb2U4Cjk6cKs9FX/HC8gOpEBKd0eI8FZomqWS834t6EEJJEqIGRo4mj7GtWHOxa
 J/XJq5dqiszoDLkonRZ2A/kjeSB5We/fz7uQX5oYcDWwvcPZJRFNqAAKY6WFyQHwUIMg
 C9u74Usn6XA1P5dRoBvMWAakW3XumhuDsvxFgYX0+8yBm75FVXjuCoXUOe0wSl42XVZy
 tzyMcWrkDssGLxvjr/g5WgtbnYl3ZbpeEx6AwwlIUpB01uEQMNlecodINpe1ftHg0bzL
 VHttyyYbglzaHyPWNPEui2RxLZZpRLrzf5C8Kl35yr5a/E9iSROnwprUbDmdqGtUCXD5
 h8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mD1tbRihw0/dSqZZEiPFcDugxOmEjVbt/2mN2YLwJu0=;
 b=PwwZPXJ5s4I5IuuEkR98gyvnDM1UIay6XsM3t38FttOCsEcqADUTwzqMA1bLFd3XIs
 HVHisH4xAhZDZuvEA7zCbrxkJ+PjpWP/bwAuGr2dcU+GxQWwEbj3WAZxvjpOCqfVr8MO
 bgRdKgmWVpeYhSs3l6AHz+GosI6mNZboThAHaHivTNOsVy4kk3nJunR1tSIEyLAUybCE
 EheZGZFkHLwvGmsd+5x141pIw9AIl8Tx1X2jxD+QJ7jE5jSr8agpzu5x1kYDbSNUDDH7
 uBHPZBEOAPrr1l4Nog2Ds9gsNuc7fLqNsbS1DQXcAUydCC9uCh21cK8zJ/82JOPf8YMc
 LxHg==
X-Gm-Message-State: AOAM532XYttL3NTZpeNfvzvD6dTsGi5d+lBRbsnkeynYmbSJ6g4KDjV1
 siVx6a4LjFSOkDBE7xdCSkM=
X-Google-Smtp-Source: ABdhPJxXJ9rih0Dt3yP8eoAOGHV6bcCBCyfCb2U266j6QPsBxHM2lQQLP+giJn7kGx36Kmk7Mtk3uw==
X-Received: by 2002:a19:830a:: with SMTP id f10mr3172796lfd.28.1597355792965; 
 Thu, 13 Aug 2020 14:56:32 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id z20sm1349977ljk.97.2020.08.13.14.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 14:56:32 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>
Subject: [PATCH RESEND v12 3/4] drm/panel: lvds: Read panel orientation
Date: Fri, 14 Aug 2020 00:56:08 +0300
Message-Id: <20200813215609.28643-4-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200813215609.28643-1-digetx@gmail.com>
References: <20200813215609.28643-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The panel orientation needs to parsed from a device-tree and assigned to
the panel's connector in order to make orientation property available to
userspace. That's what this patch does for the generic LVDS panel.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/panel/panel-lvds.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 5ce3f4a2b7a1..f62227059090 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -37,6 +37,8 @@ struct panel_lvds {
 
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *reset_gpio;
+
+	enum drm_panel_orientation orientation;
 };
 
 static inline struct panel_lvds *to_panel_lvds(struct drm_panel *panel)
@@ -99,6 +101,7 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 	connector->display_info.bus_flags = lvds->data_mirror
 					  ? DRM_BUS_FLAG_DATA_LSB_TO_MSB
 					  : DRM_BUS_FLAG_DATA_MSB_TO_LSB;
+	drm_connector_set_panel_orientation(connector, lvds->orientation);
 
 	return 1;
 }
@@ -116,6 +119,13 @@ static int panel_lvds_parse_dt(struct panel_lvds *lvds)
 	const char *mapping;
 	int ret;
 
+	ret = of_drm_get_panel_orientation(np, &lvds->orientation);
+	if (ret < 0) {
+		dev_err(lvds->dev, "%pOF: problems parsing rotation (%d)\n",
+			np, ret);
+		return ret;
+	}
+
 	ret = of_get_display_timing(np, "panel-timing", &timing);
 	if (ret < 0) {
 		dev_err(lvds->dev, "%pOF: problems parsing panel-timing (%d)\n",
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
