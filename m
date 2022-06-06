Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ED453E565
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 17:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA0311232A;
	Mon,  6 Jun 2022 15:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A39311232A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 15:24:48 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 d12-20020a17090abf8c00b001e2eb431ce4so12844836pjs.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NhoEcPNDHmfOm0zH51yFx0TR/S9SyI37TTBudlPfFt8=;
 b=bLmVV9G8nxZ0DbEYeB04GCYrVF2yXJrTwxLlXkwIBhzX21qKiBs6l8Dwx7L84vs3+B
 twAgdvwouWoMicxROrFcPiYDyKUdr556My/cs1kZ3Wg12HmivoQ1fmW6YwiVviprIKCC
 SbKLVBBE9VUMN6dWFdzXWoIC8MuBLA5+G1v8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NhoEcPNDHmfOm0zH51yFx0TR/S9SyI37TTBudlPfFt8=;
 b=vt/CPRsOcN/BOJAgVo4iYC+Vq+pySIvxiWL2iQLDJXSm3Cpe6WdVA+GK4I8F+SG5T/
 wN0uiy0QRZ+1yX067pZlOm9fXYSBktS4m90jh0kCKf/npWX6Vwt9jI/K+BZrWkNMwk33
 TtoPY+OiAJMredekmGjCSIvcoGQS2PH3usIZwY7s0XB+9L3op8E9ZfTNJFL8QRI6G7TL
 m//0u2+D0flcK7D4+4tTXgi0SFOKtFKe3TKBRH4Qb0a52RIz2k/3JgOVCgF/NbtAyipQ
 nATv9jGdf3T0dwpBF4g5gDKvD8HzqVheUhADAWr985DX9MX9Ctx+xebjW1w0TzLN1lFj
 5sGQ==
X-Gm-Message-State: AOAM5337TOGe85zI6qMaJuVg35gxCGv+BE86s3QwE5gl8Y5BcIAUBAzR
 NK3IG10NRlr8iHb+zS/XxxnrNQ==
X-Google-Smtp-Source: ABdhPJxPYz+Q+mHzIjxIOF/yZTOqS5+EjnzCHFxRtrzlos9dAuMVZ1mQE6TR5g/A7yPEiSYYDrsMmQ==
X-Received: by 2002:a17:902:7781:b0:161:c85a:8fff with SMTP id
 o1-20020a170902778100b00161c85a8fffmr24699866pll.97.1654529087820; 
 Mon, 06 Jun 2022 08:24:47 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a0a:5e4:e24:c8c4]) by smtp.gmail.com with ESMTPSA id
 h1-20020a655181000000b003fbaae74971sm10749306pgq.72.2022.06.06.08.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 08:24:47 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v4 3/8] drm/panel: panel-edp: Implement .get_orientation
 callback
Date: Mon,  6 Jun 2022 23:24:26 +0800
Message-Id: <20220606152431.1889185-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606152431.1889185-1-hsinyi@chromium.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index c96014464355..c0a43bc7d24a 100644
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

