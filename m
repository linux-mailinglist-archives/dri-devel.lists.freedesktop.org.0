Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CD4BA3075
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 10:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711C610E062;
	Fri, 26 Sep 2025 08:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="Ub4wnbxz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E30810E2FF
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 08:55:40 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5280B3FE2E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 08:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1758876939;
 bh=QPvssfoU/In85UShRKppyAS4KS/HDcgMvFxB88IBvIA=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version;
 b=Ub4wnbxzWfUp7a89G4Q7TIIgv824m03bQDQfWF8VK0AHkOc54xI9bGIj0ja8lo6BE
 LkLPxU2oTDYGzsfG9xm9OG7KIu7vmfzeGztRXCNyvNophUbVWDudnBPg6Cszo7jsop
 KxbebMaCQqebyfAGaUnjoScfnh6wY2SBm241EiJBkvAnvzah9vdI408CDNCPx0ek4H
 gXaMebQqUyA1kiNiQ0Y2bTfSmT76Q8qWgyq8A58GLRnHTJAVI3IuaSZlUmFrLZ/7EZ
 nShrncKDjyuRmMtTJ33thWdbxSuAxDoNDxIQbBkmkOHSKXf8cujmclzC6FtfjhtzZt
 Pan03yClI2zQA==
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b2ef8e0133fso159769166b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 01:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758876939; x=1759481739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QPvssfoU/In85UShRKppyAS4KS/HDcgMvFxB88IBvIA=;
 b=pV+QELJfpQKnJy/drwEGgLqPoNcYGXYu5DtKRwW3vUgfvQ712Ct25uPMBY6yyIgzim
 oDlKZXw3hr/AKrZuYmXaqgysP7OKAHCiCCu7goK2X/tyvWfyIkIv4KBgGuJHWNgdVbZa
 KnB4xT3uplZtDpmI0B16IQmzd6RKPJDHuxJjcI4vvwUeD/cN8rttA3WuCm2U3E54HW4B
 MOtRc+SE+eDe4qI0NH33yaN6y8vKRo9fP0/jBv3p7smvqQdiU8wfsTvsSKaTps9DYePJ
 1fLBIhWYQ+8NOS/lS7SH3eTbITjyhYEQgvA7vwF1m2oJ9Boi1LSbtiJYB33KIhUo9ksX
 nXxA==
X-Gm-Message-State: AOJu0YxCdzaiNnRQEW+p7FTmq/eJNxPgYZsEhvbvtkDB3zO0JexiQTKO
 HwhU68KGRnXWOgibiqFIwIQ+dxUxckojKHsYq52J0lfFmt1N2pSk+oWUsioRiLMXfsIRCOyd0q9
 cFoyJWZUVrQby5JNNWbvO1q4005pa5uuRnNpFuG5rXu2dwCJcehJ2SA0zy7o7cqSGpinnIjmAjE
 LWyIpcyf9VeoLzRcdpS+lj
X-Gm-Gg: ASbGncu+w8u9mMfyaabg0r1jjse2k71KeU0j8ELoG7mUIwj0qpZdks4VGw0UQgC3rTD
 /+nQsIXZODrkvoc7hj4DhEcYJJOdd0wKgBcf/fV4thtuDLw++mw4XErlZJ/xwnrI6wPMykIc1mk
 ev+/rAH6iCJLs7rdGcIBTxz1/1YuDe/w5OZDHsmFS7O7wc9Cj9EDFPeyci45q95MUSvsZvBjqjs
 YksXNBFAjOysNlZavJ+Mt+CroYF2TsnMCxi5oKn+0z9ZqT9k/gExGHMCZ5p9ycXaYE5xfgTFNwf
 C5SEHudMjG8zgJQyBm/bJu7SFQ09ZmvsJKKlh43apoFaIPieva7GtW0C
X-Received: by 2002:a17:906:f597:b0:b21:6dce:785 with SMTP id
 a640c23a62f3a-b34b7209d39mr684712066b.1.1758876937752; 
 Fri, 26 Sep 2025 01:55:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKOuBVYc49IRA7cnoojgLB1GU9kfFCS1Pkn55N8wl2zqripG2XOg0L/N0FVk2bCqkw2RK7OA==
X-Received: by 2002:a17:906:f597:b0:b21:6dce:785 with SMTP id
 a640c23a62f3a-b34b7209d39mr684709066b.1.1758876937337; 
 Fri, 26 Sep 2025 01:55:37 -0700 (PDT)
Received: from localhost.localdomain ([103.155.100.15])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b35446f7746sm328087966b.59.2025.09.26.01.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 01:55:36 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, suraj.kandpal@intel.com, imre.deak@intel.com,
 joonas.lahtinen@linux.intel.com, aaron.ma@canonical.com
Subject: [PATCH 2/2] drm/i915/backlight: Add get brightness support of DPCD
 via AUX
Date: Fri, 26 Sep 2025 16:54:01 +0800
Message-ID: <20250926085401.2808634-2-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926085401.2808634-1-aaron.ma@canonical.com>
References: <20250926085401.2808634-1-aaron.ma@canonical.com>
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

