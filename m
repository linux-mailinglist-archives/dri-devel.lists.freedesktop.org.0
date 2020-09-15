Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A175026AAAD
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 19:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EED06E8C9;
	Tue, 15 Sep 2020 17:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F74A6E8C8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 17:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600191028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YSSluK8yuAJutLkgMqPmfdCISUlx/kFM0c7VDjZgcEA=;
 b=eGNl3Pv951HTaH6CH04rf5Wrnp/G3aVR+y7jJcBj+dRsZERFLvYN2ujZ/C9Nrd/MLcpX7e
 ACKEh9yx1sg+Y5YJ5DPrJDK3kbT0XJ93bWnBnRBI4q3fmEmKn5JdFy9cHd69HeJ1/8N5Pq
 18WiLJ1w6bsSuF9Zjy4H4pVKLNWmmpI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-aKpktXnYOT-lGmYyz3q91g-1; Tue, 15 Sep 2020 13:30:25 -0400
X-MC-Unique: aKpktXnYOT-lGmYyz3q91g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DFBFAD68A;
 Tue, 15 Sep 2020 17:30:21 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-113-129.rdu2.redhat.com
 [10.10.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 318625FC2A;
 Tue, 15 Sep 2020 17:30:19 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 5/5] drm/dp: Revert "drm/dp: Introduce EDID-based quirks"
Date: Tue, 15 Sep 2020 13:29:39 -0400
Message-Id: <20200915172939.2810538-6-lyude@redhat.com>
In-Reply-To: <20200915172939.2810538-1-lyude@redhat.com>
References: <20200915172939.2810538-1-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, thaytan@noraisin.net,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Manasi Navare <manasi.d.navare@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 0883ce8146ed6074c76399f4e70dbed788582e12. Originally
these quirks were added because of the issues with using the eDP
backlight interfaces on certain laptop panels, which made it impossible
to properly probe for DPCD backlight support without having a whitelist
for panels that we know have working VESA backlight control interfaces
over DPCD. As well, it should be noted it was impossible to use the
normal sink OUI for recognizing these panels as none of them actually
filled out their OUIs, hence needing to resort to checking EDIDs.

At the time we weren't really sure why certain panels had issues with
DPCD backlight controls, but we eventually figured out that there was a
second interface that these problematic laptop panels actually did work
with and advertise properly: Intel's proprietary backlight interface for
HDR panels. So far the testing we've done hasn't brought any panels to
light that advertise this interface and don't support it properly, which
means we finally have a real solution to this problem.

