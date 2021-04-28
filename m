Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6DD36DDC9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 19:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADA06ED04;
	Wed, 28 Apr 2021 17:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFAE6EC71
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 17:04:27 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id t13so7084358pji.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 10:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fUBR0WopHj0WR6JMHf2d83zcvjlEdxgAs9fymIBITzo=;
 b=CZh4ewpebCFcAjzU4EibSFFnrvhXZVPNRc4wOzEuTvrh0wTnh9QHrTxtcPEp03msf7
 p7qFTJYHHFvKYz9uDrzBQ+Qy+3fq16YM4Kqd8u0m6gWqZLA9Q5vHC5ZZ5f6tWNAMjifU
 mPdOOxsXHBf119G0QvEHwNweX9sC3c6CawxkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fUBR0WopHj0WR6JMHf2d83zcvjlEdxgAs9fymIBITzo=;
 b=EPf9Acs+V/LpZS9avwz5BVBVBVZn/UJ3x9UX07QiMmLDRav7Ng34uAh7Te5ihoRjM6
 YaIvbtRtXBfTfrTIiVw+7yahhOZVUxJrKvMcBOHDYOpm6wZ3brHkhTs8Tq46z9N+Cgyu
 dVSeDSZGP/LSWjSUHOTjNOoNjJdTHAj40oy9s8L4LkhtHmzZWRU/XnOzATJPBzqC3V1I
 IhG/LXr14hkuH25LU2d/XVuPS8oBS8jIh+5jPMlS4aDnFr2TdlMx+I1h8cEaAAGlFbwQ
 mpt+KGejbHkns1BJK1Oyk/COcQb8Im3mbReV//ZMeIMcsrCHzLHxQM5hOEaNBA/yYpa7
 lc+Q==
X-Gm-Message-State: AOAM530NgoiQUaB6Yu6mvHJh95DPp68V/yLMqPNlS2OjIHefktGOm7Ed
 SXcpbkGEM+zsnrhK2MzfIaRKMomOTfvUlA==
X-Google-Smtp-Source: ABdhPJxVuaBy5Crg4238Rnf+mjDK9f2leKWDPf3f+mhW2AoCjVsaiScJhXB+4Y2JkeULZDYrLebEmA==
X-Received: by 2002:a17:90a:e298:: with SMTP id
 d24mr10097975pjz.144.1619629466765; 
 Wed, 28 Apr 2021 10:04:26 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1faf:c32e:8742:d913])
 by smtp.gmail.com with ESMTPSA id c8sm244351pfp.160.2021.04.28.10.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:04:26 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 3/4] drm/i915: init panel orientation property
Date: Thu, 29 Apr 2021 01:04:15 +0800
Message-Id: <20210428170416.1027484-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210428170416.1027484-1-hsinyi@chromium.org>
References: <20210428170416.1027484-1-hsinyi@chromium.org>
MIME-Version: 1.0
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Creating the panel orientation property first since we separate the
property creating and value setting.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/i915/display/icl_dsi.c  | 1 +
 drivers/gpu/drm/i915/display/intel_dp.c | 1 +
 drivers/gpu/drm/i915/display/vlv_dsi.c  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index 9282978060b0..162fb3cf0f5a 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -1903,6 +1903,7 @@ static void icl_dsi_add_properties(struct intel_connector *connector)
 
 	connector->base.state->scaling_mode = DRM_MODE_SCALE_ASPECT;
 
+	drm_connector_attach_scaling_mode_property(&connector->base);
 	drm_connector_set_panel_orientation_with_quirk(&connector->base,
 				intel_dsi_get_panel_orientation(connector),
 				connector->panel.fixed_mode->hdisplay,
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index a5231ac3443a..f1d664e5abb2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5263,6 +5263,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	intel_panel_setup_backlight(connector, pipe);
 
 	if (fixed_mode) {
+		drm_connector_init_panel_orientation_property(connector);
 		drm_connector_set_panel_orientation_with_quirk(connector,
 				dev_priv->vbt.orientation,
 				fixed_mode->hdisplay, fixed_mode->vdisplay);
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 9bee99fe5495..853855482af1 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -1632,6 +1632,7 @@ static void vlv_dsi_add_properties(struct intel_connector *connector)
 
 		connector->base.state->scaling_mode = DRM_MODE_SCALE_ASPECT;
 
+		drm_connector_init_panel_orientation_property(&connector->base);
 		drm_connector_set_panel_orientation_with_quirk(
 				&connector->base,
 				intel_dsi_get_panel_orientation(connector),
-- 
2.31.1.498.g6c1eba8ee3d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
