Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1432826E817
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 00:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70476E416;
	Thu, 17 Sep 2020 22:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549946EC60
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 17:10:40 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id c13so3299807oiy.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 10:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HXoZogvsJhjtKuFoK3WF+ubF8suRBhDTxKDkq/Kclug=;
 b=V3Qajdh0L/sUW2TIlpukVKiGNt84Vf6lK+ONZ/PkrfsXb9IUxsS4hJkLWYSwQH7pHY
 ni+lagq8EeSCInPObfzwUls1VlBLuuMYXS3rs/6NgrZ/9DFKRb9pVwG7cakqnAvcvXLG
 +Csdp9juOwbKzFwxyjWGmifliULd9JQXOS3Bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HXoZogvsJhjtKuFoK3WF+ubF8suRBhDTxKDkq/Kclug=;
 b=OtvJSmeYmjFoiNB6Jd12gJVonb7qaLWbw6UyvUz1KZ1ThHAdlQpvVLlm73PVh/ZMOx
 ofpv0T3NvOtG9ytaiHkyxX4ey8PKuv9/8/cCBrlcEIw9N1qYaHXfabjcu1DkgYzyExb8
 VOG/B3tnBAZspFafn2YCELsw7Ns4Ar7EQDbdMd9QCKDyjHeHWikzZRWzAd7/nr3pdnFi
 YmlEYkQTlqV2x6/Lb9WBM37OzNzV1nTyhTo+yKnFW47myPsmv+Ylly9Q/pQCdPiBm3Go
 0l9hKCawFaoHZXyTvNb0b99h5uSiwRgt/c+jnBEQ769SI5jiHgTb1Q3cSEC9kpa/fR3J
 PqYw==
X-Gm-Message-State: AOAM530r/QcHH7Mzj50DR7WvNrwzYu04cyF/lHy37KHUif5b+sJeJ3kH
 DFmSSz5Au5Guyo9n/kQogreTOg==
X-Google-Smtp-Source: ABdhPJxw4wlOU05830Hhh3AmFblQ7U7Mt8U1jfpf/7jDYNR82XL8xy5ocKbsn1Qyk36hAjxgV0XdXA==
X-Received: by 2002:a05:6808:8c1:: with SMTP id
 k1mr7198408oij.92.1600362639468; 
 Thu, 17 Sep 2020 10:10:39 -0700 (PDT)
Received: from khost.hsd1.co.comcast.net
 ([2601:281:8380:670:a6ae:11ff:fe11:fba7])
 by smtp.gmail.com with ESMTPSA id x21sm314866oie.49.2020.09.17.10.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 10:10:38 -0700 (PDT)
From: Kevin Chowski <chowski@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] i915: Introduce quirk for shifting eDP brightness.
Date: Thu, 17 Sep 2020 11:09:06 -0600
Message-Id: <20200917110838.1.I63d52f5b96d7e81e1e2dc2a72c4bf5fd84d3d3d0@changeid>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 17 Sep 2020 22:17:03 +0000
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
Cc: Kevin Chowski <chowski@chromium.org>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have observed that Google Pixelbook's backlight hardware is
interpretting these backlight bits from the most-significant side of the
16 bit word (if DP_EDP_PWMGEN_BIT_COUNT < 16), whereas the driver code
assumes the peripheral cares about the least-significant bits.

Testing was done from within Chrome OS's build environment when the
patch is backported to 5.4 (the version we are newly targeting for the
Pixelbook); for the record:
   $ emerge-eve-kernelnext sys-kernel/chromeos-kernel-5_4 && \
      ./update_kernel.sh --remote=$IP

I used `/sys/kernel/debug/dri/0/eDP-1/i915_dpcd` on my laptop to verify
that the registers were being set according to what the actual hardware
expects; I also observe that the backlight is noticeably brighter with
this patch.

Signed-off-by: Kevin Chowski <chowski@chromium.org>
---

 .../drm/i915/display/intel_dp_aux_backlight.c | 34 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_quirks.c   | 13 +++++++
 drivers/gpu/drm/i915/i915_drv.h               |  1 +
 3 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index acbd7eb66cbe3..99c98f217356d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -91,6 +91,23 @@ static u32 intel_dp_aux_get_backlight(struct intel_connector *connector)
 	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
 		level = (read_val[0] << 8 | read_val[1]);
 
