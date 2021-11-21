Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E09458300
	for <lists+dri-devel@lfdr.de>; Sun, 21 Nov 2021 12:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B446F888;
	Sun, 21 Nov 2021 11:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E8C6F889
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 11:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637492445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LsgBxUcRxWCwY+zbf8nElGg4ua0pfw40r1USCxEdbCY=;
 b=gMw6k0Yw90VEFT1pE3wPGCBhKJ/VFDN+RhJq74bjACU8QZ+UoAgcBx1SYa5dATGIjHenFC
 Nb+VZtOXUDJ7VYVmGwKFVN07vlgFdLtqFtbNODhdV++goLzEIOcx4lZcDkeW5LlRRdf+YZ
 YHQRmzQG2Y0smcUkJ4pJl7sDxw5lGFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-jVkEfZMjMQ694LjGQovE_w-1; Sun, 21 Nov 2021 06:00:40 -0500
X-MC-Unique: jVkEfZMjMQ694LjGQovE_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B86A018125C0;
 Sun, 21 Nov 2021 11:00:38 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 583FE4ABA3;
 Sun, 21 Nov 2021 11:00:33 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Lyude <lyude@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/2] drm/i915/backlight: Drop duplicate
 intel_panel_actually_set_backlight()
Date: Sun, 21 Nov 2021 12:00:31 +0100
Message-Id: <20211121110032.4720-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After the recent refactoring of the backlight code the contents of
intel_panel_actually_set_backlight() is exactly the same (minus a
small wording difference in the drm_dbg_kms() as the contents if the
more widely used intel_backlight_set_pwm_level() function.

Drop the duplicate intel_panel_actually_set_backlight() function.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_backlight.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
index 9523411cddd8..03cd730c926a 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
@@ -268,18 +268,6 @@ static void ext_pwm_set_backlight(const struct drm_connector_state *conn_state,
 	pwm_apply_state(panel->backlight.pwm, &panel->backlight.pwm_state);
 }
 
-static void
-intel_panel_actually_set_backlight(const struct drm_connector_state *conn_state, u32 level)
-{
-	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
-	struct intel_panel *panel = &connector->panel;
-
-	drm_dbg_kms(&i915->drm, "set backlight level = %d\n", level);
-
-	panel->backlight.funcs->set(conn_state, level);
-}
-
 /* set backlight brightness to level in range [0..max], assuming hw min is
  * respected.
  */
@@ -314,7 +302,7 @@ void intel_backlight_set_acpi(const struct drm_connector_state *conn_state,
 					 panel->backlight.device->props.max_brightness);
 
 	if (panel->backlight.enabled)
-		intel_panel_actually_set_backlight(conn_state, hw_level);
+		intel_backlight_set_pwm_level(conn_state, hw_level);
 
 	mutex_unlock(&dev_priv->backlight_lock);
 }
@@ -863,7 +851,7 @@ static void intel_panel_set_backlight(const struct drm_connector_state *conn_sta
 	panel->backlight.level = hw_level;
 
 	if (panel->backlight.enabled)
-		intel_panel_actually_set_backlight(conn_state, hw_level);
+		intel_backlight_set_pwm_level(conn_state, hw_level);
 
 	mutex_unlock(&dev_priv->backlight_lock);
 }
-- 
2.31.1

