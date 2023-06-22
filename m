Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4590E73A73A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 19:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDB010E593;
	Thu, 22 Jun 2023 17:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78BE10E594
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 17:28:23 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-560c617c820so921850eaf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 10:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1687454902; x=1690046902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LG+SNuCveJ3k9ZN/Bizrp7A+pc/Q1Y7lTPWIVH04fxs=;
 b=T4I3aijPx32FFgw6FOHR4Ruv4anJ/z6F+8J8R3KxSSBtkaY0EbMuS4skm/dDmK8OpR
 vFlZY+b5HP+SGUiOwEE/tsifiyA746cimvL34ghxa5Mpuk2IcHRB8IbkcivmgGhDw76h
 4R7f5O8draGsNBPtqFpB4troLWRAbfbUXGljQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687454902; x=1690046902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LG+SNuCveJ3k9ZN/Bizrp7A+pc/Q1Y7lTPWIVH04fxs=;
 b=WAyEEDWcd2zCgg8Ia6n6mCCpGgHRiVrheKgWOQBO16YckN4whrU1zGMyIJpel3djY4
 q4c0fHLbmE4c8gSHzECWpnh9G/AJ0o+7dGeqbF0veMdZWJkzmd2ZJEQlBHWXdiy9fhzN
 0TIBNisMeJuDOdYsB/C+sGuIJG+nMr31z45pQWPQ428hM2YNlxZbULRRm4Fcoj9ufNQE
 Ruft2YwANk262+euznINj1ta90Vjyhj3uFATlUuezwxmhaP1KJTCyxR8YCuFUFw+P2tX
 ivtBEwN49HrYmQ/rXi5numanASGMRtQUYyKol6lpuOl7OiroJylnVrczym4XZ+ZoHMCQ
 PHyA==
X-Gm-Message-State: AC+VfDzd2/aKFj3MTdru48mk85ZBl0VMSghhEmM90MMgZrowxIRozQrO
 XptzftSHrXPUqCc6k7pVSWZjVQ==
X-Google-Smtp-Source: ACHHUZ6aaAPgxRA2SMPMem3yPU+gg1InPzmqDPfdl3P3URnZ3GiIprPeBfYXA2NatKXYAXb9bAdDHg==
X-Received: by 2002:a05:6808:6243:b0:398:9ee4:1dac with SMTP id
 dt3-20020a056808624300b003989ee41dacmr21175501oib.32.1687454902406; 
 Thu, 22 Jun 2023 10:28:22 -0700 (PDT)
Received: from ballway1.c.googlers.com.com
 (97.173.125.34.bc.googleusercontent.com. [34.125.173.97])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a17090a064f00b002533ce5b261sm36645pje.10.2023.06.22.10.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 10:28:22 -0700 (PDT)
From: Allen Ballway <ballway@chromium.org>
To: ballway@chromium.org
Subject: [PATCH v2] drm/i915/quirk: Add quirk for devices that cannot be dimmed
Date: Thu, 22 Jun 2023 17:28:15 +0000
Message-ID: <20230622172817.2281527-1-ballway@chromium.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
In-Reply-To: <20230606211901.1.I06e778109090b5dc85c44da7b742d185aa6adb59@changeid>
References: <20230606211901.1.I06e778109090b5dc85c44da7b742d185aa6adb59@changeid>
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
Cc: intel-gfx@lists.freedesktop.org, arun.r.murthy@intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cybernet T10C cannot be dimmed without the backlight strobing. Create a
new quirk to lock the minimum brightness to the highest supported value.
This aligns the device with its behavior on Windows, which will not
lower the brightness below maximum.

Signed-off-by: Allen Ballway <ballway@chromium.org>
---
V1 -> V2: Fix style issue.

 .../gpu/drm/i915/display/intel_backlight.c    |  5 ++++
 drivers/gpu/drm/i915/display/intel_quirks.c   | 27 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_quirks.h   |  1 +
 3 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
index 2e8f17c045222..049e95105e8b6 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
@@ -1192,6 +1192,11 @@ static u32 get_backlight_min_vbt(struct intel_connector *connector)

 	drm_WARN_ON(&i915->drm, panel->backlight.pwm_level_max == 0);

+	if (intel_has_quirk(i915, QUIRK_NO_DIM)) {
+		/* Cannot dim backlight, set minimum to hightest value */
+		return panel->backlight.pwm_level_max - 1;
+	}
+
 	/*
 	 * XXX: If the vbt value is 255, it makes min equal to max, which leads
 	 * to problems. There are such machines out there. Either our
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index a280448df771a..910c95840a539 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -65,6 +65,12 @@ static void quirk_no_pps_backlight_power_hook(struct drm_i915_private *i915)
 	drm_info(&i915->drm, "Applying no pps backlight power quirk\n");
 }

+static void quirk_no_dim(struct drm_i915_private *i915)
+{
+	intel_set_quirk(i915, QUIRK_NO_DIM);
+	drm_info(&i915->drm, "Applying no dim quirk\n");
+}
+
 struct intel_quirk {
 	int device;
 	int subsystem_vendor;
@@ -90,6 +96,12 @@ static int intel_dmi_no_pps_backlight(const struct dmi_system_id *id)
 	return 1;
 }

+static int intel_dmi_no_dim(const struct dmi_system_id *id)
+{
+	DRM_INFO("No dimming allowed on %s\n", id->ident);
+	return 1;
+}
+
 static const struct intel_dmi_quirk intel_dmi_quirks[] = {
 	{
 		.dmi_id_list = &(const struct dmi_system_id[]) {
@@ -136,6 +148,20 @@ static const struct intel_dmi_quirk intel_dmi_quirks[] = {
 		},
 		.hook = quirk_no_pps_backlight_power_hook,
 	},
+	{
+		.dmi_id_list = &(const struct dmi_system_id[]) {
+			{
+				.callback = intel_dmi_no_dim,
+				.ident = "Cybernet T10C Tablet",
+				.matches = {DMI_EXACT_MATCH(DMI_BOARD_VENDOR,
+							    "Cybernet Manufacturing Inc."),
+					    DMI_EXACT_MATCH(DMI_BOARD_NAME, "T10C Tablet"),
+				},
+			},
+			{ }
+		},
+		.hook = quirk_no_dim,
+	},
 };

 static struct intel_quirk intel_quirks[] = {
@@ -218,6 +244,7 @@ void intel_init_quirks(struct drm_i915_private *i915)
 		     q->subsystem_device == PCI_ANY_ID))
 			q->hook(i915);
 	}
+
 	for (i = 0; i < ARRAY_SIZE(intel_dmi_quirks); i++) {
 		if (dmi_check_system(*intel_dmi_quirks[i].dmi_id_list) != 0)
 			intel_dmi_quirks[i].hook(i915);
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gpu/drm/i915/display/intel_quirks.h
index 10a4d163149fd..b41c7bbf0a5e3 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.h
+++ b/drivers/gpu/drm/i915/display/intel_quirks.h
@@ -17,6 +17,7 @@ enum intel_quirk_id {
 	QUIRK_INVERT_BRIGHTNESS,
 	QUIRK_LVDS_SSC_DISABLE,
 	QUIRK_NO_PPS_BACKLIGHT_POWER_HOOK,
+	QUIRK_NO_DIM,
 };

 void intel_init_quirks(struct drm_i915_private *i915);
--
2.41.0.162.gfafddb0af9-goog

