Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD0E7E4A06
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 21:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0D710E6A7;
	Tue,  7 Nov 2023 20:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B4110E6A7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 20:46:23 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3b2df2fb611so4231841b6e.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 12:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699389983; x=1699994783;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=91MByGmQVl2taa6i/AdbRt3neF5iZF/QU7vQ/CbO+ic=;
 b=juVrfizFU5QNof0OupzcQ/eT0f6lU9NoAoTQ1ZkgZupe1Obtyl5j8abaruW9G9bDoj
 3qGbhB3ZZFQW5fKrhsT2zMYGFO0uYT4zh/7bzgPTSu0oNdlzy34eaW8S2FtVTFrU9BYJ
 c3yZSVHIzCoL7IHdA7gxlsRP0d9ElkKTGLVMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699389983; x=1699994783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=91MByGmQVl2taa6i/AdbRt3neF5iZF/QU7vQ/CbO+ic=;
 b=ObejXW18LF0ct7JYjr7TQyAzZlh2Ti+7ista7PyggN+GtegptSFeyxFwPvw70lalXD
 D9rdEY0vDMDd6Bh5B7C/5SeYaMKnzcLqNkvbcWCwH/mTlI3Z2AEvPpccvLlTgvQN9G+7
 x7WzTb+8BFkPwwnTK95Bahug7ypHOc61BbxDG83m4NxDypOsI1WQka9uQQ27L6OuObXs
 HDbB1XnsFJhwQd9foEOR5XZBBJqz5QP2oSJauiW2S0lEPxRDuFfhQYPXADKm3wmd8RO+
 mAFfPoEEPoZaxICSr1HPS8lxXCnEdOsnH/eU8oPb4+Lo7WSZzcfVbVIeiCnOTwBQk+gj
 9pDQ==
X-Gm-Message-State: AOJu0YwNmISsvAoDKQDBZ6NWcmWBDynkYmKJ8w3Q7lbo7/umtEwterli
 Yff99GJcyp5kNBQpNOnTGR1f3Q==
X-Google-Smtp-Source: AGHT+IHOdRvi2sA6xJA8wOXbmKn0wVvuBxDWH43DQAj9SH8vpgSEQnHazF4kXFckivDZv66HPcNLEA==
X-Received: by 2002:a05:6870:2423:b0:1e9:b025:cf88 with SMTP id
 n35-20020a056870242300b001e9b025cf88mr4646934oap.36.1699389983229; 
 Tue, 07 Nov 2023 12:46:23 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:586c:80a1:e007:beb9])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a630f07000000b005ab46970aaasm1750211pgl.17.2023.11.07.12.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 12:46:22 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 5/5] drm/panel-edp: Avoid adding multiple preferred modes
Date: Tue,  7 Nov 2023 12:41:55 -0800
Message-ID: <20231107204611.3082200-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231107204611.3082200-1-hsinyi@chromium.org>
References: <20231107204611.3082200-1-hsinyi@chromium.org>
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
no change.
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

