Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941A93200CB
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 22:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02006EC7A;
	Fri, 19 Feb 2021 21:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0466EC78
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 21:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613771736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VanAr9IikXvo1QXn0bS7FQeNcKJkC1BpFFxJRb4FiJk=;
 b=atm6yBWbMuw6ybYPN4bGcT4epyLpESYsdaN13zUPcqL2s3j8LOGQ2yBlI9/85S1Sdp2SHr
 43SOS9pIxfujjBe5B58KcxZTvd+eqxHcWXxNIEuO3oV7lg4ZIOo1IaDfZlZhMU9uk+jaTA
 ozfkA+i/jXBjlRTM3sP77eOSVPGTdI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-b3D0yHiyN_Co8irQXP8qhw-1; Fri, 19 Feb 2021 16:55:34 -0500
X-MC-Unique: b3D0yHiyN_Co8irQXP8qhw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F314BEC1A0;
 Fri, 19 Feb 2021 21:55:30 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-118-5.rdu2.redhat.com [10.10.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01A2E6A03C;
 Fri, 19 Feb 2021 21:55:27 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 22/30] drm/dp_dual_mode: Pass drm_device to
 drm_dp_dual_mode_detect()
Date: Fri, 19 Feb 2021 16:53:18 -0500
Message-Id: <20210219215326.2227596-23-lyude@redhat.com>
In-Reply-To: <20210219215326.2227596-1-lyude@redhat.com>
References: <20210219215326.2227596-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Uma Shankar <uma.shankar@intel.com>,
 Sean Paul <seanpaul@chromium.org>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we're about to be using drm_dbg_*() throughout the DP helpers, we'll
need to be able to access the DRM device in the dual mode DP helpers as
well. Note however that since drm_dp_dual_mode_detect() can be called with
DDC adapters that aren't part of a drm_dp_aux struct, we need to pass down
the drm_device to these functions instead of using drm_dp_aux.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_dual_mode_helper.c   | 4 +++-
 drivers/gpu/drm/i915/display/intel_hdmi.c   | 2 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c | 5 +++--
 include/drm/drm_dp_dual_mode_helper.h       | 4 +++-
 4 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/drm_dp_dual_mode_helper.c
index 1c9ea9f7fdaf..9ee75c568c37 100644
--- a/drivers/gpu/drm/drm_dp_dual_mode_helper.c
+++ b/drivers/gpu/drm/drm_dp_dual_mode_helper.c
@@ -165,6 +165,7 @@ static bool is_lspcon_adaptor(const char hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN],
 
 /**
  * drm_dp_dual_mode_detect - Identify the DP dual mode adaptor
+ * @dev: &drm_device to use
  * @adapter: I2C adapter for the DDC bus
  *
  * Attempt to identify the type of the DP dual mode adaptor used.
@@ -178,7 +179,8 @@ static bool is_lspcon_adaptor(const char hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN],
  * Returns:
  * The type of the DP dual mode adaptor used
  */
-enum drm_dp_dual_mode_type drm_dp_dual_mode_detect(struct i2c_adapter *adapter)
+enum drm_dp_dual_mode_type drm_dp_dual_mode_detect(const struct drm_device *dev,
+						   struct i2c_adapter *adapter)
 {
 	char hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN] = {};
 	uint8_t adaptor_id = 0x00;
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 7f384f259fc8..52d99fec2435 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2606,7 +2606,7 @@ intel_hdmi_dp_dual_mode_detect(struct drm_connector *connector, bool has_edid)
 	enum port port = hdmi_to_dig_port(hdmi)->base.port;
 	struct i2c_adapter *adapter =
 		intel_gmbus_get_adapter(dev_priv, hdmi->ddc_bus);
-	enum drm_dp_dual_mode_type type = drm_dp_dual_mode_detect(adapter);
+	enum drm_dp_dual_mode_type type = drm_dp_dual_mode_detect(&dev_priv->drm, adapter);
 
 	/*
 	 * Type 1 DVI adaptors are not required to implement any
diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index e4ff533e3a69..ca25044e7d1b 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -221,7 +221,8 @@ static bool lspcon_probe(struct intel_lspcon *lspcon)
 {
 	int retry;
 	enum drm_dp_dual_mode_type adaptor_type;
-	struct i2c_adapter *adapter = &lspcon_to_intel_dp(lspcon)->aux.ddc;
+	struct intel_dp *intel_dp = lspcon_to_intel_dp(lspcon);
+	struct i2c_adapter *adapter = &intel_dp->aux.ddc;
 	enum drm_lspcon_mode expected_mode;
 
 	expected_mode = lspcon_wake_native_aux_ch(lspcon) ?
@@ -232,7 +233,7 @@ static bool lspcon_probe(struct intel_lspcon *lspcon)
 		if (retry)
 			usleep_range(500, 1000);
 
-		adaptor_type = drm_dp_dual_mode_detect(adapter);
+		adaptor_type = drm_dp_dual_mode_detect(intel_dp->aux.drm_dev, adapter);
 		if (adaptor_type == DRM_DP_DUAL_MODE_LSPCON)
 			break;
 	}
diff --git a/include/drm/drm_dp_dual_mode_helper.h b/include/drm/drm_dp_dual_mode_helper.h
index 4c42db81fcb4..23ce849152f3 100644
--- a/include/drm/drm_dp_dual_mode_helper.h
+++ b/include/drm/drm_dp_dual_mode_helper.h
@@ -62,6 +62,7 @@
 #define DP_DUAL_MODE_LSPCON_CURRENT_MODE		0x41
 #define  DP_DUAL_MODE_LSPCON_MODE_PCON			0x1
 
+struct drm_device;
 struct i2c_adapter;
 
 ssize_t drm_dp_dual_mode_read(struct i2c_adapter *adapter,
@@ -103,7 +104,8 @@ enum drm_dp_dual_mode_type {
 	DRM_DP_DUAL_MODE_LSPCON,
 };
 
-enum drm_dp_dual_mode_type drm_dp_dual_mode_detect(struct i2c_adapter *adapter);
+enum drm_dp_dual_mode_type
+drm_dp_dual_mode_detect(const struct drm_device *dev, struct i2c_adapter *adapter);
 int drm_dp_dual_mode_max_tmds_clock(enum drm_dp_dual_mode_type type,
 				    struct i2c_adapter *adapter);
 int drm_dp_dual_mode_get_tmds_output(enum drm_dp_dual_mode_type type,
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