+	if (i915->quirks & QUIRK_SHIFT_EDP_BACKLIGHT_BRIGHTNESS) {
+		if (!drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT,
+						&read_val[0])) {
+			DRM_DEBUG_KMS("Failed to read DPCD register 0x%x\n",
+					DP_EDP_PWMGEN_BIT_COUNT);
+			return 0;
+		}
+		// Only bits 4:0 are used, 7:5 are reserved.
+		read_val[0] = read_val[0] & 0x1F;
+		if (read_val[0] > 16) {
+			DRM_DEBUG_KMS("Invalid DP_EDP_PWNGEN_BIT_COUNT 0x%X, expected at most 16\n",
+						read_val[0]);
+			return 0;
+		}
+		level >>= 16 - read_val[0];
+	}
+
 	return level;
 }
 
@@ -106,6 +123,23 @@ intel_dp_aux_set_backlight(const struct drm_connector_state *conn_state, u32 lev
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	u8 vals[2] = { 0x0 };
 
+	if (i915->quirks & QUIRK_SHIFT_EDP_BACKLIGHT_BRIGHTNESS) {
+		if (!drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT,
+						&vals[0])) {
+			DRM_DEBUG_KMS("Failed to write aux backlight level: Failed to read DPCD register 0x%x\n",
+					  DP_EDP_PWMGEN_BIT_COUNT);
+			return;
+		}
+		// Only bits 4:0 are used, 7:5 are reserved.
+		vals[0] = vals[0] & 0x1F;
+		if (vals[0] > 16) {
+			DRM_DEBUG_KMS("Failed to write aux backlight level: Invalid DP_EDP_PWNGEN_BIT_COUNT 0x%X, expected at most 16\n",
+						vals[0]);
+			return;
+		}
+		level <<= (16 - vals[0]) & 0xFFFF;
+	}
+
 	vals[0] = level;
 
 	/* Write the MSB and/or LSB */
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 46beb155d835f..63b27d49b2864 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -53,6 +53,16 @@ static void quirk_increase_ddi_disabled_time(struct drm_i915_private *i915)
 	drm_info(&i915->drm, "Applying Increase DDI Disabled quirk\n");
 }
 
+/*
+ * Some eDP backlight hardware uses the most-significant bits of the brightness
+ * register, so brightness values must be shifted first.
+ */
+static void quirk_shift_edp_backlight_brightness(struct drm_i915_private *i915)
+{
+	i915->quirks |= QUIRK_SHIFT_EDP_BACKLIGHT_BRIGHTNESS;
+	DRM_INFO("Applying shift eDP backlight brightness quirk\n");
+}
+
 struct intel_quirk {
 	int device;
 	int subsystem_vendor;
@@ -156,6 +166,9 @@ static struct intel_quirk intel_quirks[] = {
 	/* ASRock ITX*/
 	{ 0x3185, 0x1849, 0x2212, quirk_increase_ddi_disabled_time },
 	{ 0x3184, 0x1849, 0x2212, quirk_increase_ddi_disabled_time },
+
+	/* Google Pixelbook */
+	{ 0x591E, 0x8086, 0x2212, quirk_shift_edp_backlight_brightness },
 };
 
 void intel_init_quirks(struct drm_i915_private *i915)
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index e4f7f6518945b..cc93bede4fab8 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -525,6 +525,7 @@ struct i915_psr {
 #define QUIRK_PIN_SWIZZLED_PAGES (1<<5)
 #define QUIRK_INCREASE_T12_DELAY (1<<6)
 #define QUIRK_INCREASE_DDI_DISABLED_TIME (1<<7)
+#define QUIRK_SHIFT_EDP_BACKLIGHT_BRIGHTNESS (1<<8)
 
 struct intel_fbdev;
 struct intel_fbc_work;
-- 
2.28.0.618.gf4bc123cb7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
