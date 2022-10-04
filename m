Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B38285F40C6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 12:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0582B10E16C;
	Tue,  4 Oct 2022 10:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E656010E16C;
 Tue,  4 Oct 2022 10:28:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 52521B818CC;
 Tue,  4 Oct 2022 10:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0467C433D6;
 Tue,  4 Oct 2022 10:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664879322;
 bh=ryVpB+LKQQQ4quiFtv8DMhrBs37TnZOj1Qh2Qxiebb8=;
 h=From:To:Cc:Subject:Date:From;
 b=uoCAGHK9IvNL5yez4HaM8LeFWDgWv4HdJGlVc22aarJYXyj0RnupQ/zdfFvaHYKg+
 fR8pqliXREvhQDMFBkToD6qkZGZ9KRkutj1Ynczr6qEKdHSDebCcXYbMOekZVRzf04
 es7Thw7JFpx4Fonq3UFVHB93il3Jz5bhVViuzDZY3PctZFK1Vh7IZZvz1V/iUzVvak
 hCwTCDK51pI0WLqAolXokW/sfF9vpHR7Lpz6juGmm+URC36sEvAmDJpTHZ0pnw6C19
 FJ/Af3xyKHLzazZDh7KOE4pZjJtpBkFbQpYHMnkjPr5nZcx2m7/hvbc3dA6blUZkyv
 yqnWfbiGjj65A==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: jani.nikula@linux.intel.com
Subject: [PATCH 1/2] drm/i915/display: fix randconfig build
Date: Tue,  4 Oct 2022 12:28:36 +0200
Message-Id: <20221004102837.12181-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Martin=20Li=C5=A1ka?= <mliska@suse.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When DRM_I915=y and BACKLIGHT_CLASS_DEVICE=m, the build fails:
ld: drivers/gpu/drm/i915/display/intel_backlight.o: in function `intel_backlight_device_register':
intel_backlight.c:(.text+0x5587): undefined reference to `backlight_device_get_by_name'

ld: drivers/gpu/drm/i915/display/intel_backlight.o: in function `intel_backlight_device_unregister':
intel_backlight.c:(.text+0x576e): undefined reference to `backlight_device_unregister'

To fix this, use IS_REACHABLE(), not IS_ENABLED() in backlight. That is,
with the above config, backlight support is disabled.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Reported-by: Martin Liška <mliska@suse.cz>
Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
---
 drivers/gpu/drm/i915/display/intel_backlight.c | 2 +-
 drivers/gpu/drm/i915/display/intel_backlight.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
index beba39a38c87..c1ba68796b6d 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
@@ -825,7 +825,7 @@ void intel_backlight_enable(const struct intel_crtc_state *crtc_state,
 	mutex_unlock(&dev_priv->display.backlight.lock);
 }
 
-#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
+#if IS_REACHABLE(CONFIG_BACKLIGHT_CLASS_DEVICE)
 static u32 intel_panel_get_backlight(struct intel_connector *connector)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
diff --git a/drivers/gpu/drm/i915/display/intel_backlight.h b/drivers/gpu/drm/i915/display/intel_backlight.h
index 339643f63897..207fe1c613d8 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight.h
+++ b/drivers/gpu/drm/i915/display/intel_backlight.h
@@ -36,7 +36,7 @@ u32 intel_backlight_invert_pwm_level(struct intel_connector *connector, u32 leve
 u32 intel_backlight_level_to_pwm(struct intel_connector *connector, u32 level);
 u32 intel_backlight_level_from_pwm(struct intel_connector *connector, u32 val);
 
-#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
+#if IS_REACHABLE(CONFIG_BACKLIGHT_CLASS_DEVICE)
 int intel_backlight_device_register(struct intel_connector *connector);
 void intel_backlight_device_unregister(struct intel_connector *connector);
 #else /* CONFIG_BACKLIGHT_CLASS_DEVICE */
-- 
2.37.3

