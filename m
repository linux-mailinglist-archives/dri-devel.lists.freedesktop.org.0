Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 762D660C43C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1931310E13D;
	Tue, 25 Oct 2022 06:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1C910E388
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:35:50 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id q71so8441892pgq.8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 04:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nh284RfbKTKjVZ53xc/BjYmJT2KbUvj6smXua/Y15lg=;
 b=wKxhR+PYREmRgVKkasTw0GfLrz2v/WYReVJQ30eu6x7i4eVQgdnhuAzGFkfXj43osX
 iAXkQ9aOTTvoovjS5IAKs+vGwyfg/3OtbGuKU/dCjSKPeCgfec8HUoDEQ74hMGKLlidw
 xopGpztVbn+H0pgQsRhyf7RQzg47xJ12vGdWkiLpV1wmLs/HSBYTp0CLCI3VpboZfYoK
 OVdGvVz64lio5FjIFDglJN+RSxy4l6GjXQ4rIatNLGAan07rIxYhnoljN8p8kyn4jRRy
 crr47iBoKn1Bk8Y506uKaUb06iRU9mYdDjzttWDNXRDmwZYfgtsJrKYIzOgRriRarrJF
 6iww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nh284RfbKTKjVZ53xc/BjYmJT2KbUvj6smXua/Y15lg=;
 b=tu2/54fPDqpyVNn790jZw62CVVs68+6Z5qTOeKkHPqoVhtXjDU1a1BYkP+NOhjlgTH
 eA+oE2Na36lpMTXlsEzOwkH1N5EUh0O4nWOfyJlxy+umulpXGLDTleYZrqJk0v2pKE4v
 0RynuRaYgG+hjmOsmTPGSok6uqMA8Un836tTmuP9FwISuaGsPd7qwz3uSAaFtQBhyYv5
 QWkatrS+htbtXB5WW2NQJfRIAA6wk9Ym2fKeDIVfrEV8m3fqSpDWdoZ7SPvCKVCNjgF8
 WIsItZR3ft3vsii4K5LYzaiswfL8kUOjG5J/QB+8wvwwBvpHZ6aB4CmcNfbjHhV2wZco
 KPOQ==
X-Gm-Message-State: ACrzQf2zxFU/Q0Snhy1r0oKpe2E2ZUykC0PyQiG30Wzs7SNrKfnkLgRj
 N+lN2UUb1/HyHyskA6QBnYfpIA==
X-Google-Smtp-Source: AMsMyM5qFqNKIQCrH6nqN3yVGbGf1IzcRlrs4UvsvzXwRIAC8cYkTRMstnrFzu4g/FRXgW5McIN7zw==
X-Received: by 2002:a05:6a00:114c:b0:528:2c7a:6302 with SMTP id
 b12-20020a056a00114c00b005282c7a6302mr33351690pfm.37.1666611349588; 
 Mon, 24 Oct 2022 04:35:49 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 04:35:49 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Subject: [PATCH 01/22] drm/i915/opregion: Improve backlight request condition
Date: Mon, 24 Oct 2022 20:34:52 +0900
Message-Id: <20221024113513.5205-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221024113513.5205-1-akihiko.odaki@daynix.com>
References: <20221024113513.5205-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Oct 2022 06:54:01 +0000
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
Cc: linux-fbdev@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Azael Avalos <coproscefalo@gmail.com>, Mattia Dongili <malattia@linux.it>,
 Daniel Dadap <ddadap@nvidia.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jonathan Woithe <jwoithe@just42.net>, Jonathan Corbet <corbet@lwn.net>, "Lee,
 Chun-Yi" <jlee@suse.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Robert Moore <robert.moore@intel.com>,
 linux-acpi@vger.kernel.org, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
 Len Brown <lenb@kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>,
 Kenneth Chan <kenneth.t.chan@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, intel-gfx@lists.freedesktop.org,
 acpi4asus-user@lists.sourceforge.net, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 platform-driver-x86@vger.kernel.org, devel@acpica.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net, Jingoo Han <jingoohan1@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

asle_set_backlight() needs to accept backlight request only if the
firmware controls the backlight. It used the following expression for
this purpose:
acpi_video_get_backlight_type() == acpi_backlight_native

This expression works well in practice, but has two semantic problems.
One is that it actually determines if a backlight device which directly
modifies hardware registers ("native backlight") exists. It is possible
that a device which does not have backlight at all incorrectly triggers
asle_set_backlight(), and the expression does not cover such a case.

Another problem is that acpi_video_get_backlight_type() always return
acpi_backlight_vendor in reality if CONFIG_ACPI_VIDEO is unset. It
means even its ability to determine the existence of native backlight is
somewhat limited.

This change introduces a new function backlight_device_non_raw_exists(),
which returns if the firmware is controlling the backlight, and is
always available if backlight support is enabled.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/gpu/drm/i915/display/intel_opregion.c |  3 ++-
 drivers/video/backlight/backlight.c           | 18 ++++++++++++++++++
 include/linux/backlight.h                     |  1 +
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index caa07ef34f21..82ea02ab94c2 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -26,6 +26,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/backlight.h>
 #include <linux/dmi.h>
 #include <linux/firmware.h>
 #include <acpi/video.h>
@@ -467,7 +468,7 @@ static u32 asle_set_backlight(struct drm_i915_private *dev_priv, u32 bclp)
 
 	drm_dbg(&dev_priv->drm, "bclp = 0x%08x\n", bclp);
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_native) {
+	if (!backlight_device_non_raw_exists()) {
 		drm_dbg_kms(&dev_priv->drm,
 			    "opregion backlight request ignored\n");
 		return 0;
diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index b788ff3d0f45..4f0ce463e250 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -516,6 +516,24 @@ struct backlight_device *backlight_device_get_by_name(const char *name)
 }
 EXPORT_SYMBOL(backlight_device_get_by_name);
 
+bool backlight_device_non_raw_exists(void)
+{
+	bool found = false;
+	struct backlight_device *bd;
+
+	mutex_lock(&backlight_dev_list_mutex);
+	list_for_each_entry(bd, &backlight_dev_list, entry) {
+		if (bd->props.type != BACKLIGHT_RAW) {
+			found = true;
+			break;
+		}
+	}
+	mutex_unlock(&backlight_dev_list_mutex);
+
+	return found;
+}
+EXPORT_SYMBOL(backlight_device_non_raw_exists);
+
 /* deprecated - use devm_backlight_device_unregister() */
 void backlight_device_unregister(struct backlight_device *bd)
 {
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 614653e07e3a..364ef6f99a9e 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -444,6 +444,7 @@ int backlight_register_notifier(struct notifier_block *nb);
 int backlight_unregister_notifier(struct notifier_block *nb);
 struct backlight_device *backlight_device_get_by_name(const char *name);
 struct backlight_device *backlight_device_get_by_type(enum backlight_type type);
+bool backlight_device_non_raw_exists(void);
 int backlight_device_set_brightness(struct backlight_device *bd,
 				    unsigned long brightness);
 
-- 
2.37.3

