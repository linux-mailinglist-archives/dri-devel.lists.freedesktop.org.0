Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A5753E08F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 06:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4034C112368;
	Mon,  6 Jun 2022 04:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EC310FB9A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 04:47:37 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id q18so11207516pln.12
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jun 2022 21:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j5js470YBzKdTaXPl+QQ3rHxeotAooP4m8EcPovVk7E=;
 b=jsy7p+Ffk83iH0WeQKhkJUtkuFwG2INATX6huMKL3o2tgG0gGW3qfw6O/Y1Oi1MDyg
 86riQ5YlrwYS7iGY1PePFPe+QKpOOSPUS/fFSgbsGS9/VB15qANkhc1m6SHZ/SEYuU7k
 2XcBTzVWeh3t3DXe0/FAfRY1xILCc0/LrypXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j5js470YBzKdTaXPl+QQ3rHxeotAooP4m8EcPovVk7E=;
 b=E/5eFicNOFZTN/Qw3PZnN2eWIvEoMxHGlP+7898UMrf1Lb8iLNuUeziMuANLM5gGG8
 USbqf0WIbxrO8B0XI1+GBQSnUjXzZuQ+boG6UiXd5S5KXVOqegfqVSjedZqfaGR9PCgg
 l09aUhBNRB9ofaSQYTWfgAkYkXSImmnfS/uAwKK+yGMPVtodnEkHMrkDP8bEuI3Uxzdd
 Q+q3TUaVmFGIY+25DrHLgMASmiMErtn76uo7wVs8vOr6pMlaadfGAPDhQtKIm+rO3yWJ
 OFhm9dgS6CwV3Rpt5ZkWOhM1O9zoi+o3An2ZLNWW4zRqTKdN6WsxB7Sc1kZlohAq9PSM
 aQPQ==
X-Gm-Message-State: AOAM533opducn2J22XNg6xVGQLU66qUn2vkYUXqW9xM8kHdANCF4I2Ki
 YqbJb0fHB5hlW5GoDeUGIPFh3Q==
X-Google-Smtp-Source: ABdhPJy42F5uKW7n3PhvsBm2Wpi4Be0H0h9tOi7rmAJO1h8CZRqP4ccOd2jEJ378wYUXbDk+hWrJJg==
X-Received: by 2002:a17:902:8648:b0:167:86f2:aec3 with SMTP id
 y8-20020a170902864800b0016786f2aec3mr986607plt.172.1654490857525; 
 Sun, 05 Jun 2022 21:47:37 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ced3:b110:401b:b32c])
 by smtp.gmail.com with ESMTPSA id
 t190-20020a6381c7000000b003db7de758besm9718609pgd.5.2022.06.05.21.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 21:47:37 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v3 3/8] drm/panel: panel-edp: Implement .get_orientation
 callback
Date: Mon,  6 Jun 2022 12:47:15 +0800
Message-Id: <20220606044720.945964-4-hsinyi@chromium.org>
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

To return the orientation property to drm/kms driver.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v2->v3: add comments for notice.
---
 drivers/gpu/drm/panel/panel-edp.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 1732b4f56e38..5fa208005395 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -586,7 +586,12 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 	else if (!num)
 		dev_warn(p->base.dev, "No display modes\n");
 
-	/* set up connector's "panel orientation" property */
+	/*
+	 * drm drivers are expected to call drm_panel_get_orientation() to get
+	 * panel's orientation then drm_connector_set_panel_orientation() to
+	 * set the property before drm_dev_register(). Otherwise there will be
+	 * a WARN_ON if orientation is set after drm is registered.
+	 */
 	drm_connector_set_panel_orientation(connector, p->orientation);
 
 	return num;
@@ -609,6 +614,13 @@ static int panel_edp_get_timings(struct drm_panel *panel,
 	return p->desc->num_timings;
 }
 
+static enum drm_panel_orientation panel_edp_get_orientation(struct drm_panel *panel)
+{
+	struct panel_edp *p = to_panel_edp(panel);
+
+       return p->orientation;
+}
+
 static int detected_panel_show(struct seq_file *s, void *data)
 {
 	struct drm_panel *panel = s->private;
@@ -637,6 +649,7 @@ static const struct drm_panel_funcs panel_edp_funcs = {
 	.prepare = panel_edp_prepare,
 	.enable = panel_edp_enable,
 	.get_modes = panel_edp_get_modes,
+	.get_orientation = panel_edp_get_orientation,
 	.get_timings = panel_edp_get_timings,
 	.debugfs_init = panel_edp_debugfs_init,
 };
-- 
2.36.1.255.ge46751e96f-goog

