Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAF1364E3D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 00:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13746E462;
	Mon, 19 Apr 2021 22:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5E06E4B0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 22:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618873064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s3xILF1G/BWWkGYxsN+ddfd7+1qnJ8Wx51GpkkVphNc=;
 b=V8cSKg88MoSTO1ZOk9SglhojX9CizEN7+fsnTs6dA99GtpreokfedyrykDIhxyDX3DWXFc
 eVMPI0PSawiA8UqDt3H93y5SuEIWL5VyDmiUkiRbHbp76PQ82oN+kfNMBmvir9T4C18v1F
 Haa/HK3J0e6yHGge1QfiEWypaVUCbbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-aDW2ZjRBMJ2VkLAmIowUMg-1; Mon, 19 Apr 2021 18:57:25 -0400
X-MC-Unique: aDW2ZjRBMJ2VkLAmIowUMg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93502107ACCD;
 Mon, 19 Apr 2021 22:57:22 +0000 (UTC)
Received: from Ruby.lyude.net (ovpn-119-153.rdu2.redhat.com [10.10.119.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 959385C1C4;
 Mon, 19 Apr 2021 22:57:19 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 11/20] drm/dp_dual_mode: Pass drm_device to
 drm_dp_dual_mode_detect()
Date: Mon, 19 Apr 2021 18:55:13 -0400
Message-Id: <20210419225523.184856-12-lyude@redhat.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Uma Shankar <uma.shankar@intel.com>,
 Sean Paul <seanpaul@chromium.org>, Vipin Anand <vipin.anand@intel.com>,
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
index 47a8f0a1c5e2..08fb98dac169 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2224,7 +2224,7 @@ intel_hdmi_dp_dual_mode_detect(struct drm_connector *connector, bool has_edid)
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
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
