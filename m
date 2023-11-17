Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E877EFB0D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 22:51:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135DA10E1A7;
	Fri, 17 Nov 2023 21:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C504D10E13D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 21:51:02 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6b1d1099a84so2388446b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 13:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700257862; x=1700862662;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e5wbvoHrw5gghSmYXqYsGypau9Ymfce8CXWliYyG7ds=;
 b=XJJbuHQEKPpLkdBJyg+nTZGVqh1TEE9/GJOtiQGc+dV7X3lCLYbHGlLeKcSVg1x/vw
 eXX+cLdpX5tiMlMeGW+dlIqqn5GshtpltVEQyQg6GNaLVPyciT1Y2qaJ8amlVupfiV9J
 LD+1PRylz9JFdoqfKbPyZdpATT7Dw56s9X/iA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700257862; x=1700862662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e5wbvoHrw5gghSmYXqYsGypau9Ymfce8CXWliYyG7ds=;
 b=RPEh+Timhe4Meo0x5g40u9qfoQAq0TvSMab/SkHw/YvMj9BkN8FlFkJpbNi45DhVTD
 +mc3BY3ZmP7um6GqJ67ve+neRPqYGqxYJ4unLROEIiTnyVTjVsCSRKElwODRLB9Yr5wj
 Uq/98kcfm0YuuSWBldZFfvfHS/WLQYAL0muRrkO6NrVB/+M2j8sKNZNYlUqVnqj87uRb
 hWzpN171odtzym3BX0BuccifAjBfLtCDsZjJiKP4phTnl+28/oHK6nrKrpGniXC24rGh
 nhkMua6E1wWNQbNesRz193p0vFhr6zvuukmXrXb6/TmYZU9u7fWnPyzBGLsIvzJFe1K/
 2/KA==
X-Gm-Message-State: AOJu0Yxyc/Db/lZyOZ6jjKUUIVp4G2fMgcuA84Tny2MQNnl6zjm4NNzs
 8PE9ztPrGSi834idlalxidx8nw==
X-Google-Smtp-Source: AGHT+IFXa1O0px5rjy5mHaMT7yi0PRLUE2h8oNXonzeJMHXBMP048pYW3pu5gGFgpRYyO3sJvO9lqw==
X-Received: by 2002:a05:6a21:398d:b0:188:aea:2138 with SMTP id
 ad13-20020a056a21398d00b001880aea2138mr625516pzc.19.1700257862324; 
 Fri, 17 Nov 2023 13:51:02 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:7ed:b095:f0ba:5801])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a17090aca0700b00256b67208b1sm3639587pjt.56.2023.11.17.13.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 13:51:01 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v7 1/3] drm/panel-edp: Add override_edid_mode quirk for
 generic edp
Date: Fri, 17 Nov 2023 13:46:32 -0800
Message-ID: <20231117215056.1883314-2-hsinyi@chromium.org>
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

Generic edp gets mode from edid. However, some panels report incorrect
mode in this way, resulting in glitches on panel. Introduce a new quirk
additional_mode to the generic edid to pick a correct hardcoded mode.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v6->v7: split usecase to another patch.
---
 drivers/gpu/drm/panel/panel-edp.c | 48 +++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index f22677373171..33535f6de343 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -203,6 +203,9 @@ struct edp_panel_entry {
 
 	/** @name: Name of this panel (for printing to logs). */
 	const char *name;
+
+	/** @override_edid_mode: Override the mode obtained by edid. */
+	const struct drm_display_mode *override_edid_mode;
 };
 
 struct panel_edp {
@@ -301,6 +304,24 @@ static unsigned int panel_edp_get_display_modes(struct panel_edp *panel,
 	return num;
 }
 
+static int panel_edp_override_edid_mode(struct panel_edp *panel,
+					struct drm_connector *connector,
+					const struct drm_display_mode *override_mode)
+{
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, override_mode);
+	if (!mode) {
+		dev_err(panel->base.dev, "failed to add additional mode\n");
+		return 0;
+	}
+
+	mode->type |= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	drm_mode_set_name(mode);
+	drm_mode_probed_add(connector, mode);
+	return 1;
+}
+
 static int panel_edp_get_non_edid_modes(struct panel_edp *panel,
 					struct drm_connector *connector)
 {
@@ -568,6 +589,9 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 {
 	struct panel_edp *p = to_panel_edp(panel);
 	int num = 0;
+	bool has_override_edid_mode = p->detected_panel &&
+				      p->detected_panel != ERR_PTR(-EINVAL) &&
+				      p->detected_panel->override_edid_mode;
 
 	/* probe EDID if a DDC bus is available */
 	if (p->ddc) {
@@ -575,9 +599,18 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 
 		if (!p->edid)
 			p->edid = drm_get_edid(connector, p->ddc);
-
-		if (p->edid)
-			num += drm_add_edid_modes(connector, p->edid);
+		if (p->edid) {
+			if (has_override_edid_mode) {
+				/*
+				 * override_edid_mode is specified. Use
+				 * override_edid_mode instead of from edid.
+				 */
+				num += panel_edp_override_edid_mode(p, connector,
+						p->detected_panel->override_edid_mode);
+			} else {
+				num += drm_add_edid_modes(connector, p->edid);
+			}
+		}
 
 		pm_runtime_mark_last_busy(panel->dev);
 		pm_runtime_put_autosuspend(panel->dev);
@@ -1849,6 +1882,15 @@ static const struct panel_delay delay_200_150_e200 = {
 	.delay = _delay \
 }
 
+#define EDP_PANEL_ENTRY2(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name, _mode) \
+{ \
+	.name = _name, \
+	.panel_id = drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_chr_2, \
+					     product_id), \
+	.delay = _delay, \
+	.override_edid_mode = _mode \
+}
+
 /*
  * This table is used to figure out power sequencing delays for panels that
  * are detected by EDID. Entries here may point to entries in the
-- 
2.43.0.rc0.421.g78406f8d94-goog

