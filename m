Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B928364E45
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 00:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E00E6E4F4;
	Mon, 19 Apr 2021 22:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DB26E4BA
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 22:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618873071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HjMzh1HvXy7Xkjl8NcwZQHHoP1mJgDV0cr7CXF5/YeA=;
 b=SftqyNxTqwHu5eyGx31UYoc3se221Q76cK1k9OnDK12IAo6fv2AFF605sjIZq+1vo3pep6
 HPxXplk/YXYGgmJou93yeZOG/RvI63pdkMvHhNfzquMAKkNNUQiqMjRaNQ+8lyrJTmi+/D
 KKvKOKmSD9dIgpV7xXkyt/GYbkr3NUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-PXFJors3P2evwCERNpGlzQ-1; Mon, 19 Apr 2021 18:57:47 -0400
X-MC-Unique: PXFJors3P2evwCERNpGlzQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 540301006C80;
 Mon, 19 Apr 2021 22:57:45 +0000 (UTC)
Received: from Ruby.lyude.net (ovpn-119-153.rdu2.redhat.com [10.10.119.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B12C65C1C4;
 Mon, 19 Apr 2021 22:57:43 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 19/20] drm/dp_dual_mode: Convert drm_dp_dual_mode_helper.c
 to using drm_err/drm_dbg_kms()
Date: Mon, 19 Apr 2021 18:55:21 -0400
Message-Id: <20210419225523.184856-20-lyude@redhat.com>
In-Reply-To: <20210419225523.184856-1-lyude@redhat.com>
References: <20210419225523.184856-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Next step in the conversion, move everything in drm_dp_dual_mode_helper.c
over to using drm_err() and drm_dbg_kms(). This was done using the
following cocci script:

  @@
  expression list expr;
  @@

  (
  - DRM_DEBUG_KMS(expr);
  + drm_dbg_kms(dev, expr);
  |
  - DRM_ERROR(expr);
  + drm_err(dev, expr);
  )

And correcting the indentation of the resulting code by hand.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_dual_mode_helper.c | 45 +++++++++++------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/drm_dp_dual_mode_helper.c
index dbf9b1fdec63..9faf49354cab 100644
--- a/drivers/gpu/drm/drm_dp_dual_mode_helper.c
+++ b/drivers/gpu/drm/drm_dp_dual_mode_helper.c
@@ -27,6 +27,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 
+#include <drm/drm_device.h>
 #include <drm/drm_dp_dual_mode_helper.h>
 #include <drm/drm_print.h>
 
@@ -202,8 +203,8 @@ enum drm_dp_dual_mode_type drm_dp_dual_mode_detect(const struct drm_device *dev,
 	 */
 	ret = drm_dp_dual_mode_read(adapter, DP_DUAL_MODE_HDMI_ID,
 				    hdmi_id, sizeof(hdmi_id));
-	DRM_DEBUG_KMS("DP dual mode HDMI ID: %*pE (err %zd)\n",
-		      ret ? 0 : (int)sizeof(hdmi_id), hdmi_id, ret);
+	drm_dbg_kms(dev, "DP dual mode HDMI ID: %*pE (err %zd)\n",
+		    ret ? 0 : (int)sizeof(hdmi_id), hdmi_id, ret);
 	if (ret)
 		return DRM_DP_DUAL_MODE_UNKNOWN;
 
@@ -221,8 +222,7 @@ enum drm_dp_dual_mode_type drm_dp_dual_mode_detect(const struct drm_device *dev,
 	 */
 	ret = drm_dp_dual_mode_read(adapter, DP_DUAL_MODE_ADAPTOR_ID,
 				    &adaptor_id, sizeof(adaptor_id));
-	DRM_DEBUG_KMS("DP dual mode adaptor ID: %02x (err %zd)\n",
-		      adaptor_id, ret);
+	drm_dbg_kms(dev, "DP dual mode adaptor ID: %02x (err %zd)\n", adaptor_id, ret);
 	if (ret == 0) {
 		if (is_lspcon_adaptor(hdmi_id, adaptor_id))
 			return DRM_DP_DUAL_MODE_LSPCON;
@@ -238,8 +238,7 @@ enum drm_dp_dual_mode_type drm_dp_dual_mode_detect(const struct drm_device *dev,
 		 * that we may have misdetected the type.
 		 */
 		if (!is_type1_adaptor(adaptor_id) && adaptor_id != hdmi_id[0])
-			DRM_ERROR("Unexpected DP dual mode adaptor ID %02x\n",
-				  adaptor_id);
+			drm_err(dev, "Unexpected DP dual mode adaptor ID %02x\n", adaptor_id);
 
 	}
 
@@ -286,7 +285,7 @@ int drm_dp_dual_mode_max_tmds_clock(const struct drm_device *dev, enum drm_dp_du
 	ret = drm_dp_dual_mode_read(adapter, DP_DUAL_MODE_MAX_TMDS_CLOCK,
 				    &max_tmds_clock, sizeof(max_tmds_clock));
 	if (ret || max_tmds_clock == 0x00 || max_tmds_clock == 0xff) {
-		DRM_DEBUG_KMS("Failed to query max TMDS clock\n");
+		drm_dbg_kms(dev, "Failed to query max TMDS clock\n");
 		return 165000;
 	}
 
@@ -326,7 +325,7 @@ int drm_dp_dual_mode_get_tmds_output(const struct drm_device *dev,
 	ret = drm_dp_dual_mode_read(adapter, DP_DUAL_MODE_TMDS_OEN,
 				    &tmds_oen, sizeof(tmds_oen));
 	if (ret) {
-		DRM_DEBUG_KMS("Failed to query state of TMDS output buffers\n");
+		drm_dbg_kms(dev, "Failed to query state of TMDS output buffers\n");
 		return ret;
 	}
 
@@ -372,18 +371,17 @@ int drm_dp_dual_mode_set_tmds_output(const struct drm_device *dev, enum drm_dp_d
 		ret = drm_dp_dual_mode_write(adapter, DP_DUAL_MODE_TMDS_OEN,
 					     &tmds_oen, sizeof(tmds_oen));
 		if (ret) {
-			DRM_DEBUG_KMS("Failed to %s TMDS output buffers (%d attempts)\n",
-				      enable ? "enable" : "disable",
-				      retry + 1);
+			drm_dbg_kms(dev, "Failed to %s TMDS output buffers (%d attempts)\n",
+				    enable ? "enable" : "disable", retry + 1);
 			return ret;
 		}
 
 		ret = drm_dp_dual_mode_read(adapter, DP_DUAL_MODE_TMDS_OEN,
 					    &tmp, sizeof(tmp));
 		if (ret) {
-			DRM_DEBUG_KMS("I2C read failed during TMDS output buffer %s (%d attempts)\n",
-				      enable ? "enabling" : "disabling",
-				      retry + 1);
+			drm_dbg_kms(dev,
+				    "I2C read failed during TMDS output buffer %s (%d attempts)\n",
+				    enable ? "enabling" : "disabling", retry + 1);
 			return ret;
 		}
 
@@ -391,8 +389,8 @@ int drm_dp_dual_mode_set_tmds_output(const struct drm_device *dev, enum drm_dp_d
 			return 0;
 	}
 
-	DRM_DEBUG_KMS("I2C write value mismatch during TMDS output buffer %s\n",
-		      enable ? "enabling" : "disabling");
+	drm_dbg_kms(dev, "I2C write value mismatch during TMDS output buffer %s\n",
+		    enable ? "enabling" : "disabling");
 
 	return -EIO;
 }
@@ -446,7 +444,7 @@ int drm_lspcon_get_mode(const struct drm_device *dev, struct i2c_adapter *adapte
 	int retry;
 
 	if (!mode) {
-		DRM_ERROR("NULL input\n");
+		drm_err(dev, "NULL input\n");
 		return -EINVAL;
 	}
 
@@ -463,7 +461,7 @@ int drm_lspcon_get_mode(const struct drm_device *dev, struct i2c_adapter *adapte
 	}
 
 	if (ret < 0) {
-		DRM_DEBUG_KMS("LSPCON read(0x80, 0x41) failed\n");
+		drm_dbg_kms(dev, "LSPCON read(0x80, 0x41) failed\n");
 		return -EFAULT;
 	}
 
@@ -500,7 +498,7 @@ int drm_lspcon_set_mode(const struct drm_device *dev, struct i2c_adapter *adapte
 	ret = drm_dp_dual_mode_write(adapter, DP_DUAL_MODE_LSPCON_MODE_CHANGE,
 				     &data, sizeof(data));
 	if (ret < 0) {
-		DRM_ERROR("LSPCON mode change failed\n");
+		drm_err(dev, "LSPCON mode change failed\n");
 		return ret;
 	}
 
@@ -512,22 +510,21 @@ int drm_lspcon_set_mode(const struct drm_device *dev, struct i2c_adapter *adapte
 	do {
 		ret = drm_lspcon_get_mode(dev, adapter, &current_mode);
 		if (ret) {
-			DRM_ERROR("can't confirm LSPCON mode change\n");
+			drm_err(dev, "can't confirm LSPCON mode change\n");
 			return ret;
 		} else {
 			if (current_mode != mode) {
 				msleep(10);
 				time_out -= 10;
 			} else {
-				DRM_DEBUG_KMS("LSPCON mode changed to %s\n",
-						mode == DRM_LSPCON_MODE_LS ?
-						"LS" : "PCON");
+				drm_dbg_kms(dev, "LSPCON mode changed to %s\n",
+					    mode == DRM_LSPCON_MODE_LS ? "LS" : "PCON");
 				return 0;
 			}
 		}
 	} while (time_out);
 
-	DRM_ERROR("LSPCON mode change timed out\n");
+	drm_err(dev, "LSPCON mode change timed out\n");
 	return -ETIMEDOUT;
 }
 EXPORT_SYMBOL(drm_lspcon_set_mode);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
