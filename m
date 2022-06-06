Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F02A253E566
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 17:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A517811232E;
	Mon,  6 Jun 2022 15:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA6D11232E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 15:24:51 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id b5so12347733plx.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 08:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JUUMSUxjqpGlmr3hthDS9G4YblhtZnmP+Xt3CB0AHAw=;
 b=MM9wCxMHjra8vSnY99x51x6RVe62qnapf1dqn+TZ9V6KMLtMycNavxNRE0f2U7wBnO
 dSH0v42r3ErXXt7j22NXnI+Be3YKWIHWXNkU5iPsPIWtsk8gDOrVq68MESt0950u85Xf
 i4r5p4PXFFCfquE0opsQ7jduBXRim/P69Sfu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JUUMSUxjqpGlmr3hthDS9G4YblhtZnmP+Xt3CB0AHAw=;
 b=fdXVkC8UWikA/GLKfD0P2JZC6OUSzatVyn+K84j0C3oCNSIalLV20ubEbtldq9LLQC
 fUw7evIqfcfl5SO7GWu5ZlsNladYsYYfugwjtKD8a/C22Pxw3QcHcXqKI6HI3LoU41BS
 H49bRN/WAcHoT9mA0FW6ZyrlfecKdNNC/U3qPES40g/XmX/FK3dt5YokxqIWFtC+IwpC
 oBApKS7lWJ8F90P5ECOl4ARm78aaZ3U1SijniQ0ojCAbvHYR9OPICjWl+cP8/0Zcm2mb
 j3K1EPgYifwSbWI041WXiCzA8im3U4tCLSeOUyjnhlv3l5Rd8RDhsqG9G7H46rqwCA/R
 7Dqg==
X-Gm-Message-State: AOAM530kHmUk5uTpU6rR6i7TqQFc35P23x84RgYxASa+y1g6MYMlQBdY
 6ZnnCun6nQeJ8wKaaAiIsXjs/g==
X-Google-Smtp-Source: ABdhPJyfS7sG1ItRoGo2m20r8vhB47EXPGK0Qy9fOfm5yN9s8qx5qB50fptn8+CQbBgByjupLlzaxQ==
X-Received: by 2002:a17:902:e889:b0:167:523c:6011 with SMTP id
 w9-20020a170902e88900b00167523c6011mr15889647plg.114.1654529091208; 
 Mon, 06 Jun 2022 08:24:51 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a0a:5e4:e24:c8c4]) by smtp.gmail.com with ESMTPSA id
 h1-20020a655181000000b003fbaae74971sm10749306pgq.72.2022.06.06.08.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 08:24:50 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v4 4/8] drm/panel: lvds: Implement .get_orientation callback
Date: Mon,  6 Jun 2022 23:24:27 +0800
Message-Id: <20220606152431.1889185-5-hsinyi@chromium.org>
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
v3->v4: rebase to latest linux-next to solve conflict.
---
 drivers/gpu/drm/panel/panel-lvds.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index f11252fb00fe..491b64c2c8d6 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -99,15 +99,30 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 	drm_display_info_set_bus_formats(&connector->display_info,
 					 &lvds->bus_format, 1);
 	connector->display_info.bus_flags = lvds->bus_flags;
+
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

