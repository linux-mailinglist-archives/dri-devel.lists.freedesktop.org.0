Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6456ABA3329
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 11:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E35D10E368;
	Fri, 26 Sep 2025 09:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="rhIy5lb7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4C710E367
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 09:40:24 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 700023FBBF
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 09:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1758879623;
 bh=iBhi1FHDh4LBnl6LQ1TVC38qnLfe1cV9s8WGnxsTQXk=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version;
 b=rhIy5lb7PZwTuePMmqqlmWcXAJGMxKR02Epr3X0TJxSLqX60QIbOK+bYKWOvHV7qw
 F4XqgXuk4HvSQl+bO0FaHvQu7tWruIXIt7qotZDCA4v8Rk0dIMdtA2GPAzB7P+k4d1
 XcVqCyTebu7jmtzfHlW8TVhIalkHu94+ySR1ruU2vi6z3LUXZF6F6je74S9pYZ8qVO
 7LuISMt77wEr/6XjgzOEq4BEw5BGO18cJP2jDx12Y9pyCQzYx8L/7LldITR8w9ZgNg
 rgqRAKFsnuY+BytjMaoe1BqMp/xvuubP/XOYJtSLUO8FDr7zUb301bzi7daSnI7RE5
 BXXgrQQ7blxxg==
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-78e30eaca8eso57494686d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 02:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758879622; x=1759484422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iBhi1FHDh4LBnl6LQ1TVC38qnLfe1cV9s8WGnxsTQXk=;
 b=N1pA40MbqDw9GQ7rj+ioabRFKqNwVTK9LstbwfGbxpC+CQ21UEQ/OtdiYe0hXdXsw0
 R4RpGECfJEGP64cskhLAlibOAMO4b/M9z/3z6OxE9n1c8czkHTVwjZEHK6SO0/zxZOQS
 zXG1f8pr/uetnyVsImmJhnonXmfNlTRWC3Z5AZF1D99yy3cki4328v2XxPE8N3FfbScc
 //2+/lTvF39kNifxlG57mYb4udI/GnGANq9I0TC2j1CX5vRhtgaT7uCO7eKcbWiBeQnV
 GzjheH/v6gJLQSAab3COt3rv2WvwgHkgENQ/zM2wcNZ22ZEyKqt/2AvdHQ4QMxiSJGBQ
 gMMw==
X-Gm-Message-State: AOJu0YzdjzDj7G+OXC/F1DrUEHtTykFYmxpkCj6WhlRFubLagEw78glg
 3JloNtwYNTz5q56p1XsdQNcugMOOJOQGyhA5IsC0cgip/ApKXKUYBHY3fcO5PrvSZa+1V3/XF8E
 KAIwxJKN94aDV8KudcHjgPJkfWn801TF2rJYk4hhUgEMbPjuZ4HLAgZVh4uupYPaCpXfdgGwMP7
 xRms+hTFyu3LbT8gmNyiPk
X-Gm-Gg: ASbGncvLpMTjFnBJ3j9eRXqXkZKmwiWrnDxvNsjAgB/hFF1FSqvgYkrQDOtCT6me88j
 onI+6bftnQiAzMskVNmKiKDCzvYqArG+Q5i5L2jY5OWS39HWNwecnRw33PWoUCxfryA4gvULzgS
 37+VGO615Dt91M4nF39PSJxeE8KpIr3wA6CKxwbkGzhHynraNiKOZznDcav+YN7fgdsNEWKWaRN
 yGKh3oRLobxYR0mDAGOwhbAEcKKgUeBe6K0aKk8yjwv3zxnN/hR2zIuc1w5qP/OqJL/qwcuV9h6
 CAX9UfazJgvDEJ/UC1/zXWhoyCngYJdRmoTPDnLnyOpdTMw6YMQ/TjZ0
X-Received: by 2002:a05:6214:4001:b0:70d:6de2:50c0 with SMTP id
 6a1803df08f44-7fc43a4e9e0mr75976466d6.61.1758879621862; 
 Fri, 26 Sep 2025 02:40:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBlRiSrsDaRBQl+0u+Wy+05VWxe+n3WtRVYWHsQ8i4pZioZPIg42a7BPl3hZY7By2C8+lggw==
X-Received: by 2002:a05:6214:4001:b0:70d:6de2:50c0 with SMTP id
 6a1803df08f44-7fc43a4e9e0mr75976286d6.61.1758879621509; 
 Fri, 26 Sep 2025 02:40:21 -0700 (PDT)
Received: from localhost.localdomain ([103.155.100.14])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-80135b563b2sm23419766d6.14.2025.09.26.02.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 02:40:20 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, suraj.kandpal@intel.com, imre.deak@intel.com,
 joonas.lahtinen@linux.intel.com, aaron.ma@canonical.com
Subject: [PATCH v2 2/2] drm/i915/backlight: Add get brightness support of DPCD
 via AUX
Date: Fri, 26 Sep 2025 17:38:32 +0800
Message-ID: <20250926093832.2811200-2-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926093832.2811200-1-aaron.ma@canonical.com>
References: <20250926093832.2811200-1-aaron.ma@canonical.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm common helper to read brightness from
both luminance and AUX mode to support get_brightness from
DPCD via AUX.

Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
v1 -> v2: no changes.

 .../drm/i915/display/intel_dp_aux_backlight.c | 20 ++++++-------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 0a3a3f6a5f9d8..0ee6fd0f41ef0 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -454,24 +454,16 @@ static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, en
 {
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 	struct intel_panel *panel = &connector->panel;
-	u8 buf[3];
-	u32 val = 0;
-	int ret;
 
-	if (panel->backlight.edp.vesa.luminance_control_support) {
-		ret = drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf,
-				       sizeof(buf));
-		if (ret < 0) {
-			drm_err(intel_dp->aux.drm_dev,
-				"[CONNECTOR:%d:%s] Failed to read Luminance from DPCD\n",
-				connector->base.base.id, connector->base.name);
-			return 0;
-		}
+	if (!panel->backlight.edp.vesa.info.aux_set) {
+		u32 pwm_level = panel->backlight.pwm_funcs->get(connector, unused);
 
-		val |= buf[0] | buf[1] << 8 | buf[2] << 16;
-		return val / 1000;
+		return intel_backlight_level_from_pwm(connector, pwm_level);
 	}
 
+	connector->panel.backlight.level =
+		drm_edp_backlight_get_level(&intel_dp->aux, &panel->backlight.edp.vesa.info);
+
 	return connector->panel.backlight.level;
 }
 
-- 
2.43.0

