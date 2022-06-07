Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D2253F908
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 11:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFF311A40A;
	Tue,  7 Jun 2022 09:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B88C112FE5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 09:06:13 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id i1so14299944plg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 02:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hkt2l/tO7WYacCl3ivjTi6HGPHGi5NrMwDGXS9zHi3w=;
 b=HKI56lq5igyQeKgyyIqASr2VCu3+pT9siwjRtEo3q3xCuBFlEAce2uIG1aG3NqbRxx
 Bi3f+3QlYQIFoTudRE/CoNXXS60RYvhisuyogmtBpm8JNYPyLJm93E7hUNq0bPE7E3wr
 MzH+y1JYIRGuCPOgZlP7fGUe+7MJkLeNMCFkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hkt2l/tO7WYacCl3ivjTi6HGPHGi5NrMwDGXS9zHi3w=;
 b=a3iyGKx9i3z7dSdKqaRvnEYE50cLwcdRAtW2DdvA8cRsrBFyFtoceS8gf/MPA6LC93
 biEXL+IjXzZXLZUAGg0MwV9W41/f6n0p8RhtVgclqyWvmPNMAvckAEFyfnrUdY0nFMBT
 5gesrtAIPNS7GlvQj4pYmf43wHJMt7Ri0G5bH8tx8brJgmzfXOpgXz18VT91EJDx2DHk
 zQg+GvoYKMq6KaZ7hDQ7NGl/s0SaRwBWh1AZN2A06tY0NSmohwcwUjHH9GJzUuBbkyyZ
 nznVXPO8A2jhWpeXdo0o4Oo42aDyFJonu5an0j+U4ompNAWnYqNbZRKBjx/y/vn4Lcc8
 Iw4g==
X-Gm-Message-State: AOAM530wGZQNpqurc3mMNzTSSNuv2ynhSk0sJuHnj7bmBdlkWN5yzT/M
 htBLxHG4TiIUuX9VvhugkObRxA==
X-Google-Smtp-Source: ABdhPJwQgiNLMIZtppqeYqzT8XKH3y3+vFRRwA/niksJDMFoL3S6gwS/5deq8RA1segUx7+d/t8x4A==
X-Received: by 2002:a17:902:d4cf:b0:167:735a:e7a1 with SMTP id
 o15-20020a170902d4cf00b00167735ae7a1mr12121479plg.161.1654592772767; 
 Tue, 07 Jun 2022 02:06:12 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:40b7:55ce:10ee:c7a0])
 by smtp.gmail.com with ESMTPSA id
 t27-20020aa7947b000000b0051c0fe8fb8csm4507010pfq.95.2022.06.07.02.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:06:12 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v5 5/8] drm/panel: panel-simple: Implement .get_orientation
 callback
Date: Tue,  7 Jun 2022 17:05:46 +0800
Message-Id: <20220607090549.2345795-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220607090549.2345795-1-hsinyi@chromium.org>
References: <20220607090549.2345795-1-hsinyi@chromium.org>
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
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
v4->v5:
sort callbacks.
---
 drivers/gpu/drm/panel/panel-simple.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4a2e580a2f7b..b4b919525189 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -411,7 +411,10 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 	/* add hard-coded panel modes */
 	num += panel_simple_get_non_edid_modes(p, connector);
 
-	/* set up connector's "panel orientation" property */
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
 	drm_connector_set_panel_orientation(connector, p->orientation);
 
 	return num;
@@ -434,12 +437,21 @@ static int panel_simple_get_timings(struct drm_panel *panel,
 	return p->desc->num_timings;
 }
 
+static enum drm_panel_orientation panel_simple_get_orientation(struct drm_panel *panel)
+{
+       struct panel_simple *p = to_panel_simple(panel);
+
+       return p->orientation;
+}
+
+
 static const struct drm_panel_funcs panel_simple_funcs = {
 	.disable = panel_simple_disable,
 	.unprepare = panel_simple_unprepare,
 	.prepare = panel_simple_prepare,
 	.enable = panel_simple_enable,
 	.get_modes = panel_simple_get_modes,
+	.get_orientation = panel_simple_get_orientation,
 	.get_timings = panel_simple_get_timings,
 };
 
-- 
2.36.1.255.ge46751e96f-goog

