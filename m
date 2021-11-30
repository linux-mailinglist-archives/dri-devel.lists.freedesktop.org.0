Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D337646403B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 22:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49D389EA3;
	Tue, 30 Nov 2021 21:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1EA6E1B6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 21:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638307774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wGAFVVASvva7zW+0sfpImZgjnROPSfnr+l5jT4Y+sWI=;
 b=RO/ZZKk058XNDL4oysrUScCrv0McTlJR+BsAykEmSIVh/PTvtxgOyHYeUD7Qe8kPNTZFXI
 uhbroUUl5/G7yHIapNfVuYAmGUfx+UA5lDc0WUWqhypHil+SxPrHPydkQFkd1n4F1MHxeA
 DFYSnmDsCATBsqVBaZM9/j1HJVJzwPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-ay2vpOfgMhKdFbJGtlXzMg-1; Tue, 30 Nov 2021 16:29:30 -0500
X-MC-Unique: ay2vpOfgMhKdFbJGtlXzMg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A953101796C;
 Tue, 30 Nov 2021 21:29:28 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.8.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D72360C81;
 Tue, 30 Nov 2021 21:29:21 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3] drm/i915/dp: Perform 30ms delay after source OUI write
Date: Tue, 30 Nov 2021 16:29:09 -0500
Message-Id: <20211130212912.212044-1-lyude@redhat.com>
In-Reply-To: <20211129233354.101347-1-lyude@redhat.com>
References: <20211129233354.101347-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, David Airlie <airlied@linux.ie>,
 Uma Shankar <uma.shankar@intel.com>, stable@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Dave Airlie <airlied@redhat.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While working on supporting the Intel HDR backlight interface, I noticed
that there's a couple of laptops that will very rarely manage to boot up
without detecting Intel HDR backlight support - even though it's supported
on the system. One example of such a laptop is the Lenovo P17 1st
generation.

Following some investigation Ville Syrjälä did through the docs they have
available to them, they discovered that there's actually supposed to be a
30ms wait after writing the source OUI before we begin setting up the rest
of the backlight interface.

This seems to be correct, as adding this 30ms delay seems to have
completely fixed the probing issues I was previously seeing. So - let's
start performing a 30ms wait after writing the OUI, which we do in a manner
similar to how we keep track of PPS delays (e.g. record the timestamp of
the OUI write, and then wait for however many ms are left since that
timestamp right before we interact with the backlight) in order to avoid
waiting any longer then we need to. As well, this also avoids us performing
this delay on systems where we don't end up using the HDR backlight
interface.

V3:
* Move last_oui_write into intel_dp
V2:
* Move panel delays into intel_pps

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Fixes: 4a8d79901d5b ("drm/i915/dp: Enable Intel's HDR backlight interface (only SDR for now)")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: <stable@vger.kernel.org> # v5.12+
---
 drivers/gpu/drm/i915/display/intel_display_types.h    |  3 +++
 drivers/gpu/drm/i915/display/intel_dp.c               | 11 +++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h               |  2 ++
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c |  5 +++++
 4 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index ea1e8a6e10b0..b9c967837872 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1653,6 +1653,9 @@ struct intel_dp {
 	struct intel_dp_pcon_frl frl;
 
 	struct intel_psr psr;
+
+	/* When we last wrote the OUI for eDP */
+	unsigned long last_oui_write;
 };
 
 enum lspcon_vendor {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0a424bf69396..5a8206298691 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -29,6 +29,7 @@
 #include <linux/i2c.h>
 #include <linux/notifier.h>
 #include <linux/slab.h>
+#include <linux/timekeeping.h>
 #include <linux/types.h>
 
 #include <asm/byteorder.h>
@@ -2010,6 +2011,16 @@ intel_edp_init_source_oui(struct intel_dp *intel_dp, bool careful)
 
 	if (drm_dp_dpcd_write(&intel_dp->aux, DP_SOURCE_OUI, oui, sizeof(oui)) < 0)
 		drm_err(&i915->drm, "Failed to write source OUI\n");
+
+	intel_dp->last_oui_write = jiffies;
+}
+
+void intel_dp_wait_source_oui(struct intel_dp *intel_dp)
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+
+	drm_dbg_kms(&i915->drm, "Performing OUI wait\n");
+	wait_remaining_ms_from_jiffies(intel_dp->last_oui_write, 30);
 }
 
 /* If the device supports it, try to set the power state appropriately */
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index ce229026dc91..b64145a3869a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -119,4 +119,6 @@ void intel_dp_pcon_dsc_configure(struct intel_dp *intel_dp,
 				 const struct intel_crtc_state *crtc_state);
 void intel_dp_phy_test(struct intel_encoder *encoder);
 
+void intel_dp_wait_source_oui(struct intel_dp *intel_dp);
+
 #endif /* __INTEL_DP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 8b9c925c4c16..62c112daacf2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -36,6 +36,7 @@
 
 #include "intel_backlight.h"
 #include "intel_display_types.h"
+#include "intel_dp.h"
 #include "intel_dp_aux_backlight.h"
 
 /* TODO:
@@ -106,6 +107,8 @@ intel_dp_aux_supports_hdr_backlight(struct intel_connector *connector)
 	int ret;
 	u8 tcon_cap[4];
 
+	intel_dp_wait_source_oui(intel_dp);
+
 	ret = drm_dp_dpcd_read(aux, INTEL_EDP_HDR_TCON_CAP0, tcon_cap, sizeof(tcon_cap));
 	if (ret != sizeof(tcon_cap))
 		return false;
@@ -204,6 +207,8 @@ intel_dp_aux_hdr_enable_backlight(const struct intel_crtc_state *crtc_state,
 	int ret;
 	u8 old_ctrl, ctrl;
 
+	intel_dp_wait_source_oui(intel_dp);
+
 	ret = drm_dp_dpcd_readb(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, &old_ctrl);
 	if (ret != 1) {
 		drm_err(&i915->drm, "Failed to read current backlight control mode: %d\n", ret);
-- 
2.33.1

