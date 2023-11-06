Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331DC7E31CD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 01:00:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B03B10E471;
	Tue,  7 Nov 2023 00:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A5010E46F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 00:00:33 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5bdbe2de25fso83782a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 16:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699315233; x=1699920033;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9SxHcJHXQ0Dgu/1LSV/bZ2Cmouuh15UgwvxxZf23/GE=;
 b=dzzbOgW0aHWqSu1IQPN0SzYjhCCKlDQyh15N3YouHuez0LOitG3J6bFALaRvy+XmLq
 Op2QOSo3zqZxF+c2Wu9v0UDiODDJvzsL1pwCLlJtTjtq1DUKOq/rTWSFENZsJwxAqmyH
 H/3LdBm9GTaHy53Efis4x9Gp9cSnKbQFiK3lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699315233; x=1699920033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9SxHcJHXQ0Dgu/1LSV/bZ2Cmouuh15UgwvxxZf23/GE=;
 b=eiQJV5sEkyO4jQUtzsgzUMVbseYjfnSGOUbA6CFAhwq/K7hMLr2cVezTlMZzEFwFSR
 /0vuNLSMJtWn3nSSz8SjQTpu2FB4rVzZkYBQc+yEizHSKv4Hvlv+Qnut+W7lNmoHOnU8
 1RPkFm4hdeRG1rhwAMc3lI+Tu9YeauMXrhgXrLpHkhw0LKJpEctBdF+5jC2t9+MEjvAt
 KPn3UMi2IRwPooFIJ2j8hcTl0KRCNgsR1XXYGl5ULU100SpUZabT2SVnupdE5oGnN+01
 e0kqd1K2ft6rbuY+vaF0NIcYrrnqayyM3Na3t7/gHZm6ZFAPYwtxWtocDSz4+9PsN3Kt
 YJWg==
X-Gm-Message-State: AOJu0YwtxQZS6WcjD5CmwuAeJLCDdZdGZ4AupNxybUMP8cccl7qFvGs8
 +htCur5qrpyyu7+aW+WG8d4x1w==
X-Google-Smtp-Source: AGHT+IFvlKS7Uvykt7O+bbNdoVgvYg4+eR6RPh+t8uzDcjfXFvTO0Lwdmdsd5sV2bYvJc17zl3Giyg==
X-Received: by 2002:a05:6a21:790b:b0:181:125:e85c with SMTP id
 bg11-20020a056a21790b00b001810125e85cmr23690070pzc.53.1699315232986; 
 Mon, 06 Nov 2023 16:00:32 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:586c:80a1:e007:beb9])
 by smtp.gmail.com with ESMTPSA id
 fw11-20020a17090b128b00b00268b439a0cbsm5852866pjb.23.2023.11.06.16.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 16:00:32 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v5 4/4] drm/panel-edp: Avoid adding multiple preferred modes
Date: Mon,  6 Nov 2023 15:51:35 -0800
Message-ID: <20231107000023.2928195-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231107000023.2928195-1-hsinyi@chromium.org>
References: <20231107000023.2928195-1-hsinyi@chromium.org>
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
 Jessica Zhang <quic_jesszhan@quicinc.com>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a non generic edp-panel is under aux-bus, the mode read from edid would
still be selected as preferred and results in multiple preferred modes,
which is ambiguous.

If both hard-coded mode and edid exists, only add mode from hard-coded.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v4->v5: remove inapplicable comments.
---
 drivers/gpu/drm/panel/panel-edp.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index c0c24d94c3a0..006939cc3fee 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -589,6 +589,7 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 {
 	struct panel_edp *p = to_panel_edp(panel);
 	int num = 0;
+	bool has_hard_coded_modes = p->desc->num_timings || p->desc->num_modes;
 	bool has_override_edid_mode = p->detected_panel &&
 				      p->detected_panel != ERR_PTR(-EINVAL) &&
 				      p->detected_panel->override_edid_mode;
@@ -599,7 +600,11 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 
 		if (!p->edid)
 			p->edid = drm_get_edid(connector, p->ddc);
-		if (p->edid) {
+		/*
+		 * If both edid and hard-coded modes exists, skip edid modes to
+		 * avoid multiple preferred modes.
+		 */
+		if (p->edid && !has_hard_coded_modes) {
 			if (has_override_edid_mode) {
 				/*
 				 * override_edid_mode is specified. Use
@@ -616,12 +621,7 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 		pm_runtime_put_autosuspend(panel->dev);
 	}
 
-	/*
-	 * Add hard-coded panel modes. Don't call this if there are no timings
-	 * and no modes (the generic edp-panel case) because it will clobber
-	 * the display_info that was already set by drm_add_edid_modes().
-	 */
-	if (p->desc->num_timings || p->desc->num_modes)
+	if (has_hard_coded_modes)
 		num += panel_edp_get_non_edid_modes(p, connector);
 	else if (!num)
 		dev_warn(p->base.dev, "No display modes\n");
-- 
2.42.0.869.gea05f2083d-goog