As a result, we now have no need for the force DPCD backlight quirk, and
furthermore this also removes the need for any kind of EDID quirk
checking in DRM. So, let's just revert it for now since we were the only
driver using this.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: thaytan@noraisin.net
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/gpu/drm/drm_dp_helper.c               | 82 +------------------
 drivers/gpu/drm/drm_dp_mst_topology.c         |  3 +-
 .../drm/i915/display/intel_display_types.h    |  1 -
 drivers/gpu/drm/i915/display/intel_dp.c       | 12 +--
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  3 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |  2 +-
 include/drm/drm_dp_helper.h                   | 21 +----
 7 files changed, 11 insertions(+), 113 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 1e7c638873c82..7138655bfc9d0 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -823,7 +823,7 @@ bool drm_dp_read_sink_count_cap(struct drm_connector *connector,
 	return connector->connector_type != DRM_MODE_CONNECTOR_eDP &&
 		dpcd[DP_DPCD_REV] >= DP_DPCD_REV_11 &&
 		dpcd[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_PRESENT &&
-		!drm_dp_has_quirk(desc, 0, DP_DPCD_QUIRK_NO_SINK_COUNT);
+		!drm_dp_has_quirk(desc, DP_DPCD_QUIRK_NO_SINK_COUNT);
 }
 EXPORT_SYMBOL(drm_dp_read_sink_count_cap);
 
@@ -1544,86 +1544,6 @@ drm_dp_get_quirks(const struct drm_dp_dpcd_ident *ident, bool is_branch)
 #undef DEVICE_ID_ANY
 #undef DEVICE_ID
 
-struct edid_quirk {
-	u8 mfg_id[2];
-	u8 prod_id[2];
-	u32 quirks;
-};
-
-#define MFG(first, second) { (first), (second) }
-#define PROD_ID(first, second) { (first), (second) }
-
-/*
- * Some devices have unreliable OUIDs where they don't set the device ID
- * correctly, and as a result we need to use the EDID for finding additional
- * DP quirks in such cases.
- */
-static const struct edid_quirk edid_quirk_list[] = {
-	/* Optional 4K AMOLED panel in the ThinkPad X1 Extreme 2nd Generation
-	 * only supports DPCD backlight controls
-	 */
-	{ MFG(0x4c, 0x83), PROD_ID(0x41, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
-	/*
-	 * Some Dell CML 2020 systems have panels support both AUX and PWM
-	 * backlight control, and some only support AUX backlight control. All
-	 * said panels start up in AUX mode by default, and we don't have any
-	 * support for disabling HDR mode on these panels which would be
-	 * required to switch to PWM backlight control mode (plus, I'm not
-	 * even sure we want PWM backlight controls over DPCD backlight
-	 * controls anyway...). Until we have a better way of detecting these,
-	 * force DPCD backlight mode on all of them.
-	 */
-	{ MFG(0x06, 0xaf), PROD_ID(0x9b, 0x32), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
-	{ MFG(0x06, 0xaf), PROD_ID(0xeb, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
-	{ MFG(0x4d, 0x10), PROD_ID(0xc7, 0x14), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
-	{ MFG(0x4d, 0x10), PROD_ID(0xe6, 0x14), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
-	{ MFG(0x4c, 0x83), PROD_ID(0x47, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
-};
-
-#undef MFG
-#undef PROD_ID
-
-/**
- * drm_dp_get_edid_quirks() - Check the EDID of a DP device to find additional
- * DP-specific quirks
- * @edid: The EDID to check
- *
- * While OUIDs are meant to be used to recognize a DisplayPort device, a lot
- * of manufacturers don't seem to like following standards and neglect to fill
- * the dev-ID in, making it impossible to only use OUIDs for determining
- * quirks in some cases. This function can be used to check the EDID and look
- * up any additional DP quirks. The bits returned by this function correspond
- * to the quirk bits in &drm_dp_quirk.
- *
- * Returns: a bitmask of quirks, if any. The driver can check this using
- * drm_dp_has_quirk().
- */
-u32 drm_dp_get_edid_quirks(const struct edid *edid)
-{
-	const struct edid_quirk *quirk;
-	u32 quirks = 0;
-	int i;
-
-	if (!edid)
-		return 0;
-
-	for (i = 0; i < ARRAY_SIZE(edid_quirk_list); i++) {
-		quirk = &edid_quirk_list[i];
-		if (memcmp(quirk->mfg_id, edid->mfg_id,
-			   sizeof(edid->mfg_id)) == 0 &&
-		    memcmp(quirk->prod_id, edid->prod_code,
-			   sizeof(edid->prod_code)) == 0)
-			quirks |= quirk->quirks;
-	}
-
-	DRM_DEBUG_KMS("DP sink: EDID mfg %*phD prod-ID %*phD quirks: 0x%04x\n",
-		      (int)sizeof(edid->mfg_id), edid->mfg_id,
-		      (int)sizeof(edid->prod_code), edid->prod_code, quirks);
-
-	return quirks;
-}
-EXPORT_SYMBOL(drm_dp_get_edid_quirks);
-
 /**
  * drm_dp_read_desc - read sink/branch descriptor from DPCD
  * @aux: DisplayPort AUX channel
diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index e875425336406..f21516142dd50 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -5824,8 +5824,7 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 	if (drm_dp_read_desc(port->mgr->aux, &desc, true))
 		return NULL;
 
-	if (drm_dp_has_quirk(&desc, 0,
-			     DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD) &&
+	if (drm_dp_has_quirk(&desc, DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD) &&
 	    port->mgr->dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14 &&
 	    port->parent == port->mgr->mst_primary) {
 		u8 downstreamport;
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 9d540368bac89..0bf378903644c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1322,7 +1322,6 @@ struct intel_dp {
 	int max_link_rate;
 	/* sink or branch descriptor */
 	struct drm_dp_desc desc;
-	u32 edid_quirks;
 	struct drm_dp_aux aux;
 	u32 aux_busy_last_status;
 	u8 train_set[4];
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b591672ec4eab..27436a60bc328 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -162,8 +162,7 @@ static void intel_dp_set_sink_rates(struct intel_dp *intel_dp)
 	};
 	int i, max_rate;
 
-	if (drm_dp_has_quirk(&intel_dp->desc, 0,
-			     DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS)) {
+	if (drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS)) {
 		/* Needed, e.g., for Apple MBP 2017, 15 inch eDP Retina panel */
 		static const int quirk_rates[] = { 162000, 270000, 324000 };
 
@@ -2630,8 +2629,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	struct intel_connector *intel_connector = intel_dp->attached_connector;
 	struct intel_digital_connector_state *intel_conn_state =
 		to_intel_digital_connector_state(conn_state);
-	bool constant_n = drm_dp_has_quirk(&intel_dp->desc, 0,
-					   DP_DPCD_QUIRK_CONSTANT_N);
+	bool constant_n = drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_CONSTANT_N);
 	int ret = 0, output_bpp;
 
 	if (HAS_PCH_SPLIT(dev_priv) && !HAS_DDI(dev_priv) && port != PORT_A)
@@ -6103,7 +6101,6 @@ intel_dp_set_edid(struct intel_dp *intel_dp)
 
 	intel_dp->has_audio = drm_detect_monitor_audio(edid);
 	drm_dp_cec_set_edid(&intel_dp->aux, edid);
-	intel_dp->edid_quirks = drm_dp_get_edid_quirks(edid);
 }
 
 static void
@@ -6116,7 +6113,6 @@ intel_dp_unset_edid(struct intel_dp *intel_dp)
 	intel_connector->detect_edid = NULL;
 
 	intel_dp->has_audio = false;
-	intel_dp->edid_quirks = 0;
 }
 
 static int
@@ -7467,8 +7463,8 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	edid = drm_get_edid(connector, &intel_dp->aux.ddc);
 	if (edid) {
 		if (drm_add_edid_modes(connector, edid)) {
-			drm_connector_update_edid_property(connector, edid);
-			intel_dp->edid_quirks = drm_dp_get_edid_quirks(edid);
+			drm_connector_update_edid_property(connector,
+								edid);
 		} else {
 			kfree(edid);
 			edid = ERR_PTR(-EINVAL);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 64d885539e94a..c8b9ffa388cf5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -52,8 +52,7 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
-	bool constant_n = drm_dp_has_quirk(&intel_dp->desc, 0,
-					   DP_DPCD_QUIRK_CONSTANT_N);
+	bool constant_n = drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_CONSTANT_N);
 	int bpp, slots = -EINVAL;
 
 	crtc_state->lane_count = limits->max_lane_count;
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 8a9d0bdde1bfb..c7403406e2783 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -310,7 +310,7 @@ void intel_psr_init_dpcd(struct intel_dp *intel_dp)
 	drm_dbg_kms(&dev_priv->drm, "eDP panel supports PSR version %x\n",
 		    intel_dp->psr_dpcd[0]);
 
-	if (drm_dp_has_quirk(&intel_dp->desc, 0, DP_DPCD_QUIRK_NO_PSR)) {
+	if (drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_NO_PSR)) {
 		drm_dbg_kms(&dev_priv->drm,
 			    "PSR support not currently available for this panel\n");
 		return;
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 5c45195ced321..09dd81007dba4 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1671,16 +1671,13 @@ struct drm_dp_desc {
 
 int drm_dp_read_desc(struct drm_dp_aux *aux, struct drm_dp_desc *desc,
 		     bool is_branch);
-u32 drm_dp_get_edid_quirks(const struct edid *edid);
 
 /**
  * enum drm_dp_quirk - Display Port sink/branch device specific quirks
  *
  * Display Port sink and branch devices in the wild have a variety of bugs, try
  * to collect them here. The quirks are shared, but it's up to the drivers to
- * implement workarounds for them. Note that because some devices have
- * unreliable OUIDs, the EDID of sinks should also be checked for quirks using
- * drm_dp_get_edid_quirks().
+ * implement workarounds for them.
  */
 enum drm_dp_quirk {
 	/**
@@ -1712,16 +1709,6 @@ enum drm_dp_quirk {
 	 * The DSC caps can be read from the physical aux instead.
 	 */
 	DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD,
-	/**
-	 * @DP_QUIRK_FORCE_DPCD_BACKLIGHT:
-	 *
-	 * The device is telling the truth when it says that it uses DPCD
-	 * backlight controls, even if the system's firmware disagrees. This
-	 * quirk should be checked against both the ident and panel EDID.
-	 * When present, the driver should honor the DPCD backlight
-	 * capabilities advertised.
-	 */
-	DP_QUIRK_FORCE_DPCD_BACKLIGHT,
 	/**
 	 * @DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS:
 	 *
@@ -1734,16 +1721,14 @@ enum drm_dp_quirk {
 /**
  * drm_dp_has_quirk() - does the DP device have a specific quirk
  * @desc: Device descriptor filled by drm_dp_read_desc()
- * @edid_quirks: Optional quirk bitmask filled by drm_dp_get_edid_quirks()
  * @quirk: Quirk to query for
  *
  * Return true if DP device identified by @desc has @quirk.
  */
 static inline bool
-drm_dp_has_quirk(const struct drm_dp_desc *desc, u32 edid_quirks,
-		 enum drm_dp_quirk quirk)
+drm_dp_has_quirk(const struct drm_dp_desc *desc, enum drm_dp_quirk quirk)
 {
-	return (desc->quirks | edid_quirks) & BIT(quirk);
+	return desc->quirks & BIT(quirk);
 }
 
 #ifdef CONFIG_DRM_DP_CEC
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
