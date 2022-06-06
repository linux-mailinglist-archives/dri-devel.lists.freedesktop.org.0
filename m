Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 276A753E08D
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 06:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6555010F2AB;
	Mon,  6 Jun 2022 04:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D03710F2AB
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 04:47:31 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 k5-20020a17090a404500b001e8875e6242so881928pjg.5
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jun 2022 21:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8MQxz8kqIDAZ2fZ4kfRiAMdgAPZT0OSWTELIOXH4bpA=;
 b=bijG36Pt+M1nDEyjoGMrkaI9t4WYfcYdP+WZvFtG4qqKlRVCURyenQorZwvdwzgOV2
 rgV2/0rYZAVwdMhSIzPujdPzeTd3lkGeRkbFI1yuY0dQnqMJr+1tpT4r0onWdGqgqkHa
 GqYdc69FSkzbyYjUAq914jSACIJVZt8JnQi1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8MQxz8kqIDAZ2fZ4kfRiAMdgAPZT0OSWTELIOXH4bpA=;
 b=yTDuaUyrPJli6aS/n+cSIm8I65NI2E9UcpvSo5Dbrx4WM/6Dcgz1WVo89WEzliFWQQ
 L0bWWnq+p0ORw2HPiZELe8Yv355CvGvpynLJURk8mSGfJnn9n3tHrcAxWW39vQmy0Q57
 lES/KNspNuJM7xvl06b/Ft1Fpx5U8PjvMupzp5E8VWj+FbFbzbyfUB3cBSPCqw1ZYWdl
 rLxxo+2EfQ9+kbk+S3vJOv4EnSQeNRG1iP1Be+DvZ+VHOPe7bj3z5FTVszwo5DCcSrFr
 4JluU2YBBKq/sSy5VMovynCfFtZrxLbF5T8+FVrVMeMx9uWUbhHPVFHECP3C3xiVObD9
 9FNw==
X-Gm-Message-State: AOAM530+qzYh0XNSS3ZKnDQsXC0W6Na3Kw9f99Hq1DREHoGkp4X0z8rt
 Gsc+9xiyGpoKIffFthFMlog2CA==
X-Google-Smtp-Source: ABdhPJyEhyggeaOMzIgoDx50rqIZ96LmNePoBj+W9JhZTpmi9YNIR5A0G9TFAJu584hNP5KsKh6jeg==
X-Received: by 2002:a17:90b:38c1:b0:1e8:5df7:cfd8 with SMTP id
 nn1-20020a17090b38c100b001e85df7cfd8mr10240268pjb.79.1654490850677; 
 Sun, 05 Jun 2022 21:47:30 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ced3:b110:401b:b32c])
 by smtp.gmail.com with ESMTPSA id
 t190-20020a6381c7000000b003db7de758besm9718609pgd.5.2022.06.05.21.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 21:47:30 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v3 1/8] drm/panel: Add an API drm_panel_get_orientation() to
 return panel orientation
Date: Mon,  6 Jun 2022 12:47:13 +0800
Message-Id: <20220606044720.945964-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606044720.945964-1-hsinyi@chromium.org>
References: <20220606044720.945964-1-hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panels usually call drm_connector_set_panel_orientation(), which is
later than drm/kms driver calling drm_dev_register(). This leads to a
WARN().

The orientation property is known earlier. For example, some panels
parse the property through device tree during probe.

Add an API to return the property from panel to drm/kms driver, so the
drivers are able to call drm_connector_set_panel_orientation() before
drm_dev_register().

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v2->v3: no change
---
 drivers/gpu/drm/drm_panel.c |  8 ++++++++
 include/drm/drm_panel.h     | 10 ++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index f634371c717a..4a512ca80673 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -223,6 +223,14 @@ int drm_panel_get_modes(struct drm_panel *panel,
 }
 EXPORT_SYMBOL(drm_panel_get_modes);
 
+enum drm_panel_orientation drm_panel_get_orientation(struct drm_panel *panel)
+{
+	if (panel && panel->funcs && panel->funcs->get_orientation)
+		return panel->funcs->get_orientation(panel);
+
+	return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+}
+EXPORT_SYMBOL(drm_panel_get_orientation);
 #ifdef CONFIG_OF
 /**
  * of_drm_find_panel - look up a panel using a device tree node
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 1ba2d424a53f..d1bd3be4bbdf 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -133,6 +133,15 @@ struct drm_panel_funcs {
 	 * Allows panels to create panels-specific debugfs files.
 	 */
 	void (*debugfs_init)(struct drm_panel *panel, struct dentry *root);
+
+	/**
+	 * @get_orientation:
+	 *
+	 * Return the panel orientation set by device tree or EDID.
+	 *
+	 * This function is optional.
+	 */
+	enum drm_panel_orientation (*get_orientation)(struct drm_panel *panel);
 };
 
 /**
@@ -195,6 +204,7 @@ int drm_panel_enable(struct drm_panel *panel);
 int drm_panel_disable(struct drm_panel *panel);
 
 int drm_panel_get_modes(struct drm_panel *panel, struct drm_connector *connector);
+enum drm_panel_orientation drm_panel_get_orientation(struct drm_panel *panel);
 
 #if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL)
 struct drm_panel *of_drm_find_panel(const struct device_node *np);
-- 
2.36.1.255.ge46751e96f-goog

