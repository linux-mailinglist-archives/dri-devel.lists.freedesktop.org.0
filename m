Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B189E7DE75D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 22:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D5310E7B4;
	Wed,  1 Nov 2023 21:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DF210E7B2
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 21:26:12 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-280260db156so284979a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 14:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698873972; x=1699478772;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=keM6xgaqk4y5F5Fy9cbvhHzonhRhCtU3xaG8qjxRs74=;
 b=LJQT1WVEO1A4o9WZQYvOh0OoiWjszSobiGrhkaCHKlUb0jIdmqMXijaCjqfHQY8kHk
 6Ho0EHKpAwhWrLn8wIc34DjWE1rmYExMGxAwp5Sbjf72sjYKdxglxqP/6PXikeTwA+Un
 ik+IWSgnhiYGBZp0l1ABfcsq1tP+WY+59k67w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698873972; x=1699478772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=keM6xgaqk4y5F5Fy9cbvhHzonhRhCtU3xaG8qjxRs74=;
 b=Cdn36RCEecRLNPUpVHOPMlZYmKo6z3ncuey+qMa+s3gWLwQUtm4KFYsrzJuhZvdI9Q
 8IRFBHmJ/hXNjyvPiNeTIKNauR2jR0VhT+JF9iL1W04xIepOvu6ZZFckpSayp9EfQIp3
 VWMvBnDPRsFcVoyX77nsC8OG08QIr2HR4uTZCHwG0XN0hZNAKk6kPMecpjuRwlIW0Bib
 de17r4PsBV6xBd73VaP2XFlDNZU7JPAQt31BRNXNvFsoOkhWY5ecPhSvjRvu7lvHc5mW
 zOL4MpdNoga3+HPm2dlpqd24UXuIh//BCEzwxs7D4kQ6J5yDc9OWwgpyYo3tJWE7zGOu
 tGJA==
X-Gm-Message-State: AOJu0YyKANS93oozbTTy3ec8r788dPJjQwQz4ynB4na/wsflFa5EL6Rm
 /GI1HCK55E95KacAfRn9UzsGuA==
X-Google-Smtp-Source: AGHT+IFJslIGJU7A2/YPceX8PHGElxQ1whLtbPlYdX+GrlOIjg+IOa63DnZoHTC5pBxg7dwe30PYSQ==
X-Received: by 2002:a17:90a:fc88:b0:280:18bd:ffe7 with SMTP id
 ci8-20020a17090afc8800b0028018bdffe7mr11725904pjb.48.1698873971885; 
 Wed, 01 Nov 2023 14:26:11 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:b410:473c:2b92:2e2e])
 by smtp.gmail.com with ESMTPSA id
 ds21-20020a17090b08d500b00274262bcf8dsm1212976pjb.41.2023.11.01.14.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 14:26:11 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 3/3] drm/panel-edp: Choose correct preferred mode
Date: Wed,  1 Nov 2023 14:20:11 -0700
Message-ID: <20231101212604.1636517-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231101212604.1636517-1-hsinyi@chromium.org>
References: <20231101212604.1636517-1-hsinyi@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a non generic edp-panel is under aux-bus, the mode read from edid would
still be selected as preferred and results in multiple preferred modes,
which is ambiguous.

If a hard-coded mode is present, unset the preferred bit of the modes read
from edid.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/drm_modes.c       | 16 ++++++++++++++++
 drivers/gpu/drm/panel/panel-edp.c |  7 +++++--
 include/drm/drm_modes.h           |  1 +
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index ac9a406250c5..35927467f4b0 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1933,6 +1933,22 @@ void drm_connector_list_update(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_connector_list_update);
 
+/**
+ * drm_mode_unset_preferred - clear the preferred status on existing modes.
+ * @connector: the connector to update
+ *
+ * Walk the mode list for connector, clearing the preferred status on existing
+ * modes.
+ */
+void drm_mode_unset_preferred_modes(struct drm_connector *connector)
+{
+	struct drm_display_mode *cur_mode;
+
+	list_for_each_entry(cur_mode, &connector->probed_modes, head)
+		cur_mode->type &= ~DRM_MODE_TYPE_PREFERRED;
+}
+EXPORT_SYMBOL_GPL(drm_mode_unset_preferred_modes);
+
 static int drm_mode_parse_cmdline_bpp(const char *str, char **end_ptr,
 				      struct drm_cmdline_mode *mode)
 {
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 0883ff312eba..b3ac473b2554 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -622,10 +622,13 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 	 * and no modes (the generic edp-panel case) because it will clobber
 	 * the display_info that was already set by drm_add_edid_modes().
 	 */
-	if (p->desc->num_timings || p->desc->num_modes)
+	if (p->desc->num_timings || p->desc->num_modes) {
+		/* hard-coded modes present, unset preferred modes from edid. */
+		drm_mode_unset_preferred_modes(connector);
 		num += panel_edp_get_non_edid_modes(p, connector);
-	else if (!num)
+	} else if (!num) {
 		dev_warn(p->base.dev, "No display modes\n");
+	}
 
 	/*
 	 * TODO: Remove once all drm drivers call
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index c613f0abe9dc..301817e00a15 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -560,6 +560,7 @@ void drm_mode_prune_invalid(struct drm_device *dev,
 			    struct list_head *mode_list, bool verbose);
 void drm_mode_sort(struct list_head *mode_list);
 void drm_connector_list_update(struct drm_connector *connector);
+void drm_mode_unset_preferred_modes(struct drm_connector *connector);
 
 /* parsing cmdline modes */
 bool
-- 
2.42.0.869.gea05f2083d-goog

