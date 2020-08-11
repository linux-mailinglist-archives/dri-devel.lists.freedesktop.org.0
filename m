Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E7624210E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 22:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CB06E83D;
	Tue, 11 Aug 2020 20:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD61B6E83F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 20:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597176422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KqhBXCumi4qWOpmIMiKm16RbwLTfS/Vf/isHIApMj10=;
 b=bkEAQKF1Vrq6/X+XF4uY1j8s9e5RCP6v9n2eH1Sj16xEG1lSRdJuIw/yRzwweS8upbNOKM
 OB8AgxisXOo0CONZXs1eqr80DsYGeYtJiU7FKf7kR3SPMQszLhIN9l35a0uO/Lpl0hJDan
 dHO+33G5Yx5PfKGChUlC8X+o8IEl/cU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-kJ7RVk11MoG43LRpPRgoIw-1; Tue, 11 Aug 2020 16:06:58 -0400
X-MC-Unique: kJ7RVk11MoG43LRpPRgoIw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED2D1800479;
 Tue, 11 Aug 2020 20:06:55 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-119-184.rdu2.redhat.com [10.10.119.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EA945D9D7;
 Tue, 11 Aug 2020 20:06:52 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [RFC 19/20] drm/i915/dp: Extract drm_dp_read_dpcd_caps()
Date: Tue, 11 Aug 2020 16:04:56 -0400
Message-Id: <20200811200457.134743-20-lyude@redhat.com>
In-Reply-To: <20200811200457.134743-1-lyude@redhat.com>
References: <20200811200457.134743-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since DP 1.3, it's been possible for DP receivers to specify an
additional set of DPCD capabilities, which can take precedence over the
capabilities reported at DP_DPCD_REV.

Basically any device supporting DP is going to need to read these in an
identical manner, in particular nouveau, so let's go ahead and just move
this code out of i915 into a shared DRM DP helper that we can use in
other drivers.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_helper.c             | 76 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c     | 60 +---------------
 drivers/gpu/drm/i915/display/intel_dp.h     |  1 -
 drivers/gpu/drm/i915/display/intel_lspcon.c |  2 +-
 include/drm/drm_dp_helper.h                 |  3 +
 5 files changed, 82 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 0ff2959c8f8e8..f9445915c6c26 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -423,6 +423,82 @@ bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
 }
 EXPORT_SYMBOL(drm_dp_send_real_edid_checksum);
 
