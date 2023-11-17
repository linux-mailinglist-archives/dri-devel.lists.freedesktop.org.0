Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 895237EFB11
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 22:51:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFC210E798;
	Fri, 17 Nov 2023 21:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCAE10E1A7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 21:51:05 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-27ff83feb29so2120428a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 13:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700257864; x=1700862664;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z+W2o/1Mm+Zk29DqmS4Z9iJYsZDg6ej8XviFhoNK3hc=;
 b=gaRawdUv7JIf9GCyg0VNDV2Ve4uusBscEYq3rj1xWUGviKDEBLcNF83eUOWbR+h6dT
 aWfqdXs7a82ojcvdElmIfP7XfRuHc88XJPTN7IYETKZPc0vacYIZTXEtDQXsZawtzd3y
 oBKBHUbC3E0b2+6kG55mbZb6/aHN7/VJcNjwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700257864; x=1700862664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z+W2o/1Mm+Zk29DqmS4Z9iJYsZDg6ej8XviFhoNK3hc=;
 b=cmxedP3dq2i7jUJXXQgRL801yym7Cn+uG76AlX8QPjkX0uigPjIli5MpcnzDaalfUU
 cZnqTjhAWrSXlJB4noaaRkqMtsO3EcHAgKohDi6q+hSY08AJjehEEedW/JRUG/NZ1mIo
 1Y9CbRFVw+pT8S9FWXXKyUxxt6mk8K+AEW+t8x7u+ca61Yqaabm73VWGwKRK5/WRunRf
 Ud8dCZbA8Ydn6SeU/2bkPSG8xK2iE4DQHPsqwSsrBkqnFTGthY1KlLYGbbuSqPRnWLcR
 jNnmsWBATuWynFiLhTBf9RTFynnpndfTjwoC89kHIHwkbCxaZGLiJKm8laeoNc81Fu54
 w6lQ==
X-Gm-Message-State: AOJu0Yz7daNeXCOWCJ5Tv9vUscJCppcpt0ID34ZXh820yto6kSXPlK/w
 Zb8VOCi7bu81y/B4hJuJk3ksyX93zFIOdNZ4PHs=
X-Google-Smtp-Source: AGHT+IEoYZev4e+4BlmjL2DESxBNbWnVwfPVQGbvcEHXfE9mi8zXCgvFODYt3RwfTHBziPMiCXhH6g==
X-Received: by 2002:a17:90b:3014:b0:27d:8ad:c4e1 with SMTP id
 hg20-20020a17090b301400b0027d08adc4e1mr922828pjb.19.1700257864607; 
 Fri, 17 Nov 2023 13:51:04 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:7ed:b095:f0ba:5801])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a17090aca0700b00256b67208b1sm3639587pjt.56.2023.11.17.13.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 13:51:04 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v7 3/3] drm/panel-edp: Avoid adding multiple preferred modes
Date: Fri, 17 Nov 2023 13:46:34 -0800
Message-ID: <20231117215056.1883314-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
In-Reply-To: <20231117215056.1883314-1-hsinyi@chromium.org>
References: <20231117215056.1883314-1-hsinyi@chromium.org>
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
v6->v7: no change
---
 drivers/gpu/drm/panel/panel-edp.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 3e144145a6bd..825fa2a0d8a5 100644
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
2.43.0.rc0.421.g78406f8d94-goog

