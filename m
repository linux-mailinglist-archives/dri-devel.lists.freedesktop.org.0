Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9794353E090
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 06:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205DF10FB9A;
	Mon,  6 Jun 2022 04:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACC810FB9A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 04:47:41 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id y196so11809770pfb.6
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jun 2022 21:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jJ29kS9c54d0XZMXg/mI13/u5APCZGzRFuqJAJLTaSY=;
 b=Kx8+twWhs/MPzSGyOLbfniqa2/hFoAzxdS5zJtPY3HxAawuRcw8KkL4mgSmRFD6xAy
 TLCEAO9autEMesNlLsqrz0eEEQehlWzf4CMj7ow9KfICb0QKPZKvjj9jjU0uLAN+BCde
 ZWUMw6pzqRfkezTfLlpU8gnUUiZhoVvmX6dWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jJ29kS9c54d0XZMXg/mI13/u5APCZGzRFuqJAJLTaSY=;
 b=2WfcpIRJ3+0Fm4dVYJP/k+mZWxZxEY+OVmFnjMK/jQ+duqD3t4ZVmiL8uj6SkYcWTD
 FZBorE99XmqFOq8VI1Ys/ozT7ShSZsjpIlJZX8OgqusCu5UlF0myTMd+e9/RPLeLV5JW
 2KKM+Nb2K4tLQHVVsellFoVj5ddhiBUK/i2dAHh8ewAcKlnA3g4yrS5VoksEQuZ0xyV7
 YluEzDVJnfafbZWtEC74jvYwUQbf+N0HiYdbo1jEVGRor+SwcFmcUX9O7wkME4nGZqAK
 TU6mUvjq5/0x/mgVKTILPV4ld0aD/w+VtCCzQ61JUGyw/MhHHHPEB65yw86GGY6ahiaZ
 kKVA==
X-Gm-Message-State: AOAM530bZS/gx4Z1tmDoZVS5NI9U526JowH+NVAXhSiOSlPXXdicyW3b
 09CqJOB5inzWLT3mn8Mhc/UeJg==
X-Google-Smtp-Source: ABdhPJxboXw4784UYCoUHqaFDgjTzJl4vu2MwUNiNzP8AEvIWZFJ27MkePTqp5g456Y0NeSDSc3yvg==
X-Received: by 2002:a62:e116:0:b0:51b:c452:47e6 with SMTP id
 q22-20020a62e116000000b0051bc45247e6mr21890310pfh.25.1654490861026; 
 Sun, 05 Jun 2022 21:47:41 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ced3:b110:401b:b32c])
 by smtp.gmail.com with ESMTPSA id
 t190-20020a6381c7000000b003db7de758besm9718609pgd.5.2022.06.05.21.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 21:47:40 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v3 4/8] drm/panel: lvds: Implement .get_orientation callback
Date: Mon,  6 Jun 2022 12:47:16 +0800
Message-Id: <20220606044720.945964-5-hsinyi@chromium.org>
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
 drivers/gpu/drm/panel/panel-lvds.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 27a1c9923b09..239527409b00 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -102,15 +102,29 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 	connector->display_info.bus_flags = lvds->data_mirror
 					  ? DRM_BUS_FLAG_DATA_LSB_TO_MSB
 					  : DRM_BUS_FLAG_DATA_MSB_TO_LSB;
+	/*
+	 * drm drivers are expected to call drm_panel_get_orientation() to get
+	 * panel's orientation then drm_connector_set_panel_orientation() to
+	 * set the property before drm_dev_register(). Otherwise there will be
+	 * a WARN_ON if orientation is set after drm is registered.
+	 */
 	drm_connector_set_panel_orientation(connector, lvds->orientation);
 
 	return 1;
 }
 
+static enum drm_panel_orientation panel_lvds_get_orientation,(struct drm_panel *panel)
+{
+       struct panel_lvds *lvds = to_panel_lvds(panel);
+
+       return lvds->orientation;
+}
+
 static const struct drm_panel_funcs panel_lvds_funcs = {
 	.unprepare = panel_lvds_unprepare,
 	.prepare = panel_lvds_prepare,
 	.get_modes = panel_lvds_get_modes,
+	.get_orientation = panel_lvds_get_orientation,
 };
 
 static int panel_lvds_parse_dt(struct panel_lvds *lvds)
-- 
2.36.1.255.ge46751e96f-goog