+static int drm_dp_read_extended_dpcd_caps(struct drm_dp_aux *aux,
+					  u8 dpcd[DP_RECEIVER_CAP_SIZE])
+{
+	u8 dpcd_ext[6];
+	int ret;
+
+	/*
+	 * Prior to DP1.3 the bit represented by
+	 * DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT was reserved.
+	 * If it is set DP_DPCD_REV at 0000h could be at a value less than
+	 * the true capability of the panel. The only way to check is to
+	 * then compare 0000h and 2200h.
+	 */
+	if (!(dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
+	      DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT))
+		return 0;
+
+	ret = drm_dp_dpcd_read(aux, DP_DP13_DPCD_REV, &dpcd_ext,
+			       sizeof(dpcd_ext));
+	if (ret != sizeof(dpcd_ext))
+		return -EIO;
+
+	if (dpcd[DP_DPCD_REV] > dpcd_ext[DP_DPCD_REV]) {
+		DRM_DEBUG_KMS("%s: Extended DPCD rev less than base DPCD rev (%d > %d)\n",
+			      aux->name, dpcd[DP_DPCD_REV],
+			      dpcd_ext[DP_DPCD_REV]);
+		return 0;
+	}
+
+	if (!memcmp(dpcd, dpcd_ext, sizeof(dpcd_ext)))
+		return 0;
+
+	DRM_DEBUG_KMS("%s: Base DPCD: %*ph\n",
+		      aux->name, DP_RECEIVER_CAP_SIZE, dpcd);
+
+	memcpy(dpcd, dpcd_ext, sizeof(dpcd_ext));
+
+	return 0;
+}
+
+/**
+ * drm_dp_read_dpcd_caps() - read DPCD caps and extended DPCD caps if
+ * available
+ * @aux: DisplayPort AUX channel
+ * @dpcd: Buffer to store the resulting DPCD in
+ *
+ * Attempts to read the base DPCD caps for @aux. Additionally, this function
+ * checks for and reads the extended DPRX caps (%DP_DP13_DPCD_REV) if
+ * present.
+ *
+ * Returns: %0 if the DPCD was read successfully, negative error code
+ * otherwise.
+ */
+int drm_dp_read_dpcd_caps(struct drm_dp_aux *aux,
+			  u8 dpcd[DP_RECEIVER_CAP_SIZE])
+{
+	int ret;
+
+	ret = drm_dp_dpcd_read(aux, DP_DPCD_REV, dpcd, DP_RECEIVER_CAP_SIZE);
+	if (ret != DP_RECEIVER_CAP_SIZE || dpcd[DP_DPCD_REV] == 0)
+		return -EIO;
+
+	ret = drm_dp_read_extended_dpcd_caps(aux, dpcd);
+	if (ret < 0)
+		return ret;
+
+	DRM_DEBUG_KMS("%s: DPCD: %*ph\n",
+		      aux->name, DP_RECEIVER_CAP_SIZE, dpcd);
+
+	if (dpcd[DP_DPCD_REV] == 0)
+		ret = -EIO;
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_dp_read_dpcd_caps);
+
 /**
  * drm_dp_downstream_read_info() - read DPCD downstream port info if available
  * @aux: DisplayPort AUX channel
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index e343965a483df..230aa0360dc61 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4449,62 +4449,6 @@ intel_dp_link_down(struct intel_encoder *encoder,
 	}
 }
 
-static void
-intel_dp_extended_receiver_capabilities(struct intel_dp *intel_dp)
-{
-	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
-	u8 dpcd_ext[6];
-
-	/*
-	 * Prior to DP1.3 the bit represented by
-	 * DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT was reserved.
-	 * if it is set DP_DPCD_REV at 0000h could be at a value less than
-	 * the true capability of the panel. The only way to check is to
-	 * then compare 0000h and 2200h.
-	 */
-	if (!(intel_dp->dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
-	      DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT))
-		return;
-
-	if (drm_dp_dpcd_read(&intel_dp->aux, DP_DP13_DPCD_REV,
-			     &dpcd_ext, sizeof(dpcd_ext)) != sizeof(dpcd_ext)) {
-		drm_err(&i915->drm,
-			"DPCD failed read at extended capabilities\n");
-		return;
-	}
-
-	if (intel_dp->dpcd[DP_DPCD_REV] > dpcd_ext[DP_DPCD_REV]) {
-		drm_dbg_kms(&i915->drm,
-			    "DPCD extended DPCD rev less than base DPCD rev\n");
-		return;
-	}
-
-	if (!memcmp(intel_dp->dpcd, dpcd_ext, sizeof(dpcd_ext)))
-		return;
-
-	drm_dbg_kms(&i915->drm, "Base DPCD: %*ph\n",
-		    (int)sizeof(intel_dp->dpcd), intel_dp->dpcd);
-
-	memcpy(intel_dp->dpcd, dpcd_ext, sizeof(dpcd_ext));
-}
-
-bool
-intel_dp_read_dpcd(struct intel_dp *intel_dp)
-{
-	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
-
-	if (drm_dp_dpcd_read(&intel_dp->aux, 0x000, intel_dp->dpcd,
-			     sizeof(intel_dp->dpcd)) < 0)
-		return false; /* aux transfer failed */
-
-	intel_dp_extended_receiver_capabilities(intel_dp);
-
-	drm_dbg_kms(&i915->drm, "DPCD: %*ph\n", (int)sizeof(intel_dp->dpcd),
-		    intel_dp->dpcd);
-
-	return intel_dp->dpcd[DP_DPCD_REV] != 0;
-}
-
 bool intel_dp_get_colorimetry_status(struct intel_dp *intel_dp)
 {
 	u8 dprx = 0;
@@ -4563,7 +4507,7 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
 	/* this function is meant to be called only once */
 	drm_WARN_ON(&dev_priv->drm, intel_dp->dpcd[DP_DPCD_REV] != 0);
 
-	if (!intel_dp_read_dpcd(intel_dp))
+	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd) != 0)
 		return false;
 
 	drm_dp_read_desc(&intel_dp->aux, &intel_dp->desc,
@@ -4650,7 +4594,7 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
 {
 	int ret;
 
-	if (!intel_dp_read_dpcd(intel_dp))
+	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd))
 		return false;
 
 	/*
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index b901ab850cbd9..0a3af3410d52e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -99,7 +99,6 @@ bool intel_dp_source_supports_hbr3(struct intel_dp *intel_dp);
 bool
 intel_dp_get_link_status(struct intel_dp *intel_dp, u8 *link_status);
 
-bool intel_dp_read_dpcd(struct intel_dp *intel_dp);
 bool intel_dp_get_colorimetry_status(struct intel_dp *intel_dp);
 int intel_dp_link_required(int pixel_clock, int bpp);
 int intel_dp_max_data_rate(int max_link_clock, int max_lanes);
diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index b781bf4696443..dc1b35559afdf 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -571,7 +571,7 @@ bool lspcon_init(struct intel_digital_port *dig_port)
 		return false;
 	}
 
-	if (!intel_dp_read_dpcd(dp)) {
+	if (drm_dp_read_dpcd_caps(&dp->aux, dp->dpcd) != 0) {
 		DRM_ERROR("LSPCON DPCD read failed\n");
 		return false;
 	}
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 0c141fc81aaa8..11649e93e5bb6 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1607,6 +1607,9 @@ static inline ssize_t drm_dp_dpcd_writeb(struct drm_dp_aux *aux,
 	return drm_dp_dpcd_write(aux, offset, &value, 1);
 }
 
+int drm_dp_read_dpcd_caps(struct drm_dp_aux *aux,
+			  u8 dpcd[DP_RECEIVER_CAP_SIZE]);
+
 int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
 				 u8 status[DP_LINK_STATUS_SIZE]);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
