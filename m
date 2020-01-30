Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD2F14E966
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 09:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4316FAB0;
	Fri, 31 Jan 2020 08:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8866F918;
 Thu, 30 Jan 2020 08:33:08 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c9so2907414wrw.8;
 Thu, 30 Jan 2020 00:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+WPQnqUkCy+VyFr3VrFQpuj+AkRk2l9SsKUP05AZ3L0=;
 b=FIPkwZu8JCIdbgvI1vc3UWE/f1zn9iAxWqpx7JiiNG1HvgaGtvvqfDxnUsBdZSViQR
 QlTz1d+BSY7oZ8u3LRavAaLP7nj1v67jatCggGWucdbgGJ9kYC/3c8qRLCkAinzbnSGa
 x5avZuxBMhPkfvVDf4yhMPPEayWjV0o7KuqCFWbqb5RGEMrdq4vBCkZVnn31a6kRIk3s
 AJjWor5Pz24gdaXOrj2JLuiRjZNznl14uARJ9Hu9pGowyBYWv3MFppJbnozLJv2abk/S
 eq68GU/u4qJqNFmac8heKDsqwoHpNxD1KDQ6BRChAkhJ+193/5wgi5Ds6rkffn7jg/8C
 XCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+WPQnqUkCy+VyFr3VrFQpuj+AkRk2l9SsKUP05AZ3L0=;
 b=iMYKizOgayfeJf3/W3z+swcekyFu1rcBJXdbsitJ5f6BiSjwU53yvYB5aqYvPl8yHS
 NZhhmQVSA6R5XciFXliB1gcD8i9e1UjwKPHs/pXfN9J06jtPIS4I7nsNvFXm5diqRTIO
 wiFliBW8I/+UvkHAL4KRyyk4cafA47Sz6SXSxYgoQnEcHEW7x4BgkHejJg6sBE+VhMOo
 RPtr8iA7pejWbYLf7godb0h8BTxlewq6EpuZT4X1moUQtILqnpYyWo85s9l4P+ZHI6o6
 DPcZAYnCeocI2CBQiaLrtUBwTFvAA5c5mguzpx4XwAkQZ7RLk2TKNn337kKkEAfYYcDd
 3cJA==
X-Gm-Message-State: APjAAAXskIvIsjSRImlU7QI3JbRxOjBgvbJD062dijBcyeTdYtrLVETl
 52iiIXOxWxNU4hlclshQ7VrrbZd6M1I=
X-Google-Smtp-Source: APXvYqwmDEbkuSNB6WSdMsgLsEj4Q/XOChlh3T7KQ7E9CMbGRoFnc/2t1UFdy/11d/JCh0ek2mP5mQ==
X-Received: by 2002:adf:ec06:: with SMTP id x6mr3828516wrn.335.1580373187394; 
 Thu, 30 Jan 2020 00:33:07 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id i11sm6363678wrs.10.2020.01.30.00.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 00:33:06 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 09/12] drm/i915/quirks: automatic conversion to drm_device
 based logging macros.
Date: Thu, 30 Jan 2020 11:32:26 +0300
Message-Id: <20200130083229.12889-10-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200130083229.12889-1-wambui.karugax@gmail.com>
References: <20200130083229.12889-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 Jan 2020 08:04:00 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Converts instances of the printk based drm logging macros to the struct
drm_device based logging macros in i915/display/intel_quirks.c using the
following coccinelle script that transforms based on the existence of a
struct drm_i915_private device:
@@
identifier fn, T;
@@

fn(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

@@
identifier fn, T;
@@

fn(...,struct drm_i915_private *T,...) {
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

Checkpatch warnings were fixed manually.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_quirks.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 399b1542509f..9d235d270dac 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -14,7 +14,7 @@
 static void quirk_ssc_force_disable(struct drm_i915_private *i915)
 {
 	i915->quirks |= QUIRK_LVDS_SSC_DISABLE;
-	DRM_INFO("applying lvds SSC disable quirk\n");
+	drm_info(&i915->drm, "applying lvds SSC disable quirk\n");
 }
 
 /*
@@ -24,14 +24,14 @@ static void quirk_ssc_force_disable(struct drm_i915_private *i915)
 static void quirk_invert_brightness(struct drm_i915_private *i915)
 {
 	i915->quirks |= QUIRK_INVERT_BRIGHTNESS;
-	DRM_INFO("applying inverted panel brightness quirk\n");
+	drm_info(&i915->drm, "applying inverted panel brightness quirk\n");
 }
 
 /* Some VBT's incorrectly indicate no backlight is present */
 static void quirk_backlight_present(struct drm_i915_private *i915)
 {
 	i915->quirks |= QUIRK_BACKLIGHT_PRESENT;
-	DRM_INFO("applying backlight present quirk\n");
+	drm_info(&i915->drm, "applying backlight present quirk\n");
 }
 
 /* Toshiba Satellite P50-C-18C requires T12 delay to be min 800ms
@@ -40,7 +40,7 @@ static void quirk_backlight_present(struct drm_i915_private *i915)
 static void quirk_increase_t12_delay(struct drm_i915_private *i915)
 {
 	i915->quirks |= QUIRK_INCREASE_T12_DELAY;
-	DRM_INFO("Applying T12 delay quirk\n");
+	drm_info(&i915->drm, "Applying T12 delay quirk\n");
 }
 
 /*
@@ -50,7 +50,7 @@ static void quirk_increase_t12_delay(struct drm_i915_private *i915)
 static void quirk_increase_ddi_disabled_time(struct drm_i915_private *i915)
 {
 	i915->quirks |= QUIRK_INCREASE_DDI_DISABLED_TIME;
-	DRM_INFO("Applying Increase DDI Disabled quirk\n");
+	drm_info(&i915->drm, "Applying Increase DDI Disabled quirk\n");
 }
 
 struct intel_quirk {
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
